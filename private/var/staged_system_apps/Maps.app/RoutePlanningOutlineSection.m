@interface RoutePlanningOutlineSection
- (BOOL)isActive;
- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3;
- (BOOL)shouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)shouldSelectItemAtIndexPath:(id)a3;
- (BOOL)wantsDefaultPaddingAboveSection;
- (NSString)sectionIdentifier;
- (RoutePlanningOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4;
- (RoutePlanningOutlineSectionHosting)host;
- (double)estimatedItemHeight;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)setActive:(BOOL)a3;
- (void)setHost:(id)a3;
@end

@implementation RoutePlanningOutlineSection

- (RoutePlanningOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RoutePlanningOutlineSection;
  v9 = [(RoutePlanningOutlineSection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_active = 1;
    v11 = (NSString *)[v8 copy];
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = v11;

    objc_storeStrong((id *)&v10->_collectionView, a3);
  }

  return v10;
}

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = [(RoutePlanningOutlineSection *)self listLayoutSectionConfigurationAtIndex:a3 layoutEnvironment:v6];
  if (sub_1000BBB44(self->_collectionView) == 5)
  {
    [v7 setSeparatorStyle:0];
  }
  else
  {
    id v8 = [v7 _separatorConfiguration];
    id v9 = [v8 copy];

    v10 = [(UICollectionView *)self->_collectionView theme];
    v11 = [v10 dynamicHairlineColor];
    [v9 _setColor:v11];

    [v7 _setSeparatorConfiguration:v9];
  }
  id v12 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v7 layoutEnvironment:v6];

  return v12;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:0 layoutEnvironment:v5];

  [(RoutePlanningOutlineSection *)self estimatedItemHeight];
  [v6 setEstimatedRowHeight:];
  [v6 setSeparatorStyle:1];

  return v6;
}

- (double)estimatedItemHeight
{
  return _UICollectionViewListLayoutSectionAutomaticDimension;
}

- (BOOL)wantsDefaultPaddingAboveSection
{
  return 1;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  [(RoutePlanningOutlineSection *)self doesNotRecognizeSelector:a2];
  id v3 = [objc_alloc((Class)UICollectionViewCell) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  return v3;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldHighlightItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)shouldSelectItemAtIndexPath:(id)a3
{
  return 1;
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return 0;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (RoutePlanningOutlineSectionHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (RoutePlanningOutlineSectionHosting *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end