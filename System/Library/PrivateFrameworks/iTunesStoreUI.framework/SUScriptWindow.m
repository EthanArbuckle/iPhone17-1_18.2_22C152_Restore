@interface SUScriptWindow
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)dismissWindowsWithOptions:(id)a3;
+ (void)initialize;
- (CGSize)_overlaySize;
- (NSNumber)height;
- (NSNumber)shadowOpacity;
- (NSNumber)shadowRadius;
- (NSNumber)width;
- (NSString)style;
- (SUScriptViewController)backViewController;
- (SUScriptViewController)frontViewController;
- (SUScriptViewController)windowParentViewController;
- (SUScriptWindow)init;
- (SUScriptWindow)initWithContext:(id)a3;
- (SUScriptWindowContext)context;
- (WebScriptObject)maskFunction;
- (WebScriptObject)shouldDismissFunction;
- (id)_backgroundViewController:(BOOL)a3;
- (id)_className;
- (id)_copySafeTransitionOptionsFromOptions:(id)a3;
- (id)_newOverlayTransitionWithOptions:(id)a3;
- (id)_overlayViewController:(BOOL)a3;
- (id)canSwipeToDismiss;
- (id)scriptAttributeKeys;
- (void)_overlayDidDismissNotification:(id)a3;
- (void)_overlayDidFlipNotification:(id)a3;
- (void)_overlayDidShowNotification:(id)a3;
- (void)_registerForOverlayNotifications;
- (void)dealloc;
- (void)dismiss:(id)a3;
- (void)flip:(id)a3;
- (void)setBackViewController:(id)a3;
- (void)setCanSwipeToDismiss:(id)a3;
- (void)setFrontViewController:(id)a3;
- (void)setHeight:(id)a3;
- (void)setMaskFunction:(id)a3;
- (void)setShadowOpacity:(id)a3;
- (void)setShadowRadius:(id)a3;
- (void)setShouldDismissFunction:(id)a3;
- (void)setWidth:(id)a3;
- (void)show:(id)a3;
@end

@implementation SUScriptWindow

- (SUScriptWindow)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptWindow;
  v2 = [(SUScriptObject *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_canSwipeToDismiss = 1;
    v2->_context = objc_alloc_init(SUScriptWindowContext);
    [(SUScriptWindow *)v3 _registerForOverlayNotifications];
  }
  return v3;
}

- (SUScriptWindow)initWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUScriptWindow;
  v4 = [(SUScriptObject *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_canSwipeToDismiss = 1;
    v4->_context = (SUScriptWindowContext *)a3;
    [(SUScriptWindow *)v5 _registerForOverlayNotifications];
  }
  return v5;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SUOverlayDidDismissNotification" object:0];
  [v3 removeObserver:self name:@"SUOverlayDidFlipNotification" object:0];
  [v3 removeObserver:self name:@"SUOverlayDidShowNotification" object:0];

  [(SUScriptFunction *)self->_shouldDismissFunction setScriptObject:0];
  [(SUScriptFunction *)self->_shouldDismissFunction setThisObject:0];

  v4.receiver = self;
  v4.super_class = (Class)SUScriptWindow;
  [(SUScriptObject *)&v4 dealloc];
}

+ (void)dismissWindowsWithOptions:(id)a3
{
  v3 = (void *)[a3 safeValueForKey:@"animate"];
  if (objc_opt_respondsToSelector()) {
    [v3 BOOLValue];
  }
  WebThreadRunOnMainThread();
}

uint64_t __44__SUScriptWindow_dismissWindowsWithOptions___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(+[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController"), "overlayBackgroundViewController");
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);

  return [v2 dismissAnimated:v3];
}

- (SUScriptWindowContext)context
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = self->_context;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)dismiss:(id)a3
{
  id v3 = [(SUScriptWindow *)self _copySafeTransitionOptionsFromOptions:a3];
  WebThreadRunOnMainThread();
}

uint64_t __26__SUScriptWindow_dismiss___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(a1 + 32) _backgroundViewController:0];
  uint64_t v3 = objc_msgSend(v2, "viewControllerForScriptWindowContext:", objc_msgSend(*(id *)(a1 + 32), "context"));
  if (v3)
  {
    uint64_t v4 = v3;
    objc_super v5 = (void *)[*(id *)(a1 + 40) objectForKey:@"animate"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = [v5 BOOLValue];
    }
    else {
      uint64_t v6 = 0;
    }
    return [v2 dismissOverlay:v4 animated:v6];
  }
  else
  {
    objc_super v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    uint64_t result = os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT);
    if (!result) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v13 = 138412290;
      uint64_t v14 = objc_opt_class();
      LODWORD(v12) = 12;
      uint64_t result = _os_log_send_and_compose_impl();
      if (result)
      {
        v11 = (void *)result;
        objc_msgSend(NSString, "stringWithCString:encoding:", result, 4, &v13, v12);
        free(v11);
        return SSFileLog();
      }
    }
  }
  return result;
}

- (void)flip:(id)a3
{
  id v3 = [(SUScriptWindow *)self _copySafeTransitionOptionsFromOptions:a3];
  WebThreadRunOnMainThread();
}

void __23__SUScriptWindow_flip___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    id v3 = (void *)v2;
    id v10 = (id)[*(id *)(a1 + 32) _newOverlayTransitionWithOptions:*(void *)(a1 + 40)];
    objc_msgSend(v3, "flipWithTransition:");
  }
  else
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v11 = 138412290;
      uint64_t v12 = objc_opt_class();
      LODWORD(v9) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        int v8 = (void *)v7;
        objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v11, v9);
        free(v8);
        SSFileLog();
      }
    }
  }
}

- (void)show:(id)a3
{
  id v3 = [(SUScriptWindow *)self _copySafeTransitionOptionsFromOptions:a3];
  WebThreadRunOnMainThread();
}

void __23__SUScriptWindow_show___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = (void *)[*(id *)(a1 + 32) _backgroundViewController:1];
  if ([v3 viewControllerForScriptWindowContext:v2])
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v6 &= 2u;
    }
    if (v6)
    {
LABEL_8:
      int v36 = 138412290;
      uint64_t v37 = objc_opt_class();
      LODWORD(v34) = 12;
      uint64_t v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        int v8 = (void *)v7;
        objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v36, v34);
        free(v8);
        SSFileLog();
      }
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 72) || *(void *)(v9 + 96))
    {
      if (v3)
      {
        id v10 = objc_alloc_init(SUOverlayViewController);
        [(SUOverlayViewController *)v10 setCanSwipeToDismiss:*(unsigned __int8 *)(*(void *)(a1 + 32) + 80)];
        -[SUViewController setClientInterface:](v10, "setClientInterface:", [v3 clientInterface]);
        [(SUOverlayViewController *)v10 setScriptWindowContext:v2];
        -[SUOverlayViewController setBackViewController:](v10, "setBackViewController:", [*(id *)(*(void *)(a1 + 32) + 72) nativeViewController]);
        -[SUOverlayViewController setFrontViewController:](v10, "setFrontViewController:", [*(id *)(*(void *)(a1 + 32) + 96) nativeViewController]);
        [*(id *)(a1 + 32) lock];
        uint64_t v11 = *(void *)(a1 + 32);
        if (*(void *)(v11 + 112))
        {
          uint64_t v12 = [[SUCanvasMaskProvider alloc] initWithFunction:*(void *)(*(void *)(a1 + 32) + 112)];
          uint64_t v11 = *(void *)(a1 + 32);
        }
        else
        {
          uint64_t v12 = 0;
        }
        [(SUOverlayViewController *)v10 setShouldDismissFunction:*(void *)(v11 + 136)];
        [*(id *)(a1 + 32) unlock];
        [(SUOverlayViewController *)v10 setMaskProvider:v12];

        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void **)(v13 + 120);
        if (v14)
        {
          [v14 floatValue];
          [(SUOverlayViewController *)v10 setShadowOpacity:v15];
          uint64_t v13 = *(void *)(a1 + 32);
        }
        v16 = *(void **)(v13 + 128);
        if (v16)
        {
          [v16 floatValue];
          [(SUOverlayViewController *)v10 setShadowRadius:v17];
        }
        [(id)objc_opt_class() defaultOverlaySize];
        double v20 = v19;
        uint64_t v21 = *(void *)(a1 + 32);
        v22 = *(void **)(v21 + 104);
        if (v22)
        {
          [v22 floatValue];
          double v24 = v23;
          uint64_t v21 = *(void *)(a1 + 32);
        }
        else
        {
          double v24 = v18;
        }
        v25 = *(void **)(v21 + 144);
        if (v25)
        {
          [v25 floatValue];
          double v20 = v26;
        }
        -[SUOverlayViewController setOverlaySize:](v10, "setOverlaySize:", v20, v24);
        v27 = (void *)[*(id *)(a1 + 32) _newOverlayTransitionWithOptions:*(void *)(a1 + 40)];
        v28 = (void *)[v27 sourceElement];
        if ([v28 webView])
        {
          v29 = objc_alloc_init(SUScrollViewScroller);
          v30 = objc_msgSend((id)objc_msgSend(v28, "webView"), "scrollView");
          [(SUScrollViewScroller *)v29 attachToScrollView:v30];
          [v28 frame];
          objc_msgSend(v30, "convertRect:fromView:", 0);
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __23__SUScriptWindow_show___block_invoke_16;
          v35[3] = &unk_264812F30;
          v35[4] = v3;
          v35[5] = v10;
          v35[6] = v27;
          v35[7] = v29;
          -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v29, "scrollFrameToVisible:animated:completionBlock:", 1, v35);
        }
        else
        {
          [v3 presentOverlay:v10 withTransition:v27];
        }
      }
    }
    else
    {
      v31 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v32 = [v31 shouldLog];
      if ([v31 shouldLogToDisk]) {
        int v33 = v32 | 2;
      }
      else {
        int v33 = v32;
      }
      if (!os_log_type_enabled((os_log_t)[v31 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v33 &= 2u;
      }
      if (v33) {
        goto LABEL_8;
      }
    }
  }
}

uint64_t __23__SUScriptWindow_show___block_invoke_16(uint64_t a1)
{
  [*(id *)(a1 + 32) presentOverlay:*(void *)(a1 + 40) withTransition:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 56);

  return [v2 detachFromScrollView];
}

- (SUScriptViewController)backViewController
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__11;
  float v17 = __Block_byref_object_dispose__11;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __36__SUScriptWindow_backViewController__block_invoke;
  id v10 = &unk_264812E48;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __36__SUScriptWindow_backViewController__block_invoke, &unk_264812E48, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  int v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

id __36__SUScriptWindow_backViewController__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (v2) {
    id result = (id)objc_msgSend((id)objc_msgSend(v2, "backViewController"), "copyScriptViewController");
  }
  else {
    id result = *(id *)(*(void *)(a1 + 32) + 72);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)canSwipeToDismiss
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    uint64_t v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v2 = (void **)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void *__35__SUScriptWindow_canSwipeToDismiss__block_invoke(uint64_t a1)
{
  id result = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (result)
  {
    id result = (void *)[result canSwipeToDismiss];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 80);
  }
  return result;
}

- (id)_className
{
  return @"iTunesWindow";
}

- (SUScriptViewController)frontViewController
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__11;
  float v17 = __Block_byref_object_dispose__11;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __37__SUScriptWindow_frontViewController__block_invoke;
  id v10 = &unk_264812E48;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __37__SUScriptWindow_frontViewController__block_invoke, &unk_264812E48, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

id __37__SUScriptWindow_frontViewController__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (v2) {
    id result = (id)objc_msgSend((id)objc_msgSend(v2, "frontViewController"), "copyScriptViewController");
  }
  else {
    id result = *(id *)(*(void *)(a1 + 32) + 96);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)height
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  id v10 = &unk_2279415F1;
  long long v11 = *MEMORY[0x263F001B0];
  uint64_t v5 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = v8[5];
  *(float *)&double v2 = v2;
  id v3 = (NSNumber *)objc_msgSend(NSNumber, "numberWithFloat:", v2, v5, 3221225472, __24__SUScriptWindow_height__block_invoke, &unk_264812E70, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __24__SUScriptWindow_height__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _overlaySize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (WebScriptObject)maskFunction
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = [(SUScriptFunction *)self->_maskFunction scriptObject];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setBackViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

id __40__SUScriptWindow_setBackViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id result = (id)[*(id *)(a1 + 40) nativeViewController];
    if (*(void *)(a1 + 40)) {
      BOOL v5 = result == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (!v5)
    {
      return (id)[v3 setBackViewController:result];
    }
  }
  else
  {

    id result = *(id *)(a1 + 40);
    *(void *)(*(void *)(a1 + 32) + 72) = result;
  }
  return result;
}

- (void)setCanSwipeToDismiss:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __39__SUScriptWindow_setCanSwipeToDismiss___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 80) = [*(id *)(a1 + 40) BOOLValue];
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 80);

  return [v2 setCanSwipeToDismiss:v3];
}

- (void)setHeight:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __28__SUScriptWindow_setHeight___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    uint64_t v3 = v2;
    [v2 overlaySize];
    double v5 = v4;
    [*(id *)(a1 + 40) floatValue];
    return objc_msgSend(v3, "setOverlaySize:", v5, v6);
  }
  else
  {

    id v8 = objc_alloc(NSNumber);
    [*(id *)(a1 + 40) floatValue];
    uint64_t result = objc_msgSend(v8, "initWithFloat:");
    *(void *)(*(void *)(a1 + 32) + 104) = result;
  }
  return result;
}

- (void)setMaskFunction:(id)a3
{
  uint64_t v3 = (SUScriptCanvasFunction *)a3;
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    float v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
  else
  {
    [(SUScriptObject *)self lock];

    if (v3) {
      uint64_t v3 = [(SUScriptFunction *)[SUScriptCanvasFunction alloc] initWithScriptObject:v3];
    }
    self->_maskFunction = v3;
    +[SUOverlayViewController defaultOverlaySize];

    double v5 = self->_maskFunction;
    [(SUScriptObject *)self unlock];
    WebThreadRunOnMainThread();
  }
}

void __34__SUScriptWindow_setMaskFunction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    double v4 = [[SUCanvasMaskProvider alloc] initWithFunction:*(void *)(a1 + 40)];
    [v3 setMaskProvider:v4];
  }
}

- (void)setFrontViewController:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

id __41__SUScriptWindow_setFrontViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id result = (id)[*(id *)(a1 + 40) nativeViewController];
    if (*(void *)(a1 + 40)) {
      BOOL v5 = result == 0;
    }
    else {
      BOOL v5 = 0;
    }
    if (!v5)
    {
      return (id)[v3 setFrontViewController:result];
    }
  }
  else
  {

    id result = *(id *)(a1 + 40);
    *(void *)(*(void *)(a1 + 32) + 96) = result;
  }
  return result;
}

- (void)setShadowOpacity:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    WebThreadRunOnMainThread();
  }
  else
  {
    double v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
}

uint64_t __35__SUScriptWindow_setShadowOpacity___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0), "setShadowOpacity:", *(double *)(a1 + 40));

  id v2 = objc_alloc(NSNumber);
  double v3 = *(double *)(a1 + 40);
  *(float *)&double v3 = v3;
  uint64_t result = [v2 initWithFloat:v3];
  *(void *)(*(void *)(a1 + 32) + 120) = result;
  return result;
}

- (void)setShadowRadius:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 floatValue];
    WebThreadRunOnMainThread();
  }
  else
  {
    double v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
}

uint64_t __34__SUScriptWindow_setShadowRadius___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_overlayViewController:", 0), "setShadowRadius:", *(double *)(a1 + 40));

  id v2 = objc_alloc(NSNumber);
  double v3 = *(double *)(a1 + 40);
  *(float *)&double v3 = v3;
  uint64_t result = [v2 initWithFloat:v3];
  *(void *)(*(void *)(a1 + 32) + 128) = result;
  return result;
}

- (void)setShouldDismissFunction:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __43__SUScriptWindow_setShouldDismissFunction___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 136) = objc_alloc_init(SUScriptFunction);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "setThisObject:");
    id v2 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  [v2 setScriptObject:*(void *)(a1 + 40)];
  double v3 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 136);

  return [v3 setShouldDismissFunction:v4];
}

- (void)setWidth:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    double v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __27__SUScriptWindow_setWidth___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    double v3 = v2;
    [v2 overlaySize];
    double v5 = v4;
    [*(id *)(a1 + 40) floatValue];
    double v7 = v6;
    return objc_msgSend(v3, "setOverlaySize:", v7, v5);
  }
  else
  {

    id v9 = objc_alloc(NSNumber);
    [*(id *)(a1 + 40) floatValue];
    uint64_t result = objc_msgSend(v9, "initWithFloat:");
    *(void *)(*(void *)(a1 + 32) + 144) = result;
  }
  return result;
}

- (NSNumber)shadowOpacity
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x3FE570A3E0000000;
  uint64_t v5 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = v8[3];
  *(float *)&double v2 = v2;
  double v3 = (NSNumber *)objc_msgSend(NSNumber, "numberWithFloat:", v2, v5, 3221225472, __31__SUScriptWindow_shadowOpacity__block_invoke, &unk_264812E48, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void *__31__SUScriptWindow_shadowOpacity__block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    uint64_t result = (void *)[v2 shadowOpacity];
  }
  else
  {
    uint64_t result = *(void **)(*(void *)(a1 + 32) + 120);
    if (!result) {
      return result;
    }
    uint64_t result = (void *)[result floatValue];
    double v4 = v5;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (NSNumber)shadowRadius
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x402E000000000000;
  uint64_t v5 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = v8[3];
  *(float *)&double v2 = v2;
  double v3 = (NSNumber *)objc_msgSend(NSNumber, "numberWithFloat:", v2, v5, 3221225472, __30__SUScriptWindow_shadowRadius__block_invoke, &unk_264812E48, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void *__30__SUScriptWindow_shadowRadius__block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (v2)
  {
    uint64_t result = (void *)[v2 shadowRadius];
  }
  else
  {
    uint64_t result = *(void **)(*(void *)(a1 + 32) + 128);
    if (!result) {
      return result;
    }
    uint64_t result = (void *)[result floatValue];
    double v4 = v5;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  return result;
}

- (WebScriptObject)shouldDismissFunction
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__11;
  uint64_t v12 = __Block_byref_object_dispose__11;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = (void *)v9[5];
  if (v2) {
    double v3 = v2;
  }
  else {
    double v3 = (WebScriptObject *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __39__SUScriptWindow_shouldDismissFunction__block_invoke, &unk_264812E48, self, &v8);
  }
  double v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __39__SUScriptWindow_shouldDismissFunction__block_invoke(uint64_t a1)
{
  double v2 = (void *)[*(id *)(a1 + 32) _overlayViewController:0];
  if (v2) {
    double v3 = (void *)[v2 shouldDismissFunction];
  }
  else {
    double v3 = *(void **)(*(void *)(a1 + 32) + 136);
  }
  id result = (id)[v3 scriptObject];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)style
{
  return (NSString *)@"overlay";
}

- (NSNumber)width
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v10 = &unk_2279415F1;
  long long v11 = *MEMORY[0x263F001B0];
  uint64_t v5 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  double v2 = v8[4];
  *(float *)&double v2 = v2;
  double v3 = (NSNumber *)objc_msgSend(NSNumber, "numberWithFloat:", v2, v5, 3221225472, __23__SUScriptWindow_width__block_invoke, &unk_264812E70, self, &v7);
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __23__SUScriptWindow_width__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _overlaySize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (SUScriptViewController)windowParentViewController
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__11;
  float v17 = __Block_byref_object_dispose__11;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __44__SUScriptWindow_windowParentViewController__block_invoke;
  uint64_t v10 = &unk_264812E48;
  long long v11 = self;
  uint64_t v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __44__SUScriptWindow_windowParentViewController__block_invoke, &unk_264812E48, v11, &v13), (uint64_t v3 = (void *)v14[5]) != 0))
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __44__SUScriptWindow_windowParentViewController__block_invoke(uint64_t a1)
{
  double v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_backgroundViewController:", 0), "parentViewController");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = (void *)[v2 transientViewController];
    if (!v3) {
      uint64_t v3 = (void *)[v2 selectedNavigationController];
    }
  }
  else
  {
    uint64_t v3 = v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = (void *)[v3 topViewController];
  }
  uint64_t result = [v3 copyScriptViewController];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_overlayDidDismissNotification:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "scriptWindowContext"), "tag");
  if (v4 == [(SUScriptWindowContext *)[(SUScriptWindow *)self context] tag])
  {
    [(SUScriptObject *)self dispatchEvent:0 forName:@"dismiss"];
    [(SUScriptObject *)self setVisible:0];
  }
}

- (void)_overlayDidFlipNotification:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "scriptWindowContext"), "tag");
  if (v4 == [(SUScriptWindowContext *)[(SUScriptWindow *)self context] tag])
  {
    [(SUScriptObject *)self dispatchEvent:0 forName:@"flip"];
  }
}

- (void)_overlayDidShowNotification:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "object"), "scriptWindowContext"), "tag");
  if (v4 == [(SUScriptWindowContext *)[(SUScriptWindow *)self context] tag])
  {
    [(SUScriptObject *)self dispatchEvent:0 forName:@"show"];
    [(SUScriptObject *)self setVisible:1];
  }
}

- (CGSize)_overlaySize
{
  +[SUOverlayViewController defaultOverlaySize];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(SUScriptWindow *)self _overlayViewController:0];
  if (v7)
  {
    [v7 overlaySize];
    double v4 = v8;
    double v6 = v9;
  }
  else
  {
    id height = self->_height;
    if (height)
    {
      [height floatValue];
      double v6 = v11;
    }
    id width = self->_width;
    if (width)
    {
      [width floatValue];
      double v4 = v13;
    }
  }
  double v14 = v4;
  double v15 = v6;
  result.id height = v15;
  result.id width = v14;
  return result;
}

- (id)_backgroundViewController:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[SUClientDispatch overlayBackgroundViewController];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !v3;
  }
  if (!v6)
  {
    id v7 = objc_alloc_init(SUOverlayBackgroundViewController);
    [(SUViewController *)v7 setClientInterface:[(SUScriptObject *)self clientInterface]];
    if (+[SUClientDispatch presentOverlayBackgroundViewController:v7])
    {
      double v5 = v7;
    }
    else
    {
      double v5 = 0;
    }
    double v8 = v7;
  }
  return v5;
}

- (id)_copySafeTransitionOptionsFromOptions:(id)a3
{
  return (id)objc_msgSend(a3, "copyValuesForKeys:", @"animate", @"duration", @"srcElement", @"transition", 0);
}

- (id)_newOverlayTransitionWithOptions:(id)a3
{
  double v5 = objc_alloc_init(SUOverlayTransition);
  BOOL v6 = (void *)[a3 objectForKey:@"duration"];
  if (objc_opt_respondsToSelector())
  {
    [v6 doubleValue];
    -[SUOverlayTransition setDuration:](v5, "setDuration:");
  }
  uint64_t v7 = [a3 objectForKey:@"srcElement"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUOverlayTransition *)v5 setSourceElement:[(SUScriptObject *)self DOMElementWithElement:v7]];
  }
  uint64_t v8 = [a3 objectForKey:@"transition"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    -[SUOverlayTransition setType:](v5, "setType:", [(id)objc_opt_class() transitionTypeFromString:v8]);
  }
  return v5;
}

- (id)_overlayViewController:(BOOL)a3
{
  id v4 = [(SUScriptWindow *)self _backgroundViewController:a3];
  double v5 = [(SUScriptWindow *)self context];

  return (id)[v4 viewControllerForScriptWindowContext:v5];
}

- (void)_registerForOverlayNotifications
{
  BOOL v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__overlayDidDismissNotification_ name:@"SUOverlayDidDismissNotification" object:0];
  [v3 addObserver:self selector:sel__overlayDidFlipNotification_ name:@"SUOverlayDidFlipNotification" object:0];

  [v3 addObserver:self selector:sel__overlayDidShowNotification_ name:@"SUOverlayDidShowNotification" object:0];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_18, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptWindow;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_13, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptWindow;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptWindow;
  double v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_18 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_13 = (uint64_t)sel_dismiss_;
    *(void *)algn_2681B4A48 = @"dismiss";
    qword_2681B4A50 = (uint64_t)sel_flip_;
    unk_2681B4A58 = @"flip";
    qword_2681B4A60 = (uint64_t)sel_show_;
    unk_2681B4A68 = @"show";
    __KeyMapping_18 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"backViewController", @"canSwipeToDismiss", @"canSwipeToDismiss", @"frontViewController", @"frontViewController", @"height", @"height", @"maskFunction", @"maskFunction", @"parentViewController", @"windowParentViewController", @"shadowOpacity", @"shadowOpacity", @"shadowRadius", @"shadowRadius", @"shouldDismissFunction", @"shouldDismissFunction",
                        @"style",
                        @"style",
                        @"width",
                        @"width",
                        0);
  }
}

@end