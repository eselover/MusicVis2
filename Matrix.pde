class Matrix {
  double A = 1; // Rx
  double B = 0; // Ry
  double C = 0; // Tx
  double D = 0;
  double E = 0; // Ux
  double F = 1; // Uy
  double G = 0; // Ty
  double H = 0;
  double I = 0;
  double J = 0;
  double K = 1;
  double L = 0;
  double M = 0;
  double N = 0;
  double O = 0;
  double P = 1;
  // makes a copy of this matrix, resets this matrix to identity,
  // converts this into a rotation matrix, multiplies this new
  // rotation matrix with the copy of the original matrix
  void rotate(float angle) {
    Matrix copy = copy();

    Reset();

    F = cos(angle);
    G = -sin(angle);
    J = -G;
    K = F;

    mult(copy);
    
    Matrix copy2 = copy();
    
    Reset();
    
    A = cos(angle);
    C = sin(angle);
    I = -C;
    K = A;
    
    mult(copy2);
    
    Matrix copy3 = copy();
    
    Reset();
    
    A = cos(angle);
    B = -sin(angle);
    E = -B;
    F = A;
    
    mult(copy3);
  }

  // makes a copy of this matrix, resets this matrix to identity,
  // converts this into a translation matrix, multiplies this new
  // translation matrix with the copy of the original matrix
  void translate(float tx, float ty, float tz) {
    Matrix copy = copy();

    Reset();

    D = tx;
    H = ty;
    L = tz;

    mult(copy);
  }

  // makes a copy of this matrix, resets this matrix to identity,
  // converts this into a scale matrix, multiplies this new scale
  // matrix with the copy of the original matrix
  void scale(float sx, float sy, float sz) {
    Matrix copy = copy();
    
    Reset();

    A = sx;
    F = sy;
    K = sz;

    mult(copy);
  }

  // applies Matrix transformation to a Vector, returns the result
  PVector transform(PVector v) {
    PVector v2 = v.get();

    float x = (float)((A*v2.x) + (B*v2.y) + (C*v2.z) + D);
    float y = (float)((E*v2.x) + (F*v2.y) + (G*v2.z) + H);
    float z = (float)((I*v2.x) + (J*v2.y) + (K*v2.z) + L);

    return new PVector(x, y);
  }

  // resets this matrix to an identity matrix
  void Reset() {
    A = 1; // Rx
    B = 0; // Ry
    C = 0; 
    D = 0; // Tx
    E = 0; // Ux
    F = 1; // Uy
    G = 0; 
    H = 0; // Ty
    I = 0;
    J = 0;
    K = 1;
    L = 0; //Tz
    M = 0;
    N = 0;
    O = 0;
    P = 1;
  }

  // returns a copy of this matrix
  Matrix copy() {
    Matrix copy = new Matrix();

    copy.A = this.A;
    copy.B = this.B;
    copy.C = this.C;
    copy.D = this.D;
    copy.E = this.E;
    copy.F = this.F;
    copy.G = this.G;
    copy.H = this.H;
    copy.I = this.I;
    copy.J = this.J;
    copy.K = this.K;
    copy.L = this.L;
    copy.M = this.M;
    copy.N = this.N;
    copy.O = this.O;
    copy.P = this.P;

    return copy;
  }

  // multiplies this matrix against another matrix
  void mult(Matrix m) {
    
    double Atemp;
    double Btemp;
    double Ctemp;
    double Dtemp; //tx
    double Etemp;
    double Ftemp;
    double Gtemp;
    double Htemp; // ty
    double Itemp;
    double Jtemp;
    double Ktemp;
    double Ltemp; // tz
    double Mtemp;
    double Ntemp;
    double Otemp;
    double Ptemp;

    Atemp = A*m.A + B*m.E + C*m.I + D*m.M;
    Btemp = A*m.B + B*m.F + C*m.J + D*m.N;
    Ctemp = A*m.C + B*m.G + C*m.K + D*m.O;
    Dtemp = A*m.D + B*m.H + C*m.L + D*m.P;
    
    Etemp = E*m.A + F*m.E + G*m.I + H*m.M;
    Ftemp = E*m.B + F*m.F + G*m.J + H*m.N;
    Gtemp = E*m.C + F*m.G + G*m.K + H*m.O;
    Htemp = E*m.D + F*m.H + G*m.L + H*m.P;
    
    Itemp = I*m.A + J*m.E + K*m.I + L*m.M;
    Jtemp = I*m.B + J*m.F + K*m.J + L*m.N;
    Ktemp = I*m.C + J*m.G + K*m.K + L*m.O;
    Ltemp = I*m.D + J*m.H + K*m.L + L*m.P;
    
    Mtemp = M*m.A + N*m.E + O*m.I + P*m.M;
    Ntemp = M*m.B + N*m.F + O*m.J + P*m.N;
    Otemp = M*m.C + N*m.G + O*m.K + P*m.O;
    Ptemp = M*m.D + N*m.H + O*m.L + P*m.P;
    
    this.A = Atemp;
    this.B = Btemp;
    this.C = Ctemp;
    this.D = Dtemp;
    this.E = Etemp;
    this.F = Ftemp;
    this.G = Gtemp;
    this.H = Htemp;
    this.I = Itemp;
    this.J = Jtemp;
    this.K = Ktemp;
    this.L = Ltemp;
    this.M = Mtemp;
    this.N = Ntemp;
    this.O = Otemp;
    this.P = Ptemp;
  }
}
