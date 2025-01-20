@interface PKPaymentSetupProductsSectionAlphabeticalFactory
+ (id)_createSectionsListFromListItems:(id)a3;
+ (id)generateSectionWithDefaultSortingForItems:(id)a3 withContext:(id)a4;
+ (void)_applyDefaultSortToSectionList:(id)a3 usingContext:(id)a4;
@end

@implementation PKPaymentSetupProductsSectionAlphabeticalFactory

+ (id)generateSectionWithDefaultSortingForItems:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  v7 = [a1 _createSectionsListFromListItems:a3];
  [a1 _applyDefaultSortToSectionList:v7 usingContext:v6];

  return v7;
}

+ (id)_createSectionsListFromListItems:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v11 = [v10 sectionIdentifier];
        v12 = [v4 objectForKey:v11];
        if (!v12)
        {
          v12 = [[PKPaymentSetupProductsSectionListSection alloc] initWithIdentifier:v11];
          [v4 setObject:v12 forKey:v11];
        }
        v13 = [(PKPaymentSetupProductsSectionListSection *)v12 sectionListItems];
        [v13 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  v14 = [v4 allValues];
  v15 = (void *)[v14 mutableCopy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "sectionListItems", (void)v23);
        [v21 sortUsingComparator:&__block_literal_global_225];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v16;
}

uint64_t __85__PKPaymentSetupProductsSectionAlphabeticalFactory__createSectionsListFromListItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 identifier];
  char v7 = [v6 isEqualToString:@"PKAddADifferentCardListItemIdentifier"];

  if (v7)
  {
    uint64_t v8 = 1;
  }
  else
  {
    v9 = [v5 identifier];
    char v10 = [v9 isEqualToString:@"PKAddADifferentCardListItemIdentifier"];

    if (v10)
    {
      uint64_t v8 = -1;
    }
    else
    {
      v11 = [v4 title];
      v12 = [v5 title];
      uint64_t v8 = [v11 localizedCaseInsensitiveCompare:v12];
    }
  }

  return v8;
}

+ (void)_applyDefaultSortToSectionList:(id)a3 usingContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = [v5 primaryCountryName];
  uint64_t v8 = [v5 secondaryCountryName];

  char v9 = [v7 isEqualToString:v8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKPaymentSetupProductsSectionAlphabeticalFactory__applyDefaultSortToSectionList_usingContext___block_invoke;
  v12[3] = &unk_1E59DECF8;
  char v15 = v9 ^ 1;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v6 sortUsingComparator:v12];
}

uint64_t __96__PKPaymentSetupProductsSectionAlphabeticalFactory__applyDefaultSortToSectionList_usingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 identifier];
  char v7 = [v5 identifier];

  if ([v6 isEqualToString:*(void *)(a1 + 32)]) {
    goto LABEL_2;
  }
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
LABEL_4:
    uint64_t v8 = 1;
    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
LABEL_9:
    uint64_t v8 = [v6 localizedCaseInsensitiveCompare:v7];
    goto LABEL_10;
  }
  if (([v6 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 48) && ([v7 isEqualToString:*(void *)(a1 + 40)] & 1) != 0) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
LABEL_2:
  uint64_t v8 = -1;
LABEL_10:

  return v8;
}

@end