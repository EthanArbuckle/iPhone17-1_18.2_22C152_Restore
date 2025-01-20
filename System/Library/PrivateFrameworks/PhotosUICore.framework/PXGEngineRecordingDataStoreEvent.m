@interface PXGEngineRecordingDataStoreEvent
+ (id)eventWithTextures:(id)a3 dataStore:(id)a4 spriteIndexes:(id)a5 screenScale:(double)a6;
- (PXGEngineRecordingDataStoreEvent)initWithTextures:(id)a3 dataStore:(id)a4 spriteIndexes:(id)a5 screenScale:(double)a6;
- (id)serializable;
- (void)dealloc;
@end

@implementation PXGEngineRecordingDataStoreEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSIndexSet count](self->_spriteIndexes, "count"));
  spriteIndexes = self->_spriteIndexes;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__PXGEngineRecordingDataStoreEvent_serializable__block_invoke;
  v25[3] = &unk_1E5DC3618;
  v25[4] = self;
  id v23 = v3;
  id v26 = v23;
  id v22 = v4;
  id v27 = v22;
  id v21 = v5;
  id v28 = v21;
  id v20 = v6;
  id v29 = v20;
  [(NSIndexSet *)spriteIndexes enumerateIndexesUsingBlock:v25];
  if (self->_textureInfoCount >= 1)
  {
    uint64_t v9 = 0;
    int64_t v10 = 0;
    do
    {
      uint64_t v11 = self->_textureInfoSprites[v10];
      if ([(NSIndexSet *)self->_spriteIndexes containsIndex:v11])
      {
        v12 = objc_alloc_init(PXGSpriteTextureInfoSerializable);
        v13 = &self->_textureInfos[v9];
        long long v14 = *(_OWORD *)&v13[12].var0;
        long long v16 = *(_OWORD *)&v13->var0;
        long long v15 = *(_OWORD *)&v13[4].var0;
        v24[2] = *(_OWORD *)&v13[8].var0;
        v24[3] = v14;
        v24[0] = v16;
        v24[1] = v15;
        [(PXGSpriteTextureInfoSerializable *)v12 setSpriteTextureInfo:v24];
        v17 = [NSNumber numberWithUnsignedInt:v11];
        [v7 setObject:v12 forKey:v17];
      }
      ++v10;
      v9 += 16;
    }
    while (self->_textureInfoCount > v10);
  }
  v18 = objc_alloc_init(PXGEngineRecordingDataStoreSerializable);
  [(PXGEngineRecordingDataStoreSerializable *)v18 setSpriteStyles:v23];
  [(PXGEngineRecordingDataStoreSerializable *)v18 setSpriteInfos:v22];
  [(PXGEngineRecordingDataStoreSerializable *)v18 setSpriteGeometries:v21];
  [(PXGEngineRecordingDataStoreSerializable *)v18 setSpriteEntities:v20];
  [(PXGEngineRecordingDataStoreSerializable *)v18 setSpriteTextureInfos:v7];

  return v18;
}

void __48__PXGEngineRecordingDataStoreEvent_serializable__block_invoke(void *a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(PXGSpriteStyleSerializable);
  memmove(__dst, (const void *)(*(void *)(a1[4] + 40) + 160 * a2), 0xA0uLL);
  [(PXGSpriteStyleSerializable *)v4 setSpriteStyle:__dst];
  v5 = (void *)a1[5];
  v6 = [NSNumber numberWithUnsignedInt:a2];
  [v5 setObject:v4 forKey:v6];

  v7 = objc_alloc_init(PXGSpriteInfoSerializable);
  uint64_t v8 = *(void *)(a1[4] + 48) + 40 * a2;
  long long v9 = *(_OWORD *)v8;
  long long v10 = *(_OWORD *)(v8 + 16);
  uint64_t v23 = *(void *)(v8 + 32);
  v22[0] = v9;
  v22[1] = v10;
  [(PXGSpriteInfoSerializable *)v7 setSpriteInfo:v22];
  uint64_t v11 = (void *)a1[6];
  v12 = [NSNumber numberWithUnsignedInt:a2];
  [v11 setObject:v7 forKey:v12];

  v13 = objc_alloc_init(PXGSpriteGeometrySerializable);
  long long v14 = (_OWORD *)(*(void *)(a1[4] + 56) + 32 * a2);
  long long v15 = v14[1];
  v21[0] = *v14;
  v21[1] = v15;
  [(PXGSpriteGeometrySerializable *)v13 setSpriteGeometry:v21];
  long long v16 = (void *)a1[7];
  v17 = [NSNumber numberWithUnsignedInt:a2];
  [v16 setObject:v13 forKey:v17];

  v18 = objc_alloc_init(PXGSpriteEntitySerializable);
  [(PXGSpriteEntitySerializable *)v18 setSpriteEntity:*(unsigned int *)(*(void *)(a1[4] + 64) + 4 * a2)];
  v19 = (void *)a1[8];
  id v20 = [NSNumber numberWithUnsignedInt:a2];
  [v19 setObject:v18 forKey:v20];
}

- (void)dealloc
{
  free(self->_styles);
  free(self->_infos);
  free(self->_geometries);
  free(self->_entities);
  free(self->_textureInfos);
  free(self->_textureInfoSprites);
  v3.receiver = self;
  v3.super_class = (Class)PXGEngineRecordingDataStoreEvent;
  [(PXGEngineRecordingDataStoreEvent *)&v3 dealloc];
}

- (PXGEngineRecordingDataStoreEvent)initWithTextures:(id)a3 dataStore:(id)a4 spriteIndexes:(id)a5 screenScale:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PXGEngineRecordingDataStoreEvent;
  v13 = [(PXGTungstenRecordingEvent *)&v34 initWithComponent:0 eventName:@"dataStore"];
  if (v13)
  {
    id v27 = v11;
    uint64_t v14 = [v11 count];
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = v14;
    size_t v15 = 4 * v14;
    v13->_entities = ($738B17BD11CC339B30296C0EA03CEC2B *)malloc_type_malloc(v15, 0x100004052888210uLL);
    size_t v16 = 32 * v14;
    v13->_geometries = ($16EC8B44B1C22DB88FC318D5A7EDDAB2 *)malloc_type_malloc(32 * v14, 0x1000040E0EAB150uLL);
    size_t v17 = 160 * v14;
    v13->_styles = ($225AF24142A77900D29617A74D173C5F *)malloc_type_malloc(160 * v14, 0x1000040FE7FAB29uLL);
    size_t v18 = 40 * v14;
    v13->_infos = ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)malloc_type_malloc(40 * v14, 0x100004081CBAE78uLL);
    v13->_textureInfos = ($3BA783FF50B239963188BE194EBFFEBA *)malloc_type_malloc(v14 << 6, 0x100004011B15C4DuLL);
    v13->_textureInfoSprites = (unsigned int *)malloc_type_malloc(v15, 0x100004052888210uLL);
    entities = v13->_entities;
    id v20 = v27;
    memcpy(entities, (const void *)[v20 entities], v15);
    geometries = v13->_geometries;
    id v22 = v20;
    memcpy(geometries, (const void *)[v22 geometries], v16);
    styles = v13->_styles;
    id v24 = v22;
    memcpy(styles, (const void *)[v24 styles], v17);
    memcpy(v13->_infos, (const void *)[v24 infos], v18);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __89__PXGEngineRecordingDataStoreEvent_initWithTextures_dataStore_spriteIndexes_screenScale___block_invoke;
    v28[3] = &unk_1E5DC35F0;
    id v29 = v12;
    v31 = v33;
    uint64_t v25 = v13;
    v30 = v25;
    double v32 = a6;
    [v10 enumerateKeysAndObjectsUsingBlock:v28];
    objc_storeStrong(v25 + 11, a5);

    _Block_object_dispose(v33, 8);
    id v11 = v27;
  }

  return v13;
}

void __89__PXGEngineRecordingDataStoreEvent_initWithTextures_dataStore_spriteIndexes_screenScale___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([a2 intValue] & 0xFD) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v16 = v5;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v11 = *(void **)(a1 + 32);
          id v12 = [v10 spriteIndexes];
          v13 = objc_msgSend(v11, "px_intersectionWithIndexSet:", v12);

          if ([v10 isCaptureTexture]) {
            BOOL v14 = [v10 spriteGeometries] != 0;
          }
          else {
            BOOL v14 = 1;
          }
          if ([v13 count]) {
            BOOL v15 = !v14;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            [v10 spriteCount];
            _PXGArrayCapacityResizeToCount();
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    id v5 = v16;
  }
}

+ (id)eventWithTextures:(id)a3 dataStore:(id)a4 spriteIndexes:(id)a5 screenScale:(double)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[PXGEngineRecordingDataStoreEvent alloc] initWithTextures:v11 dataStore:v10 spriteIndexes:v9 screenScale:a6];

  return v12;
}

@end