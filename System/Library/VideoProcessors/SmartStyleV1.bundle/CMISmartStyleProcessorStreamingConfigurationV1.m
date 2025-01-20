@interface CMISmartStyleProcessorStreamingConfigurationV1
- (CGSize)intermediateStyleRendererThumbnailSize;
- (CMISmartStyleProcessorStreamingConfigurationV1)init;
- (CMIStyleEngineConfiguration)styleEngineConfiguration;
- (NSDictionary)pixelBufferAttributesForSmallLightMap;
- (NSDictionary)pixelBufferAttributesWithCapacityForLearntCoefficients;
- (NSDictionary)styleEngineTuningParameters;
- (int)temporalFilterInputBufferSize;
- (void)dealloc;
- (void)setIntermediateStyleRendererThumbnailSize:(CGSize)a3;
- (void)setStyleEngineConfiguration:(id)a3;
- (void)setStyleEngineTuningParameters:(id)a3;
- (void)setTemporalFilterInputBufferSize:(int)a3;
@end

@implementation CMISmartStyleProcessorStreamingConfigurationV1

- (CMISmartStyleProcessorStreamingConfigurationV1)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMISmartStyleProcessorStreamingConfigurationV1;
  v2 = [(CMISmartStyleProcessorStreamingConfigurationV1 *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }
  else {
    FigDebugAssert3();
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMISmartStyleProcessorStreamingConfigurationV1;
  [(CMISmartStyleProcessorStreamingConfigurationV1 *)&v2 dealloc];
}

- (NSDictionary)pixelBufferAttributesWithCapacityForLearntCoefficients
{
  +[CMIStyleEngineProcessor coefficientPixelBufferSizeForConfiguration:self->_styleEngineConfiguration float16:0];
  double v3 = v2;
  v9[0] = &off_18798;
  v8[0] = kCVPixelBufferPixelFormatTypeKey;
  v8[1] = kCVPixelBufferWidthKey;
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9[1] = v4;
  v8[2] = kCVPixelBufferHeightKey;
  v5 = +[NSNumber numberWithDouble:v3];
  v9[2] = v5;
  objc_super v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSDictionary)pixelBufferAttributesForSmallLightMap
{
  v4[0] = kCVPixelBufferPixelFormatTypeKey;
  v4[1] = kCVPixelBufferWidthKey;
  v5[0] = &off_18768;
  v5[1] = &off_18780;
  v4[2] = kCVPixelBufferHeightKey;
  v5[2] = &off_18780;
  double v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return (NSDictionary *)v2;
}

- (CGSize)intermediateStyleRendererThumbnailSize
{
  double width = self->_intermediateStyleRendererThumbnailSize.width;
  double height = self->_intermediateStyleRendererThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIntermediateStyleRendererThumbnailSize:(CGSize)a3
{
  self->_intermediateStyleRendererThumbnailSize = a3;
}

- (CMIStyleEngineConfiguration)styleEngineConfiguration
{
  return self->_styleEngineConfiguration;
}

- (void)setStyleEngineConfiguration:(id)a3
{
}

- (NSDictionary)styleEngineTuningParameters
{
  return self->_styleEngineTuningParameters;
}

- (void)setStyleEngineTuningParameters:(id)a3
{
}

- (int)temporalFilterInputBufferSize
{
  return self->_temporalFilterInputBufferSize;
}

- (void)setTemporalFilterInputBufferSize:(int)a3
{
  self->_temporalFilterInputBufferSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleEngineTuningParameters, 0);

  objc_storeStrong((id *)&self->_styleEngineConfiguration, 0);
}

@end