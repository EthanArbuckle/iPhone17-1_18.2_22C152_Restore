@interface _UIActivityGroupViewFlowLayout
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (BOOL)shouldCancelDraggingForGesture:(id)a3;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldReverseLayoutDirection;
- (CGSize)_evaluatePreferredItemSizeForItemsAtIndexPaths:(id)a3;
- (CGSize)evaluatedContentSize;
- (CGSize)evaluatedItemSize;
- (NSArray)preparedLayoutAttributes;
- (NSArray)preparedUpdateItems;
- (NSIndexPath)indexPathForDraggedItem;
- (UIEdgeInsets)_evaluateInsetForSectionAtIndex:(int64_t)a3;
- (UIEdgeInsets)evaluatedInset;
- (UIEdgeInsets)externalSafeInset;
- (UILongPressGestureRecognizer)editingGestureRecognizer;
- (UIOffset)draggingOffset;
- (_UIActivityGroupActivityCell)draggingView;
- (double)_evaluateHorizontalItemOffsetForItemSize:(CGSize)a3 inset:(UIEdgeInsets)a4 offscreenPeekInFactor:(float)a5;
- (double)evaluatedHorizontalItemOffset;
- (id)_indexPathsForItemsInSection:(int64_t)a3;
- (id)_layoutAttributesForItemAtIndexPath:(id)a3 numberOfItemsInSection:(unint64_t)a4;
- (id)adjustLayoutAttributesForDraggingIfNeeded:(id)a3;
- (id)draggingViewForItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)indexPathForItemRecognizedByGesture:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)beginDraggingForGesture:(id)a3;
- (void)cancelDraggingForGesture:(id)a3;
- (void)finalizeCollectionViewUpdates;
- (void)handleEditingGesture:(id)a3;
- (void)invalidateGroupViewLayoutAnimated:(BOOL)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)setDraggingOffset:(UIOffset)a3;
- (void)setDraggingView:(id)a3;
- (void)setEditingGestureRecognizer:(id)a3;
- (void)setEvaluatedContentSize:(CGSize)a3;
- (void)setEvaluatedHorizontalItemOffset:(double)a3;
- (void)setEvaluatedInset:(UIEdgeInsets)a3;
- (void)setEvaluatedItemSize:(CGSize)a3;
- (void)setExternalSafeInset:(UIEdgeInsets)a3;
- (void)setIndexPathForDraggedItem:(id)a3;
- (void)setPreparedLayoutAttributes:(id)a3;
- (void)setPreparedUpdateItems:(id)a3;
- (void)updateDraggingViewForGesture:(id)a3;
@end

@implementation _UIActivityGroupViewFlowLayout

- (void)setEditingGestureRecognizer:(id)a3
{
  id v6 = a3;
  id v5 = [(_UIActivityGroupViewFlowLayout *)self editingGestureRecognizer];

  if (v5 != v6)
  {
    [(UILongPressGestureRecognizer *)self->_editingGestureRecognizer removeTarget:self action:0];
    objc_storeStrong((id *)&self->_editingGestureRecognizer, a3);
    [(UILongPressGestureRecognizer *)self->_editingGestureRecognizer addTarget:self action:sel_handleEditingGesture_];
  }
}

- (id)indexPathForItemRecognizedByGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(_UIActivityGroupViewFlowLayout *)self evaluatedInset];
  double v20 = v12 + v19;
  double v22 = v14 + v21;
  double v24 = v16 - (v19 + v23);
  double v26 = v18 - (v21 + v25);

  v43.origin.CGFloat x = v20;
  v43.origin.CGFloat y = v22;
  v43.size.CGFloat width = v24;
  v43.size.CGFloat height = v26;
  double v27 = CGRectGetWidth(v43) * 0.5;
  if (v27 <= 0.5) {
    double v28 = v27;
  }
  else {
    double v28 = 0.5;
  }
  v44.origin.CGFloat x = v20;
  v44.origin.CGFloat y = v22;
  v44.size.CGFloat width = v24;
  v44.size.CGFloat height = v26;
  double v29 = CGRectGetHeight(v44) * 0.5;
  if (v29 <= 0.5) {
    double v30 = v29;
  }
  else {
    double v30 = 0.5;
  }
  v45.origin.CGFloat x = v20;
  v45.origin.CGFloat y = v22;
  v45.size.CGFloat width = v24;
  v45.size.CGFloat height = v26;
  CGRect v46 = CGRectInset(v45, v28, v30);
  CGFloat x = v46.origin.x;
  CGFloat y = v46.origin.y;
  CGFloat width = v46.size.width;
  CGFloat height = v46.size.height;
  double v35 = fmax(v7, CGRectGetMinX(v46));
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v36 = fmin(v35, CGRectGetMaxX(v47));
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double v37 = fmax(v9, CGRectGetMinY(v48));
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  v38 = -[_UIActivityGroupViewFlowLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v36 + -0.5, fmin(v37, CGRectGetMaxY(v49)) + -0.5, 1.0, 1.0);
  v39 = [v38 firstObject];
  v40 = [v39 indexPath];

  return v40;
}

- (void)prepareLayout
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v58.receiver = self;
  v58.super_class = (Class)_UIActivityGroupViewFlowLayout;
  [(_UIActivityGroupViewFlowLayout *)&v58 prepareLayout];
  v3 = [(_UIActivityGroupViewFlowLayout *)self _indexPathsForItemsInSection:0];
  [(_UIActivityGroupViewFlowLayout *)self _evaluatePreferredItemSizeForItemsAtIndexPaths:v3];
  double v5 = v4;
  double v7 = v6;
  double v50 = *MEMORY[0x1E4FB2848];
  double v52 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v48 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v53 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  unint64_t v8 = 15;
  double v9 = 3.40282347e38;
  do
  {
    float v10 = (double)v8 / 100.0;
    -[_UIActivityGroupViewFlowLayout _evaluateInsetForSectionAtIndex:](self, "_evaluateInsetForSectionAtIndex:", 0, *(void *)&v48);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    *(float *)&double v19 = v10;
    -[_UIActivityGroupViewFlowLayout _evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:", v5, v7, v11, v13, v15, v17, v19);
    if (v20 > 0.0)
    {
      double v18 = 9.0;
      *(float *)&double v21 = (double)v8 / 100.0;
      -[_UIActivityGroupViewFlowLayout _evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:](self, "_evaluateHorizontalItemOffsetForItemSize:inset:offscreenPeekInFactor:", v5, v7, v12, 9.0, v16, 9.0, v21);
      double v14 = 9.0;
    }
    if (v20 <= v9)
    {
      if (v20 >= 8.0) {
        double v9 = v20;
      }
      else {
        double v9 = 8.0;
      }
      double v52 = v14;
      double v53 = v18;
      double v48 = v16;
      double v50 = v12;
    }
    if (v9 <= 12.0) {
      break;
    }
    BOOL v22 = v8 >= 0x2E;
    v8 += 5;
  }
  while (!v22);
  [(_UIActivityGroupViewFlowLayout *)self externalSafeInset];
  double v24 = fmax(v49 - v23, 0.0);
  [(_UIActivityGroupViewFlowLayout *)self externalSafeInset];
  double v26 = fmax(v50 - v25, 0.0);
  double v27 = v53 + v52 + (double)(unint64_t)[v3 count] * v5;
  double v51 = v27 + (double)(unint64_t)([v3 count] - 1) * v9;
  [(_UIActivityGroupViewFlowLayout *)self externalSafeInset];
  double v29 = v24;
  double v30 = v24 + v26 + v7 + v28;
  [(_UIActivityGroupViewFlowLayout *)self externalSafeInset];
  double v32 = v31 + v30;
  [(_UIActivityGroupViewFlowLayout *)self setEvaluatedHorizontalItemOffset:v9];
  -[_UIActivityGroupViewFlowLayout setEvaluatedInset:](self, "setEvaluatedInset:", v26, v52, v29, v53);
  -[_UIActivityGroupViewFlowLayout setEvaluatedItemSize:](self, "setEvaluatedItemSize:", v5, v7);
  [(_UIActivityGroupViewFlowLayout *)self evaluatedContentSize];
  double v34 = v33;
  double v36 = v35;
  -[_UIActivityGroupViewFlowLayout setEvaluatedContentSize:](self, "setEvaluatedContentSize:", v51, v32);
  double v37 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v38 = v3;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v55 != v41) {
          objc_enumerationMutation(v38);
        }
        CGRect v43 = -[_UIActivityGroupViewFlowLayout _layoutAttributesForItemAtIndexPath:numberOfItemsInSection:](self, "_layoutAttributesForItemAtIndexPath:numberOfItemsInSection:", *(void *)(*((void *)&v54 + 1) + 8 * i), [v38 count]);
        if (v43) {
          [v37 addObject:v43];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v40);
  }

  [(_UIActivityGroupViewFlowLayout *)self setPreparedLayoutAttributes:v37];
  if ([(_UIActivityGroupViewFlowLayout *)self shouldReverseLayoutDirection])
  {
    CGRect v44 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
    [v44 frame];
    CGRectGetWidth(v61);
    [v44 contentInset];
    objc_msgSend(v44, "setContentInset:");
    if (v34 != v51 || v36 != v32)
    {
      [v44 frame];
      double v47 = v51 - v46;
      [v44 contentOffset];
      [v44 setContentOffset:v47];
    }
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = CGRectGetHeight(a3);
  [(_UIActivityGroupViewFlowLayout *)self collectionViewContentSize];
  if (v8 != v9) {
    return 1;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v14);
  double v11 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  [v11 bounds];
  BOOL v12 = v10 != CGRectGetWidth(v15);

  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [MEMORY[0x1E4F1CA48] array];
  double v9 = [(_UIActivityGroupViewFlowLayout *)self preparedLayoutAttributes];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68___UIActivityGroupViewFlowLayout_layoutAttributesForElementsInRect___block_invoke;
  v14[3] = &unk_1E5A23868;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  v14[4] = self;
  id v10 = v8;
  id v15 = v10;
  [v9 enumerateObjectsUsingBlock:v14];

  double v11 = v15;
  id v12 = v10;

  return v12;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIActivityGroupViewFlowLayout *)self preparedLayoutAttributes];
  uint64_t v6 = [v4 item];

  double v7 = [v5 objectAtIndexedSubscript:v6];

  id v8 = [(_UIActivityGroupViewFlowLayout *)self adjustLayoutAttributesForDraggingIfNeeded:v7];
  return v7;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIActivityGroupViewFlowLayout;
  double v5 = [(_UIActivityGroupViewFlowLayout *)&v21 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(_UIActivityGroupViewFlowLayout *)self preparedUpdateItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (![v11 updateAction])
        {
          id v12 = [v11 indexPathAfterUpdate];
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            [v5 setAlpha:0.0];
            CGAffineTransformMakeScale(&v16, 0.1, 0.1);
            CGAffineTransform v15 = v16;
            [v5 setTransform:&v15];

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  [v5 setAlpha:1.0];
LABEL_12:

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIActivityGroupViewFlowLayout;
  double v5 = [(_UIActivityGroupViewFlowLayout *)&v21 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [(_UIActivityGroupViewFlowLayout *)self preparedUpdateItems];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 updateAction] == 1)
        {
          id v12 = [v11 indexPathBeforeUpdate];
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            [v5 setAlpha:0.0];
            CGAffineTransformMakeScale(&v16, 0.1, 0.1);
            CGAffineTransform v15 = v16;
            [v5 setTransform:&v15];

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  [v5 setAlpha:1.0];
LABEL_12:

  return v5;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIActivityGroupViewFlowLayout;
  id v4 = a3;
  [(_UIActivityGroupViewFlowLayout *)&v5 prepareForCollectionViewUpdates:v4];
  -[_UIActivityGroupViewFlowLayout setPreparedUpdateItems:](self, "setPreparedUpdateItems:", v4, v5.receiver, v5.super_class);
}

- (void)finalizeCollectionViewUpdates
{
  [(_UIActivityGroupViewFlowLayout *)self setPreparedUpdateItems:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityGroupViewFlowLayout;
  [(_UIActivityGroupViewFlowLayout *)&v3 finalizeCollectionViewUpdates];
}

- (CGSize)_evaluatePreferredItemSizeForItemsAtIndexPaths:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  uint64_t v6 = [v5 delegate];
  uint64_t v18 = 0;
  long long v19 = (double *)&v18;
  uint64_t v20 = 0x3010000000;
  objc_super v21 = "";
  long long v22 = *MEMORY[0x1E4F1DB30];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81___UIActivityGroupViewFlowLayout__evaluatePreferredItemSizeForItemsAtIndexPaths___block_invoke;
  v13[3] = &unk_1E5A23890;
  id v7 = v6;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  CGAffineTransform v16 = self;
  long long v17 = &v18;
  [v4 enumerateObjectsUsingBlock:v13];
  double v9 = v19[4];
  double v10 = v19[5];

  _Block_object_dispose(&v18, 8);
  double v11 = v9;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

- (UIEdgeInsets)_evaluateInsetForSectionAtIndex:(int64_t)a3
{
  objc_super v3 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 verticalSizeClass];

  double v6 = 7.0;
  if (v5 != 1) {
    double v6 = 19.0;
  }
  double v7 = 14.0;
  if (v5 != 1) {
    double v7 = 19.0;
  }
  double v8 = 2.0;
  double v9 = 2.0;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (id)_indexPathsForItemsInSection:(int64_t)a3
{
  id v4 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  if ([v4 numberOfSections] <= a3)
  {
    double v6 = 0;
  }
  else
  {
    uint64_t v5 = [v4 numberOfItemsInSection:a3];
    double v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v8 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:a3];
        [v6 addObject:v8];
      }
    }
  }

  return v6;
}

- (double)_evaluateHorizontalItemOffsetForItemSize:(CGSize)a3 inset:(UIEdgeInsets)a4 offscreenPeekInFactor:(float)a5
{
  double left = a4.left;
  double width = a3.width;
  double v8 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  [v8 frame];
  double v9 = CGRectGetWidth(v13);

  double v10 = v9 - width * a5 - left;
  unint64_t v11 = vcvtmd_u64_f64(v10 / width);
  if (v11) {
    return floor((v10 - (double)v11 * width) / (double)v11);
  }
  else {
    return 0.0;
  }
}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3 numberOfItemsInSection:(unint64_t)a4
{
  double v6 = (void *)MEMORY[0x1E4FB15E0];
  id v7 = a3;
  double v8 = [v6 layoutAttributesForCellWithIndexPath:v7];
  uint64_t v9 = [v7 item];

  if ([(_UIActivityGroupViewFlowLayout *)self shouldReverseLayoutDirection]) {
    int64_t v10 = ~v9 + a4;
  }
  else {
    int64_t v10 = v9;
  }
  [(_UIActivityGroupViewFlowLayout *)self evaluatedItemSize];
  double v12 = v11;
  double v14 = v13;
  [(_UIActivityGroupViewFlowLayout *)self evaluatedHorizontalItemOffset];
  double v16 = v12 * 0.5 + v12 * (double)v10 + v15 * (double)v10;
  [(_UIActivityGroupViewFlowLayout *)self evaluatedInset];
  double v18 = v17 + v16;
  [(_UIActivityGroupViewFlowLayout *)self evaluatedInset];
  double v20 = v14 * 0.5 + v19;
  objc_msgSend(v8, "setSize:", v12, v14);
  objc_msgSend(v8, "setCenter:", v18, v20);
  return v8;
}

- (id)adjustLayoutAttributesForDraggingIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIActivityGroupViewFlowLayout *)self indexPathForDraggedItem];
  double v6 = [v4 indexPath];
  int v7 = [v5 isEqual:v6];

  if (v7) {
    [v4 setHidden:1];
  }
  return v4;
}

- (void)handleEditingGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    uint64_t v5 = [(_UIActivityGroupViewFlowLayout *)self indexPathForItemRecognizedByGesture:v4];
    if (v5)
    {
      double v6 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
      [v4 locationInView:v6];
      double v8 = v7;
      double v10 = v9;

      double v11 = [(_UIActivityGroupViewFlowLayout *)self layoutAttributesForItemAtIndexPath:v5];
      [v11 center];
      double v13 = v12;
      double v15 = v14;

      -[_UIActivityGroupViewFlowLayout setDraggingOffset:](self, "setDraggingOffset:", v8 - v13, v10 - v15);
      [(_UIActivityGroupViewFlowLayout *)self setIndexPathForDraggedItem:v5];
      [(_UIActivityGroupViewFlowLayout *)self beginDraggingForGesture:v4];
    }
    else
    {
      [(_UIActivityGroupViewFlowLayout *)self setIndexPathForDraggedItem:0];
    }
  }
  if ([v4 state] == 2)
  {
    id v16 = [(_UIActivityGroupViewFlowLayout *)self indexPathForItemRecognizedByGesture:v4];
    double v17 = [(_UIActivityGroupViewFlowLayout *)self indexPathForDraggedItem];
    if (([v17 isEqual:v16] & 1) == 0)
    {
      double v18 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
      double v19 = [v18 delegate];
      double v20 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
      objc_super v21 = [v19 collectionView:v20 layout:self moveItemAtIndexPath:v17 toIndexPath:v16];

      if (v21)
      {
        long long v22 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __55___UIActivityGroupViewFlowLayout_handleEditingGesture___block_invoke;
        v23[3] = &unk_1E5A21A28;
        v23[4] = self;
        id v24 = v17;
        id v16 = v21;
        id v25 = v16;
        [v22 performBatchUpdates:v23 completion:&__block_literal_global_48];
      }
      else
      {
        id v16 = 0;
      }
    }
    [(_UIActivityGroupViewFlowLayout *)self updateDraggingViewForGesture:v4];
    if ([(_UIActivityGroupViewFlowLayout *)self shouldCancelDraggingForGesture:v4]) {
      [v4 setState:4];
    }
  }
  if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4) {
    [(_UIActivityGroupViewFlowLayout *)self cancelDraggingForGesture:v4];
  }
}

- (void)invalidateGroupViewLayoutAnimated:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68___UIActivityGroupViewFlowLayout_invalidateGroupViewLayoutAnimated___block_invoke;
    v5[3] = &unk_1E5A21900;
    v5[4] = self;
    [v4 performBatchUpdates:v5 completion:0];
  }
  else
  {
    [(_UIActivityGroupViewFlowLayout *)self invalidateLayout];
  }
}

- (BOOL)shouldReverseLayoutDirection
{
  objc_super v3 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  if ([v3 _shouldReverseLayoutDirection]) {
    int v4 = [(_UIActivityGroupViewFlowLayout *)self _wantsRightToLeftHorizontalMirroringIfNeeded] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)draggingViewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  double v6 = [v5 delegate];
  double v7 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  double v8 = [v6 collectionView:v7 layout:self needsContainerViewForDraggingItemAtIndexPath:v4];

  double v9 = [v5 cellForItemAtIndexPath:v4];

  [v9 bounds];
  objc_msgSend(v9, "convertRect:toView:", v8);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v18 = [v9 draggingView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
  [v8 addSubview:v18];

  return v18;
}

- (void)beginDraggingForGesture:(id)a3
{
  id v4 = [(_UIActivityGroupViewFlowLayout *)self indexPathForDraggedItem];
  uint64_t v5 = [(_UIActivityGroupViewFlowLayout *)self draggingViewForItemAtIndexPath:v4];
  [(_UIActivityGroupViewFlowLayout *)self setDraggingView:v5];

  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58___UIActivityGroupViewFlowLayout_beginDraggingForGesture___block_invoke;
  v8[3] = &unk_1E5A21900;
  id v9 = v5;
  id v7 = v5;
  [v6 animateWithDuration:132 delay:v8 options:&__block_literal_global_18_0 animations:0.3 completion:0.0];
  [(_UIActivityGroupViewFlowLayout *)self invalidateGroupViewLayoutAnimated:0];
}

- (void)updateDraggingViewForGesture:(id)a3
{
  id v4 = [(_UIActivityGroupViewFlowLayout *)self draggingView];
  id v16 = [v4 superview];

  uint64_t v5 = [(_UIActivityGroupViewFlowLayout *)self editingGestureRecognizer];
  [v5 locationInView:v16];
  double v7 = v6;
  double v9 = v8;

  [(_UIActivityGroupViewFlowLayout *)self draggingOffset];
  double v11 = v7 - v10;
  [(_UIActivityGroupViewFlowLayout *)self draggingOffset];
  double v13 = v9 - v12;
  double v14 = [(_UIActivityGroupViewFlowLayout *)self draggingView];
  objc_msgSend(v14, "setCenter:", v11, v13);

  double v15 = [(_UIActivityGroupViewFlowLayout *)self draggingView];
  [v15 setMaskView:0];
}

- (BOOL)shouldCancelDraggingForGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v25.origin.CGFloat x = v7;
  v25.origin.CGFloat y = v9;
  v25.size.CGFloat width = v11;
  v25.size.CGFloat height = v13;
  CGRect v26 = CGRectInset(v25, -120.0, -120.0);
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  double v18 = [(_UIActivityGroupViewFlowLayout *)self collectionView];
  [v4 locationInView:v18];
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  v24.CGFloat x = v20;
  v24.CGFloat y = v22;
  return !CGRectContainsPoint(v27, v24);
}

- (void)cancelDraggingForGesture:(id)a3
{
  id v4 = [(_UIActivityGroupViewFlowLayout *)self draggingView];
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke;
    v13[3] = &unk_1E5A215A0;
    id v14 = v4;
    double v15 = self;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    CGFloat v9 = __59___UIActivityGroupViewFlowLayout_cancelDraggingForGesture___block_invoke_2;
    double v10 = &unk_1E5A22A70;
    CGFloat v11 = self;
    id v12 = v14;
    [v6 animateWithDuration:132 delay:v13 options:&v7 animations:0.3 completion:0.0];
    -[_UIActivityGroupViewFlowLayout setDraggingView:](self, "setDraggingView:", 0, v7, v8, v9, v10, v11);
  }
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return [(_UIActivityGroupViewFlowLayout *)self _wantsRightToLeftHorizontalMirroringIfNeeded] ^ 1;
}

- (UILongPressGestureRecognizer)editingGestureRecognizer
{
  return self->_editingGestureRecognizer;
}

- (NSIndexPath)indexPathForDraggedItem
{
  return self->_indexPathForDraggedItem;
}

- (void)setIndexPathForDraggedItem:(id)a3
{
}

- (UIEdgeInsets)externalSafeInset
{
  double top = self->_externalSafeInset.top;
  double left = self->_externalSafeInset.left;
  double bottom = self->_externalSafeInset.bottom;
  double right = self->_externalSafeInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setExternalSafeInset:(UIEdgeInsets)a3
{
  self->_externalSafeInset = a3;
}

- (UIEdgeInsets)evaluatedInset
{
  double top = self->_evaluatedInset.top;
  double left = self->_evaluatedInset.left;
  double bottom = self->_evaluatedInset.bottom;
  double right = self->_evaluatedInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEvaluatedInset:(UIEdgeInsets)a3
{
  self->_evaluatedInset = a3;
}

- (CGSize)evaluatedItemSize
{
  double width = self->_evaluatedItemSize.width;
  double height = self->_evaluatedItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEvaluatedItemSize:(CGSize)a3
{
  self->_evaluatedItemSize = a3;
}

- (CGSize)evaluatedContentSize
{
  double width = self->_evaluatedContentSize.width;
  double height = self->_evaluatedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEvaluatedContentSize:(CGSize)a3
{
  self->_evaluatedContentSize = a3;
}

- (double)evaluatedHorizontalItemOffset
{
  return self->_evaluatedHorizontalItemOffset;
}

- (void)setEvaluatedHorizontalItemOffset:(double)a3
{
  self->_evaluatedHorizontalItemOffset = a3;
}

- (NSArray)preparedLayoutAttributes
{
  return self->_preparedLayoutAttributes;
}

- (void)setPreparedLayoutAttributes:(id)a3
{
}

- (NSArray)preparedUpdateItems
{
  return self->_preparedUpdateItems;
}

- (void)setPreparedUpdateItems:(id)a3
{
}

- (UIOffset)draggingOffset
{
  double horizontal = self->_draggingOffset.horizontal;
  double vertical = self->_draggingOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setDraggingOffset:(UIOffset)a3
{
  self->_draggingOffset = a3;
}

- (_UIActivityGroupActivityCell)draggingView
{
  return self->_draggingView;
}

- (void)setDraggingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggingView, 0);
  objc_storeStrong((id *)&self->_preparedUpdateItems, 0);
  objc_storeStrong((id *)&self->_preparedLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_indexPathForDraggedItem, 0);
  objc_storeStrong((id *)&self->_editingGestureRecognizer, 0);
}

@end