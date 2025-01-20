@interface NUURLHandler
- (BOOL)universalLinksEnabled;
- (NSMutableArray)modifiers;
- (NUPreviewViewControllerFactory)previewViewControllerFactory;
- (NUURLHandler)initWithURLHandling:(id)a3 universalLinksEnabled:(BOOL)a4;
- (NUURLHandlerDelegate)delegate;
- (NUURLHandling)URLHandling;
- (NUWebViewControllerFactoryType)webViewControllerFactory;
- (id)modifyURL:(id)a3;
- (id)viewControllerForURL:(id)a3;
- (void)addModifier:(id)a3;
- (void)commitViewController:(id)a3 URL:(id)a4;
- (void)openURL:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)removeModifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreviewViewControllerFactory:(id)a3;
- (void)setWebViewControllerFactory:(id)a3;
@end

@implementation NUURLHandler

- (NUURLHandler)initWithURLHandling:(id)a3 universalLinksEnabled:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NUURLHandler;
  v8 = [(NUURLHandler *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_URLHandling, a3);
    v9->_universalLinksEnabled = a4;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    modifiers = v9->_modifiers;
    v9->_modifiers = v10;
  }
  return v9;
}

- (void)addModifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NUURLHandler *)self modifiers];
    [v5 addObject:v4];
  }
}

- (void)removeModifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NUURLHandler *)self modifiers];
    [v5 removeObject:v4];
  }
}

- (id)viewControllerForURL:(id)a3
{
  id v4 = [(NUURLHandler *)self modifyURL:a3];
  if (v4)
  {
    id v5 = [(NUURLHandler *)self previewViewControllerFactory];
    v6 = [v5 createViewControllerForURL:v4];

    if (v6) {
      id v7 = v6;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)commitViewController:(id)a3 URL:(id)a4
{
}

- (void)openURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NUURLHandler *)self modifyURL:v4];
  v6 = NUSharedLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 absoluteString];
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_2221C5000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to open modified URL %{public}@", buf, 0xCu);
  }
  v8 = [(NUURLHandler *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(NUURLHandler *)self delegate];
    [v10 URLHandler:self willOpenURL:v5];
  }
  objc_initWeak((id *)buf, self);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __24__NUURLHandler_openURL___block_invoke;
  v22 = &unk_2645FE568;
  objc_copyWeak(&v24, (id *)buf);
  id v11 = v5;
  id v23 = v11;
  v12 = (void (**)(void, void))MEMORY[0x223C968A0](&v19);
  objc_super v13 = objc_msgSend(MEMORY[0x263F08BA0], "componentsWithURL:resolvingAgainstBaseURL:", v11, 0, v19, v20, v21, v22);
  v14 = [v13 scheme];
  int v15 = [v14 hasPrefix:@"http"];

  if (([(NUURLHandler *)self universalLinksEnabled] | v15 ^ 1))
  {
    v16 = [MEMORY[0x263EFF9A0] dictionary];
    v17 = v16;
    if (v15) {
      [v16 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F1D090]];
    }
    v18 = [(NUURLHandler *)self URLHandling];
    [v18 openURL:v11 options:v17 completion:v12];
  }
  else
  {
    v12[2](v12, 0);
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

void __24__NUURLHandler_openURL___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = [WeakRetained webViewControllerFactory];
    id v8 = [v6 createViewControllerForURL:*(void *)(a1 + 32)];

    if (v8)
    {
      [v8 setModalPresentationStyle:6];
      id v7 = objc_loadWeakRetained(v4);
      [v7 presentViewController:v8 animated:1];
    }
  }
}

- (id)modifyURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void *)[a3 copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NUURLHandler *)self modifiers];
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      id v11 = v4;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) modifyURL:v11];
        id v4 = (void *)[v12 copy];

        ++v10;
        id v11 = v4;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  v6 = [(NUURLHandler *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(NUURLHandler *)self delegate];
    [v8 URLHandler:self wantsToPresentViewController:v9 animated:v4];
  }
}

- (NUURLHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NUURLHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NUWebViewControllerFactoryType)webViewControllerFactory
{
  return self->_webViewControllerFactory;
}

- (void)setWebViewControllerFactory:(id)a3
{
}

- (NUPreviewViewControllerFactory)previewViewControllerFactory
{
  return self->_previewViewControllerFactory;
}

- (void)setPreviewViewControllerFactory:(id)a3
{
}

- (NUURLHandling)URLHandling
{
  return self->_URLHandling;
}

- (BOOL)universalLinksEnabled
{
  return self->_universalLinksEnabled;
}

- (NSMutableArray)modifiers
{
  return self->_modifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiers, 0);
  objc_storeStrong((id *)&self->_URLHandling, 0);
  objc_storeStrong((id *)&self->_previewViewControllerFactory, 0);
  objc_storeStrong((id *)&self->_webViewControllerFactory, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end