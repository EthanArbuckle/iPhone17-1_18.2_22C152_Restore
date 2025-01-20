@interface PXGZoomLayout
- (CGPoint)anchorViewportCenter;
- (CGRect)sublayout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4;
- (NSArray)layers;
- (PXGLayout)primaryLayer;
- (PXGZoomLayout)init;
- (UIEdgeInsets)padding;
- (id)anchorObjectReference;
- (id)axSpriteIndexes;
- (int64_t)itemForSpriteIndex:(unsigned int)a3;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_configureSublayouts;
- (void)_updateSublayoutGeometries;
- (void)didChangeSublayoutOrigins;
- (void)displayScaleDidChange;
- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)scrollSpeedRegimeDidChange;
- (void)setAnchorObjectReference:(id)a3;
- (void)setAnchorViewportCenter:(CGPoint)a3;
- (void)setLayers:(id)a3 primaryLayer:(id)a4;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)sublayoutDidChangeContentSize:(id)a3;
- (void)sublayoutDidChangeLastBaseline:(id)a3;
- (void)sublayoutNeedsUpdate:(id)a3;
- (void)update;
- (void)userInterfaceDirectionDidChange;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
@end

@implementation PXGZoomLayout

void *__43__PXGZoomLayout__updateSublayoutGeometries__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  result = *a4;
  if (*a4)
  {
    result = (void *)[result contentSize];
    uint64_t v7 = *(void *)(a1 + 48);
    *(_OWORD *)(a3 + 48) = *(_OWORD *)(a1 + 32);
    *(void *)(a3 + 64) = v7;
    *(void *)(a3 + 32) = v8;
    *(void *)(a3 + 40) = v9;
  }
  return result;
}

- (id)axSpriteIndexes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v2;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  *a5 = a3;
  v6 = [(PXGZoomLayout *)self primaryLayer];

  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v7 = [(PXGLayout *)self sublayoutDataStore];
  uint64_t v8 = [(PXGZoomLayout *)self primaryLayer];
  int64_t v9 = [v7 indexOfSublayout:v8];

  return v9;
}

- (void)_updateSublayoutGeometries
{
  self->_isUpdatingSublayouts = 1;
  [(PXGZoomLayout *)self padding];
  double v57 = v3;
  double v58 = v4;
  double v5 = v4;
  double v56 = v6;
  double v8 = v7;
  [(PXGLayout *)self referenceSize];
  uint64_t v54 = v9;
  double v11 = v10 - (v5 + v8);
  double v55 = v11;
  [(PXGLayout *)self referenceDepth];
  uint64_t v53 = v12;
  v13 = [(PXGLayout *)self viewEnvironment];
  [(PXGLayout *)self safeAreaInsets];
  uint64_t v51 = v15;
  uint64_t v52 = v14;
  uint64_t v49 = v17;
  uint64_t v50 = v16;
  [(PXGLayout *)self displayScale];
  uint64_t v48 = v18;
  [(PXGLayout *)self visibleRect];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  [(PXGLayout *)self lastScrollDirection];
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  int64_t v31 = [(PXGLayout *)self scrollSpeedRegime];
  unint64_t v32 = [(PXGLayout *)self userInterfaceDirection];
  v33 = [(PXGLayout *)self sublayoutDataStore];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __43__PXGZoomLayout__updateSublayoutGeometries__block_invoke;
  v60[3] = &unk_1E5DD1680;
  id v61 = v13;
  double v62 = v11;
  uint64_t v63 = v54;
  uint64_t v64 = v53;
  uint64_t v65 = v20;
  uint64_t v66 = v22;
  uint64_t v67 = v24;
  uint64_t v68 = v26;
  uint64_t v69 = v48;
  int64_t v70 = v31;
  uint64_t v71 = v28;
  uint64_t v72 = v30;
  uint64_t v73 = v52;
  uint64_t v74 = v51;
  uint64_t v75 = v50;
  uint64_t v76 = v49;
  unint64_t v77 = v32;
  id v34 = v13;
  [v33 enumerateSublayoutsUsingBlock:v60];

  v35 = [(PXGZoomLayout *)self primaryLayer];
  [v35 visibleRect];
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  [v35 contentSize];
  double v45 = v56 + v57 + v44;
  v46 = [(PXGLayout *)self sublayoutDataStore];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __43__PXGZoomLayout__updateSublayoutGeometries__block_invoke_2;
  v59[3] = &__block_descriptor_56_e93_v40__0q8_____CGSize_dd_dS_CGSize_dd____ddd_____CGAffineTransform_dddddd_d_d_16_____v_v_24_B32l;
  *(double *)&v59[4] = v58;
  *(double *)&v59[5] = v57;
  v59[6] = 0;
  [v46 enumerateSublayoutGeometriesUsingBlock:v59];

  -[PXGLayout setContentSize:](self, "setContentSize:", v55, v45);
  [v35 lastBaseline];
  [(PXGLayout *)self setLastBaseline:v57 + v47];
  -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:", v37, v39, v41, v43);
  self->_isUpdatingSublayouts = 0;
}

- (int64_t)scrollableAxis
{
  id v2 = [(PXGZoomLayout *)self primaryLayer];
  int64_t v3 = [v2 scrollableAxis];

  return v3;
}

- (PXGLayout)primaryLayer
{
  return self->_primaryLayer;
}

- (CGRect)sublayout:(id)a3 visibleRectForRequestedVisibleRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  [v9 visibleRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = [(PXGZoomLayout *)self primaryLayer];
  int v19 = [v9 isDescendantOfLayout:v18];

  if (v19) {
    double v20 = height;
  }
  else {
    double v20 = v17;
  }
  if (v19) {
    double v21 = width;
  }
  else {
    double v21 = v15;
  }
  if (v19) {
    double v22 = y;
  }
  else {
    double v22 = v13;
  }
  if (v19) {
    double v23 = x;
  }
  else {
    double v23 = v11;
  }
  result.size.double height = v20;
  result.size.double width = v21;
  result.origin.double y = v22;
  result.origin.double x = v23;
  return result;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)visibleRectDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 visibleRectDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout visibleRectDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 215, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v10 sublayoutDidChangeContentSize:v4];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        id v9 = [NSString stringWithUTF8String:"-[PXGZoomLayout sublayoutDidChangeContentSize:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGZoomLayout.m", 257, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v10 sublayoutDidChangeLastBaseline:v4];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        id v9 = [NSString stringWithUTF8String:"-[PXGZoomLayout sublayoutDidChangeLastBaseline:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGZoomLayout.m", 264, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

void __43__PXGZoomLayout__updateSublayoutGeometries__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = a3;
  [v8 setViewEnvironment:v5];
  objc_msgSend(v8, "setReferenceSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [v8 setReferenceDepth:*(double *)(a1 + 56)];
  objc_msgSend(v8, "setVisibleRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [v8 setDisplayScale:*(double *)(a1 + 96)];
  [v8 setScrollSpeedRegime:*(void *)(a1 + 104)];
  objc_msgSend(v8, "setLastScrollDirection:", *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(v8, "setSafeAreaInsets:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
  [v8 setUserInterfaceDirection:*(void *)(a1 + 160)];
  double v6 = [v8 createAnchorFromSuperlayoutWithSublayoutIndex:a2 sublayoutPositionEdges:5 ignoringScrollingAnimationAnchors:0];
  id v7 = (id)[v6 autoInvalidate];

  [v8 updateIfNeeded];
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXGZoomLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXGZoomLayout.m", 96, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGZoomLayout *)self _updateSublayoutGeometries];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[PXGZoomLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGZoomLayout.m", 100, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v9 update];
}

- (void)viewEnvironmentDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 viewEnvironmentDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout viewEnvironmentDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 194, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)safeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 safeAreaInsetsDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout safeAreaInsetsDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 222, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout referenceSizeDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 201, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        id v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout displayScaleDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 229, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setLayers:(id)a3 primaryLayer:(id)a4
{
  double v11 = (NSArray *)a3;
  id v7 = (PXGLayout *)a4;
  objc_super v8 = self->_layers;
  if (v8 == v11)
  {

LABEL_5:
    if (self->_primaryLayer == v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  objc_super v9 = v8;
  int v10 = -[NSArray isEqual:](v8, "isEqual:");

  if (v10) {
    goto LABEL_5;
  }
LABEL_6:
  objc_storeStrong((id *)&self->_layers, a3);
  objc_storeStrong((id *)&self->_primaryLayer, a4);
  [(PXGZoomLayout *)self _configureSublayouts];
  [(PXGLayout *)self setNeedsUpdateOfScrollableAxis];
LABEL_7:
}

- (void)setAnchorViewportCenter:(CGPoint)a3
{
  if (self->_anchorViewportCenter.x != a3.x || self->_anchorViewportCenter.y != a3.y)
  {
    self->_anchorViewportCenter = a3;
    [(PXGZoomLayout *)self _configureSublayouts];
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_9:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v9 = [NSString stringWithUTF8String:"-[PXGZoomLayout setAnchorViewportCenter:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGZoomLayout.m", 90, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_10;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_9;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setAnchorObjectReference:(id)a3
{
  id v5 = a3;
  if (self->_anchorObjectReference != v5)
  {
    id v11 = v5;
    objc_storeStrong(&self->_anchorObjectReference, a3);
    [(PXGZoomLayout *)self _configureSublayouts];
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
LABEL_8:
        id v5 = v11;
        goto LABEL_9;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
        int v10 = [NSString stringWithUTF8String:"-[PXGZoomLayout setAnchorObjectReference:]"];
        objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXGZoomLayout.m", 81, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    id v5 = v11;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v10 sublayoutNeedsUpdate:v4];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v9 = [NSString stringWithUTF8String:"-[PXGZoomLayout sublayoutNeedsUpdate:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGZoomLayout.m", 250, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (int64_t)itemForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(PXGLayout *)self sublayoutForSpriteIndex:"sublayoutForSpriteIndex:"];
  double v6 = [v5 itemsLayout];
  if (v6
    && (uint64_t v7 = [(PXGLayout *)self convertSpriteIndex:v3 toDescendantLayout:v6],
        [v6 spriteIndexIsItem:v7]))
  {
    int64_t v8 = [v6 itemForSpriteIndex:v7];
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (PXGZoomLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGZoomLayout;
  UIEdgeInsets result = [(PXGLayout *)&v3 init];
  if (result) {
    result->_anchorViewportCenter = *(CGPoint *)off_1E5DAB000;
  }
  return result;
}

- (void)_configureSublayouts
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = [(PXGZoomLayout *)self layers];
  id v5 = [(PXGZoomLayout *)self primaryLayer];
  char v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PXGZoomLayout.m" lineNumber:106 description:@"primaryLayer must be one of the layers"];
  }
  uint64_t v7 = [(PXGZoomLayout *)self layers];
  int64_t v8 = [(PXGLayout *)self sublayoutDataStore];
  objc_super v9 = [MEMORY[0x1E4F28E60] indexSet];
  objc_super v10 = [(PXGLayout *)self sublayoutDataStore];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __37__PXGZoomLayout__configureSublayouts__block_invoke;
  v30[3] = &unk_1E5DD1658;
  id v11 = v7;
  id v31 = v11;
  id v12 = v9;
  id v32 = v12;
  [v10 enumerateSublayoutsUsingBlock:v30];

  [(PXGLayout *)self removeSublayoutsAtIndexes:v12];
  double v13 = [(PXGZoomLayout *)self anchorObjectReference];
  [(PXGZoomLayout *)self anchorViewportCenter];
  double v15 = v14;
  double v17 = v16;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        double v23 = *(void **)(*((void *)&v26 + 1) + 8 * v22);
        if (!v8
          || objc_msgSend(v8, "indexOfSublayout:", *(void *)(*((void *)&v26 + 1) + 8 * v22), (void)v26) == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[PXGLayout addSublayout:](self, "addSublayout:", v23, (void)v26);
        }
        uint64_t v24 = [v23 itemsLayout];
        [v24 setAnchorObjectReference:v13];
        objc_msgSend(v24, "setAnchorViewportCenter:", v15, v17);

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v20);
  }
}

- (NSArray)layers
{
  return self->_layers;
}

- (CGPoint)anchorViewportCenter
{
  double x = self->_anchorViewportCenter.x;
  double y = self->_anchorViewportCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)anchorObjectReference
{
  return self->_anchorObjectReference;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anchorObjectReference, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_primaryLayer, 0);
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  id v5 = [(PXGZoomLayout *)self primaryLayer];
  if (v5)
  {
    char v6 = 0;
    v4[2](v4, v5, &v6);
  }
}

- (void)didChangeSublayoutOrigins
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 didChangeSublayoutOrigins];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout didChangeSublayoutOrigins]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 271, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)userInterfaceDirectionDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 userInterfaceDirectionDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout userInterfaceDirectionDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 243, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)scrollSpeedRegimeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 scrollSpeedRegimeDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout scrollSpeedRegimeDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 236, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)referenceDepthDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGZoomLayout;
  [(PXGLayout *)&v8 referenceDepthDidChange];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_updateFlags.updated)
      {
        char v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGZoomLayout referenceDepthDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGZoomLayout.m", 208, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

uint64_t __37__PXGZoomLayout__configureSublayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if ((result & 1) == 0)
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 addIndex:a2];
  }
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
}

@end