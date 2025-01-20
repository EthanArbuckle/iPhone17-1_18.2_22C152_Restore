@interface SINetworkConfiguration
- (BOOL)consumeDepth;
- (BOOL)isReplay;
- (BOOL)runByE5RT;
- (BOOL)supportZeroCopy;
- (NSMutableSet)disabledOutputBlobs;
- (NSString)algorithmClassName;
- (NSString)algorithmOutputClassName;
- (NSString)coreAnalyticEventName;
- (NSString)defaultVisualLoggerName;
- (NSString)loggerPrefix;
- (NSString)networkFunction;
- (NSString)networkMode;
- (NSString)networkName;
- (NSString)networkPath;
- (SINetworkConfiguration)init;
- (SINetworkConfiguration)initWithEventName:(id)a3;
- (id)description;
- (int)coreAnalyticTimeInterval;
- (int)signpostMappingID;
- (int64_t)engineType;
- (void)setCoreAnalyticTimeInterval:(int)a3;
- (void)setDisabledOutputBlobs:(id)a3;
- (void)setEngineType:(int64_t)a3;
- (void)setIsReplay:(BOOL)a3;
- (void)setLoggerPrefix:(id)a3;
- (void)setNetworkFunction:(id)a3;
- (void)setNetworkMode:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setNetworkPath:(id)a3;
- (void)setRunByE5RT:(BOOL)a3;
- (void)setSupportZeroCopy:(BOOL)a3;
@end

@implementation SINetworkConfiguration

- (SINetworkConfiguration)init
{
  return [(SINetworkConfiguration *)self initWithEventName:0];
}

- (SINetworkConfiguration)initWithEventName:(id)a3
{
  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SINetworkConfiguration;
  v5 = [(SINetworkConfiguration *)&v15 init];
  v6 = v5;
  if (v5)
  {
    algorithmClassName = v5->_algorithmClassName;
    v5->_algorithmClassName = 0;

    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    disabledOutputBlobs = v6->_disabledOutputBlobs;
    v6->_disabledOutputBlobs = (NSMutableSet *)v8;

    networkMode = v6->_networkMode;
    v6->_networkMode = (NSString *)@"main";

    networkFunction = v6->_networkFunction;
    v6->_networkFunction = (NSString *)@"main";

    v6->_consumeDepth = 0;
    v6->_isReplay = 0;
    v6->_coreAnalyticTimeInterval = 600;
    v6->_coreAnalyticEventName = v4;
    defaultVisualLoggerName = v6->_defaultVisualLoggerName;
    v6->_defaultVisualLoggerName = (NSString *)@"default";

    v6->_engineType = 1;
    v6->_runByE5RT = 1;
    v13 = v6;
  }

  return v6;
}

- (void)setNetworkMode:(id)a3
{
}

- (void)setNetworkFunction:(id)a3
{
}

- (void)setNetworkName:(id)a3
{
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self->_isReplay) {
    v4 = "YES";
  }
  else {
    v4 = "NO";
  }
  v5 = (void *)[v3 initWithFormat:@"NetworkName:%@, NetworkMode:%@ IsReplay:%s", self->_networkName, self->_networkMode, v4];
  return v5;
}

- (NSString)networkPath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNetworkPath:(id)a3
{
}

- (int64_t)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(int64_t)a3
{
  self->_engineType = a3;
}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)runByE5RT
{
  return self->_runByE5RT;
}

- (void)setRunByE5RT:(BOOL)a3
{
  self->_runByE5RT = a3;
}

- (NSMutableSet)disabledOutputBlobs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisabledOutputBlobs:(id)a3
{
}

- (NSString)loggerPrefix
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLoggerPrefix:(id)a3
{
}

- (BOOL)supportZeroCopy
{
  return self->_supportZeroCopy;
}

- (void)setSupportZeroCopy:(BOOL)a3
{
  self->_supportZeroCopy = a3;
}

- (NSString)coreAnalyticEventName
{
  return self->_coreAnalyticEventName;
}

- (BOOL)isReplay
{
  return self->_isReplay;
}

- (void)setIsReplay:(BOOL)a3
{
  self->_isReplay = a3;
}

- (int)coreAnalyticTimeInterval
{
  return self->_coreAnalyticTimeInterval;
}

- (void)setCoreAnalyticTimeInterval:(int)a3
{
  self->_coreAnalyticTimeInterval = a3;
}

- (NSString)algorithmClassName
{
  return self->_algorithmClassName;
}

- (NSString)algorithmOutputClassName
{
  return self->_algorithmOutputClassName;
}

- (NSString)networkMode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)networkFunction
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)defaultVisualLoggerName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)consumeDepth
{
  return self->_consumeDepth;
}

- (int)signpostMappingID
{
  return self->_signpostMappingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggerPrefix, 0);
  objc_storeStrong((id *)&self->_disabledOutputBlobs, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
  objc_storeStrong((id *)&self->_defaultVisualLoggerName, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_networkFunction, 0);
  objc_storeStrong((id *)&self->_networkMode, 0);
  objc_storeStrong((id *)&self->_algorithmOutputClassName, 0);
  objc_storeStrong((id *)&self->_algorithmClassName, 0);
}

@end