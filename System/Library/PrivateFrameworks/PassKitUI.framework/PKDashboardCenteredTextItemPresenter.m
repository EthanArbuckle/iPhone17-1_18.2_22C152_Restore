@interface PKDashboardCenteredTextItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardCenteredTextItemPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
@end

@implementation PKDashboardCenteredTextItemPresenter

- (PKDashboardCenteredTextItemPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardCenteredTextItemPresenter;
  v2 = [(PKDashboardCenteredTextItemPresenter *)&v7 init];
  if (v2)
  {
    v3 = [PKCenteredTextCollectionViewCell alloc];
    uint64_t v4 = -[PKCenteredTextCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKCenteredTextCollectionViewCell *)v4;
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"CenteredTextCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"CenteredTextCellReuseIdentifier" forIndexPath:v8];
  [(PKDashboardCenteredTextItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v9 = a4;
  [(PKDashboardCenteredTextItemPresenter *)self _configureCell:sampleCell forItem:a3 inCollectionView:v9 forIndexPath:a5];
  [v9 bounds];
  double v11 = v10;

  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  double v13 = v11 + v12 * -2.0;
  v14 = self->_sampleCell;

  -[PKCenteredTextCollectionViewCell sizeThatFits:](v14, "sizeThatFits:", v13, 70.0);
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 title];
  [v8 setTitle:v9];

  id v10 = [v7 subtitle];

  [v8 setSubtitle:v10];
}

- (void).cxx_destruct
{
}

@end