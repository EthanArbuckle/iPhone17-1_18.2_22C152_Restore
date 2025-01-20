@interface QLDataFetcher
+ (BOOL)supportsSecureCoding;
- (QLDataFetcher)initWithCoder:(id)a3;
- (QLDataFetcher)initWithData:(id)a3 contentType:(id)a4 previewItemTitle:(id)a5;
- (QLDataFetcher)initWithItem:(id)a3 contentType:(id)a4;
- (id)_createTemporaryFileIfNeeded;
- (id)_temporaryFilename;
- (id)fetchedContent;
- (id)itemSize;
- (id)newItemProvider;
- (id)shareableItem;
- (void)_deleteTempraryFileIfNeeded;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6;
- (void)loadDataIfNeeded;
- (void)prepareShareableItem:(id)a3;
@end

@implementation QLDataFetcher

- (QLDataFetcher)initWithItem:(id)a3 contentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)QLDataFetcher;
  v8 = [(QLItemFetcher *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    objc_storeStrong((id *)&v9->_contentType, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_item);
    uint64_t v11 = [WeakRetained previewItemTitle];
    previewItemTitle = v9->_previewItemTitle;
    v9->_previewItemTitle = (NSString *)v11;

    v13 = v9;
  }

  return v9;
}

- (QLDataFetcher)initWithData:(id)a3 contentType:(id)a4 previewItemTitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)QLDataFetcher;
  v12 = [(QLItemFetcher *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong((id *)&v13->_contentType, a4);
    objc_storeStrong((id *)&v13->_previewItemTitle, a5);
    v14 = v13;
  }

  return v13;
}

- (void)dealloc
{
  [(QLDataFetcher *)self _deleteTempraryFileIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)QLDataFetcher;
  [(QLDataFetcher *)&v3 dealloc];
}

- (void)fetchContentWithAllowedOutputClasses:(id)a3 inQueue:(id)a4 updateBlock:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__QLDataFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke;
  v13[3] = &unk_1E6DD3C60;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [a4 addOperationWithBlock:v13];
}

void __90__QLDataFetcher_fetchContentWithAllowedOutputClasses_inQueue_updateBlock_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) loadDataIfNeeded];
  if ([*(id *)(a1 + 40) containsObject:objc_opt_class()])
  {
    [*(id *)(a1 + 32) setFetchingState:1];
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_7:
    v2();
    return;
  }
  if (![*(id *)(a1 + 40) containsObject:objc_opt_class()])
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  id v5 = [*(id *)(a1 + 32) _createTemporaryFileIfNeeded];
  if (v5)
  {
    [*(id *)(a1 + 32) setFetchingState:1];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.quicklook.fetcher.data" code:1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

- (id)itemSize
{
  data = self->_data;
  if (data)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[NSData length](data, "length"));
  }
  else
  {
    uint64_t v3 = &unk_1F3DD2C50;
  }
  return v3;
}

- (id)_createTemporaryFileIfNeeded
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_temporaryURL = &self->_temporaryURL;
  temporaryURL = self->_temporaryURL;
  if (temporaryURL)
  {
    v4 = temporaryURL;
  }
  else
  {
    [(QLDataFetcher *)self loadDataIfNeeded];
    id v6 = (void *)MEMORY[0x1E4F1CB10];
    id v7 = NSString;
    v8 = NSTemporaryDirectory();
    id v9 = [MEMORY[0x1E4F29128] UUID];
    id v10 = [v9 UUIDString];
    id v11 = [v7 stringWithFormat:@"%@%@", v8, v10];
    id v12 = [v6 fileURLWithPath:v11];

    v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v30 = 0;
    LODWORD(v9) = [v13 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:&v30];
    id v14 = v30;

    if (!v9 || v14)
    {
      v17 = (NSObject **)MEMORY[0x1E4F945F0];
      v18 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        v18 = *v17;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v14;
        _os_log_impl(&dword_1E2805000, v18, OS_LOG_TYPE_ERROR, "Could not create temporary folder for data item with error: %@ #PreviewItem", buf, 0xCu);
      }
      v4 = 0;
    }
    else
    {
      if (self->_contentType)
      {
        id v15 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
        objc_super v16 = [v15 preferredFilenameExtension];
      }
      else
      {
        objc_super v16 = 0;
      }
      v19 = [(QLDataFetcher *)self _temporaryFilename];
      v20 = [v12 URLByAppendingPathComponent:v19];
      v21 = v20;
      if (v16)
      {
        uint64_t v22 = [v20 URLByAppendingPathExtension:v16];

        v21 = (void *)v22;
      }
      data = self->_data;
      id v29 = 0;
      BOOL v24 = [(NSData *)data writeToURL:v21 options:1 error:&v29];
      id v25 = v29;
      if (v24)
      {
        objc_storeStrong((id *)p_temporaryURL, v21);
        v4 = *p_temporaryURL;
      }
      else
      {
        v26 = (NSObject **)MEMORY[0x1E4F945F0];
        v27 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          QLSInitLogging();
          v27 = *v26;
        }
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v25;
          _os_log_impl(&dword_1E2805000, v27, OS_LOG_TYPE_ERROR, "Writting data on disk failed with error: %@ #PreviewItem", buf, 0xCu);
        }
        v4 = 0;
      }
    }
  }
  return v4;
}

- (void)_deleteTempraryFileIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_temporaryURL)
  {
    uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    v4 = [(NSURL *)self->_temporaryURL path];
    int v5 = [v3 fileExistsAtPath:v4];

    if (v5)
    {
      temporaryURL = self->_temporaryURL;
      id v12 = 0;
      char v7 = [v3 removeItemAtURL:temporaryURL error:&v12];
      id v8 = v12;
      if ((v7 & 1) == 0)
      {
        id v9 = (NSObject **)MEMORY[0x1E4F945F0];
        id v10 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          QLSInitLogging();
          id v10 = *v9;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v8;
          _os_log_impl(&dword_1E2805000, v10, OS_LOG_TYPE_ERROR, "Could not delete temporary folder for data item with error: %@ #PreviewItem", buf, 0xCu);
        }
        goto LABEL_10;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v11 = self->_temporaryURL;
    self->_temporaryURL = 0;

LABEL_10:
  }
}

- (id)_temporaryFilename
{
  previewItemTitle = self->_previewItemTitle;
  if (previewItemTitle && [(NSString *)previewItemTitle length])
  {
    v4 = self->_previewItemTitle;
  }
  else
  {
    QLLocalizedString(@"asset");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)shareableItem
{
  temporaryURL = self->_temporaryURL;
  if (!temporaryURL) {
    temporaryURL = self->_data;
  }
  id v3 = temporaryURL;
  return v3;
}

- (void)prepareShareableItem:(id)a3
{
  id v6 = a3;
  id v4 = [(QLDataFetcher *)self _createTemporaryFileIfNeeded];
  int v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    int v5 = v6;
  }
}

- (id)fetchedContent
{
  id v3 = [(QLItemFetcher *)self fetchingState];
  if (v3)
  {
    temporaryURL = self->_temporaryURL;
    if (!temporaryURL)
    {
      [(QLDataFetcher *)self loadDataIfNeeded];
      temporaryURL = self->_data;
    }
    id v3 = temporaryURL;
  }
  return v3;
}

- (void)loadDataIfNeeded
{
  if (!self->_data)
  {
    p_item = &self->_item;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
    id v4 = [WeakRetained previewItemDataProvider];
    id v5 = objc_loadWeakRetained((id *)p_item);
    id v6 = [v4 provideDataForItem:v5];
    data = self->_data;
    self->_data = v6;
  }
}

- (id)newItemProvider
{
  objc_initWeak(&location, self);
  id v3 = objc_opt_new();
  id v4 = [(QLDataFetcher *)self shareableItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    contentType = self->_contentType;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __32__QLDataFetcher_newItemProvider__block_invoke;
    v12[3] = &unk_1E6DD3BD8;
    id v6 = &v13;
    objc_copyWeak(&v13, &location);
    [v3 registerFileRepresentationForTypeIdentifier:contentType fileOptions:0 visibility:0 loadHandler:v12];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = 0;
      goto LABEL_7;
    }
    char v7 = self->_contentType;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__QLDataFetcher_newItemProvider__block_invoke_2;
    v10[3] = &unk_1E6DD3C88;
    id v6 = &v11;
    objc_copyWeak(&v11, &location);
    [v3 registerDataRepresentationForTypeIdentifier:v7 visibility:0 loadHandler:v10];
  }
  objc_destroyWeak(v6);
  id v8 = v3;
LABEL_7:

  objc_destroyWeak(&location);
  return v8;
}

uint64_t __32__QLDataFetcher_newItemProvider__block_invoke(uint64_t a1, void (**a2)(void, void, void, void))
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained shareableItem];
  ((void (**)(void, void *, uint64_t, void))a2)[2](v4, v6, 1, 0);

  return 0;
}

uint64_t __32__QLDataFetcher_newItemProvider__block_invoke_2(uint64_t a1, void (**a2)(void, void, void))
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained shareableItem];
  ((void (**)(void, void *, void))a2)[2](v4, v6, 0);

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)QLDataFetcher;
  id v4 = a3;
  [(QLItemFetcher *)&v5 encodeWithCoder:v4];
  [(QLDataFetcher *)self loadDataIfNeeded];
  [v4 encodeObject:self->_data forKey:@"data"];
  [v4 encodeObject:self->_contentType forKey:@"contentType"];
  [v4 encodeObject:self->_previewItemTitle forKey:@"previewItemTitle"];
}

- (QLDataFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLDataFetcher;
  objc_super v5 = [(QLItemFetcher *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewItemTitle"];
    previewItemTitle = v5->_previewItemTitle;
    v5->_previewItemTitle = (NSString *)v10;

    id v12 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_temporaryURL, 0);
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end