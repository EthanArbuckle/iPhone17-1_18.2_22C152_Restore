@interface SISceneSegmentationNetworkConfiguration
- (BOOL)isResampleOutput;
- (SISceneSegmentationNetworkConfiguration)init;
- (float)uncertaintyThreshold;
- (int64_t)modelConfig;
- (int64_t)networkModeEnum;
- (void)setIsResampleOutput:(BOOL)a3;
- (void)setModelConfig:(int64_t)a3;
- (void)setNetworkModeEnum:(int64_t)a3;
- (void)setUncertaintyThreshold:(float)a3;
@end

@implementation SISceneSegmentationNetworkConfiguration

- (SISceneSegmentationNetworkConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)SISceneSegmentationNetworkConfiguration;
  v2 = [(SINetworkConfiguration *)&v9 init];
  v3 = v2;
  if (v2)
  {
    algorithmClassName = v2->super._algorithmClassName;
    v2->super._algorithmClassName = (NSString *)@"SISceneSegmentationAlgorithm";

    networkName = v3->super._networkName;
    v3->super._networkName = (NSString *)@"SceneSegmentationV9G";

    defaultVisualLoggerName = v3->super._defaultVisualLoggerName;
    v3->super._defaultVisualLoggerName = (NSString *)@"sceneSegmentation";

    [(SISceneSegmentationNetworkConfiguration *)v3 setModelConfig:0];
    [(SISceneSegmentationNetworkConfiguration *)v3 setNetworkModeEnum:0];
    v7 = v3;
  }

  return v3;
}

- (void)setNetworkModeEnum:(int64_t)a3
{
  if (a3 == 1)
  {
    networkMode = self->super._networkMode;
    v6 = @"res256x192_rgb_landscape";
  }
  else
  {
    networkMode = self->super._networkMode;
    if (a3 == 2) {
      v6 = @"res192x256_rgb_portrait";
    }
    else {
      v6 = &stru_26CB7E380;
    }
  }
  self->super._networkMode = &v6->isa;

  self->_modelConfig = a3;
}

- (void)setModelConfig:(int64_t)a3
{
  self[1].super.super.isa = (Class)a3;
}

- (int64_t)networkModeEnum
{
  return self->_modelConfig;
}

- (int64_t)modelConfig
{
  return (int64_t)self[1].super.super.isa;
}

- (BOOL)isResampleOutput
{
  return LOBYTE(self->_uncertaintyThreshold);
}

- (void)setIsResampleOutput:(BOOL)a3
{
  LOBYTE(self->_uncertaintyThreshold) = a3;
}

- (float)uncertaintyThreshold
{
  return *(float *)&self->_networkModeEnum;
}

- (void)setUncertaintyThreshold:(float)a3
{
  *(float *)&self->_networkModeEnum = a3;
}

@end