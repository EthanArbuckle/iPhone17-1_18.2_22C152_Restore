@interface SXQuickLookComponentFileProvider
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXDocumentShareURLProvider)shareURLProvider;
- (SXQuickLookComponentFileProvider)initWithDOMObjectProvider:(id)a3 resourceDataSourceProvider:(id)a4 shareURLProvider:(id)a5;
- (SXResourceDataSourceProvider)resourceDataSourceProvider;
- (id)copyFileIfNeeded:(id)a3 to:(id)a4 error:(id *)a5;
- (void)fileForComponent:(id)a3 onCompletion:(id)a4 onError:(id)a5;
@end

@implementation SXQuickLookComponentFileProvider

- (SXQuickLookComponentFileProvider)initWithDOMObjectProvider:(id)a3 resourceDataSourceProvider:(id)a4 shareURLProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXQuickLookComponentFileProvider;
  v12 = [(SXQuickLookComponentFileProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v13->_resourceDataSourceProvider, a4);
    objc_storeStrong((id *)&v13->_shareURLProvider, a5);
  }

  return v13;
}

- (void)fileForComponent:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SXQuickLookComponentFileProvider *)self DOMObjectProvider];
  v12 = [v8 resourceIdentifier];
  v13 = [v11 resourceForIdentifier:v12];

  v14 = [(SXQuickLookComponentFileProvider *)self resourceDataSourceProvider];
  objc_super v15 = [v14 resourceDataSource];
  v16 = [v13 URL];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke;
  v22[3] = &unk_264653250;
  id v23 = v8;
  v24 = self;
  id v25 = v9;
  id v26 = v10;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_3;
  v20[3] = &unk_264653278;
  id v21 = v26;
  id v17 = v26;
  id v18 = v9;
  id v19 = v8;
  [v15 fileURLForURL:v16 onCompletion:v22 onError:v20];
}

void __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_2;
  block[3] = &unk_264653228;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  v5 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = v5;
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fileExtension];
  id v3 = [*(id *)(a1 + 40) lastPathComponent];
  if (v2)
  {
    v4 = [*(id *)(a1 + 32) fileExtension];
    uint64_t v5 = [v3 stringByAppendingPathExtension:v4];

    id v3 = (void *)v5;
  }

  id v6 = NSTemporaryDirectory();
  v7 = [v6 stringByAppendingString:v3];

  id v8 = [NSURL fileURLWithPath:v7];
  uint64_t v10 = *(void *)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  id v22 = 0;
  id v11 = (void *)[v9 copyFileIfNeeded:v10 to:v8 error:&v22];
  id v12 = v22;
  if (v11)
  {
    v13 = [SXQuickLookFile alloc];
    id v21 = [*(id *)(a1 + 32) caption];
    v14 = [v21 text];
    objc_super v15 = [*(id *)(a1 + 48) shareURLProvider];
    [v15 shareURL];
    v16 = v8;
    id v17 = v12;
    v19 = id v18 = v7;
    v20 = [(SXQuickLookFile *)v13 initWithFileURL:v11 title:v14 shareURL:v19];

    v7 = v18;
    id v12 = v17;
    id v8 = v16;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __74__SXQuickLookComponentFileProvider_fileForComponent_onCompletion_onError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyFileIfNeeded:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 pathExtension];
  uint64_t v10 = [v8 pathExtension];
  char v11 = [v9 isEqualToString:v10];

  id v12 = v7;
  if (v11) {
    goto LABEL_4;
  }
  v13 = [MEMORY[0x263F08850] defaultManager];
  v14 = [v8 path];
  char v15 = [v13 fileExistsAtPath:v14];

  id v12 = v8;
  if ((v15 & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 copyItemAtURL:v7 toURL:v8 error:a5],
        v16,
        id v12 = v8,
        v17))
  {
LABEL_4:
    id v18 = v12;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SXDocumentShareURLProvider)shareURLProvider
{
  return self->_shareURLProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURLProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end