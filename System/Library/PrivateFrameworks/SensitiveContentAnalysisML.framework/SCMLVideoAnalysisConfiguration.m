@interface SCMLVideoAnalysisConfiguration
+ (id)defaultConfig;
- (BOOL)useUniformSampling;
- (NSNumber)frameLimit;
- (NSString)debugFramesOutputPathPrefix;
- (SCMLVideoAnalysisConfiguration)init;
- (SCMLVideoAnalysisConfiguration)initWithOptions:(id)a3;
- (SCMLVideoAnalysisConfiguration)initWithOptions:(id)a3 framesPerSync:(unint64_t)a4 frameLimit:(id)a5 sensitiveFrameCountThreshold:(unint64_t)a6 useUniformSampling:(BOOL)a7;
- (unint64_t)framesPerSync;
- (unint64_t)sensitiveFrameCountThreshold;
@end

@implementation SCMLVideoAnalysisConfiguration

+ (id)defaultConfig
{
  if (defaultConfig_onceToken != -1) {
    dispatch_once(&defaultConfig_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)defaultConfig_defaultConfig;

  return v2;
}

uint64_t __47__SCMLVideoAnalysisConfiguration_defaultConfig__block_invoke()
{
  defaultConfig_defaultConfig = [[SCMLVideoAnalysisConfiguration alloc] initWithOptions:0 framesPerSync:1 frameLimit:&unk_27097A098 sensitiveFrameCountThreshold:2 useUniformSampling:1];

  return MEMORY[0x270F9A758]();
}

- (SCMLVideoAnalysisConfiguration)init
{
  return 0;
}

- (SCMLVideoAnalysisConfiguration)initWithOptions:(id)a3
{
  return [(SCMLVideoAnalysisConfiguration *)self initWithOptions:a3 framesPerSync:0 frameLimit:0 sensitiveFrameCountThreshold:1 useUniformSampling:0];
}

- (SCMLVideoAnalysisConfiguration)initWithOptions:(id)a3 framesPerSync:(unint64_t)a4 frameLimit:(id)a5 sensitiveFrameCountThreshold:(unint64_t)a6 useUniformSampling:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SCMLVideoAnalysisConfiguration;
  v14 = [(SCMLAnalysisConfiguration *)&v19 initWithOptions:v12];
  v15 = v14;
  if (v14)
  {
    v14->_framesPerSync = a4;
    objc_storeStrong((id *)&v14->_frameLimit, a5);
    v15->_sensitiveFrameCountThreshold = a6;
    v15->_useUniformSampling = a7;
    uint64_t v16 = [v12 objectForKeyedSubscript:@"SCMLAnalysisConfigurationDebugFramesOutputPathPrefix"];
    debugFramesOutputPathPrefix = v15->_debugFramesOutputPathPrefix;
    v15->_debugFramesOutputPathPrefix = (NSString *)v16;
  }
  return v15;
}

- (unint64_t)framesPerSync
{
  return self->_framesPerSync;
}

- (NSNumber)frameLimit
{
  return self->_frameLimit;
}

- (unint64_t)sensitiveFrameCountThreshold
{
  return self->_sensitiveFrameCountThreshold;
}

- (BOOL)useUniformSampling
{
  return self->_useUniformSampling;
}

- (NSString)debugFramesOutputPathPrefix
{
  return self->_debugFramesOutputPathPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFramesOutputPathPrefix, 0);

  objc_storeStrong((id *)&self->_frameLimit, 0);
}

@end