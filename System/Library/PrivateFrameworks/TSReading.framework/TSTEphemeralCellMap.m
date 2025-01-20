@interface TSTEphemeralCellMap
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellIDAtIndex:(unint64_t)a3;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellIDs;
- (BOOL)appliesToHidden;
- (BOOL)containsCellID:(id)a3;
- (BOOL)mayModifyFormulasInCells;
- (BOOL)mayModifyValuesReferencedByFormulas;
- (TSTEphemeralCellMap)init;
- (TSTEphemeralCellMap)initWithCapacity:(unint64_t)a3;
- (id)cellAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addCell:(id)a3 andCellID:(id)a4;
- (void)dealloc;
- (void)popLastCell;
- (void)setAppliesToHidden:(BOOL)a3;
- (void)setMayModifyValuesReferencedByFormulas:(BOOL)a3;
@end

@implementation TSTEphemeralCellMap

- (TSTEphemeralCellMap)init
{
  return [(TSTEphemeralCellMap *)self initWithCapacity:1];
}

- (TSTEphemeralCellMap)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTEphemeralCellMap;
  v4 = [(TSTEphemeralCellMap *)&v6 init];
  if (v4)
  {
    v4->mCells = (id *)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    v4->mCellIDs = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0 *)malloc_type_malloc(4 * a3, 0x100004052888210uLL);
    v4->mCapacity = a3;
    v4->mCount = 0;
    v4->mMayModifyValuesReferencedByFormulas = 1;
    v4->mAppliesToHidden = 0;
  }
  return v4;
}

- (void)dealloc
{
  if (self->mCount)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {

      uint64_t v3 = v4;
    }
    while (self->mCount > v4++);
  }
  free(self->mCellIDs);
  free(self->mCells);
  self->mCellIDs = 0;
  self->mCells = 0;
  v6.receiver = self;
  v6.super_class = (Class)TSTEphemeralCellMap;
  [(TSTEphemeralCellMap *)&v6 dealloc];
}

- (unint64_t)count
{
  return self->mCount;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellIDs
{
  return self->mCellIDs;
}

- (BOOL)containsCellID:(id)a3
{
  unint64_t mCount = self->mCount;
  if (!mCount) {
    return 0;
  }
  uint64_t v4 = 0;
  mCellIDs = self->mCellIDs;
  unsigned int v6 = 1;
  while (mCellIDs[v4].var1 != a3.var1 || mCellIDs[v4].var0 != a3.var0)
  {
    uint64_t v4 = v6;
    if (mCount <= v6++) {
      return 0;
    }
  }
  return 1;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellIDAtIndex:(unint64_t)a3
{
  if ([(TSTEphemeralCellMap *)self count] <= a3) {
    return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)0xFFFFFF;
  }
  else {
    return self->mCellIDs[a3];
  }
}

- (id)cellAtIndex:(unint64_t)a3
{
  if ([(TSTEphemeralCellMap *)self count] <= a3) {
    return 0;
  }
  else {
    return self->mCells[a3];
  }
}

- (void)addCell:(id)a3 andCellID:(id)a4
{
  unint64_t mCapacity = self->mCapacity;
  if (mCapacity)
  {
    unint64_t mCount = self->mCount;
    if (mCount == mCapacity)
    {
      self->unint64_t mCapacity = 2 * mCapacity;
      self->mCells = (id *)malloc_type_realloc(self->mCells, 16 * mCapacity, 0x80040B8603338uLL);
      mCellIDs = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0 *)malloc_type_realloc(self->mCellIDs, 4 * self->mCapacity, 0x100004052888210uLL);
      self->mCellIDs = mCellIDs;
      unint64_t mCount = self->mCount;
    }
    else
    {
      mCellIDs = self->mCellIDs;
    }
    mCellIDs[mCount] = a4;
    if (a3) {
      v13 = (void *)[a3 copy];
    }
    else {
      v13 = 0;
    }
    self->mCells[self->mCount++] = v13;
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, *(void *)&a4.var0);
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSTEphemeralCellMap addCell:andCellID:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTEphemeralCellMap.m"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:101 description:@"0 capacity not permitted in nonempty TSTEphemeralCellMap"];
  }
}

- (void)popLastCell
{
  unint64_t mCount = self->mCount;
  if (mCount)
  {
    unint64_t v3 = mCount - 1;
    self->unint64_t mCount = v3;
  }
}

- (BOOL)mayModifyFormulasInCells
{
  return 1;
}

- (BOOL)mayModifyValuesReferencedByFormulas
{
  return self->mMayModifyValuesReferencedByFormulas;
}

- (void)setMayModifyValuesReferencedByFormulas:(BOOL)a3
{
  self->mMayModifyValuesReferencedByFormulas = a3;
}

- (BOOL)appliesToHidden
{
  return self->mAppliesToHidden;
}

- (void)setAppliesToHidden:(BOOL)a3
{
  self->mAppliesToHidden = a3;
}

@end