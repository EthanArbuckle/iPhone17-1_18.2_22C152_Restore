@interface CLSIconicScoreModel
+ (NSString)name;
+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3;
+ (unint64_t)latestVersion;
- (CLSIconicScoreModel)initWithSceneAnalysisVersion:(unint64_t)a3;
- (double)highIconicScore;
- (double)lowestPossibleIconicScore;
- (double)mediumIconicScore;
- (double)minimumMeaningfulIconicScore;
- (double)similarIconicScoreThreshold;
- (id)initForTesting;
- (unint64_t)bucketForIconicScore:(double)a3;
- (unint64_t)version;
- (void)setupVersion100;
- (void)setupVersion96;
@end

@implementation CLSIconicScoreModel

- (double)similarIconicScoreThreshold
{
  return self->_similarIconicScoreThreshold;
}

- (double)highIconicScore
{
  return self->_highIconicScore;
}

- (double)mediumIconicScore
{
  return self->_mediumIconicScore;
}

- (double)minimumMeaningfulIconicScore
{
  return self->_minimumMeaningfulIconicScore;
}

- (double)lowestPossibleIconicScore
{
  return self->_lowestPossibleIconicScore;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)bucketForIconicScore:(double)a3
{
  if (self->_minimumMeaningfulIconicScore > a3) {
    return 0;
  }
  if (self->_mediumIconicScore > a3) {
    return 1;
  }
  if (self->_highIconicScore <= a3) {
    return 3;
  }
  return 2;
}

- (void)setupVersion100
{
  self->_version = 100;
  *(_OWORD *)&self->_lowestPossibleIconicScore = xmmword_25995A3D0;
  *(_OWORD *)&self->_mediumIconicScore = xmmword_25995A3E0;
  self->_similarIconicScoreThreshold = 0.1;
}

- (void)setupVersion96
{
  self->_version = 96;
  *(_OWORD *)&self->_lowestPossibleIconicScore = xmmword_25995A3F0;
  *(_OWORD *)&self->_mediumIconicScore = xmmword_25995A400;
  self->_similarIconicScoreThreshold = 0.5;
}

- (id)initForTesting
{
  return [(CLSIconicScoreModel *)self initWithSceneAnalysisVersion:100];
}

- (CLSIconicScoreModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSIconicScoreModel;
  v4 = [(CLSIconicScoreModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x64)
    {
      if (a3 < 0x60)
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
        [(CLSIconicScoreModel *)v4 setupVersion96];
      }
    }
    else
    {
      [(CLSIconicScoreModel *)v4 setupVersion100];
    }
  }
  return v5;
}

+ (unint64_t)latestVersion
{
  return 100;
}

+ (NSString)name
{
  return (NSString *)@"Iconic Score";
}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 96;
  if (a3 < 0x60) {
    unint64_t v3 = 0;
  }
  if (a3 >= 0x64) {
    return 100;
  }
  else {
    return v3;
  }
}

@end