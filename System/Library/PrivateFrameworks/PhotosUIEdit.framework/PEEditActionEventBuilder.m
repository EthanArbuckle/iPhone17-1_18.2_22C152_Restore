@interface PEEditActionEventBuilder
- (BOOL)hasError;
- (PEEditActionEventBuilder)initWithActionDescription:(id)a3 assets:(id)a4;
- (PEEditActionEventBuilder)initWithBaseAction:(id)a3 assets:(id)a4;
- (id)buildEvents;
- (void)registerAction:(id)a3 forAssets:(id)a4;
- (void)registerActionType:(id)a3 forAssets:(id)a4;
- (void)setHasError:(BOOL)a3;
@end

@implementation PEEditActionEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsMap, 0);
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_baseAction, 0);
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (id)buildEvents
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  v4 = [(NSDictionary *)self->_assetsMap allKeys];
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  assetsMap = self->_assetsMap;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__PEEditActionEventBuilder_buildEvents__block_invoke;
  v15[3] = &unk_2642BEB40;
  id v16 = v6;
  id v8 = v6;
  [(NSDictionary *)assetsMap enumerateKeysAndObjectsUsingBlock:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__PEEditActionEventBuilder_buildEvents__block_invoke_2;
  v13[3] = &unk_2642BEB68;
  v13[4] = self;
  id v9 = v5;
  id v14 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v13];
  v10 = v14;
  id v11 = v9;

  return v11;
}

void __39__PEEditActionEventBuilder_buildEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) allKeys];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v5];
  }
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (([v9 containsObject:v10] & 1) == 0) {
    [v9 addObject:v10];
  }
}

void __39__PEEditActionEventBuilder_buildEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263EFF9A0];
  id v6 = a3;
  id v7 = a2;
  id v12 = objc_alloc_init(v5);
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasError"));
  [v12 setObject:v8 forKeyedSubscript:@"hasError"];

  [v12 setObject:v7 forKeyedSubscript:@"actionType"];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 8);
  if (v10)
  {
    id v11 = [v10 analyticsPayload];
    [v12 addEntriesFromDictionary:v11];

    uint64_t v9 = *(void *)(a1 + 32);
  }
  [v12 setObject:*(void *)(v9 + 16) forKeyedSubscript:@"actionDescription"];
  [v12 setObject:v6 forKeyedSubscript:*MEMORY[0x263F2F9F8]];

  [*(id *)(a1 + 40) addObject:v12];
}

- (void)registerActionType:(id)a3 forAssets:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  assetsMap = self->_assetsMap;
  if (!assetsMap)
  {
    uint64_t v9 = (NSDictionary *)objc_alloc_init(NSDictionary);
    id v10 = self->_assetsMap;
    self->_assetsMap = v9;

    assetsMap = self->_assetsMap;
  }
  id v11 = (void *)[(NSDictionary *)assetsMap mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v11, "setObject:forKey:", v6, *(void *)(*((void *)&v19 + 1) + 8 * v16++), (void)v19);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  v17 = (NSDictionary *)[v11 copy];
  v18 = self->_assetsMap;
  self->_assetsMap = v17;
}

- (void)registerAction:(id)a3 forAssets:(id)a4
{
  id v8 = a4;
  unint64_t v6 = [a3 actionType] - 1;
  if (v6 > 7) {
    id v7 = @"Unknown";
  }
  else {
    id v7 = off_2642BEB88[v6];
  }
  [(PEEditActionEventBuilder *)self registerActionType:v7 forAssets:v8];
}

- (PEEditActionEventBuilder)initWithActionDescription:(id)a3 assets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PEEditActionEventBuilder;
  uint64_t v9 = [(PEEditActionEventBuilder *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionDescription, a3);
    [(PEEditActionEventBuilder *)v10 registerActionType:v7 forAssets:v8];
  }

  return v10;
}

- (PEEditActionEventBuilder)initWithBaseAction:(id)a3 assets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PEEditActionEventBuilder;
  uint64_t v9 = [(PEEditActionEventBuilder *)&v12 init];
  id v10 = v9;
  if (v7 && v9)
  {
    objc_storeStrong((id *)&v9->_baseAction, a3);
    [(PEEditActionEventBuilder *)v10 registerAction:v10->_baseAction forAssets:v8];
  }

  return v10;
}

@end