@interface WFPINEntryViewController
+ (Class)remoteViewControllerClass;
+ (id)serviceViewControllerClassName;
- (BOOL)hasUIWebViewSubView:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (WFPINEntryViewController)initWithURL:(id)a3 pageTitle:(id)a4 completion:(id)a5;
- (id)delegate;
- (id)dismissCompletionHandler;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)insertRemoteViewController:(id)a3;
- (void)presentViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setDismissCompletionHandler:(id)a3;
- (void)userDidCancel;
- (void)userEnteredCorrectPIN;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation WFPINEntryViewController

+ (id)serviceViewControllerClassName
{
  return @"WFServicePINEntryNavigationController";
}

+ (Class)remoteViewControllerClass
{
  return (Class)objc_opt_class();
}

- (WFPINEntryViewController)initWithURL:(id)a3 pageTitle:(id)a4 completion:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)WFPINEntryViewController;
  v9 = [(WFPINEntryViewController *)&v15 initWithNibName:0 bundle:0];
  if (v9)
  {
    if (!a3) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"WFPINEntryViewController.m", 55, @"WFPINEntryViewController: URL cannot be nil");
    }
    v9->_URL = (NSURL *)a3;
    if (!a4) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"WFPINEntryViewController.m", 57, @"WFPINEntryViewController: pageTitle cannot be nil");
    }
    v9->_pageTitle = (NSString *)[a4 copy];
    if (!a5) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"WFPINEntryViewController.m", 59, @"WFPINEntryViewController: completion block cannot be nil");
    }
    v9->_completion = (id)[a5 copy];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke;
    v14[3] = &unk_26429C8A0;
    v14[4] = a5;
    [(WFPINEntryViewController *)v9 _beginDelayingPresentation:v14 cancellationHandler:3.0];
    v10 = (void *)[(id)objc_opt_class() remoteViewControllerClass];
    uint64_t v11 = [(id)objc_opt_class() serviceViewControllerClassName];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke_2;
    v13[3] = &unk_26429C8C8;
    v13[4] = v9;
    v13[5] = a5;
    [v10 requestViewController:v11 fromServiceWithBundleIdentifier:@"com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI" connectionHandler:v13];
  }
  return v9;
}

uint64_t __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, [MEMORY[0x263F087E8] errorWithDomain:@"WFPINEntryErrorDomain" code:0 userInfo:0]);
  }
  return 0;
}

uint64_t __61__WFPINEntryViewController_initWithURL_pageTitle_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    [v4 dismissViewControllerAnimated:0 completion:0];
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v9 = *MEMORY[0x263F08608];
    v10[0] = a3;
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v6 + 16))(v6, 0, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"WFPINEntryErrorDomain", 1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }
  else
  {
    [v4 insertRemoteViewController:a2];
    v8 = *(void **)(a1 + 32);
    return [v8 _endDelayingPresentation];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFPINEntryViewController;
  [(WFPINEntryViewController *)&v3 dealloc];
}

- (void)insertRemoteViewController:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t v5 = 16;
  }
  else {
    uint64_t v5 = 17;
  }
  [(WFPINEntryViewController *)self setModalPresentationStyle:v5];
  [(WFPINEntryViewController *)self view];
  [(WFPINEntryViewController *)self addChildViewController:a3];
  uint64_t v6 = (void *)[a3 view];
  objc_msgSend((id)-[WFPINEntryViewController view](self, "view"), "bounds");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend((id)-[WFPINEntryViewController view](self, "view"), "addSubview:", objc_msgSend(a3, "view"));
  objc_storeWeak((id *)&self->_remoteViewController, a3);
  [objc_loadWeak((id *)&self->_remoteViewController) setDelegate:self];
  [objc_loadWeak((id *)&self->_remoteViewController) setURL:self->_URL];
  id Weak = objc_loadWeak((id *)&self->_remoteViewController);
  pageTitle = self->_pageTitle;
  [Weak setPageTitle:pageTitle];
}

- (void)presentViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)[MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:0 onlyVisibleWindows:1];
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v37 + 1) + 8 * i) rootViewController];
        if (v12) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v9);
  }
  if ([v7 count])
  {
    if ([v7 count] == 1)
    {
      v13 = (UIViewController *)[v7 objectAtIndexedSubscript:0];
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v25 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (!v25) {
        goto LABEL_14;
      }
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
LABEL_29:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v7);
        }
        v13 = *(UIViewController **)(*((void *)&v33 + 1) + 8 * v28);
        if ([(WFPINEntryViewController *)self hasUIWebViewSubView:[(UIViewController *)v13 view]])
        {
          break;
        }
        if (v26 == ++v28)
        {
          uint64_t v26 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v26) {
            goto LABEL_29;
          }
          goto LABEL_14;
        }
      }
    }
    self->_rootViewControllerToUse = v13;
  }
LABEL_14:
  rootViewControllerToUse = self->_rootViewControllerToUse;
  if (rootViewControllerToUse
    && (uint64_t v15 = [(UIViewController *)rootViewControllerToUse view],
        (v16 = (void *)[MEMORY[0x263F1CB68] _viewControllerForFullScreenPresentationFromView:v15]) != 0))
  {
    [v16 presentViewController:self animated:1 completion:0];
  }
  else
  {
    v17 = (_UIFallbackPresentationViewController *)objc_alloc_init(MEMORY[0x263F1CC90]);
    self->_fallbackPresentationVC = v17;
    [(_UIFallbackPresentationViewController *)v17 setRotationDecider:self];
    v18 = (void *)[MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
    v19 = (void *)[MEMORY[0x263EFF980] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v18);
          }
          v24 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ([v24 delegate])
          {
            [v24 beginDisablingInterfaceAutorotation];
            [v19 addObject:v24];
          }
        }
        uint64_t v21 = [v18 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v21);
    }
    self->_windowsWithDisabledRotation = (NSArray *)v19;
    [(_UIFallbackPresentationViewController *)self->_fallbackPresentationVC _presentViewController:self sendingView:0 animated:v4];
  }
}

- (BOOL)hasUIWebViewSubView:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = objc_msgSend(a3, "subviews", 0);
    uint64_t v5 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (!v5) {
      return v5;
    }
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v12;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v6);
      }
      if ([(WFPINEntryViewController *)self hasUIWebViewSubView:*(void *)(*((void *)&v11 + 1) + 8 * v9)])
      {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        LOBYTE(v5) = 0;
        if (v7) {
          goto LABEL_6;
        }
        return v5;
      }
    }
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_fallbackPresentationVC)
  {
    windowsWithDisabledRotation = self->_windowsWithDisabledRotation;
    if (windowsWithDisabledRotation)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v6 = [(NSArray *)windowsWithDisabledRotation countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(windowsWithDisabledRotation);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * v9++) endDisablingInterfaceAutorotation];
          }
          while (v7 != v9);
          uint64_t v7 = [(NSArray *)windowsWithDisabledRotation countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
      self->_windowsWithDisabledRotation = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)WFPINEntryViewController;
  [(WFPINEntryViewController *)&v10 viewDidDisappear:v3];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return a3 == 2;
}

- (id)delegate
{
  return 0;
}

- (void)userEnteredCorrectPIN
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __49__WFPINEntryViewController_userEnteredCorrectPIN__block_invoke;
  v2[3] = &unk_26429C860;
  v2[4] = self;
  [(WFPINEntryViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

uint64_t __49__WFPINEntryViewController_userEnteredCorrectPIN__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[122])
  {
    uint64_t v3 = v1[129];
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v1 = *(void **)(a1 + 32);
    }
  }
  BOOL v4 = *(uint64_t (**)(void))(v1[128] + 16);
  return v4();
}

- (void)userDidCancel
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__WFPINEntryViewController_userDidCancel__block_invoke;
  v2[3] = &unk_26429C860;
  v2[4] = self;
  [(WFPINEntryViewController *)self dismissViewControllerAnimated:1 completion:v2];
}

uint64_t __41__WFPINEntryViewController_userDidCancel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[122])
  {
    uint64_t v3 = v1[129];
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      v1 = *(void **)(a1 + 32);
    }
  }
  uint64_t v4 = v1[128];
  uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:@"WFPINEntryErrorDomain" code:2 userInfo:0];
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 16);
  return v6(v4, 0, v5);
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end