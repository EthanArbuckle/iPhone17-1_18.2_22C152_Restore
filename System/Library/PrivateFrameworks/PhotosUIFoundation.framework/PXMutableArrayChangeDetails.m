@interface PXMutableArrayChangeDetails
+ (BOOL)_mutableCopyInputs;
+ (id)changeDetailsWithNoIncrementalChanges;
- (BOOL)hasIncrementalChanges;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_addAdditionalRemovedIndex:(unint64_t)a3 afterChangesIndex:(unint64_t)a4;
- (void)_addAdditionalRemovedIndexSet:(id)a3 afterChangesIndex:(id)a4;
- (void)_addInsertedIndexes:(id)a3;
- (void)_addInsertedRange:(_NSRange)a3;
- (void)_addRemovedIndex:(unint64_t)a3;
- (void)_addRemovedIndexes:(id)a3;
- (void)_becomeNonIncremental;
- (void)_removeInsertForRemovedIndexAfterChanges:(unint64_t)a3;
- (void)_updateChangedIndexesWithChangeDetails:(id)a3;
- (void)_updateMovesWithChangesDetails:(id)a3;
- (void)_updatePropertyChangesWithChangeDetails:(id)a3;
- (void)addChangeDetails:(id)a3;
@end

@implementation PXMutableArrayChangeDetails

+ (BOOL)_mutableCopyInputs
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(PXMutableArrayChangeDetails *)self hasIncrementalChanges])
  {
    v4 = [PXArrayChangeDetails alloc];
    v5 = [(PXArrayChangeDetails *)self removedIndexes];
    v6 = [(PXArrayChangeDetails *)self insertedIndexes];
    v7 = [(PXArrayChangeDetails *)self movesToIndexes];
    v8 = [(PXArrayChangeDetails *)self movesFromIndexes];
    v9 = [(PXArrayChangeDetails *)self changedIndexes];
    v10 = [(PXArrayChangeDetails *)self indexesWithChangesByProperty];
    v11 = [(PXArrayChangeDetails *)v4 initWithIncrementalChangeDetailsRemovedIndexes:v5 insertedIndexes:v6 movesToIndexes:v7 movesFromIndexes:v8 changedIndexes:v9 indexesWithChangesByProperty:v10];

    return v11;
  }
  else
  {
    +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges];
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)addChangeDetails:(id)a3
{
  id v6 = a3;
  if (-[PXArrayChangeDetails canPreserveIncrementalChangesWhenAddingChangeDetails:](self, "canPreserveIncrementalChangesWhenAddingChangeDetails:"))
  {
    v4 = [v6 removedIndexes];
    [(PXMutableArrayChangeDetails *)self _addRemovedIndexes:v4];

    v5 = [v6 insertedIndexes];
    [(PXMutableArrayChangeDetails *)self _addInsertedIndexes:v5];

    [(PXMutableArrayChangeDetails *)self _updateMovesWithChangesDetails:v6];
    [(PXMutableArrayChangeDetails *)self _updateChangedIndexesWithChangeDetails:v6];
    [(PXMutableArrayChangeDetails *)self _updatePropertyChangesWithChangeDetails:v6];
  }
  else
  {
    [(PXMutableArrayChangeDetails *)self _becomeNonIncremental];
  }
}

- (BOOL)hasIncrementalChanges
{
  return !self->_isNonIncremental;
}

- (void)_updatePropertyChangesWithChangeDetails:(id)a3
{
  id v4 = a3;
  v5 = [(PXArrayChangeDetails *)self indexesWithChangesByProperty];
  if ([v5 count])
  {

LABEL_4:
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = [(PXArrayChangeDetails *)self indexesWithChangesByProperty];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke;
    v17[3] = &unk_26545B0F0;
    id v10 = v4;
    id v18 = v10;
    id v11 = v8;
    id v19 = v11;
    [v9 enumerateKeysAndObjectsUsingBlock:v17];

    v12 = [v10 indexesWithChangesByProperty];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke_2;
    v15[3] = &unk_26545B078;
    id v16 = v11;
    id v13 = v11;
    [v12 enumerateKeysAndObjectsUsingBlock:v15];

    v14 = (void *)[v13 copy];
    [(PXArrayChangeDetails *)self setIndexesWithChangesByProperty:v14];

    goto LABEL_5;
  }
  id v6 = [v4 indexesWithChangesByProperty];
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)_updateMovesWithChangesDetails:(id)a3
{
  id v9 = a3;
  if ([v9 hasMoves] && !-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
  {
    id v4 = [(PXArrayChangeDetails *)self movesFromIndexes];
    CFIndex Count = CFArrayGetCount((CFArrayRef)[v9 movesFromIndexes]);
    CFArrayRef v6 = (const __CFArray *)[v9 movesFromIndexes];
    v11.location = 0;
    v11.length = Count;
    CFArrayAppendArray(v4, v6, v11);
    uint64_t v7 = [(PXArrayChangeDetails *)self movesToIndexes];
    id v8 = [v9 movesToIndexes];
    [v7 addIndexes:v8];
  }
}

- (void)_updateChangedIndexesWithChangeDetails:(id)a3
{
  id v7 = a3;
  id v4 = [(PXArrayChangeDetails *)self changedIndexes];
  v5 = [v7 indexSetAfterApplyingChangesToIndexSet:v4];
  if (v5 != v4)
  {
    [v4 removeAllIndexes];
    [v4 addIndexes:v5];
  }
  CFArrayRef v6 = [v7 changedIndexes];
  [v4 addIndexes:v6];
}

- (void)_addRemovedIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(PXArrayChangeDetails *)self indexSetAfterRevertingChangesToIndexSet:v4];
  uint64_t v6 = [v5 count];
  if (v6 == [v4 count])
  {
    [(PXMutableArrayChangeDetails *)self _addAdditionalRemovedIndexSet:v5 afterChangesIndex:v4];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__PXMutableArrayChangeDetails__addRemovedIndexes___block_invoke;
    v7[3] = &unk_26545B890;
    v7[4] = self;
    [v4 enumerateIndexesWithOptions:2 usingBlock:v7];
  }
}

- (void)_addInsertedIndexes:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__PXMutableArrayChangeDetails__addInsertedIndexes___block_invoke;
  v3[3] = &unk_26545B470;
  v3[4] = self;
  [a3 enumerateRangesUsingBlock:v3];
}

- (void)_addAdditionalRemovedIndexSet:(id)a3 afterChangesIndex:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXArrayChangeDetails *)self removedIndexes];
  [v8 addIndexes:v7];

  id v9 = [(PXArrayChangeDetails *)self insertedIndexes];
  objc_msgSend(v9, "px_adjustIndexesForDeletions:", v6);
}

uint64_t __51__PXMutableArrayChangeDetails__addInsertedIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addInsertedRange:", a2, a3);
}

uint64_t __49__PXMutableArrayChangeDetails__addInsertedRange___block_invoke(uint64_t result, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t v4 = *(void *)(result + 40);
  if (v4 < a2 || v4 - a2 >= a3)
  {
    if (v4 >= a2) {
      return result;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(result + 32) + 8);
    *(void *)(v6 + 32) = a2;
    *(void *)(v6 + 40) = a3;
  }
  *a4 = 1;
  return result;
}

- (void)_addInsertedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3010000000;
  CFRange v11 = &unk_259D809E3;
  long long v12 = xmmword_259D747D0;
  v5 = [(PXArrayChangeDetails *)self insertedIndexes];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__PXMutableArrayChangeDetails__addInsertedRange___block_invoke;
  v7[3] = &unk_26545B0C8;
  v7[4] = &v8;
  void v7[5] = location;
  [v5 enumerateRangesUsingBlock:v7];
  uint64_t v6 = v9[4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger location = v9[5] + v6;
  }
  [v5 shiftIndexesStartingAtIndex:location + 1 by:length];
  objc_msgSend(v5, "addIndexesInRange:", location, length);

  _Block_object_dispose(&v8, 8);
}

void __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = [*(id *)(a1 + 32) indexSetAfterApplyingChangesToIndexSet:a3];
  if ([v5 count]) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)[v6 mutableCopy];
    [v8 addIndexes:v5];
    id v9 = (id)[v8 copy];
  }
  else
  {
    id v9 = v5;
  }
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

uint64_t __50__PXMutableArrayChangeDetails__addRemovedIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _addRemovedIndex:a2];
}

- (void)_addRemovedIndex:(unint64_t)a3
{
  unint64_t v5 = -[PXArrayChangeDetails indexAfterRevertingChangesFromIndex:](self, "indexAfterRevertingChangesFromIndex:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PXMutableArrayChangeDetails *)self _removeInsertForRemovedIndexAfterChanges:a3];
  }
  else
  {
    [(PXMutableArrayChangeDetails *)self _addAdditionalRemovedIndex:v5 afterChangesIndex:a3];
  }
}

- (void)_addAdditionalRemovedIndex:(unint64_t)a3 afterChangesIndex:(unint64_t)a4
{
  id v7 = [(PXArrayChangeDetails *)self removedIndexes];
  [v7 addIndex:a3];

  id v8 = [(PXArrayChangeDetails *)self insertedIndexes];
  objc_msgSend(v8, "px_adjustIndexesForDeletedRange:", a4, 1);
}

- (void)_removeInsertForRemovedIndexAfterChanges:(unint64_t)a3
{
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke;
  v16[3] = &unk_26545AF88;
  v16[4] = v17;
  [(PXArrayChangeDetails *)self enumerateMovedIndexesUsingBlock:v16];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3010000000;
  v14 = &unk_259D809E3;
  long long v15 = xmmword_259D747D0;
  unint64_t v5 = [(PXArrayChangeDetails *)self insertedIndexes];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke_2;
  v10[3] = &unk_26545B0A0;
  v10[4] = v17;
  v10[5] = &v11;
  [v5 enumerateRangesUsingBlock:v10];
  id v6 = v12;
  uint64_t v7 = v12[4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXArrayChangeDetails.m" lineNumber:849 description:@"Input was not inserted in this change"];

    id v6 = v12;
    uint64_t v7 = v12[4];
  }
  uint64_t v8 = v6[5] + v7;
  [v5 removeIndex:v8 - 1];
  [v5 shiftIndexesStartingAtIndex:v8 by:-1];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v17, 8);
}

uint64_t __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  if (*(void *)(v4 + 24) == a3)
  {
    *(void *)(v4 + 24) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke_2(uint64_t result, unint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t v4 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  BOOL v6 = v4 >= a2;
  unint64_t v5 = v4 - a2;
  BOOL v6 = !v6 || v5 >= a3;
  if (!v6)
  {
    uint64_t v7 = *(void *)(*(void *)(result + 40) + 8);
    *(void *)(v7 + 32) = a2;
    *(void *)(v7 + 40) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)_becomeNonIncremental
{
  if ([(PXMutableArrayChangeDetails *)self hasIncrementalChanges])
  {
    self->_isNonIncremental = 1;
    v3 = [(PXArrayChangeDetails *)self removedIndexes];
    [v3 removeAllIndexes];

    unint64_t v4 = [(PXArrayChangeDetails *)self insertedIndexes];
    [v4 removeAllIndexes];

    unint64_t v5 = [(PXArrayChangeDetails *)self movesToIndexes];
    [v5 removeAllIndexes];

    CFArrayRemoveAllValues([(PXArrayChangeDetails *)self movesFromIndexes]);
    BOOL v6 = [(PXArrayChangeDetails *)self changedIndexes];
    [v6 removeAllIndexes];

    [(PXArrayChangeDetails *)self setIndexesWithChangesByProperty:0];
  }
}

+ (id)changeDetailsWithNoIncrementalChanges
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
  [v2 _becomeNonIncremental];

  return v2;
}

@end