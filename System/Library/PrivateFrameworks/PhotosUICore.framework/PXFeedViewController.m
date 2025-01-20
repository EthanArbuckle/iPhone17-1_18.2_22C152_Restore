@interface PXFeedViewController
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5;
- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4;
- (BOOL)handleSelectActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4;
- (BOOL)isActive;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXExpectation)nextViewDidAppearExpectation;
- (PXFeedActionPerformer)actionPerformer;
- (PXFeedChromeController)chromeController;
- (PXFeedConfiguration)configuration;
- (PXFeedView)feedView;
- (PXFeedViewController)init;
- (PXFeedViewController)initWithCoder:(id)a3;
- (PXFeedViewController)initWithConfiguration:(id)a3;
- (PXFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXFeedViewControllerTabBarTransitionDelegate)tabBarTransitionDelegate;
- (PXFeedViewModel)viewModel;
- (PXProgrammaticNavigationDestination)px_navigationDestination;
- (PXSectionedObjectReference)navigatedObjectReference;
- (PXUpdater)updater;
- (UIScrollView)ppt_scrollView;
- (UIView)placeholderView;
- (id)_objectReferenceForDestination:(id)a3;
- (id)_targetedPreviewForObjectReference:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)nextExistingParticipantOnRouteToDestination:(id)a3;
- (id)onTransitionEnd;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_checkCanNavigate:(BOOL *)a3 toDestination:(id)a4 iterator:(id)a5;
- (void)_handleCanNavigate:(BOOL)a3 toDestination:(id)a4 objectReference:(id)a5 completionHandler:(id)a6;
- (void)_handleScrollViewTap:(id)a3;
- (void)_ifDataSourceIsEmptyPopIfSpecAllows;
- (void)_invalidatePlaceholder;
- (void)_setNeedsUpdate;
- (void)_updatePlaceholder;
- (void)a_customTapToRadar:(id)a3;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didEndTransition:(id)a3 withEndPoint:(id)a4 finished:(BOOL)a5;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)ppt_transitionToFirstItemWithWillPresentHandler:(id)a3 completionHandler:(id)a4;
- (void)prepareForTransitionToSelectedTabBarItemSegmentWithCompletion:(id)a3;
- (void)setActionPerformer:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setNavigatedObjectReference:(id)a3;
- (void)setNextViewDidAppearExpectation:(id)a3;
- (void)setOnTransitionEnd:(id)a3;
- (void)setPlaceholderView:(id)a3;
- (void)setTabBarTransitionDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBeginTransition:(id)a3 withEndPoint:(id)a4 anchorItemReference:(id)a5;
@end

@implementation PXFeedViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_navigatedObjectReference, 0);
  objc_storeStrong((id *)&self->_nextViewDidAppearExpectation, 0);
  objc_storeStrong(&self->_onTransitionEnd, 0);
  objc_storeStrong((id *)&self->_actionPerformer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_chromeController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_tabBarTransitionDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_feedView, 0);
}

- (void)setPlaceholderView:(id)a3
{
}

- (UIView)placeholderView
{
  return self->_placeholderView;
}

- (void)setNavigatedObjectReference:(id)a3
{
}

- (PXSectionedObjectReference)navigatedObjectReference
{
  return self->_navigatedObjectReference;
}

- (void)setNextViewDidAppearExpectation:(id)a3
{
}

- (PXExpectation)nextViewDidAppearExpectation
{
  return self->_nextViewDidAppearExpectation;
}

- (void)setOnTransitionEnd:(id)a3
{
}

- (id)onTransitionEnd
{
  return self->_onTransitionEnd;
}

- (PXFeedActionPerformer)actionPerformer
{
  return self->_actionPerformer;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXFeedChromeController)chromeController
{
  return self->_chromeController;
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setTabBarTransitionDelegate:(id)a3
{
}

- (PXFeedViewControllerTabBarTransitionDelegate)tabBarTransitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarTransitionDelegate);
  return (PXFeedViewControllerTabBarTransitionDelegate *)WeakRetained;
}

- (PXFeedConfiguration)configuration
{
  return self->_configuration;
}

- (PXFeedView)feedView
{
  return self->_feedView;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  v5 = [(PXFeedViewController *)self feedView];
  [v4 addSubprovider:v5];

  id v6 = +[PXStorySettings sharedInstance];
  [v4 addSubprovider:v6];
}

- (id)_objectReferenceForDestination:(id)a3
{
  id v4 = a3;
  v5 = [(PXFeedViewController *)self configuration];
  id v6 = [v5 objectReferenceForDestination:v4];

  return v6;
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  return 0;
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  return 0;
}

- (void)_handleCanNavigate:(BOOL)a3 toDestination:(id)a4 objectReference:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = PLStoryGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v10 publicDescription];
    *(_DWORD *)buf = 67109634;
    BOOL v31 = v8;
    __int16 v32 = 2112;
    v33 = self;
    __int16 v34 = 2114;
    v35 = v14;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_INFO, "done waiting for navigation to be possible %i from %@ to %{public}@", buf, 0x1Cu);
  }
  if (v8)
  {
    v21 = [(PXFeedViewController *)self actionPerformer];
    v22 = [v10 source];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __91__PXFeedViewController__handleCanNavigate_toDestination_objectReference_completionHandler___block_invoke;
    v28[3] = &unk_1E5DC6410;
    v23 = (void (**)(id, uint64_t, void))v12;
    id v29 = v23;
    int v24 = [v21 navigateToObjectReference:v11 originalSource:v22 fromViewController:self animated:0 willPresentHandler:0 completionHandler:v28];

    if ((v24 & 1) == 0) {
      v23[2](v23, 5, 0);
    }
    v25 = PLStoryGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = [v10 publicDescription];
      *(_DWORD *)buf = 67109378;
      BOOL v31 = v24;
      __int16 v32 = 2114;
      v33 = v26;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_INFO, "navigation succeeded %i to %{public}@", buf, 0x12u);
    }
    v27 = v29;
  }
  else
  {
    v27 = PXStoryErrorCreateWithCodeDebugFormat(13, @"Couldn't navigate from %@", v15, v16, v17, v18, v19, v20, (uint64_t)self);
    (*((void (**)(id, uint64_t, void *))v12 + 2))(v12, 5, v27);
  }
}

uint64_t __91__PXFeedViewController__handleCanNavigate_toDestination_objectReference_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkCanNavigate:(BOOL *)a3 toDestination:(id)a4 iterator:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ([(UIViewController *)self px_isVisible])
  {
    id v11 = [(PXFeedViewController *)self presentedViewController];
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  *a3 = v12;
  v13 = PLStoryGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v9 publicDescription];
    *(_DWORD *)buf = 67109634;
    BOOL v20 = v12;
    __int16 v21 = 2112;
    v22 = self;
    __int16 v23 = 2114;
    int v24 = v14;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_INFO, "checking whether navigation is possible %i from %@ to %{public}@", buf, 0x1Cu);
  }
  if (v12)
  {
    [v10 stop];
  }
  else
  {
    uint64_t v15 = [[PXExpectation alloc] initWithLabelFormat:@"%@'s next viewDidAppear", self];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__PXFeedViewController__checkCanNavigate_toDestination_iterator___block_invoke;
    v16[3] = &unk_1E5DC63E8;
    SEL v18 = a2;
    v16[4] = self;
    id v17 = v10;
    [(PXExpectation *)v15 performWhenFulfilled:v16 timeout:3.0];
    [(PXFeedViewController *)self setNextViewDidAppearExpectation:v15];
  }
}

uint64_t __65__PXFeedViewController__checkCanNavigate_toDestination_iterator___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    PXAssertGetLog();
  }
  return [*(id *)(a1 + 40) next];
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = PLStoryGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v7 publicDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "navigating to destination %{public}@", (uint8_t *)&buf, 0xCu);
  }
  id v11 = [(PXFeedViewController *)self _objectReferenceForDestination:v7];
  if (v11)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    objc_initWeak(&location, self);
    v15[1] = (id)MEMORY[0x1E4F143A8];
    v15[2] = (id)3221225472;
    v15[3] = __72__PXFeedViewController_navigateToDestination_options_completionHandler___block_invoke;
    v15[4] = &unk_1E5DC6398;
    objc_copyWeak(&v16, &location);
    v15[6] = &buf;
    id v12 = v7;
    v15[5] = v12;
    objc_copyWeak(v15, &location);
    v12;
    v11;
    v8;
    PXIterateAsynchronously();
  }
  v13 = PLStoryGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = [v7 publicDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "failed to find object reference for %{public}@", (uint8_t *)&buf, 0xCu);
  }
  (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 5, 0);
}

void __72__PXFeedViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _checkCanNavigate:*(void *)(*(void *)(a1 + 40) + 8) + 24 toDestination:*(void *)(a1 + 32) iterator:v4];
}

void __72__PXFeedViewController_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _handleCanNavigate:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) toDestination:*(void *)(a1 + 32) objectReference:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  if (!self->_actionPerformerRespondsTo.navigateToObjectReferenceFromViewControllerAnimatedWillPresentHandlerCompletionHandler) {
    return 0;
  }
  v3 = [(PXFeedViewController *)self _objectReferenceForDestination:a3];
  unint64_t v4 = v3 != 0;

  return v4;
}

- (id)_targetedPreviewForObjectReference:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(PXFeedView *)self->_feedView tungstenView];
    id v6 = [v5 regionOfInterestForObjectReference:v4];

    if (v6)
    {
      id v7 = [(PXFeedViewController *)self view];
      [v6 rectInCoordinateSpace:v7];
      id v8 = objc_msgSend(v7, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1);
      id v9 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
      id v10 = (void *)MEMORY[0x1E4FB14C0];
      [v8 bounds];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      uint64_t v19 = [v6 imageViewSpec];
      [v19 cornerRadius];
      uint64_t v21 = objc_msgSend(v10, "bezierPathWithRoundedRect:cornerRadius:", v12, v14, v16, v18, v20);
      [v9 setVisiblePath:v21];

      v22 = [MEMORY[0x1E4FB1618] clearColor];
      [v9 setBackgroundColor:v22];

      id v23 = objc_alloc(MEMORY[0x1E4FB1B38]);
      PXRectGetCenter();
    }
  }
  else
  {
    id v6 = 0;
  }

  return 0;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  v5 = [(PXFeedViewController *)self navigatedObjectReference];
  id v6 = [(PXFeedViewController *)self _targetedPreviewForObjectReference:v5];

  return v6;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  v5 = [(PXFeedViewController *)self navigatedObjectReference];
  id v6 = [(PXFeedViewController *)self _targetedPreviewForObjectReference:v5];

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  if (self->_actionPerformerRespondsTo.contextMenuForObjectReferenceInDataSourceSuggestedActions)
  {
    double y = a4.y;
    double x = a4.x;
    id v7 = [(PXFeedView *)self->_feedView tungstenView];
    id v8 = objc_msgSend(v7, "feedHitTestResultAtPoint:", x, y);

    id v9 = [v8 objectReference];
    if (v9)
    {
      id v10 = [v8 objectReference];
      [(PXFeedViewController *)self setNavigatedObjectReference:v10];

      double v11 = [(PXFeedViewController *)self viewModel];
      double v12 = [v11 dataSource];

      double v13 = (void *)MEMORY[0x1E4FB1678];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __78__PXFeedViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
      v17[3] = &unk_1E5DC6370;
      v17[4] = self;
      id v18 = v9;
      id v19 = v12;
      id v14 = v12;
      double v15 = [v13 configurationWithIdentifier:0 previewProvider:0 actionProvider:v17];
    }
    else
    {
      double v15 = 0;
    }
  }
  else
  {
    double v15 = 0;
  }
  return v15;
}

id __78__PXFeedViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  v5 = [v3 actionPerformer];
  id v6 = [v5 contextMenuForObjectReference:a1[5] inDataSource:a1[6] suggestedActions:v4 fromViewController:a1[4]];

  return v6;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)ViewModelObservationContext_219537 == a5)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_8;
    }
    id v11 = v9;
    [(PXFeedViewController *)self _invalidatePlaceholder];
    goto LABEL_7;
  }
  if ((void *)DataSourceManagerObservationContext_219538 != a5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXFeedViewController.m" lineNumber:534 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXFeedViewController *)self _ifDataSourceIsEmptyPopIfSpecAllows];
LABEL_7:
    id v9 = v11;
  }
LABEL_8:
}

- (void)_ifDataSourceIsEmptyPopIfSpecAllows
{
  id v8 = [(PXFeedViewController *)self viewModel];
  v3 = [v8 dataSourceManager];
  id v4 = [v3 dataSource];
  if ([v4 containsAnyItems])
  {
  }
  else
  {
    v5 = [(PXFeedViewController *)self configuration];
    int v6 = [v5 allowsPopOnEmptyBehavior];

    if (!v6) {
      return;
    }
    id v8 = [(PXFeedViewController *)self navigationController];
    id v7 = (id)objc_msgSend(v8, "px_popToViewControllerPrecedingViewController:animated:", self, 1);
  }
}

- (void)didEndTransition:(id)a3 withEndPoint:(id)a4 finished:(BOOL)a5
{
  int v6 = [(PXFeedViewController *)self onTransitionEnd];
  if (v6)
  {
    [(PXFeedViewController *)self setOnTransitionEnd:0];
    v6[2]();
  }
}

- (void)willBeginTransition:(id)a3 withEndPoint:(id)a4 anchorItemReference:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PXFeedViewController *)self viewModel];
  double v12 = [v11 dataSourceManager];

  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__219546;
  v27[4] = __Block_byref_object_dispose__219547;
  id v28 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke;
  v26[3] = &unk_1E5DC6320;
  v26[4] = self;
  v26[5] = v27;
  [v12 performChanges:v26];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_2;
  id v23 = &unk_1E5DD0588;
  id v13 = v12;
  id v24 = v13;
  uint64_t v25 = v27;
  [(PXFeedViewController *)self setOnTransitionEnd:&v20];
  if (v10)
  {
    id v14 = objc_msgSend(v13, "dataSource", v20, v21, v22, v23);
    id v15 = objc_alloc((Class)off_1E5DA84A8);
    long long v16 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)long long buf = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&buf[16] = v16;
    double v17 = (void *)[v15 initWithSectionObject:0 itemObject:v10 subitemObject:0 indexPath:buf];
    id v18 = [v14 objectReferenceForObjectReference:v17];

    if (v18)
    {
      id v19 = [(PXFeedViewController *)self feedView];
      [v19 scrollObjectReference:v18 toScrollPosition:64];
    }
    else
    {
      id v19 = PLStoryGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "Transition anchoring failed because %@ couldn't be found in %@", buf, 0x16u);
      }
    }
  }
  _Block_object_dispose(v27, 8);
}

void __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v3 pauseChangeDeliveryWithTimeout:v8 identifier:3.0];

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_3;
  v3[3] = &unk_1E5DC6348;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 performChanges:v3];
}

uint64_t __77__PXFeedViewController_willBeginTransition_withEndPoint_anchorItemReference___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDeliveryAndBackgroundLoading:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXFeedViewController *)self feedView];
  uint64_t v6 = [v5 itemPlacementControllerForItemReference:v4];

  return v6;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return 1;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 popoverPresentationController];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(PXFeedViewController *)self viewModel];
      id v11 = [v10 dataSourceManager];
      double v12 = [v11 dataSource];

      id v13 = [v7 assetCollection];
      id v14 = objc_alloc((Class)off_1E5DA84A8);
      long long v15 = *((_OWORD *)off_1E5DAB028 + 1);
      v23[0] = *(_OWORD *)off_1E5DAB028;
      v23[1] = v15;
      long long v16 = (void *)[v14 initWithSectionObject:0 itemObject:v13 subitemObject:0 indexPath:v23];
      double v17 = [v12 objectReferenceForObjectReference:v16];

      id v18 = [(PXFeedViewController *)self feedView];
      id v19 = v18;
      if (v17)
      {
        uint64_t v20 = [v18 regionOfInterestForObjectReference:v17];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          [v9 setSourceView:v19];
          [v21 rectInCoordinateSpace:v19];
          objc_msgSend(v9, "setSourceRect:");
        }
      }
    }
  }
  [(UIViewController *)self px_presentOverTopmostPresentedViewController:v8 animated:1 completion:0];

  return 1;
}

- (BOOL)handleSelectActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  uint64_t v5 = [(PXFeedViewController *)self viewModel];
  uint64_t v6 = [v5 selectionManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PXFeedViewController_handleSelectActionOnItemAtIndexPath_inDataSource___block_invoke;
  v9[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  long long v7 = *(_OWORD *)&a3->item;
  long long v10 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v11 = v7;
  [v6 performChanges:v9];

  return 1;
}

uint64_t __73__PXFeedViewController_handleSelectActionOnItemAtIndexPath_inDataSource___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setSelectedIndexPath:v4];
}

- (BOOL)handlePrimaryActionOnItemAtIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  if (!self->_actionPerformerRespondsTo.handlePrimaryActionOnItemAtIndexPathInDataSourceFromViewController) {
    return 0;
  }
  id v6 = a4;
  long long v7 = [(PXFeedViewController *)self actionPerformer];
  long long v8 = *(_OWORD *)&a3->item;
  v11[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v11[1] = v8;
  char v9 = [v7 handlePrimaryActionOnItemAtIndexPath:v11 inDataSource:v6 fromViewController:self];

  return v9;
}

- (void)prepareForTransitionToSelectedTabBarItemSegmentWithCompletion:(id)a3
{
  long long v7 = (void (**)(void))a3;
  id v4 = [(PXFeedViewController *)self tabBarTransitionDelegate];

  if (v4)
  {
    uint64_t v5 = [(PXFeedViewController *)self tabBarTransitionDelegate];
    id v6 = [(PXFeedViewController *)self tabBarController];
    objc_msgSend(v5, "prepareForTransitionToSelectedTabBarItemSegmentNumber:", objc_msgSend(v6, "selectedIndex"));
  }
  v7[2]();
}

- (void)ppt_transitionToFirstItemWithWillPresentHandler:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a3;
  long long v7 = (void (**)(id, void))a4;
  long long v8 = [(PXFeedViewController *)self viewModel];
  char v9 = [v8 dataSource];

  long long v14 = 0u;
  long long v15 = 0u;
  if (v9) {
    [v9 firstItemIndexPath];
  }
  v13[0] = v14;
  v13[1] = v15;
  long long v10 = [v9 objectReferenceAtIndexPath:v13];
  if (!self->_actionPerformerRespondsTo.navigateToObjectReferenceFromViewControllerAnimatedWillPresentHandlerCompletionHandler
    || ([(PXFeedViewController *)self actionPerformer],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 navigateToObjectReference:v10 originalSource:@"PPT" fromViewController:self animated:1 willPresentHandler:v6 completionHandler:v7], v11, (v12 & 1) == 0))
  {
    if (v6) {
      v6[2](v6, 0);
    }
    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (UIScrollView)ppt_scrollView
{
  long long v2 = [(PXFeedViewController *)self feedView];
  id v3 = [v2 tungstenView];
  id v4 = [v3 diagnosticsMainScrollView];

  return (UIScrollView *)v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(PXFeedViewController *)self placeholderView];
  if (!v6) {
    goto LABEL_4;
  }
  long long v7 = (void *)v6;
  long long v8 = [(PXFeedViewController *)self viewModel];
  char v9 = [v8 placeholderFactory];
  int v10 = [v9 supportsDynamicPlaceholderContentSize];

  if (v10)
  {
    long long v11 = [(PXFeedViewController *)self view];
    [v11 layoutIfNeeded];
    LODWORD(v12) = 1148846080;
    LODWORD(v13) = 1112014848;
    objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v12, v13);
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
LABEL_4:
    double v15 = *(double *)off_1E5DAB030;
    double v17 = *((double *)off_1E5DAB030 + 1);
    id v18 = [(PXFeedViewController *)self feedView];
    id v19 = [v18 tungstenView];

    if (v19)
    {
      uint64_t v20 = [(PXFeedViewController *)self feedView];
      uint64_t v21 = [v20 tungstenView];

      v22 = [v21 rootLayout];
      [v22 contentSize];

      PXSizeIsEmpty();
    }
  }
  double v23 = v15;
  double v24 = v17;
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (void)_updatePlaceholder
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(PXFeedViewController *)self placeholderView];
  id v4 = [(PXFeedViewController *)self viewModel];
  uint64_t v5 = [v4 dataSource];
  char v6 = [v5 containsAnyItems];

  if (v6)
  {
    [v3 removeFromSuperview];

    id v3 = 0;
  }
  else if (!v3)
  {
    long long v7 = [v4 placeholderFactory];
    id v3 = [v7 createPlaceholderViewForFeedWithViewModel:v4];

    if (v3)
    {
      long long v8 = [(PXFeedViewController *)self view];
      [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v8 addSubview:v3];
      char v9 = [v4 spec];
      [v9 placeholderMargins];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      v26 = (void *)MEMORY[0x1E4F28DC8];
      BOOL v31 = [v8 leadingAnchor];
      uint64_t v30 = [v3 leadingAnchor];
      id v29 = [v31 constraintEqualToAnchor:v30 constant:-v13];
      v32[0] = v29;
      id v28 = [v8 trailingAnchor];
      v27 = [v3 trailingAnchor];
      uint64_t v25 = [v28 constraintEqualToAnchor:v27 constant:v17];
      v32[1] = v25;
      double v24 = [v8 topAnchor];
      id v18 = [v3 topAnchor];
      id v19 = [v24 constraintEqualToAnchor:v18 constant:-v11];
      v32[2] = v19;
      uint64_t v20 = [v8 bottomAnchor];
      uint64_t v21 = [v3 bottomAnchor];
      v22 = [v20 constraintEqualToAnchor:v21 constant:v15];
      v32[3] = v22;
      double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
      [v26 activateConstraints:v23];
    }
  }
  [(PXFeedViewController *)self setPlaceholderView:v3];
}

- (void)_invalidatePlaceholder
{
  id v2 = [(PXFeedViewController *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePlaceholder];
}

- (void)_setNeedsUpdate
{
  id v2 = [(PXFeedViewController *)self viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)_handleScrollViewTap:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(PXFeedViewController *)self viewModel];
    uint64_t v5 = [v4 dataSource];

    char v6 = [(PXFeedViewController *)self viewModel];
    long long v7 = [v6 selectionSnapshot];
    long long v8 = [v7 selectedIndexPaths];

    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [v5 identifier];
    if (v8)
    {
      [v8 firstItemIndexPathForDataSourceIdentifier:v9];
      if ((void)v14 != *(void *)off_1E5DAAED8
        && (void)v15 != 0x7FFFFFFFFFFFFFFFLL
        && *((void *)&v15 + 1) == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v12 = [(PXFeedViewController *)self actionPerformer];
        v13[0] = v14;
        v13[1] = v15;
        [v12 handlePrimaryActionOnItemAtIndexPath:v13 inDataSource:v5 fromViewController:self];
      }
    }
  }
}

- (void)a_customTapToRadar:(id)a3
{
  id v4 = objc_alloc_init(PXRadarConfiguration);
  [(PXRadarConfiguration *)v4 addDiagnosticProvider:self];
  [(PXRadarConfiguration *)v4 setComponent:1];
  [(PXRadarConfiguration *)v4 setKeywordIDs:&unk_1F02D4F18];
  [(PXRadarConfiguration *)v4 setAttachmentsIncludeAnyUserAsset:0];
  PXFileRadarWithConfiguration(v4);
}

- (void)setActionPerformer:(id)a3
{
  uint64_t v5 = (PXFeedActionPerformer *)a3;
  if (self->_actionPerformer != v5)
  {
    long long v8 = v5;
    objc_storeStrong((id *)&self->_actionPerformer, a3);
    p_actionPerformerRespondsTo = &self->_actionPerformerRespondsTo;
    p_actionPerformerRespondsTo->handlePrimaryActionOnItemAtIndexPathInDataSourceFromViewController = objc_opt_respondsToSelector() & 1;
    p_actionPerformerRespondsTo->navigateToObjectReferenceFromViewControllerAnimatedWillPresentHandlerCompletionHandler = objc_opt_respondsToSelector() & 1;
    p_actionPerformerRespondsTo->deleteItemsInSelectionUndoManager = objc_opt_respondsToSelector() & 1;
    BOOL v7 = objc_opt_respondsToSelector() & 1;
    uint64_t v5 = v8;
    p_actionPerformerRespondsTo->contextMenuForObjectReferenceInDataSourceSuggestedActions = v7;
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewController;
  [(PXFeedViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(PXFeedViewController *)self updater];
  [v3 updateIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewController;
  [(PXFeedViewController *)&v4 viewWillDisappear:a3];
  [(PXFeedViewController *)self setIsActive:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXFeedViewController;
  [(PXFeedViewController *)&v5 viewDidAppear:a3];
  objc_super v4 = [(PXFeedViewController *)self nextViewDidAppearExpectation];
  [v4 fulfill];

  [(PXFeedViewController *)self setNextViewDidAppearExpectation:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewController;
  [(PXFeedViewController *)&v4 viewWillAppear:a3];
  [(PXFeedViewController *)self setIsActive:1];
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    BOOL v3 = a3;
    self->_BOOL isActive = a3;
    objc_super v5 = [(PXFeedViewController *)self feedView];
    [v5 setIsActive:v3];

    BOOL isActive = self->_isActive;
    BOOL v7 = [(PXFeedViewController *)self chromeController];
    [v7 setIsActive:isActive];

    LODWORD(isActive) = self->_isActive;
    long long v8 = [(PXFeedViewController *)self configuration];
    id v9 = v8;
    if (isActive) {
      [v8 handleContentSeen];
    }
    else {
      [v8 handleContentDismissed];
    }
  }
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)PXFeedViewController;
  [(PXFeedViewController *)&v37 viewDidLoad];
  [(UIViewController *)self px_enableExtendedTraitCollection];
  BOOL v3 = [(PXFeedViewController *)self configuration];
  objc_super v4 = [PXFeedViewConfiguration alloc];
  objc_super v5 = [(UIViewController *)self px_extendedTraitCollection];
  char v6 = [(PXFeedViewConfiguration *)v4 initWithFeedConfiguration:v3 extendedTraitCollection:v5];

  [(PXFeedViewConfiguration *)v6 setContainerViewController:self];
  BOOL v7 = [(PXFeedViewController *)self view];
  long long v8 = [PXFeedView alloc];
  [v7 bounds];
  id v9 = -[PXFeedView initWithFrame:configuration:](v8, "initWithFrame:configuration:", v6);
  feedView = self->_feedView;
  self->_feedView = v9;

  [(PXFeedView *)self->_feedView setAutoresizingMask:18];
  [v7 addSubview:self->_feedView];
  double v11 = [(PXFeedView *)self->_feedView viewModel];
  viewModel = self->_viewModel;
  self->_viewModel = v11;

  double v13 = self->_viewModel;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __35__PXFeedViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E5DC62F8;
  v36[4] = self;
  [(PXFeedViewModel *)v13 performChanges:v36];
  [(PXFeedViewModel *)self->_viewModel registerChangeObserver:self context:ViewModelObservationContext_219537];
  long long v14 = [(PXFeedConfiguration *)self->_configuration actionPerformer];
  [(PXFeedViewController *)self setActionPerformer:v14];

  long long v15 = [v3 chromeControllerPromise];
  if (v15)
  {
    double v16 = [(PXFeedViewModel *)self->_viewModel dataSourceManager];
    ((void (**)(void, PXFeedViewController *, void *))v15)[2](v15, self, v16);
    double v17 = (PXFeedChromeController *)objc_claimAutoreleasedReturnValue();
    chromeController = self->_chromeController;
    self->_chromeController = v17;
  }
  id v19 = [(PXFeedViewController *)self navigationItem];
  objc_msgSend(v19, "px_setDisableLargeTitle:", 1);

  uint64_t v20 = [v3 hidesBackButton];
  uint64_t v21 = [(PXFeedViewController *)self navigationItem];
  [v21 setHidesBackButton:v20];

  v22 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel__handleScrollViewTap_];
  [(PXUITapGestureRecognizer *)v22 setAllowedPressTypes:&unk_1F02D4F00];
  [v7 addGestureRecognizer:v22];
  if (self->_actionPerformerRespondsTo.contextMenuForObjectReferenceInDataSourceSuggestedActions)
  {
    double v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
    [v7 addInteraction:v23];
  }
  double v24 = [(PXFeedView *)self->_feedView tungstenView];
  uint64_t v25 = [v24 scrollViewController];
  v26 = [v25 scrollView];

  [v7 layoutIfNeeded];
  [(PXFeedViewController *)self _setObservableScrollView:v26 forEdges:5];
  dispatch_time_t v27 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PXFeedViewController_viewDidLoad__block_invoke_206;
  block[3] = &unk_1E5DD32A8;
  id v34 = v26;
  v35 = self;
  id v28 = v26;
  dispatch_after(v27, MEMORY[0x1E4F14428], block);
  id v29 = (PXUpdater *)[objc_alloc((Class)off_1E5DA9778) initWithTarget:self needsUpdateSelector:sel__setNeedsUpdate];
  updater = self->_updater;
  self->_updater = v29;

  [(PXUpdater *)self->_updater addUpdateSelector:sel__updatePlaceholder needsUpdate:1];
  BOOL v31 = [(PXFeedViewController *)self viewModel];
  __int16 v32 = [v31 dataSourceManager];
  [v32 registerChangeObserver:self context:DataSourceManagerObservationContext_219538];
}

void __35__PXFeedViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setActionPerformer:v3];
  [v4 setAssetCollectionActionPerformerDelegate:*(void *)(a1 + 32)];
  [v4 setPresentingViewController:*(void *)(a1 + 32)];
}

void __35__PXFeedViewController_viewDidLoad__block_invoke_206(uint64_t a1)
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x3032000000;
  BOOL v7 = __Block_byref_object_copy__219546;
  long long v8 = __Block_byref_object_dispose__219547;
  id v9 = *(id *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__PXFeedViewController_viewDidLoad__block_invoke_207;
  v3[3] = &unk_1E5DCABD0;
  v3[4] = &v4;
  objc_msgSend(v2, "px_enumerateDescendantSubviewsUsingBlock:", v3);
  [*(id *)(a1 + 40) _setObservableScrollView:v5[5] forEdges:5];
  _Block_object_dispose(&v4, 8);
}

void __35__PXFeedViewController_viewDidLoad__block_invoke_207(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (PXFeedViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXFeedViewController;
  id v6 = [(PXFeedViewController *)&v11 initWithNibName:0 bundle:0];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    long long v8 = [(PXFeedConfiguration *)v7->_configuration viewControllerTitle];
    [(PXFeedViewController *)v7 setTitle:v8];

    id v9 = [v5 actionPerformer];
    [(PXFeedViewController *)v7 setActionPerformer:v9];
  }
  return v7;
}

- (PXFeedViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedViewController.m", 121, @"%s is not available as initializer", "-[PXFeedViewController initWithCoder:]");

  abort();
}

- (PXFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedViewController.m", 117, @"%s is not available as initializer", "-[PXFeedViewController initWithNibName:bundle:]");

  abort();
}

- (PXFeedViewController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedViewController.m", 113, @"%s is not available as initializer", "-[PXFeedViewController init]");

  abort();
}

@end