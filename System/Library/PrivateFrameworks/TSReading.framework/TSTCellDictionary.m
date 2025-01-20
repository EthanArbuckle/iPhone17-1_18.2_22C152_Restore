@interface TSTCellDictionary
- (TSTCellDictionary)init;
- (id)allCells;
- (id)cellAtCellID:(id)a3;
- (void)applyBlockToAllCells:(id)a3;
- (void)dealloc;
- (void)removeAllCells;
- (void)setCell:(id)a3 atCellID:(id)a4;
@end

@implementation TSTCellDictionary

- (TSTCellDictionary)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSTCellDictionary;
  v2 = [(TSTCellDictionary *)&v4 init];
  if (v2)
  {
    v2->mDict = (TSUIntegerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C860]);
    pthread_rwlock_init(&v2->mDictRWLock, 0);
  }
  return v2;
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->mDictRWLock);
  v3.receiver = self;
  v3.super_class = (Class)TSTCellDictionary;
  [(TSTCellDictionary *)&v3 dealloc];
}

- (void)setCell:(id)a3 atCellID:(id)a4
{
}

- (id)cellAtCellID:(id)a3
{
  return TSTCellDictionaryCellAtCellID((uint64_t)self, *(_DWORD *)&a3);
}

- (void)removeAllCells
{
  p_mDictRWLock = &self->mDictRWLock;
  pthread_rwlock_wrlock(&self->mDictRWLock);
  [(TSUIntegerKeyDictionary *)self->mDict removeAllObjects];

  pthread_rwlock_unlock(p_mDictRWLock);
}

- (id)allCells
{
  objc_super v4 = [[TSTEphemeralCellMap alloc] initWithCapacity:1];
  pthread_rwlock_rdlock(&self->mDictRWLock);
  v5 = (void *)[(TSUIntegerKeyDictionary *)self->mDict keyEnumerator];
  uint64_t v6 = [v5 nextKey];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (unint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = [v5 nextKey])
    {
      if (HIDWORD(i))
      {
        v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v11 = [NSString stringWithUTF8String:"-[TSTCellDictionary allCells]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCellDictionary.m"), 63, @"Out-of-bounds type assignment was clamped to max");
        int v9 = -1;
      }
      else
      {
        int v9 = i;
      }
      HIDWORD(v10) = v9;
      LODWORD(v10) = v9;
      unint64_t v2 = v2 & 0xFFFFFFFF00000000 | (v10 >> 16) & 0xFFFFFF;
      [(TSTEphemeralCellMap *)v4 addCell:[(TSUIntegerKeyDictionary *)self->mDict objectForKey:i] andCellID:v2];
    }
  }
  pthread_rwlock_unlock(&self->mDictRWLock);
  return v4;
}

- (void)applyBlockToAllCells:(id)a3
{
  p_mDictRWLock = &self->mDictRWLock;
  pthread_rwlock_wrlock(&self->mDictRWLock);
  uint64_t v6 = (void *)[(TSUIntegerKeyDictionary *)self->mDict keyEnumerator];
  uint64_t v7 = [v6 nextKey];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v7; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v6 nextKey])
      (*((void (**)(id, uint64_t))a3 + 2))(a3, [(TSUIntegerKeyDictionary *)self->mDict objectForKey:i]);
  }

  pthread_rwlock_unlock(p_mDictRWLock);
}

@end