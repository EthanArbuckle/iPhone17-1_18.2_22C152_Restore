@interface _TVStackCollectionView
- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (CGRect)_visibleBounds;
- (NSIndexPath)indexPathForLastFocusedItem;
- (UIEdgeInsets)_gradientBoundsInsets;
- (_TVStackCollectionView)initWithFrame:(CGRect)a3;
- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6;
- (void)_performWithoutLayoutBelow:(id)a3;
- (void)_setGradientBoundsInsets:(UIEdgeInsets)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutBelowIfNeeded;
- (void)reloadData;
- (void)setBottomPaddingForVisibleBounds:(double)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation _TVStackCollectionView

- (_TVStackCollectionView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TVStackCollectionView;
  v3 = -[_TVStackCollectionView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_TVStackCollectionView *)v3 panGestureRecognizer];
    [v5 setDelegate:v4];
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v8 = 0;
  if (isKindOfClass)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setBottomPaddingForVisibleBounds:(double)a3
{
  self->_bottomPadding = a3;
}

- (void)_setGradientBoundsInsets:(UIEdgeInsets)a3
{
  self->_gradientBoundsInsets = a3;
}

- (UIEdgeInsets)_gradientBoundsInsets
{
  double top = self->_gradientBoundsInsets.top;
  double left = self->_gradientBoundsInsets.left;
  double bottom = self->_gradientBoundsInsets.bottom;
  double right = self->_gradientBoundsInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_TVStackCollectionView;
  [(_TVStackCollectionView *)&v14 _getGradientMaskBounds:a3 startInsets:a4 endInsets:a5 intensities:a6];
  [(_TVStackCollectionView *)self _gradientBoundsInsets];
  if (a3)
  {
    CGFloat v12 = v8 + a3->origin.y;
    a3->origin.x = v9 + a3->origin.x;
    a3->origin.y = v12;
    CGFloat v13 = a3->size.height - (v8 + v10);
    a3->size.width = a3->size.width - (v9 + v11);
    a3->size.height = v13;
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TVStackCollectionView;
  [(_TVStackCollectionView *)&v22 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  if ([(UICollectionView *)self tv_isFocusOnNonOwnedCell])
  {
    indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
    self->_indexPathForLastFocusedItem = 0;
  }
  else
  {
    indexPathForLastFocusedItem = [v6 nextFocusedView];
    if ([indexPathForLastFocusedItem isDescendantOfView:self])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      double v8 = [(_TVStackCollectionView *)self indexPathsForVisibleItems];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
LABEL_6:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          CGFloat v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          objc_super v14 = [(_TVStackCollectionView *)self cellForItemAtIndexPath:v13];
          if ([indexPathForLastFocusedItem isDescendantOfView:v14]) {
            break;
          }

          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
            if (v10) {
              goto LABEL_6;
            }
            goto LABEL_15;
          }
        }
        id v15 = v13;

        if (!v15) {
          goto LABEL_16;
        }
        v16 = (NSIndexPath *)[v15 copy];
        v17 = self->_indexPathForLastFocusedItem;
        self->_indexPathForLastFocusedItem = v16;

        double v8 = v15;
      }
LABEL_15:
    }
  }
LABEL_16:
}

- (void)reloadData
{
  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0;

  v4.receiver = self;
  v4.super_class = (Class)_TVStackCollectionView;
  [(_TVStackCollectionView *)&v4 reloadData];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42___TVStackCollectionView_setContentInset___block_invoke;
  v3[3] = &unk_264BA6C60;
  UIEdgeInsets v4 = a3;
  v3[4] = self;
  [(_TVStackCollectionView *)self _performWithoutLayoutBelow:v3];
}

- (void)layoutBelowIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_TVStackCollectionView;
    [(_TVStackCollectionView *)&v2 layoutBelowIfNeeded];
  }
}

- (void)_performWithoutLayoutBelow:(id)a3
{
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags | 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | flags & 1;
}

- (CGRect)_visibleBounds
{
  v3 = [(_TVStackCollectionView *)self window];
  if (v3 && (double bottomPadding = self->_bottomPadding, v3, bottomPadding != 0.0))
  {
    [(_TVStackCollectionView *)self bounds];
    double v8 = self->_bottomPadding + v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVStackCollectionView;
    [(_TVStackCollectionView *)&v10 _visibleBounds];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
}

- (NSIndexPath)indexPathForLastFocusedItem
{
  return self->_indexPathForLastFocusedItem;
}

- (void).cxx_destruct
{
}

@end