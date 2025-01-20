@interface TSUUUIDSetStore
- (BOOL)containsUuidSet:(id)a3;
- (TSUUUIDSetStore)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)indexesUsingAnyOfUuids:(const void *)a3;
- (id)indexesUsingUuid:(const void *)a3;
- (id)setForIndex:(unsigned int)a3;
- (id)subsetStoreForIndexes:(id)a3;
- (unint64_t)count;
- (unsigned)addSet:(id)a3;
- (unsigned)addSetForSingleUuid:(const void *)a3;
- (unsigned)addSetForUuids:(const void *)a3;
- (unsigned)indexOfSet:(id)a3;
- (void)_foreachUuidSet:(id)a3;
- (void)foreachUuidSet:(id)a3;
- (void)p_addSet:(id)a3 atIndex:(unsigned int)a4;
- (void)removeSetAtIndex:(unsigned int)a3;
@end

@implementation TSUUUIDSetStore

- (TSUUUIDSetStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)TSUUUIDSetStore;
  v2 = [(TSUUUIDSetStore *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uuidSetForIndex = v2->_uuidSetForIndex;
    v2->_uuidSetForIndex = (TSUSparseArray *)v3;

    uint64_t v5 = objc_opt_new();
    indexesUsingUuid = v2->_indexesUsingUuid;
    v2->_indexesUsingUuid = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    lock = v2->_lock;
    v2->_lock = (NSLock *)v7;
  }
  return v2;
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__20;
  objc_super v10 = __Block_byref_object_dispose__20;
  id v11 = (id)objc_opt_new();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__TSUUUIDSetStore_description__block_invoke;
  v5[3] = &unk_264D61F60;
  v5[4] = &v6;
  [(TSUUUIDSetStore *)self foreachUuidSet:v5];
  uint64_t v3 = [NSString stringWithFormat:@"%@<%p>:\n %@", objc_opt_class(), self, v7[5]];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __30__TSUUUIDSetStore_description__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:@"[%lu] = %@\n", a3, a2];
}

- (unsigned)addSet:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    LODWORD(v5) = [(TSUUUIDSetStore *)self indexOfSet:v4];
    if (!v5)
    {
      unsigned int highestIndex = self->_highestIndex;
      uint64_t v5 = highestIndex + 1;
      self->_unsigned int highestIndex = v5;
      if (highestIndex == -1)
      {
        uint64_t v7 = [NSString stringWithUTF8String:"-[TSUUUIDSetStore addSet:]"];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 70, 0, "We just rolled over uuidSet indexes, we shouldn't use that many in one collab session.");

        +[OITSUAssertionHandler logBacktraceThrottled];
        if (self->_highestIndex)
        {
          uint64_t v5 = 0;
        }
        else
        {
          uint64_t v5 = 1;
          self->_unsigned int highestIndex = 1;
        }
      }
      [(TSUUUIDSetStore *)self p_addSet:v4 atIndex:v5];
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (unsigned)addSetForUuids:(const void *)a3
{
  if (*((void *)a3 + 1) == *(void *)a3) {
    return 0;
  }
  id v4 = [[TSUUUIDSet alloc] initWithUUIDVector:a3];
  unsigned int v5 = [(TSUUUIDSetStore *)self addSet:v4];

  return v5;
}

- (void)p_addSet:(id)a3 atIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && v4)
  {
    if ([v6 index] && objc_msgSend(v7, "index") != v4)
    {
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSUUUIDSetStore p_addSet:atIndex:]"];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm"];
      uint64_t v10 = objc_opt_class();
      +[OITSUAssertionHandler handleFailureInFunction:v8, v9, 94, 0, "Is this %@ in two %@ instances - that won't work, they each need to set its internal index value.", v10, objc_opt_class() file lineNumber isFatal description];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    [v7 setIndex:v4];
    TSULocker::TSULocker((TSULocker *)&v13, self->_lock);
    [(TSUSparseArray *)self->_uuidSetForIndex setObject:v7 forKey:v4];
    if (self->_highestIndex < v4) {
      self->_unsigned int highestIndex = v4;
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__TSUUUIDSetStore_p_addSet_atIndex___block_invoke;
    v11[3] = &unk_264D61F88;
    v11[4] = self;
    int v12 = v4;
    [v7 foreachUuid:v11];
    TSULocker::~TSULocker(&v13);
  }
}

void __36__TSUUUIDSetStore_p_addSet_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a2];
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKey:");
  if (!v3)
  {
    uint64_t v3 = objc_opt_new();
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setObject:forKey:");
  }
  [v3 addIndex:*(unsigned int *)(a1 + 40)];
}

- (void)removeSetAtIndex:(unsigned int)a3
{
  TSULocker::TSULocker((TSULocker *)&v5, self->_lock);
  if (a3) {
    [(TSUSparseArray *)self->_uuidSetForIndex setObject:0 forKey:a3];
  }
  TSULocker::~TSULocker(&v5);
}

- (id)setForIndex:(unsigned int)a3
{
  TSULocker::TSULocker((TSULocker *)&v7, self->_lock);
  if (a3)
  {
    id v5 = [(TSUSparseArray *)self->_uuidSetForIndex objectForKey:a3];
  }
  else
  {
    id v5 = 0;
  }
  TSULocker::~TSULocker(&v7);
  return v5;
}

- (unsigned)indexOfSet:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__20;
    v15 = __Block_byref_object_dispose__20;
    id v16 = 0;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __30__TSUUUIDSetStore_indexOfSet___block_invoke;
    v10[3] = &unk_264D616A8;
    v10[4] = self;
    v10[5] = &v11;
    [v4 foreachUuid:v10];
    if ([(id)v12[5] count] && (uint64_t v6 = objc_msgSend((id)v12[5], "firstIndex"), v6 != 0x7FFFFFFFFFFFFFFFLL))
    {
      do
      {
        uint64_t v8 = [(TSUUUIDSetStore *)self setForIndex:v6];
        if ([v8 isEqual:v5])
        {
          unsigned int v7 = v6;
        }
        else
        {
          uint64_t v6 = [(id)v12[5] indexGreaterThanIndex:v6];
          unsigned int v7 = 0;
        }
      }
      while (!v7 && v6 != 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      unsigned int v7 = 0;
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

void __30__TSUUUIDSetStore_indexOfSet___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v11 = [*(id *)(a1 + 32) indexesUsingUuid:a2];
  if (![v11 count]) {
    goto LABEL_9;
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    uint64_t v9 = [v11 mutableCopy];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
    goto LABEL_11;
  }
  for (uint64_t i = [v5 firstIndex];
        i != 0x7FFFFFFFFFFFFFFFLL;
        uint64_t i = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) indexGreaterThanIndex:i])
  {
    if (([v11 containsIndex:i] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeIndex:i];
    }
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
LABEL_9:
    *a3 = 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
LABEL_11:
  }
}

- (BOOL)containsUuidSet:(id)a3
{
  return [(TSUUUIDSetStore *)self indexOfSet:a3] != 0;
}

- (id)indexesUsingUuid:(const void *)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  TSULocker::TSULocker((TSULocker *)&v7, self->_lock);
  id v5 = [(NSMutableDictionary *)self->_indexesUsingUuid objectForKey:v4];
  TSULocker::~TSULocker(&v7);

  return v5;
}

- (id)indexesUsingAnyOfUuids:(const void *)a3
{
  id v5 = [MEMORY[0x263F089C8] indexSet];
  TSULocker::TSULocker((TSULocker *)&v11, self->_lock);
  uint64_t v6 = *(void *)a3;
  uint64_t v7 = *((void *)a3 + 1);
  if (*(void *)a3 != v7)
  {
    do
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v6];
      uint64_t v9 = [(NSMutableDictionary *)self->_indexesUsingUuid objectForKey:v8];
      [v5 addIndexes:v9];

      v6 += 16;
    }
    while (v6 != v7);
  }
  TSULocker::~TSULocker(&v11);
  return v5;
}

- (void)_foreachUuidSet:(id)a3
{
  id v4 = a3;
  uuidSetForIndex = self->_uuidSetForIndex;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__TSUUUIDSetStore__foreachUuidSet___block_invoke;
  v7[3] = &unk_264D61FB0;
  id v8 = v4;
  id v6 = v4;
  [(TSUSparseArray *)uuidSetForIndex foreach:v7];
}

uint64_t __35__TSUUUIDSetStore__foreachUuidSet___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)subsetStoreForIndexes:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  TSULocker::TSULocker((TSULocker *)&v14, self->_lock);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__TSUUUIDSetStore_subsetStoreForIndexes___block_invoke;
  v11[3] = &unk_264D61FD8;
  id v6 = v4;
  id v12 = v6;
  id v7 = v5;
  id v13 = v7;
  [(TSUUUIDSetStore *)self _foreachUuidSet:v11];
  id v8 = v13;
  id v9 = v7;

  TSULocker::~TSULocker(&v14);
  return v9;
}

void __41__TSUUUIDSetStore_subsetStoreForIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsIndex:a3]) {
    objc_msgSend(*(id *)(a1 + 40), "p_addSet:atIndex:", v5, a3);
  }
}

- (void)foreachUuidSet:(id)a3
{
  id v4 = a3;
  TSULocker::TSULocker((TSULocker *)&v5, self->_lock);
  [(TSUUUIDSetStore *)self _foreachUuidSet:v4];
  TSULocker::~TSULocker(&v5);
}

- (unint64_t)count
{
  return [(TSUSparseArray *)self->_uuidSetForIndex count];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  TSULocker::TSULocker((TSULocker *)&v9, self->_lock);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__TSUUUIDSetStore_copyWithZone___block_invoke;
  v7[3] = &unk_264D62000;
  id v5 = v4;
  id v8 = v5;
  [(TSUUUIDSetStore *)self _foreachUuidSet:v7];

  TSULocker::~TSULocker(&v9);
  return v5;
}

uint64_t __32__TSUUUIDSetStore_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_addSet:atIndex:", a2, a3);
}

- (unsigned)addSetForSingleUuid:(const void *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  id v5 = -[TSUUUIDSetStore indexesUsingUuid:](self, "indexesUsingUuid:");
  if ([v5 count])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__TSUUUIDSetStore_addSetForSingleUuid___block_invoke;
    v10[3] = &unk_264D62028;
    v10[4] = self;
    v10[5] = &v11;
    void v10[6] = a3;
    [v5 enumerateIndexesUsingBlock:v10];
  }
  unsigned int v6 = *((_DWORD *)v12 + 6);
  if (!v6)
  {
    id v7 = [[TSUUUIDSet alloc] initWithUUID:a3];
    unsigned int v8 = [(TSUUUIDSetStore *)self addSet:v7];
    *((_DWORD *)v12 + 6) = v8;

    unsigned int v6 = *((_DWORD *)v12 + 6);
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __39__TSUUUIDSetStore_addSetForSingleUuid___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v4 = a2;
  id v9 = [*(id *)(a1 + 32) setForIndex:a2];
  if ([v9 count] == 1)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
    *a3 = 1;
    if (([v9 containsUuid:v6] & 1) == 0)
    {
      id v7 = [NSString stringWithUTF8String:"-[TSUUUIDSetStore addSetForSingleUuid:]_block_invoke"];
      unsigned int v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 276, 0, "Oh no, -[%@ indexesUsingUuid:] is broken.", objc_opt_class());

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesUsingUuid, 0);
  objc_storeStrong((id *)&self->_uuidSetForIndex, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end