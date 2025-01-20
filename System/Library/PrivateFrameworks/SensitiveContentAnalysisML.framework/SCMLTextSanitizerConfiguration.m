@interface SCMLTextSanitizerConfiguration
- (BOOL)throwInAdapterAsyncHandler;
- (BOOL)throwInModerationLMAsyncHandler;
- (BOOL)trackPerformance;
- (NSLocale)locale;
- (NSString)modelManagerServicesUseCaseID;
- (SCMLTextSanitizerConfiguration)initWithModelManagerServicesUseCaseID:(id)a3;
- (int)onBehalfOfProcessID;
- (unint64_t)backends;
- (unsigned)granularity;
- (unsigned)mode;
- (void)setBackends:(unint64_t)a3;
- (void)setGranularity:(unsigned int)a3;
- (void)setLocale:(id)a3;
- (void)setMode:(unsigned int)a3;
- (void)setModelManagerServicesUseCaseID:(id)a3;
- (void)setOnBehalfOfProcessID:(int)a3;
- (void)setThrowInAdapterAsyncHandler:(BOOL)a3;
- (void)setThrowInModerationLMAsyncHandler:(BOOL)a3;
- (void)setTrackPerformance:(BOOL)a3;
@end

@implementation SCMLTextSanitizerConfiguration

- (SCMLTextSanitizerConfiguration)initWithModelManagerServicesUseCaseID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCMLTextSanitizerConfiguration;
  v5 = [(SCMLTextSanitizerConfiguration *)&v8 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
    [(SCMLTextSanitizerConfiguration *)v5 setLocale:v6];

    [(SCMLTextSanitizerConfiguration *)v5 setMode:2];
    [(SCMLTextSanitizerConfiguration *)v5 setBackends:0];
    [(SCMLTextSanitizerConfiguration *)v5 setTrackPerformance:0];
    [(SCMLTextSanitizerConfiguration *)v5 setGranularity:0];
    [(SCMLTextSanitizerConfiguration *)v5 setThrowInModerationLMAsyncHandler:0];
    [(SCMLTextSanitizerConfiguration *)v5 setThrowInAdapterAsyncHandler:0];
    [(SCMLTextSanitizerConfiguration *)v5 setOnBehalfOfProcessID:0xFFFFFFFFLL];
    [(SCMLTextSanitizerConfiguration *)v5 setModelManagerServicesUseCaseID:v4];
  }

  return v5;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
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

- (int)onBehalfOfProcessID
{
  return self->_onBehalfOfProcessID;
}

- (void)setOnBehalfOfProcessID:(int)a3
{
  self->_onBehalfOfProcessID = a3;
}

- (NSString)modelManagerServicesUseCaseID
{
  return self->_modelManagerServicesUseCaseID;
}

- (void)setModelManagerServicesUseCaseID:(id)a3
{
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

- (BOOL)throwInModerationLMAsyncHandler
{
  return self->_throwInModerationLMAsyncHandler;
}

- (void)setThrowInModerationLMAsyncHandler:(BOOL)a3
{
  self->_throwInModerationLMAsyncHandler = a3;
}

- (BOOL)throwInAdapterAsyncHandler
{
  return self->_throwInAdapterAsyncHandler;
}

- (void)setThrowInAdapterAsyncHandler:(BOOL)a3
{
  self->_throwInAdapterAsyncHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelManagerServicesUseCaseID, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end