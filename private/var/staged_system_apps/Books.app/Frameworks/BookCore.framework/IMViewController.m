@interface IMViewController
- (BOOL)definesTransitionContext;
- (BOOL)isRotating;
- (BOOL)isVisible;
- (BOOL)shouldAutorotate;
- (BOOL)shouldPerformChildTransition:(id)a3;
- (IMTheme)theme;
- (IMThemePage)themePage;
- (IMViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (IMViewControllerTransition)currentTransition;
- (IMViewControllerTransition)transitionItem;
- (NSMutableArray)pendingTransitions;
- (id)_transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6;
- (id)transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6;
- (int64_t)overrideUserInterfaceStyle;
- (void)addTransition:(id)a3;
- (void)childTransitionDidComplete:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)fireTransition:(id)a3;
- (void)processPendingTransitions;
- (void)setCurrentTransition:(id)a3;
- (void)setPendingTransitions:(id)a3;
- (void)setTheme:(id)a3;
- (void)setThemePage:(id)a3;
- (void)setTransitionItem:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation IMViewController

- (IMViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IMViewController;
  v4 = [(IMViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(IMViewController *)v4 initCommon];
  }
  return v5;
}

- (void)dealloc
{
  [(IMViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)IMViewController;
  [(IMViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IMViewController;
  [(IMViewController *)&v4 viewWillAppear:a3];
  [(IMViewController *)self setVisible:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMViewController *)self setVisible:0];
  v5.receiver = self;
  v5.super_class = (Class)IMViewController;
  [(IMViewController *)&v5 viewDidDisappear:v3];
}

- (void)viewDidUnload
{
  [(IMViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)IMViewController;
  [(IMViewController *)&v3 viewDidUnload];
}

- (BOOL)shouldAutorotate
{
  objc_super v3 = [(IMViewController *)self currentTransition];

  if (!v3) {
    return 1;
  }
  objc_super v4 = [(IMViewController *)self currentTransition];
  unsigned __int8 v5 = [v4 shouldAllowInterfaceRotation];

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMViewController;
  -[IMViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  BOOL IsIdentity = CGAffineTransformIsIdentity(&v11);
  if (!IsIdentity) {
    self->_rotating = 1;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2F2C0;
  v9[3] = &unk_2C4BA0;
  BOOL v10 = !IsIdentity;
  v9[4] = self;
  [v7 animateAlongsideTransition:&stru_2C4B78 completion:v9];
}

- (void)setTheme:(id)a3
{
  id v6 = a3;
  if (!-[IMTheme isEqual:](self->_theme, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_theme, a3);
    objc_opt_class();
    unsigned __int8 v5 = BUDynamicCast();
    [(IMViewController *)self setThemePage:v5];

    [(IMViewController *)self setNeedsUserInterfaceAppearanceUpdate];
    [(IMViewController *)self im_notifyThemeDidChange];
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  v4.receiver = self;
  v4.super_class = (Class)IMViewController;
  int64_t result = [(IMViewController *)&v4 overrideUserInterfaceStyle];
  if (!result) {
    return [(IMThemePage *)self->_themePage userInterfaceStyle];
  }
  return result;
}

- (BOOL)shouldPerformChildTransition:(id)a3
{
  return 1;
}

- (void)childTransitionDidComplete:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  [v5 setParentViewController:0];
  id v6 = [v5 toViewController];
  [v6 didMoveToParentViewController:self];

  [(IMViewController *)self setCurrentTransition:0];
  id v7 = [(IMViewController *)self pendingTransitions];
  [v7 removeObject:v5];

  [(IMViewController *)self processPendingTransitions];
}

- (id)transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6
{
  return [(IMViewController *)self _transitionFromViewController:a3 toViewController:a4 transition:a5 reverse:a6];
}

- (BOOL)definesTransitionContext
{
  return 0;
}

- (id)_transitionFromViewController:(id)a3 toViewController:(id)a4 transition:(id)a5 reverse:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v12)
  {
    id v14 = [v12 copy];
  }
  else
  {
    id v14 = +[IMTransition transition];
    [v14 setAnimated:0];
  }
  if (v10 != v11)
  {
    [v14 setFromViewController:v10];
    [v14 setToViewController:v11];
    [v14 setParentViewController:self];
    [v14 setReverse:v6];
    [(IMViewController *)self addTransition:v14];
  }

  return v14;
}

- (void)addTransition:(id)a3
{
  id v4 = a3;
  id v5 = [(IMViewController *)self pendingTransitions];

  if (!v5)
  {
    BOOL v6 = +[NSMutableArray array];
    [(IMViewController *)self setPendingTransitions:v6];
  }
  id v7 = [(IMViewController *)self pendingTransitions];
  [v7 addObject:v4];

  [(IMViewController *)self processPendingTransitions];
}

- (void)fireTransition:(id)a3
{
  id v8 = a3;
  if ([(IMViewController *)self isViewLoaded])
  {
    id v4 = [(IMViewController *)self view];
    [v4 setUserInteractionEnabled:0];

    id v5 = [v8 fromViewController];
    BOOL v6 = [v5 parentViewController];
  }
  id v7 = [v8 toViewController];
  [(IMViewController *)self addChildViewController:v7];

  [v8 beginTransition];
}

- (void)processPendingTransitions
{
  objc_super v3 = [(IMViewController *)self currentTransition];

  if (!v3)
  {
    id v4 = [(IMViewController *)self pendingTransitions];
    id v5 = [v4 count];

    if (v5)
    {
      BOOL v6 = [(IMViewController *)self pendingTransitions];
      id v9 = [v6 objectAtIndex:0];

      [(IMViewController *)self setCurrentTransition:v9];
      [(IMViewController *)self fireTransition:v9];
    }
    else if ([(IMViewController *)self isViewLoaded])
    {
      id v7 = [(IMViewController *)self view];
      [v7 setUserInteractionEnabled:1];

      objc_opt_class();
      if (objc_opt_respondsToSelector())
      {
        id v8 = objc_opt_class();
        [v8 attemptRotationToDeviceOrientation];
      }
    }
  }
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (IMTheme)theme
{
  return self->_theme;
}

- (IMViewControllerTransition)transitionItem
{
  return self->_transitionItem;
}

- (void)setTransitionItem:(id)a3
{
}

- (NSMutableArray)pendingTransitions
{
  return self->_pendingTransitions;
}

- (void)setPendingTransitions:(id)a3
{
}

- (IMViewControllerTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
}

- (IMThemePage)themePage
{
  return self->_themePage;
}

- (void)setThemePage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themePage, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_pendingTransitions, 0);
  objc_storeStrong((id *)&self->_transitionItem, 0);

  objc_storeStrong((id *)&self->_theme, 0);
}

@end