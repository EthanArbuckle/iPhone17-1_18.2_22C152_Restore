@interface UGCPhotoCarouselCell
- (UGCPhotoCarouselCell)initWithFrame:(CGRect)a3;
- (UGCPhotoCarouselController)carouselController;
- (UIEdgeInsets)sectionInset;
- (double)estimatedHeight;
- (id)_horizontalCarouselLayout;
- (id)_horizontalGridLayout;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)setCarouselController:(id)a3;
- (void)setSectionInset:(UIEdgeInsets)a3;
@end

@implementation UGCPhotoCarouselCell

- (UGCPhotoCarouselCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UGCPhotoCarouselCell;
  v3 = -[UGCPhotoCarouselCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    *(_OWORD *)&v3->_sectionInset.top = 0u;
    *(_OWORD *)&v3->_sectionInset.bottom = 0u;
    [(UGCPhotoCarouselCell *)v3 _setupSubviews];
    [(UGCPhotoCarouselCell *)v4 _setupConstraints];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (double)estimatedHeight
{
  uint64_t v3 = sub_1000BBB44(self);
  p_carouselController = &self->_carouselController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);
  v6 = WeakRetained;
  if (v3 == 5)
  {
    unint64_t v7 = (unint64_t)[WeakRetained totalNumberOfItems];

    unint64_t v8 = ((__PAIR128__(v7, __ROR8__(0xAAAAAAAAAAAAAAABLL * v7, 1)) - 0x2AAAAAAAAAAAAAABLL) >> 64) / 6;
    v9 = objc_loadWeakRetained((id *)p_carouselController);
    [v9 preferredCellHeight];
    double v11 = (double)v8 + (double)v8 + v10 * (double)(v8 + 1);
  }
  else
  {
    [WeakRetained preferredCellHeight];
    double v13 = v12 + self->_sectionInset.top + self->_sectionInset.bottom;

    v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    [v9 _mapkit_scaledValueForValue:v13];
    double v11 = v14;
  }

  return v11;
}

- (void)_contentSizeDidChange
{
  if (!MapsFeature_IsEnabled_SydneyARP()
    || (id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController),
        unsigned __int8 v4 = [WeakRetained photoSliderShouldEnablePagingScroll],
        WeakRetained,
        (v4 & 1) == 0))
  {
    v5 = [(UGCPhotoCarouselCell *)self _horizontalCarouselLayout];
    [(UICollectionView *)self->_collectionView setCollectionViewLayout:v5];
  }
  [(UGCPhotoCarouselCell *)self estimatedHeight];
  heightConstraint = self->_heightConstraint;

  -[NSLayoutConstraint setConstant:](heightConstraint, "setConstant:");
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UICollectionView);
  unsigned __int8 v4 = [(UGCPhotoCarouselCell *)self _horizontalCarouselLayout];
  v5 = (UICollectionView *)[v3 initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height collectionViewLayout:v4];
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = sub_1000BBB44(self);
  unint64_t v8 = self->_collectionView;
  if (v7 == 5)
  {
    [(UICollectionView *)v8 setScrollEnabled:0];
  }
  else
  {
    [(UICollectionView *)v8 setAlwaysBounceVertical:0];
    [(UICollectionView *)self->_collectionView setAlwaysBounceHorizontal:1];
    [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);
  double v10 = [WeakRetained collectionViewBackgroundColor];
  [(UICollectionView *)self->_collectionView setBackgroundColor:v10];

  [(UICollectionView *)self->_collectionView _setCornerRadius:0.0];
  double v11 = self->_collectionView;

  [(UGCPhotoCarouselCell *)self addSubview:v11];
}

- (void)_setupConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  id v3 = self;
  [(UGCPhotoCarouselCell *)v3 estimatedHeight];
  if (!v3->_heightConstraint)
  {
    double v5 = v4;
    v6 = [(UICollectionView *)v3->_collectionView heightAnchor];
    uint64_t v7 = [v6 constraintEqualToConstant:v5];
    heightConstraint = v3->_heightConstraint;
    v3->_heightConstraint = (NSLayoutConstraint *)v7;
  }
  v22 = [(UICollectionView *)v3->_collectionView topAnchor];
  v21 = [(UGCPhotoCarouselCell *)v3 topAnchor];
  v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  v19 = [(UICollectionView *)v3->_collectionView leadingAnchor];
  v18 = [(UGCPhotoCarouselCell *)v3 leadingAnchor];
  v9 = [v19 constraintEqualToAnchor:v18];
  v23[1] = v9;
  double v10 = [(UICollectionView *)v3->_collectionView trailingAnchor];
  double v11 = [(UGCPhotoCarouselCell *)v3 trailingAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v23[2] = v12;
  double v13 = [(UICollectionView *)v3->_collectionView bottomAnchor];
  double v14 = [(UGCPhotoCarouselCell *)v3 bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v23[3] = v15;
  v23[4] = v3->_heightConstraint;
  v16 = +[NSArray arrayWithObjects:v23 count:5];
  constraints = self->_constraints;
  self->_constraints = v16;

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)_updateConstraints
{
  if (sub_1000BBB44(self) == 5 && MapsFeature_IsEnabled_SydneyARP())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);
    unsigned int v4 = [WeakRetained photoSliderShouldEnablePagingScroll];

    if (v4)
    {
      +[NSLayoutConstraint deactivateConstraints:self->_constraints];
      double v5 = (MUPagingScrollContainerView *)[objc_alloc((Class)MUPagingScrollContainerView) initWithHorizontalScrollView:self->_collectionView];
      pagingScrollView = self->_pagingScrollView;
      self->_pagingScrollView = v5;

      [(MUPagingScrollContainerView *)self->_pagingScrollView setAutomaticallyFlipsForRTL:1];
      uint64_t v7 = self->_pagingScrollView;
      [(MUPagingScrollContainerView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UGCPhotoCarouselCell *)self addSubview:v7];
      v22 = [(MUPagingScrollContainerView *)v7 leadingAnchor];
      v21 = [(UGCPhotoCarouselCell *)self leadingAnchor];
      v20 = [v22 constraintEqualToAnchor:v21];
      v23[0] = v20;
      v19 = [(MUPagingScrollContainerView *)v7 topAnchor];
      v18 = [(UGCPhotoCarouselCell *)self topAnchor];
      unint64_t v8 = [v19 constraintEqualToAnchor:v18];
      v23[1] = v8;
      v9 = [(MUPagingScrollContainerView *)v7 trailingAnchor];
      double v10 = [(UGCPhotoCarouselCell *)self trailingAnchor];
      double v11 = [v9 constraintEqualToAnchor:v10];
      v23[2] = v11;
      double v12 = [(MUPagingScrollContainerView *)v7 bottomAnchor];
      double v13 = [(UGCPhotoCarouselCell *)self bottomAnchor];
      double v14 = [v12 constraintEqualToAnchor:v13];
      heightConstraint = self->_heightConstraint;
      v23[3] = v14;
      v23[4] = heightConstraint;
      v16 = +[NSArray arrayWithObjects:v23 count:5];
      constraints = self->_constraints;
      self->_constraints = v16;

      +[NSLayoutConstraint activateConstraints:self->_constraints];
    }
  }
}

- (id)_horizontalGridLayout
{
  v2 = +[NSCollectionLayoutDimension fractionalWidthDimension:0.166666672];
  id v3 = +[NSCollectionLayoutDimension absoluteDimension:49.0];
  unsigned int v4 = +[NSCollectionLayoutSize sizeWithWidthDimension:v2 heightDimension:v3];

  double v5 = +[NSCollectionLayoutItem itemWithLayoutSize:v4];
  v6 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  uint64_t v7 = [v4 heightDimension];
  unint64_t v8 = +[NSCollectionLayoutSize sizeWithWidthDimension:v6 heightDimension:v7];

  v9 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v8 repeatingSubitem:v5 count:6];
  double v10 = +[NSCollectionLayoutSpacing fixedSpacing:1.0];
  [v9 setInterItemSpacing:v10];

  double v11 = +[NSCollectionLayoutSection sectionWithGroup:v9];
  [v11 setInterGroupSpacing:1.0];
  id v12 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSection:v11];

  return v12;
}

- (id)_horizontalCarouselLayout
{
  if (sub_1000BBB44(self) == 5 && (MapsFeature_IsEnabled_SydneyARP() & 1) == 0)
  {
    id v3 = [(UGCPhotoCarouselCell *)self _horizontalGridLayout];
  }
  else
  {
    id v3 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    [v3 setScrollDirection:1];
    [v3 setMinimumInteritemSpacing:2.0];
    [v3 setSectionInset:self->_sectionInset.top, self->_sectionInset.left, self->_sectionInset.bottom, self->_sectionInset.right];
    unsigned int v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    [v4 _mapkit_scaledValueForValue:90.0];
    double v6 = v5;

    [v3 setItemSize:v6, v6];
  }

  return v3;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  if (self->_sectionInset.left != a3.left
    || self->_sectionInset.top != a3.top
    || self->_sectionInset.right != a3.right
    || self->_sectionInset.bottom != a3.bottom)
  {
    self->_sectionInset = a3;
    [(UGCPhotoCarouselCell *)self _contentSizeDidChange];
  }
}

- (void)setCarouselController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);

  if (WeakRetained != v4)
  {
    id v6 = objc_storeWeak((id *)&self->_carouselController, v4);
    [v4 setupCollectionView:self->_collectionView];

    [(UGCPhotoCarouselCell *)self estimatedHeight];
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:");
    if (sub_1000BBB44(self) == 5)
    {
      objc_initWeak(&location, self);
      id v7 = objc_loadWeakRetained((id *)&self->_carouselController);
      unint64_t v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472;
      double v10 = sub_100A525EC;
      double v11 = &unk_1012E6708;
      objc_copyWeak(&v12, &location);
      [v7 setChangeHandler:&v8];

      [(UGCPhotoCarouselCell *)self _contentSizeDidChange];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (UGCPhotoCarouselController)carouselController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_carouselController);

  return (UGCPhotoCarouselController *)WeakRetained;
}

- (UIEdgeInsets)sectionInset
{
  double top = self->_sectionInset.top;
  double left = self->_sectionInset.left;
  double bottom = self->_sectionInset.bottom;
  double right = self->_sectionInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_carouselController);
  objc_storeStrong((id *)&self->_pagingScrollView, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end