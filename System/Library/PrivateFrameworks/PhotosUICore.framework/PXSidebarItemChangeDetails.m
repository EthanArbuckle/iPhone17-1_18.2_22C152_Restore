@interface PXSidebarItemChangeDetails
+ (void)makeArrayIndexMovesIncremental:(id *)a3 count:(unint64_t)a4;
- (BOOL)hasContentChanges;
- (BOOL)hasMoves;
- (BOOL)needsReload;
- (NSArray)changedItems;
- (NSArray)removedItems;
- (NSIndexSet)insertedIndexes;
- (NSIndexSet)removedIndexes;
- (PXArrayChangeDetails)arrayChangeDetails;
- (PXDataSection)previousDataSection;
- (PXSidebarItemChangeDetails)initWithArrayChangeDetails:(id)a3 previousDataSection:(id)a4;
- (id)changedIndexes;
- (id)description;
- (void)enumerateMovedIndexesUsingBlock:(id)a3;
@end

@implementation PXSidebarItemChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedItems, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_previousDataSection, 0);
  objc_storeStrong((id *)&self->_arrayChangeDetails, 0);
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (BOOL)hasContentChanges
{
  return self->_hasContentChanges;
}

- (NSArray)changedItems
{
  return self->_changedItems;
}

- (NSArray)removedItems
{
  return self->_removedItems;
}

- (PXDataSection)previousDataSection
{
  return self->_previousDataSection;
}

- (PXArrayChangeDetails)arrayChangeDetails
{
  return self->_arrayChangeDetails;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PXSidebarItemChangeDetails needsReload](self, "needsReload"));
  v6 = [(PXSidebarItemChangeDetails *)self removedIndexes];
  v7 = objc_msgSend(v6, "px_shortDescription");
  v8 = [(PXSidebarItemChangeDetails *)self insertedIndexes];
  v9 = objc_msgSend(v8, "px_shortDescription");
  v10 = [(PXSidebarItemChangeDetails *)self changedIndexes];
  v11 = objc_msgSend(v10, "px_shortDescription");
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; needsReload:%@ removed:%@ inserted:%@ changed:%@>",
    v4,
    self,
    v5,
    v7,
    v9,
  v12 = v11);

  return v12;
}

- (void)enumerateMovedIndexesUsingBlock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXSidebarItemChangeDetails *)self arrayChangeDetails];
  v6 = [v5 movesToIndexes];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v18 = [v6 firstIndex];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke;
  v14[3] = &unk_1E5DBF6C8;
  v14[4] = &v19;
  v14[5] = &v15;
  [v6 enumerateIndexesUsingBlock:v14];
  uint64_t v7 = [v6 count];
  uint64_t v8 = v20[3] + v7;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v9 = [v6 firstIndex];
  v16[3] = v9;
  v10 = [(PXSidebarItemChangeDetails *)self arrayChangeDetails];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke_2;
  v12[3] = &unk_1E5DB6578;
  v12[4] = &v15;
  v12[5] = v13;
  v12[6] = &v12[-2 * v8];
  [v10 enumerateMovedIndexesUsingBlock:v12];

  [(id)objc_opt_class() makeArrayIndexMovesIncremental:&v12[-2 * v8] count:v8];
  if (v8)
  {
    v11 = &v12[-2 * v8 + 1];
    do
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, *(v11 - 1), *v11);
      v11 += 2;
      --v8;
    }
    while (v8);
  }
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

uint64_t __62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a2
                                                                   - *(void *)(*(void *)(*(void *)(result + 40)
                                                                                           + 8)
                                                                               + 24);
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2 + 1;
  return result;
}

void *__62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke_2(void *result, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(result[4] + 8) + 24);
  uint64_t v4 = result[6];
  while (v3 < a3)
  {
    *(int64x2_t *)(v4 + 16 * (*(void *)(*(void *)(result[5] + 8) + 24))++) = vdupq_n_s64(v3);
    unint64_t v3 = ++*(void *)(*(void *)(result[4] + 8) + 24);
  }
  v5 = (void *)(v4 + 16 * *(void *)(*(void *)(result[5] + 8) + 24));
  void *v5 = a2;
  v5[1] = a3;
  ++*(void *)(*(void *)(result[5] + 8) + 24);
  ++*(void *)(*(void *)(result[4] + 8) + 24);
  return result;
}

- (BOOL)hasMoves
{
  v2 = [(PXSidebarItemChangeDetails *)self arrayChangeDetails];
  char v3 = [v2 hasMoves];

  return v3;
}

- (id)changedIndexes
{
  v2 = [(PXSidebarItemChangeDetails *)self arrayChangeDetails];
  char v3 = [v2 changedIndexes];

  return v3;
}

- (NSIndexSet)insertedIndexes
{
  v2 = [(PXSidebarItemChangeDetails *)self arrayChangeDetails];
  char v3 = [v2 insertedIndexes];

  return (NSIndexSet *)v3;
}

- (NSIndexSet)removedIndexes
{
  v2 = [(PXSidebarItemChangeDetails *)self arrayChangeDetails];
  char v3 = [v2 removedIndexes];

  return (NSIndexSet *)v3;
}

- (PXSidebarItemChangeDetails)initWithArrayChangeDetails:(id)a3 previousDataSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PXSidebarItemChangeDetails;
  uint64_t v9 = [(PXSidebarItemChangeDetails *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_arrayChangeDetails, a3);
    objc_storeStrong((id *)&v10->_previousDataSection, a4);
    v11 = [v7 removedIndexes];
    if ([v11 count])
    {
      v10->_hasContentChanges = 1;
      p_hasContentChanges = &v10->_hasContentChanges;
    }
    else
    {
      v13 = [v7 insertedIndexes];
      v10->_hasContentChanges = [v13 count] != 0;
      p_hasContentChanges = &v10->_hasContentChanges;
    }
    if (*p_hasContentChanges && ([v7 hasMoves] & 1) != 0) {
      LOBYTE(v14) = 1;
    }
    else {
      int v14 = [v7 hasIncrementalChanges] ^ 1;
    }
    v10->_needsReload = v14;
    uint64_t v15 = [v7 removedIndexes];
    uint64_t v16 = [v8 objectsAtIndexes:v15];
    removedItems = v10->_removedItems;
    v10->_removedItems = (NSArray *)v16;

    uint64_t v18 = [v7 changedIndexes];
    uint64_t v19 = [v7 indexSetAfterRevertingChangesToIndexSet:v18];
    uint64_t v20 = [v8 objectsAtIndexes:v19];
    changedItems = v10->_changedItems;
    v10->_changedItems = (NSArray *)v20;
  }
  return v10;
}

+ (void)makeArrayIndexMovesIncremental:(id *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = 0;
    unint64_t v5 = a4 - 1;
    for (i = a3 + 1; ; ++i)
    {
      id v7 = &a3[v4];
      unint64_t var0 = v7->var0;
      unint64_t var1 = v7->var1;
      ++v4;
      if (var0 != var1 && v4 < a4) {
        break;
      }
LABEL_22:
      --v5;
      if (v4 == a4) {
        return;
      }
    }
    v11 = i;
    unint64_t v12 = v5;
    while (1)
    {
      unint64_t v13 = v11->var0;
      if (var0 >= var1)
      {
        if (v13 > var0 || v13 < var1) {
          goto LABEL_21;
        }
        uint64_t v15 = 1;
      }
      else
      {
        if (v13 < var0 || v13 > var1) {
          goto LABEL_21;
        }
        uint64_t v15 = -1;
      }
      v11->unint64_t var0 = v13 + v15;
LABEL_21:
      ++v11;
      if (!--v12) {
        goto LABEL_22;
      }
    }
  }
}

@end