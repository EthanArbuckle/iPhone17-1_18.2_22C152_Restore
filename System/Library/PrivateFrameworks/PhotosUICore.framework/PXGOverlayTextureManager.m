@interface PXGOverlayTextureManager
- (BOOL)wantsOverlayTextures;
- (id)overlayTexturesByPresentationTypeForTextures:(id)a3 spriteDataStore:(id)a4;
@end

@implementation PXGOverlayTextureManager

- (BOOL)wantsOverlayTextures
{
  return self->_wantsOverlayTextures;
}

- (id)overlayTexturesByPresentationTypeForTextures:(id)a3 spriteDataStore:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [v5 objectForKeyedSubscript:&unk_1F02D89B0];
  if (v8)
  {
    v23 = v7;
    v9 = [MEMORY[0x1E4F1CA48] array];
    id v22 = v6;
    uint64_t v10 = [v6 infos];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v21 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isAtlas", v21) & 1) == 0)
          {
            v17 = [v16 spriteIndexes];
            unsigned int v18 = [v17 firstIndex];

            if (*(unsigned char *)(v10 + 40 * v18 + 1) == 2 && (*(unsigned char *)(v10 + 40 * v18 + 34) & 0x10) == 0)
            {
              v19 = [[PXGRemoteEffectOverlayTexture alloc] initWithMetalSpriteTexture:v16];
              [v9 addObject:v19];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    v7 = v23;
    [v23 setObject:v9 forKeyedSubscript:&unk_1F02D89C8];

    v8 = v21;
    id v6 = v22;
  }

  return v7;
}

@end