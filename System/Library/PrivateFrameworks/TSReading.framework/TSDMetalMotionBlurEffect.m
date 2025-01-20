@interface TSDMetalMotionBlurEffect
- (BOOL)isSingleObject;
- (CATransform3D)adjustTransformForMotionBlurBuffer:(SEL)a3;
- (CGSize)p_squashedVelocityFramebufferSize;
- (CGSize)p_updateMaxVelocityInShadersWithScale:(double)a3 isColorFBO:(BOOL)a4;
- (CGSize)p_velocityFramebufferSize;
- (CGSize)p_velocityFramebufferTextureScale;
- (CGSize)velocityScale;
- (CGSize)velocityScaleForColorFBO:(BOOL)a3;
- (TSDMetalMotionBlurEffect)initWithFramebufferSize:(CGSize)a3 slideSize:(CGSize)a4 randomGenerator:(id)a5 metalContext:(id)a6;
- (double)framebufferScale;
- (double)motionBlurStrength;
- (id)bindColorAndVelocityWithMetalContext:(id)a3 shouldFillBackground:(BOOL)a4;
- (id)colorAndVelocityBlendingShader;
- (id)colorAndVelocityShader;
- (int64_t)debugDrawMode;
- (void)drawResultWithWorkingRenderEncoder:(id)a3 destinationRenderEncoder:(id)a4;
- (void)drawResultWithWorkingRenderEncoder:(id)a3 destinationRenderEncoder:(id)a4 opacity:(double)a5;
- (void)p_blitIntoVelocityTexture;
- (void)p_debugDrawModeColorBufferWithEncoder:(id)a3;
- (void)p_debugDrawModeVelocityBufferDilatedWithEncoder:(id)a3;
- (void)p_debugDrawModeVelocityBufferWithEncoder:(id)a3;
- (void)p_dilateVelocityTexture;
- (void)p_drawWithEncoder:(id)a3 opacity:(double)a4;
- (void)p_setupBuffers;
- (void)p_setupRenderPasses;
- (void)p_setupShaders;
- (void)p_setupTextures;
- (void)setDebugDrawMode:(int64_t)a3;
- (void)setFramebufferScale:(double)a3;
- (void)setIsSingleObject:(BOOL)a3;
- (void)setMotionBlurStrength:(double)a3;
- (void)setupMotionBlurEffectIfNecessary;
@end

@implementation TSDMetalMotionBlurEffect

- (TSDMetalMotionBlurEffect)initWithFramebufferSize:(CGSize)a3 slideSize:(CGSize)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  double width = a4.width;
  double height = a3.height;
  double v10 = a3.width;
  id v12 = a5;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)TSDMetalMotionBlurEffect;
  v14 = [(TSDMetalMotionBlurEffect *)&v33 init];
  if (v14)
  {
    double v15 = TSDMultiplySizeScalar(v10, height, 1.2);
    v14->_framebufferSize.double width = TSDFlooredSize(v15);
    v14->_framebufferSize.double height = v16;
    v14->_slideSize.double width = TSDFlooredSize(width);
    v14->_slideSize.double height = v17;
    v14->_isSingleObject = 1;
    v14->_double motionBlurStrength = 1.0;
    v18 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v19 = [v18 objectForKey:@"MotionBlurStrength"];

    if (v19)
    {
      [v19 doubleValue];
      v14->_double motionBlurStrength = motionBlurStrength;
    }
    else
    {
      double motionBlurStrength = v14->_motionBlurStrength;
    }
    if (motionBlurStrength != *(double *)&s_previousMotionBlurStrength)
    {
      s_previousMotionBlurStrength = *(void *)&motionBlurStrength;
      double v32 = motionBlurStrength;
      v31 = @"MotionBlurStrength";
      TSULogErrorInFunction();
    }
    v14->_double framebufferScale = 1.0;
    v21 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", v31, *(void *)&v32);
    v22 = [v21 objectForKey:@"TSDGLMotionBlurEffectFramebufferScale"];

    if (v22)
    {
      [v22 doubleValue];
      v14->_double framebufferScale = framebufferScale;
    }
    else
    {
      double framebufferScale = v14->_framebufferScale;
    }
    if (framebufferScale != *(double *)&s_previousFramebufferScale)
    {
      s_previousFramebufferScale = *(void *)&framebufferScale;
      TSULogErrorInFunction();
    }
    if (!v12)
    {
      v24 = [MEMORY[0x263F7C7F0] currentHandler];
      v25 = [NSString stringWithUTF8String:"-[TSDMetalMotionBlurEffect initWithFramebufferSize:slideSize:randomGenerator:metalContext:]"];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m"];
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 152, @"invalid nil value for '%s'", "randomGenerator");
    }
    objc_storeStrong((id *)&v14->_randomGenerator, a5);
    if (!v13)
    {
      v27 = [MEMORY[0x263F7C7F0] currentHandler];
      v28 = [NSString stringWithUTF8String:"-[TSDMetalMotionBlurEffect initWithFramebufferSize:slideSize:randomGenerator:metalContext:]"];
      v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m"];
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 155, @"invalid nil value for '%s'", "metalContext");
    }
    objc_storeStrong((id *)&v14->_metalContext, a6);
  }
  return v14;
}

- (void)setMotionBlurStrength:(double)a3
{
  self->_double motionBlurStrength = a3;
  [(TSDMetalMotionBlurEffect *)self p_updateMaxVelocityInShadersWithScale:0 isColorFBO:1.0];
}

- (CGSize)velocityScaleForColorFBO:(BOOL)a3
{
  double v3 = 0.2;
  double v4 = 0.2;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)velocityScale
{
  [(TSDMetalMotionBlurEffect *)self velocityScaleForColorFBO:0];
  double v3 = 1.0 / v2;
  double v5 = 1.0 / v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (CGSize)p_updateMaxVelocityInShadersWithScale:(double)a3 isColorFBO:(BOOL)a4
{
  [(TSDMetalMotionBlurEffect *)self velocityScaleForColorFBO:a4];
  double v8 = TSDMultiplySizeScalar(v6, v7, a3);
  double v10 = v9;
  [(TSDMetalMotionBlurEffect *)self motionBlurStrength];
  double v12 = TSDMultiplySizeScalar(v8, v10, v11);
  double v14 = TSDMultiplySizeScalar(v12, v13, 0.5);

  double v16 = TSDMultiplySizeScalar(v14, v15, 0.5);
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CATransform3D)adjustTransformForMotionBlurBuffer:(SEL)a3
{
  memset(&v15, 0, sizeof(v15));
  CATransform3DMakeTranslation(&v15, (self->_framebufferSize.width - self->_slideSize.width) * 0.5, (self->_framebufferSize.height - self->_slideSize.height) * 0.5, 0.0);
  memset(&v14, 0, sizeof(v14));
  CATransform3DMakeScale(&v14, 0.833333333, 0.833333333, 1.0);
  CATransform3D a = v15;
  CATransform3D v11 = v14;
  CATransform3DConcat(&v13, &a, &v11);
  long long v6 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&a.m33 = v6;
  long long v7 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&a.m43 = v7;
  long long v8 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&a.m13 = v8;
  long long v9 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&a.m23 = v9;
  return CATransform3DConcat(retstr, &v13, &a);
}

- (id)bindColorAndVelocityWithMetalContext:(id)a3 shouldFillBackground:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_storeStrong((id *)&self->_metalContext, a3);
  long long v8 = [(TSDMetalContext *)self->_metalContext commandQueue];
  long long v9 = [v8 commandBuffer];
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = v9;

  [(TSDMetalMotionBlurEffect *)self setupMotionBlurEffectIfNecessary];
  if (v4)
  {
    CATransform3D v11 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    double v12 = [v11 objectAtIndexedSubscript:0];
    objc_msgSend(v12, "setClearColor:", 1.0, 0.0, 0.0, 1.0);
  }
  CATransform3D v13 = [(MTLCommandBuffer *)self->_currentCommandBuffer renderCommandEncoderWithDescriptor:self->_colorAndVelocityPassDescriptor];
  if (v4)
  {
    CATransform3D v14 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    CATransform3D v15 = [v14 objectAtIndexedSubscript:0];
    objc_msgSend(v15, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  }

  return v13;
}

- (id)colorAndVelocityShader
{
  colorAndVelocityShader = self->_colorAndVelocityShader;
  if (!colorAndVelocityShader)
  {
    [(TSDMetalMotionBlurEffect *)self setupMotionBlurEffectIfNecessary];
    colorAndVelocityShader = self->_colorAndVelocityShader;
  }

  return colorAndVelocityShader;
}

- (id)colorAndVelocityBlendingShader
{
  colorAndVelocityBlendingShader = self->_colorAndVelocityBlendingShader;
  if (!colorAndVelocityBlendingShader)
  {
    [(TSDMetalMotionBlurEffect *)self setupMotionBlurEffectIfNecessary];
    colorAndVelocityBlendingShader = self->_colorAndVelocityBlendingShader;
  }

  return colorAndVelocityBlendingShader;
}

- (void)drawResultWithWorkingRenderEncoder:(id)a3 destinationRenderEncoder:(id)a4
{
}

- (void)drawResultWithWorkingRenderEncoder:(id)a3 destinationRenderEncoder:(id)a4 opacity:(double)a5
{
  id v20 = a3;
  id v8 = a4;
  if (!self->_randomGenerator)
  {
    long long v9 = [MEMORY[0x263F7C7F0] currentHandler];
    double v10 = [NSString stringWithUTF8String:"-[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:opacity:]"];
    CATransform3D v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 251, @"invalid nil value for '%s'", "_randomGenerator");
  }
  double v12 = v20;
  if (!v20)
  {
    CATransform3D v13 = [MEMORY[0x263F7C7F0] currentHandler];
    CATransform3D v14 = [NSString stringWithUTF8String:"-[TSDMetalMotionBlurEffect drawResultWithWorkingRenderEncoder:destinationRenderEncoder:opacity:]"];
    CATransform3D v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 252, @"invalid nil value for '%s'", "workingRenderEncoder");

    double v12 = 0;
  }
  [v12 endEncoding];
  uint64_t v16 = [(MTLTexture *)self->_combinedTextureColor1 width];
  if (v16 == [(MTLTexture *)self->_colorTexture1 width])
  {
    uint64_t v17 = [(MTLTexture *)self->_combinedTextureColor1 height];
    BOOL v18 = v17 == [(MTLTexture *)self->_colorTexture1 height];
  }
  else
  {
    BOOL v18 = 0;
  }
  if ([(TSDMetalMotionBlurEffect *)self debugDrawMode] != 1) {
    [(TSDMetalMotionBlurEffect *)self p_blitIntoVelocityTexture];
  }
  if (!v18) {
    [(TSDMetalMotionBlurEffect *)self p_blitIntoColorFramebuffer];
  }
  switch([(TSDMetalMotionBlurEffect *)self debugDrawMode])
  {
    case 0:
      [(TSDMetalMotionBlurEffect *)self p_dilateVelocityTexture];
      goto LABEL_14;
    case 1:
      [(TSDMetalMotionBlurEffect *)self p_debugDrawModeColorBufferWithEncoder:v8];
      break;
    case 2:
      [(TSDMetalMotionBlurEffect *)self p_debugDrawModeVelocityBufferWithEncoder:v8];
      break;
    case 3:
      [(TSDMetalMotionBlurEffect *)self p_dilateVelocityTexture];
      [(TSDMetalMotionBlurEffect *)self p_debugDrawModeVelocityBufferDilatedWithEncoder:v8];
      break;
    case 4:
LABEL_14:
      [(TSDMetalMotionBlurEffect *)self p_drawWithEncoder:v8 opacity:a5];
      break;
    default:
      break;
  }
  currentCommandBuffer = self->_currentCommandBuffer;
  self->_currentCommandBuffer = 0;
}

- (CGSize)p_velocityFramebufferSize
{
  double v2 = TSDCeilSize(self->_framebufferSize.width * 0.03125);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)p_velocityFramebufferTextureScale
{
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferSize];
  double v6 = 1.0 / (TSDMultiplySizeScalar(v3, v4, 32.0) / self->_framebufferSize.width);
  double v7 = 1.0 / (v5 / self->_framebufferSize.height);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (CGSize)p_squashedVelocityFramebufferSize
{
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferSize];
  double height = self->_framebufferSize.height;
  result.double height = height;
  result.double width = v3;
  return result;
}

- (void)p_debugDrawModeColorBufferWithEncoder:(id)a3
{
  float64x2_t v7 = 0uLL;
  float64x2_t framebufferSize = (float64x2_t)self->_framebufferSize;
  float64x2_t v9 = (float64x2_t)xmmword_22383A500;
  id v4 = a3;
  [v4 setViewport:&v7];
  float64x2_t v13 = 0u;
  float64x2_t v14 = 0u;
  float64x2_t v11 = 0u;
  float64x2_t v12 = 0u;
  float64x2_t v9 = 0u;
  float64x2_t v10 = 0u;
  float64x2_t v7 = 0u;
  float64x2_t framebufferSize = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v7, 0.0, self->_framebufferSize.width, 0.0, self->_framebufferSize.height, -1.0, 1.0);
  v6[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v7), framebufferSize);
  v6[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10);
  v6[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
  v6[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v14);
  int v5 = 1065353216;
  [(TSDMetalShader *)self->_defaultTextureShader setPipelineStateWithEncoder:v4 vertexBytes:v6 fragmentBytes:&v5];
  [v4 setFragmentTexture:self->_combinedTextureColor1 atIndex:0];
  [(TSDMTLDataBuffer *)self->_FBODataBufferFlipped drawWithEncoder:v4 atIndex:[(TSDMetalShader *)self->_defaultTextureShader bufferIndex]];
}

- (void)p_debugDrawModeVelocityBufferWithEncoder:(id)a3
{
  float64x2_t v14 = 0u;
  float64x2_t v15 = 0u;
  float64x2_t v12 = 0u;
  float64x2_t v13 = 0u;
  float64x2_t v10 = 0u;
  float64x2_t v11 = 0u;
  float64x2_t v8 = 0u;
  float64x2_t v9 = 0u;
  double width = self->_framebufferSize.width;
  double height = self->_framebufferSize.height;
  id v6 = a3;
  TSDTransform3DMakeOrtho((uint64_t)&v8, 0.0, width, 0.0, height, -1.0, 1.0);
  v7[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9);
  v7[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v11);
  v7[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), v13);
  v7[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v15);
  [(TSDMetalShader *)self->_velocityVisualizerShader setPipelineStateWithEncoder:v6 vertexBytes:v7];
  [v6 setFragmentTexture:self->_combinedTextureVelocity atIndex:0];
  [(TSDMTLDataBuffer *)self->_FBODataBufferFlipped drawWithEncoder:v6 atIndex:[(TSDMetalShader *)self->_velocityVisualizerShader bufferIndex]];
}

- (void)p_debugDrawModeVelocityBufferDilatedWithEncoder:(id)a3
{
  float64x2_t v14 = 0u;
  float64x2_t v15 = 0u;
  float64x2_t v12 = 0u;
  float64x2_t v13 = 0u;
  float64x2_t v10 = 0u;
  float64x2_t v11 = 0u;
  float64x2_t v8 = 0u;
  float64x2_t v9 = 0u;
  double width = self->_framebufferSize.width;
  double height = self->_framebufferSize.height;
  id v6 = a3;
  TSDTransform3DMakeOrtho((uint64_t)&v8, 0.0, width, 0.0, height, -1.0, 1.0);
  v7[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9);
  v7[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v11);
  v7[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), v13);
  v7[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v15);
  [(TSDMetalShader *)self->_velocityVisualizerShader setPipelineStateWithEncoder:v6 vertexBytes:v7];
  [v6 setFragmentTexture:self->_velocityTexture1 atIndex:0];
  [(TSDMTLDataBuffer *)self->_FBODataBuffer drawWithEncoder:v6 atIndex:[(TSDMetalShader *)self->_velocityVisualizerShader bufferIndex]];
}

- (void)p_blitIntoVelocityTexture
{
  if (!self->_velocityTextureSquashed)
  {
    double v3 = [MEMORY[0x263F7C7F0] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[TSDMetalMotionBlurEffect p_blitIntoVelocityTexture]"];
    int v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 382, @"invalid nil value for '%s'", "_velocityTextureSquashed");
  }
  if (!self->_velocitySquashedFBODataBuffer)
  {
    id v6 = [MEMORY[0x263F7C7F0] currentHandler];
    float64x2_t v7 = [NSString stringWithUTF8String:"-[TSDMetalMotionBlurEffect p_blitIntoVelocityTexture]"];
    float64x2_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMetalMotionBlurEffect.m"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 383, @"invalid nil value for '%s'", "_velocitySquashedFBODataBuffer");
  }
  [(TSDMetalMotionBlurEffect *)self p_squashedVelocityFramebufferSize];
  double v10 = v9;
  double v12 = v11;
  float64x2_t v13 = [(MTLCommandBuffer *)self->_currentCommandBuffer renderCommandEncoderWithDescriptor:self->_tileHorizontalPassDescriptor];
  float64x2_t v49 = 0uLL;
  v50.f64[0] = v10;
  v50.f64[1] = v12;
  float64x2_t v51 = (float64x2_t)xmmword_22383A500;
  [v13 setViewport:&v49];
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferTextureScale];
  double v15 = v14;
  double v17 = v16;
  float64x2_t v55 = 0u;
  float64x2_t v56 = 0u;
  float64x2_t v53 = 0u;
  float64x2_t v54 = 0u;
  float64x2_t v51 = 0u;
  float64x2_t v52 = 0u;
  float64x2_t v49 = 0u;
  float64x2_t v50 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v49, 0.0, v10, 0.0, v12, -1.0, 1.0);
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  float32x4_t v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v49), v50);
  float32x4_t v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v51), v52);
  float32x4_t v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v53), v54);
  float32x4_t v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v55), v56);
  __asm { FMOV            V1.2D, #1.0 }
  float32x2_t v23 = vcvt_f32_f64(vdivq_f64(_Q1, (float64x2_t)self->_framebufferSize));
  *(float *)_Q1.f64 = v15;
  __asm { FMOV            V2.2S, #1.0 }
  unsigned int v31 = _D2;
  LODWORD(_D2) = LODWORD(_Q1.f64[0]);
  float32x2_t v45 = v23;
  unint64_t v46 = _D2;
  LODWORD(v47) = 1107296256;
  WORD2(v47) = 8;
  BYTE6(v47) = 1;
  int v40 = 8;
  BYTE2(v40) = self->_isSingleObject;
  [(TSDMetalShader *)self->_velocityTileMaxHorizontalShader setPipelineStateWithEncoder:v13 vertexBytes:&v41 fragmentBytes:&v40];
  [v13 setFragmentTexture:self->_combinedTextureVelocity atIndex:0];
  [(TSDMTLDataBuffer *)self->_velocitySquashedFBODataBuffer drawWithEncoder:v13 atIndex:[(TSDMetalShader *)self->_velocityTileMaxHorizontalShader bufferIndex]];
  [v13 endEncoding];
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferSize];
  double v26 = v25;
  double v28 = v27;
  v29 = [(MTLCommandBuffer *)self->_currentCommandBuffer renderCommandEncoderWithDescriptor:self->_tileVerticalPassDescriptor];

  float64x2_t v32 = 0uLL;
  v33.f64[0] = v26;
  v33.f64[1] = v28;
  float64x2_t v34 = (float64x2_t)xmmword_22383A500;
  [v29 setViewport:&v32];
  float64x2_t v38 = 0u;
  float64x2_t v39 = 0u;
  float64x2_t v36 = 0u;
  float64x2_t v37 = 0u;
  float64x2_t v34 = 0u;
  float64x2_t v35 = 0u;
  float64x2_t v32 = 0u;
  float64x2_t v33 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v32, 0.0, v26, 0.0, v28, -1.0, 1.0);
  float32x4_t v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
  float32x4_t v42 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v34), v35);
  float32x4_t v43 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v36), v37);
  float32x4_t v44 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v39);
  *(float *)&unsigned int v30 = v17;
  unint64_t v46 = __PAIR64__(v30, v31);
  BYTE6(v47) = 0;
  [(TSDMetalShader *)self->_velocityTileMaxVerticalShader setPipelineStateWithEncoder:v29 vertexBytes:&v41 fragmentBytes:&v40];
  [v29 setFragmentTexture:self->_velocityTextureSquashed atIndex:0];
  [(TSDMTLDataBuffer *)self->_velocityFBODataBuffer drawWithEncoder:v29 atIndex:[(TSDMetalShader *)self->_velocityTileMaxVerticalShader bufferIndex]];
  [v29 endEncoding];
}

- (void)p_dilateVelocityTexture
{
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferSize];
  double v14 = v3;
  double v15 = v4;
  int v5 = [(MTLCommandBuffer *)self->_currentCommandBuffer renderCommandEncoderWithDescriptor:self->_neighborHorizontalPassDescriptor];
  float64x2_t v25 = 0uLL;
  v26.f64[0] = v14;
  v26.f64[1] = v15;
  float64x2_t v27 = (float64x2_t)xmmword_22383A500;
  [v5 setViewport:&v25];
  float64x2_t v31 = 0u;
  float64x2_t v32 = 0u;
  float64x2_t v29 = 0u;
  float64x2_t v30 = 0u;
  float64x2_t v27 = 0u;
  float64x2_t v28 = 0u;
  float64x2_t v25 = 0u;
  float64x2_t v26 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v25, 0.0, v14, 0.0, v15, -1.0, 1.0);
  float32x4_t v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v26);
  float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v27), v28);
  float32x4_t v23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v30);
  float32x4_t v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v32);
  v18[0] = v21;
  v18[1] = v22;
  v6.f64[0] = v14;
  v6.f64[1] = v15;
  v18[2] = v23;
  v18[3] = v24;
  __asm { FMOV            V1.2D, #1.0 }
  float32x2_t v19 = vcvt_f32_f64(vdivq_f64(_Q1, v6));
  uint64_t v20 = 65539;
  BYTE3(v20) = self->_isSingleObject;
  unint64_t v12 = [(TSDMetalShader *)self->_velocityNeighborMaxHorizontalShader bufferIndex];
  [(TSDMetalShader *)self->_velocityNeighborMaxHorizontalShader setPipelineStateWithEncoder:v5 vertexBytes:&v21 fragmentBytes:v18];
  [v5 setFragmentTexture:self->_velocityTexture1 atIndex:0];
  [(TSDMTLDataBuffer *)self->_velocityFBODataBuffer drawWithEncoder:v5 atIndex:v12];
  [v5 endEncoding];
  float64x2_t v13 = [(MTLCommandBuffer *)self->_currentCommandBuffer renderCommandEncoderWithDescriptor:self->_neighborVerticalPassDescriptor];

  v16[0] = 0;
  v16[1] = 0;
  *(double *)&v16[2] = v14;
  *(double *)&v16[3] = v15;
  long long v17 = xmmword_22383A500;
  [v13 setViewport:v16];
  BYTE2(v20) = 0;
  [(TSDMetalShader *)self->_velocityNeighborMaxVerticalShader setPipelineStateWithEncoder:v13 vertexBytes:&v21 fragmentBytes:v18];
  [v13 setFragmentTexture:self->_velocityTexture2 atIndex:0];
  [(TSDMTLDataBuffer *)self->_velocityFBODataBuffer drawWithEncoder:v13 atIndex:v12];
  [v13 endEncoding];
}

- (void)p_drawWithEncoder:(id)a3 opacity:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(MTLTexture *)self->_combinedTextureColor1 width];
  p_colorTexture1 = &self->_colorTexture1;
  if (v7 == [(MTLTexture *)self->_colorTexture1 width])
  {
    uint64_t v9 = [(MTLTexture *)self->_combinedTextureColor1 height];
    BOOL v10 = v9 == [(MTLTexture *)*p_colorTexture1 height];
    if (v10) {
      p_colorTexture1 = &self->_combinedTextureColor1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  double v11 = *p_colorTexture1;
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferSize];
  float64_t v38 = v13;
  float64_t v39 = v12;
  float64x2_t v63 = 0u;
  float64x2_t v64 = 0u;
  float64x2_t v61 = 0u;
  float64x2_t v62 = 0u;
  float64x2_t v59 = 0u;
  float64x2_t v60 = 0u;
  float64x2_t v57 = 0u;
  float64x2_t v58 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v57, 0.0, self->_framebufferSize.width, 0.0, self->_framebufferSize.height, -1.0, 1.0);
  [(TSDMetalMotionBlurEffect *)self p_updateMaxVelocityInShadersWithScale:1 isColorFBO:0.4];
  float64_t v36 = v15;
  float64_t v37 = v14;
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferTextureScale];
  uint64_t v56 = 0;
  float32x4_t v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v57), v58);
  float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v59), v60);
  float32x4_t v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v61), v62);
  float32x4_t v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v63), v64);
  LOBYTE(v56) = self->_isSingleObject;
  v17.f64[1] = v16;
  __asm { FMOV            V1.2D, #1.0 }
  float32x2_t v55 = vcvt_f32_f64(vdivq_f64(_Q1, v17));
  uint64_t v50 = 0;
  float32x2_t v49 = 0;
  v17.f64[0] = v39;
  v17.f64[1] = v38;
  _Q1.f64[0] = v37;
  _Q1.f64[1] = v36;
  float32x2_t v47 = vcvt_f32_f64(v17);
  float32x2_t v48 = vcvt_f32_f64(_Q1);
  if (![(TSDMetalMotionBlurEffect *)self isSingleObject])
  {
    [(TSDAnimationRandomGenerator *)self->_randomGenerator randomDouble];
    float64_t v40 = v23;
    [(TSDAnimationRandomGenerator *)self->_randomGenerator randomDouble];
    v24.f64[0] = v40;
    v24.f64[1] = v25;
    float32x2_t v49 = vcvt_f32_f64(v24);
  }
  LODWORD(v50) = 1065353216;
  WORD2(v50) = 5;
  BYTE6(v50) = self->_isSingleObject;
  float64x2_t v26 = [(MTLCommandBuffer *)self->_currentCommandBuffer renderCommandEncoderWithDescriptor:self->_combined1PassDescriptor];
  [(TSDMetalShader *)self->_velocityCollectionShader setPipelineStateWithEncoder:v26 vertexBytes:&v51 fragmentBytes:&v47];
  CGFloat v27 = (double)(unint64_t)[(MTLTexture *)self->_colorTexture2 width];
  unint64_t v28 = [(MTLTexture *)self->_colorTexture2 height];
  v46.m12 = 0.0;
  v46.m11 = 0.0;
  v46.m13 = v27;
  v46.m14 = (double)v28;
  *(_OWORD *)&v46.m21 = xmmword_22383A500;
  [v26 setViewport:&v46];
  unint64_t v29 = [(TSDMetalShader *)self->_velocityCollectionShader bufferIndex];
  [v26 setFragmentTexture:v11 atIndex:0];
  [v26 setFragmentTexture:self->_velocityTexture1 atIndex:1];
  [v26 setFragmentTexture:self->_combinedTextureVelocity atIndex:2];
  [(TSDMTLDataBuffer *)self->_colorFBODataBuffer drawWithEncoder:v26 atIndex:v29];
  [v26 endEncoding];
  [(MTLCommandBuffer *)self->_currentCommandBuffer commit];
  float64x2_t v30 = self->_colorTexture2;

  if (v10)
  {
    memset(&v46, 0, sizeof(v46));
    CATransform3DMakeTranslation(&v46, (self->_framebufferSize.width - self->_slideSize.width) * -0.5, (self->_framebufferSize.height - self->_slideSize.height) * -0.5, 0.0);
    memset(&v45, 0, sizeof(v45));
    TSDTransform3DMakeOrtho((uint64_t)&v45, 0.0, self->_slideSize.width, 0.0, self->_slideSize.height, -1.0, 1.0);
    CATransform3D a = v46;
    CATransform3D b = v45;
    CATransform3DConcat(&v44, &a, &b);
    float64x2_t v61 = *(float64x2_t *)&v44.m31;
    float64x2_t v62 = *(float64x2_t *)&v44.m33;
    float64x2_t v63 = *(float64x2_t *)&v44.m41;
    float64x2_t v64 = *(float64x2_t *)&v44.m43;
    float64x2_t v57 = *(float64x2_t *)&v44.m11;
    float64x2_t v58 = *(float64x2_t *)&v44.m13;
    float64x2_t v59 = *(float64x2_t *)&v44.m21;
    float64x2_t v60 = *(float64x2_t *)&v44.m23;
    float32x4_t v51 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m11), *(float64x2_t *)&v44.m13);
    float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m21), *(float64x2_t *)&v44.m23);
    float32x4_t v53 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m31), *(float64x2_t *)&v44.m33);
    float32x4_t v54 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v44.m41), *(float64x2_t *)&v44.m43);
    v44.m11 = 0.0;
    v44.m12 = 0.0;
    *(CGSize *)&v44.m13 = self->_slideSize;
    *(_OWORD *)&v44.m21 = xmmword_22383A500;
    [v6 setViewport:&v44];
    [(TSDMetalMotionBlurEffect *)self p_updateMaxVelocityInShadersWithScale:1 isColorFBO:1.0];
    v32.f64[1] = v31;
    float32x2_t v48 = vcvt_f32_f64(v32);
    *(float *)v32.f64 = a4;
    LODWORD(v50) = LODWORD(v32.f64[0]);
    if (![(TSDMetalMotionBlurEffect *)self isSingleObject])
    {
      [(TSDAnimationRandomGenerator *)self->_randomGenerator randomDouble];
      float64_t v41 = v33;
      [(TSDAnimationRandomGenerator *)self->_randomGenerator randomDouble];
      v34.f64[0] = v41;
      v34.f64[1] = v35;
      float32x2_t v49 = vcvt_f32_f64(v34);
    }
    [(TSDMetalShader *)self->_velocityCollectionShader setPipelineStateWithEncoder:v6 vertexBytes:&v51 fragmentBytes:&v47];
    [v6 setFragmentTexture:v30 atIndex:0];
    [v6 setFragmentTexture:self->_velocityTexture1 atIndex:1];
    [v6 setFragmentTexture:self->_combinedTextureVelocity atIndex:2];
    [(TSDMTLDataBuffer *)self->_FBODataBuffer drawWithEncoder:v6 atIndex:v29];
  }
}

- (void)setupMotionBlurEffectIfNecessary
{
  [(TSDMetalMotionBlurEffect *)self p_setupTextures];
  [(TSDMetalMotionBlurEffect *)self p_setupBuffers];
  [(TSDMetalMotionBlurEffect *)self p_setupShaders];

  [(TSDMetalMotionBlurEffect *)self p_setupRenderPasses];
}

- (void)p_setupShaders
{
  if (!self->_velocityTileMaxHorizontalShader)
  {
    id v21 = [(TSDMetalContext *)self->_metalContext device];
    id v3 = objc_alloc_init(MEMORY[0x263F129B0]);
    objc_msgSend(v3, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    [v3 setBlendingEnabled:1];
    [v3 setRgbBlendOperation:0];
    [v3 setAlphaBlendOperation:0];
    [v3 setSourceRGBBlendFactor:1];
    [v3 setSourceAlphaBlendFactor:1];
    [v3 setDestinationRGBBlendFactor:5];
    [v3 setDestinationAlphaBlendFactor:5];
    double v4 = [[TSDMetalShader alloc] initDefaultTextureAndOpacityShaderWithDevice:v21 colorAttachment:v3];
    defaultTextureShader = self->_defaultTextureShader;
    self->_defaultTextureShader = v4;

    id v6 = [[TSDMetalShader alloc] initDefaultVelocityCollectionShaderWithDevice:v21 colorAttachment:v3];
    velocityCollectionShader = self->_velocityCollectionShader;
    self->_velocityCollectionShader = v6;

    [v3 setBlendingEnabled:0];
    float64x2_t v8 = [[TSDMetalShader alloc] initDefaultTileMaxBlurShaderWithDevice:v21 colorAttachment:v3];
    velocityTileMaxHorizontalShader = self->_velocityTileMaxHorizontalShader;
    self->_velocityTileMaxHorizontalShader = v8;

    BOOL v10 = [[TSDMetalShader alloc] initDefaultTileMaxBlurShaderWithDevice:v21 colorAttachment:v3];
    velocityTileMaxVerticalShader = self->_velocityTileMaxVerticalShader;
    self->_velocityTileMaxVerticalShader = v10;

    double v12 = [[TSDMetalShader alloc] initDefaultNeighborMaxBlurShaderWithDevice:v21 colorAttachment:v3];
    velocityNeighborMaxHorizontalShader = self->_velocityNeighborMaxHorizontalShader;
    self->_velocityNeighborMaxHorizontalShader = v12;

    double v14 = [[TSDMetalShader alloc] initDefaultNeighborMaxBlurShaderWithDevice:v21 colorAttachment:v3];
    velocityNeighborMaxVerticalShader = self->_velocityNeighborMaxVerticalShader;
    self->_velocityNeighborMaxVerticalShader = v14;

    [v3 setBlendingEnabled:1];
    id v16 = objc_alloc_init(MEMORY[0x263F129B0]);
    objc_msgSend(v16, "setPixelFormat:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"));
    float64x2_t v17 = [[TSDMetalShader alloc] initDefaultTextureAndOpacityMotionBlurShaderWithDevice:v21 colorAttachment:v3 velocityAttachment:v16 motionBlur:1];
    colorAndVelocityShader = self->_colorAndVelocityShader;
    self->_colorAndVelocityShader = v17;

    float32x2_t v19 = [[TSDMetalShader alloc] initDefaultBlendShaderWithDevice:v21 colorAttachment:v3 velocityAttachment:v16 motionBlur:1];
    colorAndVelocityBlendingShader = self->_colorAndVelocityBlendingShader;
    self->_colorAndVelocityBlendingShader = v19;
  }
}

- (void)p_setupTextures
{
  id v40 = [(TSDMetalContext *)self->_metalContext device];
  unint64_t v3 = [(TSDMetalContext *)self->_metalContext pixelFormat];
  if (!self->_combinedTextureColor1)
  {
    double v4 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v3 width:(unint64_t)self->_framebufferSize.width height:(unint64_t)self->_framebufferSize.height mipmapped:0];
    [v4 setUsage:5];
    [v4 setStorageMode:2];
    int v5 = (MTLTexture *)[v40 newTextureWithDescriptor:v4];
    combinedTextureColor1 = self->_combinedTextureColor1;
    self->_combinedTextureColor1 = v5;

    uint64_t v7 = (MTLTexture *)[v40 newTextureWithDescriptor:v4];
    combinedTextureColor2 = self->_combinedTextureColor2;
    self->_combinedTextureColor2 = v7;

    uint64_t v9 = (MTLTexture *)[v40 newTextureWithDescriptor:v4];
    combinedTextureVelocity = self->_combinedTextureVelocity;
    self->_combinedTextureVelocity = v9;
  }
  if (!self->_colorTexture1)
  {
    double v11 = TSDMultiplySizeScalar(self->_framebufferSize.width, self->_framebufferSize.height, self->_framebufferScale);
    double v12 = TSDCeilSize(v11);
    double v14 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v3 width:(unint64_t)v12 height:(unint64_t)v13 mipmapped:0];
    [v14 setUsage:5];
    [v14 setStorageMode:2];
    double v15 = (MTLTexture *)[v40 newTextureWithDescriptor:v14];
    colorTexture1 = self->_colorTexture1;
    self->_colorTexture1 = v15;

    float64x2_t v17 = (MTLTexture *)[v40 newTextureWithDescriptor:v14];
    colorTexture2 = self->_colorTexture2;
    self->_colorTexture2 = v17;
  }
  [(TSDMetalMotionBlurEffect *)self p_velocityFramebufferSize];
  double v20 = v19;
  double v22 = v21;
  velocityTexture1 = self->_velocityTexture1;
  if (!velocityTexture1
    || v19 != (double)(unint64_t)[(MTLTexture *)velocityTexture1 width]
    || v22 != (double)(unint64_t)[(MTLTexture *)self->_velocityTexture1 height])
  {
    [(TSDMetalMotionBlurEffect *)self p_squashedVelocityFramebufferSize];
    double v25 = v24;
    double v27 = v26;
    unint64_t v28 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v3 width:(unint64_t)v20 height:(unint64_t)v22 mipmapped:0];
    [v28 setUsage:5];
    [v28 setStorageMode:2];
    unint64_t v29 = (MTLTexture *)[v40 newTextureWithDescriptor:v28];
    float64x2_t v30 = self->_velocityTexture1;
    self->_velocityTexture1 = v29;

    float64_t v31 = (MTLTexture *)[v40 newTextureWithDescriptor:v28];
    velocityTexture2 = self->_velocityTexture2;
    self->_velocityTexture2 = v31;

    double v33 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[TSDMetalContext pixelFormat](self->_metalContext, "pixelFormat"), (unint64_t)v25, (unint64_t)v27, 0);

    [v33 setUsage:5];
    [v33 setStorageMode:2];
    float64x2_t v34 = (MTLTexture *)[v40 newTextureWithDescriptor:v33];
    velocityTextureSquashed = self->_velocityTextureSquashed;
    self->_velocityTextureSquashed = v34;

    float64_t v36 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 0, v40, TSDRectWithSize());
    velocityFBODataBuffer = self->_velocityFBODataBuffer;
    self->_velocityFBODataBuffer = v36;

    float64_t v38 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 1, v40, TSDRectWithSize());
    velocitySquashedFBODataBuffer = self->_velocitySquashedFBODataBuffer;
    self->_velocitySquashedFBODataBuffer = v38;
  }
}

- (void)p_setupBuffers
{
  if (!self->_FBODataBuffer)
  {
    id v9 = [(TSDMetalContext *)self->_metalContext device];
    unint64_t v3 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 0, v9, TSDRectWithSize());
    FBODataBuffer = self->_FBODataBuffer;
    self->_FBODataBuffer = v3;

    int v5 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 1, v9, TSDRectWithSize());
    FBODataBufferFlipped = self->_FBODataBufferFlipped;
    self->_FBODataBufferFlipped = v5;

    [(MTLTexture *)self->_colorTexture1 width];
    [(MTLTexture *)self->_colorTexture1 height];
    uint64_t v7 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 0, v9, TSDRectWithSize());
    colorFBODataBuffer = self->_colorFBODataBuffer;
    self->_colorFBODataBuffer = v7;
  }
}

- (void)p_setupRenderPasses
{
  if (!self->_colorAndVelocityPassDescriptor)
  {
    unint64_t v3 = [MEMORY[0x263F129A0] renderPassDescriptor];
    colorAndVelocityPassDescriptor = self->_colorAndVelocityPassDescriptor;
    self->_colorAndVelocityPassDescriptor = v3;

    combinedTextureColor1 = self->_combinedTextureColor1;
    id v6 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    [v7 setTexture:combinedTextureColor1];

    float64x2_t v8 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    id v9 = [v8 objectAtIndexedSubscript:0];
    [v9 setLoadAction:2];

    BOOL v10 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    double v11 = [v10 objectAtIndexedSubscript:0];
    [v11 setStoreAction:1];

    double v12 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    double v13 = [v12 objectAtIndexedSubscript:0];
    objc_msgSend(v13, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    combinedTextureVelocity = self->_combinedTextureVelocity;
    double v15 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    id v16 = [v15 objectAtIndexedSubscript:1];
    [v16 setTexture:combinedTextureVelocity];

    float64x2_t v17 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    BOOL v18 = [v17 objectAtIndexedSubscript:1];
    [v18 setLoadAction:2];

    double v19 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    double v20 = [v19 objectAtIndexedSubscript:1];
    [v20 setStoreAction:1];

    double v21 = [(MTLRenderPassDescriptor *)self->_colorAndVelocityPassDescriptor colorAttachments];
    double v22 = [v21 objectAtIndexedSubscript:1];
    objc_msgSend(v22, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    double v23 = [MEMORY[0x263F129A0] renderPassDescriptor];
    tileHorizontalPassDescriptor = self->_tileHorizontalPassDescriptor;
    self->_tileHorizontalPassDescriptor = v23;

    velocityTextureSquashed = self->_velocityTextureSquashed;
    double v26 = [(MTLRenderPassDescriptor *)self->_tileHorizontalPassDescriptor colorAttachments];
    double v27 = [v26 objectAtIndexedSubscript:0];
    [v27 setTexture:velocityTextureSquashed];

    unint64_t v28 = [(MTLRenderPassDescriptor *)self->_tileHorizontalPassDescriptor colorAttachments];
    unint64_t v29 = [v28 objectAtIndexedSubscript:0];
    [v29 setLoadAction:2];

    float64x2_t v30 = [(MTLRenderPassDescriptor *)self->_tileHorizontalPassDescriptor colorAttachments];
    float64_t v31 = [v30 objectAtIndexedSubscript:0];
    [v31 setStoreAction:1];

    float64x2_t v32 = [(MTLRenderPassDescriptor *)self->_tileHorizontalPassDescriptor colorAttachments];
    double v33 = [v32 objectAtIndexedSubscript:0];
    objc_msgSend(v33, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    float64x2_t v34 = [MEMORY[0x263F129A0] renderPassDescriptor];
    tileVerticalPassDescriptor = self->_tileVerticalPassDescriptor;
    self->_tileVerticalPassDescriptor = v34;

    velocityTexture1 = self->_velocityTexture1;
    float64_t v37 = [(MTLRenderPassDescriptor *)self->_tileVerticalPassDescriptor colorAttachments];
    float64_t v38 = [v37 objectAtIndexedSubscript:0];
    [v38 setTexture:velocityTexture1];

    float64_t v39 = [(MTLRenderPassDescriptor *)self->_tileVerticalPassDescriptor colorAttachments];
    id v40 = [v39 objectAtIndexedSubscript:0];
    [v40 setLoadAction:2];

    float64_t v41 = [(MTLRenderPassDescriptor *)self->_tileVerticalPassDescriptor colorAttachments];
    float32x4_t v42 = [v41 objectAtIndexedSubscript:0];
    [v42 setStoreAction:1];

    float32x4_t v43 = [(MTLRenderPassDescriptor *)self->_tileVerticalPassDescriptor colorAttachments];
    CATransform3D v44 = [v43 objectAtIndexedSubscript:0];
    objc_msgSend(v44, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    CATransform3D v45 = [MEMORY[0x263F129A0] renderPassDescriptor];
    neighborHorizontalPassDescriptor = self->_neighborHorizontalPassDescriptor;
    self->_neighborHorizontalPassDescriptor = v45;

    velocityTexture2 = self->_velocityTexture2;
    float32x2_t v48 = [(MTLRenderPassDescriptor *)self->_neighborHorizontalPassDescriptor colorAttachments];
    float32x2_t v49 = [v48 objectAtIndexedSubscript:0];
    [v49 setTexture:velocityTexture2];

    uint64_t v50 = [(MTLRenderPassDescriptor *)self->_neighborHorizontalPassDescriptor colorAttachments];
    float32x4_t v51 = [v50 objectAtIndexedSubscript:0];
    [v51 setLoadAction:2];

    float32x4_t v52 = [(MTLRenderPassDescriptor *)self->_neighborHorizontalPassDescriptor colorAttachments];
    float32x4_t v53 = [v52 objectAtIndexedSubscript:0];
    [v53 setStoreAction:1];

    float32x4_t v54 = [(MTLRenderPassDescriptor *)self->_neighborHorizontalPassDescriptor colorAttachments];
    float32x2_t v55 = [v54 objectAtIndexedSubscript:0];
    objc_msgSend(v55, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    uint64_t v56 = [MEMORY[0x263F129A0] renderPassDescriptor];
    neighborVerticalPassDescriptor = self->_neighborVerticalPassDescriptor;
    self->_neighborVerticalPassDescriptor = v56;

    float64x2_t v58 = self->_velocityTexture1;
    float64x2_t v59 = [(MTLRenderPassDescriptor *)self->_neighborVerticalPassDescriptor colorAttachments];
    float64x2_t v60 = [v59 objectAtIndexedSubscript:0];
    [v60 setTexture:v58];

    float64x2_t v61 = [(MTLRenderPassDescriptor *)self->_neighborVerticalPassDescriptor colorAttachments];
    float64x2_t v62 = [v61 objectAtIndexedSubscript:0];
    [v62 setLoadAction:2];

    float64x2_t v63 = [(MTLRenderPassDescriptor *)self->_neighborVerticalPassDescriptor colorAttachments];
    float64x2_t v64 = [v63 objectAtIndexedSubscript:0];
    [v64 setStoreAction:1];

    v65 = [(MTLRenderPassDescriptor *)self->_neighborVerticalPassDescriptor colorAttachments];
    v66 = [v65 objectAtIndexedSubscript:0];
    objc_msgSend(v66, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

    v67 = [MEMORY[0x263F129A0] renderPassDescriptor];
    combined1PassDescriptor = self->_combined1PassDescriptor;
    self->_combined1PassDescriptor = v67;

    colorTexture2 = self->_colorTexture2;
    v70 = [(MTLRenderPassDescriptor *)self->_combined1PassDescriptor colorAttachments];
    v71 = [v70 objectAtIndexedSubscript:0];
    [v71 setTexture:colorTexture2];

    v72 = [(MTLRenderPassDescriptor *)self->_combined1PassDescriptor colorAttachments];
    v73 = [v72 objectAtIndexedSubscript:0];
    [v73 setLoadAction:2];

    v74 = [(MTLRenderPassDescriptor *)self->_combined1PassDescriptor colorAttachments];
    v75 = [v74 objectAtIndexedSubscript:0];
    [v75 setStoreAction:1];

    id v77 = [(MTLRenderPassDescriptor *)self->_combined1PassDescriptor colorAttachments];
    v76 = [v77 objectAtIndexedSubscript:0];
    objc_msgSend(v76, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  }
}

- (BOOL)isSingleObject
{
  return self->_isSingleObject;
}

- (void)setIsSingleObject:(BOOL)a3
{
  self->_isSingleObject = a3;
}

- (double)motionBlurStrength
{
  return self->_motionBlurStrength;
}

- (int64_t)debugDrawMode
{
  return self->_debugDrawMode;
}

- (void)setDebugDrawMode:(int64_t)a3
{
  self->_debugDrawMode = a3;
}

- (double)framebufferScale
{
  return self->_framebufferScale;
}

- (void)setFramebufferScale:(double)a3
{
  self->_double framebufferScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_currentCommandBuffer, 0);
  objc_storeStrong((id *)&self->_randomGenerator, 0);
  objc_storeStrong((id *)&self->_combined1PassDescriptor, 0);
  objc_storeStrong((id *)&self->_neighborVerticalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_neighborHorizontalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_tileVerticalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_tileHorizontalPassDescriptor, 0);
  objc_storeStrong((id *)&self->_colorAndVelocityPassDescriptor, 0);
  objc_storeStrong((id *)&self->_FBODataBufferFlipped, 0);
  objc_storeStrong((id *)&self->_FBODataBuffer, 0);
  objc_storeStrong((id *)&self->_velocitySquashedFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_velocityFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_velocityTextureSquashed, 0);
  objc_storeStrong((id *)&self->_velocityTexture2, 0);
  objc_storeStrong((id *)&self->_velocityTexture1, 0);
  objc_storeStrong((id *)&self->_colorFBODataBuffer, 0);
  objc_storeStrong((id *)&self->_colorTexture2, 0);
  objc_storeStrong((id *)&self->_colorTexture1, 0);
  objc_storeStrong((id *)&self->_velocityNeighborMaxVerticalShader, 0);
  objc_storeStrong((id *)&self->_velocityNeighborMaxHorizontalShader, 0);
  objc_storeStrong((id *)&self->_velocityTileMaxHorizontalShader, 0);
  objc_storeStrong((id *)&self->_velocityTileMaxVerticalShader, 0);
  objc_storeStrong((id *)&self->_velocityCollectionShader, 0);
  objc_storeStrong((id *)&self->_velocityVisualizerShader, 0);
  objc_storeStrong((id *)&self->_colorAndVelocityBlendingShader, 0);
  objc_storeStrong((id *)&self->_colorAndVelocityShader, 0);
  objc_storeStrong((id *)&self->_defaultTextureShader, 0);
  objc_storeStrong((id *)&self->_combinedTextureVelocity, 0);
  objc_storeStrong((id *)&self->_combinedTextureColor2, 0);

  objc_storeStrong((id *)&self->_combinedTextureColor1, 0);
}

@end