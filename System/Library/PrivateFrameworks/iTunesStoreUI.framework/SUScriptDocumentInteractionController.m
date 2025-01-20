@interface SUScriptDocumentInteractionController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)UTI;
- (WebScriptObject)cancelFunction;
- (WebScriptObject)openWithFunction;
- (id)_cancelFunction;
- (id)_className;
- (id)_nativeDocumentInteractionController;
- (id)_nativeObject;
- (id)_openWithFunction;
- (id)scriptAttributeKeys;
- (void)dealloc;
- (void)dismissMenuAnimated:(id)a3;
- (void)setCancelFunction:(id)a3;
- (void)setOpenWithFunction:(id)a3;
- (void)setUTI:(id)a3;
- (void)showOpenWithMenuFromDOMElement:(id)a3;
- (void)showOpenWithMenuFromNavigationItem:(id)a3;
@end

@implementation SUScriptDocumentInteractionController

- (void)dealloc
{
  [(SUScriptFunction *)self->_cancelFunction setThisObject:0];

  [(SUScriptFunction *)self->_openWithFunction setThisObject:0];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDocumentInteractionController;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)dismissMenuAnimated:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [a3 BOOLValue];
  }
  WebThreadRunOnMainThread();
}

uint64_t __61__SUScriptDocumentInteractionController_dismissMenuAnimated___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _nativeDocumentInteractionController];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 dismissMenuAnimated:v3];
}

- (void)showOpenWithMenuFromDOMElement:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  [MEMORY[0x263F1C5C0] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
LABEL_10:
      WebThreadRunOnMainThread();
      return;
    }
  }
  else
  {
    if (!a3) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
  }
  v4 = (void *)MEMORY[0x263F1FA90];

  [v4 throwException:@"Invalid argument"];
}

uint64_t __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "DOMElementWithElement:");
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = [*(id *)(a1 + 40) _nativeDocumentInteractionController];
  v4 = (void *)[*(id *)(a1 + 40) _nativeObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_2;
  v6[3] = &unk_264813310;
  char v7 = *(unsigned char *)(a1 + 48);
  v6[4] = v2;
  v6[5] = v3;
  return [v4 presentUsingBlock:v6];
}

void __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) webView];
  uint64_t v3 = v2;
  if (*(void *)(a1 + 32) && *(unsigned char *)(a1 + 48))
  {
    v4 = objc_alloc_init(SUScrollViewScroller);
    v5 = (void *)[v3 scrollView];
    [*(id *)(a1 + 32) frame];
    objc_msgSend(v5, "convertRect:fromView:", 0);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(SUScrollViewScroller *)v4 attachToScrollView:v5];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_3;
    v15[3] = &unk_264812F30;
    v15[4] = v3;
    long long v16 = *(_OWORD *)(a1 + 32);
    v17 = v4;
    -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v4, "scrollFrameToVisible:animated:completionBlock:", 1, v15, v7, v9, v11, v13);
  }
  else
  {
    v14 = *(void **)(a1 + 40);
    [v2 bounds];
    objc_msgSend(v14, "presentOpenInMenuFromRect:inView:animated:", v3, 1);
  }
}

uint64_t __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v2, "convertRect:fromView:", 0);
  objc_msgSend(*(id *)(a1 + 48), "presentOpenInMenuFromRect:inView:animated:", *(void *)(a1 + 32), 1);
  uint64_t v3 = *(void **)(a1 + 56);

  return [v3 detachFromScrollView];
}

- (void)showOpenWithMenuFromNavigationItem:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  [MEMORY[0x263F1C5C0] currentDevice];
  if (((objc_opt_respondsToSelector() & 1) != 0
     && objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") == 1
     || a3)
    && ([a3 conformsToProtocol:&unk_26DC1CF28] & 1) == 0)
  {
    v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __76__SUScriptDocumentInteractionController_showOpenWithMenuFromNavigationItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _nativeDocumentInteractionController];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) _nativeObject];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__SUScriptDocumentInteractionController_showOpenWithMenuFromNavigationItem___block_invoke_2;
  v6[3] = &unk_264812158;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = v2;
  v6[5] = v4;
  return [v3 presentUsingBlock:v6];
}

uint64_t __76__SUScriptDocumentInteractionController_showOpenWithMenuFromNavigationItem___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) buttonItem];

  return [v1 presentOpenInMenuFromBarButtonItem:v2 animated:1];
}

- (WebScriptObject)cancelFunction
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = [(SUScriptFunction *)self->_cancelFunction scriptObject];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_className
{
  return @"iTunesDocumentInteractionController";
}

- (WebScriptObject)openWithFunction
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = [(SUScriptFunction *)self->_openWithFunction scriptObject];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setCancelFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    cancelFunction = self->_cancelFunction;
    if (!cancelFunction)
    {
      double v8 = objc_alloc_init(SUScriptFunction);
      self->_cancelFunction = v8;
      [(SUScriptFunction *)v8 setThisObject:self];
      cancelFunction = self->_cancelFunction;
    }
    [(SUScriptFunction *)cancelFunction setScriptObject:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  id v5 = a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  double v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

- (void)setOpenWithFunction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
LABEL_6:
    [(SUScriptObject *)self lock];
    openWithFunction = self->_openWithFunction;
    if (!openWithFunction)
    {
      double v8 = objc_alloc_init(SUScriptFunction);
      self->_openWithFunction = v8;
      [(SUScriptFunction *)v8 setThisObject:self];
      openWithFunction = self->_openWithFunction;
    }
    [(SUScriptFunction *)openWithFunction setScriptObject:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3) {
    goto LABEL_6;
  }
  if (isKindOfClass) {
    goto LABEL_6;
  }
  objc_opt_class();
  id v5 = a3;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  double v9 = (void *)MEMORY[0x263F1FA90];

  [v9 throwException:@"Invalid argument"];
}

- (void)setUTI:(id)a3
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

uint64_t __48__SUScriptDocumentInteractionController_setUTI___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _nativeDocumentInteractionController];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setUTI:v3];
}

- (NSString)UTI
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3052000000;
  double v7 = __Block_byref_object_copy__43;
  double v8 = __Block_byref_object_dispose__43;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  uint64_t v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __44__SUScriptDocumentInteractionController_UTI__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDocumentInteractionController"), "UTI");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_cancelFunction
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = self->_cancelFunction;
  [(SUScriptObject *)self unlock];
  return v3;
}

- (id)_nativeDocumentInteractionController
{
  id v2 = [(SUScriptDocumentInteractionController *)self _nativeObject];

  return (id)[v2 object];
}

- (id)_nativeObject
{
  uint64_t v3 = [(SUScriptObject *)self nativeObject];
  if (![(SUScriptNativeObject *)v3 object])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C5D0]);
    [v4 setName:&stru_26DB8C5F8];
    uint64_t v3 = +[SUScriptNativeObject objectWithNativeObject:v4];
    [(SUScriptObject *)self setNativeObject:v3];
    id v5 = v4;
  }
  return v3;
}

- (id)_openWithFunction
{
  [(SUScriptObject *)self lock];
  uint64_t v3 = self->_openWithFunction;
  [(SUScriptObject *)self unlock];
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_56, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDocumentInteractionController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_41, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDocumentInteractionController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDocumentInteractionController;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_56 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_41 = (uint64_t)sel_dismissMenuAnimated_;
    *(void *)algn_2681B5478 = @"dismissMenu";
    qword_2681B5480 = (uint64_t)sel_showOpenWithMenuFromDOMElement_;
    unk_2681B5488 = @"showOpenWithMenuFromDOMElement";
    qword_2681B5490 = (uint64_t)sel_showOpenWithMenuFromNavigationItem_;
    unk_2681B5498 = @"showOpenWithMenuFromNavigationItem";
    __KeyMapping_56 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"cancelFunction", @"openWithFunction", @"openWithFunction", @"UTI", @"UTI", 0);
  }
}

@end