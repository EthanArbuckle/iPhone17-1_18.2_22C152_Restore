@interface PXArrayChangeDetails
+ (BOOL)_mutableCopyInputs;
+ (id)changeDetailsByMergingChangeDetails:(id)a3;
+ (id)changeDetailsFromArray:(id)a3 toArray:(id)a4 changedObjects:(id)a5;
+ (id)changeDetailsFromArray:(id)a3 toArray:(id)a4 changedObjects:(id)a5 objectComparator:(id)a6;
+ (id)changeDetailsFromSubrange:(_NSRange)a3 toSubrange:(_NSRange)a4;
+ (id)changeDetailsWithChangedIndexRange:(_NSRange)a3;
+ (id)changeDetailsWithChangedIndexes:(id)a3;
+ (id)changeDetailsWithInsertedIndexRange:(_NSRange)a3;
+ (id)changeDetailsWithInsertedIndexes:(id)a3;
+ (id)changeDetailsWithMovedFromIndexRange:(_NSRange)a3 toIndexRange:(_NSRange)a4;
+ (id)changeDetailsWithNoChanges;
+ (id)changeDetailsWithNoIncrementalChanges;
+ (id)changeDetailsWithOldKeyItemIndex:(int64_t)a3 oldCount:(int64_t)a4 newKeyItemIndex:(int64_t)a5 newCount:(int64_t)a6;
+ (id)changeDetailsWithRemovedIndexRange:(_NSRange)a3;
+ (id)changeDetailsWithRemovedIndexes:(id)a3;
+ (unint64_t)indexAfterApplyingChanges:(id)a3 toIndex:(unint64_t)a4 objectChanged:(BOOL *)a5;
+ (unint64_t)indexAfterRevertingChanges:(id)a3 fromIndex:(unint64_t)a4 objectChanged:(BOOL *)a5;
- (BOOL)canPreserveIncrementalChangesWhenAddingChangeDetails:(id)a3;
- (BOOL)hasAnyChanges;
- (BOOL)hasAnyInsertionsRemovalsOrMoves;
- (BOOL)hasIncrementalChanges;
- (BOOL)hasMoves;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnlyInsertionAtEnd:(BOOL *)a3 orRemovalAtEnd:(BOOL *)a4 countBeforeChange:(int64_t)a5 countAfterChange:(int64_t)a6;
- (NSDictionary)indexesWithChangesByProperty;
- (NSIndexSet)changedIndexes;
- (NSIndexSet)insertedIndexes;
- (NSIndexSet)movesToIndexes;
- (NSIndexSet)removedIndexes;
- (PXArrayChangeDetails)init;
- (PXArrayChangeDetails)initWithIncrementalChangeDetailsRemovedIndexes:(id)a3 insertedIndexes:(id)a4 movesToIndexes:(id)a5 movesFromIndexes:(__CFArray *)a6 changedIndexes:(id)a7;
- (PXArrayChangeDetails)initWithIncrementalChangeDetailsRemovedIndexes:(id)a3 insertedIndexes:(id)a4 movesToIndexes:(id)a5 movesFromIndexes:(__CFArray *)a6 changedIndexes:(id)a7 indexesWithChangesByProperty:(id)a8;
- (__CFArray)movesFromIndexes;
- (id)changeDetailsByAddingChangeDetails:(id)a3;
- (id)changeDetailsByAddingChangedIndexes:(id)a3;
- (id)changeDetailsByReplacingChangedItemsWithRemovalsAndInsertions;
- (id)changeDetailsShiftedBy:(int64_t)a3;
- (id)changedPropertiesForIndex:(int64_t)a3;
- (id)description;
- (id)indexSetAfterApplyingChangesToIndexSet:(id)a3;
- (id)indexSetAfterRevertingChangesToIndexSet:(id)a3;
- (id)indexesWithChangesToProperty:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)indexAfterApplyingChangesToIndex:(unint64_t)a3;
- (unint64_t)indexAfterRevertingChangesFromIndex:(unint64_t)a3;
- (void)applyToDictionary:(id)a3 removalHandler:(id)a4 moveHandler:(id)a5;
- (void)applyToIndexSet:(id)a3;
- (void)dealloc;
- (void)enumerateMovedIndexesUsingBlock:(id)a3;
- (void)enumerateMovedRangesUsingBlock:(id)a3;
- (void)setIndexesWithChangesByProperty:(id)a3;
@end

@implementation PXArrayChangeDetails

uint64_t __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  if (a2 <= v5) {
    *(void *)(v4 + 24) = v5 + a3;
  }
  else {
    *a4 = 1;
  }
  return result;
}

uint64_t __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke(uint64_t result, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 < a2 || v5 - a2 >= a3)
  {
    if ((uint64_t)(a3 + a2 - 1) < v5) {
      *(void *)(v4 + 24) = v5 - a3;
    }
  }
  else
  {
    *(void *)(v4 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    *a4 = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesWithChangesByProperty, 0);
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_movesToIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);

  objc_storeStrong((id *)&self->_removedIndexes, 0);
}

- (id)changeDetailsShiftedBy:(int64_t)a3
{
  if ([(PXArrayChangeDetails *)self hasIncrementalChanges]
    && (BOOL v5 = [(PXArrayChangeDetails *)self hasAnyChanges], a3)
    && v5)
  {
    v6 = [(PXArrayChangeDetails *)self removedIndexes];
    if ([v6 count])
    {
      v7 = [(PXArrayChangeDetails *)self removedIndexes];
      v8 = (void *)[v7 mutableCopy];
    }
    else
    {
      v8 = (void *)[0 mutableCopy];
    }

    v10 = [(PXArrayChangeDetails *)self insertedIndexes];
    if ([v10 count])
    {
      v11 = [(PXArrayChangeDetails *)self insertedIndexes];
      v12 = (void *)[v11 mutableCopy];
    }
    else
    {
      v12 = (void *)[0 mutableCopy];
    }

    v13 = [(PXArrayChangeDetails *)self movesToIndexes];
    if ([v13 count])
    {
      v14 = [(PXArrayChangeDetails *)self movesToIndexes];
      v15 = (void *)[v14 mutableCopy];
    }
    else
    {
      v15 = (void *)[0 mutableCopy];
    }

    v16 = [(PXArrayChangeDetails *)self changedIndexes];
    if ([v16 count])
    {
      v17 = [(PXArrayChangeDetails *)self changedIndexes];
      v18 = (void *)[v17 mutableCopy];
    }
    else
    {
      v18 = (void *)[0 mutableCopy];
    }

    [v8 shiftIndexesStartingAtIndex:0 by:a3];
    [v12 shiftIndexesStartingAtIndex:0 by:a3];
    [v15 shiftIndexesStartingAtIndex:0 by:a3];
    [v18 shiftIndexesStartingAtIndex:0 by:a3];
    v19 = 0;
    if ([(PXArrayChangeDetails *)self hasMoves])
    {
      CFIndex v20 = [v15 count];
      v21 = [(PXArrayChangeDetails *)self movesFromIndexes];
      CFArrayCallBacks v25 = *(CFArrayCallBacks *)byte_270798918;
      v19 = CFArrayCreateMutable(0, v20, &v25);
      if (v20 >= 1)
      {
        for (CFIndex i = 0; i != v20; ++i)
        {
          ValueAtIndex = (char *)CFArrayGetValueAtIndex(v21, i);
          CFArrayAppendValue(v19, &ValueAtIndex[a3]);
        }
      }
    }
    v9 = [[PXArrayChangeDetails alloc] initWithIncrementalChangeDetailsRemovedIndexes:v8 insertedIndexes:v12 movesToIndexes:v15 movesFromIndexes:v19 changedIndexes:v18];
    if (v19) {
      CFRelease(v19);
    }
  }
  else
  {
    v9 = self;
  }

  return v9;
}

- (PXArrayChangeDetails)initWithIncrementalChangeDetailsRemovedIndexes:(id)a3 insertedIndexes:(id)a4 movesToIndexes:(id)a5 movesFromIndexes:(__CFArray *)a6 changedIndexes:(id)a7
{
  return [(PXArrayChangeDetails *)self initWithIncrementalChangeDetailsRemovedIndexes:a3 insertedIndexes:a4 movesToIndexes:a5 movesFromIndexes:a6 changedIndexes:a7 indexesWithChangesByProperty:0];
}

- (id)indexSetAfterApplyingChangesToIndexSet:(id)a3
{
  id v4 = a3;
  if (![(PXArrayChangeDetails *)self hasIncrementalChanges])
  {
    id v13 = [MEMORY[0x263F088D0] indexSet];
    goto LABEL_10;
  }
  BOOL v5 = [(PXArrayChangeDetails *)self insertedIndexes];
  if (![v5 count])
  {
    v6 = [(PXArrayChangeDetails *)self removedIndexes];
    if ([v6 count])
    {

      goto LABEL_5;
    }
    BOOL v15 = [(PXArrayChangeDetails *)self hasMoves];

    if (v15) {
      goto LABEL_6;
    }
    id v13 = v4;
LABEL_10:
    v12 = v13;
    goto LABEL_11;
  }
LABEL_5:

LABEL_6:
  v7 = (void *)[v4 mutableCopy];
  v8 = [(PXArrayChangeDetails *)self removedIndexes];
  objc_msgSend(v7, "px_adjustIndexesForDeletions:", v8);

  v9 = [(PXArrayChangeDetails *)self insertedIndexes];
  objc_msgSend(v7, "px_adjustIndexesForInsertions:", v9);

  if ([(PXArrayChangeDetails *)self hasMoves])
  {
    v10 = (void *)[v7 copy];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke;
    v19 = &unk_26545AFD8;
    id v20 = v7;
    id v21 = v10;
    id v11 = v10;
    [(PXArrayChangeDetails *)self enumerateMovedRangesUsingBlock:&v16];
  }
  v12 = objc_msgSend(v7, "copy", v16, v17, v18, v19);

LABEL_11:

  return v12;
}

- (BOOL)hasAnyInsertionsRemovalsOrMoves
{
  if (![(PXArrayChangeDetails *)self hasIncrementalChanges]) {
    return 1;
  }
  v3 = [(PXArrayChangeDetails *)self removedIndexes];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  BOOL v5 = [(PXArrayChangeDetails *)self insertedIndexes];
  uint64_t v6 = [v5 count];

  return v6 || [(NSIndexSet *)self->_movesToIndexes count] != 0;
}

- (BOOL)hasAnyChanges
{
  if (![(PXArrayChangeDetails *)self hasIncrementalChanges]) {
    return 1;
  }
  v3 = [(PXArrayChangeDetails *)self removedIndexes];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  BOOL v5 = [(PXArrayChangeDetails *)self insertedIndexes];
  uint64_t v6 = [v5 count];

  if (v6) {
    return 1;
  }
  v7 = [(PXArrayChangeDetails *)self changedIndexes];
  uint64_t v8 = [v7 count];

  return v8 || [(NSIndexSet *)self->_movesToIndexes count] != 0;
}

- (NSIndexSet)changedIndexes
{
  return self->_changedIndexes;
}

- (NSIndexSet)insertedIndexes
{
  return self->_insertedIndexes;
}

- (BOOL)hasIncrementalChanges
{
  return 1;
}

- (NSIndexSet)removedIndexes
{
  return self->_removedIndexes;
}

- (PXArrayChangeDetails)initWithIncrementalChangeDetailsRemovedIndexes:(id)a3 insertedIndexes:(id)a4 movesToIndexes:(id)a5 movesFromIndexes:(__CFArray *)a6 changedIndexes:(id)a7 indexesWithChangesByProperty:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  v58.receiver = self;
  v58.super_class = (Class)PXArrayChangeDetails;
  id v20 = [(PXArrayChangeDetails *)&v58 init];
  if (v20)
  {
    uint64_t v21 = [v17 count];
    if (a6) {
      CFIndex Count = CFArrayGetCount(a6);
    }
    else {
      CFIndex Count = 0;
    }
    if (v21 != Count)
    {
      v57 = [MEMORY[0x263F08690] currentHandler];
      [v57 handleFailureInMethod:a2, v20, @"PXArrayChangeDetails.m", 340, @"Invalid parameter not satisfying: %@", @"[movesToIndexes count] == (movesFromIndexes == nil ? 0 : CFArrayGetCount(movesFromIndexes))" object file lineNumber description];
    }
    if ([(id)objc_opt_class() _mutableCopyInputs])
    {
      v23 = (void *)[v15 mutableCopy];
      v24 = v23;
      if (v23) {
        CFArrayCallBacks v25 = v23;
      }
      else {
        CFArrayCallBacks v25 = (NSIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
      }
      removedIndexes = v20->_removedIndexes;
      v20->_removedIndexes = v25;

      v30 = (void *)[v16 mutableCopy];
      v31 = v30;
      if (v30) {
        v32 = v30;
      }
      else {
        v32 = (NSIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
      }
      insertedIndexes = v20->_insertedIndexes;
      v20->_insertedIndexes = v32;

      v38 = (void *)[v17 mutableCopy];
      v39 = v38;
      if (v38) {
        v40 = v38;
      }
      else {
        v40 = (NSIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
      }
      movesToIndexes = v20->_movesToIndexes;
      v20->_movesToIndexes = v40;

      CFAllocatorRef v46 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (a6)
      {
        CFIndex v47 = CFArrayGetCount(a6);
        CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(v46, v47, a6);
      }
      else
      {
        CFMutableArrayRef MutableCopy = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0);
      }
      v20->_movesFromIndexes = MutableCopy;
      v49 = (void *)[v18 mutableCopy];
      if (v49)
      {
LABEL_32:
        v51 = v49;
        v52 = v51;
LABEL_35:
        changedIndexes = v20->_changedIndexes;
        v20->_changedIndexes = v51;

        uint64_t v54 = [v19 copy];
        indexesWithChangesByProperty = v20->_indexesWithChangesByProperty;
        v20->_indexesWithChangesByProperty = (NSDictionary *)v54;

        goto LABEL_36;
      }
      v50 = (objc_class *)MEMORY[0x263F089C8];
    }
    else
    {
      v26 = (void *)[v15 copy];
      v27 = v26;
      if (v26) {
        v28 = v26;
      }
      else {
        v28 = (NSIndexSet *)objc_alloc_init(MEMORY[0x263F088D0]);
      }
      v33 = v20->_removedIndexes;
      v20->_removedIndexes = v28;

      v34 = (void *)[v16 copy];
      v35 = v34;
      if (v34) {
        v36 = v34;
      }
      else {
        v36 = (NSIndexSet *)objc_alloc_init(MEMORY[0x263F088D0]);
      }
      v41 = v20->_insertedIndexes;
      v20->_insertedIndexes = v36;

      uint64_t v42 = [v17 copy];
      v43 = v20->_movesToIndexes;
      v20->_movesToIndexes = (NSIndexSet *)v42;

      if (a6) {
        v44 = (__CFArray *)CFRetain(a6);
      }
      else {
        v44 = 0;
      }
      v20->_movesFromIndexes = v44;
      v49 = (void *)[v18 copy];
      if (v49) {
        goto LABEL_32;
      }
      v50 = (objc_class *)MEMORY[0x263F088D0];
    }
    v51 = (NSIndexSet *)objc_alloc_init(v50);
    v52 = 0;
    goto LABEL_35;
  }
LABEL_36:

  return v20;
}

- (unint64_t)indexAfterApplyingChangesToIndex:(unint64_t)a3
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    unint64_t v14 = a3;
    removedIndexes = self->_removedIndexes;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke;
    v10[3] = &unk_26545B4E8;
    v10[4] = &v11;
    [(NSIndexSet *)removedIndexes enumerateRangesWithOptions:2 usingBlock:v10];
    if (v12[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      insertedIndexes = self->_insertedIndexes;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_2;
      v9[3] = &unk_26545B4E8;
      v9[4] = &v11;
      [(NSIndexSet *)insertedIndexes enumerateRangesUsingBlock:v9];
      if (v12[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(PXArrayChangeDetails *)self hasMoves])
        {
          v8[0] = MEMORY[0x263EF8330];
          v8[1] = 3221225472;
          v8[2] = __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_3;
          v8[3] = &unk_26545AF88;
          v8[4] = &v11;
          [(PXArrayChangeDetails *)self enumerateMovedIndexesUsingBlock:v8];
        }
      }
    }
    unint64_t v3 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  return v3;
}

- (BOOL)hasMoves
{
  v2 = [(PXArrayChangeDetails *)self movesToIndexes];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSIndexSet)movesToIndexes
{
  return self->_movesToIndexes;
}

+ (BOOL)_mutableCopyInputs
{
  return 0;
}

- (void)dealloc
{
  movesFromIndexes = self->_movesFromIndexes;
  if (movesFromIndexes)
  {
    CFRelease(movesFromIndexes);
    self->_movesFromIndexes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXArrayChangeDetails;
  [(PXArrayChangeDetails *)&v4 dealloc];
}

- (void)applyToIndexSet:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [(PXArrayChangeDetails *)self indexSetAfterApplyingChangesToIndexSet:v5];
    if (v4 != v5)
    {
      [v5 removeAllIndexes];
      [v5 addIndexes:v4];
    }
  }
}

- (id)changeDetailsByAddingChangeDetails:(id)a3
{
  id v4 = a3;
  if ([(PXArrayChangeDetails *)self canPreserveIncrementalChangesWhenAddingChangeDetails:v4])
  {
    id v5 = (void *)[(PXArrayChangeDetails *)self mutableCopy];
    [v5 addChangeDetails:v4];
    uint64_t v6 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v6 = +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if ([(PXArrayChangeDetails *)self hasIncrementalChanges])
  {
    id v4 = [PXMutableArrayChangeDetails alloc];
    id v5 = [(PXArrayChangeDetails *)self removedIndexes];
    uint64_t v6 = [(PXArrayChangeDetails *)self insertedIndexes];
    v7 = [(PXArrayChangeDetails *)self movesToIndexes];
    uint64_t v8 = [(PXArrayChangeDetails *)self movesFromIndexes];
    v9 = [(PXArrayChangeDetails *)self changedIndexes];
    v10 = [(PXArrayChangeDetails *)v4 initWithIncrementalChangeDetailsRemovedIndexes:v5 insertedIndexes:v6 movesToIndexes:v7 movesFromIndexes:v8 changedIndexes:v9];

    return v10;
  }
  else
  {
    +[PXMutableArrayChangeDetails changeDetailsWithNoIncrementalChanges];
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)changeDetailsByAddingChangedIndexes:(id)a3
{
  id v4 = a3;
  if ([(PXArrayChangeDetails *)self hasIncrementalChanges])
  {
    id v5 = [(PXArrayChangeDetails *)self changedIndexes];
    if ([v5 count])
    {
      uint64_t v6 = [(PXArrayChangeDetails *)self changedIndexes];
      v7 = (void *)[v6 mutableCopy];
    }
    else
    {
      v7 = objc_opt_new();
    }

    [v7 addIndexes:v4];
    v9 = [PXArrayChangeDetails alloc];
    v10 = [(PXArrayChangeDetails *)self removedIndexes];
    uint64_t v11 = [(PXArrayChangeDetails *)self insertedIndexes];
    v12 = [(PXArrayChangeDetails *)self movesToIndexes];
    uint64_t v8 = [(PXArrayChangeDetails *)v9 initWithIncrementalChangeDetailsRemovedIndexes:v10 insertedIndexes:v11 movesToIndexes:v12 movesFromIndexes:[(PXArrayChangeDetails *)self movesFromIndexes] changedIndexes:v7];
  }
  else
  {
    uint64_t v8 = self;
  }

  return v8;
}

- (__CFArray)movesFromIndexes
{
  return self->_movesFromIndexes;
}

+ (id)changeDetailsFromArray:(id)a3 toArray:(id)a4 changedObjects:(id)a5 objectComparator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count] || objc_msgSend(v11, "count"))
  {
    id v24 = 0;
    CFTypeRef v25 = 0;
    id v22 = 0;
    id v23 = 0;
    id v21 = 0;
    PXDiffArraysWithObjectComparator(v10, v11, v12, (uint64_t)v13, &v24, &v23, &v22, &v25, &v21);
    id v14 = v24;
    id v15 = v23;
    id v16 = v22;
    id v17 = v21;
    id v18 = objc_alloc((Class)a1);
    id v19 = (void *)[v18 initWithIncrementalChangeDetailsRemovedIndexes:v14 insertedIndexes:v15 movesToIndexes:v16 movesFromIndexes:v25 changedIndexes:v17];
  }
  else
  {
    id v19 = [a1 changeDetailsWithNoChanges];
  }

  return v19;
}

+ (id)changeDetailsWithNoChanges
{
  if ((id)objc_opt_class() == a1)
  {
    if (changeDetailsWithNoChanges_onceToken != -1) {
      dispatch_once(&changeDetailsWithNoChanges_onceToken, &__block_literal_global_5395);
    }
    id v3 = (id)changeDetailsWithNoChanges__sharedEmptyChangeDetails;
  }
  else
  {
    id v3 = (id)[objc_alloc((Class)a1) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  }

  return v3;
}

+ (id)changeDetailsByMergingChangeDetails:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (![v3 count])
  {
    uint64_t v4 = +[PXArrayChangeDetails changeDetailsWithNoChanges];
    goto LABEL_5;
  }
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_24;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v9)
        {
          if (![v9 canPreserveIncrementalChangesWhenAddingChangeDetails:*(void *)(*((void *)&v16 + 1) + 8 * i)])
          {
            id v13 = +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
            goto LABEL_22;
          }
          [v9 addChangeDetails:v12];
        }
        else
        {
          v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "mutableCopy", (void)v16);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  id v14 = (void *)[v9 copy];
  if (v14)
  {
    id v13 = v14;
    id v6 = v13;
LABEL_22:
    id v5 = v13;
  }
  else
  {
    id v5 = +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
    id v6 = 0;
  }

LABEL_24:

  return v5;
}

- (BOOL)canPreserveIncrementalChangesWhenAddingChangeDetails:(id)a3
{
  id v4 = a3;
  if ([(PXArrayChangeDetails *)self hasIncrementalChanges]
    && [v4 hasIncrementalChanges])
  {
    if ([(PXArrayChangeDetails *)self hasMoves]) {
      int v5 = [v4 hasAnyInsertionsRemovalsOrMoves] ^ 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSDictionary)indexesWithChangesByProperty
{
  return self->_indexesWithChangesByProperty;
}

- (id)indexSetAfterRevertingChangesToIndexSet:(id)a3
{
  id v4 = a3;
  if (![(PXArrayChangeDetails *)self hasIncrementalChanges])
  {
    id v13 = [MEMORY[0x263F088D0] indexSet];
    goto LABEL_10;
  }
  int v5 = [(PXArrayChangeDetails *)self insertedIndexes];
  if (![v5 count])
  {
    id v6 = [(PXArrayChangeDetails *)self removedIndexes];
    if ([v6 count])
    {

      goto LABEL_5;
    }
    BOOL v15 = [(PXArrayChangeDetails *)self hasMoves];

    if (v15) {
      goto LABEL_6;
    }
    id v13 = v4;
LABEL_10:
    uint64_t v12 = v13;
    goto LABEL_11;
  }
LABEL_5:

LABEL_6:
  uint64_t v7 = (void *)[v4 mutableCopy];
  [v7 addIndexes:v4];
  if ([(PXArrayChangeDetails *)self hasMoves])
  {
    uint64_t v8 = (void *)[v4 mutableCopy];
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    long long v18 = __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke;
    long long v19 = &unk_26545AFD8;
    id v20 = v7;
    id v21 = v8;
    id v9 = v8;
    [(PXArrayChangeDetails *)self enumerateMovedRangesUsingBlock:&v16];
  }
  uint64_t v10 = [(PXArrayChangeDetails *)self insertedIndexes];
  objc_msgSend(v7, "px_adjustIndexesForDeletions:", v10);

  id v11 = [(PXArrayChangeDetails *)self removedIndexes];
  objc_msgSend(v7, "px_adjustIndexesForInsertions:", v11);

  uint64_t v12 = (void *)[v7 copy];
LABEL_11:

  return v12;
}

uint64_t __69__PXArrayChangeDetails_applyToDictionary_removalHandler_moveHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  uint64_t v5 = [a2 unsignedIntegerValue];
  uint64_t v6 = [*(id *)(a1 + 32) indexAfterApplyingChangesToIndex:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v13);
    }
  }
  else
  {
    uint64_t v8 = v6;
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:v6];
    [v9 setObject:v13 forKeyedSubscript:v10];

    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, v5, v8, v13);
    }
  }

  return MEMORY[0x270F9A790]();
}

+ (id)changeDetailsWithRemovedIndexRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", location, length);
  uint64_t v7 = (void *)[v5 initWithIncrementalChangeDetailsRemovedIndexes:v6 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

  return v7;
}

+ (id)changeDetailsWithChangedIndexRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", location, length);
  uint64_t v7 = (void *)[v5 initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v6];

  return v7;
}

+ (id)changeDetailsWithInsertedIndexRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", location, length);
  uint64_t v7 = (void *)[v5 initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:v6 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

  return v7;
}

- (void)applyToDictionary:(id)a3 removalHandler:(id)a4 moveHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PXArrayChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    uint64_t v11 = (void *)[v8 copy];
    [v8 removeAllObjects];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__PXArrayChangeDetails_applyToDictionary_removalHandler_moveHandler___block_invoke;
    v12[3] = &unk_26545B000;
    v12[4] = self;
    id v14 = v9;
    id v13 = v8;
    id v15 = v10;
    [v11 enumerateKeysAndObjectsUsingBlock:v12];
  }
}

+ (id)changeDetailsWithNoIncrementalChanges
{
  if (changeDetailsWithNoIncrementalChanges_onceToken != -1) {
    dispatch_once(&changeDetailsWithNoIncrementalChanges_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)changeDetailsWithNoIncrementalChanges_changeDetails;

  return v2;
}

uint64_t __61__PXArrayChangeDetails_changeDetailsWithNoIncrementalChanges__block_invoke()
{
  v0 = [(PXArrayChangeDetails *)[_PXArrayNoIncrementalChangeDetails alloc] initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  uint64_t v1 = changeDetailsWithNoIncrementalChanges_changeDetails;
  changeDetailsWithNoIncrementalChanges_changeDetails = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __50__PXArrayChangeDetails_changeDetailsWithNoChanges__block_invoke()
{
  v0 = [[PXArrayChangeDetails alloc] initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  uint64_t v1 = changeDetailsWithNoChanges__sharedEmptyChangeDetails;
  changeDetailsWithNoChanges__sharedEmptyChangeDetails = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)setIndexesWithChangesByProperty:(id)a3
{
}

- (id)description
{
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSIndexSet count](self->_movesToIndexes, "count"));
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __35__PXArrayChangeDetails_description__block_invoke;
  v25[3] = &unk_26545B050;
  id v4 = v3;
  id v26 = v4;
  [(PXArrayChangeDetails *)self enumerateMovedIndexesUsingBlock:v25];
  id v5 = [(PXArrayChangeDetails *)self indexesWithChangesByProperty];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v8 = [(PXArrayChangeDetails *)self indexesWithChangesByProperty];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __35__PXArrayChangeDetails_description__block_invoke_2;
    v23[3] = &unk_26545B078;
    id v24 = v7;
    id v9 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v23];

    id v10 = NSString;
    uint64_t v11 = [v9 componentsJoinedByString:@", "];
    uint64_t v12 = [v10 stringWithFormat:@" properties:{%@}", v11];
  }
  else
  {
    uint64_t v12 = &stru_270799240;
  }
  id v13 = NSString;
  v22.receiver = self;
  v22.super_class = (Class)PXArrayChangeDetails;
  id v14 = [(PXArrayChangeDetails *)&v22 description];
  if ([(PXArrayChangeDetails *)self hasIncrementalChanges]) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  uint64_t v16 = [(NSIndexSet *)self->_removedIndexes px_shortDescription];
  uint64_t v17 = [(NSIndexSet *)self->_insertedIndexes px_shortDescription];
  long long v18 = [v4 componentsJoinedByString:@", "];
  long long v19 = [(NSIndexSet *)self->_changedIndexes px_shortDescription];
  id v20 = [v13 stringWithFormat:@"<%@ hasIncremental:%@ removed:%@ inserted:%@ moved:[%@] changed:%@%@>", v14, v15, v16, v17, v18, v19, v12];

  return v20;
}

void __35__PXArrayChangeDetails_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"%lu->%lu", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

void __35__PXArrayChangeDetails_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSString;
  id v6 = a2;
  objc_msgSend(a3, "px_shortDescription");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v5 stringWithFormat:@"%@:%@", v6, v8];

  [v4 addObject:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXArrayChangeDetails *)a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  if (v4 == self)
  {
    char v29 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v6 = [(PXArrayChangeDetails *)self hasMoves];
      BOOL v7 = [(PXArrayChangeDetails *)v5 hasMoves];
      id v8 = v27;
      *((unsigned char *)v27 + 24) = v6 ^ v7 ^ 1;
      if ((v6 ^ v7))
      {
        *((unsigned char *)v8 + 24) = 0;
      }
      else
      {
        int IsEquivalentToIndexSet = PXIndexSetIsEquivalentToIndexSet(self->_removedIndexes, v5->_removedIndexes);
        id v8 = v27;
        *((unsigned char *)v27 + 24) = IsEquivalentToIndexSet;
        if (IsEquivalentToIndexSet)
        {
          int v10 = PXIndexSetIsEquivalentToIndexSet(self->_insertedIndexes, v5->_insertedIndexes);
          id v8 = v27;
          *((unsigned char *)v27 + 24) = v10;
          if (v10)
          {
            int v11 = PXIndexSetIsEquivalentToIndexSet(self->_movesToIndexes, v5->_movesToIndexes);
            id v8 = v27;
            *((unsigned char *)v27 + 24) = v11;
            if (v11)
            {
              int v12 = PXIndexSetIsEquivalentToIndexSet(self->_changedIndexes, v5->_changedIndexes);
              id v8 = v27;
              *((unsigned char *)v27 + 24) = v12;
              if (v12)
              {
                indexesWithChangesByProperty = v5->_indexesWithChangesByProperty;
                id v14 = self->_indexesWithChangesByProperty;
                id v15 = indexesWithChangesByProperty;
                if (v14 == v15)
                {

                  *((unsigned char *)v27 + 24) = 1;
                }
                else
                {
                  uint64_t v16 = v15;
                  char v17 = [(NSDictionary *)v14 isEqual:v15];

                  *((unsigned char *)v27 + 24) = v17;
                  if ((v17 & 1) == 0)
                  {
LABEL_17:

                    goto LABEL_18;
                  }
                }
                v25[0] = 0;
                v25[1] = v25;
                v25[2] = 0x2020000000;
                v25[3] = 0;
                movesToIndexes = self->_movesToIndexes;
                v21[0] = MEMORY[0x263EF8330];
                v21[1] = 3221225472;
                v21[2] = __32__PXArrayChangeDetails_isEqual___block_invoke;
                v21[3] = &unk_26545B028;
                v21[4] = self;
                id v23 = v25;
                objc_super v22 = v5;
                id v24 = &v26;
                [(NSIndexSet *)movesToIndexes enumerateIndexesUsingBlock:v21];

                _Block_object_dispose(v25, 8);
                goto LABEL_17;
              }
LABEL_16:
              *((unsigned char *)v8 + 24) = 0;
              goto LABEL_17;
            }
LABEL_15:
            *((unsigned char *)v8 + 24) = 0;
            goto LABEL_16;
          }
LABEL_14:
          *((unsigned char *)v8 + 24) = 0;
          goto LABEL_15;
        }
      }
      *((unsigned char *)v8 + 24) = 0;
      goto LABEL_14;
    }
  }
LABEL_18:
  char v18 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return v18;
}

const void *__32__PXArrayChangeDetails_isEqual___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[4] + 32), *(void *)(*(void *)(a1[6] + 8) + 24));
  result = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[5] + 32), *(void *)(*(void *)(a1[6] + 8) + 24));
  if (ValueAtIndex != result)
  {
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    *a3 = 1;
  }
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  return result;
}

- (BOOL)isOnlyInsertionAtEnd:(BOOL *)a3 orRemovalAtEnd:(BOOL *)a4 countBeforeChange:(int64_t)a5 countAfterChange:(int64_t)a6
{
  if ([(PXArrayChangeDetails *)self hasIncrementalChanges]
    && ![(PXArrayChangeDetails *)self hasMoves])
  {
    id v15 = [(PXArrayChangeDetails *)self insertedIndexes];
    uint64_t v16 = [(PXArrayChangeDetails *)self removedIndexes];
    uint64_t v17 = [v16 count];
    BOOL v12 = v17 == 0;
    if (v17)
    {
      if ([v15 count])
      {
        BOOL v11 = 0;
        char v13 = 0;
      }
      else
      {
        char v13 = objc_msgSend(v16, "px_isSingleRangeWithMax:", a5);
        BOOL v11 = 1;
      }
    }
    else
    {
      char v13 = objc_msgSend(v15, "px_isSingleRangeWithMax:", a6);
      BOOL v11 = 0;
    }

    if (!a3) {
      goto LABEL_5;
    }
  }
  else
  {
    BOOL v11 = 0;
    BOOL v12 = 0;
    char v13 = 0;
    if (!a3) {
      goto LABEL_5;
    }
  }
  *a3 = v12;
LABEL_5:
  if (a4) {
    *a4 = v11;
  }
  return v13;
}

void __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke_2;
  v11[3] = &unk_26545AFB0;
  int v10 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", a4, a5, 0, v11);
}

uint64_t __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2 - *(void *)(a1 + 40) + *(void *)(a1 + 56)];
}

void __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a4, a5);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke_2;
  v11[3] = &unk_26545AFB0;
  int v10 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v15 = a4;
  uint64_t v16 = a5;
  objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", a2, a3, 0, v11);
}

uint64_t __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2 - *(void *)(a1 + 40) + *(void *)(a1 + 56)];
}

- (unint64_t)indexAfterRevertingChangesFromIndex:(unint64_t)a3
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    unint64_t v14 = a3;
    if ([(PXArrayChangeDetails *)self hasMoves])
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke;
      v10[3] = &unk_26545AF88;
      v10[4] = &v11;
      [(PXArrayChangeDetails *)self enumerateMovedIndexesUsingBlock:v10];
    }
    insertedIndexes = self->_insertedIndexes;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_2;
    v9[3] = &unk_26545B4E8;
    v9[4] = &v11;
    [(NSIndexSet *)insertedIndexes enumerateRangesWithOptions:2 usingBlock:v9];
    unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      removedIndexes = self->_removedIndexes;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_3;
      v8[3] = &unk_26545B4E8;
      v8[4] = &v11;
      [(NSIndexSet *)removedIndexes enumerateRangesUsingBlock:v8];
      unint64_t v3 = v12[3];
    }
    _Block_object_dispose(&v11, 8);
  }
  return v3;
}

uint64_t __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v4 + 24) == a3)
  {
    *(void *)(v4 + 24) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_2(uint64_t result, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 < a2 || v5 - a2 >= a3)
  {
    if ((uint64_t)(a3 + a2 - 1) < v5) {
      *(void *)(v4 + 24) = v5 - a3;
    }
  }
  else
  {
    *(void *)(v4 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    *a4 = 1;
  }
  return result;
}

uint64_t __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_3(uint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  if (a2 <= v5) {
    *(void *)(v4 + 24) = v5 + a3;
  }
  else {
    *a4 = 1;
  }
  return result;
}

uint64_t __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v4 + 24) == a2)
  {
    *(void *)(v4 + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)changedPropertiesForIndex:(int64_t)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__5347;
  unint64_t v14 = __Block_byref_object_dispose__5348;
  id v15 = 0;
  unint64_t v5 = [(PXArrayChangeDetails *)self indexesWithChangesByProperty];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__PXArrayChangeDetails_changedPropertiesForIndex___block_invoke;
  v9[3] = &unk_26545AF60;
  void v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  BOOL v6 = (void *)v11[5];
  if (v6) {
    BOOL v7 = (void *)[v6 copy];
  }
  else {
    BOOL v7 = (void *)MEMORY[0x263EFFA68];
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __50__PXArrayChangeDetails_changedPropertiesForIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if ([a3 containsIndex:*(void *)(a1 + 48)])
  {
    unint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc(MEMORY[0x263EFF980]);
      BOOL v7 = [*(id *)(a1 + 32) indexesWithChangesByProperty];
      uint64_t v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      unint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v5 addObject:v11];
  }
}

- (id)indexesWithChangesToProperty:(id)a3
{
  unint64_t v3 = [(NSDictionary *)self->_indexesWithChangesByProperty objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263F088D0] indexSet];
  }
  id v6 = v5;

  return v6;
}

- (void)enumerateMovedIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__PXArrayChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke;
  v6[3] = &unk_26545AF38;
  id v7 = v4;
  id v5 = v4;
  [(PXArrayChangeDetails *)self enumerateMovedRangesUsingBlock:v6];
}

uint64_t __56__PXArrayChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a3)
  {
    uint64_t v8 = a3;
    uint64_t v10 = result;
    do
    {
      if (*a6) {
        break;
      }
      result = (*(uint64_t (**)(void))(*(void *)(v10 + 32) + 16))();
      ++a4;
      ++a2;
      --v8;
    }
    while (v8);
  }
  return result;
}

- (void)enumerateMovedRangesUsingBlock:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  movesToIndexes = self->_movesToIndexes;
  if (movesToIndexes)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__PXArrayChangeDetails_enumerateMovedRangesUsingBlock___block_invoke;
    v8[3] = &unk_26545AF10;
    v8[4] = self;
    uint64_t v10 = v12;
    SEL v11 = a2;
    id v9 = v5;
    [(NSIndexSet *)movesToIndexes enumerateRangesUsingBlock:v8];

    _Block_object_dispose(v12, 8);
  }
}

void __55__PXArrayChangeDetails_enumerateMovedRangesUsingBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (!a3) {
    return;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    while (1)
    {
      uint64_t v12 = v11;
      uint64_t v13 = v9;
      uint64_t v11 = v7 + a2;
      CFArrayRef v14 = *(const __CFArray **)(a1[4] + 32);
      uint64_t v15 = *(void *)(a1[6] + 8);
      CFIndex v16 = *(void *)(v15 + 24);
      *(void *)(v15 + 24) = v16 + 1;
      ValueAtIndex = CFArrayGetValueAtIndex(v14, v16);
      uint64_t v18 = (uint64_t)ValueAtIndex;
      uint64_t v19 = 1;
      if (!v8 || v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if ((const void *)(v8 + v10) == ValueAtIndex)
      {
        uint64_t v19 = v8 + 1;
        uint64_t v18 = v10;
        break;
      }
      (*(void (**)(void))(a1[5] + 16))();
      if (*a4) {
        return;
      }
      ++v7;
      uint64_t v8 = 1;
      uint64_t v10 = v18;
      uint64_t v9 = 1;
      if (v7 == a3) {
        goto LABEL_20;
      }
    }
    uint64_t v8 = v19;
    uint64_t v10 = v18;
    uint64_t v9 = 1;
    if (v13 && v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13 + v12 == v11)
      {
        uint64_t v9 = v13 + 1;
        uint64_t v11 = v12;
      }
      else
      {
        id v20 = PXAssertGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_259CDA000, v20, OS_LOG_TYPE_ERROR, "Expects contigous range...", buf, 2u);
        }

        uint64_t v11 = v12;
        uint64_t v9 = v13;
      }
    }
    ++v7;
  }
  while (v7 != a3);
  if (v8 && !*a4) {
LABEL_20:
  }
    (*(void (**)(void))(a1[5] + 16))();
}

- (PXArrayChangeDetails)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PXArrayChangeDetails.m", 330, @"%@ not supported", v5 object file lineNumber description];

  abort();
}

- (id)changeDetailsByReplacingChangedItemsWithRemovalsAndInsertions
{
  v2 = self;
  unint64_t v3 = [(PXArrayChangeDetails *)v2 changedIndexes];
  if ([v3 count])
  {
    id v4 = [[PXArrayChangeDetails alloc] initWithIncrementalChangeDetailsRemovedIndexes:v3 insertedIndexes:v3 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
    uint64_t v5 = [(PXArrayChangeDetails *)v2 changeDetailsByAddingChangeDetails:v4];

    v2 = (PXArrayChangeDetails *)v5;
  }

  return v2;
}

+ (unint64_t)indexAfterRevertingChanges:(id)a3 fromIndex:(unint64_t)a4 objectChanged:(BOOL *)a5
{
  id v7 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unint64_t v19 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__PXArrayChangeDetails_indexAfterRevertingChanges_fromIndex_objectChanged___block_invoke;
  v11[3] = &unk_26545AEE8;
  void v11[4] = &v12;
  v11[5] = &v16;
  [v7 enumerateObjectsWithOptions:2 usingBlock:v11];
  if (a5)
  {
    char v8 = *((unsigned char *)v13 + 24);
    if (v8) {
      char v8 = v17[3] != 0x7FFFFFFFFFFFFFFFLL;
    }
    *a5 = v8;
  }
  unint64_t v9 = v17[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __75__PXArrayChangeDetails_indexAfterRevertingChanges_fromIndex_objectChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 changedIndexes];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= [v7 containsIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8)+ 24)];

  uint64_t v8 = [v6 indexAfterRevertingChangesFromIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL) {
    *a4 = 1;
  }
}

+ (unint64_t)indexAfterApplyingChanges:(id)a3 toIndex:(unint64_t)a4 objectChanged:(BOOL *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        a4 = objc_msgSend(v13, "indexAfterApplyingChangesToIndex:", a4, (void)v16);
        uint64_t v14 = [v13 changedIndexes];
        v10 |= [v14 containsIndex:a4];

        if (a4 == 0x7FFFFFFFFFFFFFFFLL)
        {
          a4 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_12:

  if (a5) {
    *a5 = v10 & (a4 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return a4;
}

+ (id)changeDetailsWithOldKeyItemIndex:(int64_t)a3 oldCount:(int64_t)a4 newKeyItemIndex:(int64_t)a5 newCount:(int64_t)a6
{
  int v10 = objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", 0, a4);
  [v10 removeIndex:a3];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", 0, a6);
  [v11 removeIndex:a5];
  uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithIncrementalChangeDetailsRemovedIndexes:v10 insertedIndexes:v11 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

  return v12;
}

+ (id)changeDetailsWithMovedFromIndexRange:(_NSRange)a3 toIndexRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  if (a3.length != a4.length)
  {
    objc_super v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PXArrayChangeDetails.m", 213, @"Invalid parameter not satisfying: %@", @"fromIndexRange.length == toIndexRange.length" object file lineNumber description];
  }
  if (v7 + v6 > location && location + length > v7)
  {
    id v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PXArrayChangeDetails.m", 214, @"Invalid parameter not satisfying: %@", @"NSMaxRange(fromIndexRange) <= toIndexRange.location || NSMaxRange(toIndexRange) <= fromIndexRange.location" object file lineNumber description];
  }
  v26.NSUInteger location = v7;
  v26.NSUInteger length = v6;
  v27.NSUInteger location = location;
  v27.NSUInteger length = length;
  NSRange v10 = NSUnionRange(v26, v27);
  NSUInteger v11 = v10.location;
  NSUInteger v12 = v10.length;
  uint64_t v13 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", v10.location, v10.length);
  BOOL v14 = v7 >= location;
  NSUInteger v15 = v7 - location;
  if (v14) {
    NSUInteger v16 = -(uint64_t)v6;
  }
  else {
    NSUInteger v16 = v6;
  }
  CFArrayCallBacks callBacks = *(CFArrayCallBacks *)byte_270798918;
  long long v17 = CFArrayCreateMutable(0, v10.length, &callBacks);
  if (v10.location < v10.location + v10.length)
  {
    do
    {
      if (v11 - location >= length || location > v11) {
        NSUInteger v19 = v16;
      }
      else {
        NSUInteger v19 = v15;
      }
      CFArrayAppendValue(v17, (const void *)(v19 + v11++));
      --v12;
    }
    while (v12);
  }
  id v20 = (void *)[objc_alloc((Class)a1) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:v13 movesFromIndexes:v17 changedIndexes:0];
  CFRelease(v17);

  return v20;
}

+ (id)changeDetailsWithChangedIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v4];

  return v5;
}

+ (id)changeDetailsWithRemovedIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithIncrementalChangeDetailsRemovedIndexes:v4 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

  return v5;
}

+ (id)changeDetailsWithInsertedIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:v4 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

  return v5;
}

+ (id)changeDetailsFromSubrange:(_NSRange)a3 toSubrange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  NSRange v9 = NSIntersectionRange(a3, a4);
  if (v7 == location && v6 == length)
  {
    NSRange v10 = [a1 changeDetailsWithNoChanges];
    if (v10) {
      goto LABEL_23;
    }
  }
  if (!v9.length || v9.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v11 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, length);
    NSUInteger v12 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, v6);
    NSRange v10 = [[PXArrayChangeDetails alloc] initWithIncrementalChangeDetailsRemovedIndexes:v12 insertedIndexes:v11 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];

    if (v10) {
      goto LABEL_23;
    }
  }
  id v24 = (objc_class *)a1;
  id v13 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v14 = objc_alloc_init(MEMORY[0x263F089C8]);
  id v15 = objc_alloc_init(MEMORY[0x263F089C8]);
  if (v7 >= location)
  {
    if (v7 <= location) {
      goto LABEL_12;
    }
    NSUInteger v16 = v7 - location;
    long long v17 = v14;
  }
  else
  {
    NSUInteger v16 = location - v7;
    long long v17 = v13;
  }
  objc_msgSend(v17, "addIndexesInRange:", 0, v16);
LABEL_12:
  uint64_t v18 = location + length - (v7 + v6);
  if (v18 < 0)
  {
    NSUInteger v19 = location + length - v7;
    uint64_t v18 = v7 + v6 - (location + length);
    id v20 = v13;
    goto LABEL_16;
  }
  if (location + length != v7 + v6)
  {
    NSUInteger v19 = v7 + v6 - location;
    id v20 = v14;
LABEL_16:
    objc_msgSend(v20, "addIndexesInRange:", v19, v18);
  }
  if (v9.length)
  {
    objc_msgSend(v15, "addIndexesInRange:", v9.location - location, v9.length);
    NSUInteger v21 = v7 - location;
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], [v15 count], 0);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __61__PXArrayChangeDetails_changeDetailsFromSubrange_toSubrange___block_invoke;
    v25[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
    void v25[4] = Mutable;
    v25[5] = v21;
    [v15 enumerateIndexesUsingBlock:v25];
  }
  else
  {
    CFMutableArrayRef Mutable = 0;
  }
  NSRange v10 = (PXArrayChangeDetails *)[[v24 alloc] initWithIncrementalChangeDetailsRemovedIndexes:v13 insertedIndexes:v14 movesToIndexes:v15 movesFromIndexes:Mutable changedIndexes:0];
  if (Mutable) {
    CFRelease(Mutable);
  }

LABEL_23:

  return v10;
}

void __61__PXArrayChangeDetails_changeDetailsFromSubrange_toSubrange___block_invoke(uint64_t a1, uint64_t a2)
{
}

+ (id)changeDetailsFromArray:(id)a3 toArray:(id)a4 changedObjects:(id)a5
{
  return +[PXArrayChangeDetails changeDetailsFromArray:a3 toArray:a4 changedObjects:a5 objectComparator:0];
}

@end