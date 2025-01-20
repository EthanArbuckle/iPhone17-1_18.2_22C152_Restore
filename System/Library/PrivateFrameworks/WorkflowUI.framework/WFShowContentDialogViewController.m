@interface WFShowContentDialogViewController
- (BOOL)hasCustomHomeGestureBehavior;
- (BOOL)shouldHideSashView;
- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5;
- (UIViewController)containerViewController;
- (WFCompactContentPreviewViewController)previewViewController;
- (WFCompactHighlightedView)highlightView;
- (WFContentCollection)dataSource;
- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4;
- (double)contentHeightWithPreferredHeight:(double)a3 maxVisibleHeight:(double)a4;
- (double)targetHeightForAnimatingPreviewViewController:(id)a3 toProposedHeight:(double)a4;
- (id)installThumbnailHandler;
- (id)sourceViewForQuickLook;
- (void)askContainerForHomeGestureUpdate;
- (void)handleTapGesture:(id)a3;
- (void)homeGestureDidPassThreshold;
- (void)loadView;
- (void)prepareForPresentationWithCompletionHandler:(id)a3;
- (void)presentFullScreenPreview;
- (void)previewControllerWillDismiss:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setInstallThumbnailHandler:(id)a3;
- (void)setPreviewViewController:(id)a3;
- (void)updateActions;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation WFShowContentDialogViewController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_installThumbnailHandler, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_previewViewController, 0);
  objc_destroyWeak((id *)&self->_highlightView);
  objc_storeStrong((id *)&self->_containerViewController, 0);
}

- (void)setInstallThumbnailHandler:(id)a3
{
}

- (id)installThumbnailHandler
{
  return self->_installThumbnailHandler;
}

- (void)setDataSource:(id)a3
{
}

- (WFContentCollection)dataSource
{
  return self->_dataSource;
}

- (void)setPreviewViewController:(id)a3
{
}

- (WFCompactContentPreviewViewController)previewViewController
{
  return self->_previewViewController;
}

- (void)setHighlightView:(id)a3
{
}

- (WFCompactHighlightedView)highlightView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightView);
  return (WFCompactHighlightedView *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (UIViewController)containerViewController
{
  return self->_containerViewController;
}

- (BOOL)shouldHideSashView
{
  if ([MEMORY[0x263EFFA40] universalPreviewsEnabled])
  {
    v3 = [(WFShowContentDialogViewController *)self previewViewController];
    v4 = [v3 contentItem];
    char v5 = [v4 conformsToContentItemPreviewProviding];

    if (v5) {
      return 1;
    }
  }
  v7 = [(WFShowContentDialogViewController *)self previewViewController];
  char v8 = [v7 containsImageOrMediaThumbnail];

  return v8;
}

- (void)homeGestureDidPassThreshold
{
  v3 = [(WFShowContentDialogViewController *)self presentedViewController];

  if (v3)
  {
    [(WFShowContentDialogViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)hasCustomHomeGestureBehavior
{
  v2 = [(WFShowContentDialogViewController *)self presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)askContainerForHomeGestureUpdate
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFBannerShouldUpdateHomeGestureOwnershipNotification" object:0];
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v6 = [(WFShowContentDialogViewController *)self sourceViewForQuickLook];
  *a5 = v6;
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)sourceViewForQuickLook
{
  BOOL v3 = [(WFShowContentDialogViewController *)self previewViewController];
  if ([v3 contentAllowsScrolling])
  {
    v4 = [(WFCompactPlatterViewController *)self platterView];
    [v4 clippingContentView];
  }
  else
  {
    v4 = [(WFShowContentDialogViewController *)self previewViewController];
    [v4 sourceViewForQuickLook];
  char v5 = };

  return v5;
}

- (void)previewControllerWillDismiss:(id)a3
{
  [(WFShowContentDialogViewController *)self askContainerForHomeGestureUpdate];
  id v4 = [(WFShowContentDialogViewController *)self containerViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (double)targetHeightForAnimatingPreviewViewController:(id)a3 toProposedHeight:(double)a4
{
  [(WFCompactPlatterViewController *)self maximumExpectedVisibleContentHeight];
  [(WFShowContentDialogViewController *)self contentHeightWithPreferredHeight:a4 maxVisibleHeight:v6];
  return result;
}

- (void)presentFullScreenPreview
{
  BOOL v3 = [(WFShowContentDialogViewController *)self dataSource];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F82E10]);
    [v4 setModalPresentationStyle:5];
    objc_storeStrong((id *)&self->_containerViewController, v4);
    char v5 = [(WFShowContentDialogViewController *)self dataSource];
    id v6 = objc_alloc_init(MEMORY[0x263F865F0]);
    [v6 setDelegate:self];
    [v6 setDataSource:v5];
    [v6 setModalPresentationStyle:5];
    [v6 setOverrideParentApplicationDisplayIdentifier:*MEMORY[0x263F85610]];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    double v7 = [v5 items];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke;
    v13[3] = &unk_2649CBA60;
    v13[4] = &v18;
    v13[5] = &v14;
    [v7 enumerateObjectsUsingBlock:v13];

    [v6 setIsContentManaged:v15[3] > v19[3]];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke_2;
    v10[3] = &unk_2649CC068;
    v10[4] = self;
    id v8 = v4;
    id v11 = v8;
    id v9 = v6;
    id v12 = v9;
    [(WFShowContentDialogViewController *)self presentViewController:v8 animated:1 completion:v10];

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
}

void __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = [v9 attributionSet];
  int v4 = [v3 isAllowedToBeSentToDestinationWithManagedLevel:1];

  if (v4)
  {
    uint64_t v5 = a1 + 32;
    id v6 = v9;
  }
  else
  {
    double v7 = [v9 attributionSet];
    int v8 = [v7 isAllowedToBeSentToDestinationWithManagedLevel:2];

    id v6 = v9;
    if (!v8) {
      goto LABEL_6;
    }
    uint64_t v5 = a1 + 40;
  }
  ++*(void *)(*(void *)(*(void *)v5 + 8) + 24);
LABEL_6:
}

uint64_t __61__WFShowContentDialogViewController_presentFullScreenPreview__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) askContainerForHomeGestureUpdate];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 presentViewController:v3 animated:1 completion:0];
}

- (void)handleTapGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    [(WFShowContentDialogViewController *)self presentFullScreenPreview];
  }
}

- (void)updateActions
{
  uint64_t v3 = objc_opt_new();
  objc_initWeak(location, self);
  int v4 = [(WFShowContentDialogViewController *)self dataSource];
  uint64_t v5 = [v4 numberOfItems];

  if (v5 >= 2)
  {
    id v6 = (void *)MEMORY[0x263F85268];
    double v7 = NSString;
    int v8 = WFLocalizedString(@"Show All %ld Results");
    id v9 = [(WFShowContentDialogViewController *)self dataSource];
    double v10 = objc_msgSend(v7, "localizedStringWithFormat:", v8, objc_msgSend(v9, "numberOfItems"));
    id v11 = [v6 defaultButtonWithTitle:v10];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __50__WFShowContentDialogViewController_updateActions__block_invoke;
    v23[3] = &unk_2649CBEF8;
    objc_copyWeak(&v24, location);
    id v12 = +[WFCompactDialogAction actionForButton:v11 handler:v23];
    [v3 addObject:v12];

    objc_destroyWeak(&v24);
  }
  double v13 = [(WFCompactDialogViewController *)self request];
  uint64_t v14 = [v13 doneButton];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __50__WFShowContentDialogViewController_updateActions__block_invoke_2;
  v21[3] = &unk_2649CBEF8;
  objc_copyWeak(&v22, location);
  double v15 = +[WFCompactDialogAction actionForButton:v14 handler:v21];
  [v3 addObject:v15];

  uint64_t v16 = [(WFCompactDialogViewController *)self request];
  uint64_t v17 = [v16 cancelButton];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __50__WFShowContentDialogViewController_updateActions__block_invoke_3;
  v19[3] = &unk_2649CBEF8;
  objc_copyWeak(&v20, location);
  uint64_t v18 = +[WFCompactDialogAction actionForButton:v17 handler:v19];
  [v3 addObject:v18];

  [(WFCompactDialogViewController *)self configureActionGroupWithActions:v3];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(location);
}

void __50__WFShowContentDialogViewController_updateActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentFullScreenPreview];
}

void __50__WFShowContentDialogViewController_updateActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)[objc_alloc(MEMORY[0x263F85280]) initWithCancelled:0];
  [WeakRetained finishWithResponse:v1];
}

void __50__WFShowContentDialogViewController_updateActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)[objc_alloc(MEMORY[0x263F85280]) initWithCancelled:1];
  [WeakRetained finishWithResponse:v1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFShowContentDialogViewController;
  [(WFShowContentDialogViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = [(WFShowContentDialogViewController *)self installThumbnailHandler];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    [(WFShowContentDialogViewController *)self setInstallThumbnailHandler:0];
  }
}

- (void)prepareForPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(WFCompactDialogViewController *)self request];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke;
  v13[3] = &unk_2649CB5B8;
  objc_copyWeak(&v17, &location);
  double v15 = v21;
  uint64_t v16 = v19;
  id v6 = v4;
  id v14 = v6;
  [v5 getContentCollectionWithCompletionHandler:v13];

  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_6;
  v9[3] = &unk_2649CB5E0;
  id v12 = v21;
  id v10 = v6;
  id v11 = v19;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_2649CB5B8;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  uint64_t v8 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  [v3 generatePreviewControllerDataSource:v6];

  objc_destroyWeak(&v9);
}

void *__81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_6(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 1;
    return (void *)(*(uint64_t (**)(void))(result[4] + 16))();
  }
  return result;
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_3;
  block[3] = &unk_2649CB590;
  block[4] = WeakRetained;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  uint64_t v11 = *(void *)(a1 + 48);
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v7;
  long long v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) loadViewIfNeeded];
  [*(id *)(a1 + 32) updateActions];
  if ([*(id *)(a1 + 40) numberOfItems])
  {
    id v2 = [*(id *)(a1 + 32) previewViewController];
    id v3 = [*(id *)(a1 + 40) items];
    id v4 = [v3 firstObject];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_4;
    v7[3] = &unk_2649CB568;
    objc_copyWeak(&v10, (id *)(a1 + 72));
    uint64_t v9 = *(void *)(a1 + 64);
    long long v6 = *(_OWORD *)(a1 + 48);
    id v5 = (id)v6;
    long long v8 = v6;
    [v2 setContentItem:v4 completionHandler:v7];

    objc_destroyWeak(&v10);
  }
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_5;
  v9[3] = &unk_2649CBBA0;
  void v9[4] = WeakRetained;
  id v10 = v5;
  long long v7 = (void (**)(void))_Block_copy(v9);
  long long v8 = v7;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if ([WeakRetained isBeingPresented]) {
      [WeakRetained setInstallThumbnailHandler:v8];
    }
    else {
      v8[2](v8);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (a2) {
      [WeakRetained setInstallThumbnailHandler:v7];
    }
    else {
      v7[2](v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  }
}

void __81__WFShowContentDialogViewController_prepareForPresentationWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) highlightView];
  [v2 setUserInteractionEnabled:1];
}

- (double)contentHeightWithPreferredHeight:(double)a3 maxVisibleHeight:(double)a4
{
  long long v6 = [(WFShowContentDialogViewController *)self previewViewController];
  int v7 = [v6 contentAllowsScrolling];

  if (a3 < a4) {
    int v8 = 1;
  }
  else {
    int v8 = v7;
  }
  if (v8) {
    return a3;
  }
  else {
    return a4;
  }
}

- (double)contentHeightForWidth:(double)a3 withMaximumVisibleHeight:(double)a4
{
  int v7 = [(WFShowContentDialogViewController *)self previewViewController];
  [v7 contentHeightForWidth:a3];
  double v9 = v8;

  [(WFShowContentDialogViewController *)self contentHeightWithPreferredHeight:v9 maxVisibleHeight:a4];
  return result;
}

- (void)loadView
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WFShowContentDialogViewController;
  [(WFCompactDialogViewController *)&v21 loadView];
  id v3 = [(WFCompactPlatterViewController *)self platterView];
  [v3 setArrangeActionsVertically:1];
  id v4 = objc_opt_new();
  [v4 setUserInteractionEnabled:0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(WFShowContentDialogViewController *)self setHighlightView:v4];
  id v5 = objc_opt_new();
  [v5 setView:v4];
  [(WFCompactPlatterViewController *)self setContentViewController:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v6 = objc_msgSend(v4, "requiredVisualStyleCategories", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v10) integerValue];
        id v12 = [v3 visualStylingProviderForCategory:v11];
        [v4 setVisualStylingProvider:v12 forCategory:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }

  double v13 = objc_opt_new();
  [v13 setDelegate:self];
  [v5 addChildViewController:v13];
  [(WFShowContentDialogViewController *)self setPreviewViewController:v13];
  id v14 = [v13 view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v14];
  id v15 = (id)objc_msgSend(v14, "wf_addConstraintsToFillSuperview:", v4);
  [v13 didMoveToParentViewController:v5];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTapGesture_];
  [v4 addGestureRecognizer:v16];
  [(WFShowContentDialogViewController *)self updateActions];
}

@end