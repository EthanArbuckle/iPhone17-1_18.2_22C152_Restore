@interface CLSTrendsSceneModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3;
- (CLSSignalNode)aircraftNode;
- (CLSSignalNode)airplaneNode;
- (CLSSignalNode)birdNode;
- (CLSSignalNode)flowerNode;
- (CLSSignalNode)forestNode;
- (CLSSignalNode)rainbowNode;
- (CLSSignalNode)skateboardingNode;
- (CLSSignalNode)skyscraperNode;
- (CLSSignalNode)snowNode;
- (CLSSignalNode)sunsetSunriseNode;
- (CLSTrendsSceneModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (id)initForTesting;
- (id)modelInfo;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (unint64_t)version;
- (void)setupVersion33;
- (void)setupVersion80;
- (void)setupVersion84;
@end

@implementation CLSTrendsSceneModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sunsetSunriseNode, 0);
  objc_storeStrong((id *)&self->_snowNode, 0);
  objc_storeStrong((id *)&self->_skyscraperNode, 0);
  objc_storeStrong((id *)&self->_skateboardingNode, 0);
  objc_storeStrong((id *)&self->_rainbowNode, 0);
  objc_storeStrong((id *)&self->_forestNode, 0);
  objc_storeStrong((id *)&self->_flowerNode, 0);
  objc_storeStrong((id *)&self->_birdNode, 0);
  objc_storeStrong((id *)&self->_airplaneNode, 0);
  objc_storeStrong((id *)&self->_aircraftNode, 0);
}

- (CLSSignalNode)sunsetSunriseNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (CLSSignalNode)snowNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)skyscraperNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)skateboardingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)rainbowNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)forestNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)flowerNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)birdNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)airplaneNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)aircraftNode
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
  v8[2] = __32__CLSTrendsSceneModel_modelInfo__block_invoke;
  v8[3] = &unk_265454170;
  id v4 = v3;
  id v9 = v4;
  v5 = (void (**)(void, void, void))MEMORY[0x25A2E1E50](v8);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_aircraftNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_airplaneNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_birdNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_flowerNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_forestNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_rainbowNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_skateboardingNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_skyscraperNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_snowNode, 0);
  ((void (**)(void, CLSSignalNode *, void))v5)[2](v5, self->_sunsetSunriseNode, 0);
  id v6 = v4;

  return v6;
}

void __32__CLSTrendsSceneModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return a3 >> 4 < 0x271 || (a3 & 0x80000000) != 0;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  id v4 = 0;
  if ((uint64_t)a3 > 568)
  {
    if ((uint64_t)a3 <= 1214)
    {
      if (a3 == 569)
      {
        uint64_t v5 = 40;
      }
      else
      {
        if (a3 != 1072) {
          goto LABEL_25;
        }
        uint64_t v5 = 56;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4BFuLL:
          uint64_t v5 = 64;
          break;
        case 0x4D6uLL:
          uint64_t v5 = 80;
          break;
        case 0x6E5uLL:
          uint64_t v5 = 88;
          break;
        default:
          goto LABEL_25;
      }
    }
  }
  else if ((uint64_t)a3 <= 105)
  {
    if (a3 == 16)
    {
      uint64_t v5 = 48;
    }
    else
    {
      if (a3 != 36) {
        goto LABEL_25;
      }
      uint64_t v5 = 72;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x6AuLL:
        uint64_t v5 = 16;
        break;
      case 0x6BuLL:
        uint64_t v5 = 24;
        break;
      case 0xD5uLL:
        uint64_t v5 = 32;
        break;
      default:
        goto LABEL_25;
    }
  }
  id v4 = *(id *)((char *)&self->super.isa + v5);
LABEL_25:
  return v4;
}

- (void)setupVersion84
{
  self->_version = 84;
  uint64_t v3 = [[CLSSignalNode alloc] initWithIdentifier:106 name:@"Trend - Aircraft" operatingPoint:0.35 highPrecisionOperatingPoint:0.35 highRecallOperatingPoint:0.35];
  aircraftNode = self->_aircraftNode;
  self->_aircraftNode = v3;

  uint64_t v5 = [[CLSSignalNode alloc] initWithIdentifier:107 name:@"Trend - Airplane" operatingPoint:0.58 highPrecisionOperatingPoint:0.58 highRecallOperatingPoint:0.58];
  airplaneNode = self->_airplaneNode;
  self->_airplaneNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:213 name:@"Trend - Bird" operatingPoint:0.35 highPrecisionOperatingPoint:0.35 highRecallOperatingPoint:0.35];
  birdNode = self->_birdNode;
  self->_birdNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:569 name:@"Trend - Flower" operatingPoint:0.25 highPrecisionOperatingPoint:0.25 highRecallOperatingPoint:0.25];
  flowerNode = self->_flowerNode;
  self->_flowerNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:16 name:@"Trend - Forest" operatingPoint:0.57 highPrecisionOperatingPoint:0.57 highRecallOperatingPoint:0.57];
  forestNode = self->_forestNode;
  self->_forestNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:1072 name:@"Trend - Rainbow" operatingPoint:0.51 highPrecisionOperatingPoint:0.51 highRecallOperatingPoint:0.51];
  rainbowNode = self->_rainbowNode;
  self->_rainbowNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:1215 name:@"Trend - Skateboarding" operatingPoint:0.69 highPrecisionOperatingPoint:0.69 highRecallOperatingPoint:0.69];
  skateboardingNode = self->_skateboardingNode;
  self->_skateboardingNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:36 name:@"Trend - Skyscraper" operatingPoint:0.41 highPrecisionOperatingPoint:0.41 highRecallOperatingPoint:0.41];
  skyscraperNode = self->_skyscraperNode;
  self->_skyscraperNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:1238 name:@"Trend - Snow" operatingPoint:0.62 highPrecisionOperatingPoint:0.62 highRecallOperatingPoint:0.62];
  snowNode = self->_snowNode;
  self->_snowNode = v19;

  self->_sunsetSunriseNode = [[CLSSignalNode alloc] initWithIdentifier:1765 name:@"Trend - SunsetSunrise" operatingPoint:0.57 highPrecisionOperatingPoint:0.57 highRecallOperatingPoint:0.57];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion80
{
  self->_version = 80;
  uint64_t v3 = [[CLSSignalNode alloc] initWithIdentifier:106 name:@"Trend - Aircraft" operatingPoint:0.44 highPrecisionOperatingPoint:0.44 highRecallOperatingPoint:0.44];
  aircraftNode = self->_aircraftNode;
  self->_aircraftNode = v3;

  uint64_t v5 = [[CLSSignalNode alloc] initWithIdentifier:107 name:@"Trend - Airplane" operatingPoint:0.55 highPrecisionOperatingPoint:0.55 highRecallOperatingPoint:0.55];
  airplaneNode = self->_airplaneNode;
  self->_airplaneNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:213 name:@"Trend - Bird" operatingPoint:0.43 highPrecisionOperatingPoint:0.43 highRecallOperatingPoint:0.43];
  birdNode = self->_birdNode;
  self->_birdNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:569 name:@"Trend - Flower" operatingPoint:0.23 highPrecisionOperatingPoint:0.23 highRecallOperatingPoint:0.23];
  flowerNode = self->_flowerNode;
  self->_flowerNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:16 name:@"Trend - Forest" operatingPoint:0.68 highPrecisionOperatingPoint:0.68 highRecallOperatingPoint:0.68];
  forestNode = self->_forestNode;
  self->_forestNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:1072 name:@"Trend - Rainbow" operatingPoint:0.64 highPrecisionOperatingPoint:0.64 highRecallOperatingPoint:0.64];
  rainbowNode = self->_rainbowNode;
  self->_rainbowNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:1215 name:@"Trend - Skateboarding" operatingPoint:0.72 highPrecisionOperatingPoint:0.72 highRecallOperatingPoint:0.72];
  skateboardingNode = self->_skateboardingNode;
  self->_skateboardingNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:36 name:@"Trend - Skyscraper" operatingPoint:0.43 highPrecisionOperatingPoint:0.43 highRecallOperatingPoint:0.43];
  skyscraperNode = self->_skyscraperNode;
  self->_skyscraperNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:1238 name:@"Trend - Snow" operatingPoint:0.85 highPrecisionOperatingPoint:0.85 highRecallOperatingPoint:0.85];
  snowNode = self->_snowNode;
  self->_snowNode = v19;

  self->_sunsetSunriseNode = [[CLSSignalNode alloc] initWithIdentifier:1765 name:@"Trend - SunsetSunrise" operatingPoint:0.62 highPrecisionOperatingPoint:0.62 highRecallOperatingPoint:0.62];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion33
{
  self->_version = 33;
  uint64_t v3 = [[CLSSignalNode alloc] initWithIdentifier:106 name:@"Trend - Aircraft" operatingPoint:0.64 highPrecisionOperatingPoint:0.64 highRecallOperatingPoint:0.64];
  aircraftNode = self->_aircraftNode;
  self->_aircraftNode = v3;

  uint64_t v5 = [[CLSSignalNode alloc] initWithIdentifier:107 name:@"Trend - Airplane" operatingPoint:0.71 highPrecisionOperatingPoint:0.71 highRecallOperatingPoint:0.71];
  airplaneNode = self->_airplaneNode;
  self->_airplaneNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:213 name:@"Trend - Bird" operatingPoint:0.86 highPrecisionOperatingPoint:0.86 highRecallOperatingPoint:0.86];
  birdNode = self->_birdNode;
  self->_birdNode = v7;

  id v9 = [[CLSSignalNode alloc] initWithIdentifier:569 name:@"Trend - Flower" operatingPoint:0.37 highPrecisionOperatingPoint:0.37 highRecallOperatingPoint:0.37];
  flowerNode = self->_flowerNode;
  self->_flowerNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:16 name:@"Trend - Forest" operatingPoint:0.49 highPrecisionOperatingPoint:0.49 highRecallOperatingPoint:0.49];
  forestNode = self->_forestNode;
  self->_forestNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:1072 name:@"Trend - Rainbow" operatingPoint:0.85 highPrecisionOperatingPoint:0.85 highRecallOperatingPoint:0.85];
  rainbowNode = self->_rainbowNode;
  self->_rainbowNode = v13;

  v15 = [[CLSSignalNode alloc] initWithIdentifier:1215 name:@"Trend - Skateboarding" operatingPoint:0.87 highPrecisionOperatingPoint:0.87 highRecallOperatingPoint:0.87];
  skateboardingNode = self->_skateboardingNode;
  self->_skateboardingNode = v15;

  v17 = [[CLSSignalNode alloc] initWithIdentifier:36 name:@"Trend - Skyscraper" operatingPoint:0.54 highPrecisionOperatingPoint:0.54 highRecallOperatingPoint:0.54];
  skyscraperNode = self->_skyscraperNode;
  self->_skyscraperNode = v17;

  v19 = [[CLSSignalNode alloc] initWithIdentifier:1238 name:@"Trend - Snow" operatingPoint:0.85 highPrecisionOperatingPoint:0.85 highRecallOperatingPoint:0.85];
  snowNode = self->_snowNode;
  self->_snowNode = v19;

  self->_sunsetSunriseNode = [[CLSSignalNode alloc] initWithIdentifier:1765 name:@"Trend - SunsetSunrise" operatingPoint:0.63 highPrecisionOperatingPoint:0.63 highRecallOperatingPoint:0.63];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSTrendsSceneModel *)self initWithSceneAnalysisVersion:84];
}

- (CLSTrendsSceneModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSTrendsSceneModel;
  id v4 = [(CLSTrendsSceneModel *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3 < 0x54)
    {
      if (a3 < 0x50)
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
          [(CLSTrendsSceneModel *)v4 setupVersion33];
        }
      }
      else
      {
        [(CLSTrendsSceneModel *)v4 setupVersion80];
      }
    }
    else
    {
      [(CLSTrendsSceneModel *)v4 setupVersion84];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 84;
}

+ (NSString)name
{
  return (NSString *)@"Trend";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  if (a3 >= 0x21) {
    return 33;
  }
  else {
    return 0;
  }
}

@end