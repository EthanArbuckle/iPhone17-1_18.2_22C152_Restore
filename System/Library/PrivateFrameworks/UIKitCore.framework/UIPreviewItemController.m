@interface UIPreviewItemController
- (BOOL)_isMobileSafariRestricted;
- (BOOL)_shouldCancelPreviewWithNegativeFeedback;
- (BOOL)interactionInProgress;
- (BOOL)performsCustomCommitTransitionForPreviewInteractionController:(id)a3;
- (BOOL)performsViewControllerCommitTransitionForPreviewInteractionController:(id)a3;
- (BOOL)previewInteractionController:(id)a3 shouldUseStandardRevealTransformForPreviewingAtLocation:(CGPoint)a4 inView:(id)a5;
- (NSArray)gestureRecognizers;
- (NSDictionary)previewData;
- (UIGestureRecognizer)presentationGestureRecognizer;
- (UIGestureRecognizer)presentationSecondaryGestureRecognizer;
- (UIPreviewItemController)init;
- (UIPreviewItemController)initWithView:(id)a3;
- (UIPreviewItemDelegate)delegate;
- (UIView)view;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtPosition:(CGPoint)a4 inView:(id)a5 presentingViewController:(id *)a6;
- (id)previewViewControllerForPosition:(CGPoint)a3 inSourceView:(id)a4 documentProperties:(id)a5;
- (int64_t)type;
- (void)clearPreviewIndicator;
- (void)dealloc;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)preparePreviewIndicatorViewInSourceView:(id)a3 updateScreen:(BOOL)a4;
- (void)previewInteractionController:(id)a3 didDismissViewController:(id)a4 committing:(BOOL)a5;
- (void)previewInteractionController:(id)a3 interactionProgress:(id)a4 forRevealAtLocation:(CGPoint)a5 inSourceView:(id)a6 containerView:(id)a7;
- (void)previewInteractionController:(id)a3 performCommitForPreviewViewController:(id)a4 committedViewController:(id)a5;
- (void)previewInteractionController:(id)a3 performCustomCommitForPreviewViewController:(id)a4 completion:(id)a5;
- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setupPreviewIndicatorInSourceView:(id)a3;
- (void)startInteraction;
- (void)stopInteraction;
- (void)updatePreviewIndicatorAnimation:(id)a3;
@end

@implementation UIPreviewItemController

- (UIPreviewItemController)init
{
  return [(UIPreviewItemController *)self initWithView:0];
}

- (UIPreviewItemController)initWithView:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)UIPreviewItemController;
    v5 = [(UIPreviewItemController *)&v21 init];
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_view, v4);
      v6->_type = 0;
      v6->_contentManagedByClient = 0;
      v7 = objc_alloc_init(UIPreviewInteractionController);
      previewInteractionController = v6->_previewInteractionController;
      v6->_previewInteractionController = v7;

      [(UIPreviewInteractionController *)v6->_previewInteractionController setDelegate:v6];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v9 = [(UIPreviewInteractionController *)v6->_previewInteractionController gestureRecognizers];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            [v4 addGestureRecognizer:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v11);
      }

      v14 = [(UIPreviewInteractionController *)v6->_previewInteractionController presentationGestureRecognizer];
      if [v14 _isGestureType:1] && (objc_opt_respondsToSelector()) {
        [v14 setDelay:0.13];
      }
      else {
        NSLog(&cfstr_WarningUiprevi.isa);
      }
    }
    self = v6;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(UIPreviewInteractionController *)self->_previewInteractionController gestureRecognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        [WeakRetained removeGestureRecognizer:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)UIPreviewItemController;
  [(UIPreviewItemController *)&v10 dealloc];
}

- (NSArray)gestureRecognizers
{
  return [(UIPreviewInteractionController *)self->_previewInteractionController gestureRecognizers];
}

- (UIGestureRecognizer)presentationGestureRecognizer
{
  return [(UIPreviewInteractionController *)self->_previewInteractionController beginPreviewGestureRecognizer];
}

- (UIGestureRecognizer)presentationSecondaryGestureRecognizer
{
  return [(UIPreviewInteractionController *)self->_previewInteractionController presentationGestureRecognizer];
}

- (BOOL)_shouldCancelPreviewWithNegativeFeedback
{
  if (self->_type == 2)
  {
    v3 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:UIPreviewDataLink];
    uint64_t v4 = [v3 scheme];
    uint64_t v5 = [v4 lowercaseString];
    if ([v5 isEqualToString:@"http"])
    {
    }
    else
    {
      uint64_t v7 = [v3 scheme];
      uint64_t v8 = [v7 lowercaseString];
      int v9 = [v8 isEqualToString:@"https"];

      if (!v9) {
        goto LABEL_11;
      }
    }
    if ([(UIPreviewItemController *)self _isMobileSafariRestricted]
      || ([v3 iTunesStoreURL], objc_super v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
    {
      previewData = self->_previewData;
      self->_previewData = 0;

      self->_type = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained _previewItemControllerDidCancelPreview:self];
      }
      long long v13 = +[UIDevice currentDevice];
      long long v14 = [v13 _tapticEngine];
      [v14 actuateFeedback:2];

      BOOL v6 = 1;
      goto LABEL_12;
    }
LABEL_11:
    BOOL v6 = 0;
LABEL_12:

    return v6;
  }
  return 0;
}

- (BOOL)_isMobileSafariRestricted
{
  v2 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilesafari"];
  v3 = [v2 appState];
  char v4 = [v3 isRestricted];

  return v4;
}

- (id)previewViewControllerForPosition:(CGPoint)a3 inSourceView:(id)a4 documentProperties:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v45[3] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(WeakRetained, "_interactionShouldBeginFromPreviewItemController:forPosition:", self, x, y))
  {
    v15 = 0;
    goto LABEL_41;
  }
  lookupItem = self->_lookupItem;
  self->_lookupItem = 0;

  self->_contentManagedByClient = 0;
  self->_type = 0;
  p_type = &self->_type;
  objc_msgSend(WeakRetained, "_dataForPreviewItemController:atPosition:type:", self, &self->_type, x, y);
  long long v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  previewData = self->_previewData;
  self->_previewData = v12;

  long long v14 = self->_previewData;
  if (!self->_type || !v14) {
    goto LABEL_7;
  }
  if ([(UIPreviewItemController *)self _shouldCancelPreviewWithNegativeFeedback])
  {
    long long v14 = self->_previewData;
LABEL_7:
    self->_previewData = 0;

    v15 = 0;
LABEL_8:
    self->_type = 0;
    goto LABEL_41;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [WeakRetained _presentedViewControllerForPreviewItemController:self];
    if (v16)
    {
      v15 = (void *)v16;
      self->_contentManagedByClient = 1;
      goto LABEL_41;
    }
  }
  int64_t v17 = *p_type;
  if (*p_type == 5)
  {
    id v22 = objc_alloc((Class)getMLULookupItemClass());
    long long v19 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:UIPreviewDataAttachmentList];
    long long v20 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:UIPreviewDataAttachmentIndex];
    objc_super v21 = (MLULookupItem *)objc_msgSend(v22, "initWithAttachments:currentAttachment:", v19, objc_msgSend(v20, "unsignedIntegerValue"));
LABEL_18:
    uint64_t v23 = self->_lookupItem;
    self->_lookupItem = v21;

    goto LABEL_29;
  }
  if (v17 != 4)
  {
    if (v17 != 2) {
      goto LABEL_29;
    }
    id v18 = objc_alloc((Class)getMLULookupItemClass());
    long long v19 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:UIPreviewDataLink];
    long long v20 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:UIPreviewDataDDResult];
    objc_super v21 = (MLULookupItem *)objc_msgSend(v18, "initWithURL:dataDetectorsResult:text:range:", v19, v20, &stru_1ED0E84C0, 0, 0);
    goto LABEL_18;
  }
  uint64_t v24 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:@"UIPreviewDataText"];
  v25 = (void *)v24;
  if (v24) {
    v26 = (__CFString *)v24;
  }
  else {
    v26 = &stru_1ED0E84C0;
  }
  v27 = v26;

  uint64_t v28 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:@"UIPreviewDataTextBefore"];
  v29 = (void *)v28;
  if (v28) {
    v30 = (__CFString *)v28;
  }
  else {
    v30 = &stru_1ED0E84C0;
  }
  v31 = v30;

  uint64_t v32 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:@"UIPreviewDataTextAfter"];
  v33 = (void *)v32;
  if (v32) {
    v34 = (__CFString *)v32;
  }
  else {
    v34 = &stru_1ED0E84C0;
  }
  v35 = v34;

  v45[0] = v31;
  v45[1] = v27;
  v45[2] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  v37 = [v36 componentsJoinedByString:&stru_1ED0E84C0];

  v38 = (MLULookupItem *)objc_msgSend(objc_alloc((Class)getMLULookupItemClass()), "initWithURL:dataDetectorsResult:text:range:", 0, 0, v37, -[__CFString length](v31, "length"), -[__CFString length](v27, "length"));
  v39 = self->_lookupItem;
  self->_lookupItem = v38;

LABEL_29:
  if (self->_lookupItem)
  {
    v40 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:UIPreviewDataDDContext];
    if (v40)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 addEntriesFromDictionary:v40];
      }
    }
    [(MLULookupItem *)self->_lookupItem setDocumentProperties:v8];
    if ([(MLULookupItem *)self->_lookupItem resolve])
    {
      v15 = [(MLULookupItem *)self->_lookupItem viewControllerToPresent];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  if (*p_type == 5)
  {
    v41 = [(NSDictionary *)self->_previewData objectForKeyedSubscript:@"UIPreviewDataAttachmentListIsContentManaged"];
    _UIShimSetIsContentManaged(v15, [v41 BOOLValue]);
  }
  if (!v15)
  {
    v43 = self->_lookupItem;
    self->_lookupItem = 0;

    v44 = self->_previewData;
    self->_previewData = 0;

    goto LABEL_8;
  }
LABEL_41:

  return v15;
}

- (void)previewInteractionController:(id)a3 performCommitForPreviewViewController:(id)a4 committedViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_contentManagedByClient)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained _previewItemController:self commitPreview:v10];
    }
    [(UIPreviewItemController *)self stopInteraction];
  }
  else
  {
    lookupItem = self->_lookupItem;
    if (lookupItem)
    {
      uint64_t v13 = [(MLULookupItem *)lookupItem commitType];
      if (v13 != 4)
      {
        if (v13 == 2)
        {
          presentingViewController = self->_presentingViewController;
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __118__UIPreviewItemController_previewInteractionController_performCommitForPreviewViewController_committedViewController___block_invoke;
          v15[3] = &unk_1E52D9F70;
          v15[4] = self;
          [(UIViewController *)presentingViewController presentViewController:v10 animated:0 completion:v15];
        }
        else
        {
          [(UIPreviewItemController *)self stopInteraction];
        }
      }
    }
  }
}

uint64_t __118__UIPreviewItemController_previewInteractionController_performCommitForPreviewViewController_committedViewController___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) commit];
  v2 = *(void **)(a1 + 32);
  return [v2 stopInteraction];
}

- (BOOL)performsViewControllerCommitTransitionForPreviewInteractionController:(id)a3
{
  return 1;
}

- (id)previewInteractionController:(id)a3 viewControllerForPreviewingAtPosition:(CGPoint)a4 inView:(id)a5 presentingViewController:(id *)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  long long v11 = [(UIPreviewItemController *)self presentingViewController];
  if (!v11)
  {
    id v12 = v10;
    if (v12)
    {
      uint64_t v13 = v12;
      long long v14 = 0;
      while (1)
      {
        if (v14)
        {
          v15 = [v14 parentViewController];

          if (!v15) {
            break;
          }
        }
        long long v11 = +[UIViewController viewControllerForView:v13];

        uint64_t v16 = [v13 superview];

        long long v14 = v11;
        uint64_t v13 = (void *)v16;
        if (!v16) {
          goto LABEL_10;
        }
      }
      long long v11 = v14;
LABEL_10:
    }
    else
    {
      long long v11 = 0;
    }
  }
  int64_t v17 = [v11 presentedViewController];

  if (v17)
  {

    long long v11 = 0;
  }
  if (a6) {
    *a6 = v11;
  }
  if (v11)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v18 setObject:v11 forKeyedSubscript:@"Presenter"];
    long long v19 = [(UIPreviewItemController *)self presentationGestureRecognizer];
    [v18 setObject:v19 forKeyedSubscript:@"Gesture"];

    -[UIPreviewItemController previewViewControllerForPosition:inSourceView:documentProperties:](self, "previewViewControllerForPosition:inSourceView:documentProperties:", v10, v18, x, y);
    long long v20 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    presentedViewController = self->_presentedViewController;
    self->_presentedViewController = v20;

    [v18 setObject:0 forKeyedSubscript:@"Gesture"];
    [v18 setObject:0 forKeyedSubscript:@"Presenter"];
    if (self->_presentedViewController) {
      objc_storeStrong((id *)&self->_presentingViewController, v11);
    }
  }
  id v22 = self->_presentedViewController;

  return v22;
}

- (BOOL)performsCustomCommitTransitionForPreviewInteractionController:(id)a3
{
  return [(MLULookupItem *)self->_lookupItem commitType] == 4;
}

- (void)previewInteractionController:(id)a3 performCustomCommitForPreviewViewController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  lookupItem = self->_lookupItem;
  id v9 = a4;
  id v10 = [(UIPreviewItemController *)self presentingViewController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __111__UIPreviewItemController_previewInteractionController_performCustomCommitForPreviewViewController_completion___block_invoke;
  v12[3] = &unk_1E52DB330;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [(MLULookupItem *)lookupItem commitWithTransitionForPreviewViewController:v9 inViewController:v10 completion:v12];
}

uint64_t __111__UIPreviewItemController_previewInteractionController_performCustomCommitForPreviewViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 stopInteraction];
}

- (BOOL)previewInteractionController:(id)a3 shouldUseStandardRevealTransformForPreviewingAtLocation:(CGPoint)a4 inView:(id)a5
{
  return self->_previewIndicatorUsesStandardAnimation || self->_previewIndicatorView == 0;
}

- (void)previewInteractionController:(id)a3 interactionProgress:(id)a4 forRevealAtLocation:(CGPoint)a5 inSourceView:(id)a6 containerView:(id)a7
{
  id v15 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if (!self->_previewIndicatorUsesStandardAnimation && self->_previewIndicatorView)
  {
    [(UIView *)self->_previewIndicatorImageView setAlpha:0.0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [(UIPreviewItemController *)self preparePreviewIndicatorViewInSourceView:WeakRetained updateScreen:0];

    [v13 addSubview:self->_previewIndicatorView];
    [v11 addProgressObserver:self];
  }
}

- (void)interactionProgressDidUpdate:(id)a3
{
  [a3 percentComplete];
  BOOL v5 = v4 <= 0.2;
  double v6 = 0.0;
  if (!v5) {
    double v6 = 1.0;
  }
  self->_previewIndicatorAnimationTargetAlpha = v6;
  if (!self->_previewIndicatorDisplayLink)
  {
    id v7 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel_updatePreviewIndicatorAnimation_];
    previewIndicatorDisplayLink = self->_previewIndicatorDisplayLink;
    self->_previewIndicatorDisplayLink = v7;

    id v9 = self->_previewIndicatorDisplayLink;
    id v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v9 addToRunLoop:v10 forMode:*MEMORY[0x1E4F1C3A0]];

    self->_lastPreviewIndicatorAnimationTimestamp = CACurrentMediaTime();
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  [(CADisplayLink *)self->_previewIndicatorDisplayLink invalidate];
  previewIndicatorDisplayLink = self->_previewIndicatorDisplayLink;
  self->_previewIndicatorDisplayLink = 0;
}

- (void)updatePreviewIndicatorAnimation:(id)a3
{
  [(UIView *)self->_previewIndicatorImageView alpha];
  previewIndicatorDisplayLink = self->_previewIndicatorDisplayLink;
  if (v5 == self->_previewIndicatorAnimationTargetAlpha)
  {
    [(CADisplayLink *)previewIndicatorDisplayLink invalidate];
    double v6 = self->_previewIndicatorDisplayLink;
    self->_previewIndicatorDisplayLink = 0;
  }
  else
  {
    [(CADisplayLink *)previewIndicatorDisplayLink timestamp];
    double previewIndicatorAnimationTargetAlpha = self->_previewIndicatorAnimationTargetAlpha;
    double v9 = (v8 - self->_lastPreviewIndicatorAnimationTimestamp) / 0.15;
    [(UIView *)self->_previewIndicatorImageView alpha];
    if (previewIndicatorAnimationTargetAlpha >= v10) {
      double v11 = v9;
    }
    else {
      double v11 = -v9;
    }
    [(UIView *)self->_previewIndicatorImageView alpha];
    double v13 = fmin(v12 + v11, 1.0);
    if (v13 < 0.0) {
      double v13 = 0.0;
    }
    [(UIView *)self->_previewIndicatorImageView setAlpha:v13];
    [(CADisplayLink *)self->_previewIndicatorDisplayLink timestamp];
    self->_lastPreviewIndicatorAnimationTimestamp = v14;
  }
}

- (void)previewInteractionController:(id)a3 willPresentViewController:(id)a4 forPosition:(CGPoint)a5 inSourceView:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v20 = a4;
  id v10 = a6;
  [(UIPreviewItemController *)self startInteraction];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_contentManagedByClient && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(WeakRetained, "_previewItemController:willPresentPreview:forPosition:inSourceView:", self, v20, v10, x, y);
  }
  objc_opt_class();
  self->_previewIndicatorUsesStandardAnimation = objc_opt_isKindOfClass() & 1;
  [(UIPreviewItemController *)self setupPreviewIndicatorInSourceView:v10];
  if (self->_previewIndicatorUsesStandardAnimation)
  {
    -[UIView setFrame:](self->_previewIndicatorView, "setFrame:", self->_previewIndicatorBoundingRect.origin.x, self->_previewIndicatorBoundingRect.origin.y, self->_previewIndicatorBoundingRect.size.width, self->_previewIndicatorBoundingRect.size.height);
    id v12 = objc_loadWeakRetained((id *)&self->_view);
    [(UIPreviewItemController *)self preparePreviewIndicatorViewInSourceView:v12 updateScreen:1];

    [v10 addSubview:self->_previewIndicatorView];
    double v13 = [v20 presentationController];
    [v13 setSourceView:self->_previewIndicatorView];

    double v14 = [v20 presentationController];
    [(UIView *)self->_previewIndicatorView bounds];
    long long v19 = v14;
  }
  else
  {
    long long v19 = [v20 presentationController];
    double v14 = v19;
    double v15 = self->_previewIndicatorBoundingRect.origin.x;
    double v16 = self->_previewIndicatorBoundingRect.origin.y;
    double width = self->_previewIndicatorBoundingRect.size.width;
    double height = self->_previewIndicatorBoundingRect.size.height;
  }
  objc_msgSend(v19, "setSourceRect:", v15, v16, width, height);
}

- (void)previewInteractionController:(id)a3 didDismissViewController:(id)a4 committing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_contentManagedByClient && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained _previewItemController:self didDismissPreview:v8 committing:v5];
  }
  [(UIPreviewItemController *)self stopInteraction];
  [(UIPreviewItemController *)self clearPreviewIndicator];
}

- (void)clearPreviewIndicator
{
  [(UIView *)self->_previewIndicatorView removeFromSuperview];
  previewIndicatorView = self->_previewIndicatorView;
  self->_previewIndicatorView = 0;

  [(UIView *)self->_previewIndicatorImageView removeFromSuperview];
  previewIndicatorImageView = self->_previewIndicatorImageView;
  self->_previewIndicatorImageView = 0;

  [(UIView *)self->_previewIndicatorSnapshotView removeFromSuperview];
  previewIndicatorSnapshotView = self->_previewIndicatorSnapshotView;
  self->_previewIndicatorSnapshotView = 0;

  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_previewIndicatorBoundingRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_previewIndicatorBoundingRect.size = v6;
}

- (void)preparePreviewIndicatorViewInSourceView:(id)a3 updateScreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 window];
  id v8 = [v6 window];
  objc_msgSend(v6, "convertRect:toView:", v8, self->_previewIndicatorBoundingRect.origin.x, self->_previewIndicatorBoundingRect.origin.y, self->_previewIndicatorBoundingRect.size.width, self->_previewIndicatorBoundingRect.size.height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  _UISnapshotViewRectAfterCommit(v7, v4, v10, v12, v14, v16);
  int64_t v17 = (UIView *)objc_claimAutoreleasedReturnValue();
  previewIndicatorSnapshotView = self->_previewIndicatorSnapshotView;
  self->_previewIndicatorSnapshotView = v17;

  [(UIView *)self->_previewIndicatorView insertSubview:self->_previewIndicatorSnapshotView atIndex:0];
  [(UIView *)self->_previewIndicatorView bounds];
  long long v19 = self->_previewIndicatorSnapshotView;
  -[UIView setFrame:](v19, "setFrame:");
}

- (void)setupPreviewIndicatorInSourceView:(id)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIPreviewItemController *)self clearPreviewIndicator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [WeakRetained _presentationRectsForPreviewItemController:self];
    if (!v6) {
      goto LABEL_25;
    }
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F29238];
    [WeakRetained _presentationRectForPreviewItemController:self];
    id v8 = objc_msgSend(v7, "valueWithCGRect:");
    v48[0] = v8;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];

    if (!v6) {
      goto LABEL_25;
    }
  }
  if ([v6 count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v43 + 1) + 8 * i) CGRectValue];
          v49.origin.double x = v14;
          v49.origin.double y = v15;
          v49.size.double width = v16;
          v49.size.double height = v17;
          self->_previewIndicatorBoundingRect = CGRectUnion(self->_previewIndicatorBoundingRect, v49);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v11);
    }

    id v18 = objc_alloc_init(UIView);
    previewIndicatorView = self->_previewIndicatorView;
    self->_previewIndicatorView = v18;

    if (objc_opt_respondsToSelector())
    {
      id v20 = [WeakRetained _presentationSnapshotForPreviewItemController:self];
      if (v20)
      {
        objc_super v21 = [[UIImageView alloc] initWithImage:v20];
        previewIndicatorImageView = self->_previewIndicatorImageView;
        self->_previewIndicatorImageView = v21;

        [(UIView *)self->_previewIndicatorView addSubview:self->_previewIndicatorImageView];
      }
    }
    uint64_t v23 = [v4 window];
    if (v23)
    {
      uint64_t v24 = [v4 window];
      v25 = [v24 screen];
      [v25 scale];
      double v27 = v26;
    }
    else
    {
      uint64_t v24 = +[UIScreen mainScreen];
      [v24 scale];
      double v27 = v28;
    }

    float v29 = v27;
    double v30 = (float)(v29 * 5.0);
    PathWithShrinkWrappedRects = (const CGPath *)WebKitCreatePathWithShrinkWrappedRects();
    if (!PathWithShrinkWrappedRects) {
      PathWithShrinkWrappedRects = CGPathCreateWithRoundedRect(self->_previewIndicatorBoundingRect, v30, v30, 0);
    }
    double width = self->_previewIndicatorBoundingRect.size.width;
    double height = self->_previewIndicatorBoundingRect.size.height;
    double v34 = 1.0;
    if (!self->_previewIndicatorUsesStandardAnimation)
    {
      objc_msgSend(v4, "convertRect:toView:", 0, self->_previewIndicatorBoundingRect.origin.x, self->_previewIndicatorBoundingRect.origin.y, self->_previewIndicatorBoundingRect.size.width, self->_previewIndicatorBoundingRect.size.height);
      double width = v35;
      double height = v36;
      float v37 = v35 / self->_previewIndicatorBoundingRect.size.width;
      double v34 = v37;
    }
    id v38 = objc_alloc_init(MEMORY[0x1E4F39C88]);
    [v38 setPath:PathWithShrinkWrappedRects];
    CGPathRelease(PathWithShrinkWrappedRects);
    objc_msgSend(v38, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    CATransform3DMakeScale(&v41, v34, v34, 1.0);
    CATransform3DTranslate(&v42, &v41, -self->_previewIndicatorBoundingRect.origin.x, -self->_previewIndicatorBoundingRect.origin.y, 0.0);
    CATransform3D v40 = v42;
    [v38 setTransform:&v40];
    v39 = [(UIView *)self->_previewIndicatorView layer];
    [v39 setMask:v38];

    -[UIView setFrame:](self->_previewIndicatorView, "setFrame:", 0.0, 0.0, width, height);
    [(UIView *)self->_previewIndicatorView bounds];
    -[UIImageView setFrame:](self->_previewIndicatorImageView, "setFrame:");
  }
LABEL_25:
}

- (void)startInteraction
{
  if (self->_interactionInProgress)
  {
    NSLog(&cfstr_Uipreviewitemc.isa, a2);
    [(UIPreviewItemController *)self stopInteraction];
  }
  self->_interactionInProgress = 1;
  objc_storeStrong((id *)&self->_strongSelf, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _interactionStartedFromPreviewItemController:self];
  }
}

- (void)stopInteraction
{
  if (self->_interactionInProgress)
  {
    self->_interactionInProgress = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained _interactionStoppedFromPreviewItemController:self];
    }
    lookupItem = self->_lookupItem;
    self->_lookupItem = 0;

    strongSelf = self->_strongSelf;
    self->_strongSelf = 0;

    presentingViewController = self->_presentingViewController;
    self->_presentingViewController = 0;

    presentedViewController = self->_presentedViewController;
    self->_presentedViewController = 0;

    previewData = self->_previewData;
    self->_type = 0;
    self->_previewData = 0;
  }
  else
  {
    NSLog(&cfstr_Uipreviewitemc_0.isa, a2);
  }
}

- (UIPreviewItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIPreviewItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)previewData
{
  return self->_previewData;
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (BOOL)interactionInProgress
{
  return self->_interactionInProgress;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_previewData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_previewIndicatorDisplayLink, 0);
  objc_storeStrong((id *)&self->_previewIndicatorSnapshotView, 0);
  objc_storeStrong((id *)&self->_previewIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_previewIndicatorView, 0);
  objc_storeStrong((id *)&self->_previewInteractionController, 0);
  objc_storeStrong((id *)&self->_lookupItem, 0);
}

@end