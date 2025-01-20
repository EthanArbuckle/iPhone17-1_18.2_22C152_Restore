@interface AbstractCatalogViewController
- (BOOL)_takeOwnershipOfViewController:(id)a3;
- (BOOL)isResponsibleForLayoutOfViewController:(id)a3;
- (CompletionListTableViewController)completionsViewController;
- (CompletionListTableViewController)completionsViewControllerIfLoaded;
- (SFStartPageViewController)startPageViewController;
- (UIViewController)foregroundChildViewController;
- (UniversalSearchFirstTimeExperienceViewController)universalSearchFirstTimeExperienceViewController;
- (double)maxContentHeight;
- (double)requiredContentWidth;
- (void)_relinquishOwnershipOfViewControllerFromCurrentParent:(id)a3;
- (void)relinquishOwnershipOfCompletionsViewControllerFromCurrentParent;
- (void)relinquishOwnershipOfStartPageViewControllerFromCurrentParent;
- (void)relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent;
- (void)setForegroundChildViewControllerNeedsUpdate;
- (void)takeOwnershipOfCompletionsViewController;
- (void)takeOwnershipOfStartPageViewController;
- (void)takeOwnershipOfUniversalSearchFirstTimeExperienceViewController;
- (void)updatePreferredContentSize;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AbstractCatalogViewController

uint64_t __64__AbstractCatalogViewController__takeOwnershipOfViewController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _relinquishOwnershipOfViewControllerFromCurrentParent:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addChildViewController:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  v3 = [*(id *)(a1 + 40) view];
  [v2 addSubview:v3];

  [*(id *)(a1 + 40) didMoveToParentViewController:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setForegroundChildViewControllerNeedsUpdate];
  v4 = *(void **)(a1 + 48);
  return [v4 layoutIfNeeded];
}

- (void)setForegroundChildViewControllerNeedsUpdate
{
  id v2 = [(AbstractCatalogViewController *)self viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)_relinquishOwnershipOfViewControllerFromCurrentParent:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3
    && ([v3 parentViewController], v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = [v4 parentViewController];
    if (v6)
    {
      [v4 willMoveToParentViewController:0];
      v7 = [v4 view];
      [v7 removeFromSuperview];

      [v4 removeFromParentViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 setForegroundChildViewControllerNeedsUpdate];
      }
      else
      {
        v10 = WBS_LOG_CHANNEL_PREFIXOther();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[AbstractCatalogViewController _relinquishOwnershipOfViewControllerFromCurrentParent:](v10);
        }
      }
    }
  }
  else
  {
    v6 = [v4 viewIfLoaded];
    v8 = [v6 window];

    if (v8)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(AbstractCatalogViewController *)v9 _relinquishOwnershipOfViewControllerFromCurrentParent:v6];
      }
      [v6 removeFromSuperview];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AbstractCatalogViewController;
  [(AbstractCatalogViewController *)&v4 viewWillAppear:a3];
  [(AbstractCatalogViewController *)self updatePreferredContentSize];
}

- (void)takeOwnershipOfStartPageViewController
{
  id v3 = [(AbstractCatalogViewController *)self startPageViewController];
  BOOL v4 = [(AbstractCatalogViewController *)self _takeOwnershipOfViewController:v3];

  if (v4)
  {
    [(AbstractCatalogViewController *)self didGainOwnershipOfStartPageViewController];
  }
}

- (BOOL)_takeOwnershipOfViewController:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4
    || ([v4 parentViewController],
        v6 = (AbstractCatalogViewController *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == self))
  {
    BOOL v10 = 0;
  }
  else
  {
    v7 = [(AbstractCatalogViewController *)self view];
    [v7 layoutIfNeeded];
    v8 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__AbstractCatalogViewController__takeOwnershipOfViewController___block_invoke;
    v12[3] = &unk_1E6D78980;
    v12[4] = self;
    id v13 = v5;
    id v14 = v7;
    id v9 = v7;
    [v8 performWithoutAnimation:v12];

    BOOL v10 = 1;
  }

  return v10;
}

- (void)updatePreferredContentSize
{
  [(AbstractCatalogViewController *)self requiredContentWidth];
  double v4 = v3;
  [(AbstractCatalogViewController *)self maxContentHeight];
  double v6 = v5;
  id v8 = [(AbstractCatalogViewController *)self foregroundChildViewController];
  [v8 preferredContentSize];
  -[AbstractCatalogViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, fmin(v6, v7));
}

- (UIViewController)foregroundChildViewController
{
  double v3 = [(AbstractCatalogViewController *)self completionsViewControllerIfLoaded];
  if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v3])
  {
    id v4 = v3;
  }
  else
  {
    double v5 = [(AbstractCatalogViewController *)self universalSearchFirstTimeExperienceViewController];
    if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v5])
    {
      id v4 = v5;
    }
    else
    {
      double v6 = [(AbstractCatalogViewController *)self startPageViewController];
      if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v6])
      {
        id v4 = v6;
      }
      else
      {
        id v4 = 0;
      }
    }
  }

  return (UIViewController *)v4;
}

- (BOOL)isResponsibleForLayoutOfViewController:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 parentViewController];
  BOOL v5 = v4 == self;

  return v5;
}

- (void)viewWillLayoutSubviews
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AbstractCatalogViewController;
  [(AbstractCatalogViewController *)&v16 viewWillLayoutSubviews];
  double v3 = [(AbstractCatalogViewController *)self foregroundChildViewController];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(AbstractCatalogViewController *)self childViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        BOOL v10 = v9 != v3;
        v11 = [v9 view];
        [v11 setHidden:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

- (double)requiredContentWidth
{
  return 0.0;
}

- (double)maxContentHeight
{
  return 0.0;
}

- (CompletionListTableViewController)completionsViewController
{
  return 0;
}

- (CompletionListTableViewController)completionsViewControllerIfLoaded
{
  return 0;
}

- (void)takeOwnershipOfCompletionsViewController
{
  double v3 = [(AbstractCatalogViewController *)self completionsViewController];
  BOOL v4 = [(AbstractCatalogViewController *)self _takeOwnershipOfViewController:v3];

  if (v4)
  {
    [(AbstractCatalogViewController *)self didGainOwnershipOfCompletionsViewController];
  }
}

- (void)relinquishOwnershipOfCompletionsViewControllerFromCurrentParent
{
  id v3 = [(AbstractCatalogViewController *)self completionsViewController];
  [(AbstractCatalogViewController *)self _relinquishOwnershipOfViewControllerFromCurrentParent:v3];
}

- (SFStartPageViewController)startPageViewController
{
  return 0;
}

- (void)relinquishOwnershipOfStartPageViewControllerFromCurrentParent
{
  id v3 = [(AbstractCatalogViewController *)self startPageViewController];
  [(AbstractCatalogViewController *)self _relinquishOwnershipOfViewControllerFromCurrentParent:v3];
}

- (UniversalSearchFirstTimeExperienceViewController)universalSearchFirstTimeExperienceViewController
{
  return 0;
}

- (void)takeOwnershipOfUniversalSearchFirstTimeExperienceViewController
{
  id v3 = [(AbstractCatalogViewController *)self universalSearchFirstTimeExperienceViewController];
  BOOL v4 = [(AbstractCatalogViewController *)self _takeOwnershipOfViewController:v3];

  if (v4)
  {
    [(AbstractCatalogViewController *)self didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController];
  }
}

- (void)relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent
{
  id v3 = [(AbstractCatalogViewController *)self universalSearchFirstTimeExperienceViewController];
  [(AbstractCatalogViewController *)self _relinquishOwnershipOfViewControllerFromCurrentParent:v3];
}

- (void)_relinquishOwnershipOfViewControllerFromCurrentParent:(void *)a3 .cold.1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a3 superview];
  uint64_t v8 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v8);
  OUTLINED_FUNCTION_0_3(&dword_1E102C000, v9, v10, "View controller %{public}@ has no parent but its view is installed in %{public}@. Removing view.", v11, v12, v13, v14, 2u);
}

- (void)_relinquishOwnershipOfViewControllerFromCurrentParent:(void *)a1 .cold.2(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_3(&dword_1E102C000, v5, v6, "Unable to relinquish ownership of %{public}@ from %{public}@ because it is not an instance of AbstractCatalogViewController", v7, v8, v9, v10, 2u);
}

@end