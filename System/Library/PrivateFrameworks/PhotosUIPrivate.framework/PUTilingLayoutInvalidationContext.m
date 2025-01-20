@interface PUTilingLayoutInvalidationContext
- (BOOL)invalidatedAllTiles;
- (BOOL)invalidatedAnyTile;
- (BOOL)invalidatedContentBounds;
- (NSMutableDictionary)_invalidatedIndexPathsByTileKind;
- (NSSet)invalidatedTileKinds;
- (PUTilingLayoutInvalidationContext)init;
- (void)enumerateInvalidatedTilesUsingBlock:(id)a3;
- (void)invalidateAllTiles;
- (void)invalidateAllTilesWithKind:(id)a3;
- (void)invalidateContentBounds;
- (void)invalidateTileWithIndexPath:(id)a3 kind:(id)a4;
- (void)setInvalidatedAllTiles:(BOOL)a3;
- (void)setInvalidatedAnyTile:(BOOL)a3;
@end

@implementation PUTilingLayoutInvalidationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__invalidatedIndexPathsByTileKind, 0);
  objc_storeStrong((id *)&self->_invalidatedTileKinds, 0);
}

- (NSMutableDictionary)_invalidatedIndexPathsByTileKind
{
  return self->__invalidatedIndexPathsByTileKind;
}

- (void)setInvalidatedAnyTile:(BOOL)a3
{
  self->_invalidatedAnyTile = a3;
}

- (BOOL)invalidatedAnyTile
{
  return self->_invalidatedAnyTile;
}

- (BOOL)invalidatedContentBounds
{
  return self->_invalidatedContentBounds;
}

- (void)setInvalidatedAllTiles:(BOOL)a3
{
  self->_invalidatedAllTiles = a3;
}

- (BOOL)invalidatedAllTiles
{
  return self->_invalidatedAllTiles;
}

- (NSSet)invalidatedTileKinds
{
  return &self->_invalidatedTileKinds->super;
}

- (void)enumerateInvalidatedTilesUsingBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PUTilingLayoutInvalidationContext.m", 60, @"Invalid parameter not satisfying: %@", @"enumerationBlock != NULL" object file lineNumber description];
  }
  v6 = [(PUTilingLayoutInvalidationContext *)self _invalidatedIndexPathsByTileKind];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke;
  v9[3] = &unk_1E5F2C870;
  id v7 = v5;
  id v10 = v7;
  v11 = v12;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  _Block_object_dispose(v12, 8);
}

void __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke_2;
  v10[3] = &unk_1E5F2C848;
  id v12 = *(id *)(a1 + 32);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v13 = v9;
  [a3 enumerateObjectsUsingBlock:v10];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

uint64_t __73__PUTilingLayoutInvalidationContext_enumerateInvalidatedTilesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

- (void)invalidateContentBounds
{
  self->_invalidatedContentBounds = 1;
}

- (void)invalidateAllTiles
{
  [(PUTilingLayoutInvalidationContext *)self setInvalidatedAllTiles:1];
  [(PUTilingLayoutInvalidationContext *)self setInvalidatedAnyTile:1];
}

- (void)invalidateAllTilesWithKind:(id)a3
{
  [(NSMutableSet *)self->_invalidatedTileKinds addObject:a3];
  [(PUTilingLayoutInvalidationContext *)self setInvalidatedAnyTile:1];
}

- (void)invalidateTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUTilingLayoutInvalidationContext.m", 31, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PUTilingLayoutInvalidationContext.m", 32, @"Invalid parameter not satisfying: %@", @"tileKind != nil" object file lineNumber description];

LABEL_3:
  id v8 = [(PUTilingLayoutInvalidationContext *)self _invalidatedIndexPathsByTileKind];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    [v8 setObject:v9 forKeyedSubscript:v7];
  }
  [v9 addObject:v12];
  [(PUTilingLayoutInvalidationContext *)self setInvalidatedAnyTile:1];
}

- (PUTilingLayoutInvalidationContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUTilingLayoutInvalidationContext;
  v2 = [(PUTilingLayoutInvalidationContext *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    invalidatedIndexPathsByTileKind = v2->__invalidatedIndexPathsByTileKind;
    v2->__invalidatedIndexPathsByTileKind = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    invalidatedTileKinds = v2->_invalidatedTileKinds;
    v2->_invalidatedTileKinds = (NSMutableSet *)v5;
  }
  return v2;
}

@end