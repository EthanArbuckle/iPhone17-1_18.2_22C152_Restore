@interface PXGGridLayout
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)edgeCornerRadius;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemCornerRadius;
- (BOOL)canHandleVisibleRectRejection;
- (BOOL)enableBestCropRect;
- (BOOL)enableEffects;
- (BOOL)enablePerItemCornerRadius;
- (BOOL)enablePerItemInsets;
- (BOOL)enablePerItemMargin;
- (BOOL)fillSafeAreaTopInset;
- (BOOL)hideIncompleteLastRowOrColumn;
- (BOOL)itemCaptionsVisible;
- (BOOL)loadItemsOutsideAnchorViewport;
- (BOOL)mediaTargetSizeIgnoresSpacing;
- (BOOL)shiftItem:(int64_t)a3 toColumn:(int64_t)a4 topPaddingRows:(int64_t)a5 hideIncompleteRows:(BOOL)a6;
- (BOOL)shouldUpdateDecorationMediaTargetSizes;
- (BOOL)supportsAutomaticContentRotation;
- (BOOL)supportsContentMode;
- (CGPoint)_contentPointInLayout:(CGPoint)a3;
- (CGPoint)_layoutPointInContent:(CGPoint)a3;
- (CGPoint)anchorViewportCenter;
- (CGPoint)contentOrigin;
- (CGRect)_contentRectInLayout:(CGRect)a3;
- (CGRect)_frameForItem:(int64_t)a3 usingInterItemSpacing:(CGSize)a4 itemSize:(CGSize)a5 insets:(UIEdgeInsets)a6 contentMode:(int64_t)a7;
- (CGRect)_layoutRectInContent:(CGRect)a3;
- (CGRect)_pageAlignedRectForVisibleRect:(CGRect)a3;
- (CGRect)frameForItem:(int64_t)a3;
- (CGRect)frameForItem:(int64_t)a3 usingInterItemSpacing:(CGSize)a4;
- (CGRect)loadedItemsRect;
- (CGSize)interItemSpacing;
- (CGSize)sizeForItem:(int64_t)a3;
- (NSString)description;
- (NSString)diagnosticDescription;
- (PXGGridLayout)init;
- (UIEdgeInsets)padding;
- (_NSRange)_itemsToLoadForVisibleRect:(CGRect)a3;
- (_NSRange)itemRangeForSpriteIndexRange:(_PXGSpriteIndexRange)a3;
- (_NSRange)itemRangeInRect:(CGRect)a3;
- (_NSRange)itemsToLoad;
- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3;
- (double)accessoryAlpha;
- (double)aspectRatioLimit;
- (double)itemAspectRatio;
- (double)itemCaptionSpacing;
- (double)rowHeight;
- (float)itemZPosition;
- (id)anchorObjectReference;
- (id)axBorderSpriteIndexes;
- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3;
- (id)insetDelegate;
- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4;
- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4;
- (id)marginDelegate;
- (id)navigationObjectReferenceForLocation:(CGPoint)a3;
- (int64_t)_rowForItem:(int64_t)a3;
- (int64_t)axis;
- (int64_t)columnForItem:(int64_t)a3;
- (int64_t)contentMode;
- (int64_t)itemClosestTo:(CGPoint)a3;
- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4;
- (int64_t)numberOfColumns;
- (int64_t)numberOfRows;
- (int64_t)numberOfVisualColumns;
- (int64_t)numberOfVisualItems;
- (int64_t)numberOfVisualRows;
- (int64_t)style;
- (int64_t)visualItemShift;
- (unsigned)accessoryMediaKind;
- (unsigned)accessoryPresentationType;
- (unsigned)mediaKind;
- (unsigned)presentationType;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unsigned)spriteInfoFlags;
- (void)_getItemSize:(CGSize *)a3 finalInteritemSpacing:(CGSize *)a4 finalInsets:(UIEdgeInsets *)a5 forDesiredInterItemSpacing:(CGSize)a6 padding:(UIEdgeInsets)a7;
- (void)_updateColumnsMetrics;
- (void)_updateContentSize;
- (void)_updateSpriteStyles;
- (void)_updateSprites;
- (void)accessoryItemsDidChange;
- (void)alphaDidChange;
- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6;
- (void)axDidReceiveFocusMovementHint:(id)a3 forSpriteAtIndex:(unsigned int)a4;
- (void)axDidUpdateFocusFromSpriteAtIndex:(unsigned int)a3 toSpriteAtIndex:(unsigned int)a4;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)dropTargetObjectReferenceDidChange;
- (void)effectsDidChange;
- (void)entityManagerDidChange;
- (void)loadedItemsDidChange;
- (void)numberOfAccessoryItemsDidChange;
- (void)referenceSizeDidChange;
- (void)safeAreaInsetsDidChange;
- (void)setAccessoryAlpha:(double)a3;
- (void)setAccessoryMediaKind:(unsigned __int8)a3;
- (void)setAccessoryPresentationType:(unsigned __int8)a3;
- (void)setAnchorObjectReference:(id)a3;
- (void)setAnchorViewportCenter:(CGPoint)a3;
- (void)setAspectRatioLimit:(double)a3;
- (void)setAxis:(int64_t)a3;
- (void)setCanHandleVisibleRectRejection:(BOOL)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setContentOrigin:(CGPoint)a3;
- (void)setEdgeCornerRadius:(id)a3;
- (void)setEnableBestCropRect:(BOOL)a3;
- (void)setEnableEffects:(BOOL)a3;
- (void)setEnablePerItemCornerRadius:(BOOL)a3;
- (void)setEnablePerItemInsets:(BOOL)a3;
- (void)setEnablePerItemMargin:(BOOL)a3;
- (void)setFillSafeAreaTopInset:(BOOL)a3;
- (void)setHideIncompleteLastRowOrColumn:(BOOL)a3;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setItemAspectRatio:(double)a3;
- (void)setItemCaptionSpacing:(double)a3;
- (void)setItemCornerRadius:(id)a3;
- (void)setItemZPosition:(float)a3;
- (void)setLoadItemsOutsideAnchorViewport:(BOOL)a3;
- (void)setMediaKind:(unsigned __int8)a3;
- (void)setMediaTargetSizeIgnoresSpacing:(BOOL)a3;
- (void)setNeedsUpdateOfScrollableAxis;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5;
- (void)setNumberOfRows:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPresentationType:(unsigned __int8)a3;
- (void)setSpriteInfoFlags:(unsigned __int8)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSupportsAutomaticContentRotation:(BOOL)a3;
- (void)setVisualItemShift:(int64_t)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXGGridLayout

void __31__PXGGridLayout__updateSprites__block_invoke_5(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5 = a2;
  unint64_t v7 = HIDWORD(a2);
  [*(id *)(a1 + 32) presentationType];
  [*(id *)(a1 + 32) mediaKind];
  [*(id *)(a1 + 32) spriteInfoFlags];
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 80) + v5;
    v10 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v12 = v9;
    id v13 = v10;
    [v12 itemsLayout:v13 marginForItem:v8];
    [v11 itemsLayout:v13 insetForItem:v8];

    PXSizeAdd();
  }
  if ([*(id *)(a1 + 32) delegateRespondsTo:32])
  {
    v15 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v15, "itemsLayout:updateTagsInSpriteInfos:forItemsInRange:", *(void *)(a1 + 32), a5, *(void *)(a1 + 80), *(unsigned int *)(a1 + 264));
  }
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 / *(unsigned int *)(a1 + 32);
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 % *(unsigned int *)(a1 + 32);
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

void __36__PXGGridLayout__updateSpriteStyles__block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v3 = [a2 mutableEffectIds];
  v4 = [*(id *)(a1 + 32) spriteDataStore];
  unsigned int v5 = v4;
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

- (id)axBorderSpriteIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v4 = [(PXGItemsLayout *)self numberOfItems];
  if ([(PXGGridLayout *)self axis] == 1) {
    int64_t v5 = [(PXGGridLayout *)self numberOfColumns];
  }
  else {
    int64_t v5 = [(PXGGridLayout *)self numberOfRows];
  }
  uint64_t v6 = v5;
  if (v4 >= v5) {
    int64_t v7 = v5;
  }
  else {
    int64_t v7 = v4;
  }
  objc_msgSend(v3, "addIndexesInRange:", 0, v7);
  if (v4 > v6) {
    objc_msgSend(v3, "addIndexesInRange:", v4 / v6 * v6, v4 % v6);
  }
  uint64_t v8 = [(PXGItemsLayout *)self spriteIndexesForItems:v3];

  return v8;
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

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  int64_t v72 = [(PXGItemsLayout *)self numberOfItems];
  v83.origin.double x = x;
  v83.origin.double y = y;
  v83.size.double width = width;
  v83.size.double height = height;
  if (CGRectIsNull(v83)
    || (v84.origin.x = x, v84.origin.y = y, v84.size.width = width, v84.size.double height = height, CGRectIsEmpty(v84))
    || !v72)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  else
  {
    id v63 = v9;
    -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v9, x, y, width, height);
    [(PXGGridLayout *)self _layoutRectInContent:"_layoutRectInContent:"];
    CGFloat v10 = v85.origin.x;
    CGFloat v11 = v85.origin.y;
    CGFloat v12 = v85.size.width;
    CGFloat v13 = v85.size.height;
    double MinY = CGRectGetMinY(v85);
    v86.origin.double x = v10;
    v86.origin.double y = v11;
    v86.size.double width = v12;
    v86.size.double height = v13;
    double MinX = CGRectGetMinX(v86);
    v87.origin.double x = v10;
    v87.origin.double y = v11;
    v87.size.double width = v12;
    v87.size.double height = v13;
    double MaxY = CGRectGetMaxY(v87);
    v88.origin.double x = v10;
    v88.origin.double y = v11;
    v88.size.double width = v12;
    v88.size.double height = v13;
    CGFloat MaxX = CGRectGetMaxX(v88);
    double top = self->_finalInsets.top;
    double left = self->_finalInsets.left;
    double itemCaptionSpacing = self->_itemCaptionSpacing;
    double v19 = self->_finalInterItemSpacing.width;
    double v18 = self->_finalInterItemSpacing.height;
    double v20 = self->_itemSize.width;
    double v21 = MinY - top + v18 + itemCaptionSpacing;
    double v22 = itemCaptionSpacing + v18 + self->_itemSize.height;
    int64_t v23 = vcvtmd_s64_f64(v21 / v22);
    int64_t v24 = vcvtmd_s64_f64((MaxY - top) / v22);
    uint64_t v25 = (uint64_t)fmax(floor((MinX - left + v19) / (v19 + v20)), 0.0);
    int64_t v26 = vcvtmd_s64_f64((MaxX - left) / (v19 + v20));
    int64_t v74 = [(PXGGridLayout *)self visualItemShift];
    id v27 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v28 = [(PXGLayout *)self spriteDataStore];
    [v28 geometries];
    v62 = v28;
    uint64_t v79 = [v28 count];
    int64_t v81 = v24;
    int64_t v73 = v26;
    uint64_t v71 = v25;
    if ([(PXGGridLayout *)self scrollableAxis] == 1)
    {
      int64_t v29 = [(PXGGridLayout *)self numberOfColumns];
      if (v23 <= v24)
      {
        int64_t v65 = v72 - 1;
        int64_t v67 = v29;
        int64_t v30 = v23;
        uint64_t v75 = v25 + v29 * v23 - v74;
        int64_t v31 = v26 + v29 * v23 - v74;
        do
        {
          v32 = self;
          int64_t v69 = v31;
          if (v31 >= v65) {
            int64_t v33 = v72 - 1;
          }
          else {
            int64_t v33 = v31;
          }
          int64_t v34 = v30 * v29 - v74;
          if (v34 + v26 >= v65) {
            uint64_t v35 = v72 - 1;
          }
          else {
            uint64_t v35 = v34 + v26;
          }
          if ((v35 & 0x8000000000000000) == 0)
          {
            uint64_t v36 = (v34 + v25) & ~((v34 + v25) >> 63);
            if (v36 < v72 && v36 <= v35)
            {
              uint64_t v38 = 0;
              uint64_t v39 = v75 & ~(v75 >> 63);
              uint64_t v40 = v39 - v33;
              do
              {
                if (!v38 || !(v40 + v38) || v30 == v23 || v30 == v24)
                {
                  uint64_t v41 = [(PXGItemsLayout *)v32 spriteIndexForItem:v39 + v38];
                  if (v41 != -1)
                  {
                    uint64_t v42 = v41;
                    if (v41 >= v79)
                    {
                      v64 = [MEMORY[0x1E4F28B00] currentHandler];
                      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, v32, @"PXGGridLayout.m", 1372, @"spriteIndex %i out of bounds 0..<%i", v42, v79);
                    }
                    PXRectWithCenterAndSize();
                  }
                }
                [v27 addIndex:v39 + v38++];
              }
              while (v39 + v38 - 1 < v35);
            }
          }
          int64_t v29 = v67;
          v75 += v67;
          int64_t v31 = v69 + v67;
          BOOL v48 = v30++ == v24;
          self = v32;
          int64_t v26 = v73;
        }
        while (!v48);
      }
    }
    else
    {
      int64_t v43 = [(PXGGridLayout *)self numberOfRows];
      if (v25 <= v26)
      {
        uint64_t v44 = v25;
        int64_t v66 = v72 - 1;
        int64_t v68 = v43;
        uint64_t v76 = v23 + v43 * v25 - v74;
        int64_t v45 = v24 + v43 * v25 - v74;
        do
        {
          v46 = self;
          int64_t v70 = v45;
          if (v45 >= v66) {
            int64_t v47 = v72 - 1;
          }
          else {
            int64_t v47 = v45;
          }
          BOOL v48 = v44 == v71 || v44 == v26;
          char v49 = v48;
          int64_t v50 = v44 * v43 - v74;
          if (v50 + v24 >= v66) {
            uint64_t v51 = v72 - 1;
          }
          else {
            uint64_t v51 = v50 + v24;
          }
          if ((v51 & 0x8000000000000000) == 0)
          {
            uint64_t v52 = (v50 + v23) & ~((v50 + v23) >> 63);
            if (v52 < v72 && v52 <= v51)
            {
              uint64_t v54 = 0;
              uint64_t v55 = v76 & ~(v76 >> 63);
              uint64_t v56 = v55 - v47;
              do
              {
                if ((v49 & 1) != 0 || !v54 || !(v56 + v54))
                {
                  uint64_t v57 = [(PXGItemsLayout *)v46 spriteIndexForItem:v55 + v54];
                  if (v57 != -1)
                  {
                    uint64_t v58 = v57;
                    if (v57 >= v79)
                    {
                      v60 = [MEMORY[0x1E4F28B00] currentHandler];
                      objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, v46, @"PXGGridLayout.m", 1399, @"spriteIndex %i out of bounds 0..<%i", v58, v79);
                    }
                    PXRectWithCenterAndSize();
                  }
                }
                [v27 addIndex:v55 + v54++];
              }
              while (v55 + v54 - 1 < v51);
            }
          }
          int64_t v43 = v68;
          v76 += v68;
          int64_t v45 = v70 + v68;
          int64_t v26 = v73;
          BOOL v48 = v44++ == v73;
          self = v46;
          int64_t v24 = v81;
        }
        while (!v48);
      }
    }

    id v9 = v63;
  }

  return v27;
}

- (void)_updateColumnsMetrics
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  CGSize v29 = (CGSize)0;
  CGSize v28 = (CGSize)0;
  long long v26 = 0u;
  long long v27 = 0u;
  [(PXGGridLayout *)self interItemSpacing];
  double v4 = v3;
  double v6 = v5;
  [(PXGGridLayout *)self padding];
  -[PXGGridLayout _getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:](self, "_getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:", &v29, &v28, &v26, v4, v6, v7, v8, v9, v10);
  if (fabs(v29.height) == INFINITY
    || v29.width < 0.0
    || ((double v11 = fabs(v29.width), v29.height >= 0.0) ? (v12 = v11 == INFINITY) : (v12 = 1), v12))
  {
    PXAssertGetLog();
  }
  if (v29.width == self->_itemSize.width
    && v29.height == self->_itemSize.height
    && v28.width == self->_finalInterItemSpacing.width
    && v28.height == self->_finalInterItemSpacing.height)
  {
    PXEdgeInsetsEqualToEdgeInsets();
  }
  self->_itemSize = v29;
  long long v15 = v27;
  self->_finalInterItemSpacing = v28;
  *(_OWORD *)&self->_finalInsets.double top = v26;
  *(_OWORD *)&self->_finalInsets.bottom = v15;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_25:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xE;
      goto LABEL_26;
    }
LABEL_24:
    if ((self->_updateFlags.updated & 0xE) != 0)
    {
      int64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v25 = [NSString stringWithUTF8String:"-[PXGGridLayout _updateColumnsMetrics]"];
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"PXGGridLayout.m", 179, @"invalidating %lu after it already has been updated", 14);

      abort();
    }
    goto LABEL_25;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_24;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 14;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
LABEL_26:
  [(PXGItemsLayout *)self invalidateLoadedItems];
  if ([(PXGGridLayout *)self scrollableAxis] == 2) {
    int64_t v18 = [(PXGGridLayout *)self numberOfRows];
  }
  else {
    int64_t v18 = [(PXGGridLayout *)self numberOfColumns];
  }
  uint64_t v19 = v18;
  double v20 = [(PXGLayout *)self axGroup];
  [v20 setNonScrollingAxisItemCount:v19];
  if (v19 < 15)
  {
    double v21 = +[PXUserDefaults standardUserDefaults];
    double v22 = [v21 axExposeAllVisibleElements];

    if (v22)
    {
      objc_msgSend(v20, "setLeafFeatures:", objc_msgSend(v20, "leafFeatures") | 2);
      [v20 invalidateLeafs];
    }
  }
  else
  {
    objc_msgSend(v20, "setLeafFeatures:", objc_msgSend(v20, "leafFeatures") & 0xFFFFFFFFFFFFFFFBLL);
  }
}

- (BOOL)itemCaptionsVisible
{
  [(PXGGridLayout *)self itemCaptionSpacing];
  return v2 > 0.0;
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

- (CGRect)loadedItemsRect
{
  uint64_t v3 = [(PXGItemsLayout *)self loadedItems];
  if (v4)
  {
    uint64_t v5 = v4 + v3 - 1;
    [(PXGGridLayout *)self frameForItem:v3];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [(PXGGridLayout *)self frameForItem:v5];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v26.origin.double x = v7;
    v26.origin.double y = v9;
    v26.size.double width = v11;
    v26.size.double height = v13;
    CGRectGetMinY(v26);
    [(PXGLayout *)self referenceSize];
    v27.origin.double x = v15;
    v27.origin.double y = v17;
    v27.size.double width = v19;
    v27.size.double height = v21;
    CGRectGetMaxY(v27);
    PXRectWithEdges();
  }
  double v22 = *MEMORY[0x1E4F1DB28];
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)frameForItem:(int64_t)a3
{
  p_finalInterItemSpacing = &self->_finalInterItemSpacing;
  p_itemSize = &self->_itemSize;
  p_finalInsets = &self->_finalInsets;
  int64_t v8 = [(PXGGridLayout *)self contentMode];
  double width = p_finalInterItemSpacing->width;
  double height = p_finalInterItemSpacing->height;
  double v11 = p_itemSize->width;
  double v12 = p_itemSize->height;
  double top = p_finalInsets->top;
  double left = p_finalInsets->left;
  double bottom = p_finalInsets->bottom;
  double right = p_finalInsets->right;
  -[PXGGridLayout _frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:](self, "_frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:", a3, v8, width, height, v11, v12, top, left, bottom, right);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  if ([(PXGGridLayout *)self scrollableAxis] == 2)
  {
    uint64_t v7 = [(PXGGridLayout *)self numberOfRows];
    uint64_t v8 = [(PXGItemsLayout *)self numberOfItems];
    return PXGItemsGeometryItemClosestToItemHorizontalGridDefaultImplementation(a3, a4, v7, v8);
  }
  else
  {
    uint64_t v10 = [(PXGGridLayout *)self numberOfColumns];
    uint64_t v11 = [(PXGItemsLayout *)self numberOfItems];
    return PXGItemsGeometryItemClosestToItemVerticalGridDefaultImplementation(a3, a4, v10, v11);
  }
}

- (CGRect)_frameForItem:(int64_t)a3 usingInterItemSpacing:(CGSize)a4 itemSize:(CGSize)a5 insets:(UIEdgeInsets)a6 contentMode:(int64_t)a7
{
  double left = a6.left;
  double top = a6.top;
  double height = a5.height;
  double width = a5.width;
  double v12 = a4.height;
  double v13 = a4.width;
  int64_t v16 = -[PXGGridLayout _rowForItem:](self, "_rowForItem:", a4.width, a4.height, a5.width, a5.height, a6.top, a6.left, a6.bottom, a6.right);
  int64_t v17 = [(PXGGridLayout *)self columnForItem:a3];
  uint64_t v18 = v16 - (v16 >= [(PXGGridLayout *)self numberOfVisualRows]);
  double v19 = left
      + (double)(v17 - (v17 >= [(PXGGridLayout *)self numberOfVisualColumns])) * (v13 + width);
  double v20 = top + (double)v18 * (v12 + height + self->_itemCaptionSpacing);
  if ([(PXGItemsLayout *)self delegateRespondsTo:4])
  {
    CGFloat v21 = [(PXGItemsLayout *)self delegate];
    double v22 = v21;
    if (a7 == 1 && v21)
    {
      [v21 itemsLayout:self aspectRatioForItem:a3];
      [(PXGGridLayout *)self aspectRatioLimit];
      PXClamp();
    }
  }
  else
  {
    double v22 = 0;
  }
  -[PXGGridLayout _contentRectInLayout:](self, "_contentRectInLayout:", v19, v20, width, height);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (int64_t)numberOfVisualColumns
{
  if ([(PXGGridLayout *)self scrollableAxis] == 1)
  {
    return [(PXGGridLayout *)self numberOfColumns];
  }
  else
  {
    int64_t v4 = [(PXGGridLayout *)self numberOfRows];
    int64_t v5 = [(PXGGridLayout *)self numberOfVisualItems];
    int64_t v6 = (v4 + v5 - 1) / v4;
    if (v6 >= 2)
    {
      uint64_t v7 = v5;
      if ([(PXGGridLayout *)self hideIncompleteLastRowOrColumn]) {
        v6 -= v7 % v4 != 0;
      }
    }
    return v6;
  }
}

- (int64_t)columnForItem:(int64_t)a3
{
  int64_t v4 = self->_visualItemShift + a3;
  if ([(PXGGridLayout *)self scrollableAxis] == 2)
  {
    if (v4 < 0) {
      v4 += [(PXGGridLayout *)self numberOfRows];
    }
    return v4 / [(PXGGridLayout *)self numberOfRows];
  }
  else
  {
    if (v4 < 0) {
      v4 += [(PXGGridLayout *)self numberOfColumns];
    }
    return v4 % [(PXGGridLayout *)self numberOfColumns];
  }
}

- (int64_t)numberOfVisualRows
{
  if ([(PXGGridLayout *)self scrollableAxis] == 2)
  {
    return [(PXGGridLayout *)self numberOfRows];
  }
  else
  {
    int64_t v4 = [(PXGGridLayout *)self numberOfColumns];
    int64_t v5 = [(PXGGridLayout *)self numberOfVisualItems];
    int64_t v6 = (v4 + v5 - 1) / v4;
    if (v6 >= 2)
    {
      uint64_t v7 = v5;
      if ([(PXGGridLayout *)self hideIncompleteLastRowOrColumn]) {
        v6 -= v7 % v4 != 0;
      }
    }
    return v6;
  }
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (int64_t)axis
{
  return self->_axis;
}

- (int64_t)numberOfVisualItems
{
  int64_t v3 = [(PXGItemsLayout *)self numberOfItems];
  int64_t v4 = [(PXGGridLayout *)self visualItemShift] + v3;
  int64_t v5 = [(PXGItemsLayout *)self numberOfAccessoryItems];
  return (v4 + v5) & ~((v4 + v5) >> 63);
}

- (int64_t)visualItemShift
{
  return self->_visualItemShift;
}

- (BOOL)hideIncompleteLastRowOrColumn
{
  return self->_hideIncompleteLastRowOrColumn;
}

- (int64_t)_rowForItem:(int64_t)a3
{
  int64_t v4 = self->_visualItemShift + a3;
  if ([(PXGGridLayout *)self scrollableAxis] == 2)
  {
    if (v4 < 0) {
      v4 += [(PXGGridLayout *)self numberOfRows];
    }
    return v4 % [(PXGGridLayout *)self numberOfRows];
  }
  else
  {
    if (v4 < 0) {
      v4 += [(PXGGridLayout *)self numberOfColumns];
    }
    return v4 / [(PXGGridLayout *)self numberOfColumns];
  }
}

- (CGRect)_contentRectInLayout:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  -[PXGGridLayout _contentPointInLayout:](self, "_contentPointInLayout:", a3.origin.x, a3.origin.y);
  double v7 = width;
  double v8 = height;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGPoint)_contentPointInLayout:(CGPoint)a3
{
  [(PXGGridLayout *)self contentOrigin];
  PXPointAdd();
}

- (CGPoint)contentOrigin
{
  double x = self->_contentOrigin.x;
  double y = self->_contentOrigin.y;
  result.double y = y;
  result.double x = x;
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

- (void)_getItemSize:(CGSize *)a3 finalInteritemSpacing:(CGSize *)a4 finalInsets:(UIEdgeInsets *)a5 forDesiredInterItemSpacing:(CGSize)a6 padding:(UIEdgeInsets)a7
{
  double right = a7.right;
  double bottom = a7.bottom;
  double left = a7.left;
  double top = a7.top;
  double height = a6.height;
  double width = a6.width;
  uint64_t v16 = [(PXGGridLayout *)self numberOfColumns];
  uint64_t v17 = [(PXGGridLayout *)self numberOfRows];
  [(PXGLayout *)self referenceSize];
  double v39 = left;
  double v41 = right;
  double v35 = v18 - left - right;
  [(PXGLayout *)self referenceSize];
  double v38 = top;
  double v40 = bottom;
  double v34 = v19 - top - bottom;
  [(PXGLayout *)self displayScale];
  double v36 = v20;
  int64_t v21 = [(PXGGridLayout *)self style];
  int64_t v22 = [(PXGGridLayout *)self scrollableAxis];
  if (v21 == 2) {
    goto LABEL_4;
  }
  if (v21 == 1)
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    if (v22 == 2) {
      +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:v17 screenScale:&v43 columns:&v42 bestSpacing:v34 bestInset:v36];
    }
    else {
      +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:v16 screenScale:&v43 columns:&v42 bestSpacing:v35 bestInset:v36];
    }
    PXEdgeInsetsAdd();
  }
  double v23 = 0.0;
  double v24 = 0.0;
  CGFloat v25 = 0.0;
  CGFloat v26 = 0.0;
  CGFloat v27 = 0.0;
  CGFloat v28 = 0.0;
  if (v21)
  {
    [(PXGGridLayout *)self itemAspectRatio];
    double v32 = 0.0 * v31;
    double v33 = 0.0 / v31;
    if (v22 == 2) {
      double v23 = v32;
    }
    else {
      double v24 = v33;
    }
    CGFloat v30 = 0.0;
    double width = 0.0;
  }
  else
  {
LABEL_4:
    [(PXGGridLayout *)self itemAspectRatio];
    if (v22 == 2)
    {
      CGFloat v30 = height;
      CGFloat v25 = v38;
      double v24 = (v34 - (double)(v17 - 1) * height) / (double)v17;
      double v23 = v24 * v29;
      CGFloat v27 = v40;
      CGFloat v28 = v41;
      CGFloat v26 = v39;
      if (v21 == 2) {
        PXFloatRoundToPixel();
      }
    }
    else
    {
      double v23 = (v35 - (double)(v16 - 1) * width) / (double)v16;
      double v24 = v23 / v29;
      CGFloat v27 = v40;
      CGFloat v28 = v41;
      CGFloat v25 = v38;
      CGFloat v26 = v39;
      if (v21 == 2) {
        PXFloatRoundToPixel();
      }
      CGFloat v30 = height;
    }
  }
  a3->double width = v23;
  a3->double height = v24;
  a4->double width = width;
  a4->double height = v30;
  a5->double top = v25;
  a5->double left = v26;
  a5->double bottom = v27;
  a5->double right = v28;
}

- (int64_t)style
{
  return self->_style;
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGGridLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXGItemsLayout *)self invalidateLoadedItems];
}

- (BOOL)shiftItem:(int64_t)a3 toColumn:(int64_t)a4 topPaddingRows:(int64_t)a5 hideIncompleteRows:(BOOL)a6
{
  int64_t v12 = [(PXGGridLayout *)self numberOfColumns];
  int64_t v13 = v12;
  int64_t v14 = v12 - 1;
  if (v12 - 1 >= a4) {
    int64_t v14 = a4;
  }
  uint64_t v15 = (v14 & ~(v14 >> 63)) + a3 / v12 * v12 - a3;
  if (v15 < 0)
  {
    v15 += v12;
    if (v15 < 0)
    {
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PXZoomablePhotosContentLayout.m", 29, @"Invalid parameter not satisfying: %@", @"visualItemShift >= 0" object file lineNumber description];
    }
  }
  if (v15 > 0 && a6) {
    int64_t v16 = v13;
  }
  else {
    int64_t v16 = 0;
  }
  [(PXGGridLayout *)self setVisualItemShift:v15 + v13 * a5 - v16];
  return 1;
}

- (void)setVisualItemShift:(int64_t)a3
{
  if (self->_visualItemShift == a3) {
    return;
  }
  self->_visualItemShift = a3;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 14;
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
    if ((self->_updateFlags.updated & 0xE) != 0)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = [NSString stringWithUTF8String:"-[PXGGridLayout setVisualItemShift:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGGridLayout.m", 1194, @"invalidating %lu after it already has been updated", 14);

      abort();
    }
  }
  p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xE;
LABEL_8:
  [(PXGItemsLayout *)self invalidateLoadedItems];
}

- (void)safeAreaInsetsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGLayout *)&v8 safeAreaInsetsDidChange];
  if ([(PXGGridLayout *)self fillSafeAreaTopInset])
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
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout safeAreaInsetsDidChange]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1017, @"invalidating %lu after it already has been updated", 2);

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

- (void)referenceSizeDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGLayout *)&v8 referenceSizeDidChange];
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
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout referenceSizeDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 989, @"invalidating %lu after it already has been updated", 1);

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
  v8.super_class = (Class)PXGGridLayout;
  [(PXGLayout *)&v8 displayScaleDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 5;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 5) != 0)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout displayScaleDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 994, @"invalidating %lu after it already has been updated", 5);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 5;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_super v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v4 = [NSString stringWithUTF8String:"-[PXGGridLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGGridLayout.m", 120, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_super v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v4 = [NSString stringWithUTF8String:"-[PXGGridLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGGridLayout.m", 163, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)setSpriteInfoFlags:(unsigned __int8)a3
{
  if (self->_spriteInfoFlags != a3)
  {
    self->_spriteInfoFlags = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setSpriteInfoFlags:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1268, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (unsigned)spriteInfoFlags
{
  return self->_spriteInfoFlags;
}

- (id)anchorObjectReference
{
  return self->_anchorObjectReference;
}

- (double)rowHeight
{
  return self->_itemSize.height + self->_finalInterItemSpacing.height + self->_itemCaptionSpacing;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  PXSizeApproximatelyEqualToSize();
}

- (BOOL)supportsContentMode
{
  return 1;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
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
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setStyle:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1051, @"invalidating %lu after it already has been updated", 1);

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

- (void)setPadding:(UIEdgeInsets)a3
{
}

- (void)setItemCornerRadius:(id)a3
{
  if (v3 != self->_itemCornerRadius.var0.var0.topLeft
    || v4 != self->_itemCornerRadius.var0.var0.topRight
    || v5 != self->_itemCornerRadius.var0.var0.bottomLeft
    || v6 != self->_itemCornerRadius.var0.var0.bottomRight)
  {
    self->_itemCornerRadius.var0.var0.topLeft = v3;
    self->_itemCornerRadius.var0.var0.topRight = v4;
    self->_itemCornerRadius.var0.var0.bottomLeft = v5;
    self->_itemCornerRadius.var0.var0.bottomRight = v6;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_16:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_15:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        int64_t v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3.var0.var0.var0, *(void *)&a3.var0.var1[2]);
        int64_t v14 = [NSString stringWithUTF8String:"-[PXGGridLayout setItemCornerRadius:]"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXGGridLayout.m", 1236, @"invalidating %lu after it already has been updated", 8);

        abort();
      }
      goto LABEL_16;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_15;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 8;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setItemCaptionSpacing:(double)a3
{
  if (self->_itemCaptionSpacing == a3) {
    return;
  }
  self->_double itemCaptionSpacing = a3;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 6;
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
    if ((self->_updateFlags.updated & 6) != 0)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v8 = [NSString stringWithUTF8String:"-[PXGGridLayout setItemCaptionSpacing:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGGridLayout.m", 1168, @"invalidating %lu after it already has been updated", 6);

      abort();
    }
  }
  p_updateFlags->unint64_t needsUpdate = needsUpdate | 6;
LABEL_8:
  [(PXGLayout *)self invalidateDecoration];
}

- (void)setItemAspectRatio:(double)a3
{
  if (self->_itemAspectRatio != a3)
  {
    self->_itemAspectRatio = a3;
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
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setItemAspectRatio:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1177, @"invalidating %lu after it already has been updated", 1);

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

- (void)setHideIncompleteLastRowOrColumn:(BOOL)a3
{
  if (self->_hideIncompleteLastRowOrColumn == a3) {
    return;
  }
  self->_hideIncompleteLastRowOrColumn = a3;
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->unint64_t needsUpdate = 14;
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
    if ((self->_updateFlags.updated & 0xE) != 0)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v8 = [NSString stringWithUTF8String:"-[PXGGridLayout setHideIncompleteLastRowOrColumn:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGGridLayout.m", 1203, @"invalidating %lu after it already has been updated", 14);

      abort();
    }
  }
  p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xE;
LABEL_8:
  [(PXGItemsLayout *)self invalidateLoadedItems];
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
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setFillSafeAreaTopInset:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1151, @"invalidating %lu after it already has been updated", 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 15;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setEnablePerItemInsets:(BOOL)a3
{
  if (self->_enablePerItemInsets != a3)
  {
    self->_enablePerItemInsets = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setEnablePerItemInsets:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1100, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
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
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setEnablePerItemCornerRadius:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1092, @"invalidating %lu after it already has been updated", 8);

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
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setEnableEffects:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1084, @"invalidating %lu after it already has been updated", 8);

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
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setEnableBestCropRect:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1076, @"invalidating %lu after it already has been updated", 8);

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

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    [(PXGLayout *)self invalidateDecoration];
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        double v7 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_super v8 = [NSString stringWithUTF8String:"-[PXGGridLayout setContentMode:]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGGridLayout.m", 1068, @"invalidating %lu after it already has been updated", 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 15;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setLoadItemsOutsideAnchorViewport:(BOOL)a3
{
  if (self->_loadItemsOutsideAnchorViewport != a3)
  {
    self->_loadItemsOutsideAnchorViewport = a3;
    [(PXGItemsLayout *)self invalidateLoadedItems];
  }
}

- (void)setAccessoryAlpha:(double)a3
{
  if (self->_accessoryAlpha != a3)
  {
    self->_accessoryAlpha = a3;
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
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setAccessoryAlpha:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1292, @"invalidating %lu after it already has been updated", 8);

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

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (void)dropTargetObjectReferenceDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v8 dropTargetObjectReferenceDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      float v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout dropTargetObjectReferenceDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 982, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

uint64_t __36__PXGGridLayout__updateSpriteStyles__block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  v43[4] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v7 = a2;
    long long v39 = *((_OWORD *)off_1E5DAAF90 + 6);
    float32x4_t v40 = *(float32x4_t *)off_1E5DAAF40;
    long long v37 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v38 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v35 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v36 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v33 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v34 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v31 = *(_OWORD *)off_1E5DAAF90;
    long long v32 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v30 = *((_OWORD *)off_1E5DAAF90 + 1);
    uint64_t v8 = a4;
    do
    {
      uint64_t v9 = *(void *)(v5 + 72) + v7;
      float32x4_t v10 = v40;
      if (*(unsigned char *)(v5 + 156))
      {
        [*(id *)(v5 + 32) itemsLayout:*(void *)(v5 + 40) bestCropRectForItem:*(void *)(v5 + 72) + v7 withAspectRatio:*(double *)(v5 + 80)];
        v12.f64[1] = v11;
        v14.f64[1] = v13;
        float32x4_t v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v12);
      }
      if (*(unsigned char *)(v5 + 157))
      {
        float32x4_t v41 = v10;
        [*(id *)(v5 + 48) itemsLayout:*(void *)(v5 + 40) cornerRadiusForItem:v9];
        float32x4_t v10 = v41;
      }
      else
      {
        int v15 = *(_DWORD *)(v5 + 120);
        int v16 = *(_DWORD *)(v5 + 124);
        int v17 = *(_DWORD *)(v5 + 128);
        int v18 = *(_DWORD *)(v5 + 132);
      }
      *(_OWORD *)(v8 + 96) = v39;
      *(_OWORD *)(v8 + 112) = v38;
      *(_OWORD *)(v8 + 128) = v37;
      *(_OWORD *)(v8 + 144) = v36;
      *(_OWORD *)(v8 + 32) = v35;
      *(_OWORD *)(v8 + 48) = v34;
      *(_OWORD *)(v8 + 64) = v33;
      *(_OWORD *)(v8 + 80) = v32;
      *(_OWORD *)uint64_t v8 = v31;
      *(_OWORD *)(v8 + 16) = v30;
      *(float32x4_t *)(v8 + 4) = v10;
      *(_DWORD *)(v8 + 36) = v15;
      *(_DWORD *)(v8 + 40) = v16;
      *(_DWORD *)(v8 + 44) = v17;
      *(_DWORD *)(v8 + 48) = v18;
      float v19 = *(double *)(v5 + 88);
      *(float *)uint64_t v8 = v19;
      $6FCFBD36564ECBB6D9D1614A84D6F83D result = objc_msgSend(*(id *)(v5 + 56), "itemsLayout:rotationAngleForItem:", *(void *)(v5 + 40), v9, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
      *(float *)&double v20 = v20;
      *(_DWORD *)(v8 + 56) = LODWORD(v20);
      if (*(unsigned char *)(v5 + 158))
      {
        if (!*(unsigned char *)(v5 + 159))
        {
          $6FCFBD36564ECBB6D9D1614A84D6F83D result = [*(id *)(v5 + 64) itemsLayout:*(void *)(v5 + 40) aspectRatioForItem:v9];
          double v22 = *(double *)(v5 + 80);
          if ((v22 <= 0.99 || v22 >= 1.01)
            && (v21 <= 0.99 || v21 >= 1.01)
            && (v21 < 1.0 && v22 > 1.0 || v21 > 1.0 && v22 < 1.0))
          {
            *(unsigned char *)(v8 + 70) = 1;
          }
        }
      }
      ++v7;
      v8 += 160;
      LODWORD(v6) = v6 - 1;
    }
    while (v6);
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)(v5 + 136), *(float32x4_t *)off_1E5DAAF50)), 0xFuLL))) & 1) == 0&& *(uint64_t *)(v5 + 96) >= 1)
  {
    uint64_t v23 = [*(id *)(v5 + 40) numberOfVisualRows] - 1;
    uint64_t v24 = [*(id *)(v5 + 40) numberOfVisualColumns] - 1;
    uint64_t v25 = [*(id *)(v5 + 40) numberOfColumns];
    $6FCFBD36564ECBB6D9D1614A84D6F83D result = [*(id *)(v5 + 40) numberOfRows];
    uint64_t v26 = 0;
    v43[0] = 0;
    v43[1] = result * v24;
    v43[2] = result - 1;
    v43[3] = result * v24 + result - 1;
    v42[0] = 0;
    v42[1] = v25 - 1;
    v42[2] = v25 * v23;
    v42[3] = v25 * v23 + v25 - 1;
    CGFloat v27 = v42;
    if (*(void *)(v5 + 104) == 2) {
      CGFloat v27 = v43;
    }
    do
    {
      uint64_t v28 = v27[v26];
      uint64_t v29 = *(void *)(v5 + 112);
      if (v28 - v29 >= 0 && v28 - v29 < (unint64_t)*(unsigned int *)(v5 + 152)) {
        *(_DWORD *)(a4 + 36 + 160 * v28 - 160 * v29 + 4 * v26) = *(_DWORD *)(v5 + 136 + 4 * v26);
      }
      ++v26;
    }
    while (v26 != 4);
  }
  return result;
}

- (void)entityManagerDidChange
{
  v11.receiver = self;
  v11.super_class = (Class)PXGGridLayout;
  [(PXGLayout *)&v11 entityManagerDidChange];
  uint64_t v3 = [(PXGLayout *)self entityManager];
  if (v3)
  {
    float v4 = (void *)v3;
    BOOL v5 = [(PXGGridLayout *)self enableEffects];

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
          uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
          float32x4_t v10 = [NSString stringWithUTF8String:"-[PXGGridLayout entityManagerDidChange]"];
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXGGridLayout.m", 1000, @"invalidating %lu after it already has been updated", 8);

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

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXGGridLayout;
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
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xE;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 0xE) != 0)
      {
        float64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        float64x2_t v14 = [NSString stringWithUTF8String:"-[PXGGridLayout setNumberOfItems:withChangeDetails:changeMediaVersionHandler:]"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXGGridLayout.m", 1307, @"invalidating %lu after it already has been updated", 14);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_7;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 14;
    if (!willPerformUpdate) {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
LABEL_9:
}

- (void)setNumberOfColumns:(int64_t)a3
{
  if (self->_numberOfColumns != a3)
  {
    self->_numberOfColumns = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        unsigned int v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setNumberOfColumns:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1125, @"invalidating %lu after it already has been updated", 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 15;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (_NSRange)_itemsToLoadForVisibleRect:(CGRect)a3
{
  if ([(PXGItemsLayout *)self isLazy])
  {
    [(PXGGridLayout *)self anchorViewportCenter];
    PXPointIsNull();
  }
  int64_t v4 = [(PXGItemsLayout *)self numberOfItems];
  NSUInteger v5 = 0;
  NSUInteger v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (_NSRange)itemRangeInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsNull(a3)) {
    goto LABEL_23;
  }
  v56.origin.double x = x;
  v56.origin.double y = y;
  v56.size.double width = width;
  v56.size.double height = height;
  if (CGRectIsEmpty(v56)) {
    goto LABEL_23;
  }
  -[PXGGridLayout _layoutRectInContent:](self, "_layoutRectInContent:", x, y, width, height);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  uint64_t v17 = [(PXGItemsLayout *)self numberOfItems];
  int64_t v18 = [(PXGGridLayout *)self scrollableAxis];
  v57.origin.double x = v10;
  v57.origin.double y = v12;
  v57.size.double width = v14;
  v57.size.double height = v16;
  double MinY = CGRectGetMinY(v57);
  v58.origin.double x = v10;
  v58.origin.double y = v12;
  v58.size.double width = v14;
  v58.size.double height = v16;
  double MaxY = CGRectGetMaxY(v58);
  v59.origin.double x = v10;
  v59.origin.double y = v12;
  v59.size.double width = v14;
  v59.size.double height = v16;
  double MinX = CGRectGetMinX(v59);
  v60.origin.double x = v10;
  v60.origin.double y = v12;
  v60.size.double width = v14;
  v60.size.double height = v16;
  double MaxX = CGRectGetMaxX(v60);
  if (v18 == 2)
  {
    uint64_t v23 = v17 - 1;
    if (v17 >= 1)
    {
      NSUInteger v24 = 0;
      unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      if (fabs(MinX) == INFINITY || fabs(MaxX) == INFINITY) {
        goto LABEL_25;
      }
      double left = self->_finalInsets.left;
      double v27 = self->_finalInterItemSpacing.width;
      double v28 = v27 + self->_itemSize.width;
      unint64_t v29 = vcvtmd_s64_f64((MinX - left + v27) / v28);
      unint64_t v30 = vcvtpd_s64_f64((MaxX - left + v27) / v28);
      int64_t v31 = [(PXGGridLayout *)self visualItemShift];
      int64_t v32 = [(PXGGridLayout *)self numberOfRows];
      uint64_t v33 = v32 * v29 - v31;
      if (v33 >= v23) {
        uint64_t v33 = v23;
      }
      unint64_t v25 = v33 & ~(v33 >> 63);
      uint64_t v34 = ~v31 + v32 * v30;
      if (v34 >= v23) {
        uint64_t v34 = v23;
      }
      unint64_t v35 = v34 & ~(v34 >> 63);
      if (v35 >= v25)
      {
        unint64_t v36 = v35 + 1;
        NSUInteger v24 = v35 + 1 - v25;
        if (v35 >= [(PXGItemsLayout *)self numberOfItems])
        {
          long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
          [v37 handleFailureInMethod:a2, self, @"PXGGridLayout.m", 729, @"Should not return items out of bounds (horiz), %lu < %ld.", v36, -[PXGItemsLayout numberOfItems](self, "numberOfItems") object file lineNumber description];
LABEL_27:

          goto LABEL_25;
        }
        goto LABEL_25;
      }
LABEL_23:
      NSUInteger v24 = 0;
      unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_25;
    }
  }
  NSUInteger v24 = 0;
  unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (v18 == 2) {
    goto LABEL_25;
  }
  BOOL v38 = v17 < 1;
  uint64_t v39 = v17 - 1;
  if (v38 || fabs(MinY) == INFINITY || fabs(MaxY) == INFINITY) {
    goto LABEL_25;
  }
  double top = self->_finalInsets.top;
  double v41 = self->_finalInterItemSpacing.height;
  double itemCaptionSpacing = self->_itemCaptionSpacing;
  double v43 = MinY - top + v41 + itemCaptionSpacing;
  double v44 = itemCaptionSpacing + v41 + self->_itemSize.height;
  unint64_t v45 = vcvtmd_s64_f64(v43 / v44);
  unint64_t v46 = vcvtpd_s64_f64((MaxY - top) / v44);
  int64_t v47 = [(PXGGridLayout *)self visualItemShift];
  int64_t v48 = [(PXGGridLayout *)self numberOfColumns];
  uint64_t v49 = v48 * v45 - v47;
  if (v49 >= v39) {
    uint64_t v49 = v39;
  }
  unint64_t v25 = v49 & ~(v49 >> 63);
  uint64_t v50 = ~v47 + v48 * v46;
  if (v50 >= v39) {
    uint64_t v50 = v39;
  }
  unint64_t v51 = v50 & ~(v50 >> 63);
  if (v51 < v25) {
    goto LABEL_23;
  }
  unint64_t v52 = v51 + 1;
  NSUInteger v24 = v51 + 1 - v25;
  if (v51 >= [(PXGItemsLayout *)self numberOfItems])
  {
    long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PXGGridLayout.m", 746, @"Should not return items out of bounds (vert), %lu < %ld.", v52, -[PXGItemsLayout numberOfItems](self, "numberOfItems") object file lineNumber description];
    goto LABEL_27;
  }
LABEL_25:
  NSUInteger v53 = v25;
  NSUInteger v54 = v24;
  result.length = v54;
  result.location = v53;
  return result;
}

- (CGRect)_layoutRectInContent:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  -[PXGGridLayout _layoutPointInContent:](self, "_layoutPointInContent:", a3.origin.x, a3.origin.y);
  double v7 = width;
  double v8 = height;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGPoint)_layoutPointInContent:(CGPoint)a3
{
  [(PXGGridLayout *)self contentOrigin];
  PXPointSubtract();
}

- (CGPoint)anchorViewportCenter
{
  double x = self->_anchorViewportCenter.x;
  double y = self->_anchorViewportCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_pageAlignedRectForVisibleRect:(CGRect)a3
{
  int64_t v4 = +[PXGTextureManagerPreheatingStrategy defaultPreheatingStrategy];
  [v4 maxPreheatingDistance];

  if ([(PXGGridLayout *)self scrollableAxis] == 2) {
    PXEdgeInsetsMake();
  }
  PXEdgeInsetsMake();
}

- (void)setMediaTargetSizeIgnoresSpacing:(BOOL)a3
{
  self->_mediaTargetSizeIgnoresSpacing = a3;
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
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setMediaKind:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1260, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setCanHandleVisibleRectRejection:(BOOL)a3
{
  self->_canHandleVisibleRectRejection = a3;
}

- (void)setAccessoryPresentationType:(unsigned __int8)a3
{
  if (self->_accessoryPresentationType != a3)
  {
    self->_accessoryPresentationType = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setAccessoryPresentationType:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1300, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setAccessoryMediaKind:(unsigned __int8)a3
{
  if (self->_accessoryMediaKind != a3)
  {
    self->_accessoryMediaKind = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        double v6 = [MEMORY[0x1E4F28B00] currentHandler];
        double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setAccessoryMediaKind:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1284, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (PXGGridLayout)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXGGridLayout;
  CGPoint result = [(PXGItemsLayout *)&v9 init];
  if (result)
  {
    result->_style = 0;
    result->_axis = 1;
    result->_numberOfColumns = 4;
    result->_numberOfRows = 4;
    __asm { FMOV            V0.2D, #1.0 }
    result->_interItemSpacing = _Q0;
    result->_itemAspectRatio = 1.0;
    $E57FD295544FE3DD2B3C272D7C23EB59 v8 = *($E57FD295544FE3DD2B3C272D7C23EB59 *)off_1E5DAAF50;
    result->_itemCornerRadius = *($E57FD295544FE3DD2B3C272D7C23EB59 *)off_1E5DAAF50;
    result->_edgeCornerRadius = v8;
    result->_aspectRatioLimit = 4.0;
  }
  return result;
}

- (void)update
{
  BOOL isUpdating = self->_isUpdating;
  self->_BOOL isUpdating = 1;
  int64_t v4 = [(PXGLayout *)self rootLayout];
  double v5 = [v4 activeAnchor];

  if (v5) {
    [(PXGItemsLayout *)self invalidateLoadedItems];
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    self->_updateFlags.BOOL willPerformUpdate = 0;
  }
  else
  {
    [(PXGItemsLayout *)self updateLoadedItemsIfNeeded];
    [(PXGItemsLayout *)self updateAccessoryItemsIfNeeded];
    unint64_t needsUpdate = p_updateFlags->needsUpdate;
    self->_updateFlags.BOOL willPerformUpdate = 0;
    if (!needsUpdate) {
      goto LABEL_23;
    }
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v12 = [NSString stringWithUTF8String:"-[PXGGridLayout update]"];
    [v11 handleFailureInFunction:v12, @"PXGGridLayout.m", 138, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if (needsUpdate)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    [(PXGGridLayout *)self _updateColumnsMetrics];
    if (!self->_updateFlags.isPerformingUpdate)
    {
      float v19 = [MEMORY[0x1E4F28B00] currentHandler];
      double v20 = [NSString stringWithUTF8String:"-[PXGGridLayout update]"];
      [v19 handleFailureInFunction:v20, @"PXGGridLayout.m", 142, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
  }
  unint64_t v8 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v8 & 2) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
    [(PXGGridLayout *)self _updateContentSize];
  }
  [(PXGItemsLayout *)self updateLoadedItemsIfNeeded];
  [(PXGItemsLayout *)self updateAccessoryItemsIfNeeded];
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v14 = [NSString stringWithUTF8String:"-[PXGGridLayout update]"];
    [v13 handleFailureInFunction:v14, @"PXGGridLayout.m", 149, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v9 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((v9 & 4) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
    [(PXGGridLayout *)self _updateSprites];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    CGFloat v16 = [NSString stringWithUTF8String:"-[PXGGridLayout update]"];
    [v15 handleFailureInFunction:v16, @"PXGGridLayout.m", 152, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v10 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 8uLL;
  if ((v10 & 8) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFF7;
    [(PXGGridLayout *)self _updateSpriteStyles];
    unint64_t v10 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 0;
  if (v10)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v18 = [NSString stringWithUTF8String:"-[PXGGridLayout update]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PXGGridLayout.m", 155, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
  }
LABEL_23:
  v21.receiver = self;
  v21.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v21 update];
  self->_BOOL isUpdating = isUpdating;
}

- (_NSRange)itemsToLoad
{
  int64_t v4 = [(PXGItemsLayout *)self numberOfItems];
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    int64_t v6 = v4;
    double v7 = [(PXGLayout *)self rootLayout];
    unint64_t v8 = [v7 activeAnchor];

    uint64_t v29 = 0;
    unint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v9 = [(PXGLayout *)self rootLayout];
    uint64_t v10 = [v9 anchoredContentEdges];

    if (v10 && v8 && [v8 type] != 5)
    {
      if (v10)
      {
        int64_t v11 = 0;
        goto LABEL_10;
      }
      if ((v10 & 4) != 0)
      {
        int64_t v11 = v6 - 1;
LABEL_10:
        v30[3] = v11;
      }
    }
    double v13 = [(PXGGridLayout *)self anchorObjectReference];
    int64_t v14 = v30[3];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v13)
    {
      int64_t v14 = [(PXGItemsLayout *)self itemForObjectReference:v13];
      v30[3] = v14;
    }
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v8)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __28__PXGGridLayout_itemsToLoad__block_invoke;
      v25[3] = &unk_1E5DC8B58;
      double v27 = self;
      double v28 = &v29;
      id v26 = v8;
      [v26 enumerateAllSpriteReferencesUsingBlock:v25];
    }
    [(PXGLayout *)self visibleRect];
    unint64_t v5 = -[PXGGridLayout _itemsToLoadForVisibleRect:](self, "_itemsToLoadForVisibleRect:");
    NSUInteger v12 = v15;
    if (v30[3] == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_37;
    }
    [(PXGLayout *)self visibleRect];
    -[PXGGridLayout _itemsToLoadForVisibleRect:](self, "_itemsToLoadForVisibleRect:", 0.0, 0.0);
    unint64_t v17 = v16;
    unint64_t v18 = v30[3];
    if (v18 >= v5 && v18 - v5 < v12)
    {
      if (v12 >= v16 || [(PXGGridLayout *)self loadItemsOutsideAnchorViewport])
      {
LABEL_37:

        _Block_object_dispose(&v29, 8);
        goto LABEL_38;
      }
      unint64_t v18 = v30[3];
    }
    if ((uint64_t)v18 >= v6)
    {
      NSUInteger v24 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGGridLayout.m", 877, @"Anchor item %ld must be < numberOfItems %ld", v30[3], v6);

      unint64_t v18 = v30[3];
    }
    if (v17 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v17;
    }
    if (v19 >= 0) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v19 + 1;
    }
    uint64_t v21 = (v18 - (v20 >> 1)) & ~((uint64_t)(v18 - (v20 >> 1)) >> 63);
    if (v6 - v21 >= v17) {
      unint64_t v5 = v21;
    }
    else {
      unint64_t v5 = v6 - v17;
    }
    if (v19 >= (uint64_t)(v6 - v5)) {
      NSUInteger v12 = v6 - v5;
    }
    else {
      NSUInteger v12 = v19;
    }
    goto LABEL_37;
  }
  NSUInteger v12 = 0;
LABEL_38:
  NSUInteger v22 = v5;
  NSUInteger v23 = v12;
  result.length = v23;
  result.location = v22;
  return result;
}

- (void)loadedItemsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v8 loadedItemsDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xC;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xC) != 0)
    {
      int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      double v7 = [NSString stringWithUTF8String:"-[PXGGridLayout loadedItemsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1023, @"invalidating %lu after it already has been updated", 12);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 12;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!self->_isUpdating && [(PXGItemsLayout *)self isLazy])
  {
    int64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXGGridLayout.m", 1313, @"Invalid to modify sprites directly when lazy, use setNumberOfItems:withChangeDetails: instead." object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXGGridLayout;
  [(PXGLayout *)&v15 applySpriteChangeDetails:v11 countAfterChanges:v8 initialState:v12 modifyState:v13];
}

- (void)_updateSpriteStyles
{
  int64_t v3 = [(PXGGridLayout *)self visualItemShift];
  uint64_t v50 = [(PXGLayout *)self localNumberOfSprites];
  int64_t v4 = [(PXGItemsLayout *)self numberOfItems];
  int64_t v5 = [(PXGGridLayout *)self scrollableAxis];
  [(PXGGridLayout *)self itemCornerRadius];
  int v7 = v6;
  int v9 = v8;
  int v11 = v10;
  int v13 = v12;
  [(PXGGridLayout *)self edgeCornerRadius];
  int v45 = v15;
  int v46 = v14;
  int v44 = v16;
  int v18 = v17;
  [(PXGGridLayout *)self itemAspectRatio];
  uint64_t v20 = v19;
  [(PXGLayout *)self alpha];
  uint64_t v22 = v21;
  uint64_t v49 = [(PXGItemsLayout *)self loadedItems];
  int64_t v48 = v3;
  int64_t v47 = v5;
  if ([(PXGGridLayout *)self enableBestCropRect]) {
    BOOL v42 = [(PXGItemsLayout *)self delegateRespondsTo:8];
  }
  else {
    BOOL v42 = 0;
  }
  NSUInteger v23 = [(PXGItemsLayout *)self delegate];
  if ([(PXGItemsLayout *)self delegateRespondsTo:4]) {
    NSUInteger v24 = v23;
  }
  else {
    NSUInteger v24 = 0;
  }
  id v25 = v24;
  if ([(PXGItemsLayout *)self delegateRespondsTo:1024]) {
    id v26 = v23;
  }
  else {
    id v26 = 0;
  }
  id v27 = v26;
  if (v27) {
    BOOL v28 = [(PXGGridLayout *)self enablePerItemCornerRadius];
  }
  else {
    BOOL v28 = 0;
  }
  BOOL v30 = [(PXGGridLayout *)self contentMode] == 1 && v25 != 0;
  BOOL v31 = [(PXGGridLayout *)self supportsAutomaticContentRotation];
  if ([(PXGItemsLayout *)self delegateRespondsTo:128]) {
    uint64_t v32 = v23;
  }
  else {
    uint64_t v32 = 0;
  }
  id v33 = v32;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __36__PXGGridLayout__updateSpriteStyles__block_invoke;
  v56[3] = &unk_1E5DC8AE0;
  uint64_t v62 = v49;
  BOOL v77 = v42;
  id v34 = v23;
  id v57 = v34;
  CGRect v58 = self;
  uint64_t v63 = v20;
  int v68 = v7;
  int v69 = v9;
  int v70 = v11;
  int v71 = v13;
  BOOL v78 = v28;
  id v43 = v27;
  id v59 = v43;
  uint64_t v64 = v22;
  id v35 = v33;
  id v60 = v35;
  BOOL v79 = v31;
  BOOL v80 = v30;
  id v36 = v25;
  int v72 = v46;
  int v73 = v45;
  int v74 = v44;
  int v75 = v18;
  id v61 = v36;
  int64_t v65 = v4;
  int64_t v66 = v47;
  int64_t v67 = v48;
  int v76 = v50;
  [(PXGLayout *)self modifySpritesInRange:v50 << 32 state:v56];
  if ([(PXGItemsLayout *)self delegateRespondsTo:16]) {
    long long v37 = v34;
  }
  else {
    long long v37 = 0;
  }
  id v38 = v37;
  if ([(PXGGridLayout *)self enableEffects] && v38)
  {
    uint64_t v39 = [(PXGLayout *)self entityManager];
    float32x4_t v40 = [v39 effectComponent];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __36__PXGGridLayout__updateSpriteStyles__block_invoke_2;
    v52[3] = &unk_1E5DC8B08;
    int v55 = v50;
    v52[4] = self;
    uint64_t v54 = v49;
    id v53 = v38;
    [v40 performChanges:v52];
  }
  int64_t v41 = [(PXGItemsLayout *)self numberOfAccessoryItems];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __36__PXGGridLayout__updateSpriteStyles__block_invoke_3;
  v51[3] = &unk_1E5DC8B30;
  v51[4] = self;
  v51[5] = v22;
  [(PXGItemsLayout *)self modifyAccessoryItemSpritesInRange:v41 << 32 state:v51];
}

- (BOOL)enableEffects
{
  return self->_enableEffects;
}

- (BOOL)enableBestCropRect
{
  return self->_enableBestCropRect;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)edgeCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (void)_updateSprites
{
  [(PXGGridLayout *)self visualItemShift];
  [(PXGLayout *)self localNumberOfSprites];
  uint64_t v3 = [(PXGItemsLayout *)self delegate];
  if ([(PXGItemsLayout *)self delegateRespondsTo:4]) {
    int64_t v4 = (void *)v3;
  }
  else {
    int64_t v4 = 0;
  }
  v4;
  [(PXGGridLayout *)self contentMode];
  [(PXGGridLayout *)self marginDelegate];
  objc_claimAutoreleasedReturnValue();
  [(PXGGridLayout *)self insetDelegate];
  objc_claimAutoreleasedReturnValue();
  [(PXGItemsLayout *)self loadedItems];
  int64_t v5 = [(PXGItemsLayout *)self dropTargetObjectReference];
  [(PXGItemsLayout *)self itemForObjectReference:v5];

  [(PXGItemsLayout *)self dropTargetStyle];
  [(PXGGridLayout *)self aspectRatioLimit];
  [(PXGGridLayout *)self itemAspectRatio];
  [(PXGGridLayout *)self supportsAutomaticContentRotation];
  [(PXGGridLayout *)self numberOfColumns];
  [(PXGGridLayout *)self numberOfRows];
  int64_t v6 = [(PXGGridLayout *)self scrollableAxis];
  [(PXGLayout *)self displayScale];
  [(PXGGridLayout *)self contentOrigin];
  [(PXGLayout *)self referenceSize];
  if (v6 == 1) {
    [(PXGGridLayout *)self numberOfColumns];
  }
  else {
    [(PXGGridLayout *)self numberOfRows];
  }
  [(PXGGridLayout *)self mediaTargetSizeIgnoresSpacing];
  PXSizeScale();
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (BOOL)supportsAutomaticContentRotation
{
  return self->_supportsAutomaticContentRotation;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (BOOL)mediaTargetSizeIgnoresSpacing
{
  return self->_mediaTargetSizeIgnoresSpacing;
}

- (id)marginDelegate
{
  if ([(PXGGridLayout *)self enablePerItemMargin])
  {
    v5.receiver = self;
    v5.super_class = (Class)PXGGridLayout;
    uint64_t v3 = [(PXGItemsLayout *)&v5 marginDelegate];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (float)itemZPosition
{
  return self->_itemZPosition;
}

- (BOOL)enablePerItemMargin
{
  return self->_enablePerItemMargin;
}

- (double)aspectRatioLimit
{
  return self->_aspectRatioLimit;
}

- (id)insetDelegate
{
  if ([(PXGGridLayout *)self enablePerItemInsets])
  {
    v5.receiver = self;
    v5.super_class = (Class)PXGGridLayout;
    uint64_t v3 = [(PXGItemsLayout *)&v5 insetDelegate];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)enablePerItemInsets
{
  return self->_enablePerItemInsets;
}

- (BOOL)shouldUpdateDecorationMediaTargetSizes
{
  double v2 = [(PXGGridLayout *)self anchorObjectReference];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_updateContentSize
{
  uint64_t v3 = [(PXGGridLayout *)self numberOfVisualColumns];
  uint64_t v4 = [(PXGGridLayout *)self numberOfVisualRows];
  double width = self->_itemSize.width;
  double v6 = self->_finalInterItemSpacing.width;
  double left = self->_finalInsets.left;
  double right = self->_finalInsets.right;
  double v9 = self->_finalInsets.top
     + fmax(-(self->_finalInterItemSpacing.height- (double)v4 * (self->_itemSize.height + self->_finalInterItemSpacing.height + self->_itemCaptionSpacing)), 0.0)+ self->_finalInsets.bottom;
  double v10 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if ([(PXGGridLayout *)self fillSafeAreaTopInset])
  {
    [(PXGLayout *)self safeAreaInsets];
    double v11 = v11 - v12;
    double v9 = v9 - v12;
  }
  -[PXGGridLayout setContentOrigin:](self, "setContentOrigin:", v10, v11);
  -[PXGLayout setContentSize:](self, "setContentSize:", fmax(-(v6 - (double)v3 * (width + v6)), 0.0) + left + right, v9);
  [(PXGLayout *)self setLastBaseline:v9];
}

- (BOOL)fillSafeAreaTopInset
{
  return self->_fillSafeAreaTopInset;
}

- (void)setContentOrigin:(CGPoint)a3
{
  if (self->_contentOrigin.x != a3.x || self->_contentOrigin.y != a3.y)
  {
    self->_contentOrigin = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xC;
        return;
      }
LABEL_9:
      if ((self->_updateFlags.updated & 0xC) != 0)
      {
        int v7 = [MEMORY[0x1E4F28B00] currentHandler];
        int v8 = [NSString stringWithUTF8String:"-[PXGGridLayout setContentOrigin:]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGGridLayout.m", 1059, @"invalidating %lu after it already has been updated", 12);

        abort();
      }
      goto LABEL_10;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_9;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 12;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (BOOL)loadItemsOutsideAnchorViewport
{
  return self->_loadItemsOutsideAnchorViewport;
}

- (void)alphaDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
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
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      int v7 = [NSString stringWithUTF8String:"-[PXGGridLayout alphaDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1006, @"invalidating %lu after it already has been updated", 8);

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

- (void)setAnchorViewportCenter:(CGPoint)a3
{
  if (self->_anchorViewportCenter.x != a3.x || self->_anchorViewportCenter.y != a3.y)
  {
    self->_anchorViewportCenter = a3;
    [(PXGItemsLayout *)self invalidateLoadedItems];
  }
}

- (void)setAnchorObjectReference:(id)a3
{
  id v8 = a3;
  id v5 = self->_anchorObjectReference;
  if (v5 == v8)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong(&self->_anchorObjectReference, a3);
      [(PXGItemsLayout *)self invalidateLoadedItems];
    }
  }
}

- (void).cxx_destruct
{
}

- (void)setSupportsAutomaticContentRotation:(BOOL)a3
{
  self->_supportsAutomaticContentRotation = a3;
}

- (double)accessoryAlpha
{
  return self->_accessoryAlpha;
}

- (unsigned)accessoryPresentationType
{
  return self->_accessoryPresentationType;
}

- (unsigned)accessoryMediaKind
{
  return self->_accessoryMediaKind;
}

- (BOOL)enablePerItemCornerRadius
{
  return self->_enablePerItemCornerRadius;
}

- (BOOL)canHandleVisibleRectRejection
{
  return self->_canHandleVisibleRectRejection;
}

- (void)axDidUpdateFocusFromSpriteAtIndex:(unsigned int)a3 toSpriteAtIndex:(unsigned int)a4
{
  if (a4 == -1) {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v5 = [(PXGItemsLayout *)self itemForSpriteIndex:*(void *)&a4];
  }
  [(PXGItemsLayout *)self setItem:v5 forStylableType:1 animated:1];
}

- (void)axDidReceiveFocusMovementHint:(id)a3 forSpriteAtIndex:(unsigned int)a4
{
  id v6 = a3;
  char v7 = v6;
  float32x4_t v8 = 0uLL;
  float64x2_t v32 = 0u;
  float64x2_t v33 = 0u;
  float64x2_t v30 = 0u;
  float64x2_t v31 = 0u;
  float64x2_t v28 = 0u;
  float64x2_t v29 = 0u;
  float64x2_t v26 = 0u;
  float64x2_t v27 = 0u;
  if (v6)
  {
    [v6 interactionTransform];
    float32x4_t v9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
    float32x4_t v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v30), v31);
    float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v28), v29);
    float32x4_t v8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v26), v27);
  }
  else
  {
    float32x4_t v11 = 0uLL;
    float32x4_t v10 = 0uLL;
    float32x4_t v9 = 0uLL;
  }
  if (a4 != -1)
  {
    int32x4_t v17 = (int32x4_t)v11;
    int32x4_t v18 = (int32x4_t)v10;
    int32x4_t v19 = (int32x4_t)v9;
    int32x4_t v20 = (int32x4_t)v8;
    if ([(PXGLayout *)self localNumberOfSprites] <= a4) {
      PXAssertGetLog();
    }
    if ([(PXGLayout *)self localNumberOfSprites] > a4)
    {
      int8x16_t v12 = (int8x16_t)vzip1q_s32(v18, v19);
      *(void *)&long long v13 = vzip1q_s32(v20, v17).u64[0];
      *(void *)&long long v14 = vtrn2q_s32(v20, v17).u64[0];
      *(void *)&long long v15 = vzip2q_s32(v20, v17).u64[0];
      *(void *)&long long v16 = vuzp2q_s32(vuzp2q_s32(v20, v17), v20).u64[0];
      *((void *)&v13 + 1) = vextq_s8(*(int8x16_t *)&v18, v12, 8uLL).i64[1];
      *((void *)&v14 + 1) = v12.i64[1];
      *((void *)&v15 + 1) = __PAIR64__(v19.u32[2], v18.u32[2]);
      *((void *)&v16 + 1) = vzip2q_s32(v18, v19).i64[1];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __64__PXGGridLayout_axDidReceiveFocusMovementHint_forSpriteAtIndex___block_invoke;
      v21[3] = &__block_descriptor_96_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
      long long v22 = v13;
      long long v23 = v14;
      long long v24 = v15;
      long long v25 = v16;
      [(PXGLayout *)self modifySpritesInRange:a4 | 0x100000000 state:v21];
    }
  }
}

__n128 __64__PXGGridLayout_axDidReceiveFocusMovementHint_forSpriteAtIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result = *(__n128 *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a4 + 128) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a4 + 144) = v6;
  *(__n128 *)(a4 + 96) = result;
  *(_OWORD *)(a4 + 112) = v5;
  return result;
}

- (NSString)diagnosticDescription
{
  v11.receiver = self;
  v11.super_class = (Class)PXGGridLayout;
  uint64_t v3 = [(PXGLayout *)&v11 diagnosticDescription];
  int64_t v4 = [(PXGGridLayout *)self style];
  [(PXGGridLayout *)self padding];
  long long v5 = NSStringFromUIEdgeInsets(v13);
  [(PXGGridLayout *)self interItemSpacing];
  uint64_t v7 = v6;
  [(PXGGridLayout *)self interItemSpacing];
  float32x4_t v9 = objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", @", style=%li, padding=%@, interItemSpacing=%.2fx%.2f, visualItemShift=%li", v4, v5, v7, v8, -[PXGGridLayout visualItemShift](self, "visualItemShift"));

  return (NSString *)v9;
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  return PXGItemsGeometryItemsBetweenItemAndItemDefaultImplementation(a3, a4);
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
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setPresentationType:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1276, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setItemZPosition:(float)a3
{
  if (self->_itemZPosition != a3)
  {
    self->_itemZPosition = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setItemZPosition:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1252, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setEdgeCornerRadius:(id)a3
{
  if (v3 != self->_edgeCornerRadius.var0.var0.topLeft
    || v4 != self->_edgeCornerRadius.var0.var0.topRight
    || v5 != self->_edgeCornerRadius.var0.var0.bottomLeft
    || v6 != self->_edgeCornerRadius.var0.var0.bottomRight)
  {
    self->_edgeCornerRadius.var0.var0.topLeft = v3;
    self->_edgeCornerRadius.var0.var0.topRight = v4;
    self->_edgeCornerRadius.var0.var0.bottomLeft = v5;
    self->_edgeCornerRadius.var0.var0.bottomRight = v6;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_16:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xC;
        return;
      }
LABEL_15:
      if ((self->_updateFlags.updated & 0xC) != 0)
      {
        UIEdgeInsets v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3.var0.var0.var0, *(void *)&a3.var0.var1[2]);
        long long v14 = [NSString stringWithUTF8String:"-[PXGGridLayout setEdgeCornerRadius:]"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXGGridLayout.m", 1244, @"invalidating %lu after it already has been updated", 12);

        abort();
      }
      goto LABEL_16;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_15;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 12;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
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
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setAspectRatioLimit:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1186, @"invalidating %lu after it already has been updated", 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 15;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setNumberOfRows:(int64_t)a3
{
  if (self->_numberOfRows != a3)
  {
    self->_numberOfRows = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setNumberOfRows:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1134, @"invalidating %lu after it already has been updated", 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 15;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
    [(PXGGridLayout *)self setNeedsUpdateOfScrollableAxis];
  }
}

- (void)setEnablePerItemMargin:(BOOL)a3
{
  if (self->_enablePerItemMargin != a3)
  {
    self->_enablePerItemMargin = a3;
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        float v6 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setEnablePerItemMargin:]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1108, @"invalidating %lu after it already has been updated", 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 4;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (void)setNeedsUpdateOfScrollableAxis
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGLayout *)&v8 setNeedsUpdateOfScrollableAxis];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xF;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xF) != 0)
    {
      float v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout setNeedsUpdateOfScrollableAxis]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1043, @"invalidating %lu after it already has been updated", 15);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 15;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)effectsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v8 effectsDidChange];
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
      float v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout effectsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1038, @"invalidating %lu after it already has been updated", 8);

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

- (void)accessoryItemsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v8 accessoryItemsDidChange];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0xC;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xC) != 0)
    {
      float v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout accessoryItemsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1033, @"invalidating %lu after it already has been updated", 12);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 12;
  if (!willPerformUpdate) {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)numberOfAccessoryItemsDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  [(PXGItemsLayout *)&v8 numberOfAccessoryItemsDidChange];
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
      float v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGGridLayout numberOfAccessoryItemsDidChange]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGGridLayout.m", 1028, @"invalidating %lu after it already has been updated", 2);

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

- (id)navigationObjectReferenceForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)PXGGridLayout;
  float v6 = -[PXGLayout navigationObjectReferenceForLocation:](&v9, sel_navigationObjectReferenceForLocation_);
  if (!v6)
  {
    int64_t v7 = -[PXGGridLayout itemClosestTo:](self, "itemClosestTo:", x, y);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      float v6 = 0;
    }
    else
    {
      float v6 = [(PXGItemsLayout *)self objectReferenceForItem:v7];
    }
  }
  return v6;
}

- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PXGGridLayout *)self _layoutPointInContent:"_layoutPointInContent:"];
  double v7 = v6;
  double v9 = v8;
  CGFloat v10 = *MEMORY[0x1E4F1DAD8];
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PXGLayout *)self contentSize];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v33.origin.double x = v10;
  v33.origin.double y = v11;
  v33.size.double width = v13;
  v33.size.CGFloat height = v15;
  if ((v7 > CGRectGetMaxX(v33)
     || (v34.origin.x = v10, v34.origin.y = v11, v34.size.width = v13, v34.size.CGFloat height = v15, v9 > CGRectGetMaxY(v34)))
    && [(PXGItemsLayout *)self dropTargetStyle] != 2
    || (int64_t v16 = -[PXGGridLayout itemClosestTo:](self, "itemClosestTo:", x, y), v16 == 0x7FFFFFFFFFFFFFFFLL))
  {
    int32x4_t v17 = 0;
    goto LABEL_24;
  }
  uint64_t v18 = v16;
  -[PXGGridLayout _frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:](self, "_frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:", v16, 0, self->_finalInterItemSpacing.width, self->_finalInterItemSpacing.height, self->_itemSize.width, self->_itemSize.height, self->_finalInsets.top, self->_finalInsets.left, self->_finalInsets.bottom, self->_finalInsets.right);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  if ([(PXGItemsLayout *)self dropTargetStyle] == 2)
  {
    v35.origin.double x = v20;
    v35.origin.double y = v22;
    v35.size.double width = v24;
    v35.size.CGFloat height = v26;
    if (x <= CGRectGetMidX(v35)) {
      goto LABEL_23;
    }
LABEL_20:
    if (v18 + 1 < [(PXGItemsLayout *)self numberOfItems]) {
      ++v18;
    }
    else {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_23;
  }
  v36.origin.double x = v20;
  v36.origin.double y = v22;
  v36.size.double width = v24;
  v36.size.CGFloat height = v26;
  double MaxY = CGRectGetMaxY(v36);
  v37.origin.double x = v20;
  v37.origin.double y = v22;
  v37.size.double width = v24;
  v37.size.CGFloat height = v26;
  double MinX = CGRectGetMinX(v37);
  if (v18 < 1 || (x < MinX ? (BOOL v29 = y < MaxY) : (BOOL v29 = 0), !v29))
  {
    v38.origin.double x = v20;
    v38.origin.double y = v22;
    v38.size.double width = v24;
    v38.size.CGFloat height = v26;
    if (x <= CGRectGetMaxX(v38) && y < MaxY) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  --v18;
LABEL_23:
  int32x4_t v17 = [(PXGItemsLayout *)self objectReferenceForItem:v18];
LABEL_24:
  return v17;
}

- (CGSize)sizeForItem:(int64_t)a3
{
  float v5 = [(PXGGridLayout *)self marginDelegate];
  double v6 = [(PXGGridLayout *)self insetDelegate];
  double v7 = self;
  [v5 itemsLayout:v7 marginForItem:a3];
  [v6 itemsLayout:v7 insetForItem:a3];

  PXSizeAdd();
}

void __28__PXGGridLayout_itemsToLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15 = [a2 objectReference];
  if (v15)
  {
    if ([*(id *)(a1 + 32) type] != 1
      || ([*(id *)(a1 + 32) visibleRect],
          v18.origin.double x = a5,
          v18.origin.double y = a6,
          v18.size.double width = a7,
          v18.size.CGFloat height = a8,
          CGRectIntersectsRect(v17, v18)))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 40) itemForObjectReference:v15 options:a3];
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL) {
        *a4 = 1;
      }
    }
  }
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

- (int64_t)itemClosestTo:(CGPoint)a3
{
  -[PXGGridLayout _layoutPointInContent:](self, "_layoutPointInContent:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(PXGItemsLayout *)self numberOfItems];
  uint64_t v9 = v8 - 1;
  if (v8 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v10 = [(PXGGridLayout *)self numberOfVisualRows];
  int64_t v11 = [(PXGGridLayout *)self numberOfVisualColumns];
  uint64_t v12 = vcvtmd_s64_f64((v7 - self->_finalInsets.top + self->_finalInterItemSpacing.height + self->_itemCaptionSpacing)/ (self->_itemCaptionSpacing + self->_finalInterItemSpacing.height + self->_itemSize.height));
  int64_t v13 = vcvtmd_s64_f64((v5 - self->_finalInsets.left + self->_finalInterItemSpacing.width)/ (self->_finalInterItemSpacing.width + self->_itemSize.width));
  if (v10 - 1 < v12) {
    uint64_t v12 = v10 - 1;
  }
  uint64_t v14 = v12 & ~(v12 >> 63);
  uint64_t v15 = v11 - 1;
  if (v11 - 1 >= v13) {
    uint64_t v15 = v13;
  }
  uint64_t v16 = v15 & ~(v15 >> 63);
  if ([(PXGGridLayout *)self scrollableAxis] == 2) {
    uint64_t v17 = v14 + [(PXGGridLayout *)self numberOfRows] * v16;
  }
  else {
    uint64_t v17 = v16 + [(PXGGridLayout *)self numberOfColumns] * v14;
  }
  uint64_t v19 = v17 - [(PXGGridLayout *)self visualItemShift];
  if (v19 >= v9) {
    uint64_t v19 = v9;
  }
  return v19 & ~(v19 >> 63);
}

- (CGRect)frameForItem:(int64_t)a3 usingInterItemSpacing:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v21 = 0.0;
  double v22 = 0.0;
  double v19 = 0.0;
  double v20 = 0.0;
  long long v17 = 0u;
  long long v18 = 0u;
  [(PXGGridLayout *)self padding];
  -[PXGGridLayout _getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:](self, "_getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:", &v21, &v19, &v17, width, height, v8, v9, v10, v11);
  int64_t v12 = [(PXGGridLayout *)self contentMode];
  -[PXGGridLayout _frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:](self, "_frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:", a3, v12, v19, v20, v21, v22, v17, v18);
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3
{
  NSUInteger v4 = -[PXGGridLayout itemRangeInRect:](self, "itemRangeInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  NSUInteger v6 = v5;
  v17.location = [(PXGItemsLayout *)self loadedItems];
  v17.NSUInteger length = v7;
  v16.location = v4;
  v16.NSUInteger length = v6;
  NSRange v8 = NSIntersectionRange(v16, v17);
  if (v8.length)
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v8.location, v8.length);
    double v10 = [(PXGItemsLayout *)self spriteIndexesForItems:v9];

    unsigned int v11 = objc_msgSend(v10, "px_coveringRange");
    unint64_t v13 = v11 | ((unint64_t)v12 << 32);
  }
  else
  {
    return *(_PXGSpriteIndexRange *)off_1E5DAAF80;
  }
  return (_PXGSpriteIndexRange)v13;
}

float __36__PXGGridLayout__updateSpriteStyles__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, float *a4)
{
  unint64_t v6 = HIDWORD(a2);
  [*(id *)(a1 + 32) accessoryAlpha];
  if (v6)
  {
    long long v9 = *((_OWORD *)off_1E5DAAF90 + 4);
    long long v8 = *((_OWORD *)off_1E5DAAF90 + 5);
    long long v11 = *((_OWORD *)off_1E5DAAF90 + 2);
    long long v10 = *((_OWORD *)off_1E5DAAF90 + 3);
    long long v13 = *((_OWORD *)off_1E5DAAF90 + 8);
    long long v12 = *((_OWORD *)off_1E5DAAF90 + 9);
    long long v15 = *((_OWORD *)off_1E5DAAF90 + 6);
    long long v14 = *((_OWORD *)off_1E5DAAF90 + 7);
    long long v16 = *(_OWORD *)off_1E5DAAF90;
    long long v17 = *((_OWORD *)off_1E5DAAF90 + 1);
    do
    {
      *((_OWORD *)a4 + 4) = v9;
      *((_OWORD *)a4 + 5) = v8;
      *((_OWORD *)a4 + 2) = v11;
      *((_OWORD *)a4 + 3) = v10;
      *((_OWORD *)a4 + 8) = v13;
      *((_OWORD *)a4 + 9) = v12;
      *((_OWORD *)a4 + 6) = v15;
      *((_OWORD *)a4 + 7) = v14;
      *(_OWORD *)a4 = v16;
      *((_OWORD *)a4 + 1) = v17;
      double v18 = *(double *)(a1 + 40);
      if (v18 >= v7) {
        double v18 = v7;
      }
      float v19 = v18;
      *a4 = v19;
      a4 += 40;
      LODWORD(v6) = v6 - 1;
    }
    while (v6);
  }
  return *(float *)&v7;
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 / *(unsigned int *)(a1 + 32);
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return a2 % *(unsigned int *)(a1 + 32);
}

double __31__PXGGridLayout__updateSprites__block_invoke_6(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, float32x2_t *a5)
{
  int v7 = a2;
  unint64_t v9 = HIDWORD(a2);
  __int8 v10 = [*(id *)(a1 + 32) accessoryPresentationType];
  __int8 v11 = [*(id *)(a1 + 32) accessoryMediaKind];
  if (v9)
  {
    __int8 v13 = v11;
    do
    {
      uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      float v16 = 0.0;
      if (v15 == *(void *)(a1 + 104)) {
        float v16 = *(float *)(a1 + 164);
      }
      float32x2_t v17 = vcvt_f32_f64(*(float64x2_t *)(a1 + 72));
      float32x2_t v18 = vcvt_f32_f64(*(float64x2_t *)(a1 + 88));
      double result = *(double *)(a1 + 112) + (double)v14 * *(double *)(a1 + 128) + *(double *)(a1 + 144) + v16;
      double v19 = *(double *)(a1 + 120) + (double)v15 * *(double *)(a1 + 136) + *(double *)(a1 + 152);
      double v20 = *(float *)(a1 + 168);
      *(double *)a3 = result;
      *(double *)(a3 + 8) = v19;
      *(double *)(a3 + 16) = v20;
      *(float32x2_t *)(a3 + 24) = v17;
      a5->i8[0] = v10;
      a5->i8[1] = v13;
      a5[1] = v18;
      ++v7;
      a3 += 32;
      a5 += 5;
      LODWORD(v9) = v9 - 1;
    }
    while (v9);
  }
  return result;
}

- (NSString)description
{
  if ([(PXGGridLayout *)self scrollableAxis] == 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)PXGGridLayout;
    float v3 = [(PXGItemsLayout *)&v7 description];
    objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", @", axis=horizontal, numberOfRows=%li", -[PXGGridLayout numberOfRows](self, "numberOfRows"));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXGGridLayout;
    float v3 = [(PXGItemsLayout *)&v6 description];
    objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", @", axis=vertical, numberOfColumns=%li", -[PXGGridLayout numberOfColumns](self, "numberOfColumns"));
  NSUInteger v4 = };

  return (NSString *)v4;
}

@end