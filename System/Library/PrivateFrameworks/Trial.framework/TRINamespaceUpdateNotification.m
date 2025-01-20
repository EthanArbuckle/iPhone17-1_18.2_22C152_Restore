@interface TRINamespaceUpdateNotification
+ (BOOL)notifyUpdateForNamespaceName:(id)a3;
+ (id)notificationNameForNamespaceName:(id)a3;
+ (id)registerUpdateForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5;
+ (void)deregisterUpdateWithToken:(id)a3;
- (NSString)namespaceName;
- (TRINamespaceUpdateNotification)initWithNamespaceName:(id)a3 token:(id)a4;
- (TRINotificationToken)token;
- (unsigned)namespaceId;
@end

@implementation TRINamespaceUpdateNotification

+ (id)registerUpdateForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  int out_token = -1;
  v9 = a4;
  id v10 = +[TRINamespaceUpdateNotification notificationNameForNamespaceName:v7];
  v11 = (const char *)[v10 UTF8String];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __82__TRINamespaceUpdateNotification_registerUpdateForNamespaceName_queue_usingBlock___block_invoke;
  handler[3] = &unk_1E596A980;
  id v12 = v7;
  id v20 = v12;
  id v13 = v8;
  id v21 = v13;
  uint32_t v14 = notify_register_dispatch(v11, &out_token, v9, handler);

  if (v14)
  {
    v15 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v24 = v14;
      _os_log_error_impl(&dword_19D909000, v15, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
    }

    v16 = 0;
  }
  else
  {
    v17 = [TRINotificationState alloc];
    v16 = [(TRINotificationState *)v17 initWithToken:out_token];
  }

  return v16;
}

+ (id)notificationNameForNamespaceName:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.trial.NamespaceUpdate", a3];
}

+ (void)deregisterUpdateWithToken:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    notify_cancel([v3 token]);
  }
}

- (TRINamespaceUpdateNotification)initWithNamespaceName:(id)a3 token:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRINamespaceUpdateNotification;
  v9 = [(TRINamespaceUpdateNotification *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namespaceName, a3);
    objc_storeStrong((id *)&v10->_token, a4);
  }

  return v10;
}

- (unsigned)namespaceId
{
  v2 = (void *)MEMORY[0x1E4FB05B8];
  id v3 = [(TRINamespaceUpdateNotification *)self namespaceName];
  LODWORD(v2) = [v2 namespaceIdFromName:v3];

  return v2;
}

void __82__TRINamespaceUpdateNotification_registerUpdateForNamespaceName_queue_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_debug_impl(&dword_19D909000, v4, OS_LOG_TYPE_DEBUG, "received update notification for namespace %@", (uint8_t *)&v9, 0xCu);
  }

  v5 = [[TRINotificationState alloc] initWithToken:a2];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [[TRINamespaceUpdateNotification alloc] initWithNamespaceName:*(void *)(a1 + 32) token:v5];
  (*(void (**)(uint64_t, TRINamespaceUpdateNotification *))(v6 + 16))(v6, v7);
}

+ (BOOL)notifyUpdateForNamespaceName:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = +[TRINamespaceUpdateNotification notificationNameForNamespaceName:a3];
  v4 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    unint64_t v10 = (unint64_t)v3;
    _os_log_impl(&dword_19D909000, v4, OS_LOG_TYPE_DEFAULT, "Sending namespace update notification: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v5 = v3;
  uint32_t v6 = notify_post((const char *)[v5 UTF8String]);
  if (v6)
  {
    id v7 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134217984;
      unint64_t v10 = v6;
      _os_log_error_impl(&dword_19D909000, v7, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6 == 0;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (TRINotificationToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

@end