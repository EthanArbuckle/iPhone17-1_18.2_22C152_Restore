@interface DebugUI
+ (BOOL)isDebugUrl:(id)a3;
+ (id)createScreenShotOfPresentedViewController:(id)a3;
+ (id)debugViewController;
+ (void)initializeDebugUI:(id)a3;
+ (void)showDebugUI;
@end

@implementation DebugUI

+ (BOOL)isDebugUrl:(id)a3
{
  v3 = [a3 host];
  unsigned __int8 v4 = [v3 isEqualToString:@"debug"];

  return v4;
}

+ (void)initializeDebugUI:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:a1 action:"showDebugUI"];
  [v5 _setRequiresSystemGesturesToFail:0];
  [v5 setNumberOfTouchesRequired:2];
  [v5 setNumberOfTapsRequired:2];
  [v4 addGestureRecognizer:v5];
}

+ (void)showDebugUI
{
  v2 = +[DebugUtil sharedApplicationIfPossible];
  if (v2)
  {
    id v19 = v2;
    NSLog(@"Showing Debug UI");
    v3 = (void *)showDebugUI_navController;
    if (!showDebugUI_navController)
    {
      id v4 = objc_alloc((Class)UINavigationController);
      id v5 = +[DebugUI debugViewController];
      id v6 = [v4 initWithRootViewController:v5];
      v7 = (void *)showDebugUI_navController;
      showDebugUI_navController = (uint64_t)v6;

      v8 = +[UIDevice currentDevice];
      v9 = (char *)[v8 userInterfaceIdiom];
      [(id)showDebugUI_navController setModalPresentationStyle:2 * (v9 == (unsigned char *)&dword_0 + 1)];

      v3 = (void *)showDebugUI_navController;
    }
    v10 = [v3 presentingViewController];

    v2 = v19;
    if (!v10)
    {
      v11 = [v19 delegate];
      v12 = [v11 window];
      v13 = [v12 rootViewController];

      v14 = [v13 presentedViewController];

      if (v14)
      {
        do
        {
          v15 = [v13 presentedViewController];

          v16 = [v15 presentedViewController];

          v13 = v15;
        }
        while (v16);
      }
      else
      {
        v15 = v13;
      }
      v17 = +[DebugUI createScreenShotOfPresentedViewController:v15];
      v18 = +[DebugUI debugViewController];
      [v18 setScreenShotImage:v17];

      [v15 presentViewController:showDebugUI_navController animated:1 completion:0];
      v2 = v19;
    }
  }
}

+ (id)debugViewController
{
  v2 = (void *)debugViewController_debugViewController;
  if (!debugViewController_debugViewController)
  {
    v3 = objc_alloc_init(IMDebugViewController);
    id v4 = (void *)debugViewController_debugViewController;
    debugViewController_debugViewController = (uint64_t)v3;

    v2 = (void *)debugViewController_debugViewController;
  }

  return v2;
}

+ (id)createScreenShotOfPresentedViewController:(id)a3
{
  v3 = [a3 view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  v8 = +[UIScreen mainScreen];
  [v8 scale];
  CGFloat v10 = v9;
  v14.width = v5;
  v14.height = v7;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v10);

  [v3 bounds];
  [v3 drawViewHierarchyInRect:1];
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

@end