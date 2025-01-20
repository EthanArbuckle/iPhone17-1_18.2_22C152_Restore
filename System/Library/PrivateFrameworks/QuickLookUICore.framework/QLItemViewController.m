@interface QLItemViewController
- (BOOL)automaticallyUpdateScrollViewContentInset;
- (BOOL)automaticallyUpdateScrollViewContentOffset;
- (BOOL)automaticallyUpdateScrollViewIndicatorInset;
- (BOOL)canBeLocked;
- (BOOL)canClickToToggleFullscreen;
- (BOOL)canEnterFullScreen;
- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3;
- (BOOL)canPinchToDismiss;
- (BOOL)canShowNavBar;
- (BOOL)canShowToolBar;
- (BOOL)canSwipeToDismiss;
- (BOOL)canToggleFullScreen;
- (BOOL)didAppearOnce;
- (BOOL)draggableViewShouldStartDragSession:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isLoaded;
- (BOOL)isLoading;
- (BOOL)isSavingEdits;
- (BOOL)loadingFailed;
- (BOOL)navigationBarShouldBeChromeless;
- (BOOL)presenterShouldHandleLoadingView:(id)a3 readyToDisplay:(id)a4;
- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4;
- (BOOL)shouldAlwaysRunFullscreen;
- (BOOL)shouldRecognizeGestureRecognizer:(id)a3;
- (BOOL)supportsChromeless;
- (BOOL)supportsScrollingUpAndDownUsingKeyCommands;
- (BOOL)toolbarShouldBeChromeless;
- (CGRect)contentFrame;
- (NSArray)registeredKeyCommands;
- (NSString)description;
- (OS_dispatch_queue)saveEditsQueue;
- (PUProgressIndicatorView)saveEditProgressView;
- (QLAppearance)appearance;
- (QLItemViewController)init;
- (QLItemViewControllerPresentingDelegate)presentingDelegate;
- (QLPreviewContext)context;
- (QLPreviewItemViewControllerDelegate)delegate;
- (UIDragInteraction)dragInteraction;
- (UIView)accessoryView;
- (double)edgePanGestureWidth;
- (id)_cancelTouchToken;
- (id)additionalItemViewControllerDescription;
- (id)contents;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)draggableView;
- (id)editProgressIndicatorMessage;
- (id)excludedToolbarButtonIdentifiersForTraitCollection:(id)a3;
- (id)fullscreenBackgroundColor;
- (id)parallaxView;
- (id)scrollView;
- (id)stateRestorationDictionary;
- (id)toolbarButtonsForTraitCollection:(id)a3;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)preferredWhitePointAdaptivityStyle;
- (void)_addDragInteractionIfNeeded;
- (void)_scrollScrollViewByPercentualOffset:(double)a3;
- (void)_scrollScrollViewDown;
- (void)_scrollScrollViewUp;
- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)createEditedCopyForItem:(id)a3 outputType:(id)a4 directoryURL:(id)a5 completionHandler:(id)a6;
- (void)didFinishSavingEdits;
- (void)didStartSavingEdits;
- (void)editedCopyToSaveChangesWithOutputType:(id)a3 completionHandler:(id)a4;
- (void)handlePerformedKeyCommandIfNeeded:(id)a3;
- (void)hideSaveEditProgressIndicator;
- (void)loadPreviewControllerIfNeededWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)notifyDelegateWantsChromelessBars;
- (void)notifyDelegatesDidFailWithError:(id)a3;
- (void)performCompletionBlocksWithError:(id)a3;
- (void)performFirstTimeAppearanceActionsIfNeeded:(unint64_t)a3;
- (void)prepareForInvalidationWithCompletionHandler:(id)a3;
- (void)previewDidAppear:(BOOL)a3;
- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3;
- (void)setAppearance:(id)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setContentFrame:(CGRect)a3;
- (void)setContents:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAppearOnce:(BOOL)a3;
- (void)setDragInteraction:(id)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsSavingEdits:(BOOL)a3;
- (void)setLoadingFailed:(BOOL)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setSaveEditProgressView:(id)a3;
- (void)setSaveEditsQueue:(id)a3;
- (void)showSaveEditsProgressIndicatorAfterDelay;
- (void)updateInterfaceAfterSavingEdits;
- (void)updateInterfaceForSavingEdits;
- (void)updateScrollViewContentOffset;
- (void)updateScrollViewContentOffset:(BOOL)a3 withPreviousAppearance:(id)a4;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation QLItemViewController

- (void)setAppearance:(id)a3
{
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (QLAppearance *)a3;
  appearance = self->_appearance;
  self->_appearance = v6;
  v9 = v6;
  v8 = appearance;

  [(QLItemViewController *)self updateScrollViewContentOffset:v4 withPreviousAppearance:v8];
}

- (void)setContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentFrame = &self->_contentFrame;
  if (!CGRectEqualToRect(self->_contentFrame, a3))
  {
    p_contentFrame->origin.CGFloat x = x;
    p_contentFrame->origin.CGFloat y = y;
    p_contentFrame->size.CGFloat width = width;
    p_contentFrame->size.CGFloat height = height;
    [(QLItemViewController *)self notifyDelegateWantsChromelessBars];
    id v9 = [(QLItemViewController *)self delegate];
    [v9 previewItemViewControllerDidUpdateContentFrame:self];
  }
}

- (void)notifyDelegateWantsChromelessBars
{
  if (!CGRectIsEmpty(self->_contentFrame))
  {
    v3 = [(QLItemViewController *)self view];
    [v3 safeAreaInsets];
    double v7 = v6;
    if (v8 == *(double *)(MEMORY[0x1E4F437F8] + 8)
      && v4 == *MEMORY[0x1E4F437F8]
      && v5 == *(double *)(MEMORY[0x1E4F437F8] + 24))
    {
      double v11 = *(double *)(MEMORY[0x1E4F437F8] + 16);

      if (v7 == v11) {
        return;
      }
    }
    else
    {
    }
    v12 = [(QLItemViewController *)self delegate];
    objc_msgSend(v12, "previewItemViewController:wantsChromelessNavigationBar:", self, -[QLItemViewController navigationBarShouldBeChromeless](self, "navigationBarShouldBeChromeless"));

    id v13 = [(QLItemViewController *)self delegate];
    objc_msgSend(v13, "previewItemViewController:wantsChromelessToolbar:", self, -[QLItemViewController toolbarShouldBeChromeless](self, "toolbarShouldBeChromeless"));
  }
}

- (BOOL)supportsChromeless
{
  return 0;
}

- (BOOL)navigationBarShouldBeChromeless
{
  if (![(QLItemViewController *)self supportsChromeless]) {
    return 0;
  }
  double y = self->_contentFrame.origin.y;
  double v4 = [(QLItemViewController *)self view];
  [v4 safeAreaInsets];
  BOOL v6 = y >= v5;

  return v6;
}

- (BOOL)toolbarShouldBeChromeless
{
  if (![(QLItemViewController *)self supportsChromeless]) {
    return 0;
  }
  CGFloat v3 = self->_contentFrame.origin.y + self->_contentFrame.size.height;
  double v4 = [(QLItemViewController *)self view];
  [v4 frame];
  double v6 = v5;
  double v7 = [(QLItemViewController *)self view];
  [v7 safeAreaInsets];
  BOOL v9 = v3 <= v6 - v8;

  return v9;
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)QLItemViewController;
  [(QLItemViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(QLItemViewController *)self notifyDelegateWantsChromelessBars];
}

- (void)updateScrollViewContentOffset
{
}

- (void)updateScrollViewContentOffset:(BOOL)a3 withPreviousAppearance:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(QLItemViewController *)self scrollView];
  if (([(QLItemViewController *)self automaticallyUpdateScrollViewContentOffset]|| [(QLItemViewController *)self automaticallyUpdateScrollViewContentInset])&& v7)
  {
    double v8 = [(QLItemViewController *)self appearance];
    [v8 peripheryInsets];
    double v10 = v9;

    [v6 topInset];
    double v12 = v11;
    [v6 peripheryInsets];
    if (v12 >= v13) {
      double v14 = v12;
    }
    else {
      double v14 = v13;
    }
    v15 = [(QLItemViewController *)self appearance];
    [v15 topInset];
    double v17 = v16;

    v18 = [(QLItemViewController *)self appearance];
    [v18 peripheryInsets];
    double v20 = v19;

    if (v17 >= v20) {
      double v21 = v17;
    }
    else {
      double v21 = v20;
    }
    v22 = [(QLItemViewController *)self appearance];
    [v22 bottomInset];
    double v24 = v23;

    v25 = [(QLItemViewController *)self appearance];
    [v25 peripheryInsets];
    double v27 = v26;

    if (v24 >= v27) {
      double v28 = v24;
    }
    else {
      double v28 = v27;
    }
    [v7 contentOffset];
    uint64_t v31 = v30;
    double v32 = v29;
    if (v21 <= 0.0 || v29 != -v14)
    {
      if (v21 == v10)
      {
        double v33 = -v10;
        if (v29 < -v10)
        {
LABEL_22:
          if (v33 >= -v21) {
            double v39 = v33;
          }
          else {
            double v39 = -v21;
          }
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke;
          v48[3] = &unk_1E6DD4118;
          double v50 = v21;
          double v51 = v28;
          v48[4] = self;
          id v49 = v7;
          uint64_t v52 = v31;
          double v53 = v39;
          v40 = (void (**)(void))MEMORY[0x1E4E5A320](v48);
          v41 = v40;
          if (v4)
          {
            v42 = (void *)MEMORY[0x1E4F42FF0];
            double v43 = *MEMORY[0x1E4F43BF0];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke_2;
            v46[3] = &unk_1E6DD3F98;
            v47 = v40;
            [v42 animateWithDuration:v46 animations:v43];
          }
          else
          {
            v40[2](v40);
          }
          v44 = [(QLItemViewController *)self view];
          v45 = [v44 window];
          self->_int64_t lastScrollViewUpdateInterfaceOrientation = [v45 _windowInterfaceOrientation];

          goto LABEL_29;
        }
      }
      if (!v6 || ([v6 topInset], v32 != -v34))
      {
        int64_t lastScrollViewUpdateInterfaceOrientation = self->_lastScrollViewUpdateInterfaceOrientation;
        v36 = [(QLItemViewController *)self view];
        v37 = [v36 window];
        uint64_t v38 = [v37 _windowInterfaceOrientation];

        double v33 = v14 + v32 - v21;
        if (lastScrollViewUpdateInterfaceOrientation == v38) {
          double v33 = v32;
        }
        goto LABEL_22;
      }
    }
    double v33 = -v21;
    goto LABEL_22;
  }
LABEL_29:
}

uint64_t __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  if ([*(id *)(a1 + 32) automaticallyUpdateScrollViewContentInset]) {
    objc_msgSend(*(id *)(a1 + 40), "setContentInset:", v2, 0.0, v3, 0.0);
  }
  if ([*(id *)(a1 + 32) automaticallyUpdateScrollViewIndicatorInset]) {
    objc_msgSend(*(id *)(a1 + 40), "setScrollIndicatorInsets:", v2, 0.0, v3, 0.0);
  }
  uint64_t result = [*(id *)(a1 + 40) isDecelerating];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) automaticallyUpdateScrollViewContentOffset];
    if (result)
    {
      double v5 = *(double *)(a1 + 64);
      double v6 = *(double *)(a1 + 72);
      double v7 = *(void **)(a1 + 40);
      return objc_msgSend(v7, "setContentOffset:", v5, v6);
    }
  }
  return result;
}

uint64_t __77__QLItemViewController_updateScrollViewContentOffset_withPreviousAppearance___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (QLItemViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)QLItemViewController;
  return [(QLItemViewController *)&v3 init];
}

- (void)loadPreviewControllerIfNeededWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = v11;
  if (self->_isLoaded)
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  else if (self->_isLoading)
  {
    completionBlocks = self->_completionBlocks;
    double v14 = (void *)MEMORY[0x1E4E5A320](v11);
    [(NSMutableArray *)completionBlocks addObject:v14];
  }
  else
  {
    self->_isLoaded = 0;
    self->_isLoading = 1;
    objc_storeStrong(&self->_contents, a3);
    objc_storeStrong((id *)&self->_context, a4);
    v15 = (NSMutableArray *)objc_opt_new();
    double v16 = self->_completionBlocks;
    self->_completionBlocks = v15;

    if (v12)
    {
      double v17 = self->_completionBlocks;
      v18 = (void *)MEMORY[0x1E4E5A320](v12);
      [(NSMutableArray *)v17 addObject:v18];
    }
    objc_initWeak(&location, self);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __92__QLItemViewController_loadPreviewControllerIfNeededWithContents_context_completionHandler___block_invoke;
    v23[3] = &unk_1E6DD4140;
    objc_copyWeak(&v25, &location);
    id v19 = v10;
    id v24 = v19;
    [(QLItemViewController *)self loadPreviewControllerWithContents:v9 context:v19 completionHandler:v23];
    double v20 = [v19 backgroundColor];

    if (v20)
    {
      double v21 = [v19 backgroundColor];
      v22 = [(QLItemViewController *)self view];
      [v22 setBackgroundColor:v21];
    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

void __92__QLItemViewController_loadPreviewControllerIfNeededWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsLoaded:v3 == 0];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 setLoadingFailed:v3 != 0];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 setIsLoading:0];

  if (v3)
  {
    double v8 = (NSObject **)MEMORY[0x1E4F945F0];
    id v9 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_ERROR, "Error while attempting to load preview controller for context '%@': %@ #ItemViewController", (uint8_t *)&v13, 0x16u);
    }
  }
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  [v11 _addDragInteractionIfNeeded];

  id v12 = objc_loadWeakRetained(v4);
  [v12 performCompletionBlocksWithError:v3];
}

- (void)performCompletionBlocksWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = self->_completionBlocks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
}

- (void)previewDidAppear:(BOOL)a3
{
  self->_didAppearOnce = 1;
}

- (BOOL)canEnterFullScreen
{
  return 1;
}

- (BOOL)canToggleFullScreen
{
  id v3 = [(QLItemViewController *)self scrollView];
  if (v3)
  {
    id v4 = [(QLItemViewController *)self scrollView];
    int v5 = [v4 isDecelerating] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)canClickToToggleFullscreen
{
  return 1;
}

- (BOOL)canBeLocked
{
  return 0;
}

- (id)toolbarButtonsForTraitCollection:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)excludedToolbarButtonIdentifiersForTraitCollection:(id)a3
{
  return 0;
}

- (id)scrollView
{
  return 0;
}

- (id)_cancelTouchToken
{
  return 0;
}

- (BOOL)shouldAcceptTouch:(id)a3 ofGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)canSwipeToDismiss
{
  return 1;
}

- (BOOL)canPinchToDismiss
{
  return 1;
}

- (BOOL)canShowToolBar
{
  return 1;
}

- (BOOL)canShowNavBar
{
  return 1;
}

- (BOOL)shouldRecognizeGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (double)edgePanGestureWidth
{
  return 0.0;
}

- (BOOL)automaticallyUpdateScrollViewContentOffset
{
  return 0;
}

- (BOOL)automaticallyUpdateScrollViewContentInset
{
  return 0;
}

- (BOOL)automaticallyUpdateScrollViewIndicatorInset
{
  return 0;
}

- (id)fullscreenBackgroundColor
{
  return (id)[MEMORY[0x1E4F428B8] blackColor];
}

- (BOOL)shouldAlwaysRunFullscreen
{
  return 0;
}

- (BOOL)presenterShouldHandleLoadingView:(id)a3 readyToDisplay:(id)a4
{
  return 1;
}

- (void)prepareForInvalidationWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)buttonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (NSArray)registeredKeyCommands
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(QLItemViewController *)self scrollView];
  if (v4)
  {
    int v5 = (void *)v4;
    BOOL v6 = [(QLItemViewController *)self supportsScrollingUpAndDownUsingKeyCommands];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439D8] modifierFlags:0 action:sel__scrollScrollViewDown];
      uint64_t v8 = QLLocalizedString(@"Scroll Down");
      [v7 setDiscoverabilityTitle:v8];

      uint64_t v9 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A80] modifierFlags:0 action:sel__scrollScrollViewUp];
      long long v10 = QLLocalizedString(@"Scroll Up");
      [v9 setDiscoverabilityTitle:v10];

      long long v11 = +[QLKeyCommand keyCommandWithKeyCommand:v7 identifier:3];
      [v3 addObject:v11];

      long long v12 = +[QLKeyCommand keyCommandWithKeyCommand:v9 identifier:2];
      [v3 addObject:v12];
    }
  }
  return (NSArray *)v3;
}

- (BOOL)supportsScrollingUpAndDownUsingKeyCommands
{
  return 1;
}

- (void)handlePerformedKeyCommandIfNeeded:(id)a3
{
  id v4 = a3;
  if ([v4 keyCommandIdentifier] == 2)
  {
    [(QLItemViewController *)self _scrollScrollViewUp];
  }
  else if ([v4 keyCommandIdentifier] == 3)
  {
    [(QLItemViewController *)self _scrollScrollViewDown];
  }
}

- (void)_scrollScrollViewUp
{
}

- (void)_scrollScrollViewDown
{
}

- (void)_scrollScrollViewByPercentualOffset:(double)a3
{
  int v5 = [(QLItemViewController *)self scrollView];

  if (v5)
  {
    BOOL v6 = [(QLItemViewController *)self scrollView];
    [v6 contentInset];
    double v8 = v7;

    uint64_t v9 = [(QLItemViewController *)self scrollView];
    [v9 frame];
    double Height = CGRectGetHeight(v27);
    long long v11 = [(QLItemViewController *)self scrollView];
    [v11 contentInset];
    double v13 = Height - v12;
    uint64_t v14 = [(QLItemViewController *)self scrollView];
    [v14 contentInset];
    double v16 = v13 - v15;

    uint64_t v17 = [(QLItemViewController *)self scrollView];
    [v17 contentSize];
    double v19 = v18;

    double v20 = [(QLItemViewController *)self scrollView];
    [v20 contentOffset];
    double v22 = v21 - v16 * a3;

    double v23 = v19 - v16 - v8;
    if (v22 < v23) {
      double v23 = v22;
    }
    if (v23 >= -v8) {
      double v24 = v23;
    }
    else {
      double v24 = -v8;
    }
    id v25 = [(QLItemViewController *)self scrollView];
    [v25 flashScrollIndicators];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __60__QLItemViewController__scrollScrollViewByPercentualOffset___block_invoke;
    v26[3] = &unk_1E6DD3B60;
    v26[4] = self;
    *(double *)&v26[5] = v24;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v26 animations:0.4];
  }
}

void __60__QLItemViewController__scrollScrollViewByPercentualOffset___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) scrollView];
  [v6 contentOffset];
  double v3 = v2;
  double v4 = *(double *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) scrollView];
  objc_msgSend(v5, "setContentOffset:", v3, v4);
}

- (id)parallaxView
{
  return 0;
}

- (void)performFirstTimeAppearanceActionsIfNeeded:(unint64_t)a3
{
  if (a3
    && -[QLItemViewController canPerformFirstTimeAppearanceActions:](self, "canPerformFirstTimeAppearanceActions:"))
  {
    [(QLItemViewController *)self performFirstTimeAppearanceActions:a3];
  }
}

- (BOOL)canPerformFirstTimeAppearanceActions:(unint64_t)a3
{
  return 0;
}

- (id)stateRestorationDictionary
{
  return 0;
}

- (void)notifyDelegatesDidFailWithError:(id)a3
{
  id v4 = a3;
  int v5 = [(QLItemViewController *)self presentingDelegate];
  [v5 previewItemViewController:self didFailWithError:v4];

  id v6 = [(QLItemViewController *)self delegate];
  [v6 previewItemViewController:self didFailWithError:v4];
}

- (id)draggableView
{
  return 0;
}

- (BOOL)draggableViewShouldStartDragSession:(id)a3
{
  double v3 = [(QLItemViewController *)self draggableView];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_addDragInteractionIfNeeded
{
  double v3 = [(QLItemViewController *)self draggableView];
  if (v3 && !self->_dragInteraction)
  {
    id v6 = v3;
    BOOL v4 = (UIDragInteraction *)[objc_alloc(MEMORY[0x1E4F42998]) initWithDelegate:self];
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v4;

    [v6 addInteraction:self->_dragInteraction];
    double v3 = v6;
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if ([(QLItemViewController *)self draggableViewShouldStartDragSession:a4])
  {
    int v5 = [(QLItemViewController *)self context];
    id v6 = [v5 item];
    double v7 = [v6 editedFileURL];

    if (v7
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          double v8 = objc_claimAutoreleasedReturnValue(),
          [v7 path],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v8 fileExistsAtPath:v9],
          v9,
          v8,
          v10))
    {
      long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithContentsOfURL:v7];
    }
    else
    {
      double v13 = [(QLItemViewController *)self context];
      uint64_t v14 = [v13 item];
      double v15 = [v14 fetcher];
      long long v11 = (void *)[v15 newItemProvider];
    }
    double v16 = [(QLItemViewController *)self context];
    uint64_t v17 = [v16 previewTitle];
    [v11 setSuggestedName:v17];

    double v18 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v11];
    v20[0] = v18;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  }
  else
  {
    double v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v12;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  int v5 = [(QLItemViewController *)self delegate];
  int64_t v6 = [v5 dragDataOwnerForPreviewItemViewController:self];

  return v6;
}

- (void)savePreviewEditedCopyWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)editedCopyToSaveChangesWithOutputType:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(QLItemViewController *)self context];
  uint64_t v9 = [v8 item];

  int v10 = [(QLItemViewController *)self saveEditsQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke;
  v14[3] = &unk_1E6DD41E0;
  id v15 = v9;
  id v16 = v6;
  uint64_t v17 = self;
  id v18 = v7;
  id v11 = v6;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, v14);
}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 editedCopy];
    if (v3)
    {
      BOOL v4 = (void *)v3;
      int v5 = [*(id *)(a1 + 32) editedCopy];
      if ([v5 containerStillExists])
      {
        id v6 = (void *)MEMORY[0x1E4F442D8];
        id v7 = [*(id *)(a1 + 32) editedCopy];
        double v8 = [v7 outputURLContentType];
        uint64_t v9 = [v6 typeWithIdentifier:v8];
        int v10 = [v9 isEqual:*(void *)(a1 + 40)];

        if (v10)
        {
          id v11 = [*(id *)(a1 + 32) editedCopy];
          id v20 = [v11 containerURL];

          if ([*(id *)(a1 + 32) shouldCreateTemporaryDirectoryInHost])
          {
            int v12 = [v20 startAccessingSecurityScopedResource];
            uint64_t v13 = *(void *)(a1 + 56);
            uint64_t v14 = [*(id *)(a1 + 32) editedCopy];
            (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);

            id v15 = v20;
            if (!v12)
            {
LABEL_15:

              return;
            }
            [v20 stopAccessingSecurityScopedResource];
          }
          else
          {
            uint64_t v18 = *(void *)(a1 + 56);
            double v19 = [*(id *)(a1 + 32) editedCopy];
            (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v19, 0);
          }
          id v15 = v20;
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    uint64_t v17 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_2;
    v21[3] = &unk_1E6DD41B8;
    v21[4] = *(void *)(a1 + 48);
    id v22 = v17;
    id v23 = *(id *)(a1 + 40);
    id v24 = *(id *)(a1 + 56);
    [v22 prepareSaveURL:v21];

    return;
  }
  id v16 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  v16();
}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_2(id *a1)
{
  double v2 = [a1[4] saveEditsQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_3;
  v5[3] = &unk_1E6DD41B8;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  id v9 = a1[7];
  dispatch_async(v2, v5);
}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldCreateTemporaryDirectoryInHost];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = [v3 delegate];
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_4;
    v9[3] = &unk_1E6DD4190;
    v9[4] = v5;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    [v4 previewItemViewController:v5 requestsTemporaryEditDirectoryWithCompletionHandler:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    [v3 createEditedCopyForItem:v6 outputType:v7 directoryURL:0 completionHandler:v8];
  }
}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) saveEditsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_5;
  block[3] = &unk_1E6DD4168;
  uint64_t v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, block);
}

void __80__QLItemViewController_editedCopyToSaveChangesWithOutputType_completionHandler___block_invoke_5(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) url];
  [v2 createEditedCopyForItem:v3 outputType:v4 directoryURL:v5 completionHandler:*(void *)(a1 + 64)];
}

- (void)createEditedCopyForItem:(id)a3 outputType:(id)a4 directoryURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void *, void))a6;
  id v12 = v10;
  id v13 = a4;
  uint64_t v14 = [v9 shouldCreateTemporaryDirectoryInHost];
  id v15 = [v9 saveURL];

  id v16 = (void *)MEMORY[0x1E4F1CB10];
  if (!v15)
  {
    id v24 = [v9 uuid];
    id v19 = [v16 _QLTemporaryFileURLWithType:v13 uuid:v24];

    id v20 = v12;
    if (!v19) {
      goto LABEL_8;
    }
LABEL_6:
    if (v20)
    {
      id v25 = [[QLPreviewItemEditedCopy alloc] initWithEditedCopyURL:v19 containerTemporaryURL:v20 temporaryDirectoryCreatedInHost:v14];
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v17 = [v9 saveURL];
  id v30 = v12;
  id v31 = 0;
  uint64_t v18 = [v9 uuid];
  [v16 _QLTemporaryFileURLWithType:v13 forOriginalFileAtURL:v17 temporaryFileURL:&v31 temporaryDirectoryURL:&v30 fallbackUUID:v18];

  id v19 = v31;
  id v20 = v30;

  if (!v19) {
    goto LABEL_11;
  }
  *(_DWORD *)double v29 = 2;
  double v21 = copyfile_state_alloc();
  copyfile_state_set(v21, 0x100u, v29);
  objc_msgSend(v9, "saveURL", *(void *)v29);
  id v22 = objc_claimAutoreleasedReturnValue();
  id v23 = (const char *)[v22 fileSystemRepresentation];
  id v19 = v19;
  copyfile(v23, (const char *)[v19 fileSystemRepresentation], v21, 4u);

  copyfile_state_free(v21);
  if (v19) {
    goto LABEL_6;
  }
LABEL_8:
  if (v19)
  {
    id v25 = [[QLPreviewItemEditedCopy alloc] initWithEditedCopyURL:v19];
LABEL_10:
    double v26 = v25;
    if (v25) {
      goto LABEL_16;
    }
  }
LABEL_11:
  CGRect v27 = (NSObject **)MEMORY[0x1E4F945F0];
  double v28 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    double v28 = *v27;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v29 = 0;
    _os_log_impl(&dword_1E2805000, v28, OS_LOG_TYPE_ERROR, "Could not create QLPreviewItemEditedCopy because could not generate a URL to save the file. #AnyItemViewController", v29, 2u);
  }
  double v26 = 0;
LABEL_16:
  [v9 setEditedCopy:v26];
  if (v14) {
    LODWORD(v14) = [v20 startAccessingSecurityScopedResource];
  }
  if (v11) {
    v11[2](v11, v26, 0);
  }
  if (v14) {
    [v20 stopAccessingSecurityScopedResource];
  }
}

- (void)showSaveEditsProgressIndicatorAfterDelay
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__QLItemViewController_showSaveEditsProgressIndicatorAfterDelay__block_invoke;
  v2[3] = &unk_1E6DD3DB8;
  v2[4] = self;
  QLRunInMainThread(v2);
}

uint64_t __64__QLItemViewController_showSaveEditsProgressIndicatorAfterDelay__block_invoke(uint64_t a1, double a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 1064))
  {
    uint64_t v3 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v4 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v21 = 0;
      _os_log_impl(&dword_1E2805000, v4, OS_LOG_TYPE_FAULT, "_saveEditProgressView should be nil when showSaveEditsProgressIndicatorAfterDelay is called. #Media", v21, 2u);
    }
    [*(id *)(a1 + 32) hideSaveEditProgressIndicator];
  }
  gotLoadHelper_x8__OBJC_CLASS___PUProgressIndicatorView(a2);
  uint64_t v6 = [objc_alloc(*(Class *)(v5 + 872)) initWithStyle:0];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1064);
  *(void *)(v7 + 1064) = v6;

  id v9 = [*(id *)(a1 + 32) editProgressIndicatorMessage];
  [*(id *)(*(void *)(a1 + 32) + 1064) setLocalizedMessage:v9];

  [*(id *)(*(void *)(a1 + 32) + 1064) setShowsBackground:1];
  [*(id *)(*(void *)(a1 + 32) + 1064) setDeterminate:0];
  [*(id *)(*(void *)(a1 + 32) + 1064) setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [*(id *)(a1 + 32) view];
  [v10 addSubview:*(void *)(*(void *)(a1 + 32) + 1064)];

  id v11 = [*(id *)(a1 + 32) view];
  id v12 = (void *)MEMORY[0x1E4F28DC8];
  id v13 = [*(id *)(a1 + 32) view];
  uint64_t v14 = [v12 constraintWithItem:v13 attribute:9 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 32) + 1064) attribute:9 multiplier:1.0 constant:0.0];
  [v11 addConstraint:v14];

  id v15 = [*(id *)(a1 + 32) view];
  id v16 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v17 = [*(id *)(a1 + 32) view];
  uint64_t v18 = [v16 constraintWithItem:v17 attribute:10 relatedBy:0 toItem:*(void *)(*(void *)(a1 + 32) + 1064) attribute:10 multiplier:1.0 constant:0.0];
  [v15 addConstraint:v18];

  id v19 = [*(id *)(a1 + 32) view];
  [v19 bringSubviewToFront:*(void *)(*(void *)(a1 + 32) + 1064)];

  return [*(id *)(*(void *)(a1 + 32) + 1064) beginShowingProgressWithDelay:1 animated:0.6];
}

- (void)hideSaveEditProgressIndicator
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__QLItemViewController_hideSaveEditProgressIndicator__block_invoke;
  v2[3] = &unk_1E6DD3DB8;
  v2[4] = self;
  QLRunInMainThread(v2);
}

void __53__QLItemViewController_hideSaveEditProgressIndicator__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1064) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1064);
  *(void *)(v2 + 1064) = 0;
}

- (id)editProgressIndicatorMessage
{
  return QLLocalizedString(@"Saving Changes");
}

- (OS_dispatch_queue)saveEditsQueue
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_saveEditsQueue)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.quicklook.editing.saveEditsQueue", 0);
    saveEditsQueue = v2->_saveEditsQueue;
    v2->_saveEditsQueue = (OS_dispatch_queue *)v3;
  }
  objc_sync_exit(v2);

  uint64_t v5 = v2->_saveEditsQueue;
  return v5;
}

- (void)didStartSavingEdits
{
  self->_isSavingEdits = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43__QLItemViewController_didStartSavingEdits__block_invoke;
  v2[3] = &unk_1E6DD3DB8;
  v2[4] = self;
  QLRunInMainThread(v2);
}

uint64_t __43__QLItemViewController_didStartSavingEdits__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInterfaceForSavingEdits];
}

- (void)didFinishSavingEdits
{
  self->_isSavingEdits = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__QLItemViewController_didFinishSavingEdits__block_invoke;
  v2[3] = &unk_1E6DD3DB8;
  v2[4] = self;
  QLRunInMainThread(v2);
}

uint64_t __44__QLItemViewController_didFinishSavingEdits__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInterfaceAfterSavingEdits];
}

- (void)updateInterfaceForSavingEdits
{
  id v2 = [(QLItemViewController *)self view];
  [v2 setUserInteractionEnabled:0];
}

- (void)updateInterfaceAfterSavingEdits
{
  id v2 = [(QLItemViewController *)self view];
  [v2 setUserInteractionEnabled:1];
}

- (NSString)description
{
  dispatch_queue_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)QLItemViewController;
  uint64_t v4 = [(QLItemViewController *)&v8 description];
  uint64_t v5 = [(QLItemViewController *)self additionalItemViewControllerDescription];
  uint64_t v6 = [v3 stringWithFormat:@"%@ {\n%@\n}", v4, v5];

  return (NSString *)v6;
}

- (id)additionalItemViewControllerDescription
{
  id v2 = NSString;
  dispatch_queue_t v3 = [(QLItemViewController *)self contents];
  uint64_t v4 = [v2 stringWithFormat:@"\tContents: %@", v3];

  return v4;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (QLPreviewItemViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (QLPreviewItemViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void)setDragInteraction:(id)a3
{
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)loadingFailed
{
  return self->_loadingFailed;
}

- (void)setLoadingFailed:(BOOL)a3
{
  self->_loadingFailed = a3;
}

- (id)contents
{
  return objc_getProperty(self, a2, 1032, 1);
}

- (void)setContents:(id)a3
{
}

- (QLPreviewContext)context
{
  return (QLPreviewContext *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setContext:(id)a3
{
}

- (QLAppearance)appearance
{
  return self->_appearance;
}

- (QLItemViewControllerPresentingDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);
  return (QLItemViewControllerPresentingDelegate *)WeakRetained;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (PUProgressIndicatorView)saveEditProgressView
{
  return self->_saveEditProgressView;
}

- (void)setSaveEditProgressView:(id)a3
{
}

- (void)setSaveEditsQueue:(id)a3
{
}

- (BOOL)isSavingEdits
{
  return self->_isSavingEdits;
}

- (void)setIsSavingEdits:(BOOL)a3
{
  self->_isSavingEdits = a3;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveEditsQueue, 0);
  objc_storeStrong((id *)&self->_saveEditProgressView, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_contents, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 0;
}

@end