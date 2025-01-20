@interface FCModifyNotificationsForTopicsCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)canCoalesceWithCommand:(id)a3;
- (FCModifyNotificationsForTopicsCommand)initWithCoder:(id)a3;
- (FCModifyNotificationsForTopicsCommand)initWithTopicIDsToAdd:(id)a3 topicIDsToRemove:(id)a4 withTopicGroupingID:(id)a5 fromChannelID:(id)a6 userID:(id)a7 deviceToken:(id)a8 storefrontID:(id)a9 deviceDigestMode:(int)a10;
- (NSArray)topicIDsToAdd;
- (NSArray)topicIDsToRemove;
- (NSString)channelID;
- (NSString)deviceToken;
- (NSString)storefrontID;
- (NSString)topicGroupingID;
- (NSString)userID;
- (int)deviceDigestMode;
- (void)coalesceWithCommand:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setChannelID:(id)a3;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceToken:(id)a3;
- (void)setStorefrontID:(id)a3;
- (void)setTopicGroupingID:(id)a3;
- (void)setTopicIDsToAdd:(id)a3;
- (void)setTopicIDsToRemove:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation FCModifyNotificationsForTopicsCommand

- (FCModifyNotificationsForTopicsCommand)initWithTopicIDsToAdd:(id)a3 topicIDsToRemove:(id)a4 withTopicGroupingID:(id)a5 fromChannelID:(id)a6 userID:(id)a7 deviceToken:(id)a8 storefrontID:(id)a9 deviceDigestMode:(int)a10
{
  id v17 = a3;
  id v18 = a4;
  id v30 = a5;
  id v29 = a6;
  id obj = a7;
  id v19 = a7;
  id v28 = a8;
  id v20 = a8;
  id v21 = a9;
  v31 = v17;
  if ([v17 count])
  {
    if (!v19)
    {
      v22 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v23 = [v18 count];
    v22 = 0;
    if (!v19 || !v23) {
      goto LABEL_11;
    }
  }
  v22 = 0;
  if (v20 && v21)
  {
    v32.receiver = self;
    v32.super_class = (Class)FCModifyNotificationsForTopicsCommand;
    v24 = [(FCModifyNotificationsForTopicsCommand *)&v32 init];
    v25 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_topicIDsToAdd, a3);
      objc_storeStrong((id *)&v25->_topicIDsToRemove, a4);
      objc_storeStrong((id *)&v25->_topicGroupingID, a5);
      objc_storeStrong((id *)&v25->_channelID, a6);
      objc_storeStrong((id *)&v25->_userID, obj);
      objc_storeStrong((id *)&v25->_deviceToken, v28);
      objc_storeStrong((id *)&v25->_storefrontID, a9);
      v25->_deviceDigestMode = a10;
    }
    self = v25;
    v22 = self;
  }
LABEL_11:

  return v22;
}

- (FCModifyNotificationsForTopicsCommand)initWithCoder:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"TopicIDsToAddKey"];
  v8 = [v4 decodeObjectOfClasses:v6 forKey:@"TopicIDsToRemoveKey"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TopicGroupingID"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FromChannelIDKey"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserIDKey"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceTokenKey"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StorefrontIDKey"];
  int v14 = [v4 decodeIntForKey:@"DigestModeKey"];

  LODWORD(v17) = v14;
  v15 = [(FCModifyNotificationsForTopicsCommand *)self initWithTopicIDsToAdd:v7 topicIDsToRemove:v8 withTopicGroupingID:v9 fromChannelID:v10 userID:v11 deviceToken:v12 storefrontID:v13 deviceDigestMode:v17];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToAdd];
  [v11 encodeObject:v4 forKey:@"TopicIDsToAddKey"];

  uint64_t v5 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToRemove];
  [v11 encodeObject:v5 forKey:@"TopicIDsToRemoveKey"];

  v6 = [(FCModifyNotificationsForTopicsCommand *)self topicGroupingID];
  [v11 encodeObject:v6 forKey:@"TopicGroupingID"];

  v7 = [(FCModifyNotificationsForTopicsCommand *)self channelID];
  [v11 encodeObject:v7 forKey:@"FromChannelIDKey"];

  v8 = [(FCModifyNotificationsForTopicsCommand *)self userID];
  [v11 encodeObject:v8 forKey:@"UserIDKey"];

  v9 = [(FCModifyNotificationsForTopicsCommand *)self deviceToken];
  [v11 encodeObject:v9 forKey:@"DeviceTokenKey"];

  v10 = [(FCModifyNotificationsForTopicsCommand *)self storefrontID];
  [v11 encodeObject:v10 forKey:@"StorefrontIDKey"];

  objc_msgSend(v11, "encodeInt:forKey:", -[FCModifyNotificationsForTopicsCommand deviceDigestMode](self, "deviceDigestMode"), @"DigestModeKey");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v41 = a4;
  v7 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: executing command", buf, 2u);
  }
  v8 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToAdd];
  if ([v8 count])
  {

LABEL_6:
    group = dispatch_group_create();
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x2020000000;
    char v70 = 1;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x2020000000;
    char v68 = 1;
    *(void *)buf = 0;
    v62 = buf;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__77;
    v65 = __Block_byref_object_dispose__77;
    id v66 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x3032000000;
    v59[3] = __Block_byref_object_copy__77;
    v59[4] = __Block_byref_object_dispose__77;
    id v60 = 0;
    id v11 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToAdd];
    BOOL v12 = [v11 count] == 0;

    if (!v12)
    {
      v13 = (id)FCPushNotificationsLog;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToAdd];
        v15 = [(FCModifyNotificationsForTopicsCommand *)self topicGroupingID];
        *(_DWORD *)v71 = 138543618;
        v72 = v14;
        __int16 v73 = 2114;
        v74 = v15;
        _os_log_impl(&dword_1A460D000, v13, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: adding topicIDs: %{public}@ groupingID: %{public}@", v71, 0x16u);
      }
      dispatch_group_enter(group);
      v16 = [v42 notificationsEndpointConnection];
      uint64_t v17 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToAdd];
      id v18 = [(FCModifyNotificationsForTopicsCommand *)self topicGroupingID];
      id v19 = [(FCModifyNotificationsForTopicsCommand *)self channelID];
      id v20 = [(FCModifyNotificationsForTopicsCommand *)self userID];
      id v21 = [(FCModifyNotificationsForTopicsCommand *)self deviceToken];
      v22 = [(FCModifyNotificationsForTopicsCommand *)self storefrontID];
      int v39 = [(FCModifyNotificationsForTopicsCommand *)self deviceDigestMode];
      uint64_t v23 = dispatch_get_global_queue(-2, 0);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke;
      v55[3] = &unk_1E5B50A08;
      v57 = v69;
      v58 = buf;
      v56 = group;
      LODWORD(v38) = v39;
      [v16 subscribeNotificationsForTopicIDs:v17 withTopicGroupingID:v18 fromChannelID:v19 userID:v20 deviceToken:v21 storefrontID:v22 deviceDigestMode:v38 callbackQueue:v23 completion:v55];
    }
    v24 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToRemove];
    BOOL v25 = [v24 count] == 0;

    if (!v25)
    {
      v26 = (id)FCPushNotificationsLog;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToRemove];
        id v28 = [(FCModifyNotificationsForTopicsCommand *)self topicGroupingID];
        *(_DWORD *)v71 = 138543618;
        v72 = v27;
        __int16 v73 = 2114;
        v74 = v28;
        _os_log_impl(&dword_1A460D000, v26, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: removing topicIDs: %{public}@ groupingID: %{public}@", v71, 0x16u);
      }
      dispatch_group_enter(group);
      id v29 = [v42 notificationsEndpointConnection];
      id v30 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToRemove];
      v31 = [(FCModifyNotificationsForTopicsCommand *)self topicGroupingID];
      objc_super v32 = [(FCModifyNotificationsForTopicsCommand *)self channelID];
      v33 = [(FCModifyNotificationsForTopicsCommand *)self userID];
      v34 = [(FCModifyNotificationsForTopicsCommand *)self deviceToken];
      v35 = [(FCModifyNotificationsForTopicsCommand *)self storefrontID];
      int v40 = [(FCModifyNotificationsForTopicsCommand *)self deviceDigestMode];
      v36 = dispatch_get_global_queue(-2, 0);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_25;
      v51[3] = &unk_1E5B50A08;
      v53 = v67;
      v54 = v59;
      v52 = group;
      LODWORD(v38) = v40;
      [v29 unsubscribeNotificationsForTopicIDs:v30 withTopicGroupingID:v31 fromChannelID:v32 userID:v33 deviceToken:v34 storefrontID:v35 deviceDigestMode:v38 callbackQueue:v36 completion:v51];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_26;
    block[3] = &unk_1E5B50A30;
    v47 = v69;
    v48 = v67;
    id v45 = v41;
    v46 = self;
    v49 = buf;
    v50 = v59;
    dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v59, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v67, 8);
    _Block_object_dispose(v69, 8);

    goto LABEL_15;
  }
  v9 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToRemove];
  BOOL v10 = [v9 count] == 0;

  if (!v10) {
    goto LABEL_6;
  }
  v37 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v37, OS_LOG_TYPE_INFO, "modifyNotificationsForTopicsCommand: no topics to add or remove", buf, 2u);
  }
  [v41 command:self didFinishWithStatus:0];
LABEL_15:
}

void __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForTopicsCommand: failed to add topics with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsForTopicsCommand: failed to remove topics with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __86__FCModifyNotificationsForTopicsCommand_executeWithContext_delegate_qualityOfService___block_invoke_26(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForTopicsCommand: succeeded adding/removing topics", v7, 2u);
    }
    return [*(id *)(a1 + 32) command:*(void *)(a1 + 40) didFinishWithStatus:0];
  }
  else
  {
    if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "fc_isNetworkUnavailableError") & 1) != 0
      || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "fc_isNetworkUnavailableError"))
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 1;
    }
    else if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "fc_shouldRetry") & 1) != 0 {
           || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "fc_shouldRetry"))
    }
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 2;
    }
    else
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 3;
    }
    return [v4 command:v5 didFinishWithStatus:v6];
  }
}

- (BOOL)canCoalesceWithCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
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
    id v7 = v5;
    v8 = [(FCModifyNotificationsForTopicsCommand *)self channelID];
    id v9 = [v7 channelID];
    char v6 = [v8 isEqual:v9];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)coalesceWithCommand:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
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
  id v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToAdd];
  [v7 addObjectsFromArray:v8];

  id v9 = [v6 topicIDsToAdd];
  [v7 addObjectsFromArray:v9];

  int v10 = [MEMORY[0x1E4F1CA80] set];
  id v11 = [(FCModifyNotificationsForTopicsCommand *)self topicIDsToRemove];
  [v10 addObjectsFromArray:v11];

  uint64_t v12 = [v6 topicIDsToRemove];
  [v10 addObjectsFromArray:v12];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = objc_msgSend(v10, "copy", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([v7 containsObject:v18])
        {
          [v7 removeObject:v18];
          [v10 removeObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  id v19 = [v7 allObjects];
  [(FCModifyNotificationsForTopicsCommand *)self setTopicIDsToAdd:v19];

  id v20 = [v10 allObjects];
  [(FCModifyNotificationsForTopicsCommand *)self setTopicIDsToRemove:v20];
}

- (NSArray)topicIDsToAdd
{
  return self->_topicIDsToAdd;
}

- (void)setTopicIDsToAdd:(id)a3
{
}

- (NSArray)topicIDsToRemove
{
  return self->_topicIDsToRemove;
}

- (void)setTopicIDsToRemove:(id)a3
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
  objc_storeStrong((id *)&self->_topicIDsToRemove, 0);
  objc_storeStrong((id *)&self->_topicIDsToAdd, 0);
}

@end