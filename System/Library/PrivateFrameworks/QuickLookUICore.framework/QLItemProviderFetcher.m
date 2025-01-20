@interface QLItemProviderFetcher
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeCanceled;
- (BOOL)isLongFetchOperation;
- (NSItemProvider)itemProvider;
- (QLItemProviderFetcher)initWithCoder:(id)a3;
- (QLItemProviderFetcher)initWithContentType:(id)a3 fileSize:(id)a4;
- (QLPreviewItemURLProvider)urlProvider;
- (id)fetchedContent;
- (id)itemSize;
- (id)lastContent;
- (id)newItemProvider;
- (id)shareableItem;
- (void)_updateCompletionBlockWithAllowedOutputClasses:(id)a3 URL:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6;
- (void)getURLWithDownloadTracker:(id)a3 completionHandler:(id)a4;
- (void)setItemProvider:(id)a3;
- (void)setLastContent:(id)a3;
- (void)setUrlProvider:(id)a3;
- (void)updatedURLWithProgress:(double)a3;
@end

@implementation QLItemProviderFetcher

- (QLItemProviderFetcher)initWithContentType:(id)a3 fileSize:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLItemProviderFetcher;
  v9 = [(QLItemFetcher *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentType, a3);
    objc_storeStrong((id *)&v10->_fileSize, a4);
    v11 = v10;
  }

  return v10;
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  objc_super v13 = (void *)MEMORY[0x1E4E5A320](a5);
  id updateBlock = self->_updateBlock;
  self->_id updateBlock = v13;

  v15 = (void *)MEMORY[0x1E4E5A320](v11);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v15;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v19[3] = &unk_1E6DD3B38;
  id v20 = v10;
  id v21 = v11;
  v19[4] = self;
  id v17 = v10;
  id v18 = v11;
  [v12 addOperationWithBlock:v19];
}

void __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(id *a1)
{
  v2 = +[QLNetworkStateObserver sharedInstance];
  [v2 pushOperation];

  objc_initWeak(&location, a1[4]);
  v3 = a1[4];
  v4 = (void *)v3[3];
  if (v4)
  {
    uint64_t v5 = v3[4];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
    v17[3] = &unk_1E6DD3AE8;
    v6 = &v20;
    objc_copyWeak(&v20, &location);
    id v19 = a1[6];
    id v18 = a1[5];
    [v4 loadItemForTypeIdentifier:v5 options:0 completionHandler:v17];
    id v7 = &v19;
    id v8 = v18;
  }
  else
  {
    v9 = (void *)v3[6];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2;
    v13[3] = &unk_1E6DD3B10;
    v6 = &v16;
    objc_copyWeak(&v16, &location);
    id v10 = a1[6];
    id v11 = a1[4];
    id v12 = a1[5];
    id v15 = v10;
    v13[4] = v11;
    id v14 = v12;
    [v9 getURLWithDownloadTracker:v3 completionHandler:v13];
    id v7 = &v15;
    id v8 = v14;
  }

  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __98__QLItemProviderFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v10 = (NSObject **)MEMORY[0x1E4F945F0];
      id v11 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        id v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_ERROR, "Error while attempting to load item: %@ #PreviewItem", (uint8_t *)&v17, 0xCu);
      }
      id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v5;
        v9 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          id v16 = (NSObject **)MEMORY[0x1E4F945F0];
          QLSInitLogging();
          v9 = *v16;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          id v18 = v8;
          _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_INFO, "Did obtain NSURL as contents for item backed by NSItemProvider: %@ #PreviewItem", (uint8_t *)&v17, 0xCu);
        }
        [WeakRetained _updateCompletionBlockWithAllowedOutputClasses:*(void *)(a1 + 32) URL:v8];

        goto LABEL_21;
      }
      objc_super v13 = (NSObject **)MEMORY[0x1E4F945F0];
      id v14 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        id v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1E2805000, v14, OS_LOG_TYPE_ERROR, "QLItems backed by NSItemProvider can only provide NSURLs, NSData is not supported. #PreviewItem", (uint8_t *)&v17, 2u);
      }
      id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v12();
LABEL_21:
    id v15 = +[QLNetworkStateObserver sharedInstance];
    [v15 popOperation];
  }
}

{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  uint64_t vars8;

  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v8 && v5)
    {
      [v5 UTF8String];
      *(void *)(*(void *)(a1 + 32) + 72) = sandbox_extension_consume();
      [WeakRetained _updateCompletionBlockWithAllowedOutputClasses:*(void *)(a1 + 40) URL:v8];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    id v7 = +[QLNetworkStateObserver sharedInstance];
    [v7 popOperation];
  }
}

- (void)_updateCompletionBlockWithAllowedOutputClasses:(id)a3 URL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__QLItemProviderFetcher__updateCompletionBlockWithAllowedOutputClasses_URL___block_invoke;
  v10[3] = &unk_1E6DD3A78;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  QLRunInMainThread(v10);
}

void __76__QLItemProviderFetcher__updateCompletionBlockWithAllowedOutputClasses_URL___block_invoke(id *a1)
{
  objc_storeStrong((id *)a1[4] + 10, a1[5]);
  if ([a1[6] containsObject:objc_opt_class()])
  {
    [a1[4] setFetchingState:1];
    id v2 = a1[5];
    uint64_t v3 = *((void *)a1[4] + 8);
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v7, 0);
  }
  else
  {
    int v4 = [a1[6] containsObject:objc_opt_class()];
    id v5 = a1[4];
    if (v4)
    {
      [v5 setFetchingState:1];
      id v6 = *(void (**)(void))(*((void *)a1[4] + 8) + 16);
    }
    else
    {
      id v6 = *(void (**)(void))(v5[8] + 16);
    }
    v6();
  }
}

- (void)updatedURLWithProgress:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__QLItemProviderFetcher_updatedURLWithProgress___block_invoke;
  v3[3] = &unk_1E6DD3B60;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  QLRunInMainThread(v3);
}

void __48__QLItemProviderFetcher_updatedURLWithProgress___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 40)];
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

- (void)getURLWithDownloadTracker:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  id v9 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke;
  v14[3] = &unk_1E6DD3B88;
  id v15 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke_2;
  v12[3] = &unk_1E6DD3BB0;
  id v13 = v7;
  id v10 = v7;
  id v11 = v6;
  [(QLItemProviderFetcher *)self fetchContentWithAllowedOutputClasses:v8 inQueue:v9 updateBlock:v14 completionBlock:v12];
}

uint64_t __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  double v4 = v3;
  return [v2 updatedURLWithProgress:v4];
}

void __69__QLItemProviderFetcher_getURLWithDownloadTracker_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !v6) && (isKindOfClass & 1) != 0)
  {
    [v5 fileSystemRepresentation];
    uint64_t v8 = sandbox_extension_issue_file();
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = (void *)[[NSString alloc] initWithCString:v8 encoding:4];
      free(v9);
    }
    else
    {
      id v10 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v11 = (NSObject **)MEMORY[0x1E4F945F0];
    id v12 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_ERROR, "Error while obtaining URL in getURLWithDownloadTracker: %@. Error: %@ #PreviewItem", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (BOOL)isLongFetchOperation
{
  return self->_lastContent == 0;
}

- (BOOL)canBeCanceled
{
  return 0;
}

- (void)dealloc
{
  if (self->_fileExtensionHandle) {
    sandbox_extension_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)QLItemProviderFetcher;
  [(QLItemProviderFetcher *)&v3 dealloc];
}

- (id)shareableItem
{
  return self->_lastContent;
}

- (id)fetchedContent
{
  id v3 = [(QLItemFetcher *)self fetchingState];
  if (v3) {
    id v3 = self->_lastContent;
  }
  return v3;
}

- (id)itemSize
{
  return self->_fileSize;
}

- (id)newItemProvider
{
  objc_initWeak(&location, self);
  id v3 = objc_opt_new();
  contentType = self->_contentType;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__QLItemProviderFetcher_newItemProvider__block_invoke;
  v6[3] = &unk_1E6DD3BD8;
  objc_copyWeak(&v7, &location);
  [v3 registerFileRepresentationForTypeIdentifier:contentType fileOptions:0 visibility:0 loadHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __40__QLItemProviderFetcher_newItemProvider__block_invoke(uint64_t a1, void (**a2)(void, void, void, void))
{
  id v3 = (id *)(a1 + 32);
  double v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained lastContent];
  ((void (**)(void, void *, uint64_t, void))a2)[2](v4, v6, 1, 0);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLItemProviderFetcher;
  id v4 = a3;
  [(QLItemFetcher *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileSize, @"fileSize", v5.receiver, v5.super_class);
}

- (QLItemProviderFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLItemProviderFetcher;
  objc_super v5 = [(QLItemFetcher *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileSize"];
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

- (NSItemProvider)itemProvider
{
  return (NSItemProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItemProvider:(id)a3
{
}

- (QLPreviewItemURLProvider)urlProvider
{
  return (QLPreviewItemURLProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUrlProvider:(id)a3
{
}

- (id)lastContent
{
  return self->_lastContent;
}

- (void)setLastContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastContent, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_urlProvider, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

@end