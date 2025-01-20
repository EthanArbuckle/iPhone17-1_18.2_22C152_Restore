@interface STCommunicationLimitsCoreAnalyticsEvent
+ (id)description;
- (BOOL)communicationLimited;
- (BOOL)contactEditingAllowed;
- (BOOL)contactManagementEnabled;
- (BOOL)userIsRemote;
- (NSDictionary)payload;
- (NSString)name;
- (STCommunicationLimitsCoreAnalyticsEvent)initWithCommunicationLimited:(BOOL)a3 contactManagementEnabled:(BOOL)a4 contactEditingAllowed:(BOOL)a5 userAgeGroup:(int64_t)a6 userIsRemote:(BOOL)a7;
- (int64_t)userAgeGroup;
@end

@implementation STCommunicationLimitsCoreAnalyticsEvent

- (STCommunicationLimitsCoreAnalyticsEvent)initWithCommunicationLimited:(BOOL)a3 contactManagementEnabled:(BOOL)a4 contactEditingAllowed:(BOOL)a5 userAgeGroup:(int64_t)a6 userIsRemote:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)STCommunicationLimitsCoreAnalyticsEvent;
  result = [(STCommunicationLimitsCoreAnalyticsEvent *)&v13 init];
  result->_communicationLimited = a3;
  result->_contactManagementEnabled = a4;
  result->_contactEditingAllowed = a5;
  result->_userAgeGroup = a6;
  result->_userIsRemote = a7;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.communicationLimitsChanged";
}

+ (id)description
{
  return @"CommunicationLimitsChanged";
}

- (NSDictionary)payload
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"communicationLimited";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent communicationLimited](self, "communicationLimited"));
  v11[0] = v3;
  v10[1] = @"contactManagementEnabled";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent contactManagementEnabled](self, "contactManagementEnabled"));
  v11[1] = v4;
  v10[2] = @"contactEditingAllowed";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent contactEditingAllowed](self, "contactEditingAllowed"));
  v11[2] = v5;
  v10[3] = @"userAgeGroup";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[STCommunicationLimitsCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v11[3] = v6;
  v10[4] = @"userIsRemote";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STCommunicationLimitsCoreAnalyticsEvent userIsRemote](self, "userIsRemote"));
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (BOOL)communicationLimited
{
  return self->_communicationLimited;
}

- (BOOL)contactManagementEnabled
{
  return self->_contactManagementEnabled;
}

- (BOOL)contactEditingAllowed
{
  return self->_contactEditingAllowed;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

@end