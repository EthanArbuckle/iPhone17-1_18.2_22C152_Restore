@interface SSMigrator
- (SSMigrator)init;
- (void)performMigration:(unint64_t)a3 completionBlock:(id)a4;
@end

@implementation SSMigrator

- (SSMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSMigrator;
  v2 = [(SSMigrator *)&v6 init];
  if (v2)
  {
    v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    connection = v2->_connection;
    v2->_connection = v3;
  }
  return v2;
}

- (void)performMigration:(unint64_t)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      int v26 = 136446210;
      v27 = "-[SSMigrator performMigration:completionBlock:]";
      LODWORD(v23) = 12;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_16;
      }
      v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v26, v23);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v19 = SSXPCCreateMessageDictionary(116);
  v20 = [NSNumber numberWithInteger:a3];
  SSXPCDictionarySetObject(v19, "1", v20);

  NSLog(&cfstr_PerformingMigr.isa, a3);
  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __47__SSMigrator_performMigration_completionBlock___block_invoke;
  v24[3] = &unk_1E5BA92C8;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v19 withReply:v24];
}

void __47__SSMigrator_performMigration_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  NSLog(&cfstr_WeAreBackWitHa.isa, xdict);
  v3 = xdict;
  if (*(void *)(a1 + 32))
  {
    if (xdict == (xpc_object_t)MEMORY[0x1E4F14528] || xdict == (xpc_object_t)MEMORY[0x1E4F14520])
    {
      uint64_t v5 = 121;
    }
    else
    {
      if (xdict && MEMORY[0x1A62689E0](xdict) == MEMORY[0x1E4F14590])
      {
        id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
        int v8 = xpc_dictionary_get_value(xdict, "2");
        id v6 = (void *)[v7 initWithXPCEncoding:v8];

        xpc_dictionary_get_BOOL(xdict, "1");
        goto LABEL_12;
      }
      uint64_t v5 = 111;
    }
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    v3 = xdict;
  }
}

- (void).cxx_destruct
{
}

@end