@interface PUStorageTipNavigationViewController
- (BOOL)canBeShownFromSuspendedState;
- (PUStorageTipListViewController)listViewController;
- (PUStorageTipNavigationViewController)init;
- (RecommendationFlowControllerDelegate)cloudRecommendationsDelegate;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setCloudRecommendationsDelegate:(id)a3;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PUStorageTipNavigationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listViewController, 0);
  objc_destroyWeak((id *)&self->cloudRecommendationsDelegate);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong(&self->_preferenceValue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (PUStorageTipListViewController)listViewController
{
  return self->_listViewController;
}

- (void)setCloudRecommendationsDelegate:(id)a3
{
}

- (RecommendationFlowControllerDelegate)cloudRecommendationsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cloudRecommendationsDelegate);
  return (RecommendationFlowControllerDelegate *)WeakRetained;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)readPreferenceValue:(id)a3
{
  return self->_preferenceValue;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v5 = objc_msgSend(a4, "copy", a3);
  id preferenceValue = self->_preferenceValue;
  self->_id preferenceValue = v5;
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PUStorageTipNavigationViewController;
  [(PUStorageTipNavigationViewController *)&v12 viewDidDisappear:a3];
  v4 = [(PUStorageTipNavigationViewController *)self presentingViewController];

  if (!v4)
  {
    v5 = [(PUStorageTipNavigationViewController *)self listViewController];
    uint64_t v6 = [v5 storageRecovered];

    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_INFO, "Storage recovered before clamping = %td", buf, 0xCu);
    }

    uint64_t v8 = v6 & ~(v6 >> 63);
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, "Storage recovered given to cloud delegate = %td", buf, 0xCu);
    }

    v10 = [(PUStorageTipNavigationViewController *)self cloudRecommendationsDelegate];
    v11 = [NSNumber numberWithInteger:v8];
    [v10 userDidCompleteAction:v11];
  }
}

- (PUStorageTipNavigationViewController)init
{
  v3 = objc_alloc_init(PUStorageTipListViewController);
  v7.receiver = self;
  v7.super_class = (Class)PUStorageTipNavigationViewController;
  v4 = [(PUStorageTipNavigationViewController *)&v7 initWithRootViewController:v3];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_listViewController, v3);
  }

  return v5;
}

@end