@interface STAgePresetsViewedCoreAnalyticsEvent
+ (id)description;
- (BOOL)initialSetup;
- (NSDictionary)payload;
- (NSString)name;
- (NSString)sessionId;
- (STAgePresetsViewedCoreAnalyticsEvent)initWithSessionId:(id)a3 isInitialSetup:(BOOL)a4;
@end

@implementation STAgePresetsViewedCoreAnalyticsEvent

- (STAgePresetsViewedCoreAnalyticsEvent)initWithSessionId:(id)a3 isInitialSetup:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STAgePresetsViewedCoreAnalyticsEvent;
  v7 = [(STAgePresetsViewedCoreAnalyticsEvent *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    sessionId = v7->_sessionId;
    v7->_sessionId = (NSString *)v8;

    v7->_initialSetup = a4;
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)@"com.apple.Family.AgePresetsViewed";
}

+ (id)description
{
  return @"AgePresetsViewed";
}

- (NSDictionary)payload
{
  v3 = objc_opt_new();
  v4 = [(STAgePresetsViewedCoreAnalyticsEvent *)self sessionId];
  [v3 setObject:v4 forKeyedSubscript:@"sessionId"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[STAgePresetsViewedCoreAnalyticsEvent initialSetup](self, "initialSetup"));
  [v3 setObject:v5 forKeyedSubscript:@"initialSetup"];

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)initialSetup
{
  return self->_initialSetup;
}

- (void).cxx_destruct
{
}

@end