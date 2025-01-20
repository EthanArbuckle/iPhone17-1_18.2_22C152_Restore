@interface TUNavigationController
- (TUNavigationController)initWithRootViewController:(id)a3;
- (TUNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4;
- (int64_t)convert:(int64_t)a3;
- (int64_t)preferredCenterStatusBarStyle;
- (int64_t)preferredLeadingStatusBarStyle;
- (int64_t)preferredTrailingStatusBarStyle;
- (int64_t)ts_preferredCenterStatusBarStyle;
- (int64_t)ts_preferredLeadingStatusBarStyle;
- (int64_t)ts_preferredTrailingStatusBarStyle;
@end

@implementation TUNavigationController

uint64_t __72__TUNavigationController_initWithRootViewController_navigationBarClass___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:0];
}

- (int64_t)convert:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2 * (a3 == 3);
  }
}

- (TUNavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)TUNavigationController;
  v8 = [(TUNavigationController *)&v15 initWithNavigationBarClass:a4 toolbarClass:v7];
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__TUNavigationController_initWithRootViewController_navigationBarClass___block_invoke;
    v12[3] = &unk_1E6136700;
    v13 = v8;
    id v14 = v6;
    [v10 performWithoutAnimation:v12];
  }
  return v9;
}

- (int64_t)preferredLeadingStatusBarStyle
{
  int64_t v3 = [(TUNavigationController *)self ts_preferredLeadingStatusBarStyle];
  return [(TUNavigationController *)self convert:v3];
}

- (int64_t)preferredCenterStatusBarStyle
{
  int64_t v3 = [(TUNavigationController *)self ts_preferredCenterStatusBarStyle];
  return [(TUNavigationController *)self convert:v3];
}

- (int64_t)preferredTrailingStatusBarStyle
{
  int64_t v3 = [(TUNavigationController *)self ts_preferredTrailingStatusBarStyle];
  return [(TUNavigationController *)self convert:v3];
}

- (TUNavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v13.receiver = self;
  v13.super_class = (Class)TUNavigationController;
  id v6 = [(TUNavigationController *)&v13 initWithNavigationBarClass:0 toolbarClass:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__TUNavigationController_initWithRootViewController___block_invoke;
    v10[3] = &unk_1E6136700;
    v11 = v6;
    id v12 = v4;
    [v8 performWithoutAnimation:v10];
  }
  return v7;
}

uint64_t __53__TUNavigationController_initWithRootViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:0];
}

- (int64_t)ts_preferredLeadingStatusBarStyle
{
  return 0;
}

- (int64_t)ts_preferredCenterStatusBarStyle
{
  return 0;
}

- (int64_t)ts_preferredTrailingStatusBarStyle
{
  return 0;
}

@end