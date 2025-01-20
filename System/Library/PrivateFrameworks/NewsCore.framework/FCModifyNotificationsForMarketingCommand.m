@interface FCModifyNotificationsForMarketingCommand
+ (BOOL)supportsSecureCoding;
- (FCModifyNotificationsForMarketingCommand)initWithCoder:(id)a3;
- (FCModifyNotificationsForMarketingCommand)initWithType:(int)a3 action:(int)a4 iTunesDSID:(id)a5;
- (NSString)dsid;
- (int)action;
- (int)type;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5;
- (void)setAction:(int)a3;
- (void)setDsid:(id)a3;
- (void)setType:(int)a3;
@end

@implementation FCModifyNotificationsForMarketingCommand

- (FCModifyNotificationsForMarketingCommand)initWithType:(int)a3 action:(int)a4 iTunesDSID:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FCModifyNotificationsForMarketingCommand;
  v9 = [(FCModifyNotificationsForMarketingCommand *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    dsid = v9->_dsid;
    v9->_dsid = (NSString *)v10;

    v9->_type = a3;
    v9->_action = a4;
  }

  return v9;
}

- (FCModifyNotificationsForMarketingCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.news.modify_notifications_for_marketing_type_key"];
  uint64_t v6 = [v5 intValue];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.news.modify_notifications_for_marketing_action_key"];
  uint64_t v8 = [v7 intValue];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.news.modify_notifications_for_marketing_dsid_key"];

  uint64_t v10 = [(FCModifyNotificationsForMarketingCommand *)self initWithType:v6 action:v8 iTunesDSID:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInt:", -[FCModifyNotificationsForMarketingCommand type](self, "type"));
  [v5 encodeObject:v6 forKey:@"com.apple.news.modify_notifications_for_marketing_type_key"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[FCModifyNotificationsForMarketingCommand action](self, "action"));
  [v5 encodeObject:v7 forKey:@"com.apple.news.modify_notifications_for_marketing_action_key"];

  id v8 = [(FCModifyNotificationsForMarketingCommand *)self dsid];
  [v5 encodeObject:v8 forKey:@"com.apple.news.modify_notifications_for_marketing_dsid_key"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForMarketingCommand: executing command", buf, 2u);
  }
  uint64_t v10 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 1;
  *(void *)buf = 0;
  v28 = buf;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__76;
  v31 = __Block_byref_object_dispose__76;
  id v32 = 0;
  dispatch_group_enter(v10);
  v11 = [v7 notificationsEndpointConnection];
  uint64_t v12 = [(FCModifyNotificationsForMarketingCommand *)self type];
  uint64_t v13 = [(FCModifyNotificationsForMarketingCommand *)self action];
  v14 = [(FCModifyNotificationsForMarketingCommand *)self dsid];
  v15 = dispatch_get_global_queue(-2, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v23[3] = &unk_1E5B50A08;
  v25 = v33;
  v26 = buf;
  v16 = v10;
  v24 = v16;
  [v11 modifyMarketingSubscriptionWithType:v12 action:v13 dsid:v14 callbackQueue:v15 completion:v23];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke_9;
  block[3] = &unk_1E5B5AD98;
  id v19 = v8;
  v20 = self;
  v21 = v33;
  v22 = buf;
  id v17 = v8;
  dispatch_group_notify(v16, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v33, 8);
}

void __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, char a2, void *a3)
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
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "modifyNotificationsCommand: failed to modify Marketing Subscription with error: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __89__FCModifyNotificationsForMarketingCommand_executeWithContext_delegate_qualityOfService___block_invoke_9(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "modifyNotificationsForMarketingCommand: succeeded opt in/out", v8, 2u);
    }
    return [*(id *)(a1 + 32) command:*(void *)(a1 + 40) didFinishWithStatus:0];
  }
  else
  {
    if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "fc_isNetworkUnavailableError"))
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = 1;
    }
    else
    {
      int v7 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "fc_shouldRetry");
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      if (v7) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 3;
      }
    }
    return [v4 command:v5 didFinishWithStatus:v6];
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end