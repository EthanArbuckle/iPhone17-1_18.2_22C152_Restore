@interface PXSearchResultsDataUtility
+ (BOOL)sectionIsHighlightsSection:(id)a3;
+ (id)_bestParentWordEmbeddingsWithWordEmbeddings:(id)a3 sceneAncestoryInformation:(id)a4;
+ (id)imageForSearchUserCategory:(unint64_t)a3 useSearchFieldStyle:(BOOL)a4;
+ (id)sectionTitleFromSearchResultSection:(id)a3 shouldCombineAssetsSections:(BOOL)a4;
+ (id)sortedWordEmbeddingsForCurrentQueryFromSubstitutions:(id)a3;
+ (id)stringWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 dateComponents:(id)a6 dateIntervalFormatter:(id)a7;
+ (id)subtitleForSearchResult:(id)a3;
+ (id)titleForSearchResult:(id)a3;
+ (id)wordEmbeddingSubstitutionsForSearchText:(id)a3 wantsSubstitutedString:(BOOL)a4 sceneAncestoryInformation:(id)a5 substitutions:(id)a6;
+ (void)suggestionsDisplayDataFromSuggestion:(id)a3 searchText:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6 isTextCompletion:(BOOL)a7 completion:(id)a8;
+ (void)suggestionsDisplayDataFromToken:(id)a3 orSuggestion:(id)a4 searchText:(id)a5 matchedColor:(id)a6 remainingColor:(id)a7 isTextCompletion:(BOOL)a8 completion:(id)a9;
+ (void)suggestionsDisplayDataFromToken:(id)a3 searchText:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6 isTextCompletion:(BOOL)a7 completion:(id)a8;
@end

@implementation PXSearchResultsDataUtility

+ (BOOL)sectionIsHighlightsSection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 categoryMask];
  unint64_t v5 = [v3 resultTypes];

  BOOL v6 = (v5 >> 1) & 1;
  if (v4 == 4096) {
    LOBYTE(v6) = 0;
  }
  return v4 != 256 && v6;
}

+ (id)sectionTitleFromSearchResultSection:(id)a3 shouldCombineAssetsSections:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 categoryMask];
  BOOL v7 = +[PXSearchResultsDataUtility sectionIsHighlightsSection:v5];

  if (v7)
  {
    v8 = @"SEARCH_RESULT_SECTION_HEADER_PHOTO_MOMENTS";
LABEL_9:
    v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
    goto LABEL_10;
  }
  if (v6 == 4096)
  {
    v8 = @"SEARCH_RESULT_SECTION_HEADER_MEMORIES";
    goto LABEL_9;
  }
  if (v6 == 256)
  {
    v8 = @"SEARCH_RESULT_SECTION_HEADER_ALBUMS";
    goto LABEL_9;
  }
  if (v4)
  {
    v8 = @"SEARCH_RESULT_SECTION_HEADER_OTHER_RESULTS";
    goto LABEL_9;
  }
  v9 = +[PXSearchResultsSection sectionTitleForCategoryMask:v6];
LABEL_10:
  return v9;
}

+ (id)stringWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 dateComponents:(id)a6 dateIntervalFormatter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  objc_msgSend(v12, "setEra:", objc_msgSend(v15, "era"));
  objc_msgSend(v12, "setYear:", objc_msgSend(v15, "year"));
  objc_msgSend(v12, "setMonth:", objc_msgSend(v15, "month"));
  uint64_t v16 = [v15 day];

  [v12 setDay:v16];
  v17 = [v13 dateFromComponents:v12];
  objc_msgSend(v12, "setEra:", objc_msgSend(v14, "era"));
  objc_msgSend(v12, "setYear:", objc_msgSend(v14, "year"));
  objc_msgSend(v12, "setMonth:", objc_msgSend(v14, "month"));
  uint64_t v18 = [v14 day];

  [v12 setDay:v18];
  v19 = [v13 dateFromComponents:v12];

  v20 = [v11 stringFromDate:v17 toDate:v19];

  return v20;
}

+ (id)sortedWordEmbeddingsForCurrentQueryFromSubstitutions:(id)a3
{
  id v4 = a3;
  if (!sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn
    || ([(id)sortedWordEmbeddingsForCurrentQueryFromSubstitutions__previousWordEmbeddings isEqualToDictionary:v4] & 1) == 0)
  {
    objc_storeStrong((id *)&sortedWordEmbeddingsForCurrentQueryFromSubstitutions__previousWordEmbeddings, a3);
    id v5 = [v4 allValues];
    uint64_t v6 = [v5 firstObject];

    BOOL v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_226];
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__212455;
    id v15 = __Block_byref_object_dispose__212456;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__PXSearchResultsDataUtility_sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke_2;
    v10[3] = &unk_1E5DC5938;
    v10[4] = &v11;
    [v7 enumerateObjectsUsingBlock:v10];
    objc_storeStrong((id *)&sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn, (id)v12[5]);
    _Block_object_dispose(&v11, 8);
  }
  id v8 = (id)sortedWordEmbeddingsForCurrentQueryFromSubstitutions__wordEmbeddingsToReturn;

  return v8;
}

void __83__PXSearchResultsDataUtility_sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v17 = a1;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = *MEMORY[0x1E4F8B708];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) allValues];
        id v11 = [v10 firstObject];

        id v12 = [v11 firstObject];
        uint64_t v13 = [v12 objectForKey:v8];

        id v14 = [v3 objectForKey:v8];
        int v15 = [v14 isEqualToString:v13];

        if (v15)
        {
          [v11 addObject:v3];

          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    a1 = v17;
  }
  else
  {

    uint64_t v8 = *MEMORY[0x1E4F8B708];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v11 addObject:v3];
  id v16 = [v3 objectForKey:v8];
  [v4 setObject:v11 forKey:v16];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
LABEL_13:
}

BOOL __83__PXSearchResultsDataUtility_sortedWordEmbeddingsForCurrentQueryFromSubstitutions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F8B708];
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F8B708]];
  uint64_t v8 = [v5 objectForKey:v6];
  if ([v7 isEqualToString:v8])
  {
    uint64_t v9 = *MEMORY[0x1E4F8B710];
    v10 = [v4 objectForKey:*MEMORY[0x1E4F8B710]];
    id v11 = [v5 objectForKey:v9];
    uint64_t v12 = [v10 compare:v11];
    if (!v12)
    {
      uint64_t v13 = *MEMORY[0x1E4F8B718];
      id v14 = [v4 objectForKey:*MEMORY[0x1E4F8B718]];
      int v15 = [v5 objectForKey:v13];
      uint64_t v12 = [v14 caseInsensitiveCompare:v15];
    }
    BOOL v16 = v12 == -1;
  }
  else
  {
    unint64_t v17 = [v7 length];
    unint64_t v18 = [v8 length];
    if (v17 == v18)
    {
      uint64_t v19 = *MEMORY[0x1E4F8B718];
      long long v20 = [v4 objectForKey:*MEMORY[0x1E4F8B718]];
      long long v21 = [v5 objectForKey:v19];
      BOOL v16 = [v20 caseInsensitiveCompare:v21] == -1;
    }
    else
    {
      BOOL v16 = v17 > v18;
    }
  }

  return v16;
}

+ (id)_bestParentWordEmbeddingsWithWordEmbeddings:(id)a3 sceneAncestoryInformation:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v36 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (!v9)
  {
    id v11 = 0;
    v30 = 0;
    id v18 = v8;
LABEL_21:

    goto LABEL_23;
  }
  uint64_t v10 = v9;
  id v11 = 0;
  uint64_t v12 = *(void *)v42;
  uint64_t v13 = *MEMORY[0x1E4F8B718];
  obuint64_t j = v8;
  uint64_t v35 = *MEMORY[0x1E4F8B708];
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v42 != v12) {
        objc_enumerationMutation(obj);
      }
      int v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      BOOL v16 = [v15 objectForKeyedSubscript:v13];
      [v7 addObject:v16];
      unint64_t v17 = [v6 objectForKeyedSubscript:v16];
      if (v17)
      {
        [v36 addObject:v17];
        if (!v11)
        {
          id v11 = [v15 objectForKeyedSubscript:v35];
        }
      }
    }
    id v8 = obj;
    uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  }
  while (v10);

  if (v11)
  {
    v32 = v7;
    id v33 = v6;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = v36;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      uint64_t v23 = *MEMORY[0x1E4F8B710];
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          v25 = v18;
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          uint64_t v27 = [v19 countForObject:v26];
          v46[0] = v11;
          v45[0] = v35;
          v45[1] = v23;
          v28 = [NSNumber numberWithUnsignedInteger:v27];
          v45[2] = v13;
          v46[1] = v28;
          v46[2] = v26;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];

          id v18 = v25;
          [v25 addObject:v29];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v21);
    }

    v30 = [v18 sortedArrayUsingComparator:&__block_literal_global_212464];
    id v6 = v33;
    id v8 = obj;
    uint64_t v7 = v32;
    goto LABEL_21;
  }
  v30 = 0;
LABEL_23:

  return v30;
}

uint64_t __100__PXSearchResultsDataUtility__bestParentWordEmbeddingsWithWordEmbeddings_sceneAncestoryInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F8B710];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B710]];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v10 = [v5 objectForKeyedSubscript:v6];
  [v10 doubleValue];
  double v12 = v11;

  if (v9 > v12) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v9 < v12;
  }
  if (!v13)
  {
    uint64_t v14 = *MEMORY[0x1E4F8B718];
    int v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8B718]];
    BOOL v16 = [v5 objectForKeyedSubscript:v14];
    uint64_t v13 = [v15 compare:v16];
  }
  return v13;
}

+ (id)wordEmbeddingSubstitutionsForSearchText:(id)a3 wantsSubstitutedString:(BOOL)a4 sceneAncestoryInformation:(id)a5 substitutions:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  double v12 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v13 = a6;
  id v14 = objc_alloc_init(v12);
  int v15 = [a1 sortedWordEmbeddingsForCurrentQueryFromSubstitutions:v13];

  BOOL v16 = +[PXSearchDisplayUtility layoutDirectionIsRTL];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke;
  v24[3] = &unk_1E5DC58F0;
  id v25 = v15;
  id v26 = v11;
  BOOL v30 = a4;
  BOOL v31 = v16;
  id v29 = a1;
  id v27 = v10;
  id v17 = v14;
  id v28 = v17;
  id v18 = v10;
  id v19 = v11;
  id v20 = v15;
  [v20 enumerateObjectsUsingBlock:v24];
  uint64_t v21 = v28;
  id v22 = v17;

  return v22;
}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  unint64_t v9 = [v7 count];
  id v10 = [v8 allKeys];
  id v44 = [v10 firstObject];

  id v11 = [v8 objectForKey:v44];

  double v12 = [*(id *)(a1 + 64) _bestParentWordEmbeddingsWithWordEmbeddings:v11 sceneAncestoryInformation:*(void *)(a1 + 40)];
  id v13 = v12;
  if (v9 < 2)
  {
    if (v12)
    {
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v12];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2;
      v50[3] = &unk_1E5DC58A0;
      id v51 = v11;
      id v18 = v11;
      [v17 enumerateObjectsUsingBlock:v50];
      [v17 addObjectsFromArray:v18];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2_218;
      void v45[3] = &unk_1E5DC58C8;
      __int16 v49 = *(_WORD *)(a1 + 72);
      id v46 = v44;
      id v47 = *(id *)(a1 + 48);
      id v48 = *(id *)(a1 + 56);
      id v19 = v44;
      [v17 enumerateObjectsUsingBlock:v45];

      return;
    }
  }
  else if (v12)
  {
    id v14 = [v12 firstObject];
    int v15 = [v14 objectForKey:*MEMORY[0x1E4F8B718]];

    if (*(unsigned char *)(a1 + 72))
    {
      BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v15];
    }
    else
    {
      long long v42 = v15;
      long long v43 = a4;
      if (*(unsigned char *)(a1 + 73))
      {
        uint64_t v20 = PXLocalizedStringFromTable(@"SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_RTL", @"PhotosUICore");
        id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
        [NSString stringWithFormat:@"%@ %@ %@", v15, v20, v44];
      }
      else
      {
        uint64_t v20 = PXLocalizedStringFromTable(@"SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_LTR", @"PhotosUICore");
        id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
        [NSString stringWithFormat:@"%@ %@ %@", v44, v20, v15];
      id v22 = };
      BOOL v16 = (void *)[v21 initWithString:v22];
      long long v40 = (void *)v20;

      uint64_t v23 = [v16 string];
      uint64_t v24 = [v23 rangeOfString:v20];
      uint64_t v36 = v25;
      uint64_t v37 = v24;
      id v26 = *(void **)(a1 + 48);
      id v27 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      long long v41 = [v26 stringByTrimmingCharactersInSet:v27];

      uint64_t v35 = [v23 rangeOfString:v41];
      uint64_t v29 = v28;
      uint64_t v39 = [v23 rangeOfString:v44] + v28;
      uint64_t v38 = v30 - v29;
      uint64_t v31 = *MEMORY[0x1E4FB0700];
      v32 = +[PXSearchDisplayUtility wordEmbeddingTextColor];
      objc_msgSend(v16, "addAttribute:value:range:", v31, v32, v37, v36);

      id v33 = +[PXSearchDisplayUtility wordEmbeddingTextColor];
      objc_msgSend(v16, "addAttribute:value:range:", v31, v33, v35, v29);

      v34 = +[PXSearchDisplayUtility wordEmbeddingPathColor];
      objc_msgSend(v16, "addAttribute:value:range:", v31, v34, v39, v38);

      int v15 = v42;
      a4 = v43;
    }
    [*(id *)(a1 + 56) addObject:v16];
    if (a3 >= 3) {
      *a4 = 1;
    }
  }
}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  BOOL v16 = __Block_byref_object_copy__212455;
  id v17 = __Block_byref_object_dispose__212456;
  id v18 = 0;
  id v4 = *(void **)(a1 + 32);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  unint64_t v9 = __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_216;
  id v10 = &unk_1E5DC5878;
  id v5 = v3;
  id v11 = v5;
  double v12 = &v13;
  [v4 enumerateObjectsUsingBlock:&v7];
  if (v14[5])
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v7, v8, v9, v10);
    uint64_t v6 = (void *)v14[5];
    v14[5] = 0;
  }
  _Block_object_dispose(&v13, 8);
}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_2_218(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v31 = [a2 objectForKey:*MEMORY[0x1E4F8B718]];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v31];
  }
  else
  {
    unint64_t v29 = a3;
    uint64_t v30 = a4;
    if (*(unsigned char *)(a1 + 57))
    {
      uint64_t v8 = PXLocalizedStringFromTable(@"SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_RTL", @"PhotosUICore");
      id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
      [NSString stringWithFormat:@"%@ %@ %@", v31, v8, *(void *)(a1 + 32)];
    }
    else
    {
      uint64_t v8 = PXLocalizedStringFromTable(@"SEARCH_RESULTS_WORD_EMBEDDINGS_SUBSTITUTION_ARROW_LTR", @"PhotosUICore");
      id v9 = objc_alloc(MEMORY[0x1E4F28E48]);
      [NSString stringWithFormat:@"%@ %@ %@", *(void *)(a1 + 32), v8, v31];
    id v10 = };
    uint64_t v7 = (void *)[v9 initWithString:v10];
    uint64_t v28 = (void *)v8;

    id v11 = [v7 string];
    uint64_t v25 = [v11 rangeOfString:v8];
    uint64_t v13 = v12;
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    BOOL v16 = [v14 stringByTrimmingCharactersInSet:v15];

    uint64_t v17 = [v11 rangeOfString:v16];
    uint64_t v19 = v18;
    uint64_t v27 = [v11 rangeOfString:*(void *)(a1 + 32)] + v18;
    uint64_t v26 = v20 - v19;
    uint64_t v21 = *MEMORY[0x1E4FB0700];
    id v22 = +[PXSearchDisplayUtility wordEmbeddingTextColor];
    objc_msgSend(v7, "addAttribute:value:range:", v21, v22, v25, v13);

    uint64_t v23 = +[PXSearchDisplayUtility wordEmbeddingTextColor];
    objc_msgSend(v7, "addAttribute:value:range:", v21, v23, v17, v19);

    uint64_t v24 = +[PXSearchDisplayUtility wordEmbeddingPathColor];
    objc_msgSend(v7, "addAttribute:value:range:", v21, v24, v27, v26);

    a3 = v29;
    a4 = v30;
  }
  [*(id *)(a1 + 48) addObject:v7];
  if (a3 >= 3) {
    *a4 = 1;
  }
}

void __133__PXSearchResultsDataUtility_wordEmbeddingSubstitutionsForSearchText_wantsSubstitutedString_sceneAncestoryInformation_substitutions___block_invoke_216(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *MEMORY[0x1E4F8B718];
  id v12 = v7;
  id v9 = [v7 objectForKey:*MEMORY[0x1E4F8B718]];
  id v10 = [*(id *)(a1 + 32) objectForKey:v8];
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)subtitleForSearchResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 collectionUUID];

  if (v4)
  {
    uint64_t v5 = [v3 collectionSubtitle];
LABEL_3:
    uint64_t v6 = (void *)v5;
    goto LABEL_12;
  }
  if ([v3 itemType] == 1)
  {
    if ([v3 searchCategories]) {
      LODWORD(v7) = 1;
    }
    else {
      unint64_t v7 = ((unint64_t)[v3 searchCategories] >> 9) & 1;
    }
    if (([v3 searchCategories] & 0x20000000000) != 0
      || (v7 | ((unint64_t)[v3 searchCategories] >> 42) & 1) == 1)
    {
      uint64_t v5 = [v3 displaySubtitle];
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
LABEL_12:

  return v6;
}

+ (id)titleForSearchResult:(id)a3
{
  id v3 = a3;
  id v4 = +[PXSearchDisplayUtility defaultStringAttributes];
  uint64_t v5 = [v3 collectionUUID];

  if (v5)
  {
    uint64_t v6 = [v3 collectionTitle];
    unint64_t v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v8 = objc_msgSend(v6, "px_stringByDeletingCharactersInSet:", v7);
LABEL_3:
    id v9 = (void *)v8;

    goto LABEL_4;
  }
  if ([v3 itemType] == 1)
  {
    uint64_t v6 = [v3 person];
    if (v6)
    {
      unint64_t v7 = [v3 person];
      objc_msgSend(v7, "px_localizedName");
    }
    else
    {
      unint64_t v7 = [v3 displayTitleWithDefaultAttributes:v4 dimmedAttributes:v4 selectedDisplayTitle:0];
      [v7 string];
    uint64_t v8 = };
    goto LABEL_3;
  }
  id v9 = 0;
LABEL_4:
  if ([v3 isOCRStringMatchedResult])
  {
    id v10 = PXLocalizedStringFromTable(@"SEARCH_RESULT_OCR_RESULT_TITLE_FORMAT", @"PhotosUICore");
    uint64_t v11 = PXStringWithValidatedFormat();

    id v9 = (void *)v11;
  }

  return v9;
}

+ (id)imageForSearchUserCategory:(unint64_t)a3 useSearchFieldStyle:(BOOL)a4
{
  if (!a4 || (id v4 = 0, a3) && a3 != 13)
  {
    uint64_t v5 = +[PXNewSearchToken symbolNameForSearchUserCategory:a3];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[PXNewSearchToken symbolNameForSearchUserCategory:0];
    }
    uint64_t v8 = v7;

    if (+[PXImageUtilities symbolIsEmbeddedGlyph:v8]) {
      [MEMORY[0x1E4FB1818] imageNamed:v8];
    }
    else {
    id v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:v8];
    }
  }
  return v4;
}

+ (void)suggestionsDisplayDataFromToken:(id)a3 orSuggestion:(id)a4 searchText:(id)a5 matchedColor:(id)a6 remainingColor:(id)a7 isTextCompletion:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v27 = a3;
  id v14 = a4;
  uint64_t v15 = (__CFString *)a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  if (v14)
  {
    uint64_t v19 = objc_msgSend(v14, "px_symbolName");
    if (+[PXImageUtilities symbolIsEmbeddedGlyph:v19]) {
      [MEMORY[0x1E4FB1818] imageNamed:v19];
    }
    else {
    uint64_t v23 = [MEMORY[0x1E4FB1818] _systemImageNamed:v19];
    }
    if (v9)
    {
      uint64_t v24 = [v14 text];
      if (v15) {
        uint64_t v25 = v15;
      }
      else {
        uint64_t v25 = &stru_1F00B0030;
      }
      uint64_t v26 = +[PXSearchDisplayUtility highlightedAttributedStringForString:v24 highlightedSubstring:v25 matchedColor:v16 remainingColor:v17];

      (*((void (**)(id, void, void *, void, void *))v18 + 2))(v18, 0, v26, 0, v23);
    }
    else
    {
      uint64_t v26 = [v27 suggestionText];
      (*((void (**)(id, void *, void, void, void *))v18 + 2))(v18, v26, 0, 0, v23);
    }
  }
  else
  {
    uint64_t v19 = +[PXSearchResultsDataUtility imageForSearchUserCategory:useSearchFieldStyle:](PXSearchResultsDataUtility, "imageForSearchUserCategory:useSearchFieldStyle:", [v27 userCategory], 0);
    uint64_t v20 = [v27 resultCount];
    if (v9)
    {
      uint64_t v21 = [v27 suggestionText];
      if (v15) {
        id v22 = v15;
      }
      else {
        id v22 = &stru_1F00B0030;
      }
      uint64_t v23 = +[PXSearchDisplayUtility highlightedAttributedStringForString:v21 highlightedSubstring:v22 matchedColor:v16 remainingColor:v17];

      (*((void (**)(id, void, void *, uint64_t, void *))v18 + 2))(v18, 0, v23, v20, v19);
    }
    else
    {
      uint64_t v23 = [v27 suggestionText];
      (*((void (**)(id, void *, void, uint64_t, void *))v18 + 2))(v18, v23, 0, v20, v19);
    }
  }
}

+ (void)suggestionsDisplayDataFromSuggestion:(id)a3 searchText:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6 isTextCompletion:(BOOL)a7 completion:(id)a8
{
}

+ (void)suggestionsDisplayDataFromToken:(id)a3 searchText:(id)a4 matchedColor:(id)a5 remainingColor:(id)a6 isTextCompletion:(BOOL)a7 completion:(id)a8
{
}

@end