@interface PKDashboardAuxiliaryPassInformationPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardAuxiliaryPassInformationPresenter)initWithPass:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
@end

@implementation PKDashboardAuxiliaryPassInformationPresenter

- (PKDashboardAuxiliaryPassInformationPresenter)initWithPass:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDashboardAuxiliaryPassInformationPresenter;
  v6 = [(PKDashboardAuxiliaryPassInformationPresenter *)&v11 init];
  if (v6)
  {
    v7 = [PKDashboardAuxiliaryPassInformationItemCollectionViewCell alloc];
    uint64_t v8 = -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v6->_sampleCell;
    v6->_sampleCell = (PKDashboardAuxiliaryPassInformationItemCollectionViewCell *)v8;

    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v6;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"AuxiliaryPassInformationItemCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  if (v15 && v7)
  {
    uint64_t v8 = [v15 preferredContentSizeCategory];
    v9 = [v7 preferredContentSizeCategory];
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, (UIContentSizeCategory)v9))
    {
    }
    else
    {
      uint64_t v10 = [v15 legibilityWeight];
      uint64_t v11 = [v7 legibilityWeight];

      if (v10 == v11) {
        goto LABEL_7;
      }
    }
    v12 = [PKDashboardAuxiliaryPassInformationItemCollectionViewCell alloc];
    v13 = -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = self->_sampleCell;
    self->_sampleCell = v13;
  }
LABEL_7:
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v5 = [a3 item];
  v6 = [v5 mapsURL];
  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [v5 sections];
    BOOL v7 = v8 != 0;
  }
  return v7;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v9 = a6;
  id v11 = [a3 item];
  uint64_t v10 = [[PKDashboardAuxiliaryPassInformationViewController alloc] initWithItem:v11 forPass:self->_pass];
  [v9 pushViewController:v10 animated:1];
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"AuxiliaryPassInformationItemCellReuseIdentifier" forIndexPath:v8];
  [(PKDashboardAuxiliaryPassInformationPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v9 = a4;
  [(PKDashboardAuxiliaryPassInformationPresenter *)self _configureCell:sampleCell forItem:a3 inCollectionView:v9 forIndexPath:a5];
  id v10 = self->_sampleCell;
  [v9 bounds];
  double v12 = v11;

  -[PKDashboardAuxiliaryPassInformationItemCollectionViewCell sizeThatFits:](v10, "sizeThatFits:", v12, 1.79769313e308);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v13 = a3;
  BOOL v7 = [a4 item];
  id v8 = [v7 title];
  [v13 setTitle:v8];

  id v9 = [v7 subtitle];
  [v13 setSubtitle:v9];

  id v10 = [v7 subtitle2];
  [v13 setSubtitle2:v10];

  double v11 = [v7 mapsURL];
  if (v11)
  {
    BOOL v12 = 0;
  }
  else
  {
    double v11 = [v7 sections];
    BOOL v12 = v11 == 0;
  }

  [v13 setHideDisclosure:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end