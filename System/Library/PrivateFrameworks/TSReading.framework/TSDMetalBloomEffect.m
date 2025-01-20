@interface TSDMetalBloomEffect
- (TSDMetalBloomEffect)initWithEffectSize:(CGSize)a3 blurScale:(double)a4 metalContext:(id)a5;
- (id)p_blurTextureWithTexture:(id)a3 metalContext:(id)a4 MVPMatrix:(CATransform3D *)a5;
- (void)drawBloomEffectWithTexture:(id)a3 metalContext:(id)a4 encoder:(id)a5 MVPMatrix:(CATransform3D *)a6 bloomAmount:(double)a7;
- (void)p_setupBuffersWithMetalContext:(id)a3;
- (void)p_setupShadersWithMetalContext:(id)a3;
- (void)teardown;
@end

@implementation TSDMetalBloomEffect

- (TSDMetalBloomEffect)initWithEffectSize:(CGSize)a3 blurScale:(double)a4 metalContext:(id)a5
{
  long long v24 = *(_OWORD *)&a4;
  long long v22 = *(long long *)&a3.height;
  id v6 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TSDMetalBloomEffect;
  v7 = [(TSDMetalBloomEffect *)&v25 init];
  v8 = v7;
  if (v7)
  {
    float64_t v9 = *(double *)&v22;
    v7->_effectSize.width = a3.width;
    *(void *)&v7->_effectSize.height = v22;
    uint64_t v10 = v24;
    v11.f64[0] = a3.width;
    if (*(double *)&v24 < 1.0)
    {
      v12 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", *(double *)&v24, a3.width);
      v13 = [NSString stringWithUTF8String:"-[TSDMetalBloomEffect initWithEffectSize:blurScale:metalContext:]"];
      v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalBloomEffect.m"];
      [v12 handleFailureInFunction:v13 file:v14 lineNumber:47 description:@"blurScale must be >= 1.0!"];

      float64_t v9 = *(double *)&v22;
      v11.f64[0] = a3.width;
      uint64_t v10 = v24;
    }
    v11.f64[1] = v9;
    float32x2_t v15 = vrndp_f32(vcvt_f32_f64(vdivq_f64(v11, (float64x2_t)vdupq_lane_s64(v10, 0))));
    __asm { FMOV            V1.2S, #16.0 }
    v8->_blurBufferSize = (CGSize)vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcge_f32(_D1, v15), (int8x8_t)_D1, (int8x8_t)v15));
    -[TSDMetalBloomEffect p_setupShadersWithMetalContext:](v8, "p_setupShadersWithMetalContext:", v6, v22, a3, v24);
    [(TSDMetalBloomEffect *)v8 p_setupBuffersWithMetalContext:v6];
  }

  return v8;
}

- (void)teardown
{
  dataBuffer = self->_dataBuffer;
  self->_dataBuffer = 0;

  blurDataBuffer = self->_blurDataBuffer;
  self->_blurDataBuffer = 0;

  blurShader = self->_blurShader;
  self->_blurShader = 0;

  bloomShader = self->_bloomShader;
  self->_bloomShader = 0;

  fboTransferShader = self->_fboTransferShader;
  self->_fboTransferShader = 0;

  downSampleRenderTarget = self->_downSampleRenderTarget;
  self->_downSampleRenderTarget = 0;

  horizontalBlurRenderTarget = self->_horizontalBlurRenderTarget;
  self->_horizontalBlurRenderTarget = 0;

  verticalBlurRenderTarget = self->_verticalBlurRenderTarget;
  self->_verticalBlurRenderTarget = 0;
}

- (void)p_setupShadersWithMetalContext:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F129B0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setPixelFormat:", objc_msgSend(v5, "pixelFormat"));
  v7 = [TSDMetalShader alloc];
  v8 = [v5 device];
  float64_t v9 = [(TSDMetalShader *)v7 initDefaultTextureShaderWithDevice:v8 colorAttachment:v6];
  fboTransferShader = self->_fboTransferShader;
  self->_fboTransferShader = v9;

  float64x2_t v11 = [TSDMetalShader alloc];
  v12 = [v5 device];
  v13 = [(TSDMetalShader *)v11 initDefaultGaussianBlurShaderWithDevice:v12 colorAttachment:v6 halfSizedRadius:0];
  blurShader = self->_blurShader;
  self->_blurShader = v13;

  [v6 setBlendingEnabled:1];
  [v6 setDestinationRGBBlendFactor:5];
  [v6 setDestinationAlphaBlendFactor:5];
  float32x2_t v15 = [TSDMetalShader alloc];
  v16 = [v5 device];

  v17 = [(TSDMetalShader *)v15 initDefaultBloomShaderWithDevice:v16 colorAttachment:v6];
  bloomShader = self->_bloomShader;
  self->_bloomShader = v17;

  float64x2_t v33 = 0u;
  float64x2_t v34 = 0u;
  float64x2_t v31 = 0u;
  float64x2_t v32 = 0u;
  float64x2_t v29 = 0u;
  float64x2_t v30 = 0u;
  float64x2_t v27 = 0u;
  float64x2_t v28 = 0u;
  TSDTransform3DMakeOrtho((uint64_t)&v27, 0.0, self->_blurBufferSize.width, 0.0, self->_blurBufferSize.height, -1.0, 1.0);
  float32x4_t v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v30);
  float32x4_t v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v32);
  float32x4_t v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v34);
  *(float32x4_t *)self->_anon_70 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v27), v28);
  *(float32x4_t *)&self->_anon_70[16] = v19;
  *(float32x4_t *)&self->_anon_70[32] = v20;
  *(float32x4_t *)&self->_anon_70[48] = v21;
  __asm { FMOV            V1.2D, #1.0 }
  self[1].super.isa = (Class)vcvt_f32_f64(vdivq_f64(_Q1, (float64x2_t)self->_blurBufferSize));
}

- (void)p_setupBuffersWithMetalContext:(id)a3
{
  double v5 = TSDRectWithSize();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = a3;
  v13 = [v12 device];
  v14 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13, v5, v7, v9, v11, 0.0, 0.0, 1.0, 1.0);
  dataBuffer = self->_dataBuffer;
  self->_dataBuffer = v14;

  double v16 = TSDRectWithSize();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [v12 device];
  long long v24 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v23, v16, v18, v20, v22, 0.0, 0.0, 1.0, 1.0);
  blurDataBuffer = self->_blurDataBuffer;
  self->_blurDataBuffer = v24;

  v26 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", v12, self->_blurBufferSize.width, self->_blurBufferSize.height);
  downSampleRenderTarget = self->_downSampleRenderTarget;
  self->_downSampleRenderTarget = v26;

  float64x2_t v28 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", v12, self->_blurBufferSize.width, self->_blurBufferSize.height);
  horizontalBlurRenderTarget = self->_horizontalBlurRenderTarget;
  self->_horizontalBlurRenderTarget = v28;

  float64x2_t v30 = -[TSDMetalRenderTarget initWithSize:metalContext:]([TSDMetalRenderTarget alloc], "initWithSize:metalContext:", v12, self->_blurBufferSize.width, self->_blurBufferSize.height);
  verticalBlurRenderTarget = self->_verticalBlurRenderTarget;
  self->_verticalBlurRenderTarget = v30;
}

- (id)p_blurTextureWithTexture:(id)a3 metalContext:(id)a4 MVPMatrix:(CATransform3D *)a5
{
  id v8 = a3;
  double v9 = [a4 commandQueue];
  double v10 = [v9 commandBuffer];

  float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m21), *(float64x2_t *)&a5->m23);
  float32x4_t v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m31), *(float64x2_t *)&a5->m33);
  float32x4_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m41), *(float64x2_t *)&a5->m43);
  float32x4_t v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m11), *(float64x2_t *)&a5->m13);
  v14 = [(TSDMetalRenderTarget *)self->_downSampleRenderTarget passDescriptor];
  float32x2_t v15 = [v10 renderCommandEncoderWithDescriptor:v14];

  [(TSDMetalShader *)self->_fboTransferShader setPipelineStateWithEncoder:v15 vertexBytes:&v24];
  [v15 setFragmentTexture:v8 atIndex:0];

  [(TSDMTLDataBuffer *)self->_dataBuffer drawWithEncoder:v15 atIndex:[(TSDMetalShader *)self->_fboTransferShader bufferIndex]];
  [v15 endEncoding];
  double v16 = [(TSDMetalRenderTarget *)self->_horizontalBlurRenderTarget passDescriptor];
  double v17 = [v10 renderCommandEncoderWithDescriptor:v16];

  LOBYTE(self[1]._effectSize.width) = 1;
  [(TSDMetalShader *)self->_blurShader setPipelineStateWithEncoder:v17 vertexBytes:self->_anon_70 fragmentBytes:&self[1]];
  double v18 = [(TSDMetalRenderTarget *)self->_downSampleRenderTarget texture];
  [v17 setFragmentTexture:v18 atIndex:0];

  [(TSDMTLDataBuffer *)self->_blurDataBuffer drawWithEncoder:v17 atIndex:[(TSDMetalShader *)self->_blurShader bufferIndex]];
  [v17 endEncoding];
  double v19 = [(TSDMetalRenderTarget *)self->_verticalBlurRenderTarget passDescriptor];
  double v20 = [v10 renderCommandEncoderWithDescriptor:v19];

  LOBYTE(self[1]._effectSize.width) = 0;
  [(TSDMetalShader *)self->_blurShader setPipelineStateWithEncoder:v20 vertexBytes:self->_anon_70 fragmentBytes:&self[1]];
  double v21 = [(TSDMetalRenderTarget *)self->_horizontalBlurRenderTarget texture];
  [v20 setFragmentTexture:v21 atIndex:0];

  [(TSDMTLDataBuffer *)self->_blurDataBuffer drawWithEncoder:v20 atIndex:[(TSDMetalShader *)self->_blurShader bufferIndex]];
  [v20 endEncoding];
  [v10 commit];
  double v22 = [(TSDMetalRenderTarget *)self->_verticalBlurRenderTarget texture];

  return v22;
}

- (void)drawBloomEffectWithTexture:(id)a3 metalContext:(id)a4 encoder:(id)a5 MVPMatrix:(CATransform3D *)a6 bloomAmount:(double)a7
{
  long long v12 = *(_OWORD *)&a6->m33;
  long long v28 = *(_OWORD *)&a6->m31;
  long long v29 = v12;
  long long v13 = *(_OWORD *)&a6->m43;
  long long v30 = *(_OWORD *)&a6->m41;
  long long v31 = v13;
  float32x4_t v14 = *(float32x4_t *)&a6->m13;
  float32x4_t v24 = *(float32x4_t *)&a6->m11;
  float32x4_t v25 = v14;
  float32x4_t v15 = *(float32x4_t *)&a6->m23;
  float32x4_t v26 = *(float32x4_t *)&a6->m21;
  float32x4_t v27 = v15;
  id v16 = a5;
  id v17 = a3;
  double v18 = [(TSDMetalBloomEffect *)self p_blurTextureWithTexture:v17 metalContext:a4 MVPMatrix:&v24];
  float32x4_t v19 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m21), *(float64x2_t *)&a6->m23);
  float32x4_t v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m31), *(float64x2_t *)&a6->m33);
  float32x4_t v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m41), *(float64x2_t *)&a6->m43);
  float32x4_t v24 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a6->m11), *(float64x2_t *)&a6->m13);
  float32x4_t v25 = v19;
  float32x4_t v26 = v20;
  float32x4_t v27 = v21;
  float v22 = a7;
  float v23 = v22;
  [(TSDMetalShader *)self->_bloomShader setPipelineStateWithEncoder:v16 vertexBytes:&v24 fragmentBytes:&v23];
  [v16 setFragmentTexture:v17 atIndex:0];

  [v16 setFragmentTexture:v18 atIndex:1];
  [(TSDMTLDataBuffer *)self->_dataBuffer drawWithEncoder:v16 atIndex:[(TSDMetalShader *)self->_bloomShader bufferIndex]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fboTransferShader, 0);
  objc_storeStrong((id *)&self->_bloomShader, 0);
  objc_storeStrong((id *)&self->_blurShader, 0);
  objc_storeStrong((id *)&self->_verticalBlurRenderTarget, 0);
  objc_storeStrong((id *)&self->_horizontalBlurRenderTarget, 0);
  objc_storeStrong((id *)&self->_downSampleRenderTarget, 0);
  objc_storeStrong((id *)&self->_blurDataBuffer, 0);

  objc_storeStrong((id *)&self->_dataBuffer, 0);
}

@end