@interface HomeCuratedCollectionsCollectionViewCell
+ (double)estimatedCellHeight;
- (HomeCuratedCollectionsTableViewCellModel)cellModel;
- (void)_updateAnimated:(BOOL)a3;
- (void)cellModelDidUpdate:(id)a3;
- (void)resetScrollOffset;
- (void)setCellModel:(id)a3;
@end

@implementation HomeCuratedCollectionsCollectionViewCell

- (void)_updateAnimated:(BOOL)a3
{
  uint64_t v4 = [(HomeCuratedCollectionsTableViewCellModel *)self->_cellModel curatedCollections];
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  [(MKCollectionsCarouselView *)self->_carouselView updateCollections:v7];
  carouselView = self->_carouselView;

  [(MKCollectionsCarouselView *)carouselView displayCollections];
}

- (void)setCellModel:(id)a3
{
  v5 = (HomeCuratedCollectionsTableViewCellModel *)a3;
  v6 = v5;
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

      [(MKCollectionsCarouselView *)self->_carouselView setAccessibilityIdentifier:@"HomeCuratedCollectionsCarousel"];
      v18 = [(HomeCuratedCollectionsCollectionViewCell *)self contentView];
      [v18 addSubview:self->_carouselView];

      v19 = [(HomeCuratedCollectionsTableViewCellModel *)*p_cellModel exploreGuides];
      v20 = [(HomeCuratedCollectionsCollectionViewCell *)self cellModel];
      v21 = [v20 curatedCollections];
      +[MKCollectionsCarouselView horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:](MKCollectionsCarouselView, "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", 7, v19 != 0, [v21 count] == (id)1);

      id v22 = objc_alloc((Class)MUEdgeLayout);
      v23 = self->_carouselView;
      v24 = [(HomeCuratedCollectionsCollectionViewCell *)self contentView];
      id v25 = [v22 initWithItem:v23 container:v24];

      id v26 = objc_alloc((Class)MUSizeLayout);
      v27 = self->_carouselView;
      +[MUSizeLayout useIntrinsicContentSize];
      id v28 = [v26 initWithItem:v27];
      v30[0] = v25;
      v30[1] = v28;
      v29 = +[NSArray arrayWithObjects:v30 count:2];
      +[NSLayoutConstraint _mapsui_activateLayouts:v29];

      [(HomeCuratedCollectionsCollectionViewCell *)self _updateAnimated:0];
    }
  }
}

- (void)resetScrollOffset
{
}

- (HomeCuratedCollectionsTableViewCellModel)cellModel
{
  return self->_cellModel;
}

+ (double)estimatedCellHeight
{
  return 202.0;
}

- (void)cellModelDidUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);

  objc_storeStrong((id *)&self->_carouselView, 0);
}

@end