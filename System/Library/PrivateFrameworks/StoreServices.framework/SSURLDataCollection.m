@interface SSURLDataCollection
+ (void)collectURLSessionDataWithBlock:(id)a3;
@end

@implementation SSURLDataCollection

+ (void)collectURLSessionDataWithBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    v7 = [v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      int v8 = v6;
    }
    else {
      int v8 = v6 & 2;
    }
    if (v8)
    {
      int v21 = 136446210;
      v22 = "+[SSURLDataCollection collectURLSessionDataWithBlock:]";
      LODWORD(v18) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_15:

        goto LABEL_16;
      }
      v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v21, v18);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (v3)
  {
    xpc_object_t v16 = SSXPCCreateMessageDictionary(199);
    v17 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    if (v17)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __54__SSURLDataCollection_collectURLSessionDataWithBlock___block_invoke;
      v19[3] = &unk_1E5BA92C8;
      id v20 = v3;
      [(SSXPCConnection *)v17 sendMessage:v16 withReply:v19];
    }
    else
    {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
}

void __54__SSURLDataCollection_collectURLSessionDataWithBlock___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = objc_opt_class();
    id v5 = (id)SSXPCDictionaryCopyObjectWithClass(v3, "0", v4);
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end