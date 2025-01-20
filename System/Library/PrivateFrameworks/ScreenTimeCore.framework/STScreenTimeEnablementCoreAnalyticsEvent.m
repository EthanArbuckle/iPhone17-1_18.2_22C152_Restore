@interface STScreenTimeEnablementCoreAnalyticsEvent
+ (id)description;
- (BOOL)pinSet;
- (BOOL)screenTimeEnabled;
- (BOOL)userIsRemote;
- (NSDictionary)payload;
- (NSString)name;
- (STScreenTimeEnablementCoreAnalyticsEvent)initWithScreenTimeEnabled:(BOOL)a3 numberOfGuardians:(int64_t)a4 pinSet:(BOOL)a5 userAgeGroup:(int64_t)a6 userIsRemote:(BOOL)a7;
- (int64_t)numberOfGuardians;
- (int64_t)userAgeGroup;
@end

@implementation STScreenTimeEnablementCoreAnalyticsEvent

- (STScreenTimeEnablementCoreAnalyticsEvent)initWithScreenTimeEnabled:(BOOL)a3 numberOfGuardians:(int64_t)a4 pinSet:(BOOL)a5 userAgeGroup:(int64_t)a6 userIsRemote:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)STScreenTimeEnablementCoreAnalyticsEvent;
  result = [(STScreenTimeEnablementCoreAnalyticsEvent *)&v13 init];
  result->_screenTimeEnabled = a3;
  result->_pinSet = a5;
  result->_userAgeGroup = a6;
  result->_numberOfGuardians = a4;
  result->_userIsRemote = a7;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.screenTimeEnablementChanged";
}

+ (id)description
{
  return @"ScreenTimeEnablementChanged";
}

- (NSDictionary)payload
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"screenTimeEnabled";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[STScreenTimeEnablementCoreAnalyticsEvent screenTimeEnabled](self, "screenTimeEnabled"));
  v11[0] = v3;
  v10[1] = @"numberOfGuardians";
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[STScreenTimeEnablementCoreAnalyticsEvent numberOfGuardians](self, "numberOfGuardians"));
  v11[1] = v4;
  v10[2] = @"pinSet";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[STScreenTimeEnablementCoreAnalyticsEvent pinSet](self, "pinSet"));
  v11[2] = v5;
  v10[3] = @"userAgeGroup";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[STScreenTimeEnablementCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v11[3] = v6;
  v10[4] = @"userIsRemote";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STScreenTimeEnablementCoreAnalyticsEvent userIsRemote](self, "userIsRemote"));
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (BOOL)screenTimeEnabled
{
  return self->_screenTimeEnabled;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (int64_t)numberOfGuardians
{
  return self->_numberOfGuardians;
}

- (BOOL)pinSet
{
  return self->_pinSet;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

@end