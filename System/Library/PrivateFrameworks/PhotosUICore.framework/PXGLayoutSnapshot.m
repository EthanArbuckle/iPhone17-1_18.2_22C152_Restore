@interface PXGLayoutSnapshot
- (CGRect)visibleRect;
- (NSDictionary)identifierSourceByDataSourceIdentifier;
- (NSDictionary)identifierSourceByDataSourceIdentifierHash;
- (NSDictionary)spriteIndexesByObjectIdentifier;
- (PXGLayoutSnapshot)init;
- (PXGLayoutSnapshot)initWithLayout:(id)a3 spriteDataStore:(id)a4;
- (PXGSpriteDataStore)spriteDataStore;
- (void)applyViewportShift:(CGPoint)a3;
- (void)enumerateObjectIdentifiersForInfos:(id *)a3 count:(unsigned int)a4 usingBlock:(id)a5;
- (void)enumerateObjectIdentifiersForSpriteIndexes:(id)a3 infos:(id *)a4 usingBlock:(id)a5;
- (void)enumerateSpritesWithObjectIdentifier:(id)a3 usingBlock:(id)a4;
- (void)releaseSpriteDataStore;
@end

@implementation PXGLayoutSnapshot

void __52__PXGLayoutSnapshot_initWithLayout_spriteDataStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [a2 layoutSnapshotDataSource];
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "dataSourceIdentifier"));
    v7 = [v5 objectForKeyedSubscript:v6];

    if (!v7)
    {
      v8 = *(void **)(a1 + 32);
      v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "dataSourceIdentifier"));
      [v8 setObject:v4 forKeyedSubscript:v9];

      v10 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v4, "dataSourceIdentifier"));
      v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];

      if (v11) {
        PXAssertGetLog();
      }
      [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:v10];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierSourceByDataSourceIdentifierHash, 0);
  objc_storeStrong((id *)&self->_identifierSourceByDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_spriteDataStore, 0);
  objc_storeStrong((id *)&self->_spriteIndexesByObjectIdentifier, 0);
}

- (PXGLayoutSnapshot)initWithLayout:(id)a3 spriteDataStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PXGLayoutSnapshot;
  v9 = [(PXGLayoutSnapshot *)&v31 init];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__PXGLayoutSnapshot_initWithLayout_spriteDataStore___block_invoke;
    v26[3] = &unk_1E5DD0608;
    id v12 = v10;
    id v27 = v12;
    id v13 = v11;
    id v28 = v13;
    SEL v30 = a2;
    v14 = v9;
    v29 = v14;
    [v7 enumerateDescendantsLayoutsUsingBlock:v26];
    uint64_t v15 = [v12 copy];
    identifierSourceByDataSourceIdentifier = v14->_identifierSourceByDataSourceIdentifier;
    v14->_identifierSourceByDataSourceIdentifier = (NSDictionary *)v15;

    uint64_t v17 = [v13 copy];
    identifierSourceByDataSourceIdentifierHash = v14->_identifierSourceByDataSourceIdentifierHash;
    v14->_identifierSourceByDataSourceIdentifierHash = (NSDictionary *)v17;

    [v7 visibleRect];
    v14->_visibleRect.origin.x = v19;
    v14->_visibleRect.origin.y = v20;
    v14->_visibleRect.size.width = v21;
    v14->_visibleRect.size.height = v22;
    objc_storeStrong((id *)&v14->_spriteDataStore, a4);
    int v23 = [v7 numberOfSprites];
    if (v23 != [v8 count])
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v14, @"PXGLayoutSnapshot.m", 46, @"Invalid parameter not satisfying: %@", @"layout.numberOfSprites == spriteDataStore.count" object file lineNumber description];
    }
  }

  return v9;
}

- (PXGSpriteDataStore)spriteDataStore
{
  spriteDataStore = self->_spriteDataStore;
  if (!spriteDataStore)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXGLayoutSnapshot.m" lineNumber:56 description:@"Attempting to access the sprite data store after it has been released and reused."];

    spriteDataStore = self->_spriteDataStore;
  }
  return spriteDataStore;
}

- (void)releaseSpriteDataStore
{
  spriteDataStore = self->_spriteDataStore;
  self->_spriteDataStore = 0;
}

- (void)applyViewportShift:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_visibleRect = CGRectOffset(self->_visibleRect, a3.x, a3.y);
  v6 = [(PXGLayoutSnapshot *)self spriteDataStore];
  id v7 = v6;
  if (v6)
  {
    v14 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 geometries];
    unsigned int v10 = [v8 count];
    id v7 = v14;
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = (double *)(v9 + 8);
      do
      {
        double v13 = y + *v12;
        *(v12 - 1) = x + *(v12 - 1);
        *id v12 = v13;
        v12 += 4;
        --v11;
      }
      while (v11);
    }
  }
}

- (NSDictionary)identifierSourceByDataSourceIdentifierHash
{
  return self->_identifierSourceByDataSourceIdentifierHash;
}

- (NSDictionary)identifierSourceByDataSourceIdentifier
{
  return self->_identifierSourceByDataSourceIdentifier;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)enumerateSpritesWithObjectIdentifier:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXGLayoutSnapshot *)self spriteDataStore];
  if (v8)
  {
    uint64_t v9 = [(PXGLayoutSnapshot *)self spriteIndexesByObjectIdentifier];
    unsigned int v10 = [v9 objectForKeyedSubscript:v6];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PXGLayoutSnapshot_enumerateSpritesWithObjectIdentifier_usingBlock___block_invoke;
    v11[3] = &unk_1E5DD06A8;
    v11[4] = self;
    id v12 = v7;
    [v10 enumerateIndexesUsingBlock:v11];
  }
}

uint64_t __69__PXGLayoutSnapshot_enumerateSpritesWithObjectIdentifier_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [*(id *)(a1 + 32) spriteDataStore];
  v5 = v4;
  if (v4)
  {
    [v4 spriteAtIndex:a2];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }

  uint64_t v6 = *(unsigned __int8 *)(*((void *)&v12 + 1) + 24);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(uint64_t (**)(uint64_t, uint64_t, _OWORD *, uint64_t))(v7 + 16);
  v10[0] = v11;
  v10[1] = v12;
  return v8(v7, a2, v10, v6);
}

- (void)enumerateObjectIdentifiersForInfos:(id *)a3 count:(unsigned int)a4 usingBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, a4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PXGLayoutSnapshot_enumerateObjectIdentifiersForInfos_count_usingBlock___block_invoke;
  v11[3] = &unk_1E5DD0680;
  id v12 = v8;
  id v10 = v8;
  [(PXGLayoutSnapshot *)self enumerateObjectIdentifiersForSpriteIndexes:v9 infos:a3 usingBlock:v11];
}

uint64_t __73__PXGLayoutSnapshot_enumerateObjectIdentifiersForInfos_count_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateObjectIdentifiersForSpriteIndexes:(id)a3 infos:(id *)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__283053;
  v17[4] = __Block_byref_object_dispose__283054;
  id v18 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PXGLayoutSnapshot_enumerateObjectIdentifiersForSpriteIndexes_infos_usingBlock___block_invoke;
  v11[3] = &unk_1E5DD0658;
  uint64_t v15 = a4;
  double v13 = v17;
  void v11[4] = self;
  id v10 = v9;
  id v12 = v10;
  v14 = v16;
  [v8 enumerateRangesUsingBlock:v11];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
}

void __81__PXGLayoutSnapshot_enumerateObjectIdentifiersForSpriteIndexes_infos_usingBlock___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3) {
    PXGSectionedSpriteTagGetDataSourceIdentifierHash();
  }
}

- (NSDictionary)spriteIndexesByObjectIdentifier
{
  spriteIndexesByObjectIdentifier = self->_spriteIndexesByObjectIdentifier;
  if (!spriteIndexesByObjectIdentifier)
  {
    v4 = [(PXGLayoutSnapshot *)self spriteDataStore];
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = v4;
      uint64_t v7 = [v6 infos];
      uint64_t v8 = [v6 count];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __52__PXGLayoutSnapshot_spriteIndexesByObjectIdentifier__block_invoke;
      v13[3] = &unk_1E5DD0630;
      id v14 = v5;
      id v9 = v5;
      [(PXGLayoutSnapshot *)self enumerateObjectIdentifiersForInfos:v7 count:v8 usingBlock:v13];
      id v10 = (NSDictionary *)[v9 copy];
      long long v11 = self->_spriteIndexesByObjectIdentifier;
      self->_spriteIndexesByObjectIdentifier = v10;
    }
    spriteIndexesByObjectIdentifier = self->_spriteIndexesByObjectIdentifier;
  }
  return spriteIndexesByObjectIdentifier;
}

void __52__PXGLayoutSnapshot_spriteIndexesByObjectIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v8 = a2;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 addIndex:a4];
  }
  else
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:a4];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

- (PXGLayoutSnapshot)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGLayoutSnapshot.m", 52, @"%s is not available as initializer", "-[PXGLayoutSnapshot init]");

  abort();
}

@end