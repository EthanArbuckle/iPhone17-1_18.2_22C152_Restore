@interface SUScriptStorePageViewController
+ (BOOL)copyURLStrings:(id *)a3 forValue:(id)a4;
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)_isSegmentedControlValid:(id)a3;
- (BOOL)doubleTapEnabled;
- (BOOL)flashesScrollIndicators;
- (BOOL)scrollingEnabled;
- (BOOL)shouldInvalidateForLowMemory;
- (BOOL)shouldLoadProgressively;
- (BOOL)showsBackgroundShadow;
- (NSArray)URLStrings;
- (NSNumber)timeoutInterval;
- (NSString)userInfo;
- (SUScriptSegmentedControl)segmentedControl;
- (SUScriptStorePageViewController)init;
- (SUScriptStorePageViewController)initWithURLStrings:(id)a3;
- (id)URLs;
- (id)_className;
- (id)_copyURLsFromURLStrings:(id)a3;
- (id)_pathForWebArchiveWithIdentifier:(id)a3 inDirectory:(id)a4;
- (id)_storePageViewController;
- (id)alwaysDispatchesScrollEvents;
- (id)inputViewObeysDOMFocus;
- (id)loadWebArchiveWithIdentifier:(id)a3 fromDirectory:(id)a4;
- (id)loadingTextColor;
- (id)loadingTextShadowColor;
- (id)loadsWhenHidden;
- (id)newNativeViewController;
- (id)placeholderBackgroundStyle;
- (id)rootObject;
- (id)saveWebArchiveWithIdentifier:(id)a3 toDirectory:(id)a4;
- (id)scriptAttributeKeys;
- (id)shouldShowFormAccessory;
- (id)showsHorizontalScrollIndicator;
- (id)showsVerticalScrollIndicator;
- (int64_t)indicatorStyleGray;
- (int64_t)indicatorStyleWhite;
- (int64_t)loadingIndicatorStyle;
- (void)_setURLs:(id)a3;
- (void)_setValue:(id)a3 forScriptPropertyKey:(id)a4;
- (void)applyURLStrings:(id)a3 toViewController:(id)a4;
- (void)reloadWithCallback:(id)a3;
- (void)setAlwaysDispatchesScrollEvents:(id)a3;
- (void)setDoubleTapEnabled:(BOOL)a3;
- (void)setFlashesScrollIndicators:(BOOL)a3;
- (void)setInputViewObeysDOMFocus:(id)a3;
- (void)setLoadingIndicatorStyle:(int64_t)a3;
- (void)setLoadingTextColor:(id)a3;
- (void)setLoadingTextShadowColor:(id)a3;
- (void)setLoadsWhenHidden:(id)a3;
- (void)setNativeViewController:(id)a3;
- (void)setPlaceholderBackgroundStyle:(id)a3;
- (void)setScrollEdgeInsetsWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6;
- (void)setScrollingEnabled:(BOOL)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setShouldInvalidateForLowMemory:(BOOL)a3;
- (void)setShouldLoadProgressively:(BOOL)a3;
- (void)setShouldShowFormAccessory:(id)a3;
- (void)setShowsBackgroundShadow:(BOOL)a3;
- (void)setShowsHorizontalScrollIndicator:(id)a3;
- (void)setShowsVerticalScrollIndicator:(id)a3;
- (void)setTimeoutInterval:(id)a3;
- (void)setURLs:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SUScriptStorePageViewController

- (SUScriptStorePageViewController)init
{
  return [(SUScriptStorePageViewController *)self initWithURLStrings:0];
}

- (SUScriptStorePageViewController)initWithURLStrings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScriptStorePageViewController;
  v5 = [(SUScriptObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    initialURLStrings = v5->_initialURLStrings;
    v5->_initialURLStrings = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)copyURLStrings:(id *)a3 forValue:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (SUURLValidator((uint64_t)v5))
    {
      uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v5, 0);
LABEL_6:
      v7 = (void *)v6;
      goto LABEL_12;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v5 copyArrayValueWithValidator:SUURLValidator context:0];
      if (v6) {
        goto LABEL_6;
      }
    }
    else if (!v5)
    {
      v7 = 0;
LABEL_12:
      BOOL v8 = 1;
      if (!a3) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  BOOL v8 = 0;
  v7 = 0;
  if (a3) {
LABEL_9:
  }
    *a3 = v7;
LABEL_10:

  return v8;
}

- (void)applyURLStrings:(id)a3 toViewController:(id)a4
{
  id v10 = a4;
  id v6 = [(SUScriptStorePageViewController *)self _copyURLsFromURLStrings:a3];
  v7 = [v10 URLRequestProperties];
  BOOL v8 = (void *)[v7 mutableCopy];

  if ((unint64_t)[v6 count] >= 2) {
    [v8 setAllowedRetryCount:0];
  }
  int v9 = [v10 isViewLoaded];
  [v8 setURLs:v6];
  if (v9) {
    [v10 performSelector:sel_reloadWithURLRequestProperties_ withObject:v8 afterDelay:0.0];
  }
  else {
    [v10 setURLRequestProperties:v8];
  }
}

- (NSArray)URLStrings
{
  return self->_initialURLStrings;
}

- (id)newNativeViewController
{
  v3 = [(SUScriptObject *)self viewControllerFactory];
  id v4 = v3;
  if (v3) {
    id v5 = (SUStorePageViewController *)[v3 newStorePageViewControllerWithSection:0];
  }
  else {
    id v5 = [(SUViewController *)[SUStorePageViewController alloc] initWithSection:0];
  }
  id v6 = v5;
  initialURLStrings = self->_initialURLStrings;
  if (initialURLStrings) {
    [(SUScriptStorePageViewController *)self applyURLStrings:initialURLStrings toViewController:v5];
  }
  BOOL v8 = [(SUScriptObject *)self clientInterface];
  [(SUViewController *)v6 setClientInterface:v8];

  return v6;
}

- (void)setNativeViewController:(id)a3
{
  if (a3)
  {
    +[SUScriptNativeObject objectWithNativeObject:](SUScriptStorePageNativeObject, "objectWithNativeObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(SUScriptObject *)self setNativeObject:v4];
  }
  else
  {
    -[SUScriptObject setNativeObject:](self, "setNativeObject:");
  }
}

- (id)loadWebArchiveWithIdentifier:(id)a3 fromDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    id v10 = v5;
    id v11 = v6;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  if (*((unsigned char *)v13 + 24)) {
    v7 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    v7 = (id *)MEMORY[0x263EFFB38];
  }
  id v8 = *v7;
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __78__SUScriptStorePageViewController_loadWebArchiveWithIdentifier_fromDirectory___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _pathForWebArchiveWithIdentifier:*(void *)(a1 + 40) inDirectory:*(void *)(a1 + 48)];
  v3 = [MEMORY[0x263F1C408] sharedApplication];
  int v4 = [v3 launchedToTest];

  if (v4) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    id v25 = 0;
    id v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v2 options:0 error:&v25];
    id v7 = v25;
    if (v6)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F1FA70]) initWithData:v6];
      if (v8)
      {
        int v9 = [*(id *)(a1 + 32) _storePageViewController];
        id v10 = [v8 mainResource];
        id v11 = [v10 URL];
        [v9 reloadWithStorePage:v8 ofType:1 forURL:v11];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v14 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v18 = [v14 shouldLog];
      if ([v14 shouldLogToDisk]) {
        int v19 = v18 | 2;
      }
      else {
        int v19 = v18;
      }
      v20 = [v14 OSLogObject];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        v19 &= 2u;
      }
      if (!v19) {
        goto LABEL_24;
      }
      v21 = objc_opt_class();
      int v26 = 138412546;
      v27 = v21;
      __int16 v28 = 2112;
      v29 = v2;
      id v22 = v21;
      LODWORD(v24) = 22;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (v23)
      {
        v20 = objc_msgSend(NSString, "stringWithCString:encoding:", v23, 4, &v26, v24);
        free(v23);
        SSFileLog();
LABEL_24:
      }
    }
    else
    {
      id v8 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v12 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      uint64_t v14 = [v8 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (v13)
      {
        char v15 = objc_opt_class();
        int v26 = 138412802;
        v27 = v15;
        __int16 v28 = 2112;
        v29 = v2;
        __int16 v30 = 2112;
        id v31 = v7;
        id v16 = v15;
        LODWORD(v24) = 32;
        v17 = (void *)_os_log_send_and_compose_impl();

        if (!v17) {
          goto LABEL_26;
        }
        uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v17, 4, &v26, v24);
        free(v17);
        SSFileLog();
      }
    }

    goto LABEL_26;
  }
LABEL_27:
}

- (void)reloadWithCallback:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  id v4 = v3;
  WebThreadRunOnMainThread();
}

void __54__SUScriptStorePageViewController_reloadWithCallback___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    v2 = [[SUScriptFunction alloc] initWithScriptObject:*(void *)(a1 + 32)];
  }
  else {
    v2 = 0;
  }
  id v3 = [*(id *)(a1 + 40) _storePageViewController];
  id v4 = [v3 URLRequestProperties];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SUScriptStorePageViewController_reloadWithCallback___block_invoke_2;
  v7[3] = &unk_264813670;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v2;
  uint64_t v9 = v5;
  id v6 = v2;
  [v3 _reloadWithURLRequestProperties:v4 completionBlock:v7];
}

uint64_t __54__SUScriptStorePageViewController_reloadWithCallback___block_invoke_2(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setThisObject:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)MEMORY[0x263EFFB38];
  if (a2) {
    uint64_t v5 = (void *)MEMORY[0x263EFFB40];
  }
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObject:*v5];
  [v4 callWithArguments:v6];

  id v7 = *(void **)(a1 + 32);

  return [v7 setThisObject:0];
}

- (id)saveWebArchiveWithIdentifier:(id)a3 toDirectory:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = [(SUScriptStorePageViewController *)self _pathForWebArchiveWithIdentifier:v6 inDirectory:v7];
      if (v8)
      {
        v27[1] = (id)MEMORY[0x263EF8330];
        v27[2] = (id)3221225472;
        v27[3] = __76__SUScriptStorePageViewController_saveWebArchiveWithIdentifier_toDirectory___block_invoke;
        v27[4] = &unk_264812108;
        v27[5] = &v28;
        WebThreadRunOnMainThread();
      }
      if (!*((unsigned char *)v29 + 24)) {
        goto LABEL_21;
      }
      uint64_t v9 = [(SUScriptObject *)self webFrame];
      id v10 = [v9 dataSource];
      int v26 = [v10 webArchive];

      id v11 = [v26 data];
      v27[0] = 0;
      char v12 = [v11 writeToFile:v8 options:0 error:v27];
      id v13 = v27[0];
      *((unsigned char *)v29 + 24) = v12;

      if (*((unsigned char *)v29 + 24))
      {
LABEL_20:

LABEL_21:
        goto LABEL_23;
      }
      uint64_t v14 = [MEMORY[0x263F7B1F8] sharedConfig];
      int v15 = [v14 shouldLog];
      int v16 = [v14 shouldLogToDisk];
      v17 = [v14 OSLogObject];
      int v18 = v17;
      if (v16) {
        v15 |= 2u;
      }
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        v15 &= 2u;
      }
      if (v15)
      {
        int v19 = objc_opt_class();
        int v32 = 138412802;
        v33 = v19;
        __int16 v34 = 2112;
        v35 = v8;
        __int16 v36 = 2112;
        id v37 = v13;
        id v20 = v19;
        LODWORD(v25) = 32;
        v21 = (void *)_os_log_send_and_compose_impl();

        if (!v21)
        {
LABEL_19:

          goto LABEL_20;
        }
        int v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v32, v25);
        free(v21);
        SSFileLog();
      }

      goto LABEL_19;
    }
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_23:
  if (*((unsigned char *)v29 + 24)) {
    id v22 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    id v22 = (id *)MEMORY[0x263EFFB38];
  }
  id v23 = *v22;
  _Block_object_dispose(&v28, 8);

  return v23;
}

void __76__SUScriptStorePageViewController_saveWebArchiveWithIdentifier_toDirectory___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F1C408] sharedApplication];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 launchedToTest];
}

- (void)setScrollEdgeInsetsWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
}

void __80__SUScriptStorePageViewController_setScrollEdgeInsetsWithTop_left_bottom_right___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  objc_msgSend(v2, "setScrollContentInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [v3 setScriptProperties:v2];
}

- (id)_className
{
  return @"iTunesStorePageViewController";
}

- (id)alwaysDispatchesScrollEvents
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    id v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    id v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __63__SUScriptStorePageViewController_alwaysDispatchesScrollEvents__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 alwaysDispatchesScrollEvents];
}

- (BOOL)doubleTapEnabled
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __51__SUScriptStorePageViewController_doubleTapEnabled__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isDoubleTapEnabled];
}

- (BOOL)flashesScrollIndicators
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __58__SUScriptStorePageViewController_flashesScrollIndicators__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 flashesScrollIndicators];
}

- (id)inputViewObeysDOMFocus
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    char v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    char v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __57__SUScriptStorePageViewController_inputViewObeysDOMFocus__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 inputViewObeysDOMFocus];
}

- (int64_t)loadingIndicatorStyle
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  WebThreadRunOnMainThread();
  int64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __56__SUScriptStorePageViewController_loadingIndicatorStyle__block_invoke(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 loadingIndicatorStyle];
}

- (id)loadsWhenHidden
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    int64_t v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    int64_t v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __50__SUScriptStorePageViewController_loadsWhenHidden__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 loadsWhenHidden];
}

- (id)loadingTextColor
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__13;
  char v8 = __Block_byref_object_dispose__13;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __51__SUScriptStorePageViewController_loadingTextColor__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v10 = (id)[v2 copyScriptProperties];

  id v3 = [v10 loadingTextColor];
  if (v3)
  {
    uint64_t v4 = [SUScriptColor alloc];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) initWithUIColor:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)loadingTextShadowColor
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__13;
  uint64_t v8 = __Block_byref_object_dispose__13;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __57__SUScriptStorePageViewController_loadingTextShadowColor__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v10 = (id)[v2 copyScriptProperties];

  id v3 = [v10 loadingTextShadowColor];
  if (v3)
  {
    uint64_t v4 = [SUScriptColor alloc];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) initWithUIColor:v3];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (id)placeholderBackgroundStyle
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__13;
  uint64_t v8 = __Block_byref_object_dispose__13;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __61__SUScriptStorePageViewController_placeholderBackgroundStyle__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v7 = (id)[v2 copyScriptProperties];

  id v3 = [v7 placeholderBackgroundGradient];
  if (v3)
  {
    uint64_t v4 = [[SUScriptGradient alloc] initWithGradient:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

- (id)rootObject
{
  id v2 = [(SUScriptObject *)self webFrame];
  id v3 = [v2 webView];
  uint64_t v4 = [v3 windowScriptObject];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)scrollingEnabled
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __51__SUScriptStorePageViewController_scrollingEnabled__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isScrollingDisabled] ^ 1;
}

- (SUScriptSegmentedControl)segmentedControl
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__13;
  char v12 = __Block_byref_object_dispose__13;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __51__SUScriptStorePageViewController_segmentedControl__block_invoke, &unk_2648125D8, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (SUScriptSegmentedControl *)v4;
}

void __51__SUScriptStorePageViewController_segmentedControl__block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = [v10 sectionGroup];
  if (v2)
  {
    id v3 = [[SUScriptSegmentedControl alloc] initWithPageSectionGroup:v2];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    char v7 = NSNumber;
    uint64_t v8 = [v10 sectionSegmentedControl];
    id v9 = objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "selectedItemIndex"));
    [v6 setSelectedIndex:v9];

    [*(id *)(a1 + 32) checkInScriptObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)setAlwaysDispatchesScrollEvents:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_5;
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __67__SUScriptStorePageViewController_setAlwaysDispatchesScrollEvents___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = (void *)[v3 copyScriptProperties];
  objc_msgSend(v2, "setAlwaysDispatchesScrollEvents:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  [v3 setScriptProperties:v2];
}

- (void)setDoubleTapEnabled:(BOOL)a3
{
}

void __55__SUScriptStorePageViewController_setDoubleTapEnabled___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = (void *)[v3 copyScriptProperties];
  [v2 setDoubleTapEnabled:*(unsigned __int8 *)(a1 + 40)];
  [v3 setScriptProperties:v2];
}

- (void)setFlashesScrollIndicators:(BOOL)a3
{
}

void __62__SUScriptStorePageViewController_setFlashesScrollIndicators___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = (void *)[v3 copyScriptProperties];
  [v2 setFlashesScrollIndicators:*(unsigned __int8 *)(a1 + 40)];
  [v3 setScriptProperties:v2];
}

- (void)setInputViewObeysDOMFocus:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_5;
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __61__SUScriptStorePageViewController_setInputViewObeysDOMFocus___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = (void *)[v3 copyScriptProperties];
  objc_msgSend(v2, "setInputViewObeysDOMFocus:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  [v3 setScriptProperties:v2];
}

- (void)setLoadingIndicatorStyle:(int64_t)a3
{
}

void __60__SUScriptStorePageViewController_setLoadingIndicatorStyle___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = (void *)[v3 copyScriptProperties];
  [v2 setLoadingIndicatorStyle:*(void *)(a1 + 40)];
  [v3 setScriptProperties:v2];
}

- (void)setLoadingTextColor:(id)a3
{
  id v3 = [(SUScriptViewController *)self newScriptColorWithValue:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __55__SUScriptStorePageViewController_setLoadingTextColor___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = (void *)[v4 copyScriptProperties];
  id v3 = [*(id *)(a1 + 40) nativeColor];
  [v2 setLoadingTextColor:v3];

  [v4 setScriptProperties:v2];
}

- (void)setLoadingTextShadowColor:(id)a3
{
  id v3 = [(SUScriptViewController *)self newScriptColorWithValue:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __61__SUScriptStorePageViewController_setLoadingTextShadowColor___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _storePageViewController];
  char v2 = (void *)[v4 copyScriptProperties];
  id v3 = [*(id *)(a1 + 40) nativeColor];
  [v2 setLoadingTextShadowColor:v3];

  [v4 setScriptProperties:v2];
}

- (void)setLoadsWhenHidden:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    goto LABEL_5;
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __54__SUScriptStorePageViewController_setLoadsWhenHidden___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  objc_msgSend(v2, "setLoadsWhenHidden:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

- (void)setPlaceholderBackgroundStyle:(id)a3
{
  id v3 = (SUScriptColor *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[SUScriptColor alloc] initWithStyleString:v3];

    id v3 = v4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (SUGradient *)[(SUScriptColor *)v3 copyNativeGradient];
    if (!v3) {
      goto LABEL_15;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [[SUGradient alloc] initWithType:0];
      id v6 = [(SUScriptColor *)v3 nativeColor];
      -[SUGradient addColorStopWithOffset:color:](v5, "addColorStopWithOffset:color:", [v6 CGColor], 0.0);

      if (!v3) {
        goto LABEL_15;
      }
    }
    else
    {
      id v5 = 0;
      if (!v3)
      {
LABEL_15:
        char v7 = v5;
        WebThreadRunOnMainThread();

        goto LABEL_16;
      }
    }
  }
  if (v5) {
    goto LABEL_15;
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_16:
}

void __65__SUScriptStorePageViewController_setPlaceholderBackgroundStyle___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  [v2 setPlaceholderBackgroundGradient:*(void *)(a1 + 40)];
  [v3 setScriptProperties:v2];
}

- (void)setScrollingEnabled:(BOOL)a3
{
}

void __55__SUScriptStorePageViewController_setScrollingEnabled___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  [v2 setScrollingDisabled:*(unsigned char *)(a1 + 40) == 0];
  [v3 setScriptProperties:v2];
}

- (void)setSegmentedControl:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v4 = 0;
  }
  else if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_5;
    }
    [(SUScriptStorePageViewController *)self _isSegmentedControlValid:v4];
  }
  id v4 = v4;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __55__SUScriptStorePageViewController_setSegmentedControl___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = *(void **)(a1 + 40);
  id v6 = (id)v2;
  if (!v3)
  {
    id v4 = objc_alloc_init(SUPageSectionGroup);
LABEL_6:
    [v6 reloadForSectionsWithGroup:v4];
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = (SUPageSectionGroup *)[v3 newPageSectionGroup];
    if ([*(id *)(a1 + 40) nativeSelectedIndex] == -1)
    {
      id v5 = [v6 sectionSegmentedControl];
      -[SUPageSectionGroup setDefaultSectionIndex:](v4, "setDefaultSectionIndex:", [v5 selectedItemIndex]);
    }
    goto LABEL_6;
  }
  id v4 = [v3 nativeSegmentedControl];
  [v6 _setSegmentedControl:v4];
LABEL_8:
}

- (void)setShouldInvalidateForLowMemory:(BOOL)a3
{
}

void __67__SUScriptStorePageViewController_setShouldInvalidateForLowMemory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  [v2 setShouldInvalidateForMemoryPurge:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setShouldLoadProgressively:(BOOL)a3
{
}

void __62__SUScriptStorePageViewController_setShouldLoadProgressively___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  [v2 setShouldLoadProgressively:*(unsigned __int8 *)(a1 + 40)];
  [v3 setScriptProperties:v2];
}

- (void)setShouldShowFormAccessory:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __62__SUScriptStorePageViewController_setShouldShowFormAccessory___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  objc_msgSend(v2, "setShouldShowFormAccessory:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  [v3 setScriptProperties:v2];
}

- (void)setShowsBackgroundShadow:(BOOL)a3
{
}

void __60__SUScriptStorePageViewController_setShowsBackgroundShadow___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  [v2 setShowsBackgroundShadow:*(unsigned __int8 *)(a1 + 40)];
  [v3 setScriptProperties:v2];
}

- (void)setShowsHorizontalScrollIndicator:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __69__SUScriptStorePageViewController_setShowsHorizontalScrollIndicator___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  objc_msgSend(v2, "setShowsHorizontalScrollIndicator:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  [v3 setScriptProperties:v2];
}

- (void)setShowsVerticalScrollIndicator:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __67__SUScriptStorePageViewController_setShowsVerticalScrollIndicator___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = (void *)[v3 copyScriptProperties];
  objc_msgSend(v2, "setShowsVerticalScrollIndicator:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  [v3 setScriptProperties:v2];
}

- (void)setTimeoutInterval:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __54__SUScriptStorePageViewController_setTimeoutInterval___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = [v4 URLRequestProperties];
  id v3 = (void *)[v2 mutableCopy];

  [*(id *)(a1 + 40) doubleValue];
  objc_msgSend(v3, "setTimeoutInterval:");
  [v4 setURLRequestProperties:v3];
}

- (void)setURLs:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v4 = 0;
  }
  id v8 = 0;
  int v5 = [(id)objc_opt_class() copyURLStrings:&v8 forValue:v4];
  id v6 = v8;
  if (v5)
  {
    char v7 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];
    [v7 _setURLs:v6];
  }
}

- (void)setUserInfo:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {

    id v3 = 0;
  }
  else if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
      goto LABEL_5;
    }
  }
  id v3 = v3;
  WebThreadRunOnMainThread();

LABEL_5:
}

void __47__SUScriptStorePageViewController_setUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  [v2 setScriptUserInfo:*(void *)(a1 + 40)];
}

- (BOOL)shouldLoadProgressively
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __58__SUScriptStorePageViewController_shouldLoadProgressively__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 shouldLoadProgressively];
}

- (BOOL)shouldInvalidateForLowMemory
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __63__SUScriptStorePageViewController_shouldInvalidateForLowMemory__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 shouldInvalidateForMemoryPurge];
}

- (id)shouldShowFormAccessory
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    id v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    id v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __58__SUScriptStorePageViewController_shouldShowFormAccessory__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 shouldShowFormAccessory];
}

- (BOOL)showsBackgroundShadow
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 1;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __56__SUScriptStorePageViewController_showsBackgroundShadow__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 showsBackgroundShadow];
}

- (id)showsHorizontalScrollIndicator
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    char v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    char v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __65__SUScriptStorePageViewController_showsHorizontalScrollIndicator__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 showsHorizontalScrollIndicator];
}

- (id)showsVerticalScrollIndicator
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    char v2 = (id *)MEMORY[0x263EFFB40];
  }
  else {
    char v2 = (id *)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);

  return v3;
}

void __63__SUScriptStorePageViewController_showsVerticalScrollIndicator__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _storePageViewController];
  id v3 = (id)[v2 copyScriptProperties];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 showsVerticalScrollIndicator];
}

- (NSNumber)timeoutInterval
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__13;
  char v12 = __Block_byref_object_dispose__13;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  char v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __50__SUScriptStorePageViewController_timeoutInterval__block_invoke, &unk_2648125D8, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);

  return (NSNumber *)v4;
}

void __50__SUScriptStorePageViewController_timeoutInterval__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = objc_alloc(NSNumber);
  id v3 = [v7 URLRequestProperties];
  [v3 timeoutInterval];
  uint64_t v4 = objc_msgSend(v2, "initWithDouble:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)URLs
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__13;
  char v12 = __Block_byref_object_dispose__13;
  id v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __39__SUScriptStorePageViewController_URLs__block_invoke, &unk_2648125D8, self, &v8);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __39__SUScriptStorePageViewController_URLs__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _storePageViewController];
  id v2 = [v6 URLRequestProperties];
  uint64_t v3 = [v2 URLs];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSString)userInfo
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__13;
  uint64_t v8 = __Block_byref_object_dispose__13;
  id v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __43__SUScriptStorePageViewController_userInfo__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _storePageViewController];
  uint64_t v2 = [v5 scriptUserInfo];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)indicatorStyleGray
{
  return 2;
}

- (int64_t)indicatorStyleWhite
{
  return 1;
}

- (void)_setURLs:(id)a3
{
  id v4 = a3;
  id v5 = [(SUScriptStorePageViewController *)self _storePageViewController];
  [(SUScriptStorePageViewController *)self applyURLStrings:v4 toViewController:v5];
}

- (id)_copyURLsFromURLStrings:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        id v11 = objc_alloc(NSURL);
        char v12 = objc_msgSend(v11, "initWithString:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_isSegmentedControlValid:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [a3 segments];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "newPageSection", (void)v11);

        if (!v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (id)_pathForWebArchiveWithIdentifier:(id)a3 inDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    NSTemporaryDirectory();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([MEMORY[0x263F08850] ensureDirectoryExists:v6])
  {
    uint64_t v7 = [v5 stringByAppendingPathExtension:@"webarchive"];
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_setValue:(id)a3 forScriptPropertyKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SUScriptStorePageViewController *)self _storePageViewController];
  uint64_t v8 = (void *)[v9 copyScriptProperties];
  [v8 setValue:v7 forKey:v6];

  [v9 setScriptProperties:v8];
}

- (id)_storePageViewController
{
  uint64_t v2 = [(SUScriptViewController *)self nativeViewController];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 parentViewController];

      uint64_t v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)__KeyMapping_21 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptStorePageViewController;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_16, 4);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptStorePageViewController;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptStorePageViewController;
  uint64_t v2 = [(SUScriptViewController *)&v5 scriptAttributeKeys];
  uint64_t v3 = [(id)__KeyMapping_21 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_16 = (uint64_t)sel_loadWebArchiveWithIdentifier_fromDirectory_;
    *(void *)algn_2681B4B18 = @"loadWebArchive";
    qword_2681B4B20 = (uint64_t)sel_reloadWithCallback_;
    unk_2681B4B28 = @"reload";
    qword_2681B4B30 = (uint64_t)sel_saveWebArchiveWithIdentifier_toDirectory_;
    unk_2681B4B38 = @"saveWebArchive";
    qword_2681B4B40 = (uint64_t)sel_setScrollEdgeInsetsWithTop_left_bottom_right_;
    unk_2681B4B48 = @"setScrollEdgeInsets";
    __KeyMapping_21 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"alwaysDispatchesScrollEvents", @"doubleTapEnabled", @"doubleTapEnabled", @"flashesScrollIndicators", @"flashesScrollIndicators", @"inputViewObeysDOMFocus", @"inputViewObeysDOMFocus", @"loadingIndicatorStyle", @"loadingIndicatorStyle", @"loadingTextColor", @"loadingTextColor", @"loadingTextShadowColor", @"loadingTextShadowColor", @"loadsWhenHidden", @"loadsWhenHidden", @"placeholderBackgroundStyle", @"placeholderBackgroundStyle",
                        @"rootObject",
                        @"rootObject",
                        @"scrollingEnabled",
                        @"scrollingEnabled",
                        @"segmentedControl",
                        @"segmentedControl",
                        @"shouldInvalidateForLowMemory",
                        @"shouldInvalidateForLowMemory",
                        @"shouldLoadProgressively",
                        @"shouldLoadProgressively",
                        @"shouldShowFormAccessory",
                        @"shouldShowFormAccessory",
                        @"showsBackgroundShadow",
                        @"showsBackgroundShadow",
                        @"showsHorizontalScrollIndicator",
                        @"showsHorizontalScrollIndicator",
                        @"showsVerticalScrollIndicator",
                        @"showsVerticalScrollIndicator",
                        @"timeoutInterval",
                        @"timeoutInterval",
                        @"urls",
                        @"URLs",
                        @"userInfo",
                        @"userInfo",
                        @"INDICATOR_STYLE_GRAY",
                        @"indicatorStyleGray",
                        @"INDICATOR_STYLE_WHITE",
                        @"indicatorStyleWhite",
                        0);
    MEMORY[0x270F9A758]();
  }
}

- (void).cxx_destruct
{
}

@end