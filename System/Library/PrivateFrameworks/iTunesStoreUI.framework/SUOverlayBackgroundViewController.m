@interface SUOverlayBackgroundViewController
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldExcludeFromNavigationHistory;
- (CGRect)_centeredFrameForViewController:(id)a3;
- (CGRect)_frameForSlideFromBottomForViewController:(id)a3;
- (NSArray)viewControllers;
- (SUOverlayBackgroundDelegate)delegate;
- (SUOverlayBackgroundViewController)init;
- (SUOverlayViewController)selectedViewController;
- (double)_viewControllerHorizontalPadding;
- (double)_viewControllerKeyboardOffset;
- (id)_copyTransitionForTransition:(id)a3 action:(id)a4;
- (id)_selectedViewController;
- (id)copyArchivableContext;
- (id)copyArchivableJetsamContext;
- (id)copyChildViewControllersForReason:(int64_t)a3;
- (id)viewControllerForScriptWindowContext:(id)a3;
- (void)_addViewController:(id)a3;
- (void)_backgroundAnimationDidStop:(id)a3 finished:(id)a4 context:(void *)a5;
- (void)_captureViewAction:(id)a3;
- (void)_enqueueAction:(id)a3;
- (void)_finishDismissAction:(id)a3;
- (void)_finishDismissEverythingAction:(id)a3;
- (void)_finishDismissOfViewController:(id)a3 animated:(BOOL)a4;
- (void)_finishPresentAction:(id)a3;
- (void)_layoutForKeyboardChangeWithInfo:(id)a3;
- (void)_overlayActionDidFinish;
- (void)_overlayAnimationDidFinish;
- (void)_performDismissAction:(id)a3;
- (void)_performDismissEverythingAction:(id)a3;
- (void)_performFlipForAction:(id)a3;
- (void)_performNextAction;
- (void)_performPresentAction:(id)a3;
- (void)_reloadGestureRecognizers;
- (void)_removeViewController:(id)a3;
- (void)_sendDidDismiss;
- (void)_shouldDismissFinishedWithValue:(id)a3;
- (void)_swipe:(id)a3;
- (void)_tearDownFlipView;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissOverlay:(id)a3 animated:(BOOL)a4;
- (void)keyboardWillHideWithInfo:(id)a3;
- (void)keyboardWillShowWithInfo:(id)a3;
- (void)layoutViewControllers;
- (void)loadView;
- (void)overlayPageViewTapped:(id)a3;
- (void)populateNavigationHistoryWithItems:(id)a3;
- (void)presentOverlay:(id)a3 withTransition:(id)a4;
- (void)restoreArchivableContext:(id)a3;
- (void)scalingFlipViewDidFinish:(id)a3;
- (void)setDelegate:(id)a3;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation SUOverlayBackgroundViewController

- (SUOverlayBackgroundViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUOverlayBackgroundViewController;
  v2 = [(SUViewController *)&v4 init];
  if (v2)
  {
    v2->_viewControllers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v2->_selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(SUOverlayBackgroundViewController *)self _tearDownFlipView];
  if (self->_swipeGestureRecognizer) {
    -[SUTouchCaptureView removeGestureRecognizer:](self->_captureView, "removeGestureRecognizer:");
  }
  [(SUTouchCaptureView *)self->_captureView removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  self->_captureView = 0;
  [(UISwipeGestureRecognizer *)self->_swipeGestureRecognizer setDelegate:0];

  self->_swipeGestureRecognizer = 0;
  self->_actionQueue = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v4 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(viewControllers);
        }
        [(SUOverlayBackgroundViewController *)self removeChildViewController:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->_viewControllers = 0;
  v8.receiver = self;
  v8.super_class = (Class)SUOverlayBackgroundViewController;
  [(SUViewController *)&v8 dealloc];
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_viewControllers count])
  {
    objc_super v8 = objc_alloc_init(SUOverlayAction);
    [(SUOverlayAction *)v8 setActionType:2];
    id v5 = [(SUOverlayBackgroundViewController *)self _selectedViewController];
    [(SUOverlayAction *)v8 setViewController:v5];
    if (v3)
    {
      uint64_t v6 = [v5 presentationTransition];
      if (v6)
      {
        v7 = [(SUOverlayBackgroundViewController *)self _copyTransitionForTransition:v6 action:v8];
      }
      else
      {
        v7 = objc_alloc_init(SUOverlayTransition);
        [(SUOverlayTransition *)v7 setType:2];
      }
      [(SUOverlayAction *)v8 setTransition:v7];
    }
    [(SUOverlayBackgroundViewController *)self _enqueueAction:v8];
  }
  else
  {
    [(SUOverlayBackgroundViewController *)self _sendDidDismiss];
  }
}

- (void)dismissOverlay:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  long long v9 = objc_alloc_init(SUOverlayAction);
  [(SUOverlayAction *)v9 setActionType:1];
  [(SUOverlayAction *)v9 setViewController:a3];
  if (v4)
  {
    uint64_t v7 = [a3 presentationTransition];
    if (v7)
    {
      objc_super v8 = [(SUOverlayBackgroundViewController *)self _copyTransitionForTransition:v7 action:v9];
    }
    else
    {
      objc_super v8 = objc_alloc_init(SUOverlayTransition);
      [(SUOverlayTransition *)v8 setType:2];
    }
    [(SUOverlayAction *)v9 setTransition:v8];
  }
  [(SUOverlayBackgroundViewController *)self _enqueueAction:v9];
}

- (void)layoutViewControllers
{
  id v3 = [(SUOverlayBackgroundViewController *)self _selectedViewController];
  if (v3)
  {
    BOOL v4 = v3;
    [(SUOverlayBackgroundViewController *)self _viewControllerKeyboardOffset];
    double v6 = v5;
    [(SUOverlayBackgroundViewController *)self _centeredFrameForViewController:v4];
    double v8 = v7;
    objc_msgSend((id)objc_msgSend(v4, "view"), "setFrame:", v7, fmax(v9 - v6, 20.0), v10, v11);
    objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "bounds");
    CGFloat v13 = v12;
    double v43 = v15;
    double v44 = v14;
    CGFloat rect = v16;
    [(SUOverlayBackgroundViewController *)self _viewControllerHorizontalPadding];
    double v18 = v17;
    uint64_t v19 = [(NSMutableArray *)self->_viewControllers count];
    int64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
    if (selectedViewControllerIndex >= 1)
    {
      unint64_t v21 = selectedViewControllerIndex + 1;
      double v22 = 0.0;
      do
      {
        v23 = (void *)[(NSMutableArray *)self->_viewControllers objectAtIndex:v21 - 2];
        [(SUOverlayBackgroundViewController *)self _centeredFrameForViewController:v23];
        double v25 = v24;
        objc_msgSend((id)objc_msgSend(v23, "view"), "setFrame:", v8 - v22 - v24 - v18, v26 - v6, v24, v27);
        double v22 = v22 + v18 + v25;
        --v21;
      }
      while (v21 > 1);
      int64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
    }
    double v45 = v6;
    int64_t v28 = selectedViewControllerIndex + 1;
    CGFloat v29 = v43;
    CGFloat v30 = v44;
    if (selectedViewControllerIndex + 1 < v19)
    {
      double v31 = 0.0;
      do
      {
        v32 = (void *)[(NSMutableArray *)self->_viewControllers objectAtIndex:v28];
        [(SUOverlayBackgroundViewController *)self _centeredFrameForViewController:v32];
        double v34 = v33;
        double v36 = v35;
        double v47 = v37;
        v48.origin.x = v13;
        v48.origin.y = v30;
        v48.size.width = rect;
        v48.size.height = v29;
        double v38 = v29;
        double v39 = v30;
        double v40 = v18 + v31 + CGRectGetMaxX(v48) + v36;
        v41 = (void *)[v32 view];
        double v42 = v40;
        CGFloat v30 = v39;
        CGFloat v29 = v38;
        objc_msgSend(v41, "setFrame:", v42, v34 - v45, v36, v47);
        double v31 = v31 + v18 + v36;
        ++v28;
      }
      while (v19 != v28);
    }
  }
}

- (void)populateNavigationHistoryWithItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(NSMutableArray *)self->_viewControllers count];
  unint64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if (v5 < selectedViewControllerIndex) {
    unint64_t selectedViewControllerIndex = v5;
  }
  self->_unint64_t selectedViewControllerIndex = selectedViewControllerIndex;
  double v7 = [(SUViewController *)self clientInterface];
  id v8 = [(SUViewController *)self viewControllerFactory];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        CGFloat v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v14 = (void *)[v8 newStorePageViewControllerWithSection:0];
        [v14 setClientInterface:v7];
        objc_msgSend(v14, "setTitle:", objc_msgSend(v13, "title"));
        objc_msgSend(v14, "setURLRequestProperties:", objc_msgSend(v13, "URLRequestProperties"));
        if (v14)
        {
          double v15 = objc_alloc_init(SUOverlayViewController);
          [(SUOverlayViewController *)v15 setBackViewController:v14];
          [(SUViewController *)v15 setClientInterface:v7];
          double v16 = objc_alloc_init(SUOverlayTransition);
          [(SUOverlayTransition *)v16 setType:2];
          [(SUOverlayViewController *)v15 setPresentationTransition:v16];

          [(SUOverlayBackgroundViewController *)self addChildViewController:v15];
          [(NSMutableArray *)self->_viewControllers insertObject:v15 atIndex:self->_selectedViewControllerIndex++];
          objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "addSubview:", -[SUOverlayViewController view](v15, "view"));
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  [(SUOverlayBackgroundViewController *)self layoutViewControllers];
}

- (void)presentOverlay:(id)a3 withTransition:(id)a4
{
  id v8 = objc_alloc_init(SUOverlayAction);
  [(SUOverlayAction *)v8 setActionType:0];
  [(SUOverlayAction *)v8 setViewController:a3];
  id v7 = [(SUOverlayBackgroundViewController *)self _copyTransitionForTransition:a4 action:v8];
  [(SUOverlayAction *)v8 setTransition:v7];

  [(SUOverlayBackgroundViewController *)self _enqueueAction:v8];
}

- (SUOverlayViewController)selectedViewController
{
  unint64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if (selectedViewControllerIndex >= [(NSMutableArray *)self->_viewControllers count]) {
    return 0;
  }
  viewControllers = self->_viewControllers;
  int64_t v5 = self->_selectedViewControllerIndex;

  return (SUOverlayViewController *)[(NSMutableArray *)viewControllers objectAtIndex:v5];
}

- (id)viewControllerForScriptWindowContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v4 = [a3 tag];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v6 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(viewControllers);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "scriptWindowContext"), "tag") == v4) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)copyChildViewControllersForReason:(int64_t)a3
{
  unint64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
  unint64_t v6 = [(NSMutableArray *)self->_viewControllers count];
  if (a3 || selectedViewControllerIndex >= v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)SUOverlayBackgroundViewController;
    return [(SUViewController *)&v9 copyChildViewControllersForReason:a3];
  }
  else
  {
    uint64_t v7 = (void *)-[NSMutableArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", self->_selectedViewControllerIndex, 1);
    return v7;
  }
}

- (id)copyArchivableContext
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(SUOverlayBackgroundViewController *)self shouldExcludeFromNavigationHistory])
  {
    return 0;
  }
  id v3 = objc_alloc_init(SUViewControllerContext);
  [(SUViewControllerContext *)v3 setType:2];
  -[SUViewControllerContext setValue:forMetadataKey:](v3, "setValue:forMetadataKey:", [NSNumber numberWithInteger:self->_selectedViewControllerIndex], @"selected-index");
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v6 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(viewControllers);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) copyArchivableContext];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          [v4 addObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  [(SUViewControllerContext *)v3 setValue:v4 forMetadataKey:@"sub-contexts"];

  return v3;
}

- (id)copyArchivableJetsamContext
{
  return 0;
}

- (void)keyboardWillHideWithInfo:(id)a3
{
  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_keyboardFrame.size = v5;
  [(SUOverlayBackgroundViewController *)self _layoutForKeyboardChangeWithInfo:"_layoutForKeyboardChangeWithInfo:"];
  v6.receiver = self;
  v6.super_class = (Class)SUOverlayBackgroundViewController;
  [(UIViewController *)&v6 keyboardWillHideWithInfo:a3];
}

- (void)keyboardWillShowWithInfo:(id)a3
{
  p_keyboardFrame = &self->_keyboardFrame;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x263F1D428]), "CGRectValue");
  p_keyboardFrame->origin.x = v6;
  p_keyboardFrame->origin.y = v7;
  p_keyboardFrame->size.width = v8;
  p_keyboardFrame->size.height = v9;
  objc_msgSend(MEMORY[0x263F1C920], "convertRect:toView:", -[SUOverlayBackgroundViewController view](self, "view"), p_keyboardFrame->origin.x, p_keyboardFrame->origin.y, p_keyboardFrame->size.width, p_keyboardFrame->size.height);
  p_keyboardFrame->origin.x = v10;
  p_keyboardFrame->origin.y = v11;
  p_keyboardFrame->size.width = v12;
  p_keyboardFrame->size.height = v13;
  if (![(SUOverlayBackgroundViewController *)self presentedViewController]) {
    [(SUOverlayBackgroundViewController *)self _layoutForKeyboardChangeWithInfo:a3];
  }
  v14.receiver = self;
  v14.super_class = (Class)SUOverlayBackgroundViewController;
  [(UIViewController *)&v14 keyboardWillShowWithInfo:a3];
}

- (void)loadView
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(SUTouchCaptureView);
  self->_captureView = v3;
  [(SUTouchCaptureView *)v3 addTarget:self action:sel__captureViewAction_ forControlEvents:64];
  [(SUTouchCaptureView *)self->_captureView setAutoresizingMask:18];
  -[SUTouchCaptureView setBackgroundColor:](self->_captureView, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  [(SUOverlayBackgroundViewController *)self setView:self->_captureView];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v5 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(viewControllers);
        }
        -[SUTouchCaptureView addSubview:](self->_captureView, "addSubview:", [*(id *)(*((void *)&v9 + 1) + 8 * i) view]);
      }
      uint64_t v6 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if ([(NSMutableArray *)self->_viewControllers count]) {
    -[SUTouchCaptureView setBackgroundColor:](self->_captureView, "setBackgroundColor:", [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.5]);
  }
  [(SUOverlayBackgroundViewController *)self _reloadGestureRecognizers];
}

- (void)restoreArchivableContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[a3 valueForMetadataKey:@"sub-contexts"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
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
        long long v10 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v9) copyViewController];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SUOverlayBackgroundViewController *)self _addViewController:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  long long v11 = (void *)[a3 valueForMetadataKey:@"selected-index"];
  if (v11)
  {
    unint64_t v12 = [v11 integerValue];
    unint64_t v13 = [(NSMutableArray *)self->_viewControllers count] - 1;
    if (v12 < v13) {
      unint64_t v13 = v12;
    }
    self->_unint64_t selectedViewControllerIndex = v13;
  }
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  v4.receiver = self;
  v4.super_class = (Class)SUOverlayBackgroundViewController;
  return [(SUViewController *)&v4 shouldExcludeFromNavigationHistory]
      || [(NSMutableArray *)self->_viewControllers count] == 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUOverlayBackgroundViewController *)self layoutViewControllers];
  v5.receiver = self;
  v5.super_class = (Class)SUOverlayBackgroundViewController;
  [(SUViewController *)&v5 viewDidAppear:v3];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  [(SUOverlayBackgroundViewController *)self layoutViewControllers];
  v7.receiver = self;
  v7.super_class = (Class)SUOverlayBackgroundViewController;
  [(SUViewController *)&v7 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
}

- (void)overlayPageViewTapped:(id)a3
{
  objc_super v5 = [(SUOverlayBackgroundViewController *)self selectedViewController];
  if (v5)
  {
    if (!self->_askingToDismissSelection)
    {
      uint64_t v6 = v5;
      if ([(NSMutableArray *)self->_viewControllers containsObject:a3])
      {
        self->_askingToDismissSelection = 1;
        objc_super v7 = [(SUOverlayViewController *)v6 shouldDismissFunction];
        uint64_t v8 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __59__SUOverlayBackgroundViewController_overlayPageViewTapped___block_invoke;
        v9[3] = &unk_2648137A8;
        v9[4] = v8;
        if (![(SUScriptFunction *)v7 callWithArguments:0 completionBlock:v9])
        {
          self->_askingToDismissSelection = 0;
          [(SUOverlayBackgroundViewController *)self dismissOverlay:v6 animated:1];
        }
      }
    }
  }
}

uint64_t __59__SUOverlayBackgroundViewController_overlayPageViewTapped___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (void *)[*(id *)(a1 + 32) object];

  return [v3 _shouldDismissFinishedWithValue:a2];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    viewControllers = self->_viewControllers;
    uint64_t v7 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(viewControllers);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if ([a3 isDescendantOfViewController:v11])
          {
            if (v11) {
              [(SUOverlayBackgroundViewController *)self dismissOverlay:v11 animated:1];
            }
            return;
          }
        }
        uint64_t v8 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)_captureViewAction:(id)a3
{
  if (!self->_askingToDismissEverything)
  {
    self->_askingToDismissEverything = 1;
    objc_super v4 = objc_msgSend(-[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController", a3), "shouldDismissFunction");
    uint64_t v5 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__SUOverlayBackgroundViewController__captureViewAction___block_invoke;
    v6[3] = &unk_2648137A8;
    v6[4] = v5;
    if (([v4 callWithArguments:0 completionBlock:v6] & 1) == 0)
    {
      self->_askingToDismissEverything = 0;
      [(SUOverlayBackgroundViewController *)self dismissAnimated:1];
    }
  }
}

uint64_t __56__SUOverlayBackgroundViewController__captureViewAction___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (void *)[*(id *)(a1 + 32) object];

  return [v3 _shouldDismissFinishedWithValue:a2];
}

- (void)_swipe:(id)a3
{
  if ([a3 state] == 3 && (unint64_t)-[NSMutableArray count](self->_viewControllers, "count") >= 2)
  {
    objc_super v4 = (void *)[(NSMutableArray *)self->_viewControllers objectAtIndex:self->_selectedViewControllerIndex];
    if ([v4 canSwipeToDismiss])
    {
      [(SUOverlayBackgroundViewController *)self dismissOverlay:v4 animated:1];
    }
  }
}

- (void)_backgroundAnimationDidStop:(id)a3 finished:(id)a4 context:(void *)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3, a4, a5), "endIgnoringInteractionEvents");

  [(SUOverlayBackgroundViewController *)self _overlayAnimationDidFinish];
}

- (void)scalingFlipViewDidFinish:(id)a3
{
  if (self->_activeFlipView == a3) {
    [(SUOverlayBackgroundViewController *)self _overlayAnimationDidFinish];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_enqueueAction:(id)a3
{
  actionQueue = self->_actionQueue;
  if (!actionQueue)
  {
    actionQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_actionQueue = actionQueue;
  }
  [(NSMutableArray *)actionQueue addObject:a3];
  if ([(NSMutableArray *)self->_actionQueue count] == 1)
  {
    [(SUOverlayBackgroundViewController *)self _performNextAction];
  }
}

- (void)_finishDismissAction:(id)a3
{
  uint64_t v5 = (void *)[a3 transition];
  objc_msgSend((id)objc_msgSend(v5, "sourceElement"), "setProperty:value:", @"opacity", @"1.0");
  uint64_t v6 = [a3 viewController];
  BOOL v7 = [v5 type] != 0;
  [(SUOverlayBackgroundViewController *)self _finishDismissOfViewController:v6 animated:v7];
  objc_msgSend((id)objc_msgSend(a3, "otherViewController"), "viewDidAppear:", v7);
  if ([(NSMutableArray *)self->_viewControllers count])
  {
    unint64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
    unint64_t v9 = [(NSMutableArray *)self->_viewControllers count] - 1;
    if (selectedViewControllerIndex < v9) {
      unint64_t v9 = selectedViewControllerIndex;
    }
    self->_unint64_t selectedViewControllerIndex = v9;
    [(SUOverlayBackgroundViewController *)self layoutViewControllers];
    [(SUOverlayBackgroundViewController *)self _reloadGestureRecognizers];
  }
  else
  {
    self->_unint64_t selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(SUOverlayBackgroundViewController *)self _sendDidDismiss];
  }
}

- (void)_finishDismissEverythingAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "transition"), "type");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v6 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(viewControllers);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "presentationTransition"), "sourceElement"), "setProperty:value:", @"opacity", @"1.0");
        [(SUOverlayBackgroundViewController *)self _finishDismissOfViewController:v10 animated:v4 != 0];
      }
      uint64_t v7 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSMutableArray *)self->_viewControllers removeAllObjects];
  self->_unint64_t selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
  [(SUOverlayBackgroundViewController *)self _sendDidDismiss];
}

- (void)_finishDismissOfViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isViewLoaded]) {
    objc_msgSend((id)objc_msgSend(a3, "view"), "removeFromSuperview");
  }
  [a3 viewDidDisappear:v4];
  [(SUOverlayBackgroundViewController *)self removeChildViewController:a3];
  [a3 invalidate];
  uint64_t v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v7 postNotificationName:@"SUOverlayDidDismissNotification" object:a3];
}

- (void)_finishPresentAction:(id)a3
{
  uint64_t v5 = (void *)[a3 viewController];
  uint64_t v6 = (void *)[(SUOverlayBackgroundViewController *)self view];
  uint64_t v7 = (void *)[v5 view];
  uint64_t v8 = [v7 superview];
  if (v8)
  {
    uint64_t v9 = v8;
    [v7 frame];
    objc_msgSend(v6, "convertRect:fromView:", v9);
  }
  else
  {
    [(SUOverlayBackgroundViewController *)self _centeredFrameForViewController:v5];
  }
  objc_msgSend(v7, "setFrame:");
  [v6 addSubview:v7];
  BOOL v10 = objc_msgSend((id)objc_msgSend(a3, "transition"), "type") != 0;
  objc_msgSend((id)objc_msgSend(a3, "otherViewController"), "viewDidDisappear:", v10);
  [v5 viewDidAppear:v10];
  if ([v5 isOnFront])
  {
    long long v11 = objc_msgSend((id)objc_msgSend(a3, "transition"), "copy");
    [v11 setType:1];
    [v5 flipWithTransition:v11];
  }
  self->_unint64_t selectedViewControllerIndex = [(NSMutableArray *)self->_viewControllers indexOfObjectIdenticalTo:v5];
  [(SUOverlayBackgroundViewController *)self layoutViewControllers];
  [(SUOverlayBackgroundViewController *)self _reloadGestureRecognizers];
  long long v12 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v12 postNotificationName:@"SUOverlayDidShowNotification" object:v5];
}

- (void)_overlayActionDidFinish
{
  BOOL v3 = (void *)[(NSMutableArray *)self->_actionQueue objectAtIndex:0];
  int v4 = [v3 actionType];
  if (v4)
  {
    if (v4 == 2)
    {
      [(SUOverlayBackgroundViewController *)self _finishDismissEverythingAction:v3];
    }
    else if (v4 == 1)
    {
      [(SUOverlayBackgroundViewController *)self _finishDismissAction:v3];
    }
  }
  else
  {
    [(SUOverlayBackgroundViewController *)self _finishPresentAction:v3];
  }
  [(SUScalingFlipView *)self->_activeFlipView removeFromSuperview];
  [(SUOverlayBackgroundViewController *)self _tearDownFlipView];
  [(NSMutableArray *)self->_actionQueue removeObjectAtIndex:0];

  [(SUOverlayBackgroundViewController *)self _performNextAction];
}

- (void)_overlayAnimationDidFinish
{
  BOOL v3 = (void *)[(NSMutableArray *)self->_actionQueue objectAtIndex:0];
  uint64_t v4 = [v3 animationCount];
  uint64_t v5 = v4 - 1;
  if (v4 >= 1)
  {
    [v3 setAnimationCount:v5];
    uint64_t v4 = v5;
  }
  if (!v4)
  {
    [(SUOverlayBackgroundViewController *)self _overlayActionDidFinish];
  }
}

- (void)_performDismissAction:(id)a3
{
  id v5 = (id)[a3 viewController];
  uint64_t v6 = (void *)[a3 transition];
  uint64_t v7 = [v6 type];
  [v5 viewWillDismissWithTransition:v6];
  [v5 viewWillDisappear:v7 != 0];
  uint64_t v8 = [(NSMutableArray *)self->_viewControllers count];
  if (v8 != 1)
  {
    int64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
    if (selectedViewControllerIndex == [(NSMutableArray *)self->_viewControllers indexOfObjectIdenticalTo:v5])--self->_selectedViewControllerIndex; {
  }
    }
  id v10 = [(SUOverlayBackgroundViewController *)self _selectedViewController];
  if (v10 == v5) {
    long long v11 = 0;
  }
  else {
    long long v11 = v10;
  }
  [a3 setOtherViewController:v11];
  [v11 viewWillAppear:v7 != 0];
  long long v12 = (void *)[(SUOverlayBackgroundViewController *)self view];
  if (v7)
  {
    [v6 duration];
    if (v8 != 1 && v7 != 2 && v7 != 3)
    {
      [(SUOverlayBackgroundViewController *)self _removeViewController:v5];
      goto LABEL_29;
    }
    double v16 = v13;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
    [MEMORY[0x263F1CB60] beginAnimations:0 context:0];
    [MEMORY[0x263F1CB60] setAnimationDelegate:self];
    [MEMORY[0x263F1CB60] setAnimationDidStopSelector:sel__backgroundAnimationDidStop_finished_context_];
    [MEMORY[0x263F1CB60] setAnimationDuration:v16];
    if (v8 == 1)
    {
      objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
    }
    else if (v7 == 2)
    {
      [(SUOverlayBackgroundViewController *)self layoutViewControllers];
LABEL_28:
      [(SUOverlayBackgroundViewController *)self _removeViewController:v5];
      objc_msgSend(a3, "setAnimationCount:", objc_msgSend(a3, "animationCount") + 1);
      [MEMORY[0x263F1CB60] commitAnimations];
LABEL_29:
      if (v7 == 1)
      {
        [(SUOverlayBackgroundViewController *)self _performFlipForAction:a3];
      }
      return;
    }
    if (v7 == 3)
    {
      [(SUOverlayBackgroundViewController *)self _removeViewController:v5];
      [(SUOverlayBackgroundViewController *)self layoutViewControllers];
      uint64_t v17 = (void *)[v5 view];
      [(SUOverlayBackgroundViewController *)self _frameForSlideFromBottomForViewController:v5];
      objc_msgSend(v17, "setFrame:");
    }
    goto LABEL_28;
  }
  [(SUOverlayBackgroundViewController *)self _removeViewController:v5];
  if (v8 == 1) {
    objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
  }
  else {
    [(SUOverlayBackgroundViewController *)self layoutViewControllers];
  }

  [(SUOverlayBackgroundViewController *)self _overlayActionDidFinish];
}

- (void)_performDismissEverythingAction:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = (void *)[a3 viewController];
  id v24 = a3;
  uint64_t v6 = (void *)[a3 transition];
  uint64_t v7 = [v6 type];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  viewControllers = self->_viewControllers;
  uint64_t v9 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(viewControllers);
        }
        double v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v13 viewWillDismissWithTransition:v6];
        [v13 viewWillDisappear:v7 != 0];
      }
      uint64_t v10 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }
  long long v14 = (void *)[(SUOverlayBackgroundViewController *)self view];
  if (v7)
  {
    uint64_t v23 = v14;
    if (v7 == 1) {
      [(SUOverlayBackgroundViewController *)self _performFlipForAction:v24];
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
    [MEMORY[0x263F1CB60] beginAnimations:0 context:0];
    [MEMORY[0x263F1CB60] setAnimationDelegate:self];
    [MEMORY[0x263F1CB60] setAnimationDidStopSelector:sel__backgroundAnimationDidStop_finished_context_];
    long long v15 = (void *)MEMORY[0x263F1CB60];
    [v6 duration];
    objc_msgSend(v15, "setAnimationDuration:");
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v16 = self->_viewControllers;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          if ([v21 isViewLoaded])
          {
            if (v21 != v5) {
              goto LABEL_18;
            }
            if (v7 != 1)
            {
              if (v7 != 3)
              {
LABEL_18:
                objc_msgSend((id)objc_msgSend(v21, "view"), "setAlpha:", 0.0);
                continue;
              }
              double v22 = (void *)[v5 view];
              [(SUOverlayBackgroundViewController *)self _frameForSlideFromBottomForViewController:v5];
              objc_msgSend(v22, "setFrame:");
            }
          }
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }
    objc_msgSend(v23, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
    objc_msgSend(v24, "setAnimationCount:", objc_msgSend(v24, "animationCount") + 1);
    [MEMORY[0x263F1CB60] commitAnimations];
  }
  else
  {
    objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
    [(SUOverlayBackgroundViewController *)self _overlayActionDidFinish];
  }
}

- (void)_performNextAction
{
  if ([(NSMutableArray *)self->_actionQueue count])
  {
    BOOL v3 = (void *)[(NSMutableArray *)self->_actionQueue objectAtIndex:0];
    switch([v3 actionType])
    {
      case 0u:
        [(SUOverlayBackgroundViewController *)self _performPresentAction:v3];
        break;
      case 1u:
        [(SUOverlayBackgroundViewController *)self _performDismissAction:v3];
        break;
      case 2u:
        [(SUOverlayBackgroundViewController *)self _performDismissEverythingAction:v3];
        break;
      case 3u:
        [(SUOverlayBackgroundViewController *)self _overlayActionDidFinish];
        break;
      default:
        return;
    }
  }
}

- (void)_performPresentAction:(id)a3
{
  id v5 = (void *)[a3 viewController];
  uint64_t v6 = (void *)[a3 transition];
  uint64_t v7 = [v6 type];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUOverlayWillShowNotification", v5);
  [v5 setPresentationTransition:v6];
  if (v7 == 2 && ([v5 isOnFront] & 1) == 0) {
    [v5 flipWithTransition:0];
  }
  [v5 viewWillAppear:v7 != 0];
  [(SUOverlayBackgroundViewController *)self _addViewController:v5];
  id v8 = [(SUOverlayBackgroundViewController *)self _selectedViewController];
  [a3 setOtherViewController:v8];
  [v8 viewWillDisappear:v7 != 0];
  uint64_t v9 = (void *)[(SUOverlayBackgroundViewController *)self view];
  if (v7)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
    uint64_t v10 = (void *)[v5 view];
    if (!v8)
    {
      self->_int64_t selectedViewControllerIndex = [(NSMutableArray *)self->_viewControllers count] - 1;
      [v10 setAlpha:0.0];
    }
    switch(v7)
    {
      case 1:
        [(SUOverlayBackgroundViewController *)self _performFlipForAction:a3];
        break;
      case 2:
        objc_msgSend(v9, "addSubview:", objc_msgSend(v5, "view"));
        [(SUOverlayBackgroundViewController *)self layoutViewControllers];
        break;
      case 3:
        [v9 addSubview:v10];
        [(SUOverlayBackgroundViewController *)self layoutViewControllers];
        [(SUOverlayBackgroundViewController *)self _frameForSlideFromBottomForViewController:v5];
        objc_msgSend(v10, "setFrame:");
        break;
    }
    self->_int64_t selectedViewControllerIndex = [(NSMutableArray *)self->_viewControllers count] - 1;
    [MEMORY[0x263F1CB60] beginAnimations:0 context:0];
    [MEMORY[0x263F1CB60] setAnimationDelegate:self];
    [MEMORY[0x263F1CB60] setAnimationDidStopSelector:sel__backgroundAnimationDidStop_finished_context_];
    uint64_t v11 = (void *)MEMORY[0x263F1CB60];
    [v6 duration];
    objc_msgSend(v11, "setAnimationDuration:");
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      [(SUOverlayBackgroundViewController *)self layoutViewControllers];
    }
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.5));
    [v10 setAlpha:1.0];
    objc_msgSend(a3, "setAnimationCount:", objc_msgSend(a3, "animationCount") + 1);
    long long v12 = (void *)MEMORY[0x263F1CB60];
    [v12 commitAnimations];
  }
  else
  {
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.5));
    [(SUOverlayBackgroundViewController *)self _overlayActionDidFinish];
  }
}

- (void)_addViewController:(id)a3
{
  -[NSMutableArray addObject:](self->_viewControllers, "addObject:");

  [(SUOverlayBackgroundViewController *)self addChildViewController:a3];
}

- (CGRect)_centeredFrameForViewController:(id)a3
{
  objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "bounds");
  double v5 = v4;
  double v7 = v6;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "statusBarFrame");
  double v9 = v8;
  double v11 = v10;
  if (a3) {
    [a3 overlaySize];
  }
  else {
    +[SUOverlayViewController defaultOverlaySize];
  }
  double v14 = v12;
  double v15 = v13;
  double v16 = floor((v5 - v12) * 0.5);
  if (v11 >= v9) {
    double v17 = v9;
  }
  else {
    double v17 = v11;
  }
  double v18 = floor((v7 - v13 - v17) * 0.5);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (id)_copyTransitionForTransition:(id)a3 action:(id)a4
{
  double v6 = (void *)[a3 copy];
  if ([v6 type] == 1)
  {
    int v7 = [a4 actionType];
    objc_msgSend((id)objc_msgSend(v6, "sourceElement"), "frame");
    double v9 = v8;
    double v11 = v10;
    double v12 = (void *)[a4 viewController];
    if (!objc_msgSend((id)objc_msgSend(v6, "sourceElement"), "imageRepresentation")
      || v11 < 0.00000011920929
      || v9 < 0.00000011920929)
    {
      goto LABEL_7;
    }
    if (!v7)
    {
      if (![(NSMutableArray *)self->_viewControllers count]) {
        return v6;
      }
      goto LABEL_7;
    }
    if ([v12 isOnFront]) {
LABEL_7:
    }
      [v6 setType:2];
  }
  return v6;
}

- (CGRect)_frameForSlideFromBottomForViewController:(id)a3
{
  objc_msgSend((id)-[SUOverlayBackgroundViewController view](self, "view"), "bounds");
  double v6 = v5;
  [(SUOverlayBackgroundViewController *)self _centeredFrameForViewController:a3];
  double v10 = v6 + floor((v6 - v9) * 0.5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v10;
  result.origin.x = v7;
  return result;
}

- (void)_layoutForKeyboardChangeWithInfo:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x263F1D3F0]), "unsignedIntegerValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x263F1D3F8]), "floatValue");
  if (v6 <= 2.2204e-16)
  {
    [(SUOverlayBackgroundViewController *)self layoutViewControllers];
  }
  else
  {
    double v7 = v6;
    [MEMORY[0x263F1CB60] beginAnimations:0 context:0];
    [MEMORY[0x263F1CB60] setAnimationCurve:v5];
    [MEMORY[0x263F1CB60] setAnimationDuration:v7];
    [(SUOverlayBackgroundViewController *)self layoutViewControllers];
    double v8 = (void *)MEMORY[0x263F1CB60];
    [v8 commitAnimations];
  }
}

- (void)_performFlipForAction:(id)a3
{
  uint64_t v5 = (void *)[a3 transition];
  float v6 = (void *)[a3 viewController];
  double v7 = (void *)[v5 sourceElement];
  uint64_t v8 = [v7 imageRepresentation];
  if (v8)
  {
    uint64_t v9 = v8;
    double v10 = (void *)[(SUOverlayBackgroundViewController *)self view];
    double v11 = (void *)[v6 view];
    if ((void *)[v11 superview] == v10) {
      uint64_t v12 = objc_msgSend((id)objc_msgSend(v10, "subviews"), "indexOfObjectIdenticalTo:", v11);
    }
    else {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v22 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v9];
    [v22 setContentMode:1];
    [v7 frame];
    if (v16 >= v15) {
      double v17 = v16;
    }
    else {
      double v17 = v15;
    }
    objc_msgSend(v10, "convertRect:fromView:", 0, v13 + floor((v15 - v17) * 0.5), v14 + floor((v16 - v17) * 0.5), v17, v17);
    objc_msgSend(v22, "setFrame:");
    if ([a3 actionType])
    {
      double v18 = [[SUScalingFlipView alloc] initWithFrontView:v11 backView:v22];
      self->_activeFlipView = v18;
      [(SUScalingFlipView *)v18 setDirection:1];
      activeFlipView = self->_activeFlipView;
    }
    else
    {
      [(SUOverlayBackgroundViewController *)self _centeredFrameForViewController:v6];
      objc_msgSend(v11, "setFrame:");
      activeFlipView = [[SUScalingFlipView alloc] initWithFrontView:v22 backView:v11];
      self->_activeFlipView = activeFlipView;
    }
    [(SUScalingFlipView *)activeFlipView setDelegate:self];
    long long v20 = self->_activeFlipView;
    [v5 duration];
    -[SUScalingFlipView setDuration:](v20, "setDuration:");
    long long v21 = self->_activeFlipView;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      [v10 addSubview:v21];
    }
    else {
      [v10 insertSubview:v21 atIndex:v12];
    }
    [v7 setProperty:@"opacity" value:@"0"];
    objc_msgSend(a3, "setAnimationCount:", objc_msgSend(a3, "animationCount") + 1);
    [(SUScalingFlipView *)self->_activeFlipView performFlip];
  }
}

- (void)_reloadGestureRecognizers
{
  char v3 = objc_msgSend(-[SUOverlayBackgroundViewController _selectedViewController](self, "_selectedViewController"), "canSwipeToDismiss");
  swipeGestureRecognizer = self->_swipeGestureRecognizer;
  if (v3)
  {
    if (!swipeGestureRecognizer)
    {
      uint64_t v5 = (UISwipeGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA00]) initWithTarget:self action:sel__swipe_];
      self->_swipeGestureRecognizer = v5;
      [(UISwipeGestureRecognizer *)v5 setDelegate:self];
      [(UISwipeGestureRecognizer *)self->_swipeGestureRecognizer setDirection:1];
      swipeGestureRecognizer = self->_swipeGestureRecognizer;
    }
    captureView = self->_captureView;
    [(SUTouchCaptureView *)captureView addGestureRecognizer:swipeGestureRecognizer];
  }
  else
  {
    if (swipeGestureRecognizer)
    {
      -[SUTouchCaptureView removeGestureRecognizer:](self->_captureView, "removeGestureRecognizer:");
      double v7 = self->_swipeGestureRecognizer;
    }
    else
    {
      double v7 = 0;
    }
    [(UISwipeGestureRecognizer *)v7 setDelegate:0];

    self->_swipeGestureRecognizer = 0;
  }
}

- (void)_removeViewController:(id)a3
{
  -[SUOverlayBackgroundViewController removeChildViewController:](self, "removeChildViewController:");
  viewControllers = self->_viewControllers;

  [(NSMutableArray *)viewControllers removeObject:a3];
}

- (id)_selectedViewController
{
  unint64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
  if ((selectedViewControllerIndex & 0x8000000000000000) != 0
    || selectedViewControllerIndex >= [(NSMutableArray *)self->_viewControllers count])
  {
    return 0;
  }
  viewControllers = self->_viewControllers;
  int64_t v5 = self->_selectedViewControllerIndex;

  return (id)[(NSMutableArray *)viewControllers objectAtIndex:v5];
}

- (void)_sendDidDismiss
{
  char v3 = self;
  delegate = self->_delegate;
  if (delegate)
  {
    [(SUOverlayBackgroundDelegate *)delegate scriptOverlayBackgroundDidDismiss:self];
  }
  else
  {
    [(UIViewController *)self dismissOverlayBackgroundViewController];
  }
}

- (void)_shouldDismissFinishedWithValue:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    int v5 = [a3 BOOLValue];
    if (self->_askingToDismissEverything)
    {
      self->_askingToDismissEverything = 0;
      if (!v5) {
        return;
      }
      goto LABEL_7;
    }
    if (!self->_askingToDismissSelection) {
      return;
    }
    self->_askingToDismissSelection = 0;
    if (!v5) {
      return;
    }
  }
  else
  {
    if (self->_askingToDismissEverything)
    {
      self->_askingToDismissEverything = 0;
LABEL_7:
      [(SUOverlayBackgroundViewController *)self dismissAnimated:1];
      return;
    }
    if (!self->_askingToDismissSelection) {
      return;
    }
    self->_askingToDismissSelection = 0;
  }
  id v6 = [(SUOverlayBackgroundViewController *)self _selectedViewController];

  [(SUOverlayBackgroundViewController *)self dismissOverlay:v6 animated:1];
}

- (void)_tearDownFlipView
{
  self->_activeFlipView = 0;
}

- (double)_viewControllerHorizontalPadding
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  double result = 20.0;
  if (v3 == 1)
  {
    int64_t v5 = [(SUViewController *)self interfaceOrientation];
    double result = 96.0;
    if ((unint64_t)(v5 - 1) < 2) {
      return 34.0;
    }
  }
  return result;
}

- (double)_viewControllerKeyboardOffset
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_keyboardFrame = &self->_keyboardFrame;
  double v3 = 0.0;
  if (self->_keyboardFrame.size.height > 0.00000011920929 && [(NSMutableArray *)self->_viewControllers count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    viewControllers = self->_viewControllers;
    uint64_t v6 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      double v3 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(viewControllers);
          }
          [(SUOverlayBackgroundViewController *)self _centeredFrameForViewController:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          double y = v19.origin.y;
          CGRect v20 = CGRectIntersection(v19, *p_keyboardFrame);
          if (y >= v20.size.height) {
            double height = v20.size.height;
          }
          else {
            double height = y;
          }
          if (v3 >= height) {
            double v3 = height;
          }
        }
        uint64_t v7 = [(NSMutableArray *)viewControllers countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      return 1.79769313e308;
    }
  }
  return v3;
}

- (SUOverlayBackgroundDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUOverlayBackgroundDelegate *)a3;
}

- (NSArray)viewControllers
{
  return &self->_viewControllers->super;
}

@end