@interface MRShaderManager
+ (id)shaderKeyForShaderID:(id)a3 andArguments:(id)a4;
+ (id)sharedManager;
+ (void)initialize;
- (MRShaderManager)init;
- (id)shaderForShaderID:(id)a3 inContext:(id)a4 withArguments:(id)a5;
- (unsigned)_glShaderForID:(id)a3 inBaseContext:(id)a4 isFragmentShader:(BOOL)a5 withArguments:(id)a6;
- (void)cleanup;
- (void)dealloc;
- (void)forgetContext:(id)a3;
- (void)registerShaderWithFragmentShaderSource:(id)a3 andVertexShaderName:(id)a4 forShaderID:(id)a5;
- (void)registerVertexShaderWithVertexShaderSource:(id)a3 forShaderID:(id)a4;
- (void)releaseResources;
@end

@implementation MRShaderManager

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRShaderManager;
  objc_msgSendSuper2(&v2, "initialize");
  if (!qword_1F13F0) {
    qword_1F13F0 = objc_alloc_init(MRShaderManager);
  }
}

+ (id)sharedManager
{
  return (id)qword_1F13F0;
}

- (MRShaderManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRShaderManager;
  objc_super v2 = [(MRShaderManager *)&v6 init];
  if (v2)
  {
    v2->mGLShadersPerContext = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mShadersPerContext = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mShaderDescriptions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->mGLShadersPerContextLock = v3;
    [(NSLock *)v3 setName:@"MRShaderManager.glShadersPerContextLock"];
    v4 = (NSLock *)objc_alloc_init((Class)NSLock);
    v2->mShadersPerContextLock = v4;
    [(NSLock *)v4 setName:@"MRShaderManager.shadersPerContextLock"];
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t} \n\t\t",
      @"Vertex");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareForeColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeForeColor; \n\t\t} \n\t\t",
      @"VertexColor");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeInSpriteCoordinates; \n\t\t} \n\t\t",
      @"VertexCoordinates");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t} \n\t\t",
      @"VertexTexture0");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates1; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates1; \n\t\t} \n\t\t",
      @"VertexTexture1");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0High; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t} \n\t\t",
      @"VertexTexture0High");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareForeColor; \n\t\tDeclareTextureCoordinates0; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeForeColor; \n\t\t\tComputeTextureCoordinates0; \n\t\t} \n\t\t",
      @"VertexColorTexture0");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeInSpriteCoordinates; \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0High; \n\t\tDeclareInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeInSpriteCoordinates; \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0High");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareForeColor; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeForeColor; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeInSpriteCoordinates; \n\t\t} \n\t\t",
      @"VertexColorCoordinatesTexture0");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeTextureCoordinates1; \n\t\t} \n\t\t",
      @"VertexTexture01");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tDeclareTextureCoordinates2; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeTextureCoordinates1; \n\t\t\tComputeTextureCoordinates2; \n\t\t} \n\t\t",
      @"VertexTexture012");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareForeColor; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeForeColor; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeTextureCoordinates1; \n\t\t} \n\t\t",
      @"VertexColorTexture01");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tDeclareInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeTextureCoordinates1; \n\t\t\tComputeInSpriteCoordinates; \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture01");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareForeColor; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tDeclareInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeForeColor; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeTextureCoordinates1; \n\t\t\tComputeInSpriteCoordinates; \n\t\t} \n\t\t",
      @"VertexColorCoordinatesTexture01");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tDeclareTextureCoordinates2; \n\t\tDeclareInSpriteCoordinates; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tvTextureCoordinates1 = (uTextureMatrix1 * vec4(aInSpriteCoordinates, 0., 1.)).st; \n\t\t\tvTextureCoordinates2 = (uTextureMatrix2 * vec4(aInSpriteCoordinates, 0., 1.)).st; \n\t\t} \n\t\t",
      @"VertexFrameAndMask");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareNormal; \n\t\tuniform highp vec3\t\tlightDirection; \n\t\tuniform lowp vec3\t\tambientLightColor, diffuseLightColor, specularLightColor; \n\t\tconst highp float\t\tkShininess = 16.; \n\t\tvarying lowp vec3\t\tdiffuseLight, specularLight; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\t\n\t\t\tlowp float dotProd = max(dot(aNormal, lightDirection), 0.); \n\t\t\tdiffuseLight = ambientLightColor + diffuseLightColor * dotProd; \n\t\t\tif (dotProd > 0.) { \n\t\t\t\t\thighp vec3 halfVector = normalize(lightDirection); \n\t\t\t\t\thighp float dotProd2 = max(dot(aNormal, halfVector), 0.); \n\t\t\t\t\thighp float specular = pow(dotProd2, kShininess); \n\t\t\t\t\tspecularLight = specular * specularLightColor; \n\t\t\t\t} \n\t\t\telse \n\t\t\t\tspecularLight = vec3(0.); \n\t\t} \n\t\t",
      @"VertexDirectionalSpecularLighting");
    -[MRShaderManager registerVertexShaderWithVertexShaderSource:forShaderID:](v2, "registerVertexShaderWithVertexShaderSource:forShaderID:", @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareNormal; \n\t\tuniform highp vec3\t\tlightPosition; \n\t\tuniform lowp vec3\t\tambientLightColor, diffuseLightColor, specularLightColor; \n\t\tuniform highp mat4\t\tmodelViewMatrix; \n\t\tconst highp float\t\tkShininess = 4.; \n\t\tvarying lowp vec3\t\tdiffuseLight, specularLight; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\t\n\t\t\thighp vec3 normal = mat3(modelViewMatrix) * aNormal; \t\t\thighp vec3 lightDirection = normalize(lightPosition - (modelViewMatrix * aVertex).xyz); \n\t\t\tlowp float dotProd = max(dot(normal, lightDirection), 0.); \n\t\t\tdiffuseLight = ambientLightColor + diffuseLightColor * dotProd; \n\t\t\tif (dotProd > 0.) { \n\t\t\t\t\thighp vec3 halfVector = lightDirection; \n\t\t\t\t\thighp float dotProd2 = max(dot(normal, halfVector), 0.); \n\t\t\t\t\thighp float specular = pow(dotProd2, kShininess); \n\t\t\t\t\tspecularLight = specular * specularLightColor; \n\t\t\t\t} \n\t\t\telse \n\t\t\t\tspecularLight = vec3(0.); \n\t\t} \n\t\t",
      @"VertexPositionalSpecularLighting");
    -[NSMutableDictionary setObject:forKey:](v2->mShaderDescriptions, "setObject:forKey:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tmediump vec4 sf = vec4(vTextureCoordinates0, vec2(1., 1.) - vTextureCoordinates0); \n\t\t\tsf *= vec4(1000.); \n\t\t\tsf = smoothstep(0., 1., clamp(sf, 0., 1.)); \n\t\t\tlowp float s = sf.x * sf.y * sf.z * sf.w; \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tlowp vec3 nonFilteredColor = color.rgb; \n\t\t\tDoFilter0(color); \n\t\t\tcolor.rgb = mix(nonFilteredColor, color.rgb, s); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
        @"source",
        @"textureSize",
        @"texture0Size",
        @"VertexTexture0",
        @"vertexShader",
        0),
      @"FittingFilter");
    -[NSMutableDictionary setObject:forKey:](v2->mShaderDescriptions, "setObject:forKey:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @" \n\t\tuniform lowp _sampler2D\t\t_textureUnit0, _textureUnit1; \n\t\tvarying mediump\tvec2\t\tvTextureCoordinates0, vTextureCoordinates1; \n\t\tinvariant gl_FragColor; \n\t\tvoid main() \n\t\t{ \n\t\t\thighp vec4 sourceColor = _texture2D(_textureUnit0, vTextureCoordinates0); \n\t\t\thighp float lum = dot(vec3(.299, .587, .114), sourceColor.rgb); \n\t\t\thighp vec4 targetColor = _texture2D(_textureUnit1, vTextureCoordinates1); \n\t\t\tconst highp float factor = 1. / 255.; \n\t\t\thighp float a = targetColor.r + lum; \n\t\t\ttargetColor.r = fract(a); \n\t\t\ta = targetColor.g + floor(a) * factor; \n\t\t\ttargetColor.g = fract(a); \n\t\t\ta = targetColor.b + floor(a) * factor; \n\t\t\ttargetColor.b = fract(a); \n\t\t\ttargetColor.a += floor(a) * factor; \n\t\t\tgl_FragColor = targetColor; \n\t\t} \n\t\t",
        @"source",
        @"VertexTexture01",
        @"vertexShader",
        0),
      @"ScreenBurnTest");
    -[NSMutableDictionary setObject:forKey:](v2->mShaderDescriptions, "setObject:forKey:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @" \n\t\tuniform lowp _sampler2D\t\t_textureUnit0; \n\t\tuniform highp float\t\t\tfactor; \n\t\tvarying mediump\tvec2\t\tvTextureCoordinates0; \n\t\tvoid main() \n\t\t{ \n\t\t\thighp vec4 sourceColor = _texture2D(_textureUnit0, vTextureCoordinates0); \n\t\t\tconst highp float factor2 = 255.; \n\t\t\thighp float a = sourceColor.r + floor(factor2 * (sourceColor.g + floor(factor2 * (sourceColor.b + floor(factor2 * sourceColor.a + .5)) + .5)) + .5); \n\t\t\tgl_FragColor = vec4(vec3(a * factor), 1.); \n\t\t} \n\t\t",
        @"source",
        @"VertexTexture0",
        @"vertexShader",
        0),
      @"ScreenBurnTest2");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tgl_FragColor = uColor; \n\t\t} \n\t\t",
      @"Vertex",
      @"PlainColor");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tvarying lowp vec4\t\tvColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tgl_FragColor = vColor; \n\t\t} \n\t\t",
      @"VertexColor",
      @"PerVertexColor");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"PlainTexture");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tif (color.a < 1.) { \n\t\t\t\tcolor.r = (1. - color.a) * uColor.r; \n\t\t\t\tcolor.g = (1. - color.a) * uColor.g; \n\t\t\t\tcolor.b = (1. - color.a) * uColor.b; \n\t\t\t} \n\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"PlainTextureColorShadows");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture1; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture1; \n\t\t\tDoFilter1(color); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture1",
      @"PlainTexture1");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"PlainTextureNoColor");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0High; \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0High",
      @"PlainTextureHigh");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0High; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = color; \n\t\t} \n\t\t",
      @"VertexTexture0High",
      @"PlainTextureHighNoColor");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tvarying lowp vec4\t\t\tvColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = vColor * color; \n\t\t} \n\t\t",
      @"VertexColorTexture0",
      @"ColoredTexture");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2\t\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor.a = 1.; \n\t\t\tgl_FragColor = uColor * color * SpriteEdgeSoftener(vTextureCoordinates0, invRadii); \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"PlainTextureSoft");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform lowp vec4\t\t\tedgeColor; \n\t\tuniform mediump vec2\t\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor.a = 1.; \n\t\t\tgl_FragColor = uColor * mix(edgeColor, color, SpriteEdgeSoftenerScalar(vTextureCoordinates0, invRadii)); \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"PlainTextureSoftOpaque");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform lowp vec4\t\t\tcolor; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tDoFilter0(c); \n\t\t\tlowp float val = max(0., vInSpriteCoordinates.y); \n\t\t\tgl_FragColor = mix(color, c, val * val * val * level); \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0",
      @"GradientFadeToColor");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform lowp vec4\t\t\tcolor; \n\t\tuniform lowp float\t\t\tlevel; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 c = SampleTexture0; \n\t\t\tDoFilter0(c); \n\t\t\tgl_FragColor = uColor * mix(c, color, level); \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"FadeToColor");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2 borderSize, invRadii; \n\t\tuniform lowp vec4 borderColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tmediump vec2 b1 = -.5 - borderSize; \n\t\t\tmediump vec2 a1 = .5 + borderSize - b1; \n\t\t\tmediump vec2 p1 = vInSpriteCoordinates * a1 + b1, absP1 = abs(p1); \n\t\t\tlowp vec4 color; \n\t\t\tif (all(lessThanEqual(absP1, vec2(.5)))) { \n\t\t\t\t\tmediump vec2 borderAlphaXY = 1. - (.5 - absP1) * invRadii; \n\t\t\t\t\tlowp float borderAlpha = clamp(max(borderAlphaXY.x, borderAlphaXY.y), 0., 1.); \n\t\t\t\t\tcolor = SampleTexture0; \n\t\t\t\t\tDoFilter0(color); \n\t\t\t\t\tcolor = mix(color, borderColor, borderAlpha); \n\t\t\t\t} \n\t\t\telse \n\t\t\t\tcolor = borderColor * SpriteEdgeSoftenerPremultiplied(vInSpriteCoordinates, invRadii); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0",
      @"Border");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* mask */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = uColor * color * SampleTexture1; \n\t\t} \n\t\t",
      @"VertexTexture01",
      @"Mask");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* mask */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor.a *= SampleTexture1.r; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture01",
      @"AlphaMask");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* mask */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor *= SampleTexture1.a; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture01",
      @"AlphaMaskPremultipliedOnlyAlpha");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* mask */ \n\t\tDeclareForeColorU; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor *= SampleTexture1.r; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture01",
      @"AlphaMaskPremultiplied");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; /* image */ \n\t\tDeclareTexture1; /* mask */ \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2\t\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor *= SampleTexture1.r; \n\t\t\tgl_FragColor = uColor * color * SpriteEdgeSoftenerPremultiplied(vInSpriteCoordinates, invRadii); \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture01",
      @"SoftAlphaMaskPremultiplied");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2\t\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tgl_FragColor = uColor * SpriteEdgeSoftener(vInSpriteCoordinates, invRadii); \n\t\t} \n\t\t",
      @"VertexCoordinates",
      @"Softframe");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2\t\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tgl_FragColor = uColor * SpriteEdgeSoftenerPremultiplied(vInSpriteCoordinates, invRadii); \n\t\t} \n\t\t",
      @"VertexCoordinates",
      @"SoftframePremultiplied");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2\t\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = uColor * color * SpriteEdgeSoftener(vInSpriteCoordinates, invRadii); \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0",
      @"Softsprite");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = uColor * color * SpriteEdgeSoftenerPremultiplied(vInSpriteCoordinates, invRadii); \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0",
      @"SoftspritePremultiplied");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinatesHigh; \n\t\tDeclareForeColorU; \n\t\tuniform highp vec2\tinvRadii; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tgl_FragColor = uColor * color * SpriteEdgeSoftenerPremultipliedHigh(vInSpriteCoordinates, invRadii); \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0High",
      @"SoftspritePremultipliedHigh");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tuniform lowp float\t\t\tsaturation; \n\t\tconst lowp vec3\t\t\t\tintensities = vec3(.2125, .7154, .0721); \n\t\tuniform lowp vec4\t\t\tuColor; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tlowp vec3 neutral = vec3(dot(color.rgb, intensities)); \n\t\t\tcolor.rgb = mix(neutral.rgb, color.rgb, saturation); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"Saturation");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tvarying lowp\tvec3  diffuseLight, specularLight; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor.rgb = (color.rgb * diffuseLight) + specularLight; \n\t\t\tgl_FragColor = color;\n\t\t} \n\t\t",
      @"VertexDirectionalSpecularLighting",
      @"DirectionalSpecularLighting");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tvarying lowp\tvec3  diffuseLight, specularLight; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tcolor.rgb = (color.rgb * diffuseLight) + specularLight; \n\t\t\tgl_FragColor = color;\n\t\t} \n\t\t",
      @"VertexPositionalSpecularLighting",
      @"PositionalSpecularLighting");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform lowp vec4\t\t\tfactor, offset; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tcolor = factor * color + offset; \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"Linear");
    -[NSMutableDictionary setObject:forKey:](v2->mShaderDescriptions, "setObject:forKey:", @" \n\t\tlowp vec3 rampSepiaRGB(lowp float w) \n\t\t{ \n\t\t\tlowp vec3 v1 = vec3 (20.0/255.0); \n\t\t\tlowp vec3 objc_super v2 = vec3 (60.0/255.0); \n\t\t\tlowp vec3 v3 = vec3 (200.0/255.0, 200.0/255.0, 210.0/255.0); \n\t\t\tlowp vec3 v4 = vec3 (220.0/255.0, 220.0/255.0, 230.0/255.0); \n\t\t\tlowp vec3 mainval = vec3 (20.0/255.0, -10.0/255.0, -70.0/255.0); \n\t\t\tlowp vec3 lowval = vec3 (1.0/255.0, -5.0/255.0, -40.0/255.0); \n\t\t\tlowp vec3 w1 = vec3 (w); \n\t\t\tlowp vec3 w2 = max((w1 + (w - v1)*mainval/.15686), 0.0); \n\t\t\tlowp vec3 w3 = max(w + mainval, 0.0); \n\t\t\tlowp vec3 w4 = vec3 (0.0496198, 1.2501, 2.5) * w + vec3 (0.823857, -0.23538, - 1.5104); \n\t\t\tlowp vec3 w5 = w + lowval; \n\t\t\treturn (w1 \n\t\t\t\t+ (w2 - w1) * step(v1, vec3 (w)) \n\t\t\t\t+ (w3 - w2) * step(v2, vec3 (w)) \n\t\t\t\t+ (w4 - w3) * step(v3, vec3 (w)) \n\t\t\t\t+ (w5 - w4) * step(v4, vec3 (w))); \n\t\t} \n\t\t\t\tlowp vec3 Sepia(lowp vec3 inColor) \n\t\t{ \n\t\t\tlowp float lum = dot(vec3 (0.2988, .5869, .114), inColor); \n\t\t\tinColor = rampSepiaRGB(lum); \n\t\t\treturn clamp(inColor, 0., 1.); \n\t\t} \n\t\t",
      @"FilterSepia");
    -[NSMutableDictionary setObject:forKey:](v2->mShaderDescriptions, "setObject:forKey:", @" \n\t\tlowp vec3 BlackAndWhite(lowp vec3 inColor) \n\t\t{ \n\t\t\tlowp float lum = dot(vec3(0.2988,.5869,.114), inColor); \n\t\t\treturn vec3(lum); \n\t\t} \n\t\t",
      @"FilterBlackAndWhite");
    -[NSMutableDictionary setObject:forKey:](v2->mShaderDescriptions, "setObject:forKey:", @" \n\t\tlowp vec3 Antique(lowp vec3 inColor) \n\t\t{ \n\t\t\tinColor = pow(inColor, vec3(1.8)); \n\t\t\tlowp float lum = dot(vec3(.33333), inColor); \n\t\t\tinColor = mix(vec3(lum), inColor, .7); \n\t\t\tlowp float p1 = .6 + 1.0; \n\t\t\tlowp vec3 sPart = .6*.6*inColor*(1.-inColor*inColor)/(p1*p1); \n\t\t\tinColor.b = pow(inColor.b, p1) + sPart.b; \n\t\t\tinColor.r = (1. - pow(1.-inColor.r, p1) - sPart.r); \n\t\t\tinColor = pow(inColor, vec3(1. / 1.8)); \n\t\t\treturn inColor; \n\t\t} \n\t\t",
      @"FilterAntique");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform mediump float\t\tcoeffs[16]; \n\t\tuniform lowp int\t\t\tnumberOfCoeffs; \n\t\tuniform mediump vec2\t\tsStep; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = coeffs[0] * SampleTexture0; \n\t\t\tmediump vec2 ds = sStep; \n\t\t\tfor (int i = 1; i < numberOfCoeffs; i++, ds += sStep) \n\t\t\t\tcolor += coeffs[i] * (_texture2D(_textureUnit0, vTextureCoordinates0 + ds) + _texture2D(_textureUnit0, vTextureCoordinates0 - ds)); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"GaussianBlurS");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform mediump float\t\tcoeffs[4]; \n\t\tuniform mediump vec2\t\tsStep; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = coeffs[0] * SampleTexture0; \n\t\t\tmediump vec2 ds = sStep; \n\t\t\tfor (int i = 1; i < 4; i++, ds += sStep) \n\t\t\t\tcolor += coeffs[i] * (_texture2D(_textureUnit0, vTextureCoordinates0 + ds) + _texture2D(_textureUnit0, vTextureCoordinates0 - ds)); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"GaussianBlurS4");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform mediump float\t\tcoeffs[5]; \n\t\tuniform mediump vec2\t\tsStep; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = coeffs[0] * SampleTexture0; \n\t\t\tmediump vec2 ds = sStep; \n\t\t\tfor (int i = 1; i < 5; i++, ds += sStep) \n\t\t\t\tcolor += coeffs[i] * (_texture2D(_textureUnit0, vTextureCoordinates0 + ds) + _texture2D(_textureUnit0, vTextureCoordinates0 - ds)); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"GaussianBlurS5");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform mediump float\t\tcoeffs[6]; \n\t\tuniform mediump vec2\t\tsStep; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = coeffs[0] * SampleTexture0; \n\t\t\tmediump vec2 ds = sStep; \n\t\t\tfor (int i = 1; i < 6; i++, ds += sStep) \n\t\t\t\tcolor += coeffs[i] * (_texture2D(_textureUnit0, vTextureCoordinates0 + ds) + _texture2D(_textureUnit0, vTextureCoordinates0 - ds)); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"GaussianBlurS6");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform mediump float\t\tcoeffs[7]; \n\t\tuniform mediump vec2\t\tsStep; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = coeffs[0] * SampleTexture0; \n\t\t\tmediump vec2 ds = sStep; \n\t\t\tfor (int i = 1; i < 7; i++, ds += sStep) \n\t\t\t\tcolor += coeffs[i] * (_texture2D(_textureUnit0, vTextureCoordinates0 + ds) + _texture2D(_textureUnit0, vTextureCoordinates0 - ds)); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"GaussianBlurS7");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareForeColorU; \n\t\tuniform mediump float\t\tcoeffs[8]; \n\t\tuniform mediump vec2\t\tsStep; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = coeffs[0] * SampleTexture0; \n\t\t\tmediump vec2 ds = sStep; \n\t\t\tfor (int i = 1; i < 8; i++, ds += sStep) \n\t\t\t\tcolor += coeffs[i] * (_texture2D(_textureUnit0, vTextureCoordinates0 + ds) + _texture2D(_textureUnit0, vTextureCoordinates0 - ds)); \n\t\t\tgl_FragColor = uColor * color; \n\t\t} \n\t\t",
      @"VertexTexture0",
      @"GaussianBlurS8");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; \n\t\tDeclareInSpriteCoordinates; \n\t\tDeclareForeColorU; \n\t\tuniform mediump vec2\t\tinvRadii; \n\t\tuniform mediump vec2\t\tradius; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color = SampleTexture0; \n\t\t\tDoFilter0(color); \n\t\t\tmediump vec2 s = clamp(abs(vInSpriteCoordinates - .5) - (.5 - radius), vec2(0.), radius) / radius; \n\t\t\tlowp float s1 = smoothstep(0., 1., clamp((1. - length(s)) * invRadii.x, 0., 1.)); \n\t\t\tgl_FragColor = uColor * color * s1; \n\t\t} \n\t\t",
      @"VertexCoordinatesTexture0",
      @"RoundedCorners");
    -[MRShaderManager registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:](v2, "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:", @" \n\t\tDeclareTexture0; /* source */ \n\t\tDeclareTexture1; /* target */ \n\t\tDeclareForeColorU; \n\t\tuniform lowp float\t\t\tprogress; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 sourceColor = SampleTexture0; \n            DoFilter0(sourceColor); \n\t\t\tlowp vec4 targetColor = SampleTexture1; \n            DoFilter1(targetColor); \n\t\t\tgl_FragColor = uColor * mix(sourceColor, targetColor, progress); \n\t\t} \n\t\t",
      @"VertexTexture01",
      @"TransitionDissolve");
  }
  return v2;
}

- (void)dealloc
{
  [(MRShaderManager *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRShaderManager;
  [(MRShaderManager *)&v3 dealloc];
}

- (void)cleanup
{
  self->mGLShadersPerContext = 0;
  self->mShadersPerContext = 0;

  self->mShaderDescriptions = 0;
}

- (void)releaseResources
{
  id v3 = [(NSMutableDictionary *)self->mGLShadersPerContext allKeys];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MRShaderManager forgetContext:](self, "forgetContext:", [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) object]);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->mGLShadersPerContext removeAllObjects];
  [(NSMutableDictionary *)self->mShadersPerContext removeAllObjects];
}

- (void)forgetContext:(id)a3
{
  if (a3 && [a3 baseContext] == a3)
  {
    id v5 = +[EAGLContext currentContext];
    uint64_t v6 = v5;
    if (v5 != [a3 glContext]) {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [a3 glContext]);
    }
    v7 = [[MURetainingKey alloc] initWithObject:a3];
    mShadersPerContext = self->mShadersPerContext;
    objc_sync_enter(mShadersPerContext);
    [(NSMutableDictionary *)self->mShadersPerContext removeObjectForKey:v7];
    objc_sync_exit(mShadersPerContext);
    mGLShadersPerContext = self->mGLShadersPerContext;
    objc_sync_enter(mGLShadersPerContext);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = -[NSMutableDictionary objectForKey:](self->mGLShadersPerContext, "objectForKey:", v7, 0);
    id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          glDeleteShader((GLuint)[*(id *)(*((void *)&v14 + 1) + 8 * i) intValue]);
        }
        id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
    [(NSMutableDictionary *)self->mGLShadersPerContext removeObjectForKey:v7];
    objc_sync_exit(mGLShadersPerContext);

    glFlush();
    if (+[EAGLContext currentContext] != v5) {
      +[EAGLContext setCurrentContext:v5];
    }
  }
}

- (unsigned)_glShaderForID:(id)a3 inBaseContext:(id)a4 isFragmentShader:(BOOL)a5 withArguments:(id)a6
{
  BOOL v7 = a5;
  mGLShadersPerContext = self->mGLShadersPerContext;
  objc_sync_enter(mGLShadersPerContext);
  uint64_t v12 = [[MURetainingKey alloc] initWithObject:a4];
  id v13 = [(NSMutableDictionary *)self->mGLShadersPerContext objectForKey:v12];
  id v14 = v13;
  if (v13)
  {
    unsigned int Shader = objc_msgSend(objc_msgSend(v13, "objectForKey:", a3), "integerValue");
  }
  else
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->mGLShadersPerContext setObject:v14 forKey:v12];

    unsigned int Shader = 0;
  }

  if (!Shader)
  {
    id v16 = [a3 rangeOfString:@"|"];
    id v17 = a3;
    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL) {
      id v17 = [a3 substringToIndex:v16];
    }
    id v31 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mShaderDescriptions, "objectForKey:", v17), "objectForKey:", @"source");
    if (!v31) {
      goto LABEL_32;
    }
    if (v7)
    {
      v30 = mGLShadersPerContext;
      BOOL v29 = v7;
      id v18 = objc_msgSend(objc_msgSend(@" \n\t\t", "stringByAppendingFormat:", @"#define ClampToBorder0 %d\n\t#define ClampToBorder1 %d\n\n", objc_msgSend(a6, "texture0ClampsToBorder"), objc_msgSend(a6, "texture1ClampsToBorder")), "stringByAppendingString:", &cfstr_DefineSampler2);
      id v19 = objc_alloc_init((Class)NSMutableSet);
      for (uint64_t i = 0; i != 3; ++i)
      {
        if (i == 1)
        {
          id v21 = [a6 filter1];
        }
        else if (i)
        {
          id v21 = [a6 filter2];
        }
        else
        {
          id v21 = [a6 filter0];
        }
        id v22 = v21;
        if (v21)
        {
          id v18 = [v18 stringByReplacingOccurrencesOfString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @" Filter%d", i), v21 withString];
          if (([v19 containsObject:v22] & 1) == 0)
          {
            id v23 = [(NSMutableDictionary *)self->mShaderDescriptions objectForKey:+[NSString stringWithFormat:@"Filter%@", v22]];
            if (v23) {
              id v18 = [v18 stringByAppendingString:v23];
            }
          }
          [v19 addObject:v22];
        }
      }

      id v24 = [v18 stringByAppendingString:v31];
      mGLShadersPerContext = v30;
      BOOL v7 = v29;
    }
    else
    {
      id v24 = objc_msgSend(@" \n\t\t \n\t\t#define DeclareVertex\t\t\t\t\tuniform highp mat4 uModelViewProjectionMatrix; attribute highp vec4 aVertex \n\t\t#define DeclareNormal\t\t\t\t\tattribute highp vec3 aNormal \n\t\t#define DeclareTextureCoordinates0\t\tuniform highp mat4 uTextureMatrix0; attribute mediump vec4 aTextureCoordinates0; varying mediump vec2 vTextureCoordinates0 \n\t\t#define DeclareTextureCoordinates1\t\tuniform highp mat4 uTextureMatrix1; attribute mediump vec4 aTextureCoordinates1; varying mediump vec2 vTextureCoordinates1 \n\t\t#define DeclareTextureCoordinates2\t\tuniform highp mat4 uTextureMatrix2; attribute mediump vec4 aTextureCoordinates2; varying mediump vec2 vTextureCoordinates2 \n\t\t#define DeclareTextureCoordinates0High\tuniform highp mat4 uTextureMatrix0; attribute highp vec4 aTextureCoordinates0; varying highp vec2 vTextureCoordinates0 \n\t\t#define DeclareInSpriteCoordinates\t\tattribute mediump vec2 aInSpriteCoordinates; varying mediump vec2 vInSpriteCoordinates \n\t\t#define DeclareInSpriteCoordinatesHigh\tattribute highp vec2 aInSpriteCoordinates; varying highp vec2 vInSpriteCoordinates \n\t\t#define DeclareForeColor\t\t\t\tattribute lowp vec4 aColor; varying lowp vec4 vColor \n\t\t#define ComputeVertex\t\t\t\t\tgl_Position = uModelViewProjectionMatrix * aVertex \n\t\t#define ComputeTextureCoordinates0\t\tvTextureCoordinates0 = (uTextureMatrix0 * aTextureCoordinates0).st \n\t\t#define ComputeTextureCoordinates1\t\tvTextureCoordinates1 = (uTextureMatrix1 * aTextureCoordinates1).st \n\t\t#define ComputeTextureCoordinates2\t\tvTextureCoordinates2 = (uTextureMatrix2 * aTextureCoordinates2).st \n\t\t#define ComputeInSpriteCoordinates\t\tvInSpriteCoordinates = aInSpriteCoordinates \n\t\t#define ComputeForeColor\t\t\t\tvColor = aColor \n\t\t",
              "stringByAppendingString:",
              v31);
    }
    string = (GLchar *)[v24 UTF8String];
    if (string)
    {
      v25 = +[EAGLContext currentContext];
      v26 = v25;
      if (v25 != [a4 glContext]) {
        +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [a4 glContext]);
      }
      if (v7) {
        GLenum v27 = 35632;
      }
      else {
        GLenum v27 = 35633;
      }
      unsigned int Shader = glCreateShader(v27);
      glShaderSource(Shader, 1, (const GLchar *const *)&string, 0);
      glCompileShader(Shader);
      objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Shader), a3);
      if (+[EAGLContext currentContext] != v25) {
        +[EAGLContext setCurrentContext:v25];
      }
    }
    else
    {
LABEL_32:
      unsigned int Shader = 0;
    }
  }
  objc_sync_exit(mGLShadersPerContext);
  return Shader;
}

- (id)shaderForShaderID:(id)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v9 = [a4 baseContext];
  id v10 = +[MRShaderManager shaderKeyForShaderID:a3 andArguments:a5];
  mShadersPerContext = self->mShadersPerContext;
  objc_sync_enter(mShadersPerContext);
  uint64_t v12 = [[MURetainingKey alloc] initWithObject:v9];
  id v13 = [(NSMutableDictionary *)self->mShadersPerContext objectForKey:v12];
  id v14 = v13;
  if (v13)
  {
    long long v15 = (MRShader *)[v13 objectForKey:v10];
  }
  else
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->mShadersPerContext setObject:v14 forKey:v12];

    long long v15 = 0;
  }

  if (!v15)
  {
    uint64_t v16 = [(MRShaderManager *)self _glShaderForID:v10 inBaseContext:v9 isFragmentShader:1 withArguments:a5];
    if (v16)
    {
      id v17 = [(NSMutableDictionary *)self->mShaderDescriptions objectForKey:a3];
      CFStringRef v18 = (const __CFString *)[v17 objectForKey:@"vertexShader"];
      if (v18) {
        CFStringRef v19 = v18;
      }
      else {
        CFStringRef v19 = @"Vertex";
      }
      long long v15 = [[MRShader alloc] initWithShaderID:a3 shaderKey:v10 description:v17 vertexShader:[(MRShaderManager *)self _glShaderForID:v19 inBaseContext:v9 isFragmentShader:0 withArguments:a5] andFragmentShader:v16 inContext:v9];
      [v14 setObject:v15 forKey:v10];
    }
    else
    {
      long long v15 = 0;
    }
  }
  objc_sync_exit(mShadersPerContext);
  [(MRShader *)v15 setUseContext:a4];
  return v15;
}

+ (id)shaderKeyForShaderID:(id)a3 andArguments:(id)a4
{
  uint64_t v6 = [a4 texture0ClampsToBorder];
  if ([a4 texture1ClampsToBorder]) {
    uint64_t v7 = v6 | 2;
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = [a4 filter0];
  id v9 = [a4 filter1];
  id v10 = [a4 filter2];
  id v11 = [v8 length];
  id v12 = [v9 length];
  if (v11)
  {
    if (v12 || [v10 length]) {
      return +[NSString stringWithFormat:@"%@|%d|%@|%@|%@", a3, v7, v8, v9, v10];
    }
    else {
      return +[NSString stringWithFormat:@"%@|%d|%@", a3, v7, v8, v15, v16];
    }
  }
  else if (v12 || [v10 length])
  {
    return +[NSString stringWithFormat:@"%@|%d||%@|%@", a3, v7, v9, v10, v16];
  }
  else if (v7)
  {
    return +[NSString stringWithFormat:@"%@|%d", a3, v7, v14, v15, v16];
  }
  else
  {
    return a3;
  }
}

- (void)registerVertexShaderWithVertexShaderSource:(id)a3 forShaderID:(id)a4
{
  if ([(NSMutableDictionary *)self->mShaderDescriptions objectForKey:a4]) {
    NSLog(@"### error: overriding vertex shader for shaderID '%@'", a4);
  }
  mShaderDescriptions = self->mShaderDescriptions;
  id v8 = +[NSDictionary dictionaryWithObjectsAndKeys:a3, @"source", 0];
  [(NSMutableDictionary *)mShaderDescriptions setObject:v8 forKey:a4];
}

- (void)registerShaderWithFragmentShaderSource:(id)a3 andVertexShaderName:(id)a4 forShaderID:(id)a5
{
  if ([(NSMutableDictionary *)self->mShaderDescriptions objectForKey:a5]) {
    NSLog(@"### error: overriding shader for shaderID '%@'", a5);
  }
  mShaderDescriptions = self->mShaderDescriptions;
  id v10 = +[NSDictionary dictionaryWithObjectsAndKeys:a3, @"source", a4, @"vertexShader", 0];
  [(NSMutableDictionary *)mShaderDescriptions setObject:v10 forKey:a5];
}

@end