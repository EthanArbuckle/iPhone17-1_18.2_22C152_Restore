@interface PXGOneColumnLayout
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemCornerRadius;
- (BOOL)allowsDanglingUpdatesAssertions;
- (BOOL)canHandleVisibleRectRejection;
- (BOOL)enableBestCropRect;
- (BOOL)enableEffects;
- (BOOL)enablePerItemCornerRadius;
- (BOOL)enablePerItemInsets;
- (BOOL)fillSafeAreaTopInset;
- (BOOL)hideIncompleteLastRowOrColumn;
- (BOOL)itemCaptionsVisible;
- (BOOL)loadItemsOutsideAnchorViewport;
- (BOOL)shiftItem:(int64_t)a3 toColumn:(int64_t)a4 topPaddingRows:(int64_t)a5 hideIncompleteRows:(BOOL)a6;
- (BOOL)supportsContentMode;
- (CGPoint)anchorItemCenter;
- (CGPoint)anchorViewportCenter;
- (CGRect)frameForItem:(int64_t)a3;
- (CGRect)loadedItemsRect;
- (CGSize)interItemSpacing;
- (NSString)description;
- (PXGOneColumnLayout)init;
- (UIEdgeInsets)padding;
- (_NSRange)_itemsToLoadForAnchorItem:(int64_t)a3 visibleRect:(CGRect)a4;
- (_NSRange)itemRangeForSpriteIndexRange:(_PXGSpriteIndexRange)a3;
- (_NSRange)itemRangeInRect:(CGRect)a3;
- (_NSRange)itemsToLoad;
- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3;
- (double)accessoryAlpha;
- (double)aspectRatioLimit;
- (double)itemCaptionSpacing;
- (double)overrideAspectRatio;
- (double)overrideAspectRatioAmount;
- (double)rowHeight;
- (id)anchorObjectReference;
- (id)diagnosticDescription;
- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4;
- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4;
- (int64_t)anchorItem;
- (int64_t)columnForItem:(int64_t)a3;
- (int64_t)itemClosestTo:(CGPoint)a3;
- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4;
- (int64_t)numberOfColumns;
- (int64_t)visualItemShift;
- (unsigned)mediaKind;
- (unsigned)presentationType;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unsigned)spriteInfoFlags;
- (void)_updateSpriteStyles;
- (void)_updateSprites;
- (void)_updateVisibleRect;
- (void)alphaDidChange;
- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6;
- (void)displayScaleDidChange;
- (void)entityManagerDidChange;
- (void)invalidateLoadedItems;
- (void)loadedItemsDidChange;
- (void)referenceSizeDidChange;
- (void)setAnchorItem:(int64_t)a3;
- (void)setAnchorItemCenter:(CGPoint)a3;
- (void)setAnchorObjectReference:(id)a3;
- (void)setAnchorViewportCenter:(CGPoint)a3;
- (void)setAspectRatioLimit:(double)a3;
- (void)setEnableBestCropRect:(BOOL)a3;
- (void)setEnableEffects:(BOOL)a3;
- (void)setEnablePerItemCornerRadius:(BOOL)a3;
- (void)setFillSafeAreaTopInset:(BOOL)a3;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setItemCaptionSpacing:(double)a3;
- (void)setMediaKind:(unsigned __int8)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5;
- (void)setOverrideAspectRatio:(double)a3;
- (void)setOverrideAspectRatioAmount:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPresentationType:(unsigned __int8)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)update;
- (void)visibleRectDidChange;
@end

@implementation PXGOneColumnLayout

- (int64_t)numberOfColumns
{
  return 1;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  if (a3.width != self->_interItemSpacing.width || a3.height != self->_interItemSpacing.height)
  {
    self->_interItemSpacing = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_9:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        v7 = [MEMORY[0x1E4F28B00] currentHandler];
        v8 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setInterItemSpacing:]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGOneColumnLayout.m", 561, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_10;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_9;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (unsigned)spriteInfoFlags
{
  return 0;
}

- (BOOL)supportsContentMode
{
  return 0;
}

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)setOverrideAspectRatio:(double)a3
{
  if (self->_overrideAspectRatio != a3)
  {
    self->_overrideAspectRatio = a3;
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
        v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setOverrideAspectRatio:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 569, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setItemCaptionSpacing:(double)a3
{
  self->_itemCaptionSpacing = a3;
}

- (void)setFillSafeAreaTopInset:(BOOL)a3
{
  if (self->_fillSafeAreaTopInset != a3)
  {
    self->_fillSafeAreaTopInset = a3;
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
        v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setFillSafeAreaTopInset:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 629, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setEnablePerItemCornerRadius:(BOOL)a3
{
  if (self->_enablePerItemCornerRadius != a3)
  {
    self->_enablePerItemCornerRadius = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setEnablePerItemCornerRadius:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 645, @"invalidating %lu after it already has been updated", 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 8;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setEnableEffects:(BOOL)a3
{
  if (self->_enableEffects != a3)
  {
    self->_enableEffects = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setEnableEffects:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 637, @"invalidating %lu after it already has been updated", 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 8;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setEnableBestCropRect:(BOOL)a3
{
  if (self->_enableBestCropRect != a3)
  {
    self->_enableBestCropRect = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setEnableBestCropRect:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 545, @"invalidating %lu after it already has been updated", 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 8;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (double)rowHeight
{
  return 0.0;
}

- (id)anchorObjectReference
{
  return self->_anchorObjectReference;
}

- (void)invalidateLoadedItems
{
  if (self->_didAlreadyUpdateLoadedItems)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PXGOneColumnLayout.m", 687, @"Already updated loaded items during this update pass in %@", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)PXGOneColumnLayout;
  [(PXGItemsLayout *)&v5 invalidateLoadedItems];
}

- (void)setOverrideAspectRatioAmount:(double)a3
{
  if (self->_overrideAspectRatioAmount != a3)
  {
    self->_overrideAspectRatioAmount = a3;
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
        v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setOverrideAspectRatioAmount:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 577, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setNumberOfColumns:(int64_t)a3
{
  if (a3 != 1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXZoomablePhotosContentLayout.m", 88, @"Invalid parameter not satisfying: %@", @"numberOfColumns == 1" object file lineNumber description];
  }
}

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXGOneColumnLayout;
  [(PXGItemsLayout *)&v15 setNumberOfItems:a3 withChangeDetails:v8 changeMediaVersionHandler:v9];
  if (!v8 || [v8 hasAnyChanges])
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xA;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 0xA) != 0)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setNumberOfItems:withChangeDetails:changeMediaVersionHandler:]"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXGOneColumnLayout.m", 700, @"invalidating %lu after it already has been updated", 10);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_7;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 10;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_9:
}

- (void)setMediaKind:(unsigned __int8)a3
{
  if (self->_mediaKind != a3)
  {
    self->_mediaKind = a3;
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
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setMediaKind:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 613, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (PXGOneColumnLayout)init
{
  v11.receiver = self;
  v11.super_class = (Class)PXGOneColumnLayout;
  v2 = [(PXGItemsLayout *)&v11 init];
  uint64_t v3 = (PXGOneColumnLayout *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 1144) = _Q0;
    *((void *)v2 + 138) = 0x3FF0000000000000;
    *((void *)v2 + 139) = 0x3FF0000000000000;
    *((void *)v2 + 140) = 0x4010000000000000;
    *((void *)v2 + 142) = 0x7FFFFFFFFFFFFFFFLL;
    long long v9 = *(_OWORD *)off_1E5DAB000;
    *(_OWORD *)(v2 + 1176) = *(_OWORD *)off_1E5DAB000;
    *(_OWORD *)(v2 + 1160) = v9;
    [v2 setLazy:1];
  }
  return v3;
}

- (double)overrideAspectRatio
{
  return self->_overrideAspectRatio;
}

- (void)alphaDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGOneColumnLayout;
  [(PXGLayout *)&v8 alphaDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout alphaDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 669, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void).cxx_destruct
{
}

- (CGPoint)anchorItemCenter
{
  double x = self->_anchorItemCenter.x;
  double y = self->_anchorItemCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)anchorItem
{
  return self->_anchorItem;
}

- (CGPoint)anchorViewportCenter
{
  double x = self->_anchorViewportCenter.x;
  double y = self->_anchorViewportCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)fillSafeAreaTopInset
{
  return self->_fillSafeAreaTopInset;
}

- (double)aspectRatioLimit
{
  return self->_aspectRatioLimit;
}

- (double)overrideAspectRatioAmount
{
  return self->_overrideAspectRatioAmount;
}

- (BOOL)enablePerItemCornerRadius
{
  return self->_enablePerItemCornerRadius;
}

- (BOOL)enableEffects
{
  return self->_enableEffects;
}

- (BOOL)enableBestCropRect
{
  return self->_enableBestCropRect;
}

- (double)itemCaptionSpacing
{
  return self->_itemCaptionSpacing;
}

- (CGSize)interItemSpacing
{
  double width = self->_interItemSpacing.width;
  double height = self->_interItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
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

- (id)diagnosticDescription
{
  uint64_t v3 = NSString;
  [(PXGLayout *)self referenceSize];
  uint64_t v5 = v4;
  [(PXGLayout *)self referenceSize];
  uint64_t v7 = v6;
  [(PXGOneColumnLayout *)self padding];
  objc_super v8 = NSStringFromUIEdgeInsets(v19);
  int64_t v9 = [(PXGItemsLayout *)self numberOfItems];
  [(PXGOneColumnLayout *)self interItemSpacing];
  uint64_t v11 = v10;
  [(PXGLayout *)self displayScale];
  uint64_t v13 = v12;
  v17.receiver = self;
  v17.super_class = (Class)PXGOneColumnLayout;
  v14 = [(PXGLayout *)&v17 diagnosticDescription];
  objc_msgSend(v3, "stringWithFormat:", @"size: {%.3f, %.3f}; padding: %@; items: %li; interItemSpacing: %.3f; screenScale: %.3f sprites: {%@}",
    v5,
    v7,
    v8,
    v9,
    v11,
    v13,
  objc_super v15 = v14);

  return v15;
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  uint64_t v4 = -[PXGOneColumnLayout itemRangeInRect:](self, "itemRangeInRect:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v4, v5);
  return v6;
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  return PXGItemsGeometryItemsBetweenItemAndItemDefaultImplementation(a3, a4);
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  uint64_t v6 = [(PXGItemsLayout *)self numberOfItems];
  return PXGItemsGeometryItemClosestToItemVerticalGridDefaultImplementation(a3, a4, 1, v6);
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!self->_isUpdating && [(PXGItemsLayout *)self isLazy])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXGOneColumnLayout.m", 706, @"Invalid to modify sprites directly when lazy, use setNumberOfItems:withChangeDetails: instead." object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXGOneColumnLayout;
  [(PXGLayout *)&v15 applySpriteChangeDetails:v11 countAfterChanges:v8 initialState:v12 modifyState:v13];
}

- (void)loadedItemsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGOneColumnLayout;
  [(PXGItemsLayout *)&v8 loadedItemsDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xA;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xA) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout loadedItemsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 693, @"invalidating %lu after it already has been updated", 10);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 10;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (BOOL)canHandleVisibleRectRejection
{
  return 1;
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGOneColumnLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  if (!self->_isUpdating) {
    [(PXGOneColumnLayout *)self invalidateLoadedItems];
  }
}

- (void)entityManagerDidChange
{
  v11.receiver = self;
  v11.super_class = (Class)PXGOneColumnLayout;
  [(PXGLayout *)&v11 entityManagerDidChange];
  uint64_t v3 = [(PXGLayout *)self entityManager];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    BOOL v5 = [(PXGOneColumnLayout *)self enableEffects];

    if (v5)
    {
      p_updateFlags = &self->_updateFlags;
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_8:
          p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
          return;
        }
LABEL_7:
        if ((self->_updateFlags.updated & 8) != 0)
        {
          int64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v10 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout entityManagerDidChange]"];
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXGOneColumnLayout.m", 663, @"invalidating %lu after it already has been updated", 8);

          abort();
        }
        goto LABEL_8;
      }
      if (self->_updateFlags.isPerformingUpdate) {
        goto LABEL_7;
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 8;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
    }
  }
}

- (void)displayScaleDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGOneColumnLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 657, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGOneColumnLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 652, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)setPresentationType:(unsigned __int8)a3
{
  if (self->_presentationType != a3)
  {
    self->_presentationType = a3;
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
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setPresentationType:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 621, @"invalidating %lu after it already has been updated", 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 2;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setAnchorViewportCenter:(CGPoint)a3
{
  if (self->_anchorViewportCenter.x != a3.x || self->_anchorViewportCenter.y != a3.y)
  {
    self->_anchorViewportCenter = a3;
    [(PXGOneColumnLayout *)self invalidateLoadedItems];
  }
}

- (void)setAnchorObjectReference:(id)a3
{
  id v14 = a3;
  id v5 = self->_anchorObjectReference;
  if (v5 != v14)
  {
    uint64_t v6 = v5;
    char v7 = [v5 isEqual:v14];

    objc_super v8 = v14;
    if (v7) {
      goto LABEL_12;
    }
    objc_storeStrong(&self->_anchorObjectReference, a3);
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xA;
LABEL_10:
        [(PXGOneColumnLayout *)self invalidateLoadedItems];
        goto LABEL_11;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 10;
      if (!willPerformUpdate) {
        [(PXGLayout *)self setNeedsUpdate];
      }
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 0xA) != 0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setAnchorObjectReference:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXGOneColumnLayout.m", 596, @"invalidating %lu after it already has been updated", 10);

      abort();
    }
    goto LABEL_9;
  }

LABEL_11:
  objc_super v8 = v14;
LABEL_12:
}

- (void)setAspectRatioLimit:(double)a3
{
  if (self->_aspectRatioLimit != a3)
  {
    self->_aspectRatioLimit = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xA;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xA) != 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        char v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setAspectRatioLimit:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 586, @"invalidating %lu after it already has been updated", 10);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 10;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXGLayout *)self visibleRect];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  CGRectEqualToRect(v13, v14);
  v12.receiver = self;
  v12.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout setVisibleRect:](&v12, sel_setVisibleRect_, x, y, width, height);
}

- (void)setAnchorItemCenter:(CGPoint)a3
{
  if (self->_anchorItemCenter.x != a3.x || self->_anchorItemCenter.y != a3.y)
  {
    self->_anchorItemCenter = a3;
    PXPointIsNull();
  }
}

- (void)setAnchorItem:(int64_t)a3
{
  if (self->_anchorItem != a3)
  {
    self->_anchorItem = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      p_updateFlags = &self->_updateFlags;
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_8:
          p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
          return;
        }
LABEL_7:
        if ((self->_updateFlags.updated & 4) != 0)
        {
          uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
          char v7 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout setAnchorItem:]"];
          objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGOneColumnLayout.m", 518, @"invalidating %lu after it already has been updated", 4);

          abort();
        }
        goto LABEL_8;
      }
      if (self->_updateFlags.isPerformingUpdate) {
        goto LABEL_7;
      }
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 4;
      if (!willPerformUpdate)
      {
        [(PXGLayout *)self setNeedsUpdate];
      }
    }
  }
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8 = a3;
  int64_t v9 = [(PXGItemsLayout *)self itemForObjectReference:v8 options:a4];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v10 = -1;
  }
  else {
    unsigned int v10 = [(PXGItemsLayout *)self spriteIndexForItem:v9];
  }
  id v11 = v8;
  *a5 = v11;

  return v10;
}

- (_NSRange)itemRangeForSpriteIndexRange:(_PXGSpriteIndexRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = [(PXGItemsLayout *)self loadedItems] + a3.location;
  NSUInteger v5 = length;
  result.NSUInteger length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)itemRangeInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned int v9 = [(PXGLayout *)self localNumberOfSprites];
  [(PXGItemsLayout *)self loadedItems];
  if (v10 != v9)
  {
    UIEdgeInsets v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PXGOneColumnLayout.m" lineNumber:483 description:@"Every loaded item should have a sprite at this point"];
  }
  if ([(PXGItemsLayout *)self numberOfItems] < 1)
  {
    NSUInteger v16 = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v11 = [(PXGLayout *)self spriteDataStore];
    objc_super v12 = objc_msgSend(v11, "spriteIndexesInRect:", x, y, width, height);

    CGRect v13 = [(PXGItemsLayout *)self itemsForSpriteIndexes:v12];
    uint64_t v14 = objc_msgSend(v13, "px_coveringRange");
    NSUInteger v16 = v15;
    if (v14 + v15 > [(PXGItemsLayout *)self numberOfItems])
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"PXGOneColumnLayout.m" lineNumber:491 description:@"Should not return items out of bounds."];
    }
  }
  NSUInteger v17 = v14;
  NSUInteger v18 = v16;
  result.NSUInteger length = v18;
  result.location = v17;
  return result;
}

- (int64_t)itemClosestTo:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  unsigned int v7 = [(PXGLayout *)self localNumberOfSprites];
  [(PXGItemsLayout *)self loadedItems];
  if (v8 != v7)
  {
    CGRect v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXGOneColumnLayout.m" lineNumber:442 description:@"Every loaded item should have a sprite at this point"];
  }
  uint64_t v16 = 0;
  NSUInteger v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = [(PXGItemsLayout *)self numberOfItems];
  unsigned int v10 = [(PXGLayout *)self localNumberOfSprites];
  if (v9 >= 1 && v10)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0x7FEFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__PXGOneColumnLayout_itemClosestTo___block_invoke;
    aBlock[3] = &unk_1E5DB6E58;
    *(CGFloat *)&aBlock[7] = x;
    *(CGFloat *)&aBlock[8] = y;
    aBlock[5] = v15;
    aBlock[6] = &v16;
    aBlock[4] = self;
    _Block_copy(aBlock);
    PXRectWithCenterAndSize();
  }
  int64_t v11 = v17[3];
  _Block_object_dispose(&v16, 8);
  return v11;
}

void __36__PXGOneColumnLayout_itemClosestTo___block_invoke()
{
}

uint64_t __36__PXGOneColumnLayout_itemClosestTo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGRect)frameForItem:(int64_t)a3
{
  unsigned int v6 = [(PXGLayout *)self localNumberOfSprites];
  [(PXGItemsLayout *)self loadedItems];
  if (v7 != v6)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PXGOneColumnLayout.m" lineNumber:429 description:@"Every loaded item should have a sprite at this point"];
  }
  double v8 = *MEMORY[0x1E4F1DB20];
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  uint64_t v12 = [(PXGItemsLayout *)self spriteIndexForItem:a3];
  if (v12 == -1)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXGOneColumnLayout.m" lineNumber:437 description:@"Invalid to ask for the frame of an item without a sprite representing it"];
  }
  else
  {
    [(PXGLayout *)self geometryForSpriteAtIndex:v12];
    float32x2_t v13 = vmul_f32(0, (float32x2_t)0x3F0000003F000000);
    double v8 = 0.0 - v13.f32[0];
    double v9 = 0.0 - v13.f32[1];
    double v10 = 0.0;
    double v11 = 0.0;
  }
  double v15 = v8;
  double v16 = v9;
  double v17 = v10;
  double v18 = v11;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (_NSRange)_itemsToLoadForAnchorItem:(int64_t)a3 visibleRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  if ([(PXGItemsLayout *)self numberOfItems] <= 0)
  {
    float32x2_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXGOneColumnLayout.m", 395, @"Invalid parameter not satisfying: %@", @"numberOfItems > 0" object file lineNumber description];
  }
  double v8 = height;
  if (height == 0.0)
  {
    [(PXGLayout *)self referenceSize];
    double v8 = v9;
  }
  double v10 = width;
  if (width == 0.0)
  {
    [(PXGLayout *)self referenceSize];
    double v10 = v11;
  }
  if (v8 != 0.0 && v10 != 0.0)
  {
    [(PXGOneColumnLayout *)self aspectRatioLimit];
    uint64_t v12 = +[PXGTextureManagerPreheatingStrategy defaultPreheatingStrategy];
    [v12 maxPreheatingDistance];

    [(PXGOneColumnLayout *)self anchorViewportCenter];
    PXPointIsNull();
  }
  PXGTungstenGetLog();
}

- (_NSRange)itemsToLoad
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PXGItemsLayout *)self numberOfItems];
  if (v3)
  {
    int64_t v4 = v3;
    NSUInteger v5 = [(PXGLayout *)self rootLayout];
    unsigned int v6 = [v5 activeAnchor];

    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v7 = [(PXGLayout *)self anchoredContentEdges];
    double v8 = [(PXGOneColumnLayout *)self anchorObjectReference];
    double v9 = v44;
    int64_t v10 = v44[3];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
    {
      int64_t v10 = [(PXGItemsLayout *)self itemForObjectReference:v8];
      double v9 = v44;
      v44[3] = v10;
    }
    if (v10 == 0x7FFFFFFFFFFFFFFFLL && v7 != 0 && v6 != 0)
    {
      if ([v6 type] == 5)
      {
        double v9 = v44;
      }
      else if (v7)
      {
        double v9 = v44;
        v44[3] = 0;
      }
      else
      {
        double v9 = v44;
        if ((v7 & 4) != 0) {
          v44[3] = v4 - 1;
        }
      }
    }
    if (v9[3] == 0x7FFFFFFFFFFFFFFFLL && v6)
    {
      *(void *)&rect.origin.double y = MEMORY[0x1E4F143A8];
      *(void *)&rect.size.double width = 3221225472;
      *(void *)&rect.size.double height = __33__PXGOneColumnLayout_itemsToLoad__block_invoke;
      v40 = &unk_1E5DB6E30;
      v41 = self;
      v42 = &v43;
      [v6 enumerateAllSpriteReferencesUsingBlock:&rect.origin.y];
    }
    uint64_t v16 = [(PXGItemsLayout *)self loadedItems];
    uint64_t v18 = v17;
    [(PXGLayout *)self visibleRect];
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;
    IsEmptdouble y = CGRectIsEmpty(v51);
    if (v18) {
      char v24 = IsEmpty;
    }
    else {
      char v24 = 1;
    }
    uint64_t v25 = v44[3];
    if (v24)
    {
      if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
        PXGTungstenGetLog();
      }
    }
    else if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v26 = -[PXGOneColumnLayout itemRangeInRect:](self, "itemRangeInRect:", x, y, width, height);
      BOOL v28 = v26 == 0x7FFFFFFFFFFFFFFFLL || v27 == 0;
      uint64_t v29 = v28 ? 0x7FFFFFFFFFFFFFFFLL : v26 + (v27 >> 1);
      v44[3] = v29;
      if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
        PXRectGetCenter();
      }
    }
    uint64_t v14 = -[PXGOneColumnLayout _itemsToLoadForAnchorItem:visibleRect:](self, "_itemsToLoadForAnchorItem:visibleRect:", x, y, width, height);
    NSUInteger v15 = v30;
    if (v16 != v14 || v18 != v30)
    {
      uint64_t v31 = [(PXGItemsLayout *)self spriteIndexForItem:v44[3]];
      double v34 = *(double *)off_1E5DAB000;
      double v35 = *((double *)off_1E5DAB000 + 1);
      if (v31 != -1)
      {
        *(_OWORD *)buf = 0u;
        long long v48 = 0u;
        [(PXGLayout *)self geometryForSpriteAtIndex:v31];
        double v32 = *(double *)buf;
        double v33 = *(double *)&buf[8];
        BOOL v36 = *(double *)buf != 0.0;
        if (*(double *)&buf[8] != 0.0) {
          BOOL v36 = 1;
        }
        if (v36)
        {
          double v34 = *(double *)buf;
          double v35 = *(double *)&buf[8];
        }
      }
      -[PXGOneColumnLayout setAnchorItem:](self, "setAnchorItem:", v44[3], v32, v33);
      -[PXGOneColumnLayout setAnchorItemCenter:](self, "setAnchorItemCenter:", v34, v35);
    }

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    [(PXGOneColumnLayout *)self setAnchorItem:0x7FFFFFFFFFFFFFFFLL];
    NSUInteger v15 = 0;
  }
  NSUInteger v37 = v14;
  NSUInteger v38 = v15;
  result.NSUInteger length = v38;
  result.location = v37;
  return result;
}

void __33__PXGOneColumnLayout_itemsToLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v7 = [a2 objectReference];
  if (v7)
  {
    double v9 = v7;
    uint64_t v8 = [*(id *)(a1 + 32) itemForObjectReference:v7 options:a3];
    unint64_t v7 = v9;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL) {
      *a4 = 1;
    }
  }
}

- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3
{
  NSUInteger v4 = -[PXGOneColumnLayout itemRangeInRect:](self, "itemRangeInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  NSUInteger v6 = v5;
  v17.location = [(PXGItemsLayout *)self loadedItems];
  v17.NSUInteger length = v7;
  v16.location = v4;
  v16.NSUInteger length = v6;
  NSRange v8 = NSIntersectionRange(v16, v17);
  if (v8.length)
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v8.location, v8.length);
    int64_t v10 = [(PXGItemsLayout *)self spriteIndexesForItems:v9];

    unsigned int v11 = objc_msgSend(v10, "px_coveringRange");
    unint64_t v13 = v11 | ((unint64_t)v12 << 32);
  }
  else
  {
    return *(_PXGSpriteIndexRange *)off_1E5DAAF80;
  }
  return (_PXGSpriteIndexRange)v13;
}

- (void)_updateSpriteStyles
{
  uint64_t v3 = [(PXGLayout *)self localNumberOfSprites];
  [(PXGLayout *)self alpha];
  uint64_t v5 = v4;
  [(PXGOneColumnLayout *)self aspectRatioLimit];
  double v7 = v6;
  [(PXGOneColumnLayout *)self aspectRatioLimit];
  uint64_t v9 = v8;
  uint64_t v10 = [(PXGItemsLayout *)self loadedItems];
  if ([(PXGOneColumnLayout *)self enableBestCropRect]) {
    BOOL v11 = [(PXGItemsLayout *)self delegateRespondsTo:8];
  }
  else {
    BOOL v11 = 0;
  }
  unsigned int v12 = [(PXGItemsLayout *)self delegate];
  if ([(PXGOneColumnLayout *)self enablePerItemCornerRadius])
  {
    if ([(PXGItemsLayout *)self delegateRespondsTo:1024]) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = 0;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  id v14 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke;
  v25[3] = &unk_1E5DB6E08;
  uint64_t v29 = v10;
  BOOL v33 = v11;
  double v30 = 1.0 / v7;
  uint64_t v31 = v9;
  id v15 = v12;
  id v26 = v15;
  unint64_t v27 = self;
  uint64_t v32 = v5;
  id v16 = v14;
  id v28 = v16;
  [(PXGLayout *)self modifySpritesInRange:v3 << 32 state:v25];
  if ([(PXGItemsLayout *)self delegateRespondsTo:16]) {
    NSRange v17 = v15;
  }
  else {
    NSRange v17 = 0;
  }
  id v18 = v17;
  if ([(PXGOneColumnLayout *)self enableEffects] && v18)
  {
    uint64_t v19 = [(PXGLayout *)self entityManager];
    v20 = [v19 effectComponent];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke_2;
    v21[3] = &unk_1E5DC8B08;
    int v24 = v3;
    v21[4] = self;
    uint64_t v23 = v10;
    id v22 = v18;
    [v20 performChanges:v21];
  }
}

uint64_t __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v6 = a2;
    uint64_t v7 = result;
    long long v24 = *(_OWORD *)off_1E5DAAF40;
    long long v22 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v23 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v20 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v21 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v18 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v19 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v16 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v17 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v14 = *((_OWORD *)off_1E5DAAF90 + 1);
    long long v15 = *(_OWORD *)off_1E5DAAF90;
    do
    {
      uint64_t v8 = *(void *)(v7 + 56) + v6;
      if (*(unsigned char *)(v7 + 88)) {
        PXClamp();
      }
      *(_OWORD *)(a4 + 96) = v23;
      *(_OWORD *)(a4 + 112) = v22;
      *(_OWORD *)(a4 + 128) = v21;
      *(_OWORD *)(a4 + 144) = v20;
      *(_OWORD *)(a4 + 32) = v19;
      *(_OWORD *)(a4 + 48) = v18;
      *(_OWORD *)(a4 + 64) = v17;
      *(_OWORD *)(a4 + 80) = v16;
      *(_OWORD *)a4 = v15;
      *(_OWORD *)(a4 + 16) = v14;
      *(_OWORD *)(a4 + 4) = v24;
      float v9 = *(double *)(v7 + 80);
      *(float *)a4 = v9;
      _NSRange result = objc_msgSend(*(id *)(v7 + 48), "itemsLayout:cornerRadiusForItem:", *(void *)(v7 + 40), v8, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);
      *(_DWORD *)(a4 + 36) = v10;
      *(_DWORD *)(a4 + 40) = v11;
      *(_DWORD *)(a4 + 44) = v12;
      *(_DWORD *)(a4 + 48) = v13;
      ++v6;
      a4 += 160;
      LODWORD(v4) = v4 - 1;
    }
    while (v4);
  }
  return result;
}

void __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v3 = [a2 mutableEffectIds];
  unint64_t v4 = [*(id *)(a1 + 32) spriteDataStore];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 spritesInRange:(unint64_t)*(unsigned int *)(a1 + 56) << 32];
    uint64_t v6 = *((void *)&v9 + 1);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v11 = 0;
    long long v9 = 0u;
    long long v10 = 0u;
  }

  if (*(_DWORD *)(a1 + 56))
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(unsigned int *)(v6 + 4 * v7);
      *(_DWORD *)(v3 + 4 * v8) = objc_msgSend(*(id *)(a1 + 40), "itemsLayout:effectIdForItem:", *(void *)(a1 + 32), v7 + *(void *)(a1 + 48), v9, v10, v11);
      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 56));
  }
}

- (void)_updateVisibleRect
{
  int64_t v4 = [(PXGOneColumnLayout *)self anchorItem];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = v4;
    [(PXGOneColumnLayout *)self anchorItemCenter];
    [(PXGOneColumnLayout *)self setAnchorItem:0x7FFFFFFFFFFFFFFFLL];
    -[PXGOneColumnLayout setAnchorItemCenter:](self, "setAnchorItemCenter:", *(double *)off_1E5DAB000, *((double *)off_1E5DAB000 + 1));
    [(PXGLayout *)self visibleRect];
    uint64_t v6 = [(PXGItemsLayout *)self spriteIndexForItem:v5];
    if (v6 == -1)
    {
      unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PXGOneColumnLayout.m" lineNumber:223 description:@"Must have a sprite representing the item at this point."];
    }
    -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v6, 0);
    if (v9 == 0.0)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v9);
      [v8 handleFailureInMethod:a2 object:self file:@"PXGOneColumnLayout.m" lineNumber:227 description:@"Sprite must have valid geometry at this point."];
    }
    PXPointIsNull();
  }
}

- (void)_updateSprites
{
  uint64_t v3 = [(PXGLayout *)self localNumberOfSprites];
  uint64_t v4 = [(PXGItemsLayout *)self delegate];
  if ([(PXGItemsLayout *)self delegateRespondsTo:4]) {
    int64_t v5 = (void *)v4;
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;
  if ([(PXGItemsLayout *)self delegateRespondsTo:256]) {
    unint64_t v7 = (void *)v4;
  }
  else {
    unint64_t v7 = 0;
  }
  id v8 = v7;
  double v9 = [(PXGItemsLayout *)self insetDelegate];
  [(PXGLayout *)self displayScale];
  uint64_t v11 = v10;
  [(PXGOneColumnLayout *)self padding];
  uint64_t v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(PXGOneColumnLayout *)self aspectRatioLimit];
  double v19 = 1.0 / v18;
  [(PXGOneColumnLayout *)self aspectRatioLimit];
  uint64_t v56 = v20;
  [(PXGOneColumnLayout *)self interItemSpacing];
  double v55 = v21;
  [(PXGLayout *)self referenceSize];
  double v57 = v22;
  uint64_t v23 = [(PXGItemsLayout *)self loadedItems];
  uint64_t v53 = v24;
  uint64_t v25 = [(PXGItemsLayout *)self numberOfItems];
  unsigned __int8 v26 = [(PXGOneColumnLayout *)self presentationType];
  unsigned __int8 v54 = [(PXGOneColumnLayout *)self mediaKind];
  [(PXGOneColumnLayout *)self overrideAspectRatio];
  uint64_t v28 = v27;
  [(PXGOneColumnLayout *)self overrideAspectRatioAmount];
  uint64_t v30 = v29;
  uint64_t v31 = [(PXGOneColumnLayout *)self anchorObjectReference];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    [(PXGOneColumnLayout *)self anchorObjectReference];
    uint64_t v52 = v23;
    uint64_t v33 = v25;
    unsigned __int8 v34 = v26;
    id v35 = v8;
    BOOL v36 = v9;
    uint64_t v37 = v3;
    v39 = id v38 = v6;
    int64_t v40 = [(PXGItemsLayout *)self itemForObjectReference:v39];

    id v6 = v38;
    uint64_t v3 = v37;
    double v9 = v36;
    id v8 = v35;
    unsigned __int8 v26 = v34;
    uint64_t v25 = v33;
    uint64_t v23 = v52;

    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v6 itemsLayout:self aspectRatioForItem:v40];
      PXClamp();
    }
  }
  uint64_t v62 = 0;
  v63 = (double *)&v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = v13;
  if ([(PXGOneColumnLayout *)self fillSafeAreaTopInset])
  {
    [(PXGLayout *)self safeAreaInsets];
    v63[3] = v63[3] - v41;
  }
  double v42 = v57 - v15 - v17;
  float v43 = v15 + v42 * 0.5;
  uint64_t v44 = 1000;
  if (v23 < 1000) {
    uint64_t v44 = v23;
  }
  if (v23 == 0x7FFFFFFFFFFFFFFFLL || v53 == 0) {
    unint64_t v46 = 0x8000000000000000;
  }
  else {
    unint64_t v46 = -(v23 + v53);
  }
  uint64_t v47 = (v46 + v25) & ~((uint64_t)(v46 + v25) >> 63);
  double v48 = (double)v44;
  if (v25 < 1) {
    double v48 = 0.0;
  }
  v63[3] = v63[3] + v48 * v42;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __36__PXGOneColumnLayout__updateSprites__block_invoke;
  v58[3] = &unk_1E5DB6DE0;
  if (v25 >= 1) {
    double v49 = (double)v47;
  }
  else {
    double v49 = 0.0;
  }
  v58[9] = v23;
  *(double *)&v58[10] = v19;
  v58[4] = v6;
  v58[5] = self;
  v58[11] = v56;
  v58[12] = 1.0;
  v58[13] = v28;
  v58[14] = v30;
  v58[6] = v8;
  *(double *)&v58[15] = v42;
  v58[16] = v11;
  float v59 = v43;
  v58[7] = v9;
  v58[8] = &v62;
  unsigned __int8 v60 = v26;
  unsigned __int8 v61 = v54;
  *(double *)&v58[17] = v55;
  [(PXGLayout *)self modifySpritesInRange:v3 << 32 state:v58];
  v50 = v63;
  double v51 = v63[3];
  if (v3)
  {
    double v51 = v51 - v55;
    v63[3] = v51;
  }
  v50[3] = v51 + v49 * v42;
  PXFloatRoundToPixel();
}

uint64_t __36__PXGOneColumnLayout__updateSprites__block_invoke(uint64_t result, uint64_t a2)
{
  if (HIDWORD(a2))
  {
    [*(id *)(result + 32) itemsLayout:*(void *)(result + 40) aspectRatioForItem:*(void *)(result + 72) + a2];
    PXClamp();
  }
  return result;
}

- (void)update
{
  BOOL isUpdating = self->_isUpdating;
  self->_BOOL isUpdating = 1;
  uint64_t v4 = [(PXGLayout *)self rootLayout];
  int64_t v5 = [v4 activeAnchor];

  if (v5) {
    [(PXGOneColumnLayout *)self invalidateLoadedItems];
  }
  [(PXGItemsLayout *)self updateLoadedItemsIfNeeded];
  self->_didAlreadyUpdateLoadedItems = 1;
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXGOneColumnLayout.m", 91, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      [(PXGOneColumnLayout *)self _updateSprites];
      if (!self->_updateFlags.isPerformingUpdate)
      {
        double v16 = [MEMORY[0x1E4F28B00] currentHandler];
        double v17 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout update]"];
        [v16 handleFailureInFunction:v17, @"PXGOneColumnLayout.m", 97, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 4uLL;
    if ((v8 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXGOneColumnLayout *)self _updateVisibleRect];
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXGOneColumnLayout.m", 101, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 8uLL;
    if ((v9 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFF7;
      [(PXGOneColumnLayout *)self _updateSpriteStyles];
      unint64_t v9 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v9)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = [NSString stringWithUTF8String:"-[PXGOneColumnLayout update]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXGOneColumnLayout.m", 104, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  self->_didAlreadyUpdateLoadedItems = 0;
  v18.receiver = self;
  v18.super_class = (Class)PXGOneColumnLayout;
  [(PXGItemsLayout *)&v18 update];
  self->_BOOL isUpdating = isUpdating;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  v11.location = [(PXGItemsLayout *)self loadedItems];
  id v6 = NSStringFromRange(v11);
  [(PXGLayout *)self alpha];
  unint64_t v8 = [v3 stringWithFormat:@"<%@: %p: loadedItems = %@ alpha = %.2f>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (BOOL)enablePerItemInsets
{
  return 1;
}

- (double)accessoryAlpha
{
  return 1.0;
}

- (BOOL)loadItemsOutsideAnchorViewport
{
  return 0;
}

- (CGRect)loadedItemsRect
{
  uint64_t v3 = [(PXGItemsLayout *)self loadedItems];
  if (v4)
  {
    uint64_t v5 = v4 + v3 - 1;
    [(PXGOneColumnLayout *)self frameForItem:v3];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [(PXGOneColumnLayout *)self frameForItem:v5];
    v36.origin.CGFloat x = v14;
    CGFloat rect = v14;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    v30.origin.CGFloat x = v7;
    v30.origin.CGFloat y = v9;
    v30.size.CGFloat width = v11;
    v30.size.CGFloat height = v13;
    v36.origin.CGFloat y = v16;
    v36.size.CGFloat width = v18;
    v36.size.CGFloat height = v20;
    CGRect v31 = CGRectUnion(v30, v36);
    CGFloat x = v31.origin.x;
    CGFloat y = v31.origin.y;
    CGFloat width = v31.size.width;
    CGFloat height = v31.size.height;
    CGRectGetMinX(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGRectGetMinY(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    CGRectGetMaxX(v33);
    v34.origin.CGFloat x = rect;
    v34.origin.CGFloat y = v16;
    v34.size.CGFloat width = v18;
    v34.size.CGFloat height = v20;
    CGRectGetMaxY(v34);
    PXRectWithEdges();
  }
  double v25 = *MEMORY[0x1E4F1DB28];
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (BOOL)hideIncompleteLastRowOrColumn
{
  return 0;
}

- (int64_t)visualItemShift
{
  return 0;
}

- (BOOL)shiftItem:(int64_t)a3 toColumn:(int64_t)a4 topPaddingRows:(int64_t)a5 hideIncompleteRows:(BOOL)a6
{
  return 0;
}

- (int64_t)columnForItem:(int64_t)a3
{
  return 0;
}

- (BOOL)itemCaptionsVisible
{
  return 0;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

@end