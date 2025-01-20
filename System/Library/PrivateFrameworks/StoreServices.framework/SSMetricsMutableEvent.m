@interface SSMetricsMutableEvent
- (BOOL)shouldSuppressDSIDHeader;
- (BOOL)shouldSuppressUserInfo;
- (NSDictionary)bodyDictionary;
- (NSNumber)accountIdentifier;
- (NSNumber)baseVersion;
- (NSNumber)clientVersion;
- (NSNumber)eventVersion;
- (NSNumber)previousClientVersion;
- (NSString)applicationIdentifier;
- (NSString)canaryIdentifier;
- (NSString)connection;
- (NSString)eventType;
- (NSString)hostApplicationIdentifier;
- (NSString)topic;
- (NSString)userAgent;
- (SSMetricsMutableEvent)init;
- (SSMetricsMutableEvent)initWithBodyDictionary:(id)a3;
- (double)originalTime;
- (id)debugDescription;
- (id)decorateReportingURL:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertyForBodyKey:(id)a3;
- (void)addPropertiesWithDictionary:(id)a3;
- (void)appendPropertiesToBody:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setBaseVersion:(id)a3;
- (void)setCanaryIdentifier:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setConnection:(id)a3;
- (void)setEventType:(id)a3;
- (void)setEventVersion:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setOriginalTime:(double)a3;
- (void)setOriginalTimeUsingDate:(id)a3;
- (void)setPreviousClientVersion:(id)a3;
- (void)setProperty:(id)a3 forBodyKey:(id)a4;
- (void)setShouldSuppressDSIDHeader:(BOOL)a3;
- (void)setShouldSuppressUserInfo:(BOOL)a3;
- (void)setTopic:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation SSMetricsMutableEvent

void __48__SSMetricsMutableEvent_initWithBodyDictionary___block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(MainBundle);
  if (InfoDictionary && (Value = CFDictionaryGetValue(InfoDictionary, (const void *)*MEMORY[0x1E4F1D020])) != 0)
  {
    initWithBodyDictionary____bundleVersion = (uint64_t)CFRetain(Value);
    if (initWithBodyDictionary____bundleVersion) {
      goto LABEL_7;
    }
  }
  else if (initWithBodyDictionary____bundleVersion)
  {
    goto LABEL_7;
  }
  initWithBodyDictionary____bundleVersion = @"1.0";
  CFRetain(@"1.0");
LABEL_7:
  id v5 = +[SSDevice currentDevice];
  uint64_t v3 = [v5 productVersion];
  v4 = (void *)initWithBodyDictionary____osVersion;
  initWithBodyDictionary____osVersion = v3;
}

- (void)setProperty:(id)a3 forBodyKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    mutableBody = self->_mutableBody;
    if (v8) {
      [(NSMutableDictionary *)mutableBody setObject:v8 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)mutableBody removeObjectForKey:v6];
    }
  }
}

- (SSMetricsMutableEvent)init
{
  return [(SSMetricsMutableEvent *)self initWithBodyDictionary:MEMORY[0x1E4F1CC08]];
}

- (SSMetricsMutableEvent)initWithBodyDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSMetricsMutableEvent;
  id v5 = [(SSMetricsMutableEvent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    mutableBody = v5->_mutableBody;
    v5->_mutableBody = (NSMutableDictionary *)v6;

    if (initWithBodyDictionary__onceToken != -1) {
      dispatch_once(&initWithBodyDictionary__onceToken, &__block_literal_global_42);
    }
    [(SSMetricsMutableEvent *)v5 setProperty:initWithBodyDictionary____bundleVersion forBodyKey:@"appVersion"];
    id v8 = [NSNumber numberWithInteger:1];
    [(SSMetricsMutableEvent *)v5 setProperty:v8 forBodyKey:@"baseVersion"];

    [(SSMetricsMutableEvent *)v5 setProperty:initWithBodyDictionary____osVersion forBodyKey:@"osVersion"];
    v9 = [(id)objc_opt_class() globalEventCanary];
    v10 = [(id)objc_opt_class() globalEventCanary];

    if (v10) {
      [(SSMetricsMutableEvent *)v5 setProperty:v9 forBodyKey:@"canary"];
    }
    v11 = [NSNumber numberWithInteger:1];
    [(SSMetricsMutableEvent *)v5 setProperty:v11 forBodyKey:@"eventVersion"];

    v12 = [MEMORY[0x1E4F1C9C8] date];
    [(SSMetricsMutableEvent *)v5 setOriginalTimeUsingDate:v12];
  }
  return v5;
}

- (void)setOriginalTimeUsingDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = a3;
  id v12 = [v4 localTimeZone];
  uint64_t v6 = [v12 secondsFromGMTForDate:v5];
  unint64_t v7 = ((unsigned __int128)(v6 * (__int128)0x7777777777777777) >> 64) - v6;
  id v8 = [NSNumber numberWithInt:(v7 >> 5) + (v7 >> 63)];
  [(SSMetricsMutableEvent *)self setProperty:v8 forBodyKey:@"timezoneOffset"];

  [v5 timeIntervalSince1970];
  double v10 = v9;

  v11 = [(SSMetricsEvent *)self millisecondsFromTimeInterval:v10];
  [(SSMetricsMutableEvent *)self setProperty:v11 forBodyKey:@"eventTime"];
}

- (void)setTopic:(id)a3
{
}

- (void)setEventType:(id)a3
{
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"dsId"];
}

- (NSString)connection
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"connection"];
}

- (NSString)eventType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"eventType"];
}

- (double)originalTime
{
  uint64_t v3 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"eventTime"];
  [(SSMetricsEvent *)self timeIntervalFromMilliseconds:v3];
  double v5 = v4;

  return v5;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void)setOriginalTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = -[SSMetricsEvent millisecondsFromTimeInterval:](self, "millisecondsFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"eventTime"];
}

- (NSString)topic
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"topic"];
}

- (NSNumber)baseVersion
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"baseVersion"];
}

- (NSNumber)eventVersion
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"eventVersion"];
}

- (void)setBaseVersion:(id)a3
{
}

- (void)setEventVersion:(id)a3
{
}

- (NSString)applicationIdentifier
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"app"];
}

- (NSNumber)clientVersion
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"clientVersion"];
}

- (NSString)hostApplicationIdentifier
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"hostApp"];
}

- (NSNumber)previousClientVersion
{
  return (NSNumber *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"pClientVersion"];
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (void)setClientVersion:(id)a3
{
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (void)setPreviousClientVersion:(id)a3
{
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"userAgent"];
}

- (NSString)canaryIdentifier
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"canary"];
}

- (void)setCanaryIdentifier:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"canary"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  mutableBody = self->_mutableBody;
  return (id)[v4 initWithBodyDictionary:mutableBody];
}

- (void)appendPropertiesToBody:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsMutableEvent;
  [(SSMetricsEvent *)&v5 appendPropertiesToBody:v4];
  if ([(NSMutableDictionary *)self->_mutableBody count]) {
    [v4 addEntriesFromDictionary:self->_mutableBody];
  }
}

- (void)addPropertiesWithDictionary:(id)a3
{
}

- (id)propertyForBodyKey:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    objc_super v5 = [(NSMutableDictionary *)self->_mutableBody objectForKey:v4];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%@ : %p -- [%d properties] %@", objc_opt_class(), self, -[NSMutableDictionary count](self->_mutableBody, "count"), self->_mutableBody];
}

- (id)decorateReportingURL:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SSMetricsMutableEvent *)self topic];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    unint64_t v7 = NSString;
    id v8 = [(SSMetricsMutableEvent *)self topic];
    id v9 = [v7 stringWithFormat:@"%@/2/%@", v4, v8];
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (NSDictionary)bodyDictionary
{
  return &self->_mutableBody->super;
}

- (BOOL)shouldSuppressUserInfo
{
  return self->_shouldSuppressUserInfo;
}

- (void)setShouldSuppressUserInfo:(BOOL)a3
{
  self->_shouldSuppressUserInfo = a3;
}

- (BOOL)shouldSuppressDSIDHeader
{
  return self->_shouldSuppressDSIDHeader;
}

- (void)setShouldSuppressDSIDHeader:(BOOL)a3
{
  self->_shouldSuppressDSIDHeader = a3;
}

- (void).cxx_destruct
{
}

@end