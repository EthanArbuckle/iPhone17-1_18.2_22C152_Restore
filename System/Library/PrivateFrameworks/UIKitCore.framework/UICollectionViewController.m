@interface UICollectionViewController
- (BOOL)clearsSelectionOnViewWillAppear;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)installsStandardGestureForInteractiveMovement;
- (BOOL)shouldCrossFadeBottomBars;
- (BOOL)shouldCrossFadeNavigationBar;
- (BOOL)useLayoutToLayoutNavigationTransitions;
- (UICollectionView)collectionView;
- (UICollectionViewController)initWithCoder:(NSCoder *)coder;
- (UICollectionViewController)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;
- (UICollectionViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (UICollectionViewLayout)collectionViewLayout;
- (id)_animatorForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)_shim_contentScrollView;
- (id)_wrappingView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)dataSource;
- (id)preferredFocusedView;
- (id)previewViewControllerForItemAtIndexPath:(id)a3;
- (id)previewViewControllerForLocation:(CGPoint)a3 inSourceView:(id)a4;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)__viewDidAppear:(BOOL)a3;
- (void)__viewWillAppear:(BOOL)a3;
- (void)_clearSharedView;
- (void)_handleReorderingGesture:(id)a3;
- (void)_installReorderingGestureIfNecessary;
- (void)_setNeedsUpdateContentUnavailableConfiguration;
- (void)_setSharedCollectionView:(id)a3;
- (void)_setUseLayoutToLayoutNavigationTransitions:(BOOL)a3 withCheck:(BOOL)a4;
- (void)_updateCollectionViewLayoutAndDelegate:(id)a3;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)setClearsSelectionOnViewWillAppear:(BOOL)clearsSelectionOnViewWillAppear;
- (void)setCollectionView:(UICollectionView *)collectionView;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setInstallsStandardGestureForInteractiveMovement:(BOOL)installsStandardGestureForInteractiveMovement;
- (void)setUseLayoutToLayoutNavigationTransitions:(BOOL)useLayoutToLayoutNavigationTransitions;
- (void)setView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillUnload;
- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5;
@end

@implementation UICollectionViewController

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewController;
  v4 = [(UIViewController *)&v7 contentScrollViewForEdge:a3];
  if (!v4)
  {
    v5 = [(UIViewController *)self _existingView];
    if (v5)
    {
      v4 = [(UICollectionViewController *)self collectionView];
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (UICollectionView)collectionView
{
  [(UIViewController *)self loadViewIfRequired];
  collectionView = self->_collectionView;
  return collectionView;
}

- (UICollectionViewController)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
  v5 = layout;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewController;
  v6 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layout, layout);
    *(unsigned char *)&v7->_collectionViewControllerFlags |= 1u;
    *(unsigned char *)&v7->_collectionViewControllerFlags |= 4u;
  }

  return v7;
}

- (void)__viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v4 __viewDidAppear:a3];
  [(UICollectionViewController *)self _installReorderingGestureIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v4 viewDidAppear:a3];
  [(UICollectionViewController *)self _installReorderingGestureIfNecessary];
}

- (void)_installReorderingGestureIfNecessary
{
  if ((*(unsigned char *)&self->_collectionViewControllerFlags & 4) != 0 && !self->_reorderingGesture)
  {
    uint64_t v3 = [(UIView *)self->_collectionView window];
    if (v3)
    {
      objc_super v4 = (void *)v3;
      BOOL v5 = [(UICollectionView *)self->_collectionView _dataSourceSupportsReordering];

      if (v5)
      {
        v6 = [[_UICollectionViewLegacyReorderingGestureRecognizer alloc] initWithTarget:self action:sel__handleReorderingGesture_];
        reorderingGesture = self->_reorderingGesture;
        self->_reorderingGesture = &v6->super;

        v8 = [(UIViewController *)self traitCollection];
        uint64_t v9 = [v8 userInterfaceIdiom];

        if (v9 == 6) {
          [(UIGestureRecognizer *)self->_reorderingGesture _setKeepTouchesOnContinuation:0];
        }
        [(UIGestureRecognizer *)self->_reorderingGesture setDelegate:self];
        collectionView = self->_collectionView;
        v11 = self->_reorderingGesture;
        [(UIView *)collectionView addGestureRecognizer:v11];
      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v11 viewWillAppear:a3];
  if (dyld_program_sdk_at_least())
  {
    keyboardSupport = self->_keyboardSupport;
    if (!keyboardSupport)
    {
      BOOL v5 = [[UIAutoRespondingScrollViewControllerKeyboardSupport alloc] initWithViewController:self];
      v6 = self->_keyboardSupport;
      self->_keyboardSupport = v5;

      keyboardSupport = self->_keyboardSupport;
    }
    if (![(UIAutoRespondingScrollViewControllerKeyboardSupport *)keyboardSupport registeredForNotifications])
    {
      objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v8 = [(UIViewController *)self _screen];
      [v7 addObserver:self->_keyboardSupport selector:sel__keyboardWillShow_ name:@"UIKeyboardPrivateWillShowNotification" object:v8];
      [v7 addObserver:self->_keyboardSupport selector:sel__keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:v8];
      [v7 addObserver:self->_keyboardSupport selector:sel__keyboardDidShow_ name:@"UIKeyboardPrivateDidShowNotification" object:v8];
      [v7 addObserver:self->_keyboardSupport selector:sel__keyboardDidHide_ name:@"UIKeyboardPrivateDidHideNotification" object:v8];
      [v7 addObserver:self->_keyboardSupport selector:sel__keyboardDidChangeFrame_ name:@"UIKeyboardPrivateDidChangeFrameNotification" object:v8];
      [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setRegisteredForNotifications:1];
    }
    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setViewIsDisappearing:0];
    if (![(UIViewController *)self _isInViewControllerThatHandlesKeyboardAvoidance])
    {
      [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport adjustmentForKeyboard];
      double v10 = v9;
      [(UICollectionView *)self->_collectionView _adjustForAutomaticKeyboardInfo:0 animated:0 lastAdjustment:&v10];
      [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setAdjustmentForKeyboard:v10];
    }
  }
}

- (UICollectionViewLayout)collectionViewLayout
{
  return self->_layout;
}

- (void)setCollectionView:(UICollectionView *)collectionView
{
  BOOL v5 = collectionView;
  p_collectionView = &self->_collectionView;
  objc_super v7 = self->_collectionView;
  if (v7 != v5)
  {
    v13 = v5;
    v8 = [(UICollectionView *)v7 dataSource];

    if (v8 == self) {
      [(UICollectionView *)*p_collectionView setDataSource:0];
    }
    double v9 = [(UIScrollView *)*p_collectionView delegate];

    if (v9 == self) {
      [(UICollectionView *)*p_collectionView setDelegate:0];
    }
    [(UIScrollView *)*p_collectionView removeFromSuperview];
    [(UIView *)v13 setAutoresizingMask:18];
    double v10 = [(UICollectionViewController *)self _wrappingView];
    [(UICollectionViewController *)self setView:v10];
    [v10 bounds];
    -[UICollectionView setFrame:](v13, "setFrame:");
    [v10 addSubview:v13];
    objc_storeStrong((id *)&self->_collectionView, collectionView);
    objc_super v11 = [(UICollectionView *)v13 dataSource];

    if (!v11) {
      [(UICollectionView *)v13 setDataSource:self];
    }
    v12 = [(UIScrollView *)v13 delegate];

    if (!v12) {
      [(UICollectionView *)v13 setDelegate:self];
    }

    BOOL v5 = v13;
  }
}

- (void)loadView
{
  uint64_t v3 = [(UICollectionViewController *)self _wrappingView];
  BOOL v4 = [(UIViewController *)self _usesSharedView];
  BOOL v5 = [(UIViewController *)self nibName];
  v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      v47.receiver = self;
      v47.super_class = (Class)UICollectionViewController;
      [(UIViewController *)&v47 loadView];
      objc_super v11 = [(UIViewController *)self view];
      collectionView = self->_collectionView;
      self->_collectionView = v11;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = [(UIViewController *)self storyboardIdentifier];
        if (v13)
        {
          v14 = [(UIViewController *)self storyboard];
          v15 = [v14 name];
          v16 = v15;
          if (v15)
          {
            id v17 = v15;
          }
          else
          {
            id v17 = [v14 description];
          }
          v27 = v17;

          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%s instantiated view controller with identifier \"%@\" from storyboard \"%@\", but didn't get a UICollectionView.", "-[UICollectionViewController loadView]", v13, v27 format];
        }
        else
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%s loaded the \"%@\" nib but didn't get a UICollectionView.", "-[UICollectionViewController loadView]", v6 format];
        }
      }
      v28 = [(UIScrollView *)self->_collectionView delegate];

      if (!v28) {
        [(UICollectionView *)self->_collectionView setDelegate:self];
      }
      v29 = [(UICollectionView *)self->_collectionView dataSource];

      if (!v29) {
        [(UICollectionView *)self->_collectionView setDataSource:self];
      }
      if (!self->_layout)
      {
        v30 = [(UICollectionView *)self->_collectionView collectionViewLayout];
        layout = self->_layout;
        self->_layout = v30;
      }
      goto LABEL_31;
    }
    if ([(id)UIApp _appAdoptsUISceneLifecycle])
    {
      v18 = [(UIViewController *)self _window];
      if (!v18)
      {
        v32 = +[UIScreen mainScreen];
        [v32 _mainSceneFrame];
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;

        v19 = 0;
LABEL_30:

        v45 = -[UICollectionViewController _newCollectionViewWithFrame:collectionViewLayout:](self, "_newCollectionViewWithFrame:collectionViewLayout:", self->_layout, v34, v36, v38, v40);
        v46 = self->_collectionView;
        self->_collectionView = v45;

        [(UIView *)self->_collectionView setAutoresizingMask:18];
        [(UICollectionView *)self->_collectionView setDelegate:self];
        [(UICollectionView *)self->_collectionView setDataSource:self];
LABEL_31:
        [(UICollectionViewController *)self setView:v3];
        [v3 bounds];
        -[UICollectionView setFrame:](self->_collectionView, "setFrame:");
        [v3 addSubview:self->_collectionView];

        goto LABEL_32;
      }
      v19 = v18;
      v20 = __UIStatusBarManagerForWindow(v18);
      char v21 = [v20 isStatusBarHidden];

      if (v21)
      {
        BOOL v22 = 1;
      }
      else
      {
        v41 = __UIStatusBarManagerForWindow(v19);
        v42 = [v19 windowScene];
        objc_msgSend(v41, "defaultStatusBarHeightInOrientation:", objc_msgSend(v42, "interfaceOrientation"));
        double v44 = v43;

        BOOL v22 = v44 == 0.0;
      }
      [v19 _referenceFrameFromSceneUsingScreenBounds:v22];
    }
    else
    {
      v19 = [(UIViewController *)self _screen];
      [v19 _applicationFrame];
    }
    double v34 = v23;
    double v36 = v24;
    double v38 = v25;
    double v40 = v26;
    goto LABEL_30;
  }
  if (v5)
  {
    objc_super v7 = self->_layout;

    if (!v7)
    {
      v48.receiver = self;
      v48.super_class = (Class)UICollectionViewController;
      [(UIViewController *)&v48 loadView];
      v8 = [(UIViewController *)self view];
      double v9 = [v8 collectionViewLayout];
      double v10 = self->_layout;
      self->_layout = v9;
    }
  }
  [(UICollectionViewController *)self setView:v3];
LABEL_32:
}

- (void)setView:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    collectionView = self->_collectionView;
    self->_collectionView = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v6 setView:v4];
}

- (id)_wrappingView
{
  uint64_t v3 = [(UIViewController *)self _existingView];
  if (!v3)
  {
    if (dyld_program_sdk_at_least())
    {
      id v4 = [(UIViewController *)self _window];
      if ([(id)UIApp _appAdoptsUISceneLifecycle]
        && (v4 || dyld_program_sdk_at_least()))
      {
        [v4 _referenceFrameFromSceneUsingScreenBounds:1];
        double v6 = v5;
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
      }
      else
      {
        v18 = [(UIViewController *)self _screen];
        objc_msgSend(v18, "_applicationFrameForInterfaceOrientation:usingStatusbarHeight:ignoreStatusBar:", objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0), 1, 0.0);
        double v6 = v19;
        double v8 = v20;
        double v10 = v21;
        double v12 = v22;
      }
      v13 = [UICollectionViewControllerWrapperView alloc];
    }
    else
    {
      v13 = [UICollectionViewControllerWrapperView alloc];
      id v4 = [(UIViewController *)self _screen];
      [v4 _applicationFrame];
      double v6 = v14;
      double v8 = v15;
      double v10 = v16;
      double v12 = v17;
    }
    uint64_t v3 = -[UIView initWithFrame:](v13, "initWithFrame:", v6, v8, v10, v12);

    [(UIView *)v3 setAutoresizingMask:18];
  }
  return v3;
}

- (id)_newCollectionViewWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  double v9 = -[UICollectionView initWithFrame:collectionViewLayout:]([UICollectionView alloc], "initWithFrame:collectionViewLayout:", v8, x, y, width, height);

  return v9;
}

- (void)__viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewController;
  -[UIViewController __viewWillAppear:](&v9, sel___viewWillAppear_);
  double v5 = [(UICollectionViewController *)self collectionView];
  double v6 = [(UIViewController *)self _existingView];
  if ([v6 isMemberOfClass:objc_opt_class()]
    && [(UICollectionViewController *)self useLayoutToLayoutNavigationTransitions])
  {
    [(UICollectionViewController *)self _updateCollectionViewLayoutAndDelegate:v5];
  }
  if ([v5 numberOfSections])
  {
    if ((*(unsigned char *)&self->_collectionViewControllerFlags & 1) != 0
      && ([v5 allowsMultipleSelection] & 1) == 0
      && (*(unsigned char *)&self->_collectionViewControllerFlags & 2) == 0)
    {
      if (dyld_program_sdk_at_least())
      {
        double v7 = [v5 indexPathsForSelectedItems];
        id v8 = [(UIViewController *)self transitionCoordinator];
        [v5 _deselectItemsAtIndexPaths:v7 animated:v3 transitionCoordinator:v8];
      }
      else
      {
        [v5 _deselectAllAnimated:1 notifyDelegate:0];
      }
    }
  }
  else
  {
    [v5 reloadData];
  }
}

- (BOOL)useLayoutToLayoutNavigationTransitions
{
  return (*(unsigned char *)&self->_collectionViewControllerFlags >> 1) & 1;
}

- (void)setClearsSelectionOnViewWillAppear:(BOOL)clearsSelectionOnViewWillAppear
{
  *(unsigned char *)&self->_collectionViewControllerFlags = *(unsigned char *)&self->_collectionViewControllerFlags & 0xFE | clearsSelectionOnViewWillAppear;
}

- (void)_setNeedsUpdateContentUnavailableConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v5 _setNeedsUpdateContentUnavailableConfiguration];
  BOOL v3 = self->_collectionView;
  id v4 = v3;
  if (v3 && (*((_WORD *)&self->super._viewControllerFlags + 4) & 0x10) != 0) {
    [(UIScrollView *)v3 setNeedsLayout];
  }
}

- (void)setUseLayoutToLayoutNavigationTransitions:(BOOL)useLayoutToLayoutNavigationTransitions
{
}

- (void)setInstallsStandardGestureForInteractiveMovement:(BOOL)installsStandardGestureForInteractiveMovement
{
  if (installsStandardGestureForInteractiveMovement) {
    char v4 = 4;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_collectionViewControllerFlags = *(unsigned char *)&self->_collectionViewControllerFlags & 0xFB | v4;
  if (installsStandardGestureForInteractiveMovement)
  {
    [(UICollectionViewController *)self _installReorderingGestureIfNecessary];
  }
  else if (self->_reorderingGesture)
  {
    -[UIView removeGestureRecognizer:](self->_collectionView, "removeGestureRecognizer:");
    reorderingGesture = self->_reorderingGesture;
    self->_reorderingGesture = 0;
  }
}

- (void)_setUseLayoutToLayoutNavigationTransitions:(BOOL)a3 withCheck:(BOOL)a4
{
  BOOL v4 = a3;
  if (!a4)
  {
    [(UICollectionViewController *)self useLayoutToLayoutNavigationTransitions];
    goto LABEL_9;
  }
  double v6 = [(UIViewController *)self parentViewController];
  if (v6)
  {
  }
  else
  {
    double v7 = [(UIViewController *)self _existingView];
    id v8 = [v7 window];

    if (!v8) {
      goto LABEL_7;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to change the layout to layout transitions property of %@ which is a child view controller or in the window hierarchy", self format];
LABEL_7:
  if ([(UICollectionViewController *)self useLayoutToLayoutNavigationTransitions] != v4)[(UICollectionViewController *)self setView:0]; {
LABEL_9:
  }
  [(UIViewController *)self _setUsesSharedView:v4];
  if (v4) {
    char v9 = 2;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_collectionViewControllerFlags = *(unsigned char *)&self->_collectionViewControllerFlags & 0xFD | v9;
}

- (UICollectionViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewController;
  return [(UIViewController *)&v5 initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (UICollectionViewController)initWithCoder:(NSCoder *)coder
{
  BOOL v4 = coder;
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewController;
  objc_super v5 = [(UIViewController *)&v9 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    *(unsigned char *)&v5->_collectionViewControllerFlags |= 1u;
    *(unsigned char *)&v5->_collectionViewControllerFlags |= 4u;
    if ([(NSCoder *)v4 containsValueForKey:@"UIClearsSelectionOnViewWillAppear"]) {
      *(unsigned char *)&v6->_collectionViewControllerFlags = *(unsigned char *)&v6->_collectionViewControllerFlags & 0xFE | [(NSCoder *)v4 decodeBoolForKey:@"UIClearsSelectionOnViewWillAppear"];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIInstallsStandardReorderingGesture"])
    {
      if ([(NSCoder *)v4 decodeBoolForKey:@"UIInstallsStandardReorderingGesture"]) {
        char v7 = 4;
      }
      else {
        char v7 = 0;
      }
      *(unsigned char *)&v6->_collectionViewControllerFlags = *(unsigned char *)&v6->_collectionViewControllerFlags & 0xFB | v7;
    }
  }

  return v6;
}

- (void)dealloc
{
  if (self->_keyboardSupport)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_keyboardSupport];
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v6 encodeWithCoder:v4];
  char collectionViewControllerFlags = (char)self->_collectionViewControllerFlags;
  if ((collectionViewControllerFlags & 1) == 0)
  {
    [v4 encodeBool:0 forKey:@"UIClearsSelectionOnViewWillAppear"];
    char collectionViewControllerFlags = (char)self->_collectionViewControllerFlags;
  }
  if ((collectionViewControllerFlags & 4) == 0) {
    [v4 encodeBool:0 forKey:@"UIInstallsStandardReorderingGesture"];
  }
}

- (BOOL)clearsSelectionOnViewWillAppear
{
  return *(unsigned char *)&self->_collectionViewControllerFlags & 1;
}

- (void)_setSharedCollectionView:(id)a3
{
}

- (void)_clearSharedView
{
  BOOL v3 = [(UIViewController *)self navigationController];

  if (!v3)
  {
    [(UIViewController *)self _setUsesSharedView:0];
    [(UICollectionViewController *)self setView:0];
  }
}

- (void)viewWillUnload
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v5 viewWillUnload];
  BOOL v3 = [(UICollectionViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];

  if (v4 != self->_layout) {
    objc_storeStrong((id *)&self->_layout, v4);
  }
}

- (void)_updateCollectionViewLayoutAndDelegate:(id)a3
{
  id v13 = a3;
  id v4 = [(UIViewController *)self transitionCoordinator];
  objc_super v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 viewControllerForKey:@"UITransitionContextFromViewController"];
    char v7 = self;
    id v8 = [v6 _uiCollectionView];
    objc_super v9 = [(UICollectionViewController *)v7 _uiCollectionView];

    if (v8 != v9) {
      goto LABEL_3;
    }
    if ([(UIViewController *)v7 _usesSharedView])
    {

      goto LABEL_8;
    }
    if ([v6 _usesSharedView])
    {
      double v11 = [v6 navigationController];
      uint64_t v12 = [v11 lastOperation];

      if (v12 != 1) {
        goto LABEL_8;
      }
    }
    else
    {
LABEL_3:
    }
  }
  [v13 setCollectionViewLayout:self->_layout];
  double v10 = [v13 delegate];

  if (!v10) {
    [v13 setDelegate:self];
  }
LABEL_8:
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_keyboardSupport)
  {
    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_keyboardSupport];

    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setViewIsDisappearing:1];
    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setRegisteredForNotifications:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v6 viewWillDisappear:v3];
}

- (id)_shim_contentScrollView
{
  if ((_UIBarsApplyChromelessEverywhere() & 1) != 0 || _UIViewControllerUseContentScrollViewAPI())
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UICollectionViewController.m" lineNumber:429 description:@"Unexpected code path for compatibility code only"];
  }
  id v4 = [(UIViewController *)self _existingView];
  if (v4)
  {
    objc_super v5 = [(UICollectionViewController *)self collectionView];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)dataSource
{
  if (dyld_program_sdk_at_least()
    && ([(UICollectionViewController *)self collectionView],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 _isConnectedToDiffableDataSource],
        v3,
        (v4 & 1) != 0))
  {
    objc_super v5 = [(UICollectionViewController *)self collectionView];
    objc_super v6 = [v5 dataSource];
  }
  else
  {
    objc_super v6 = self;
  }
  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v5 = a3;
  if (dyld_program_sdk_at_least() && [v5 isEditing]) {
    [(UICollectionViewController *)self setEditing:1 animated:1];
  }
}

- (id)_animatorForOperation:(int64_t)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v8 collectionView],
        double v10 = (UICollectionView *)objc_claimAutoreleasedReturnValue(),
        collectionView = self->_collectionView,
        v10,
        v10 == collectionView))
  {
    uint64_t v12 = +[_UICollectionViewControllerLayoutToLayoutTransition transitionForOperation:a3 fromViewController:v8 toViewController:v9];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)shouldCrossFadeNavigationBar
{
  return 1;
}

- (BOOL)shouldCrossFadeBottomBars
{
  return 1;
}

- (id)preferredFocusedView
{
  return self->_collectionView;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  char v7 = [(UICollectionViewController *)self collectionView];
  int v8 = [v7 canBeEdited];

  if (v8)
  {
    if (v4)
    {
      id v9 = [(UICollectionViewController *)self collectionView];
      [v9 setEditing:v5];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __50__UICollectionViewController_setEditing_animated___block_invoke;
      v11[3] = &unk_1E52D9FC0;
      v11[4] = self;
      BOOL v12 = v5;
      +[UIView performWithoutAnimation:v11];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewController;
  [(UIViewController *)&v10 setEditing:v5 animated:v4];
}

void __50__UICollectionViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 setEditing:*(unsigned __int8 *)(a1 + 40)];
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  if ([(UICollectionViewController *)self _shouldRespondToPreviewingMethods])
  {
    id v9 = [v8 sourceView];
    objc_super v10 = -[UICollectionViewController previewViewControllerForLocation:inSourceView:](self, "previewViewControllerForLocation:inSourceView:", v9, x, y);
  }
  else
  {
    [MEMORY[0x1E4FBA8A8] doesNotRecognizeSelector:a2];
    objc_super v10 = 0;
  }

  return v10;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v8 = a4;
  if ([(UICollectionViewController *)self _shouldRespondToPreviewingMethods])
  {
    id v6 = v8;
    id v7 = v6;
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(UICollectionViewController *)self committedViewControllerForPreviewViewController:v6];

      if (!v7) {
        id v7 = v6;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      [(UICollectionViewController *)self commitPreviewViewController:v6 committedViewController:v7];
    }
    else if (objc_opt_respondsToSelector())
    {
      [(UICollectionViewController *)self commitPreviewViewController:v6];
    }
  }
  else
  {
    [(UIResponder *)self doesNotRecognizeSelector:a2];
  }
}

- (id)previewViewControllerForItemAtIndexPath:(id)a3
{
  return 0;
}

- (id)previewViewControllerForLocation:(CGPoint)a3 inSourceView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(UICollectionViewController *)self _shouldRespondToPreviewingMethods])
  {
    id v8 = [(UICollectionViewController *)self collectionView];
    objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
    id v9 = objc_msgSend(v8, "indexPathForItemAtPoint:");
    objc_super v10 = [(UICollectionViewController *)self previewViewControllerForItemAtIndexPath:v9];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v14 = a3;
  id v9 = a5;
  if ([(UICollectionViewController *)self _shouldRespondToPreviewingMethods])
  {
    objc_super v10 = [(UICollectionViewController *)self collectionView];
    objc_msgSend(v10, "convertPoint:fromView:", v9, x, y);
    double v11 = objc_msgSend(v10, "indexPathForItemAtPoint:");
    BOOL v12 = [v10 cellForItemAtIndexPath:v11];
    id v13 = [v14 presentationController];
    [v13 setSourceView:v12];
    [v12 bounds];
    objc_msgSend(v13, "setSourceRect:");
    [(UICollectionViewController *)self willPresentPreviewViewController:v14 forItemAtIndexPath:v11];
  }
}

- (BOOL)installsStandardGestureForInteractiveMovement
{
  return (*(unsigned char *)&self->_collectionViewControllerFlags >> 2) & 1;
}

- (void)_handleReorderingGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_collectionView;
  switch([v4 state])
  {
    case 1:
      [v4 startPoint];
      id v6 = -[UICollectionView indexPathForItemAtPoint:](v5, "indexPathForItemAtPoint:");
      if (v6)
      {
        [(UICollectionView *)v5 beginInteractiveMovementForItemAtIndexPath:v6];
        id v7 = [(UICollectionView *)v5 contextMenuInteraction];
        int v8 = [v7 _hasVisibleMenu];

        if (v8)
        {
          id v9 = [(UICollectionView *)v5 contextMenuInteraction];
          [v9 dismissMenu];
        }
        else
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __55__UICollectionViewController__handleReorderingGesture___block_invoke;
          v10[3] = &unk_1E52D9F70;
          double v11 = v5;
          +[UIView performWithoutAnimation:v10];
        }
      }

      break;
    case 2:
      if ([(UICollectionView *)v5 _isReordering])
      {
        [v4 locationInView:v5];
        -[UICollectionView updateInteractiveMovementTargetPosition:](v5, "updateInteractiveMovementTargetPosition:");
      }
      else
      {
        [v4 setEnabled:0];
        [v4 setEnabled:1];
      }
      break;
    case 3:
      [(UICollectionView *)v5 endInteractiveMovement];
      break;
    case 4:
      [(UICollectionView *)v5 cancelInteractiveMovement];
      break;
    default:
      break;
  }
}

void __55__UICollectionViewController__handleReorderingGesture___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 removeFromSuperview];
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_reorderingGesture == a3
    && ([(UICollectionView *)self->_collectionView contextMenuInteraction],
        long long v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    long long v10 = [(UICollectionView *)self->_collectionView contextMenuInteraction];
    id v11 = [v10 _gestureRecognizerForBeginningDragRelationships];

    if (v11 == v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v12 = [(UIViewController *)self traitCollection];
      if ([v12 userInterfaceIdiom] == 6)
      {
        id v13 = [(UICollectionView *)self->_collectionView contextMenuInteraction];
        id v14 = [v13 gestureRecognizerForFailureRelationships];
        BOOL v7 = v14 == v6;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_reorderingGesture != a3
      || [(UICollectionView *)self->_collectionView _canBeginReorderingItem];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardSupport, 0);
  objc_storeStrong((id *)&self->_reorderingGesture, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end