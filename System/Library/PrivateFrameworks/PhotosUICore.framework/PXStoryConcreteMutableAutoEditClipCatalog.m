@interface PXStoryConcreteMutableAutoEditClipCatalog
- (void)addClip:(id)a3;
- (void)composeClipsInRange:(_NSRange)a3;
- (void)enumerateMutableClipsUsingBlock:(id)a3;
- (void)enumeratePairsOfMutableClipsUsingBlock:(id)a3;
- (void)updateClipAtIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)updateClipForDisplayAsset:(id)a3 usingBlock:(id)a4;
@end

@implementation PXStoryConcreteMutableAutoEditClipCatalog

- (void)composeClipsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v18 = -[NSMutableArray subarrayWithRange:](self->super._orderedClips, "subarrayWithRange:");
  uint64_t v6 = +[PXStoryConcreteAutoEditClip composedClipWithClips:](PXStoryConcreteAutoEditClip, "composedClipWithClips:");
  -[NSMutableArray removeObjectsInRange:](self->super._orderedClips, "removeObjectsInRange:", location, length);
  v17 = (void *)v6;
  [(NSMutableArray *)self->super._orderedClips insertObject:v6 atIndex:location];
  while (location < [(NSMutableArray *)self->super._orderedClips count])
  {
    v7 = [(NSMutableArray *)self->super._orderedClips objectAtIndexedSubscript:location];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v19 = v7;
    id obj = [v7 displayAssets];
    uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          v13 = [NSNumber numberWithUnsignedInteger:location];
          clipIndicesByAssetUUID = self->super._clipIndicesByAssetUUID;
          id v15 = v12;
          if (objc_opt_respondsToSelector()) {
            [v15 alternateUUID];
          }
          else {
          v16 = [v15 uuid];
          }

          [(NSMutableDictionary *)clipIndicesByAssetUUID setObject:v13 forKeyedSubscript:v16];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    ++location;
  }
}

- (void)enumeratePairsOfMutableClipsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__215624;
  v19 = __Block_byref_object_dispose__215625;
  id v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  orderedClips = self->super._orderedClips;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__PXStoryConcreteMutableAutoEditClipCatalog_enumeratePairsOfMutableClipsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC5F58;
  uint64_t v6 = (void (**)(void))v4;
  id v8 = v6;
  uint64_t v9 = &v15;
  uint64_t v10 = &v11;
  [(NSMutableArray *)orderedClips enumerateObjectsUsingBlock:v7];
  if (v16[5] && !*((unsigned char *)v12 + 24)) {
    v6[2](v6);
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

void __84__PXStoryConcreteMutableAutoEditClipCatalog_enumeratePairsOfMutableClipsUsingBlock___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *a4;
}

- (void)enumerateMutableClipsUsingBlock:(id)a3
{
  id v4 = a3;
  orderedClips = self->super._orderedClips;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PXStoryConcreteMutableAutoEditClipCatalog_enumerateMutableClipsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC5F30;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)orderedClips enumerateObjectsUsingBlock:v7];
}

uint64_t __77__PXStoryConcreteMutableAutoEditClipCatalog_enumerateMutableClipsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateClipAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  orderedClips = self->super._orderedClips;
  id v6 = (void (**)(id, id))a4;
  id v7 = [(NSMutableArray *)orderedClips objectAtIndexedSubscript:a3];
  v6[2](v6, v7);
}

- (void)updateClipForDisplayAsset:(id)a3 usingBlock:(id)a4
{
  uint64_t v11 = (void (**)(id, void *))a4;
  clipIndicesByAssetUUID = self->super._clipIndicesByAssetUUID;
  id v7 = a3;
  if (objc_opt_respondsToSelector()) {
    [v7 alternateUUID];
  }
  else {
  id v8 = [v7 uuid];
  }

  id v9 = [(NSMutableDictionary *)clipIndicesByAssetUUID objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = -[NSMutableArray objectAtIndexedSubscript:](self->super._orderedClips, "objectAtIndexedSubscript:", [v9 unsignedIntegerValue]);
    v11[2](v11, v10);
  }
}

- (void)addClip:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = a3;
  id obj = [v13 displayAssets];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        clipIndicesByAssetUUID = self->super._clipIndicesByAssetUUID;
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->super._orderedClips, "count"));
        id v11 = v8;
        if (objc_opt_respondsToSelector()) {
          [v11 alternateUUID];
        }
        else {
        v12 = [v11 uuid];
        }

        [(NSMutableDictionary *)clipIndicesByAssetUUID setObject:v10 forKey:v12];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->super._orderedClips addObject:v13];
}

@end