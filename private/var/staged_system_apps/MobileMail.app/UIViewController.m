@interface UIViewController
- (BOOL)_isInExpandedEnvironment;
- (BOOL)canDismiss;
- (BOOL)canResignFocus;
- (BOOL)isReappearing;
- (BOOL)mf_isPresentingPreviousDraftPopoverViewController;
- (BOOL)mf_navigationItemContainsBarButtonItem:(id)a3;
- (BOOL)mf_toolbarContainsBarButtonItem:(id)a3;
- (BOOL)mf_viewHierarchyContainsView:(id)a3;
- (BOOL)shouldSnapshot;
- (BOOL)snapshotOnTermination;
- (BOOL)wantsBarHidingWhenVerticallyCompact;
- (NSDirectionalEdgeInsets)mf_extraContentMargins;
- (NSDirectionalEdgeInsets)mf_extraEditingMargins;
- (NSDirectionalEdgeInsets)mf_extraNavigationBarMargins;
- (id)customDefaultPNGName;
- (id)mf_preferredTitle;
- (int64_t)desiredContextualControllerPresentationStyle;
- (void)focus:(BOOL)a3;
- (void)focusViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5;
- (void)mf_dismissPresentedViewControllerInPopover;
- (void)mf_updateAlertSuppressionContextsForReason:(id)a3;
- (void)mf_updateExtraNavigationBarMargins;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)showPopoverViewController:(id)a3 fromBarButtonItem:(id)a4 animated:(BOOL)a5;
- (void)unfocus:(BOOL)a3;
- (void)unfocusViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5;
@end

@implementation UIViewController

- (void)mf_updateExtraNavigationBarMargins
{
  [(UIViewController *)self systemMinimumLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v16 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v16);

  if (!IsAccessibilityCategory)
  {
    [(UIViewController *)self mf_extraNavigationBarMargins];
    double v4 = v4 + v12;
    double v6 = v6 + v13;
    double v8 = v8 + v14;
    double v10 = v10 + v15;
  }
  id v17 = [(UIViewController *)self navigationItem];
  [v17 setLargeTitleInsets:v4, v6, v8, v10];
}

- (BOOL)isReappearing
{
  double v3 = [(UIViewController *)self navigationController];
  unsigned int v4 = [v3 isPopping];
  while (1)
  {
    double v5 = [v3 navigationController];

    if (!v5) {
      break;
    }
    uint64_t v6 = [v3 navigationController];

    double v3 = (void *)v6;
  }
  if (([v3 isPopping] | v4))
  {
    unsigned __int8 v7 = 1;
  }
  else if (+[UIDevice mf_isPad])
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    double v8 = self;
    unsigned __int8 v9 = [(UIViewController *)v8 isPerformingModalTransition];
    unsigned __int8 v7 = v9;
    if (v8) {
      char v10 = v9;
    }
    else {
      char v10 = 1;
    }
    if (v10)
    {
      v11 = v8;
    }
    else
    {
      do
      {
        unsigned __int8 v7 = [(UIViewController *)v8 isPerformingModalTransition];
        v11 = [(UIViewController *)v8 parentViewController];

        if (v11) {
          char v12 = v7;
        }
        else {
          char v12 = 1;
        }
        double v8 = v11;
      }
      while ((v12 & 1) == 0);
    }
  }
  return v7;
}

- (void)mf_updateAlertSuppressionContextsForReason:(id)a3
{
  id v4 = a3;
  double v5 = [(UIViewController *)self navigationController];
  uint64_t v6 = [v5 visibleViewController];

  if (v6 == self)
  {
    unsigned __int8 v7 = MSUserNotificationsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: updating contexts", (uint8_t *)&v9, 0xCu);
    }

    double v8 = +[UIApplication sharedApplication];
    [v8 mf_updateCurrentContexts];
  }
}

- (id)mf_preferredTitle
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(UIViewController *)self childViewControllers];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v2);
      }
      uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * v5) mf_preferredTitle];
      if (v6) {
        break;
      }
      if (v3 == (id)++v5)
      {
        id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)focus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIViewController *)self parentViewController];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(UIViewController *)self splitViewController];
  }
  id v8 = v7;

  [v8 focusViewController:self sender:self animated:v3];
}

- (void)unfocus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIViewController *)self parentViewController];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(UIViewController *)self splitViewController];
  }
  id v8 = v7;

  [v8 unfocusViewController:self sender:self animated:v3];
}

- (void)focusViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a4;
  id v7 = [(UIViewController *)self parentViewController];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(UIViewController *)self splitViewController];
  }
  long long v10 = v9;

  [v10 focusViewController:self sender:v11 animated:v5];
}

- (void)unfocusViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a4;
  id v7 = [(UIViewController *)self parentViewController];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(UIViewController *)self splitViewController];
  }
  long long v10 = v9;

  [v10 unfocusViewController:self sender:v11 animated:v5];
}

- (BOOL)canResignFocus
{
  return 1;
}

- (void)showPopoverViewController:(id)a3 fromBarButtonItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  id v9 = [(UIViewController *)self parentViewController];
  [v9 showPopoverViewController:v10 fromBarButtonItem:v8 animated:v5];
}

- (BOOL)canDismiss
{
  return 1;
}

- (BOOL)shouldSnapshot
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v2 = 0;
  }
  else
  {
    objc_opt_class();
    char v2 = objc_opt_isKindOfClass() ^ 1;
  }
  return v2 & 1;
}

- (BOOL)snapshotOnTermination
{
  return 0;
}

- (id)customDefaultPNGName
{
  return @"Default";
}

- (BOOL)_isInExpandedEnvironment
{
  char v2 = [(UIViewController *)self viewIfLoaded];
  BOOL v3 = [v2 window];
  uint64_t v4 = [v3 windowScene];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v5 = [v4 isInExpandedEnvironment];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)wantsBarHidingWhenVerticallyCompact
{
  return 0;
}

- (int64_t)desiredContextualControllerPresentationStyle
{
  if (![(UIViewController *)self _isInExpandedEnvironment]) {
    return 0;
  }
  BOOL v3 = [(UIViewController *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)mf_viewHierarchyContainsView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UIViewController *)self view];

    if (v5 == v4)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v6 = [v4 superview];
      BOOL v7 = [(UIViewController *)self mf_viewHierarchyContainsView:v6];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)mf_toolbarContainsBarButtonItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UIViewController *)self toolbarItems];
    unsigned __int8 v6 = [v5 containsObject:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)mf_navigationItemContainsBarButtonItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UIViewController *)self navigationItem];
    unsigned __int8 v6 = [v5 leftBarButtonItems];
    if ([v6 containsObject:v4])
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      id v8 = [(UIViewController *)self navigationItem];
      id v9 = [v8 rightBarButtonItems];
      unsigned __int8 v7 = [v9 containsObject:v4];
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)mf_dismissPresentedViewControllerInPopover
{
  id v9 = [(UIViewController *)self presentedViewController];
  if ([v9 _isInPopoverPresentation])
  {
    BOOL v3 = [v9 popoverPresentationController];
    id v4 = [v3 sourceView];

    unsigned int v5 = [(UIViewController *)self mf_viewHierarchyContainsView:v4];
    unsigned __int8 v6 = [v9 popoverPresentationController];
    unsigned __int8 v7 = [v6 barButtonItem];

    if ([(UIViewController *)self mf_toolbarContainsBarButtonItem:v7])
    {
    }
    else
    {
      unsigned int v8 = [(UIViewController *)self mf_navigationItemContainsBarButtonItem:v7];

      if ((v5 | v8) != 1) {
        goto LABEL_6;
      }
    }
    [(UIViewController *)self dismissViewControllerAnimated:0 completion:0];
  }
LABEL_6:
}

- (NSDirectionalEdgeInsets)mf_extraNavigationBarMargins
{
  [(UIViewController *)self mf_extraContentMargins];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSDirectionalEdgeInsets)mf_extraContentMargins
{
  double top = NSDirectionalEdgeInsetsZero.top;
  double leading = NSDirectionalEdgeInsetsZero.leading;
  double bottom = NSDirectionalEdgeInsetsZero.bottom;
  double trailing = NSDirectionalEdgeInsetsZero.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (NSDirectionalEdgeInsets)mf_extraEditingMargins
{
  double top = NSDirectionalEdgeInsetsZero.top;
  double leading = NSDirectionalEdgeInsetsZero.leading;
  double bottom = NSDirectionalEdgeInsetsZero.bottom;
  double trailing = NSDirectionalEdgeInsetsZero.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v9 = a3;
  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:MFMailWillPresentPopoverNotification object:v9 userInfo:0];

  [v9 _setIgnoreBarButtonItemSiblings:1];
  double v5 = [(UIViewController *)self viewIfLoaded];
  unsigned __int8 v6 = [v5 window];

  if (v6)
  {
    unsigned __int8 v7 = +[MFMailPopoverManager managerForWindow:v6 createIfNeeded:0];
    unsigned int v8 = [v7 allPassThroughViews];
    [v9 setPassthroughViews:v8];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = +[NSNotificationCenter defaultCenter];
    [v3 postNotificationName:MFMailDidDismissPopoverNotification object:v4 userInfo:0];
  }
}

- (BOOL)mf_isPresentingPreviousDraftPopoverViewController
{
  if (![(UIViewController *)self conformsToProtocol:&OBJC_PROTOCOL___ComposeButtonProviding])return 0; {
  double v3 = [(UIViewController *)self presentedViewController];
  }
  id v4 = [v3 popoverPresentationController];

  double v5 = self;
  unsigned __int8 v6 = [v4 barButtonItem];
  unsigned __int8 v7 = [(UIViewController *)v5 composeButtonItem];
  BOOL v8 = v6 == v7;

  return v8;
}

@end