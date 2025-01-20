@interface STCommunicationConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isCommunicationSafetyAnalyticsEnabled;
- (BOOL)isCommunicationSafetyNotificationEnabled;
- (BOOL)isCommunicationSafetyReceivingRestricted;
- (BOOL)isCommunicationSafetySendingRestricted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommunicationConfiguration:(id)a3;
- (STCommunicationConfiguration)initWithCoder:(id)a3;
- (STCommunicationConfiguration)initWithCommunicationSafetySendingRestricted:(BOOL)a3 communicationSafetyReceivingRestricted:(BOOL)a4 communicationSafetyNotificationEnabled:(BOOL)a5 communicationSafetyAnalyticsEnabled:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STCommunicationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL isCommunicationSafetySendingRestricted = self->_isCommunicationSafetySendingRestricted;
  id v5 = a3;
  [v5 encodeBool:isCommunicationSafetySendingRestricted forKey:@"isCommunicationSafetySendingRestricted"];
  [v5 encodeBool:self->_isCommunicationSafetyReceivingRestricted forKey:@"isCommunicationSafetyReceivingRestricted"];
  [v5 encodeBool:self->_isCommunicationSafetyNotificationEnabled forKey:@"isCommunicationSafetyNotificationEnabled"];
  [v5 encodeBool:self->_isCommunicationSafetyAnalyticsEnabled forKey:@"isCommunicationSafetyAnalyticsEnabled"];
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  return self->_isCommunicationSafetyNotificationEnabled;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  return self->_isCommunicationSafetyAnalyticsEnabled;
}

- (STCommunicationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"isCommunicationSafetySendingRestricted"];
  uint64_t v6 = [v4 decodeBoolForKey:@"isCommunicationSafetyReceivingRestricted"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isCommunicationSafetyNotificationEnabled"];
  uint64_t v8 = [v4 decodeBoolForKey:@"isCommunicationSafetyAnalyticsEnabled"];

  return [(STCommunicationConfiguration *)self initWithCommunicationSafetySendingRestricted:v5 communicationSafetyReceivingRestricted:v6 communicationSafetyNotificationEnabled:v7 communicationSafetyAnalyticsEnabled:v8];
}

- (STCommunicationConfiguration)initWithCommunicationSafetySendingRestricted:(BOOL)a3 communicationSafetyReceivingRestricted:(BOOL)a4 communicationSafetyNotificationEnabled:(BOOL)a5 communicationSafetyAnalyticsEnabled:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)STCommunicationConfiguration;
  result = [(STCommunicationConfiguration *)&v11 init];
  result->_BOOL isCommunicationSafetySendingRestricted = a3;
  result->_isCommunicationSafetyReceivingRestricted = a4;
  result->_isCommunicationSafetyNotificationEnabled = a5;
  result->_isCommunicationSafetyAnalyticsEnabled = a6;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL isCommunicationSafetySendingRestricted = self->_isCommunicationSafetySendingRestricted;
  BOOL isCommunicationSafetyReceivingRestricted = self->_isCommunicationSafetyReceivingRestricted;
  BOOL isCommunicationSafetyNotificationEnabled = self->_isCommunicationSafetyNotificationEnabled;
  BOOL isCommunicationSafetyAnalyticsEnabled = self->_isCommunicationSafetyAnalyticsEnabled;
  return (id)[v4 initWithCommunicationSafetySendingRestricted:isCommunicationSafetySendingRestricted communicationSafetyReceivingRestricted:isCommunicationSafetyReceivingRestricted communicationSafetyNotificationEnabled:isCommunicationSafetyNotificationEnabled communicationSafetyAnalyticsEnabled:isCommunicationSafetyAnalyticsEnabled];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STCommunicationConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(STCommunicationConfiguration *)self isEqualToCommunicationConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToCommunicationConfiguration:(id)a3
{
  id v4 = (STCommunicationConfiguration *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    BOOL v6 = [(STCommunicationConfiguration *)v4 isCommunicationSafetySendingRestricted];
    if (v6 == [(STCommunicationConfiguration *)self isCommunicationSafetySendingRestricted]&& (BOOL v7 = [(STCommunicationConfiguration *)v5 isCommunicationSafetyReceivingRestricted], v7 == [(STCommunicationConfiguration *)self isCommunicationSafetyReceivingRestricted])&& (v8 = [(STCommunicationConfiguration *)v5 isCommunicationSafetyNotificationEnabled], v8 == [(STCommunicationConfiguration *)self isCommunicationSafetyNotificationEnabled]))
    {
      BOOL v11 = [(STCommunicationConfiguration *)v5 isCommunicationSafetyAnalyticsEnabled];
      int v9 = v11 ^ [(STCommunicationConfiguration *)self isCommunicationSafetyAnalyticsEnabled] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STCommunicationConfiguration *)self isCommunicationSafetySendingRestricted];
  BOOL v4 = [(STCommunicationConfiguration *)self isCommunicationSafetyReceivingRestricted];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  if ([(STCommunicationConfiguration *)self isCommunicationSafetyNotificationEnabled])
  {
    uint64_t v7 = 4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(STCommunicationConfiguration *)self isCommunicationSafetyAnalyticsEnabled];
  uint64_t v9 = 8;
  if (!v8) {
    uint64_t v9 = 0;
  }
  return v6 | v7 | v9;
}

- (BOOL)isCommunicationSafetySendingRestricted
{
  return self->_isCommunicationSafetySendingRestricted;
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  return self->_isCommunicationSafetyReceivingRestricted;
}

@end