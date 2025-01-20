@interface MFSparseMutable64IndexSet
+ (id)indexSet;
- (BOOL)containsIndex:(unint64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)_insertionPositionOfIndex:(unint64_t)a3;
- (unint64_t)_positionOfIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)firstIndex;
- (unint64_t)indexGreaterThanIndex:(unint64_t)a3;
- (void)_incrementStorageIfNecessaryForCount:(unint64_t)a3;
- (void)addIndex:(unint64_t)a3;
- (void)addIndexes:(id)a3;
- (void)dealloc;
- (void)enumerateIndexesWithBlock:(id)a3;
- (void)removeIndex:(unint64_t)a3;
@end

@implementation MFSparseMutable64IndexSet

+ (id)indexSet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (void)dealloc
{
  storage = self->_storage;
  if (storage) {
    free(storage);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFSparseMutable64IndexSet;
  [(MFSparseMutable64IndexSet *)&v4 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(MFSparseMutable64IndexSet);
  v4->_count = self->_count;
  v4->_storageSize = self->_storageSize;
  v5 = (unint64_t *)malloc_type_calloc(self->_storageSize, 8uLL, 0x100004000313F17uLL);
  v4->_storage = v5;
  memcpy(v5, self->_storage, self->_storageSize);
  return v4;
}

- (void)_incrementStorageIfNecessaryForCount:(unint64_t)a3
{
  self->_cursor = 0;
  if (a3)
  {
    unsigned int storageSize = self->_storageSize;
    int v5 = 10;
    do
    {
      unsigned int v6 = storageSize;
      storageSize += 10;
      v5 -= 10;
    }
    while (self->_count + a3 > v6);
    if (v5)
    {
      if (self->_storage)
      {
        v7 = (unint64_t *)malloc_type_realloc(self->_storage, 8 * v6, 0x100004000313F17uLL);
        if (v7)
        {
LABEL_7:
          self->_storage = v7;
          self->_unsigned int storageSize = storageSize - 10;
          return;
        }
      }
      else
      {
        v7 = (unint64_t *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
        if (v7) {
          goto LABEL_7;
        }
      }
      -[MFSparseMutable64IndexSet _incrementStorageIfNecessaryForCount:]();
    }
  }
}

- (unint64_t)_positionOfIndex:(unint64_t)a3
{
  unint64_t __key = a3;
  objc_super v4 = bsearch_b(&__key, self->_storage, self->_count, 8uLL, &__block_literal_global_19);
  if (v4) {
    return (int64_t)((uint64_t)v4 - (unint64_t)self->_storage) >> 3;
  }
  else {
    return -1;
  }
}

uint64_t __46__MFSparseMutable64IndexSet__positionOfIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

- (unint64_t)_insertionPositionOfIndex:(unint64_t)a3
{
  unint64_t __key = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  storage = self->_storage;
  size_t count = self->_count;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__MFSparseMutable64IndexSet__insertionPositionOfIndex___block_invoke;
  v9[3] = &unk_1E68678F0;
  v9[4] = &v10;
  if (bsearch_b(&__key, storage, count, 8uLL, v9))
  {
    unint64_t v6 = -1;
  }
  else
  {
    v7 = (unint64_t *)v11[3];
    if (v7)
    {
      if (__key <= *v7) {
        unint64_t v6 = v7 - self->_storage;
      }
      else {
        unint64_t v6 = v7 - self->_storage + 1;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __55__MFSparseMutable64IndexSet__insertionPositionOfIndex___block_invoke(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  BOOL v5 = v3 >= v4;
  BOOL v6 = v3 > v4;
  if (v5) {
    return v6;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

- (void)addIndex:(unint64_t)a3
{
  unint64_t v5 = -[MFSparseMutable64IndexSet _insertionPositionOfIndex:](self, "_insertionPositionOfIndex:");
  if (v5 != -1)
  {
    unint64_t v6 = v5;
    [(MFSparseMutable64IndexSet *)self _incrementStorageIfNecessaryForCount:1];
    memmove(&self->_storage[v6 + 1], &self->_storage[v6], 8 * (self->_count - v6));
    self->_storage[v6] = a3;
    ++self->_count;
  }
}

- (void)addIndexes:(id)a3
{
  if ([a3 count])
  {
    -[MFSparseMutable64IndexSet _incrementStorageIfNecessaryForCount:](self, "_incrementStorageIfNecessaryForCount:", [a3 count]);
    uint64_t v5 = [a3 firstIndex];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = v5; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [a3 indexGreaterThanIndex:i])
        [(MFSparseMutable64IndexSet *)self addIndex:i];
    }
  }
}

- (void)removeIndex:(unint64_t)a3
{
  unint64_t v4 = [(MFSparseMutable64IndexSet *)self _positionOfIndex:a3];
  if (v4 != -1)
  {
    uint64_t count = self->_count;
    uint64_t v6 = (count - 1);
    if (v4 != v6)
    {
      memmove(&self->_storage[v4], &self->_storage[v4 + 1], 8 * (count + ~v4));
      LODWORD(v6) = self->_count - 1;
    }
    self->_uint64_t count = v6;
  }
  [(MFSparseMutable64IndexSet *)self _garbageCollectStorageIfNecessary];
}

- (BOOL)containsIndex:(unint64_t)a3
{
  return [(MFSparseMutable64IndexSet *)self _positionOfIndex:a3] != -1;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)firstIndex
{
  self->_cursor = 0;
  if (self->_count) {
    return *self->_storage;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)indexGreaterThanIndex:(unint64_t)a3
{
  uint64_t cursor = self->_cursor;
  uint64_t count = self->_count;
  if (cursor) {
    BOOL v5 = cursor >= count;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    unsigned int v6 = 0;
  }
  else if (self->_storage[cursor] < a3)
  {
    unsigned int v6 = cursor + 1;
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (v6 >= count) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  while (1)
  {
    unint64_t v8 = self->_storage[v7];
    if (v8 > a3) {
      break;
    }
    if (count == ++v7) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  self->_uint64_t cursor = v7;
  return v8;
}

- (void)enumerateIndexesWithBlock:(id)a3
{
  char v7 = 0;
  unint64_t v5 = [(MFSparseMutable64IndexSet *)self firstIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = v5;
          i != 0x7FFFFFFFFFFFFFFFLL;
          unint64_t i = [(MFSparseMutable64IndexSet *)self indexGreaterThanIndex:i])
    {
      (*((void (**)(id, unint64_t, char *))a3 + 2))(a3, i, &v7);
      if (v7) {
        break;
      }
    }
  }
}

- (id)description
{
  unint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p> [", objc_opt_class(), self];
  if (self->_storageSize)
  {
    unint64_t v4 = 0;
    do
    {
      if (v4 >= self->_count) {
        objc_msgSend(v3, "appendFormat:", @"X,", v6);
      }
      else {
        objc_msgSend(v3, "appendFormat:", @"%llu,", self->_storage[v4]);
      }
      ++v4;
    }
    while (v4 < self->_storageSize);
  }
  [v3 appendString:@"]"];
  return v3;
}

- (void)_incrementStorageIfNecessaryForCount:.cold.1()
{
}

@end