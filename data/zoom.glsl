#define PROCESSING_TEXTURE_SHADER

// processing standard shader inputs:
uniform sampler2D texture;
varying vec4 vertTexCoord;
uniform vec2 texOffset;

// my inputs:
uniform float amtSpin;
uniform float amtZoom;

void main() {

    vec2 p = vertTexCoord.xy;
    // get offset from center:
    p -= vec2(.5);

    // convert from cartesian to polar:
    float M = length(p);
    float A = atan(p.y, p.x);

    // slightly reduce length of vector:
    M *= amtZoom;
    A += amtSpin;
    
    // convert from polar to cartesian:
    p.x = M * cos(A);
    p.y = M * sin(A);

    // reorient back to corner:
    p += vec2(.5);

    // get the color of pixel at position p:
    vec4 color = texture2D(texture, p);

    // darken the color (for fade effect):
    color.r -= .01;
    color.g -= .01;
    color.b -= .01;

    gl_FragColor = vec4(color.rgb, .99);
}
