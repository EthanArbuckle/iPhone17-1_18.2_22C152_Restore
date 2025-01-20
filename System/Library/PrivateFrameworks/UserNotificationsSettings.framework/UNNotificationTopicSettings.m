@interface UNNotificationTopicSettings
+ (BOOL)supportsSecureCoding;
- (UNNotificationMuteAssertion)muteAssertion;
- (UNNotificationSettings)topicSettings;
- (UNNotificationTopic)topic;
- (UNNotificationTopicSettings)initWithCoder:(id)a3;
- (UNNotificationTopicSettings)initWithTopic:(id)a3 settings:(id)a4;
- (UNNotificationTopicSettings)initWithTopic:(id)a3 settings:(id)a4 muteAssertion:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationTopicSettings

- (UNNotificationTopicSettings)initWithTopic:(id)a3 settings:(id)a4
{
  return [(UNNotificationTopicSettings *)self initWithTopic:a3 settings:a4 muteAssertion:0];
}

- (UNNotificationTopicSettings)initWithTopic:(id)a3 settings:(id)a4 muteAssertion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNNotificationTopicSettings;
  v11 = [(UNNotificationTopicSettings *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    topic = v11->_topic;
    v11->_topic = (UNNotificationTopic *)v12;

    uint64_t v14 = [v9 copy];
    topicSettings = v11->_topicSettings;
    v11->_topicSettings = (UNNotificationSettings *)v14;

    uint64_t v16 = [v10 copy];
    muteAssertion = v11->_muteAssertion;
    v11->_muteAssertion = (UNNotificationMuteAssertion *)v16;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(UNNotificationTopicSettings *)self topic];
  v6 = [(UNNotificationTopicSettings *)self topicSettings];
  v7 = [(UNNotificationTopicSettings *)self muteAssertion];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; topic: %@, settings: %@, muteAssertion: %@>",
    v4,
    self,
    v5,
    v6,
  id v8 = v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UNNotificationTopicSettings *)self topic];
  [v4 encodeObject:v5 forKey:@"topic"];

  v6 = [(UNNotificationTopicSettings *)self topicSettings];
  [v4 encodeObject:v6 forKey:@"topicSettings"];

  id v7 = [(UNNotificationTopicSettings *)self muteAssertion];
  [v4 encodeObject:v7 forKey:@"muteAssertion"];
}

- (UNNotificationTopicSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topicSettings"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"muteAssertion"];

  id v8 = [(UNNotificationTopicSettings *)self initWithTopic:v5 settings:v6 muteAssertion:v7];
  return v8;
}

- (UNNotificationTopic)topic
{
  return self->_topic;
}

- (UNNotificationSettings)topicSettings
{
  return self->_topicSettings;
}

- (UNNotificationMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_topicSettings, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end