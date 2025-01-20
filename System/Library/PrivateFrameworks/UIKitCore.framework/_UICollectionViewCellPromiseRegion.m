@interface _UICollectionViewCellPromiseRegion
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isLazyFocusItemContainer;
- (BOOL)_isPromiseFocusRegion;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)canBecomeFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)_focusRegionFrame;
- (CGRect)frame;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (UICollectionView)collectionView;
- (UICollectionViewLayoutAttributes)layoutAttributes;
- (UICoordinateSpace)coordinateSpace;
- (UIScrollView)parentScrollView;
- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (id)_focusDebugOverlayParentView;
- (id)_focusRegionFocusSystem;
- (id)_focusRegionGuides;
- (id)_focusRegionView;
- (id)_fulfillPromisedFocusRegion;
- (id)_preferredFocusRegionCoordinateSpace;
- (id)createPromiseRegion;
- (id)focusItemsInRect:(CGRect)a3;
- (void)_searchForFocusRegionsInContext:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setParentScrollView:(id)a3;
- (void)updateFocusIfNeeded;
@end

@implementation _UICollectionViewCellPromiseRegion

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_UICollectionViewCellPromiseRegion *)self layoutAttributes];
  v7 = [v6 indexPath];
  v8 = [(_UICollectionViewCellPromiseRegion *)self layoutAttributes];
  [v8 frame];
  v9 = NSStringFromCGRect(v17);
  v10 = [(_UICollectionViewCellPromiseRegion *)self collectionView];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = [(_UICollectionViewCellPromiseRegion *)self collectionView];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; Represents index path %@ with frame %@ in %@: %p>",
    v5,
    self,
    v7,
    v9,
    v12,
  v14 = v13);

  return (NSString *)v14;
}

- (id)_focusRegionFocusSystem
{
  v2 = [(_UICollectionViewCellPromiseRegion *)self collectionView];
  v3 = [v2 _focusSystem];

  return v3;
}

- (CGRect)_focusRegionFrame
{
  v3 = [(_UICollectionViewCellPromiseRegion *)self parentScrollView];
  v4 = [(_UICollectionViewCellPromiseRegion *)self layoutAttributes];
  [v4 frame];
  objc_msgSend(v3, "convertRect:toView:", 0);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

- (BOOL)_isPromiseFocusRegion
{
  return 1;
}

- (id)_fulfillPromisedFocusRegion
{
  v3 = [(_UICollectionViewCellPromiseRegion *)self collectionView];
  v4 = [v3 _fulfillPromisedFocusRegionForCell:self];

  return v4;
}

- (BOOL)_isTransparentFocusRegion
{
  return 0;
}

- (id)_focusRegionView
{
  return 0;
}

- (id)_focusRegionGuides
{
  return 0;
}

- (id)_focusDebugOverlayParentView
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CGRect)frame
{
  v2 = [(_UICollectionViewCellPromiseRegion *)self layoutAttributes];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 1;
}

- (void)setNeedsFocusUpdate
{
  id v3 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  id v2 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)focusItemsInRect:(CGRect)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UICollectionViewCellPromiseRegion *)self _fulfillPromisedFocusRegion];
  double v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (UICoordinateSpace)coordinateSpace
{
  id v2 = [(_UICollectionViewCellPromiseRegion *)self parentScrollView];
  uint64_t v3 = [v2 coordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (BOOL)_isLazyFocusItemContainer
{
  return 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  id v2 = [(_UICollectionViewCellPromiseRegion *)self collectionView];
  uint64_t v3 = [v2 _screen];
  double v4 = [v3 coordinateSpace];

  return v4;
}

- (id)createPromiseRegion
{
  uint64_t v3 = [_UIFocusPromiseRegion alloc];
  double v4 = [(_UICollectionViewCellPromiseRegion *)self layoutAttributes];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(_UICollectionViewCellPromiseRegion *)self parentScrollView];
  double v14 = [(_UICollectionViewCellPromiseRegion *)self layoutAttributes];
  double v15 = [v14 indexPath];
  double v16 = -[_UIFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](v3, "initWithFrame:coordinateSpace:identifier:", v13, v15, v6, v8, v10, v12);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57___UICollectionViewCellPromiseRegion_createPromiseRegion__block_invoke;
  v18[3] = &unk_1E52E5DB0;
  v18[4] = self;
  [(_UIFocusPromiseRegion *)v16 setContentFulfillmentHandler:v18];
  return v16;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_UICollectionViewCellPromiseRegion *)self createPromiseRegion];
  [v4 addRegion:v5];
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (UIScrollView)parentScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentScrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setParentScrollView:(id)a3
{
}

- (UICollectionViewLayoutAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_destroyWeak((id *)&self->_parentScrollView);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end