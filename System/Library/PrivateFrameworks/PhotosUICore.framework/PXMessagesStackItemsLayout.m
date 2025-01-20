@interface PXMessagesStackItemsLayout
+ (id)_sharedTemplateLayoutHelper;
- ($9C403407A5B624E1CD2E2AFE16A3B680)tapbackConfigurationForProposedConfiguration:(SEL)a3 spriteIndex:(id *)a4;
- (BOOL)getHorizontalOffsetForObjectReference:(id)a3 outOffset:(double *)a4;
- (BOOL)isSettling;
- (BOOL)keepItemAspectRatioConstant;
- (BOOL)shouldDecorateUndefinedMediaKind;
- (CGRect)desiredLayoutRect;
- (NSArray)normalizedStackHorizontalOffsets;
- (PXMessagesStackItemsLayout)init;
- (PXMessagesStackItemsLayoutPrimaryItemDelegate)primaryItemDelegate;
- (_NSRange)itemsToLoad;
- (double)closestPageOffsetForHorizontalOffset:(double)a3;
- (double)horizontalContentMargin;
- (double)horizontalContentMarginForSize:(CGSize)a3 normalizedVerticalContentInsets:(double)a4;
- (double)leftEdgeInternalHorizontalAlignment;
- (double)normalizedContentInsets;
- (double)normalizedPageWidth;
- (double)normalizedStackSizeTransform;
- (double)normalizedStackVerticalOffset;
- (double)overlayAlphaForSpriteIndex:(unsigned int)a3;
- (double)pageOffsetGreaterThanOffset:(double)a3;
- (double)pageOffsetLessThanOffset:(double)a3;
- (double)primaryItemFocus;
- (double)rightEdgeInternalHorizontalAlignment;
- (double)rotationAngle;
- (double)selectionOverlayAlphaForSpriteIndex:(unsigned int)a3;
- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4;
- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4;
- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4;
- (int64_t)numberOfPages;
- (int64_t)primaryItemIndex;
- (int64_t)scrollableAxis;
- (unint64_t)stackedItemsCount;
- (unsigned)accessoryMediaKind;
- (unsigned)accessoryPresentationType;
- (unsigned)mediaKind;
- (unsigned)presentationType;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_clearLayoutProperties;
- (void)_getItemsForXOffset:(double)a3 leadingItems:(_NSRange *)a4 primaryItemIndex:(unint64_t *)a5 trailingItems:(_NSRange *)a6 trailingHiddenItems:(_NSRange *)a7 pageFocus:(double *)a8;
- (void)_invalidateContentSize;
- (void)_invalidateLayoutHelper;
- (void)_invalidateSprites;
- (void)_invalidateVisibleRect;
- (void)_signalDelegatePostUpdate;
- (void)_syncPropertiesToLayoutHelper:(id)a3;
- (void)_updateContentSize;
- (void)_updateLayoutHelper;
- (void)_updateLayoutProperties;
- (void)_updateSprites;
- (void)_updateVisibleRect;
- (void)accessoryItemsDidChange;
- (void)contentSizeDidChange;
- (void)dealloc;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)loadedItemsDidChange;
- (void)numberOfAccessoryItemsDidChange;
- (void)referenceSizeDidChange;
- (void)reloadAccessoryItems;
- (void)scrollToBeginning;
- (void)setAccessoryMediaKind:(unsigned __int8)a3;
- (void)setAccessoryPresentationType:(unsigned __int8)a3;
- (void)setDesiredLayoutRect:(CGRect)a3;
- (void)setIsSettling:(BOOL)a3;
- (void)setKeepItemAspectRatioConstant:(BOOL)a3;
- (void)setLeftEdgeInternalHorizontalAlignment:(double)a3;
- (void)setMediaKind:(unsigned __int8)a3;
- (void)setNormalizedContentInsets:(double)a3;
- (void)setNormalizedPageWidth:(double)a3;
- (void)setNormalizedStackHorizontalOffsets:(id)a3;
- (void)setNormalizedStackSizeTransform:(double)a3;
- (void)setNormalizedStackVerticalOffset:(double)a3;
- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5;
- (void)setPresentationType:(unsigned __int8)a3;
- (void)setPrimaryItemDelegate:(id)a3;
- (void)setRightEdgeInternalHorizontalAlignment:(double)a3;
- (void)setRotationAngle:(double)a3;
- (void)setStackedItemsCount:(unint64_t)a3;
- (void)update;
- (void)userInterfaceDirectionDidChange;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXMessagesStackItemsLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizedStackHorizontalOffsets, 0);
  objc_destroyWeak((id *)&self->_primaryItemDelegate);
  objc_storeStrong((id *)&self->_layoutHelper, 0);
}

- (double)rightEdgeInternalHorizontalAlignment
{
  return self->_rightEdgeInternalHorizontalAlignment;
}

- (double)leftEdgeInternalHorizontalAlignment
{
  return self->_leftEdgeInternalHorizontalAlignment;
}

- (void)setKeepItemAspectRatioConstant:(BOOL)a3
{
  self->_keepItemAspectRatioConstant = a3;
}

- (BOOL)keepItemAspectRatioConstant
{
  return self->_keepItemAspectRatioConstant;
}

- (BOOL)isSettling
{
  return self->_isSettling;
}

- (unsigned)accessoryMediaKind
{
  return self->_accessoryMediaKind;
}

- (unsigned)accessoryPresentationType
{
  return self->_accessoryPresentationType;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (double)normalizedContentInsets
{
  return self->_normalizedContentInsets;
}

- (double)normalizedStackVerticalOffset
{
  return self->_normalizedStackVerticalOffset;
}

- (NSArray)normalizedStackHorizontalOffsets
{
  return self->_normalizedStackHorizontalOffsets;
}

- (double)normalizedStackSizeTransform
{
  return self->_normalizedStackSizeTransform;
}

- (unint64_t)stackedItemsCount
{
  return self->_stackedItemsCount;
}

- (double)normalizedPageWidth
{
  return self->_normalizedPageWidth;
}

- (CGRect)desiredLayoutRect
{
  double x = self->_desiredLayoutRect.origin.x;
  double y = self->_desiredLayoutRect.origin.y;
  double width = self->_desiredLayoutRect.size.width;
  double height = self->_desiredLayoutRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrimaryItemDelegate:(id)a3
{
}

- (PXMessagesStackItemsLayoutPrimaryItemDelegate)primaryItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryItemDelegate);
  return (PXMessagesStackItemsLayoutPrimaryItemDelegate *)WeakRetained;
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v4;
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  return v4;
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  return a3;
}

- (void)setAccessoryMediaKind:(unsigned __int8)a3
{
  if (self->_accessoryMediaKind != a3)
  {
    self->_accessoryMediaKind = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)setAccessoryPresentationType:(unsigned __int8)a3
{
  if (self->_accessoryPresentationType != a3)
  {
    self->_accessoryPresentationType = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)setMediaKind:(unsigned __int8)a3
{
  if (self->_mediaKind != a3)
  {
    self->_mediaKind = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)setPresentationType:(unsigned __int8)a3
{
  if (self->_presentationType != a3)
  {
    self->_presentationType = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)setRotationAngle:(double)a3
{
  if (self->_rotationAngle != a3)
  {
    if (a3 < 0.0 || a3 > 1.57079633)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayout.m", 1021, @"Invalid parameter not satisfying: %@", @"rotationAngle >= 0.0 && rotationAngle <= (M_PI / 2.0)" object file lineNumber description];
    }
    self->_rotationAngle = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateLayoutHelper];
  }
}

- (void)setNormalizedContentInsets:(double)a3
{
  if (self->_normalizedContentInsets != a3)
  {
    if (a3 < 0.0 || a3 >= 1.0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayout.m", 1012, @"Invalid parameter not satisfying: %@", @"normalizedContentInsets >= 0.0 && normalizedContentInsets < 1.0" object file lineNumber description];
    }
    self->_normalizedContentInsets = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateLayoutHelper];
  }
}

- (void)setNormalizedStackVerticalOffset:(double)a3
{
  if (self->_normalizedStackVerticalOffset != a3)
  {
    if (a3 < 0.0 || a3 > 1.0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayout.m", 1003, @"Invalid parameter not satisfying: %@", @"normalizedStackVerticalOffset >= 0.0 && normalizedStackVerticalOffset <= 1.0" object file lineNumber description];
    }
    self->_normalizedStackVerticalOffset = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateLayoutHelper];
  }
}

- (void)setNormalizedStackHorizontalOffsets:(id)a3
{
  v8 = (NSArray *)a3;
  id v4 = self->_normalizedStackHorizontalOffsets;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)[(NSArray *)v8 copy];
      normalizedStackHorizontalOffsets = self->_normalizedStackHorizontalOffsets;
      self->_normalizedStackHorizontalOffsets = v6;

      [(PXMessagesStackItemsLayout *)self _invalidateLayoutHelper];
    }
  }
}

- (void)setNormalizedStackSizeTransform:(double)a3
{
  if (self->_normalizedStackSizeTransform != a3)
  {
    if (a3 <= 0.0 || a3 > 1.0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayout.m", 986, @"Invalid parameter not satisfying: %@", @"normalizedStackSizeTransform > 0.0 && normalizedStackSizeTransform <= 1.0" object file lineNumber description];
    }
    self->_normalizedStackSizeTransform = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateLayoutHelper];
  }
}

- (void)setStackedItemsCount:(unint64_t)a3
{
  if (self->_stackedItemsCount != a3)
  {
    self->_stackedItemsCount = a3;
    [(PXGItemsLayout *)self invalidateLoadedItems];
    [(PXMessagesStackItemsLayout *)self _invalidateLayoutHelper];
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)setNormalizedPageWidth:(double)a3
{
  if (self->_normalizedPageWidth != a3)
  {
    self->_normalizedPageWidth = a3;
    [(PXGItemsLayout *)self invalidateLoadedItems];
    [(PXMessagesStackItemsLayout *)self _invalidateContentSize];
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)userInterfaceDirectionDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGLayout *)&v3 userInterfaceDirectionDidChange];
  [(PXGItemsLayout *)self invalidateLoadedItems];
  [(PXMessagesStackItemsLayout *)self _invalidateSprites];
}

- (void)contentSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGLayout *)&v3 contentSizeDidChange];
  [(PXGItemsLayout *)self invalidateLoadedItems];
  [(PXMessagesStackItemsLayout *)self _invalidateVisibleRect];
  [(PXMessagesStackItemsLayout *)self _invalidateSprites];
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXMessagesStackItemsLayout *)self _invalidateSprites];
}

- (void)loadedItemsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v3 loadedItemsDidChange];
  [(PXMessagesStackItemsLayout *)self _invalidateSprites];
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXGItemsLayout *)self invalidateLoadedItems];
  [(PXMessagesStackItemsLayout *)self _invalidateSprites];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXGItemsLayout *)self invalidateLoadedItems];
  [(PXMessagesStackItemsLayout *)self _invalidateContentSize];
  [(PXMessagesStackItemsLayout *)self _invalidateSprites];
}

- (void)accessoryItemsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v3 accessoryItemsDidChange];
  [(PXMessagesStackItemsLayout *)self _invalidateSprites];
}

- (void)numberOfAccessoryItemsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v3 numberOfAccessoryItemsDidChange];
  [(PXMessagesStackItemsLayout *)self _clearLayoutProperties];
  [(PXGItemsLayout *)self invalidateLoadedItems];
  [(PXMessagesStackItemsLayout *)self _invalidateContentSize];
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

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int64_t v10 = [(PXGItemsLayout *)self numberOfItems];
  v11.receiver = self;
  v11.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v11 setNumberOfItems:a3 withChangeDetails:v8 changeMediaVersionHandler:v9];

  if (v10 != a3) {
    [(PXMessagesStackItemsLayout *)self _clearLayoutProperties];
  }
  if (!v8 || [v8 hasAnyChanges])
  {
    [(PXMessagesStackItemsLayout *)self _invalidateContentSize];
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (_NSRange)itemsToLoad
{
  [(PXMessagesStackItemsLayout *)self _updateLayoutProperties];
  v3.NSUInteger length = [(PXGItemsLayout *)self numberOfItems];
  v4.location = 0x7FFFFFFFFFFFFFFFLL;
  if (v3.length)
  {
    NSUInteger v5 = 1;
    if (self->_leadingItemsRange.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      primaryItemIndedouble x = self->_primaryItemIndex;
    }
    else
    {
      NSUInteger v5 = self->_leadingItemsRange.length + 1;
      primaryItemIndedouble x = self->_leadingItemsRange.location;
    }
    if (self->_trailingItemsRange.location == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger length = 0;
    }
    else {
      NSUInteger length = self->_trailingItemsRange.length;
    }
    v4.NSUInteger length = length + v5;
    if (primaryItemIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4.location = primaryItemIndex;
      v3.location = 0;
      return NSIntersectionRange(v4, v3);
    }
  }
  else
  {
    v4.NSUInteger length = 0;
  }
  return v4;
}

- (BOOL)shouldDecorateUndefinedMediaKind
{
  return 0;
}

- (int64_t)scrollableAxis
{
  return 2;
}

- (void)_getItemsForXOffset:(double)a3 leadingItems:(_NSRange *)a4 primaryItemIndex:(unint64_t *)a5 trailingItems:(_NSRange *)a6 trailingHiddenItems:(_NSRange *)a7 pageFocus:(double *)a8
{
  if ([(PXMessagesStackItemsLayout *)self numberOfPages])
  {
    [(PXGLayout *)self userInterfaceDirection];
    [(PXGLayout *)self referenceSize];
    [(PXMessagesStackItemsLayout *)self normalizedPageWidth];
    [(PXGLayout *)self contentSize];
    PXClamp();
  }
  *a4 = (_NSRange)xmmword_1AB359BD0;
  *a5 = 0x7FFFFFFFFFFFFFFFLL;
  *a6 = (_NSRange)xmmword_1AB359BD0;
  *a8 = 0.0;
}

- (void)_signalDelegatePostUpdate
{
  if (self->_signalDelegateForPrimaryItemChange)
  {
    self->_signalDelegateForPrimaryItemChange = 0;
    id v3 = [(PXMessagesStackItemsLayout *)self primaryItemDelegate];
    [v3 primaryItemDidChangeForStackItemsLayout:self];
  }
}

- (void)_updateSprites
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXGItemsLayout *)self loadedItems];
  unint64_t v6 = v5;
  int64_t v7 = [(PXGItemsLayout *)self numberOfAccessoryItems];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0 || v7 != 0)
  {
    uint64_t v76 = v4;
    [(PXGLayout *)self visibleRect];
    double v11 = v10;
    double v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    unint64_t v80 = [(PXMessagesStackItemsLayout *)self stackedItemsCount];
    uint64_t v86 = 2 * v80;
    unint64_t v18 = 2 * v80 + 23;
    uint64_t v73 = v18 - v6;
    SEL v70 = a2;
    if (v18 < v6)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      [v63 handleFailureInMethod:v70 object:self file:@"PXMessagesStackItemsLayout.m" lineNumber:555 description:@"We should never have more loaded item sprites than geometries"];
    }
    unint64_t v19 = [(PXGLayout *)self userInterfaceDirection];
    BOOL v77 = v19 == 1;
    if (v18 > self->_decorationInfoBySpriteIndexSize)
    {
      self->_decorationInfoBySpriteIndexSize = v18;
      v20 = ($153C3A5BC4E016D58A1B9CA554FFC462 *)malloc_type_realloc(self->_decorationInfoBySpriteIndex, 8 * v18, 0x100004000313F17uLL);
      self->_decorationInfoBySpriteIndedouble x = v20;
      if (!v20)
      {
        v68 = [MEMORY[0x1E4F28B00] currentHandler];
        [v68 handleFailureInMethod:v70 object:self file:@"PXMessagesStackItemsLayout.m" lineNumber:561 description:@"Unable to reallocate memory for overlay alphas"];
      }
    }
    NSUInteger length = self->_leadingItemsRange.length;
    primaryItemIndedouble x = self->_primaryItemIndex;
    double pageFocus = self->_pageFocus;
    int64_t v24 = [(PXMessagesStackItemsLayout *)self numberOfPages];
    int64_t v25 = v24 - 1;
    NSUInteger v79 = length;
    if (primaryItemIndex == 1)
    {
      uint64_t v26 = pageFocus >= 0.0;
    }
    else if (primaryItemIndex)
    {
      if (v25 == primaryItemIndex)
      {
        uint64_t v26 = 3;
        if (pageFocus >= 0.0) {
          uint64_t v26 = 4;
        }
      }
      else if (primaryItemIndex == v24 - 2)
      {
        uint64_t v26 = 4 * (pageFocus < 0.0);
      }
      else
      {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = 2;
      if (pageFocus < 0.0) {
        uint64_t v26 = 1;
      }
    }
    uint64_t v82 = v26;
    int v27 = [(PXMessagesStackItemsLayout *)self presentationType];
    int v28 = [(PXMessagesStackItemsLayout *)self mediaKind];
    [(PXGLayout *)self displayScale];
    uint64_t v78 = v29;
    int v74 = v28;
    int v75 = v27;
    double v83 = pageFocus;
    if (v11 >= 0.0
      && (v96.origin.double x = v11,
          v96.origin.double y = v13,
          v96.size.double width = v15,
          v96.size.double height = v17,
          double MaxX = CGRectGetMaxX(v96),
          [(PXGLayout *)self contentSize],
          MaxX <= v31))
    {
      CGFloat v32 = v17;
      unint64_t archSide = self->_archSide;
    }
    else
    {
      CGFloat v32 = v17;
      unint64_t archSide = 0;
    }
    NSUInteger v33 = v86 + 3;
    [(PXMessagesStackItemsLayout *)self desiredLayoutRect];
    double x = v97.origin.x;
    double y = v97.origin.y;
    double width = v97.size.width;
    double height = v97.size.height;
    BOOL IsNull = CGRectIsNull(v97);
    if (IsNull) {
      double v39 = v11;
    }
    else {
      double v39 = v11 + x;
    }
    if (IsNull)
    {
      double v40 = v15;
    }
    else
    {
      double v13 = v13 + y;
      double v40 = width;
    }
    if (IsNull) {
      double height = v32;
    }
    if (v19 == 1) {
      uint64_t v41 = v25 - primaryItemIndex;
    }
    else {
      uint64_t v41 = primaryItemIndex;
    }
    if (v19 != 1) {
      primaryItemIndedouble x = v25 - primaryItemIndex;
    }
    double v42 = v83;
    if (v41 <= 3) {
      PXClamp();
    }
    [(PXMessagesStackItemsLayout *)self leftEdgeInternalHorizontalAlignment];
    double v44 = v39 - v43 * 0.0;
    if (primaryItemIndex <= 3) {
      PXClamp();
    }
    uint64_t v45 = [(PXMessagesStackItemsLayout *)self rightEdgeInternalHorizontalAlignment];
    v72 = &v69;
    double v47 = v44 + v46 * 0.0;
    self->_desiredVisibleRect.origin.double x = v47;
    self->_desiredVisibleRect.origin.double y = v13;
    self->_desiredVisibleRect.size.double width = v40;
    self->_desiredVisibleRect.size.double height = height;
    MEMORY[0x1F4188790](v45, v48);
    unint64_t v84 = v19;
    v85 = &v69 - 2 * v49;
    BOOL v50 = v19 == 1;
    uint64_t v51 = 20;
    if (v19 == 1) {
      NSUInteger v52 = 20;
    }
    else {
      NSUInteger v52 = 0;
    }
    if (v50) {
      NSUInteger v53 = 0;
    }
    else {
      NSUInteger v53 = v33;
    }
    uint64_t v71 = v86 + 2;
    if (v50) {
      unint64_t v54 = 20;
    }
    else {
      unint64_t v54 = v86 + 2;
    }
    v94.location = v52;
    v94.NSUInteger length = v33;
    v95.location = v53;
    v95.NSUInteger length = 20;
    if (NSIntersectionRange(v94, v95).length)
    {
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      [v64 handleFailureInMethod:v70, self, @"PXMessagesStackItemsLayout.m", 636, @"Invalid parameter not satisfying: %@", @"NSIntersectionRange(mainItemsGeometryRange, trailingHiddenItemGeometryRange).length == 0" object file lineNumber description];
    }
    if (v33 + 20 != v18)
    {
      v65 = [MEMORY[0x1E4F28B00] currentHandler];
      [v65 handleFailureInMethod:v70, self, @"PXMessagesStackItemsLayout.m", 637, @"Invalid parameter not satisfying: %@", @"mainItemsGeometryRange.length + trailingHiddenItemGeometryRange.length == geometriesCount" object file lineNumber description];
    }
    unint64_t v55 = v52 + v33;
    if (v52 + v33 <= v53 + 20) {
      unint64_t v55 = v53 + 20;
    }
    if (v55 > v18)
    {
      v66 = [MEMORY[0x1E4F28B00] currentHandler];
      [v66 handleFailureInMethod:v70, self, @"PXMessagesStackItemsLayout.m", 638, @"Invalid parameter not satisfying: %@", @"MAX(NSMaxRange(mainItemsGeometryRange), NSMaxRange(trailingHiddenItemGeometryRange)) <= geometriesCount" object file lineNumber description];
    }
    if (v54 >= v18)
    {
      v67 = [MEMORY[0x1E4F28B00] currentHandler];
      [v67 handleFailureInMethod:v70, self, @"PXMessagesStackItemsLayout.m", 639, @"Invalid parameter not satisfying: %@", @"mainItemToCopy < geometriesCount" object file lineNumber description];
    }
    -[PXMessagesStackItemsLayoutHelper getGeometries:count:forVisibleRect:focus:archSide:keyframeOverride:](self->_layoutHelper, "getGeometries:count:forVisibleRect:focus:archSide:keyframeOverride:", &v85[10 * v52], v33, archSide, v82, v47, v13, v40, height, v42);
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v88 = 0u;
    layoutHelper = self->_layoutHelper;
    if (layoutHelper)
    {
      if (v84 == 1) {
        uint64_t v57 = 0;
      }
      else {
        uint64_t v57 = v71;
      }
      -[PXMessagesStackItemsLayoutHelper baseGeometryForIndex:visibleRect:](layoutHelper, "baseGeometryForIndex:visibleRect:", v57, v47, v13, v40, height);
    }
    if (v53 < v53 + 20)
    {
      v58 = &v85[10 * v53];
      do
      {
        if (v53 >= v18)
        {
          double v83 = [MEMORY[0x1E4F28B00] currentHandler];
          [*(id *)&v83 handleFailureInMethod:v70, self, @"PXMessagesStackItemsLayout.m", 647, @"Invalid parameter not satisfying: %@", @"i < geometriesCount" object file lineNumber description];
        }
        long long v59 = v91;
        *((_OWORD *)v58 + 2) = v90;
        *((_OWORD *)v58 + 3) = v59;
        *((_OWORD *)v58 + 4) = v92;
        long long v60 = v89;
        *(_OWORD *)v58 = v88;
        *((_OWORD *)v58 + 1) = v60;
        v58 += 10;
        ++v53;
        --v51;
      }
      while (v51);
    }
    uint64_t v61 = v86 - (v80 - v79) + 21;
    if (v84 != 1) {
      uint64_t v61 = v80 - v79 + 1;
    }
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    v87[3] = &v85[10 * v61];
    v62 = self->_layoutHelper;
    [(PXGLayout *)self referenceSize];
    -[PXMessagesStackItemsLayoutHelper maxItemSizeForReferenceSize:](v62, "maxItemSizeForReferenceSize:");
    PXSizeScale();
  }
}

void *__44__PXMessagesStackItemsLayout__updateSprites__block_invoke(void *result, uint64_t a2)
{
  v2 = result;
  if (HIDWORD(a2))
  {
    __asm
    {
      FMOV            V10.2S, #1.0
      FMOV            V1.4S, #20.0
    }
    uint64_t v9 = result[8];
    double v10 = (void *)result[4];
    if (v10) {
      objc_msgSend(v10, "itemsLayout:aspectRatioForItem:", v2[5], v9 + a2, *((_OWORD *)off_1E5DAAF90 + 1), *(_OWORD *)off_1E5DAAF90, _Q1, *((_OWORD *)off_1E5DAAF90 + 5), *((_OWORD *)off_1E5DAAF90 + 4), *((_OWORD *)off_1E5DAAF90 + 9), *((_OWORD *)off_1E5DAAF90 + 8), *((_OWORD *)off_1E5DAAF90 + 7), *((_OWORD *)off_1E5DAAF90 + 6), *((_OWORD *)off_1E5DAAF90 + 3), *((_OWORD *)off_1E5DAAF90 + 2), *(_OWORD *)off_1E5DAAF40);
    }
    PXClamp();
  }
  *(void *)(*(void *)(result[6] + 8) + 24) = result[7];
  return result;
}

uint64_t __44__PXMessagesStackItemsLayout__updateSprites__block_invoke_2(uint64_t result, unint64_t a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
    uint64_t v9 = a3 + 3;
    uint64_t v10 = a5 + 8;
    long long v38 = *((_OWORD *)off_1E5DAAF88 + 1);
    long long v39 = *(_OWORD *)off_1E5DAAF88;
    uint64_t v11 = *((void *)off_1E5DAAF88 + 4);
    __asm
    {
      FMOV            V8.2S, #1.0
      FMOV            V0.4S, #20.0
    }
    long long v37 = _Q0;
    do
    {
      *(_OWORD *)(v10 - 8) = v39;
      *(_OWORD *)(v10 + 8) = v38;
      *(void *)(v10 + 24) = v11;
      *(unsigned char *)(v10 - 8) = *(unsigned char *)(v7 + 50);
      *(unsigned char *)(v10 - 7) = *(unsigned char *)(v7 + 51);
      *(_WORD *)(v10 + 24) = *(_WORD *)(v7 + 48);
      uint64_t v18 = *(void *)(*(void *)(v7 + 40) + 8);
      uint64_t v19 = *(void *)(v18 + 24);
      if (v19)
      {
        *(void *)(v18 + 24) = v19 - 1;
        v20.f64[0] = MEMORY[0x1AD10BC20](0.75, *(double *)(v8 + 16), *(double *)(v8 + 24));
        v20.f64[1] = v21;
        *(float *)&float64_t v21 = *(double *)(v8 + 32);
        *(_OWORD *)v9[-3].f32 = *(_OWORD *)v8;
        *(double *)&v9[-1] = *(float *)&v21;
        *uint64_t v9 = vcvt_f32_f64(v20);
        *(void *)uint64_t v10 = _D8;
        long long v22 = *((_OWORD *)off_1E5DAAF90 + 3);
        *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
        *(_OWORD *)(a4 + 48) = v22;
        long long v23 = *((_OWORD *)off_1E5DAAF90 + 7);
        *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
        *(_OWORD *)(a4 + 112) = v23;
        long long v24 = *((_OWORD *)off_1E5DAAF90 + 9);
        *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
        *(_OWORD *)(a4 + 144) = v24;
        long long v25 = *((_OWORD *)off_1E5DAAF90 + 5);
        *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
        *(_OWORD *)(a4 + 80) = v25;
        long long v26 = *((_OWORD *)off_1E5DAAF90 + 1);
        *(_OWORD *)a4 = *(_OWORD *)off_1E5DAAF90;
        *(_OWORD *)(a4 + 16) = v26;
        *(_OWORD *)(a4 + 36) = v37;
        CGRect result = PFMessagesStackLayoutGeometryGetScale();
        *(float *)&double v27 = v27;
        double v28 = *(double *)(v8 + 48);
        float v29 = *(double *)(v8 + 40);
        *(float *)(a4 + 56) = v29;
        *(_DWORD *)(a4 + 60) = LODWORD(v27);
        float v30 = v28;
      }
      else
      {
        long long v31 = *((_OWORD *)off_1E5DAAF90 + 7);
        *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E5DAAF90 + 6);
        *(_OWORD *)(a4 + 112) = v31;
        long long v32 = *((_OWORD *)off_1E5DAAF90 + 9);
        *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E5DAAF90 + 8);
        *(_OWORD *)(a4 + 144) = v32;
        long long v33 = *((_OWORD *)off_1E5DAAF90 + 3);
        *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E5DAAF90 + 2);
        *(_OWORD *)(a4 + 48) = v33;
        long long v34 = *((_OWORD *)off_1E5DAAF90 + 5);
        *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E5DAAF90 + 4);
        *(_OWORD *)(a4 + 80) = v34;
        long long v35 = *((_OWORD *)off_1E5DAAF90 + 1);
        *(_OWORD *)a4 = *(_OWORD *)off_1E5DAAF90;
        *(_OWORD *)(a4 + 16) = v35;
        float v30 = 0.0;
      }
      *(float *)a4 = v30;
      a4 += 160;
      if (*(unsigned char *)(v7 + 52)) {
        uint64_t v36 = -80;
      }
      else {
        uint64_t v36 = 80;
      }
      v8 += v36;
      v9 += 4;
      v10 += 40;
      LODWORD(v5) = v5 - 1;
    }
    while (v5);
  }
  return result;
}

- (void)_invalidateSprites
{
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
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v6 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout _invalidateSprites]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXMessagesStackItemsLayout.m", 539, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_syncPropertiesToLayoutHelper:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PXMessagesStackItemsLayout__syncPropertiesToLayoutHelper___block_invoke;
  v3[3] = &unk_1E5DB1348;
  v3[4] = self;
  [a3 performChanges:v3];
}

void __60__PXMessagesStackItemsLayout__syncPropertiesToLayoutHelper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "setStackedItemsCount:", objc_msgSend(v3, "stackedItemsCount"));
  [*(id *)(a1 + 32) normalizedStackSizeTransform];
  objc_msgSend(v5, "setNormalizedStackSizeTransform:");
  uint64_t v4 = [*(id *)(a1 + 32) normalizedStackHorizontalOffsets];
  [v5 setNormalizedStackHorizontalOffsets:v4];

  [*(id *)(a1 + 32) normalizedStackVerticalOffset];
  objc_msgSend(v5, "setNormalizedStackVerticalOffset:");
  [*(id *)(a1 + 32) normalizedContentInsets];
  objc_msgSend(v5, "setNormalizedContentInsets:");
  [*(id *)(a1 + 32) rotationAngle];
  objc_msgSend(v5, "setRotationAngle:");
}

- (void)_updateLayoutHelper
{
}

- (void)_invalidateLayoutHelper
{
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v6 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout _invalidateLayoutHelper]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXMessagesStackItemsLayout.m", 520, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateVisibleRect
{
  if (self->_scrollToBeginning)
  {
    [(PXGLayout *)self contentSize];
    PXSizeIsEmpty();
  }
}

- (void)_invalidateVisibleRect
{
  p_preItemLoadingFlags = &self->_preItemLoadingFlags;
  unint64_t needsUpdate = self->_preItemLoadingFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_preItemLoadingFlags.isPerformingUpdate)
    {
LABEL_6:
      p_preItemLoadingFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_preItemLoadingFlags.updated & 2) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v6 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout _invalidateVisibleRect]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXMessagesStackItemsLayout.m", 502, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_preItemLoadingFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_preItemLoadingFlags.willPerformUpdate;
  p_preItemLoadingFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContentSize
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(PXMessagesStackItemsLayout *)self numberOfPages];
  if (v7)
  {
    unint64_t v8 = v7 - 1;
    [(PXMessagesStackItemsLayout *)self normalizedPageWidth];
    double v10 = (double)v8 * (v4 * v9) + 0.0;
  }
  else
  {
    double v10 = 0.0;
  }
  double v11 = v4 + v10;
  -[PXGLayout setContentSize:](self, "setContentSize:", v11, v6);
}

- (void)_invalidateContentSize
{
  p_preItemLoadingFlags = &self->_preItemLoadingFlags;
  unint64_t needsUpdate = self->_preItemLoadingFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_preItemLoadingFlags.isPerformingUpdate)
    {
LABEL_6:
      p_preItemLoadingFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_preItemLoadingFlags.updated)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout _invalidateContentSize]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXMessagesStackItemsLayout.m", 484, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_preItemLoadingFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_preItemLoadingFlags.willPerformUpdate;
  p_preItemLoadingFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateLayoutProperties
{
  if ([(PXMessagesStackItemsLayout *)self numberOfPages])
  {
    primaryItemIndedouble x = self->_primaryItemIndex;
    p_double pageFocus = &self->_pageFocus;
    double pageFocus = self->_pageFocus;
    NSUInteger location = self->_trailingHiddenItemsRange.location;
    NSUInteger length = self->_trailingHiddenItemsRange.length;
    [(PXGLayout *)self visibleRect];
    -[PXMessagesStackItemsLayout _getItemsForXOffset:leadingItems:primaryItemIndex:trailingItems:trailingHiddenItems:pageFocus:](self, "_getItemsForXOffset:leadingItems:primaryItemIndex:trailingItems:trailingHiddenItems:pageFocus:", &self->_leadingItemsRange, &self->_primaryItemIndex, &self->_trailingItemsRange, &self->_trailingHiddenItemsRange, &self->_pageFocus);
    if (self->_trailingHiddenItemsRange.location != location || self->_trailingHiddenItemsRange.length != length)
    {
      self->_firstTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
      self->_secondTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (self->_primaryItemIndex == primaryItemIndex)
    {
      double v9 = *p_pageFocus;
      if (*p_pageFocus == 0.0)
      {
        self->_unint64_t archSide = 0;
      }
      else
      {
        double v10 = dbl_1AB359BE0[!self->_higherPageDirectionTolerance];
        if (v9 <= 0.0 || pageFocus > v10)
        {
          double v12 = -v10;
          if (v9 >= 0.0 || pageFocus < v12) {
            goto LABEL_25;
          }
          unint64_t v14 = 1;
        }
        else
        {
          unint64_t v14 = 2;
        }
        self->_unint64_t archSide = v14;
      }
    }
    else
    {
      self->_signalDelegateForPrimaryItemChange = 1;
    }
LABEL_25:
    self->_higherPageDirectionTolerance = 0;
    return;
  }
  [(PXMessagesStackItemsLayout *)self _clearLayoutProperties];
}

- (void)_clearLayoutProperties
{
  self->_leadingItemsRange = (_NSRange)xmmword_1AB359BD0;
  self->_primaryItemIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  self->_trailingItemsRange = (_NSRange)xmmword_1AB359BD0;
  self->_trailingHiddenItemsRange = (_NSRange)xmmword_1AB359BD0;
  self->_firstTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
  self->_secondTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
  self->_double pageFocus = 0.0;
  self->_unint64_t archSide = 0;
}

- (int64_t)numberOfPages
{
  int64_t v3 = [(PXGItemsLayout *)self numberOfItems];
  return [(PXGItemsLayout *)self numberOfAccessoryItems] + v3;
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    int64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXMessagesStackItemsLayout.m", 425, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_preItemLoadingFlags = &self->_preItemLoadingFlags;
  self->_preItemLoadingFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_preItemLoadingFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_preItemLoadingFlags.isPerformingUpdate)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      double v10 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXMessagesStackItemsLayout.m", 397, @"Invalid parameter not satisfying: %@", @"!_preItemLoadingFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_preItemLoadingFlags->needsUpdate;
    }
    p_preItemLoadingFlags->isPerformingUpdate = 1;
    p_preItemLoadingFlags->updated = 1;
    if (needsUpdate)
    {
      p_preItemLoadingFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXMessagesStackItemsLayout *)self _updateContentSize];
      if (!p_preItemLoadingFlags->isPerformingUpdate)
      {
        CGFloat v17 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v18 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout update]"];
        [v17 handleFailureInFunction:v18, @"PXMessagesStackItemsLayout.m", 401, @"Invalid parameter not satisfying: %@", @"_preItemLoadingFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_preItemLoadingFlags->needsUpdate;
    p_preItemLoadingFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_preItemLoadingFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXMessagesStackItemsLayout *)self _updateVisibleRect];
      unint64_t v5 = p_preItemLoadingFlags->needsUpdate;
    }
    p_preItemLoadingFlags->isPerformingUpdate = 0;
    if (v5)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      double v12 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout update]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXMessagesStackItemsLayout.m", 404, @"still needing to update %lu after update pass", p_preItemLoadingFlags->needsUpdate);
    }
  }
  [(PXGItemsLayout *)self updateLoadedItemsIfNeeded];
  [(PXGItemsLayout *)self updateAccessoryItemsIfNeeded];
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t v7 = self->_updateFlags.needsUpdate;
  if (v7)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v14 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXMessagesStackItemsLayout.m", 409, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 4;
    if ((v7 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXMessagesStackItemsLayout *)self _updateLayoutHelper];
      if (!self->_updateFlags.isPerformingUpdate)
      {
        uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
        float64x2_t v20 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout update]"];
        [v19 handleFailureInFunction:v20, @"PXMessagesStackItemsLayout.m", 413, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 8uLL;
    if ((v8 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFF7;
      [(PXMessagesStackItemsLayout *)self _updateSprites];
      unint64_t v8 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v8)
    {
      CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
      double v16 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout update]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PXMessagesStackItemsLayout.m", 416, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v21 update];
  [(PXMessagesStackItemsLayout *)self _signalDelegatePostUpdate];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    int64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXMessagesStackItemsLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXMessagesStackItemsLayout.m", 393, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)reloadAccessoryItems
{
}

- (void)scrollToBeginning
{
  self->_scrollToBeginning = 1;
  [(PXMessagesStackItemsLayout *)self _invalidateVisibleRect];
}

- (void)setIsSettling:(BOOL)a3
{
  if (self->_isSettling != a3)
  {
    self->_isSettling = a3;
    if (!a3) {
      self->_higherPageDirectionTolerance = 1;
    }
  }
}

- (void)setDesiredLayoutRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_desiredLayoutRect = &self->_desiredLayoutRect;
  if (!CGRectEqualToRect(self->_desiredLayoutRect, a3))
  {
    p_desiredLayoutRect->origin.CGFloat x = x;
    p_desiredLayoutRect->origin.CGFloat y = y;
    p_desiredLayoutRect->size.CGFloat width = width;
    p_desiredLayoutRect->size.CGFloat height = height;
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)setRightEdgeInternalHorizontalAlignment:(double)a3
{
  if (self->_rightEdgeInternalHorizontalAlignment != a3)
  {
    self->_rightEdgeInternalHorizontalAlignment = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (void)setLeftEdgeInternalHorizontalAlignment:(double)a3
{
  if (self->_leftEdgeInternalHorizontalAlignment != a3)
  {
    self->_leftEdgeInternalHorizontalAlignment = a3;
    [(PXMessagesStackItemsLayout *)self _invalidateSprites];
  }
}

- (double)horizontalContentMarginForSize:(CGSize)a3 normalizedVerticalContentInsets:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v8 = [(id)objc_opt_class() _sharedTemplateLayoutHelper];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PXMessagesStackItemsLayout_horizontalContentMarginForSize_normalizedVerticalContentInsets___block_invoke;
  v11[3] = &unk_1E5DB1320;
  v11[4] = self;
  v11[5] = v8;
  *(double *)&v11[6] = a4;
  id v9 = v8;
  [v9 performChanges:v11];
  objc_msgSend(v9, "horizontalContentMarginForReferenceSize:itemAspect:", width, height, 0.75);
  [(PXGLayout *)self displayScale];
  PXFloatRoundToPixel();
}

void __93__PXMessagesStackItemsLayout_horizontalContentMarginForSize_normalizedVerticalContentInsets___block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 _syncPropertiesToLayoutHelper:v4];
  [v5 setNormalizedContentInsets:*(double *)(a1 + 48)];
}

- (double)horizontalContentMargin
{
  layoutHelper = self->_layoutHelper;
  [(PXMessagesStackItemsLayout *)self desiredLayoutRect];
  -[PXMessagesStackItemsLayoutHelper horizontalContentMarginForReferenceSize:itemAspect:](layoutHelper, "horizontalContentMarginForReferenceSize:itemAspect:", v4, v5, 0.75);
  [(PXGLayout *)self displayScale];
  PXFloatRoundToPixel();
}

- (double)primaryItemFocus
{
}

- (int64_t)primaryItemIndex
{
  return self->_primaryItemIndex;
}

- ($9C403407A5B624E1CD2E2AFE16A3B680)tapbackConfigurationForProposedConfiguration:(SEL)a3 spriteIndex:(id *)a4
{
  int64_t v6 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:");
  [(PXGLayout *)self userInterfaceDirection];
  [(PXMessagesStackItemsLayout *)self stackedItemsCount];
  if (v6 == [(PXMessagesStackItemsLayout *)self primaryItemIndex] - 1) {
    PXFloatProgressBetween();
  }
  PXFloatByLinearlyInterpolatingFloats();
}

- (double)selectionOverlayAlphaForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_decorationInfoBySpriteIndexSize <= a3)
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayout.m", 203, @"Invalid parameter not satisfying: %@", @"spriteIndex < _decorationInfoBySpriteIndexSize" object file lineNumber description];
  }
  if ([(PXGItemsLayout *)self itemForSpriteIndex:v3] == self->_primaryItemIndex) {
    return 0.4;
  }
  else {
    return self->_decorationInfoBySpriteIndex[v3].var0;
  }
}

- (double)overlayAlphaForSpriteIndex:(unsigned int)a3
{
  uint64_t v4 = a3;
  if (self->_decorationInfoBySpriteIndexSize <= a3)
  {
    unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXMessagesStackItemsLayout.m", 198, @"Invalid parameter not satisfying: %@", @"spriteIndex < _decorationInfoBySpriteIndexSize" object file lineNumber description];
  }
  return self->_decorationInfoBySpriteIndex[v4].var0;
}

- (BOOL)getHorizontalOffsetForObjectReference:(id)a3 outOffset:(double *)a4
{
  uint64_t v6 = [(PXGItemsLayout *)self itemForObjectReference:a3];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PXGLayout *)self referenceSize];
    double v8 = v7;
    [(PXMessagesStackItemsLayout *)self normalizedPageWidth];
    double v10 = v8 * v9;
    [(PXGLayout *)self contentSize];
    double v12 = v11;
    double v13 = v10 * (double)v6;
    unint64_t v14 = [(PXGLayout *)self userInterfaceDirection];
    double v15 = v12 - v13 - v8;
    if (v14 != 1) {
      double v15 = v13;
    }
    *a4 = v15;
  }
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (double)pageOffsetLessThanOffset:(double)a3
{
  [(PXGLayout *)self referenceSize];
  double v5 = v4;
  [(PXMessagesStackItemsLayout *)self normalizedPageWidth];
  if (v5 * v6 > 0.0)
  {
    [(PXMessagesStackItemsLayout *)self numberOfPages];
    PXClamp();
  }
  PXAssertGetLog();
}

- (double)pageOffsetGreaterThanOffset:(double)a3
{
  [(PXGLayout *)self referenceSize];
  double v5 = v4;
  [(PXMessagesStackItemsLayout *)self normalizedPageWidth];
  if (v5 * v6 > 0.0)
  {
    [(PXMessagesStackItemsLayout *)self numberOfPages];
    PXClamp();
  }
  PXAssertGetLog();
}

- (double)closestPageOffsetForHorizontalOffset:(double)a3
{
  [(PXGLayout *)self referenceSize];
  double v6 = v5;
  [(PXMessagesStackItemsLayout *)self normalizedPageWidth];
  double v8 = v6 * v7;
  if (v8 <= 0.0) {
    PXAssertGetLog();
  }
  double v9 = fmax(a3, 0.0);
  double v10 = floor(v9 / v8);
  double v11 = v8 * v10;
  double v12 = v8 + v8 * v10;
  double v13 = v9 - v8 * v10;
  double v14 = v12 - v9;
  double v15 = (double)[(PXMessagesStackItemsLayout *)self numberOfPages];
  if (v14 >= v13 || v10 + 1.0 >= v15) {
    return v11;
  }
  return v12;
}

- (void)dealloc
{
  free(self->_decorationInfoBySpriteIndex);
  self->_decorationInfoBySpriteIndeCGFloat x = 0;
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackItemsLayout;
  [(PXGItemsLayout *)&v3 dealloc];
}

- (PXMessagesStackItemsLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)PXMessagesStackItemsLayout;
  v2 = [(PXGItemsLayout *)&v8 init];
  objc_super v3 = v2;
  if (v2)
  {
    [(PXGItemsLayout *)v2 setLazy:1];
    double v4 = objc_alloc_init(PXMessagesStackItemsLayoutHelper);
    layoutHelper = v3->_layoutHelper;
    v3->_layoutHelper = v4;

    v3->_stackedItemsCount = 2;
    v3->_decorationInfoBySpriteIndexSize = 27;
    v3->_decorationInfoBySpriteIndeCGFloat x = ($153C3A5BC4E016D58A1B9CA554FFC462 *)malloc_type_calloc(0x1BuLL, 8uLL, 0x100004000313F17uLL);
    v3->_primaryItemIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
    v3->_leadingItemsRange = (_NSRange)xmmword_1AB359BD0;
    v3->_trailingItemsRange = (_NSRange)xmmword_1AB359BD0;
    v3->_trailingHiddenItemsRange = (_NSRange)xmmword_1AB359BD0;
    v3->_firstTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
    v3->_secondTrailingHiddenItemWithTapback = 0x7FFFFFFFFFFFFFFFLL;
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v3->_desiredLayoutRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v3->_desiredLayoutRect.size = v6;
    v3->_double pageFocus = 0.0;
    v3->_unint64_t archSide = 0;
  }
  return v3;
}

+ (id)_sharedTemplateLayoutHelper
{
  if (_sharedTemplateLayoutHelper_onceToken != -1) {
    dispatch_once(&_sharedTemplateLayoutHelper_onceToken, &__block_literal_global_22801);
  }
  v2 = (void *)_sharedTemplateLayoutHelper__layoutHelper;
  return v2;
}

void __57__PXMessagesStackItemsLayout__sharedTemplateLayoutHelper__block_invoke()
{
  v0 = objc_alloc_init(PXMessagesStackItemsLayoutHelper);
  v1 = (void *)_sharedTemplateLayoutHelper__layoutHelper;
  _sharedTemplateLayoutHelper__layoutHelper = (uint64_t)v0;
}

@end