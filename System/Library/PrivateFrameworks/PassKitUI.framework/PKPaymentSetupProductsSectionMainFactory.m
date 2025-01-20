@interface PKPaymentSetupProductsSectionMainFactory
+ (id)_buildSectionIdentifierToItemIdentifierMappingFromSections:(id)a3;
+ (void)generateSectionsWithDefaultSortingForItems:(id)a3 withContext:(id)a4 outSectionIdentifierToItemIdentifierMapping:(id *)a5 outOrderedSectionIdentifiers:(id *)a6;
+ (void)generateSectionsWithSearchFilter:(id)a3 forItems:(id)a4 withContext:(id)a5 outSectionIdentifierToItemIdentifierMapping:(id *)a6 outOrderedSectionIdentifiers:(id *)a7;
@end

@implementation PKPaymentSetupProductsSectionMainFactory

+ (void)generateSectionsWithDefaultSortingForItems:(id)a3 withContext:(id)a4 outSectionIdentifierToItemIdentifierMapping:(id *)a5 outOrderedSectionIdentifiers:(id *)a6
{
  id v10 = a4;
  id v15 = (id)[a3 mutableCopy];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12 = +[PKPaymentSetupProductsSectionNearbyFactory generateSectionWithDefaultSortingForItems:v15 withContext:v10];
  [v11 safelyAddObject:v12];
  v13 = [v12 sectionListItems];
  [v15 removeObjectsInArray:v13];

  v14 = +[PKPaymentSetupProductsSectionAlphabeticalFactory generateSectionWithDefaultSortingForItems:v15 withContext:v10];

  [v11 addObjectsFromArray:v14];
  *a5 = [a1 _buildSectionIdentifierToItemIdentifierMappingFromSections:v11];
  objc_msgSend(v11, "pk_arrayByApplyingBlock:", &__block_literal_global_32);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __172__PKPaymentSetupProductsSectionMainFactory_generateSectionsWithDefaultSortingForItems_withContext_outSectionIdentifierToItemIdentifierMapping_outOrderedSectionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (void)generateSectionsWithSearchFilter:(id)a3 forItems:(id)a4 withContext:(id)a5 outSectionIdentifierToItemIdentifierMapping:(id *)a6 outOrderedSectionIdentifiers:(id *)a7
{
  id v10 = +[PKPaymentSetupProductsSectionSearchFactory generateSectionsWithSearchFilter:a3 forItems:a4 withContext:a5];
  *a6 = [a1 _buildSectionIdentifierToItemIdentifierMappingFromSections:v10];
  objc_msgSend(v10, "pk_arrayByApplyingBlock:", &__block_literal_global_15);
  *a7 = (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __171__PKPaymentSetupProductsSectionMainFactory_generateSectionsWithSearchFilter_forItems_withContext_outSectionIdentifierToItemIdentifierMapping_outOrderedSectionIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (id)_buildSectionIdentifierToItemIdentifierMappingFromSections:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v9 = [v8 identifier];
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = [v8 sectionListItems];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              [v16 setSectionIdentifier:v9];
              v17 = [v16 identifier];
              [v10 addObject:v17];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v13);
        }

        [v21 setObject:v10 forKey:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  v18 = (void *)[v21 copy];

  return v18;
}

@end