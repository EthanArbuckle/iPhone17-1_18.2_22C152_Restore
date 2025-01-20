@interface PXPeopleWidgetUtilities
+ (id)localizedTitleStringForHasGroups:(BOOL)a3 hasPeople:(BOOL)a4 hasPets:(BOOL)a5;
+ (id)localizedTitleStringForWidgetDataSource:(id)a3 photoLibrary:(id)a4;
+ (id)verifiedPersonsFromMergeCandidatesForPersons:(id)a3;
@end

@implementation PXPeopleWidgetUtilities

+ (id)localizedTitleStringForHasGroups:(BOOL)a3 hasPeople:(BOOL)a4 hasPets:(BOOL)a5
{
  v5 = &stru_1F00B0030;
  v6 = @"Groups";
  if (!a3) {
    v6 = &stru_1F00B0030;
  }
  v7 = @"People";
  if (!a4) {
    v7 = &stru_1F00B0030;
  }
  v8 = @"Pets";
  if (!a5) {
    v8 = &stru_1F00B0030;
  }
  v9 = [NSString stringWithFormat:@"PXEditorialRelatedPeopleWidgetTitle_%@%@%@", v6, v7, v8];
  if (([v9 isEqualToString:@"PXEditorialRelatedPeopleWidgetTitle_"] & 1) == 0)
  {
    PXLocalizedStringFromTable(v9, @"PhotosUICore");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)localizedTitleStringForWidgetDataSource:(id)a3 photoLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 containsSocialGroups];
  uint64_t v8 = [v6 numberOfMembers];

  if (v8)
  {
    unint64_t v9 = objc_msgSend(v5, "px_peoplePetsHomeVisibility");
    unint64_t v10 = v9 & 1;
    uint64_t v11 = (v9 >> 1) & 1;
  }
  else
  {
    unint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  v12 = +[PXPeopleWidgetUtilities localizedTitleStringForHasGroups:v7 hasPeople:v10 hasPets:v11];

  return v12;
}

+ (id)verifiedPersonsFromMergeCandidatesForPersons:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [MEMORY[0x1E4F1CA80] setWithArray:v3];
    id v5 = [v3 firstObject];
    id v6 = [v5 photoLibrary];
    uint64_t v7 = [v6 librarySpecificFetchOptions];

    v27[0] = *MEMORY[0x1E4F397E0];
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v7 setFetchPropertySets:v8];

    unint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"verifiedType > %d && type != %d", 0, -1);
    [v7 setPredicate:v9];

    unint64_t v10 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
    [v7 setIncludedDetectionTypes:v10];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v3;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (![v16 verifiedType])
          {
            v17 = (void *)MEMORY[0x1AD10CB00]();
            v18 = [MEMORY[0x1E4F391F0] fetchMergeCandidatePersonsForPerson:v16 options:v7];
            if ([v18 count])
            {
              [v4 removeObject:v16];
              v19 = [v18 fetchedObjects];
              [v4 addObjectsFromArray:v19];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v3 = v21;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v4;
}

@end