@interface _UICollectionTableIndexOverlaySelectionView
- (_UICollectionTableIndexOverlaySelectionView)initWithHost:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_cellTapped:(id)a3;
- (void)_doneTapped;
- (void)layoutSubviews;
- (void)reloadData;
@end

@implementation _UICollectionTableIndexOverlaySelectionView

- (_UICollectionTableIndexOverlaySelectionView)initWithHost:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UICollectionTableIndexOverlaySelectionView;
  v5 = [(UIView *)&v13 init];
  if (v5)
  {
    v6 = objc_alloc_init(_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout);
    flowLayout = v5->_flowLayout;
    v5->_flowLayout = v6;

    [(UICollectionViewFlowLayout *)v5->_flowLayout setMinimumLineSpacing:0.0];
    [(UICollectionViewFlowLayout *)v5->_flowLayout setMinimumInteritemSpacing:0.0];
    v8 = [UICollectionView alloc];
    uint64_t v9 = -[UICollectionView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v5->_flowLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v9;

    [(UICollectionView *)v5->_collectionView setDelegate:v5];
    [(UICollectionView *)v5->_collectionView setDataSource:v5];
    [(UICollectionView *)v5->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"IndexOverlayCell"];
    [(UICollectionView *)v5->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:@"ExternalDoneKind" withReuseIdentifier:@"ExternalDoneReuse"];
    [(UICollectionView *)v5->_collectionView setBackgroundColor:0];
    [(UIView *)v5 addSubview:v5->_collectionView];
    v11 = +[UIColor tableBackgroundColor];
    [(UIView *)v5 setBackgroundColor:v11];

    objc_storeWeak((id *)&v5->_host, v4);
  }

  return v5;
}

- (void)layoutSubviews
{
  collectionView = self->_collectionView;
  [(UIView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UIView *)self safeAreaInsets];
  -[UICollectionView setFrame:](collectionView, "setFrame:", v5 + v15, v7 + v12, v9 - (v15 + v13), v11 - (v12 + v14));
  [(UIView *)self->_collectionView bounds];
  double v17 = v16;
  uint64_t v18 = [(_UICollectionTableIndexOverlaySelectionView *)self collectionView:self->_collectionView numberOfItemsInSection:0];
  uint64_t v19 = v18;
  double v20 = 3.0;
  double v21 = 3.0;
  if (v18 >= 9)
  {
    double v22 = (double)(v18 + 1);
    double v23 = 2.5;
    double v24 = 3.0;
    do
    {
      double v24 = v24 + 1.0;
      double v20 = ceil(v24);
      if (v21 * v20 < v22) {
        double v23 = v23 + 0.833333333;
      }
      double v21 = ceil(v23);
    }
    while (v20 * v21 < v22);
  }
  UIFloorToViewScale(self);
  double v26 = v25;
  UIFloorToViewScale(self);
  double v28 = v27;
  -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", v26, v27);
  double v29 = v26 * (double)(v19 % (int)v20);
  BOOL v30 = [(UIView *)self->_collectionView _shouldReverseLayoutDirection];
  double v31 = v17 - (v17 - v29) - v29;
  if (!v30) {
    double v31 = v26 * (double)(v19 % (int)v20);
  }
  -[_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout setFrameForDoneButton:](self->_flowLayout, "setFrameForDoneButton:", v31, (v21 + -1.0) * v28, v17 - v29, v28);
  v35 = -[_UICollectionTableIndexOverlaySelectionViewCollectionViewCell initWithFrame:]([_UICollectionTableIndexOverlaySelectionViewCollectionViewCell alloc], "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), v26, v28);
  [(_UICollectionTableIndexOverlaySelectionViewCollectionViewCell *)v35 setText:@"A"];
  [(UIView *)v35 layoutBelowIfNeeded];
  v32 = [(_UICollectionTableIndexOverlaySelectionViewCollectionViewCell *)v35 label];
  [v32 bounds];
  double v34 = (v26 - v33) * 0.5;

  [(_UICollectionTableIndexOverlaySelectionViewCollectionViewFlowLayout *)self->_flowLayout setRightMarginForDoneButton:v34];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  double v5 = [WeakRetained _dataSourceSectionIndexTitles];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"IndexOverlayCell" forIndexPath:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  double v9 = [WeakRetained _dataSourceSectionIndexTitles];

  unint64_t v10 = [v6 item];
  if (v10 >= [v9 count])
  {
    double v11 = &stru_1ED0E84C0;
  }
  else
  {
    double v11 = [v9 objectAtIndex:v10];
  }
  [v7 setText:v11];
  double v12 = [v7 button];
  [v12 addTarget:self action:sel__cellTapped_ forControlEvents:64];

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = [a3 dequeueReusableSupplementaryViewOfKind:@"ExternalDoneKind" withReuseIdentifier:@"ExternalDoneReuse" forIndexPath:a5];
  double v7 = _UINSLocalizedStringWithDefaultValue(@"Done", @"Done");
  [v6 setText:v7];

  [v6 setTextAlignment:2];
  double v8 = [v6 button];
  [v8 addTarget:self action:sel__doneTapped forControlEvents:64];

  return v6;
}

- (void)_cellTapped:(id)a3
{
  id v9 = [a3 superview];
  double v4 = [(UICollectionView *)self->_collectionView indexPathForCell:v9];
  uint64_t v5 = [v4 item];

  id v6 = [v9 text];
  self = (_UICollectionTableIndexOverlaySelectionView *)((char *)self + 424);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  [WeakRetained _sectionIndexChangedToIndex:v5 title:v6];

  id v8 = objc_loadWeakRetained((id *)&self->super.super.super.isa);
  [v8 _transitionIndexOverlaySelectionViewToVisible:0];
}

- (void)_doneTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  [WeakRetained _transitionIndexOverlaySelectionViewToVisible:0];
}

- (void)reloadData
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end