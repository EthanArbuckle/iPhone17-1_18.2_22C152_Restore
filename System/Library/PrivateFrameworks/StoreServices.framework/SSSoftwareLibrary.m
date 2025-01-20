@interface SSSoftwareLibrary
- (SSSoftwareLibrary)init;
- (void)_getItemsWithMessage:(id)a3 completionBlock:(id)a4;
- (void)_sendDemotionMessage:(id)a3 completionBlock:(id)a4;
- (void)demoteApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4;
- (void)getLibraryItemForBundleIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)getLibraryItemsForITunesStoreItemIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)getRemovableSytemApplicationsWithCompletionBlock:(id)a3;
- (void)hasDemotedApplicationsWithCompletionBlock:(id)a3;
- (void)isInstalledApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4;
- (void)isRemovedSystemApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4;
- (void)playableApplicationsWithBundleIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)refreshReceiptsWithCompletionBlock:(id)a3;
- (void)restoreAllDemotedApplicationsWithOptions:(id)a3 completionBlock:(id)a4;
- (void)restoreDemotedApplicationWithBundleIdentifier:(id)a3 options:(id)a4 completionBlock:(id)a5;
@end

@implementation SSSoftwareLibrary

- (SSSoftwareLibrary)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSSoftwareLibrary;
  v2 = [(SSSoftwareLibrary *)&v6 init];
  if (v2)
  {
    v3 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    connection = v2->_connection;
    v2->_connection = v3;
  }
  return v2;
}

- (void)demoteApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v22 = 136446210;
      v23 = "-[SSSoftwareLibrary demoteApplicationWithBundleIdentifier:completionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(161);
  SSXPCDictionarySetObject(v20, "1", v7);

  [(SSSoftwareLibrary *)self _sendDemotionMessage:v20 completionBlock:v6];
}

- (void)getLibraryItemForBundleIdentifiers:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v22 = 136446210;
      v23 = "-[SSSoftwareLibrary getLibraryItemForBundleIdentifiers:completionBlock:]";
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(89);
  SSXPCDictionarySetObject(v20, "1", v7);

  [(SSSoftwareLibrary *)self _getItemsWithMessage:v20 completionBlock:v6];
}

- (void)getLibraryItemsForITunesStoreItemIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = SSXPCCreateMessageDictionary(89);
  SSXPCDictionarySetObject(v8, "2", v7);

  [(SSSoftwareLibrary *)self _getItemsWithMessage:v8 completionBlock:v6];
}

- (void)getRemovableSytemApplicationsWithCompletionBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v19 = 136446210;
      xpc_object_t v20 = "-[SSSoftwareLibrary getRemovableSytemApplicationsWithCompletionBlock:]";
      LODWORD(v18) = 12;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v19, v18);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(172);
  [(SSSoftwareLibrary *)self _getItemsWithMessage:v17 completionBlock:v4];
}

- (void)hasDemotedApplicationsWithCompletionBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v23 = 136446210;
      uint64_t v24 = "-[SSSoftwareLibrary hasDemotedApplicationsWithCompletionBlock:]";
      LODWORD(v20) = 12;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v23, v20);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(169);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__SSSoftwareLibrary_hasDemotedApplicationsWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E5BA92C8;
  id v22 = v4;
  id v19 = v4;
  [(SSXPCConnection *)connection sendMessage:v17 withReply:v21];
}

void __63__SSSoftwareLibrary_hasDemotedApplicationsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    BOOL v4 = v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520];
    xpc_object_t xdict = v3;
    if (v4)
    {
      uint64_t v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
      {
        xpc_dictionary_get_BOOL(xdict, "1");
        int v6 = 0;
        goto LABEL_12;
      }
      uint64_t v5 = 111;
    }
    int v6 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = xdict;
  }
}

- (void)isInstalledApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v26 = 136446210;
      v27 = "-[SSSoftwareLibrary isInstalledApplicationWithBundleIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(167);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __80__SSSoftwareLibrary_isInstalledApplicationWithBundleIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E5BA92C8;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v24];
}

void __80__SSSoftwareLibrary_isInstalledApplicationWithBundleIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    BOOL v4 = v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520];
    xpc_object_t xdict = v3;
    if (v4)
    {
      uint64_t v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
      {
        xpc_dictionary_get_BOOL(xdict, "0");
        id v6 = 0;
        goto LABEL_12;
      }
      uint64_t v5 = 111;
    }
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = xdict;
  }
}

- (void)isRemovedSystemApplicationWithBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v26 = 136446210;
      v27 = "-[SSSoftwareLibrary isRemovedSystemApplicationWithBundleIdentifier:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(168);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__SSSoftwareLibrary_isRemovedSystemApplicationWithBundleIdentifier_completionBlock___block_invoke;
  v24[3] = &unk_1E5BA92C8;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v24];
}

void __84__SSSoftwareLibrary_isRemovedSystemApplicationWithBundleIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    BOOL v4 = v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520];
    xpc_object_t xdict = v3;
    if (v4)
    {
      uint64_t v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
      {
        xpc_dictionary_get_BOOL(xdict, "0");
        id v6 = 0;
        goto LABEL_12;
      }
      uint64_t v5 = 111;
    }
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = xdict;
  }
}

- (void)playableApplicationsWithBundleIdentifiers:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v26 = 136446210;
      v27 = "-[SSSoftwareLibrary playableApplicationsWithBundleIdentifiers:completionBlock:]";
      LODWORD(v23) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v26, v23);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(186);
  SSXPCDictionarySetObject(v20, "1", v7);

  connection = self->_connection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __79__SSSoftwareLibrary_playableApplicationsWithBundleIdentifiers_completionBlock___block_invoke;
  v24[3] = &unk_1E5BA92C8;
  id v25 = v6;
  id v22 = v6;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v24];
}

void __79__SSSoftwareLibrary_playableApplicationsWithBundleIdentifiers_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520];
  xpc_object_t xdict = v3;
  if (v4)
  {
    uint64_t v5 = 121;
LABEL_10:
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
    CFArrayRef v7 = 0;
    goto LABEL_11;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v5 = 111;
    goto LABEL_10;
  }
  objc_opt_class();
  CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(xdict, "1");
  id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v9 = xpc_dictionary_get_value(xdict, "2");
  id v6 = (void *)[v8 initWithXPCEncoding:v9];

LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshReceiptsWithCompletionBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      uint64_t v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    id v8 = [v5 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      int v9 = v7;
    }
    else {
      int v9 = v7 & 2;
    }
    if (v9)
    {
      int v23 = 136446210;
      uint64_t v24 = "-[SSSoftwareLibrary refreshReceiptsWithCompletionBlock:]";
      LODWORD(v20) = 12;
      int v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      id v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v23, v20);
      free(v10);
      SSFileLog(v5, @"%@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v17 = SSXPCCreateMessageDictionary(117);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__SSSoftwareLibrary_refreshReceiptsWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E5BA92C8;
  id v22 = v4;
  id v19 = v4;
  [(SSXPCConnection *)connection sendMessage:v17 withReply:v21];
}

void __56__SSSoftwareLibrary_refreshReceiptsWithCompletionBlock___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = xpc_dictionary_get_value(xdict, "1");
    if (v3) {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithXPCEncoding:v3];
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = (id)v4;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)restoreAllDemotedApplicationsWithOptions:(id)a3 completionBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v8 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v8)
    {
      id v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    uint64_t v11 = [v8 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      int v12 = v10;
    }
    else {
      int v12 = v10 & 2;
    }
    if (v12)
    {
      int v22 = 136446210;
      int v23 = "-[SSSoftwareLibrary restoreAllDemotedApplicationsWithOptions:completionBlock:]";
      LODWORD(v21) = 12;
      uint64_t v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v22, v21);
      free(v13);
      SSFileLog(v8, @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v20 = SSXPCCreateMessageDictionary(162);
  SSXPCDictionarySetObject(v20, "2", v7);

  [(SSSoftwareLibrary *)self _sendDemotionMessage:v20 completionBlock:v6];
}

- (void)restoreDemotedApplicationWithBundleIdentifier:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    uint64_t v11 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v11)
    {
      uint64_t v11 = +[SSLogConfig sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    uint64_t v14 = [v11 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      int v15 = v13;
    }
    else {
      int v15 = v13 & 2;
    }
    if (v15)
    {
      int v25 = 136446210;
      int v26 = "-[SSSoftwareLibrary restoreDemotedApplicationWithBundleIdentifier:options:completionBlock:]";
      LODWORD(v24) = 12;
      uint64_t v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, &v25, v24);
      free(v16);
      SSFileLog(v11, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_15;
  }
LABEL_16:
  xpc_object_t v23 = SSXPCCreateMessageDictionary(162);
  SSXPCDictionarySetObject(v23, "1", v10);

  SSXPCDictionarySetObject(v23, "2", v9);
  [(SSSoftwareLibrary *)self _sendDemotionMessage:v23 completionBlock:v8];
}

- (void)_getItemsWithMessage:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke;
  v9[3] = &unk_1E5BA92C8;
  id v10 = v6;
  id v8 = v6;
  [(SSXPCConnection *)connection sendMessage:a3 withReply:v9];
}

void __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v6 = 121;
LABEL_10:
    id v7 = SSError(@"SSErrorDomain", v6, 0, 0);
    id v8 = 0;
    goto LABEL_11;
  }
  if (!v3 || MEMORY[0x1A62689E0](v3) != MEMORY[0x1E4F14590])
  {
    uint64_t v6 = 111;
    goto LABEL_10;
  }
  uint64_t v9 = xpc_dictionary_get_value(v4, "1");
  id v10 = (void *)v9;
  if (v9 && MEMORY[0x1A62689E0](v9) == MEMORY[0x1E4F14568])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke_2;
    applier[3] = &unk_1E5BA73C8;
    id v8 = v11;
    id v15 = v8;
    xpc_array_apply(v10, applier);
  }
  else
  {
    id v8 = 0;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  int v13 = xpc_dictionary_get_value(v4, "2");
  id v7 = (void *)[v12 initWithXPCEncoding:v13];

LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__SSSoftwareLibrary__getItemsWithMessage_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[SSSoftwareLibraryItem alloc] initWithXPCEncoding:v4];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  return 1;
}

- (void)_sendDemotionMessage:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SSSoftwareLibrary__sendDemotionMessage_completionBlock___block_invoke;
  v9[3] = &unk_1E5BA92C8;
  id v10 = v6;
  id v8 = v6;
  [(SSXPCConnection *)connection sendMessage:a3 withReply:v9];
}

void __58__SSSoftwareLibrary__sendDemotionMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    BOOL v4 = v3 == (id)MEMORY[0x1E4F14528] || v3 == (id)MEMORY[0x1E4F14520];
    xpc_object_t xdict = v3;
    if (v4)
    {
      uint64_t v5 = 121;
    }
    else
    {
      if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
      {
        id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v8 = xpc_dictionary_get_value(xdict, "2");
        id v6 = (void *)[v7 initWithXPCEncoding:v8];

        xpc_dictionary_get_BOOL(xdict, "1");
        goto LABEL_12;
      }
      uint64_t v5 = 111;
    }
    id v6 = SSError(@"SSErrorDomain", v5, 0, 0);
LABEL_12:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    id v3 = xdict;
  }
}

- (void).cxx_destruct
{
}

@end