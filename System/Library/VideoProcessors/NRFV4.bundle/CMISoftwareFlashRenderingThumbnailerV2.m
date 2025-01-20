@interface CMISoftwareFlashRenderingThumbnailerV2
- (CMISoftwareFlashRenderingThumbnailerV2)initWithMetalContext:(id)a3;
- (int)encodeYUVToLinearRGBThumbnailConvert:(id)a3 inputLumaTexture:(id)a4 inputChromaTexture:(id)a5 yuvOffsets:(int)a6 thumbnailWidth:(int)a7 thumbnailHeight:(CMISoftwareFlashRenderingCropRect)a8 cropRect:(id)a9 outputThumbnailRGBTexture:;
- (int)purgeResources;
@end

@implementation CMISoftwareFlashRenderingThumbnailerV2

- (CMISoftwareFlashRenderingThumbnailerV2)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CMISoftwareFlashRenderingThumbnailerV2;
  v6 = [(CMISoftwareFlashRenderingThumbnailerV2 *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metalContext, a3),
        [(FigMetalContext *)v7->_metalContext computePipelineStateFor:@"convertYUVToLinearRGBThumbnailV2" constants:0], uint64_t v8 = objc_claimAutoreleasedReturnValue(), convertYUVToLinearRGBThumbnailV2PipelineState = v7->_convertYUVToLinearRGBThumbnailV2PipelineState, v7->_convertYUVToLinearRGBThumbnailV2PipelineState = (MTLComputePipelineState *)v8, convertYUVToLinearRGBThumbnailV2PipelineState, v7->_convertYUVToLinearRGBThumbnailV2PipelineState))
  {
    v10 = v7;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

- (int)purgeResources
{
  return 0;
}

- (int)encodeYUVToLinearRGBThumbnailConvert:(id)a3 inputLumaTexture:(id)a4 inputChromaTexture:(id)a5 yuvOffsets:(int)a6 thumbnailWidth:(int)a7 thumbnailHeight:(CMISoftwareFlashRenderingCropRect)a8 cropRect:(id)a9 outputThumbnailRGBTexture:
{
  long long v29 = v10;
  CMISoftwareFlashRenderingCropRect v35 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  long long v34 = v29;
  id v19 = a9;
  if (!v16)
  {
    fig_log_get_emitter();
    uint64_t v28 = v9;
    LODWORD(v27) = 0;
    FigDebugAssert3();
    v20 = 0;
LABEL_7:
    int v25 = 7;
    goto LABEL_4;
  }
  v20 = [v16 computeCommandEncoder];
  if (!v20)
  {
    fig_log_get_emitter();
    uint64_t v28 = v9;
    LODWORD(v27) = 0;
    FigDebugAssert3();
    goto LABEL_7;
  }
  float v30 = (float)a8.var0 / (float)(unint64_t)[v19 width];
  unint64_t v21 = [v19 height];
  *(float *)&uint64_t v22 = v30;
  *((float *)&v22 + 1) = (float)a8.var1 / (float)v21;
  uint64_t v33 = v22;
  [v20 setComputePipelineState:self->_convertYUVToLinearRGBThumbnailV2PipelineState];
  [v20 setTexture:v17 atIndex:0];
  [v20 setTexture:v18 atIndex:1];
  [v20 setTexture:v19 atIndex:2];
  [v20 setBytes:&v34 length:16 atIndex:0];
  [v20 setBytes:&v33 length:8 atIndex:1];
  [v20 setBytes:&v35 length:16 atIndex:2];
  unint64_t v23 = [(MTLComputePipelineState *)self->_convertYUVToLinearRGBThumbnailV2PipelineState threadExecutionWidth];
  unint64_t v24 = [(MTLComputePipelineState *)self->_convertYUVToLinearRGBThumbnailV2PipelineState maxTotalThreadsPerThreadgroup];
  v32[0] = a6;
  v32[1] = a7;
  v32[2] = 1;
  v31[0] = v23;
  v31[1] = v24 / v23;
  v31[2] = 1;
  [v20 dispatchThreads:v32 threadsPerThreadgroup:v31];
  int v25 = 0;
LABEL_4:
  objc_msgSend(v20, "endEncoding", v27, v28);

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_convertYUVToLinearRGBThumbnailV2PipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end