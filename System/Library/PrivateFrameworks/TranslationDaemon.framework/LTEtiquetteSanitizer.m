@interface LTEtiquetteSanitizer
@end

@implementation LTEtiquetteSanitizer

void __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  id v15 = *(id *)(a1 + 32);
  v7 = [v5 lowercaseString];
  uint64_t v8 = [v5 length];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke_35;
  v9[3] = &unk_265546EB8;
  v9[4] = &v10;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v9);

  [(id)v11[5] setObject:v6 forKeyedSubscript:@"TOKEN"];
  _Block_object_dispose(&v10, 8);
}

void __50___LTEtiquetteSanitizer_treeForReplacementTokens___block_invoke_35(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:");

  if (!v3)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v4 forKeyedSubscript:v8];
  }
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v8];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __42___LTEtiquetteSanitizer_matchesForString___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    v25 = WeakRetained;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v15 = objc_msgSend(v14, "node", v25);
          uint64_t v16 = [v15 objectForKeyedSubscript:v6];
          uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
          v18 = *(void **)(v17 + 40);
          *(void *)(v17 + 40) = v16;

          if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
          {
            v33.location = [v14 range];
            v34.location = a3;
            v34.length = a4;
            NSRange v19 = NSUnionRange(v33, v34);
            objc_msgSend(v14, "setRange:", v19.location, v19.length);
            [v14 setNode:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
          }
          else
          {
            v20 = [v14 node];
            v21 = [v20 objectForKeyedSubscript:@"TOKEN"];

            if (v21)
            {
              [v14 setToken:v21];
              [*(id *)(a1 + 40) addObject:v14];
            }
            [*(id *)(a1 + 48) addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    id v8 = v25;
    v22 = [v25[1] objectForKeyedSubscript:v6];
    if (v22)
    {
      v23 = *(void **)(a1 + 32);
      v24 = -[_LTMatch initWithNode:range:]([_LTMatch alloc], "initWithNode:range:", v22, a3, a4);
      [v23 addObject:v24];
    }
    objc_msgSend(*(id *)(a1 + 32), "removeObjectsInArray:", *(void *)(a1 + 48), v25);
    [*(id *)(a1 + 48) removeAllObjects];
  }
}

uint64_t __61___LTEtiquetteSanitizer_replacementStringForString_forToken___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 isEqualToString:@"*"];
  if (result)
  {
    id v8 = *(void **)(a1 + 32);
    return objc_msgSend(v8, "replaceCharactersInRange:withString:", a3, a4, @"*");
  }
  return result;
}

@end