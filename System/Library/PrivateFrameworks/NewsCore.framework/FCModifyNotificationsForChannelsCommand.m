@interface FCModifyNotificationsForChannelsCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)canCoalesceWithCommand:(id)a3;
- (FCModifyNotificationsForChannelsCommand)initWithChannelIDsToAdd:(id)a3 paidChannelIDsToAdd:(id)a4 channelIDsToRemove:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9;
- (FCModifyNotificationsForChannelsCommand)initWithCoder:(id)a3;
- (NSArray)channelIDsToAdd;
- (NSArray)channelIDsToRemove;
- (NSArray)paidChannelIDsToAdd;
- (NSString)deviceToken;
- (NSString)storefrontID;
- (NSString)userID;
- (int)deviceDigestMode;
- (void)coalesceWithCommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setChannelIDsToAdd:(id)a3;
- (void)setChannelIDsToRemove:(id)a3;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceToken:(id)a3;
- (void)setPaidChannelIDsToAdd:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation FCModifyNotificationsForChannelsCommand

- (FCModifyNotificationsForChannelsCommand)initWithChannelIDsToAdd:(id)a3 paidChannelIDsToAdd:(id)a4 channelIDsToRemove:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9
{
  id v16 = a3;
  id v28 = a4;
  id v27 = a5;
  id v17 = a6;
  id v18 = a7;
  id obj = a8;
  id v19 = a8;
  v26 = v16;
  if ([v16 count] || objc_msgSend(v28, "count"))
  {
    if (!v17)
    {
      v20 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v24 = [v27 count];
    v20 = 0;
    if (!v17 || !v24) {
      goto LABEL_10;
    }
  }
  v20 = 0;
  if (v18 && v19)
  {
    v29.receiver = self;
    v29.super_class = (Class)FCModifyNotificationsForChannelsCommand;
    v21 = [(FCModifyNotificationsForChannelsCommand *)&v29 init];
    v22 = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_channelIDsToAdd, a3);
      objc_storeStrong((id *)&v22->_paidChannelIDsToAdd, a4);
      objc_storeStrong((id *)&v22->_channelIDsToRemove, a5);
      objc_storeStrong((id *)&v22->_userID, a6);
      objc_storeStrong((id *)&v22->_deviceToken, a7);
      objc_storeStrong((id *)&v22->_storefrontID, obj);
      v22->_deviceDigestMode = a9;
    }
    self = v22;
    v20 = self;
  }
LABEL_10:

  return v20;
}

- (FCModifyNotificationsForChannelsCommand)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ChannelIDsToAddKey"];
  v9 = [v5 decodeObjectOfClasses:v7 forKey:@"PaidChannelIDsToAddKey"];
  v10 = [v5 decodeObjectOfClasses:v7 forKey:@"ChannelIDsToRemoveKey"];
  v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UserIDKey"];
  v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceTokenKey"];
  v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"StorefrontIDKey"];
  int v14 = [v5 decodeIntForKey:@"DigestModeKey"];

  LODWORD(v17) = v14;
  v15 = [(FCModifyNotificationsForChannelsCommand *)self initWithChannelIDsToAdd:v8 paidChannelIDsToAdd:v9 channelIDsToRemove:v10 userID:v11 deviceToken:v12 storefrontID:v13 deviceDigestMode:v17];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToAdd];
  [v10 encodeObject:v4 forKey:@"ChannelIDsToAddKey"];

  id v5 = [(FCModifyNotificationsForChannelsCommand *)self paidChannelIDsToAdd];
  [v10 encodeObject:v5 forKey:@"PaidChannelIDsToAddKey"];

  uint64_t v6 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToRemove];
  [v10 encodeObject:v6 forKey:@"ChannelIDsToRemoveKey"];

  v7 = [(FCModifyNotificationsForChannelsCommand *)self userID];
  [v10 encodeObject:v7 forKey:@"UserIDKey"];

  v8 = [(FCModifyNotificationsForChannelsCommand *)self deviceToken];
  [v10 encodeObject:v8 forKey:@"DeviceTokenKey"];

  v9 = [(FCModifyNotificationsForChannelsCommand *)self storefrontID];
  [v10 encodeObject:v9 forKey:@"StorefrontIDKey"];

  objc_msgSend(v10, "encodeInt:forKey:", -[FCModifyNotificationsForChannelsCommand deviceDigestMode](self, "deviceDigestMode"), @"DigestModeKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v39 = a4;
  v7 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: executing command", buf, 2u);
  }
  v8 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToAdd];
  if ([v8 count]) {
    goto LABEL_6;
  }
  v9 = [(FCModifyNotificationsForChannelsCommand *)self paidChannelIDsToAdd];
  if ([v9 count])
  {

LABEL_6:
    goto LABEL_7;
  }
  v35 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToRemove];
  BOOL v36 = [v35 count] == 0;

  if (!v36)
  {
LABEL_7:
    id v10 = dispatch_group_create();
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    char v67 = 1;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    char v65 = 1;
    *(void *)buf = 0;
    v59 = buf;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__23;
    v62 = __Block_byref_object_dispose__23;
    id v63 = 0;
    v56[0] = 0;
    v56[1] = v56;
    v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__23;
    v56[4] = __Block_byref_object_dispose__23;
    id v57 = 0;
    v11 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToAdd];
    if ([v11 count])
    {
    }
    else
    {
      v12 = [(FCModifyNotificationsForChannelsCommand *)self paidChannelIDsToAdd];
      BOOL v13 = [v12 count] == 0;

      if (v13)
      {
LABEL_13:
        uint64_t v24 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToRemove];
        BOOL v25 = [v24 count] == 0;

        if (!v25)
        {
          v26 = (id)FCPushNotificationsLog;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToRemove];
            *(_DWORD *)v68 = 138543362;
            v69 = v27;
            _os_log_impl(&dword_1A460D000, v26, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: removing channelIDs: %{public}@", v68, 0xCu);
          }
          dispatch_group_enter(v10);
          id v28 = [v40 notificationsEndpointConnection];
          objc_super v29 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToRemove];
          v30 = [(FCModifyNotificationsForChannelsCommand *)self userID];
          v31 = [(FCModifyNotificationsForChannelsCommand *)self deviceToken];
          v32 = [(FCModifyNotificationsForChannelsCommand *)self storefrontID];
          uint64_t v33 = [(FCModifyNotificationsForChannelsCommand *)self deviceDigestMode];
          v34 = dispatch_get_global_queue(-2, 0);
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke_22;
          v48[3] = &unk_1E5B50A08;
          v50 = v64;
          v51 = v56;
          v49 = v10;
          [v28 unsubscribeNotificationsForChannelIDs:v29 userID:v30 deviceToken:v31 storefrontID:v32 deviceDigestMode:v33 callbackQueue:v34 completion:v48];
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke_23;
        block[3] = &unk_1E5B50A30;
        v44 = v66;
        v45 = v64;
        id v42 = v39;
        v43 = self;
        v46 = buf;
        v47 = v56;
        dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);

        _Block_object_dispose(v56, 8);
        _Block_object_dispose(buf, 8);

        _Block_object_dispose(v64, 8);
        _Block_object_dispose(v66, 8);

        goto LABEL_18;
      }
    }
    int v14 = (id)FCPushNotificationsLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToAdd];
      id v16 = [(FCModifyNotificationsForChannelsCommand *)self paidChannelIDsToAdd];
      *(_DWORD *)v68 = 138543618;
      v69 = v15;
      __int16 v70 = 2114;
      v71 = v16;
      _os_log_impl(&dword_1A460D000, v14, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: adding channelIDs: %{public}@ paidChannelIDs: %{public}@", v68, 0x16u);
    }
    dispatch_group_enter(v10);
    uint64_t v17 = [v40 notificationsEndpointConnection];
    id v18 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToAdd];
    id v19 = [(FCModifyNotificationsForChannelsCommand *)self paidChannelIDsToAdd];
    v20 = [(FCModifyNotificationsForChannelsCommand *)self userID];
    v21 = [(FCModifyNotificationsForChannelsCommand *)self deviceToken];
    v22 = [(FCModifyNotificationsForChannelsCommand *)self storefrontID];
    unsigned int v38 = [(FCModifyNotificationsForChannelsCommand *)self deviceDigestMode];
    v23 = dispatch_get_global_queue(-2, 0);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
    v52[3] = &unk_1E5B50A08;
    v54 = v66;
    v55 = buf;
    v53 = v10;
    [v17 subscribeNotificationsForChannelIDs:v18 paidChannelIDs:v19 userID:v20 deviceToken:v21 storefrontID:v22 deviceDigestMode:v38 callbackQueue:v23 completion:v52];

    goto LABEL_13;
  }
  v37 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v37, OS_LOG_TYPE_INFO, "modifyNotificationsForChannelsCommand: no channels to add or remove", buf, 2u);
  }
  [v39 command:self didFinishWithStatus:0];
LABEL_18:
}

void __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForChannelsCommand: failed to add channels with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke_22(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForChannelsCommand: failed to remove channels with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __88__FCModifyNotificationsForChannelsCommand_executeWithContext_delegate_qualityOfService___block_invoke_23(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForChannelsCommand: succeeded adding/removing channels", v7, 2u);
    }
    return [*(id *)(a1 + 32) command:*(void *)(a1 + 40) didFinishWithStatus:0];
  }
  else
  {
    if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "fc_isNetworkUnavailableError") & 1) != 0
      || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "fc_isNetworkUnavailableError"))
    {
      v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 1;
    }
    else if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "fc_shouldRetry") & 1) != 0 {
           || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "fc_shouldRetry"))
    }
    {
      v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 2;
    }
    else
    {
      v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 3;
    }
    return [v4 command:v5 didFinishWithStatus:v6];
  }
}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)coalesceWithCommand:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  BOOL v25 = v4;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToAdd];
  [v7 addObjectsFromArray:v8];

  id v9 = [v6 channelIDsToAdd];
  [v7 addObjectsFromArray:v9];

  int v10 = [MEMORY[0x1E4F1CA80] set];
  id v11 = [(FCModifyNotificationsForChannelsCommand *)self paidChannelIDsToAdd];
  [v10 addObjectsFromArray:v11];

  uint64_t v12 = [v6 paidChannelIDsToAdd];
  [v10 addObjectsFromArray:v12];

  BOOL v13 = [MEMORY[0x1E4F1CA80] set];
  int v14 = [(FCModifyNotificationsForChannelsCommand *)self channelIDsToRemove];
  [v13 addObjectsFromArray:v14];

  v15 = [v6 channelIDsToRemove];
  [v13 addObjectsFromArray:v15];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = (void *)[v13 copy];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if ([v7 containsObject:v21])
        {
          [v7 removeObject:v21];
          [v13 removeObject:v21];
        }
        if ([v10 containsObject:v21])
        {
          [v10 removeObject:v21];
          [v13 removeObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v18);
  }

  v22 = [v7 allObjects];
  [(FCModifyNotificationsForChannelsCommand *)self setChannelIDsToAdd:v22];

  v23 = [v10 allObjects];
  [(FCModifyNotificationsForChannelsCommand *)self setPaidChannelIDsToAdd:v23];

  uint64_t v24 = [v13 allObjects];
  [(FCModifyNotificationsForChannelsCommand *)self setChannelIDsToRemove:v24];
}

- (NSArray)channelIDsToAdd
{
  return self->_channelIDsToAdd;
}

- (void)setChannelIDsToAdd:(id)a3
{
}

- (NSArray)paidChannelIDsToAdd
{
  return self->_paidChannelIDsToAdd;
}

- (void)setPaidChannelIDsToAdd:(id)a3
{
}

- (NSArray)channelIDsToRemove
{
  return self->_channelIDsToRemove;
}

- (void)setChannelIDsToRemove:(id)a3
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
  objc_storeStrong((id *)&self->_channelIDsToRemove, 0);
  objc_storeStrong((id *)&self->_paidChannelIDsToAdd, 0);
  objc_storeStrong((id *)&self->_channelIDsToAdd, 0);
}

@end