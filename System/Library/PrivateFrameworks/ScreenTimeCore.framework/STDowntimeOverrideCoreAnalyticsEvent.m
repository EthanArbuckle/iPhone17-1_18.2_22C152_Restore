@interface STDowntimeOverrideCoreAnalyticsEvent
+ (id)description;
- (BOOL)downtimeEnabled;
- (BOOL)gracePeriodUsed;
- (BOOL)scheduleEnabled;
- (BOOL)userIsManaged;
- (NSDictionary)payload;
- (NSString)name;
- (STDowntimeOverrideCoreAnalyticsEvent)initWithDowntimeEnabled:(BOOL)a3 gracePeriodUsed:(BOOL)a4 scheduleEnabled:(BOOL)a5 hourOfDay:(int64_t)a6 userIsManaged:(BOOL)a7;
- (int64_t)hourOfDay;
@end

@implementation STDowntimeOverrideCoreAnalyticsEvent

- (STDowntimeOverrideCoreAnalyticsEvent)initWithDowntimeEnabled:(BOOL)a3 gracePeriodUsed:(BOOL)a4 scheduleEnabled:(BOOL)a5 hourOfDay:(int64_t)a6 userIsManaged:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)STDowntimeOverrideCoreAnalyticsEvent;
  result = [(STDowntimeOverrideCoreAnalyticsEvent *)&v13 init];
  result->_downtimeEnabled = a3;
  result->_gracePeriodUsed = a4;
  result->_scheduleEnabled = a5;
  result->_hourOfDay = a6;
  result->_userIsManaged = a7;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.downtimeOverrideChanged";
}

+ (id)description
{
  return @"DowntimeOverrideChanged";
}

- (NSDictionary)payload
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"downtimeEnabled";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent downtimeEnabled](self, "downtimeEnabled"));
  v11[0] = v3;
  v10[1] = @"gracePeriodUsed";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent gracePeriodUsed](self, "gracePeriodUsed"));
  v11[1] = v4;
  v10[2] = @"scheduleEnabled";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent scheduleEnabled](self, "scheduleEnabled"));
  v11[2] = v5;
  v10[3] = @"hourOfDay";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[STDowntimeOverrideCoreAnalyticsEvent hourOfDay](self, "hourOfDay"));
  v11[3] = v6;
  v10[4] = @"userIsManaged";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STDowntimeOverrideCoreAnalyticsEvent userIsManaged](self, "userIsManaged"));
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (BOOL)downtimeEnabled
{
  return self->_downtimeEnabled;
}

- (BOOL)gracePeriodUsed
{
  return self->_gracePeriodUsed;
}

- (BOOL)scheduleEnabled
{
  return self->_scheduleEnabled;
}

- (int64_t)hourOfDay
{
  return self->_hourOfDay;
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

@end