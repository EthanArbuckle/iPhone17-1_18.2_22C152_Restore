@interface CLSMediaAnalysisModel
+ (NSString)name;
+ (unint64_t)baseMediaAnalysisVersionWithMediaAnalysisVersion:(unint64_t)a3;
+ (unint64_t)baseVideoHighlightVersion;
+ (unint64_t)latestVersion;
- (CLSMediaAnalysisModel)initWithMediaAnalysisVersion:(unint64_t)a3;
- (CLSSignalNode)settlingEffectScoreNode;
- (double)autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset;
- (double)autoplaySuggestionScoreThresholdToBeInteresting;
- (double)videoScoreThresholdToBeInteresting;
- (double)videoScoreThresholdToNotBeJunk;
- (id)initForTesting;
- (unint64_t)version;
- (void)setupVersion33;
- (void)setupVersion59;
- (void)setupVersion61;
@end

@implementation CLSMediaAnalysisModel

- (void).cxx_destruct
{
}

- (CLSSignalNode)settlingEffectScoreNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (double)autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset
{
  return self->_autoplaySuggestionScoreExclusiveThresholdForVideoKeyAsset;
}

- (double)autoplaySuggestionScoreThresholdToBeInteresting
{
  return self->_autoplaySuggestionScoreThresholdToBeInteresting;
}

- (double)videoScoreThresholdToNotBeJunk
{
  return self->_videoScoreThresholdToNotBeJunk;
}

- (double)videoScoreThresholdToBeInteresting
{
  return self->_videoScoreThresholdToBeInteresting;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setupVersion61
{
  self->_version = 61;
  *(_OWORD *)&self->_videoScoreThresholdToBeInteresting = xmmword_25995A440;
  *(_OWORD *)&self->_autoplaySuggestionScoreThresholdToBeInteresting = xmmword_25995A450;
  self->_settlingEffectScoreNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"SettlingEffectScore" operatingPoint:0.7 highPrecisionOperatingPoint:0.75 highRecallOperatingPoint:0.65];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion59
{
  self->_version = 59;
  *(_OWORD *)&self->_videoScoreThresholdToBeInteresting = xmmword_25995A440;
  *(_OWORD *)&self->_autoplaySuggestionScoreThresholdToBeInteresting = xmmword_25995A450;
  self->_settlingEffectScoreNode = [[CLSSignalNode alloc] initWithIdentifier:0 name:@"SettlingEffectScore" operatingPoint:0.7 highPrecisionOperatingPoint:0.75 highRecallOperatingPoint:0.65];
  MEMORY[0x270F9A758]();
}

- (void)setupVersion33
{
  self->_version = 33;
  *(_OWORD *)&self->_videoScoreThresholdToBeInteresting = xmmword_25995A440;
  *(_OWORD *)&self->_autoplaySuggestionScoreThresholdToBeInteresting = xmmword_25995A450;
}

- (id)initForTesting
{
  return [(CLSMediaAnalysisModel *)self initWithMediaAnalysisVersion:61];
}

- (CLSMediaAnalysisModel)initWithMediaAnalysisVersion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)CLSMediaAnalysisModel;
  v4 = [(CLSMediaAnalysisModel *)&v8 init];
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x3D)
    {
      if (a3 < 0x3B)
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
          [(CLSMediaAnalysisModel *)v4 setupVersion33];
        }
      }
      else
      {
        [(CLSMediaAnalysisModel *)v4 setupVersion59];
      }
    }
    else
    {
      [(CLSMediaAnalysisModel *)v4 setupVersion61];
    }
  }
  return v5;
}

+ (unint64_t)baseVideoHighlightVersion
{
  return 46;
}

+ (unint64_t)latestVersion
{
  return 61;
}

+ (NSString)name
{
  return (NSString *)@"Media Analysis";
}

+ (unint64_t)baseMediaAnalysisVersionWithMediaAnalysisVersion:(unint64_t)a3
{
  unint64_t v3 = 59;
  uint64_t v4 = 33;
  if (a3 < 0x21) {
    uint64_t v4 = 0;
  }
  if (a3 <= 0x3A) {
    unint64_t v3 = v4;
  }
  if (a3 <= 0x3C) {
    return v3;
  }
  else {
    return 61;
  }
}

@end