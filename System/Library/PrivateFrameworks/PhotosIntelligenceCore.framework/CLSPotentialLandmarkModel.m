@interface CLSPotentialLandmarkModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSPotentialLandmarkModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)landmarkNode;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)setupVersion32;
- (void)setupVersion33;
@end

@implementation CLSPotentialLandmarkModel

- (void).cxx_destruct
{
}

- (CLSSignalNode)landmarkNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (id)modelInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__CLSPotentialLandmarkModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_landmarkNode, 0);
  id v6 = v4;

  return v6;
}

void __38__CLSPotentialLandmarkModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482880;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  if (a3 == 2147483135)
  {
    id v4 = self->_landmarkNode;
  }
  else if ([(CLSPotentialLandmarkModel *)self isResponsibleForSignalIdentifier:a3])
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"PL - Unknown (%X)", a3);
    id v4 = [[CLSSignalNode alloc] initWithIdentifier:a3 name:v5 operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)setupVersion33
{
  self->_version = 33;
  self->_landmarkNode = [[CLSSignalNode alloc] initWithIdentifier:2147483135 name:@"PL - Landmark" operatingPoint:0.61 highPrecisionOperatingPoint:0.91 highRecallOperatingPoint:0.4];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion32
{
  self->_version = 32;
  self->_landmarkNode = [[CLSSignalNode alloc] initWithIdentifier:2147483135 name:@"PL - Landmark" operatingPoint:0.98 highPrecisionOperatingPoint:0.98 highRecallOperatingPoint:0.98];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSPotentialLandmarkModel *)self initWithSceneAnalysisVersion:33];
}

- (CLSPotentialLandmarkModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSPotentialLandmarkModel;
  id v4 = [(CLSPotentialLandmarkModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x21)
    {
      if (a3 == 32)
      {
        [(CLSPotentialLandmarkModel *)v4 setupVersion32];
      }
      else
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
    }
    else
    {
      [(CLSPotentialLandmarkModel *)v4 setupVersion33];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 33;
}

+ (NSString)name
{
  return (NSString *)@"Potential Landmark";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  if (a3 >= 0x21) {
    return 33;
  }
  else {
    return 32 * (a3 == 32);
  }
}

@end