@interface SIPeopleSegmentationNetworkConfiguration
- (NSString)imageScalerIdentifier;
- (SIPeopleSegmentationNetworkConfiguration)init;
- (int64_t)modelConfig;
- (int64_t)networkModeEnum;
- (unsigned)inputImageFormat;
- (void)setModelConfig:(int64_t)a3;
- (void)setNetworkModeEnum:(int64_t)a3;
@end

@implementation SIPeopleSegmentationNetworkConfiguration

- (SIPeopleSegmentationNetworkConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)SIPeopleSegmentationNetworkConfiguration;
  v2 = [(SINetworkConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    algorithmClassName = v2->super._algorithmClassName;
    v2->super._algorithmClassName = (NSString *)@"SIPeopleSegmentationAlgorithm";

    *(&v3->_inputImageFormat + 1) = 1111970369;
    imageScalerIdentifier = v3->_imageScalerIdentifier;
    v3->_imageScalerIdentifier = (NSString *)@"PersonSegmentation_input";

    [(SIPeopleSegmentationNetworkConfiguration *)v3 setModelConfig:0];
    [(SIPeopleSegmentationNetworkConfiguration *)v3 setNetworkModeEnum:2];
    v6 = v3;
  }

  return v3;
}

- (void)setNetworkModeEnum:(int64_t)a3
{
  networkMode = self->super._networkMode;
  if (a3 == 1) {
    v6 = @"portrait";
  }
  else {
    v6 = @"landscape";
  }
  self->super._networkMode = &v6->isa;

  self->_networkModeEnum = a3;
}

- (void)setModelConfig:(int64_t)a3
{
  networkName = self->super._networkName;
  self->super._networkName = (NSString *)@"PersonSegmentation";

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

- (unsigned)inputImageFormat
{
  return *(&self->_inputImageFormat + 1);
}

- (void).cxx_destruct
{
}

@end