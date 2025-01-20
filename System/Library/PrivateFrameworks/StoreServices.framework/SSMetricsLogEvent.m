@interface SSMetricsLogEvent
+ (id)_stringFromLogLevel:(unint64_t)a3;
+ (unint64_t)_logLevelFromString:(id)a3;
- (NSString)logSubsystem;
- (NSString)message;
- (SSMetricsLogEvent)init;
- (id)description;
- (unint64_t)logLevel;
- (void)setLogLevel:(unint64_t)a3;
- (void)setLogSubsystem:(id)a3;
- (void)setMessage:(id)a3;
@end

@implementation SSMetricsLogEvent

- (SSMetricsLogEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsLogEvent;
  v2 = [(SSMetricsMutableEvent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SSMetricsMutableEvent *)v2 setEventType:@"log"];
    [(SSMetricsLogEvent *)v3 setLogLevel:2];
    [(SSMetricsMutableEvent *)v3 setTopic:@"xp_amp_appstore_log"];
  }
  return v3;
}

- (unint64_t)logLevel
{
  v3 = objc_opt_class();
  v4 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"level"];
  unint64_t v5 = [v3 _logLevelFromString:v4];

  return v5;
}

- (NSString)logSubsystem
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"loggerName"];
}

- (NSString)message
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"message"];
}

- (void)setLogLevel:(unint64_t)a3
{
  id v4 = [(id)objc_opt_class() _stringFromLogLevel:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"level"];
}

- (void)setLogSubsystem:(id)a3
{
}

- (void)setMessage:(id)a3
{
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)SSMetricsLogEvent;
  id v4 = [(SSMetricsLogEvent *)&v9 description];
  [v3 appendString:v4];

  unint64_t v5 = objc_msgSend((id)objc_opt_class(), "_stringFromLogLevel:", -[SSMetricsLogEvent logLevel](self, "logLevel"));
  [v3 appendFormat:@"\nlogLevel = %@", v5];

  v6 = [(SSMetricsLogEvent *)self logSubsystem];
  [v3 appendFormat:@"\nlogSubsystem = %@", v6];

  v7 = [(SSMetricsLogEvent *)self message];
  [v3 appendFormat:@"\nmessage = %@", v7];

  return v3;
}

+ (unint64_t)_logLevelFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"debug"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"error"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"warn"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

+ (id)_stringFromLogLevel:(unint64_t)a3
{
  if (a3 > 3) {
    return @"info";
  }
  else {
    return off_1E5BAEA70[a3];
  }
}

@end