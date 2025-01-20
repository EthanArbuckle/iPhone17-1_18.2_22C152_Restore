@interface SUScriptViewController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)equals:(id)a3;
- (NSString)contextDictionary;
- (NSString)modalPresentationStyle;
- (NSString)modalPresentationStyleNameFormSheet;
- (NSString)modalPresentationStyleNameFullScreen;
- (SUScriptNavigationController)navigationController;
- (SUScriptNavigationItem)navigationItem;
- (SUScriptPopOver)popOver;
- (SUScriptSection)section;
- (SUScriptSplitViewController)splitViewController;
- (SUScriptViewController)inputAccessoryViewController;
- (SUScriptViewController)modalViewController;
- (SUScriptViewController)presentingViewController;
- (SUScriptViewController)transientViewController;
- (SUScriptViewController)volumeViewController;
- (UIViewController)nativeViewController;
- (id)_className;
- (id)_parentViewControllerForVolumeViewController;
- (id)backgroundColor;
- (id)newNativeViewController;
- (id)newScriptColorWithValue:(id)a3;
- (id)scriptAttributeKeys;
- (id)showsLibraryButton;
- (id)toolbarItems;
- (id)topBackgroundColor;
- (id)usesBlurredBackground;
- (id)wantsFullScreenLayout;
- (int)_transitionForString:(id)a3;
- (void)_dismissModalViewControllerAnimated:(BOOL)a3;
- (void)_dismissModalViewControllerWithTransition:(id)a3;
- (void)_presentModalViewController:(id)a3 withTransition:(id)a4;
- (void)addPassbookPassWithURL:(id)a3;
- (void)dealloc;
- (void)dismissModalViewControllerAnimated:(BOOL)a3;
- (void)dismissModalViewControllerWithTransition:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissVolumeViewControllerAnimated:(id)a3;
- (void)presentModalViewController:(id)a3 withTransition:(id)a4;
- (void)presentVolumeViewController:(id)a3 animated:(id)a4;
- (void)runScrollTest:(id)a3 withDelta:(float)a4 forIterations:(int)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setInputAccessoryViewController:(id)a3;
- (void)setModalPresentationStyle:(id)a3;
- (void)setNativeViewController:(id)a3;
- (void)setSection:(id)a3;
- (void)setShowsLibraryButton:(id)a3;
- (void)setToolbarItems:(id)a3;
- (void)setToolbarItems:(id)a3 animated:(BOOL)a4;
- (void)setTopBackgroundColor:(id)a3;
- (void)setTransientViewController:(id)a3;
- (void)setUsesBlurredBackground:(id)a3;
- (void)tearDownUserInterface;
@end

@implementation SUScriptViewController

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  scriptToolbarItems = self->_scriptToolbarItems;
  uint64_t v4 = [(NSArray *)scriptToolbarItems countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(scriptToolbarItems);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setVisible:0];
      }
      uint64_t v5 = [(NSArray *)scriptToolbarItems countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUScriptViewController;
  [(SUScriptObject *)&v8 dealloc];
}

- (id)newScriptColorWithValue:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a3 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [SUScriptColor alloc];
    return [(SUScriptColor *)v3 initWithStyleString:a3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return a3;
    }
    else if (a3)
    {
      return 0;
    }
    else
    {
      uint64_t v5 = [SUScriptColor alloc];
      uint64_t v6 = [MEMORY[0x263F1C550] clearColor];
      return [(SUScriptColor *)v5 initWithUIColor:v6];
    }
  }
}

- (UIViewController)nativeViewController
{
  v3 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = [(SUScriptViewController *)self newNativeViewController];
    if (v3)
    {
      [(SUScriptViewController *)self setNativeViewController:v3];
      uint64_t v4 = v3;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = (void *)[(UIViewController *)v3 copyScriptProperties];
    if ([v5 usesBlurredBackground]) {
      [(UIViewController *)v3 setModalPresentationStyle:17];
    }
  }
  return v3;
}

- (id)newNativeViewController
{
  return 0;
}

- (void)setNativeViewController:(id)a3
{
  if (a3) {
    a3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptViewControllerNativeObject, "objectWithNativeObject:");
  }

  [(SUScriptObject *)self setNativeObject:a3];
}

- (BOOL)equals:(id)a3
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_opt_class();
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass() & 1;
  int v5 = *((unsigned __int8 *)v9 + 24);
  if (self != a3 && *((unsigned char *)v9 + 24))
  {
    WebThreadRunOnMainThread();
    int v5 = *((unsigned __int8 *)v9 + 24);
  }
  BOOL v6 = v5 != 0;
  _Block_object_dispose(&v8, 8);
  return v6;
}

uint64_t __33__SUScriptViewController_equals___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "isEqual:", objc_msgSend(*(id *)(a1 + 40), "nativeViewController"));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)tearDownUserInterface
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(SUScriptNativeObject *)[(SUScriptObject *)self nativeObject] object];
  uint64_t v4 = (void *)[v3 toolbarItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 target];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 setAction:0];
          [v10 setTarget:0];
          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
    if (v7) {
      [v3 setToolbarItems:0];
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SUScriptViewController;
  [(SUScriptObject *)&v11 tearDownUserInterface];
}

- (void)addPassbookPassWithURL:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __49__SUScriptViewController_addPassbookPassWithURL___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) nativeObject];
  uint64_t v3 = [NSURL URLWithString:*(void *)(a1 + 40)];

  return [v2 _loadPassbookPassWithURL:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  id v6 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];

  [v6 dismissViewControllerAnimated:v5 completion:a4];
}

- (void)dismissModalViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];

  [v4 _dismissModalViewControllerAnimated:v3];
}

- (void)dismissModalViewControllerWithTransition:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    id v7 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];
    [v7 _dismissModalViewControllerWithTransition:v5];
    return;
  }
  uint64_t v8 = (void *)MEMORY[0x263F1FA90];

  [v8 throwException:@"Invalid argument"];
}

- (void)presentModalViewController:(id)a3 withTransition:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    id v7 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];
    [v7 _presentModalViewController:a3 withTransition:a4];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x263F1FA90];
    [v8 throwException:@"Invalid argument"];
  }
}

- (void)runScrollTest:(id)a3 withDelta:(float)a4 forIterations:(int)a5
{
}

uint64_t __64__SUScriptViewController_runScrollTest_withDelta_forIterations___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "view"), "firstScrollViewDescendant");
  uint64_t v3 = *(void *)(a1 + 40);
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  uint64_t v5 = *(unsigned int *)(a1 + 52);

  return [v2 runScrollTest:v3 withDelta:v5 forIterations:v4];
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v6 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        id v6 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x263F1FA90];
          goto LABEL_24;
        }
      }
    }
  }
  uint64_t v8 = [v6 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
  if (v8)
  {
    long long v9 = (void *)v8;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    scriptToolbarItems = self->_scriptToolbarItems;
    uint64_t v11 = [(NSArray *)scriptToolbarItems countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(scriptToolbarItems);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) setVisible:0];
        }
        uint64_t v12 = [(NSArray *)scriptToolbarItems countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }

    long long v15 = (NSArray *)[v9 copy];
    self->_scriptToolbarItems = v15;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * j) setVisible:1];
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }
    WebThreadRunOnMainThread();

    return;
  }
  v20 = (void *)MEMORY[0x263F1FA90];
LABEL_24:

  [v20 throwException:@"Invalid argument"];
}

void __51__SUScriptViewController_setToolbarItems_animated___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "appearance");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) nativeButtonOfType:1];
        if (v9)
        {
          uint64_t v10 = v9;
          [v3 styleBarButtonItem:v9];
          [v2 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setToolbarItems:animated:", v2, *(unsigned __int8 *)(a1 + 48));
}

- (NSString)contextDictionary
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3052000000;
  uint64_t v7 = __Block_byref_object_copy__12;
  uint64_t v8 = __Block_byref_object_dispose__12;
  uint64_t v9 = 0;
  WebThreadRunOnMainThread();
  id v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __43__SUScriptViewController_contextDictionary__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v5 = (id)[v2 copyScriptProperties];
    uint64_t v3 = [v5 contextDictionary];
    if (v3)
    {
      uint64_t v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:0 error:0];
      if (v4) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[NSString alloc] initWithData:v4 encoding:4];
      }
    }
  }
}

- (id)backgroundColor
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__12;
  long long v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __41__SUScriptViewController_backgroundColor__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __41__SUScriptViewController_backgroundColor__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)[v2 copyScriptProperties];
    id v4 = (id)[v3 backgroundColor];

    if (!v4) {
      return;
    }
LABEL_6:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [SUScriptColor alloc];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40) initWithUIColor:v4];
    return;
  }
  if ([v2 isViewLoaded])
  {
    id v4 = (id)objc_msgSend((id)objc_msgSend(v2, "view"), "backgroundColor");
    if (v4) {
      goto LABEL_6;
    }
  }
}

- (id)_className
{
  return @"iTunesViewController";
}

- (SUScriptViewController)inputAccessoryViewController
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__12;
  long long v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __54__SUScriptViewController_inputAccessoryViewController__block_invoke, &unk_264812E48, self, &v8);
    id v3 = (void *)v9[5];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __54__SUScriptViewController_inputAccessoryViewController__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(v2, "inputAccessoryViewController"), "copyScriptViewController");
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (NSString)modalPresentationStyle
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if ((unint64_t)(v9[3] - 1) >= 2) {
    id v3 = [(SUScriptViewController *)self modalPresentationStyleNameFullScreen];
  }
  else {
    id v3 = [(SUScriptViewController *)self modalPresentationStyleNameFormSheet];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __48__SUScriptViewController_modalPresentationStyle__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "modalPresentationStyle");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SUScriptViewController)modalViewController
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__12;
  uint64_t v17 = __Block_byref_object_dispose__12;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __45__SUScriptViewController_modalViewController__block_invoke;
  uint64_t v10 = &unk_264812E70;
  uint64_t v11 = self;
  long long v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __45__SUScriptViewController_modalViewController__block_invoke, &unk_264812E70, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __45__SUScriptViewController_modalViewController__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "presentedViewController"), "copyScriptViewController");
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
  uint64_t v11 = a1;
  id v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "invocationBatch:", 0), "copyQueuedInvocationsForObject:", *(void *)(a1 + 32));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = (const char *)[v8 selector];
        if (sel_isEqual(v9, sel__dismissModalViewControllerAnimated_)
          || sel_isEqual(v9, sel__dismissModalViewControllerWithTransition_))
        {
          [v2 removeLastObject];
        }
        else if (sel_isEqual(v9, sel__presentModalViewController_withTransition_))
        {
          uint64_t v12 = 0;
          [v8 getArgument:&v12 atIndex:2];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v2 addObject:v12];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v10 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v10;
    }
    while (v10);
  }

  *(void *)(*(void *)(*(void *)(v11 + 40) + 8) + 40) = (id)[v2 lastObject];
}

- (SUScriptNavigationController)navigationController
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__12;
  uint64_t v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __46__SUScriptViewController_navigationController__block_invoke, &unk_264812E48, self, &v8);
    id v3 = (void *)v9[5];
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __46__SUScriptViewController_navigationController__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "navigationController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v2 copyScriptViewController];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(SUScriptNavigationController);
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v4 setNativeViewController:v2];
  }
  return result;
}

- (SUScriptNavigationItem)navigationItem
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__12;
  uint64_t v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (SUScriptNavigationItem *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __40__SUScriptViewController_navigationItem__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __40__SUScriptViewController_navigationItem__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "navigationItemForScriptInterface");
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [[SUScriptNavigationItem alloc] initWithNativeNavigationItem:result];
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return [v3 checkInScriptObject:v4];
  }
  return result;
}

- (SUScriptPopOver)popOver
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3052000000;
  long long v16 = __Block_byref_object_copy__12;
  uint64_t v17 = __Block_byref_object_dispose__12;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __33__SUScriptViewController_popOver__block_invoke;
  uint64_t v10 = &unk_264812E48;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __33__SUScriptViewController_popOver__block_invoke, &unk_264812E48, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = (SUScriptPopOver *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __33__SUScriptViewController_popOver__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "_popoverController"), "copyScriptPopOver");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptViewController)presentingViewController
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__12;
  uint64_t v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  if (v9[5])
  {
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v6, 3221225472, __50__SUScriptViewController_presentingViewController__block_invoke, &unk_264812E70, self, &v8);
    id v3 = (void *)v9[5];
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __50__SUScriptViewController_presentingViewController__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "presentingViewController"), "copyScriptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (SUScriptSection)section
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy__12;
  uint64_t v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (SUScriptSection *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __33__SUScriptViewController_section__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

SUScriptSection *__33__SUScriptViewController_section__block_invoke(uint64_t a1)
{
  uint64_t result = (SUScriptSection *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "section");
  if (result)
  {
    uint64_t result = [[SUScriptSection alloc] initWithNativeSection:result];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  id v3 = [(SUScriptViewController *)self newScriptColorWithValue:a3];
  if (v3)
  {
    uint64_t v4 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

void __45__SUScriptViewController_setBackgroundColor___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v5 = (id)[v2 copyScriptProperties];
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
    [v2 setScriptProperties:v5];
  }
  else if ([v2 isViewLoaded])
  {
    id v3 = (void *)[v2 view];
    uint64_t v4 = [*(id *)(a1 + 40) nativeColor];
    [v3 setBackgroundColor:v4];
  }
}

- (void)setInputAccessoryViewController:(id)a3
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
    id v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __58__SUScriptViewController_setInputAccessoryViewController___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = [*(id *)(a1 + 40) nativeViewController];
    return [v2 setInputAccessoryViewController:v4];
  }
  return result;
}

- (void)setModalPresentationStyle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
LABEL_6:
    objc_msgSend(v5, "isEqualToString:", -[SUScriptViewController modalPresentationStyleNameFormSheet](self, "modalPresentationStyleNameFormSheet"));
    WebThreadRunOnMainThread();
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
  uint64_t v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

uint64_t __52__SUScriptViewController_setModalPresentationStyle___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  if (result == 1)
  {
    id v3 = (void *)[*(id *)(a1 + 32) nativeViewController];
    return [v3 setModalPresentationStyle:2];
  }
  return result;
}

uint64_t __52__SUScriptViewController_setModalPresentationStyle___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) nativeViewController];

  return [v1 setModalPresentationStyle:0];
}

- (void)setSection:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __37__SUScriptViewController_setSection___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  id v3 = (void *)[v2 tabBarController];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    uint64_t v5 = [*(id *)(a1 + 40) identifier];
    return [v3 pushTransientViewController:v2 onSectionWithIdentifier:v5];
  }
  return result;
}

- (void)setShowsLibraryButton:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    id v3 = (void *)MEMORY[0x263F1FA90];
    [v3 throwException:@"Invalid argument"];
  }
}

uint64_t __48__SUScriptViewController_setShowsLibraryButton___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = [*(id *)(a1 + 40) BOOLValue];
    return [v2 setShowsLibraryButton:v4];
  }
  return result;
}

- (void)setToolbarItems:(id)a3
{
}

- (void)setTopBackgroundColor:(id)a3
{
  id v3 = [(SUScriptViewController *)self newScriptColorWithValue:a3];
  if (v3)
  {
    uint64_t v4 = v3;
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

void __48__SUScriptViewController_setTopBackgroundColor___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (id)[v2 copyScriptProperties];
    objc_msgSend(v3, "setTopExtensionColor:", objc_msgSend(*(id *)(a1 + 40), "nativeColor"));
    [v2 setScriptProperties:v3];
  }
}

- (void)setTransientViewController:(id)a3
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
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __53__SUScriptViewController_setTransientViewController___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v2 = (void *)[v2 tabBarController];
  }
  uint64_t v3 = [*(id *)(a1 + 40) nativeViewController];

  return [v2 setTransientViewController:v3];
}

- (void)setUsesBlurredBackground:(id)a3
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

void __51__SUScriptViewController_setUsesBlurredBackground___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (id)[v2 copyScriptProperties];
    objc_msgSend(v3, "setUsesBlurredBackground:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
    [v2 setScriptProperties:v3];
  }
}

- (id)showsLibraryButton
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    id v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    id v2 = (void **)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __44__SUScriptViewController_showsLibraryButton__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [v2 showsLibraryButton];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (SUScriptSplitViewController)splitViewController
{
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3052000000;
  long long v16 = __Block_byref_object_copy__12;
  uint64_t v17 = __Block_byref_object_dispose__12;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __45__SUScriptViewController_splitViewController__block_invoke;
  uint64_t v10 = &unk_264812E70;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __45__SUScriptViewController_splitViewController__block_invoke, &unk_264812E70, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = (SUScriptSplitViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __45__SUScriptViewController_splitViewController__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "storeSplitViewController"), "copyScriptViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
  }
}

- (id)toolbarItems
{
  id v2 = (void *)[MEMORY[0x263EFF980] array];
  WebThreadRunOnMainThread();
  return v2;
}

uint64_t __38__SUScriptViewController_toolbarItems__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "toolbarItems");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = objc_alloc_init(SUScriptButton);
        [(SUScriptButton *)v8 setNativeButton:v7];
        [*(id *)(a1 + 40) addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (id)topBackgroundColor
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__12;
  long long v12 = __Block_byref_object_dispose__12;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  id v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __44__SUScriptViewController_topBackgroundColor__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __44__SUScriptViewController_topBackgroundColor__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)[v2 copyScriptProperties];
    id v4 = (id)[v3 topExtensionColor];

    if (v4)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [SUScriptColor alloc];
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8)+ 40) initWithUIColor:v4];
    }
  }
}

- (SUScriptViewController)transientViewController
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  long long v16 = __Block_byref_object_copy__12;
  uint64_t v17 = __Block_byref_object_dispose__12;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  long long v9 = __49__SUScriptViewController_transientViewController__block_invoke;
  uint64_t v10 = &unk_264812E48;
  long long v11 = self;
  long long v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __49__SUScriptViewController_transientViewController__block_invoke, &unk_264812E48, v11, &v13), (id v3 = (void *)v14[5]) != 0))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __49__SUScriptViewController_transientViewController__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v2 = (void *)[v2 tabBarController];
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(v2, "transientViewController"), "copyScriptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)usesBlurredBackground
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    id v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    id v2 = (void **)MEMORY[0x263EFFB38];
  }
  id v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

void __47__SUScriptViewController_usesBlurredBackground__block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) nativeViewController];
  if (objc_opt_respondsToSelector())
  {
    id v3 = (id)[v2 copyScriptProperties];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 usesBlurredBackground];
  }
}

- (id)wantsFullScreenLayout
{
  return (id)*MEMORY[0x263EFFB38];
}

- (NSString)modalPresentationStyleNameFormSheet
{
  return (NSString *)@"formsheet";
}

- (NSString)modalPresentationStyleNameFullScreen
{
  return (NSString *)@"fullscreen";
}

- (void)_dismissModalViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUScriptViewController *)self nativeViewController];
  uint64_t v6 = [(UIViewController *)v5 tabBarController];
  if ([(UITabBarController *)v6 transientViewController]
    && [(UIViewController *)v5 isDescendantOfViewController:[(UITabBarController *)v6 transientViewController]])
  {
    uint64_t v7 = (void *)[MEMORY[0x263F1CB68] transitionSafePerformer:v6];
    [v7 setTransientViewController:0 animated:v3];
  }
  else
  {
    char v8 = [(SUScriptObject *)self clientInterface];
    if (v5)
    {
      long long v9 = v5;
      while (1)
      {
        NSSelectorFromString(&cfstr_Embeddedparent.isa);
        if (objc_opt_respondsToSelector()) {
          break;
        }
        long long v9 = [(UIViewController *)v9 parentViewController];
        if (!v9)
        {
          long long v9 = v5;
          break;
        }
      }
    }
    else
    {
      long long v9 = 0;
    }
    uint64_t v10 = (void *)[MEMORY[0x263F1CB68] transitionSafePerformer:v9];
    if (v8)
    {
      [(SUClientInterface *)v8 _dismissViewControllerFromViewController:v10 animated:v3 completion:0];
    }
    else
    {
      [v10 dismissViewControllerAnimated:v3 completion:0];
    }
  }
}

- (void)_dismissModalViewControllerWithTransition:(id)a3
{
  uint64_t v5 = [(SUScriptObject *)self clientInterface];
  uint64_t v6 = objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", -[SUScriptViewController nativeViewController](self, "nativeViewController"));
  uint64_t v7 = [(SUScriptViewController *)self _transitionForString:a3];
  if (v5)
  {
    [(SUClientInterface *)v5 _dismissModalViewControllerFromViewController:v6 withTransition:v7];
  }
  else
  {
    [v6 dismissModalViewControllerWithTransition:v7];
  }
}

- (void)_presentModalViewController:(id)a3 withTransition:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = [(SUScriptViewController *)self nativeViewController];
  if ([(UIViewController *)v7 parentViewController])
  {
    char v8 = (void *)[a3 nativeViewController];
    if (v8)
    {
      long long v9 = v8;
      if ([v8 presentingViewController])
      {
        uint64_t v10 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        int v11 = [v10 shouldLog];
        if ([v10 shouldLogToDisk]) {
          int v12 = v11 | 2;
        }
        else {
          int v12 = v11;
        }
        if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v12 &= 2u;
        }
        if (v12)
        {
LABEL_24:
          int v34 = 138412546;
          id v35 = [(SUScriptViewController *)self _className];
          __int16 v36 = 2112;
          id v37 = a3;
          LODWORD(v24) = 22;
          uint64_t v19 = _os_log_send_and_compose_impl();
          if (v19)
          {
            v20 = (void *)v19;
            objc_msgSend(NSString, "stringWithCString:encoding:", v19, 4, &v34, v24);
            free(v20);
            SSFileLog();
          }
        }
      }
      else
      {
        long long v21 = [(SUScriptObject *)self clientInterface];
        uint64_t v22 = [MEMORY[0x263F1CB68] transitionSafePerformer:v7];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        long long v27 = __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke;
        long long v28 = &unk_2648135F8;
        v29 = v21;
        v30 = v9;
        uint64_t v31 = v22;
        v32 = self;
        id v33 = a4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (long long v23 = (void *)[v9 firstViewController],
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) != 0))
        {
          [v9 setNavigationBarHidden:1];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke_2;
          v25[3] = &unk_264813620;
          v25[4] = v26;
          [v23 prepareWithCompletionBlock:v25];
        }
        else
        {
          v27(v26);
        }
      }
    }
    else
    {
      long long v16 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v18 &= 2u;
      }
      if (v18) {
        goto LABEL_24;
      }
    }
  }
  else
  {
    uint64_t v13 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v15 &= 2u;
    }
    if (v15) {
      goto LABEL_24;
    }
  }
}

uint64_t __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  BOOL v3 = (void *)a1[7];
  uint64_t v4 = a1[8];
  if (v2)
  {
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = [v3 _transitionForString:v4];
    return [v2 _presentViewController:v5 fromViewController:v6 withTransition:v7];
  }
  else
  {
    uint64_t v10 = a1[5];
    long long v9 = (void *)a1[6];
    uint64_t v11 = [v3 _transitionForString:v4];
    return [v9 presentModalViewController:v10 withTransition:v11];
  }
}

uint64_t __69__SUScriptViewController__presentModalViewController_withTransition___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (int)_transitionForString:(id)a3
{
  if ([a3 isEqualToString:@"show-sheet"]) {
    return 8;
  }
  if (([a3 isEqualToString:@"hide-sheet"] & 1) != 0
    || ([a3 isEqualToString:@"reveal-down"] & 1) != 0)
  {
    return 9;
  }
  if ([a3 isEqualToString:@"cover-up"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"flip-from-left"]) {
    return 10;
  }
  if ([a3 isEqualToString:@"flip-from-right"]) {
    return 11;
  }
  if ([a3 isEqualToString:@"cross-dissolve"]) {
    return 6;
  }
  return 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_20, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_15, 7);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptViewController;
  id v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_20 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_15 = (uint64_t)sel_addPassbookPassWithURL_;
    unk_2681B4AA0 = @"addPassbookPassWithURL";
    qword_2681B4AA8 = (uint64_t)sel_dismissModalViewControllerWithTransition_;
    unk_2681B4AB0 = @"dismissModalViewController";
    qword_2681B4AB8 = (uint64_t)sel_presentModalViewController_withTransition_;
    unk_2681B4AC0 = @"presentModalViewController";
    qword_2681B4AC8 = (uint64_t)sel_runScrollTest_withDelta_forIterations_;
    unk_2681B4AD0 = @"runScrollTest";
    qword_2681B4AD8 = (uint64_t)sel_setToolbarItems_animated_;
    unk_2681B4AE0 = @"setToolbarItems";
    qword_2681B4AE8 = (uint64_t)sel_dismissVolumeViewControllerAnimated_;
    unk_2681B4AF0 = @"dismissVolumeViewController";
    qword_2681B4AF8 = (uint64_t)sel_presentVolumeViewController_animated_;
    unk_2681B4B00 = @"presentVolumeViewController";
    __KeyMapping_20 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"backgroundColor", @"clientContext", @"contextDictionary", @"inputAccessoryViewController", @"inputAccessoryViewController", @"modalPresentationStyle", @"modalPresentationStyle", @"modalViewController", @"modalViewController", @"navigationController", @"navigationController", @"navigationItem", @"navigationItem", @"popOver", @"popOver", @"presentingViewController", @"presentingViewController",
                        @"section",
                        @"section",
                        @"showsLibraryButton",
                        @"showsLibraryButton",
                        @"splitViewController",
                        @"splitViewController",
                        @"toolbarItems",
                        @"toolbarItems",
                        @"topBackgroundColor",
                        @"topBackgroundColor",
                        @"transientViewController",
                        @"transientViewController",
                        @"wantsFullScreenLayout",
                        @"wantsFullScreenLayout",
                        @"usesBlurredBackground",
                        @"usesBlurredBackground",
                        @"volumeViewController",
                        @"volumeViewController",
                        @"MODAL_FORM_SHEET",
                        @"modalPresentationStyleNameFormSheet",
                        @"MODAL_FULL_SCREEN",
                        @"modalPresentationStyleNameFullScreen",
                        0);
  }
}

- (SUScriptViewController)volumeViewController
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3052000000;
  long long v16 = __Block_byref_object_copy__32;
  int v17 = __Block_byref_object_dispose__32;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  long long v9 = __75__SUScriptViewController_SUScriptVolumeViewAdditions__volumeViewController__block_invoke;
  uint64_t v10 = &unk_264812E48;
  uint64_t v11 = self;
  int v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __75__SUScriptViewController_SUScriptVolumeViewAdditions__volumeViewController__block_invoke, &unk_264812E48, v11, &v13), (BOOL v3 = (void *)v14[5]) != 0))
  {
    objc_super v4 = v3;
  }
  else
  {
    objc_super v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __75__SUScriptViewController_SUScriptVolumeViewAdditions__volumeViewController__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_parentViewControllerForVolumeViewController"), "footerViewController"), "copyScriptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)dismissVolumeViewControllerAnimated:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __91__SUScriptViewController_SUScriptVolumeViewAdditions__dismissVolumeViewControllerAnimated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (void *)[*(id *)(a1 + 32) _parentViewControllerForVolumeViewController];
  if ([v2 footerViewController])
  {
    uint64_t v3 = [*(id *)(a1 + 40) BOOLValue];
    return [v2 dismissFooterViewControllerAnimated:v3];
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    uint64_t result = os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEFAULT);
    if (!result) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v10 = 138412290;
      uint64_t v11 = objc_opt_class();
      LODWORD(v9) = 12;
      uint64_t result = _os_log_send_and_compose_impl();
      if (result)
      {
        uint64_t v8 = (void *)result;
        objc_msgSend(NSString, "stringWithCString:encoding:", result, 4, &v10, v9);
        free(v8);
        return SSFileLog();
      }
    }
  }
  return result;
}

- (void)presentVolumeViewController:(id)a3 animated:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_respondsToSelector()))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F1FA90];
    [v5 throwException:@"Invalid argument"];
  }
}

uint64_t __92__SUScriptViewController_SUScriptVolumeViewAdditions__presentVolumeViewController_animated___block_invoke(id *a1)
{
  uint64_t result = [a1[4] _parentViewControllerForVolumeViewController];
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = [a1[5] nativeViewController];
    uint64_t v5 = [a1[6] BOOLValue];
    return [v3 presentFooterViewController:v4 animated:v5];
  }
  return result;
}

- (id)_parentViewControllerForVolumeViewController
{
  id v2 = [(SUScriptViewController *)self nativeViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = (UIViewController *)[(UIViewController *)v2 selectedNavigationController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = (UIViewController *)[(UIViewController *)v2 topViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

@end