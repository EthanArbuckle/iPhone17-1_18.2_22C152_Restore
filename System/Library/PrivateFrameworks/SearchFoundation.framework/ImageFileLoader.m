@interface ImageFileLoader
- (BOOL)canLoadImage:(id)a3 context:(id)a4;
- (id)cardLoader;
- (id)moreResultsLoader;
- (id)urlForImage:(id)a3 context:(id)a4;
- (void)loadImage:(id)a3 context:(id)a4 completionHandler:(id)a5;
@end

@implementation ImageFileLoader

- (id)moreResultsLoader
{
  return 0;
}

- (id)cardLoader
{
  return 0;
}

- (id)urlForImage:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 darkUrlValue];
  int v8 = [v6 hasDarkAppearance];

  if (v8 && v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [v5 urlValue];
    v11 = (void *)v10;
    if (v10) {
      v12 = (void *)v10;
    }
    else {
      v12 = v7;
    }
    id v9 = v12;
  }
  return v9;
}

- (void)loadImage:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id, void))a5;
  v11 = [v8 imageData];

  if (v11)
  {
    v10[2](v10, v8, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [(ImageFileLoader *)self urlForImage:v8 context:v9];
    }
    else
    {
      v12 = 0;
    }
    v13 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__ImageFileLoader_SFImageResourceLoader__loadImage_context_completionHandler___block_invoke;
    block[3] = &unk_1E5A2E810;
    id v16 = v12;
    id v17 = v8;
    v18 = v10;
    id v14 = v12;
    dispatch_async(v13, block);
  }
}

void __78__ImageFileLoader_SFImageResourceLoader__loadImage_context_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  v4 = (void *)[v2 initWithContentsOfURL:v3 options:1 error:&v7];
  id v5 = v7;
  if (!v4)
  {
    if (PARLogHandleForCategory_onceToken_65848 != -1) {
      dispatch_once(&PARLogHandleForCategory_onceToken_65848, &__block_literal_global_114);
    }
    id v6 = PARLogHandleForCategory_logHandles_1_65849;
    if (os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_65849, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1A0C02000, v6, OS_LOG_TYPE_ERROR, "-[ImageFileLoader loadImage:withCompletionHandler:] error: %@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setImageData:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (BOOL)canLoadImage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 source])
  {
    id v9 = [v6 imageData];

    if (v9)
    {
      char v8 = 1;
      goto LABEL_5;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [(ImageFileLoader *)self urlForImage:v6 context:v7];
      if (v11)
      {
        v12 = v11;
        v13 = [v11 scheme];
        char v8 = [v13 hasPrefix:@"file"];

        goto LABEL_5;
      }
    }
  }
  char v8 = 0;
LABEL_5:

  return v8;
}

@end