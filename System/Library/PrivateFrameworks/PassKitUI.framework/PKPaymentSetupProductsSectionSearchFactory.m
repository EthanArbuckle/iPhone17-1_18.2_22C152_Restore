@interface PKPaymentSetupProductsSectionSearchFactory
+ (double)_distanceBetweenTerms:(id)a3 andSearchTerms:(id)a4;
+ (id)_cleanedSearchTermsFromString:(id)a3 usingTokenizerCharacterSet:(id)a4;
+ (id)_createSortedSectionsListFromFilteredListItems:(id)a3;
+ (id)_filteredListItemsFromSearchFilter:(id)a3 withContext:(id)a4 listItems:(id)a5 outSectionIdentifierToSearchRankingMapping:(id *)a6;
+ (id)generateSectionsWithSearchFilter:(id)a3 forItems:(id)a4 withContext:(id)a5;
+ (void)_applySortToSectionList:(id)a3 usingSearchRankingMapping:(id)a4;
@end

@implementation PKPaymentSetupProductsSectionSearchFactory

+ (id)generateSectionsWithSearchFilter:(id)a3 forItems:(id)a4 withContext:(id)a5
{
  id v10 = 0;
  v6 = [a1 _filteredListItemsFromSearchFilter:a3 withContext:a5 listItems:a4 outSectionIdentifierToSearchRankingMapping:&v10];
  id v7 = v10;
  v8 = [a1 _createSortedSectionsListFromFilteredListItems:v6];
  [a1 _applySortToSectionList:v8 usingSearchRankingMapping:v7];

  return v8;
}

+ (id)_filteredListItemsFromSearchFilter:(id)a3 withContext:(id)a4 listItems:(id)a5 outSectionIdentifierToSearchRankingMapping:(id *)a6
{
  v43 = a6;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v44 = v10;
  v12 = [v10 tokenizerCharacterSet];
  v45 = v9;
  v13 = [a1 _cleanedSearchTermsFromString:v9 usingTokenizerCharacterSet:v12];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v52 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "searchTerms", v43);
        if ([v21 count])
        {
          [a1 _distanceBetweenTerms:v21 andSearchTerms:v13];
          if (v22 < 1.0)
          {
            v23 = [[PKProductSearchResult alloc] initWithListItem:v20 searchDistance:v22];
            [v14 addObject:v23];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v17);
  }

  [v14 sortUsingComparator:&__block_literal_global_29];
  v24 = [v14 firstObject];
  [v24 searchDistance];
  BOOL v26 = v25 <= 0.3;

  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v28 = v14;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    double v31 = dbl_1A0443140[v26];
    uint64_t v32 = *(void *)v48;
LABEL_13:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v48 != v32) {
        objc_enumerationMutation(v28);
      }
      v34 = *(void **)(*((void *)&v47 + 1) + 8 * v33);
      objc_msgSend(v34, "searchDistance", v43);
      if (v35 > v31) {
        break;
      }
      double v36 = v35;
      v37 = [v34 listItem];
      [v46 addObject:v37];
      v38 = [v37 sectionIdentifier];
      v39 = [v27 objectForKey:v38];
      if (!v39)
      {
        v39 = objc_alloc_init(PKProductSectionSearchResult);
        [v27 setObject:v39 forKey:v38];
      }
      [(PKProductSectionSearchResult *)v39 searchDistance];
      [(PKProductSectionSearchResult *)v39 setSearchDistance:v36 + v40];
      [(PKProductSectionSearchResult *)v39 setNumberOfResults:[(PKProductSectionSearchResult *)v39 numberOfResults] + 1];

      if (v30 == ++v33)
      {
        uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v30) {
          goto LABEL_13;
        }
        break;
      }
    }
  }

  id v41 = v27;
  id *v43 = v41;

  return v46;
}

uint64_t __146__PKPaymentSetupProductsSectionSearchFactory__filteredListItemsFromSearchFilter_withContext_listItems_outSectionIdentifierToSearchRankingMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 searchDistance];
  double v7 = v6;
  [v5 searchDistance];
  if (v7 >= v8)
  {
    if (v7 <= v8)
    {
      id v10 = [v4 listItem];
      id v11 = [v10 title];
      v12 = [v5 listItem];
      v13 = [v12 title];
      uint64_t v9 = [v11 localizedCaseInsensitiveCompare:v13];
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

+ (id)_createSortedSectionsListFromFilteredListItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "sectionIdentifier", (void)v17);
        v12 = [v4 objectForKey:v11];
        if (!v12)
        {
          v12 = [[PKPaymentSetupProductsSectionListSection alloc] initWithIdentifier:v11];
          [v4 setObject:v12 forKey:v11];
        }
        v13 = [(PKPaymentSetupProductsSectionListSection *)v12 sectionListItems];
        [v13 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v14 = [v4 allValues];
  id v15 = (void *)[v14 mutableCopy];

  return v15;
}

+ (void)_applySortToSectionList:(id)a3 usingSearchRankingMapping:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKPaymentSetupProductsSectionSearchFactory__applySortToSectionList_usingSearchRankingMapping___block_invoke;
  v7[3] = &unk_1E59CD528;
  id v8 = v5;
  id v6 = v5;
  [a3 sortUsingComparator:v7];
}

uint64_t __96__PKPaymentSetupProductsSectionSearchFactory__applySortToSectionList_usingSearchRankingMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 identifier];
  uint64_t v7 = [v5 identifier];

  id v8 = [*(id *)(a1 + 32) objectForKey:v6];
  uint64_t v9 = [*(id *)(a1 + 32) objectForKey:v7];
  [v8 normalizedSearchDistance];
  double v11 = v10;
  [v9 normalizedSearchDistance];
  if (v11 < v12) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = v11 > v12;
  }

  return v13;
}

+ (double)_distanceBetweenTerms:(id)a3 andSearchTerms:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = a4;
  uint64_t v25 = [v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    uint64_t v7 = *(void *)v34;
    double v8 = 0.0;
    double v9 = 0.0;
    id v27 = v6;
    id v28 = v5;
    uint64_t v24 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v26 = v10;
        uint64_t v11 = *(void *)(*((void *)&v33 + 1) + 8 * v10);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v12 = v5;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v30;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v30 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v18 = [v17 length];
              long long v19 = [MEMORY[0x1E4F1CA20] currentLocale];
              uint64_t v20 = objc_msgSend(v17, "rangeOfString:options:range:locale:", v11, 8, 0, v18, v19);

              if (v20 != 0x7FFFFFFFFFFFFFFFLL)
              {

                id v6 = v27;
                double v22 = 0.0;
                id v5 = v28;
                goto LABEL_20;
              }
              double v8 = v8 + 1.0;
              objc_msgSend(v17, "pk_normalizedLevenshteinDistanceFromString:decimalPlaces:", v11, 1);
              double v9 = v9 + v21;
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = v26 + 1;
        id v6 = v27;
        id v5 = v28;
        uint64_t v7 = v24;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [v27 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
  }

  double v22 = v9 / v8;
LABEL_20:

  return v22;
}

+ (id)_cleanedSearchTermsFromString:(id)a3 usingTokenizerCharacterSet:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 localizedLowercaseString];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v8 = objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v5, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 length]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v7 copy];

  return v14;
}

@end