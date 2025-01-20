@interface FCRefreshNotificationsForTopicsCommand
+ (BOOL)supportsSecureCoding;
- (FCRefreshNotificationsForTopicsCommand)initWithCoder:(id)a3;
- (FCRefreshNotificationsForTopicsCommand)initWithTopicsIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9;
- (NSArray)topicIDs;
- (NSString)channelID;
- (NSString)deviceToken;
- (NSString)storefrontID;
- (NSString)topicGroupingID;
- (NSString)userID;
- (int)deviceDigestMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setChannelID:(id)a3;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceToken:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setTopicGroupingID:(id)a3;
- (void)setTopicIDs:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation FCRefreshNotificationsForTopicsCommand

- (FCRefreshNotificationsForTopicsCommand)initWithTopicsIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id obj = a8;
  id v18 = a8;
  v19 = v18;
  v20 = 0;
  if (v16 && v17 && v18)
  {
    v28.receiver = self;
    v28.super_class = (Class)FCRefreshNotificationsForTopicsCommand;
    v21 = [(FCRefreshNotificationsForTopicsCommand *)&v28 init];
    v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_topicIDs, a3);
      objc_storeStrong((id *)&v22->_topicGroupingID, a4);
      objc_storeStrong((id *)&v22->_channelID, a5);
      objc_storeStrong((id *)&v22->_userID, a6);
      objc_storeStrong((id *)&v22->_deviceToken, a7);
      objc_storeStrong((id *)&v22->_storefrontID, obj);
      v22->_deviceDigestMode = a9;
    }
    self = v22;
    v20 = self;
  }

  return v20;
}

- (FCRefreshNotificationsForTopicsCommand)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"TopicIDsKey"];
  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"TopicGroupingID"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"FromChannelIDKey"];
  v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UserIDKey"];
  v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceTokenKey"];
  v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"StorefrontIDKey"];
  int v14 = [v5 decodeIntForKey:@"DigestModeKey"];

  LODWORD(v17) = v14;
  v15 = [(FCRefreshNotificationsForTopicsCommand *)self initWithTopicsIDs:v8 withTopicGroupingID:v9 fromChannelID:v10 userID:v11 deviceToken:v12 storefrontID:v13 deviceDigestMode:v17];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(FCRefreshNotificationsForTopicsCommand *)self topicIDs];
  [v10 encodeObject:v4 forKey:@"TopicIDsKey"];

  id v5 = [(FCRefreshNotificationsForTopicsCommand *)self topicGroupingID];
  [v10 encodeObject:v5 forKey:@"TopicGroupingID"];

  uint64_t v6 = [(FCRefreshNotificationsForTopicsCommand *)self channelID];
  [v10 encodeObject:v6 forKey:@"FromChannelIDKey"];

  v7 = [(FCRefreshNotificationsForTopicsCommand *)self userID];
  [v10 encodeObject:v7 forKey:@"UserIDKey"];

  v8 = [(FCRefreshNotificationsForTopicsCommand *)self deviceToken];
  [v10 encodeObject:v8 forKey:@"DeviceTokenKey"];

  v9 = [(FCRefreshNotificationsForTopicsCommand *)self storefrontID];
  [v10 encodeObject:v9 forKey:@"StorefrontIDKey"];

  objc_msgSend(v10, "encodeInt:forKey:", -[FCRefreshNotificationsForTopicsCommand deviceDigestMode](self, "deviceDigestMode"), @"DigestModeKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  v8 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    id v10 = [(FCRefreshNotificationsForTopicsCommand *)self topicIDs];
    v11 = [(FCRefreshNotificationsForTopicsCommand *)self topicGroupingID];
    *(_DWORD *)buf = 138543618;
    objc_super v28 = v10;
    __int16 v29 = 2114;
    v30 = v11;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: executing command topicIDs: %{public}@ groupingID: %{public}@", buf, 0x16u);
  }
  v22 = [v7 notificationsEndpointConnection];
  v12 = [(FCRefreshNotificationsForTopicsCommand *)self topicIDs];
  v13 = [(FCRefreshNotificationsForTopicsCommand *)self topicGroupingID];
  int v14 = [(FCRefreshNotificationsForTopicsCommand *)self channelID];
  v15 = [(FCRefreshNotificationsForTopicsCommand *)self userID];
  id v16 = [(FCRefreshNotificationsForTopicsCommand *)self deviceToken];
  uint64_t v17 = [(FCRefreshNotificationsForTopicsCommand *)self storefrontID];
  v23 = v7;
  int v18 = [(FCRefreshNotificationsForTopicsCommand *)self deviceDigestMode];
  v19 = dispatch_get_global_queue(-2, 0);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __87__FCRefreshNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v25[3] = &unk_1E5B4D168;
  v25[4] = self;
  id v26 = v24;
  id v20 = v24;
  LODWORD(v21) = v18;
  [v22 refreshNotificationsForTopicIDs:v12 withTopicGroupingID:v13 fromChannelID:v14 userID:v15 deviceToken:v16 storefrontID:v17 deviceDigestMode:v21 callbackQueue:v19 completion:v25];
}

void __87__FCRefreshNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = FCPushNotificationsLog;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = [v7 topicGroupingID];
      int v14 = 138543362;
      id v15 = v9;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: succeeded refreshing topics for groupID: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    uint64_t v12 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "refreshNotificationsCommand: failed to refresh notifications with error: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v10 = *(void **)(a1 + 40);
      uint64_t v12 = 1;
    }
    else
    {
      int v13 = objc_msgSend(v5, "fc_shouldRetry");
      uint64_t v11 = *(void *)(a1 + 32);
      id v10 = *(void **)(a1 + 40);
      if (v13) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 3;
      }
    }
  }
  [v10 command:v11 didFinishWithStatus:v12];
}

- (NSArray)topicIDs
{
  return self->_topicIDs;
}

- (void)setTopicIDs:(id)a3
{
}

- (NSString)topicGroupingID
{
  return self->_topicGroupingID;
}

- (void)setTopicGroupingID:(id)a3
{
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setDeviceToken:(id)a3
{
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (void)setStorefrontID:(id)a3
{
}

- (int)deviceDigestMode
{
  return self->_deviceDigestMode;
}

- (void)setDeviceDigestMode:(int)a3
{
  self->_deviceDigestMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_channelID, 0);
  objc_storeStrong((id *)&self->_topicGroupingID, 0);
  objc_storeStrong((id *)&self->_topicIDs, 0);
}

@end