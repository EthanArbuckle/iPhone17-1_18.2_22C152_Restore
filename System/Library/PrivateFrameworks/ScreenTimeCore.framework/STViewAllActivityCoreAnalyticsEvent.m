@interface STViewAllActivityCoreAnalyticsEvent
+ (id)description;
- (BOOL)userIsManaged;
- (BOOL)userIsRemote;
- (NSDictionary)payload;
- (NSString)name;
- (STViewAllActivityCoreAnalyticsEvent)initWithDaysSinceLastView:(int64_t)a3 userAgeGroup:(int64_t)a4 userIsManaged:(BOOL)a5 userIsRemote:(BOOL)a6;
- (int64_t)daysSinceLastView;
- (int64_t)userAgeGroup;
@end

@implementation STViewAllActivityCoreAnalyticsEvent

- (STViewAllActivityCoreAnalyticsEvent)initWithDaysSinceLastView:(int64_t)a3 userAgeGroup:(int64_t)a4 userIsManaged:(BOOL)a5 userIsRemote:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)STViewAllActivityCoreAnalyticsEvent;
  result = [(STViewAllActivityCoreAnalyticsEvent *)&v11 init];
  result->_daysSinceLastView = a3;
  result->_userAgeGroup = a4;
  result->_userIsManaged = a5;
  result->_userIsRemote = a6;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.allActivityViewed";
}

+ (id)description
{
  return @"AllActivityViewed";
}

- (NSDictionary)payload
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"daysSinceLastView";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[STViewAllActivityCoreAnalyticsEvent daysSinceLastView](self, "daysSinceLastView"));
  v10[0] = v3;
  v9[1] = @"userAgeGroup";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[STViewAllActivityCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v10[1] = v4;
  v9[2] = @"userIsManaged";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[STViewAllActivityCoreAnalyticsEvent userIsManaged](self, "userIsManaged"));
  v10[2] = v5;
  v9[3] = @"userIsRemote";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[STViewAllActivityCoreAnalyticsEvent userIsRemote](self, "userIsRemote"));
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (int64_t)daysSinceLastView
{
  return self->_daysSinceLastView;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

@end