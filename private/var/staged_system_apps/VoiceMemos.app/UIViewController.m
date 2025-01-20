@interface UIViewController
+ (id)recursiveDescription;
- (BOOL)rc_canAnimate;
- (BOOL)rc_isDescendantOfViewController:(id)a3;
- (BOOL)rc_isPrimaryLayoutAxis:(int64_t)a3;
- (BOOL)rc_screenUpdatesDisabled;
- (BOOL)rc_shouldAutoDisableUpdatesWhenInBackground;
- (id)_recursiveDescriptionWithInset:(id)a3;
- (id)rc_navigationItemForPresentingNavigationItem:(id)a3 forViewController:(id)a4;
- (id)recursiveDescription;
- (void)rc_addChildViewWithViewController:(id)a3;
- (void)rc_addChildViewWithViewController:(id)a3 toView:(id)a4;
- (void)rc_applicationDidEnterBackground;
- (void)rc_applicationWillEnterForeground;
- (void)rc_automaticallyUpdateScreenUpdatesDisabled;
- (void)rc_configurePopoverControllerWithSource:(id)a3;
- (void)rc_ensureIsInterfaceOrientationMask:(unint64_t)a3 preferredOrientation:(int64_t)a4 doneEnsuringBlock:(id)a5;
- (void)rc_loadViewIfNecessary;
- (void)rc_setScreenUpdatesDisabled:(BOOL)a3;
@end

@implementation UIViewController

- (void)rc_addChildViewWithViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self view];
  [(UIViewController *)self rc_addChildViewWithViewController:v4 toView:v5];
}

- (void)rc_addChildViewWithViewController:(id)a3 toView:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  v7 = [v8 view];
  [v6 addSubview:v7];

  [(UIViewController *)self addChildViewController:v8];
  [v8 didMoveToParentViewController:self];
}

- (BOOL)rc_canAnimate
{
  v2 = [(UIViewController *)self view];
  unsigned __int8 v3 = [v2 rc_canAnimate];

  return v3;
}

- (BOOL)rc_isPrimaryLayoutAxis:(int64_t)a3
{
  id v4 = [(UIViewController *)self view];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  return v6 > v8 && a3 == 0;
}

- (void)rc_loadViewIfNecessary
{
  v2 = [(UIViewController *)self view];
}

- (id)rc_navigationItemForPresentingNavigationItem:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    id v8 = [objc_alloc((Class)UINavigationItem) initWithTitle:&stru_100228BC8];
  }
  else
  {
    v9 = [(UIViewController *)self parentViewController];

    if (v9)
    {
      v10 = [(UIViewController *)self parentViewController];
      v11 = [v10 rc_navigationItemForPresentingNavigationItem:v6 forViewController:v7];

      goto LABEL_7;
    }
    id v8 = v6;
  }
  v11 = v8;
LABEL_7:

  return v11;
}

- (BOOL)rc_isDescendantOfViewController:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  double v5 = [(UIViewController *)self parentViewController];
  unsigned __int8 v6 = [v5 rc_isDescendantOfViewController:v4];

  return v6;
}

- (void)rc_ensureIsInterfaceOrientationMask:(unint64_t)a3 preferredOrientation:(int64_t)a4 doneEnsuringBlock:(id)a5
{
  id v8 = (void (**)(void))a5;
  if (((1 << (char)[(UIViewController *)self interfaceOrientation]) & a3) != 0)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    v9 = +[UIApplication sharedApplication];
    v10 = [v9 delegate];
    v11 = [v10 window];
    v12 = [v11 rootViewController];
    v13 = [v12 view];
    [v13 setUserInteractionEnabled:0];

    v14 = +[UIDevice currentDevice];
    [v14 setOrientation:a4 animated:1];

    [(UIViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
    dispatch_time_t v15 = dispatch_time(0, 330000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006E610;
    block[3] = &unk_1002221F8;
    v17 = v8;
    dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)rc_automaticallyUpdateScreenUpdatesDisabled
{
  unsigned __int8 v3 = objc_getAssociatedObject(self, "_RCUIViewControllerNoticationObserver");
  if (!v3)
  {
    value = objc_alloc_init(RCUIViewControllerNoticationObserver);
    [(RCUIViewControllerNoticationObserver *)value setViewController:self];
    objc_setAssociatedObject(self, "_RCUIViewControllerNoticationObserver", value, (void *)0x301);
    unsigned __int8 v3 = value;
  }
}

- (void)rc_setScreenUpdatesDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)self rc_screenUpdatesDisabled] != a3)
  {
    double v5 = +[NSNumber numberWithBool:v3];
    objc_setAssociatedObject(self, "_RCUIViewControllerScreenUpdateDisabled", v5, (void *)0x301);

    [(UIViewController *)self rc_screenUpdatesDisabledDidChange];
  }
}

- (BOOL)rc_screenUpdatesDisabled
{
  BOOL v3 = objc_getAssociatedObject(self, "_RCUIViewControllerScreenUpdateDisabled");
  unsigned __int8 v4 = [v3 BOOLValue];

  if (v4) {
    return 1;
  }
  unsigned __int8 v6 = [(UIViewController *)self parentViewController];
  id v7 = v6;
  if (v6) {
    unsigned __int8 v5 = [v6 rc_screenUpdatesDisabled];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)rc_shouldAutoDisableUpdatesWhenInBackground
{
  BOOL v3 = [(UIViewController *)self parentViewController];

  if (!v3) {
    return 1;
  }
  unsigned __int8 v4 = [(UIViewController *)self parentViewController];
  unsigned __int8 v5 = [v4 rc_shouldAutoDisableUpdatesWhenInBackground];

  return v5;
}

- (void)rc_applicationDidEnterBackground
{
  if ([(UIViewController *)self rc_shouldAutoDisableUpdatesWhenInBackground])
  {
    [(UIViewController *)self rc_setScreenUpdatesDisabled:1];
  }
}

- (void)rc_applicationWillEnterForeground
{
  if ([(UIViewController *)self rc_shouldAutoDisableUpdatesWhenInBackground])
  {
    [(UIViewController *)self rc_setScreenUpdatesDisabled:0];
  }
}

- (void)rc_configurePopoverControllerWithSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v20 = v4;
    unsigned __int8 v5 = +[UIDevice currentDevice];
    id v6 = [v5 userInterfaceIdiom];

    id v4 = v20;
    if (v6 == (id)1)
    {
      id v7 = [(UIViewController *)self popoverPresentationController];
      [v7 _setIgnoreBarButtonItemSiblings:1];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [(UIViewController *)self popoverPresentationController];
        [v8 setBarButtonItem:v20];
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v4 = v20;
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_8;
        }
        id v10 = v20;
        v11 = [(UIViewController *)self popoverPresentationController];
        [v11 setSourceView:v10];

        [v10 bounds];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;

        id v8 = [(UIViewController *)self popoverPresentationController];
        [v8 setSourceRect:v13, v15, v17, v19];
      }

      id v4 = v20;
    }
  }
LABEL_8:
}

+ (id)recursiveDescription
{
  return +[UIViewController _allDescriptions];
}

- (id)_recursiveDescriptionWithInset:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSMutableArray array];
  id v6 = +[NSString stringWithFormat:@"%@    ", v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(UIViewController *)self childViewControllers];
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) _recursiveDescriptionWithInset:v6];
        [v5 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v13 = [(UIViewController *)self description];
  double v14 = [(UIViewController *)self view];
  double v15 = [v14 description];
  double v16 = +[NSString stringWithFormat:@"%@%@ view:%@", v4, v13, v15];

  if ([v5 count])
  {
    double v17 = [v5 componentsJoinedByString:@"\n"];
    id v18 = +[NSString stringWithFormat:@"%@\n%@", v16, v17];
  }
  else
  {
    id v18 = v16;
  }

  return v18;
}

- (id)recursiveDescription
{
  return [(UIViewController *)self _recursiveDescriptionWithInset:&stru_100228BC8];
}

@end