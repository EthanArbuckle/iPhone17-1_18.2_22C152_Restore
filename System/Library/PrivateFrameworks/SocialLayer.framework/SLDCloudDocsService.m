@interface SLDCloudDocsService
+ (id)remoteObjectProtocol;
+ (id)sharedService;
- (BOOL)_connection:(id)a3 hasPermissionForFileURL:(id)a4;
- (BOOL)_fileURLHasFileProvider:(id)a3 error:(id *)a4;
- (NSArray)highlights;
- (NSCache)urlToCollaborationHighlightCache;
- (OS_dispatch_queue)cloudDocsAccessQueue;
- (SLDCloudDocsService)init;
- (SLHighlightCenter)highlightCenter;
- (int64_t)_acquireSandboxHandleData:(id)a3 ForFileProviderDocumentURL:(id)a4 clientConnection:(id)a5 error:(id *)a6;
- (void)_releaseSandboxHandle:(int64_t)a3;
- (void)fetchHighlights;
- (void)generateURLToCollaborationHighlightCache;
- (void)getCollaborationHighlightForShareURL:(id)a3 fileURL:(id)a4 sandboxTokenData:(id)a5 reply:(id)a6;
- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4;
- (void)highlightCenterDidAddHighlights:(id)a3;
- (void)prepareConnectionWithReply:(id)a3;
- (void)setHighlightCenter:(id)a3;
- (void)setHighlights:(id)a3;
- (void)setUrlToCollaborationHighlightCache:(id)a3;
- (void)shareURLForFileURL:(id)a3 sandboxTokenData:(id)a4 reply:(id)a5;
@end

@implementation SLDCloudDocsService

+ (id)remoteObjectProtocol
{
  return &unk_1EEC41B98;
}

+ (id)sharedService
{
  if (sharedService_onceToken_1 != -1) {
    dispatch_once(&sharedService_onceToken_1, &__block_literal_global_4);
  }
  v2 = (void *)sharedService_sService_1;
  return v2;
}

- (SLDCloudDocsService)init
{
  v9.receiver = self;
  v9.super_class = (Class)SLDCloudDocsService;
  v2 = [(SLDRemoteRenderingService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.sociallaterd.cloudDocsHighlightsCache", v3);
    cloudDocsAccessQueue = v2->_cloudDocsAccessQueue;
    v2->_cloudDocsAccessQueue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SLHighlightCenter);
    [(SLDCloudDocsService *)v2 setHighlightCenter:v6];

    v7 = [(SLDCloudDocsService *)v2 highlightCenter];
    [v7 setDelegate:v2];

    [(SLDCloudDocsService *)v2 fetchHighlights];
  }
  return v2;
}

uint64_t __36__SLDCloudDocsService_sharedService__block_invoke()
{
  v0 = objc_alloc_init(SLDCloudDocsService);
  uint64_t v1 = sharedService_sService_1;
  sharedService_sService_1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)prepareConnectionWithReply:(id)a3
{
}

- (void)shareURLForFileURL:(id)a3 sandboxTokenData:(id)a4 reply:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  v11 = [MEMORY[0x1E4F29268] currentConnection];
  v12 = SLDaemonLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[SLDCloudDocsService shareURLForFileURL:sandboxTokenData:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2112;
    int64_t v30 = (int64_t)v9;
    _os_log_impl(&dword_19BE17000, v12, OS_LOG_TYPE_DEFAULT, "%s fileURL: %@ sandboxTokenData: %@", buf, 0x20u);
  }

  if (v8 && v9)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    int64_t v30 = 0;
    id v28 = 0;
    int64_t v13 = [(SLDCloudDocsService *)self _acquireSandboxHandleData:v9 ForFileProviderDocumentURL:v8 clientConnection:v11 error:&v28];
    id v14 = v28;
    v15 = v14;
    int64_t v30 = v13;
    if (*(void *)(*(void *)&buf[8] + 24) == -1)
    {
      if (!v14)
      {
        v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCloudDocsService" code:1 userInfo:0];
      }
      v10[2](v10, 0);
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x1E4F59558]);
      v17 = [(id)*MEMORY[0x1E4F444F8] identifier];
      v18 = (void *)[v16 initWithFileURL:v8 documentType:v17];

      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke;
      v24 = &unk_1E58A8E50;
      v25 = self;
      v27 = buf;
      v26 = v10;
      [v18 setCopyShareURLCompletionBlock:&v21];
      id v19 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      objc_msgSend(v19, "setMaxConcurrentOperationCount:", 1, v21, v22, v23, v24, v25);
      [v19 addOperation:v18];
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v20 = SLDaemonLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      int64_t v30 = (int64_t)v9;
      _os_log_error_impl(&dword_19BE17000, v20, OS_LOG_TYPE_ERROR, "[SLDCloudDocsService: %p] invalid fileURL/sandboxTokenData passed in: %@, %@", buf, 0x20u);
    }

    v10[2](v10, 0);
  }
}

void __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) _releaseSandboxHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  if (!v5 || v6)
  {
    id v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke_cold_1((void *)(a1 + 32), (uint64_t)v6, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = SLURLMinusFragmentForCKURLs(v5);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getCollaborationHighlightForShareURL:(id)a3 fileURL:(id)a4 sandboxTokenData:(id)a5 reply:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = (void (**)(id, void))a6;
  id v14 = [MEMORY[0x1E4F29268] currentConnection];
  v15 = SLDaemonLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v31 = (SLDCloudDocsService *)"-[SLDCloudDocsService getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:]";
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl(&dword_19BE17000, v15, OS_LOG_TYPE_DEFAULT, "%s shareURL: %@ fileURL: %@ sandboxTokenData: %@", buf, 0x2Au);
  }

  if (v11 && v10 && v12)
  {
    id v16 = SLURLMinusFragmentForCKURLs(v10);
    id v29 = 0;
    int64_t v17 = [(SLDCloudDocsService *)self _acquireSandboxHandleData:v12 ForFileProviderDocumentURL:v11 clientConnection:v14 error:&v29];
    id v18 = v29;
    id v19 = v18;
    if (v17 == -1)
    {
      if (!v18)
      {
        id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCloudDocsService" code:1 userInfo:0];
      }
      v13[2](v13, 0);
    }
    else
    {
      id v28 = v14;
      v20 = v16;
      uint64_t v21 = [(SLDCloudDocsService *)self highlightCenter];
      uint64_t v22 = [v21 highlights];
      uint64_t v23 = [v22 count];

      if (v23)
      {
        v24 = [(SLDCloudDocsService *)self urlToCollaborationHighlightCache];
        id v16 = v20;
        v25 = [v24 objectForKey:v20];

        ((void (**)(id, void *))v13)[2](v13, v25);
      }
      else
      {
        v27 = SLDaemonLogHandle();
        id v16 = v20;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[SLDCloudDocsService getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:]();
        }

        v13[2](v13, 0);
      }
      id v14 = v28;
    }
  }
  else
  {
    v26 = SLDaemonLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v31 = self;
      __int16 v32 = 2112;
      id v33 = v10;
      __int16 v34 = 2112;
      id v35 = v11;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_error_impl(&dword_19BE17000, v26, OS_LOG_TYPE_ERROR, "[SLDCloudDocsService: %p] invalid shareURL/fileURL/sandboxTokenData passed in: %@, %@, %@", buf, 0x2Au);
    }

    v13[2](v13, 0);
  }
}

- (NSArray)highlights
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v3 = [(SLDCloudDocsService *)self cloudDocsAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__SLDCloudDocsService_highlights__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __33__SLDCloudDocsService_highlights__block_invoke(uint64_t a1)
{
}

- (void)setHighlights:(id)a3
{
  id v4 = a3;
  id v5 = [(SLDCloudDocsService *)self highlights];
  char v6 = [v4 isEqualToArray:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(SLDCloudDocsService *)self cloudDocsAccessQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__SLDCloudDocsService_setHighlights___block_invoke;
    v8[3] = &unk_1E58A8680;
    v8[4] = self;
    id v9 = v4;
    dispatch_barrier_async(v7, v8);
  }
}

void __37__SLDCloudDocsService_setHighlights___block_invoke(uint64_t a1)
{
}

- (NSCache)urlToCollaborationHighlightCache
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v3 = [(SLDCloudDocsService *)self cloudDocsAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SLDCloudDocsService_urlToCollaborationHighlightCache__block_invoke;
  v6[3] = &unk_1E58A86A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSCache *)v4;
}

void __55__SLDCloudDocsService_urlToCollaborationHighlightCache__block_invoke(uint64_t a1)
{
}

- (void)setUrlToCollaborationHighlightCache:(id)a3
{
  id v4 = a3;
  id v5 = [(SLDCloudDocsService *)self urlToCollaborationHighlightCache];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(SLDCloudDocsService *)self cloudDocsAccessQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__SLDCloudDocsService_setUrlToCollaborationHighlightCache___block_invoke;
    v8[3] = &unk_1E58A8680;
    v8[4] = self;
    id v9 = v4;
    dispatch_barrier_async(v7, v8);
  }
}

void __59__SLDCloudDocsService_setUrlToCollaborationHighlightCache___block_invoke(uint64_t a1)
{
}

- (void)generateURLToCollaborationHighlightCache
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(SLDCloudDocsService *)self urlToCollaborationHighlightCache];
  id v4 = [v3 allObjects];
  uint64_t v5 = [v4 count];

  char v6 = [(SLDCloudDocsService *)self highlights];
  uint64_t v7 = [v6 count];

  if (v5 != v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = [(SLDCloudDocsService *)self highlights];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            id v16 = [v15 resourceURL];
            int64_t v17 = SLURLMinusFragmentForCKURLs(v16);
            [v8 setObject:v15 forKey:v17];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [(SLDCloudDocsService *)self setUrlToCollaborationHighlightCache:v8];
  }
}

- (void)fetchHighlights
{
  v3 = [(SLDCloudDocsService *)self highlightCenter];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__SLDCloudDocsService_fetchHighlights__block_invoke;
  v4[3] = &unk_1E58A8E78;
  v4[4] = self;
  [v3 fetchHighlights:v4];
}

void __38__SLDCloudDocsService_fetchHighlights__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setHighlights:a2];
    v3 = *(void **)(a1 + 32);
    [v3 generateURLToCollaborationHighlightCache];
  }
  else
  {
    id v4 = SLDaemonLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __38__SLDCloudDocsService_fetchHighlights__block_invoke_cold_1(a1, v4);
    }
  }
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SLDaemonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_19BE17000, v5, OS_LOG_TYPE_INFO, "[%p] Handling highlightCenter:didRemoveHighlights: delegate callback", (uint8_t *)&v6, 0xCu);
  }

  [(NSCache *)self->_urlToCollaborationHighlightCache removeAllObjects];
  [(SLDCloudDocsService *)self fetchHighlights];
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    int v6 = self;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "[%p] Handling highlightCenterDidAddHighlights: delegate callback", (uint8_t *)&v5, 0xCu);
  }

  [(NSCache *)self->_urlToCollaborationHighlightCache removeAllObjects];
  [(SLDCloudDocsService *)self fetchHighlights];
}

- (int64_t)_acquireSandboxHandleData:(id)a3 ForFileProviderDocumentURL:(id)a4 clientConnection:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v10 length])
  {
    uint64_t v13 = SLDaemonLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:]();
    }
    goto LABEL_7;
  }
  buf[0] = 0;
  objc_msgSend(v10, "getBytes:range:", buf, objc_msgSend(v10, "length") - 1, 1);
  if (buf[0])
  {
    uint64_t v13 = SLDaemonLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:]();
    }
LABEL_7:

LABEL_8:
    id v14 = SLDaemonLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SLDCloudDocsService _acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:]();
    }

    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCloudDocsService" code:2 userInfo:0];
    }
LABEL_12:
    int64_t v15 = -1;
    goto LABEL_13;
  }
  [v10 bytes];
  uint64_t v17 = sandbox_extension_consume();
  if (v17 == -1) {
    goto LABEL_8;
  }
  int64_t v15 = v17;
  if (![(SLDCloudDocsService *)self _connection:v12 hasPermissionForFileURL:v11])
  {
    uint64_t v22 = SLDaemonLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      __int16 v26 = 2112;
      int64_t v27 = (int64_t)v11;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_error_impl(&dword_19BE17000, v22, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but the xpc connection (%@) does not have permission to access the file. Releasing sandbox handle.", buf, 0x20u);
    }

    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCloudDocsService" code:4 userInfo:0];
    }
    [(SLDCloudDocsService *)self _releaseSandboxHandle:v15];
    goto LABEL_12;
  }
  id v23 = 0;
  BOOL v18 = [(SLDCloudDocsService *)self _fileURLHasFileProvider:v11 error:&v23];
  id v19 = v23;
  long long v20 = SLDaemonLogHandle();
  long long v21 = v20;
  if (!v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v25 = self;
      __int16 v26 = 2112;
      int64_t v27 = (int64_t)v11;
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_error_impl(&dword_19BE17000, v21, OS_LOG_TYPE_ERROR, "[%p] _acquireSandboxHandleData: acquired a sandbox handle for a file (%@), but could not find a valid FPItem for that file. This file might not be managed by a FileProvider. Releasing sandbox handle. FileProvider error: %@", buf, 0x20u);
    }

    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sociallayerd.SLDCloudDocsService" code:3 userInfo:0];
    }
    [(SLDCloudDocsService *)self _releaseSandboxHandle:v15];

    goto LABEL_12;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v25 = self;
    __int16 v26 = 2048;
    int64_t v27 = v15;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_19BE17000, v21, OS_LOG_TYPE_DEFAULT, "[%p] _acquireSandboxHandleData: acquired a new handle: %lld for file: %@", buf, 0x20u);
  }

LABEL_13:
  return v15;
}

- (BOOL)_fileURLHasFileProvider:(id)a3 error:(id *)a4
{
  int v5 = (void *)MEMORY[0x1E4F25D38];
  id v6 = a3;
  uint64_t v7 = [v5 defaultManager];
  uint64_t v8 = [v7 itemForURL:v6 error:a4];

  return v8 != 0;
}

- (BOOL)_connection:(id)a3 hasPermissionForFileURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && ([v5 auditToken], objc_msgSend(v6, "isFileURL"))
    && ([v6 path],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v8))
  {
    [v5 auditToken];
    id v9 = [v6 path];
    [v9 fileSystemRepresentation];
    BOOL v10 = sandbox_check_by_audit_token() == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_releaseSandboxHandle:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = sandbox_extension_release();
  id v6 = SLDaemonLogHandle();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(SLDCloudDocsService *)(uint64_t)self _releaseSandboxHandle:v7];
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = self;
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_19BE17000, v7, OS_LOG_TYPE_DEFAULT, "[%p] _releaseSandboxHandle: released handle: %lld", (uint8_t *)&v8, 0x16u);
  }
}

- (OS_dispatch_queue)cloudDocsAccessQueue
{
  return self->_cloudDocsAccessQueue;
}

- (SLHighlightCenter)highlightCenter
{
  return self->_highlightCenter;
}

- (void)setHighlightCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightCenter, 0);
  objc_storeStrong((id *)&self->_urlToCollaborationHighlightCache, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_cloudDocsAccessQueue, 0);
}

void __65__SLDCloudDocsService_shareURLForFileURL_sandboxTokenData_reply___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_19BE17000, a2, a3, "[SLDCloudDocsService: %p] failed to get url with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)getCollaborationHighlightForShareURL:fileURL:sandboxTokenData:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[SLDCloudDocsService: %p] no highlights to check against a highlight for URL: %@");
}

void __38__SLDCloudDocsService_fetchHighlights__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[%p] fetchHighlights: failed to fetch highlights", (uint8_t *)&v3, 0xCu);
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[%p] _acquireSandboxHandleData: failed to consume sandbox token for file: %@");
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[%p] _acquireSandboxHandleData: tokenData for file (%@) was empty.");
}

- (void)_acquireSandboxHandleData:ForFileProviderDocumentURL:clientConnection:error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19BE17000, v0, v1, "[%p] _acquireSandboxHandleData: sandbox token for file (%@) was not null-terminated.");
}

- (void)_releaseSandboxHandle:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = a1;
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_1(&dword_19BE17000, a2, a3, "[%p] _releaseSandboxHandle: unable to release sandbox extension handle: %lld. Sandbox extensions are a limited resource and this should be investigated!", (const void *)v3, *((void *)&v3 + 1));
}

@end