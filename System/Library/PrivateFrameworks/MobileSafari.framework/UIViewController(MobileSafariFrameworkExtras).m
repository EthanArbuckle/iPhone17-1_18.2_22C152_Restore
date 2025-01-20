@interface UIViewController(MobileSafariFrameworkExtras)
- (double)_sf_bottomUnsafeAreaFrame;
- (double)_sf_bottomUnsafeAreaFrameForToolbar;
- (id)_sf_viewControllerToPresentFrom;
- (id)safari_sheetPresentationController;
- (uint64_t)_sf_canEditFields;
- (uint64_t)_sf_isMFMailComposeViewController;
- (uint64_t)_sf_isPKAddPassesViewController;
- (uint64_t)_sf_isPresentationControllerDismissalTransitionDidEndNotification:()MobileSafariFrameworkExtras;
- (uint64_t)safari_isEventuallyPresentedByViewControllerClass:()MobileSafariFrameworkExtras;
- (uint64_t)safari_isPresentedByActivityViewController;
- (uint64_t)safari_prefersHalfHeightSheetPresentationWithLoweredBar;
- (uint64_t)safari_wantsDoneButtonInModalBookmarksPanel;
- (uint64_t)safari_wantsTransparentApplicationBackground;
- (void)_sf_animateAlongsideTransitionOrPerform:()MobileSafariFrameworkExtras;
- (void)_sf_presentViewControllerOnTopOfPresentedViewController:()MobileSafariFrameworkExtras animated:completion:;
- (void)safari_dismissPresentedAlert;
- (void)safari_updateApplicationBackgroundStyle;
@end

@implementation UIViewController(MobileSafariFrameworkExtras)

- (void)safari_updateApplicationBackgroundStyle
{
  v2 = [a1 viewIfLoaded];
  id v10 = [v2 window];

  v3 = [v10 windowScene];
  v4 = [v10 rootViewController];
  char v5 = objc_msgSend(v4, "safari_wantsTransparentApplicationBackground");

  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [v10 setBackgroundColor:v6];

    v7 = [a1 traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];

    if (v8 == 2) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  else
  {
    [v10 setBackgroundColor:0];
    uint64_t v9 = 0;
  }
  [v3 _setBackgroundStyle:v9];
}

- (uint64_t)safari_wantsTransparentApplicationBackground
{
  return 0;
}

- (uint64_t)safari_wantsDoneButtonInModalBookmarksPanel
{
  return 0;
}

- (id)safari_sheetPresentationController
{
  v1 = [a1 presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)safari_prefersHalfHeightSheetPresentationWithLoweredBar
{
  return 0;
}

- (uint64_t)safari_isPresentedByActivityViewController
{
  uint64_t v2 = objc_opt_class();

  return objc_msgSend(a1, "safari_isEventuallyPresentedByViewControllerClass:", v2);
}

- (uint64_t)safari_isEventuallyPresentedByViewControllerClass:()MobileSafariFrameworkExtras
{
  char v5 = [a1 presentingViewController];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 1;
  }
  uint64_t v8 = [a1 presentingViewController];

  if (!v8) {
    return 0;
  }
  uint64_t v9 = [a1 presentingViewController];
  uint64_t v10 = objc_msgSend(v9, "safari_isEventuallyPresentedByViewControllerClass:", a3);

  return v10;
}

- (void)safari_dismissPresentedAlert
{
  id v1 = [a1 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v1 dismissViewControllerAnimated:0 completion:0];
  }
}

- (id)_sf_viewControllerToPresentFrom
{
  id v1 = a1;
  uint64_t v2 = [v1 presentedViewController];
  if (v2)
  {
    while (1)
    {
      v3 = v2;
      if ([v2 isBeingDismissed]) {
        break;
      }

      uint64_t v2 = [v3 presentedViewController];
      id v1 = v3;
      if (!v2)
      {
        id v1 = v3;
        v3 = 0;
        break;
      }
    }
  }

  return v1;
}

- (double)_sf_bottomUnsafeAreaFrame
{
  id v1 = [a1 viewIfLoaded];
  uint64_t v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_sf_bottomUnsafeAreaFrame");
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
  }

  return v4;
}

- (double)_sf_bottomUnsafeAreaFrameForToolbar
{
  id v1 = [a1 viewIfLoaded];
  uint64_t v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "_sf_bottomUnsafeAreaFrameForToolbar");
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB28];
  }

  return v4;
}

- (void)_sf_presentViewControllerOnTopOfPresentedViewController:()MobileSafariFrameworkExtras animated:completion:
{
  id v14 = a3;
  id v8 = a5;
  uint64_t v9 = objc_msgSend(a1, "_sf_viewControllerToPresentFrom");
  uint64_t v10 = v9;
  if (v9 == a1)
  {
    v11 = objc_opt_class();
    uint64_t v12 = [v11 instanceMethodForSelector:sel_presentViewController_animated_completion_];
    do
    {
      v11 = (void *)[v11 superclass];
      v13 = (void (*)(void *, char *, id, uint64_t, id))[v11 instanceMethodForSelector:sel_presentViewController_animated_completion_];
    }
    while (v13 == (void (*)(void *, char *, id, uint64_t, id))v12);
    v13(a1, sel_presentViewController_animated_completion_, v14, a4, v8);
  }
  else
  {
    [v9 presentViewController:v14 animated:a4 completion:v8];
  }
}

- (void)_sf_animateAlongsideTransitionOrPerform:()MobileSafariFrameworkExtras
{
  double v4 = a3;
  if (v4)
  {
    char v5 = [a1 transitionCoordinator];

    if (v5)
    {
      v6 = [a1 transitionCoordinator];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __89__UIViewController_MobileSafariFrameworkExtras___sf_animateAlongsideTransitionOrPerform___block_invoke;
      v7[3] = &unk_1E54EC238;
      id v8 = v4;
      [v6 animateAlongsideTransition:v7 completion:0];
    }
    else
    {
      v4[2](v4);
    }
  }
}

- (uint64_t)_sf_isMFMailComposeViewController
{
  return objectIsKindOfClass(a1, @"MFMailComposeViewController");
}

- (uint64_t)_sf_isPKAddPassesViewController
{
  return objectIsKindOfClass(a1, @"PKAddPassesViewController");
}

- (uint64_t)_sf_canEditFields
{
  if ([a1 _isInPopoverPresentation]) {
    return 1;
  }
  double v3 = [a1 view];
  [v3 bounds];
  BOOL v2 = CGRectGetHeight(v5) > 320.0;

  return v2;
}

- (uint64_t)_sf_isPresentationControllerDismissalTransitionDidEndNotification:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  CGRect v5 = [v4 object];
  if (v5 != a1)
  {
    v6 = [a1 navigationController];
    if (v5 != v6)
    {
      uint64_t v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  id v8 = [v4 userInfo];
  uint64_t v7 = objc_msgSend(v8, "safari_BOOLForKey:", *MEMORY[0x1E4FB2E58]);

  v6 = v5;
  if (v5 != a1) {
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

@end