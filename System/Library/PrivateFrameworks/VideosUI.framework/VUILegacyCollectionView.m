@interface VUILegacyCollectionView
- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating;
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)_visibleBounds;
- (NSIndexPath)indexPathForLastFocusedItem;
- (UIEdgeInsets)_gradientBoundsInsets;
- (VUILegacyCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6;
- (void)_longPressAction:(id)a3;
- (void)_notifyDidScroll;
- (void)_performBlockWithLongPressedCellIndexPath:(id)a3;
- (void)_performWithoutLayoutBelow:(id)a3;
- (void)_setGradientBoundsInsets:(UIEdgeInsets)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutBelowIfNeeded;
- (void)reloadData;
- (void)setBottomPaddingForVisibleBounds:(double)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
@end

@implementation VUILegacyCollectionView

- (VUILegacyCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VUILegacyCollectionView;
  v4 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](&v8, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v4 action:sel__longPressAction_];
    longPressRecognizer = v4->_longPressRecognizer;
    v4->_longPressRecognizer = (UILongPressGestureRecognizer *)v5;

    [(UILongPressGestureRecognizer *)v4->_longPressRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v4->_longPressRecognizer setDelegate:v4];
    [(VUILegacyCollectionView *)v4 addGestureRecognizer:v4->_longPressRecognizer];
  }
  return v4;
}

- (BOOL)_shouldFadeCellsForBoundChangeWhileRotating
{
  return 0;
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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressRecognizer == v4)
  {
    if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
    {
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      id v6 = [(VUILegacyCollectionView *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __56__VUILegacyCollectionView_gestureRecognizerShouldBegin___block_invoke;
        v10[3] = &unk_1E6DF9848;
        v10[4] = self;
        v10[5] = &v11;
        [(VUILegacyCollectionView *)self _performBlockWithLongPressedCellIndexPath:v10];
      }
      unsigned __int8 v5 = *((unsigned char *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VUILegacyCollectionView;
    unsigned __int8 v5 = [(VUILegacyCollectionView *)&v9 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

void __56__VUILegacyCollectionView_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  LOBYTE(v3) = [v5 collectionView:*(void *)(a1 + 32) shouldHandleLongPressForItemAtIndexPath:v4];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VUILegacyCollectionView;
  [(VUILegacyCollectionView *)&v22 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  char v7 = [v6 nextFocusedView];
  if ([v7 isDescendantOfView:self])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v8 = [(VUILegacyCollectionView *)self indexPathsForVisibleItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        char v14 = [(VUILegacyCollectionView *)self cellForItemAtIndexPath:v13];
        if ([v7 isDescendantOfView:v14]) {
          break;
        }

        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_13;
        }
      }
      id v15 = v13;

      if (!v15) {
        goto LABEL_14;
      }
      v16 = (NSIndexPath *)[v15 copy];
      indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
      self->_indexPathForLastFocusedItem = v16;

      BOOL v8 = v15;
    }
LABEL_13:
  }
LABEL_14:
}

- (BOOL)canBecomeFocused
{
  if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
  {
    id v4 = [(VUILegacyCollectionView *)self delegate];
    char v5 = [v4 collectionViewCanBecomeFocused:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUILegacyCollectionView;
    return [(VUILegacyCollectionView *)&v6 canBecomeFocused];
  }
}

- (void)reloadData
{
  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0;

  v4.receiver = self;
  v4.super_class = (Class)VUILegacyCollectionView;
  [(VUILegacyCollectionView *)&v4 reloadData];
}

- (void)setScrollEnabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VUILegacyCollectionView;
  [(VUILegacyCollectionView *)&v3 setScrollEnabled:a3];
}

- (void)_notifyDidScroll
{
  v4.receiver = self;
  v4.super_class = (Class)VUILegacyCollectionView;
  [(VUILegacyCollectionView *)&v4 _notifyDidScroll];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4FA9D08] object:self];
}

- (void)setDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUILegacyCollectionView;
  id v4 = a3;
  [(VUILegacyCollectionView *)&v8 setDelegate:v4];
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v5;
  char v6 = objc_opt_respondsToSelector();

  if (v6) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v7;
}

- (void)_longPressAction:(id)a3
{
  if ([a3 state] == 1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__VUILegacyCollectionView__longPressAction___block_invoke;
    v4[3] = &unk_1E6DF9870;
    v4[4] = self;
    [(VUILegacyCollectionView *)self _performBlockWithLongPressedCellIndexPath:v4];
  }
}

void __44__VUILegacyCollectionView__longPressAction___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 collectionView:*(void *)(a1 + 32) didReceiveLongPressForItemAtIndexPath:v4];
}

- (void)_performBlockWithLongPressedCellIndexPath:(id)a3
{
  id v5 = (void (**)(id, void *))a3;
  [(UILongPressGestureRecognizer *)self->_longPressRecognizer locationInView:self];
  id v4 = -[VUILegacyCollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
  if (v4) {
    v5[2](v5, v4);
  }
}

- (void)setBottomPaddingForVisibleBounds:(double)a3
{
  self->_bottomPadding = a3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VUILegacyCollectionView_setContentInset___block_invoke;
  v3[3] = &unk_1E6DF74D8;
  UIEdgeInsets v4 = a3;
  v3[4] = self;
  [(VUILegacyCollectionView *)self _performWithoutLayoutBelow:v3];
}

id __43__VUILegacyCollectionView_setContentInset___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)VUILegacyCollectionView;
  return objc_msgSendSuper2(&v2, sel_setContentInset_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)layoutBelowIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)VUILegacyCollectionView;
    [(VUILegacyCollectionView *)&v2 layoutBelowIfNeeded];
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
  objc_super v3 = [(VUILegacyCollectionView *)self window];
  if (v3 && (double bottomPadding = self->_bottomPadding, v3, bottomPadding != 0.0))
  {
    [(VUILegacyCollectionView *)self bounds];
    double v8 = self->_bottomPadding + v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VUILegacyCollectionView;
    [(VUILegacyCollectionView *)&v10 _visibleBounds];
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
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
  v12.receiver = self;
  v12.super_class = (Class)VUILegacyCollectionView;
  [(VUILegacyCollectionView *)&v12 _getGradientMaskBounds:a3 startInsets:a4 endInsets:a5 intensities:a6];
  if (a3)
  {
    v8.f64[0] = self->_gradientBoundsInsets.right;
    double top = self->_gradientBoundsInsets.top;
    CGFloat v10 = top + a3->origin.y;
    float64x2_t v11 = *(float64x2_t *)&self->_gradientBoundsInsets.left;
    a3->origin.x = v11.f64[0] + a3->origin.x;
    a3->origin.y = v10;
    v8.f64[1] = top;
    a3->size = (CGSize)vsubq_f64((float64x2_t)a3->size, vaddq_f64(v11, v8));
  }
}

- (NSIndexPath)indexPathForLastFocusedItem
{
  return self->_indexPathForLastFocusedItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathForLastFocusedItem, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
}

@end