@interface _TVCollectionView
- (BOOL)canBecomeFocused;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)_visibleBounds;
- (NSIndexPath)indexPathForLastFocusedItem;
- (UIEdgeInsets)_gradientBoundsInsets;
- (_TVCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)_getGradientMaskBounds:(CGRect *)a3 startInsets:(UIEdgeInsets *)a4 endInsets:(UIEdgeInsets *)a5 intensities:(UIEdgeInsets *)a6;
- (void)_longPressAction:(id)a3;
- (void)_notifyDidScroll;
- (void)_performBlockWithFocusedCellIndexPath:(id)a3;
- (void)_performBlockWithLongPressedCellIndexPath:(id)a3;
- (void)_performWithoutLayoutBelow:(id)a3;
- (void)_playButtonAction:(id)a3;
- (void)_setGradientBoundsInsets:(UIEdgeInsets)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutBelowIfNeeded;
- (void)reloadData;
- (void)setBottomPaddingForVisibleBounds:(double)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
@end

@implementation _TVCollectionView

- (_TVCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_TVCollectionView;
  v4 = -[_TVCollectionView initWithFrame:collectionViewLayout:](&v8, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v4 action:sel__longPressAction_];
    longPressRecognizer = v4->_longPressRecognizer;
    v4->_longPressRecognizer = (UILongPressGestureRecognizer *)v5;

    [(UILongPressGestureRecognizer *)v4->_longPressRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v4->_longPressRecognizer setDelegate:v4];
    [(_TVCollectionView *)v4 addGestureRecognizer:v4->_longPressRecognizer];
    [(_TVCollectionView *)v4 setRemembersLastFocusedIndexPath:0];
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if ([v6 numberOfTouches] || objc_msgSend(v7, "numberOfTouches"))
    {
      BOOL v8 = 1;
    }
    else
    {
      [(_TVCollectionView *)self contentOffset];
      BOOL v8 = v10 <= 0.0;
      if ([(_TVCollectionView *)self effectiveUserInterfaceLayoutDirection] == 1)
      {
        [(_TVCollectionView *)self contentOffset];
        double v12 = v11;
        [(_TVCollectionView *)self contentSize];
        double v14 = v13;
        [(_TVCollectionView *)self size];
        BOOL v8 = v12 >= v14 - v15;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && ([v5 numberOfTouches] || objc_msgSend(v6, "numberOfTouches"));

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v4 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressRecognizer == v4)
  {
    if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
    {
      uint64_t v11 = 0;
      double v12 = &v11;
      uint64_t v13 = 0x2020000000;
      char v14 = 0;
      id v6 = [(_TVCollectionView *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __50___TVCollectionView_gestureRecognizerShouldBegin___block_invoke;
        v10[3] = &unk_264BA9280;
        v10[4] = self;
        v10[5] = &v11;
        [(_TVCollectionView *)self _performBlockWithLongPressedCellIndexPath:v10];
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
    v9.super_class = (Class)_TVCollectionView;
    unsigned __int8 v5 = [(_TVCollectionView *)&v9 gestureRecognizerShouldBegin:v4];
  }

  return v5;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TVCollectionView;
  [(_TVCollectionView *)&v22 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  char v7 = [v6 nextFocusedView];
  if ([v7 isDescendantOfView:self])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v8 = [(_TVCollectionView *)self indexPathsForVisibleItems];
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
        char v14 = [(_TVCollectionView *)self cellForItemAtIndexPath:v13];
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
    v4 = [(_TVCollectionView *)self delegate];
    char v5 = [v4 collectionViewCanBecomeFocused:self];

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_TVCollectionView;
    return [(_TVCollectionView *)&v6 canBecomeFocused];
  }
}

- (void)reloadData
{
  indexPathForLastFocusedItem = self->_indexPathForLastFocusedItem;
  self->_indexPathForLastFocusedItem = 0;

  v4.receiver = self;
  v4.super_class = (Class)_TVCollectionView;
  [(_TVCollectionView *)&v4 reloadData];
}

- (void)setScrollEnabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_TVCollectionView;
  [(_TVCollectionView *)&v3 setScrollEnabled:a3];
}

- (void)_notifyDidScroll
{
  v4.receiver = self;
  v4.super_class = (Class)_TVCollectionView;
  [(_TVCollectionView *)&v4 _notifyDidScroll];
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"TVCollectionViewDidScrollNotification" object:self];
}

- (void)setDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_TVCollectionView;
  id v4 = a3;
  [(_TVCollectionView *)&v8 setDelegate:v4];
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

- (void)_playButtonAction:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39___TVCollectionView__playButtonAction___block_invoke;
  v3[3] = &unk_264BA92A8;
  v3[4] = self;
  [(_TVCollectionView *)self _performBlockWithFocusedCellIndexPath:v3];
}

- (void)_longPressAction:(id)a3
{
  if ([a3 state] == 1)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __38___TVCollectionView__longPressAction___block_invoke;
    v4[3] = &unk_264BA92A8;
    v4[4] = self;
    [(_TVCollectionView *)self _performBlockWithLongPressedCellIndexPath:v4];
  }
}

- (void)_performBlockWithFocusedCellIndexPath:(id)a3
{
  uint64_t v9 = (void (**)(id, void *))a3;
  id v4 = [(_TVCollectionView *)self window];
  char v5 = [v4 screen];
  char v6 = [v5 focusedView];

  if (v6)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v7 = [v6 superview];

      char v6 = (void *)v7;
      if (!v7) {
        goto LABEL_8;
      }
    }
    objc_super v8 = [(_TVCollectionView *)self indexPathForCell:v6];
    if (v8) {
      v9[2](v9, v8);
    }
  }
LABEL_8:
}

- (void)_performBlockWithLongPressedCellIndexPath:(id)a3
{
  char v5 = (void (**)(id, void *))a3;
  [(UILongPressGestureRecognizer *)self->_longPressRecognizer locationInView:self];
  id v4 = -[_TVCollectionView indexPathForItemAtPoint:](self, "indexPathForItemAtPoint:");
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
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37___TVCollectionView_setContentInset___block_invoke;
  v3[3] = &unk_264BA6C60;
  UIEdgeInsets v4 = a3;
  v3[4] = self;
  [(_TVCollectionView *)self _performWithoutLayoutBelow:v3];
}

- (void)layoutBelowIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_TVCollectionView;
    [(_TVCollectionView *)&v2 layoutBelowIfNeeded];
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
  objc_super v3 = [(_TVCollectionView *)self window];
  if (v3 && (double bottomPadding = self->_bottomPadding, v3, bottomPadding != 0.0))
  {
    [(_TVCollectionView *)self bounds];
    double v8 = self->_bottomPadding + v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVCollectionView;
    [(_TVCollectionView *)&v10 _visibleBounds];
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
  v14.receiver = self;
  v14.super_class = (Class)_TVCollectionView;
  [(_TVCollectionView *)&v14 _getGradientMaskBounds:a3 startInsets:a4 endInsets:a5 intensities:a6];
  [(_TVCollectionView *)self _gradientBoundsInsets];
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