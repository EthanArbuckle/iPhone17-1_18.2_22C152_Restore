@interface VKCActionInfoViewLayoutContext
- (BOOL)animateItemVisibilityChanges;
- (BOOL)didAddLeadingItem;
- (BOOL)didAddTrailingItem;
- (BOOL)showingMoreButton;
- (CATransform3D)transform;
- (CGRect)containerBounds;
- (NSMutableArray)leadingLayout;
- (NSMutableArray)trailingLayout;
- (UIEdgeInsets)edgeInsets;
- (VKCActionInfoViewLayoutContext)init;
- (double)currentMaxX;
- (double)currentMinX;
- (double)padding;
- (double)remainingWidth;
- (double)scale;
- (void)reset;
- (void)setAnimateItemVisibilityChanges:(BOOL)a3;
- (void)setContainerBounds:(CGRect)a3;
- (void)setCurrentMaxX:(double)a3;
- (void)setCurrentMinX:(double)a3;
- (void)setDidAddLeadingItem:(BOOL)a3;
- (void)setDidAddTrailingItem:(BOOL)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setLeadingLayout:(id)a3;
- (void)setPadding:(double)a3;
- (void)setScale:(double)a3;
- (void)setShowingMoreButton:(BOOL)a3;
- (void)setTrailingLayout:(id)a3;
- (void)setTransform:(CATransform3D *)a3;
@end

@implementation VKCActionInfoViewLayoutContext

- (VKCActionInfoViewLayoutContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKCActionInfoViewLayoutContext;
  v2 = [(VKCActionInfoViewLayoutContext *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    leadingLayout = v2->_leadingLayout;
    v2->_leadingLayout = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    trailingLayout = v2->_trailingLayout;
    v2->_trailingLayout = v5;
  }
  return v2;
}

- (void)reset
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_containerBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_containerBounds.size = v3;
  self->_padding = 0.0;
  self->_scale = 0.0;
  self->_edgeInsets = *(UIEdgeInsets *)VKUIEdgeInsetsZero;
  *(_WORD *)&self->_didAddLeadingItem = 0;
  self->_animateItemVisibilityChanges = 0;
  self->_currentMaxX = 0.0;
  self->_currentMinX = 0.0;
  [(NSMutableArray *)self->_leadingLayout removeAllObjects];
  trailingLayout = self->_trailingLayout;
  [(NSMutableArray *)trailingLayout removeAllObjects];
}

- (double)remainingWidth
{
  [(VKCActionInfoViewLayoutContext *)self currentMaxX];
  double v4 = v3;
  [(VKCActionInfoViewLayoutContext *)self currentMinX];
  return v4 - v5;
}

- (CGRect)containerBounds
{
  double x = self->_containerBounds.origin.x;
  double y = self->_containerBounds.origin.y;
  double width = self->_containerBounds.size.width;
  double height = self->_containerBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerBounds:(CGRect)a3
{
  self->_containerBounds = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (double)currentMaxX
{
  return self->_currentMaxX;
}

- (void)setCurrentMaxX:(double)a3
{
  self->_currentMaxX = a3;
}

- (double)currentMinX
{
  return self->_currentMinX;
}

- (void)setCurrentMinX:(double)a3
{
  self->_currentMinX = a3;
}

- (CATransform3D)transform
{
  long long v3 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transform.m23 = v5;
  *(_OWORD *)&self->_transform.m11 = v3;
  *(_OWORD *)&self->_transform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transform.m43 = v8;
  *(_OWORD *)&self->_transform.m31 = v6;
  *(_OWORD *)&self->_transform.m33 = v7;
}

- (BOOL)didAddLeadingItem
{
  return self->_didAddLeadingItem;
}

- (void)setDidAddLeadingItem:(BOOL)a3
{
  self->_didAddLeadingItem = a3;
}

- (BOOL)didAddTrailingItem
{
  return self->_didAddTrailingItem;
}

- (void)setDidAddTrailingItem:(BOOL)a3
{
  self->_didAddTrailingItem = a3;
}

- (BOOL)animateItemVisibilityChanges
{
  return self->_animateItemVisibilityChanges;
}

- (void)setAnimateItemVisibilityChanges:(BOOL)a3
{
  self->_animateItemVisibilityChanges = a3;
}

- (BOOL)showingMoreButton
{
  return self->_showingMoreButton;
}

- (void)setShowingMoreButton:(BOOL)a3
{
  self->_showingMoreButton = a3;
}

- (NSMutableArray)leadingLayout
{
  return self->_leadingLayout;
}

- (void)setLeadingLayout:(id)a3
{
}

- (NSMutableArray)trailingLayout
{
  return self->_trailingLayout;
}

- (void)setTrailingLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingLayout, 0);
  objc_storeStrong((id *)&self->_leadingLayout, 0);
}

@end