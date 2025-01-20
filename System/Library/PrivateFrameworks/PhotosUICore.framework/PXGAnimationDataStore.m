@interface PXGAnimationDataStore
- ($437E010E64063884B87806755542A2AA)spriteInfos;
- ($5DCE149552560A4ED0B95FAFFDAC89D8)groupInfos;
- (NSIndexSet)activeGroupIndexes;
- (NSString)diagnosticDescription;
- (PXGAnimationDataStore)init;
- (id)spriteIndexesExpiringAtTime:(double)a3;
- (unsigned)animationIndexBySpriteIndex;
- (unsigned)checkOutGroup;
- (unsigned)groupIndexByAnimationIndex;
- (unsigned)mappedAnimationCount;
- (unsigned)mappedSpriteCount;
- (unsigned)spriteCount;
- (void)_resizeStorageToGroupIndex:(unsigned __int16)a3;
- (void)applySpriteChangeDetails:(id)a3;
- (void)checkInGroupAtIndexes:(id)a3;
- (void)dealloc;
- (void)increaseMappedSpriteCountBy:(unsigned int)a3 usingAnimationIndex:(unsigned __int16)a4;
- (void)setMappedAnimationCount:(unsigned __int16)a3;
- (void)setMappedSpriteCount:(unsigned int)a3;
- (void)setSpriteCount:(unsigned int)a3;
@end

@implementation PXGAnimationDataStore

- (NSIndexSet)activeGroupIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_activeGroupIndexes copy];
  return (NSIndexSet *)v2;
}

- (PXGAnimationDataStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXGAnimationDataStore;
  v2 = [(PXGAnimationDataStore *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    activeGroupIndexes = v2->_activeGroupIndexes;
    v2->_activeGroupIndexes = v3;

    [(PXGAnimationDataStore *)v2 _resizeStorageToGroupIndex:0];
    groupInfos = v2->_groupInfos;
    *(_OWORD *)((char *)&groupInfos->var6 + 4) = 0u;
    *(_OWORD *)&groupInfos->var4.var1 = 0u;
    *(_OWORD *)&groupInfos->var5 = 0u;
    *(_OWORD *)&groupInfos->var0 = 0u;
    *(_OWORD *)&groupInfos->var2 = 0u;
  }
  return v2;
}

- (void)_resizeStorageToGroupIndex:(unsigned __int16)a3
{
  unsigned __int16 v3 = a3 + 1;
  unsigned int groupCapacity = self->_groupCapacity;
  if (groupCapacity < (unsigned __int16)(a3 + 1))
  {
    if (!self->_groupCapacity)
    {
      unsigned int groupCapacity = 10;
      self->_unsigned int groupCapacity = 10;
    }
    if (groupCapacity < v3)
    {
      do
        LOWORD(groupCapacity) = 2 * groupCapacity;
      while ((groupCapacity & 0xFFFE) < v3);
      self->_unsigned int groupCapacity = groupCapacity;
    }
    _PXGArrayResize();
  }
}

- (void).cxx_destruct
{
}

- (unsigned)groupIndexByAnimationIndex
{
  return self->_groupIndexByAnimationIndex;
}

- (unsigned)mappedAnimationCount
{
  return self->_mappedAnimationCount;
}

- (unsigned)animationIndexBySpriteIndex
{
  return self->_animationIndexBySpriteIndex;
}

- (unsigned)mappedSpriteCount
{
  return self->_mappedSpriteCount;
}

- ($5DCE149552560A4ED0B95FAFFDAC89D8)groupInfos
{
  return self->_groupInfos;
}

- ($437E010E64063884B87806755542A2AA)spriteInfos
{
  return self->_spriteInfos;
}

- (unsigned)spriteCount
{
  return self->_spriteCount;
}

- (NSString)diagnosticDescription
{
  unsigned __int16 v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p\n", v5, self];

  unsigned int v7 = [(PXGAnimationDataStore *)self spriteCount];
  uint64_t v8 = v7;
  objc_msgSend(v6, "appendFormat:", @"%li sprites:\n", v7);
  v9 = self;
  uint64_t v10 = [(PXGAnimationDataStore *)v9 spriteInfos];
  if (v7)
  {
    v11 = (char *)v10;
    for (uint64_t i = 0; i != v7; ++i)
    {
      memcpy(__dst, v11, sizeof(__dst));
      v13 = PXGAnimationSpriteInfoDescription(__dst);
      [v6 appendFormat:@"\t%li\t%@\n", i, v13];

      v11 += 307;
    }
    [v6 appendFormat:@"Animation indexes:\n"];
    uint64_t v14 = 0;
    do
    {
      objc_msgSend(v6, "appendFormat:", @"\t%li\t%hu\n", v14, v9->_animationIndexBySpriteIndex[v14]);
      ++v14;
    }
    while (v8 != v14);
  }
  else
  {
    [v6 appendFormat:@"Animation indexes:\n"];
  }
  objc_msgSend(v6, "appendFormat:", @"%li active groups:\n", -[NSMutableIndexSet count](v9->_activeGroupIndexes, "count"));
  activeGroupIndexes = v9->_activeGroupIndexes;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __46__PXGAnimationDataStore_diagnosticDescription__block_invoke;
  v19[3] = &unk_1E5DD1558;
  id v16 = v6;
  id v20 = v16;
  v21 = v9;
  [(NSMutableIndexSet *)activeGroupIndexes enumerateIndexesUsingBlock:v19];
  [v16 appendString:@">"];
  id v17 = v16;

  return (NSString *)v17;
}

void __46__PXGAnimationDataStore_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v3 = *(void **)(a1 + 32);
  v4 = (_OWORD *)([*(id *)(a1 + 40) groupInfos] + 76 * a2);
  long long v5 = v4[3];
  v8[2] = v4[2];
  v9[0] = v5;
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)((char *)v4 + 60);
  long long v6 = v4[1];
  v8[0] = *v4;
  v8[1] = v6;
  PXGAnimationGroupInfoDescription((uint64_t)v8);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v3 appendFormat:@"\t%li\t%@\n", a2, v7];
}

- (void)setMappedAnimationCount:(unsigned __int16)a3
{
  uint64_t mappedAnimationCount = self->_mappedAnimationCount;
  self->_uint64_t mappedAnimationCount = a3;
  unsigned int mappedAnimationCapacity = self->_mappedAnimationCapacity;
  if (mappedAnimationCapacity < a3)
  {
    if (self->_mappedAnimationCapacity)
    {
      do
        LOWORD(mappedAnimationCapacity) = 2 * mappedAnimationCapacity;
      while ((mappedAnimationCapacity & 0xFFFE) < a3);
    }
    else
    {
      LOWORD(mappedAnimationCapacity) = a3;
    }
    self->_unsigned int mappedAnimationCapacity = mappedAnimationCapacity;
    _PXGArrayResize();
  }
  if (mappedAnimationCount < a3)
  {
    long long v5 = &self->_groupIndexByAnimationIndex[mappedAnimationCount];
    bzero(v5, 2 * (a3 - mappedAnimationCount));
  }
}

- (void)increaseMappedSpriteCountBy:(unsigned int)a3 usingAnimationIndex:(unsigned __int16)a4
{
  unsigned int v7 = [(PXGAnimationDataStore *)self mappedSpriteCount];
  uint64_t v8 = v7 + a3;
  [(PXGAnimationDataStore *)self setMappedSpriteCount:v8];
  if (v7 < v8)
  {
    uint64_t v9 = v8 - v7;
    uint64_t v10 = &self->_animationIndexBySpriteIndex[v7];
    do
    {
      *v10++ = a4;
      --v9;
    }
    while (v9);
  }
}

- (void)setMappedSpriteCount:(unsigned int)a3
{
  self->_mappedSpriteCount = a3;
  unsigned int mappedSpriteCapacity = self->_mappedSpriteCapacity;
  if (mappedSpriteCapacity < a3)
  {
    if (mappedSpriteCapacity)
    {
      do
        mappedSpriteCapacity *= 2;
      while (mappedSpriteCapacity < a3);
    }
    else
    {
      unsigned int mappedSpriteCapacity = a3;
    }
    self->_unsigned int mappedSpriteCapacity = mappedSpriteCapacity;
    _PXGArrayResize();
  }
}

- (void)checkInGroupAtIndexes:(id)a3
{
}

- (unsigned)checkOutGroup
{
  int v3 = 1;
  do
  {
    uint64_t v4 = (unsigned __int16)v3;
    char v5 = [(NSMutableIndexSet *)self->_activeGroupIndexes containsIndex:(unsigned __int16)v3++];
  }
  while ((v5 & 1) != 0);
  [(PXGAnimationDataStore *)self _resizeStorageToGroupIndex:v4];
  [(NSMutableIndexSet *)self->_activeGroupIndexes addIndex:v4];
  return v4;
}

- (id)spriteIndexesExpiringAtTime:(double)a3
{
  unsigned int v5 = [(PXGAnimationDataStore *)self spriteCount];
  long long v6 = self;
  uint64_t v7 = [(PXGAnimationDataStore *)v6 spriteInfos];
  uint64_t v8 = [(PXGAnimationDataStore *)v6 groupInfos];
  if (v5)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    v11 = 0;
    v12 = (unsigned char *)(v7 + 306);
    do
    {
      if ((*v12 & 1) != 0
        && *(double *)(v9 + 76 * *((unsigned __int16 *)v12 - 1) + 16) <= a3
        && !*(void *)(v9 + 76 * *((unsigned __int16 *)v12 - 1) + 52))
      {
        if (!v11)
        {
          v11 = [MEMORY[0x1E4F28E60] indexSet];
        }
        [v11 addIndex:v10];
      }
      ++v10;
      v12 += 307;
    }
    while (v5 != v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)applySpriteChangeDetails:(id)a3
{
  id v4 = a3;
  -[PXGAnimationDataStore setSpriteCount:](self, "setSpriteCount:", [v4 numberOfSpritesAfterChange]- objc_msgSend(v4, "numberOfSpritesBeforeChange")+ -[PXGAnimationDataStore spriteCount](self, "spriteCount"));
  spriteInfos = self->_spriteInfos;
  unsigned int v6 = [(PXGAnimationDataStore *)self spriteCount];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PXGAnimationDataStore_applySpriteChangeDetails___block_invoke;
  v7[3] = &unk_1E5DC7F20;
  v7[4] = self;
  [v4 applyToArray:spriteInfos elementSize:307 countAfterChanges:v6 insertionHandler:v7 modifiedHandler:0];
}

uint64_t __50__PXGAnimationDataStore_applySpriteChangeDetails___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = (HIDWORD(a2) + a2);
  if (v2 > a2)
  {
    uint64_t v3 = v2 - a2;
    uint64_t v4 = 307 * a2;
    do
    {
      uint64_t v5 = *(void *)(*(void *)(result + 32) + 48) + v4;
      *(_OWORD *)(v5 + 272) = 0uLL;
      *(_OWORD *)(v5 + 288) = 0uLL;
      *(_OWORD *)(v5 + 240) = 0uLL;
      *(_OWORD *)(v5 + 256) = 0uLL;
      *(_OWORD *)(v5 + 208) = 0uLL;
      *(_OWORD *)(v5 + 224) = 0uLL;
      *(_OWORD *)(v5 + 176) = 0uLL;
      *(_OWORD *)(v5 + 192) = 0uLL;
      *(_OWORD *)(v5 + 144) = 0uLL;
      *(_OWORD *)(v5 + 160) = 0uLL;
      *(_OWORD *)(v5 + 112) = 0uLL;
      *(_OWORD *)(v5 + 128) = 0uLL;
      *(_OWORD *)(v5 + 80) = 0uLL;
      *(_OWORD *)(v5 + 96) = 0uLL;
      *(_OWORD *)(v5 + 48) = 0uLL;
      *(_OWORD *)(v5 + 64) = 0uLL;
      *(_OWORD *)(v5 + 16) = 0uLL;
      *(_OWORD *)(v5 + 32) = 0uLL;
      *(_OWORD *)uint64_t v5 = 0uLL;
      *(_DWORD *)(v5 + 303) = 0;
      v4 += 307;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (void)setSpriteCount:(unsigned int)a3
{
  self->_spriteCount = a3;
  unsigned int spriteCapacity = self->_spriteCapacity;
  if (spriteCapacity < a3)
  {
    if (spriteCapacity)
    {
      do
        spriteCapacity *= 2;
      while (spriteCapacity < a3);
    }
    else
    {
      unsigned int spriteCapacity = a3;
    }
    self->_unsigned int spriteCapacity = spriteCapacity;
    _PXGArrayResize();
  }
}

- (void)dealloc
{
  free(self->_spriteInfos);
  free(self->_groupInfos);
  free(self->_animationIndexBySpriteIndex);
  free(self->_groupIndexByAnimationIndex);
  v3.receiver = self;
  v3.super_class = (Class)PXGAnimationDataStore;
  [(PXGAnimationDataStore *)&v3 dealloc];
}

@end