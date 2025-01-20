@interface PXGItemsLayout
- (BOOL)delegateRespondsTo:(unint64_t)a3;
- (BOOL)isApplyingItemChanges;
- (BOOL)isLazy;
- (BOOL)spriteIndexIsAccessoryItem:(unsigned int)a3;
- (BOOL)spriteIndexIsItem:(unsigned int)a3;
- (CGSize)sizeForItem:(int64_t)a3;
- (PXGItemsGeometry)itemsGeometry;
- (PXGItemsLayout)init;
- (PXGItemsLayoutDelegate)delegate;
- (PXGItemsLayoutDelegate)insetDelegate;
- (PXGItemsLayoutDelegate)marginDelegate;
- (PXGLayoutContentSource)accessoryItemContentSource;
- (_NSRange)itemRangeForSpriteIndexRange:(_PXGSpriteIndexRange)a3;
- (_NSRange)itemsToLoad;
- (_NSRange)loadedItems;
- (id)axSpriteIndexes;
- (id)axSpriteIndexesInRect:(CGRect)a3;
- (id)axVisibleSpriteIndexes;
- (id)description;
- (id)dropTargetObjectReference;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)itemsForSpriteIndexes:(id)a3;
- (id)loadedItemsForItems:(id)a3;
- (id)objectReferenceForItem:(int64_t)a3;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (id)spriteIndexesForItems:(id)a3;
- (int64_t)_numberOfItems;
- (int64_t)accessoryItemForSpriteIndex:(unsigned int)a3;
- (int64_t)itemForObjectReference:(id)a3;
- (int64_t)itemForObjectReference:(id)a3 options:(unint64_t)a4;
- (int64_t)itemForSpriteIndex:(unsigned int)a3;
- (int64_t)numberOfAccessoryItems;
- (unint64_t)dropTargetStyle;
- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (unsigned)spriteIndexForAccessoryItem:(int64_t)a3;
- (unsigned)spriteIndexForItem:(int64_t)a3;
- (void)_handleFocusChangeWithUserInfo:(id)a3;
- (void)_handleSelectionChangeWithUserInfo:(id)a3;
- (void)_invalidateAccessoryItems;
- (void)_updateAccessoryItems;
- (void)_updateFocusedItemIfNeeded;
- (void)_updateHoveredItemIfNeeded;
- (void)_updateLoadedItems;
- (void)_updatePressedItemIfNeeded;
- (void)_updateStylableType:(int64_t)a3;
- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5;
- (void)beginApplyingItemChanges;
- (void)dealloc;
- (void)didUpdate;
- (void)endApplyingItemChanges;
- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3;
- (void)invalidateLoadedItems;
- (void)invalidateStylableType:(int64_t)a3;
- (void)modifyAccessoryItemSpritesInRange:(_PXGSpriteIndexRange)a3 state:(id)a4;
- (void)setAccessoryItemContentSource:(id)a3;
- (void)setAnimationParameters:(id)a3 forStylableType:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDropTargetObjectReference:(id)a3;
- (void)setDropTargetStyle:(unint64_t)a3;
- (void)setItem:(int64_t)a3 forStylableType:(int64_t)a4 animated:(BOOL)a5;
- (void)setLazy:(BOOL)a3;
- (void)setLoadedItems:(_NSRange)a3;
- (void)setNumberOfAccessoryItems:(int64_t)a3;
- (void)setNumberOfItems:(int64_t)a3;
- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4;
- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5;
- (void)set_numberOfItems:(int64_t)a3;
- (void)update;
- (void)updateAccessoryItemsIfNeeded;
- (void)updateLoadedItemsIfNeeded;
- (void)willUpdate;
@end

@implementation PXGItemsLayout

- (int64_t)_numberOfItems
{
  return self->__numberOfItems;
}

- (int64_t)itemForSpriteIndex:(unsigned int)a3
{
  return self->_loadedItems.location + a3;
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  if (a3 == -1)
  {
    v7 = [(PXGItemsLayout *)self itemsGeometry];
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)&a3;
  if ([(PXGLayout *)self localNumberOfSprites] > a3)
  {
    v7 = [(PXGItemsLayout *)self itemsGeometry];
    int64_t v8 = [(PXGItemsLayout *)self itemForSpriteIndex:v6];
LABEL_5:
    unsigned int v9 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", [v7 itemClosestToItem:v8 inDirection:a4]);

    return v9;
  }
  return -1;
}

- (unsigned)spriteIndexForItem:(int64_t)a3
{
  NSUInteger location = self->_loadedItems.location;
  if (a3 - location < self->_loadedItems.length && a3 >= location) {
    return a3 - location;
  }
  else {
    return -1;
  }
}

- (BOOL)delegateRespondsTo:(unint64_t)a3
{
  return (a3 & ~self->_delegateRespondsTo) == 0;
}

- (PXGItemsLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGItemsLayoutDelegate *)WeakRetained;
}

- (int64_t)numberOfAccessoryItems
{
  return self->_numberOfAccessoryItems;
}

- (void)setItem:(int64_t)a3 forStylableType:(int64_t)a4 animated:(BOOL)a5
{
  self->_pendingStylableItems[a4] = a3;
  self->_pendingAnimations[a4] = a5;
  [(PXGItemsLayout *)self invalidateStylableType:a4];
}

- (void)willUpdate
{
  v9.receiver = self;
  v9.super_class = (Class)PXGItemsLayout;
  [(PXGLayout *)&v9 willUpdate];
  self->_loadedItemsUpdateFlags.willPerformUpdate = 1;
  if (self->_loadedItemsUpdateFlags.isPerformingUpdate)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[PXGItemsLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGItemsLayout.m", 456, @"Invalid parameter not satisfying: %@", @"!_loadedItemsUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_accessoryItemsUpdateFlags.willPerformUpdate = 1;
  if (self->_accessoryItemsUpdateFlags.isPerformingUpdate)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXGItemsLayout.m", 457, @"Invalid parameter not satisfying: %@", @"!_accessoryItemsUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v8 = [NSString stringWithUTF8String:"-[PXGItemsLayout willUpdate]"];
    [v7 handleFailureInFunction:v8, @"PXGItemsLayout.m", 458, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)didUpdate
{
  v9.receiver = self;
  v9.super_class = (Class)PXGItemsLayout;
  [(PXGLayout *)&v9 didUpdate];
  if (self->_loadedItemsUpdateFlags.willPerformUpdate)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[PXGItemsLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXGItemsLayout.m", 478, @"Invalid parameter not satisfying: %@", @"!_loadedItemsUpdateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_accessoryItemsUpdateFlags.willPerformUpdate)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXGItemsLayout.m", 479, @"Invalid parameter not satisfying: %@", @"!_accessoryItemsUpdateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_updateFlags.willPerformUpdate)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v8 = [NSString stringWithUTF8String:"-[PXGItemsLayout didUpdate]"];
    [v7 handleFailureInFunction:v8, @"PXGItemsLayout.m", 480, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (id)axVisibleSpriteIndexes
{
  [(PXGLayout *)self visibleRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PXGItemsLayout *)self itemsGeometry];
  v12 = v11;
  if (!v11) {
    PXAssertGetLog();
  }
  v13 = objc_msgSend(v11, "itemsInRect:inLayout:", self, v4, v6, v8, v10);
  v14 = [(PXGItemsLayout *)self loadedItemsForItems:v13];

  v15 = [(PXGItemsLayout *)self spriteIndexesForItems:v14];

  return v15;
}

- (id)spriteIndexesForItems:(id)a3
{
  id v4 = a3;
  p_loadedItems = &self->_loadedItems;
  if (self->_loadedItems.length)
  {
    double v6 = [MEMORY[0x1E4F28D60] indexSetWithIndexesInRange:p_loadedItems->location];
    double v7 = objc_msgSend(v4, "px_intersectionWithIndexSet:", v6);
    double v8 = (void *)[v7 mutableCopy];

    [v8 shiftIndexesStartingAtIndex:p_loadedItems->location by:-p_loadedItems->location];
    double v9 = (void *)[v8 copy];
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return v9;
}

- (id)loadedItemsForItems:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F28D60];
  NSUInteger location = self->_loadedItems.location;
  NSUInteger length = self->_loadedItems.length;
  id v6 = a3;
  double v7 = objc_msgSend(v3, "indexSetWithIndexesInRange:", location, length);
  double v8 = objc_msgSend(v6, "px_intersectionWithIndexSet:", v7);

  return v8;
}

- (id)itemsForSpriteIndexes:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_loadedItems.location)
  {
    id v6 = (void *)[v4 mutableCopy];
    [v6 shiftIndexesStartingAtIndex:0 by:self->_loadedItems.location];
    id v7 = (id)[v6 copy];
  }
  else
  {
    id v7 = v4;
  }
  double v8 = (void *)[v7 copy];

  return v8;
}

- (void)setNumberOfAccessoryItems:(int64_t)a3
{
  if (self->_numberOfAccessoryItems != a3)
  {
    if (a3 < 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PXGItemsLayout.m", 320, @"Invalid parameter not satisfying: %@", @"numberOfAccessoryItems >= 0" object file lineNumber description];
    }
    self->_numberOfAccessoryItems = a3;
    [(PXGItemsLayout *)self numberOfAccessoryItemsDidChange];
    [(PXGItemsLayout *)self _invalidateAccessoryItems];
  }
}

- (void)setDropTargetStyle:(unint64_t)a3
{
  if (self->_dropTargetStyle != a3)
  {
    self->_dropTargetStyle = a3;
    [(PXGItemsLayout *)self dropTargetObjectReferenceDidChange];
  }
}

- (void)setDropTargetObjectReference:(id)a3
{
  id v8 = a3;
  id v5 = self->_dropTargetObjectReference;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong(&self->_dropTargetObjectReference, a3);
      [(PXGItemsLayout *)self dropTargetObjectReferenceDidChange];
    }
  }
}

- (void)setAccessoryItemContentSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryItemContentSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_accessoryItemContentSource, obj);
    [(PXGLayout *)self->_accessoryItemsContainerLayout setContentSource:obj];
  }
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((a4 & 2) != 0) {
    [(PXGItemsLayout *)self _handleFocusChangeWithUserInfo:v9];
  }
  if ((a4 & 4) != 0) {
    [(PXGItemsLayout *)self _handleSelectionChangeWithUserInfo:v9];
  }
  v10.receiver = self;
  v10.super_class = (Class)PXGItemsLayout;
  [(PXGLayout *)&v10 axGroup:v8 didChange:a4 userInfo:v9];
}

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4
{
}

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  [(PXGItemsLayout *)self beginApplyingItemChanges];
  int64_t v11 = [(PXGItemsLayout *)self _numberOfItems];
  [(PXGItemsLayout *)self set_numberOfItems:a3];
  if (![(PXGItemsLayout *)self isLazy])
  {
    -[PXGItemsLayout setLoadedItems:](self, "setLoadedItems:", 0, a3);
    if (v10)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke;
      aBlock[3] = &unk_1E5DB47D8;
      id v75 = v9;
      id v76 = v10;
      v16 = _Block_copy(aBlock);
    }
    else
    {
      v16 = 0;
    }
    v73.receiver = self;
    v73.super_class = (Class)PXGItemsLayout;
    [(PXGLayout *)&v73 applySpriteChangeDetails:v9 countAfterChanges:a3 initialState:0 modifyState:v16];

    goto LABEL_11;
  }
  uint64_t v12 = [(PXGItemsLayout *)self loadedItems];
  uint64_t v14 = v13;
  if ([v9 hasIncrementalChanges] && !objc_msgSend(v9, "hasMoves"))
  {
    if (!v14) {
      goto LABEL_6;
    }
    int64_t v45 = v11;
    SEL v52 = a2;
    v20 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v12, v14);
    v21 = [v9 removedIndexes];
    v54 = objc_msgSend(v21, "px_intersectionWithIndexSet:", v20);

    v22 = [v9 removedIndexes];
    v46 = v20;
    v23 = objc_msgSend(v20, "px_indexSetAdjustedForDeletions:", v22);

    uint64_t v47 = objc_msgSend(v23, "px_coveringRange");
    if (v24 != [v23 count])
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:v52 object:self file:@"PXGItemsLayout.m" lineNumber:221 description:@"Should only have a single range of loaded items after removals"];
    }
    v25 = [v9 insertedIndexes];
    v51 = v23;
    v26 = objc_msgSend(v23, "px_indexSetAdjustedForInsertions:", v25);

    v50 = v26;
    uint64_t v27 = objc_msgSend(v26, "px_coveringRange");
    unint64_t v29 = v28;
    unint64_t v55 = v28;
    uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v27, v28);
    v31 = [v9 insertedIndexes];
    v32 = objc_msgSend(v31, "px_intersectionWithIndexSet:", v30);

    -[PXGItemsLayout setLoadedItems:](self, "setLoadedItems:", v27, v29);
    v33 = [v9 changedIndexes];
    v49 = (void *)v30;
    v34 = objc_msgSend(v33, "px_intersectionWithIndexSet:", v30);

    v53 = (void *)[v54 mutableCopy];
    [v53 shiftIndexesStartingAtIndex:v12 by:-v12];
    v35 = (void *)[v32 mutableCopy];
    [v35 shiftIndexesStartingAtIndex:v47 by:-v27];
    v48 = v34;
    v36 = (void *)[v34 mutableCopy];
    uint64_t v44 = v27;
    [v36 shiftIndexesStartingAtIndex:v27 by:-v27];
    if ([v36 count] && objc_msgSend(v36, "lastIndex") >= v55)
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:v52 object:self file:@"PXGItemsLayout.m" lineNumber:250 description:@"An unloaded sprite was marked as modified."];
    }
    v15 = v46;
    uint64_t v37 = [v46 count];
    uint64_t v38 = [v35 count] + v37;
    if (v55 != v38 - [v53 count])
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      [v42 handleFailureInMethod:v52 object:self file:@"PXGItemsLayout.m" lineNumber:254 description:@"Change handling count mismatch"];
    }
    if (v10)
    {
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_2;
      v62[3] = &unk_1E5DB4800;
      uint64_t v66 = v44;
      unint64_t v67 = v55;
      unint64_t v68 = v55;
      SEL v69 = v52;
      id v63 = v9;
      v64 = self;
      int64_t v70 = v45;
      int64_t v71 = a3;
      id v65 = v10;
      v39 = _Block_copy(v62);
    }
    else
    {
      v39 = 0;
    }
    v40 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v53 insertedIndexes:v35 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v36];
    v61.receiver = self;
    v61.super_class = (Class)PXGItemsLayout;
    [(PXGLayout *)&v61 applySpriteChangeDetails:v40 countAfterChanges:v55 initialState:0 modifyState:v39];
  }
  else
  {
    -[PXGItemsLayout setLoadedItems:](self, "setLoadedItems:", 0x7FFFFFFFFFFFFFFFLL, 0);
    v15 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
    v72.receiver = self;
    v72.super_class = (Class)PXGItemsLayout;
    [(PXGLayout *)&v72 applySpriteChangeDetails:v15 countAfterChanges:0 initialState:0 modifyState:0];
  }

LABEL_6:
  [(PXGItemsLayout *)self invalidateLoadedItems];
LABEL_11:
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v57 = __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_3;
  v58 = &unk_1E5DD1558;
  v59 = self;
  id v17 = v9;
  uint64_t v18 = 0;
  id v60 = v17;
  v77[0] = 0;
  do
  {
    ((void (*)(void *, uint64_t, char *))v57)(v56, v18, v77);
    if (v77[0]) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v18 == 2;
    }
    ++v18;
  }
  while (!v19);
  [(PXGItemsLayout *)self endApplyingItemChanges];
}

uint64_t __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 32);
  uint64_t v5 = *(void *)(*(void *)(v4 + 920) + 8 * a2);
  if (*(void *)(*(void *)(v4 + 912) + 8 * a2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 912) + 8 * a2) = objc_msgSend(*(id *)(result + 40), "indexAfterApplyingChangesToIndex:");
    result = [*(id *)(v3 + 32) invalidateStylableType:a2];
  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    result = [*(id *)(v3 + 40) indexAfterApplyingChangesToIndex:v5];
    *(void *)(*(void *)(*(void *)(v3 + 32) + 920) + 8 * a2) = result;
  }
  return result;
}

- (void)invalidateLoadedItems
{
  if ([(PXGItemsLayout *)self isLazy])
  {
    p_loadedItemsUpdateFlags = &self->_loadedItemsUpdateFlags;
    unint64_t needsUpdate = self->_loadedItemsUpdateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_loadedItemsUpdateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_loadedItemsUpdateFlags->unint64_t needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if (self->_loadedItemsUpdateFlags.updated)
      {
        id v6 = [MEMORY[0x1E4F28B00] currentHandler];
        char v7 = [NSString stringWithUTF8String:"-[PXGItemsLayout invalidateLoadedItems]"];
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGItemsLayout.m", 485, @"invalidating %lu after it already has been updated", 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_loadedItemsUpdateFlags.isPerformingUpdate) {
      goto LABEL_6;
    }
    BOOL willPerformUpdate = self->_loadedItemsUpdateFlags.willPerformUpdate;
    p_loadedItemsUpdateFlags->unint64_t needsUpdate = 1;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (BOOL)isLazy
{
  return self->_lazy;
}

- (_NSRange)loadedItems
{
  p_loadedItems = &self->_loadedItems;
  NSUInteger location = self->_loadedItems.location;
  NSUInteger length = p_loadedItems->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)set_numberOfItems:(int64_t)a3
{
  self->__numberOfItems = a3;
}

- (void)endApplyingItemChanges
{
  int64_t applyingItemChangesCount = self->_applyingItemChangesCount;
  self->_int64_t applyingItemChangesCount = applyingItemChangesCount - 1;
  if (applyingItemChangesCount <= 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXGItemsLayout.m" lineNumber:765 description:@"Unbalanced call to endApplyingItemChanges"];
  }
}

- (void)beginApplyingItemChanges
{
}

- (void)setLoadedItems:(_NSRange)a3
{
  if (self->_loadedItems.location != a3.location || self->_loadedItems.length != a3.length)
  {
    self->_loadedItems = a3;
    [(PXGItemsLayout *)self loadedItemsDidChange];
  }
}

- (void)setNumberOfItems:(int64_t)a3
{
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_delegateRespondsTo = 0;
  self->_delegateRespondsTo |= objc_opt_respondsToSelector() & 1;
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = 2;
  if ((v6 & 1) == 0) {
    uint64_t v7 = 0;
  }
  self->_delegateRespondsTo |= v7;
  char v8 = objc_opt_respondsToSelector();
  uint64_t v9 = 4;
  if ((v8 & 1) == 0) {
    uint64_t v9 = 0;
  }
  self->_delegateRespondsTo |= v9;
  char v10 = objc_opt_respondsToSelector();
  uint64_t v11 = 8;
  if ((v10 & 1) == 0) {
    uint64_t v11 = 0;
  }
  self->_delegateRespondsTo |= v11;
  char v12 = objc_opt_respondsToSelector();
  uint64_t v13 = 16;
  if ((v12 & 1) == 0) {
    uint64_t v13 = 0;
  }
  self->_delegateRespondsTo |= v13;
  char v14 = objc_opt_respondsToSelector();
  uint64_t v15 = 32;
  if ((v14 & 1) == 0) {
    uint64_t v15 = 0;
  }
  self->_delegateRespondsTo |= v15;
  char v16 = objc_opt_respondsToSelector();
  uint64_t v17 = 64;
  if ((v16 & 1) == 0) {
    uint64_t v17 = 0;
  }
  self->_delegateRespondsTo |= v17;
  char v18 = objc_opt_respondsToSelector();
  uint64_t v19 = 128;
  if ((v18 & 1) == 0) {
    uint64_t v19 = 0;
  }
  self->_delegateRespondsTo |= v19;
  char v20 = objc_opt_respondsToSelector();
  uint64_t v21 = 256;
  if ((v20 & 1) == 0) {
    uint64_t v21 = 0;
  }
  self->_delegateRespondsTo |= v21;
  char v22 = objc_opt_respondsToSelector();
  uint64_t v23 = 512;
  if ((v22 & 1) == 0) {
    uint64_t v23 = 0;
  }
  self->_delegateRespondsTo |= v23;
  char v24 = objc_opt_respondsToSelector();

  uint64_t v25 = 1024;
  if ((v24 & 1) == 0) {
    uint64_t v25 = 0;
  }
  self->_delegateRespondsTo |= v25;
}

- (void)setLazy:(BOOL)a3
{
  if (self->_lazy != a3)
  {
    self->_lazy = a3;
    [(PXGItemsLayout *)self invalidateLoadedItems];
  }
}

- (PXGItemsLayout)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXGItemsLayout;
  v2 = [(PXGLayout *)&v10 init];
  uint64_t v3 = (PXGItemsLayout *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 1048) = xmmword_1AB359BD0;
    uint64_t v4 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_currentStylableItems = v4;
    memset_pattern16(v4, &unk_1AB35A240, 0x18uLL);
    id v5 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_pendingStylableItems = v5;
    memset_pattern16(v5, &unk_1AB35A240, 0x18uLL);
    char v6 = (BOOL *)malloc_type_calloc(3uLL, 1uLL, 0x100004077774924uLL);
    v3->_pendingAnimations = v6;
    v6[2] = 0;
    *(_WORD *)char v6 = 0;
    uint64_t v7 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_styleableAnimations = v7;
    v7[1] = 0;
    v7[2] = 0;
    int64_t *v7 = 0;
    char v8 = (double *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v3->_stylablePaddings = v8;
    v8[1] = 0.0;
    v8[2] = 0.0;
    *char v8 = 0.0;
  }
  return v3;
}

- (void)update
{
  [(PXGItemsLayout *)self updateLoadedItemsIfNeeded];
  [(PXGItemsLayout *)self updateAccessoryItemsIfNeeded];
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"-[PXGItemsLayout update]"];
      [v4 handleFailureInFunction:v5, @"PXGItemsLayout.m", 465, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __24__PXGItemsLayout_update__block_invoke;
    v9[3] = &unk_1E5DD36F8;
    v9[4] = self;
    [(PXGLayout *)self performSpriteStylingUpdate:v9];
    self->_updateFlags.isPerformingUpdate = 0;
    if (p_updateFlags->needsUpdate)
    {
      char v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGItemsLayout update]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGItemsLayout.m", 471, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PXGItemsLayout;
  [(PXGLayout *)&v8 update];
}

- (void)updateLoadedItemsIfNeeded
{
  p_loadedItemsUpdateFlags = &self->_loadedItemsUpdateFlags;
  self->_loadedItemsUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_loadedItemsUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_loadedItemsUpdateFlags.isPerformingUpdate)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      char v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout updateLoadedItemsIfNeeded]"];
      [v5 handleFailureInFunction:v6, @"PXGItemsLayout.m", 490, @"Invalid parameter not satisfying: %@", @"!_loadedItemsUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_loadedItemsUpdateFlags->needsUpdate;
    }
    p_loadedItemsUpdateFlags->isPerformingUpdate = 1;
    p_loadedItemsUpdateFlags->updated = 1;
    if (needsUpdate)
    {
      p_loadedItemsUpdateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGItemsLayout *)self _updateLoadedItems];
      unint64_t needsUpdate = p_loadedItemsUpdateFlags->needsUpdate;
    }
    p_loadedItemsUpdateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGItemsLayout updateLoadedItemsIfNeeded]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGItemsLayout.m", 494, @"still needing to update %lu after update pass", p_loadedItemsUpdateFlags->needsUpdate);
    }
  }
}

- (void)updateAccessoryItemsIfNeeded
{
  p_accessoryItemsUpdateFlags = &self->_accessoryItemsUpdateFlags;
  self->_accessoryItemsUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_accessoryItemsUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_accessoryItemsUpdateFlags.isPerformingUpdate)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      char v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout updateAccessoryItemsIfNeeded]"];
      [v5 handleFailureInFunction:v6, @"PXGItemsLayout.m", 728, @"Invalid parameter not satisfying: %@", @"!_accessoryItemsUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_accessoryItemsUpdateFlags->needsUpdate;
    }
    p_accessoryItemsUpdateFlags->isPerformingUpdate = 1;
    p_accessoryItemsUpdateFlags->updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_accessoryItemsUpdateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      [(PXGItemsLayout *)self _updateAccessoryItems];
      unint64_t needsUpdate = p_accessoryItemsUpdateFlags->needsUpdate;
    }
    p_accessoryItemsUpdateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PXGItemsLayout updateAccessoryItemsIfNeeded]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, @"PXGItemsLayout.m", 732, @"still needing to update %lu after update pass", p_accessoryItemsUpdateFlags->needsUpdate);
    }
  }
}

- (void)_updateLoadedItems
{
  p_loadedItems = &self->_loadedItems;
  NSUInteger location = self->_loadedItems.location;
  NSUInteger length = self->_loadedItems.length;
  uint64_t v6 = [(PXGItemsLayout *)self itemsToLoad];
  if (location != v6 || length != v7)
  {
    NSUInteger v9 = v6;
    NSUInteger v10 = v7;
    objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", location, length);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeIndexesInRange:", v9, v10);
    uint64_t v11 = (void *)[v18 mutableCopy];
    [v11 shiftIndexesStartingAtIndex:location by:-(uint64_t)location];
    char v12 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", location, length);
    [v12 removeIndexes:v18];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", v9, v10);
    objc_msgSend(v13, "removeIndexesInRange:", location, length);
    char v14 = (void *)[v13 mutableCopy];
    unint64_t v15 = [v13 firstIndex];
    unint64_t v16 = [v12 firstIndex];
    if (v15 >= v16) {
      unint64_t v15 = v16;
    }
    objc_msgSend(v14, "shiftIndexesStartingAtIndex:by:", objc_msgSend(v13, "firstIndex"), -(uint64_t)v15);
    uint64_t v17 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v11 insertedIndexes:v14 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
    p_loadedItems->NSUInteger location = v9;
    p_loadedItems->NSUInteger length = v10;
    [(PXGItemsLayout *)self loadedItemsDidChange];
    [(PXGLayout *)self applySpriteChangeDetails:v17 countAfterChanges:v10 initialState:0 modifyState:0];
  }
}

uint64_t __24__PXGItemsLayout_update__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateFocusedItemIfNeeded];
  [*(id *)(a1 + 32) _updateHoveredItemIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 _updatePressedItemIfNeeded];
}

- (void)_updateStylableType:(int64_t)a3
{
  int64_t v5 = self->_styleableAnimations[a3];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__PXGItemsLayout__updateStylableType___block_invoke;
  aBlock[3] = &unk_1E5DB4848;
  void aBlock[4] = self;
  aBlock[5] = v5;
  aBlock[6] = a3;
  uint64_t v6 = _Block_copy(aBlock);
  NSUInteger v7 = (void (**)(void, void, void))v6;
  int64_t v8 = self->_currentStylableItems[a3];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    (*((void (**)(void *, int64_t, void))v6 + 2))(v6, self->_currentStylableItems[a3], 0);
  }
  int64_t v9 = self->_pendingStylableItems[a3];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = v8 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7[2](v7, self->_pendingStylableItems[a3], 1);
    BOOL v10 = 0;
  }
  pendingAnimations = self->_pendingAnimations;
  if (!v10 && pendingAnimations[a3] && v5 != 0)
  {
    char v14 = [(PXGLayout *)self createAnimation];
    __38__PXGItemsLayout__updateStylableType___block_invoke_3(v14);
    unint64_t v15 = [(PXGLayout *)self superlayout];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v16 = [v15 createAnimation];
      __38__PXGItemsLayout__updateStylableType___block_invoke_3(v16);
    }
    pendingAnimations = self->_pendingAnimations;
  }
  pendingAnimations[a3] = 0;
  self->_currentStylableItems[a3] = v9;
}

- (void)_updatePressedItemIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout _updatePressedItemIfNeeded]"];
    [v5 handleFailureInFunction:v6, @"PXGItemsLayout.m", 629, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x10uLL;
  if ((needsUpdate & 0x10) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFEFLL;
    [(PXGItemsLayout *)self _updateStylableType:2];
  }
}

- (void)_updateHoveredItemIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout _updateHoveredItemIfNeeded]"];
    [v5 handleFailureInFunction:v6, @"PXGItemsLayout.m", 621, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 8uLL;
  if ((needsUpdate & 8) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    [(PXGItemsLayout *)self _updateStylableType:0];
  }
}

- (void)_updateFocusedItemIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout _updateFocusedItemIfNeeded]"];
    [v5 handleFailureInFunction:v6, @"PXGItemsLayout.m", 613, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 4uLL;
  if ((needsUpdate & 4) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
    [(PXGItemsLayout *)self _updateStylableType:1];
  }
}

- (void)modifyAccessoryItemSpritesInRange:(_PXGSpriteIndexRange)a3 state:(id)a4
{
}

- (int64_t)itemForObjectReference:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  if (v6 && (self->_delegateRespondsTo & 1) != 0)
  {
    int64_t v8 = [(PXGItemsLayout *)self delegate];
    int64_t v7 = [v8 itemsLayout:self itemForObjectReference:v6 options:a4];
  }
  else
  {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)invalidateStylableType:(int64_t)a3
{
  if (a3 == 2)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_18;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v9 = 16;
      goto LABEL_27;
    }
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PXGItemsLayout invalidateStylableType:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXGItemsLayout.m", 607, @"invalidating %lu after it already has been updated", 16);
      goto LABEL_34;
    }
LABEL_18:
    uint64_t v7 = needsUpdate | 0x10;
    goto LABEL_22;
  }
  if (a3 == 1)
  {
    p_updateFlags = &self->_updateFlags;
    unint64_t v6 = self->_updateFlags.needsUpdate;
    if (v6)
    {
      if (!self->_updateFlags.isPerformingUpdate) {
        goto LABEL_21;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
      uint64_t v9 = 4;
      goto LABEL_27;
    }
    if ((self->_updateFlags.updated & 4) != 0)
    {
      BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PXGItemsLayout invalidateStylableType:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXGItemsLayout.m", 604, @"invalidating %lu after it already has been updated", 4);
      goto LABEL_34;
    }
LABEL_21:
    uint64_t v7 = v6 | 4;
    goto LABEL_22;
  }
  if (a3) {
    return;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t v4 = self->_updateFlags.needsUpdate;
  if (v4)
  {
    if (!self->_updateFlags.isPerformingUpdate) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_14:
    if ((self->_updateFlags.updated & 8) == 0)
    {
LABEL_15:
      uint64_t v7 = v4 | 8;
LABEL_22:
      p_updateFlags->unint64_t needsUpdate = v7;
      return;
    }
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[PXGItemsLayout invalidateStylableType:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXGItemsLayout.m", 601, @"invalidating %lu after it already has been updated", 8);
LABEL_34:

    abort();
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  uint64_t v9 = 8;
LABEL_27:
  p_updateFlags->unint64_t needsUpdate = v9;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (int64_t)itemForObjectReference:(id)a3
{
  return [(PXGItemsLayout *)self itemForObjectReference:a3 options:0];
}

- (unint64_t)dropTargetStyle
{
  return self->_dropTargetStyle;
}

- (id)dropTargetObjectReference
{
  return self->_dropTargetObjectReference;
}

- (PXGItemsLayoutDelegate)insetDelegate
{
  if ([(PXGItemsLayout *)self delegateRespondsTo:512])
  {
    uint64_t v3 = [(PXGItemsLayout *)self delegate];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (PXGItemsLayoutDelegate *)v3;
}

- (BOOL)isApplyingItemChanges
{
  return self->_applyingItemChangesCount > 0;
}

- (BOOL)spriteIndexIsItem:(unsigned int)a3
{
  return [(PXGLayout *)self localNumberOfSprites] > a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsGeometry, 0);
  objc_storeStrong(&self->_dropTargetObjectReference, 0);
  objc_destroyWeak((id *)&self->_accessoryItemContentSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryItemsContainerLayout, 0);
}

- (PXGItemsGeometry)itemsGeometry
{
  return self->_itemsGeometry;
}

- (PXGLayoutContentSource)accessoryItemContentSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryItemContentSource);
  return (PXGLayoutContentSource *)WeakRetained;
}

- (void)_handleSelectionChangeWithUserInfo:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  PXGAXGetSelectionFromAndToInfosForUserInfo(v4, &v10);
  id v5 = v10;
  unint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 axContainingGroup];
    int64_t v8 = [(PXGLayout *)self axGroup];

    if (v7 == v8)
    {
      int64_t v9 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", [v6 spriteIndex]);
      PXGAXAddSimpleIndexPathGroupChangeUserInfo(v4, 0, 0, &v9);
    }
  }
}

- (void)_handleFocusChangeWithUserInfo:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  PXGAXGetFocusFromAndToInfosForUserInfo(v4, 0, &v12);
  id v5 = v12;
  unint64_t v6 = v5;
  if (v5)
  {
    int64_t v7 = self->_currentStylableItems[1];
    int64_t v8 = [v5 axContainingGroup];
    int64_t v9 = [(PXGLayout *)self axGroup];

    if (v8 == v9)
    {
      int64_t v11 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", [v6 spriteIndex]);
      PXGAXAddSimpleIndexPathGroupChangeUserInfo(v4, 0, 0, &v11);
      uint64_t v10 = v11;
    }
    else
    {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v7 != v10) {
      -[PXGItemsLayout setItem:forStylableType:animated:](self, "setItem:forStylableType:animated:");
    }
  }
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(PXGItemsLayout *)self itemsGeometry];
  int64_t v9 = objc_msgSend(v8, "itemsInRect:inLayout:", self, x, y, width, height);
  uint64_t v10 = [(PXGItemsLayout *)self spriteIndexesForItems:v9];

  return v10;
}

- (id)axSpriteIndexes
{
  uint64_t v3 = [(PXGItemsLayout *)self loadedItems];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v3, v4);
  unint64_t v6 = [(PXGItemsLayout *)self spriteIndexesForItems:v5];

  return v6;
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, PXGItemsLayout *, char *))a3 + 2))(a3, self, &v3);
}

- (CGSize)sizeForItem:(int64_t)a3
{
  double v3 = *(double *)off_1E5DAB030;
  double v4 = *((double *)off_1E5DAB030 + 1);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (_NSRange)itemsToLoad
{
  NSUInteger v2 = [(PXGItemsLayout *)self numberOfItems];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

- (id)objectReferenceForItem:(int64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && (self->_delegateRespondsTo & 2) != 0)
  {
    unint64_t v6 = [(PXGItemsLayout *)self delegate];
    double v4 = [v6 itemsLayout:self objectReferenceForItem:a3];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (void)_updateAccessoryItems
{
  uint64_t v3 = [(PXGItemsLayout *)self numberOfAccessoryItems];
  uint64_t v4 = v3;
  if (v3 >= 1)
  {
    if (self->_accessoryItemsContainerLayout) {
      goto LABEL_8;
    }
    id v5 = objc_alloc_init(PXGLayout);
    accessoryItemsContainerLayout = self->_accessoryItemsContainerLayout;
    self->_accessoryItemsContainerLayout = v5;

    int64_t v7 = [(PXGItemsLayout *)self accessoryItemContentSource];
    [(PXGLayout *)self->_accessoryItemsContainerLayout setContentSource:v7];

    [(PXGLayout *)self insertSublayout:self->_accessoryItemsContainerLayout atIndex:0];
    int64_t v8 = [(PXGLayout *)self sublayoutDataStore];
    objc_msgSend(v8, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, 1, 0, &__block_literal_global_101_59142);
    goto LABEL_7;
  }
  if (!v3 && self->_accessoryItemsContainerLayout)
  {
    int64_t v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [(PXGLayout *)self removeSublayoutsAtIndexes:v9];

    int64_t v8 = self->_accessoryItemsContainerLayout;
    self->_accessoryItemsContainerLayout = 0;
LABEL_7:
  }
LABEL_8:
  [(PXGLayout *)self->_accessoryItemsContainerLayout applySpriteChangeDetails:0 countAfterChanges:v4 initialState:0 modifyState:0];
  [(PXGItemsLayout *)self accessoryItemsDidChange];
}

__n128 __39__PXGItemsLayout__updateAccessoryItems__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result = *(__n128 *)off_1E5DAAF68;
  *(_OWORD *)(a3 + 48) = *(_OWORD *)off_1E5DAAF68;
  *(void *)(a3 + 64) = *((void *)off_1E5DAAF68 + 2);
  return result;
}

- (void)_invalidateAccessoryItems
{
  p_accessoryItemsUpdateFlags = &self->_accessoryItemsUpdateFlags;
  unint64_t needsUpdate = self->_accessoryItemsUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_accessoryItemsUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_accessoryItemsUpdateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_accessoryItemsUpdateFlags.updated & 2) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v6 = [NSString stringWithUTF8String:"-[PXGItemsLayout _invalidateAccessoryItems]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGItemsLayout.m", 724, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_accessoryItemsUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_accessoryItemsUpdateFlags.willPerformUpdate;
  p_accessoryItemsUpdateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

uint64_t __38__PXGItemsLayout__updateStylableType___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) spriteIndexForItem:a2];
  if (result != -1)
  {
    uint64_t v7 = result;
    long long v8 = 0uLL;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    int64_t v9 = *(void **)(a1 + 32);
    if (v9 && ([v9 styleForSpriteAtIndex:v7], v10 = *(void **)(a1 + 32), long long v8 = 0uLL, v17 = 0u, v10))
    {
      [v10 geometryForSpriteAtIndex:v7];
      float32x2_t v12 = 0;
      double v11 = 0.0;
    }
    else
    {
      long long v17 = v8;
      double v11 = 0.0;
      float32x2_t v12 = 0;
    }
    if (a3)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      double v14 = 0.0;
      if (v13 == 1) {
        double v14 = 1.0;
      }
      if (v13 == 2) {
        double v14 = -1.0;
      }
      double v15 = *(double *)(*(void *)(*(void *)(a1 + 32) + 944) + 8 * *(void *)(a1 + 48));
      LODWORD(v37) = -1093874483;
      double v11 = 0.0 + -0.4;
      float32x2_t v12 = vcvt_f32_f64(vmlaq_n_f64(vcvtq_f64_f32(0), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v14, 0), v15));
    }
    else if (*(void *)(a1 + 48) != 2)
    {
      [*(id *)(a1 + 32) sizeForItem:a2];
      PXSizeIsNull();
    }
    unint64_t v16 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __38__PXGItemsLayout__updateStylableType___block_invoke_2;
    v18[3] = &__block_descriptor_224_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    long long v25 = v38;
    long long v26 = v39;
    long long v27 = v40;
    long long v28 = v41;
    long long v21 = v34;
    long long v22 = v35;
    long long v23 = v36;
    long long v24 = v37;
    long long v19 = v32;
    long long v20 = v33;
    long long v29 = v17;
    double v30 = v11;
    float32x2_t v31 = v12;
    return [v16 modifySpritesInRange:v7 | 0x100000000 state:v18];
  }
  return result;
}

void __38__PXGItemsLayout__updateStylableType___block_invoke_3(void *a1)
{
  id v1 = a1;
  id v3 = [off_1E5DA9658 sharedInstance];
  [v3 keyboardAnimationDuration];
  objc_msgSend(v1, "setDuration:");
  [v3 keyboardDampingRatio];
  *(float *)&double v2 = v2;
  [v1 setDampingRatio:v2];
  [v1 setScope:1];
}

__n128 __38__PXGItemsLayout__updateStylableType___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  long long v4 = *(_OWORD *)(a1 + 48);
  *a4 = *(_OWORD *)(a1 + 32);
  a4[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v7 = *(_OWORD *)(a1 + 112);
  a4[4] = *(_OWORD *)(a1 + 96);
  a4[5] = v7;
  a4[2] = v5;
  a4[3] = v6;
  long long v8 = *(_OWORD *)(a1 + 128);
  long long v9 = *(_OWORD *)(a1 + 144);
  long long v10 = *(_OWORD *)(a1 + 176);
  a4[8] = *(_OWORD *)(a1 + 160);
  a4[9] = v10;
  a4[6] = v8;
  a4[7] = v9;
  __n128 result = *(__n128 *)(a1 + 192);
  long long v12 = *(_OWORD *)(a1 + 208);
  *(__n128 *)a3 = result;
  *(_OWORD *)(a3 + 16) = v12;
  return result;
}

- (unsigned)spriteIndexForAccessoryItem:(int64_t)a3
{
  return [(PXGLayout *)self convertSpriteIndex:a3 fromDescendantLayout:self->_accessoryItemsContainerLayout];
}

- (int64_t)accessoryItemForSpriteIndex:(unsigned int)a3
{
  return [(PXGLayout *)self convertSpriteIndex:*(void *)&a3 toDescendantLayout:self->_accessoryItemsContainerLayout];
}

- (BOOL)spriteIndexIsAccessoryItem:(unsigned int)a3
{
  return [(PXGLayout *)self convertSpriteIndex:*(void *)&a3 toDescendantLayout:self->_accessoryItemsContainerLayout] != -1;
}

- (_NSRange)itemRangeForSpriteIndexRange:(_PXGSpriteIndexRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = self->_loadedItems.location + a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = v4;
  return result;
}

- (void)setAnimationParameters:(id)a3 forStylableType:(int64_t)a4
{
  self->_styleableAnimations[a4] = a3.var0;
  self->_stylablePaddings[a4] = a3.var1;
  [(PXGItemsLayout *)self invalidateStylableType:a4];
}

uint64_t __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    uint64_t v6 = result;
    uint64_t v7 = a2;
    long long v8 = (_WORD *)(a5 + 32);
    do
    {
      [*(id *)(v6 + 32) indexAfterRevertingChangesFromIndex:v7];
      _NSRange result = (*(uint64_t (**)(void))(*(void *)(v6 + 40) + 16))();
      if (result) {
        ++*v8;
      }
      v8 += 20;
      ++v7;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t __79__PXGItemsLayout_setNumberOfItems_withChangeDetails_changeMediaVersionHandler___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    unsigned int v6 = a2;
    uint64_t v7 = result;
    long long v8 = (_WORD *)(a5 + 32);
    do
    {
      [*(id *)(v7 + 32) indexAfterRevertingChangesFromIndex:*(void *)(v7 + 56) + v6];
      _NSRange result = (*(uint64_t (**)(void))(*(void *)(v7 + 48) + 16))();
      if (result) {
        ++*v8;
      }
      ++v6;
      v8 += 20;
      --v5;
    }
    while (v5);
  }
  return result;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = -[PXGLayout spriteReferenceForSpriteIndex:](self, "spriteReferenceForSpriteIndex:");
  if ([(PXGItemsLayout *)self spriteIndexIsItem:v3])
  {
    unsigned int v6 = [PXGHitTestResult alloc];
    uint64_t v7 = [(PXGItemsLayout *)self objectReferenceForSpriteIndex:v3];
    long long v8 = @"PXGHitTestUserDataIdentifierItem";
LABEL_5:
    long long v9 = [(PXGHitTestResult *)v6 initWithSpriteReference:v5 layout:self identifier:v8 userData:v7];

    goto LABEL_7;
  }
  if ([(PXGItemsLayout *)self spriteIndexIsAccessoryItem:v3])
  {
    unsigned int v6 = [PXGHitTestResult alloc];
    uint64_t v7 = [(PXGItemsLayout *)self objectReferenceForSpriteIndex:v3];
    long long v8 = @"PXGHitTestUserDataIdentifierAccessoryItem";
    goto LABEL_5;
  }
  long long v9 = 0;
LABEL_7:

  return v9;
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[PXGItemsLayout spriteIndexIsItem:](self, "spriteIndexIsItem:"))
  {
    if ([(PXGItemsLayout *)self delegateRespondsTo:2])
    {
      int64_t v5 = [(PXGItemsLayout *)self itemForSpriteIndex:v3];
      unsigned int v6 = [(PXGItemsLayout *)self delegate];
      uint64_t v7 = [v6 itemsLayout:self objectReferenceForItem:v5];
LABEL_7:
      long long v9 = (void *)v7;

      goto LABEL_9;
    }
  }
  else if ([(PXGItemsLayout *)self spriteIndexIsAccessoryItem:v3] {
         && [(PXGItemsLayout *)self delegateRespondsTo:64])
  }
  {
    int64_t v8 = [(PXGItemsLayout *)self accessoryItemForSpriteIndex:v3];
    unsigned int v6 = [(PXGItemsLayout *)self delegate];
    uint64_t v7 = [v6 itemsLayout:self objectReferenceForAccessoryItem:v8];
    goto LABEL_7;
  }
  long long v9 = 0;
LABEL_9:
  return v9;
}

- (PXGItemsLayoutDelegate)marginDelegate
{
  if ([(PXGItemsLayout *)self delegateRespondsTo:256])
  {
    uint64_t v3 = [(PXGItemsLayout *)self delegate];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (PXGItemsLayoutDelegate *)v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)PXGItemsLayout;
  uint64_t v3 = [(PXGItemsLayout *)&v8 description];
  int64_t v4 = [(PXGItemsLayout *)self numberOfItems];
  v10.NSUInteger location = [(PXGItemsLayout *)self loadedItems];
  int64_t v5 = NSStringFromRange(v10);
  unsigned int v6 = objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", @", numberOfItems=%li, loadedItems=%@, numberOfAccessoryItems=%li, loadedAccessorySprites=%u", v4, v5, -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems"), -[PXGLayout numberOfSprites](self->_accessoryItemsContainerLayout, "numberOfSprites"));

  return v6;
}

- (void)dealloc
{
  free(self->_currentStylableItems);
  free(self->_pendingStylableItems);
  free(self->_pendingAnimations);
  free(self->_styleableAnimations);
  free(self->_stylablePaddings);
  v3.receiver = self;
  v3.super_class = (Class)PXGItemsLayout;
  [(PXGLayout *)&v3 dealloc];
}

@end