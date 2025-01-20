@interface SCMLImageSanitizerConfiguration
- (BOOL)trackPerformance;
- (NSString)clipClassifierConfig;
- (SCMLImageSanitizerConfiguration)init;
- (unint64_t)backends;
- (unsigned)granularity;
- (unsigned)mode;
- (void)setBackends:(unint64_t)a3;
- (void)setClipClassifierConfig:(id)a3;
- (void)setGranularity:(unsigned int)a3;
- (void)setMode:(unsigned int)a3;
- (void)setTrackPerformance:(BOOL)a3;
@end

@implementation SCMLImageSanitizerConfiguration

- (SCMLImageSanitizerConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCMLImageSanitizerConfiguration;
  v2 = [(SCMLImageSanitizerConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_trackPerformance = 0;
    v2->_granularity = 0;
    clipClassifierConfig = v2->_clipClassifierConfig;
    v2->_clipClassifierConfig = (NSString *)&stru_2709753D8;

    v3->_mode = 1;
    v3->_backends = 0;
  }
  return v3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
}

- (unint64_t)backends
{
  return self->_backends;
}

- (void)setBackends:(unint64_t)a3
{
  self->_backends = a3;
}

- (BOOL)trackPerformance
{
  return self->_trackPerformance;
}

- (void)setTrackPerformance:(BOOL)a3
{
  self->_trackPerformance = a3;
}

- (unsigned)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(unsigned int)a3
{
  self->_granularity = a3;
}

- (NSString)clipClassifierConfig
{
  return self->_clipClassifierConfig;
}

- (void)setClipClassifierConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end