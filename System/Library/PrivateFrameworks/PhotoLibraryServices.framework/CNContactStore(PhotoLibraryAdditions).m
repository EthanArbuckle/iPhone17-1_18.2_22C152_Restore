@interface CNContactStore(PhotoLibraryAdditions)
- (id)_allContactIDsMatchingPredicate:()PhotoLibraryAdditions keysToFetch:;
- (id)allContactIDsMatchingEmailAddress:()PhotoLibraryAdditions orPhoneNumber:;
- (id)contactsMatchingEmailAddress:()PhotoLibraryAdditions keysToFetch:;
- (id)contactsMatchingPhoneNumber:()PhotoLibraryAdditions keysToFetch:;
- (uint64_t)allContactIDsMatchingEmailAddress:()PhotoLibraryAdditions;
@end

@implementation CNContactStore(PhotoLibraryAdditions)

- (id)contactsMatchingPhoneNumber:()PhotoLibraryAdditions keysToFetch:
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F1B908];
  id v8 = a4;
  v9 = (void *)[[v7 alloc] initWithKeysToFetch:v8];

  v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v6];
  [v9 setPredicate:v10];

  [v9 setUnifyResults:0];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__CNContactStore_PhotoLibraryAdditions__contactsMatchingPhoneNumber_keysToFetch___block_invoke;
  v17[3] = &unk_1E58619E0;
  id v18 = v6;
  id v12 = v11;
  id v19 = v12;
  id v13 = v6;
  [a1 enumerateContactsWithFetchRequest:v9 error:0 usingBlock:v17];
  v14 = v19;
  id v15 = v12;

  return v15;
}

- (id)contactsMatchingEmailAddress:()PhotoLibraryAdditions keysToFetch:
{
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F1B908];
  id v8 = a4;
  v9 = (void *)[[v7 alloc] initWithKeysToFetch:v8];

  v10 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v6];
  [v9 setPredicate:v10];

  [v9 setUnifyResults:0];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__CNContactStore_PhotoLibraryAdditions__contactsMatchingEmailAddress_keysToFetch___block_invoke;
  v17[3] = &unk_1E58619E0;
  id v18 = v6;
  id v12 = v11;
  id v19 = v12;
  id v13 = v6;
  [a1 enumerateContactsWithFetchRequest:v9 error:0 usingBlock:v17];
  v14 = v19;
  id v15 = v12;

  return v15;
}

- (id)_allContactIDsMatchingPredicate:()PhotoLibraryAdditions keysToFetch:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v32 = 0;
  v9 = [a1 unifiedContactsMatchingPredicate:v6 keysToFetch:v7 error:&v32];
  id v10 = v32;
  if (v9)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v24 = a1;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) identifier];
          [v8 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v13);
      a1 = v24;
    }
  }
  else
  {
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Error fetching contacts:%@", buf, 0xCu);
    }
  }

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1B908]) initWithKeysToFetch:v7];
  [v17 setPredicate:v6];
  [v17 setUnifyResults:0];
  id v27 = v10;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__CNContactStore_PhotoLibraryAdditions___allContactIDsMatchingPredicate_keysToFetch___block_invoke;
  v25[3] = &unk_1E58619B8;
  id v18 = v8;
  id v26 = v18;
  char v19 = [a1 enumerateContactsWithFetchRequest:v17 error:&v27 usingBlock:v25];
  id v20 = v27;

  if ((v19 & 1) == 0)
  {
    v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Error enumerating contacts:%@", buf, 0xCu);
    }
  }
  id v22 = v18;

  return v22;
}

- (id)allContactIDsMatchingEmailAddress:()PhotoLibraryAdditions orPhoneNumber:
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = [v6 length];
  id v10 = (uint64_t *)MEMORY[0x1E4F1AE08];
  if (v9)
  {
    id v11 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v6];
    uint64_t v12 = *v10;
    v25[0] = *MEMORY[0x1E4F1ADC8];
    v25[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    uint64_t v14 = [a1 _allContactIDsMatchingPredicate:v11 keysToFetch:v13];
    [v8 unionSet:v14];
  }
  if ([v7 length])
  {
    id v15 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v7];
    if (v15)
    {
      v16 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v15];
      uint64_t v17 = *v10;
      v24[0] = *MEMORY[0x1E4F1AEE0];
      v24[1] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      char v19 = [a1 _allContactIDsMatchingPredicate:v16 keysToFetch:v18];
      [v8 unionSet:v19];
    }
    else
    {
      v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138477827;
        id v23 = v7;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Unsupported phone number:%{private}@", (uint8_t *)&v22, 0xCu);
      }
    }
  }
  id v20 = [v8 allObjects];

  return v20;
}

- (uint64_t)allContactIDsMatchingEmailAddress:()PhotoLibraryAdditions
{
  return [a1 allContactIDsMatchingEmailAddress:a3 orPhoneNumber:0];
}

@end