@interface CRLMetalShader
+ (id)blendTextureShaderForMotionBlurWithContext:(id)a3;
+ (id)blendTextureShaderWithContext:(id)a3;
+ (id)defaultColorShaderWithContext:(id)a3;
+ (id)defaultTextureAndOpacityShaderForMotionBlurWithContext:(id)a3;
+ (id)defaultTextureAndOpacityShaderWithContext:(id)a3;
+ (id)linearClampToEdgeSamplerWithDevice:(id)a3;
+ (id)p_blendingColorAttachmentWithContext:(id)a3;
+ (id)p_motionBlurVelocityColorAttachmentWithContext:(id)a3;
- (CRLMetalShader)initWithDefaultVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7 label:(id)a8 setupBindings:(BOOL)a9;
- (MTLRenderPipelineReflection)pipelineReflectionObject;
- (MTLRenderPipelineState)pipelineState;
- (NSString)name;
- (id)description;
- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 bundle:(id)a6 colorAttachment:(id)a7;
- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 bundle:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8;
- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6;
- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7;
- (id)initDefaultBlendShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6;
- (id)initDefaultColorShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultGaussianBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 halfSizedRadius:(BOOL)a5;
- (id)initDefaultMaskedTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultNeighborMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6;
- (id)initDefaultSingleDirectionMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultTextureAndColorShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultTextureAndOpacityMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6;
- (id)initDefaultTextureAndOpacityShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultTextureMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5;
- (id)initDefaultTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultTileMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultVelocityCollectionShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initDefaultVelocityVisualizerShaderWithDevice:(id)a3 colorAttachment:(id)a4;
- (id)initQuadMotionBlurTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7;
- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6;
- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7;
- (id)p_createPipelineStateWithRenderPipelineDescriptor:(id)a3 device:(id)a4 setupBindings:(BOOL)a5;
- (int64_t)p_indexOfSamplerStateFromMetalBindings:(id)a3;
- (int64_t)p_indexOfUniformsFromMetalBindings:(id)a3 size:(unint64_t *)a4 bufferIndex:(unint64_t *)a5;
- (unint64_t)bufferIndex;
- (void)p_setDefaultVertexUniforms;
- (void)p_setupPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 vertexLibrary:(id)a6 fragmentLibrary:(id)a7 colorAttachment:(id)a8 velocityAttachment:(id)a9 setupBindings:(BOOL)a10;
- (void)setName:(id)a3;
- (void)setPipelineStateWithEncoder:(id)a3;
- (void)setPipelineStateWithEncoder:(id)a3 fragmentBytes:(const void *)a4;
- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4;
- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5;
- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5 samplerState:(id)a6;
@end

@implementation CRLMetalShader

+ (id)p_blendingColorAttachmentWithContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  id v5 = [v3 pixelFormat];

  [v4 setPixelFormat:v5];
  [v4 setBlendingEnabled:1];
  [v4 setRgbBlendOperation:0];
  [v4 setAlphaBlendOperation:0];
  [v4 setSourceRGBBlendFactor:1];
  [v4 setSourceAlphaBlendFactor:1];
  [v4 setDestinationAlphaBlendFactor:5];
  [v4 setDestinationRGBBlendFactor:5];

  return v4;
}

+ (id)p_motionBlurVelocityColorAttachmentWithContext:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  id v5 = [v3 pixelFormat];

  [v4 setPixelFormat:v5];

  return v4;
}

+ (id)defaultTextureAndOpacityShaderWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 device];

  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0BD8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108910C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0BF8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderWithContext:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 92, 0, "invalid nil value for '%{public}s'", "context.device");
  }
  v9 = [v4 environment];
  v10 = [v9 shaderManager];

  v11 = [v4 device];
  v12 = [v10 device];

  if (v11 != v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0C18);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089084();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0C38);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderWithContext:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:94 isFatal:0 description:"MTLDevice mismatch!"];
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001E10AC;
  v20[3] = &unk_1014E0C60;
  id v21 = v4;
  id v22 = a1;
  id v16 = v4;
  v17 = objc_retainBlock(v20);
  v18 = [v10 shaderWithName:@"Default Texture and Opacity Shader" initBlock:v17];

  return v18;
}

+ (id)defaultTextureAndOpacityShaderForMotionBlurWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 device];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0C80);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089228();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0CA0);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderForMotionBlurWithContext:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 105, 0, "invalid nil value for '%{public}s'", "context.device");
  }
  v8 = [v3 environment];
  v9 = [v8 shaderManager];

  v10 = [v3 device];
  v11 = [v9 device];

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0CC0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010891A0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0CE0);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultTextureAndOpacityShaderForMotionBlurWithContext:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:107 isFatal:0 description:"MTLDevice mismatch!"];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001E15A4;
  v19[3] = &unk_1014E0D08;
  id v20 = v3;
  id v15 = v3;
  id v16 = objc_retainBlock(v19);
  v17 = [v9 shaderWithName:@"Default Texture and Opacity Shader with Motion Blur" initBlock:v16];

  return v17;
}

+ (id)blendTextureShaderWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 device];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0D28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089344();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0D48);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderWithContext:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 119, 0, "invalid nil value for '%{public}s'", "context.device");
  }
  v8 = [v3 environment];
  v9 = [v8 shaderManager];

  v10 = [v3 device];
  v11 = [v9 device];

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0D68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010892BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0D88);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderWithContext:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:121 isFatal:0 description:"MTLDevice mismatch!"];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001E1ABC;
  v19[3] = &unk_1014E0D08;
  id v20 = v3;
  id v15 = v3;
  id v16 = objc_retainBlock(v19);
  v17 = [v9 shaderWithName:@"Default Texture Blending Shader" initBlock:v16];

  return v17;
}

+ (id)blendTextureShaderForMotionBlurWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 device];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0DA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089460();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0DC8);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderForMotionBlurWithContext:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 132, 0, "invalid nil value for '%{public}s'", "context.device");
  }
  v8 = [v3 environment];
  v9 = [v8 shaderManager];

  v10 = [v3 device];
  v11 = [v9 device];

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0DE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010893D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0E08);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader blendTextureShaderForMotionBlurWithContext:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:134 isFatal:0 description:"MTLDevice mismatch!"];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001E1FBC;
  v19[3] = &unk_1014E0D08;
  id v20 = v3;
  id v15 = v3;
  id v16 = objc_retainBlock(v19);
  v17 = [v9 shaderWithName:@"Default Texture Blending Shader with Motion Blur" initBlock:v16];

  return v17;
}

+ (id)defaultColorShaderWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 device];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0E28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108957C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0E48);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultColorShaderWithContext:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 146, 0, "invalid nil value for '%{public}s'", "context.device");
  }
  v8 = [v3 environment];
  v9 = [v8 shaderManager];

  v10 = [v3 device];
  v11 = [v9 device];

  if (v10 != v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0E68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010894F4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0E88);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader defaultColorShaderWithContext:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:148 isFatal:0 description:"MTLDevice mismatch!"];
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001E24D4;
  v19[3] = &unk_1014E0D08;
  id v20 = v3;
  id v15 = v3;
  id v16 = objc_retainBlock(v19);
  v17 = [v9 shaderWithName:@"Default Color Shader" initBlock:v16];

  return v17;
}

+ (id)linearClampToEdgeSamplerWithDevice:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0EA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089610();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0EC8);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLMetalShader linearClampToEdgeSamplerWithDevice:]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 159, 0, "invalid nil value for '%{public}s'", "device");
  }
  v7 = objc_opt_new();
  [v7 setMinFilter:1];
  [v7 setMagFilter:1];
  [v7 setMipFilter:2];
  [v7 setRAddressMode:0];
  [v7 setSAddressMode:0];
  [v7 setTAddressMode:0];
  id v8 = [v3 newSamplerStateWithDescriptor:v7];

  return v8;
}

- (id)p_createPipelineStateWithRenderPipelineDescriptor:(id)a3 device:(id)a4 setupBindings:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!a5)
  {
    id v36 = 0;
    id v11 = [v9 newRenderPipelineStateWithDescriptor:v8 error:&v36];
    id v13 = v36;
    if (v11) {
      goto LABEL_15;
    }
    goto LABEL_6;
  }
  id v34 = 0;
  id v35 = 0;
  id v11 = [v9 newRenderPipelineStateWithDescriptor:v8 options:3 reflection:&v35 error:&v34];
  v12 = (MTLRenderPipelineReflection *)v35;
  id v13 = v34;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0EE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010896A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0F08);
    }
    id v22 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v22);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Failed to create pipeline reflection object, error %@", v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[CRLMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:]");
    v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:]");
    v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v30, v31, 193, 1, "Failed to create pipeline reflection object, error %@", v13, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m", 193, v13 file lineNumber isFatal description];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v32, v33);
    abort();
  }
  v14 = [(MTLRenderPipelineReflection *)v12 vertexBindings];
  self->_vertexUniformsIndex = [(CRLMetalShader *)self p_indexOfUniformsFromMetalBindings:v14 size:&self->_vertexUniformsSize bufferIndex:&self->_bufferIndex];

  id v15 = [(MTLRenderPipelineReflection *)v12 fragmentBindings];
  self->_fragmentUniformsIndex = [(CRLMetalShader *)self p_indexOfUniformsFromMetalBindings:v15 size:&self->_fragmentUniformsSize bufferIndex:0];

  id v16 = [(MTLRenderPipelineReflection *)v12 fragmentBindings];
  self->_samplerStateIndex = [(CRLMetalShader *)self p_indexOfSamplerStateFromMetalBindings:v16];

  pipelineReflectionObject = self->_pipelineReflectionObject;
  self->_pipelineReflectionObject = v12;

  if (!v11)
  {
LABEL_6:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0F28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108972C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0F48);
    }
    v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v18);
    }
    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_createPipelineStateWithRenderPipelineDescriptor:device:setupBindings:]");
    id v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:v19, v20, 203, 0, "Failed to create pipeline state, error %@", v13 file lineNumber isFatal description];
  }
LABEL_15:

  return v11;
}

- (int64_t)p_indexOfUniformsFromMetalBindings:(id)a3 size:(unint64_t *)a4 bufferIndex:(unint64_t *)a5
{
  id v5 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    id v13 = v6;
    id v14 = 0;
    uint64_t v15 = *(void *)v29;
    unint64_t v26 = 0;
    int64_t v27 = -1;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v5);
        }
        v17 = sub_100246AC8(*(void **)(*((void *)&v28 + 1) + 8 * i), 1, v7, v8, v9, v10, v11, v12, (uint64_t)&OBJC_PROTOCOL___MTLBufferBinding);
        v18 = v17;
        if (v17 && [v17 bufferDataType] == (id)1)
        {
          v19 = [v18 name];
          unsigned int v20 = [v19 isEqualToString:@"uniforms"];

          id v21 = [v18 index];
          int64_t v22 = (int64_t)v21;
          if (v20)
          {
            id v14 = [v18 bufferDataSize];
            int64_t v27 = v22;
          }
          else
          {
            unint64_t v26 = (unint64_t)v21;
          }
        }
      }
      id v13 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
    unint64_t v26 = 0;
    int64_t v27 = -1;
  }
  if (a5) {
    *a5 = v26;
  }
  *a4 = (unint64_t)v14;

  return v27;
}

- (int64_t)p_indexOfSamplerStateFromMetalBindings:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v13) == (id)3)
        {
          uint64_t v9 = [v8 name];
          unsigned int v10 = [v9 isEqualToString:@"mainSampler"];

          if (v10)
          {
            int64_t v11 = (int64_t)[v8 index];
            goto LABEL_12;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int64_t v11 = -1;
LABEL_12:

  return v11;
}

- (void)p_setupPipelineStateWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 vertexLibrary:(id)a6 fragmentLibrary:(id)a7 colorAttachment:(id)a8 velocityAttachment:(id)a9 setupBindings:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = v22;
  v49 = v20;
  v50 = v21;
  if (v19 && v20)
  {
    id v24 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
    uint64_t v25 = v24;
    id v48 = v16;
    if (v21)
    {
      unint64_t v26 = [v24 colorAttachments];
      [v26 setObject:v21 atIndexedSubscript:0];

      if (v23)
      {
        int64_t v27 = [v25 colorAttachments];
        [v27 setObject:v23 atIndexedSubscript:1];
      }
      long long v28 = [(CRLMetalShader *)self name];

      if (v28)
      {
        long long v29 = [(CRLMetalShader *)self name];
        [v25 setLabel:v29];
      }
      id v30 = [v19 newFunctionWithName:v16];
      if (!v30)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        CKRecordID v32 = v17;
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E0FE8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101089848();
        }
        id v35 = v23;
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1008);
        }
        id v36 = v18;
        v42 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v42);
        }
        +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]");
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v43, 283, 0, "invalid nil value for '%{public}s'", "vertexFunction");

        goto LABEL_51;
      }
      [v25 setVertexFunction:v30];
      id v31 = [v20 newFunctionWithName:v17];
      if (v31)
      {
        CKRecordID v32 = v17;
        [v25 setFragmentFunction:v31];
        Swift::String v33 = [(CRLMetalShader *)self p_createPipelineStateWithRenderPipelineDescriptor:v25 device:v18 setupBindings:a10];
        pipelineState = self->_pipelineState;
        self->_pipelineState = v33;

        id v35 = v23;
        if (!a10 || self->_samplerStateIndex < 0)
        {
          id v36 = v18;
        }
        else
        {
          id v36 = v18;
          v37 = +[CRLMetalShader linearClampToEdgeSamplerWithDevice:v18];
          defaultSamplerState = self->_defaultSamplerState;
          self->_defaultSamplerState = v37;
        }
        goto LABEL_51;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      id v47 = v17;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1028);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010898DC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1048);
      }
      id v35 = v23;
      v44 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v44);
      }
      id v36 = v18;
      v45 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]");
      v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v45, v46, 291, 0, "invalid nil value for '%{public}s'", "fragmentFunction");
    }
    else
    {
      id v47 = v17;
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0FA8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010897B4();
      }
      id v35 = v23;
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E0FC8);
      }
      id v36 = v18;
      v41 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v41);
      }
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]");
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 267, 0, "invalid nil value for '%{public}s'", "colorAttachment");
    }
    CKRecordID v32 = v47;
LABEL_51:

    v39 = v48;
    goto LABEL_52;
  }
  id v35 = v22;
  id v36 = v18;
  CKRecordID v32 = v17;
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  v39 = v16;
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E0F68);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101089970();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E0F88);
  }
  v40 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v40);
  }
  uint64_t v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader p_setupPipelineStateWithVertexShader:fragmentShader:device:vertexLibrary:fragmentLibrary:colorAttachment:velocityAttachment:setupBindings:]");
  id v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
  +[CRLAssertionHandler handleFailureInFunction:v25 file:v30 lineNumber:259 isFatal:0 description:"Can't load shaders from nil library"];
LABEL_52:
}

- (CRLMetalShader)initWithDefaultVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7 label:(id)a8 setupBindings:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CRLMetalShader;
  id v21 = [(CRLMetalShader *)&v25 init];
  if (v21)
  {
    id v22 = +[CRLMetalShaderLibraryLoader loadDefaultLibraryWithDevice:v17];
    objc_storeStrong((id *)&v21->_name, a8);
    v21->_vertexUniformsIndex = -1;
    v21->_fragmentUniformsIndex = -1;
    v21->_samplerStateIndex = -1;
    LOBYTE(v24) = a9;
    [(CRLMetalShader *)v21 p_setupPipelineStateWithVertexShader:v15 fragmentShader:v16 device:v17 vertexLibrary:v22 fragmentLibrary:v22 colorAttachment:v18 velocityAttachment:v19 setupBindings:v24];
  }
  return v21;
}

- (id)initDefaultShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  long long v14 = [v13 componentsSeparatedByString:@"_"];
  id v15 = [v14 objectAtIndexedSubscript:0];
  id v16 = [v15 copy];

  LOBYTE(v19) = 1;
  id v17 = [(CRLMetalShader *)self initWithDefaultVertexShader:v13 fragmentShader:v12 device:v11 colorAttachment:v10 velocityAttachment:0 label:v16 setupBindings:v19];

  return v17;
}

- (id)initDefaultTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  id v4 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:@"CRLMetalShaderDefaultTexture_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Texture Shader" setupBindings:v7];
  id v5 = v4;
  if (v4) {
    [(CRLMetalShader *)v4 p_setDefaultVertexUniforms];
  }
  return v5;
}

- (id)initDefaultTextureAndOpacityShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id v6 = a3;
  LOBYTE(v12) = 0;
  uint64_t v7 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:@"CRLMetalShaderDefaultOpacityTexture_FragmentShader" device:v6 colorAttachment:a4 velocityAttachment:0 label:@"Default Texture and Opacity Shader" setupBindings:v12];
  uint64_t v8 = v7;
  if (v7)
  {
    [(CRLMetalShader *)v7 p_setDefaultVertexUniforms];
    *(_OWORD *)&v8->_fragmentUniformsIndex = xmmword_101176E30;
    v8->_samplerStateIndex = 0;
    uint64_t v9 = +[CRLMetalShader linearClampToEdgeSamplerWithDevice:v6];
    defaultSamplerState = v8->_defaultSamplerState;
    v8->_defaultSamplerState = (MTLSamplerState *)v9;
  }
  return v8;
}

- (id)initDefaultTextureAndColorShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id v6 = a3;
  LOBYTE(v12) = 0;
  uint64_t v7 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:@"CRLMetalShaderDefaultTextureAndColor_FragmentShader" device:v6 colorAttachment:a4 velocityAttachment:0 label:@"Default Texture and Color Shader" setupBindings:v12];
  uint64_t v8 = v7;
  if (v7)
  {
    [(CRLMetalShader *)v7 p_setDefaultVertexUniforms];
    *(_OWORD *)&v8->_fragmentUniformsIndex = xmmword_101176E40;
    v8->_samplerStateIndex = 0;
    uint64_t v9 = +[CRLMetalShader linearClampToEdgeSamplerWithDevice:v6];
    defaultSamplerState = v8->_defaultSamplerState;
    v8->_defaultSamplerState = (MTLSamplerState *)v9;
  }
  return v8;
}

- (id)initDefaultMaskedTextureShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  id v4 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:@"CRLMetalShaderDefaultMaskedTexture_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Masked Texture Shader" setupBindings:v7];
  id v5 = v4;
  if (v4)
  {
    [(CRLMetalShader *)v4 p_setDefaultVertexUniforms];
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_101176E50;
  }
  return v5;
}

- (id)initDefaultGaussianBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 halfSizedRadius:(BOOL)a5
{
  if (a5) {
    CFStringRef v6 = @"CRLMetalShaderDefaultHalfSizedRadiusGaussianBlur_FragmentShader";
  }
  else {
    CFStringRef v6 = @"CRLMetalShaderDefaultGaussianBlur_FragmentShader";
  }
  if (a5) {
    CFStringRef v7 = @"Default Gaussain Blur Shader with Radius 5";
  }
  else {
    CFStringRef v7 = @"Default Gaussian Blur Shader with Radius 9";
  }
  LOBYTE(v11) = 0;
  uint64_t v8 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:v6 device:a3 colorAttachment:a4 velocityAttachment:0 label:v7 setupBindings:v11];
  uint64_t v9 = v8;
  if (v8)
  {
    [(CRLMetalShader *)v8 p_setDefaultVertexUniforms];
    *(_OWORD *)&v9->_fragmentUniformsIndex = xmmword_101176E60;
  }
  return v9;
}

- (id)initDefaultTextureMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5
{
  LOBYTE(v6) = 0;
  id result = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultMotionBlurTexture_VertexShader" fragmentShader:@"CRLMetalShaderDefaultMotionBlurTexture_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:a5 label:@"Default Texture Shader with Motion Blur" setupBindings:v6];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_101176E70;
    *((void *)result + 9) = 1;
  }
  return result;
}

- (id)initDefaultTextureAndOpacityMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if (v6) {
    CFStringRef v11 = @"CRLMetalShaderDefaultMotionBlurTexture_VertexShader";
  }
  else {
    CFStringRef v11 = @"CRLMetalShaderDefaultTexture_VertexShader";
  }
  if (v6) {
    CFStringRef v12 = @"CRLMetalShaderDefaultMotionBlurOpacityTexture_FragmentShader";
  }
  else {
    CFStringRef v12 = @"CRLMetalShaderDefaultOpacityTexture_FragmentShader";
  }
  LOBYTE(v20) = 0;
  id v13 = [(CRLMetalShader *)self initWithDefaultVertexShader:v11 fragmentShader:v12 device:v10 colorAttachment:a4 velocityAttachment:a5 label:@"Default Texture and Opacity Shader with Motion Blur" setupBindings:v20];
  long long v14 = v13;
  if (v13)
  {
    uint64_t v15 = 64;
    if (v6) {
      uint64_t v15 = 192;
    }
    int64_t v16 = !v6;
    v13->_vertexUniformsIndex = v16;
    v13->_vertexUniformsSize = v15;
    v13->_fragmentUniformsIndex = v16;
    v13->_bufferIndex = v6;
    *(_OWORD *)&v13->_fragmentUniformsSize = xmmword_101176E80;
    uint64_t v17 = +[CRLMetalShader linearClampToEdgeSamplerWithDevice:v10];
    defaultSamplerState = v14->_defaultSamplerState;
    v14->_defaultSamplerState = (MTLSamplerState *)v17;
  }
  return v14;
}

- (id)initDefaultBlendShaderWithDevice:(id)a3 colorAttachment:(id)a4 velocityAttachment:(id)a5 motionBlur:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if (v6) {
    CFStringRef v11 = @"CRLMetalShaderDefaultMotionBlurTexture_VertexShader";
  }
  else {
    CFStringRef v11 = @"CRLMetalShaderDefaultTexture_VertexShader";
  }
  if (v6) {
    CFStringRef v12 = @"CRLMetalShaderDefaultMotionBlurBlendTexture_FragmentShader";
  }
  else {
    CFStringRef v12 = @"CRLMetalShaderDefaultBlendTexture_FragmentShader";
  }
  if (v6) {
    CFStringRef v13 = @"Default Texture Blending Shader with Motion Blur";
  }
  else {
    CFStringRef v13 = @"Default Texture Blending Shader";
  }
  LOBYTE(v19) = 0;
  long long v14 = [(CRLMetalShader *)self initWithDefaultVertexShader:v11 fragmentShader:v12 device:v10 colorAttachment:a4 velocityAttachment:a5 label:v13 setupBindings:v19];
  uint64_t v15 = v14;
  if (v14)
  {
    if (v6)
    {
      *(_OWORD *)&v14->_vertexUniformsIndex = xmmword_101176E70;
      v14->_bufferIndex = 1;
    }
    else
    {
      [(CRLMetalShader *)v14 p_setDefaultVertexUniforms];
    }
    *(_OWORD *)&v15->_fragmentUniformsIndex = xmmword_101176E90;
    v15->_samplerStateIndex = 0;
    uint64_t v16 = +[CRLMetalShader linearClampToEdgeSamplerWithDevice:v10];
    defaultSamplerState = v15->_defaultSamplerState;
    v15->_defaultSamplerState = (MTLSamplerState *)v16;
  }
  return v15;
}

- (id)initDefaultColorShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  id v6 = a3;
  LOBYTE(v12) = 0;
  CFStringRef v7 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:@"CRLMetalShaderDefaultColor_FragmentShader" device:v6 colorAttachment:a4 velocityAttachment:0 label:@"Default Color Shader" setupBindings:v12];
  uint64_t v8 = v7;
  if (v7)
  {
    [(CRLMetalShader *)v7 p_setDefaultVertexUniforms];
    *(_OWORD *)&v8->_fragmentUniformsIndex = xmmword_101176E40;
    v8->_samplerStateIndex = 0;
    uint64_t v9 = +[CRLMetalShader linearClampToEdgeSamplerWithDevice:v6];
    defaultSamplerState = v8->_defaultSamplerState;
    v8->_defaultSamplerState = (MTLSamplerState *)v9;
  }
  return v8;
}

- (id)initDefaultVelocityCollectionShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v5) = 0;
  id result = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalMotionBlurEffect_Collection_Vertex" fragmentShader:@"CRLMetalMotionBlurEffect_Collection_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Velocity Collection Shader" setupBindings:v5];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_101176EA0;
    *(_OWORD *)((char *)result + 24) = xmmword_101176EB0;
    *((void *)result + 9) = 1;
  }
  return result;
}

- (id)initDefaultVelocityVisualizerShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  id v4 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:@"CRLMetalMotionBlurEffect_Visualizer_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Velocity Visualizer Shader" setupBindings:v7];
  uint64_t v5 = v4;
  if (v4) {
    [(CRLMetalShader *)v4 p_setDefaultVertexUniforms];
  }
  return v5;
}

- (id)initDefaultNeighborMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v7) = 0;
  id v4 = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:@"CRLMetalMotionBlurEffect_Neighbor_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Neighbor Max Shader" setupBindings:v7];
  uint64_t v5 = v4;
  if (v4)
  {
    [(CRLMetalShader *)v4 p_setDefaultVertexUniforms];
    *(_OWORD *)&v5->_fragmentUniformsIndex = xmmword_101176EA0;
  }
  return v5;
}

- (id)initDefaultTileMaxBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v5) = 0;
  id result = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalMotionBlurEffect_Tile_Vertex" fragmentShader:@"CRLMetalMotionBlurEffect_Tile_Fragment" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Tile Max Shader" setupBindings:v5];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_101176EC0;
    *(_OWORD *)((char *)result + 24) = xmmword_101176ED0;
    *((void *)result + 9) = 1;
  }
  return result;
}

- (id)initDefaultSingleDirectionMotionBlurShaderWithDevice:(id)a3 colorAttachment:(id)a4
{
  LOBYTE(v5) = 0;
  id result = [(CRLMetalShader *)self initWithDefaultVertexShader:@"CRLMetalShaderMotionBlurSingleDirection_VertexShader" fragmentShader:@"CRLMetalShaderMotionBlurSingleDirection_FragmentShader" device:a3 colorAttachment:a4 velocityAttachment:0 label:@"Default Single Direction Motion Blur Shader" setupBindings:v5];
  if (result)
  {
    *(_OWORD *)((char *)result + 8) = xmmword_101176EE0;
    *(_OWORD *)((char *)result + 24) = xmmword_101176E30;
    *((void *)result + 9) = 0;
  }
  return result;
}

- (void)p_setDefaultVertexUniforms
{
  *(_OWORD *)&self->_vertexUniformsIndex = xmmword_101176E50;
  self->_bufferIndex = 0;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 bundle:(id)a6 colorAttachment:(id)a7 velocityAttachment:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)CRLMetalShader;
  uint64_t v20 = [(CRLMetalShader *)&v28 init];
  if (v20)
  {
    id v21 = +[CRLMetalShaderLibraryLoader loadLibraryWithDevice:v16 bundle:v17];
    id v22 = [v14 componentsSeparatedByString:@"_"];
    id v23 = [v22 objectAtIndexedSubscript:0];
    uint64_t v24 = (NSString *)[v23 copy];
    name = v20->_name;
    v20->_name = v24;

    v20->_vertexUniformsIndex = -1;
    v20->_fragmentUniformsIndex = -1;
    v20->_samplerStateIndex = -1;
    LOBYTE(v27) = 1;
    [(CRLMetalShader *)v20 p_setupPipelineStateWithVertexShader:v14 fragmentShader:v15 device:v16 vertexLibrary:v21 fragmentLibrary:v21 colorAttachment:v18 velocityAttachment:v19 setupBindings:v27];
  }
  return v20;
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CRLMetalShader;
  id v17 = [(CRLMetalShader *)&v27 init];
  if (v17)
  {
    id v18 = +[CRLMetalShaderLibraryLoader loadLibraryWithDevice:v13 bundle:v14];
    id v19 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v20 = +[CRLMetalShaderLibraryLoader loadLibraryWithDevice:v13 bundle:v19];

    id v21 = [v12 componentsSeparatedByString:@"_"];
    id v22 = [v21 objectAtIndexedSubscript:0];
    id v23 = (NSString *)[v22 copy];
    name = v17->_name;
    v17->_name = v23;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    v17->_samplerStateIndex = -1;
    LOBYTE(v26) = 1;
    [(CRLMetalShader *)v17 p_setupPipelineStateWithVertexShader:@"CRLMetalShaderDefaultTexture_VertexShader" fragmentShader:v12 device:v13 vertexLibrary:v20 fragmentLibrary:v18 colorAttachment:v15 velocityAttachment:v16 setupBindings:v26];
  }
  return v17;
}

- (id)initQuadMotionBlurTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CRLMetalShader;
  id v17 = [(CRLMetalShader *)&v27 init];
  if (v17)
  {
    id v18 = +[CRLMetalShaderLibraryLoader loadLibraryWithDevice:v13 bundle:v14];
    id v19 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v20 = +[CRLMetalShaderLibraryLoader loadLibraryWithDevice:v13 bundle:v19];

    id v21 = [v12 componentsSeparatedByString:@"_"];
    id v22 = [v21 objectAtIndexedSubscript:0];
    id v23 = (NSString *)[v22 copy];
    name = v17->_name;
    v17->_name = v23;

    v17->_vertexUniformsIndex = -1;
    v17->_fragmentUniformsIndex = -1;
    v17->_samplerStateIndex = -1;
    LOBYTE(v26) = 1;
    [(CRLMetalShader *)v17 p_setupPipelineStateWithVertexShader:@"CRLMetalShaderDefaultMotionBlurTexture_VertexShader" fragmentShader:v12 device:v13 vertexLibrary:v20 fragmentLibrary:v18 colorAttachment:v15 velocityAttachment:v16 setupBindings:v26];
  }
  return v17;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6 velocityAttachment:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v16 componentsSeparatedByString:@"_"];
  id v18 = [v17 objectAtIndexedSubscript:0];
  id v19 = [v18 copy];
  LOBYTE(v22) = 1;
  uint64_t v20 = [(CRLMetalShader *)self initWithDefaultVertexShader:v16 fragmentShader:v15 device:v14 colorAttachment:v13 velocityAttachment:v12 label:v19 setupBindings:v22];

  return v20;
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 colorAttachment:(id)a6
{
  return [(CRLMetalShader *)self initCustomShaderWithVertexShader:a3 fragmentShader:a4 device:a5 colorAttachment:a6 velocityAttachment:0];
}

- (id)initQuadTextureShaderWithFragmentShader:(id)a3 device:(id)a4 bundle:(id)a5 colorAttachment:(id)a6
{
  return [(CRLMetalShader *)self initQuadTextureShaderWithFragmentShader:a3 device:a4 bundle:a5 colorAttachment:a6 velocityAttachment:0];
}

- (id)initCustomShaderWithVertexShader:(id)a3 fragmentShader:(id)a4 device:(id)a5 bundle:(id)a6 colorAttachment:(id)a7
{
  return [(CRLMetalShader *)self initCustomShaderWithVertexShader:a3 fragmentShader:a4 device:a5 bundle:a6 colorAttachment:a7 velocityAttachment:0];
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5 samplerState:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  [v10 setRenderPipelineState:self->_pipelineState];
  if (a4)
  {
    if ((self->_vertexUniformsIndex & 0x8000000000000000) == 0) {
      [v10 setVertexBytes:a4 length:self->_vertexUniformsSize atIndex:];
    }
    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1068);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101089B14();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1088);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:]");
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 765, 0, "invalid nil value for '%{public}s'", "vertexBytes");

    if (a5)
    {
LABEL_5:
      if ((self->_fragmentUniformsIndex & 0x8000000000000000) == 0) {
        [v10 setFragmentBytes:a5 length:self->_fragmentUniformsSize atIndex:];
      }
      if (!v11) {
        goto LABEL_37;
      }
LABEL_27:
      if (self->_samplerStateIndex < 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E10E8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010899F8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E1108);
        }
        id v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v18);
        }
        id v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:]");
        uint64_t v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
        +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:775 isFatal:0 description:"Sampler state given but not used."];
      }
      goto LABEL_37;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E10A8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101089A80();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E10C8);
  }
  id v15 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v15);
  }
  id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:samplerState:]");
  id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLMetalShader.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 770, 0, "invalid nil value for '%{public}s'", "fragmentBytes");

  if (v11) {
    goto LABEL_27;
  }
LABEL_37:
  if ((self->_samplerStateIndex & 0x8000000000000000) == 0) {
    [v10 setFragmentSamplerState:v11 atIndex:];
  }
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4 fragmentBytes:(const void *)a5
{
}

- (void)setPipelineStateWithEncoder:(id)a3 vertexBytes:(const void *)a4
{
}

- (void)setPipelineStateWithEncoder:(id)a3 fragmentBytes:(const void *)a4
{
}

- (void)setPipelineStateWithEncoder:(id)a3
{
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)CRLMetalShader;
  id v3 = [(CRLMetalShader *)&v9 description];
  uint64_t v4 = [(CRLMetalShader *)self name];
  uint64_t v5 = (void *)v4;
  CFStringRef v6 = @"Unnamed";
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  uint64_t v7 = +[NSString stringWithFormat:@"%@: %@", v3, v6];

  return v7;
}

- (MTLRenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (MTLRenderPipelineReflection)pipelineReflectionObject
{
  return self->_pipelineReflectionObject;
}

- (unint64_t)bufferIndex
{
  return self->_bufferIndex;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pipelineReflectionObject, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);

  objc_storeStrong((id *)&self->_defaultSamplerState, 0);
}

@end