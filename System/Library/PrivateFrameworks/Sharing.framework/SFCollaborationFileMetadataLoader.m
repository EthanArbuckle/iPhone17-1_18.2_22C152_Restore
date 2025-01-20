@interface SFCollaborationFileMetadataLoader
- (BOOL)waitingForUbiquityChange;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (SFCollaborationFileMetadataLoader)initWithFileURL:(id)a3;
- (id)loadCompletionHandler;
- (void)_loadCompletedWithCollaborationMetadata:(id)a3 error:(id)a4;
- (void)_loadMetadata;
- (void)loadMetadataWithCompletionHandler:(id)a3;
- (void)presentedItemUbiquityDidChange;
- (void)setLoadCompletionHandler:(id)a3;
- (void)setWaitingForUbiquityChange:(BOOL)a3;
@end

@implementation SFCollaborationFileMetadataLoader

- (SFCollaborationFileMetadataLoader)initWithFileURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCollaborationFileMetadataLoader;
  v5 = [(SFCollaborationFileMetadataLoader *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    presentedItemURL = v5->_presentedItemURL;
    v5->_presentedItemURL = (NSURL *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    presentedItemOperationQueue = v5->_presentedItemOperationQueue;
    v5->_presentedItemOperationQueue = v8;

    [(NSOperationQueue *)v5->_presentedItemOperationQueue setMaxConcurrentOperationCount:1];
    v5->_waitingForUbiquityChange = 0;
  }

  return v5;
}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [getFPItemManagerClass() defaultManager];
  uint64_t v6 = [(SFCollaborationFileMetadataLoader *)self presentedItemURL];
  id v14 = 0;
  v7 = [v5 itemForURL:v6 error:&v14];
  id v8 = v14;

  if (v7)
  {
    if (SharedWithYouCoreLibrary()
      && (v9 = (void *)SharedWithYouCoreLibrary(), dlsym(v9, "SWCollaborationMetadataForDocumentURL")))
    {
      [(SFCollaborationFileMetadataLoader *)self setLoadCompletionHandler:v4];
      if ([v7 isKnownByTheProvider])
      {
        [(SFCollaborationFileMetadataLoader *)self _loadMetadata];
      }
      else
      {
        [(SFCollaborationFileMetadataLoader *)self setWaitingForUbiquityChange:1];
        v12 = share_sheet_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [(SFCollaborationFileMetadataLoader *)self presentedItemURL];
          *(_DWORD *)buf = 138412290;
          v16 = v13;
          _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_DEFAULT, "Collaboration: waiting to load metadata until document is synced with iCloud for documentURL:%@", buf, 0xCu);
        }
      }
    }
    else
    {
      v10 = share_sheet_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SFCollaborationFileMetadataLoader loadMetadataWithCompletionHandler:]();
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  else
  {
    objc_super v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SFCollaborationFileMetadataLoader loadMetadataWithCompletionHandler:]();
    }

    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v8);
  }
}

- (void)presentedItemUbiquityDidChange
{
  v1 = [a1 presentedItemURL];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A5389000, v2, v3, "Collaboration: not loading metadata on presentedItemUbiquityDidChange because no completion handler was provided for documentURL:%@", v4, v5, v6, v7, v8);
}

- (void)_loadMetadata
{
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v3 = [(SFCollaborationFileMetadataLoader *)self presentedItemURL];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SFCollaborationFileMetadataLoader__loadMetadata__block_invoke;
  v4[3] = &unk_1E5BBF4E0;
  objc_copyWeak(&v5, &location);
  ((void (*)(void *, void *))softLinkSWCollaborationMetadataForDocumentURL[0])(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SFCollaborationFileMetadataLoader__loadMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _loadCompletedWithCollaborationMetadata:v6 error:v5];
}

- (void)_loadCompletedWithCollaborationMetadata:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint8_t v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SFCollaborationFileMetadataLoader _loadCompletedWithCollaborationMetadata:error:]();
    }
  }
  v9 = [(SFCollaborationFileMetadataLoader *)self loadCompletionHandler];
  [(SFCollaborationFileMetadataLoader *)self setLoadCompletionHandler:0];
  ((void (**)(void, id, id))v9)[2](v9, v6, v7);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presentedItemOperationQueue;
}

- (NSURL)presentedItemURL
{
  return self->_presentedItemURL;
}

- (BOOL)waitingForUbiquityChange
{
  return self->_waitingForUbiquityChange;
}

- (void)setWaitingForUbiquityChange:(BOOL)a3
{
  self->_waitingForUbiquityChange = a3;
}

- (id)loadCompletionHandler
{
  return self->_loadCompletionHandler;
}

- (void)setLoadCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);

  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
}

- (void)loadMetadataWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 presentedItemURL];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_1A5389000, v0, v3, "error fetching item for URL:%@ : %@", v4);
}

- (void)loadMetadataWithCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A5389000, v0, v1, "Collaboration: cannot load metadata, Share Sheet was compiled without metadata support.", v2, v3, v4, v5, v6);
}

- (void)_loadCompletedWithCollaborationMetadata:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 presentedItemURL];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6(&dword_1A5389000, v0, v3, "Collaboration: error loading metadata for documentURL:%@ error:%@", v4);
}

@end