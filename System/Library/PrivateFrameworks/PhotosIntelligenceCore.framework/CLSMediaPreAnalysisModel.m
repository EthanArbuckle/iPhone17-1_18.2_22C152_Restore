@interface CLSMediaPreAnalysisModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isWronglyRotatedForDirection:(signed __int16)a3 confidence:(double)a4;
- (CLSMediaPreAnalysisModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)exposureNode;
- (CLSSignalNode)sharpnessNode;
- (id)initForTesting;
- (unint64_t)version;
- (void)setupVersion31;
- (void)setupVersion45;
- (void)setupVersion57;
@end

@implementation CLSMediaPreAnalysisModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureNode, 0);
  objc_storeStrong((id *)&self->_sharpnessNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection270DegreesConfidenceNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection180DegreesConfidenceNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection90DegreesConfidenceNode, 0);
  objc_storeStrong((id *)&self->_probableRotationDirection0DegreesConfidenceNode, 0);
}

- (CLSSignalNode)exposureNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)sharpnessNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)isWronglyRotatedForDirection:(signed __int16)a3 confidence:(double)a4
{
  if ((a3 - 2) > 2) {
    return 0;
  }
  else {
    return [*((id *)&self->_probableRotationDirection90DegreesConfidenceNode + (a3 - 2)) passesWithConfidence:a4];
  }
}

- (void)setupVersion57
{
  [(CLSMediaPreAnalysisModel *)self setupVersion45];
  self->_version = 57;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Probable Rotation Direction Confidence" operatingPoint:0.05 highPrecisionOperatingPoint:0.05 highRecallOperatingPoint:0.05];
  probableRotationDirection0DegreesConfidenceNode = self->_probableRotationDirection0DegreesConfidenceNode;
  self->_probableRotationDirection0DegreesConfidenceNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Probable Rotation Direction Confidence" operatingPoint:0.1 highPrecisionOperatingPoint:0.1 highRecallOperatingPoint:0.1];
  probableRotationDirection90DegreesConfidenceNode = self->_probableRotationDirection90DegreesConfidenceNode;
  self->_probableRotationDirection90DegreesConfidenceNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Probable Rotation Direction Confidence" operatingPoint:0.1 highPrecisionOperatingPoint:0.1 highRecallOperatingPoint:0.1];
  probableRotationDirection180DegreesConfidenceNode = self->_probableRotationDirection180DegreesConfidenceNode;
  self->_probableRotationDirection180DegreesConfidenceNode = v7;

  self->_probableRotationDirection270DegreesConfidenceNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Probable Rotation Direction Confidence" operatingPoint:0.1 highPrecisionOperatingPoint:0.1 highRecallOperatingPoint:0.1];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion45
{
  self->_version = 45;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Sharpness" operatingPoint:0.25 highPrecisionOperatingPoint:0.7 highRecallOperatingPoint:0.25];
  sharpnessNode = self->_sharpnessNode;
  self->_sharpnessNode = v3;

  self->_exposureNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Exposure" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion31
{
  self->_version = 31;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Sharpness" operatingPoint:0.01 highPrecisionOperatingPoint:0.3 highRecallOperatingPoint:0.01];
  sharpnessNode = self->_sharpnessNode;
  self->_sharpnessNode = v3;

  self->_exposureNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Exposure" operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSMediaPreAnalysisModel *)self initWithSceneAnalysisVersion:57];
}

- (CLSMediaPreAnalysisModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSMediaPreAnalysisModel;
  v4 = [(CLSMediaPreAnalysisModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x39)
    {
      if (a3 < 0x2D)
      {
        if (a3 < 0x1F)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v6 = objc_opt_class();
            *(_DWORD *)buf = 67109378;
            int v10 = a3;
            __int16 v11 = 2112;
            uint64_t v12 = v6;
            _os_log_impl(&dword_259939000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
          }

          return 0;
        }
        else
        {
          [(CLSMediaPreAnalysisModel *)v4 setupVersion31];
        }
      }
      else
      {
        [(CLSMediaPreAnalysisModel *)v4 setupVersion45];
      }
    }
    else
    {
      [(CLSMediaPreAnalysisModel *)v4 setupVersion57];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 57;
}

+ (NSString)name
{
  return (NSString *)@"Media PreAnalysis";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 45;
  uint64_t v4 = 31;
  if (a3 < 0x1F) {
    uint64_t v4 = 0;
  }
  if (a3 <= 0x2C) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x38) {
    return v3;
  }
  else {
    return 57;
  }
}

@end