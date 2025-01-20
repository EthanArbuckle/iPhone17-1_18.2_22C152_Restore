@interface RPTSettings
+ (RPTSettings)processEnvironment;
- (NSURL)recapOverrideFileURL;
- (RPTSettings)init;
- (id)initFromDictionary:(id)a3;
- (int64_t)activationIterationCount;
- (void)setActivationIterationCount:(int64_t)a3;
- (void)setRecapOverrideFileURL:(id)a3;
@end

@implementation RPTSettings

- (NSURL)recapOverrideFileURL
{
  return self->_recapOverrideFileURL;
}

+ (RPTSettings)processEnvironment
{
  if (processEnvironment_onceToken != -1) {
    dispatch_once(&processEnvironment_onceToken, &__block_literal_global);
  }
  v2 = (void *)processEnvironment_currentEnvironment;
  return (RPTSettings *)v2;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPTSettings;
  v5 = [(RPTSettings *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"RPT_OVERRIDE_RECAP_WITH_FILE"];
    recapOverrideFileURL = v5->_recapOverrideFileURL;
    v5->_recapOverrideFileURL = (NSURL *)v6;

    v8 = [v4 objectForKeyedSubscript:@"RPT_ACTIVATION_ITERATION_COUNT"];
    v9 = v8;
    if (v8) {
      uint64_t v10 = (int)[v8 intValue];
    }
    else {
      uint64_t v10 = -1;
    }
    v5->_activationIterationCount = v10;
  }
  return v5;
}

void __33__RPTSettings_processEnvironment__block_invoke()
{
  v0 = [RPTSettings alloc];
  id v4 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v4 environment];
  uint64_t v2 = [(RPTSettings *)v0 initFromDictionary:v1];
  v3 = (void *)processEnvironment_currentEnvironment;
  processEnvironment_currentEnvironment = v2;
}

- (RPTSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPTSettings;
  uint64_t v2 = [(RPTSettings *)&v6 init];
  v3 = v2;
  if (v2)
  {
    recapOverrideFileURL = v2->_recapOverrideFileURL;
    v2->_recapOverrideFileURL = 0;

    v3->_activationIterationCount = -1;
  }
  return v3;
}

- (void)setRecapOverrideFileURL:(id)a3
{
}

- (int64_t)activationIterationCount
{
  return self->_activationIterationCount;
}

- (void)setActivationIterationCount:(int64_t)a3
{
  self->_activationIterationCount = a3;
}

- (void).cxx_destruct
{
}

@end