@interface CLSFaceModel
+ (NSString)name;
+ (unint64_t)baseFaceAnalysisVersionWithFaceAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (CLSFaceModel)initWithFaceAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)distanceNode;
- (CLSSignalNode)qualityNode;
- (id)initForTesting;
- (unint64_t)version;
- (void)setupVersion1;
- (void)setupVersion12;
@end

@implementation CLSFaceModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceNode, 0);
  objc_storeStrong((id *)&self->_qualityNode, 0);
}

- (CLSSignalNode)distanceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)qualityNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setupVersion12
{
  self->_version = 12;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Quality" operatingPoint:0.35 highPrecisionOperatingPoint:0.5 highRecallOperatingPoint:0.35];
  qualityNode = self->_qualityNode;
  self->_qualityNode = v3;

  self->_distanceNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Distance" operatingPoint:0.02 highPrecisionOperatingPoint:0.02 highRecallOperatingPoint:0.02];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion1
{
  self->_version = 1;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Quality" operatingPoint:0.2 highPrecisionOperatingPoint:0.4 highRecallOperatingPoint:0.2];
  qualityNode = self->_qualityNode;
  self->_qualityNode = v3;

  self->_distanceNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Distance" operatingPoint:0.05 highPrecisionOperatingPoint:0.05 highRecallOperatingPoint:0.05];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSFaceModel *)self initWithFaceAnalysisVersion:12];
}

- (CLSFaceModel)initWithFaceAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSFaceModel;
  v4 = [(CLSFaceModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0xC)
    {
      if (a3)
      {
        [(CLSFaceModel *)v4 setupVersion1];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = objc_opt_class();
          *(_DWORD *)buf = 67109378;
          int v10 = 0;
          __int16 v11 = 2112;
          uint64_t v12 = v6;
          _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
        }

        return 0;
      }
    }
    else
    {
      [(CLSFaceModel *)v4 setupVersion12];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 12;
}

+ (NSString)name
{
  return (NSString *)@"Face";
}

+ (unint64_t)baseFaceAnalysisVersionWithFaceAnalysisVersion:(unint64_t)a3
{
  if (a3 >= 0xC) {
    return 12;
  }
  else {
    return a3 != 0;
  }
}

@end