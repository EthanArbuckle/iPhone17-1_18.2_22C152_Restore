@interface FCRefreshNotificationsForChannelsCommand
+ (BOOL)supportsSecureCoding;
- (FCRefreshNotificationsForChannelsCommand)initWithChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8;
- (FCRefreshNotificationsForChannelsCommand)initWithCoder:(id)a3;
- (NSArray)channelIDs;
- (NSArray)paidChannelIDs;
- (NSString)deviceToken;
- (NSString)storefrontID;
- (NSString)userID;
- (int)deviceDigestMode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setChannelIDs:(id)a3;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceToken:(id)a3;
- (void)setPaidChannelIDs:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation FCRefreshNotificationsForChannelsCommand

- (FCRefreshNotificationsForChannelsCommand)initWithChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8
{
  id v24 = a3;
  id v23 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = v16;
  v18 = 0;
  if (v14 && v15 && v16)
  {
    v25.receiver = self;
    v25.super_class = (Class)FCRefreshNotificationsForChannelsCommand;
    v19 = [(FCRefreshNotificationsForChannelsCommand *)&v25 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_channelIDs, a3);
      objc_storeStrong((id *)&v20->_paidChannelIDs, a4);
      objc_storeStrong((id *)&v20->_userID, a5);
      objc_storeStrong((id *)&v20->_deviceToken, a6);
      objc_storeStrong((id *)&v20->_storefrontID, a7);
      v20->_deviceDigestMode = a8;
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (FCRefreshNotificationsForChannelsCommand)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ChannelIDsKey"];
  v9 = [v5 decodeObjectOfClasses:v7 forKey:@"PaidChannelIDsKey"];
  v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UserIDKey"];
  v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceTokenKey"];
  v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"StorefrontIDKey"];
  uint64_t v13 = [v5 decodeIntForKey:@"DigestModeKey"];

  id v14 = [(FCRefreshNotificationsForChannelsCommand *)self initWithChannelIDs:v8 paidChannelIDs:v9 userID:v10 deviceToken:v11 storefrontID:v12 deviceDigestMode:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(FCRefreshNotificationsForChannelsCommand *)self channelIDs];
  [v9 encodeObject:v4 forKey:@"ChannelIDsKey"];

  id v5 = [(FCRefreshNotificationsForChannelsCommand *)self paidChannelIDs];
  [v9 encodeObject:v5 forKey:@"PaidChannelIDsKey"];

  uint64_t v6 = [(FCRefreshNotificationsForChannelsCommand *)self userID];
  [v9 encodeObject:v6 forKey:@"UserIDKey"];

  v7 = [(FCRefreshNotificationsForChannelsCommand *)self deviceToken];
  [v9 encodeObject:v7 forKey:@"DeviceTokenKey"];

  v8 = [(FCRefreshNotificationsForChannelsCommand *)self storefrontID];
  [v9 encodeObject:v8 forKey:@"StorefrontIDKey"];

  objc_msgSend(v9, "encodeInt:forKey:", -[FCRefreshNotificationsForChannelsCommand deviceDigestMode](self, "deviceDigestMode"), @"DigestModeKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  v8 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    v10 = [(FCRefreshNotificationsForChannelsCommand *)self channelIDs];
    v11 = [(FCRefreshNotificationsForChannelsCommand *)self paidChannelIDs];
    *(_DWORD *)buf = 138543618;
    v27 = v10;
    __int16 v28 = 2114;
    v29 = v11;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: executing command channelIDs: %{public}@ paidChannelIDs: %{public}@", buf, 0x16u);
  }
  v12 = [v7 notificationsEndpointConnection];
  uint64_t v13 = [(FCRefreshNotificationsForChannelsCommand *)self channelIDs];
  id v14 = [(FCRefreshNotificationsForChannelsCommand *)self paidChannelIDs];
  id v15 = [(FCRefreshNotificationsForChannelsCommand *)self userID];
  id v16 = [(FCRefreshNotificationsForChannelsCommand *)self deviceToken];
  v17 = [(FCRefreshNotificationsForChannelsCommand *)self storefrontID];
  uint64_t v18 = [(FCRefreshNotificationsForChannelsCommand *)self deviceDigestMode];
  dispatch_get_global_queue(-2, 0);
  v19 = v21 = v7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__FCRefreshNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v23[3] = &unk_1E5B4D168;
  id v24 = v22;
  objc_super v25 = self;
  id v20 = v22;
  [v12 refreshNotificationsForChannelIDs:v13 paidChannelIDs:v14 userID:v15 deviceToken:v16 storefrontID:v17 deviceDigestMode:v18 callbackQueue:v19 completion:v23];
}

void __89__FCRefreshNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = FCPushNotificationsLog;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "refreshNotificationsCommand: succeeded refreshing channels", (uint8_t *)&v11, 2u);
    }
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "refreshNotificationsCommand: failed to refresh notifications with error: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = 1;
    }
    else
    {
      int v10 = objc_msgSend(v5, "fc_shouldRetry");
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      if (v10) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 3;
      }
    }
  }
  [v7 command:v8 didFinishWithStatus:v9];
}

- (NSArray)channelIDs
{
  return self->_channelIDs;
}

- (void)setChannelIDs:(id)a3
{
}

- (NSArray)paidChannelIDs
{
  return self->_paidChannelIDs;
}

- (void)setPaidChannelIDs:(id)a3
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
  objc_storeStrong((id *)&self->_paidChannelIDs, 0);
  objc_storeStrong((id *)&self->_channelIDs, 0);
}

@end