@interface SSDownloadFileManifest
- (SSDownloadFileManifest)init;
- (SSDownloadFileManifest)initWithManifestType:(int64_t)a3;
- (int64_t)manifestType;
- (void)_removeItemsWithAssetPaths:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)getPathsForFilesWithClass:(int64_t)a3 completionBlock:(id)a4;
- (void)rebuildManifestWithCompletionBlock:(id)a3;
- (void)removeItemWithAssetPath:(id)a3 completionBlock:(id)a4;
- (void)removeItemsWithAssetPaths:(id)a3 completionBlock:(id)a4;
@end

@implementation SSDownloadFileManifest

- (SSDownloadFileManifest)init
{
  return [(SSDownloadFileManifest *)self initWithManifestType:0];
}

- (SSDownloadFileManifest)initWithManifestType:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSDownloadFileManifest;
  v4 = [(SSDownloadFileManifest *)&v6 init];
  if (v4)
  {
    v4->_connection = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
    v4->_manifestType = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadFileManifest;
  [(SSDownloadFileManifest *)&v3 dealloc];
}

- (void)getPathsForFilesWithClass:(int64_t)a3 completionBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      int v24 = 136446210;
      v25 = "-[SSDownloadFileManifest getPathsForFilesWithClass:completionBlock:]";
      LODWORD(v22) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v24, v22);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 46);
  xpc_dictionary_set_int64(v20, "1", self->_manifestType);
  xpc_dictionary_set_int64(v20, "2", a3);
  connection = self->_connection;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __68__SSDownloadFileManifest_getPathsForFilesWithClass_completionBlock___block_invoke;
  v23[3] = &unk_1E5BA77D0;
  v23[4] = a4;
  [(SSXPCConnection *)connection sendMessage:v20 withReply:v23];
  xpc_release(v20);
}

void __68__SSDownloadFileManifest_getPathsForFilesWithClass_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a2 && MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
    {
      objc_opt_class();
      CFArrayRef v5 = SSXPCDictionaryCopyCFObjectWithClass(a2, "0");
      objc_opt_class();
      CFArrayRef v6 = SSXPCDictionaryCopyCFObjectWithClass(a2, "1");
      if ([(__CFArray *)v5 length])
      {
        if ([(__CFArray *)v6 count])
        {
          long long v13 = 0u;
          long long v14 = 0u;
          long long v11 = 0u;
          long long v12 = 0u;
          uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v12;
            do
            {
              uint64_t v10 = 0;
              do
              {
                if (*(void *)v12 != v9) {
                  objc_enumerationMutation(v6);
                }
                objc_msgSend(v4, "addObject:", -[__CFArray stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", *(void *)(*((void *)&v11 + 1) + 8 * v10++)));
              }
              while (v8 != v10);
              uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
            }
            while (v8);
          }
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (int64_t)manifestType
{
  return self->_manifestType;
}

- (void)rebuildManifestWithCompletionBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v22 = 136446210;
      v23 = "-[SSDownloadFileManifest rebuildManifestWithCompletionBlock:]";
      LODWORD(v20) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v22, v20);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 47);
  xpc_dictionary_set_int64(v18, "1", self->_manifestType);
  connection = self->_connection;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __61__SSDownloadFileManifest_rebuildManifestWithCompletionBlock___block_invoke;
  v21[3] = &unk_1E5BA77D0;
  v21[4] = a3;
  [(SSXPCConnection *)connection sendMessage:v18 withReply:v21];
  xpc_release(v18);
}

uint64_t __61__SSDownloadFileManifest_rebuildManifestWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeItemWithAssetPath:(id)a3 completionBlock:(id)a4
{
  int v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", a3, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SSDownloadFileManifest_removeItemWithAssetPath_completionBlock___block_invoke;
  v7[3] = &unk_1E5BABDD8;
  v7[4] = a4;
  [(SSDownloadFileManifest *)self _removeItemsWithAssetPaths:v6 completionBlock:v7];
}

uint64_t __66__SSDownloadFileManifest_removeItemWithAssetPath_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeItemsWithAssetPaths:(id)a3 completionBlock:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SSDownloadFileManifest_removeItemsWithAssetPaths_completionBlock___block_invoke;
  v4[3] = &unk_1E5BABDD8;
  v4[4] = a4;
  [(SSDownloadFileManifest *)self _removeItemsWithAssetPaths:a3 completionBlock:v4];
}

uint64_t __68__SSDownloadFileManifest_removeItemsWithAssetPaths_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)_removeItemsWithAssetPaths:(id)a3 completionBlock:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    if (SSIsInternalBuild() && _os_feature_enabled_impl())
    {
      id v7 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v7) {
        id v7 = +[SSLogConfig sharedConfig];
      }
      int v8 = [v7 shouldLog];
      if ([v7 shouldLogToDisk]) {
        int v9 = v8 | 2;
      }
      else {
        int v9 = v8;
      }
      if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
        int v10 = v9;
      }
      else {
        int v10 = v9 & 2;
      }
      if (v10)
      {
        int v26 = 136446210;
        v27 = "-[SSDownloadFileManifest _removeItemsWithAssetPaths:completionBlock:]";
        LODWORD(v24) = 12;
        uint64_t v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v26, v24);
          free(v12);
          SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
        }
      }
    }
    xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "0", 44);
    xpc_dictionary_set_int64(v20, "1", self->_manifestType);
    SSXPCDictionarySetCFObject(v20, "2", (__CFString *)a3);
    connection = self->_connection;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __69__SSDownloadFileManifest__removeItemsWithAssetPaths_completionBlock___block_invoke;
    v25[3] = &unk_1E5BA77D0;
    v25[4] = a4;
    [(SSXPCConnection *)connection sendMessage:v20 withReply:v25];
    xpc_release(v20);
  }
  else
  {
    int v22 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v23 = *MEMORY[0x1E4F1C3C8];
    [v22 raise:v23 format:@"empty assetPaths"];
  }
}

void __69__SSDownloadFileManifest__removeItemsWithAssetPaths_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    if (a2 && (uint64_t v4 = MEMORY[0x1A62689E0](a2), v5 = MEMORY[0x1E4F14590], v4 == MEMORY[0x1E4F14590]))
    {
      if (xpc_dictionary_get_BOOL(a2, "0"))
      {
        id v6 = 0;
        CFArrayRef v7 = 0;
      }
      else
      {
        xpc_object_t value = xpc_dictionary_get_value(a2, "1");
        if (value && (xpc_object_t v9 = value, MEMORY[0x1A62689E0]() == v5)) {
          id v10 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithXPCEncoding:v9];
        }
        else {
          id v10 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"SSErrorDomain" code:100 userInfo:0];
        }
        id v12 = v10;
        objc_opt_class();
        CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a2, "2");
        id v6 = v12;
      }
    }
    else
    {
      id v6 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"SSErrorDomain" code:111 userInfo:0];
      CFArrayRef v7 = 0;
    }
    id v11 = v6;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end