@interface FCNotificationsConfiguration
- (BOOL)isEqual:(id)a3;
- (FCNotificationsConfiguration)initWithPresubscribedChannelIDs:(id)a3 recommendedNotificationChannelIDs:(id)a4;
- (NSArray)preSubscribedNotificationsChannelIDs;
- (NSArray)recommendedNotificationChannelIDs;
- (unint64_t)hash;
@end

@implementation FCNotificationsConfiguration

- (FCNotificationsConfiguration)initWithPresubscribedChannelIDs:(id)a3 recommendedNotificationChannelIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCNotificationsConfiguration;
  v8 = [(FCNotificationsConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    preSubscribedNotificationsChannelIDs = v8->_preSubscribedNotificationsChannelIDs;
    v8->_preSubscribedNotificationsChannelIDs = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    recommendedNotificationChannelIDs = v8->_recommendedNotificationChannelIDs;
    v8->_recommendedNotificationChannelIDs = (NSArray *)v11;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedNotificationChannelIDs, 0);
  objc_storeStrong((id *)&self->_preSubscribedNotificationsChannelIDs, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6
    && objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", self->_preSubscribedNotificationsChannelIDs, v6[1]))
  {
    char v7 = objc_msgSend(MEMORY[0x1E4FBA8A8], "nf_object:isEqualToObject:", self->_recommendedNotificationChannelIDs, v6[2]);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_preSubscribedNotificationsChannelIDs hash];
  return [(NSArray *)self->_recommendedNotificationChannelIDs hash] ^ v3;
}

- (NSArray)preSubscribedNotificationsChannelIDs
{
  return self->_preSubscribedNotificationsChannelIDs;
}

- (NSArray)recommendedNotificationChannelIDs
{
  return self->_recommendedNotificationChannelIDs;
}

@end