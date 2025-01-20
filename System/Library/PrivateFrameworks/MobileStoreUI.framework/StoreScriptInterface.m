@interface StoreScriptInterface
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (SUProductPageViewController)parentProductPageViewController;
- (id)makeStoreSheetRequest;
- (void)setParentProductPageViewController:(id)a3;
- (void)showStoreSheetWithRequest:(id)a3 animated:(BOOL)a4;
@end

@implementation StoreScriptInterface

+ (id)webScriptNameForSelector:(SEL)a3
{
  v5 = SUWebScriptNameForSelector2();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___StoreScriptInterface;
    v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping = (uint64_t)sel_makeStoreSheetRequest;
    *(void *)algn_269F6B7E8 = @"createStoreSheetRequest";
    qword_269F6B7F0 = (uint64_t)sel_showStoreSheetWithRequest_animated_;
    unk_269F6B7F8 = @"showStoreSheet";
  }
}

- (SUProductPageViewController)parentProductPageViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentProductPageViewController);
  return (SUProductPageViewController *)WeakRetained;
}

- (void)setParentProductPageViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)makeStoreSheetRequest
{
  v3 = objc_alloc_init(SUScriptStoreSheetRequest);
  [(SUScriptObject *)self checkInScriptObject:v3];
  return v3;
}

- (void)showStoreSheetWithRequest:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 newNativeStorePageRequest];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __86__StoreScriptInterface_SUScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke;
    v12[3] = &unk_265405B48;
    v12[4] = self;
    id v13 = v7;
    BOOL v14 = a4;
    id v8 = v7;
    v9 = (void *)SUUIWebCoreFramework();
    v10 = (void (*)(void *))SUUIWeakLinkedSymbolForString("WebThreadRunOnMainThread", v9);
    if (v10) {
      v10(v12);
    }
  }
  else
  {
    uint64_t v11 = SUUIWebCoreFramework();
    objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Webscriptobjec.isa, v11), "throwException:", @"Invalid argument");
  }
}

void __86__StoreScriptInterface_SUScriptStoreSheetRequest__showStoreSheetWithRequest_animated___block_invoke(uint64_t a1)
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

@end