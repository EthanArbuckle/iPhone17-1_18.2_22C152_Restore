@interface _UIFocusCollectionViewSectionContainerGuide
- (UICollectionView)collectionView;
- (_UIFocusCollectionViewSectionContainerGuide)initWithCollectionView:(id)a3;
- (int64_t)section;
- (void)_searchForFocusRegionsInContext:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setSection:(int64_t)a3;
@end

@implementation _UIFocusCollectionViewSectionContainerGuide

- (_UIFocusCollectionViewSectionContainerGuide)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusCollectionViewSectionContainerGuide;
  v5 = [(UIFocusContainerGuide *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_collectionView, v4);
  }

  return v6;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4 = a3;
  v5 = [_UIFocusCollectionViewSectionContainerGuideRegion alloc];
  [(UILayoutGuide *)self layoutFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(UILayoutGuide *)self owningView];
  v15 = [v14 coordinateSpace];
  v20 = -[_UIFocusGuideRegion initWithFrame:coordinateSpace:](v5, "initWithFrame:coordinateSpace:", v15, v7, v9, v11, v13);

  [(_UIFocusGuideRegion *)v20 setDelegate:self];
  v16 = [(UILayoutGuide *)self owningView];
  v17 = [(UILayoutGuide *)self owningView];
  v18 = _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v16, (uint64_t)v17);
  [(_UIFocusContainerGuideRegion *)v20 setContentFocusRegionContainer:v18];

  v19 = [(_UIFocusCollectionViewSectionContainerGuide *)self collectionView];
  [(_UIFocusCollectionViewSectionContainerGuideRegion *)v20 setCollectionView:v19];

  [(_UIFocusCollectionViewSectionContainerGuideRegion *)v20 setSection:[(_UIFocusCollectionViewSectionContainerGuide *)self section]];
  [(UILayoutGuide *)self layoutFrame];
  -[_UIFocusCollectionViewSectionContainerGuideRegion setSectionFrame:](v20, "setSectionFrame:");
  [v4 addRegion:v20];
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end