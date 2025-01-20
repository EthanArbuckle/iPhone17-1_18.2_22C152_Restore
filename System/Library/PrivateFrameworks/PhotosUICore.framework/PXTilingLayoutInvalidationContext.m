@interface PXTilingLayoutInvalidationContext
- (BOOL)invalidatedAllTiles;
- (BOOL)invalidatedContentBounds;
- (BOOL)invalidatedScrollBounds;
- (BOOL)invalidatedScrollInfo;
- (BOOL)invalidatedVisibleRect;
- (NSIndexSet)invalidatedTileGroups;
- (NSString)tag;
- (id)description;
- (void)enumerateInvalidatedTileIdentifiersUsingBlock:(id)a3;
- (void)invalidateAllTiles;
- (void)invalidateContentBounds;
- (void)invalidateEverything;
- (void)invalidateScrollBounds;
- (void)invalidateScrollInfo;
- (void)invalidateTileWithIdentifier:(PXTileIdentifier *)a3;
- (void)invalidateTilesInGroup:(unint64_t)a3;
- (void)invalidateVisibleRect;
- (void)setTag:(id)a3;
@end

@implementation PXTilingLayoutInvalidationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_invalidatedTileGroups, 0);
  objc_storeStrong((id *)&self->_invalidatedTileIdentifiers, 0);
}

- (void)setTag:(id)a3
{
}

- (NSString)tag
{
  return self->_tag;
}

- (BOOL)invalidatedScrollInfo
{
  return self->_invalidatedScrollInfo;
}

- (BOOL)invalidatedVisibleRect
{
  return self->_invalidatedVisibleRect;
}

- (BOOL)invalidatedScrollBounds
{
  return self->_invalidatedScrollBounds;
}

- (BOOL)invalidatedContentBounds
{
  return self->_invalidatedContentBounds;
}

- (BOOL)invalidatedAllTiles
{
  return self->_invalidatedAllTiles;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, tag=%@>", objc_opt_class(), self, self->_tag];
}

- (NSIndexSet)invalidatedTileGroups
{
  v2 = (void *)[(NSMutableIndexSet *)self->_invalidatedTileGroups copy];
  return (NSIndexSet *)v2;
}

- (void)invalidateEverything
{
  [(PXTilingLayoutInvalidationContext *)self invalidateAllTiles];
  [(PXTilingLayoutInvalidationContext *)self invalidateContentBounds];
  [(PXTilingLayoutInvalidationContext *)self invalidateScrollBounds];
  [(PXTilingLayoutInvalidationContext *)self invalidateVisibleRect];
  [(PXTilingLayoutInvalidationContext *)self invalidateScrollInfo];
}

- (void)invalidateScrollInfo
{
  self->_invalidatedScrollInfo = 1;
}

- (void)invalidateVisibleRect
{
  self->_invalidatedVisibleRect = 1;
}

- (void)invalidateScrollBounds
{
  self->_invalidatedScrollBounds = 1;
}

- (void)invalidateContentBounds
{
  self->_invalidatedContentBounds = 1;
}

- (void)invalidateAllTiles
{
  self->_invalidatedAllTiles = 1;
}

- (void)enumerateInvalidatedTileIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  invalidatedTileIdentifiers = self->_invalidatedTileIdentifiers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__PXTilingLayoutInvalidationContext_enumerateInvalidatedTileIdentifiersUsingBlock___block_invoke;
  v7[3] = &unk_1E5DCB480;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)invalidatedTileIdentifiers enumerateObjectsUsingBlock:v7];
}

uint64_t __83__PXTilingLayoutInvalidationContext_enumerateInvalidatedTileIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if (a2) {
    [a2 PXTileIdentifierValue];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16);
  v13[2] = v17;
  v13[3] = v18;
  v13[4] = v19;
  uint64_t v14 = v20;
  v13[0] = v15;
  v13[1] = v16;
  return v11(v10, v13, a4, a4, a5, a6, a7, a8);
}

- (void)invalidateTilesInGroup:(unint64_t)a3
{
  invalidatedTileGroups = self->_invalidatedTileGroups;
  if (invalidatedTileGroups)
  {
    [(NSMutableIndexSet *)invalidatedTileGroups addIndex:a3];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
    id v6 = self->_invalidatedTileGroups;
    self->_invalidatedTileGroups = v5;
  }
}

- (void)invalidateTileWithIdentifier:(PXTileIdentifier *)a3
{
  invalidatedTileIdentifiers = self->_invalidatedTileIdentifiers;
  if (!invalidatedTileIdentifiers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_invalidatedTileIdentifiers;
    self->_invalidatedTileIdentifiers = v6;

    invalidatedTileIdentifiers = self->_invalidatedTileIdentifiers;
  }
  long long v8 = *(_OWORD *)&a3->index[5];
  v11[2] = *(_OWORD *)&a3->index[3];
  v11[3] = v8;
  v11[4] = *(_OWORD *)&a3->index[7];
  unint64_t v12 = a3->index[9];
  long long v9 = *(_OWORD *)&a3->index[1];
  v11[0] = *(_OWORD *)&a3->length;
  v11[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F29238] valueWithPXTileIdentifier:v11];
  [(NSMutableArray *)invalidatedTileIdentifiers addObject:v10];
}

@end