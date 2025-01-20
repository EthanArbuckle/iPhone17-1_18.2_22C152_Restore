@interface HomeCuratedCollectionsTableViewCell
+ (NSString)identifier;
+ (double)cellHeightWithTraitCollection:(id)a3 includeExploreGuidesHeight:(BOOL)a4 collectionCount:(unint64_t)a5;
+ (double)estimatedCellHeight;
- (HomeCuratedCollectionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HomeCuratedCollectionsTableViewCellModel)cellModel;
- (id)accessibilityIdentifier;
- (void)_updateAnimated:(BOOL)a3;
- (void)cellModelDidUpdate:(id)a3;
- (void)resetScrollOffset;
- (void)setCellModel:(id)a3;
@end

@implementation HomeCuratedCollectionsTableViewCell

+ (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)cellHeightWithTraitCollection:(id)a3 includeExploreGuidesHeight:(BOOL)a4 collectionCount:(unint64_t)a5
{
  +[MKCollectionsCarouselView horizontalLayoutHeightInContext:7 includeExploreGuidesHeight:a4 isSingleCollection:a5 == 1];
  return result;
}

+ (double)estimatedCellHeight
{
  return 202.0;
}

- (HomeCuratedCollectionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HomeCuratedCollectionsTableViewCell;
  v7 = [(MapsThemeTableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    [(HomeCuratedCollectionsTableViewCell *)v7 setAccessibilityIdentifier:v6];
    v9 = +[UIColor clearColor];
    [(HomeCuratedCollectionsTableViewCell *)v8 setBackgroundColor:v9];
  }
  return v8;
}

- (void)setCellModel:(id)a3
{
  v5 = (HomeCuratedCollectionsTableViewCellModel *)a3;
  id v6 = v5;
  p_cellModel = &self->_cellModel;
  if (self->_cellModel != v5 && !-[HomeCuratedCollectionsTableViewCellModel isEqual:](v5, "isEqual:"))
  {
    if (*p_cellModel)
    {
      v8 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel observers];
      [v8 unregisterObserver:self];

      [(MKCollectionsCarouselView *)self->_carouselView removeFromSuperview];
      carouselView = self->_carouselView;
      self->_carouselView = 0;
    }
    objc_storeStrong((id *)&self->_cellModel, a3);
    if (*p_cellModel)
    {
      v10 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel observers];
      [v10 registerObserver:self];

      id v11 = objc_alloc((Class)MKCollectionsCarouselView);
      v12 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel syncCoordinator];
      v13 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel delegate];
      v14 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel delegate];
      v15 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel exploreGuides];
      v16 = (MKCollectionsCarouselView *)[v11 initCollectionsCarouselViewWithContext:7 withPlaceCollections:&__NSArray0__struct usingSyncCoordinator:v12 withRoutingDelegate:v13 withScrollViewDelegate:0 withAnalyticsDelegate:v14 exploreGuides:v15];
      v17 = self->_carouselView;
      self->_carouselView = v16;

      [(MKCollectionsCarouselView *)self->_carouselView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(MKCollectionsCarouselView *)self->_carouselView setAccessibilityIdentifier:@"HomeCuratedCollectionsCarousel"];
      v18 = [(HomeCuratedCollectionsTableViewCell *)self contentView];
      [v18 addSubview:self->_carouselView];

      v39 = [(MKCollectionsCarouselView *)self->_carouselView topAnchor];
      v40 = [(HomeCuratedCollectionsTableViewCell *)self contentView];
      v38 = [v40 topAnchor];
      v37 = [v39 constraintEqualToAnchor:v38];
      v41[0] = v37;
      v35 = [(MKCollectionsCarouselView *)self->_carouselView leadingAnchor];
      v36 = [(HomeCuratedCollectionsTableViewCell *)self contentView];
      v34 = [v36 leadingAnchor];
      v33 = [v35 constraintEqualToAnchor:v34 constant:0.0];
      v41[1] = v33;
      v31 = [(MKCollectionsCarouselView *)self->_carouselView trailingAnchor];
      v32 = [(HomeCuratedCollectionsTableViewCell *)self contentView];
      v30 = [v32 trailingAnchor];
      v29 = [v31 constraintEqualToAnchor:v30 constant:-0.0];
      v41[2] = v29;
      v27 = [(MKCollectionsCarouselView *)self->_carouselView bottomAnchor];
      v28 = [(HomeCuratedCollectionsTableViewCell *)self contentView];
      v19 = [v28 bottomAnchor];
      v20 = [v27 constraintEqualToAnchor:v19];
      v41[3] = v20;
      v21 = [(MKCollectionsCarouselView *)self->_carouselView heightAnchor];
      v22 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel exploreGuides];
      v23 = [(HomeCuratedCollectionsTableViewCell *)self cellModel];
      v24 = [v23 curatedCollections];
      +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", 7, v22 != 0, [v24 count] == (id)1);
      v25 = [v21 constraintEqualToConstant:];
      v41[4] = v25;
      v26 = +[NSArray arrayWithObjects:v41 count:5];
      +[NSLayoutConstraint activateConstraints:v26];

      [(HomeCuratedCollectionsTableViewCell *)self _updateAnimated:0];
    }
  }
}

- (void)resetScrollOffset
{
}

- (void)_updateAnimated:(BOOL)a3
{
  uint64_t v4 = [(HomeCuratedCollectionsTableViewCellModel *)self->_cellModel curatedCollections];
  v5 = (void *)v4;
  id v6 = &__NSArray0__struct;
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  [(MKCollectionsCarouselView *)self->_carouselView updateCollections:v7];
  carouselView = self->_carouselView;

  [(MKCollectionsCarouselView *)carouselView displayCollections];
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)cellModelDidUpdate:(id)a3
{
}

- (HomeCuratedCollectionsTableViewCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);

  objc_storeStrong((id *)&self->_carouselView, 0);
}

@end