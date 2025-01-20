@interface PXArrayChangeDetails(PXGDecoratingLayout)
- (id)changeDetailsShiftedBy:()PXGDecoratingLayout scaledBy:;
@end

@implementation PXArrayChangeDetails(PXGDecoratingLayout)

- (id)changeDetailsShiftedBy:()PXGDecoratingLayout scaledBy:
{
  if (a4 < 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PXGDecoratingLayout.m", 1109, @"Invalid parameter not satisfying: %@", @"scale >= 0" object file lineNumber description];
  }
  else if (!a4)
  {
    id v17 = [(id)objc_opt_class() changeDetailsWithNoChanges];
LABEL_8:
    v18 = v17;
    goto LABEL_10;
  }
  if (([a1 hasIncrementalChanges] & 1) == 0)
  {
    id v17 = a1;
    goto LABEL_8;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PXArrayChangeDetails_PXGDecoratingLayout__changeDetailsShiftedBy_scaledBy___block_invoke;
  aBlock[3] = &unk_1E5DC55D8;
  id v8 = v7;
  id v25 = v8;
  uint64_t v26 = a4;
  uint64_t v27 = a3;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  v10 = [a1 removedIndexes];
  v11 = v9[2](v9, v10);

  v12 = [a1 insertedIndexes];
  v23 = v9[2](v9, v12);

  v13 = [a1 movesToIndexes];
  v22 = v9[2](v9, v13);

  v14 = [a1 changedIndexes];
  v15 = v9[2](v9, v14);

  if ([a1 hasMoves])
  {
    v16 = [a1 movesToIndexes];
    [v16 count];

    [a1 movesFromIndexes];
    PXCreateMutableIntegerArrayRef();
  }
  v18 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v11 insertedIndexes:v23 movesToIndexes:v22 movesFromIndexes:0 changedIndexes:v15];

LABEL_10:
  return v18;
}

@end