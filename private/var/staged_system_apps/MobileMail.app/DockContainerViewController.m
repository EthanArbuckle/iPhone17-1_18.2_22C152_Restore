@interface DockContainerViewController
+ (NSArray)menuCommands;
+ (id)log;
- (BOOL)_isDockVisible;
- (BOOL)_isDockableViewControllerPresented;
- (BOOL)_isDockedViewFullWidth;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)draftWasTornOff;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isExposeModeActivated;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)shouldAutorotate;
- (CGRect)tiltedTabViewController:(id)a3 dockedFrameForViewRepresentingState:(id)a4;
- (DockContainerPersistence)persistence;
- (DockContainerViewController)initWithPersistence:(id)a3 scene:(id)a4 rootViewController:(id)a5;
- (DockContainerViewControllerDelegate)delegate;
- (MUIGradientView)dockShadowView;
- (MailScene)scene;
- (NSArray)dockedStates;
- (NSHashTable)presentationControllerDelegateObservers;
- (NSLayoutConstraint)dockHeightConstraint;
- (NSMutableArray)offscreenDockedViews;
- (NSMutableDictionary)dockedViews;
- (TabSelectionPresentationAnimationController)nextPresentationAnimation;
- (TiltedTabViewController)activeTiltedTabViewController;
- (UIView)dockView;
- (UIViewController)activeViewController;
- (UIViewController)rootViewController;
- (double)_dockHeight;
- (double)_yPositionForDockedViewAtDepth:(int64_t)a3 totalDockedCount:(int64_t)a4;
- (id)_newDockingAnimatorForDismissedController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)preferredFocusEnvironments;
- (int64_t)dockingTransitionState;
- (void)_cleanupOffscreenDockedViews;
- (void)_commandMPressed:(id)a3;
- (void)_configureNewDockedView:(id)a3;
- (void)_continueKeyCommandPressed:(id)a3;
- (void)_deactivateExposeModeWithSelection:(id)a3 fromSnapshotView:(id)a4 animated:(BOOL)a5;
- (void)_dockViewTapped;
- (void)_handlePersistenceChangeFromAnotherObserver;
- (void)_handlePersistenceChangeFromSelf;
- (void)_layoutDockedViews;
- (void)_layoutExistingDockedViewsWithIndexOffset:(int64_t)a3;
- (void)_minimizeKeyCommandPressed:(id)a3;
- (void)_popFirstDockedViewAnimated:(BOOL)a3;
- (void)_prepareViewControllerForDockingIfPossible:(id)a3;
- (void)_setDockVisible:(BOOL)a3;
- (void)_sheetPresentationControllerDidTearOff:(id)a3;
- (void)_tiltedTabViewWillBePresented:(id)a3;
- (void)_updateDockBackground;
- (void)_updateRootViewControllerCornerRadii;
- (void)_updateRootViewControllerTraits;
- (void)activateExposeModeAnimated:(BOOL)a3;
- (void)addPresentationControllerDelegateObserver:(id)a3;
- (void)deactivateExposeModeAnimated:(BOOL)a3;
- (void)dockContainerPersistence:(id)a3 observer:(id)a4 updatedDockedStates:(id)a5;
- (void)dockPresentedViewControllerWithCompletion:(id)a3;
- (void)popToRootViewControllerAnimated:(BOOL)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)removePresentationControllerDelegateObserver:(id)a3;
- (void)setActiveTiltedTabViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockHeightConstraint:(id)a3;
- (void)setDockShadowView:(id)a3;
- (void)setDockView:(id)a3;
- (void)setDockedStates:(id)a3;
- (void)setDockedViews:(id)a3;
- (void)setDockingTransitionState:(int64_t)a3;
- (void)setDraftWasTornOff:(BOOL)a3;
- (void)setNextPresentationAnimation:(id)a3;
- (void)setOffscreenDockedViews:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setPresentationControllerDelegateObservers:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setScene:(id)a3;
- (void)tiltedTabViewController:(id)a3 didSelectView:(id)a4 representingState:(id)a5;
- (void)tiltedTabViewControllerDidCancel:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DockContainerViewController

- (void)addPresentationControllerDelegateObserver:(id)a3
{
  id v5 = a3;
  v4 = [(DockContainerViewController *)self presentationControllerDelegateObservers];
  [v4 addObject:v5];
}

- (void)dockContainerPersistence:(id)a3 observer:(id)a4 updatedDockedStates:(id)a5
{
  id v12 = a3;
  v8 = (DockContainerViewController *)a4;
  id v9 = a5;
  v10 = [(DockContainerViewController *)self dockedStates];
  unsigned __int8 v11 = [v10 isEqualToArray:v9];

  if ((v11 & 1) == 0)
  {
    if (+[UIDevice mf_isPad])
    {
      [v12 migrateDockContainerDraftsToWindowsIfNeeded:v9];
      [v12 removeObserver:self];
    }
    else
    {
      [(DockContainerViewController *)self setDockedStates:v9];
      if (v8 == self) {
        [(DockContainerViewController *)v8 _handlePersistenceChangeFromSelf];
      }
      else {
        [(DockContainerViewController *)self _handlePersistenceChangeFromAnotherObserver];
      }
    }
  }
}

+ (NSArray)menuCommands
{
  v2 = (void *)qword_100699478;
  if (!qword_100699478)
  {
    v3 = +[UIKeyCommand keyCommandWithInput:@"m" modifierFlags:0x100000 action:"_commandMPressed:"];
    v4 = [v3 _nonRepeatableKeyCommand];

    id v5 = +[MFMailMenuCommand shortcutWithCommand:v4 menu:3];
    id v9 = v5;
    uint64_t v6 = +[NSArray arrayWithObjects:&v9 count:1];
    v7 = (void *)qword_100699478;
    qword_100699478 = v6;

    v2 = (void *)qword_100699478;
  }

  return (NSArray *)v2;
}

- (DockContainerViewController)initWithPersistence:(id)a3 scene:(id)a4 rootViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DockContainerViewController;
  id v12 = [(DockContainerViewController *)&v23 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_persistence, a3);
    objc_storeWeak((id *)&v13->_scene, v10);
    v14 = (NSArray *)objc_alloc_init((Class)NSArray);
    dockedStates = v13->_dockedStates;
    v13->_dockedStates = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dockedViews = v13->_dockedViews;
    v13->_dockedViews = v16;

    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    offscreenDockedViews = v13->_offscreenDockedViews;
    v13->_offscreenDockedViews = v18;

    objc_storeStrong((id *)&v13->_rootViewController, a5);
    uint64_t v20 = +[NSHashTable weakObjectsHashTable];
    presentationControllerDelegateObservers = v13->_presentationControllerDelegateObservers;
    v13->_presentationControllerDelegateObservers = (NSHashTable *)v20;
  }
  return v13;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)DockContainerViewController;
  [(DockContainerViewController *)&v3 viewDidLayoutSubviews];
  [(DockContainerViewController *)self _layoutDockedViews];
  [(DockContainerViewController *)self _updateRootViewControllerTraits];
  [(DockContainerViewController *)self _updateDockBackground];
  [(DockContainerViewController *)self _updateRootViewControllerCornerRadii];
}

- (void)_updateRootViewControllerTraits
{
  if ([(DockContainerViewController *)self _isDockVisible]
    || [(DockContainerViewController *)self dockingTransitionState])
  {
    id v4 = +[UITraitCollection traitCollectionWithUserInterfaceLevel:1];
  }
  else
  {
    id v4 = 0;
  }
  objc_super v3 = [(DockContainerViewController *)self rootViewController];
  [(DockContainerViewController *)self setOverrideTraitCollection:v4 forChildViewController:v3];
}

- (int64_t)dockingTransitionState
{
  return self->_dockingTransitionState;
}

- (void)_updateRootViewControllerCornerRadii
{
  double v3 = 0.0;
  if ([(DockContainerViewController *)self _isDockVisible]
    && [(DockContainerViewController *)self _isDockedViewFullWidth])
  {
    +[SheetMetrics cornerRadius];
    double v3 = v4;
  }
  id v5 = [(DockContainerViewController *)self rootViewController];
  uint64_t v6 = [v5 view];
  id v8 = [v6 layer];

  [v8 cornerRadius];
  if (v7 != v3) {
    [v8 setCornerRadius:v3];
  }
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  double v3 = [(DockContainerViewController *)self rootViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DockContainerViewController;
    id v4 = [(DockContainerViewController *)&v7 childViewControllerForScreenEdgesDeferringSystemGestures];
  }
  id v5 = v4;

  return v5;
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (BOOL)_isDockVisible
{
  v2 = [(DockContainerViewController *)self dockHeightConstraint];
  [v2 constant];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (NSLayoutConstraint)dockHeightConstraint
{
  return self->_dockHeightConstraint;
}

- (void)_updateDockBackground
{
  if (![(DockContainerViewController *)self _isDockedViewFullWidth])
  {
    id v22 = [(DockContainerViewController *)self traitCollection];
    id v3 = [v22 userInterfaceStyle];

    if (v3 != (id)2)
    {
      id v25 = +[UIColor mailDockViewLightBackgroundColor];
      uint64_t v6 = [(DockContainerViewController *)self dockView];
      [v6 setBackgroundColor:v25];

      objc_super v7 = [(DockContainerViewController *)self dockShadowView];

      if (v7) {
        return;
      }
      id v24 = [objc_alloc((Class)MUIGradientView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      id v8 = +[UIColor mailDockViewShadowGradientColors];
      [v24 setGradientColors:v8];

      id v9 = +[UIColor mailDockViewShadowGradientColorLocations];
      [v24 setLocations:v9];

      [v24 setAlpha:0.2];
      id v10 = [(DockContainerViewController *)self dockView];
      [v10 addSubview:v24];
      [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v11 = [v24 heightAnchor];
      id v12 = [v11 constraintEqualToConstant:3.0];
      [v12 setActive:1];

      v13 = [v24 widthAnchor];
      v14 = [v10 widthAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      [v15 setActive:1];

      v16 = [v24 leadingAnchor];
      v17 = [v10 leadingAnchor];
      v18 = [v16 constraintEqualToAnchor:v17];
      [v18 setActive:1];

      v19 = [v24 topAnchor];
      uint64_t v20 = [v10 topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      [v21 setActive:1];

      [(DockContainerViewController *)self setDockShadowView:v24];
      goto LABEL_5;
    }
  }
  id v23 = +[UIColor mailDockViewDarkBackgroundColor];
  BOOL v4 = [(DockContainerViewController *)self dockView];
  [v4 setBackgroundColor:v23];

  id v5 = [(DockContainerViewController *)self dockShadowView];
  if (v5)
  {
    id v24 = v5;
    [v5 removeFromSuperview];
    [(DockContainerViewController *)self setDockShadowView:0];
LABEL_5:
    id v5 = v24;
  }
}

- (UIView)dockView
{
  return self->_dockView;
}

- (MUIGradientView)dockShadowView
{
  return self->_dockShadowView;
}

- (void)_layoutDockedViews
{
  if ([UIApp isRunningTest:@"launch"])
  {
    BOOL v4 = +[DockContainerViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(a2);
      int v12 = 138543362;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skip %{public}@ in a test environment", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    int64_t v6 = [(DockContainerViewController *)self dockingTransitionState];
    [(DockContainerViewController *)self _layoutExistingDockedViewsWithIndexOffset:v6 != 0];
    objc_super v7 = [(DockContainerViewController *)self dockedViews];
    id v8 = [v7 count];
    id v9 = v8;
    if (v6) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 0;
    }
    BOOL v11 = v8 != (id)v10;

    if (v11 != [(DockContainerViewController *)self _isDockVisible])
    {
      [(DockContainerViewController *)self _setDockVisible:v9 != (id)v10];
    }
  }
}

- (BOOL)_isDockedViewFullWidth
{
  v2 = self;
  id v3 = [(DockContainerViewController *)self view];
  +[SheetMetrics frameForPresentedSheetIn:v3];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  double Width = CGRectGetWidth(v15);
  v13 = [(DockContainerViewController *)v2 view];
  [v13 bounds];
  LOBYTE(v2) = Width >= CGRectGetWidth(v16);

  return (char)v2;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008A1C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699470 != -1) {
    dispatch_once(&qword_100699470, block);
  }
  v2 = (void *)qword_100699468;

  return v2;
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)DockContainerViewController;
  [(DockContainerViewController *)&v38 viewDidLoad];
  id v3 = [(DockContainerViewController *)self view];
  double v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setOpaque:0];
  id v5 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 addSubview:v5];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v6 = [v5 heightAnchor];
  CGFloat v7 = [v6 constraintEqualToConstant:0.0];
  [(DockContainerViewController *)self setDockHeightConstraint:v7];

  double v8 = [(DockContainerViewController *)self dockHeightConstraint];
  [v8 setActive:1];

  CGFloat v9 = [v5 widthAnchor];
  double v10 = [v3 widthAnchor];
  CGFloat v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  int v12 = [v5 leadingAnchor];
  v13 = [v3 leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  CGRect v15 = [v5 bottomAnchor];
  CGRect v16 = [v3 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  [(DockContainerViewController *)self setDockView:v5];
  v18 = [(DockContainerViewController *)self rootViewController];
  v19 = [v18 view];

  uint64_t v20 = [(DockContainerViewController *)self rootViewController];
  [(DockContainerViewController *)self addChildViewController:v20];

  v21 = [(DockContainerViewController *)self rootViewController];
  [v21 didMoveToParentViewController:self];

  [v3 addSubview:v19];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v22 = [v19 leadingAnchor];
  id v23 = [v3 leadingAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  id v25 = [v19 topAnchor];
  v26 = [v3 topAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  [v27 setActive:1];

  v28 = [v19 trailingAnchor];
  v29 = [v3 trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v30 setActive:1];

  v31 = [v19 bottomAnchor];
  v32 = [v5 topAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  v34 = [v19 layer];
  [v34 setMasksToBounds:1];

  v35 = [v19 layer];
  [v35 setMaskedCorners:12];

  [(DockContainerViewController *)self setView:v3];
  v36 = [(DockContainerViewController *)self persistence];
  [v36 registerObserver:self];

  v37 = +[NSNotificationCenter defaultCenter];
  [v37 addObserver:self selector:"_tiltedTabViewWillBePresented:" name:@"kWillShowTiltedTabViewNotification" object:0];
}

- (void)setDockView:(id)a3
{
}

- (void)setDockHeightConstraint:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (NSHashTable)presentationControllerDelegateObservers
{
  return self->_presentationControllerDelegateObservers;
}

- (DockContainerPersistence)persistence
{
  return self->_persistence;
}

- (NSArray)dockedStates
{
  return self->_dockedStates;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)removePresentationControllerDelegateObserver:(id)a3
{
  id v5 = a3;
  double v4 = [(DockContainerViewController *)self presentationControllerDelegateObservers];
  [v4 removeObject:v5];
}

- (UIViewController)activeViewController
{
  id v3 = [(DockContainerViewController *)self presentedViewController];

  if (v3)
  {
    double v4 = [(DockContainerViewController *)self presentedViewController];
  }
  else
  {
    id v5 = [(DockContainerViewController *)self activeTiltedTabViewController];

    if (v5) {
      [(DockContainerViewController *)self activeTiltedTabViewController];
    }
    else {
    double v4 = [(DockContainerViewController *)self rootViewController];
    }
  }

  return (UIViewController *)v4;
}

- (BOOL)isExposeModeActivated
{
  v2 = [(DockContainerViewController *)self activeTiltedTabViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)preferredFocusEnvironments
{
  BOOL v3 = [(DockContainerViewController *)self activeViewController];
  if (sub_1000AAF94(self, v3))
  {
    int v12 = v3;
    double v4 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      double v6 = [v5 mailboxPickerNavController];
      CGFloat v7 = [v6 topViewController];
      double v8 = [v5 messageListNavController:v7];
      CGFloat v9 = [v8 topViewController];
      v11[1] = v9;
      double v4 = +[NSArray arrayWithObjects:v11 count:2];
    }
    else
    {
      double v4 = 0;
    }
  }

  return v4;
}

- (void)activateExposeModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(DockContainerViewController *)self isExposeModeActivated])
  {
    id v14 = [(DockContainerViewController *)self dockedStates];
    id v5 = [v14 count];

    if (v5)
    {
      id v15 = +[NSNotificationCenter defaultCenter];
      [v15 postNotificationName:@"kWillShowTiltedTabViewNotification" object:self];

      double v6 = [TiltedTabViewController alloc];
      CGFloat v7 = [(DockContainerViewController *)self dockedStates];
      double v8 = [(DockContainerViewController *)self persistence];
      CGFloat v9 = [(DockContainerViewController *)self rootViewController];
      double v10 = [(DockContainerViewController *)self scene];
      CGFloat v11 = [v10 daemonInterface];
      CGRect v16 = [(TiltedTabViewController *)v6 initWithInitialDockedStates:v7 persistence:v8 primaryViewController:v9 daemonInterface:v11];

      [(TiltedTabViewController *)v16 setDelegate:self];
      [(DockContainerViewController *)self setActiveTiltedTabViewController:v16];
      [(DockContainerViewController *)self addChildViewController:v16];
      int v12 = [(DockContainerViewController *)self view];
      v13 = [(TiltedTabViewController *)v16 view];
      [v12 addSubview:v13];

      [(TiltedTabViewController *)v16 didMoveToParentViewController:self];
      [(TiltedTabViewController *)v16 presentAnimated:v3];
      [(DockContainerViewController *)self setNeedsFocusUpdate];
    }
  }
}

- (void)deactivateExposeModeAnimated:(BOOL)a3
{
}

- (void)_deactivateExposeModeWithSelection:(id)a3 fromSnapshotView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(DockContainerViewController *)self isExposeModeActivated])
  {
    [(DockContainerViewController *)self activeTiltedTabViewController];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000AB9DC;
    v36[3] = &unk_100604618;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v37 = v10;
    objc_super v38 = self;
    CGFloat v11 = objc_retainBlock(v36);
    if (v8)
    {
      int v12 = [(DockContainerViewController *)self persistence];
      v13 = [v8 dockIdentifier];
      [v12 removeDockedStateWithIdentifier:v13 sender:self];

      id v14 = [(DockContainerViewController *)self dockedViews];
      id v15 = [v8 dockIdentifier];
      CGRect v16 = [v14 objectForKey:v15];

      if (v16)
      {
        v17 = [(DockContainerViewController *)self dockedViews];
        v18 = [v8 dockIdentifier];
        [v17 removeObjectForKey:v18];

        [v16 removeFromSuperview];
      }
      v19 = [(DockContainerViewController *)self scene];
      uint64_t v20 = [v8 restoreViewControllerWithScene:v19];

      v21 = [(DockContainerViewController *)self delegate];
      [v21 dockContainer:self didRestoreViewController:v20];

      if (v5)
      {
        [v20 setTransitioningDelegate:self];
        id v22 = [[TabSelectionPresentationAnimationController alloc] initWithSourceView:v9];
        [(DockContainerViewController *)self setNextPresentationAnimation:v22];

        [(DockContainerViewController *)self presentViewController:v20 animated:1 completion:0];
        id v23 = [(DockContainerViewController *)self transitionCoordinator];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000ABA60;
        v34[3] = &unk_100606600;
        v35[0] = v10;
        v35[1] = self;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1000ABACC;
        v32[3] = &unk_100606628;
        v32[4] = self;
        v33 = v11;
        [v23 animateAlongsideTransition:v34 completion:v32];
        id v24 = (id *)v35;
      }
      else
      {
        [v10 dismiss];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1000ABB14;
        v30[3] = &unk_1006051E0;
        v30[4] = self;
        v31 = v11;
        [(DockContainerViewController *)self presentViewController:v20 animated:0 completion:v30];
        id v24 = (id *)&v31;
      }
    }
    else
    {
      if (!v5)
      {
        [v10 dismiss];
        ((void (*)(void *))v11[2])(v11);
        goto LABEL_12;
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000ABB88;
      v27[3] = &unk_100604618;
      id v28 = v10;
      v29 = self;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000ABC2C;
      v25[3] = &unk_100606650;
      v26 = v11;
      +[UIView animateWithDuration:0 delay:v27 options:v25 animations:0.22 completion:0.0];

      CGRect v16 = v28;
    }

LABEL_12:
  }
}

- (void)setDockingTransitionState:(int64_t)a3
{
  p_dockingTransitionState = &self->_dockingTransitionState;
  if (self->_dockingTransitionState != a3)
  {
    BOOL v5 = +[DockContainerViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100459384(p_dockingTransitionState, a3, v5);
    }
  }
  int64_t *p_dockingTransitionState = a3;
}

- (void)_setDockVisible:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.0;
  if (a3)
  {
    [(DockContainerViewController *)self _dockHeight];
    double v5 = v6;
  }
  CGFloat v7 = [(DockContainerViewController *)self dockHeightConstraint];
  [v7 constant];
  double v9 = v8;

  if (v9 != v5)
  {
    id v10 = +[DockContainerViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100459484(v3, v10, v11, v12, v13, v14, v15, v16);
    }

    v17 = [(DockContainerViewController *)self dockHeightConstraint];
    [v17 setConstant:v5];
  }
}

- (double)_dockHeight
{
  v2 = [(DockContainerViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3 + 50.0;

  return v4;
}

- (void)_dockViewTapped
{
  double v3 = [(DockContainerViewController *)self dockedStates];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    [(DockContainerViewController *)self _popFirstDockedViewAnimated:1];
  }
  else
  {
    double v5 = [(DockContainerViewController *)self dockedStates];
    id v6 = [v5 count];

    if ((unint64_t)v6 >= 2)
    {
      [(DockContainerViewController *)self activateExposeModeAnimated:1];
    }
  }
}

- (void)_popFirstDockedViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(DockContainerViewController *)self dockedStates];
  id v6 = [v5 firstObject];

  CGFloat v7 = [(DockContainerViewController *)self persistence];
  double v8 = [v6 dockIdentifier];
  [v7 removeDockedStateWithIdentifier:v8 sender:self];

  double v9 = [(DockContainerViewController *)self scene];
  id v10 = [v6 restoreViewControllerWithScene:v9];

  if (v10)
  {
    [(DockContainerViewController *)self presentViewController:v10 animated:v3 completion:0];
    if (v3)
    {
      uint64_t v11 = [(DockContainerViewController *)self dockedStates];
      id v12 = [v11 mutableCopy];

      [v12 removeObject:v6];
      id v13 = [v12 copy];
      [(DockContainerViewController *)self setDockedStates:v13];

      uint64_t v14 = [(DockContainerViewController *)self transitionCoordinator];
      v16[4] = self;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000AC108;
      v17[3] = &unk_100606048;
      v17[4] = self;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000AC18C;
      v16[3] = &unk_100606048;
      [v14 animateAlongsideTransition:v17 completion:v16];
    }
    uint64_t v15 = [(DockContainerViewController *)self delegate];
    [v15 dockContainer:self didRestoreViewController:v10];
  }
}

- (void)_layoutExistingDockedViewsWithIndexOffset:(int64_t)a3
{
  BOOL v3 = +[DockContainerViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100459508(a3, v3, v4, v5, v6, v7, v8, v9);
  }

  id v10 = [(DockContainerViewController *)self dockedStates];
  uint64_t v11 = [v10 ef_mapSelector:@"dockIdentifier"];

  id v12 = [(DockContainerViewController *)self dockedViews];
  id v13 = [v12 allKeys];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1000ACC54;
  v102[3] = &unk_100606678;
  id v79 = v11;
  id v103 = v79;
  v77 = [v13 ef_filter:v102];

  uint64_t v14 = self;
  if ((id)[(DockContainerViewController *)self dockingTransitionState] != (id)2)
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v15 = v77;
    id v16 = [v15 countByEnumeratingWithState:&v98 objects:v106 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v99;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v99 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v98 + 1) + 8 * i);
          uint64_t v20 = [(DockContainerViewController *)self dockedViews];
          v21 = [v20 objectForKeyedSubscript:v19];

          id v22 = [(DockContainerViewController *)self dockedViews];
          [v22 removeObjectForKey:v19];

          [v21 frame];
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          v31 = [(DockContainerViewController *)self view];
          [v31 frame];
          double MaxY = CGRectGetMaxY(v107);

          v108.origin.x = v24;
          v108.origin.y = v26;
          v108.size.width = v28;
          v108.size.height = v30;
          double MinX = CGRectGetMinX(v108);
          v109.origin.x = v24;
          v109.origin.y = v26;
          v109.size.width = v28;
          v109.size.height = v30;
          double Width = CGRectGetWidth(v109);
          v110.origin.x = v24;
          v110.origin.y = v26;
          v110.size.width = v28;
          v110.size.height = v30;
          [v21 setFrame:MinX, MaxY + 2.5, Width, CGRectGetHeight(v110)];
          v35 = +[DockContainerViewController log];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf.a) = 138543362;
            *(void *)((char *)&buf.a + 4) = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "View for ID %{public}@ has moved offscreen. Will remove view on cleanup.", (uint8_t *)&buf, 0xCu);
          }

          v36 = [(DockContainerViewController *)self offscreenDockedViews];
          [v36 addObject:v21];
        }
        id v16 = [v15 countByEnumeratingWithState:&v98 objects:v106 count:16];
      }
      while (v16);
    }

    uint64_t v14 = self;
  }
  id v37 = [(DockContainerViewController *)v14 view];
  +[SheetMetrics frameForPresentedSheetIn:v37];
  CGFloat v85 = v39;
  CGFloat v86 = v38;
  CGFloat v83 = v41;
  CGFloat v84 = v40;

  v42 = [(DockContainerViewController *)self activeTiltedTabViewController];
  v87 = [v42 view];

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v79;
  id v43 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
  v44 = self;
  if (v43)
  {
    uint64_t v80 = *(void *)v95;
    int64_t v45 = a3;
    do
    {
      for (j = 0; j != v43; j = (char *)j + 1)
      {
        if (*(void *)v95 != v80) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = *(void *)(*((void *)&v94 + 1) + 8 * (void)j);
        if (v45 >= 2) {
          uint64_t v48 = 2;
        }
        else {
          uint64_t v48 = v45;
        }
        v111.origin.y = v85;
        v111.origin.x = v86;
        v111.size.height = v83;
        v111.size.width = v84;
        double v49 = CGRectGetWidth(v111);
        v50 = [(DockContainerViewController *)v44 view];
        [v50 bounds];
        double v51 = CGRectGetWidth(v112);

        if (v49 >= v51) {
          double v52 = v51;
        }
        else {
          double v52 = v49;
        }
        v113.origin.y = v85;
        v113.origin.x = v86;
        v113.size.height = v83;
        v113.size.width = v84;
        double Height = CGRectGetHeight(v113);
        v54 = [(DockContainerViewController *)self view];
        [v54 bounds];
        double v55 = CGRectGetWidth(v114);

        -[DockContainerViewController _yPositionForDockedViewAtDepth:totalDockedCount:](self, "_yPositionForDockedViewAtDepth:totalDockedCount:", v48, (char *)[obj count] + a3);
        double v57 = v56;
        v58 = [(DockContainerViewController *)self dockedViews];
        v59 = [v58 objectForKeyedSubscript:v47];

        double v60 = (v55 - v52) * 0.5;
        if (!v59)
        {
          v61 = [(DockContainerViewController *)self dockedStates];
          v93[0] = _NSConcreteStackBlock;
          v93[1] = 3221225472;
          v93[2] = sub_1000ACC78;
          v93[3] = &unk_1006064F8;
          v93[4] = v47;
          v62 = [v61 ef_firstObjectPassingTest:v93];

          v115.origin.x = (v55 - v52) * 0.5;
          v115.origin.y = v57;
          v115.size.width = v52;
          v115.size.height = Height;
          double v63 = CGRectGetMinX(v115);
          v64 = [(DockContainerViewController *)self view];
          [v64 bounds];
          double v65 = CGRectGetMaxY(v116);
          v117.origin.x = v60;
          v117.origin.y = v57;
          v117.size.width = v52;
          v117.size.height = Height;
          double v66 = CGRectGetWidth(v117);
          v118.origin.x = v60;
          v118.origin.y = v57;
          v118.size.width = v52;
          v118.size.height = Height;
          double v67 = CGRectGetHeight(v118);

          v59 = [v62 createDockedViewWithFrame:v63, v65, v66, v67];
          if (!v59)
          {

            goto LABEL_37;
          }
          v68 = +[DockContainerViewController log];
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf.a) = 138412290;
            *(void *)((char *)&buf.a + 4) = v47;
            _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "Created new docked view for ID %@", (uint8_t *)&buf, 0xCu);
          }

          v69 = [(DockContainerViewController *)self dockedViews];
          [v69 setObject:v59 forKey:v47];

          [v59 setAlpha:0.0];
          v70 = [(DockContainerViewController *)self view];
          if (v87) {
            [v70 insertSubview:v59 below:v87];
          }
          else {
            [v70 addSubview:v59];
          }

          [(DockContainerViewController *)self _configureNewDockedView:v59];
        }
        long long v71 = *(_OWORD *)&CGAffineTransformIdentity.c;
        v92[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
        v92[1] = v71;
        v92[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
        [v59 setTransform:v92];
        [v59 setFrame:v60, v57, v52, Height];
        [v59 bounds];
        double v72 = CGRectGetHeight(v119);
        *(void *)&long long v73 = -1;
        *((void *)&v73 + 1) = -1;
        *(_OWORD *)&buf.c = v73;
        *(_OWORD *)&buf.tx = v73;
        *(_OWORD *)&buf.a = v73;
        [v59 transform];
        CGFloat v74 = (double)v48 * -0.05 + 1.0;
        CGAffineTransform v90 = buf;
        CGAffineTransformTranslate(&v91, &v90, 0.0, (v72 - v72 * v74) * -0.5);
        CGAffineTransform buf = v91;
        CGAffineTransform v90 = v91;
        CGAffineTransformScale(&v91, &v90, v74, v74);
        CGAffineTransform buf = v91;
        CGAffineTransform v89 = v91;
        [v59 setTransform:&v89];
        [v59 setShadowVisible:1];
        [v59 setDimmingAmount:(double)v48 * 0.1];
        double v75 = 0.0;
        if (v45 < 3) {
          double v75 = 1.0;
        }
        [v59 setAlpha:v75];
        id v76 = v59;

        ++v45;
        v87 = v76;
LABEL_37:
        v44 = self;
      }
      id v43 = [obj countByEnumeratingWithState:&v94 objects:v105 count:16];
    }
    while (v43);
  }
}

- (double)_yPositionForDockedViewAtDepth:(int64_t)a3 totalDockedCount:(int64_t)a4
{
  uint64_t v7 = [(DockContainerViewController *)self view];
  [v7 bounds];
  double MaxY = CGRectGetMaxY(v14);
  [(DockContainerViewController *)self _dockHeight];
  int64_t v10 = 3;
  if (a4 < 3) {
    int64_t v10 = a4;
  }
  double v11 = (double)((v10 & ~(v10 >> 63)) + ~a3) * 4.0;
  double v12 = MaxY - v9;

  return v11 + v12 + 2.5;
}

- (void)_cleanupOffscreenDockedViews
{
  BOOL v3 = +[DockContainerViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100459574();
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = [(DockContainerViewController *)self offscreenDockedViews];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) removeFromSuperview];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(DockContainerViewController *)self offscreenDockedViews];
  [v8 removeAllObjects];
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[DockContainerViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Popping to root view controller.", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000AD180;
  v15[3] = &unk_1006058A8;
  v15[4] = self;
  BOOL v16 = v3;
  uint64_t v6 = objc_retainBlock(v15);
  uint64_t v7 = [(DockContainerViewController *)self presentedViewController];
  if (v7)
  {
    if (sub_1000AAF94(self, v7))
    {
      uint64_t v8 = +[DockContainerViewController log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dockable view controller is currently presented. Will dock on dismissal.", buf, 2u);
      }

      if (v3)
      {
        [(DockContainerViewController *)self _prepareViewControllerForDockingIfPossible:v7];
      }
      else
      {
        long long v9 = [[DockedViewControllerState alloc] initWithDockableViewController:v7];
        long long v10 = [(DockContainerViewController *)self persistence];
        [v10 pushNewDockedState:v9 sender:0];

        long long v11 = [(DockContainerViewController *)self delegate];
        long long v12 = [(DockedViewControllerState *)v9 dockIdentifier];
        [v11 dockContainer:self dockedViewControllerWithIdentifier:v12];
      }
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AD1D0;
    v13[3] = &unk_100604578;
    CGRect v14 = v6;
    [(DockContainerViewController *)self dismissViewControllerAnimated:v3 completion:v13];
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (BOOL)shouldAutorotate
{
  v2 = [(DockContainerViewController *)self rootViewController];
  unsigned __int8 v3 = [v2 shouldAutorotate];

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ((id)[(DockContainerViewController *)self dockingTransitionState] == (id)1)
  {
    uint64_t v8 = [(DockContainerViewController *)self presentedViewController];
    long long v9 = [v8 transitionCoordinator];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_1000AD354;
    v11[3] = &unk_100606048;
    v11[4] = self;
    [v9 animateAlongsideTransition:0 completion:v11];
  }
  v10.receiver = self;
  v10.super_class = (Class)DockContainerViewController;
  -[DockContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)tiltedTabViewControllerDidCancel:(id)a3
{
}

- (void)tiltedTabViewController:(id)a3 didSelectView:(id)a4 representingState:(id)a5
{
}

- (CGRect)tiltedTabViewController:(id)a3 dockedFrameForViewRepresentingState:(id)a4
{
  id v5 = [a4 dockIdentifier:a3];
  uint64_t v6 = [(DockContainerViewController *)self dockedViews];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    [v7 frame];
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    CGFloat height = v14;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = [(DockContainerViewController *)self presentedViewController];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v11 = [(DockContainerViewController *)self activeViewController];
      [v11 presentViewController:v8 animated:v6 completion:v9];
    }
    else
    {
      if ((sub_1000AAF94(self, v10) & 1) != 0
        || [v10 conformsToProtocol:&OBJC_PROTOCOL___TearableViewController])
      {
        [v10 setTransitioningDelegate:self];
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000AD764;
      v25[3] = &unk_1006066A0;
      void v25[4] = self;
      id v26 = v8;
      BOOL v28 = v6;
      id v27 = v9;
      [(DockContainerViewController *)self dismissViewControllerAnimated:v6 completion:v25];
    }
  }
  else
  {
    if ((sub_1000AAF94(self, v8) & 1) != 0
      || [v8 conformsToProtocol:&OBJC_PROTOCOL___TearableViewController])
    {
      double v12 = +[DockContainerViewController log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_1004595DC((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
      }

      double v19 = [v8 presentationController];
      [v19 setDelegate:self];
    }
    if ([v8 conformsToProtocol:&OBJC_PROTOCOL___TearableViewController])
    {
      uint64_t v20 = [v8 presentationController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v22 = +[DockContainerViewController log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_1004595A8();
        }

        double v23 = [v8 presentationController];
        [v23 _setAllowsTearOff:1];
        [v23 setPrefersGrabberVisible:1];
      }
    }
    v24.receiver = self;
    v24.super_class = (Class)DockContainerViewController;
    [(DockContainerViewController *)&v24 presentViewController:v8 animated:v6 completion:v9];
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  id v5 = +[DockContainerViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100459648();
  }

  BOOL v6 = [v4 presentedViewController];
  [(DockContainerViewController *)self _prepareViewControllerForDockingIfPossible:v6];

  return 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(DockContainerViewController *)self presentationControllerDelegateObservers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) presentationControllerWillDismiss:v4];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v9 = [v4 presentedViewController];
  if (sub_1000AAF94(self, v9))
  {
    [(DockContainerViewController *)self setDockingTransitionState:1];
    double v10 = [v9 transitionCoordinator];
    if (([v10 isInterruptible] & 1) != 0
      || [v10 isInteractive])
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      void v11[2] = sub_1000ADA44;
      v11[3] = &unk_100606600;
      v11[4] = self;
      id v12 = v9;
      [v10 notifyWhenInteractionChangesUsingBlock:v11];
    }
  }
}

- (void)_sheetPresentationControllerDidTearOff:(id)a3
{
  id v4 = a3;
  [(DockContainerViewController *)self setDraftWasTornOff:1];
  id v5 = [v4 presentedViewController];
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___DockableViewController]
    && [v5 conformsToProtocol:&OBJC_PROTOCOL___TearableViewController])
  {
    id v6 = [v5 dockIdentifier];
    uint64_t v7 = +[DockContainerViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 138543362;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dockable view controller with identifier %{public}@ was torn off.", buf, 0xCu);
    }

    id v8 = [(DockContainerViewController *)self delegate];
    [v8 dockContainer:self dockedViewWasTornOffWithIdentifier:v6];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000ADD54;
  v10[3] = &unk_1006047A0;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000ADDC4;
  v9[3] = &unk_100604550;
  v9[4] = self;
  +[UIView animateWithDuration:4 delay:v10 options:v9 animations:0.2 completion:0.0];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if (sub_1000AAF94(self, a3))
  {
    id v6 = [(DockContainerViewController *)self nextPresentationAnimation];
    [(DockContainerViewController *)self setNextPresentationAnimation:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  if (sub_1000AAF94(self, v4))
  {
    [(DockContainerViewController *)self setDraftWasTornOff:0];
    id v5 = [(DockContainerViewController *)self _newDockingAnimatorForDismissedController:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_newDockingAnimatorForDismissedController:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)_UISheetAnimationController);
  [v5 setIsReversed:1];
  id v6 = [(DockContainerViewController *)self dockedStates];
  uint64_t v7 = (char *)[v6 count] + 1;

  [(DockContainerViewController *)self _yPositionForDockedViewAtDepth:0 totalDockedCount:v7];
  double v9 = v8;
  double v10 = [(DockContainerViewController *)self view];
  long long v11 = [v10 window];
  id v12 = [v4 view];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [v4 view];
  [v11 convertRect:v21 fromView:v14, v16, v18, v20];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v73.origin.CGFloat x = v23;
  v73.origin.CGFloat y = v25;
  v73.size.CGFloat width = v27;
  v73.size.CGFloat height = v29;
  double MinX = CGRectGetMinX(v73);
  v74.origin.CGFloat x = v23;
  v74.origin.CGFloat y = v25;
  v74.size.CGFloat width = v27;
  v74.size.CGFloat height = v29;
  double Width = CGRectGetWidth(v74);
  v75.origin.CGFloat x = v23;
  v75.origin.CGFloat y = v25;
  v75.size.CGFloat width = v27;
  v75.size.CGFloat height = v29;
  double Height = CGRectGetHeight(v75);
  [v5 setSourceFrame:MinX, v9, Width, Height];
  v33 = [v4 presentationController];
  v34 = [v33 presentedView];

  v35 = [v4 view];
  [v35 frame];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  v44 = [v4 view];
  [v34 convertRect:v44 fromView:v37];
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;

  v53 = [v4 dockedViewWithFrame:v46, v48, v50, v52];
  [v53 setAlpha:0.0];
  v54 = [v4 dockedViewWithFrame:MinX, v9, Width, Height];
  double v55 = [[DockedViewControllerState alloc] initWithDockableViewController:v4];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_1000AE380;
  v69[3] = &unk_100604668;
  id v56 = v34;
  id v70 = v56;
  id v57 = v53;
  id v71 = v57;
  double v72 = self;
  v58 = v5;
  [v5 setNoninteractiveAnimations:v69];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1000AE41C;
  v64[3] = &unk_1006066C8;
  v64[4] = self;
  v59 = v55;
  double v65 = v59;
  id v60 = v54;
  id v66 = v60;
  id v61 = v57;
  id v67 = v61;
  id v62 = v4;
  id v68 = v62;
  [v58 setNoninteractiveCompletion:v64];

  return v58;
}

- (void)_configureNewDockedView:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_dockViewTapped"];
  [v5 setDelegate:self];
  [v4 addGestureRecognizer:v5];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v4 preferredSpringLoadingEffect];
  }
  else
  {
    id v6 = 0;
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = objc_alloc((Class)UISpringLoadedInteraction);
  double v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  long long v11 = sub_1000AE728;
  id v12 = &unk_1006066F0;
  objc_copyWeak(&v13, &location);
  id v8 = [v7 initWithInteractionBehavior:0 interactionEffect:v6 activationHandler:&v9];
  [v4 addInteraction:v8, v9, v10, v11, v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)_isDockableViewControllerPresented
{
  v2 = self;
  unsigned __int8 v3 = [(DockContainerViewController *)self activeViewController];
  LOBYTE(v2) = sub_1000AAF94(v2, v3);

  return (char)v2;
}

- (void)_prepareViewControllerForDockingIfPossible:(id)a3
{
  id v4 = a3;
  if (sub_1000AAF94(self, v4))
  {
    id v5 = v4;
    [v5 setTransitioningDelegate:self];
    id v6 = +[DockContainerViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1004596B0();
    }

    if (objc_opt_respondsToSelector()) {
      [v5 willBeginDocking];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(DockContainerViewController *)self view];
  [v4 locationOfTouch:0 inView:v5];
  double v7 = v6;

  id v8 = [(DockContainerViewController *)self view];
  [v8 bounds];
  double MaxY = CGRectGetMaxY(v14);
  uint64_t v10 = [(DockContainerViewController *)self view];
  [v10 safeAreaInsets];
  BOOL v12 = v7 < MaxY - v11;

  return v12;
}

- (void)_tiltedTabViewWillBePresented:(id)a3
{
  id v5 = a3;
  if ([(DockContainerViewController *)self isExposeModeActivated])
  {
    id v4 = [v5 object];

    if (v4 != self) {
      [(DockContainerViewController *)self deactivateExposeModeAnimated:1];
    }
  }
}

- (void)_handlePersistenceChangeFromSelf
{
  unsigned __int8 v3 = +[DockContainerViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10045974C();
  }

  if ((id)[(DockContainerViewController *)self dockingTransitionState] == (id)2) {
    [(DockContainerViewController *)self setDockingTransitionState:0];
  }
  id v4 = [(DockContainerViewController *)self transitionCoordinator];
  unsigned int v5 = [v4 isAnimated];

  double v6 = +[DockContainerViewController log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_1004596E4();
    }

    id v8 = [(DockContainerViewController *)self transitionCoordinator];
    v9[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AEBAC;
    v10[3] = &unk_100606048;
    v10[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AEC30;
    v9[3] = &unk_100606048;
    [v8 animateAlongsideTransition:v10 completion:v9];
  }
  else
  {
    if (v7) {
      sub_100459718();
    }

    id v8 = [(DockContainerViewController *)self view];
    [v8 setNeedsLayout];
  }
}

- (void)_handlePersistenceChangeFromAnotherObserver
{
  unsigned __int8 v3 = +[DockContainerViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004597B4();
  }

  id v4 = [(DockContainerViewController *)self view];
  [v4 setNeedsLayout];

  unsigned int v5 = [(DockContainerViewController *)self scene];
  id v6 = [v5 activationState];

  if (v6 == (id)2)
  {
    BOOL v7 = +[DockContainerViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100459780();
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000AEDCC;
    v9[3] = &unk_1006047A0;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000AEE2C;
    v8[3] = &unk_100604550;
    v8[4] = self;
    +[UIView animateWithDuration:4 delay:v9 options:v8 animations:0.2 completion:0.0];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("_commandMPressed:" == a3)
  {
    if ([(DockContainerViewController *)self _isDockableViewControllerPresented])
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      id v8 = [(DockContainerViewController *)self dockedStates];
      if ([v8 count])
      {
        double v9 = [(DockContainerViewController *)self activeViewController];
        uint64_t v10 = [(DockContainerViewController *)self rootViewController];
        unsigned __int8 v7 = v9 == v10;
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DockContainerViewController;
    unsigned __int8 v7 = [(DockContainerViewController *)&v12 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (void)validateCommand:(id)a3
{
  id v9 = a3;
  if ([v9 action] == "_commandMPressed:")
  {
    if ([(DockContainerViewController *)self _isDockableViewControllerPresented])
    {
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 localizedStringForKey:@"MINIMIZE_WINDOW" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v4 = [(DockContainerViewController *)self dockedStates];
      if (![v4 count])
      {
        id v6 = 0;
        goto LABEL_9;
      }
      unsigned __int8 v7 = [(DockContainerViewController *)self activeViewController];
      id v8 = [(DockContainerViewController *)self rootViewController];

      if (v7 != v8)
      {
        id v6 = 0;
LABEL_10:
        [v9 setDiscoverabilityTitle:v6];

        goto LABEL_11;
      }
      id v4 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v5 = [v4 localizedStringForKey:@"CONTINUE_WINDOW" value:&stru_100619928 table:@"Main"];
    }
    id v6 = (void *)v5;
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
}

- (void)_commandMPressed:(id)a3
{
  id v4 = a3;
  if ([(DockContainerViewController *)self _isDockableViewControllerPresented]) {
    [(DockContainerViewController *)self _minimizeKeyCommandPressed:v4];
  }
  else {
    [(DockContainerViewController *)self _continueKeyCommandPressed:v4];
  }
}

- (void)_minimizeKeyCommandPressed:(id)a3
{
}

- (void)dockPresentedViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(DockContainerViewController *)self _isDockableViewControllerPresented]
    && ![(DockContainerViewController *)self dockingTransitionState])
  {
    uint64_t v5 = [(DockContainerViewController *)self presentedViewController];
    [(DockContainerViewController *)self _prepareViewControllerForDockingIfPossible:v5];

    [(DockContainerViewController *)self dismissViewControllerAnimated:1 completion:0];
    id v6 = [(DockContainerViewController *)self transitionCoordinator];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AF330;
    v10[3] = &unk_100606048;
    v10[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000AF3C0;
    v8[3] = &unk_100606718;
    v8[4] = self;
    id v7 = v4;
    id v9 = v7;
    [v6 animateAlongsideTransition:v10 completion:v8];

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)_continueKeyCommandPressed:(id)a3
{
}

- (DockContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DockContainerViewControllerDelegate *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (MailScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void)setDockedStates:(id)a3
{
}

- (NSMutableDictionary)dockedViews
{
  return self->_dockedViews;
}

- (void)setDockedViews:(id)a3
{
}

- (NSMutableArray)offscreenDockedViews
{
  return self->_offscreenDockedViews;
}

- (void)setOffscreenDockedViews:(id)a3
{
}

- (TabSelectionPresentationAnimationController)nextPresentationAnimation
{
  return self->_nextPresentationAnimation;
}

- (void)setNextPresentationAnimation:(id)a3
{
}

- (TiltedTabViewController)activeTiltedTabViewController
{
  return self->_activeTiltedTabViewController;
}

- (void)setActiveTiltedTabViewController:(id)a3
{
}

- (BOOL)draftWasTornOff
{
  return self->_draftWasTornOff;
}

- (void)setDraftWasTornOff:(BOOL)a3
{
  self->_draftWasTornOff = a3;
}

- (void)setPersistence:(id)a3
{
}

- (void)setDockShadowView:(id)a3
{
}

- (void)setPresentationControllerDelegateObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationControllerDelegateObservers, 0);
  objc_storeStrong((id *)&self->_dockShadowView, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_activeTiltedTabViewController, 0);
  objc_storeStrong((id *)&self->_nextPresentationAnimation, 0);
  objc_storeStrong((id *)&self->_dockHeightConstraint, 0);
  objc_storeStrong((id *)&self->_offscreenDockedViews, 0);
  objc_storeStrong((id *)&self->_dockedViews, 0);
  objc_storeStrong((id *)&self->_dockedStates, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end