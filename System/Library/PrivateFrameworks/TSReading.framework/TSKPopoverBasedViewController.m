@interface TSKPopoverBasedViewController
- (BOOL)allowsOutsideTouch;
- (BOOL)dismissOnUndo;
- (BOOL)imposeContentSizeOnViewControllers;
- (BOOL)isPopoverGestureInFlight;
- (BOOL)isPopoverVisible;
- (BOOL)isVisible;
- (BOOL)p_shouldResizeViewWithKeyboard;
- (BOOL)shouldHideToolbar;
- (BOOL)staysOpenOnOutsideTouches;
- (BOOL)useDoneButton;
- (BOOL)viewResizesWithKeyboard;
- (BOOL)wantsDismissButton;
- (BOOL)wrapInNavigationController;
- (CGRect)frameForCurrentiPhoneOrientation;
- (CGSize)contentSize;
- (TSKPopoverBasedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TSKPopoverBasedViewControllerDelegate)popoverDelegate;
- (TSKPopoverController)popoverController;
- (UIView)popoverToggleView;
- (UIViewController)halfHeightViewController;
- (double)p_originOffsetForKeyboardFrame:(CGRect)a3;
- (id)navigationBar;
- (id)p_newCloseImageBarButtonWithTarget:(id)a3 action:(SEL)a4;
- (id)p_newRootViewController;
- (id)p_outsideTouchWatchView;
- (id)p_topParentViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)clearOutsideTouchWatchView;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
- (void)keyboardWillHideOrUndock:(id)a3;
- (void)keyboardWillShowOrDock:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)outsideTouch:(id)a3;
- (void)p_applicationWillEnterFullScreen:(id)a3;
- (void)p_didDismissPopover:(id)a3;
- (void)p_dismissFullscreenModalAnimated:(BOOL)a3;
- (void)p_dismissFullscreenModalFromCloseButton;
- (void)p_dismissHalfHeight;
- (void)p_dismissHalfHeightFromCloseButton;
- (void)p_dismissPopoverAnimated:(BOOL)a3;
- (void)p_informDelegateOfDidDismiss;
- (void)p_informDelegateOfWillDismiss;
- (void)p_informDelegateOfWillShow;
- (void)p_installHideOnTouchGesture;
- (void)p_keyboardWillHide:(BOOL)a3 withNotification:(id)a4;
- (void)p_registerPopoverBasedViewControllerNotifications;
- (void)p_removeHideOnTouchGesture;
- (void)p_showModalInViewController:(id)a3 withTitle:(id)a4 animated:(BOOL)a5 withDoneButton:(BOOL)a6;
- (void)p_willPresentPopover;
- (void)presentInRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5 modal:(BOOL)a6 closeBlock:(id)a7;
- (void)presentInRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5 modal:(BOOL)a6 closeBlock:(id)a7 animations:(id)a8;
- (void)presentModallyFromBarItem:(id)a3 viewController:(id)a4;
- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5;
- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7;
- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7 withDoneButton:(BOOL)a8;
- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7 withDoneButton:(BOOL)a8 constrainToView:(BOOL)a9 withPadding:(double)a10 fromToolbar:(BOOL)a11;
- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 withDoneButton:(BOOL)a6;
- (void)presentModallyWithTitle:(id)a3 viewController:(id)a4 animated:(BOOL)a5 withDoneButton:(BOOL)a6;
- (void)resetOutsideTouchWatchView;
- (void)setAllowsOutsideTouch:(BOOL)a3;
- (void)setDismissOnUndo:(BOOL)a3;
- (void)setHalfHeightViewController:(id)a3;
- (void)setImposeContentSizeOnViewControllers:(BOOL)a3;
- (void)setPopoverDelegate:(id)a3;
- (void)setPopoverToggleView:(id)a3;
- (void)setStaysOpenOnOutsideTouches:(BOOL)a3;
- (void)setUseDoneButton:(BOOL)a3;
- (void)setViewResizesWithKeyboard:(BOOL)a3;
- (void)setWrapInNavigationController:(BOOL)a3;
- (void)shieldViewReceivedTap;
- (void)showPopoverFromBarItem:(id)a3;
- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4;
- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4 arrowDirection:(unint64_t)a5 animated:(BOOL)a6;
- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4 arrowDirection:(unint64_t)a5 animated:(BOOL)a6 constrainToView:(BOOL)a7 withPadding:(double)a8 fromToolbar:(BOOL)a9;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSKPopoverBasedViewController

- (TSKPopoverBasedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSKPopoverBasedViewController;
  v4 = [(TSKPopoverBasedViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4 && TSUPhoneUI())
  {
    v4->mWrapInNavigationController = 1;
    v4->mDismissOnUndo = 1;
  }
  return v4;
}

- (void)dealloc
{
  self->mHideOnTouchGestureRecognizer = 0;
  self->mPopoverToggleView = 0;

  self->mPopoverController = 0;
  self->mHalfHeightViewController = 0;

  self->mHalfHeightCloseBlock = 0;
  self->mHalfHeightTapShield = 0;

  self->mHalfHeightParentView = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverBasedViewController;
  [(TSKPopoverBasedViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverBasedViewController;
  [(TSKPopoverBasedViewController *)&v3 viewDidLoad];
  [(TSKPopoverBasedViewController *)self setEdgesForExtendedLayout:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSKPopoverBasedViewController;
  [(TSKPopoverBasedViewController *)&v4 viewWillAppear:a3];
  +[TSKKeyboardMonitor addKeyboardObserver:self];
  [(TSKPopoverBasedViewController *)self contentSize];
  -[TSKPopoverBasedViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSKPopoverBasedViewController;
  [(TSKPopoverBasedViewController *)&v4 viewDidDisappear:a3];
  +[TSKKeyboardMonitor removeKeyboardObserver:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = (void *)[(TSKPopoverBasedViewController *)self presentingViewController];

  return [v2 supportedInterfaceOrientations];
}

- (BOOL)shouldHideToolbar
{
  return 1;
}

- (BOOL)isPopoverGestureInFlight
{
  return +[TSKHideOnTouchOutsideViewGestureRecognizer isInFlight];
}

- (id)p_topParentViewController
{
  v2 = (void *)[(TSKPopoverBasedViewController *)self parentViewController];
  do
  {
    objc_super v3 = v2;
    v2 = (void *)[v2 parentViewController];
  }
  while (v2);
  return v3;
}

- (id)p_newRootViewController
{
  id v3 = [(TSKPopoverBasedViewController *)self i_contentViewController];
  if ([(TSKPopoverBasedViewController *)self imposeContentSizeOnViewControllers])
  {
    [(TSKPopoverBasedViewController *)self preferredContentSize];
    objc_msgSend(v3, "setPreferredContentSize:");
  }
  if (![(TSKPopoverBasedViewController *)self wrapInNavigationController]) {
    return v3;
  }
  [v3 setEdgesForExtendedLayout:0];
  [v3 setAutomaticallyAdjustsScrollViewInsets:0];
  TSUPhoneUI();
  id v4 = (id)[objc_alloc((Class)objc_opt_class()) initWithRootViewController:v3];
  [v4 setDelegate:self];
  [v4 setWantsFullScreenLayout:0];
  objc_msgSend(v4, "setToolbarHidden:", -[TSKPopoverBasedViewController shouldHideToolbar](self, "shouldHideToolbar"));
  objc_msgSend((id)objc_msgSend(v4, "navigationBar"), "setTranslucent:", 0);
  if ((TSUPhoneUI() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(v4, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "whiteColor"));
  }
  char v5 = [v4 isNavigationBarHidden];
  [v3 preferredContentSize];
  double v7 = v6;
  double v9 = v8;
  if ((v5 & 1) == 0)
  {
    v10 = (void *)[v4 navigationBar];
    objc_msgSend((id)objc_msgSend(v3, "view"), "bounds");
    objc_msgSend(v10, "sizeThatFits:", v11, v12);
    double v9 = v9 + v13;
  }
  objc_msgSend(v4, "setPreferredContentSize:", v7, v9);
  return v4;
}

- (void)setWrapInNavigationController:(BOOL)a3
{
  if (self->mWrapInNavigationController != a3)
  {
    self->mWrapInNavigationController = a3;
    if (![(TSKPopoverBasedViewController *)self isVisible])
    {
      mPopoverController = self->mPopoverController;
      if (mPopoverController)
      {

        self->mPopoverController = 0;
      }
    }
  }
}

- (id)navigationBar
{
  objc_opt_class();
  v2 = (void *)TSUDynamicCast();

  return (id)[v2 navigationBar];
}

- (void)outsideTouch:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (mPopoverDelegate = self->mPopoverDelegate,
        objc_msgSend(a3, "locationInView:", -[TSKPopoverBasedViewController view](self, "view")),
        -[TSKPopoverBasedViewControllerDelegate popoverController:shouldReceiveOutsideTouchAtLocation:inView:](mPopoverDelegate, "popoverController:shouldReceiveOutsideTouchAtLocation:inView:", self, [(TSKPopoverBasedViewController *)self view], v6, v7)))
  {
    if (![(TSKPopoverBasedViewController *)self staysOpenOnOutsideTouches])
    {
      mPopoverToggleView = self->mPopoverToggleView;
      if (!mPopoverToggleView) {
        goto LABEL_7;
      }
      [(UIView *)mPopoverToggleView bounds];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [a3 locationInView:self->mPopoverToggleView];
      v20.x = v17;
      v20.y = v18;
      v21.origin.x = v10;
      v21.origin.y = v12;
      v21.size.width = v14;
      v21.size.height = v16;
      if (!CGRectContainsPoint(v21, v20))
      {
LABEL_7:
        [(TSKPopoverBasedViewController *)self p_dismissPopoverAnimated:1];
      }
    }
  }
}

- (id)p_outsideTouchWatchView
{
  v2 = self;
  if ([(TSKPopoverBasedViewController *)self wrapInNavigationController]) {
    v2 = (TSKPopoverBasedViewController *)[(TSKPopoverBasedViewController *)v2 navigationController];
  }

  return (id)[(TSKPopoverBasedViewController *)v2 view];
}

- (void)p_installHideOnTouchGesture
{
  if (TSUPadUI())
  {
    id v3 = [(TSKPopoverBasedViewController *)self p_outsideTouchWatchView];
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "rootViewController");
    if (v4)
    {
      char v5 = (void *)v4;
      self->mHideOnTouchGestureRecognizer = [[TSKHideOnTouchOutsideViewGestureRecognizer alloc] initWithTarget:self action:sel_outsideTouch_ watchView:v3];
      id v6 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "view"), "gestureRecognizers"), "mutableCopy");
      if (!v6) {
        id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      [v6 insertObject:self->mHideOnTouchGestureRecognizer atIndex:0];
      objc_msgSend((id)objc_msgSend(v5, "view"), "setGestureRecognizers:", v6);

      uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(v5, "view"));
      double v8 = [(TSKPopoverBasedViewController *)self popoverController];
      [(TSKPopoverController *)v8 setPassthroughViews:v7];
    }
  }
}

- (void)p_removeHideOnTouchGesture
{
  if (TSUPadUI())
  {
    objc_msgSend((id)-[TSKHideOnTouchOutsideViewGestureRecognizer view](self->mHideOnTouchGestureRecognizer, "view"), "removeGestureRecognizer:", self->mHideOnTouchGestureRecognizer);

    self->mHideOnTouchGestureRecognizer = 0;
    id v3 = [(TSKPopoverBasedViewController *)self popoverController];
    [(TSKPopoverController *)v3 setPassthroughViews:0];
  }
}

- (void)setAllowsOutsideTouch:(BOOL)a3
{
  BOOL v3 = a3;
  if (TSUPadUI())
  {
    self->mAllowsOutsideTouch = v3;
    if ([(TSKPopoverBasedViewController *)self isPopoverVisible])
    {
      mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
      if (mHideOnTouchGestureRecognizer) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = !v3;
      }
      if (v6)
      {
        if (mHideOnTouchGestureRecognizer && !v3)
        {
          [(TSKPopoverBasedViewController *)self p_removeHideOnTouchGesture];
        }
      }
      else
      {
        [(TSKPopoverBasedViewController *)self p_installHideOnTouchGesture];
      }
    }
  }
}

- (void)clearOutsideTouchWatchView
{
}

- (void)resetOutsideTouchWatchView
{
  id v3 = [(TSKPopoverBasedViewController *)self p_outsideTouchWatchView];
  mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;

  [(TSKHideOnTouchOutsideViewGestureRecognizer *)mHideOnTouchGestureRecognizer setWatchView:v3];
}

- (CGSize)contentSize
{
  [(TSKPopoverBasedViewController *)self preferredContentSize];
  if (v3 == 0.0)
  {
    objc_msgSend((id)-[TSKPopoverBasedViewController view](self, "view"), "frame");
    double v5 = v4;
  }
  else
  {
    [(TSKPopoverBasedViewController *)self preferredContentSize];
    double v5 = v6;
  }
  [(TSKPopoverBasedViewController *)self preferredContentSize];
  if (v7 == 0.0)
  {
    objc_msgSend((id)-[TSKPopoverBasedViewController view](self, "view"), "frame");
    double v9 = v8;
  }
  else
  {
    [(TSKPopoverBasedViewController *)self preferredContentSize];
  }
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGRect)frameForCurrentiPhoneOrientation
{
  if ((TSUPhoneUI() & 1) == 0)
  {
    double v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController frameForCurrentiPhoneOrientation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 423, @"This should only be called from iPhone (or non-iPad)");
  }
  if (TSUPhoneUI())
  {
    [[(UIViewController *)self->mHalfHeightViewController view] frame];
  }
  else
  {
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)p_informDelegateOfWillShow
{
  double v3 = [(TSKPopoverBasedViewController *)self popoverDelegate];
  if (objc_opt_respondsToSelector())
  {
    [(TSKPopoverBasedViewControllerDelegate *)v3 popoverControllerWillShowPopoverBasedViewController:self];
  }
}

- (void)p_informDelegateOfWillDismiss
{
  double v3 = [(TSKPopoverBasedViewController *)self popoverDelegate];
  if (objc_opt_respondsToSelector())
  {
    [(TSKPopoverBasedViewControllerDelegate *)v3 popoverControllerWillDismissPopoverBasedViewController:self];
  }
}

- (void)p_informDelegateOfDidDismiss
{
  double v3 = [(TSKPopoverBasedViewController *)self popoverDelegate];
  if (objc_opt_respondsToSelector())
  {
    [(TSKPopoverBasedViewControllerDelegate *)v3 popoverControllerDidDismissPopoverBasedViewController:self];
  }
}

- (void)p_dismissFullscreenModalAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->mViewControllerVisible = 0;
  double v5 = objc_msgSend(-[TSKPopoverBasedViewController i_contentViewController](self, "i_contentViewController"), "parentViewController");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__TSKPopoverBasedViewController_p_dismissFullscreenModalAnimated___block_invoke;
  v6[3] = &unk_2646AF7B8;
  v6[4] = self;
  [v5 dismissViewControllerAnimated:v3 completion:v6];
}

uint64_t __66__TSKPopoverBasedViewController_p_dismissFullscreenModalAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_informDelegateOfDidDismiss");
}

- (void)p_dismissHalfHeightFromCloseButton
{
  [(TSKPopoverBasedViewController *)self closeButtonPressed];

  [(TSKPopoverBasedViewController *)self dismissAnimated:1];
}

- (void)p_dismissFullscreenModalFromCloseButton
{
  [(TSKPopoverBasedViewController *)self closeButtonPressed];

  [(TSKPopoverBasedViewController *)self dismissAnimated:1];
}

- (void)p_dismissPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (TSUPhoneUI())
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController p_dismissPopoverAnimated:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 494, @"Can't present popovers on the phone!");
  }
  mPopoverController = self->mPopoverController;

  [(TSKPopoverController *)mPopoverController dismissPopoverAnimated:v3];
}

- (void)p_registerPopoverBasedViewControllerNotifications
{
  BOOL v3 = NSDictionary;
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, TSKPopoverBasedViewControllerIsModalKey, objc_msgSend(NSNumber, "numberWithBool:", TSUPhoneUI()), TSKPopoverBasedViewControllerIsFullscreenKey, 0);
  uint64_t v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v7 = TSKPopoverBasedViewControllerWillPresentNotification;

  [v6 postNotificationName:v7 object:self userInfo:v5];
}

- (void)p_showModalInViewController:(id)a3 withTitle:(id)a4 animated:(BOOL)a5 withDoneButton:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if ((TSUPhoneUI() & 1) == 0)
  {
    double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController p_showModalInViewController:withTitle:animated:withDoneButton:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 511, @"Can't show modal view controller on iPad.");
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "isMenuVisible")) {
    [MEMORY[0x263F1CB60] performWithoutAnimation:&__block_literal_global_12];
  }
  self->mViewControllerVisible = 1;
  [(TSKPopoverBasedViewController *)self p_informDelegateOfWillShow];
  id v13 = [(TSKPopoverBasedViewController *)self p_newRootViewController];
  if ([(TSKPopoverBasedViewController *)self wrapInNavigationController])
  {
    objc_opt_class();
    uint64_t v14 = TSUDynamicCast();
    if (v14)
    {
      double v15 = (void *)v14;
      CGFloat v16 = [(TSKPopoverBasedViewController *)self popoverDelegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(TSKPopoverBasedViewControllerDelegate *)v16 wantsCloseArrowForPopoverBasedViewController:self])
      {
        id v17 = [(TSKPopoverBasedViewController *)self p_newCloseImageBarButtonWithTarget:self action:sel_p_dismissFullscreenModalFromCloseButton];
        goto LABEL_13;
      }
      if (v6)
      {
        if (TSUPhoneUI())
        {
          uint64_t v18 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "toolbarButtonForModalDoneWithTarget:action:", self, sel_p_dismissFullscreenModalFromCloseButton);
          id v17 = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v18];
LABEL_13:
          v19 = v17;
          if (!a4) {
            goto LABEL_19;
          }
          goto LABEL_18;
        }
        CGPoint v20 = @"Done";
        uint64_t v21 = 2;
      }
      else
      {
        CGPoint v20 = @"Close";
        uint64_t v21 = 1;
      }
      v19 = objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithTitle:style:target:action:", objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", v20, &stru_26D688A48, @"TSKit"), v21, self, sel_p_dismissFullscreenModalFromCloseButton);
      [(TSKPopoverBasedViewController *)self i_configureCloseItem:v19];
      if (!a4)
      {
LABEL_19:
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "topViewController"), "navigationItem"), "setRightBarButtonItem:", v19);

        goto LABEL_20;
      }
LABEL_18:
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "topViewController"), "navigationItem"), "setTitle:", a4);
      goto LABEL_19;
    }
  }
LABEL_20:

  [a3 presentViewController:v13 animated:v7 completion:0];
}

uint64_t __95__TSKPopoverBasedViewController_p_showModalInViewController_withTitle_animated_withDoneButton___block_invoke()
{
  v0 = (void *)[MEMORY[0x263F1C7B0] sharedMenuController];

  return [v0 hideMenu];
}

- (id)p_newCloseImageBarButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v7 = objc_alloc(MEMORY[0x263F1C468]);
  uint64_t v8 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"TSKInsp_Close-ArrowDown", TSKBundle(), -[TSKPopoverBasedViewController traitCollection](self, "traitCollection"));

  return (id)[v7 initWithImage:v8 style:1 target:a3 action:a4];
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5
{
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 withDoneButton:(BOOL)a6
{
  LOBYTE(v6) = 0;
  -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:](self, "presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:", a4, a5, 15, 1, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, v6);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7
{
  LOBYTE(v7) = 0;
  -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:](self, "presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:", a4, a5, a6, a7, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, v7);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7 withDoneButton:(BOOL)a8
{
  LOBYTE(v8) = 0;
  -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:](self, "presentModallyFromRect:inView:viewController:arrowDirection:animated:withDoneButton:constrainToView:withPadding:fromToolbar:", a4, a5, a6, a7, a8, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, v8);
}

- (void)presentModallyFromRect:(CGRect)a3 inView:(id)a4 viewController:(id)a5 arrowDirection:(unint64_t)a6 animated:(BOOL)a7 withDoneButton:(BOOL)a8 constrainToView:(BOOL)a9 withPadding:(double)a10 fromToolbar:(BOOL)a11
{
  BOOL v12 = a9;
  BOOL v13 = a8;
  BOOL v14 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(TSKPopoverBasedViewController *)self p_registerPopoverBasedViewControllerNotifications];
  if (TSUPhoneUI())
  {
    [(TSKPopoverBasedViewController *)self p_showModalInViewController:a5 withTitle:0 animated:v14 withDoneButton:v13];
  }
  else
  {
    -[TSKPopoverBasedViewController showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:](self, "showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:", a4, a6, v14, v12, a11, x, y, width, height, a10);
  }
}

- (void)presentModallyFromBarItem:(id)a3 viewController:(id)a4
{
  [(TSKPopoverBasedViewController *)self p_registerPopoverBasedViewControllerNotifications];
  if (TSUPhoneUI())
  {
    [(TSKPopoverBasedViewController *)self p_showModalInViewController:a4 withTitle:0 animated:1 withDoneButton:0];
  }
  else
  {
    [(TSKPopoverBasedViewController *)self showPopoverFromBarItem:a3];
  }
}

- (void)presentModallyWithTitle:(id)a3 viewController:(id)a4 animated:(BOOL)a5 withDoneButton:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if ((TSUPhoneUI() & 1) == 0)
  {
    double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController presentModallyWithTitle:viewController:animated:withDoneButton:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 658, @"presentModallyWithTitle is only intended to be used on the phone.");
  }
  [(TSKPopoverBasedViewController *)self p_registerPopoverBasedViewControllerNotifications];

  [(TSKPopoverBasedViewController *)self p_showModalInViewController:a4 withTitle:a3 animated:v7 withDoneButton:v6];
}

- (void)p_dismissHalfHeight
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSKWillEnterFullScreenNotification", 0);
  self->mViewControllerVisible = 0;
  mHalfHeightCloseBlock = (void (**)(id, TSKPopoverBasedViewController *))self->mHalfHeightCloseBlock;
  if (mHalfHeightCloseBlock)
  {
    mHalfHeightCloseBlock[2](mHalfHeightCloseBlock, self);

    self->mHalfHeightCloseBlock = 0;
  }
  BOOL mHalfHeightAnimated = self->mHalfHeightAnimated;
  uint64_t v5 = self->mHalfHeightTapShield;
  BOOL v6 = self->mHalfHeightViewController;

  self->mHalfHeightViewController = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke;
  v16[3] = &unk_2646B0958;
  BOOL v17 = mHalfHeightAnimated;
  v16[4] = v6;
  v16[5] = v5;
  v16[6] = self;
  if (self->mHalfHeightAnimated)
  {
    BOOL v7 = [(UIViewController *)v6 view];
    [(UIView *)v7 frame];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    [[(UIView *)v7 superview] bounds];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke_2;
    v15[3] = &unk_2646B0980;
    v15[4] = v7;
    v15[5] = v9;
    v15[6] = v14;
    v15[7] = v11;
    v15[8] = v13;
    [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v15 options:v16 animations:0.200000003 completion:0.0];
  }
  else
  {
    __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke((uint64_t)v16);
  }
}

uint64_t __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) viewWillDisappear:*(unsigned __int8 *)(a1 + 56)];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "removeFromSuperview");
  [*(id *)(a1 + 32) viewDidDisappear:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 40) setDelegate:0];

  v2 = *(void **)(a1 + 48);

  return objc_msgSend(v2, "p_informDelegateOfDidDismiss");
}

uint64_t __52__TSKPopoverBasedViewController_p_dismissHalfHeight__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)presentInRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5 modal:(BOOL)a6 closeBlock:(id)a7
{
}

- (void)presentInRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5 modal:(BOOL)a6 closeBlock:(id)a7 animations:(id)a8
{
  BOOL v10 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v18 = NSDictionary;
  uint64_t v19 = [NSNumber numberWithBool:0];
  uint64_t v20 = TSKPopoverBasedViewControllerIsModalKey;
  uint64_t v21 = [NSNumber numberWithBool:0];
  uint64_t v22 = objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v19, v20, v21, TSKPopoverBasedViewControllerIsFullscreenKey, 0);
  v23 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v23 postNotificationName:TSKPopoverBasedViewControllerWillPresentNotification object:self userInfo:v22];
  self->mViewControllerVisible = 1;
  if (!a4)
  {
    v24 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v25 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController presentInRect:inView:animated:modal:closeBlock:animations:]"];
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 743, @"invalid nil value for '%s'", "parentView");
  }
  self->mHalfHeightParentView = (UIView *)a4;
  id v26 = [(TSKPopoverBasedViewController *)self p_newRootViewController];
  if ([(TSKPopoverBasedViewController *)self wrapInNavigationController])
  {
    objc_opt_class();
    v27 = (void *)TSUDynamicCast();
    if ([(TSKPopoverBasedViewController *)self useDoneButton]) {
      id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithTitle:style:target:action:", objc_msgSend((id)TSKBundle(), "localizedStringForKey:value:table:", @"Done", &stru_26D688A48, @"TSKit"), 0, self, sel_p_dismissHalfHeightFromCloseButton);
    }
    else {
      id v28 = [(TSKPopoverBasedViewController *)self p_newCloseImageBarButtonWithTarget:self action:sel_p_dismissHalfHeightFromCloseButton];
    }
    v29 = v28;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v27, "topViewController"), "navigationItem"), "setRightBarButtonItem:", v28);
    [v27 setShowTopSeparator:1];
    [v27 setIsFullscreenViewController:0];
  }
  self->BOOL mHalfHeightAnimated = a5;
  [(TSKPopoverBasedViewController *)self setHalfHeightViewController:v26];
  self->mHalfHeightOriginalFrame.origin.double x = x;
  self->mHalfHeightOriginalFrame.origin.double y = y;
  self->mHalfHeightOriginalFrame.size.double width = width;
  self->mHalfHeightOriginalFrame.size.double height = height;
  [a4 bounds];
  double v31 = v30;

  self->mHalfHeightTapShield = 0;
  if (v10)
  {
    v32 = [TSKModalShieldView alloc];
    [a4 bounds];
    v33 = -[TSKModalShieldView initWithFrame:](v32, "initWithFrame:");
    self->mHalfHeightTapShield = v33;
    [(TSKModalShieldView *)v33 setDelegate:self];
    [a4 addSubview:self->mHalfHeightTapShield];
  }
  v34 = [(UIViewController *)self->mHalfHeightViewController view];
  v35 = v34;
  if (self->mHalfHeightAnimated)
  {
    -[UIView setFrame:](v34, "setFrame:", x, v31, width, height);
    [(UIView *)v35 layoutIfNeeded];
    [a4 addSubview:v35];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __91__TSKPopoverBasedViewController_presentInRect_inView_animated_modal_closeBlock_animations___block_invoke;
    v36[3] = &unk_2646B09A8;
    v36[4] = v35;
    v36[5] = a8;
    *(double *)&v36[6] = x;
    *(double *)&v36[7] = y;
    *(double *)&v36[8] = width;
    *(double *)&v36[9] = height;
    [MEMORY[0x263F1CB60] animateWithDuration:v36 animations:0.200000003];
  }
  else
  {
    -[UIView setFrame:](v34, "setFrame:", x, y, width, height);
    [a4 addSubview:v35];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_applicationWillEnterFullScreen_, @"TSKWillEnterFullScreenNotification", 0);
  if (TSUPhoneUI())
  {
    objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "addPopoverBasedViewController:", self);
    self->mUndoManagerNotificationsRegistered = 1;
  }

  self->mHalfHeightCloseBlock = (id)[a7 copy];
}

uint64_t __91__TSKPopoverBasedViewController_presentInRect_inView_animated_modal_closeBlock_animations___block_invoke(double *a1)
{
  uint64_t v2 = *((void *)a1 + 5);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = (void *)*((void *)a1 + 4);
  double v4 = a1[6];
  double v5 = a1[7];
  double v6 = a1[8];
  double v7 = a1[9];

  return objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
}

- (void)shieldViewReceivedTap
{
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSKPopoverBasedViewController *)self p_informDelegateOfWillDismiss];
  if (TSUPhoneUI())
  {
    if (self->mUndoManagerNotificationsRegistered)
    {
      objc_msgSend(+[TSKPopoverUndoObserver sharedObserver](TSKPopoverUndoObserver, "sharedObserver"), "removePopoverBasedViewController:", self);
      self->mUndoManagerNotificationsRegistered = 0;
    }
    if (self->mHalfHeightViewController)
    {
      self->BOOL mHalfHeightAnimated = v3;
      [(TSKPopoverBasedViewController *)self p_dismissHalfHeight];
    }
    else
    {
      [(TSKPopoverBasedViewController *)self p_dismissFullscreenModalAnimated:v3];
    }
  }
  else
  {
    [(TSKPopoverBasedViewController *)self p_dismissPopoverAnimated:v3];
  }
}

- (BOOL)isVisible
{
  if (TSUPhoneUI()) {
    return self->mViewControllerVisible;
  }

  return [(TSKPopoverBasedViewController *)self isPopoverVisible];
}

- (TSKPopoverController)popoverController
{
  if (TSUPhoneUI())
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController popoverController]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 902, @"iPad-specific API is being called on a phone!");
  }
  [(TSKPopoverBasedViewController *)self contentSize];
  -[TSKPopoverBasedViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  CGRect result = self->mPopoverController;
  if (!result)
  {
    double v6 = [[TSKPopoverController alloc] initWithContentViewController:[(TSKPopoverBasedViewController *)self p_newRootViewController]];
    self->mPopoverController = v6;
    [(TSKPopoverController *)v6 setDismissOnUndo:1];
    return self->mPopoverController;
  }
  return result;
}

- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4
{
}

- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4 arrowDirection:(unint64_t)a5 animated:(BOOL)a6
{
}

- (void)showPopoverFromRect:(CGRect)a3 inView:(id)a4 arrowDirection:(unint64_t)a5 animated:(BOOL)a6 constrainToView:(BOOL)a7 withPadding:(double)a8 fromToolbar:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v11 = a7;
  BOOL v12 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (TSUPhoneUI())
  {
    uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v21 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController showPopoverFromRect:inView:arrowDirection:animated:constrainToView:withPadding:fromToolbar:]"];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 929, @"Can't present popovers on the phone!");
  }
  uint64_t v22 = [(TSKPopoverBasedViewController *)self popoverController];
  [(TSKPopoverBasedViewController *)self p_willPresentPopover];
  if (v9) {
    double v23 = y + 5.0;
  }
  else {
    double v23 = y;
  }

  -[TSKPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:constrainToView:withPadding:](v22, "presentPopoverFromRect:inView:permittedArrowDirections:animated:constrainToView:withPadding:", a4, a5, v12, v11, x, v23, width, height, a8);
}

- (void)showPopoverFromBarItem:(id)a3
{
  if (TSUPhoneUI())
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController showPopoverFromBarItem:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 955, @"Can't present popovers on the phone!");
  }
  [(TSKPopoverBasedViewController *)self p_willPresentPopover];
  double v7 = [(TSKPopoverBasedViewController *)self popoverController];

  [(TSKPopoverController *)v7 presentPopoverFromBarButtonItem:a3 permittedArrowDirections:15 animated:1];
}

- (BOOL)isPopoverVisible
{
  if (TSUPhoneUI())
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController isPopoverVisible]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 962, @"iPad-specific API is being called on a phone!");
  }
  if (([(TSKPopoverController *)self->mPopoverController isPopoverVisible] & 1) != 0
    || objc_msgSend((id)-[TSKPopoverController contentViewController](self->mPopoverController, "contentViewController"), "isViewLoaded")&& objc_msgSend((id)objc_msgSend((id)-[TSKPopoverController contentViewController](self->mPopoverController, "contentViewController"), "view"), "window"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [(TSKPopoverBasedViewController *)self isViewLoaded];
    if (v5) {
      LOBYTE(v5) = objc_msgSend((id)-[TSKPopoverBasedViewController view](self, "view"), "window") != 0;
    }
  }
  return v5;
}

- (void)p_willPresentPopover
{
  if (TSUPhoneUI())
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController p_willPresentPopover]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 979, @"iPad-specific API is being called on a phone!");
  }
  if (self->mAllowsOutsideTouch && !self->mHideOnTouchGestureRecognizer) {
    [(TSKPopoverBasedViewController *)self p_installHideOnTouchGesture];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_applicationWillEnterFullScreen_, @"TSKWillEnterFullScreenNotification", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_didDismissPopover_, @"TSKDidDismissPopover", -[TSKPopoverBasedViewController popoverController](self, "popoverController"));

  [(TSKPopoverBasedViewController *)self p_informDelegateOfWillShow];
}

- (void)p_applicationWillEnterFullScreen:(id)a3
{
}

- (void)p_didDismissPopover:(id)a3
{
  if ((TSKPopoverController *)[a3 object] == self->mPopoverController)
  {
    if (TSUPhoneUI())
    {
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSKPopoverBasedViewController p_didDismissPopover:]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverBasedViewController.m"), 1001, @"iPad-specific API is being called on a phone!");
    }
    if (self->mHideOnTouchGestureRecognizer) {
      [(TSKPopoverBasedViewController *)self p_removeHideOnTouchGesture];
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSKWillEnterFullScreenNotification", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSKDidDismissPopover", self->mPopoverController);
    [(TSKPopoverBasedViewController *)self p_informDelegateOfDidDismiss];

    self->mPopoverController = 0;
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if ([(id)TSUProtocolCast() wantsDismissButton])
  {
    uint64_t v8 = (void *)[a3 viewControllers];
    if ((unint64_t)[v8 count] >= 2)
    {
      objc_opt_class();
      [v8 firstObject];
      objc_msgSend((id)objc_msgSend(a4, "navigationItem"), "setRightBarButtonItem:", objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "navigationItem"), "rightBarButtonItem"));
    }
  }
  if ([(TSKPopoverBasedViewController *)self imposeContentSizeOnViewControllers])
  {
    [(TSKPopoverBasedViewController *)self preferredContentSize];
    objc_msgSend(a4, "setPreferredContentSize:");
  }
}

- (BOOL)wantsDismissButton
{
  return 1;
}

- (void)keyboardWillShowOrDock:(id)a3
{
  if ([(TSKPopoverBasedViewController *)self viewResizesWithKeyboard])
  {
    [(TSKPopoverBasedViewController *)self p_keyboardWillHide:0 withNotification:a3];
  }
}

- (void)keyboardWillHideOrUndock:(id)a3
{
  if ([(TSKPopoverBasedViewController *)self viewResizesWithKeyboard])
  {
    [(TSKPopoverBasedViewController *)self p_keyboardWillHide:1 withNotification:a3];
  }
}

- (void)p_keyboardWillHide:(BOOL)a3 withNotification:(id)a4
{
  if ([(TSKPopoverBasedViewController *)self p_shouldResizeViewWithKeyboard])
  {
    double v7 = (void *)[a4 userInfo];
    uint64_t v8 = (void *)[v7 objectForKey:*MEMORY[0x263F1D420]];
    BOOL v9 = (void *)[(TSKPopoverBasedViewController *)self view];
    [v8 CGRectValue];
    objc_msgSend(v9, "convertRect:fromView:", 0);
    double v11 = v10;
    [v8 CGRectValue];
    -[TSKPopoverBasedViewController p_originOffsetForKeyboardFrame:](self, "p_originOffsetForKeyboardFrame:");
    double v13 = v12;
    uint64_t v14 = (void *)[a4 userInfo];
    double v15 = (void *)[v14 objectForKey:*MEMORY[0x263F1D428]];
    CGFloat v16 = (void *)[(TSKPopoverBasedViewController *)self view];
    [v15 CGRectValue];
    objc_msgSend(v16, "convertRect:fromView:", 0);
    double v18 = v11 - v17;
    uint64_t v19 = (void *)[a4 userInfo];
    uint64_t v20 = (void *)[v19 objectForKey:*MEMORY[0x263F1D3F8]];
    double v34 = 0.0;
    [v20 getValue:&v34];
    [[(UIViewController *)self->mHalfHeightViewController view] frame];
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    double v26 = v25;
    double v28 = v27 - (v18 - v13);
    if (TSUStatusBarIsLandscape())
    {
      if (a3)
      {
        [(TSKPopoverBasedViewController *)self frameForCurrentiPhoneOrientation];
        uint64_t v22 = v29;
        double v28 = v30;
        uint64_t v24 = v31;
        double v26 = v32;
      }
      else
      {
        double v26 = v26 + v28;
        double v28 = 0.0;
      }
    }
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __69__TSKPopoverBasedViewController_p_keyboardWillHide_withNotification___block_invoke;
    v33[3] = &unk_2646B0980;
    v33[4] = self;
    v33[5] = v22;
    *(double *)&v33[6] = v28;
    v33[7] = v24;
    *(double *)&v33[8] = v26;
    [MEMORY[0x263F1CB60] animateWithDuration:v33 animations:0 completion:v34];
  }
}

uint64_t __69__TSKPopoverBasedViewController_p_keyboardWillHide_withNotification___block_invoke(double *a1)
{
  double v1 = a1[5];
  double v2 = a1[6];
  double v3 = a1[7];
  double v4 = a1[8];
  uint64_t v5 = (void *)[*(id *)(*((void *)a1 + 4) + 1016) view];

  return objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

- (double)p_originOffsetForKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow");
  [v7 frame];
  double v9 = v8;
  [v7 frame];
  if (x >= 0.0)
  {
    if (x <= v9)
    {
      if (y >= 0.0)
      {
        double v11 = 0.0;
        if (y > v10) {
          double v11 = y - v10;
        }
      }
      else
      {
        double v11 = y + height;
      }
    }
    else
    {
      double v11 = x - v9;
    }
  }
  else
  {
    double v11 = x + width;
  }
  return fabs(v11);
}

- (BOOL)p_shouldResizeViewWithKeyboard
{
  if (self->mHalfHeightViewController)
  {
    int v3 = TSUPhoneUI();
    if (v3) {
      LOBYTE(v3) = self->mViewResizesWithKeyboard;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (TSKPopoverBasedViewControllerDelegate)popoverDelegate
{
  return self->mPopoverDelegate;
}

- (void)setPopoverDelegate:(id)a3
{
  self->mPopoverDelegate = (TSKPopoverBasedViewControllerDelegate *)a3;
}

- (BOOL)wrapInNavigationController
{
  return self->mWrapInNavigationController;
}

- (BOOL)useDoneButton
{
  return self->mUseDoneButton;
}

- (void)setUseDoneButton:(BOOL)a3
{
  self->mUseDoneButton = a3;
}

- (BOOL)viewResizesWithKeyboard
{
  return self->mViewResizesWithKeyboard;
}

- (void)setViewResizesWithKeyboard:(BOOL)a3
{
  self->mViewResizesWithKeyboard = a3;
}

- (BOOL)allowsOutsideTouch
{
  return self->mAllowsOutsideTouch;
}

- (BOOL)staysOpenOnOutsideTouches
{
  return self->mStaysOpenOnOutsideTouches;
}

- (void)setStaysOpenOnOutsideTouches:(BOOL)a3
{
  self->mStaysOpenOnOutsideTouches = a3;
}

- (UIView)popoverToggleView
{
  return self->mPopoverToggleView;
}

- (void)setPopoverToggleView:(id)a3
{
}

- (BOOL)dismissOnUndo
{
  return self->mDismissOnUndo;
}

- (void)setDismissOnUndo:(BOOL)a3
{
  self->mDismissOnUndo = a3;
}

- (BOOL)imposeContentSizeOnViewControllers
{
  return self->mImposeContentSizeOnViewControllers;
}

- (void)setImposeContentSizeOnViewControllers:(BOOL)a3
{
  self->mImposeContentSizeOnViewControllers = a3;
}

- (UIViewController)halfHeightViewController
{
  return self->mHalfHeightViewController;
}

- (void)setHalfHeightViewController:(id)a3
{
}

@end