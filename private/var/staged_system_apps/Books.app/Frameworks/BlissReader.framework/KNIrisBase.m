@interface KNIrisBase
+ (BOOL)isTransition;
+ (id)animationFilter;
+ (id)animationName;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (int)rendererTypeForAnimationContext:(id)a3;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (KNIrisBase)initWithAnimationContext:(id)a3;
- (double)p_angleFromQuadrant:(unint64_t)a3 inRect:(CGRect)a4;
- (double)p_largestDividedAngleInRect:(CGRect)a3;
- (unint64_t)p_setupMetalFadeDataBufferContentsWithOpaqueAttributes:(id)a3 frameRect:(CGRect)a4 openFromCenter:(BOOL)a5 maxRadius:(double)a6 center:(id)a7;
- (unint64_t)p_setupMetalOpaqueDataBufferContentsWithOpaqueAttributes:(id)a3 frameRect:(CGRect)a4 openFromCenter:(BOOL)a5 minRadius:(double)a6 maxRadius:(double)a7 center:(id)a8;
- (void)animationWillBeginWithContext:(id)a3;
- (void)p_setupDataBuffersWithFrameRect:(CGRect)a3 openFromCenter:(BOOL)a4 device:(id)a5;
- (void)p_setupMetalShadersWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNIrisBase

+ (BOOL)isTransition
{
  v2 = +[TSUAssertionHandler currentHandler];
  v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[KNIrisBase isTransition]");
  v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:93 description:@"Should be called on base class!"];

  return 0;
}

- (KNIrisBase)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNIrisBase;
  result = [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
  if (result) {
    result->_numDivisionsPerQuadrant = 10;
  }
  return result;
}

+ (int)animationCategory
{
  return 201;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)animationName
{
  return @"apple:wipe-iris";
}

+ (unint64_t)directionType
{
  return 7;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-trans-iris";
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

- (void)p_setupMetalShadersWithContext:(id)a3
{
  id v4 = a3;
  id v13 = [v4 device];
  id v5 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  id v6 = [v4 pixelFormat];

  [v5 setPixelFormat:v6];
  [v5 setBlendingEnabled:1];
  [v5 setDestinationAlphaBlendFactor:5];
  [v5 setDestinationRGBBlendFactor:5];
  v7 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v13 colorAttachment:v5];
  quadMetalShader = self->_quadMetalShader;
  self->_quadMetalShader = v7;

  v9 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"transitionIrisVertexShader_Fade" fragmentShader:@"transitionIrisFragmentShader_Fade" device:v13 library:@"KeynoteMetalLibrary" colorAttachment:v5];
  fadeMetalShader = self->_fadeMetalShader;
  self->_fadeMetalShader = v9;

  v11 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"transitionIrisVertexShader_Opaque" fragmentShader:@"transitionIrisFragmentShader_Opaque" device:v13 library:@"KeynoteMetalLibrary" colorAttachment:v5];
  opaqueMetalShader = self->_opaqueMetalShader;
  self->_opaqueMetalShader = v11;
}

- (double)p_angleFromQuadrant:(unint64_t)a3 inRect:(CGRect)a4
{
  TSDAngleFromDelta();
  return result;
}

- (double)p_largestDividedAngleInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[KNIrisBase p_angleFromQuadrant:inRect:](self, "p_angleFromQuadrant:inRect:", 0);
  -[KNIrisBase p_angleFromQuadrant:inRect:](self, "p_angleFromQuadrant:inRect:", 1, x, y, width, height);
  -[KNIrisBase p_angleFromQuadrant:inRect:](self, "p_angleFromQuadrant:inRect:", 2, x, y, width, height);
  TSDDistanceBetweenAnglesInRadians();
  double v9 = v8;
  TSDDistanceBetweenAnglesInRadians();
  if (v9 >= v10) {
    double v10 = v9;
  }
  return v10 / (double)self->_numDivisionsPerQuadrant;
}

- (unint64_t)p_setupMetalOpaqueDataBufferContentsWithOpaqueAttributes:(id)a3 frameRect:(CGRect)a4 openFromCenter:(BOOL)a5 minRadius:(double)a6 maxRadius:(double)a7 center:(id)a8
{
  float var1 = a8.var1;
  float var0 = a8.var0;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v18 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_132440;
  v22[3] = &unk_459D38;
  *(CGFloat *)&v22[6] = x;
  *(CGFloat *)&v22[7] = y;
  *(CGFloat *)&v22[8] = width;
  *(CGFloat *)&v22[9] = height;
  *(double *)&v22[10] = a6;
  *(double *)&v22[11] = a7;
  float v23 = var0;
  float v24 = var1;
  BOOL v25 = a5;
  v22[4] = self;
  v22[5] = &v26;
  v19 = objc_retainBlock(v22);
  [(TSDMTLDataBuffer *)self->_opaqueMetalDataBuffer updateMetalDataBufferAttributes:v18 withBlock:v19];
  unint64_t v20 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v20;
}

- (unint64_t)p_setupMetalFadeDataBufferContentsWithOpaqueAttributes:(id)a3 frameRect:(CGRect)a4 openFromCenter:(BOOL)a5 maxRadius:(double)a6 center:(id)a7
{
  float var1 = a7.var1;
  float var0 = a7.var0;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v15 = a3;
  uint64_t v22 = 0;
  float v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1329E0;
  v19[3] = &unk_459D60;
  *(CGFloat *)&v19[6] = x;
  *(CGFloat *)&v19[7] = y;
  *(CGFloat *)&v19[8] = width;
  *(CGFloat *)&v19[9] = height;
  *(double *)&v19[10] = a6;
  float v20 = var0;
  float v21 = var1;
  v19[4] = self;
  v19[5] = &v22;
  v16 = objc_retainBlock(v19);
  [(TSDMTLDataBuffer *)self->_fadeMetalDataBuffer updateMetalDataBufferAttributes:v15 withBlock:v16];
  unint64_t v17 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v17;
}

- (void)p_setupDataBuffersWithFrameRect:(CGRect)a3 openFromCenter:(BOOL)a4 device:(id)a5
{
  BOOL v54 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  if (self->_initializedBuffers)
  {
    v11 = +[TSUAssertionHandler currentHandler];
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:327 description:@"We already initialized our data buffers!"];
  }
  if ([(id)objc_opt_class() isTransition])
  {
    v14 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v10, x, y, width, height, TSDRectUnit[0], TSDRectUnit[1], TSDRectUnit[2], TSDRectUnit[3]);
    quadMetalDataBuffer = self->_quadMetalDataBuffer;
    self->_quadMetalDataBuffer = v14;
  }
  double v16 = sqrt(width * width + height * height) * 0.5;
  -[KNIrisBase p_largestDividedAngleInRect:](self, "p_largestDividedAngleInRect:", x, y, width, height);
  long double v18 = v16 * 1.15384615 / cos(v17 * 0.5);
  TSDRectWithSize();
  TSDCenterOfRect();
  float v20 = v19;
  float v22 = v21;
  unint64_t v23 = (8 * self->_numDivisionsPerQuadrant) | 2;
  uint64_t v24 = kTSDGPUShaderAttributePosition;
  +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributePosition bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
  v26 = id v25 = v10;
  uint64_t v27 = kTSDGPUShaderAttributeTexCoord;
  uint64_t v28 = +[TSDGPUDataBufferAttribute attributeWithName:kTSDGPUShaderAttributeTexCoord bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
  +[TSDGPUDataBufferAttribute attributeWithName:@"RadiusType" bufferUsage:35044 dataType:5 normalized:0 componentCount:1];
  v52 = (void *)v28;
  v53 = (void *)v26;
  v57[0] = v26;
  v51 = v57[1] = v28;
  v57[2] = v51;
  uint64_t v29 = +[NSArray arrayWithObjects:v57 count:3];
  v30 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:v29 vertexCount:v23 indexElementCount:0 device:v25];
  opaqueMetalDataBuffer = self->_opaqueMetalDataBuffer;
  self->_opaqueMetalDataBuffer = v30;

  [(TSDMTLDataBuffer *)self->_opaqueMetalDataBuffer setMetalDrawMode:4];
  uint64_t v32 = +[TSDGPUDataBufferAttribute attributeWithName:v24 bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
  v33 = +[TSDGPUDataBufferAttribute attributeWithName:v27 bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
  v34 = +[TSDGPUDataBufferAttribute attributeWithName:@"RadiusType" bufferUsage:35044 dataType:5 normalized:0 componentCount:1];
  v50 = (void *)v32;
  v56[0] = v32;
  v56[1] = v33;
  v56[2] = v34;
  v35 = +[NSArray arrayWithObjects:v56 count:3];
  v55 = v25;
  v36 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:v35 vertexCount:v23 indexElementCount:0 device:v25];
  fadeMetalDataBuffer = self->_fadeMetalDataBuffer;
  self->_fadeMetalDataBuffer = v36;

  [(TSDMTLDataBuffer *)self->_fadeMetalDataBuffer setMetalDrawMode:4];
  *(float *)&double v38 = v20;
  *(float *)&double v39 = v22;
  unint64_t v40 = -[KNIrisBase p_setupMetalOpaqueDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:minRadius:maxRadius:center:](self, "p_setupMetalOpaqueDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:minRadius:maxRadius:center:", v29, v54, x, y, width, height, v16, (double)v18, v38, v39);
  *(float *)&double v41 = v20;
  *(float *)&double v42 = v22;
  unint64_t v43 = -[KNIrisBase p_setupMetalFadeDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:maxRadius:center:](self, "p_setupMetalFadeDataBufferContentsWithOpaqueAttributes:frameRect:openFromCenter:maxRadius:center:", v35, v54, x, y, width, height, (double)v18, v41, v42);
  if (v40 != v23)
  {
    v44 = +[TSUAssertionHandler currentHandler];
    v45 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:]");
    v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
    [v44 handleFailureInFunction:v45, v46, 399, @"Wrong number of opaque vertices! expected %lu, ended up with %lu", v40, v23 file lineNumber description];
  }
  if (v43 != v23)
  {
    v47 = +[TSUAssertionHandler currentHandler];
    v48 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:]");
    v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
    [v47 handleFailureInFunction:v48, v49, 400, @"Wrong number of fade vertices! expected %lu, ended up with %lu", v43, v23 file lineNumber description];
  }
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 textures];
  id v6 = (char *)[v4 direction];
  v7 = [v5 firstObject];
  double v8 = [v4 metalContext];
  [(KNIrisBase *)self p_setupMetalShadersWithContext:v8];

  uint64_t v9 = (v6 == &stru_20.segname[2]) ^ self->_isBuildOut;
  [v7 frame];
  TSDRectWithSize();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  long double v18 = [v4 metalContext];
  double v19 = [v18 device];
  -[KNIrisBase p_setupDataBuffersWithFrameRect:openFromCenter:device:](self, "p_setupDataBuffersWithFrameRect:openFromCenter:device:", v9, v19, v11, v13, v15, v17);

  [(KNAnimationEffect *)self mvpMatrixWithContext:v4];
  float32x4_t v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
  [v7 frame];
  TSDRectWithSize();
  TSDCenterOfRect();
  v21.f64[1] = v20;
  float32x2_t v22 = vcvt_f32_f64(v21);
  uint64_t v23 = 64;
  uint64_t v24 = 304;
  uint64_t v25 = 544;
  uint64_t v26 = 3;
  do
  {
    uint64_t v27 = (float32x4_t *)((char *)self + v23);
    float32x4_t *v27 = v30;
    v27[1] = v30;
    v27[2] = v30;
    v27[3] = v30;
    uint64_t v28 = (float32x4_t *)((char *)self + v24);
    *uint64_t v28 = v30;
    v28[1] = v30;
    v28[2] = v30;
    v28[3] = v30;
    *(float32x2_t *)v28[4].f32 = v22;
    *(float32x2_t *)v27[4].f32 = v22;
    uint64_t v29 = (float32x2_t *)((char *)self + v25);
    v25 += 24;
    v29[1] = v22;
    v24 += 80;
    v23 += 80;
    v29[2].i8[0] = v9;
    --v26;
  }
  while (v26);
  *(float32x4_t *)self->_anon_280 = v30;
  *(float32x4_t *)&self->_anon_280[16] = v30;
  *(float32x4_t *)&self->_anon_280[32] = v30;
  *(float32x4_t *)&self->_anon_280[48] = v30;
}

- (void)renderFrameWithContext:(id)a3
{
  id v53 = a3;
  id v4 = [v53 textures];
  id v5 = (char *)[v53 direction];
  [v53 percent];
  if ((unint64_t)[v4 count] < 2)
  {
    v51 = 0;
  }
  else
  {
    v51 = [v4 objectAtIndexedSubscript:0];
  }
  id v6 = [v4 lastObject];
  TSUSineMap();
  double v8 = v7;
  if (v5 == &stru_20.segname[1])
  {
    TSUSineMap();
    double v8 = v9;
  }
  BOOL v47 = v5 == &stru_20.segname[2];
  BOOL isBuildOut = self->_isBuildOut;
  [v6 frame];
  double v12 = v11;
  double v14 = v13;
  double v15 = [v53 metalContext];
  uint64_t v16 = [v15 device];
  uint64_t v17 = [v15 commandBuffer];
  v52 = [v15 passDescriptor];
  long double v18 = [v15 renderEncoder];
  v50 = (void *)v16;
  if (!v16)
  {
    double v19 = +[TSUAssertionHandler currentHandler];
    float64_t v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]");
    +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
    v22 = uint64_t v21 = v17;
    [v19 handleFailureInFunction:v20 file:v22 lineNumber:478 description:@"invalid nil value for '%s'", "device"];

    uint64_t v17 = v21;
  }
  v49 = (void *)v17;
  if (!v17)
  {
    uint64_t v23 = +[TSUAssertionHandler currentHandler];
    uint64_t v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]");
    uint64_t v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
    [v23 handleFailureInFunction:v24 file:v25 lineNumber:479 description:@"invalid nil value for '%s'", "commandBuffer"];
  }
  if (v52)
  {
    if (v18) {
      goto LABEL_12;
    }
  }
  else
  {
    double v39 = +[TSUAssertionHandler currentHandler];
    unint64_t v40 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]");
    double v41 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
    [v39 handleFailureInFunction:v40 file:v41 lineNumber:480 description:@"invalid nil value for '%s'", "passDescriptor"];

    if (v18) {
      goto LABEL_12;
    }
  }
  double v42 = +[TSUAssertionHandler currentHandler];
  unint64_t v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNIrisBase renderFrameWithContext:]");
  v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionIris.m"];
  [v42 handleFailureInFunction:v43 file:v44 lineNumber:481 description:@"invalid nil value for '%s'", "renderEncoder"];

LABEL_12:
  uint64_t v26 = [v6 metalTextureWithContext:v15];
  uint64_t v27 = [v51 metalTextureWithContext:v15];
  uint64_t v28 = (void *)v27;
  if (v26)
  {
    double v29 = sqrt(v14 * v14 + v12 * v12) * 0.5;
    int v30 = v47 ^ isBuildOut;
    double v46 = v8 * (v29 * 1.15384615) + v29 * -0.153846154;
    double v48 = v8 * (v29 * 1.15384615);
    if (v27)
    {
      [(TSDMetalShader *)self->_quadMetalShader setPipelineStateWithEncoder:v18 vertexBytes:self->_anon_280];
      [v18 setFragmentTexture:v28 atIndex:0];
      [(TSDMTLDataBuffer *)self->_quadMetalDataBuffer drawWithEncoder:v18 atIndex:0];
    }
    [v18 setFragmentTexture:v26 atIndex:0];
    v31 = [v53 metalContext];
    id v32 = [v31 currentBuffer];

    v33.f64[0] = v46;
    v33.f64[1] = v48;
    float32x2_t v45 = vcvt_f32_f64(v33);
    *(float32x2_t *)&self->_anon_40[80 * (void)v32 + 72] = v45;
    [v6 singleTextureOpacity];
    *(float *)&double v34 = v34;
    v35 = &self->_anon_220[24 * (void)v32];
    *((_DWORD *)v35 + 5) = LODWORD(v34);
    *(float32x2_t *)v35 = v45;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_fadeMetalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v18, &self->_anon_40[80 * (void)v32]);
    [(TSDMTLDataBuffer *)self->_fadeMetalDataBuffer drawWithEncoder:v18 atIndex:0];
    double v36 = v46;
    if (!v30) {
      double v36 = v48;
    }
    *(float *)&unsigned int v37 = v36;
    *(void *)&self->_anon_130[80 * (void)v32 + 72] = __PAIR64__(v45.u32[1], v37);
    [v6 singleTextureOpacity];
    *(float *)&double v38 = v38;
    self->_opaqueFragmentInput[(void)v32].Opacitdouble y = *(float *)&v38;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:fragmentBytes:](self->_opaqueMetalShader, "setPipelineStateWithEncoder:vertexBytes:fragmentBytes:", v18, &self->_anon_130[80 * (void)v32]);
    [(TSDMTLDataBuffer *)self->_opaqueMetalDataBuffer drawWithEncoder:v18 atIndex:0];
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a8 <= 0x174876E7FFLL && a7)
  {
    double v11 = [*a3 objectForKeyedSubscript:@"KNTransitionAttributesDirection" a4, a5, *(void *)&a6, a7];
    if (v11)
    {
    }
    else
    {
      double v12 = [*a3 objectForKeyedSubscript:@"KNBuildAttributesDirection"];

      if (!v12) {
        return;
      }
    }
    if (a6 == 3)
    {
      uint64_t v21 = @"KNTransitionAttributesDirection";
      double v13 = [*a3 objectForKeyedSubscript:];
      double v14 = (uint32_t *)[v13 unsignedIntegerValue];

      if (v14 == &stru_68.reserved1) {
        uint64_t v15 = 41;
      }
      else {
        uint64_t v15 = 42;
      }
    }
    else
    {
      uint64_t v21 = @"KNBuildAttributesDirection";
      uint64_t v16 = [*a3 objectForKeyedSubscript:];
      uint64_t v17 = (uint32_t *)[v16 unsignedIntegerValue];

      if (v17 == &stru_68.reserved1) {
        uint64_t v15 = 41;
      }
      else {
        uint64_t v15 = 42;
      }
      if (a6 == 2) {
        uint64_t v15 = sub_133B34(v15);
      }
    }
    id v18 = [*a3 mutableCopy];
    double v19 = +[NSNumber numberWithUnsignedInteger:v15];
    [v18 setObject:v19 forKeyedSubscript:v21];

    id v20 = v18;
    *a3 = v20;
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a8 <= 0x174876E7FFLL && a7)
  {
    double v11 = [*a3 objectForKeyedSubscript:@"direction" a4, a5, *(void *)&a6, a7];

    if (v11)
    {
      double v12 = [*a3 objectForKeyedSubscript:@"direction"];
      double v13 = (char *)[v12 unsignedIntegerValue];

      if (a6 == 2) {
        double v13 = (char *)sub_133B34((uint64_t)v13);
      }
      uint64_t v14 = 42;
      if (v13 == &stru_20.segname[2]) {
        uint64_t v14 = 173;
      }
      if (v13 == &stru_20.segname[1]) {
        uint64_t v15 = 172;
      }
      else {
        uint64_t v15 = v14;
      }
      id v16 = [*a3 mutableCopy];
      uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v15];
      [v16 setObject:v17 forKeyedSubscript:@"direction"];

      id v18 = v16;
      *a3 = v18;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeMetalDataBuffer, 0);
  objc_storeStrong((id *)&self->_fadeMetalShader, 0);
  objc_storeStrong((id *)&self->_opaqueMetalDataBuffer, 0);
  objc_storeStrong((id *)&self->_opaqueMetalShader, 0);
  objc_storeStrong((id *)&self->_quadMetalDataBuffer, 0);

  objc_storeStrong((id *)&self->_quadMetalShader, 0);
}

@end