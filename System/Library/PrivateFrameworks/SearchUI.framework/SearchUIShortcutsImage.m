@interface SearchUIShortcutsImage
+ (id)imageFromContexualActionIcon:(id)a3;
- (SearchUIShortcutsImage)initWithSFImage:(id)a3;
- (WFContextualActionIcon)icon;
- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5;
- (void)setIcon:(id)a3;
@end

@implementation SearchUIShortcutsImage

- (SearchUIShortcutsImage)initWithSFImage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIShortcutsImage;
  v5 = [(SearchUIImage *)&v10 initWithSFImage:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB4658]);
    v7 = [v4 lnPropertyIdentifier];
    v8 = (void *)[v6 initWithLNPropertyIdentifier:v7 displayStyle:0];
    [(SearchUIShortcutsImage *)v5 setIcon:v8];
  }
  return v5;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = [(SearchUIShortcutsImage *)self icon];

  if (v7)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v8[3] = &unk_1E6E74838;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    +[SearchUIUtilities dispatchAsyncIfNecessary:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, uint64_t))v6 + 2))(v6, 0, 1);
  }
}

void __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained icon];
  id v4 = [v3 lnPropertyIdentifier];

  v5 = [WeakRetained icon];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6E74810;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v6 = v4;
  [v5 loadLNPropertyImageWithCompletion:v7];
}

void __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6 || ([v5 imageData], id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v7 = SearchUIGeneralLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1E45B5000, v7, OS_LOG_TYPE_DEFAULT, "SearchUIShortcutsImage failed to load image with property identifier: %@, error: %@", (uint8_t *)&v14, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = objc_alloc(MEMORY[0x1E4FB1818]);
    v12 = [v5 imageData];
    v13 = (void *)[v11 initWithData:v12];
    (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v13, 1);
  }
}

+ (id)imageFromContexualActionIcon:(id)a3
{
  id v3 = a3;
  id v4 = [v3 imageData];

  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v3 imageData];
    [v5 setImageData:v6];

    [v3 imageScale];
    objc_msgSend(v5, "setScale:");
    goto LABEL_8;
  }
  v7 = [v3 systemName];

  if (v7)
  {
    id v5 = objc_opt_new();
    uint64_t v8 = [v3 wfIcon];
    id v9 = [v8 symbolName];
    [v5 setSymbolName:v9];

    [v5 setIsTemplate:1];
    [v5 setPunchThroughBackground:1];
    [v5 setCornerRoundingStyle:4];
  }
  else
  {
    id v5 = [v3 applicationBundleIdentifier];

    if (!v5) {
      goto LABEL_8;
    }
    id v5 = objc_opt_new();
    uint64_t v8 = [v3 applicationBundleIdentifier];
    [v5 setBundleIdentifier:v8];
  }

LABEL_8:
  if (![v5 cornerRoundingStyle]) {
    objc_msgSend(v5, "setCornerRoundingStyle:", 4 * (objc_msgSend(v3, "displayStyle") == 1));
  }

  return v5;
}

- (WFContextualActionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end