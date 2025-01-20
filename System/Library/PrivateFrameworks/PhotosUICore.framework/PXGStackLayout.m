@interface PXGStackLayout
- (BOOL)definesContextForPointReferences;
- (CGRect)axFrame;
- (PXGStackLayout)init;
- (PXGStackLayoutSublayoutAlignmentDelegate)sublayoutAlignmentDelegate;
- (PXGSublayoutFaultingDelegate)sublayoutFaultingDelegate;
- (UIEdgeInsets)additionalSafeAreaInsetsForSublayout:(id)a3;
- (UIEdgeInsets)faultInOutsets;
- (UIEdgeInsets)faultOutOutsets;
- (UIEdgeInsets)flexibleRegionInsets;
- (UIEdgeInsets)padding;
- (double)interlayoutSpacing;
- (int64_t)axis;
- (void)_invalidateEstimatedSublayoutContentSizes;
- (void)_invalidateFirstFloatingLayout;
- (void)_updateFirstFloatingLayout;
- (void)_updateInterlayoutSpacing;
- (void)_updateSublayouts;
- (void)dealloc;
- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4;
- (void)invalidateAdditionalSafeAreaInsets;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)scrollSpeedRegimeDidChange;
- (void)setAxis:(int64_t)a3;
- (void)setFaultInOutsets:(UIEdgeInsets)a3;
- (void)setFaultOutOutsets:(UIEdgeInsets)a3;
- (void)setInterlayoutSpacing:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSublayoutAlignmentDelegate:(id)a3;
- (void)setSublayoutFaultingDelegate:(id)a3;
- (void)sublayoutDidChangeContentSize:(id)a3;
- (void)sublayoutDidChangeLastBaseline:(id)a3;
- (void)sublayoutNeedsUpdate:(id)a3;
- (void)update;
- (void)viewEnvironmentDidChange;
- (void)visibleRectDidChange;
- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5;
- (void)willUpdate;
@end

@implementation PXGStackLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sublayoutFaultingDelegate);
  objc_destroyWeak((id *)&self->_sublayoutAlignmentDelegate);
  objc_storeStrong((id *)&self->_sublayoutsToAlignToVisibleTopEdge, 0);
}

- (void)setFaultOutOutsets:(UIEdgeInsets)a3
{
  self->_faultOutOutsets = a3;
}

- (UIEdgeInsets)faultOutOutsets
{
  double top = self->_faultOutOutsets.top;
  double left = self->_faultOutOutsets.left;
  double bottom = self->_faultOutOutsets.bottom;
  double right = self->_faultOutOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)faultInOutsets
{
  double top = self->_faultInOutsets.top;
  double left = self->_faultInOutsets.left;
  double bottom = self->_faultInOutsets.bottom;
  double right = self->_faultInOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSublayoutFaultingDelegate:(id)a3
{
}

- (PXGSublayoutFaultingDelegate)sublayoutFaultingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sublayoutFaultingDelegate);
  return (PXGSublayoutFaultingDelegate *)WeakRetained;
}

- (PXGStackLayoutSublayoutAlignmentDelegate)sublayoutAlignmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sublayoutAlignmentDelegate);
  return (PXGStackLayoutSublayoutAlignmentDelegate *)WeakRetained;
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

- (double)interlayoutSpacing
{
  return self->_interlayoutSpacing;
}

- (int64_t)axis
{
  return self->_axis;
}

- (UIEdgeInsets)flexibleRegionInsets
{
  double top = self->_flexibleRegionInsets.top;
  double left = self->_flexibleRegionInsets.left;
  double bottom = self->_flexibleRegionInsets.bottom;
  double right = self->_flexibleRegionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)axFrame
{
  [(PXGLayout *)self frame];
  [(PXGStackLayout *)self padding];
  PXEdgeInsetsInsetRect();
}

- (void)setInterlayoutSpacing:(double)a3
{
}

- (void)setFaultInOutsets:(UIEdgeInsets)a3
{
}

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis == a3) {
    return;
  }
  self->_axis = a3;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 1;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_6:
    if (self->_updateFlags.updated)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = [NSString stringWithUTF8String:"-[PXGStackLayout setAxis:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGStackLayout.m", 724, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
  }
  p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
LABEL_8:
  [(PXGLayout *)self setNeedsUpdateOfScrollableAxis];
}

- (void)scrollSpeedRegimeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v8 scrollSpeedRegimeDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[PXGStackLayout scrollSpeedRegimeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGStackLayout.m", 716, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[PXGStackLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGStackLayout.m", 711, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)visibleRectDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v8 visibleRectDidChange];
  if (self->_isUpdatingSublayouts)
  {
    [(PXGStackLayout *)self _invalidateFirstFloatingLayout];
    return;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_7:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[PXGStackLayout visibleRectDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGStackLayout.m", 705, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_7;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)referenceDepthDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
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
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGStackLayout referenceDepthDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGStackLayout.m", 695, @"invalidating %lu after it already has been updated", 1);

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
  v8.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  [(PXGStackLayout *)self _invalidateEstimatedSublayoutContentSizes];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGStackLayout referenceSizeDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGStackLayout.m", 688, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)viewEnvironmentDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v8 viewEnvironmentDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[PXGStackLayout viewEnvironmentDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGStackLayout.m", 681, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGStackLayout;
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
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        v9 = [NSString stringWithUTF8String:"-[PXGStackLayout sublayoutDidChangeLastBaseline:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGStackLayout.m", 675, @"invalidating %lu after it already has been updated", 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 3;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGStackLayout;
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
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
        v9 = [NSString stringWithUTF8String:"-[PXGStackLayout sublayoutDidChangeContentSize:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGStackLayout.m", 667, @"invalidating %lu after it already has been updated", 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 3;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v10 sublayoutNeedsUpdate:v4];
  if (self->_isUpdatingSublayouts)
  {
    [(PXGLayout *)self assumeWillUpdateSublayoutInUpdatePass:v4];
    goto LABEL_9;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
      goto LABEL_9;
    }
LABEL_7:
    if ((self->_updateFlags.updated & 3) != 0)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"-[PXGStackLayout sublayoutNeedsUpdate:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXGStackLayout.m", 657, @"invalidating %lu after it already has been updated", 3);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_7;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 3;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_9:
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v14 willRemoveSublayout:v8 atIndex:a4 flags:a5];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        v13 = [NSString stringWithUTF8String:"-[PXGStackLayout willRemoveSublayout:atIndex:flags:]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXGStackLayout.m", 649, @"invalidating %lu after it already has been updated", 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 3;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v14 didAddSublayout:v8 atIndex:a4 flags:a5];
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 3) != 0)
      {
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        v13 = [NSString stringWithUTF8String:"-[PXGStackLayout didAddSublayout:atIndex:flags:]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXGStackLayout.m", 641, @"invalidating %lu after it already has been updated", 3);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 3;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_8:
}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGStackLayout;
  -[PXGLayout insertSublayoutProvider:inRange:](&v13, sel_insertSublayoutProvider_inRange_, v7, location, length);
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
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        v12 = [NSString stringWithUTF8String:"-[PXGStackLayout insertSublayoutProvider:inRange:]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXGStackLayout.m", 633, @"invalidating %lu after it already has been updated", 1);

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

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (void)_updateFirstFloatingLayout
{
  if ([(NSSet *)self->_sublayoutsToAlignToVisibleTopEdge count])
  {
    [(PXGLayout *)self visibleRect];
    [(PXGLayout *)self safeAreaInsets];
    PXEdgeInsetsInsetRect();
  }
}

void __44__PXGStackLayout__updateFirstFloatingLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  id v6 = *a4;
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 912), "containsObject:"))
  {
    *(double *)(a3 + 56) = *(double *)(a1 + 56) + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a3 + 40)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

- (void)_invalidateFirstFloatingLayout
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_postUpdateFlags.updated)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXGStackLayout _invalidateFirstFloatingLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGStackLayout.m", 606, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSublayouts
{
  [(PXGLayout *)self sublayoutDataStore];
  [(id)objc_claimAutoreleasedReturnValue() count];
  if (self->_isUpdatingSublayouts)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGStackLayout.m", 166, @"Invalid parameter not satisfying: %@", @"!_isUpdatingSublayouts" object file lineNumber description];
  }
  self->_isUpdatingSublayouts = 1;
  int64_t v3 = [(PXGStackLayout *)self axis];
  if (!v3)
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXGStackLayout.m", 170, @"stacking axis is undefined %@", self object file lineNumber description];
  }
  [(PXGStackLayout *)self padding];
  [(PXGLayout *)self referenceSize];
  [(PXGLayout *)self referenceDepth];
  [(PXGLayout *)self referenceOptions];
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXGStackLayout.m" lineNumber:179 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x4010000000;
  v12[3] = &unk_1AB5D584F;
  long long v13 = 0u;
  long long v14 = 0u;
  [(PXGLayout *)self visibleRect];
  *(void *)&long long v13 = v5;
  *((void *)&v13 + 1) = v6;
  *(void *)&long long v14 = v7;
  *((void *)&v14 + 1) = v8;
  [(PXGStackLayout *)self faultInOutsets];
  sub_1AB23B20C();
}

void __35__PXGStackLayout__updateSublayouts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v5 = *(_OWORD *)(v4 + 32);
  *(void *)(a3 + 64) = *(void *)(v4 + 48);
  *(_OWORD *)(a3 + 48) = v5;
  *a4;
  PXSizeIsNull();
}

void __35__PXGStackLayout__updateSublayouts__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __35__PXGStackLayout__updateSublayouts__block_invoke_3;
  v17[3] = &unk_1E5DB0E10;
  uint64_t v8 = *(void **)(a1 + 32);
  v9 = *(void **)(a1 + 48);
  v17[4] = *(void *)(a1 + 40);
  BOOL v35 = (a4 & 2) != 0;
  uint64_t v10 = *(void *)(a1 + 112);
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v24 = v10;
  long long v11 = *(_OWORD *)(a1 + 88);
  long long v21 = *(_OWORD *)(a1 + 72);
  long long v22 = v11;
  long long v12 = *(_OWORD *)(a1 + 120);
  long long v26 = *(_OWORD *)(a1 + 136);
  long long v25 = v12;
  id v18 = v9;
  id v19 = *(id *)(a1 + 56);
  long long v13 = *(_OWORD *)(a1 + 168);
  long long v27 = *(_OWORD *)(a1 + 152);
  long long v28 = v13;
  id v20 = *(id *)(a1 + 64);
  long long v14 = *(_OWORD *)(a1 + 184);
  __int16 v34 = *(_WORD *)(a1 + 264);
  long long v15 = *(_OWORD *)(a1 + 200);
  long long v29 = v14;
  long long v30 = v15;
  long long v16 = *(_OWORD *)(a1 + 232);
  long long v31 = *(_OWORD *)(a1 + 216);
  long long v32 = v16;
  long long v33 = *(_OWORD *)(a1 + 248);
  objc_msgSend(v8, "enumerateSublayoutGeometriesInRange:options:usingBlock:", a2, a3, a4, v17);
}

void __35__PXGStackLayout__updateSublayouts__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  if ([*(id *)(a1 + 32) containsIndex:a2])
  {
    if (*(void *)(a1 + 72) != 1)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 80), *(void *)(a1 + 40));
    }
    [*(id *)(a1 + 40) visibleRect];
    [*(id *)(a1 + 40) safeAreaInsets];
    PXEdgeInsetsMakeWithValueForEdges();
  }
  if (*(uint64_t *)(a1 + 88) >= 2 && [*(id *)(a1 + 48) containsIndex:a2])
  {
    if (*(void *)(a1 + 72) != 1)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 80), *(void *)(a1 + 40));
    }
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    double v9 = *(double *)(a3 + 40);
    double v10 = *(double *)(a1 + 120);
    if (v8 + v9 < v10)
    {
      double v11 = v10 - v9;
      *(double *)(*(void *)(a1 + 40) + 976) = v11 - v8;
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v11;
    }
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v13 = *(void *)(v12 + 48);
  *(_OWORD *)(a3 + 48) = *(_OWORD *)(v12 + 32);
  *(void *)(a3 + 64) = v13;
  *(double *)(a3 + 56) = *(double *)(a3 + 56) + 0.0;
  id v18 = *a4;
  [v18 setFloating:0];
  [v18 setFloatingOffset:0.0];
  uint64_t v14 = *(void *)(a1 + 72);
  switch(v14)
  {
    case 1:
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 40)
                                                                  + *(double *)(a3 + 40);
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 40)
                                                                  + *(double *)(a3 + 128);
      break;
    case 2:
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 32)
                                                                  + *(double *)(a3 + 32);
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 32)
                                                                  + *(double *)(a3 + 128);
      break;
    case 0:
      long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 40) file:@"PXGStackLayout.m" lineNumber:550 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

void __35__PXGStackLayout__updateSublayouts__block_invoke_5(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) sublayoutAtIndex:a2];
  [v2 addObject:v3];
}

void __35__PXGStackLayout__updateSublayouts__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  double v9 = *(double *)(a3 + 32);
  double v8 = *(double *)(a3 + 40);
  uint64_t v7 = (_OWORD *)(a3 + 32);
  if (!*(unsigned char *)(a1 + 258)) {
    goto LABEL_9;
  }
  uint64_t v10 = *(void *)(a1 + 104);
  switch(v10)
  {
    case 1:
      double v16 = v8 + *(double *)(a3 + 128);
      v17 = (double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      break;
    case 2:
      double v16 = v9 + *(double *)(a3 + 128);
      v17 = (double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32);
      break;
    case 0:
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)(a1 + 96);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = 326;
      goto LABEL_38;
    default:
LABEL_9:
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      long long v19 = *(_OWORD *)(v18 + 32);
      *(void *)(a3 + 64) = *(void *)(v18 + 48);
      *(_OWORD *)(a3 + 48) = v19;
      if (!a4[1]) {
        goto LABEL_33;
      }
      if (*a4)
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
          || *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != a2)
        {
          PXEdgeInsetsInsetRect();
        }
LABEL_33:
        id v27 = *a4;
        long long v28 = v27;
        if (v27)
        {
          [v27 setViewEnvironment:*(void *)(a1 + 56)];
          objc_msgSend(v28, "setReferenceSize:", *(double *)(a1 + 176), *(double *)(a1 + 184));
          [v28 setReferenceDepth:*(double *)(a1 + 192)];
          [v28 setReferenceOptions:*(unsigned __int16 *)(a1 + 256)];
          CGRect v31 = CGRectOffset(*(CGRect *)(*(void *)(*(void *)(a1 + 88) + 8) + 32), -*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), -*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
          objc_msgSend(v28, "setVisibleRect:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
          [v28 setDisplayScale:*(double *)(a1 + 200)];
          objc_msgSend(v28, "setLastScrollDirection:", *(double *)(a1 + 208), *(double *)(a1 + 216));
          [v28 setScrollSpeedRegime:*(void *)(a1 + 224)];
          [v28 setUserInterfaceDirection:*(void *)(a1 + 232)];
          [*(id *)(a1 + 32) additionalSafeAreaInsetsForSublayout:v28];
          [*(id *)(a1 + 32) safeAreaInsets];
          PXEdgeInsetsAdd();
        }
        double v29 = *(double *)(*(void *)(a1 + 32) + 936);
        id v30 = 0;
        if (v29 == -1.0) {
          [v30 lastBaseline];
        }
        PXGAssertErrValidFloat();
      }
      if ((!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
         || *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != a2)
        && ([*(id *)(a1 + 40) containsIndex:a2] & 1) == 0)
      {
        PXEdgeInsetsInsetRect();
      }
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = a4[1];
      long long v22 = [v21 layout:v20 createSublayoutAtIndex:a2];

      if (v22)
      {
        id v23 = v22;
        if (*a4 != v23)
        {

          *a4 = v23;
        }

        objc_msgSend(*(id *)(a1 + 32), "didFaultInSublayout:atIndex:fromEstimatedContentSize:", v23, a2, v9, v8);
        goto LABEL_32;
      }
      a4[1] = 0;
      if (*(unsigned char *)(a1 + 258))
      {
        uint64_t v24 = *(void *)(a1 + 104);
        switch(v24)
        {
          case 1:
            double v25 = -v8;
            double v26 = 0.0;
            break;
          case 2:
            double v26 = -v9;
            double v25 = 0.0;
            break;
          case 0:
            double v11 = [MEMORY[0x1E4F28B00] currentHandler];
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)(a1 + 96);
            uint64_t v14 = *(void *)(a1 + 32);
            uint64_t v15 = 370;
LABEL_38:
            [v11 handleFailureInMethod:v13 object:v14 file:@"PXGStackLayout.m" lineNumber:v15 description:@"Code which should be unreachable has been reached"];

            abort();
          default:
            goto LABEL_31;
        }
        *(CGRect *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) = CGRectOffset(*(CGRect *)(*(void *)(*(void *)(a1 + 88)+ 8)+ 32), v26, v25);
      }
LABEL_31:
      id v23 = 0;
      _OWORD *v7 = *MEMORY[0x1E4F1DB30];
LABEL_32:

      goto LABEL_33;
  }
  double *v17 = *v17 - v16;
  goto LABEL_9;
}

- (void)_updateInterlayoutSpacing
{
  id v3 = [(PXGLayout *)self sublayoutDataStore];
  int64_t v4 = [(PXGStackLayout *)self axis];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PXGStackLayout__updateInterlayoutSpacing__block_invoke;
  v5[3] = &unk_1E5DB0DC0;
  v5[4] = self;
  v5[5] = v4;
  [v3 enumerateSublayoutGeometriesUsingBlock:v5];
}

void __43__PXGStackLayout__updateInterlayoutSpacing__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  id v5 = *a4;
  if (*(double *)(*(void *)(a1 + 32) + 936) == -1.0) {
    [v5 lastBaseline];
  }
  PXGAssertErrValidFloat();
}

- (void)_invalidateEstimatedSublayoutContentSizes
{
  id v3 = [(PXGLayout *)self sublayoutDataStore];
  [v3 enumerateSublayoutGeometriesUsingBlock:&__block_literal_global_19409];

  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = [NSString stringWithUTF8String:"-[PXGStackLayout _invalidateEstimatedSublayoutContentSizes]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGStackLayout.m", 150, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

__n128 __59__PXGStackLayout__invalidateEstimatedSublayoutContentSizes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result = *(__n128 *)off_1E5DAB030;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)off_1E5DAB030;
  return result;
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v4 = [NSString stringWithUTF8String:"-[PXGStackLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGStackLayout.m", 141, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXGStackLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXGStackLayout.m", 142, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  uint64_t v3 = [(PXGLayout *)self numberOfDescendantAnchors];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (v3 >= 1)
  {
    BOOL isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      id v21 = [NSString stringWithUTF8String:"-[PXGStackLayout update]"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PXGStackLayout.m", 118, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->unint64_t needsUpdate = needsUpdate;
    self->_updateFlags.BOOL willPerformUpdate = 0;
    if (!isPerformingUpdate) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (!needsUpdate) {
    goto LABEL_12;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_22:
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = [NSString stringWithUTF8String:"-[PXGStackLayout update]"];
    [v10 handleFailureInFunction:v11, @"PXGStackLayout.m", 121, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.BOOL isPerformingUpdate = 1;
  self->_updateFlags.updated = 2;
  if ((needsUpdate & 2) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
    [(PXGStackLayout *)self _updateInterlayoutSpacing];
    if (!self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PXGStackLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXGStackLayout.m", 125, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
  }
  unint64_t v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 1uLL;
  if (v7)
  {
    p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFELL;
    [(PXGStackLayout *)self _updateSublayouts];
    unint64_t v7 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.BOOL isPerformingUpdate = 0;
  if (v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[PXGStackLayout update]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXGStackLayout.m", 128, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
  }
LABEL_12:
  v22.receiver = self;
  v22.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v22 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v9 = self->_postUpdateFlags.needsUpdate;
  if (v9)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"-[PXGStackLayout update]"];
      [v16 handleFailureInFunction:v17, @"PXGStackLayout.m", 132, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v9 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.BOOL isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1;
    if (v9)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFFELL;
      [(PXGStackLayout *)self _updateFirstFloatingLayout];
      unint64_t v9 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.BOOL isPerformingUpdate = 0;
    if (v9)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v19 = [NSString stringWithUTF8String:"-[PXGStackLayout update]"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"PXGStackLayout.m", 136, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v7 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v4 = [NSString stringWithUTF8String:"-[PXGStackLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGStackLayout.m", 111, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.BOOL willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXGStackLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXGStackLayout.m", 112, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)invalidateAdditionalSafeAreaInsets
{
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
        id v5 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"-[PXGStackLayout invalidateAdditionalSafeAreaInsets]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGStackLayout.m", 105, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (UIEdgeInsets)additionalSafeAreaInsetsForSublayout:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (void)setSublayoutAlignmentDelegate:(id)a3
{
  id obj = a3;
  id v4 = objc_loadWeakRetained((id *)&self->_sublayoutAlignmentDelegate);
  if (v4 == obj)
  {

LABEL_8:
    objc_super v7 = obj;
    goto LABEL_12;
  }
  double v5 = v4;
  char v6 = [v4 isEqual:obj];

  objc_super v7 = obj;
  if ((v6 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_sublayoutAlignmentDelegate, obj);
    self->_sublayoutAlignmentDelegateRespondsTo.shouldAlignSublayoutToVisibleTopEdge = objc_opt_respondsToSelector() & 1;
    char v8 = objc_opt_respondsToSelector();
    objc_super v7 = obj;
    self->_sublayoutAlignmentDelegateRespondsTo.shouldAlignSublayoutToVisibleBottomEdge = v8 & 1;
    if (!self->_isUpdatingSublayouts)
    {
      p_updateFlags = &self->_updateFlags;
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_11:
          p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
          goto LABEL_12;
        }
LABEL_10:
        if (self->_updateFlags.updated)
        {
          uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v13 = [NSString stringWithUTF8String:"-[PXGStackLayout setSublayoutAlignmentDelegate:]"];
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXGStackLayout.m", 91, @"invalidating %lu after it already has been updated", 1);

          abort();
        }
        goto LABEL_11;
      }
      if (self->_updateFlags.isPerformingUpdate) {
        goto LABEL_10;
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 1;
      if (!willPerformUpdate)
      {
        [(PXGLayout *)self setNeedsUpdate];
        goto LABEL_8;
      }
    }
  }
LABEL_12:
}

- (void)dealloc
{
  free(self->_sublayoutOriginsBeforeUpdate);
  v3.receiver = self;
  v3.super_class = (Class)PXGStackLayout;
  [(PXGLayout *)&v3 dealloc];
}

- (PXGStackLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGStackLayout;
  if ([(PXGLayout *)&v3 init]) {
    PXEdgeInsetsMake();
  }
  return 0;
}

@end