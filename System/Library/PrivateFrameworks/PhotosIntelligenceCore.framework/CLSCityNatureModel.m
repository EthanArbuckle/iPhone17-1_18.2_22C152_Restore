@interface CLSCityNatureModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
+ (void)enumerateModelsAscending:(BOOL)a3 usingBlock:(id)a4;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSCityNatureModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)cityNatureishNode;
- (CLSSignalNode)cityNode;
- (CLSSignalNode)natureNode;
- (double)cityscapeWallpaperSuggestionCityThreshold;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)setupVersion82;
- (void)setupVersion85;
@end

@implementation CLSCityNatureModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureishNode, 0);
  objc_storeStrong((id *)&self->_cityNode, 0);
  objc_storeStrong((id *)&self->_natureNode, 0);
}

- (double)cityscapeWallpaperSuggestionCityThreshold
{
  return self->_cityscapeWallpaperSuggestionCityThreshold;
}

- (CLSSignalNode)cityNatureishNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)cityNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)natureNode
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
  v8[2] = __31__CLSCityNatureModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_natureNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_cityNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_cityNatureishNode, 0);
  id v6 = v4;

  return v6;
}

void __31__CLSCityNatureModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147481344;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  switch(a3)
  {
    case 0x7FFFF7FF:
      cityNatureishNode = self->_cityNatureishNode;
      goto LABEL_7;
    case 0x7FFFF7FE:
      cityNatureishNode = self->_cityNode;
      goto LABEL_7;
    case 0x7FFFF7FD:
      cityNatureishNode = self->_natureNode;
LABEL_7:
      v5 = cityNatureishNode;
      goto LABEL_8;
  }
  if ([(CLSCityNatureModel *)self isResponsibleForSignalIdentifier:a3])
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"City Nature - Unknown (%X)", a3);
    v5 = [[CLSSignalNode alloc] initWithIdentifier:a3 name:v7 operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  }
  else
  {
    v5 = 0;
  }
LABEL_8:
  return v5;
}

- (void)setupVersion85
{
  self->_version = 85;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147481597 name:@"City Nature - Nature" operatingPoint:0.704 highPrecisionOperatingPoint:0.969 highRecallOperatingPoint:0.307];
  natureNode = self->_natureNode;
  self->_natureNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147481598 name:@"City Nature - City" operatingPoint:0.347 highPrecisionOperatingPoint:0.684 highRecallOperatingPoint:0.081];
  cityNode = self->_cityNode;
  self->_cityNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:2147481599 name:@"City Nature - City Natureish" operatingPoint:0.0192 highPrecisionOperatingPoint:0.141 highRecallOperatingPoint:0.005];
  cityNatureishNode = self->_cityNatureishNode;
  self->_cityNatureishNode = v7;

  self->_cityscapeWallpaperSuggestionCityThreshold = 0.9;
}

- (void)setupVersion82
{
  self->_version = 82;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147481597 name:@"City Nature - Nature" operatingPoint:0.248 highPrecisionOperatingPoint:0.676 highRecallOperatingPoint:0.06];
  natureNode = self->_natureNode;
  self->_natureNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147481598 name:@"City Nature - City" operatingPoint:0.225 highPrecisionOperatingPoint:0.459 highRecallOperatingPoint:0.052];
  cityNode = self->_cityNode;
  self->_cityNode = v5;

  self->_cityNatureishNode = [[CLSSignalNode alloc] initWithIdentifier:2147481599 name:@"City Nature - City Natureish" operatingPoint:0.341 highPrecisionOperatingPoint:0.551 highRecallOperatingPoint:0.088];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSCityNatureModel *)self initWithSceneAnalysisVersion:85];
}

- (CLSCityNatureModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSCityNatureModel;
  id v4 = [(CLSCityNatureModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x55)
    {
      if (a3 < 0x52)
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
        [(CLSCityNatureModel *)v4 setupVersion82];
      }
    }
    else
    {
      [(CLSCityNatureModel *)v4 setupVersion85];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 85;
}

+ (NSString)name
{
  return (NSString *)@"CityNature";
}

+ (void)enumerateModelsAscending:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  v5 = (void (**)(id, void))a4;
  id v9 = [[CLSCityNatureModel alloc] initWithSceneAnalysisVersion:82];
  uint64_t v6 = [[CLSCityNatureModel alloc] initWithSceneAnalysisVersion:85];
  if (v4) {
    v7 = v9;
  }
  else {
    v7 = v6;
  }
  if (v4) {
    objc_super v8 = v6;
  }
  else {
    objc_super v8 = v9;
  }
  ((void (**)(id, CLSCityNatureModel *))v5)[2](v5, v7);
  ((void (**)(id, CLSCityNatureModel *))v5)[2](v5, v8);
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 82;
  if (a3 < 0x52) {
    unint64_t v3 = 0;
  }
  if (a3 >= 0x55) {
    return 85;
  }
  else {
    return v3;
  }
}

@end