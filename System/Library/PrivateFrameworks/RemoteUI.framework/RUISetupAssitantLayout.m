@interface RUISetupAssitantLayout
+ (CGSize)_preferredContentSizeInBuddy;
- (BOOL)_isViewControllerInBuddyiPad:(id)a3;
- (BOOL)_isViewControllerInFormSheet:(id)a3;
- (CGSize)preferredContentSizeForViewController:(id)a3;
- (NSDirectionalEdgeInsets)_insetsForViewController:(id)a3;
@end

@implementation RUISetupAssitantLayout

- (NSDirectionalEdgeInsets)_insetsForViewController:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  [v5 directionalLayoutMargins];
  uint64_t v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [MEMORY[0x263F82670] currentDevice];
  if ([v14 userInterfaceIdiom])
  {
  }
  else
  {
    v15 = [v4 traitCollection];
    uint64_t v16 = [v15 horizontalSizeClass];

    if (v16 == 2)
    {
      double v11 = 5.0;
      goto LABEL_7;
    }
  }
  v17 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  if (v18 == 1)
  {
    double v11 = 5.0;
    if (![(RUISetupAssitantLayout *)self _isViewControllerInFormSheet:v4])
    {
      v19 = [v4 view];
      [v19 bounds];
      double v13 = (v20 + -624.0) * 0.5;

      *(double *)&uint64_t v7 = 0.0;
      goto LABEL_9;
    }
LABEL_7:
    *(double *)&uint64_t v7 = 56.0;
    double v13 = 88.0;
LABEL_9:
    double v9 = v13;
  }

  double v21 = *(double *)&v7;
  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  result.trailing = v24;
  result.bottom = v23;
  result.leading = v22;
  result.top = v21;
  return result;
}

- (BOOL)_isViewControllerInFormSheet:(id)a3
{
  id v3 = a3;
  id v4 = [v3 navigationController];

  if (v4)
  {
    uint64_t v5 = [v3 navigationController];

    id v3 = (id)v5;
  }
  uint64_t v6 = [v3 modalPresentationStyle];

  return v6 == 2;
}

- (BOOL)_isViewControllerInBuddyiPad:(id)a3
{
  if (![a3 conformsToProtocol:&unk_26C591228]) {
    return 0;
  }
  id v3 = [MEMORY[0x263F82670] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  return v4;
}

+ (CGSize)_preferredContentSizeInBuddy
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    BOOL v4 = [MEMORY[0x263F82B60] mainScreen];
    [v4 bounds];
    double v6 = v5;

    uint64_t v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 bounds];
    double v9 = v8;

    if (v6 >= v9) {
      double v10 = v9;
    }
    else {
      double v10 = v6;
    }
    double v11 = fmin(v10 + -88.0, 820.0);
    double v12 = 624.0;
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v11;
  result.width = v12;
  return result;
}

- (CGSize)preferredContentSizeForViewController:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() _preferredContentSizeInBuddy];
  double v5 = v4;
  double v7 = v6;
  double v8 = [v3 navigationController];

  if (v8)
  {
    double v9 = [v3 navigationController];
    double v10 = [v9 navigationBar];
    [v10 frame];
    double v7 = v7 - CGRectGetHeight(v14);
  }
  double v11 = v5;
  double v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

@end