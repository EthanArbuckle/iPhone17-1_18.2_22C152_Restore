@interface SUOverlayViewController
+ (CGSize)defaultOverlaySize;
- (BOOL)_isControllerLoaded:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canSwipeToDismiss;
- (BOOL)isActiveOverlay;
- (BOOL)isOnFront;
- (BOOL)shouldExcludeFromNavigationHistory;
- (CGSize)overlaySize;
- (SUMaskProvider)maskProvider;
- (SUOverlayTransition)presentationTransition;
- (SUOverlayViewController)init;
- (SUOverlayViewController)initWithOverlayConfiguration:(id)a3;
- (SUScriptFunction)shouldDismissFunction;
- (UIViewController)backViewController;
- (UIViewController)frontViewController;
- (double)shadowOpacity;
- (double)shadowRadius;
- (id)_activeViewController;
- (id)_flipTransition;
- (id)_subviewContainerView;
- (id)copyArchivableContext;
- (id)scriptWindowContext;
- (void)_applyDisplayProperties;
- (void)_applyOverlayConfiguration:(id)a3;
- (void)_enqueueAction:(id)a3;
- (void)_finishFlipAction:(id)a3;
- (void)_overlayActionDidFinish;
- (void)_overlayAnimationDidFinish;
- (void)_performFlipAction:(id)a3;
- (void)_performFlipTransitionAction:(id)a3;
- (void)_performNextAction;
- (void)_setActiveViewController:(id)a3 updateInterface:(BOOL)a4;
- (void)_setShadowVisible:(BOOL)a3;
- (void)_tearDownTouchCaptureView;
- (void)_touchCaptureAction:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)flipWithTransition:(id)a3;
- (void)imagePageViewTapped:(id)a3;
- (void)invalidateForMemoryPurge;
- (void)loadView;
- (void)restoreArchivableContext:(id)a3;
- (void)setBackViewController:(id)a3;
- (void)setCanSwipeToDismiss:(BOOL)a3;
- (void)setFrontViewController:(id)a3;
- (void)setMaskProvider:(id)a3;
- (void)setOverlaySize:(CGSize)a3;
- (void)setPresentationTransition:(id)a3;
- (void)setScriptWindowContext:(id)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShouldDismissFunction:(id)a3;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDismissWithTransition:(id)a3;
@end

@implementation SUOverlayViewController

- (SUOverlayViewController)init
{
  return [(SUOverlayViewController *)self initWithOverlayConfiguration:0];
}

- (SUOverlayViewController)initWithOverlayConfiguration:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUOverlayViewController;
  v4 = [(SUViewController *)&v8 init];
  if (v4)
  {
    v4->_scriptWindowContext = objc_alloc_init(SUScriptWindowContext);
    v4->_canSwipeToDismiss = 1;
    [(id)objc_opt_class() defaultOverlaySize];
    v4->_overlaySize.width = v5;
    v4->_overlaySize.height = v6;
    v4->_shadowOpacity = 0.670000017;
    v4->_shadowRadius = 15.0;
    if (a3) {
      [(SUOverlayViewController *)v4 _applyOverlayConfiguration:a3];
    }
  }
  return v4;
}

- (void)dealloc
{
  [(SUOverlayViewController *)self _setActiveViewController:0 updateInterface:0];
  [(SUOverlayViewController *)self _tearDownTouchCaptureView];

  v3.receiver = self;
  v3.super_class = (Class)SUOverlayViewController;
  [(SUViewController *)&v3 dealloc];
}

+ (CGSize)defaultOverlaySize
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom");
  double v3 = 256.0;
  if (v2 == 1) {
    double v3 = 650.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)flipWithTransition:(id)a3
{
  CGFloat v6 = objc_alloc_init(SUOverlayAction);
  [(SUOverlayAction *)v6 setActionType:3];
  [(SUOverlayAction *)v6 setTransition:a3];
  [(SUOverlayAction *)v6 setViewController:[(SUOverlayViewController *)self _activeViewController]];
  lastFlipTransition = self->_lastFlipTransition;
  if (lastFlipTransition != a3)
  {

    self->_lastFlipTransition = (SUOverlayTransition *)[a3 copy];
  }
  [(SUOverlayViewController *)self _enqueueAction:v6];
}

- (BOOL)isActiveOverlay
{
  return objc_msgSend(-[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController"), "selectedViewController") == (void)self;
}

- (BOOL)isOnFront
{
  return [(SUOverlayViewController *)self _activeViewController] == self->_frontViewController;
}

- (SUMaskProvider)maskProvider
{
  return [(SUMaskedView *)self->_subviewContainerView maskProvider];
}

- (void)setBackViewController:(id)a3
{
  backViewController = self->_backViewController;
  if (backViewController != a3)
  {
    activeViewController = self->_activeViewController;
    if (activeViewController) {
      BOOL v7 = activeViewController == backViewController;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      [(SUOverlayViewController *)self _setActiveViewController:a3 updateInterface:1];
      backViewController = self->_backViewController;
    }

    self->_backViewController = (UIViewController *)a3;
  }
}

- (void)setFrontViewController:(id)a3
{
  frontViewController = self->_frontViewController;
  if (frontViewController != a3)
  {
    activeViewController = self->_activeViewController;
    if (activeViewController) {
      BOOL v7 = activeViewController == frontViewController;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      [(SUOverlayViewController *)self _setActiveViewController:a3 updateInterface:1];
      frontViewController = self->_frontViewController;
    }

    self->_frontViewController = (UIViewController *)a3;
  }
}

- (void)setMaskProvider:(id)a3
{
  objc_msgSend(-[SUOverlayViewController _subviewContainerView](self, "_subviewContainerView"), "setMaskProvider:", a3);

  [(SUOverlayViewController *)self _applyDisplayProperties];
}

- (void)setOverlaySize:(CGSize)a3
{
  if (self->_overlaySize.width != a3.width || self->_overlaySize.height != a3.height)
  {
    self->_overlaySize = a3;
    objc_msgSend(-[UIViewController overlayBackgroundViewController](self, "overlayBackgroundViewController"), "layoutViewControllers");
    [(SUOverlayViewController *)self _applyDisplayProperties];
  }
}

- (void)setScriptWindowContext:(id)a3
{
  if (self->_scriptWindowContext != a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      self->_scriptWindowContext = (SUScriptWindowContext *)a3;
    }
  }
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
  [(SUOverlayViewController *)self _applyDisplayProperties];
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
  [(SUOverlayViewController *)self _applyDisplayProperties];
}

- (void)viewWillDismissWithTransition:(id)a3
{
  if ([a3 type] == 1)
  {
    [(SUOverlayViewController *)self _setShadowVisible:0];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUOverlayViewController;
  BOOL v6 = [(SUViewController *)&v9 canPerformAction:a3 withSender:a4];
  if (v6)
  {
    if (sel_isEqual(a3, sel_storePage_finishedWithSuccess_))
    {
      int64_t state = self->_state;
      if ((state & 6) != 0) {
        LOBYTE(v6) = 0;
      }
      else {
        LOBYTE(v6) = state & 1;
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)copyArchivableContext
{
  v9.receiver = self;
  v9.super_class = (Class)SUOverlayViewController;
  id v3 = [(SUViewController *)&v9 copyArchivableContext];
  [v3 setType:3];
  if (![(SUOverlayViewController *)self shouldExcludeFromNavigationHistory])
  {
    id v4 = [(UIViewController *)self->_backViewController copyArchivableContext];
    CGFloat v5 = v4;
    if (v4 && [v4 type]) {
      [v3 setValue:v5 forMetadataKey:@"back"];
    }

    id v6 = [(UIViewController *)self->_frontViewController copyArchivableContext];
    BOOL v7 = v6;
    if (v6 && [v6 type]) {
      [v3 setValue:v7 forMetadataKey:@"front"];
    }

    objc_msgSend(v3, "setValue:forMetadataKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_activeViewController == self->_frontViewController), @"on-front");
    objc_msgSend(v3, "setValue:forMetadataKey:", -[SUOverlayViewController presentationTransition](self, "presentationTransition"), @"presentation");
  }
  return v3;
}

- (void)invalidateForMemoryPurge
{
  if (![(SUViewController *)self isVisible]
    && [(SUOverlayTransition *)self->_presentationTransition type] == 1)
  {
    [(SUOverlayTransition *)self->_presentationTransition setSourceElement:0];
    [(SUOverlayTransition *)self->_presentationTransition setType:2];
  }
  v3.receiver = self;
  v3.super_class = (Class)SUOverlayViewController;
  [(SUViewController *)&v3 invalidateForMemoryPurge];
}

- (void)loadView
{
  objc_super v3 = objc_msgSend(-[SUOverlayViewController _activeViewController](self, "_activeViewController"), "view");
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v6, v8, v10);
  [v12 setAutoresizingMask:18];
  id v13 = [(SUOverlayViewController *)self _subviewContainerView];
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
  [v12 addSubview:v13];
  [(SUOverlayViewController *)self setView:v12];

  objc_msgSend(v3, "setFrame:", v5, v7, v9, v11);
  [v13 addSubview:v3];
  [(SUOverlayViewController *)self _setShadowVisible:0];

  [(SUOverlayViewController *)self _applyDisplayProperties];
}

- (void)restoreArchivableContext:(id)a3
{
  double v5 = (void *)[a3 valueForMetadataKey:@"back"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = (void *)[v5 copyViewController];
    [(SUOverlayViewController *)self setBackViewController:v6];
  }
  double v7 = (void *)[a3 valueForMetadataKey:@"front"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = (void *)[v7 copyViewController];
    [(SUOverlayViewController *)self setFrontViewController:v8];
  }
  uint64_t v9 = [a3 valueForMetadataKey:@"presentation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUOverlayViewController *)self setPresentationTransition:v9];
  }
  backViewController = self->_backViewController;
  double v11 = (void *)[a3 valueForMetadataKey:@"on-front"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 BOOLValue]) {
    backViewController = self->_frontViewController;
  }
  [(SUOverlayViewController *)self _setActiveViewController:backViewController updateInterface:1];
  v12.receiver = self;
  v12.super_class = (Class)SUOverlayViewController;
  [(SUViewController *)&v12 restoreArchivableContext:a3];
}

- (id)scriptWindowContext
{
  return self->_scriptWindowContext;
}

- (BOOL)shouldExcludeFromNavigationHistory
{
  v9.receiver = self;
  v9.super_class = (Class)SUOverlayViewController;
  unsigned __int8 v3 = [(SUViewController *)&v9 shouldExcludeFromNavigationHistory];
  char v4 = objc_opt_respondsToSelector();
  char v5 = v4 | v3;
  if ((v4 & 1) != 0 && (v3 & 1) == 0) {
    char v5 = [(UIViewController *)self->_backViewController shouldExcludeFromNavigationHistory];
  }
  char v6 = objc_opt_respondsToSelector();
  char v7 = v6 | v5;
  if ((v6 & 1) != 0 && (v5 & 1) == 0) {
    char v7 = [(UIViewController *)self->_frontViewController shouldExcludeFromNavigationHistory];
  }
  return v7 & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUOverlayViewController *)self _setShadowVisible:1];
  v5.receiver = self;
  v5.super_class = (Class)SUOverlayViewController;
  [(SUViewController *)&v5 viewDidAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUOverlayViewController *)self isViewLoaded]) {
    subviewContainerView = self->_subviewContainerView;
  }
  else {
    subviewContainerView = 0;
  }
  if ([(SUMaskedView *)subviewContainerView window])
  {
    char v6 = objc_alloc_init(SUTouchCaptureView);
    self->_touchCaptureView = v6;
    [(SUTouchCaptureView *)v6 addTarget:self action:sel__touchCaptureAction_ forControlEvents:64];
    [(SUTouchCaptureView *)self->_touchCaptureView setAutoresizingMask:18];
    touchCaptureView = self->_touchCaptureView;
    [(SUMaskedView *)subviewContainerView bounds];
    -[SUTouchCaptureView setFrame:](touchCaptureView, "setFrame:");
    [(SUMaskedView *)subviewContainerView addSubview:self->_touchCaptureView];
  }
  v8.receiver = self;
  v8.super_class = (Class)SUOverlayViewController;
  [(SUViewController *)&v8 viewDidDisappear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(SUOverlayViewController *)self _activeViewController];
  [(SUOverlayViewController *)self _tearDownTouchCaptureView];
  v5.receiver = self;
  v5.super_class = (Class)SUOverlayViewController;
  [(SUViewController *)&v5 viewWillAppear:v3];
}

- (void)imagePageViewTapped:(id)a3
{
  id v4 = [(SUOverlayViewController *)self _flipTransition];

  [(SUOverlayViewController *)self flipWithTransition:v4];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 isDescendantOfViewController:self->_backViewController])
  {
    unint64_t v7 = self->_state & 0xFFFFFFFFFFFFFFFDLL;
    uint64_t v8 = 2;
  }
  else
  {
    int v9 = [a3 isDescendantOfViewController:self->_frontViewController];
    int64_t state = self->_state;
    if (!v9) {
      goto LABEL_8;
    }
    unint64_t v7 = state & 0xFFFFFFFFFFFFFFFBLL;
    uint64_t v8 = 4;
  }
  if (v4) {
    uint64_t v8 = 0;
  }
  int64_t state = v7 | v8;
  self->_int64_t state = state;
LABEL_8:
  self->_int64_t state = state & 0xFFFFFFFFFFFFFFFELL;
  if (!v4)
  {
    id v11 = [(SUOverlayViewController *)self _flipTransition];
    [(SUOverlayViewController *)self flipWithTransition:v11];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  [(SUOverlayViewController *)self _overlayAnimationDidFinish];
  BOOL v4 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  [v4 endIgnoringInteractionEvents];
}

- (void)_touchCaptureAction:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v4 sendAction:sel_overlayPageViewTapped_ to:0 from:self forEvent:0];
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
    [(SUOverlayViewController *)self _performNextAction];
  }
}

- (void)_finishFlipAction:(id)a3
{
  objc_super v5 = (UIViewController *)[a3 viewController];
  backViewController = self->_backViewController;
  if (v5 == backViewController) {
    backViewController = self->_frontViewController;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "transition"), "type");
  if ([(SUOverlayViewController *)self isViewLoaded])
  {
    BOOL v8 = v7 == 1;
    [(UIViewController *)v5 viewDidDisappear:v8];
    [(UIViewController *)backViewController viewDidAppear:v8];
    if (self->_touchCaptureView) {
      -[SUMaskedView bringSubviewToFront:](self->_subviewContainerView, "bringSubviewToFront:");
    }
    [(SUOverlayViewController *)self _setShadowVisible:1];
  }
  int v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v9 postNotificationName:@"SUOverlayDidFlipNotification" object:self];
}

- (void)_overlayActionDidFinish
{
  BOOL v3 = (void *)[(NSMutableArray *)self->_actionQueue objectAtIndex:0];
  if ([v3 actionType] == 3) {
    [(SUOverlayViewController *)self _finishFlipAction:v3];
  }
  [(NSMutableArray *)self->_actionQueue removeObjectAtIndex:0];

  [(SUOverlayViewController *)self _performNextAction];
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
    [(SUOverlayViewController *)self _overlayActionDidFinish];
  }
}

- (void)_performFlipAction:(id)a3
{
  uint64_t v5 = [a3 viewController];
  frontViewController = self->_frontViewController;
  if ((UIViewController *)v5 == frontViewController) {
    frontViewController = self->_backViewController;
  }
  [(SUOverlayViewController *)self _setActiveViewController:frontViewController updateInterface:0];
  if ([(SUOverlayViewController *)self isViewLoaded])
  {
    [(SUOverlayViewController *)self _performFlipTransitionAction:a3];
  }
  else
  {
    [(SUOverlayViewController *)self _overlayActionDidFinish];
  }
}

- (void)_performFlipTransitionAction:(id)a3
{
  uint64_t v5 = (void *)[a3 transition];
  char v6 = (UIViewController *)[a3 viewController];
  frontViewController = self->_frontViewController;
  if (v6 == frontViewController)
  {
    frontViewController = self->_backViewController;
    BOOL v8 = @"fromRight";
  }
  else
  {
    BOOL v8 = @"fromLeft";
  }
  uint64_t v9 = [v5 type];
  self->_int64_t state = self->_state & 0xFFFFFFFFFFFFFFFELL | [(SUOverlayViewController *)self _isControllerLoaded:frontViewController] ^ 1;
  BOOL v10 = v9 == 1;
  [(UIViewController *)v6 viewWillDisappear:v10];
  [(UIViewController *)frontViewController viewWillAppear:v10];
  subviewContainerView = self->_subviewContainerView;
  objc_super v12 = [(UIViewController *)frontViewController view];
  [(SUMaskedView *)subviewContainerView bounds];
  -[UIView setFrame:](v12, "setFrame:");
  if ([v5 type] == 1)
  {
    id v13 = (void *)[MEMORY[0x263F15910] animation];
    [v13 setDelegate:self];
    [v5 duration];
    double v15 = v14;
    UIAnimationDragCoefficient();
    [v13 setDuration:v15 * v16];
    [v13 setFillMode:*MEMORY[0x263F15AB0]];
    [v13 setSubtype:v8];
    [v13 setType:@"oglFlip"];
    objc_msgSend(v13, "setTimingFunction:", objc_msgSend(MEMORY[0x263F15808], "functionWithName:", *MEMORY[0x263F15EB8]));
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
    [MEMORY[0x263F158F8] begin];
    [(SUOverlayViewController *)self _setShadowVisible:0];
    [[(UIViewController *)v6 view] removeFromSuperview];
    objc_msgSend((id)-[SUMaskedView layer](subviewContainerView, "layer"), "addAnimation:forKey:", v13, 0);
    [(SUMaskedView *)subviewContainerView addSubview:v12];
    [a3 setAnimationCount:1];
    v17 = (void *)MEMORY[0x263F158F8];
    [v17 commit];
  }
  else
  {
    [[(UIViewController *)v6 view] removeFromSuperview];
    [(SUMaskedView *)subviewContainerView addSubview:v12];
    [(UIViewController *)v6 viewDidDisappear:0];
    [(UIViewController *)frontViewController viewDidAppear:0];
    [(SUOverlayViewController *)self _overlayActionDidFinish];
  }
}

- (void)_performNextAction
{
  if ([(NSMutableArray *)self->_actionQueue count])
  {
    BOOL v3 = (void *)[(NSMutableArray *)self->_actionQueue objectAtIndex:0];
    if ([v3 actionType] == 3)
    {
      [(SUOverlayViewController *)self _performFlipAction:v3];
    }
    else
    {
      [(SUOverlayViewController *)self _overlayActionDidFinish];
    }
  }
}

- (id)_activeViewController
{
  id result = self->_activeViewController;
  if (!result)
  {
    [(SUOverlayViewController *)self _setActiveViewController:self->_backViewController updateInterface:1];
    return self->_activeViewController;
  }
  return result;
}

- (void)_applyDisplayProperties
{
  if ([(SUOverlayViewController *)self isViewLoaded])
  {
    BOOL v3 = objc_msgSend((id)-[SUOverlayViewController view](self, "view"), "layer");
    [v3 setShadowRadius:self->_shadowRadius];
    [v3 shadowOffset];
    if (v4 > -0.00000011920929)
    {
      double shadowOpacity = self->_shadowOpacity;
      *(float *)&double shadowOpacity = shadowOpacity;
      [v3 setShadowOpacity:shadowOpacity];
    }
    char v6 = [(SUMaskedView *)self->_subviewContainerView copyMaskPath];
    [v3 setShadowPath:v6];
    if (v6)
    {
      CGPathRelease(v6);
    }
  }
}

- (void)_applyOverlayConfiguration:(id)a3
{
  uint64_t v5 = [a3 cornerRadius];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = objc_alloc_init(SURoundedCornersMaskProvider);
    [(SURoundedCornersMaskProvider *)v7 setCornerRadius:(double)v6];
    [(SUOverlayViewController *)self setMaskProvider:v7];
  }
  [a3 size];
  if (v9 > 0.00000011920929) {
    self->_overlaySize.height = v9;
  }
  if (v8 > 0.00000011920929) {
    self->_overlaySize.width = v8;
  }
}

- (id)_flipTransition
{
  lastFlipTransition = self->_lastFlipTransition;
  if (!lastFlipTransition)
  {
    lastFlipTransition = objc_alloc_init(SUOverlayTransition);
    [(SUOverlayTransition *)lastFlipTransition setType:1];
    BOOL v3 = lastFlipTransition;
  }
  return lastFlipTransition;
}

- (BOOL)_isControllerLoaded:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a3 = (id)[a3 navigationController];
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [a3 isSkLoaded];
}

- (void)_setActiveViewController:(id)a3 updateInterface:(BOOL)a4
{
  activeViewController = self->_activeViewController;
  if (activeViewController != a3)
  {
    BOOL v6 = a4;
    if (a4)
    {
      if ([(UIViewController *)self->_activeViewController isViewLoaded])
      {
        [(UIViewController *)self->_activeViewController viewWillDisappear:0];
        [[(UIViewController *)self->_activeViewController view] removeFromSuperview];
        [(UIViewController *)self->_activeViewController viewDidDisappear:0];
      }
      activeViewController = self->_activeViewController;
    }
    if (activeViewController) {
      -[SUOverlayViewController removeChildViewController:](self, "removeChildViewController:");
    }
    self->_activeViewController = (UIViewController *)a3;
    if (a3)
    {
      [(SUOverlayViewController *)self addChildViewController:a3];
      if (v6)
      {
        if ([(SUOverlayViewController *)self isViewLoaded])
        {
          [(UIViewController *)self->_activeViewController viewWillAppear:0];
          double v8 = [(UIViewController *)self->_activeViewController view];
          subviewContainerView = self->_subviewContainerView;
          [(SUMaskedView *)subviewContainerView bounds];
          -[UIView setFrame:](v8, "setFrame:");
          [(SUMaskedView *)subviewContainerView addSubview:v8];
          BOOL v10 = self->_activeViewController;
          [(UIViewController *)v10 viewDidAppear:0];
        }
      }
    }
  }
}

- (void)_setShadowVisible:(BOOL)a3
{
  uint64_t v5 = objc_msgSend((id)-[SUOverlayViewController view](self, "view"), "layer");
  BOOL v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "setShadowOffset:", 0.0, 10.0);
    [(SUOverlayViewController *)self _applyDisplayProperties];
  }
  else
  {
    [v5 setShadowOpacity:0.0];
    objc_msgSend(v6, "setShadowOffset:", 0.0, -3.0);
  }
}

- (id)_subviewContainerView
{
  id result = self->_subviewContainerView;
  if (!result)
  {
    double v4 = objc_alloc_init(SUMaskedView);
    self->_subviewContainerView = v4;
    [(SUMaskedView *)v4 setAutoresizingMask:18];
    return self->_subviewContainerView;
  }
  return result;
}

- (void)_tearDownTouchCaptureView
{
  self->_touchCaptureView = 0;
}

- (UIViewController)backViewController
{
  return self->_backViewController;
}

- (BOOL)canSwipeToDismiss
{
  return self->_canSwipeToDismiss;
}

- (void)setCanSwipeToDismiss:(BOOL)a3
{
  self->_canSwipeToDismiss = a3;
}

- (UIViewController)frontViewController
{
  return self->_frontViewController;
}

- (CGSize)overlaySize
{
  double width = self->_overlaySize.width;
  double height = self->_overlaySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SUOverlayTransition)presentationTransition
{
  return self->_presentationTransition;
}

- (void)setPresentationTransition:(id)a3
{
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (SUScriptFunction)shouldDismissFunction
{
  return self->_shouldDismissFunction;
}

- (void)setShouldDismissFunction:(id)a3
{
}

@end