@interface _TVShelfView
- (CGRect)tv_augmentedSelectionFrameForFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4;
- (UIEdgeInsets)_selectionMarginsForCell:(id)a3;
- (UIEdgeInsets)selectionMarginsForCellAtIndexPath:(id)a3;
- (_TVShelfView)init;
- (_TVShelfView)initWithCoder:(id)a3;
- (_TVShelfView)initWithFrame:(CGRect)a3;
- (_TVShelfView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (_TVShelfView)initWithFrame:(CGRect)a3 shelfViewLayout:(id)a4;
- (void)_updateLayoutForFocusedView:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setShelfFlowLayout:(id)a3;
- (void)updateLayoutForFocusedView:(id)a3;
@end

@implementation _TVShelfView

- (_TVShelfView)initWithFrame:(CGRect)a3 shelfViewLayout:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_TVShelfView;
  v4 = -[_TVCollectionView initWithFrame:collectionViewLayout:](&v7, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4) {
    commonInit(v4);
  }
  return v5;
}

- (_TVShelfView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVShelfView;
  v3 = [(_TVShelfView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    commonInit(v3);
  }
  return v4;
}

- (_TVShelfView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return 0;
}

- (_TVShelfView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_alloc_init(_TVShelfViewLayout);
  v9 = -[_TVShelfView initWithFrame:shelfViewLayout:](self, "initWithFrame:shelfViewLayout:", v8, x, y, width, height);

  return v9;
}

- (_TVShelfView)init
{
  return -[_TVShelfView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_TVShelfView *)self contentInset];
  -[_TVShelfView tv_sizeThatFits:withContentInset:](self, "tv_sizeThatFits:withContentInset:", width, height, v6, v7, v8, v9);
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)tv_sizeThatFits:(CGSize)a3 withContentInset:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  double top = a4.top;
  CGFloat width = a3.width;
  double v7 = [(_TVShelfView *)self collectionViewLayout];
  [v7 computedContentHeight];
  double v9 = bottom + top + v8;

  double v10 = width;
  double v11 = v9;
  result.double height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)_updateLayoutForFocusedView:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v38 = v6;
  if ([v6 isDescendantOfView:self])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    double v8 = [(_TVShelfView *)self indexPathsForVisibleItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v14 = [(_TVShelfView *)self cellForItemAtIndexPath:v13];
          if ([v6 isDescendantOfView:v14])
          {
            id v15 = v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_13:
  }
  else
  {
    id v15 = 0;
  }
  v16 = objc_alloc_init(TVShelfViewLayoutInvalidationContext);
  [(TVShelfViewLayoutInvalidationContext *)v16 setInvalidateVerticalBumps:1];
  v37 = v15;
  [(TVShelfViewLayoutInvalidationContext *)v16 setFocusedItemIndexPath:v15];
  v17 = [(_TVShelfView *)self collectionViewLayout];
  v36 = v16;
  [v17 invalidateLayoutWithContext:v16];

  v18 = [(_TVShelfView *)self indexPathsForVisibleSupplementaryElementsOfKind:@"TVShelfLayoutElementKindHeader"];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v42 + 1) + 8 * j);
        v24 = [(_TVShelfView *)self supplementaryViewForElementKind:@"TVShelfLayoutElementKindHeader" atIndexPath:v23];
        v25 = [(_TVShelfView *)self collectionViewLayout];
        v26 = [v25 layoutAttributesForSupplementaryViewOfKind:@"TVShelfLayoutElementKindHeader" atIndexPath:v23];

        [v24 frame];
        double v28 = v27;
        [v26 frame];
        if (v28 != v29)
        {
          [v24 frame];
          if (v7)
          {
            double v32 = v31;
            [v26 frame];
            BOOL v34 = v32 < v33;
            v39[0] = MEMORY[0x263EF8330];
            v39[1] = 3221225472;
            v39[2] = __69___TVShelfView__updateLayoutForFocusedView_withAnimationCoordinator___block_invoke;
            v39[3] = &unk_264BA64A0;
            id v40 = v24;
            id v41 = v26;
            [v7 addCoordinatedAnimationsForAnimation:v34 animations:v39 completion:0];
          }
          else
          {
            double v35 = v30;
            [v26 frame];
            [v24 setFrame:v35];
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v20);
  }
}

- (CGRect)tv_augmentedSelectionFrameForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(_TVShelfView *)self indexPathsForVisibleSupplementaryElementsOfKind:@"TVShelfLayoutElementKindHeader"];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(_TVShelfView *)self shelfFlowLayout];
    objc_msgSend(v10, "boundingSelectionFrameForFrame:", x, y, width, height);
    double x = v11;
    double y = v12;
    double width = v13;
    double height = v14;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)updateLayoutForFocusedView:(id)a3
{
}

- (UIEdgeInsets)selectionMarginsForCellAtIndexPath:(id)a3
{
  v4 = [(_TVShelfView *)self cellForItemAtIndexPath:a3];
  if (v4)
  {
    [(_TVShelfView *)self _selectionMarginsForCell:v4];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x263F1D1C0];
    double v8 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v10 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v12 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.double bottom = v15;
  result.left = v14;
  result.double top = v13;
  return result;
}

- (UIEdgeInsets)_selectionMarginsForCell:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_26E5AEAA8])
  {
    objc_msgSend(v3, "selectionMarginsForSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x263F1D1C0];
    double v7 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v9 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v11 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.double bottom = v14;
  result.left = v13;
  result.double top = v12;
  return result;
}

- (void)setShelfFlowLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end