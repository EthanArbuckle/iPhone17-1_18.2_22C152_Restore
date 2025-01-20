@interface PXGBasicAXGroup
- (BOOL)_leafAtSpriteIndex:(unsigned int)a3 passesFilter:(unint64_t)a4;
- (BOOL)_leafAtSpriteIndexIsAccessible:(unsigned int)a3;
- (BOOL)_leafAtSpriteIndexIsSelected:(unsigned int)a3;
- (BOOL)_leafAtSpriteIndexIsVisible:(unsigned int)a3;
- (BOOL)_loadOrUpdateLeafAtSpriteIndex:(unsigned int)a3;
- (BOOL)_passesFilter:(unint64_t)a3;
- (BOOL)axIsSelected;
- (BOOL)axIsVisible;
- (BOOL)needsUpdate;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)updateWithSelectedChildren:(id)a3;
- (BOOL)versionNeedUpdate;
- (CGRect)axFrame;
- (NSArray)axLeafs;
- (NSArray)axSubgroups;
- (NSArray)preferredFocusEnvironments;
- (NSIndexSet)loadedLeafIndexes;
- (NSIndexSet)loadedSubgroupIndexes;
- (NSString)axIdentifier;
- (NSString)description;
- (NSString)recursiveDescription;
- (NSString)recursiveLeafDescription;
- (PXGAXGroupSource)axGroupSource;
- (PXGAXInfoSource)axInfoSource;
- (PXGAXResponder)axNextResponder;
- (PXGBasicAXGroup)axParent;
- (PXGBasicAXGroup)axRootParent;
- (PXGBasicAXGroup)axScrollParent;
- (PXGBasicAXGroup)init;
- (PXGBasicAXGroup)initWithLayout:(id)a3;
- (PXGLayout)containingLayout;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (id)_leafAtSpriteIndex:(unsigned int)a3;
- (id)_loadNeighboringLeafsAtSpriteIndex:(unsigned int)a3;
- (id)_paddingForLevel:(int64_t)a3;
- (id)_removeLeafAtSpriteIndex:(unsigned int)a3;
- (id)childrenPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4;
- (id)focusItemsForScrollViewController:(id)a3 inRect:(CGRect)a4;
- (id)leafAtPoint:(CGPoint)a3;
- (id)leafsInRect:(CGRect)a3 usingOptions:(unint64_t)a4;
- (id)loadLeafAtSpriteIndexIfNeeded:(unsigned int)a3 usingOptions:(unint64_t)a4;
- (id)loadedSubgroupAtIndex:(int64_t)a3;
- (int64_t)axRole;
- (int64_t)nonScrollingAxisItemCount;
- (int64_t)subgroupIndex;
- (unint64_t)leafFeatures;
- (unsigned)_loadClosestLeafAtSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4;
- (unsigned)focusedLeafIndex;
- (void)_addAllLeafsPassingFilter:(unint64_t)a3 intoArray:(id)a4;
- (void)_addChildrenPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4 intoArray:(id)a5;
- (void)_addCurrentlyLoadedLeafsPassingFilter:(unint64_t)a3 intoArray:(id)a4;
- (void)_addFirstVisibleIndexes:(id)a3 toIndexesToLoad:(id)a4;
- (void)_addLeafsPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4 intoArray:(id)a5;
- (void)_addSubgroupsPassingFilter:(unint64_t)a3 intoArray:(id)a4;
- (void)_appendDescription:(id)a3 atLevel:(int64_t)a4;
- (void)_appendLeafDescription:(id)a3 atLevel:(int64_t)a4;
- (void)_cleanUpSubgroupAfterUnloading:(id)a3;
- (void)_leafsInRect:(CGRect)a3 usingOptions:(unint64_t)a4 intoMutableArray:(id)a5;
- (void)_setLeaf:(id)a3 forSpriteIndex:(unsigned int)a4;
- (void)_unloadSubgroupAtIndex:(int64_t)a3 shouldNotify:(BOOL)a4;
- (void)_updateLayoutIfNeeded;
- (void)_updateLeafAtSpriteIndex:(unsigned int)a3;
- (void)_updateLeafsIfNeeded;
- (void)_updateVersionIfNeeded;
- (void)_updateVisibilityIfNeeded;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)invalidateLayout;
- (void)invalidateLeafs;
- (void)invalidateVersion;
- (void)invalidateVisibility;
- (void)loadSubgroup:(id)a3 atIndex:(int64_t)a4;
- (void)setAxFrame:(CGRect)a3;
- (void)setAxGroupSource:(id)a3;
- (void)setAxIdentifier:(id)a3;
- (void)setAxInfoSource:(id)a3;
- (void)setAxIsVisible:(BOOL)a3;
- (void)setAxNextResponder:(id)a3;
- (void)setAxParent:(id)a3;
- (void)setAxRole:(int64_t)a3;
- (void)setLeafFeatures:(unint64_t)a3;
- (void)setNeedsFocusUpdate;
- (void)setNonScrollingAxisItemCount:(int64_t)a3;
- (void)setSubgroupIndex:(int64_t)a3;
- (void)unloadAllLeafs;
- (void)unloadFromParent;
- (void)unloadLeafAtSpriteIndex:(unsigned int)a3 usingOptions:(unint64_t)a4;
- (void)unloadSubgroupAtIndex:(int64_t)a3;
- (void)updateFocusIfNeeded;
- (void)updateIfNeeded;
- (void)updateLeafsWithChangeDetails:(id)a3;
- (void)updateSubgroupsWithChangeDetails:(id)a3;
@end

@implementation PXGBasicAXGroup

uint64_t __48__PXGBasicAXGroup_updateLeafsWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setSpriteIndex:");
}

uint64_t __36__PXGBasicAXGroup_loadedLeafIndexes__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntegerValue];
  return [v2 addIndex:v3];
}

- (void)_updateLeafsIfNeeded
{
  if (!self->_updateFlags.isPerformingUpdate)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup _updateLeafsIfNeeded]"];
    [v17 handleFailureInFunction:v18, @"PXGAXGroup.m", 175, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((needsUpdate & 4) != 0)
  {
    self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
    v5 = [(PXGBasicAXGroup *)self axInfoSource];
    if (!v5)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"PXGAXGroup.m" lineNumber:180 description:@"Should not attempt to update sprites without an infoSource"];
    }
    id v6 = objc_alloc(MEMORY[0x1E4F28E60]);
    v7 = [v5 axBorderSpriteIndexes];
    v8 = (void *)[v6 initWithIndexSet:v7];

    v9 = [v5 axVisibleSpriteIndexes];
    if ([v9 count])
    {
      objc_msgSend(v8, "addIndex:", objc_msgSend(v9, "firstIndex"));
      objc_msgSend(v8, "addIndex:", objc_msgSend(v9, "lastIndex"));
      if (([(PXGBasicAXGroup *)self leafFeatures] & 2) != 0) {
        [v8 addIndexes:v9];
      }
    }
    v10 = [v5 axSelectedSpriteIndexes];
    if ([v10 count])
    {
      objc_msgSend(v8, "addIndex:", objc_msgSend(v10, "firstIndex"));
      objc_msgSend(v8, "addIndex:", objc_msgSend(v10, "lastIndex"));
    }
    if (([v10 isEqualToIndexSet:self->_previouslySelectedIndexes] & 1) == 0)
    {
      v11 = (NSIndexSet *)[v10 copy];
      previouslySelectedIndexes = self->_previouslySelectedIndexes;
      self->_previouslySelectedIndexes = v11;

      [(PXGBasicAXGroup *)self _selectedIndexesDidChange];
    }
    unsigned int v13 = [(PXGBasicAXGroup *)self focusedLeafIndex];
    if (v13 != -1) {
      [v8 addIndex:v13];
    }
    [v8 addIndexes:self->_requiredLeafIndexesToLoad];
    v14 = [(PXGBasicAXGroup *)self loadedLeafIndexes];
    v15 = (void *)[v14 mutableCopy];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke;
    v21[3] = &unk_1E5DD1558;
    v21[4] = self;
    id v16 = v15;
    id v22 = v16;
    [v8 enumerateIndexesUsingBlock:v21];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke_2;
    v20[3] = &unk_1E5DD3010;
    v20[4] = self;
    [v16 enumerateIndexesUsingBlock:v20];
    if (([v14 isEqualToIndexSet:v8] & 1) == 0) {
      [(PXGBasicAXGroup *)self invalidateLayout];
    }
  }
}

- (BOOL)_loadOrUpdateLeafAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v6 = -[PXGBasicAXGroup _leafAtSpriteIndex:](self, "_leafAtSpriteIndex:");
  v7 = [(PXGBasicAXGroup *)self axInfoSource];
  v8 = [v7 axContentInfoAtSpriteIndex:v3];
  if (!v8)
  {
    BOOL v10 = v6 != 0;
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    unsigned int v13 = NSStringFromClass(v12);
    v14 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PXGAXGroup.m", 402, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[infoSource axContentInfoAtSpriteIndex:spriteIndex]", v13, v14 object file lineNumber description];

    if (v6) {
      goto LABEL_4;
    }
LABEL_9:
    [(PXGBasicAXGroup *)self _setLeaf:v8 forSpriteIndex:v3];
    BOOL v10 = 0;
    goto LABEL_10;
  }
  if (!v6) {
    goto LABEL_9;
  }
LABEL_4:
  [v8 applyToInfo:v6];
  v9 = +[PXGReusableAXInfo sharedPool];
  [v9 checkInReusableObject:v8];

  BOOL v10 = 1;
LABEL_6:
  if ([v6 spriteIndex] != v3) {
    PXAssertGetLog();
  }
LABEL_10:
  if (v8) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v10;
  }

  return v15;
}

- (id)_leafAtSpriteIndex:(unsigned int)a3
{
  mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
  v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)mutableSpritesToLeafs objectForKeyedSubscript:v4];

  return v5;
}

- (unsigned)_loadClosestLeafAtSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = [(PXGBasicAXGroup *)self axInfoSource];
  uint64_t v8 = [v7 axSpriteIndexClosestToSpriteIndex:v5 inDirection:a4];
  if (v8 == -1)
  {
    unsigned int v10 = -1;
  }
  else
  {
    unsigned int v9 = v8;
    if ([(PXGBasicAXGroup *)self _loadOrUpdateLeafAtSpriteIndex:v8]) {
      unsigned int v10 = v9;
    }
    else {
      unsigned int v10 = -1;
    }
  }

  return v10;
}

- (PXGAXInfoSource)axInfoSource
{
  if (self->_updateFlags.needsUpdate)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXGAXGroup.m" lineNumber:253 description:@"Attempted to query group with an invalid version"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axInfoSource);
  return (PXGAXInfoSource *)WeakRetained;
}

- (void)invalidateVersion
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup invalidateVersion]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXGAXGroup.m", 124, @"invalidating %lu after it already has been updated", 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
}

- (void)invalidateLeafs
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 4) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup invalidateLeafs]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXGAXGroup.m", 132, @"invalidating %lu after it already has been updated", 4);

    abort();
  }
  self->_updateFlags.needsUpdate |= 4uLL;
}

- (void)updateLeafsWithChangeDetails:(id)a3
{
  if ((self->_updateFlags.needsUpdate & 1) == 0)
  {
    id v4 = a3;
    unsigned int v5 = [(PXGBasicAXGroup *)self focusedLeafIndex];
    mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__PXGBasicAXGroup_updateLeafsWithChangeDetails___block_invoke;
    v7[3] = &__block_descriptor_36_e30_v24__0Q8__PXGReusableAXInfo_16l;
    unsigned int v8 = v5;
    [v4 applyToDictionary:mutableSpritesToLeafs removalHandler:v7 moveHandler:&__block_literal_global_104];
    [v4 applyToIndexSet:self->_requiredLeafIndexesToLoad];
  }
}

- (unsigned)focusedLeafIndex
{
  uint64_t v3 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  id v4 = [v3 focusedItem];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 axContainingGroup];

    if (v6 == self) {
      unsigned int v7 = [v5 spriteIndex];
    }
    else {
      unsigned int v7 = -1;
    }
  }
  else
  {
    unsigned int v7 = -1;
  }

  return v7;
}

- (NSIndexSet)loadedLeafIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v4 = [(NSMutableDictionary *)self->_mutableSpritesToLeafs allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PXGBasicAXGroup_loadedLeafIndexes__block_invoke;
  v7[3] = &unk_1E5DC3FF8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSIndexSet *)v5;
}

- (void)setNonScrollingAxisItemCount:(int64_t)a3
{
  self->_nonScrollingAxisItemCount = a3;
}

- (void)invalidateVisibility
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup invalidateVisibility]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXGAXGroup.m", 128, @"invalidating %lu after it already has been updated", 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
}

- (void)updateIfNeeded
{
  self->_updateFlags.willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      id v4 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup updateIfNeeded]"];
      [v3 handleFailureInFunction:v4, @"PXGAXGroup.m", 140, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 0;
    [(PXGBasicAXGroup *)self _updateVersionIfNeeded];
    [(PXGBasicAXGroup *)self _updateVisibilityIfNeeded];
    [(PXGBasicAXGroup *)self _updateLeafsIfNeeded];
    [(PXGBasicAXGroup *)self _updateLayoutIfNeeded];
    self->_updateFlags.isPerformingUpdate = 0;
    if (self->_updateFlags.needsUpdate)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup updateIfNeeded]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXGAXGroup.m", 145, @"still needing to update %lu after update pass", self->_updateFlags.needsUpdate);
    }
  }
}

- (void)_updateVisibilityIfNeeded
{
  if (!self->_updateFlags.isPerformingUpdate)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup _updateVisibilityIfNeeded]"];
    [v11 handleFailureInFunction:v12, @"PXGAXGroup.m", 156, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((needsUpdate & 2) != 0)
  {
    self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
    id v13 = [(PXGBasicAXGroup *)self axGroupSource];
    [v13 axFrame];
    double v5 = v4;
    double v7 = v6;
    -[PXGBasicAXGroup setAxFrame:](self, "setAxFrame:");
    [v13 axVisibleRect];
    BOOL v10 = v9 < v7 && v8 < v5;
    [(PXGBasicAXGroup *)self setAxIsVisible:v10];
  }
}

- (void)_updateVersionIfNeeded
{
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup _updateVersionIfNeeded]"];
    [v4 handleFailureInFunction:v5, @"PXGAXGroup.m", 149, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 1uLL;
  if (needsUpdate)
  {
    self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    ++self->_version;
  }
}

- (void)_updateLayoutIfNeeded
{
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup _updateLayoutIfNeeded]"];
    [v4 handleFailureInFunction:v5, @"PXGAXGroup.m", 238, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  self->_updateFlags.updated |= 8uLL;
  if ((needsUpdate & 8) != 0)
  {
    self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    id v6 = [(PXGBasicAXGroup *)self axNextResponder];
    [v6 axGroup:self didChange:8 userInfo:0];
  }
}

- (void)setAxIsVisible:(BOOL)a3
{
  self->_axIsVisible = a3;
}

- (void)setAxFrame:(CGRect)a3
{
  self->_axFrame = a3;
}

- (PXGAXGroupSource)axGroupSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axGroupSource);
  return (PXGAXGroupSource *)WeakRetained;
}

- (PXGAXResponder)axNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axNextResponder);
  return (PXGAXResponder *)WeakRetained;
}

uint64_t __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unloadLeafAtSpriteIndex:a2 usingOptions:0];
}

uint64_t __52__PXGBasicAXGroup_updateSubgroupsWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "setSubgroupIndex:");
}

void __39__PXGBasicAXGroup__updateLeafsIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) loadLeafAtSpriteIndexIfNeeded:a2 usingOptions:0];
  [*(id *)(a1 + 40) removeIndexes:v3];
}

- (id)loadLeafAtSpriteIndexIfNeeded:(unsigned int)a3 usingOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (v5 != -1)
  {
    [(PXGBasicAXGroup *)self _loadOrUpdateLeafAtSpriteIndex:v5];
    [v7 addIndex:v5];
    if (v4) {
      [(NSMutableIndexSet *)self->_requiredLeafIndexesToLoad addIndex:v5];
    }
    if ((v4 & 4) == 0)
    {
      double v8 = [(PXGBasicAXGroup *)self _loadNeighboringLeafsAtSpriteIndex:v5];
      [v7 addIndexes:v8];
    }
  }
  return v7;
}

- (id)_loadNeighboringLeafsAtSpriteIndex:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __54__PXGBasicAXGroup__loadNeighboringLeafsAtSpriteIndex___block_invoke;
  id v13 = &unk_1E5DB8620;
  v14 = self;
  unsigned int v16 = a3;
  id v6 = v5;
  uint64_t v7 = 0;
  id v15 = v6;
  v17[0] = xmmword_1AB359D20;
  v17[1] = xmmword_1AB31A720;
  v17[2] = xmmword_1AB359D30;
  do
  {
    v12((uint64_t)v11, *(void *)((char *)v17 + v7));
    v7 += 8;
  }
  while (v7 != 32);
  double v8 = v15;
  id v9 = v6;

  return v9;
}

uint64_t __54__PXGBasicAXGroup__loadNeighboringLeafsAtSpriteIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _loadClosestLeafAtSpriteIndex:*(unsigned int *)(a1 + 48) inDirection:a2];
  if (result != -1)
  {
    uint64_t v4 = result;
    id v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

- (void)updateSubgroupsWithChangeDetails:(id)a3
{
  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PXGBasicAXGroup_updateSubgroupsWithChangeDetails___block_invoke;
  v5[3] = &unk_1E5DB8778;
  v5[4] = self;
  [a3 applyToDictionary:mutableIndexesToSubgroups removalHandler:v5 moveHandler:&__block_literal_global_100];
}

- (void)loadSubgroup:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v7 = (PXGBasicAXGroup *)a3;
  v12 = v7;
  if (!v7)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXGAXGroup.m" lineNumber:304 description:@"Can not add a nil childGroup"];

    uint64_t v7 = 0;
  }
  if (v7 == self)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:v12 file:@"PXGAXGroup.m" lineNumber:305 description:@"Can not add self as a childGroup"];

    uint64_t v7 = v12;
  }
  [(PXGBasicAXGroup *)v7 setAxParent:self];
  [(PXGBasicAXGroup *)v12 setSubgroupIndex:a4];
  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  id v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)mutableIndexesToSubgroups setObject:v12 forKeyedSubscript:v9];

  [(PXGBasicAXGroup *)self invalidateLayout];
}

- (void)invalidateLayout
{
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 8) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"-[PXGBasicAXGroup invalidateLayout]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXGAXGroup.m", 136, @"invalidating %lu after it already has been updated", 8);

    abort();
  }
  self->_updateFlags.needsUpdate |= 8uLL;
}

- (void)setSubgroupIndex:(int64_t)a3
{
  self->_subgroupIndex = a3;
}

- (void)setAxParent:(id)a3
{
  id obj = a3;
  id v4 = objc_loadWeakRetained((id *)&self->_axParent);
  if (v4 == obj)
  {
  }
  else
  {
    char v5 = [obj isEqual:v4];

    if ((v5 & 1) == 0)
    {
      [(PXGBasicAXGroup *)self unloadFromParent];
      objc_storeWeak((id *)&self->_axParent, obj);
    }
  }
}

- (void)unloadFromParent
{
  int64_t v3 = [(PXGBasicAXGroup *)self subgroupIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axParent);
  uint64_t v7 = [WeakRetained loadedSubgroupAtIndex:v3];

  char v5 = v7;
  if (v7 == self)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_axParent);
    [v6 _unloadSubgroupAtIndex:v3 shouldNotify:0];

    char v5 = v7;
  }
}

- (int64_t)subgroupIndex
{
  return self->_subgroupIndex;
}

- (void)_setLeaf:(id)a3 forSpriteIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if (!v7)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXGAXGroup.m" lineNumber:418 description:@"Can not add a nil leaf"];
  }
  if (v4 == -1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXGAXGroup.m" lineNumber:419 description:@"Can not add a leaf to PXGSpriteIndexNotFound"];
  }
  id v17 = v7;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v15);
    unsigned int v16 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXGAXGroup.m", 420, @"%@ should be an instance inheriting from %@, but it is %@", @"leaf", v14, v16 object file lineNumber description];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXGAXGroup.m", 420, @"%@ should be an instance inheriting from %@, but it is nil", @"leaf", v14 object file lineNumber description];
  }

LABEL_7:
  [v17 setAxContainingGroup:self];
  [v17 setSpriteIndex:v4];
  objc_msgSend(v17, "setAllowDecorations:", -[PXGBasicAXGroup leafFeatures](self, "leafFeatures") & 1);
  objc_msgSend(v17, "setAlternateUIVisibility:", (-[PXGBasicAXGroup leafFeatures](self, "leafFeatures") >> 3) & 1);
  mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
  id v9 = [NSNumber numberWithUnsignedInt:v4];
  [(NSMutableDictionary *)mutableSpritesToLeafs setObject:v17 forKeyedSubscript:v9];
}

- (unint64_t)leafFeatures
{
  return self->_leafFeatures;
}

- (void)setAxRole:(int64_t)a3
{
  if (self->_axRole != a3)
  {
    self->_axRole = a3;
    id v4 = [(PXGBasicAXGroup *)self axNextResponder];
    [v4 axGroup:self didChange:1 userInfo:0];
  }
}

- (void)setLeafFeatures:(unint64_t)a3
{
  self->_leafFeatures = a3;
}

- (PXGBasicAXGroup)initWithLayout:(id)a3
{
  id v4 = a3;
  char v5 = [(PXGBasicAXGroup *)self init];
  id v6 = v5;
  if (v5)
  {
    [(PXGBasicAXGroup *)v5 setAxGroupSource:v4];
    [(PXGBasicAXGroup *)v6 setAxInfoSource:v4];
    [(PXGBasicAXGroup *)v6 setAxNextResponder:v4];
  }

  return v6;
}

- (void)setAxNextResponder:(id)a3
{
}

- (void)setAxInfoSource:(id)a3
{
}

- (void)setAxGroupSource:(id)a3
{
}

- (PXGBasicAXGroup)init
{
  v14.receiver = self;
  v14.super_class = (Class)PXGBasicAXGroup;
  v2 = [(PXGBasicAXGroup *)&v14 init];
  int64_t v3 = (PXGBasicAXGroup *)v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v2 + 152) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v2 + 168) = v4;
    *((void *)v2 + 12) = 0;
    char v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableIndexesToSubgroups = v3->_mutableIndexesToSubgroups;
    v3->_mutableIndexesToSubgroups = v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableSpritesToLeafs = v3->_mutableSpritesToLeafs;
    v3->_mutableSpritesToLeafs = v7;

    id v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    requiredLeafIndexesToLoad = v3->_requiredLeafIndexesToLoad;
    v3->_requiredLeafIndexesToLoad = v9;

    v11 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28D60]);
    previouslySelectedIndexes = v3->_previouslySelectedIndexes;
    v3->_previouslySelectedIndexes = v11;

    v3->_subgroupIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (void)unloadLeafAtSpriteIndex:(unsigned int)a3 usingOptions:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = a3;
  int v8 = [(NSMutableIndexSet *)self->_requiredLeafIndexesToLoad containsIndex:a3];
  int v9 = v8;
  if ((v4 & 1) != 0 && v8) {
    [(NSMutableIndexSet *)self->_requiredLeafIndexesToLoad removeIndex:v7];
  }
  if (v4 & 2) == 0 && ((v4 | v9 ^ 1))
  {
    id v11 = [(PXGBasicAXGroup *)self _removeLeafAtSpriteIndex:v5];
    if (v11)
    {
      BOOL v10 = +[PXGReusableAXInfo sharedPool];
      [v10 checkInReusableObject:v11];
    }
  }
}

- (id)_removeLeafAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == -1)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXGAXGroup.m" lineNumber:457 description:@"Can not remove a leaf at PXGSpriteIndexNotFound"];
  }
  uint64_t v5 = [(PXGBasicAXGroup *)self _leafAtSpriteIndex:v3];
  id v6 = v5;
  if (v5)
  {
    [v5 prepareForReuse];
    mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
    int v8 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)mutableSpritesToLeafs setObject:0 forKeyedSubscript:v8];
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_axNextResponder);
  objc_destroyWeak((id *)&self->_axInfoSource);
  objc_destroyWeak((id *)&self->_axGroupSource);
  objc_storeStrong((id *)&self->axIdentifier, 0);
  objc_destroyWeak((id *)&self->_axParent);
  objc_storeStrong((id *)&self->_previouslySelectedIndexes, 0);
  objc_storeStrong((id *)&self->_requiredLeafIndexesToLoad, 0);
  objc_storeStrong((id *)&self->_mutableSpritesToLeafs, 0);
  objc_storeStrong((id *)&self->_mutableIndexesToSubgroups, 0);
}

- (BOOL)axIsVisible
{
  return self->_axIsVisible;
}

- (CGRect)axFrame
{
  double x = self->_axFrame.origin.x;
  double y = self->_axFrame.origin.y;
  double width = self->_axFrame.size.width;
  double height = self->_axFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)nonScrollingAxisItemCount
{
  return self->_nonScrollingAxisItemCount;
}

- (int64_t)axRole
{
  return self->_axRole;
}

- (void)setAxIdentifier:(id)a3
{
}

- (NSString)axIdentifier
{
  return self->axIdentifier;
}

- (void)_appendLeafDescription:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = a4 + 1;
  int v8 = [(PXGBasicAXGroup *)self _paddingForLevel:a4 + 1];
  int v9 = [(PXGBasicAXGroup *)self _paddingForLevel:a4];
  BOOL v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  objc_msgSend(v6, "appendFormat:", @"<%@: %p; numberOfLeafs = %lu; >\n",
    v11,
    self,
    [(NSMutableDictionary *)self->_mutableSpritesToLeafs count]);

  v12 = [(NSMutableDictionary *)self->_mutableSpritesToLeafs allValues];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke;
  v22[3] = &unk_1E5DB8850;
  id v13 = v6;
  id v23 = v13;
  id v24 = v9;
  id v14 = v9;
  [v12 enumerateObjectsUsingBlock:v22];

  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke_2;
  v18[3] = &unk_1E5DB8828;
  id v19 = v13;
  id v20 = v8;
  int64_t v21 = v7;
  id v16 = v8;
  id v17 = v13;
  [(NSMutableDictionary *)mutableIndexesToSubgroups enumerateKeysAndObjectsUsingBlock:v18];
}

void __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 appendFormat:@"%@  ", v4];
  [*(id *)(a1 + 32) appendFormat:@"%@\n", v5];
}

void __50__PXGBasicAXGroup__appendLeafDescription_atLevel___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = a3;
  [v4 appendFormat:@"%@   ", v5];
  [v6 _appendLeafDescription:a1[4] atLevel:a1[6] + 1];
}

- (void)_appendDescription:(id)a3 atLevel:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = a4 + 1;
  int v8 = [(PXGBasicAXGroup *)self _paddingForLevel:a4 + 1];
  int v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  uint64_t v11 = [(NSMutableDictionary *)self->_mutableIndexesToSubgroups count];
  uint64_t v12 = [(NSMutableDictionary *)self->_mutableSpritesToLeafs count];
  id v13 = objc_loadWeakRetained((id *)&self->_axInfoSource);
  if (v13)
  {
    id v14 = NSString;
    id v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v13 axSpriteIndexes];
    id v27 = v6;
    v28 = v10;
    uint64_t v18 = v17 = v11;
    [v13 axVisibleSpriteIndexes];
    uint64_t v19 = v12;
    id v20 = v8;
    id v22 = v21 = v7;
    objc_msgSend(v14, "stringWithFormat:", @"<%@: %p; axSpriteIndexes = %@; axVisibleSpriteIndexes = %@>",
      v16,
      v13,
      v18,
      v22);
    id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

    int64_t v7 = v21;
    int v8 = v20;
    uint64_t v12 = v19;

    uint64_t v11 = v17;
    id v6 = v27;
    BOOL v10 = v28;
  }
  else
  {
    id v23 = @"<nil>";
  }

  objc_msgSend(v6, "appendFormat:", @"<%@: %p; numberOfLoadedChildren = %lu; numberOfLeafs = %lu; infoSource = %@; > \n",
    v10,
    self,
    v11,
    v12,
    v23);

  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __46__PXGBasicAXGroup__appendDescription_atLevel___block_invoke;
  v29[3] = &unk_1E5DB8828;
  id v30 = v6;
  id v31 = v8;
  int64_t v32 = v7;
  id v25 = v8;
  id v26 = v6;
  [(NSMutableDictionary *)mutableIndexesToSubgroups enumerateKeysAndObjectsUsingBlock:v29];
}

void __46__PXGBasicAXGroup__appendDescription_atLevel___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = a3;
  [v4 appendFormat:@"%@   ", v5];
  [v6 _appendDescription:a1[4] atLevel:a1[6] + 1];
}

- (id)_paddingForLevel:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (a3 >= 1)
  {
    do
    {
      [v4 appendString:@"   | "];
      --a3;
    }
    while (a3);
  }
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (NSString)recursiveLeafDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(PXGBasicAXGroup *)self _appendLeafDescription:v3 atLevel:0];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSString)recursiveDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(PXGBasicAXGroup *)self _appendDescription:v3 atLevel:0];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = NSStringFromCGRect(self->_axFrame);
  uint64_t v6 = [(NSMutableDictionary *)self->_mutableIndexesToSubgroups count];
  uint64_t v7 = [(NSMutableDictionary *)self->_mutableSpritesToLeafs count];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axInfoSource);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; frame = %@; numberOfSubgroups = %lu; numberOfLeafs = %lu; infoSource = %@; >",
    v4,
    self,
    v5,
    v6,
    v7,
  int v9 = WeakRetained);

  return (NSString *)v9;
}

- (PXGBasicAXGroup)axParent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axParent);
  return (PXGBasicAXGroup *)WeakRetained;
}

- (NSArray)axSubgroups
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NSMutableDictionary *)self->_mutableIndexesToSubgroups allValues];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"subgroupIndex" ascending:1];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (NSArray)axLeafs
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NSMutableDictionary *)self->_mutableSpritesToLeafs allValues];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"spriteIndex" ascending:1];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v5 = [v2 sortedArrayUsingDescriptors:v4];

  return (NSArray *)v5;
}

- (BOOL)axIsSelected
{
  if ([(PXGBasicAXGroup *)self axRole] == 1)
  {
    id v3 = [(PXGBasicAXGroup *)self childrenPassingFilter:10 usingOptions:1];
  }
  else
  {
    id v3 = 0;
  }
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)updateWithSelectedChildren:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((self->_updateFlags.needsUpdate & 1) == 0)
  {
    id v25 = [(PXGBasicAXGroup *)self axNextResponder];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      SEL v23 = a2;
      id v24 = v5;
      char v9 = 0;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(PXGBasicAXGroup **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          char v14 = objc_opt_isKindOfClass();
          if (isKindOfClass & 1) != 0 || (v14)
          {
            if (isKindOfClass)
            {
              v9 |= v12 == self;
            }
            else
            {
              if ((v14 & 1) == 0)
              {
                id v22 = [MEMORY[0x1E4F28B00] currentHandler];
                [v22 handleFailureInMethod:v23 object:self file:@"PXGAXGroup.m" lineNumber:764 description:@"Code which should be unreachable has been reached"];

                abort();
              }
              id v15 = v12;
              id v16 = [(PXGBasicAXGroup *)v15 axContainingGroup];

              if (v16 == self)
              {
                id v17 = [(PXGBasicAXGroup *)self _loadNeighboringLeafsAtSpriteIndex:[(PXGBasicAXGroup *)v15 spriteIndex]];
                uint64_t v18 = PXGAXCreateSelectionChangeUserInfo(v15);
                [v25 axGroup:self didChange:4 userInfo:v18];

                char v9 = 1;
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);

      id v5 = v24;
      if (v9)
      {
        BOOL v19 = 1;
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
    }
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__PXGBasicAXGroup_updateWithSelectedChildren___block_invoke;
    v26[3] = &unk_1E5DB8800;
    id v27 = v6;
    [(NSMutableDictionary *)mutableIndexesToSubgroups enumerateKeysAndObjectsUsingBlock:v26];

    BOOL v19 = 0;
    goto LABEL_22;
  }
  BOOL v19 = 0;
LABEL_23:

  return v19;
}

uint64_t __46__PXGBasicAXGroup_updateWithSelectedChildren___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 updateWithSelectedChildren:*(void *)(a1 + 32)];
  *a4 = result;
  return result;
}

- (void)_updateLeafAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = -[PXGBasicAXGroup _leafAtSpriteIndex:](self, "_leafAtSpriteIndex:");
  if (v5)
  {
    id v8 = v5;
    id v6 = [(PXGBasicAXGroup *)self axInfoSource];
    uint64_t v7 = [v6 axContentInfoAtSpriteIndex:v3];
    if (v7) {
      [(PXGBasicAXGroup *)self _setLeaf:v7 forSpriteIndex:v3];
    }

    id v5 = v8;
  }
}

void __48__PXGBasicAXGroup_updateLeafsWithChangeDetails___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(_DWORD *)(a1 + 32) != a2)
  {
    id v3 = a3;
    id v4 = +[PXGReusableAXInfo sharedPool];
    [v4 checkInReusableObject:v3];
  }
}

uint64_t __52__PXGBasicAXGroup_updateSubgroupsWithChangeDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpSubgroupAfterUnloading:");
}

- (BOOL)_leafAtSpriteIndexIsVisible:(unsigned int)a3
{
  id v4 = [(PXGBasicAXGroup *)self axInfoSource];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 axVisibleSpriteIndexes];
    char v7 = [v6 containsIndex:a3];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_leafAtSpriteIndexIsSelected:(unsigned int)a3
{
  id v4 = [(PXGBasicAXGroup *)self axInfoSource];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 axSelectedSpriteIndexes];
    char v7 = [v6 containsIndex:a3];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_leafAtSpriteIndexIsAccessible:(unsigned int)a3
{
  id v4 = [(PXGBasicAXGroup *)self axInfoSource];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 axSpriteIndexes];
    char v7 = [v6 containsIndex:a3];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_leafAtSpriteIndex:(unsigned int)a3 passesFilter:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v5 = *(void *)&a3;
  BOOL v7 = (a4 & 2) == 0
    || [(PXGBasicAXGroup *)self _leafAtSpriteIndexIsAccessible:*(void *)&a3];
  BOOL v8 = (v4 & 4) == 0 && v7;
  if ((v4 & 4) != 0 && v7) {
    BOOL v8 = [(PXGBasicAXGroup *)self _leafAtSpriteIndexIsVisible:v5];
  }
  BOOL v9 = (v4 & 8) == 0 && v8;
  if ((v4 & 8) != 0 && v8) {
    BOOL v9 = [(PXGBasicAXGroup *)self _leafAtSpriteIndexIsSelected:v5];
  }
  return (v4 & 1) == 0 && v9;
}

- (BOOL)_passesFilter:(unint64_t)a3
{
  char v3 = a3;
  BOOL v5 = (a3 & 1) == 0 || [(PXGBasicAXGroup *)self axRole] == 1 || [(PXGBasicAXGroup *)self axRole] == 4;
  BOOL v6 = (v3 & 4) == 0 && v5;
  if ((v3 & 4) != 0 && v5) {
    BOOL v6 = [(PXGBasicAXGroup *)self axIsVisible];
  }
  BOOL v7 = (v3 & 8) == 0 && v6;
  if ((v3 & 8) != 0 && v6) {
    BOOL v7 = [(PXGBasicAXGroup *)self axIsSelected];
  }
  return (v3 & 2) == 0 && v7;
}

- (void)_addAllLeafsPassingFilter:(unint64_t)a3 intoArray:(id)a4
{
  int v4 = a3;
  id v7 = a4;
  BOOL v8 = [(PXGBasicAXGroup *)self axInfoSource];
  BOOL v9 = v8;
  if ((v4 & 2) != 0)
  {
    uint64_t v10 = [v8 axSpriteIndexes];
  }
  else if ((~v4 & 6) != 0)
  {
    if ((~v4 & 0xALL) != 0)
    {
      uint64_t v11 = 0;
      goto LABEL_8;
    }
    uint64_t v10 = [v8 axSelectedSpriteIndexes];
  }
  else
  {
    uint64_t v10 = [v8 axVisibleSpriteIndexes];
  }
  uint64_t v11 = (void *)v10;
LABEL_8:
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PXGBasicAXGroup__addAllLeafsPassingFilter_intoArray___block_invoke;
  v13[3] = &unk_1E5DCA2F0;
  id v14 = v7;
  SEL v15 = a2;
  v13[4] = self;
  id v12 = v7;
  [v11 enumerateIndexesUsingBlock:v13];
}

void __55__PXGBasicAXGroup__addAllLeafsPassingFilter_intoArray___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id)[*(id *)(a1 + 32) loadLeafAtSpriteIndexIfNeeded:a2 usingOptions:4];
  uint64_t v5 = [*(id *)(a1 + 32) loadedLeafAtSpriteIndex:a2];
  id v7 = (id)v5;
  if (!v5)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"PXGAXGroup.m" lineNumber:620 description:@"nil leaf found after loading"];

    uint64_t v5 = 0;
  }
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)_addCurrentlyLoadedLeafsPassingFilter:(unint64_t)a3 intoArray:(id)a4
{
  id v6 = a4;
  mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PXGBasicAXGroup__addCurrentlyLoadedLeafsPassingFilter_intoArray___block_invoke;
  v9[3] = &unk_1E5DB8750;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(NSMutableDictionary *)mutableSpritesToLeafs enumerateKeysAndObjectsUsingBlock:v9];
}

void __67__PXGBasicAXGroup__addCurrentlyLoadedLeafsPassingFilter_intoArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_leafAtSpriteIndex:passesFilter:", objc_msgSend(a2, "unsignedIntegerValue"), *(void *)(a1 + 48)))objc_msgSend(*(id *)(a1 + 40), "addObject:", v5); {
}
  }

- (void)_addLeafsPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4 intoArray:(id)a5
{
  if ((a4 & 2) != 0) {
    [(PXGBasicAXGroup *)self _addAllLeafsPassingFilter:a3 intoArray:a5];
  }
  else {
    [(PXGBasicAXGroup *)self _addCurrentlyLoadedLeafsPassingFilter:a3 intoArray:a5];
  }
}

- (void)_addSubgroupsPassingFilter:(unint64_t)a3 intoArray:(id)a4
{
  id v6 = a4;
  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__PXGBasicAXGroup__addSubgroupsPassingFilter_intoArray___block_invoke;
  v9[3] = &unk_1E5DB8728;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [(NSMutableDictionary *)mutableIndexesToSubgroups enumerateKeysAndObjectsUsingBlock:v9];
}

void __56__PXGBasicAXGroup__addSubgroupsPassingFilter_intoArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 _passesFilter:*(void *)(a1 + 40)]) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (void)_addChildrenPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4 intoArray:(id)a5
{
  id v8 = a5;
  [(PXGBasicAXGroup *)self _addSubgroupsPassingFilter:a3 intoArray:v8];
  [(PXGBasicAXGroup *)self _addLeafsPassingFilter:a3 usingOptions:a4 intoArray:v8];
  if (a4)
  {
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__PXGBasicAXGroup__addChildrenPassingFilter_usingOptions_intoArray___block_invoke;
    v10[3] = &unk_1E5DB8700;
    unint64_t v12 = a3;
    unint64_t v13 = a4;
    id v11 = v8;
    [(NSMutableDictionary *)mutableIndexesToSubgroups enumerateKeysAndObjectsUsingBlock:v10];
  }
}

uint64_t __68__PXGBasicAXGroup__addChildrenPassingFilter_usingOptions_intoArray___block_invoke(void *a1, uint64_t a2, void *a3)
{
  return [a3 _addChildrenPassingFilter:a1[5] usingOptions:a1[6] intoArray:a1[4]];
}

- (id)childrenPassingFilter:(unint64_t)a3 usingOptions:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(PXGBasicAXGroup *)self _addChildrenPassingFilter:a3 usingOptions:a4 intoArray:v7];
  return v7;
}

- (id)leafAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__90137;
  long long v30 = __Block_byref_object_dispose__90138;
  id v31 = 0;
  id v7 = [(PXGBasicAXGroup *)self axInfoSource];
  id v8 = [(PXGBasicAXGroup *)self axGroupSource];
  BOOL v9 = objc_msgSend(v7, "axSpriteIndexesInRect:", x, y, 5.0, 5.0);
  uint64_t v10 = [v9 firstIndex];
  if (v10 == -1)
  {
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __31__PXGBasicAXGroup_leafAtPoint___block_invoke_2;
    v20[3] = &unk_1E5DB86D8;
    double v24 = x;
    double v25 = y;
    id v21 = v8;
    id v22 = &__block_literal_global_90;
    SEL v23 = &v26;
    [(NSMutableDictionary *)mutableIndexesToSubgroups enumerateKeysAndObjectsUsingBlock:v20];

    unint64_t v13 = v21;
  }
  else
  {
    id v11 = [(PXGBasicAXGroup *)self loadLeafAtSpriteIndexIfNeeded:v10 usingOptions:0];
    uint64_t v12 = [(PXGBasicAXGroup *)self loadedLeafAtSpriteIndex:v10];
    unint64_t v13 = (void *)v12;
    if (!v12)
    {
      BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"PXGAXGroup.m" lineNumber:519 description:@"Leaf should not be nil after loading."];
    }
    uint64_t v14 = __31__PXGBasicAXGroup_leafAtPoint___block_invoke(v12, v13);
    SEL v15 = (void *)v27[5];
    v27[5] = v14;
  }
  id v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

id __31__PXGBasicAXGroup_leafAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = v2;
  if (v2)
  {
    [v2 spriteStyle];
    if (*(float *)&v6 > 0.0) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
  }
  if (objc_msgSend(v3, "axAccessibleWhenTransparent", v6, v7, v8, v9, v10, v11, v12, v13, v14, v15))
  {
LABEL_6:
    id v4 = v3;
    goto LABEL_8;
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

void __31__PXGBasicAXGroup_leafAtPoint___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 axFrame];
  if (CGRectContainsPoint(v15, *(CGPoint *)(a1 + 56)))
  {
    objc_msgSend(*(id *)(a1 + 32), "axConvertPoint:toDescendantGroup:", v4, *(double *)(a1 + 56), *(double *)(a1 + 64));
    id v5 = objc_msgSend(v4, "leafAtPoint:");
    long long v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v10 = *(void **)(v7 + 40);
    long long v9 = (id *)(v7 + 40);
    long long v8 = v10;
    if (!v10)
    {
      long long v12 = v9;
      long long v13 = v5;
LABEL_11:
      objc_storeStrong(v12, v13);
      goto LABEL_12;
    }
    if (v5)
    {
      [v5 spriteGeometry];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v8 = *(void **)(v11 + 40);
      long long v14 = 0u;
      if (!v8) {
        goto LABEL_10;
      }
    }
    else
    {
      long long v14 = 0uLL;
    }
    objc_msgSend(v8, "spriteGeometry", v14);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
LABEL_10:
    long long v13 = *(void **)(v11 + 40);
    long long v12 = (id *)(v11 + 40);
    goto LABEL_11;
  }
LABEL_13:
}

- (void)_leafsInRect:(CGRect)a3 usingOptions:(unint64_t)a4 intoMutableArray:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  if ((self->_updateFlags.needsUpdate & 1) == 0)
  {
    long long v12 = [(PXGBasicAXGroup *)self axInfoSource];
    long long v13 = objc_msgSend(v12, "axSpriteIndexesInRect:", x, y, width, height);
    mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke;
    v28[3] = &unk_1E5DB8668;
    id v15 = v13;
    id v29 = v15;
    id v16 = v11;
    id v30 = v16;
    [(NSMutableDictionary *)mutableSpritesToLeafs enumerateKeysAndObjectsUsingBlock:v28];
    id v17 = [(PXGBasicAXGroup *)self axGroupSource];
    uint64_t v18 = v17;
    if ((a4 & 1) != 0 && [v17 axShouldSearchLeafsInSubgroups])
    {
      mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke_2;
      v20[3] = &unk_1E5DB8690;
      double v23 = x;
      double v24 = y;
      double v25 = width;
      double v26 = height;
      id v21 = v18;
      unint64_t v27 = a4;
      id v22 = v16;
      [(NSMutableDictionary *)mutableIndexesToSubgroups enumerateKeysAndObjectsUsingBlock:v20];
    }
  }
}

void __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 axContentKind] != 5
    && objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v4, "spriteIndex")))
  {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __62__PXGBasicAXGroup__leafsInRect_usingOptions_intoMutableArray___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  id v4 = [v14 axGroupSource];
  [v4 axFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v17.origin.double x = v5;
  v17.origin.double y = v7;
  v17.size.double width = v9;
  v17.size.double height = v11;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 48), v17)
    && [v4 axShouldBeConsideredAsSubgroup])
  {
    long long v13 = *(void **)(a1 + 32);
    v18.origin.double x = v6;
    v18.origin.double y = v8;
    v18.size.double width = v10;
    v18.size.double height = v12;
    CGRect v16 = CGRectIntersection(*(CGRect *)(a1 + 48), v18);
    objc_msgSend(v13, "axConvertRect:toDescendantGroup:", v14, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    objc_msgSend(v14, "_leafsInRect:usingOptions:intoMutableArray:", *(void *)(a1 + 80), *(void *)(a1 + 40));
  }
}

- (id)leafsInRect:(CGRect)a3 usingOptions:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  -[PXGBasicAXGroup _leafsInRect:usingOptions:intoMutableArray:](self, "_leafsInRect:usingOptions:intoMutableArray:", a4, v10, x, y, width, height);
  return v10;
}

- (void)unloadAllLeafs
{
  [(NSMutableDictionary *)self->_mutableSpritesToLeafs enumerateKeysAndObjectsUsingBlock:&__block_literal_global_90147];
  mutableSpritesToLeafs = self->_mutableSpritesToLeafs;
  [(NSMutableDictionary *)mutableSpritesToLeafs removeAllObjects];
}

uint64_t __33__PXGBasicAXGroup_unloadAllLeafs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 prepareForReuse];
}

- (void)_cleanUpSubgroupAfterUnloading:(id)a3
{
  id v3 = a3;
  [v3 setAxParent:0];
  [v3 setSubgroupIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)_unloadSubgroupAtIndex:(int64_t)a3 shouldNotify:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat v7 = -[PXGBasicAXGroup loadedSubgroupAtIndex:](self, "loadedSubgroupAtIndex:");
  if (v7)
  {
    mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
    id v10 = v7;
    CGFloat v9 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)mutableIndexesToSubgroups setObject:0 forKeyedSubscript:v9];

    [(PXGBasicAXGroup *)self _cleanUpSubgroupAfterUnloading:v10];
    CGFloat v7 = v10;
    if (v4)
    {
      [(PXGBasicAXGroup *)self invalidateLayout];
      CGFloat v7 = v10;
    }
  }
}

- (void)unloadSubgroupAtIndex:(int64_t)a3
{
}

- (id)loadedSubgroupAtIndex:(int64_t)a3
{
  mutableIndexesToSubgroups = self->_mutableIndexesToSubgroups;
  BOOL v4 = [NSNumber numberWithInteger:a3];
  CGFloat v5 = [(NSMutableDictionary *)mutableIndexesToSubgroups objectForKeyedSubscript:v4];

  return v5;
}

- (NSIndexSet)loadedSubgroupIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  BOOL v4 = [(NSMutableDictionary *)self->_mutableIndexesToSubgroups allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __40__PXGBasicAXGroup_loadedSubgroupIndexes__block_invoke;
  v7[3] = &unk_1E5DC3FF8;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSIndexSet *)v5;
}

uint64_t __40__PXGBasicAXGroup_loadedSubgroupIndexes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 unsignedIntegerValue];
  return [v2 addIndex:v3];
}

- (PXGBasicAXGroup)axScrollParent
{
  id v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_axParent);
  BOOL v4 = [WeakRetained axGroupSource];

  if ([v4 axShouldBeConsideredAsSubgroup])
  {
    id v5 = objc_loadWeakRetained((id *)&v2->_axParent);
    uint64_t v6 = [v5 axScrollParent];

    id v2 = (PXGBasicAXGroup *)v6;
  }

  return v2;
}

- (PXGBasicAXGroup)axRootParent
{
  id WeakRetained = (PXGBasicAXGroup *)objc_loadWeakRetained((id *)&self->_axParent);
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v5 = [(PXGBasicAXGroup *)WeakRetained axParent];

    if (v5)
    {
      do
      {
        uint64_t v6 = [(PXGBasicAXGroup *)v4 axParent];

        CGFloat v7 = [(PXGBasicAXGroup *)v6 axParent];

        BOOL v4 = v6;
      }
      while (v7);
    }
    else
    {
      uint64_t v6 = v4;
    }
  }
  else
  {
    uint64_t v6 = self;
  }
  return v6;
}

- (BOOL)versionNeedUpdate
{
  return self->_updateFlags.needsUpdate & 1;
}

- (void)_addFirstVisibleIndexes:(id)a3 toIndexesToLoad:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int64_t v7 = [(PXGBasicAXGroup *)self nonScrollingAxisItemCount];
  if (![v8 firstIndex] && v7) {
    objc_msgSend(v6, "addIndexesInRange:", objc_msgSend(v8, "firstIndex"), v7);
  }
}

- (BOOL)needsUpdate
{
  return self->_updateFlags.needsUpdate != 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a3;
  id v6 = [(PXGBasicAXGroup *)self axInfoSource];
  [v6 axDidUpdateFocusInContext:v5];

  int64_t v7 = [v5 previouslyFocusedItem];
  id v8 = [v5 nextFocusedItem];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PXGBasicAXGroup_PlatformSpecific__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  aBlock[3] = &unk_1E5DC5690;
  aBlock[4] = self;
  CGFloat v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v10 = v9[2](v9, v7);
  uint64_t v11 = v9[2](v9, v8);
  if (v10 | v11)
  {
    CGFloat v12 = PXGAXCreateFocusChangeUserInfo((void *)v10, (void *)v11);
    long long v13 = [(PXGBasicAXGroup *)self axNextResponder];
    [v13 axGroup:self didChange:2 userInfo:v12];
  }
}

id __86__PXGBasicAXGroup_PlatformSpecific__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    unsigned int v5 = [v4 spriteIndex];
    id v6 = [v4 axContainingGroup];
    int64_t v7 = *(void **)(a1 + 32);
    id v8 = [v6 loadedLeafIndexes];
    int v9 = [v8 containsIndex:v5];

    if (v9) {
      uint64_t v10 = v4;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v5 == -1 || v6 != v7) {
      uint64_t v10 = 0;
    }
    id v12 = v10;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)updateFocusIfNeeded
{
  id v2 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (void)setNeedsFocusUpdate
{
  id v3 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (UIFocusItemContainer)focusItemContainer
{
  id v3 = [(PXGBasicAXGroup *)self axNextResponder];
  id v4 = [v3 axContainingScrollViewForAXGroup:self];

  return (UIFocusItemContainer *)v4;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  id v3 = [(PXGBasicAXGroup *)self axParent];
  if (!v3)
  {
    id v4 = [(PXGBasicAXGroup *)self axNextResponder];
    unsigned int v5 = v4;
    if (v4)
    {
      id v3 = [v4 axContainingScrollViewForAXGroup:self];
    }
    else
    {
      id v3 = 0;
    }
  }
  return (UIFocusEnvironment *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v5 = [(PXGBasicAXGroup *)self axInfoSource];
  id v6 = [(PXGBasicAXGroup *)self loadedLeafIndexes];
  if ([v6 count])
  {
    int64_t v7 = [v5 axVisibleSpriteIndexes];
    if (objc_msgSend(v6, "containsIndex:", objc_msgSend(v7, "firstIndex")))
    {
      id v8 = -[PXGBasicAXGroup loadedLeafAtSpriteIndex:](self, "loadedLeafAtSpriteIndex:", [v7 firstIndex]);
      if (!v8)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"PXGAXGroup+iOS.m" lineNumber:71 description:@"A loaded leaf must not be nil"];
      }
      [v4 addObject:v8];
    }
  }

  return (NSArray *)v4;
}

- (id)focusItemsForScrollViewController:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  int v9 = objc_msgSend(off_1E5DA9658, "sharedInstance", a3);
  int v10 = [v9 enableTungstenFocusEnvironmentSupport];

  if (v10)
  {
    uint64_t v11 = -[PXGBasicAXGroup leafsInRect:usingOptions:](self, "leafsInRect:usingOptions:", 1, x, y, width, height);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v11;
}

- (PXGLayout)containingLayout
{
  id v4 = [(PXGBasicAXGroup *)self axGroupSource];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      int v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PXGLayout+AX.m", 359, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.axGroupSource", v8, v9 object file lineNumber description];
    }
  }
  return (PXGLayout *)v4;
}

@end