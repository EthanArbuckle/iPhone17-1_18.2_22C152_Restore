@interface CLSSDModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSSDModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)foodDrinkFoodieNode;
- (CLSSignalNode)foodDrinkNode;
- (CLSSignalNode)landscapeCityscapeNode;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4;
- (void)setupVersion33;
- (void)setupVersion51_4;
- (void)setupVersion85;
@end

@implementation CLSSDModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeCityscapeNode, 0);
  objc_storeStrong((id *)&self->_foodDrinkFoodieNode, 0);
  objc_storeStrong((id *)&self->_foodDrinkNode, 0);
}

- (CLSSignalNode)landscapeCityscapeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)foodDrinkFoodieNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)foodDrinkNode
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
  v8[2] = __23__CLSSDModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_foodDrinkNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_landscapeCityscapeNode, 0);
  id v6 = v4;

  return v6;
}

void __23__CLSSDModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (void)processSignals:(id)a3 intoProcessedSignals:(id)a4
{
  id v12 = a4;
  id v6 = [a3 objectForKeyedSubscript:&unk_270771150];
  [v6 doubleValue];
  double v8 = v7;

  unint64_t version = self->_version;
  if (version <= 0x54)
  {
    v11 = v12;
    if (version < 0x21) {
      goto LABEL_6;
    }
    double v10 = 0.99;
  }
  else
  {
    double v10 = 0.962;
    v11 = v12;
  }
  [v11 setIsShowcasingFood:v8 >= v10];
  v11 = v12;
LABEL_6:
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (a3 & 0x7FFFFF00) == 2147482368;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  if (a3 == 2147482623)
  {
    landscapeCityscapeNode = self->_landscapeCityscapeNode;
    goto LABEL_5;
  }
  if (a3 == 2147482622)
  {
    landscapeCityscapeNode = self->_foodDrinkNode;
LABEL_5:
    v5 = landscapeCityscapeNode;
    goto LABEL_9;
  }
  if ([(CLSSDModel *)self isResponsibleForSignalIdentifier:a3])
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"SD - Unknown (%X)", a3);
    v5 = [[CLSSignalNode alloc] initWithIdentifier:a3 name:v6 operatingPoint:0.0 highPrecisionOperatingPoint:0.0 highRecallOperatingPoint:0.0];
  }
  else
  {
    v5 = 0;
  }
LABEL_9:
  return v5;
}

- (void)setupVersion85
{
  self->_unint64_t version = 85;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482622 name:@"SD - Food Drink" operatingPoint:0.818 highPrecisionOperatingPoint:0.939 highRecallOperatingPoint:0.58];
  foodDrinkNode = self->_foodDrinkNode;
  self->_foodDrinkNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482623 name:@"SD - Landscape Cityscape" operatingPoint:0.706 highPrecisionOperatingPoint:0.897 highRecallOperatingPoint:0.457];
  landscapeCityscapeNode = self->_landscapeCityscapeNode;
  self->_landscapeCityscapeNode = v5;

  self->_foodDrinkFoodieNode = [[CLSSignalNode alloc] initWithIdentifier:2147482622 name:@"Food Drink Foodie" operatingPoint:0.962 highPrecisionOperatingPoint:0.962 highRecallOperatingPoint:0.962];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion51_4
{
  self->_unint64_t version = 51;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482622 name:@"SD - Food Drink" operatingPoint:0.99 highPrecisionOperatingPoint:0.997 highRecallOperatingPoint:0.97];
  foodDrinkNode = self->_foodDrinkNode;
  self->_foodDrinkNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482623 name:@"SD - Landscape Cityscape" operatingPoint:0.995 highPrecisionOperatingPoint:0.999 highRecallOperatingPoint:0.98];
  landscapeCityscapeNode = self->_landscapeCityscapeNode;
  self->_landscapeCityscapeNode = v5;

  self->_foodDrinkFoodieNode = [[CLSSignalNode alloc] initWithIdentifier:2147482622 name:@"Food Drink Foodie" operatingPoint:0.99 highPrecisionOperatingPoint:0.99 highRecallOperatingPoint:0.99];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion33
{
  self->_unint64_t version = 33;
  id v3 = [[CLSSignalNode alloc] initWithIdentifier:2147482622 name:@"SD - Food Drink" operatingPoint:0.99 highPrecisionOperatingPoint:0.997 highRecallOperatingPoint:0.96];
  foodDrinkNode = self->_foodDrinkNode;
  self->_foodDrinkNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:2147482623 name:@"SD - Landscape Cityscape" operatingPoint:0.995 highPrecisionOperatingPoint:0.999 highRecallOperatingPoint:0.98];
  landscapeCityscapeNode = self->_landscapeCityscapeNode;
  self->_landscapeCityscapeNode = v5;

  self->_foodDrinkFoodieNode = [[CLSSignalNode alloc] initWithIdentifier:2147482622 name:@"Food Drink Foodie" operatingPoint:0.99 highPrecisionOperatingPoint:0.99 highRecallOperatingPoint:0.99];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSSDModel *)self initWithSceneAnalysisVersion:85];
}

- (CLSSDModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSSDModel;
  id v4 = [(CLSSDModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x55)
    {
      if (a3 < 0x33)
      {
        if (a3 < 0x21)
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
          [(CLSSDModel *)v4 setupVersion33];
        }
      }
      else
      {
        [(CLSSDModel *)v4 setupVersion51];
      }
    }
    else
    {
      [(CLSSDModel *)v4 setupVersion85];
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
  return (NSString *)@"SD";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 51;
  uint64_t v4 = 33;
  if (a3 < 0x21) {
    uint64_t v4 = 0;
  }
  if (a3 <= 0x32) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x54) {
    return v3;
  }
  else {
    return 85;
  }
}

@end