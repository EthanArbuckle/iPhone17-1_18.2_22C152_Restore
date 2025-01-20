@interface PHPhotosHighlight(SharingSuggestionContainer)
- (__CFString)px_sl_title;
- (id)px_sl_containedSharingSuggestionObjectIDs;
- (id)px_sl_containedSharingSuggestions;
- (id)px_sl_fetchAssetCollections;
- (void)px_sl_getKeyAsset:()SharingSuggestionContainer suggestedDate:locations:;
@end

@implementation PHPhotosHighlight(SharingSuggestionContainer)

- (id)px_sl_containedSharingSuggestionObjectIDs
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  v2 = [a1 objectID];
  v3 = [v1 setWithObject:v2];

  return v3;
}

- (id)px_sl_containedSharingSuggestions
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a1;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  return v1;
}

- (void)px_sl_getKeyAsset:()SharingSuggestionContainer suggestedDate:locations:
{
  v108[1] = *MEMORY[0x1E4F143B8];
  v7 = [a1 photoLibrary];
  v8 = [v7 librarySpecificFetchOptions];

  [v8 setWantsIncrementalChangeDetails:0];
  v108[0] = *MEMORY[0x1E4F39458];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:1];
  [v8 setFetchPropertySets:v9];

  v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = (void *)MEMORY[0x1E4F28F60];
  v12 = [a1 objectID];
  v13 = [v11 predicateWithFormat:@"highlightBeingAssets.parentPhotosHighlight == %@", v12];
  [v10 addObject:v13];

  v14 = PLManagedAssetPredicateToFetchAssetsSuggestedForSharing();
  [v10 addObject:v14];

  v15 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
  [v8 setInternalPredicate:v15];

  v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
  v107 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
  [v8 setInternalSortDescriptors:v17];

  [v8 setSharingFilter:0];
  [v8 setUseNoIndexOnSharingFilter:1];
  v18 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v8];
  v19 = [v18 firstObject];

  v73 = v19;
  v20 = [v19 curationProperties];
  *a4 = [v20 addedDate];

  v21 = (void *)MEMORY[0x1E4F39238];
  v106 = a1;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
  v23 = [v21 fetchHighlightsInSharedLibrarySharingSuggestions:v22];

  id v78 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v24 = [a1 photoLibrary];
  v25 = [v24 librarySpecificFetchOptions];

  [v25 setWantsIncrementalChangeDetails:0];
  v77 = v25;
  v26 = (void *)[v25 copy];
  v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
  v105[0] = v27;
  v28 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v105[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
  v76 = v26;
  [v26 setInternalSortDescriptors:v29];

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  obuint64_t j = v23;
  uint64_t v30 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v97;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v97 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v96 + 1) + 8 * i);
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v36 = [MEMORY[0x1E4F38EE8] fetchMomentsInHighlight:v34 options:v77];
        long long v92 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v92 objects:v103 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v93 != v39) {
                objc_enumerationMutation(v36);
              }
              v41 = [*(id *)(*((void *)&v92 + 1) + 8 * j) localizedLocationNames];
              if ([v41 count]) {
                [v35 addObjectsFromArray:v41];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v92 objects:v103 count:16];
          }
          while (v38);
        }
        v42 = (void *)[v35 copy];
        [v79 setObject:v42 forKeyedSubscript:v34];

        v43 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v34 options:v76];
        [v78 setObject:v43 forKeyedSubscript:v34];
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v96 objects:v104 count:16];
    }
    while (v31);
  }

  v44 = [v78 keysSortedByValueUsingComparator:&__block_literal_global_517];
  v45 = (void *)[v44 mutableCopy];

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v46 = v45;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v89;
    while (2)
    {
      for (uint64_t k = 0; k != v48; ++k)
      {
        if (*(void *)v89 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v88 + 1) + 8 * k);
        v52 = [v78 objectForKeyedSubscript:v51];
        v53 = [v52 firstObject];

        if (v53)
        {
          id v54 = v51;

          id v55 = v53;
          *a3 = v55;
          id v71 = v55;
          if (v54)
          {
            [v46 removeObject:v54];
            v70 = v54;
            [v46 insertObject:v54 atIndex:0];
          }
          else
          {
            v70 = 0;
          }
          goto LABEL_29;
        }
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v88 objects:v102 count:16];
      if (v48) {
        continue;
      }
      break;
    }
  }

  v70 = 0;
  id v71 = 0;
  *a3 = 0;
LABEL_29:
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v57 = v46;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v84 objects:v101 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v85;
    do
    {
      for (uint64_t m = 0; m != v59; ++m)
      {
        if (*(void *)v85 != v60) {
          objc_enumerationMutation(v57);
        }
        uint64_t v62 = *(void *)(*((void *)&v84 + 1) + 8 * m);
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        v63 = [v79 objectForKeyedSubscript:v62];
        uint64_t v64 = [v63 countByEnumeratingWithState:&v80 objects:v100 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v81;
LABEL_36:
          uint64_t v67 = 0;
          while (1)
          {
            if (*(void *)v81 != v66) {
              objc_enumerationMutation(v63);
            }
            uint64_t v68 = *(void *)(*((void *)&v80 + 1) + 8 * v67);
            if (([v56 containsObject:v68] & 1) == 0)
            {
              [v56 addObject:v68];
              if ((unint64_t)[v56 count] > 3) {
                break;
              }
            }
            if (v65 == ++v67)
            {
              uint64_t v65 = [v63 countByEnumeratingWithState:&v80 objects:v100 count:16];
              if (v65) {
                goto LABEL_36;
              }
              break;
            }
          }
        }
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v84 objects:v101 count:16];
    }
    while (v59);
  }

  v69 = [v56 array];
  *a5 = (id)[v69 copy];
}

- (id)px_sl_fetchAssetCollections
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F39238];
  v5[0] = a1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  v3 = [v1 fetchHighlightsInSharedLibrarySharingSuggestions:v2];

  return v3;
}

- (__CFString)px_sl_title
{
  uint64_t v2 = [a1 startDate];
  if (v2
    && (v3 = (void *)v2,
        [a1 endDate],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    v5 = [a1 startDate];
    v6 = [a1 endDate];
    v7 = [v5 earlierDate:v6];

    v8 = [a1 startDate];
    v9 = [a1 endDate];
    v10 = [v8 laterDate:v9];

    [v10 timeIntervalSinceDate:v7];
    v12 = [v7 dateByAddingTimeInterval:v11 * 0.5];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 duration:0.0];
    _localizedSuggestionTitleForDateInterval(v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1F00B0030;
  }
  return v14;
}

@end