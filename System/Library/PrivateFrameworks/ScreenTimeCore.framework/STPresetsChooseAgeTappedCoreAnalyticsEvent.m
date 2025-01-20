@interface STPresetsChooseAgeTappedCoreAnalyticsEvent
+ (id)description;
- (NSDictionary)payload;
- (NSString)name;
- (NSString)sessionId;
- (STPresetsChooseAgeTappedCoreAnalyticsEvent)initWithSessionId:(id)a3;
@end

@implementation STPresetsChooseAgeTappedCoreAnalyticsEvent

- (STPresetsChooseAgeTappedCoreAnalyticsEvent)initWithSessionId:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STPresetsChooseAgeTappedCoreAnalyticsEvent;
  v5 = [(STPresetsChooseAgeTappedCoreAnalyticsEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sessionId = v5->_sessionId;
    v5->_sessionId = (NSString *)v6;
  }
  return v5;
}

- (NSString)name
{
  return (NSString *)@"com.apple.Family.PresetsChooseAgeTapped";
}

+ (id)description
{
  return @"PresetsChooseAgeTapped";
}

- (NSDictionary)payload
{
  v3 = objc_opt_new();
  id v4 = [(STPresetsChooseAgeTappedCoreAnalyticsEvent *)self sessionId];
  [v3 setObject:v4 forKeyedSubscript:@"sessionId"];

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end