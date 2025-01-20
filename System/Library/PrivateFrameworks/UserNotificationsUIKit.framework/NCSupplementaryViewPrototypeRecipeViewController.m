@interface NCSupplementaryViewPrototypeRecipeViewController
+ (NSSet)presentableTypes;
+ (NSString)title;
- (BOOL)_canShowWhileLocked;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (NCNotificationListSupplementaryViewConfiguration)configuration;
- (NCSupplementaryViewPrototypeRecipeViewController)init;
- (NCSupplementaryViewPrototypeRecipeViewControllerDelegate)delegate;
- (NSDate)dateModified;
- (id)_testActionNotImplementedBlock;
- (unint64_t)count;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDateModified:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation NCSupplementaryViewPrototypeRecipeViewController

- (NCSupplementaryViewPrototypeRecipeViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)NCSupplementaryViewPrototypeRecipeViewController;
  v2 = [(NCSupplementaryViewPrototypeRecipeViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    dateModified = v2->_dateModified;
    v2->_dateModified = (NSDate *)v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeViewController;
  [(NCSupplementaryViewPrototypeRecipeViewController *)&v5 viewDidLoad];
  uint64_t v3 = [(NCSupplementaryViewPrototypeRecipeViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateConfiguration:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = [(NCNotificationListSupplementaryViewConfiguration *)self->_configuration mutableCopy];
  if (v5)
  {
    objc_super v6 = (NCNotificationListSupplementaryViewConfiguration *)v5;
    v4[2](v4, v5);
    configuration = self->_configuration;
    self->_configuration = v6;

    v8 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
    [v8 requestsUpdateForPrototypeRecipeViewController:self];
  }
  else
  {
    v9 = objc_alloc_init(NCNotificationListMutableSupplementaryViewConfiguration);
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [(NCNotificationListMutableSupplementaryViewConfiguration *)v9 setTextColor:v10];

    v11 = [MEMORY[0x1E4FB1618] blackColor];
    v12 = [v11 colorWithAlphaComponent:0.2];
    [(NCNotificationListMutableSupplementaryViewConfiguration *)v9 setTintColor:v12];

    [(NCNotificationListMutableSupplementaryViewConfiguration *)v9 setMaterialRecipe:22];
    uint64_t v13 = [(id)objc_opt_class() title];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"Supplementary View";
    }
    [(NCNotificationListMutableSupplementaryViewConfiguration *)v9 setGroupName:v15];

    [(NCNotificationListMutableSupplementaryViewConfiguration *)v9 setGroupingIdentifier:@"identifier"];
    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __72__NCSupplementaryViewPrototypeRecipeViewController_updateConfiguration___block_invoke;
    v22 = &unk_1E6A91930;
    objc_copyWeak(&v23, &location);
    v17 = [v16 actionWithTitle:@"Action" image:0 identifier:0 handler:&v19];
    v25[0] = v17;
    v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 1, v19, v20, v21, v22);
    [(NCNotificationListMutableSupplementaryViewConfiguration *)v9 setSupplementaryActions:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    v4[2](v4, (uint64_t)v9);
    v8 = self->_configuration;
    self->_configuration = &v9->super;
  }
}

void __72__NCSupplementaryViewPrototypeRecipeViewController_updateConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 requestsRemovalForPrototypeRecipeViewController:v3];

    id WeakRetained = v3;
  }
}

- (unint64_t)count
{
  return 1;
}

+ (NSSet)presentableTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();

  return (NSSet *)[v2 setWithObject:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

+ (NSString)title
{
  return 0;
}

- (id)_testActionNotImplementedBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__NCSupplementaryViewPrototypeRecipeViewController__testActionNotImplementedBlock__block_invoke;
  v4[3] = &unk_1E6A91930;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __82__NCSupplementaryViewPrototypeRecipeViewController__testActionNotImplementedBlock__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1E4FB1418];
    id v5 = [v8 title];
    objc_super v6 = [v4 alertControllerWithTitle:v5 message:@"Action not implemented." preferredStyle:1];

    v7 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Dismiss" style:1 handler:0];
    [v6 addAction:v7];
    [WeakRetained presentViewController:v6 animated:1 completion:0];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (NCNotificationListSupplementaryViewConfiguration)configuration
{
  return self->_configuration;
}

- (NCSupplementaryViewPrototypeRecipeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSupplementaryViewPrototypeRecipeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (void)setDateModified:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end