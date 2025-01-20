@interface SSVMediaSocialShareExtension
- (NSString)extensionIdentifier;
- (SSVMediaSocialShareExtension)init;
- (void)getVisibilityWithCompletionBlock:(id)a3;
@end

@implementation SSVMediaSocialShareExtension

- (SSVMediaSocialShareExtension)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSVMediaSocialShareExtension;
  v2 = [(SSVMediaSocialShareExtension *)&v6 init];
  if (v2)
  {
    v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    connection = v2->_connection;
    v2->_connection = v3;
  }
  return v2;
}

- (NSString)extensionIdentifier
{
  return (NSString *)@"com.apple.Music.MediaSocialShareService";
}

- (void)getVisibilityWithCompletionBlock:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_connection)
  {
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3B8];
    v22 = @"Send -init before checking visibility";
LABEL_21:
    [v20 raise:v21 format:v22];
    goto LABEL_22;
  }
  if (!v4)
  {
    v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C3C8];
    v22 = @"No completion block";
    goto LABEL_21;
  }
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl()) {
    goto LABEL_18;
  }
  objc_super v6 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v6)
  {
    objc_super v6 = +[SSLogConfig sharedConfig];
  }
  int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  v9 = [v6 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    int v10 = v8;
  }
  else {
    int v10 = v8 & 2;
  }
  if (!v10) {
    goto LABEL_16;
  }
  int v26 = 136446210;
  v27 = "-[SSVMediaSocialShareExtension getVisibilityWithCompletionBlock:]";
  LODWORD(v23) = 12;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    v9 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v26, v23);
    free(v11);
    SSFileLog(v6, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v9);
LABEL_16:
  }
LABEL_18:
  xpc_object_t v18 = SSXPCCreateMessageDictionary(160);
  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__SSVMediaSocialShareExtension_getVisibilityWithCompletionBlock___block_invoke;
  v24[3] = &unk_1E5BA92C8;
  id v25 = v5;
  [(SSXPCConnection *)connection sendMessage:v18 withReply:v24];

LABEL_22:
}

void __65__SSVMediaSocialShareExtension_getVisibilityWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = 121;
    goto LABEL_6;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = 111;
LABEL_6:
    objc_super v6 = [v4 errorWithDomain:@"SSErrorDomain" code:v5 userInfo:0];
    goto LABEL_7;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v8 = xpc_dictionary_get_value(xdict, "2");
  objc_super v6 = (void *)[v7 initWithXPCEncoding:v8];

  xpc_dictionary_get_BOOL(xdict, "1");
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end