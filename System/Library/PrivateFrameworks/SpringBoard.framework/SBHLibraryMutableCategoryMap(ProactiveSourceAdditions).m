@interface SBHLibraryMutableCategoryMap(ProactiveSourceAdditions)
- (id)sb_categoryIdentifierForAppDirectoryCategoryID:()ProactiveSourceAdditions;
- (uint64_t)sb_hasAppsPopulatedForCategoriesOtherThanProactive;
- (void)sb_removeCategoryWithIdentifier:()ProactiveSourceAdditions;
- (void)sb_stripCategoriesThatArentFromProactive;
@end

@implementation SBHLibraryMutableCategoryMap(ProactiveSourceAdditions)

- (void)sb_removeCategoryWithIdentifier:()ProactiveSourceAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = objc_msgSend(a1, "categoryIdentifiers", 0);
  v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 predictionCategoryID] == a3) {
          [a1 removeCategoryIdentifier:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (uint64_t)sb_hasAppsPopulatedForCategoriesOtherThanProactive
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(a1, "categoryIdentifiers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v8 = [v7 predictionCategoryID];
        if (v8 > 7 || ((1 << v8) & 0x98) == 0)
        {
          v10 = [a1 sortedApplicationIdentifiersForCategoryIdentifier:v7];
          uint64_t v11 = [v10 count];

          if (v11)
          {
            uint64_t v12 = 1;
            goto LABEL_16;
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_16:

  return v12;
}

- (id)sb_categoryIdentifierForAppDirectoryCategoryID:()ProactiveSourceAdditions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(a1, "categoryIdentifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 predictionCategoryID] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)sb_stripCategoriesThatArentFromProactive
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(a1, "categoryIdentifiers", 0);
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        unint64_t v9 = [v8 predictionCategoryID];
        if (v9 > 7 || ((1 << v9) & 0x98) == 0) {
          [a1 removeCategoryIdentifier:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

@end