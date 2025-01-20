@interface SUScriptNavigationController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (BOOL)navigationBarHidden;
- (SUScriptNavigationBar)navigationBar;
- (SUScriptNavigationController)initWithRootScriptViewController:(id)a3 clientInterface:(id)a4;
- (SUScriptViewController)topViewController;
- (id)_className;
- (id)_copyNativeViewControllersFromScriptViewControllers:(id)a3;
- (id)_filteredViewControllers;
- (id)_navigationController;
- (id)newNativeViewController;
- (id)scriptAttributeKeys;
- (id)toolbarHidden;
- (id)viewControllers;
- (void)_popToRootViewControllerAnimated:(BOOL)a3;
- (void)_popViewControllerAnimated:(BOOL)a3;
- (void)_pushViewController:(id)a3 animated:(BOOL)a4;
- (void)_setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)didPerformBatchedInvocations;
- (void)popToRootViewControllerAnimated:(BOOL)a3;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setNavigationBar:(id)a3;
- (void)setNavigationBarHidden:(BOOL)a3;
- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setToolbarHidden:(id)a3;
- (void)setTopViewController:(id)a3;
- (void)setViewControllers:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)willPerformBatchedInvocations;
@end

@implementation SUScriptNavigationController

- (SUScriptNavigationController)initWithRootScriptViewController:(id)a3 clientInterface:(id)a4
{
  v4 = [(SUScriptObject *)self init];
  if (v4) {
    WebThreadRunOnMainThread();
  }
  return v4;
}

void __81__SUScriptNavigationController_initWithRootScriptViewController_clientInterface___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) nativeViewController];
  if (v2)
  {
    v3 = (void *)v2;
    v12 = [[SUNavigationController alloc] initWithRootViewController:v2];
    [(SUNavigationController *)v12 setClientInterface:*(void *)(a1 + 48)];
    -[SUNavigationController setModalPresentationStyle:](v12, "setModalPresentationStyle:", [v3 modalPresentationStyle]);
    [*(id *)(a1 + 40) setNativeViewController:v12];
  }
  else
  {
    v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
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
      uint64_t v7 = [*(id *)(a1 + 40) _className];
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      LODWORD(v11) = 22;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v13, v11);
        free(v10);
        SSFileLog();
      }
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationController;
  [(SUScriptViewController *)&v3 dealloc];
}

- (id)newNativeViewController
{
  objc_super v3 = objc_alloc_init(SUNavigationController);
  [(SUNavigationController *)v3 setClientInterface:[(SUScriptObject *)self clientInterface]];
  return v3;
}

- (void)didPerformBatchedInvocations
{
  self->_navController = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationController;
  [(SUScriptObject *)&v3 didPerformBatchedInvocations];
}

- (void)willPerformBatchedInvocations
{
  self->_navController = 0;
  self->_navController = (UINavigationController *)[(SUScriptNavigationController *)self _navigationController];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationController;
  [(SUScriptObject *)&v3 willPerformBatchedInvocations];
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];

  [v4 _popToRootViewControllerAnimated:v3];
}

- (void)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];

  [v4 _popViewControllerAnimated:v3];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];

  [v6 _pushViewController:a3 animated:v4];
}

- (void)setNavigationBarHidden:(BOOL)a3 animated:(BOOL)a4
{
}

uint64_t __64__SUScriptNavigationController_setNavigationBarHidden_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", objc_msgSend(*(id *)(a1 + 32), "_navigationController"));
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);

  return [v2 setNavigationBarHidden:v3 animated:v4];
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
}

uint64_t __58__SUScriptNavigationController_setToolbarHidden_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", objc_msgSend(*(id *)(a1 + 32), "_navigationController"));
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);

  return [v2 setToolbarHidden:v3 animated:v4];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = (id)[a3 copyArrayValueWithValidator:SUISAValidator context:objc_opt_class()];
    if ([v8 count]) {
      objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_setViewControllers:animated:", v8, v4);
    }
    else {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (id)_className
{
  return @"iTunesNavigationController";
}

- (SUScriptNavigationBar)navigationBar
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__14;
  uint64_t v17 = __Block_byref_object_dispose__14;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __45__SUScriptNavigationController_navigationBar__block_invoke;
  v10 = &unk_264812E48;
  uint64_t v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __45__SUScriptNavigationController_navigationBar__block_invoke, &unk_264812E48, v11, &v13), (uint64_t v3 = (void *)v14[5]) != 0))
  {
    BOOL v4 = v3;
  }
  else
  {
    BOOL v4 = (SUScriptNavigationBar *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v7, v8, v9, v10, v11, v12);
  }
  int v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

SUScriptNavigationBar *__45__SUScriptNavigationController_navigationBar__block_invoke(uint64_t a1)
{
  result = (SUScriptNavigationBar *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_navigationController"), "navigationBar");
  if (result)
  {
    result = [[SUScriptNavigationBar alloc] initWithNativeNavigationBar:result];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)navigationBarHidden
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  WebThreadRunOnMainThread();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __51__SUScriptNavigationController_navigationBarHidden__block_invoke(uint64_t a1)
{
  char v2 = (void *)[*(id *)(a1 + 32) _navigationController];
  if (v2) {
    uint64_t result = [v2 isNavigationBarHidden];
  }
  else {
    uint64_t result = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setNavigationBar:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"navigationBar"];

  [v3 throwException:v4];
}

- (void)setNavigationBarHidden:(BOOL)a3
{
}

- (void)setToolbarHidden:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a3 BOOLValue];
    [(SUScriptNavigationController *)self setToolbarHidden:v5 animated:0];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

- (void)setTopViewController:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F1FA90];
  uint64_t v4 = [NSString stringWithFormat:@"%@ is readonly", @"topViewController"];

  [v3 throwException:v4];
}

- (void)setViewControllers:(id)a3
{
}

- (id)toolbarHidden
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  WebThreadRunOnMainThread();
  if (*((unsigned char *)v6 + 24)) {
    char v2 = (void **)MEMORY[0x263EFFB40];
  }
  else {
    char v2 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __45__SUScriptNavigationController_toolbarHidden__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_navigationController"), "isToolbarHidden");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SUScriptViewController)topViewController
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__14;
  uint64_t v17 = __Block_byref_object_dispose__14;
  uint64_t v18 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __49__SUScriptNavigationController_topViewController__block_invoke;
  v10 = &unk_264812E48;
  uint64_t v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __49__SUScriptNavigationController_topViewController__block_invoke, &unk_264812E48, v11, &v13), (uint64_t v3 = (void *)v14[5]) != 0))
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

uint64_t __49__SUScriptNavigationController_topViewController__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_filteredViewControllers"), "lastObject"), "copyScriptViewController");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)viewControllers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3, v5, 3221225472, __47__SUScriptNavigationController_viewControllers__block_invoke, &unk_264812158, self, v3);
  return v3;
}

uint64_t __47__SUScriptNavigationController_viewControllers__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v2 = (void *)[*(id *)(a1 + 32) _filteredViewControllers];
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
        uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) copyScriptViewController];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          [*(id *)(a1 + 40) addObject:v7];
        }
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

- (void)_popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", -[SUScriptNavigationController _navigationController](self, "_navigationController"));

  [v4 popToRootViewControllerAnimated:v3];
}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", -[SUScriptNavigationController _navigationController](self, "_navigationController"));

  [v4 popViewControllerAnimated:v3];
}

- (void)_pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a3 nativeViewController];
  if (v7)
  {
    uint64_t v14 = [[SUNavigationContainerViewController alloc] initWithChildViewController:v7];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", -[SUScriptNavigationController _navigationController](self, "_navigationController")), "pushViewController:animated:", v14, v4);
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v10 &= 2u;
    }
    if (v10)
    {
      int v15 = 138412546;
      id v16 = [(SUScriptNavigationController *)self _className];
      __int16 v17 = 2112;
      id v18 = a3;
      LODWORD(v13) = 22;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        long long v12 = (void *)v11;
        objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v15, v13);
        free(v12);
        SSFileLog();
      }
    }
  }
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [(SUScriptNavigationController *)self _copyNativeViewControllersFromScriptViewControllers:a3];
  if ([v8 count])
  {
    id v6 = [(SUScriptNavigationController *)self _navigationController];
    uint64_t v7 = (void *)[v8 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v7, "setSection:", objc_msgSend(v6, "section"));
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:", v6), "setViewControllers:animated:", v8, v4);
  }
}

- (id)_copyNativeViewControllersFromScriptViewControllers:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) nativeViewController];
        if (v9) {
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)_filteredViewControllers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_msgSend((id)objc_msgSend(-[SUScriptNavigationController _navigationController](self, "_navigationController"), "viewControllers"), "mutableCopy");
  long long v14 = self;
  id v4 = objc_msgSend(-[SUScriptObject invocationBatch:](self, "invocationBatch:", 0), "copyQueuedInvocationsForObject:", self);
  if ([v4 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = [v3 count];
          long long v11 = (const char *)[v9 selector];
          if (sel_isEqual(v11, sel__popToRootViewControllerAnimated_))
          {
            if (v10 >= 2) {
              objc_msgSend(v3, "removeObjectsInRange:", 1, v10 - 1);
            }
          }
          else if (sel_isEqual(v11, sel__popViewControllerAnimated_))
          {
            if (v10 >= 2) {
              [v3 removeLastObject];
            }
          }
          else if (sel_isEqual(v11, sel__pushViewController_animated_))
          {
            id v15 = 0;
            [v9 getArgument:&v15 atIndex:2];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              objc_msgSend(v3, "addObject:", objc_msgSend(v15, "nativeViewController"));
            }
          }
          else if (sel_isEqual(v11, sel__setViewControllers_animated_))
          {
            id v15 = 0;
            [v9 getArgument:&v15 atIndex:2];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = [(SUScriptNavigationController *)v14 _copyNativeViewControllersFromScriptViewControllers:v15];
              [v3 setArray:v12];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }

  return v3;
}

- (id)_navigationController
{
  navController = self->_navController;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    navController = [(SUScriptViewController *)self nativeViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return navController;
  }

  return (id)[(UINavigationController *)navController navigationController];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_22, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_17, 6);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptNavigationController;
  id v2 = [(SUScriptViewController *)&v4 scriptAttributeKeys];
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_22, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_17 = (uint64_t)sel_popToRootViewControllerAnimated_;
    unk_2681B4B60 = @"popToRootViewController";
    qword_2681B4B68 = (uint64_t)sel_popViewControllerAnimated_;
    unk_2681B4B70 = @"popViewController";
    qword_2681B4B78 = (uint64_t)sel_pushViewController_animated_;
    unk_2681B4B80 = @"pushViewController";
    qword_2681B4B88 = (uint64_t)sel_setNavigationBarHidden_animated_;
    unk_2681B4B90 = @"setNavigationBarHidden";
    qword_2681B4B98 = (uint64_t)sel_setToolbarHidden_animated_;
    unk_2681B4BA0 = @"setToolbarHidden";
    qword_2681B4BA8 = (uint64_t)sel_setViewControllers_animated_;
    unk_2681B4BB0 = @"setViewControllers";
    __KeyMapping_22 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"navigationBar", @"navigationBarHidden", @"navigationBarHidden", @"toolbarHidden", @"toolbarHidden", @"topViewController", @"topViewController", @"viewControllers", @"viewControllers", 0);
  }
}

@end