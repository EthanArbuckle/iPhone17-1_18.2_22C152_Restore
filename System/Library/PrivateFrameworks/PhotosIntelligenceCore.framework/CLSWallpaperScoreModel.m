@interface CLSWallpaperScoreModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (CLSSignalNode)catNode;
- (CLSSignalNode)cityscapeNode;
- (CLSSignalNode)dogNode;
- (CLSSignalNode)landscapeNode;
- (CLSSignalNode)minimumWallpaperScoreNode;
- (CLSSignalNode)peopleNode;
- (CLSSignalNode)petNode;
- (CLSWallpaperScoreModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (id)initForTesting;
- (unint64_t)version;
- (void)setupVersion77;
- (void)setupVersion88;
@end

@implementation CLSWallpaperScoreModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumWallpaperScoreNode, 0);
  objc_storeStrong((id *)&self->_peopleNode, 0);
  objc_storeStrong((id *)&self->_petNode, 0);
  objc_storeStrong((id *)&self->_dogNode, 0);
  objc_storeStrong((id *)&self->_catNode, 0);
  objc_storeStrong((id *)&self->_landscapeNode, 0);
  objc_storeStrong((id *)&self->_cityscapeNode, 0);
}

- (CLSSignalNode)minimumWallpaperScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)peopleNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)petNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)dogNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)catNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)landscapeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)cityscapeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setupVersion88
{
  self->_version = 88;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Cityscape" operatingPoint:0.68 highPrecisionOperatingPoint:0.7 highRecallOperatingPoint:0.6];
  cityscapeNode = self->_cityscapeNode;
  self->_cityscapeNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Landscape" operatingPoint:0.58 highPrecisionOperatingPoint:0.6 highRecallOperatingPoint:0.4];
  landscapeNode = self->_landscapeNode;
  self->_landscapeNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Cat" operatingPoint:0.52 highPrecisionOperatingPoint:0.56 highRecallOperatingPoint:0.41];
  catNode = self->_catNode;
  self->_catNode = v7;

  v9 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Dog" operatingPoint:0.61 highPrecisionOperatingPoint:0.71 highRecallOperatingPoint:0.31];
  dogNode = self->_dogNode;
  self->_dogNode = v9;

  v11 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Pet" operatingPoint:0.52 highPrecisionOperatingPoint:0.56 highRecallOperatingPoint:0.31];
  petNode = self->_petNode;
  self->_petNode = v11;

  v13 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - People" operatingPoint:0.27 highPrecisionOperatingPoint:0.4 highRecallOperatingPoint:0.2];
  peopleNode = self->_peopleNode;
  self->_peopleNode = v13;

  self->_minimumWallpaperScoreNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - MinimumWallpaperScore" operatingPoint:0.24 highPrecisionOperatingPoint:0.24 highRecallOperatingPoint:0.24];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion77
{
  self->_version = 77;
  v3 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Cityscape" operatingPoint:0.43 highPrecisionOperatingPoint:0.43 highRecallOperatingPoint:0.43];
  cityscapeNode = self->_cityscapeNode;
  self->_cityscapeNode = v3;

  v5 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Landscape" operatingPoint:0.53 highPrecisionOperatingPoint:0.53 highRecallOperatingPoint:0.53];
  landscapeNode = self->_landscapeNode;
  self->_landscapeNode = v5;

  v7 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Cat" operatingPoint:0.5 highPrecisionOperatingPoint:0.5 highRecallOperatingPoint:0.5];
  catNode = self->_catNode;
  self->_catNode = v7;

  v9 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Dog" operatingPoint:0.6 highPrecisionOperatingPoint:0.6 highRecallOperatingPoint:0.6];
  dogNode = self->_dogNode;
  self->_dogNode = v9;

  [(CLSSignalNode *)self->_catNode operatingPoint];
  double v12 = v11;
  [(CLSSignalNode *)self->_dogNode operatingPoint];
  if (v12 < v13) {
    double v12 = v13;
  }
  v14 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - Pet" operatingPoint:v12 highPrecisionOperatingPoint:v12 highRecallOperatingPoint:v12];
  petNode = self->_petNode;
  self->_petNode = v14;

  v16 = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - People" operatingPoint:0.43 highPrecisionOperatingPoint:0.43 highRecallOperatingPoint:0.43];
  peopleNode = self->_peopleNode;
  self->_peopleNode = v16;

  self->_minimumWallpaperScoreNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"Wallpaper - MinimumWallpaperScore" operatingPoint:0.24 highPrecisionOperatingPoint:0.24 highRecallOperatingPoint:0.24];
  MEMORY[0x270F9A758]();
}

- (id)initForTesting
{
  return [(CLSWallpaperScoreModel *)self initWithSceneAnalysisVersion:88];
}

- (CLSWallpaperScoreModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSWallpaperScoreModel;
  v4 = [(CLSWallpaperScoreModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x58)
    {
      if (a3 < 0x4D)
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
        [(CLSWallpaperScoreModel *)v4 setupVersion77];
      }
    }
    else
    {
      [(CLSWallpaperScoreModel *)v4 setupVersion88];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 88;
}

+ (NSString)name
{
  return (NSString *)@"Wallpaper Score";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 77;
  if (a3 < 0x4D) {
    unint64_t v3 = 0;
  }
  if (a3 >= 0x58) {
    return 88;
  }
  else {
    return v3;
  }
}

@end