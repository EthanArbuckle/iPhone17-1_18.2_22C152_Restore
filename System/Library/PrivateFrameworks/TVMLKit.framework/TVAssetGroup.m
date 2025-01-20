@interface TVAssetGroup
@end

@implementation TVAssetGroup

void __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v29 = [WeakRetained[7] objectForKeyedSubscript:*(void *)(a1 + 32)];
    if (v29) {
      [*(id *)(a1 + 40) _removeAssetInfoForKey:*(void *)(a1 + 32) removeFile:0];
    }
    v4 = [*(id *)(a1 + 48) objectForKey:@"ATVAssetSize"];

    if (v4)
    {
      v5 = [*(id *)(a1 + 48) objectForKey:@"ATVAssetSize"];
      v3[6] = (char *)v3[6] + [v5 unsignedLongLongValue];
    }
    [v3[7] setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
    v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ATVAssetTags"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          v12 = [v3[8] objectForKeyedSubscript:v11];
          if (!v12)
          {
            v12 = [MEMORY[0x263EFF9C0] setWithCapacity:1];
            [v3[8] setObject:v12 forKeyedSubscript:v11];
          }
          [v12 addObject:*(void *)(a1 + 32)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v8);
    }

    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_2;
    v35[3] = &unk_264BA7740;
    id v36 = *(id *)(a1 + 48);
    int8x16_t v27 = *(int8x16_t *)(a1 + 32);
    id v13 = (id)v27.i64[0];
    int8x16_t v37 = vextq_s8(v27, v27, 8uLL);
    [v3 _updateManifestWithChange:v35];
    if (v3[6] > v3[4])
    {
      v14 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230B4C000, v14, OS_LOG_TYPE_DEFAULT, "Current cache size exceeds maximum cache size.  Starting to prune.", buf, 2u);
      }
      v15 = objc_msgSend(v3[7], "allKeys", v27.i64[0]);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_19;
      v34[3] = &unk_264BA8AB8;
      v34[4] = v3;
      v28 = v15;
      [v15 sortedArrayUsingComparator:v34];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v31;
        while (2)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            v22 = [v3[7] objectForKeyedSubscript:v21];
            v23 = v22;
            if ((double)(unint64_t)v3[4] * 0.95 > (double)(unint64_t)v3[6])
            {

              goto LABEL_30;
            }
            v24 = [v22 objectForKey:@"ATVAssetPath"];
            if ([v24 length]) {
              [*(id *)(a1 + 40) _removeAssetInfoForKey:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v44 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_30:

      v25 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v26;
        _os_log_impl(&dword_230B4C000, v25, OS_LOG_TYPE_DEFAULT, "Done freeing up cache space. %@", buf, 0xCu);
      }
    }
  }
}

void __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_2(uint64_t a1)
{
  id v7 = (id)[*(id *)(a1 + 32) mutableCopy];
  [v7 removeObjectForKey:@"ATVAsset"];
  [v7 removeObjectForKey:@"ATVAssetLastAccessedDate"];
  v2 = [v7 objectForKeyedSubscript:@"ATVAssetTags"];

  if (v2)
  {
    v3 = [v7 objectForKeyedSubscript:@"ATVAssetTags"];
    v4 = [v3 allObjects];
    [v7 setObject:v4 forKeyedSubscript:@"ATVAssetTags"];
  }
  v5 = (void *)[v7 copy];
  v6 = [*(id *)(a1 + 40) manifest];
  [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 48)];
}

uint64_t __43___TVAssetGroup_setAssetInfo_forKey_queue___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(*(void *)(a1 + 32) + 56);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [v7 valueForKeyPath:@"ATVAssetLastAccessedDate"];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v6];

  v10 = [v9 valueForKeyPath:@"ATVAssetLastAccessedDate"];

  uint64_t v11 = [v8 compare:v10];
  return v11;
}

void __39___TVAssetGroup_assetInfoForKey_queue___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[7] objectForKey:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    WeakRetained = v6;
  }
}

void __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAssetInfoForKey:*(void *)(a1 + 32)];
}

void __39___TVAssetGroup_assetInfoForKey_queue___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    uint64_t v3 = [WeakRetained[7] objectForKey:*(void *)(a1 + 32)];

    id WeakRetained = v8;
    if (v3)
    {
      uint64_t v4 = (void *)MEMORY[0x263EFF9A0];
      v5 = [v8[7] objectForKey:*(void *)(a1 + 32)];
      id v6 = [v4 dictionaryWithDictionary:v5];

      id v7 = [MEMORY[0x263EFF910] date];
      [v6 setObject:v7 forKey:@"ATVAssetLastAccessedDate"];

      [v8[7] setObject:v6 forKey:*(void *)(a1 + 32)];
      id WeakRetained = v8;
    }
  }
}

void __45___TVAssetGroup_removeAssetInfoForKey_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeAssetInfoForKey:*(void *)(a1 + 32)];
}

void __42___TVAssetGroup_removeAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[7] allKeys];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [v2 _removeAssetInfoForKey:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

void __43___TVAssetGroup_infoForAllAssetsWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    uint64_t v3 = [WeakRetained[7] copy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id WeakRetained = v6;
  }
}

void __48___TVAssetGroup_infoForAllAssetsWithTags_queue___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v3);
          }
          long long v9 = [WeakRetained[8] objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          long long v10 = v9;
          if (!v9)
          {

            uint64_t v6 = 0;
LABEL_16:

            goto LABEL_18;
          }
          if (v6)
          {
            [v6 intersectSet:v9];
            if (![v6 count]) {
              goto LABEL_16;
            }
          }
          else
          {
            uint64_t v6 = (void *)[v9 mutableCopy];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
LABEL_18:

    if ([v6 count])
    {
      long long v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * j);
            uint64_t v18 = objc_msgSend(WeakRetained[7], "objectForKeyedSubscript:", v17, (void)v22);
            [v11 setObject:v18 forKeyedSubscript:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v14);
      }

      uint64_t v19 = [v11 copy];
      uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
  }
}

void __51___TVAssetGroup__removeAssetInfoForKey_removeFile___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) manifest];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

id __38___TVAssetGroup_updateAssetsFromFiles__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v19[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    long long v8 = (void *)[v7 mutableCopy];

    long long v9 = [NSNumber numberWithUnsignedLongLong:a3];
    [v8 setObject:v9 forKeyedSubscript:@"ATVAssetSize"];

    long long v10 = [MEMORY[0x263EFF910] date];
    [v8 setObject:v10 forKeyedSubscript:@"ATVAssetLastAccessedDate"];

    long long v11 = [v8 objectForKeyedSubscript:@"ATVAssetTags"];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x263EFFA08];
      uint64_t v13 = [v8 objectForKeyedSubscript:@"ATVAssetTags"];
      uint64_t v14 = [v12 setWithArray:v13];
      [v8 setObject:v14 forKeyedSubscript:@"ATVAssetTags"];
    }
    uint64_t v15 = (void *)[v8 copy];
  }
  else
  {
    v18[0] = @"ATVAssetSize";
    long long v8 = [NSNumber numberWithUnsignedLongLong:a3];
    v19[0] = v8;
    v19[1] = v5;
    v18[1] = @"ATVAssetPath";
    v18[2] = @"ATVAssetLastAccessedDate";
    id v16 = [MEMORY[0x263EFF910] date];
    v19[2] = v16;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  }
  return v15;
}

void __43___TVAssetGroup__updateManifestWithChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _saveManifest];
    id WeakRetained = v2;
  }
}

@end