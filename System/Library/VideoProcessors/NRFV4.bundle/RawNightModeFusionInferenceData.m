@interface RawNightModeFusionInferenceData
- (MTLTexture)ggMaxFusionWeights;
- (MTLTexture)lscGainsTexture;
- (MTLTexture)noiseMapTexture;
- (NSDictionary)batchMetadata;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)lscGainMapParameters;
- (NSDictionary)rawNightModeTuningParameters;
- (NSMutableArray)nonReferenceInputFrames;
- (NSNumber)tilePadding;
- (RawNightModeFusionInferenceData)init;
- (RawNightModeFusionInferencePyramid)pyramid;
- (RawNightModeFusionInputFrame)referenceInputFrame;
- (void)setBatchMetadata:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setGgMaxFusionWeights:(id)a3;
- (void)setLscGainMapParameters:(id)a3;
- (void)setLscGainsTexture:(id)a3;
- (void)setNoiseMapTexture:(id)a3;
- (void)setNonReferenceInputFrames:(id)a3;
- (void)setPyramid:(id)a3;
- (void)setRawNightModeTuningParameters:(id)a3;
- (void)setReferenceInputFrame:(id)a3;
- (void)setTilePadding:(id)a3;
@end

@implementation RawNightModeFusionInferenceData

- (RawNightModeFusionInferenceData)init
{
  v7.receiver = self;
  v7.super_class = (Class)RawNightModeFusionInferenceData;
  v2 = [(RawNightModeFusionInferenceData *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(RawNightModeFusionInferenceData *)v2 setNonReferenceInputFrames:v3];

    v4 = [(RawNightModeFusionInferenceData *)v2 nonReferenceInputFrames];

    if (v4
      && (v5 = objc_alloc_init(RawNightModeFusionInferencePyramid),
          [(RawNightModeFusionInferenceData *)v2 setPyramid:v5],
          v5,
          [(RawNightModeFusionInferenceData *)v2 pyramid],
          v4 = (RawNightModeFusionInferenceData *)objc_claimAutoreleasedReturnValue(),
          v4,
          v4))
    {
      v4 = v2;
    }
    else
    {
      FigSignalErrorAt();
    }
  }
  else
  {
    FigSignalErrorAt();
    v4 = 0;
  }

  return v4;
}

- (NSNumber)tilePadding
{
  return self->_tilePadding;
}

- (void)setTilePadding:(id)a3
{
}

- (NSDictionary)rawNightModeTuningParameters
{
  return self->_rawNightModeTuningParameters;
}

- (void)setRawNightModeTuningParameters:(id)a3
{
}

- (RawNightModeFusionInputFrame)referenceInputFrame
{
  return self->_referenceInputFrame;
}

- (void)setReferenceInputFrame:(id)a3
{
}

- (NSMutableArray)nonReferenceInputFrames
{
  return self->_nonReferenceInputFrames;
}

- (void)setNonReferenceInputFrames:(id)a3
{
}

- (MTLTexture)noiseMapTexture
{
  return self->_noiseMapTexture;
}

- (void)setNoiseMapTexture:(id)a3
{
}

- (MTLTexture)ggMaxFusionWeights
{
  return self->_ggMaxFusionWeights;
}

- (void)setGgMaxFusionWeights:(id)a3
{
}

- (RawNightModeFusionInferencePyramid)pyramid
{
  return self->_pyramid;
}

- (void)setPyramid:(id)a3
{
}

- (NSDictionary)batchMetadata
{
  return self->_batchMetadata;
}

- (void)setBatchMetadata:(id)a3
{
}

- (MTLTexture)lscGainsTexture
{
  return self->_lscGainsTexture;
}

- (void)setLscGainsTexture:(id)a3
{
}

- (NSDictionary)lscGainMapParameters
{
  return self->_lscGainMapParameters;
}

- (void)setLscGainMapParameters:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_lscGainMapParameters, 0);
  objc_storeStrong((id *)&self->_lscGainsTexture, 0);
  objc_storeStrong((id *)&self->_batchMetadata, 0);
  objc_storeStrong((id *)&self->_pyramid, 0);
  objc_storeStrong((id *)&self->_ggMaxFusionWeights, 0);
  objc_storeStrong((id *)&self->_noiseMapTexture, 0);
  objc_storeStrong((id *)&self->_nonReferenceInputFrames, 0);
  objc_storeStrong((id *)&self->_referenceInputFrame, 0);
  objc_storeStrong((id *)&self->_rawNightModeTuningParameters, 0);

  objc_storeStrong((id *)&self->_tilePadding, 0);
}

@end