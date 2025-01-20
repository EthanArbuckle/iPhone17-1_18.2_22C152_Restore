@interface UNNotificationSourceSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isRestricted;
- (NSArray)topicSettings;
- (UNNotificationMuteAssertion)muteAssertion;
- (UNNotificationSettings)notificationSettings;
- (UNNotificationSourceSettings)initWithCoder:(id)a3;
- (UNNotificationSourceSettings)initWithNotificationSettings:(id)a3 topicSettings:(id)a4 muteAssertion:(id)a5 isRestricted:(BOOL)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationSourceSettings

- (UNNotificationSourceSettings)initWithNotificationSettings:(id)a3 topicSettings:(id)a4 muteAssertion:(id)a5 isRestricted:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)UNNotificationSourceSettings;
  v13 = [(UNNotificationSourceSettings *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    notificationSettings = v13->_notificationSettings;
    v13->_notificationSettings = (UNNotificationSettings *)v14;

    uint64_t v16 = [v11 copy];
    topicSettings = v13->_topicSettings;
    v13->_topicSettings = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    muteAssertion = v13->_muteAssertion;
    v13->_muteAssertion = (UNNotificationMuteAssertion *)v18;

    v13->_isRestricted = a6;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationSourceSettings *)self notificationSettings];
  v6 = [(UNNotificationSourceSettings *)self topicSettings];
  v7 = [(UNNotificationSourceSettings *)self muteAssertion];
  BOOL v8 = [(UNNotificationSourceSettings *)self isRestricted];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; notification settings: %@ topic settings: %@, mute assertion: %@, isRestricted: %@",
    v4,
    self,
    v5,
    v6,
    v7,
  id v10 = v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(UNNotificationSourceSettings *)self notificationSettings];
  [v7 encodeObject:v4 forKey:@"notificationSettings"];

  v5 = [(UNNotificationSourceSettings *)self topicSettings];
  [v7 encodeObject:v5 forKey:@"topicSettings"];

  v6 = [(UNNotificationSourceSettings *)self muteAssertion];
  [v7 encodeObject:v6 forKey:@"muteAssertion"];

  objc_msgSend(v7, "encodeBool:forKey:", -[UNNotificationSourceSettings isRestricted](self, "isRestricted"), @"restricted");
}

- (UNNotificationSourceSettings)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationSettings"];
  v6 = (void *)MEMORY[0x263EFFA08];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  BOOL v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"topicSettings"];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"muteAssertion"];
  uint64_t v11 = [v4 decodeBoolForKey:@"restricted"];

  id v12 = [(UNNotificationSourceSettings *)self initWithNotificationSettings:v5 topicSettings:v9 muteAssertion:v10 isRestricted:v11];
  return v12;
}

- (UNNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (NSArray)topicSettings
{
  return self->_topicSettings;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (UNNotificationMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_topicSettings, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
}

@end