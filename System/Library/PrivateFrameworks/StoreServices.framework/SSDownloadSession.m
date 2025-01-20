@interface SSDownloadSession
- (BOOL)isEqual:(id)a3;
- (SSDownload)download;
- (SSDownloadAsset)downloadAsset;
- (id)_copySessionPropertyWithKey:(const char *)a3;
- (id)_initSSDownloadSession;
- (id)_initWithMessage:(id)a3 controlConnection:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation SSDownloadSession

- (id)_initSSDownloadSession
{
  v4.receiver = self;
  v4.super_class = (Class)SSDownloadSession;
  v2 = [(SSDownloadSession *)&v4 init];
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSDownloadSession", 0);
  }
  return v2;
}

- (id)_initWithMessage:(id)a3 controlConnection:(id)a4
{
  v6 = [(SSDownloadSession *)self _initSSDownloadSession];
  if (v6)
  {
    v6[1] = a4;
    v6[4] = xpc_dictionary_get_int64(a3, "3");
    v6[5] = xpc_dictionary_get_int64(a3, "2");
    v6[3] = xpc_dictionary_get_int64(a3, "1");
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadSession;
  [(SSDownloadSession *)&v3 dealloc];
}

- (SSDownload)download
{
  if (self->_downloadID)
  {
    id value = [(SSEntity *)[SSDownload alloc] _initWithPersistentIdentifier:self->_downloadID];
  }
  else
  {
    id v4 = [(SSDownloadSession *)self _copySessionPropertyWithKey:"0"];
    if (v4)
    {
      v5 = v4;
      id value = (id)xpc_int64_get_value(v4);
      if (value) {
        id value = [(SSEntity *)[SSDownload alloc] _initWithPersistentIdentifier:value];
      }
      xpc_release(v5);
    }
    else
    {
      id value = 0;
    }
  }
  [value _becomeManagedOnConnection:self->_controlConnection];
  return (SSDownload *)value;
}

- (SSDownloadAsset)downloadAsset
{
  if (self->_assetID)
  {
    id value = [(SSEntity *)[SSDownloadAsset alloc] _initWithPersistentIdentifier:self->_assetID];
  }
  else
  {
    id v4 = [(SSDownloadSession *)self _copySessionPropertyWithKey:"1"];
    if (v4)
    {
      v5 = v4;
      id value = (id)xpc_int64_get_value(v4);
      if (value) {
        id value = [(SSEntity *)[SSDownloadAsset alloc] _initWithPersistentIdentifier:value];
      }
      xpc_release(v5);
    }
    else
    {
      id value = 0;
    }
  }
  [value _becomeManagedOnConnection:self->_controlConnection];
  return (SSDownloadAsset *)value;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadSession;
  return (id)[NSString stringWithFormat:@"%@: SessionID: %lld", -[SSDownloadSession description](&v3, sel_description), self->_sessionID];
}

- (unint64_t)hash
{
  return self->_sessionID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  return v5 == objc_opt_class() && self->_sessionID == *((void *)a3 + 3);
}

- (id)_copySessionPropertyWithKey:(const char *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
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
      LODWORD(v25) = 136446210;
      *(void *)((char *)&v25 + 4) = "-[SSDownloadSession _copySessionPropertyWithKey:]";
      LODWORD(v23) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v25, v23);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  *(void *)&long long v25 = 0;
  *((void *)&v25 + 1) = &v25;
  uint64_t v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__35;
  v28 = __Block_byref_object_dispose__35;
  uint64_t v29 = 0;
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 12);
  xpc_dictionary_set_int64(v18, "1", self->_sessionID);
  v19 = dispatch_semaphore_create(0);
  controlConnection = self->_controlConnection;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__SSDownloadSession__copySessionPropertyWithKey___block_invoke;
  v24[3] = &unk_1E5BABA58;
  v24[5] = &v25;
  v24[6] = a3;
  v24[4] = v19;
  [(SSXPCConnection *)controlConnection sendMessage:v18 withReply:v24];
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v19);
  xpc_release(v18);
  v21 = *(void **)(*((void *)&v25 + 1) + 40);
  _Block_object_dispose(&v25, 8);
  return v21;
}

intptr_t __49__SSDownloadSession__copySessionPropertyWithKey___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if (MEMORY[0x1A62689E0](a2) == MEMORY[0x1E4F14590])
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = xpc_dictionary_get_value(a2, *(const char **)(a1 + 48));
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v4) {
        xpc_retain(v4);
      }
    }
  }
  id v5 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v5);
}

@end