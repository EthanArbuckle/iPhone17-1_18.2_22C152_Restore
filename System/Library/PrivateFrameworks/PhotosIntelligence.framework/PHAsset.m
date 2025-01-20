@interface PHAsset
@end

@implementation PHAsset

uint64_t __62__PHAsset_Curation__prefetchOnAssets_options_curationContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __85__PHAsset_Curation___populateAsset_withPersonUUIDs_consolidatedPersonUUIDs_petUUIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F14E88] localIdentifierWithUUID:a2];
}

uint64_t __85__PHAsset_Curation___populateAsset_withPersonUUIDs_consolidatedPersonUUIDs_petUUIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F14E88] localIdentifierWithUUID:a2];
}

uint64_t __85__PHAsset_Curation___populateAsset_withPersonUUIDs_consolidatedPersonUUIDs_petUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F14E88] localIdentifierWithUUID:a2];
}

void __98__PHAsset_Curation___filterPersonUUIDs_fromPersonUUIDsByAssetUUID_personUUIDByMergeCandidateUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [MEMORY[0x263EFFA08] setWithArray:a3];
  if ([v6 intersectsSet:*(void *)(a1 + 32)])
  {
    v7 = (void *)[v6 mutableCopy];
    [v7 intersectSet:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 40))
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v21 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v15 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14, (void)v20);
            v16 = (void *)v15;
            if (v15) {
              v17 = (void *)v15;
            }
            else {
              v17 = v14;
            }
            id v18 = v17;

            [v8 addObject:v18];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v11);
      }
    }
    else
    {
      id v8 = v7;
    }
    v19 = objc_msgSend(v8, "allObjects", (void)v20);
    [*(id *)(a1 + 48) setObject:v19 forKeyedSubscript:v5];
  }
}

void __73__PHAsset_Curation__verifiedPersonLocalIdentifiersByAssetUUIDWithAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_msgSend(a3, "_pl_map:", &__block_literal_global_1582);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t __73__PHAsset_Curation__verifiedPersonLocalIdentifiersByAssetUUIDWithAssets___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F14E88] localIdentifierWithUUID:a2];
}

@end