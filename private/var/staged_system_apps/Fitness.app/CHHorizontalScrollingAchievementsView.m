@interface CHHorizontalScrollingAchievementsView
- (AAUIBadgeImageFactory)imageFactory;
- (ACHAchievementLocalizationProvider)locProvider;
- (BOOL)hasVisibleAchievements;
- (CHHorizontalScrollingAchievementsDataSource)dataSource;
- (CHHorizontalScrollingAchievementsView)initWithCoder:(id)a3;
- (CHHorizontalScrollingAchievementsView)initWithFrame:(CGRect)a3;
- (CHHorizontalScrollingAchievementsView)initWithFrame:(CGRect)a3 badgeImageFactory:(id)a4 locProvider:(id)a5;
- (CHHorizontalScrollingAchievementsViewDelegate)delegate;
- (NSArray)achievements;
- (UICollectionView)collectionView;
- (UIEdgeInsets)scrollViewContentInset;
- (id)_createLayout;
- (void)layoutSubviews;
- (void)setAchievements:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImageFactory:(id)a3;
- (void)setLocProvider:(id)a3;
- (void)setScrollViewContentInset:(UIEdgeInsets)a3;
@end

@implementation CHHorizontalScrollingAchievementsView

- (CHHorizontalScrollingAchievementsView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (CHHorizontalScrollingAchievementsView)initWithCoder:(id)a3
{
  return 0;
}

- (CHHorizontalScrollingAchievementsView)initWithFrame:(CGRect)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHHorizontalScrollingAchievementsView;
  v14 = -[CHHorizontalScrollingAchievementsView initWithFrame:](&v21, "initWithFrame:", x, y, width, height);
  if (v14)
  {
    id v15 = objc_alloc((Class)UICollectionView);
    v16 = [(CHHorizontalScrollingAchievementsView *)v14 _createLayout];
    v17 = [v15 initWithFrame:v16 collectionViewLayout:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    collectionView = v14->_collectionView;
    v14->_collectionView = v17;

    v19 = +[UIColor clearColor];
    [(UICollectionView *)v14->_collectionView setBackgroundColor:v19];

    [(UICollectionView *)v14->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v14->_collectionView setShowsVerticalScrollIndicator:0];
    [(CHHorizontalScrollingAchievementsView *)v14 addSubview:v14->_collectionView];
    objc_storeStrong((id *)&v14->_locProvider, a5);
    objc_storeStrong((id *)&v14->_imageFactory, a4);
  }

  return v14;
}

- (id)_createLayout
{
  id v2 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v2 setMinimumInteritemSpacing:9.0];
  [v2 setMinimumLineSpacing:9.0];
  [v2 setScrollDirection:1];

  return v2;
}

- (void)setAchievements:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_achievements != v5)
  {
    objc_storeStrong((id *)&self->_achievements, a3);
    v6 = [CHHorizontalScrollingAchievementsDataSource alloc];
    v7 = [(CHHorizontalScrollingAchievementsView *)self collectionView];
    achievements = self->_achievements;
    v9 = [(CHHorizontalScrollingAchievementsView *)self imageFactory];
    v10 = [(CHHorizontalScrollingAchievementsView *)self locProvider];
    v11 = [(CHHorizontalScrollingAchievementsDataSource *)v6 initWithCollectionView:v7 achievements:achievements imageFactory:v9 locProvider:v10];
    dataSource = self->_dataSource;
    self->_dataSource = v11;

    [(CHHorizontalScrollingAchievementsView *)self scrollViewContentInset];
    -[CHHorizontalScrollingAchievementsDataSource setEdgeInsets:](self->_dataSource, "setEdgeInsets:");
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012D5BC;
    v13[3] = &unk_1008ACEF8;
    objc_copyWeak(&v14, &location);
    [(CHHorizontalScrollingAchievementsDataSource *)self->_dataSource setAchievementSelectedBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)setScrollViewContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left != self->_scrollViewContentInset.left
    || a3.top != self->_scrollViewContentInset.top
    || a3.right != self->_scrollViewContentInset.right
    || a3.bottom != self->_scrollViewContentInset.bottom)
  {
    self->_scrollViewContentInset = a3;
    id v10 = [(CHHorizontalScrollingAchievementsView *)self dataSource];
    [v10 setEdgeInsets:top, left, bottom, right];
  }
}

- (BOOL)hasVisibleAchievements
{
  v3 = [(CHHorizontalScrollingAchievementsView *)self dataSource];
  if ((uint64_t)[v3 numberOfSectionsInCollectionView:self->_collectionView] < 1)
  {
    BOOL v5 = 0;
  }
  else
  {
    v4 = [(CHHorizontalScrollingAchievementsView *)self dataSource];
    BOOL v5 = (uint64_t)[v4 collectionView:self->_collectionView numberOfItemsInSection:0] > 0;
  }
  return v5;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CHHorizontalScrollingAchievementsView;
  [(CHHorizontalScrollingAchievementsView *)&v14 layoutSubviews];
  [(CHHorizontalScrollingAchievementsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CHHorizontalScrollingAchievementsView *)self collectionView];
  [v11 setFrame:v4, v6, v8, v10];

  id v12 = [(CHHorizontalScrollingAchievementsView *)self collectionView];
  id v13 = [v12 collectionViewLayout];
  [v13 invalidateLayout];
}

- (NSArray)achievements
{
  return self->_achievements;
}

- (UIEdgeInsets)scrollViewContentInset
{
  double top = self->_scrollViewContentInset.top;
  double left = self->_scrollViewContentInset.left;
  double bottom = self->_scrollViewContentInset.bottom;
  double right = self->_scrollViewContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CHHorizontalScrollingAchievementsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHHorizontalScrollingAchievementsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (CHHorizontalScrollingAchievementsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
}

- (AAUIBadgeImageFactory)imageFactory
{
  return self->_imageFactory;
}

- (void)setImageFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_achievements, 0);
}

@end