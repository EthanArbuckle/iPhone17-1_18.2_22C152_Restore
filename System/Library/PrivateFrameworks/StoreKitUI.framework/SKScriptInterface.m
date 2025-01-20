@interface SKScriptInterface
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (SKProductPageViewController)parentProductPageViewController;
- (id)makeStoreSheetRequest;
- (void)setParentProductPageViewController:(id)a3;
- (void)showStoreSheetWithRequest:(id)a3 animated:(BOOL)a4;
@end

@implementation SKScriptInterface

+ (id)webScriptNameForSelector:(SEL)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKScriptInterface webScriptNameForSelector:]();
  }
  v5 = SUWebScriptNameForSelector2();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SKScriptInterface;
    v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

+ (void)initialize
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKScriptInterface initialize]";
}

- (SKProductPageViewController)parentProductPageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentProductPageViewController);

  return (SKProductPageViewController *)WeakRetained;
}

- (void)setParentProductPageViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)makeStoreSheetRequest
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKScriptInterface(SKScriptStoreSheetRequest) *)v3 makeStoreSheetRequest];
      }
    }
  }
  v11 = objc_alloc_init(SKScriptStoreSheetRequest);
  [(SUScriptObject *)self checkInScriptObject:v11];

  return v11;
}

- (void)showStoreSheetWithRequest:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKScriptInterface(SKScriptStoreSheetRequest) showStoreSheetWithRequest:animated:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = (void *)[v6 newNativeStorePageRequest];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__SKScriptInterface_SKScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke;
    v20[3] = &unk_1E64234A0;
    v20[4] = self;
    id v21 = v15;
    BOOL v22 = a4;
    id v16 = v15;
    v17 = (void *)SKUIWebCoreFramework();
    v18 = (void (*)(void *))SKUIWeakLinkedSymbolForString("WebThreadRunOnMainThread", v17);
    if (v18) {
      v18(v20);
    }
  }
  else
  {
    uint64_t v19 = SKUIWebCoreFramework();
    objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Webscriptobjec.isa, v19), "throwException:", @"Invalid argument");
  }
}

void __83__SKScriptInterface_SKScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) parentProductPageViewController];
  if (!v2)
  {
    uint64_t v2 = [*(id *)(a1 + 32) parentViewController];
    if (v2)
    {
      while (1)
      {
        id v5 = (id)v2;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v3 = [v5 parentViewController];

        uint64_t v2 = v3;
        if (!v3) {
          goto LABEL_2;
        }
      }
      uint64_t v2 = (uint64_t)v5;
    }
  }
LABEL_2:
  id v4 = (id)v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 _showPageWithRequest:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

+ (void)webScriptNameForSelector:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKScriptInterface webScriptNameForSelector:]";
}

@end