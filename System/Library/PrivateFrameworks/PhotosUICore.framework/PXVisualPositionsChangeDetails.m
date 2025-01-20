@interface PXVisualPositionsChangeDetails
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorIndexAfterChanges:(int64_t)a6 anchorFan:(int64_t)a7;
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorIndexAfterChanges:(int64_t)a6 anchorFan:(int64_t)a7 anchorReload:(int64_t)a8;
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorRemoved:(int64_t)a6 indexAfterChanges:(int64_t)a7;
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorFan:(int64_t)a9 anchorReload:(int64_t)a10;
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 reloadAllIncludingAnchor:(BOOL)a9;
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorRemoved:(int64_t)a7 indexAfterChanges:(int64_t)a8 headerIndexesAfterChanges:(id)a9;
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorInserted:(int64_t)a4 indexBeforeChanges:(int64_t)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7;
+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorInserted:(int64_t)a4 indexBeforeChanges:(int64_t)a5 headerIndexesBeforeChanges:(id)a6 countAfterChanges:(int64_t)a7 anchorIndexAfterChanges:(int64_t)a8 headerIndexesAfterChanges:(id)a9;
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3;
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3;
- ($5E4061BE7C3C8BB942C4587960135C41)visualPositionAfterApplyingChangesToIndex:(SEL)a3;
- ($5E4061BE7C3C8BB942C4587960135C41)visualPositionAfterRevertingChangesFromIndex:(SEL)a3;
- (NSIndexSet)headerIndexesAfterChanges;
- (NSIndexSet)headerIndexesBeforeChanges;
- (PXVisualPositionsChangeDetails)init;
- (PXVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8;
- (id)arrayChangeDetailsWithItemsChanged:(BOOL)a3;
- (int64_t)anchorBodyIndexAfterChanges;
- (int64_t)anchorBodyIndexBeforeChanges;
- (int64_t)anchorIndexAfterChanges;
- (int64_t)anchorIndexBeforeChanges;
- (int64_t)countAfterChanges;
- (int64_t)countBeforeChanges;
@end

@implementation PXVisualPositionsChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIndexesAfterChanges, 0);
  objc_storeStrong((id *)&self->_headerIndexesBeforeChanges, 0);
}

- (int64_t)anchorBodyIndexAfterChanges
{
  return self->_anchorBodyIndexAfterChanges;
}

- (int64_t)anchorBodyIndexBeforeChanges
{
  return self->_anchorBodyIndexBeforeChanges;
}

- (NSIndexSet)headerIndexesAfterChanges
{
  return self->_headerIndexesAfterChanges;
}

- (int64_t)anchorIndexAfterChanges
{
  return self->_anchorIndexAfterChanges;
}

- (int64_t)countAfterChanges
{
  return self->_countAfterChanges;
}

- (NSIndexSet)headerIndexesBeforeChanges
{
  return self->_headerIndexesBeforeChanges;
}

- (int64_t)anchorIndexBeforeChanges
{
  return self->_anchorIndexBeforeChanges;
}

- (int64_t)countBeforeChanges
{
  return self->_countBeforeChanges;
}

- (id)arrayChangeDetailsWithItemsChanged:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v7 = [(PXVisualPositionsChangeDetails *)self countBeforeChanges];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      [(PXVisualPositionsChangeDetails *)self visualPositionAfterApplyingChangesToIndex:i];
      if (!v17) {
        [v5 addIndex:i];
      }
    }
  }
  uint64_t v10 = [(PXVisualPositionsChangeDetails *)self countAfterChanges];
  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
    {
      [(PXVisualPositionsChangeDetails *)self visualPositionAfterRevertingChangesFromIndex:j];
      if (!v16) {
        [v6 addIndex:j];
      }
    }
  }
  if (a3)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, -[PXVisualPositionsChangeDetails countAfterChanges](self, "countAfterChanges"));
    [v13 removeIndexes:v6];
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v5 insertedIndexes:v6 movesToIndexes:0 movesFromIndexes:0 changedIndexes:v13];

  return v14;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a3, self, @"PXVisualPositionsChangeDetails.m", 168, @"Method %s is a responsibility of subclass %@", "-[PXVisualPositionsChangeDetails bodyVisualPositionAfterRevertingChangesFromBodyIndex:]", v8 object file lineNumber description];

  abort();
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4);
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a3, self, @"PXVisualPositionsChangeDetails.m", 164, @"Method %s is a responsibility of subclass %@", "-[PXVisualPositionsChangeDetails bodyVisualPositionAfterApplyingChangesToBodyIndex:]", v8 object file lineNumber description];

  abort();
}

- ($5E4061BE7C3C8BB942C4587960135C41)visualPositionAfterRevertingChangesFromIndex:(SEL)a3
{
  retstr->int64_t var0 = 0;
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
  uint64_t v7 = [(PXVisualPositionsChangeDetails *)self headerIndexesAfterChanges];
  uint64_t v8 = v7;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)&retstr->var2 = 0;
    *(_OWORD *)&retstr->int64_t var0 = PXVisualPositionNull;
  }
  else if ([v7 containsIndex:a4])
  {
    [(PXVisualPositionsChangeDetails *)self visualPositionAfterRevertingChangesFromIndex:a4 + 1];
    *(_OWORD *)&retstr->int64_t var0 = v17;
    retstr->var1 = 1;
    *(void *)&retstr->var2 = v18;
    retstr->var2 = 0;
  }
  else
  {
    -[PXVisualPositionsChangeDetails bodyVisualPositionAfterRevertingChangesFromBodyIndex:](self, "bodyVisualPositionAfterRevertingChangesFromBodyIndex:", a4 - objc_msgSend(v8, "countOfIndexesInRange:", 0, a4));
    *(_OWORD *)&retstr->int64_t var0 = v17;
    *(void *)&retstr->var2 = v18;
    int64_t var0 = retstr->var0;
    uint64_t v10 = [(PXVisualPositionsChangeDetails *)self headerIndexesBeforeChanges];
    int64_t v11 = var0;
    if ((unint64_t)var0 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t v12 = -1;
      uint64_t v13 = -1;
      do
      {
        int64_t v11 = var0 - v13 + v12;
        uint64_t v14 = [v10 countOfIndexesInRange:v12 + 1];
        uint64_t v13 = var0 - v14;
        uint64_t v12 = v11;
      }
      while (var0 - v14 < var0);
    }
    retstr->int64_t var0 = v11;

    BOOL v15 = (v11 & 0x8000000000000000) == 0
       && v11 < [(PXVisualPositionsChangeDetails *)self countBeforeChanges];
    retstr->var2 &= v15;
  }

  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)visualPositionAfterApplyingChangesToIndex:(SEL)a3
{
  retstr->int64_t var0 = 0;
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
  uint64_t v7 = [(PXVisualPositionsChangeDetails *)self headerIndexesBeforeChanges];
  uint64_t v8 = v7;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)&retstr->var2 = 0;
    *(_OWORD *)&retstr->int64_t var0 = PXVisualPositionNull;
  }
  else if ([v7 containsIndex:a4])
  {
    [(PXVisualPositionsChangeDetails *)self visualPositionAfterApplyingChangesToIndex:a4 + 1];
    *(_OWORD *)&retstr->int64_t var0 = v17;
    retstr->var1 = 1;
    *(void *)&retstr->var2 = v18;
    retstr->var2 = 0;
  }
  else
  {
    -[PXVisualPositionsChangeDetails bodyVisualPositionAfterApplyingChangesToBodyIndex:](self, "bodyVisualPositionAfterApplyingChangesToBodyIndex:", a4 - objc_msgSend(v8, "countOfIndexesInRange:", 0, a4));
    *(_OWORD *)&retstr->int64_t var0 = v17;
    *(void *)&retstr->var2 = v18;
    int64_t var0 = retstr->var0;
    uint64_t v10 = [(PXVisualPositionsChangeDetails *)self headerIndexesAfterChanges];
    int64_t v11 = var0;
    if ((unint64_t)var0 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t v12 = -1;
      uint64_t v13 = -1;
      do
      {
        int64_t v11 = var0 - v13 + v12;
        uint64_t v14 = [v10 countOfIndexesInRange:v12 + 1];
        uint64_t v13 = var0 - v14;
        uint64_t v12 = v11;
      }
      while (var0 - v14 < var0);
    }
    retstr->int64_t var0 = v11;

    BOOL v15 = (v11 & 0x8000000000000000) == 0
       && v11 < [(PXVisualPositionsChangeDetails *)self countAfterChanges];
    retstr->var2 &= v15;
  }

  return result;
}

- (PXVisualPositionsChangeDetails)init
{
  return [(PXVisualPositionsChangeDetails *)self initWithCountBeforeChanges:0 anchorIndexBeforeChanges:0x7FFFFFFFFFFFFFFFLL headerIndexesBeforeChanges:0 countAfterChanges:0 anchorIndexAfterChanges:0x7FFFFFFFFFFFFFFFLL headerIndexesAfterChanges:0];
}

- (PXVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PXVisualPositionsChangeDetails;
  char v16 = [(PXVisualPositionsChangeDetails *)&v25 init];
  long long v17 = v16;
  if (v16)
  {
    v16->_countBeforeChanges = a3;
    v16->_int64_t anchorIndexBeforeChanges = a4;
    uint64_t v18 = [v14 copy];
    headerIndexesBeforeChanges = v17->_headerIndexesBeforeChanges;
    v17->_headerIndexesBeforeChanges = (NSIndexSet *)v18;

    v17->_countAfterChanges = a6;
    v17->_int64_t anchorIndexAfterChanges = a7;
    uint64_t v20 = [v15 copy];
    headerIndexesAfterChanges = v17->_headerIndexesAfterChanges;
    v17->_headerIndexesAfterChanges = (NSIndexSet *)v20;

    int64_t anchorIndexBeforeChanges = v17->_anchorIndexBeforeChanges;
    v17->_anchorBodyIndexBeforeChanges = anchorIndexBeforeChanges
                                       - -[NSIndexSet countOfIndexesInRange:](v17->_headerIndexesBeforeChanges, "countOfIndexesInRange:", 0, anchorIndexBeforeChanges);
    int64_t anchorIndexAfterChanges = v17->_anchorIndexAfterChanges;
    v17->_anchorBodyIndexAfterChanges = anchorIndexAfterChanges
                                      - -[NSIndexSet countOfIndexesInRange:](v17->_headerIndexesAfterChanges, "countOfIndexesInRange:", 0, anchorIndexAfterChanges);
  }

  return v17;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 reloadAllIncludingAnchor:(BOOL)a9
{
  id v14 = a8;
  id v15 = a5;
  LOBYTE(v18) = a9;
  char v16 = [[PXReloadingVisualPositionsChangeDetails alloc] initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:v15 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:v14 reloadAllIncludingAnchor:v18];

  return (PXVisualPositionsChangeDetails *)v16;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorRemoved:(int64_t)a7 indexAfterChanges:(int64_t)a8 headerIndexesAfterChanges:(id)a9
{
  id v15 = a9;
  id v16 = a5;
  LOBYTE(v19) = 0;
  long long v17 = [[PXAnchorInsertingOrRemovingVisualPositionsChangeDetails alloc] initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:v16 countAfterChanges:a6 anchorIndexAfterChanges:a8 headerIndexesAfterChanges:v15 anchorInserted:v19 relativePosition:a7];

  return (PXVisualPositionsChangeDetails *)v17;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorRemoved:(int64_t)a6 indexAfterChanges:(int64_t)a7
{
  return (PXVisualPositionsChangeDetails *)[a1 changeDetailsWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:0 countAfterChanges:a5 anchorRemoved:a6 indexAfterChanges:a7 headerIndexesAfterChanges:0];
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorInserted:(int64_t)a4 indexBeforeChanges:(int64_t)a5 headerIndexesBeforeChanges:(id)a6 countAfterChanges:(int64_t)a7 anchorIndexAfterChanges:(int64_t)a8 headerIndexesAfterChanges:(id)a9
{
  id v15 = a9;
  id v16 = a6;
  LOBYTE(v19) = 1;
  long long v17 = [[PXAnchorInsertingOrRemovingVisualPositionsChangeDetails alloc] initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a5 headerIndexesBeforeChanges:v16 countAfterChanges:a7 anchorIndexAfterChanges:a8 headerIndexesAfterChanges:v15 anchorInserted:v19 relativePosition:a4];

  return (PXVisualPositionsChangeDetails *)v17;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorInserted:(int64_t)a4 indexBeforeChanges:(int64_t)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7
{
  return (PXVisualPositionsChangeDetails *)[a1 changeDetailsWithCountBeforeChanges:a3 anchorInserted:a4 indexBeforeChanges:a5 headerIndexesBeforeChanges:0 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:0];
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorFan:(int64_t)a9 anchorReload:(int64_t)a10
{
  id v15 = a8;
  id v16 = a5;
  long long v17 = [[PXFanningVisualPositionsChangeDetails alloc] initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:v16 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:v15 anchorFan:a9 anchorReload:a10];

  return (PXVisualPositionsChangeDetails *)v17;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorIndexAfterChanges:(int64_t)a6 anchorFan:(int64_t)a7
{
  return (PXVisualPositionsChangeDetails *)[a1 changeDetailsWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 countAfterChanges:a5 anchorIndexAfterChanges:a6 anchorFan:a7 anchorReload:0];
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorIndexAfterChanges:(int64_t)a6 anchorFan:(int64_t)a7 anchorReload:(int64_t)a8
{
  return (PXVisualPositionsChangeDetails *)[a1 changeDetailsWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:0 countAfterChanges:a5 anchorIndexAfterChanges:a6 headerIndexesAfterChanges:0 anchorFan:a7 anchorReload:a8];
}

@end