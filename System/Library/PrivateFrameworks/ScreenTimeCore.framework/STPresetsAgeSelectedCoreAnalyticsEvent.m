@interface STPresetsAgeSelectedCoreAnalyticsEvent
+ (id)description;
- (NSDictionary)payload;
- (NSString)name;
- (NSString)sessionId;
- (STPresetsAgeSelectedCoreAnalyticsEvent)initWithSessionId:(id)a3 lowerBoundAgeRange:(int64_t)a4 upperBoundAgeRange:(int64_t)a5;
- (int64_t)lowerBoundAgeRange;
- (int64_t)upperBoundAgeRange;
@end

@implementation STPresetsAgeSelectedCoreAnalyticsEvent

- (STPresetsAgeSelectedCoreAnalyticsEvent)initWithSessionId:(id)a3 lowerBoundAgeRange:(int64_t)a4 upperBoundAgeRange:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STPresetsAgeSelectedCoreAnalyticsEvent;
  v9 = [(STPresetsAgeSelectedCoreAnalyticsEvent *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    sessionId = v9->_sessionId;
    v9->_sessionId = (NSString *)v10;

    v9->_lowerBoundAgeRange = a4;
    v9->_upperBoundAgeRange = a5;
  }

  return v9;
}

- (NSString)name
{
  return (NSString *)@"com.apple.Family.AgePresetsAgeRangeSelected";
}

+ (id)description
{
  return @"AgePresetsAgeRangeSelected";
}

- (NSDictionary)payload
{
  v3 = objc_opt_new();
  v4 = [(STPresetsAgeSelectedCoreAnalyticsEvent *)self sessionId];
  [v3 setObject:v4 forKeyedSubscript:@"sessionId"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[STPresetsAgeSelectedCoreAnalyticsEvent lowerBoundAgeRange](self, "lowerBoundAgeRange"));
  [v3 setObject:v5 forKeyedSubscript:@"lowerBoundAgeRange"];

  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[STPresetsAgeSelectedCoreAnalyticsEvent upperBoundAgeRange](self, "upperBoundAgeRange"));
  [v3 setObject:v6 forKeyedSubscript:@"upperBoundAgeRange"];

  return (NSDictionary *)v3;
}

- (NSString)sessionId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)lowerBoundAgeRange
{
  return self->_lowerBoundAgeRange;
}

- (int64_t)upperBoundAgeRange
{
  return self->_upperBoundAgeRange;
}

- (void).cxx_destruct
{
}

@end