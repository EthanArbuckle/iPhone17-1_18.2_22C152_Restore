@interface PKDashboardPassGroupItemPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardPassGroupItemPresenter)init;
- (PKDashboardPassGroupItemPresenter)initWithPassGroupView:(id)a3;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
@end

@implementation PKDashboardPassGroupItemPresenter

- (PKDashboardPassGroupItemPresenter)init
{
  return 0;
}

- (PKDashboardPassGroupItemPresenter)initWithPassGroupView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassGroupItemPresenter;
  v6 = [(PKDashboardPassGroupItemPresenter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupView, a3);
  }

  return v7;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"groupItemPresenter";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  objc_msgSend(a4, "pkui_viewControllerFromResponderChain", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 dismissViewControllerAnimated:1 completion:0];
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  objc_super v9 = [a4 dequeueReusableCellWithReuseIdentifier:@"groupItemPresenter" forIndexPath:a5];
  [(PKDashboardPassGroupItemPresenter *)self _configureCell:v9 forItem:v8];

  return v9;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  objc_msgSend(a4, "bounds", a3);
  -[PKPassGroupView sizeThatFits:](self->_groupView, "sizeThatFits:", v6, 1.79769313e308);
  double v8 = v7;
  double v10 = v9;
  [(PKPassGroupView *)self->_groupView alignmentRectInsets];
  double v13 = v8 - (v11 + v12);
  double v16 = v10 - (v14 + v15);
  double v17 = v13;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4
{
  id v5 = a3;
  [v5 setWantsCustomAppearance:1];
  [v5 setMaskType:0];
  [v5 setGroupView:self->_groupView];
  id v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];
}

- (void).cxx_destruct
{
}

@end