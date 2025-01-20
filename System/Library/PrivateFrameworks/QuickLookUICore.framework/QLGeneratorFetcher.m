@interface QLGeneratorFetcher
- (BOOL)fetchCompleted;
- (NSString)contentType;
- (NSURL)url;
- (QLGeneratorFetcher)initWithURL:(id)a3 contentType:(id)a4;
- (void)_callCompletionBlockIfNecessary:(id)a3 withReply:(id)a4 error:(id)a5;
- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6;
- (void)setContentType:(id)a3;
- (void)setFetchCompleted:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation QLGeneratorFetcher

- (QLGeneratorFetcher)initWithURL:(id)a3 contentType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)QLGeneratorFetcher;
  v9 = [(QLItemFetcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_contentType, a4);
  }

  return v10;
}

- (void)_callCompletionBlockIfNecessary:(id)a3 withReply:(id)a4 error:(id)a5
{
  v11 = (void (**)(id, id, id))a3;
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (![(QLGeneratorFetcher *)v10 fetchCompleted])
  {
    v11[2](v11, v8, v9);
    [(QLGeneratorFetcher *)v10 setFetchCompleted:1];
  }
  objc_sync_exit(v10);
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F945C0] sharedManager];
  v15 = [(QLGeneratorFetcher *)self contentType];
  LOBYTE(v20) = 0;
  v16 = [v14 qlExtensionForContentType:v15 allowExtensionsForParentTypes:1 applicationBundleIdentifier:0 extensionPath:0 extensionType:0 generationType:1 shouldUseRestrictedExtension:v20];

  if (v16)
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
    v21[3] = &unk_1E6DD3D70;
    objc_copyWeak(&v24, &location);
    id v23 = v13;
    id v22 = v16;
    [v22 extensionContextWithCompletionHandler:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v26 = *MEMORY[0x1E4F28228];
    v27[0] = @"No valid extension or context.";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v19 = (void *)[v17 initWithDomain:*MEMORY[0x1E4F945E8] code:4 userInfo:v18];

    [(QLGeneratorFetcher *)self _callCompletionBlockIfNecessary:v13 withReply:0 error:v19];
  }
}

void __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(id *a1, void *a2)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5 = [a1[4] extension];
    v6 = [v3 _auxiliaryConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
    v20[3] = &unk_1E6DD3D20;
    id v7 = WeakRetained;
    id v21 = v7;
    id v22 = a1[5];
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v20];

    if (v3 && v5 && v8)
    {
      [a1[4] registerClient:v7];
      id v9 = objc_alloc(MEMORY[0x1E4F3A6F8]);
      id v10 = [v7 url];
      id v11 = (void *)[v9 initWithURL:v10 sandboxType:*MEMORY[0x1E4F14000]];

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_3;
      v16[3] = &unk_1E6DD3D48;
      objc_copyWeak(&v19, a1 + 6);
      id v17 = a1[4];
      id v18 = a1[5];
      [v8 generatePreviewForURL:v11 completion:v16];

      objc_destroyWeak(&v19);
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28228];
      id v24 = @"Failed to connect to extension to generate a preview.";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v11 = [v14 errorWithDomain:*MEMORY[0x1E4F945E8] code:4 userInfo:v15];

      [v7 _callCompletionBlockIfNecessary:a1[5] withReply:0 error:v11];
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28228];
    v26[0] = @"Could not fetch content because fetcher was deallocated before completion.";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v5 = [v12 errorWithDomain:*MEMORY[0x1E4F945E8] code:4 userInfo:v13];

    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _callCompletionBlockIfNecessary:*(void *)(a1 + 40) withReply:0 error:a2];
}

void __95__QLGeneratorFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 48);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [*(id *)(a1 + 32) unregisterClient:WeakRetained];
  [WeakRetained _callCompletionBlockIfNecessary:*(void *)(a1 + 40) withReply:v7 error:v6];
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContentType:(id)a3
{
}

- (BOOL)fetchCompleted
{
  return self->_fetchCompleted;
}

- (void)setFetchCompleted:(BOOL)a3
{
  self->_fetchCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end