@interface CMISmartStyleProcessorStillImageConfigurationV1
- (CGSize)intermediateStyleRendererThumbnailSize;
- (CMISmartStyleProcessorStillImageConfigurationV1)init;
- (CMIStyleEngineConfiguration)styleEngineConfiguration;
- (NSDictionary)pixelBufferAttributesForSmallLightMap;
- (NSDictionary)pixelBufferAttributesWithCapacityForLearntCoefficients;
- (NSDictionary)styleEngineTuningParameters;
- (void)dealloc;
- (void)setIntermediateStyleRendererThumbnailSize:(CGSize)a3;
- (void)setStyleEngineConfiguration:(id)a3;
- (void)setStyleEngineTuningParameters:(id)a3;
@end

@implementation CMISmartStyleProcessorStillImageConfigurationV1

- (CMISmartStyleProcessorStillImageConfigurationV1)init
{
  v6.receiver = self;
  v6.super_class = (Class)CMISmartStyleProcessorStillImageConfigurationV1;
  v2 = [(CMISmartStyleProcessorStillImageConfigurationV1 *)&v6 init];
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
  v2.super_class = (Class)CMISmartStyleProcessorStillImageConfigurationV1;
  [(CMISmartStyleProcessorStillImageConfigurationV1 *)&v2 dealloc];
}

- (NSDictionary)pixelBufferAttributesWithCapacityForLearntCoefficients
{
  +[CMIStyleEngineProcessor coefficientPixelBufferSizeForConfiguration:self->_styleEngineConfiguration float16:1];
  double v3 = v2;
  double v5 = v4;
  v11[0] = kCVPixelBufferPixelFormatTypeKey;
  objc_super v6 = +[NSNumber numberWithUnsignedInt:1278226536];
  v12[0] = v6;
  v11[1] = kCVPixelBufferWidthKey;
  v7 = +[NSNumber numberWithDouble:v3];
  v12[1] = v7;
  v11[2] = kCVPixelBufferHeightKey;
  v8 = +[NSNumber numberWithDouble:v5];
  v12[2] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return (NSDictionary *)v9;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleEngineTuningParameters, 0);

  objc_storeStrong((id *)&self->_styleEngineConfiguration, 0);
}

@end