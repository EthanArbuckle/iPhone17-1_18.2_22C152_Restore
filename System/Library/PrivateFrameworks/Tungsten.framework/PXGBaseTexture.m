@interface PXGBaseTexture
- (BOOL)containsSpriteIndex:(unsigned int)a3;
- (BOOL)hasPendingTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4;
- (BOOL)hasSprites;
- (BOOL)isDegraded;
- (BOOL)isOpaque;
- (BOOL)removePendingSpriteWithTextureRequestID:(int)a3 ifDeliveredBefore:(unsigned int)a4;
- (CGImage)imageRepresentation;
- (CGSize)pixelSize;
- (NSIndexSet)spriteIndexes;
- (NSString)description;
- (PXGBaseTexture)init;
- (int64_t)estimatedByteSize;
- (unsigned)presentationType;
- (unsigned)spriteCount;
- (void)_addSpriteIndex:(unsigned int)a3;
- (void)_filterPendingTextureRequestIDsWithPredicate:(id)a3;
- (void)_lock_resizeStorageIfNeeded;
- (void)addSpriteIndexRange:(_NSRange)a3;
- (void)addSpriteIndexes:(id)a3;
- (void)addSpriteWithTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4;
- (void)applyChangeDetails:(id)a3;
- (void)dealloc;
- (void)enumerateSpriteIndexes:(id)a3;
- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4;
- (void)processPendingTextureRequestIDsWithHandler:(id)a3;
- (void)removeAllSpriteIndexes;
- (void)removeSpriteIndex:(unsigned int)a3;
- (void)setIsDegraded:(BOOL)a3;
@end

@implementation PXGBaseTexture

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (void)removeSpriteIndex:(unsigned int)a3
{
}

- (BOOL)hasPendingTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  if (lock_pendingImageRequestInfoCount < 1)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    p_var1 = &self->_lock_pendingImageRequestInfo->var1;
    BOOL v11 = 1;
    do
    {
      if (*(p_var1 - 1) == a3 && *p_var1 == a4) {
        break;
      }
      BOOL v11 = ++v9 < lock_pendingImageRequestInfoCount;
      p_var1 += 2;
    }
    while (lock_pendingImageRequestInfoCount != v9);
  }
  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (void)setIsDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (void)addSpriteWithTextureRequestID:(int)a3 deliveryOrder:(unsigned int)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  self->_unint64_t lock_pendingImageRequestInfoCount = lock_pendingImageRequestInfoCount + 1;
  [(PXGBaseTexture *)self _lock_resizeStorageIfNeeded];
  uint64_t v9 = &self->_lock_pendingImageRequestInfo[lock_pendingImageRequestInfoCount];
  v9->var0 = a3;
  v9->var1 = a4;

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_resizeStorageIfNeeded
{
  os_unfair_lock_assert_owner(&self->_lock);
  unint64_t lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  unint64_t lock_pendingImageRequestInfoCapacity = self->_lock_pendingImageRequestInfoCapacity;
  if (lock_pendingImageRequestInfoCount > lock_pendingImageRequestInfoCapacity)
  {
    if (!lock_pendingImageRequestInfoCapacity)
    {
      unint64_t lock_pendingImageRequestInfoCapacity = 4;
      self->_unint64_t lock_pendingImageRequestInfoCapacity = 4;
    }
    if (lock_pendingImageRequestInfoCount > lock_pendingImageRequestInfoCapacity)
    {
      do
      {
        BOOL v5 = lock_pendingImageRequestInfoCount > 2 * lock_pendingImageRequestInfoCapacity;
        lock_pendingImageRequestInfoCapacity *= 2;
      }
      while (v5);
      self->_unint64_t lock_pendingImageRequestInfoCapacity = lock_pendingImageRequestInfoCapacity;
    }
    self->_lock_pendingImageRequestInfo = ($7E3FC3C8846FD6918BD0D88F3AA609C8 *)malloc_type_realloc(self->_lock_pendingImageRequestInfo, 8* lock_pendingImageRequestInfoCapacity, 0xFA539D40uLL);
  }
}

- (void)processPendingTextureRequestIDsWithHandler:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  if (lock_pendingImageRequestInfoCount >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = (*((uint64_t (**)(id, void, void))v7 + 2))(v7, self->_lock_pendingImageRequestInfo[v5].var0, self->_lock_pendingImageRequestInfo[v5].var1);
      if (v6 != -1) {
        [(PXGBaseTexture *)self _addSpriteIndex:v6];
      }
      ++v5;
      --lock_pendingImageRequestInfoCount;
    }
    while (lock_pendingImageRequestInfoCount);
  }
  self->_int64_t lock_pendingImageRequestInfoCount = 0;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_addSpriteIndex:(unsigned int)a3
{
}

- (NSIndexSet)spriteIndexes
{
  v2 = (void *)[(NSMutableIndexSet *)self->_spriteIndexes copy];

  return (NSIndexSet *)v2;
}

- (void)applyChangeDetails:(id)a3
{
  id v7 = a3;
  if ([v7 hasAnyInsertionsRemovalsOrMoves])
  {
    v4 = [v7 indexSetAfterApplyingChangeDetails:self->_spriteIndexes];
    uint64_t v5 = (NSMutableIndexSet *)[v4 mutableCopy];
    spriteIndexes = self->_spriteIndexes;
    self->_spriteIndexes = v5;
  }
}

- (void)getSpriteIndexes:(unsigned int *)a3 maxSpriteCount:(unsigned int)a4
{
  if ([(PXGBaseTexture *)self spriteCount] < a4)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXGBaseTexture.m", 119, @"Invalid parameter not satisfying: %@", @"maxSpriteCount <= self.spriteCount" object file lineNumber description];
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  spriteIndexes = self->_spriteIndexes;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__PXGBaseTexture_getSpriteIndexes_maxSpriteCount___block_invoke;
  v10[3] = &unk_265556A90;
  v10[4] = v12;
  v10[5] = a3;
  unsigned int v11 = a4;
  [(NSMutableIndexSet *)spriteIndexes enumerateRangesUsingBlock:v10];
  _Block_object_dispose(v12, 8);
}

- (BOOL)hasSprites
{
  if ([(NSMutableIndexSet *)self->_spriteIndexes count]) {
    return 1;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v3 = self->_lock_pendingImageRequestInfoCount != 0;
  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (unsigned)spriteCount
{
  return [(NSMutableIndexSet *)self->_spriteIndexes count];
}

uint64_t __50__PXGBaseTexture_getSpriteIndexes_maxSpriteCount___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v4 = a2 + a3;
  if (a2 + a3 > a2)
  {
    uint64_t v5 = *(void *)(result + 40);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
    while (1)
    {
      *(_DWORD *)(v5 + 4 * v6) = a2;
      uint64_t v6 = ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
      if (v6 == *(_DWORD *)(result + 48)) {
        break;
      }
      a2 = (a2 + 1);
      if (v4 <= a2) {
        return result;
      }
    }
    *a4 = 1;
  }
  return result;
}

- (void)addSpriteIndexes:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __41__PXGBaseTexture_enumerateSpriteIndexes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXGBaseTexture)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXGBaseTexture;
  v2 = [(PXGBaseTexture *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    unint64_t v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    spriteIndexes = v3->_spriteIndexes;
    v3->_spriteIndexes = v4;
  }
  return v3;
}

- (void)enumerateSpriteIndexes:(id)a3
{
  id v4 = a3;
  spriteIndexes = self->_spriteIndexes;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__PXGBaseTexture_enumerateSpriteIndexes___block_invoke;
  v7[3] = &unk_265556AB8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableIndexSet *)spriteIndexes enumerateIndexesUsingBlock:v7];
}

- (void)dealloc
{
  free(self->_lock_pendingImageRequestInfo);
  v3.receiver = self;
  v3.super_class = (Class)PXGBaseTexture;
  [(PXGBaseTexture *)&v3 dealloc];
}

- (void)addSpriteIndexRange:(_NSRange)a3
{
}

- (BOOL)isOpaque
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGBaseTexture.m", 227, @"Method %s is a responsibility of subclass %@", "-[PXGBaseTexture isOpaque]", v6 object file lineNumber description];

  abort();
}

- (CGSize)pixelSize
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGBaseTexture.m", 223, @"Method %s is a responsibility of subclass %@", "-[PXGBaseTexture pixelSize]", v6 object file lineNumber description];

  abort();
}

- (CGImage)imageRepresentation
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGBaseTexture.m", 219, @"Method %s is a responsibility of subclass %@", "-[PXGBaseTexture imageRepresentation]", v6 object file lineNumber description];

  abort();
}

- (unsigned)presentationType
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGBaseTexture.m", 215, @"Method %s is a responsibility of subclass %@", "-[PXGBaseTexture presentationType]", v6 object file lineNumber description];

  abort();
}

- (int64_t)estimatedByteSize
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGBaseTexture.m", 211, @"Method %s is a responsibility of subclass %@", "-[PXGBaseTexture estimatedByteSize]", v6 object file lineNumber description];

  abort();
}

- (BOOL)containsSpriteIndex:(unsigned int)a3
{
  return [(NSMutableIndexSet *)self->_spriteIndexes containsIndex:a3];
}

- (void)_filterPendingTextureRequestIDsWithPredicate:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  int64_t lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  if (lock_pendingImageRequestInfoCount >= 1)
  {
    unint64_t v5 = lock_pendingImageRequestInfoCount + 1;
    int64_t v6 = lock_pendingImageRequestInfoCount;
    do
    {
      if (((*((uint64_t (**)(id, void, void))v7 + 2))(v7, self->_lock_pendingImageRequestInfo[v6 - 1].var0, self->_lock_pendingImageRequestInfo[v6 - 1].var1) & 1) == 0)
      {
        _PXGArrayRemoveRange((uint64_t)self->_lock_pendingImageRequestInfo, 8, self->_lock_pendingImageRequestInfoCount, v5 - 2, 1);
        --self->_lock_pendingImageRequestInfoCount;
      }
      --v5;
      --v6;
    }
    while (v5 > 1);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeAllSpriteIndexes
{
}

- (BOOL)removePendingSpriteWithTextureRequestID:(int)a3 ifDeliveredBefore:(unsigned int)a4
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__PXGBaseTexture_removePendingSpriteWithTextureRequestID_ifDeliveredBefore___block_invoke;
  v6[3] = &unk_265556A68;
  int v7 = a3;
  unsigned int v8 = a4;
  v6[4] = &v9;
  [(PXGBaseTexture *)self _filterPendingTextureRequestIDsWithPredicate:v6];
  char v4 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __76__PXGBaseTexture_removePendingSpriteWithTextureRequestID_ifDeliveredBefore___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 40) != a2) {
    return 1;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 44);
  uint64_t result = 1;
  if (v4 > a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PXGBaseTexture;
  unsigned int v4 = [(PXGBaseTexture *)&v9 description];
  unint64_t lock_pendingImageRequestInfoCount = self->_lock_pendingImageRequestInfoCount;
  int64_t v6 = [(NSMutableIndexSet *)self->_spriteIndexes px_shortDescription];
  int v7 = [v3 stringWithFormat:@"<%@ pendingRequestIDs:%lu spriteIndexes:%@ >", v4, lock_pendingImageRequestInfoCount, v6];

  return (NSString *)v7;
}

@end