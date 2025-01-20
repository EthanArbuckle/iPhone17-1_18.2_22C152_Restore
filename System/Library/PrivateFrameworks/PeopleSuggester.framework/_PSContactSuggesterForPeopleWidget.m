@interface _PSContactSuggesterForPeopleWidget
- (NSMutableSet)nonpriorityFamilyMembers;
- (NSMutableSet)priorityFamilyMembers;
- (_CDInteractionStore)interactionStore;
- (_PASLock)candidateContacts;
- (_PSContactSuggesterForPeopleWidget)init;
- (id)allEmailAndPhoneNumberHandlesForContact:(id)a3;
- (id)contactKeysToFetch;
- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4;
- (id)familyMemberContactHandles;
- (id)familyRecommendedContacts;
- (id)favoritedContacts;
- (id)iCloudFamilyMembers;
- (id)interactionBasedRecommendedContacts;
- (void)familyMemberContactHandles;
- (void)familyRecommendedContacts;
- (void)favoritedContacts;
- (void)interactionBasedRecommendedContacts;
- (void)processFamilyMember:(id)a3 toFillContactArray:(id)a4;
- (void)setCandidateContacts:(id)a3;
- (void)setInteractionStore:(id)a3;
- (void)setNonpriorityFamilyMembers:(id)a3;
- (void)setPriorityFamilyMembers:(id)a3;
@end

@implementation _PSContactSuggesterForPeopleWidget

- (_PSContactSuggesterForPeopleWidget)init
{
  v12.receiver = self;
  v12.super_class = (Class)_PSContactSuggesterForPeopleWidget;
  v2 = [(_PSContactSuggesterForPeopleWidget *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = [v3 initWithGuardedData:v4];
    candidateContacts = v2->_candidateContacts;
    v2->_candidateContacts = (_PASLock *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    priorityFamilyMembers = v2->_priorityFamilyMembers;
    v2->_priorityFamilyMembers = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    nonpriorityFamilyMembers = v2->_nonpriorityFamilyMembers;
    v2->_nonpriorityFamilyMembers = v9;
  }
  return v2;
}

- (id)allEmailAndPhoneNumberHandlesForContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 phoneNumbers];
  uint64_t v5 = [v4 valueForKey:@"value"];

  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "unformattedInternationalStringValue", (void)v18);

        if (v13)
        {
          v14 = [v12 unformattedInternationalStringValue];
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v15 = [v3 emailAddresses];
  v16 = [v15 valueForKey:@"value"];

  [v6 addObjectsFromArray:v16];

  return v6;
}

- (id)contactKeysToFetch
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v35 = getCNContactIdentifierKey_3();
  v40[0] = v35;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v2 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_5;
  uint64_t v39 = getCNContactPhoneNumbersKeySymbolLoc_ptr_5;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_5)
  {
    id v3 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v3, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr_5 = v37[3];
    v2 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v2) {
    goto LABEL_34;
  }
  id v34 = *v2;
  v40[1] = v34;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  id v4 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_5;
  uint64_t v39 = getCNContactEmailAddressesKeySymbolLoc_ptr_5;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_5)
  {
    uint64_t v5 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v5, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr_5 = v37[3];
    id v4 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v4) {
    goto LABEL_34;
  }
  id v6 = *v4;
  v40[2] = v6;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  id v7 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_4;
  uint64_t v39 = getCNContactGivenNameKeySymbolLoc_ptr_4;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_4)
  {
    uint64_t v8 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v8, "CNContactGivenNameKey");
    getCNContactGivenNameKeySymbolLoc_ptr_4 = v37[3];
    id v7 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v7) {
    goto LABEL_34;
  }
  id v9 = *v7;
  v40[3] = v9;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v10 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_4;
  uint64_t v39 = getCNContactFamilyNameKeySymbolLoc_ptr_4;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_4)
  {
    v11 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v11, "CNContactFamilyNameKey");
    getCNContactFamilyNameKeySymbolLoc_ptr_4 = v37[3];
    uint64_t v10 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v10) {
    goto LABEL_34;
  }
  id v12 = *v10;
  v40[4] = v12;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v13 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_4;
  uint64_t v39 = getCNContactMiddleNameKeySymbolLoc_ptr_4;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_4)
  {
    v14 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v14, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr_4 = v37[3];
    v13 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v13) {
    goto LABEL_34;
  }
  id v15 = *v13;
  v40[5] = v15;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v16 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr_3;
  uint64_t v39 = getCNContactNameSuffixKeySymbolLoc_ptr_3;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr_3)
  {
    v17 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v17, "CNContactNameSuffixKey");
    getCNContactNameSuffixKeySymbolLoc_ptr_3 = v37[3];
    v16 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v16) {
    goto LABEL_34;
  }
  id v18 = *v16;
  v40[6] = v18;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  long long v19 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr_3;
  uint64_t v39 = getCNContactNamePrefixKeySymbolLoc_ptr_3;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr_3)
  {
    long long v20 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v20, "CNContactNamePrefixKey");
    getCNContactNamePrefixKeySymbolLoc_ptr_3 = v37[3];
    long long v19 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v19) {
    goto LABEL_34;
  }
  id v21 = *v19;
  v40[7] = v21;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v22 = (id *)getCNContactOrganizationNameKeySymbolLoc_ptr_0;
  uint64_t v39 = getCNContactOrganizationNameKeySymbolLoc_ptr_0;
  if (!getCNContactOrganizationNameKeySymbolLoc_ptr_0)
  {
    uint64_t v23 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v23, "CNContactOrganizationNameKey");
    getCNContactOrganizationNameKeySymbolLoc_ptr_0 = v37[3];
    v22 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v22) {
    goto LABEL_34;
  }
  id v24 = *v22;
  v40[8] = v24;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v25 = (id *)getCNContactNicknameKeySymbolLoc_ptr_4;
  uint64_t v39 = getCNContactNicknameKeySymbolLoc_ptr_4;
  if (!getCNContactNicknameKeySymbolLoc_ptr_4)
  {
    v26 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v26, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr_4 = v37[3];
    v25 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v25) {
    goto LABEL_34;
  }
  id v27 = *v25;
  v40[9] = v27;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v28 = (id *)getCNContactTypeKeySymbolLoc_ptr_3;
  uint64_t v39 = getCNContactTypeKeySymbolLoc_ptr_3;
  if (!getCNContactTypeKeySymbolLoc_ptr_3)
  {
    v29 = (void *)ContactsLibrary_6();
    v37[3] = (uint64_t)dlsym(v29, "CNContactTypeKey");
    getCNContactTypeKeySymbolLoc_ptr_3 = v37[3];
    v28 = (id *)v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v28)
  {
LABEL_34:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v41 = *v28;
  v30 = (void *)MEMORY[0x1E4F1C978];
  id v31 = v41;
  v32 = [v30 arrayWithObjects:v40 count:11];

  return v32;
}

- (void)processFamilyMember:(id)a3 toFillContactArray:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (([v10 isMe] & 1) == 0)
  {
    id v6 = [v10 contact];

    if (v6)
    {
      id v7 = [_PSContact alloc];
      uint64_t v8 = [v10 contact];
      id v9 = -[_PSContact initWithCNContact:isChild:](v7, "initWithCNContact:isChild:", v8, [v10 isChildAccount]);

      [v5 addObject:v9];
    }
  }
}

- (id)familyMemberContactHandles
{
  *(void *)buf = 0;
  v37 = buf;
  uint64_t v38 = 0x2050000000;
  id v3 = (void *)getFAFetchFamilyCircleRequestClass_softClass_0;
  uint64_t v39 = getFAFetchFamilyCircleRequestClass_softClass_0;
  if (!getFAFetchFamilyCircleRequestClass_softClass_0)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    uint64_t v32 = (uint64_t)__getFAFetchFamilyCircleRequestClass_block_invoke_0;
    v33 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5ADE858;
    id v34 = buf;
    __getFAFetchFamilyCircleRequestClass_block_invoke_0((uint64_t)&v30);
    id v3 = (void *)*((void *)v37 + 3);
  }
  id v4 = v3;
  _Block_object_dispose(buf, 8);
  id v5 = objc_alloc_init(v4);
  uint64_t v30 = 0;
  uint64_t v31 = (uint64_t)&v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__15;
  id v34 = (uint8_t *)__Block_byref_object_dispose__15;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke;
  v27[3] = &unk_1E5ADF7A8;
  v27[4] = self;
  v29 = &v30;
  id v7 = v6;
  v28 = v7;
  [v5 startRequestWithCompletionHandler:v27];
  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Timeout in FAFetchFamilyCircleRequest", buf, 2u);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v10;
  }
  if (![*(id *)(v31 + 40) count])
  {
    [v5 setCachePolicy:1];
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);

    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke_32;
    uint64_t v23 = &unk_1E5ADF7A8;
    id v24 = self;
    v26 = &v30;
    id v7 = v12;
    v25 = v7;
    [v5 startRequestWithCompletionHandler:&v20];
    dispatch_time_t v13 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v7, v13))
    {
      v14 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_INFO, "Timeout in FAFetchFamilyCircleRequest with cachePolicy=YES", buf, 2u);
      }

      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v16 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v15;
    }
  }
  v17 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    [(_PSContactSuggesterForPeopleWidget *)(uint64_t)&v31 familyMemberContactHandles];
  }

  id v18 = (void *)[*(id *)(v31 + 40) copy];
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (id)iCloudFamilyMembers
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(_PSContactSuggesterForPeopleWidget *)self familyMemberContactHandles];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v27;
    *(void *)&long long v5 = 138412290;
    long long v23 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "cnContact", v23);
        v11 = [v10 identifier];

        if (v11)
        {
          if ([v9 isChild]) {
            [(_PSContactSuggesterForPeopleWidget *)self priorityFamilyMembers];
          }
          else {
          dispatch_semaphore_t v12 = [(_PSContactSuggesterForPeopleWidget *)self nonpriorityFamilyMembers];
          }
          dispatch_time_t v13 = [v9 cnContact];
          v14 = [v13 identifier];
          [v12 addObject:v14];

          id v15 = [v9 cnContact];
          v16 = [v15 identifier];
          [v3 addObject:v16];

          v17 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v23;
            uint64_t v31 = v9;
            _os_log_debug_impl(&dword_1A314B000, v17, OS_LOG_TYPE_DEBUG, "i-Cloud family member contact fetched: %@", buf, 0xCu);
          }

          candidateContacts = self->_candidateContacts;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __57___PSContactSuggesterForPeopleWidget_iCloudFamilyMembers__block_invoke;
          v25[3] = &unk_1E5ADED58;
          v25[4] = v9;
          [(_PASLock *)candidateContacts runWithLockAcquired:v25];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v6);
  }
  long long v19 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v31 = v20;
    _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_DEFAULT, "ICloudFamilyMembers count: %@", buf, 0xCu);
  }
  uint64_t v21 = (void *)[v3 copy];

  return v21;
}

- (id)familyRecommendedContacts
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = objc_alloc_init(_PSFamilyRecommender);
  id v3 = [(_PSFamilyRecommender *)v24 familyRecommendationSuggestionsForShareSheetWithPredictionContext:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
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
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v11 = [v10 recipients];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          dispatch_time_t v13 = [v10 recipients];
          v14 = [v13 firstObject];

          id v15 = [v14 contact];

          if (v15)
          {
            v16 = [v14 contact];
            v17 = [v16 identifier];
            [v4 addObject:v17];

            id v18 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              [(_PSContactSuggesterForPeopleWidget *)v33 familyRecommendedContacts];
            }

            candidateContacts = self->_candidateContacts;
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __63___PSContactSuggesterForPeopleWidget_familyRecommendedContacts__block_invoke;
            v25[3] = &unk_1E5ADED58;
            id v26 = v14;
            [(_PASLock *)candidateContacts runWithLockAcquired:v25];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v7);
  }

  uint64_t v20 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = v21;
    _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_DEFAULT, "familyRecommendedContacts count: %@", buf, 0xCu);
  }
  v22 = (void *)[v4 copy];

  return v22;
}

- (id)interactionBasedRecommendedContacts
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v44 = objc_alloc_init(_PSContactSuggester);
  v43 = [(_PSContactSuggester *)v44 contactSuggestionsWithMaxSuggestions:50 excludeContactsByIdentifiers:MEMORY[0x1E4F1CBF0] interactionHistoryCap:1000];
  v2 = [v43 sortedArrayUsingComparator:&__block_literal_global_31];
  id v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v65 = v2;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "Interaction based suggestions before contact resolution %{private}@", buf, 0xCu);
  }

  id v4 = objc_alloc_init((Class)getCNContactStoreClass_0());
  id v5 = getCNContactIdentifierKey_3();
  v63 = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  id v60 = 0;
  uint64_t v7 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:v6 error:&v60];
  id v8 = v60;

  id v41 = v8;
  if (v8)
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts]();
    }
  }
  else if (v7)
  {
    v46 = v7;
    char v11 = 1;
    goto LABEL_12;
  }
  id v10 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts](v10);
  }

  char v11 = 0;
  v46 = 0;
LABEL_12:
  uint64_t v12 = [_PSContactResolver alloc];
  dispatch_time_t v13 = [(_PSContactSuggesterForPeopleWidget *)self contactKeysToFetch];
  uint64_t v42 = v4;
  v14 = [(_PSContactResolver *)v12 initWithContactStore:v4 keysToFetch:v13];

  v47 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v15 = self;
  id obj = v2;
  uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
  v17 = &off_1E5ADE000;
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v49 = *(void *)v57;
    char v19 = v11 ^ 1;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v57 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v22 = objc_msgSend(v21, "contactIdentifier", v41);
        long long v23 = [(_PSContactResolver *)v14 contactWithIdentifier:v22];

        if (!v23)
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v24 = [v21 handleAndAppFrequencies];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v53;
LABEL_20:
            uint64_t v28 = 0;
            while (1)
            {
              if (*(void *)v53 != v27) {
                objc_enumerationMutation(v24);
              }
              long long v29 = [*(id *)(*((void *)&v52 + 1) + 8 * v28) handle];
              long long v23 = [(_PSContactResolver *)v14 resolveContactIfPossibleFromContactIdentifierString:v29 pickFirstOfMultiple:1];

              if (v23) {
                break;
              }
              if (v26 == ++v28)
              {
                uint64_t v26 = [v24 countByEnumeratingWithState:&v52 objects:v61 count:16];
                if (v26) {
                  goto LABEL_20;
                }
                long long v23 = 0;
                break;
              }
            }
            id v15 = self;
            v17 = &off_1E5ADE000;
          }
          else
          {
            long long v23 = 0;
          }
        }
        if (v23) {
          char v30 = v19;
        }
        else {
          char v30 = 1;
        }
        if ((v30 & 1) != 0
          || ([v46 identifier],
              uint64_t v31 = objc_claimAutoreleasedReturnValue(),
              [v23 identifier],
              uint64_t v32 = objc_claimAutoreleasedReturnValue(),
              char v33 = [v31 isEqualToString:v32],
              v32,
              v31,
              (v33 & 1) == 0))
        {
          if (v23)
          {
            uint64_t v34 = [v17[172] generalChannel];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v23;
              _os_log_debug_impl(&dword_1A314B000, v34, OS_LOG_TYPE_DEBUG, "Interaction model suggested contact fetched: %@", buf, 0xCu);
            }

            id v35 = [v23 identifier];
            [v47 addObject:v35];

            candidateContacts = v15->_candidateContacts;
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __73___PSContactSuggesterForPeopleWidget_interactionBasedRecommendedContacts__block_invoke_39;
            v50[3] = &unk_1E5ADED58;
            id v51 = v23;
            [(_PASLock *)candidateContacts runWithLockAcquired:v50];
          }
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    }
    while (v18);
  }

  v37 = [v17[172] generalChannel];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
    *(_DWORD *)buf = 138412290;
    v65 = v38;
    _os_log_impl(&dword_1A314B000, v37, OS_LOG_TYPE_DEFAULT, "interactionBasedRecommendedContacts count: %@", buf, 0xCu);
  }
  uint64_t v39 = (void *)[v47 copy];

  return v39;
}

- (id)favoritedContacts
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F5B3A8] sharedInstance];
  id v4 = [v3 favoriteContactEntries];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v29;
    *(void *)&long long v8 = 138412290;
    long long v25 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        dispatch_time_t v13 = objc_msgSend(v12, "contactProperty", v25);

        if (v13)
        {
          v14 = [v12 contactProperty];
          id v15 = [v14 contact];

          uint64_t v16 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v25;
            char v33 = v15;
            _os_log_debug_impl(&dword_1A314B000, v16, OS_LOG_TYPE_DEBUG, "favoritedContact fetched: %@", buf, 0xCu);
          }

          v17 = [v15 identifier];
          [v5 addObject:v17];

          candidateContacts = self->_candidateContacts;
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __55___PSContactSuggesterForPeopleWidget_favoritedContacts__block_invoke;
          v26[3] = &unk_1E5ADED58;
          id v27 = v15;
          id v19 = v15;
          [(_PASLock *)candidateContacts runWithLockAcquired:v26];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v9);
  }

  uint64_t v20 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[_PSContactSuggesterForPeopleWidget favoritedContacts]();
  }

  uint64_t v21 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    *(_DWORD *)buf = 138412290;
    char v33 = v22;
    _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "favoritedContacts count: %@", buf, 0xCu);
  }
  long long v23 = (void *)[v5 copy];

  return v23;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4
{
  v178[1] = *MEMORY[0x1E4F143B8];
  id v133 = a4;
  v136 = self;
  id v5 = [(_PSContactSuggesterForPeopleWidget *)self iCloudFamilyMembers];
  v120 = [(_PSContactSuggesterForPeopleWidget *)self interactionBasedRecommendedContacts];
  v128 = [(_PSContactSuggesterForPeopleWidget *)self favoritedContacts];
  id v130 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v117 = objc_alloc_init((Class)getCNContactStoreClass_0());
  id v6 = getCNContactIdentifierKey_3();
  v178[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:1];
  id v167 = 0;
  v135 = [v117 _crossPlatformUnifiedMeContactWithKeysToFetch:v7 error:&v167];
  id v119 = v167;

  if (v119)
  {
    long long v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts]();
    }

    goto LABEL_5;
  }
  if (!v135)
  {
LABEL_5:
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts](v9);
    }

    v135 = 0;
  }
  v134 = objc_opt_new();
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v163 objects:v177 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v164;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v164 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v163 + 1) + 8 * i);
        v14 = objc_msgSend(v135, "identifier", v117);
        char v15 = [v14 isEqualToString:v13];

        if ((v15 & 1) == 0)
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v174 = __Block_byref_object_copy__15;
          v175 = __Block_byref_object_dispose__15;
          id v176 = 0;
          candidateContacts = v136->_candidateContacts;
          v162[0] = MEMORY[0x1E4F143A8];
          v162[1] = 3221225472;
          v162[2] = __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke;
          v162[3] = &unk_1E5AE0DF0;
          v162[5] = buf;
          v162[4] = v13;
          [(_PASLock *)candidateContacts runWithLockAcquired:v162];
          v17 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v18 = [(_PSContactSuggesterForPeopleWidget *)v136 allEmailAndPhoneNumberHandlesForContact:*(void *)(*(void *)&buf[8] + 40)];
          id v19 = [v17 setWithArray:v18];

          if ([v19 intersectsSet:v134])
          {
            uint64_t v20 = [v19 allObjects];
            [v134 addObjectsFromArray:v20];
          }
          else
          {
            uint64_t v21 = [*(id *)(*(void *)&buf[8] + 40) identifier];
            v22 = [v130 objectForKey:v21];

            if (v22)
            {
              long long v23 = [*(id *)(*(void *)&buf[8] + 40) identifier];
              id v24 = [v130 objectForKey:v23];

              [(_PSContactSuggestion *)v24 peopleWidgetScore];
              [(_PSContactSuggestion *)v24 setPeopleWidgetScore:v25 + 4.0];
              uint64_t v26 = [*(id *)(*(void *)&buf[8] + 40) identifier];
              [v130 setObject:v24 forKeyedSubscript:v26];
            }
            else
            {
              id v27 = [_PSContactSuggestion alloc];
              id v24 = [(_PSContactSuggestion *)v27 initWithContact:*(void *)(*(void *)&buf[8] + 40) andScore:4.0];
              uint64_t v26 = [*(id *)(*(void *)&buf[8] + 40) identifier];
              [v130 setValue:v24 forKey:v26];
            }

            uint64_t v20 = [v19 allObjects];
            [v134 addObjectsFromArray:v20];
          }

          _Block_object_dispose(buf, 8);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v163 objects:v177 count:16];
    }
    while (v10);
  }

  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v121 = v128;
  uint64_t v28 = [v121 countByEnumeratingWithState:&v158 objects:v172 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v159;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v159 != v29) {
          objc_enumerationMutation(v121);
        }
        uint64_t v31 = *(void *)(*((void *)&v158 + 1) + 8 * j);
        uint64_t v32 = objc_msgSend(v135, "identifier", v117);
        char v33 = [v32 isEqualToString:v31];

        if ((v33 & 1) == 0)
        {
          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v174 = __Block_byref_object_copy__15;
          v175 = __Block_byref_object_dispose__15;
          id v176 = 0;
          uint64_t v34 = v136->_candidateContacts;
          v157[0] = MEMORY[0x1E4F143A8];
          v157[1] = 3221225472;
          v157[2] = __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_2;
          v157[3] = &unk_1E5AE0DF0;
          v157[4] = v31;
          v157[5] = buf;
          [(_PASLock *)v34 runWithLockAcquired:v157];
          uint64_t v35 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v36 = [(_PSContactSuggesterForPeopleWidget *)v136 allEmailAndPhoneNumberHandlesForContact:*(void *)(*(void *)&buf[8] + 40)];
          v37 = [v35 setWithArray:v36];

          if ([v37 intersectsSet:v134])
          {
            uint64_t v38 = [v37 allObjects];
            [v134 addObjectsFromArray:v38];
          }
          else
          {
            uint64_t v39 = [*(id *)(*(void *)&buf[8] + 40) identifier];
            v40 = [v130 objectForKey:v39];

            if (v40)
            {
              id v41 = [*(id *)(*(void *)&buf[8] + 40) identifier];
              uint64_t v42 = [v130 objectForKey:v41];

              [(_PSContactSuggestion *)v42 peopleWidgetScore];
              [(_PSContactSuggestion *)v42 setPeopleWidgetScore:v43 + 3.0];
              v44 = [*(id *)(*(void *)&buf[8] + 40) identifier];
              [v130 setObject:v42 forKeyedSubscript:v44];
            }
            else
            {
              v45 = [_PSContactSuggestion alloc];
              uint64_t v42 = [(_PSContactSuggestion *)v45 initWithContact:*(void *)(*(void *)&buf[8] + 40) andScore:3.0];
              v44 = [*(id *)(*(void *)&buf[8] + 40) identifier];
              [v130 setValue:v42 forKey:v44];
            }

            uint64_t v38 = [v37 allObjects];
            [v134 addObjectsFromArray:v38];
          }

          _Block_object_dispose(buf, 8);
        }
      }
      uint64_t v28 = [v121 countByEnumeratingWithState:&v158 objects:v172 count:16];
    }
    while (v28);
  }

  if ([v120 count])
  {
    unint64_t v46 = 0;
    uint64_t v126 = MEMORY[0x1E4F143A8];
    int v47 = 10;
    do
    {
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v174 = __Block_byref_object_copy__15;
      v175 = __Block_byref_object_dispose__15;
      id v176 = 0;
      v48 = v136->_candidateContacts;
      v153[0] = v126;
      v153[1] = 3221225472;
      v153[2] = __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_3;
      v153[3] = &unk_1E5AE0E18;
      v155 = buf;
      id v49 = v120;
      id v154 = v49;
      int v156 = v46;
      [(_PASLock *)v48 runWithLockAcquired:v153];
      v50 = [v135 identifier];
      id v51 = [*(id *)(*(void *)&buf[8] + 40) identifier];
      char v52 = [v50 isEqualToString:v51];

      if ((v52 & 1) == 0)
      {
        long long v53 = (void *)MEMORY[0x1E4F1CAD0];
        long long v54 = [(_PSContactSuggesterForPeopleWidget *)v136 allEmailAndPhoneNumberHandlesForContact:*(void *)(*(void *)&buf[8] + 40)];
        long long v55 = [v53 setWithArray:v54];

        if ([v55 intersectsSet:v134])
        {
          long long v56 = [v55 allObjects];
          [v134 addObjectsFromArray:v56];
        }
        else
        {
          long long v57 = [*(id *)(*(void *)&buf[8] + 40) identifier];
          long long v58 = [v130 objectForKey:v57];

          if (v58)
          {
            long long v59 = [*(id *)(*(void *)&buf[8] + 40) identifier];
            id v60 = [v130 objectForKey:v59];

            [(_PSContactSuggestion *)v60 peopleWidgetScore];
            [(_PSContactSuggestion *)v60 setPeopleWidgetScore:v61 + (float)((float)((float)v47 / 10.0) + (float)((float)v47 / 10.0))];
            v62 = [*(id *)(*(void *)&buf[8] + 40) identifier];
            [v130 setObject:v60 forKeyedSubscript:v62];
          }
          else
          {
            v63 = [_PSContactSuggestion alloc];
            id v60 = [(_PSContactSuggestion *)v63 initWithContact:*(void *)(*(void *)&buf[8] + 40) andScore:(float)((float)((float)v47 / 10.0) + (float)((float)v47 / 10.0))];
            v62 = [*(id *)(*(void *)&buf[8] + 40) identifier];
            [v130 setValue:v60 forKey:v62];
          }

          long long v56 = [v55 allObjects];
          [v134 addObjectsFromArray:v56];
        }
      }
      _Block_object_dispose(buf, 8);

      unint64_t v64 = [v49 count];
      if (v46 > 8) {
        break;
      }
      ++v46;
      --v47;
    }
    while (v64 > v46);
  }
  v65 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v65, OS_LOG_TYPE_INFO, "Suggestion scoring done", buf, 2u);
  }

  id v129 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  id v131 = v130;
  uint64_t v66 = [v131 countByEnumeratingWithState:&v149 objects:v171 count:16];
  if (v66)
  {
    uint64_t v67 = *(void *)v150;
    do
    {
      for (uint64_t k = 0; k != v66; ++k)
      {
        if (*(void *)v150 != v67) {
          objc_enumerationMutation(v131);
        }
        v69 = [v131 objectForKeyedSubscript:*(void *)(*((void *)&v149 + 1) + 8 * k)];
        [v129 addObject:v69];
      }
      uint64_t v66 = [v131 countByEnumeratingWithState:&v149 objects:v171 count:16];
    }
    while (v66);
  }

  v70 = [v129 sortedArrayUsingComparator:&__block_literal_global_45];
  v71 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v71, OS_LOG_TYPE_INFO, "Suggestion ranking based on score done", buf, 2u);
  }

  id v125 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v127 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v123 = v70;
  uint64_t v72 = [v123 countByEnumeratingWithState:&v145 objects:v170 count:16];
  if (v72)
  {
    uint64_t v73 = *(void *)v146;
    do
    {
      for (uint64_t m = 0; m != v72; ++m)
      {
        if (*(void *)v146 != v73) {
          objc_enumerationMutation(v123);
        }
        v75 = *(void **)(*((void *)&v145 + 1) + 8 * m);
        v76 = [(_PSContactSuggesterForPeopleWidget *)v136 priorityFamilyMembers];
        v77 = [v75 contact];
        v78 = [v77 identifier];
        if (![v76 containsObject:v78])
        {

          goto LABEL_75;
        }
        if (!v133 || ![v133 count])
        {

LABEL_74:
          [v125 addObject:v75];
          v76 = [v75 contact];
          v77 = [v76 identifier];
          [v127 addObject:v77];
          --a3;
LABEL_75:

          continue;
        }
        v79 = [v75 contact];
        v80 = [v79 identifier];
        char v81 = [v133 containsObject:v80];

        if ((v81 & 1) == 0) {
          goto LABEL_74;
        }
      }
      uint64_t v72 = [v123 countByEnumeratingWithState:&v145 objects:v170 count:16];
    }
    while (v72);
  }

  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v124 = v123;
  uint64_t v82 = [v124 countByEnumeratingWithState:&v141 objects:v169 count:16];
  if (!v82) {
    goto LABEL_94;
  }
  uint64_t v83 = *(void *)v142;
  do
  {
    for (uint64_t n = 0; n != v82; ++n)
    {
      if (*(void *)v142 != v83) {
        objc_enumerationMutation(v124);
      }
      v85 = *(void **)(*((void *)&v141 + 1) + 8 * n);
      v86 = [(_PSContactSuggesterForPeopleWidget *)v136 nonpriorityFamilyMembers];
      v87 = [v85 contact];
      v88 = [v87 identifier];
      if (![v86 containsObject:v88])
      {

        goto LABEL_91;
      }
      if (!v133 || ![v133 count])
      {

LABEL_90:
        [v125 addObject:v85];
        v86 = [v85 contact];
        v87 = [v86 identifier];
        [v127 addObject:v87];
        --a3;
LABEL_91:

        continue;
      }
      v89 = [v85 contact];
      v90 = [v89 identifier];
      char v91 = [v133 containsObject:v90];

      if ((v91 & 1) == 0) {
        goto LABEL_90;
      }
    }
    uint64_t v82 = [v124 countByEnumeratingWithState:&v141 objects:v169 count:16];
  }
  while (v82);
LABEL_94:

  if (a3 >= 1)
  {
    unint64_t v92 = 0;
    do
    {
      if ([v124 count] <= v92) {
        break;
      }
      if (v133)
      {
        v93 = [v124 objectAtIndexedSubscript:v92];
        v94 = [v93 contact];
        v95 = [v94 identifier];
        int v96 = [v133 containsObject:v95];

        if (v96) {
          goto LABEL_100;
        }
      }
      v97 = [v124 objectAtIndexedSubscript:v92];
      v98 = [v97 contact];
      v99 = [v98 identifier];
      int v100 = [v127 containsObject:v99];

      if (v100)
      {
LABEL_100:
        int64_t v101 = a3 + 1;
      }
      else
      {
        v102 = [v124 objectAtIndexedSubscript:v92];
        [v125 addObject:v102];

        v103 = [v124 objectAtIndexedSubscript:v92];
        v104 = [v103 contact];
        v105 = [v104 identifier];
        [v127 addObject:v105];

        int64_t v101 = a3;
      }
      ++v92;
      a3 = v101;
    }
    while (v101 > (uint64_t)v92);
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v106 = v125;
  uint64_t v107 = [v106 countByEnumeratingWithState:&v137 objects:v168 count:16];
  if (v107)
  {
    uint64_t v108 = *(void *)v138;
    do
    {
      for (iuint64_t i = 0; ii != v107; ++ii)
      {
        if (*(void *)v138 != v108) {
          objc_enumerationMutation(v106);
        }
        v110 = *(void **)(*((void *)&v137 + 1) + 8 * ii);
        v111 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
        {
          v112 = [v110 contact];
          v113 = [v112 givenName];
          v114 = NSNumber;
          [v110 peopleWidgetScore];
          v115 = objc_msgSend(v114, "numberWithDouble:");
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v113;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v115;
          _os_log_impl(&dword_1A314B000, v111, OS_LOG_TYPE_DEFAULT, "Suggestions: %{private}@, score: %@", buf, 0x16u);
        }
      }
      uint64_t v107 = [v106 countByEnumeratingWithState:&v137 objects:v168 count:16];
    }
    while (v107);
  }

  return v106;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
}

- (_PASLock)candidateContacts
{
  return self->_candidateContacts;
}

- (void)setCandidateContacts:(id)a3
{
}

- (NSMutableSet)priorityFamilyMembers
{
  return self->_priorityFamilyMembers;
}

- (void)setPriorityFamilyMembers:(id)a3
{
}

- (NSMutableSet)nonpriorityFamilyMembers
{
  return self->_nonpriorityFamilyMembers;
}

- (void)setNonpriorityFamilyMembers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonpriorityFamilyMembers, 0);
  objc_storeStrong((id *)&self->_priorityFamilyMembers, 0);
  objc_storeStrong((id *)&self->_candidateContacts, 0);

  objc_storeStrong((id *)&self->_interactionStore, 0);
}

- (void)familyMemberContactHandles
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "familyMembers %@", (uint8_t *)&v3, 0xCu);
}

- (void)familyRecommendedContacts
{
  uint64_t v7 = [a2 contact];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A314B000, a4, OS_LOG_TYPE_DEBUG, "Family-recommender suggested contact fetched: %@", a1, 0xCu);
}

- (void)interactionBasedRecommendedContacts
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error fetching me contact from store in _PSContactSuggesterForPeopleWidget: %@", v2, v3, v4, v5, v6);
}

- (void)favoritedContacts
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "favoritedContacts: %@", v1, 0xCu);
}

@end