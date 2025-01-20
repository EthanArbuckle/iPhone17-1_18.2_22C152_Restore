@interface PKDashboardAccountModulePresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardAccountModulePresenter)init;
- (id)accountViewControllerWithConfiguration:(id)a3 presentationContext:(id)a4;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)pushAccountViewControllerForAccount:(id)a3 presentingPass:(id)a4 presentationContext:(id)a5 onNavigationController:(id)a6;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKDashboardAccountModulePresenter

- (PKDashboardAccountModulePresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardAccountModulePresenter;
  v2 = [(PKDashboardAccountModulePresenter *)&v7 init];
  if (v2)
  {
    v3 = [PKAccountModuleCollectionViewCell alloc];
    uint64_t v4 = -[PKAccountModuleCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKAccountModuleCollectionViewCell *)v4;
  }
  return v2;
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"kAccountModuleCellIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"kAccountModuleCellIdentifier" forIndexPath:a5];
  [(PKDashboardAccountModulePresenter *)self _configureCell:v10 item:v9 collectionView:v8];

  return v10;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v20 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = v15;
  if (!v15 || (*((unsigned int (**)(id))v15 + 2))(v15))
  {
    id v17 = v20;
    v18 = [v17 account];
    v19 = [v17 presentingPass];

    [(PKDashboardAccountModulePresenter *)self pushAccountViewControllerForAccount:v18 presentingPass:v19 presentationContext:0 onNavigationController:v14];
  }
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  objc_msgSend(a4, "bounds", a3);
  double v7 = v6;
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v9 = v7 + v8 * -2.0;
  sampleCell = self->_sampleCell;

  -[PKAccountModuleCollectionViewCell sizeThatFits:](sampleCell, "sizeThatFits:", v9, 3.40282347e38);
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a4;
      double v8 = [a3 preferredContentSizeCategory];
      double v9 = [v7 preferredContentSizeCategory];

      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);
      if (v10)
      {
        double v11 = [PKAccountModuleCollectionViewCell alloc];
        double v12 = -[PKAccountModuleCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v12;
      }
    }
  }
}

- (void)pushAccountViewControllerForAccount:(id)a3 presentingPass:(id)a4 presentationContext:(id)a5 onNavigationController:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
  [(PKAccountViewInterfaceConfiguration *)v15 setAccount:v13];

  [(PKAccountViewInterfaceConfiguration *)v15 setDestination:0];
  [(PKAccountViewInterfaceConfiguration *)v15 setViewStyle:0];
  [(PKAccountViewInterfaceConfiguration *)v15 setCashbackPass:v12];

  id v14 = [(PKDashboardAccountModulePresenter *)self accountViewControllerWithConfiguration:v15 presentationContext:v11];

  [v10 pushViewController:v14 animated:1];
}

- (id)accountViewControllerWithConfiguration:(id)a3 presentationContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 account];
  uint64_t v8 = [v6 presentationSource];

  if (v8)
  {
    if (v8 == 2)
    {
      double v9 = [v7 accountIdentifier];
      if (PKAccountServiceIsNewAccountWithAccountIdentifier())
      {
        uint64_t v10 = [v5 destination];
        [v5 setIsNewAccount:v10 == 0];
        if (!v10) {
          PKSetAccountServiceIsNewAccountWithAccountIdentifier();
        }
      }
      else
      {
        [v5 setIsNewAccount:0];
      }
    }
  }
  else if (![v5 destination])
  {
    id v11 = [v7 savingsDetails];
    id v12 = [v11 fccStepUpDetails];
    int v13 = [v12 thresholdExceeded];

    if (v13) {
      [v5 setDestination:11];
    }
  }
  if ([v7 type] == 4) {
    id v14 = [[PKSavingsAccountViewController alloc] initWithConfiguration:v5];
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (void)_configureCell:(id)a3 item:(id)a4 collectionView:(id)a5
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [v8 account];
  [v6 configureWithAccount:v7];
}

- (void).cxx_destruct
{
}

@end