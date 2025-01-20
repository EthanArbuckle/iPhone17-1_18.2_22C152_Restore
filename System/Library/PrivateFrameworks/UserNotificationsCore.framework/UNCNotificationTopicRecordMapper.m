@interface UNCNotificationTopicRecordMapper
- (UNCNotificationTopicRecordMapper)initWithBundle:(id)a3;
- (id)notificationTopicForNotificationTopicRecord:(id)a3;
@end

@implementation UNCNotificationTopicRecordMapper

- (UNCNotificationTopicRecordMapper)initWithBundle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationTopicRecordMapper;
  v6 = [(UNCNotificationTopicRecordMapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundle, a3);
  }

  return v7;
}

- (id)notificationTopicForNotificationTopicRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  v6 = (void *)MEMORY[0x263F1DED0];
  v7 = [v4 displayNameLocalizationKey];
  uint64_t v8 = [(BSCFBundle *)self->_bundle cfBundle];
  objc_super v9 = [v4 displayName];
  v10 = [v6 localizedUserNotificationStringForKey:v7 arguments:0 cfBundle:v8 defaultValue:v9];

  uint64_t v11 = [v4 priority];
  v12 = [v4 sortIdentifier];

  v13 = [MEMORY[0x263F1DF70] topicWithIdentifier:v5 displayName:v10 priority:v11 sortIdentifier:v12];

  return v13;
}

- (void).cxx_destruct
{
}

@end