@interface RawNightModePreDenoiseInference
- (FigMetalContext)metalContext;
- (MTLTexture)inputRGBTexture;
- (MTLTexture)lscGainsTexture;
- (MTLTexture)noiseMapTexture;
- (RawNightModeDenoiseMetalStage)denoiseMetalStage;
- (RawNightModePreDenoiseInference)init;
- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5;
- (int)preWarm;
- (int)setContext:(id)a3;
- (void)setDenoiseMetalStage:(id)a3;
- (void)setInputRGBTexture:(id)a3;
- (void)setLscGainsTexture:(id)a3;
- (void)setNoiseMapTexture:(id)a3;
@end

@implementation RawNightModePreDenoiseInference

- (RawNightModePreDenoiseInference)init
{
  v6.receiver = self;
  v6.super_class = (Class)RawNightModePreDenoiseInference;
  v2 = [(RawNightModePreDenoiseInference *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (int)setContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_metalContext, a3);
    int v6 = 0;
  }
  else
  {
    int v6 = 2;
  }

  return v6;
}

- (int)preWarm
{
  return 0;
}

- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_metalContext)
  {
    denoiseMetalStage = self->_denoiseMetalStage;
    v11 = [v8 objectAtIndexedSubscript:0];
    v12 = [v11 texture];
    HIWORD(v16) = WORD2(*(void *)&a3->var1);
    LOWORD(v16) = *(void *)&a3->var1;
    int v13 = [(RawNightModeDenoiseMetalStage *)denoiseMetalStage createNetworkInputTile:v12 fromInputRgbImage:self->_inputRGBTexture fromNoiseMap:self->_noiseMapTexture withLSCGainsMap:self->_lscGainsTexture tileStart:v16 encodeToContext:self->_metalContext];

    if (v13) {
      int v14 = 2;
    }
    else {
      int v14 = 0;
    }
  }
  else
  {
    int v14 = 2;
  }

  return v14;
}

- (MTLTexture)noiseMapTexture
{
  return self->_noiseMapTexture;
}

- (void)setNoiseMapTexture:(id)a3
{
}

- (RawNightModeDenoiseMetalStage)denoiseMetalStage
{
  return self->_denoiseMetalStage;
}

- (void)setDenoiseMetalStage:(id)a3
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (MTLTexture)inputRGBTexture
{
  return self->_inputRGBTexture;
}

- (void)setInputRGBTexture:(id)a3
{
}

- (MTLTexture)lscGainsTexture
{
  return self->_lscGainsTexture;
}

- (void)setLscGainsTexture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lscGainsTexture, 0);
  objc_storeStrong((id *)&self->_inputRGBTexture, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_denoiseMetalStage, 0);

  objc_storeStrong((id *)&self->_noiseMapTexture, 0);
}

@end