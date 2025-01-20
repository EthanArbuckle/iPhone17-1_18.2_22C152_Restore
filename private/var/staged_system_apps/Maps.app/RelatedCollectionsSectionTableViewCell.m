@interface RelatedCollectionsSectionTableViewCell
+ (double)cellHeightWithCollectionsCount:(unint64_t)a3;
- (MKCollectionsCarouselView)carouselView;
- (NSArray)placeCollections;
- (RelatedCollectionsSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (RelatedSectionTableViewCellDelegate)delegate;
- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5;
- (void)collectionsCarouselDidScrollBackward;
- (void)collectionsCarouselDidScrollForward;
- (void)initializeCarouselUsingPlaceCollection:(id)a3 carouselRoutingDelegate:(id)a4;
- (void)prepareForReuse;
- (void)routeToCuratedCollection:(id)a3;
- (void)setCarouselView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaceCollections:(id)a3;
- (void)setPlaceCollections:(id)a3 delegate:(id)a4;
@end

@implementation RelatedCollectionsSectionTableViewCell

- (RelatedCollectionsSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RelatedCollectionsSectionTableViewCell;
  v4 = [(RelatedSectionTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    v6 = [(RelatedCollectionsSectionTableViewCell *)v4 contentView];
    [v6 setBackgroundColor:v5];
  }
  return v4;
}

- (void)setPlaceCollections:(id)a3 delegate:(id)a4
{
  id v14 = a3;
  objc_storeWeak((id *)&self->_delegate, a4);
  unint64_t count = self->_count;
  id v7 = [v14 count];
  objc_super v8 = (NSArray *)[v14 copy];
  placeCollections = self->_placeCollections;
  self->_placeCollections = v8;

  self->_unint64_t count = [(NSArray *)self->_placeCollections count];
  v10 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];

  if ((id)count == v7)
  {
    if (v10)
    {
      v11 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
      [v11 updateCollections:self->_placeCollections];

      goto LABEL_7;
    }
  }
  else if (v10)
  {
    v12 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
    [v12 removeFromSuperview];
  }
  [(RelatedCollectionsSectionTableViewCell *)self initializeCarouselUsingPlaceCollection:v14 carouselRoutingDelegate:self];
LABEL_7:
  v13 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  [v13 displayCollections];
}

- (void)initializeCarouselUsingPlaceCollection:(id)a3 carouselRoutingDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)MKCollectionsCarouselView);
  placeCollections = self->_placeCollections;
  v10 = +[CuratedCollectionSyncManager sharedManager];
  id v11 = [v8 initCollectionsCarouselViewWithContext:4 withPlaceCollections:placeCollections usingSyncCoordinator:v10 withRoutingDelegate:v6 withScrollViewDelegate:self withAnalyticsDelegate:self exploreGuides:0];

  [(RelatedCollectionsSectionTableViewCell *)self setCarouselView:v11];
  v12 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(RelatedCollectionsSectionTableViewCell *)self contentView];
  id v14 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  [v13 addSubview:v14];

  v39 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  v37 = [v39 leadingAnchor];
  v38 = [(RelatedCollectionsSectionTableViewCell *)self contentView];
  v36 = [v38 leadingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v40[0] = v35;
  v34 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  v32 = [v34 trailingAnchor];
  v33 = [(RelatedCollectionsSectionTableViewCell *)self contentView];
  v31 = [v33 trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v40[1] = v30;
  v29 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  v27 = [v29 topAnchor];
  v28 = [(RelatedSectionTableViewCell *)self sectionNameLabel];
  v26 = [v28 bottomAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v40[2] = v25;
  v15 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  v16 = [v15 bottomAnchor];
  v17 = [(RelatedCollectionsSectionTableViewCell *)self contentView];
  v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v40[3] = v19;
  v20 = [(RelatedCollectionsSectionTableViewCell *)self carouselView];
  v21 = [v20 heightAnchor];
  id v22 = [v7 count];

  +[MKCollectionsCarouselView horizontalLayoutHeightInContext:4 includeExploreGuidesHeight:0 isSingleCollection:v22 == (id)1];
  v23 = [v21 constraintEqualToConstant:];
  v40[4] = v23;
  v24 = +[NSArray arrayWithObjects:v40 count:5];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)RelatedCollectionsSectionTableViewCell;
  [(RelatedSectionTableViewCell *)&v3 prepareForReuse];
  [(RelatedCollectionsSectionTableViewCell *)self setPlaceCollections:0];
  [(RelatedCollectionsSectionTableViewCell *)self setDelegate:0];
}

+ (double)cellHeightWithCollectionsCount:(unint64_t)a3
{
  v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline];
  [v4 _mapkit_scaledValueForValue:20.0];
  double v6 = v5;
  +[MKCollectionsCarouselView horizontalLayoutHeightInContext:4 includeExploreGuidesHeight:0 isSingleCollection:a3 == 1];
  double v8 = v6 + v7 + 16.0;

  return v8;
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(RelatedCollectionsSectionTableViewCell *)self delegate];
  [v5 relatedSectionRouteToCuratedCollection:v4];
}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(RelatedCollectionsSectionTableViewCell *)self delegate];
  [v9 relatedSectionTappedOnCollectionId:v8 atIndex:a4 isSaved:v5];
}

- (void)collectionsCarouselDidScrollForward
{
  id v2 = [(RelatedCollectionsSectionTableViewCell *)self delegate];
  [v2 relatedSectionTableViewCellDidScrollForward];
}

- (void)collectionsCarouselDidScrollBackward
{
  id v2 = [(RelatedCollectionsSectionTableViewCell *)self delegate];
  [v2 relatedSectionTableViewCellDidScrollBackward];
}

- (MKCollectionsCarouselView)carouselView
{
  return self->_carouselView;
}

- (void)setCarouselView:(id)a3
{
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (RelatedSectionTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RelatedSectionTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeCollections, 0);

  objc_storeStrong((id *)&self->_carouselView, 0);
}

@end