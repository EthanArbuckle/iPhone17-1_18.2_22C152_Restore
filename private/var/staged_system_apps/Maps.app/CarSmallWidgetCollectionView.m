@interface CarSmallWidgetCollectionView
- (CGSize)_cellSize;
- (CarSmallWidgetCollectionView)initWithCoder:(id)a3;
- (CarSmallWidgetCollectionView)initWithFrame:(CGRect)a3;
- (NSArray)data;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)modelForItemAtIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_commonInit;
- (void)_updateHeightConstraint;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didSelectFocusableCollectionCell:(id)a3;
- (void)layoutSubviews;
- (void)refreshData;
@end

@implementation CarSmallWidgetCollectionView

- (CarSmallWidgetCollectionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetCollectionView;
  v3 = -[CarSmallWidgetCollectionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CarSmallWidgetCollectionView *)v3 _commonInit];
  }
  return v4;
}

- (CarSmallWidgetCollectionView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetCollectionView;
  v3 = [(CarSmallWidgetCollectionView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CarSmallWidgetCollectionView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = sub_100577F64();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView commonInit", buf, 2u);
  }

  [(CarSmallWidgetCollectionView *)self setAccessibilityIdentifier:@"CarSmallWidgetCollectionView"];
  v4 = objc_alloc_init(CarSmallWidgetCollectionViewFlowLayout);
  [(CarSmallWidgetCollectionViewFlowLayout *)v4 setMinimumLineSpacing:10.0];
  v30 = v4;
  [(CarSmallWidgetCollectionViewFlowLayout *)v4 setMinimumInteritemSpacing:10.0];
  v5 = -[CarReloadWithCompletionCollectionView initWithFrame:collectionViewLayout:]([CarReloadWithCompletionCollectionView alloc], "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarReloadWithCompletionCollectionView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = +[UIColor clearColor];
  [(CarReloadWithCompletionCollectionView *)v5 setBackgroundColor:v6];

  [(CarReloadWithCompletionCollectionView *)v5 setScrollEnabled:0];
  uint64_t v7 = objc_opt_class();
  v8 = +[ShortcutsRowCollectionViewCell cellReuseIdentifier];
  [(CarReloadWithCompletionCollectionView *)v5 registerClass:v7 forCellWithReuseIdentifier:v8];

  [(CarSmallWidgetCollectionView *)self addSubview:v5];
  v9 = [(CarReloadWithCompletionCollectionView *)v5 heightAnchor];
  v10 = [v9 constraintEqualToConstant:0.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v10;

  v29 = [(CarReloadWithCompletionCollectionView *)v5 leadingAnchor];
  v28 = [(CarSmallWidgetCollectionView *)self leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v32[0] = v27;
  v26 = [(CarSmallWidgetCollectionView *)self trailingAnchor];
  v25 = [(CarReloadWithCompletionCollectionView *)v5 trailingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v32[1] = v24;
  v23 = [(CarReloadWithCompletionCollectionView *)v5 topAnchor];
  v22 = [(CarSmallWidgetCollectionView *)self topAnchor];
  +[CarShortcutCollectionViewCell focusRingTopOverhang];
  v12 = [v23 constraintGreaterThanOrEqualToAnchor:v22];
  v32[2] = v12;
  v13 = [(CarSmallWidgetCollectionView *)self bottomAnchor];
  v14 = [(CarReloadWithCompletionCollectionView *)v5 bottomAnchor];
  v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14];
  v16 = self->_heightConstraint;
  v32[3] = v15;
  v32[4] = v16;
  v17 = [(CarReloadWithCompletionCollectionView *)v5 centerYAnchor];
  v18 = [(CarSmallWidgetCollectionView *)self centerYAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v32[5] = v19;
  v20 = +[NSArray arrayWithObjects:v32 count:6];
  +[NSLayoutConstraint activateConstraints:v20];

  [(CarSmallWidgetCollectionView *)self _updateHeightConstraint];
  [(CarReloadWithCompletionCollectionView *)v5 setDataSource:self];
  [(CarReloadWithCompletionCollectionView *)v5 setDelegate:self];
  collectionView = self->_collectionView;
  self->_collectionView = v5;
}

- (void)_updateHeightConstraint
{
  [(CarSmallWidgetCollectionView *)self _cellSize];
  double v4 = v3;
  +[CarShortcutCollectionViewCell focusRingTopOverhang];
  [(NSLayoutConstraint *)self->_heightConstraint setConstant:v4 + v5];
  objc_super v6 = sub_100577F64();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    [(NSLayoutConstraint *)self->_heightConstraint constant];
    int v8 = 134217984;
    uint64_t v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView updateHeightConstraint %f", (uint8_t *)&v8, 0xCu);
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CarSmallWidgetCollectionView;
  [(CarSmallWidgetCollectionView *)&v6 layoutSubviews];
  double v3 = sub_100577F64();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView layoutSubviews", v5, 2u);
  }

  [(CarSmallWidgetCollectionView *)self _updateHeightConstraint];
  [(CarSmallWidgetCollectionView *)self _cellSize];
  if (self->_cellWidth != v4)
  {
    self->_cellWidth = v4;
    [(CarSmallWidgetCollectionView *)self refreshData];
  }
}

- (CGSize)_cellSize
{
  double v3 = [(CarSmallWidgetCollectionView *)self traitCollection];
  +[ShortcutsRowCollectionViewCell cellSizeWithTraitCollection:v3];
  double v5 = v4;
  CGFloat v7 = v6;

  [(CarReloadWithCompletionCollectionView *)self->_collectionView bounds];
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  double v12 = 0.0;
  if (CGRectGetWidth(v37) + -20.0 >= 0.0)
  {
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    double v12 = CGRectGetWidth(v38) + -20.0;
  }
  v13 = (char *)(uint64_t)(v12 / v5);
  v14 = [(CarSmallWidgetCollectionView *)self data];
  if ((uint64_t)[v14 count] < (uint64_t)v13)
  {
    v15 = [(CarSmallWidgetCollectionView *)self data];
    v13 = (char *)[v15 count];
  }
  uint64_t v16 = (uint64_t)(v13 - 1);
  double v17 = (double)(uint64_t)(v13 - 1) * 10.0 + (double)(uint64_t)v13 * v5;
  if (v17 <= v12) {
    v18 = v13;
  }
  else {
    v18 = v13 - 1;
  }
  if (v17 > v12) {
    uint64_t v16 = (uint64_t)(v13 - 2);
  }
  if (v16 >= 1)
  {
    if (v12 + (double)v16 * -10.0 >= 0.0) {
      double v12 = v12 + (double)v16 * -10.0;
    }
    else {
      double v12 = 0.0;
    }
  }
  UIFloorToViewScale();
  CGFloat v20 = v19;
  v21 = sub_100577F64();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v34.CGFloat width = v5;
    v34.CGFloat height = v7;
    v22 = NSStringFromCGSize(v34);
    v35.CGFloat width = v20;
    v35.CGFloat height = v7;
    v23 = NSStringFromCGSize(v35);
    int v26 = 138413058;
    v27 = v22;
    __int16 v28 = 2048;
    double v29 = v12;
    __int16 v30 = 2048;
    v31 = v18;
    __int16 v32 = 2112;
    v33 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView preferredCellSize: %@, availableWidth: %f, cellsCount: %ld, cellSize: %@", (uint8_t *)&v26, 0x2Au);
  }
  double v24 = v20;
  double v25 = v7;
  result.CGFloat height = v25;
  result.CGFloat width = v24;
  return result;
}

- (void)refreshData
{
  double v3 = sub_100577F64();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView refreshData", buf, 2u);
  }

  collectionView = self->_collectionView;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100D60C70;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [(CarReloadWithCompletionCollectionView *)collectionView reloadDataWithCompletion:v5];
}

- (NSArray)data
{
  return 0;
}

- (id)modelForItemAtIndexPath:(id)a3
{
  return 0;
}

- (void)didSelectFocusableCollectionCell:(id)a3
{
  id v4 = [(CarReloadWithCompletionCollectionView *)self->_collectionView indexPathForCell:a3];
  [(CarSmallWidgetCollectionView *)self didSelectItemAtIndexPath:v4];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  double v6 = [(CarSmallWidgetCollectionView *)self data];
  id v7 = [v6 count];

  [v5 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v28.origin.CGFloat x = v9;
  v28.origin.CGFloat y = v11;
  v28.size.CGFloat width = v13;
  v28.size.CGFloat height = v15;
  double Width = CGRectGetWidth(v28);
  [(CarSmallWidgetCollectionView *)self _cellSize];
  double v18 = Width / v17;
  if ((uint64_t)v7 >= (uint64_t)v18) {
    int64_t v19 = (uint64_t)v18;
  }
  else {
    int64_t v19 = (int64_t)v7;
  }
  CGFloat v20 = sub_100577F64();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    int v24 = 134218240;
    int64_t v25 = v19;
    __int16 v26 = 2048;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView Showing first %ld of %ld", (uint8_t *)&v24, 0x16u);
  }

  v21 = sub_100577F64();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [(CarSmallWidgetCollectionView *)self data];
    int v24 = 138412290;
    int64_t v25 = (int64_t)v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView Data: %@", (uint8_t *)&v24, 0xCu);
  }
  return v19;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = sub_100577F64();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 134217984;
    id v14 = [v6 row];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CarSmallWidgetCollectionView cellForItemAtIndexPath %ld", (uint8_t *)&v13, 0xCu);
  }

  CGFloat v9 = +[ShortcutsRowCollectionViewCell cellReuseIdentifier];
  double v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  [v10 setDelegate:self];
  CGFloat v11 = [(CarSmallWidgetCollectionView *)self modelForItemAtIndexPath:v6];
  [v10 setModel:v11];

  return v10;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  +[CarShortcutCollectionViewCell focusRingTopOverhang];
  double v6 = 10.0;
  double v7 = 0.0;
  double v8 = 10.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end