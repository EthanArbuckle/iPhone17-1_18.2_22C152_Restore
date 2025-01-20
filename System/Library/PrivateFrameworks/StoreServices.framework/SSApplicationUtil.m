@interface SSApplicationUtil
- (SSApplicationUtil)init;
- (id)_connection;
- (void)restartApplication:(id)a3;
@end

@implementation SSApplicationUtil

- (SSApplicationUtil)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSApplicationUtil;
  v2 = [(SSApplicationUtil *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storeservices.applicationutils", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = v2->_serialQueue;
    v6 = dispatch_get_global_queue(0, 0);
    dispatch_set_target_queue(v5, v6);
  }
  return v2;
}

- (void)restartApplication:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    objc_super v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v22 = 136446210;
      v23 = "-[SSApplicationUtil restartApplication:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_super v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v19);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSApplicationUtil_restartApplication___block_invoke;
  block[3] = &unk_1E5BA7350;
  block[4] = self;
  id v21 = v4;
  id v18 = v4;
  dispatch_async(serialQueue, block);
}

void __40__SSApplicationUtil_restartApplication___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "0", 165);
  dispatch_queue_t v3 = [*(id *)(a1 + 32) _connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SSApplicationUtil_restartApplication___block_invoke_2;
  v5[3] = &unk_1E5BA6EE0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 sendMessage:v2 withReply:v5];
}

void __40__SSApplicationUtil_restartApplication___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 40))
  {
    objc_opt_class();
    CFArrayRef v6 = SSXPCDictionaryCopyCFObjectWithClass(v4, "0");
    int v7 = [(__CFArray *)v6 intValue];
    uint64_t v8 = +[SSLogConfig sharedStoreServicesConfig];
    int v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        int v9 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      uint64_t v12 = [v9 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        v11 &= 2u;
      }
      if (!v11) {
        goto LABEL_30;
      }
      uint64_t v13 = objc_opt_class();
      id v14 = v13;
      int v34 = 138412546;
      id v35 = v13;
      __int16 v36 = 1024;
      int v37 = [(__CFArray *)v6 intValue];
      LODWORD(v30) = 18;
    }
    else
    {
      if (!v8)
      {
        int v9 = +[SSLogConfig sharedConfig];
      }
      int v18 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      uint64_t v12 = [v9 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        v19 &= 2u;
      }
      if (!v19) {
        goto LABEL_30;
      }
      int v34 = 138412290;
      id v35 = (id)objc_opt_class();
      id v14 = v35;
      LODWORD(v30) = 12;
    }
    v20 = (void *)_os_log_send_and_compose_impl();

    if (!v20) {
      goto LABEL_31;
    }
    uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v34, v30);
    free(v20);
    SSFileLog(v9, @"%@", v21, v22, v23, v24, v25, v26, (uint64_t)v12);
LABEL_30:

    goto LABEL_31;
  }
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v5 = 121;
  }
  else
  {
    if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
    {
      objc_opt_class();
      CFArrayRef v27 = SSXPCDictionaryCopyCFObjectWithClass(v4, "0");
      if ([(__CFArray *)v27 intValue])
      {
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        v29 = xpc_dictionary_get_value(v4, "1");
        uint64_t v15 = (void *)[v28 initWithXPCEncoding:v29];
      }
      else
      {
        uint64_t v15 = 0;
      }

      goto LABEL_18;
    }
    uint64_t v5 = 111;
  }
  uint64_t v15 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_18:
  uint64_t v16 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SSApplicationUtil_restartApplication___block_invoke_3;
  block[3] = &unk_1E5BA7328;
  id v17 = *(id *)(a1 + 40);
  id v32 = v15;
  id v33 = v17;
  CFArrayRef v6 = v15;
  dispatch_async(v16, block);

  int v9 = v33;
LABEL_31:
}

uint64_t __40__SSApplicationUtil_restartApplication___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    uint64_t v5 = self->_connection;
    self->_connection = v4;

    connection = self->_connection;
  }
  return connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end