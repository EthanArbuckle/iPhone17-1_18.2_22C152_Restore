@interface UIViewController(Workflow)
- (double)wf_contentLayoutMargins;
- (uint64_t)wf_showSearchBarAboveScrollView:()Workflow;
- (void)wf_applyContentLayoutMarginsToNavigationController;
@end

@implementation UIViewController(Workflow)

- (void)wf_applyContentLayoutMarginsToNavigationController
{
  objc_msgSend(a1, "wf_contentLayoutMargins");
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [a1 navigationController];
  v11 = [v10 navigationBar];
  [v11 setPreservesSuperviewLayoutMargins:0];

  v12 = [a1 navigationController];
  v13 = [v12 navigationBar];
  objc_msgSend(v13, "setLayoutMargins:", v3, v5, v7, v9);

  v14 = [a1 navigationItem];
  v15 = [v14 searchController];
  v16 = [v15 searchBar];
  [v16 setPreservesSuperviewLayoutMargins:0];

  id v19 = [a1 navigationItem];
  v17 = [v19 searchController];
  v18 = [v17 searchBar];
  objc_msgSend(v18, "setLayoutMargins:", v3, v5, v7, v9);
}

- (double)wf_contentLayoutMargins
{
  double v2 = [a1 view];
  [v2 layoutMargins];
  double v4 = v3;

  if ([a1 viewRespectsSystemMinimumLayoutMargins])
  {
    double v5 = [a1 view];
    [v5 bounds];
  }
  return v4;
}

- (uint64_t)wf_showSearchBarAboveScrollView:()Workflow
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  double v8 = v7;
  double v9 = [a1 navigationItem];
  v10 = [v9 searchController];
  v11 = [v10 searchBar];

  [v4 safeAreaInsets];
  double v13 = v12;
  [v11 bounds];
  if (CGRectGetHeight(v18) != 0.0 || (v8 == -v13 ? (BOOL v14 = v13 <= 64.0) : (BOOL v14 = 1), v14))
  {
    uint64_t v16 = 0;
  }
  else
  {
    objc_msgSend(v4, "wf_scrollToTopAnimated:", 0);
    [v4 adjustedContentInset];
    objc_msgSend(v4, "setContentOffset:", v6, -v15);
    uint64_t v16 = 1;
  }

  return v16;
}

@end