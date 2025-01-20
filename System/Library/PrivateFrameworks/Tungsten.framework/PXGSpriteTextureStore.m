@interface PXGSpriteTextureStore
- (PXGSpriteTextureStore)init;
- (id)storedTextureForTexture:(id)a3 key:(id)a4 presentationType:(unsigned __int8)a5 policy:(unsigned __int8)a6;
- (id)textureForKey:(id)a3 presentationType:(unsigned __int8)a4;
- (void)enumerateTexturesWithHandler:(id)a3;
- (void)removeAllTexturesForPresentationType:(unsigned __int8)a3;
- (void)storeTexture:(id)a3 forKey:(id)a4 presentationType:(unsigned __int8)a5;
@end

@implementation PXGSpriteTextureStore

- (void)enumerateTexturesWithHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, char *))a3;
  unint64_t v5 = 0;
  char v16 = 0;
  textureByKeyByPresentationType = self->_textureByKeyByPresentationType;
  do
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = [(NSMapTable *)textureByKeyByPresentationType[v5] objectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11), &v16);
        if (v16) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if (v5 > 1) {
      break;
    }
    ++v5;
  }
  while (!v16);
}

- (id)storedTextureForTexture:(id)a3 key:(id)a4 presentationType:(unsigned __int8)a5 policy:(unsigned __int8)a6
{
  int v6 = a6;
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (v6
    || ([(PXGSpriteTextureStore *)self textureForKey:v11 presentationType:v7],
        (id v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    [(PXGSpriteTextureStore *)self storeTexture:v10 forKey:v11 presentationType:v7];
    id v12 = v10;
  }

  return v12;
}

- (id)textureForKey:(id)a3 presentationType:(unsigned __int8)a4
{
  return [(NSMapTable *)self->_textureByKeyByPresentationType[a4] objectForKey:a3];
}

- (void)storeTexture:(id)a3 forKey:(id)a4 presentationType:(unsigned __int8)a5
{
}

- (PXGSpriteTextureStore)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXGSpriteTextureStore;
  v2 = [(PXGSpriteTextureStore *)&v7 init];
  if (v2)
  {
    for (uint64_t i = 8; i != 32; i += 8)
    {
      uint64_t v4 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
      unint64_t v5 = *(Class *)((char *)&v2->super.isa + i);
      *(Class *)((char *)&v2->super.isa + i) = (Class)v4;
    }
  }
  return v2;
}

- (void).cxx_destruct
{
  uint64_t v3 = 24;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)removeAllTexturesForPresentationType:(unsigned __int8)a3
{
}

@end