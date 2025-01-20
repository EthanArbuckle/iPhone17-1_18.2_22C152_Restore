@interface SIPersonDetectorNetworkConfiguration
- (NSString)imageScalerIdentifier;
- (SIPersonDetectorNetworkConfiguration)init;
- (int64_t)modelConfig;
- (int64_t)networkModeEnum;
- (void)setModelConfig:(int64_t)a3;
- (void)setNetworkModeEnum:(int64_t)a3;
@end

@implementation SIPersonDetectorNetworkConfiguration

- (SIPersonDetectorNetworkConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)SIPersonDetectorNetworkConfiguration;
  v2 = [(SINetworkConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    algorithmClassName = v2->super._algorithmClassName;
    v2->super._algorithmClassName = (NSString *)@"SIPersonDetectorAlgorithm";

    imageScalerIdentifier = v3->_imageScalerIdentifier;
    v3->_imageScalerIdentifier = (NSString *)@"PersonDetector_input";

    [(SIPersonDetectorNetworkConfiguration *)v3 setModelConfig:0];
    [(SIPersonDetectorNetworkConfiguration *)v3 setNetworkModeEnum:0];
    v6 = v3;
  }

  return v3;
}

- (void)setNetworkModeEnum:(int64_t)a3
{
  networkMode = self->super._networkMode;
  self->super._networkMode = (NSString *)&stru_26CB7E380;

  self->_networkModeEnum = a3;
}

- (void)setModelConfig:(int64_t)a3
{
  networkName = self->super._networkName;
  self->super._networkName = (NSString *)@"PersonDetector";

  self->_modelConfig = a3;
}

- (int64_t)networkModeEnum
{
  return self->_networkModeEnum;
}

- (int64_t)modelConfig
{
  return self->_modelConfig;
}

- (NSString)imageScalerIdentifier
{
  return self->_imageScalerIdentifier;
}

- (void).cxx_destruct
{
}

@end