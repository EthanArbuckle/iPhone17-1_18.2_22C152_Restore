@interface DenoiseRemixShaders
- (DenoiseRemixShaders)initWithMetal:(id)a3 vertFunc:(id)a4 pixelFormatLuma:(unint64_t)a5 pixelFormatChroma:(unint64_t)a6;
@end

@implementation DenoiseRemixShaders

- (DenoiseRemixShaders)initWithMetal:(id)a3 vertFunc:(id)a4 pixelFormatLuma:(unint64_t)a5 pixelFormatChroma:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v29.receiver = self;
  v29.super_class = (Class)DenoiseRemixShaders;
  v12 = [(DenoiseRemixShaders *)&v29 init];
  if (v12)
  {
    v13 = [[DenoiseRemixFragmentShader alloc] initWithMetal:v10 vertFunc:v11 fragName:@"DenoiseChroma_frag" pixelFormat:a6 pixelFormat2:0];
    denoiseChroma = v12->_denoiseChroma;
    v12->_denoiseChroma = v13;

    if (v12->_denoiseChroma)
    {
      v15 = [[DenoiseRemixFragmentShader alloc] initWithMetal:v10 vertFunc:v11 fragName:@"DenoiseLumaDenoiseRemixChroma_frag" pixelFormat:a5 pixelFormat2:a6];
      denoiseLumaDenoiseRemixChroma = v12->_denoiseLumaDenoiseRemixChroma;
      v12->_denoiseLumaDenoiseRemixChroma = v15;

      if (v12->_denoiseLumaDenoiseRemixChroma)
      {
        v17 = [[DenoiseRemixFragmentShader alloc] initWithMetal:v10 vertFunc:v11 fragName:@"DenoiseRemixLumaChroma_frag" pixelFormat:a5 pixelFormat2:a6];
        denoiseRemixLumaChroma = v12->_denoiseRemixLumaChroma;
        v12->_denoiseRemixLumaChroma = v17;

        if (v12->_denoiseRemixLumaChroma)
        {
          v19 = [[DenoiseRemixFragmentShader alloc] initWithMetal:v10 vertFunc:v11 fragName:@"RemixLuma_frag" pixelFormat:a5 pixelFormat2:0];
          remixLuma = v12->_remixLuma;
          v12->_remixLuma = v19;

          if (v12->_remixLuma)
          {
            v21 = [[DenoiseRemixFragmentShader alloc] initWithMetal:v10 vertFunc:v11 fragName:@"DenoiseRemixLuma_frag" pixelFormat:a5 pixelFormat2:0];
            denoiseRemixLuma = v12->_denoiseRemixLuma;
            v12->_denoiseRemixLuma = v21;

            if (v12->_denoiseRemixLuma)
            {
              uint64_t v23 = [v10 computePipelineStateFor:@"VarianceSharpening_kernel_5x5" constants:0];
              varianceSharpening = v12->_varianceSharpening;
              v12->_varianceSharpening = (MTLComputePipelineState *)v23;

              if (v12->_varianceSharpening) {
                goto LABEL_8;
              }
            }
          }
        }
      }
    }
  }
  FigDebugAssert3();
  int v28 = FigSignalErrorAt();
  v25 = 0;
  if (!v28) {
LABEL_8:
  }
    v25 = v12;
  v26 = v25;

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_varianceSharpening, 0);
  objc_storeStrong((id *)&self->_denoiseRemixLuma, 0);
  objc_storeStrong((id *)&self->_remixLuma, 0);
  objc_storeStrong((id *)&self->_denoiseRemixLumaChroma, 0);
  objc_storeStrong((id *)&self->_denoiseLumaDenoiseRemixChroma, 0);

  objc_storeStrong((id *)&self->_denoiseChroma, 0);
}

@end