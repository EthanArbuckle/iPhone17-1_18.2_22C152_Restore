@interface _TVCollectionViewLockupCell
- (BOOL)_descendantsShouldHighlight;
- (BOOL)_isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster;
- (BOOL)_tvAllowsFocusInChildrenWhenFocused;
- (TVCollectionViewLockupCellDelegate)delegate;
- (UIEdgeInsets)_additionalFocusableContentInsets;
- (UIEdgeInsets)_focusableContentMargins;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (_TVCollectionViewLockupCell)initWithFrame:(CGRect)a3;
- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4;
- (id)_selectingView;
- (id)focusItemsInRect:(CGRect)a3;
- (id)layeredImageContainerLayer;
- (id)selectingView;
- (void)_handleSelect;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation _TVCollectionViewLockupCell

- (_TVCollectionViewLockupCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVCollectionViewLockupCell;
  v3 = -[TVContainerCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v3 action:sel__handleSelect];
    [v4 setAllowedPressTypes:&unk_26E59EAD0];
    [v4 setCancelsTouchesInView:0];
    [(_TVCollectionViewLockupCell *)v3 addGestureRecognizer:v4];
  }
  return v3;
}

- (id)selectingView
{
  return self->__selectingView;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    self->_delegateFlags.respondsToDidUnfocus = objc_opt_respondsToSelector() & 1;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateFlags->respondsToDidSelect = objc_opt_respondsToSelector() & 1;

    id v9 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateFlags->respondsToLayeredImageContainerLayerWithinCollectionViewCell = objc_opt_respondsToSelector() & 1;
  }
}

- (BOOL)_isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster
{
  v3 = [MEMORY[0x263F1C650] focusSystemForEnvironment:self];
  v4 = [v3 focusedItem];
  if (v4
    && ([(_TVCollectionViewLockupCell *)self _selectingView],
        v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    if (v4 == self)
    {
      char v9 = 1;
    }
    else
    {
      v7 = (void *)MEMORY[0x263F1C650];
      id v8 = [(_TVCollectionViewLockupCell *)self _selectingView];
      char v9 = [v7 environment:v8 containsEnvironment:v4];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(_TVCollectionViewLockupCell *)self _isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster])
  {
    id v8 = [(_TVCollectionViewLockupCell *)self _selectingView];
    char v9 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = objc_msgSend(v8, "preferredFocusEnvironments", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_TVCollectionViewLockupCell;
    char v9 = -[_TVCollectionViewLockupCell focusItemsInRect:](&v21, sel_focusItemsInRect_, x, y, width, height);
  }
  return v9;
}

- (UIEdgeInsets)_additionalFocusableContentInsets
{
  if (![(_TVCollectionViewLockupCell *)self _isFocusedOrParentOfFocusedHierarchyAndSelectingViewIsPoster])goto LABEL_6; {
  long long v27 = 0u;
  }
  long long v28 = 0u;
  long long v26 = 0u;
  v3 = [(_TVCollectionViewLockupCell *)self _selectingView];
  v4 = v3;
  if (v3)
  {
    [v3 cellMetrics];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
  }

  [(_TVCollectionViewLockupCell *)self bounds];
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double v9 = v29.origin.x + *((double *)&v27 + 1);
  double v10 = v29.origin.y + *(double *)&v27;
  v39.origin.CGFloat x = v29.origin.x + *((double *)&v27 + 1);
  v39.origin.CGFloat y = v29.origin.y + *(double *)&v27;
  v39.size.CGFloat width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
  v39.size.CGFloat height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
  if (!CGRectEqualToRect(v29, v39))
  {
    v30.origin.CGFloat x = v9;
    v30.origin.CGFloat y = v10;
    v30.size.CGFloat width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v30.size.CGFloat height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    CGFloat MinY = CGRectGetMinY(v30);
    v31.size.CGFloat height = height;
    CGFloat rect = height;
    double v16 = MinY;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    double v24 = v16 - CGRectGetMinY(v31);
    v32.origin.CGFloat x = v9;
    v32.origin.CGFloat y = v10;
    v32.size.CGFloat width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v32.size.CGFloat height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    double MinX = CGRectGetMinX(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = rect;
    CGFloat v17 = CGRectGetMinX(v33);
    v34.size.CGFloat width = width;
    CGFloat v23 = width;
    double v12 = MinX - v17;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat height = rect;
    double MaxY = CGRectGetMaxY(v34);
    v35.origin.CGFloat x = v9;
    v35.origin.CGFloat y = v10;
    v35.size.CGFloat width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v35.size.CGFloat height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    double v14 = MaxY - CGRectGetMaxY(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = v23;
    v36.size.CGFloat height = rect;
    double MaxX = CGRectGetMaxX(v36);
    v37.origin.CGFloat x = v9;
    v37.origin.CGFloat y = v10;
    v37.size.CGFloat width = *(double *)&v26 - (*((double *)&v27 + 1) + *((double *)&v28 + 1));
    v37.size.CGFloat height = *((double *)&v26 + 1) - (*(double *)&v27 + *(double *)&v28);
    double v13 = MaxX - CGRectGetMaxX(v37);
    double v11 = v24;
  }
  else
  {
LABEL_6:
    double v11 = *MEMORY[0x263F1D1C0];
    double v12 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v14 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v13 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  double v20 = v12;
  double v21 = v14;
  result.right = v13;
  result.bottom = v21;
  result.left = v20;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)_focusableContentMargins
{
  v7.receiver = self;
  v7.super_class = (Class)_TVCollectionViewLockupCell;
  [(_TVCollectionViewLockupCell *)&v7 _focusableContentMargins];
  [(_TVCollectionViewLockupCell *)self _additionalFocusableContentInsets];
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)_tvAllowsFocusInChildrenWhenFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_TVCollectionViewLockupCell;
  [(TVContainerCollectionViewCell *)&v17 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
  id v8 = [v6 nextFocusedView];
  if (v8 == self)
  {
    objc_initWeak(&location, self);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    double v13 = __80___TVCollectionViewLockupCell_didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
    double v14 = &unk_264BA6A38;
    objc_copyWeak(&v15, &location);
    [v7 addCoordinatedFocusingAnimations:0 completion:&v11];
    double v10 = [(_TVCollectionViewLockupCell *)self superview];
    [v10 bringSubviewToFront:self];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (self->_delegateFlags.respondsToDidUnfocus)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained collectionViewCellDidUnfocus:self];
  }
}

- (void)prepareForReuse
{
  v15.receiver = self;
  v15.super_class = (Class)_TVCollectionViewLockupCell;
  [(TVContainerCollectionViewCell *)&v15 prepareForReuse];
  double v3 = [(_TVCollectionViewLockupCell *)self contentView];
  +[TVMLUtilities disassociateIKViewElementsRecursivelyFromView:v3];

  double v4 = [(_TVCollectionViewLockupCell *)self _selectingView];
  double v5 = v4;
  if (v4)
  {
    id v6 = (void *)MEMORY[0x263EFF980];
    id v7 = [v4 layer];
    id v8 = [v6 arrayWithObject:v7];

    if ([v8 count])
    {
      uint64_t v9 = MEMORY[0x263EFFA68];
      do
      {
        double v10 = [v8 objectAtIndex:0];
        [v8 removeObject:v10];
        [v10 clearHasBeenCommitted];
        [v10 removeAllAnimations];
        uint64_t v11 = [v10 sublayers];
        uint64_t v12 = (void *)v11;
        if (v11) {
          uint64_t v13 = v11;
        }
        else {
          uint64_t v13 = v9;
        }
        [v8 addObjectsFromArray:v13];
      }
      while ([v8 count]);
    }
  }
  selectingView = self->__selectingView;
  self->__selectingView = 0;
}

- (id)layeredImageContainerLayer
{
  if (self->_delegateFlags.respondsToLayeredImageContainerLayerWithinCollectionViewCell)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v4 = [WeakRetained layeredImageContainerLayerWithinCollectionViewCell:self];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (id)_preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = [(_TVCollectionViewLockupCell *)self _selectingView];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
LABEL_3:
    double v10 = (void *)v9;
    goto LABEL_6;
  }
  uint64_t v11 = [(_TVCollectionViewLockupCell *)self layeredImageContainerLayer];

  if (!v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)_TVCollectionViewLockupCell;
    uint64_t v9 = [(TVContainerCollectionViewCell *)&v15 _preferredConfigurationForFocusAnimation:a3 inContext:v6];
    goto LABEL_3;
  }
  uint64_t v12 = [(_TVCollectionViewLockupCell *)self layeredImageContainerLayer];
  uint64_t v13 = [v12 configuration];
  double v10 = [v13 focusAnimationConfiguration];

LABEL_6:
  return v10;
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(_TVCollectionViewLockupCell *)self _selectingView];
  objc_msgSend(v5, "selectionMarginsForSize:", width, height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (id)_selectingView
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  p_selectingView = &self->__selectingView;
  if (!self->__selectingView)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v3 = [(_TVCollectionViewLockupCell *)self contentView];
    double v4 = [v3 subviews];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v9 conformsToProtocol:&unk_26E5AEAA8])
          {
            objc_storeStrong((id *)p_selectingView, v9);
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  double v10 = *p_selectingView;
  return v10;
}

- (void)_handleSelect
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_delegateFlags.respondsToDidSelect)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained collectionViewCellDidSelect:self];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v3 = [(_TVCollectionViewLockupCell *)self contentView];
    double v4 = [v3 subviews];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v9 didSelect];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)_TVCollectionViewLockupCell;
  -[UIView setHighlighted:](&v16, sel_setHighlighted_);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(_TVCollectionViewLockupCell *)self contentView];
  uint64_t v6 = [v5 subviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 setHighlighted:v3];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }
}

- (TVCollectionViewLockupCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVCollectionViewLockupCellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__selectingView, 0);
}

@end