@interface PKDashboardTextActionItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardTextActionItemPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
@end

@implementation PKDashboardTextActionItemPresenter

- (PKDashboardTextActionItemPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardTextActionItemPresenter;
  v2 = [(PKDashboardTextActionItemPresenter *)&v7 init];
  if (v2)
  {
    v3 = [PKDashboardTextCollectionViewCell alloc];
    uint64_t v4 = -[PKDashboardTextCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKDashboardTextCollectionViewCell *)v4;
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
  uint64_t v4 = @"ActionItemCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  v5 = [a3 action];
  BOOL v6 = v5 != 0;

  return v6;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v11 = a3;
  id v8 = a4;
  v9 = [v11 action];

  if (v9)
  {
    v10 = [v11 action];
    ((void (**)(void, id))v10)[2](v10, v8);
  }
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"ActionItemCellReuseIdentifier" forIndexPath:v8];
  [(PKDashboardTextActionItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  sampleCell = self->_sampleCell;
  id v10 = a5;
  id v11 = a4;
  -[PKDashboardTextCollectionViewCell setTextLayoutStyle:](sampleCell, "setTextLayoutStyle:", [v8 layoutStyle]);
  [(PKDashboardTextActionItemPresenter *)self _configureCell:self->_sampleCell forItem:v8 inCollectionView:v11 forIndexPath:v10];

  v12 = self->_sampleCell;
  [v11 bounds];
  double v14 = v13;

  -[PKDashboardTextCollectionViewCell sizeThatFits:](v12, "sizeThatFits:", v14, 1.79769313e308);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v21 = a3;
  id v7 = a4;
  id v8 = [v7 icon];
  [v21 setIconImage:v8];

  id v9 = [v7 title];
  [v21 setTitle:v9];

  id v10 = [v7 titleImage];
  [v21 setTitleImage:v10];

  id v11 = [v7 subtitle];
  [v21 setSubtitle:v11];

  v12 = [v7 subtitleImage];
  [v21 setSubtitleImage:v12];

  double v13 = [v7 subtitleColor];
  [v21 setSubtitleColor:v13];

  double v14 = [v7 accessoryImage];
  [v21 setAccessoryImage:v14];

  double v15 = [v7 accessoryColor];
  [v21 setAccessoryColor:v15];

  objc_msgSend(v21, "setTextLayoutStyle:", objc_msgSend(v7, "layoutStyle"));
  double v16 = [v7 titleColor];
  double v17 = [v7 action];

  if (!v17)
  {
    if (!v16)
    {
      uint64_t v20 = [MEMORY[0x1E4FB1618] labelColor];
LABEL_11:
      double v16 = (void *)v20;
    }
LABEL_12:
    uint64_t v19 = 1;
    goto LABEL_13;
  }
  uint64_t v18 = [v7 actionStyle];
  if (v18 == 1)
  {
    if (!v16)
    {
      uint64_t v20 = [MEMORY[0x1E4FB1618] linkColor];
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v18 && !v16)
  {
    double v16 = [MEMORY[0x1E4FB1618] labelColor];
  }
  uint64_t v19 = 0;
LABEL_13:
  [v21 setHideDisclosure:v19];
  [v21 setTitleColor:v16];
}

- (void).cxx_destruct
{
}

@end