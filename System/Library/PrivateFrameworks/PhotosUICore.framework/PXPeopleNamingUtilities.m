@interface PXPeopleNamingUtilities
+ (id)itemsForSearchString:(id)a3 person:(id)a4 face:(id)a5;
@end

@implementation PXPeopleNamingUtilities

+ (id)itemsForSearchString:(id)a3 person:(id)a4 face:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  if (!(v10 | v11))
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, a1, @"PXPeopleNamingUtilities.m", 23, @"Invalid parameter not satisfying: %@", @"person || face" object file lineNumber description];
  }
  v12 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v13 = [v9 stringByTrimmingCharactersInSet:v12];

  v60 = v13;
  uint64_t v14 = [v13 length];
  if (v10) {
    v15 = (void *)v10;
  }
  else {
    v15 = (void *)v11;
  }
  v16 = [v15 photoLibrary];
  v17 = [v16 librarySpecificFetchOptions];

  v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"verifiedType = %d", 1);
  [v17 setPredicate:v18];

  v19 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v17 setIncludedDetectionTypes:v19];

  v54 = v17;
  v20 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v17];
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v57 = v9;
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v55 = (void *)v11;
  v56 = (void *)v10;
  if (v10)
  {
    int v21 = [(id)v10 detectionType];
    v22 = (void *)v10;
  }
  else
  {
    int v21 = [(id)v11 detectionType];
    v22 = (void *)v11;
  }
  int v53 = objc_msgSend(v22, "px_isHuman");
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v23 = v20;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v67 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        if ([v28 detectionType] == v21)
        {
          v29 = [v28 personUri];
          if (v14)
          {
            v30 = [v28 name];
            int v31 = objc_msgSend(v30, "px_hasStringIgnoringCaseAndDiacritics:", v60);

            if (v31)
            {
              v32 = [[PXPeopleNamePickerItem alloc] initWithPerson:v28 searchPrefix:v60];
              [v59 addObject:v32];
              if (v29) {
                [v58 addObject:v29];
              }
            }
          }
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v25);
  }

  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v34 = v53;
  if (!v14) {
    int v34 = 0;
  }
  if (v34 == 1)
  {
    v35 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    uint64_t v36 = *MEMORY[0x1E4F1ADC8];
    v75[0] = v35;
    v75[1] = v36;
    v75[2] = *MEMORY[0x1E4F1AEE0];
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];

    v38 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v37];
    v39 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingName:v60];
    [v38 setPredicate:v39];

    [v38 setSortOrder:1];
    v40 = +[PXPeopleUtilities sharedContactStore];
    id v65 = 0;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __60__PXPeopleNamingUtilities_itemsForSearchString_person_face___block_invoke;
    v61[3] = &unk_1E5DB0560;
    id v62 = v58;
    id v63 = v60;
    id v64 = v33;
    [v40 enumerateContactsWithFetchRequest:v38 error:&v65 usingBlock:v61];
    id v41 = v65;

    if (v41)
    {
      v42 = PLUIGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v72 = "+[PXPeopleNamingUtilities itemsForSearchString:person:face:]";
        __int16 v73 = 2112;
        id v74 = v41;
        _os_log_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_ERROR, "%s: Error while fetching contacts: %@", buf, 0x16u);
      }
    }
  }
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v44 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"highlightRangeLocation" ascending:1];
  v70[0] = v44;
  v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title.string" ascending:1];
  v70[1] = v45;
  v46 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"person.localIdentifier" ascending:1];
  v70[2] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];

  v48 = [v33 sortedArrayUsingDescriptors:v47];
  v49 = [v59 sortedArrayUsingDescriptors:v47];
  [v43 addObjectsFromArray:v48];
  [v43 addObjectsFromArray:v49];
  v50 = (void *)[v43 copy];

  return v50;
}

void __60__PXPeopleNamingUtilities_itemsForSearchString_person_face___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 contactType];
  v4 = v7;
  if (!v3)
  {
    v5 = [v7 identifier];
    if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
    {
      v6 = [[PXPeopleNamePickerItem alloc] initWithContact:v7 searchPrefix:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) addObject:v6];
    }
    v4 = v7;
  }
}

@end