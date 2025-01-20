@interface _PSFamilyMLPredictionTask
- (NSString)directory;
- (_DKKnowledgeQuerying)knowledgeStore;
- (id)contactKeysToFetch;
- (id)knowledgeEventUsingPredictions:(id)a3 familyRelations:(id)a4;
- (void)enumerateContactsInContactStoreUsingBlock:(id)a3;
- (void)execute:(id)a3;
- (void)setKnowledgeStore:(id)a3;
@end

@implementation _PSFamilyMLPredictionTask

- (void)execute:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __37___PSFamilyMLPredictionTask_execute___block_invoke;
  v30[3] = &unk_1E5ADFF90;
  id v5 = v4;
  id v31 = v5;
  v6 = (uint64_t (**)(void))MEMORY[0x1A6243AD0](v30);
  if (((unsigned int (*)(void))v6[2])())
  {
    v7 = [[_PSFamilyMLModel alloc] initWithActivity:v5];
    v8 = objc_opt_new();
    v9 = objc_opt_new();
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __37___PSFamilyMLPredictionTask_execute___block_invoke_4;
    v20 = &unk_1E5ADFFB8;
    v10 = v6;
    id v24 = v10;
    v25 = &v26;
    v11 = v7;
    v21 = v11;
    id v12 = v8;
    id v22 = v12;
    id v13 = v9;
    id v23 = v13;
    [(_PSFamilyMLPredictionTask *)self enumerateContactsInContactStoreUsingBlock:&v17];
    if (!*((unsigned char *)v27 + 24))
    {
      v14 = -[_PSFamilyMLPredictionTask knowledgeEventUsingPredictions:familyRelations:](self, "knowledgeEventUsingPredictions:familyRelations:", v13, v12, v17, v18, v19, v20, v21, v22);
      if (v6[2](v10))
      {
        v15 = [MEMORY[0x1E4F5B560] knowledgeStore];
        v32[0] = v14;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
        [v15 saveObjects:v16 tracker:&__block_literal_global_16 responseQueue:0 withCompletion:&__block_literal_global_18_1];
      }
    }

    _Block_object_dispose(&v26, 8);
  }
}

- (id)contactKeysToFetch
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass_1;
  uint64_t v53 = getCNContactFormatterClass_softClass_1;
  if (!getCNContactFormatterClass_softClass_1)
  {
    ContactsLibraryCore_4();
    v51[3] = (uint64_t)objc_getClass("CNContactFormatter");
    getCNContactFormatterClass_softClass_1 = v51[3];
    v2 = (void *)v51[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v50, 8);
  v49 = [v3 descriptorForRequiredKeysForStyle:0];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  id v4 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_4;
  uint64_t v53 = getCNContactIdentifierKeySymbolLoc_ptr_4;
  if (!getCNContactIdentifierKeySymbolLoc_ptr_4)
  {
    id v5 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v5, "CNContactIdentifierKey");
    getCNContactIdentifierKeySymbolLoc_ptr_4 = v51[3];
    id v4 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v4) {
    goto LABEL_45;
  }
  id v6 = *v4;
  v54[0] = v6;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v7 = (id *)getCNContactBirthdayKeySymbolLoc_ptr;
  uint64_t v53 = getCNContactBirthdayKeySymbolLoc_ptr;
  if (!getCNContactBirthdayKeySymbolLoc_ptr)
  {
    v8 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v8, "CNContactBirthdayKey");
    getCNContactBirthdayKeySymbolLoc_ptr = v51[3];
    v7 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v7) {
    goto LABEL_45;
  }
  id v9 = *v7;
  v54[1] = v9;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v10 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr_0;
  uint64_t v53 = getCNContactNamePrefixKeySymbolLoc_ptr_0;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr_0)
  {
    v11 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v11, "CNContactNamePrefixKey");
    getCNContactNamePrefixKeySymbolLoc_ptr_0 = v51[3];
    v10 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v10) {
    goto LABEL_45;
  }
  id v12 = *v10;
  v54[2] = v12;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  id v13 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_1;
  uint64_t v53 = getCNContactGivenNameKeySymbolLoc_ptr_1;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_1)
  {
    v14 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v14, "CNContactGivenNameKey");
    getCNContactGivenNameKeySymbolLoc_ptr_1 = v51[3];
    id v13 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v13) {
    goto LABEL_45;
  }
  id v15 = *v13;
  v54[3] = v15;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v16 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_1;
  uint64_t v53 = getCNContactMiddleNameKeySymbolLoc_ptr_1;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_1)
  {
    uint64_t v17 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v17, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr_1 = v51[3];
    v16 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v16) {
    goto LABEL_45;
  }
  id v18 = *v16;
  v54[4] = v18;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v19 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_1;
  uint64_t v53 = getCNContactFamilyNameKeySymbolLoc_ptr_1;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_1)
  {
    v20 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v20, "CNContactFamilyNameKey");
    getCNContactFamilyNameKeySymbolLoc_ptr_1 = v51[3];
    v19 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v19) {
    goto LABEL_45;
  }
  id v48 = *v19;
  v54[5] = v48;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v21 = (id *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0;
  uint64_t v53 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0)
  {
    id v22 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v22, "CNContactPreviousFamilyNameKey");
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0 = v51[3];
    v21 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v21) {
    goto LABEL_45;
  }
  id v23 = *v21;
  v54[6] = v23;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  id v24 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr_0;
  uint64_t v53 = getCNContactNameSuffixKeySymbolLoc_ptr_0;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr_0)
  {
    v25 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v25, "CNContactNameSuffixKey");
    getCNContactNameSuffixKeySymbolLoc_ptr_0 = v51[3];
    id v24 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v24) {
    goto LABEL_45;
  }
  id v26 = *v24;
  v54[7] = v26;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v27 = (id *)getCNContactNicknameKeySymbolLoc_ptr_1;
  uint64_t v53 = getCNContactNicknameKeySymbolLoc_ptr_1;
  if (!getCNContactNicknameKeySymbolLoc_ptr_1)
  {
    uint64_t v28 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v28, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr_1 = v51[3];
    v27 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v27) {
    goto LABEL_45;
  }
  id v29 = *v27;
  v54[8] = v29;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v30 = (id *)getCNContactTypeKeySymbolLoc_ptr_0;
  uint64_t v53 = getCNContactTypeKeySymbolLoc_ptr_0;
  if (!getCNContactTypeKeySymbolLoc_ptr_0)
  {
    id v31 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v31, "CNContactTypeKey");
    getCNContactTypeKeySymbolLoc_ptr_0 = v51[3];
    v30 = (id *)v51[3];
  }
  v46 = v9;
  v47 = v12;
  v45 = v6;
  _Block_object_dispose(&v50, 8);
  if (!v30) {
    goto LABEL_45;
  }
  id v32 = *v30;
  v54[9] = v32;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v33 = (id *)getCNContactRelationsKeySymbolLoc_ptr_1;
  uint64_t v53 = getCNContactRelationsKeySymbolLoc_ptr_1;
  if (!getCNContactRelationsKeySymbolLoc_ptr_1)
  {
    v34 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v34, "CNContactRelationsKey");
    getCNContactRelationsKeySymbolLoc_ptr_1 = v51[3];
    v33 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v33) {
    goto LABEL_45;
  }
  id v35 = *v33;
  v54[10] = v35;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v36 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_2;
  uint64_t v53 = getCNContactPhoneNumbersKeySymbolLoc_ptr_2;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_2)
  {
    v37 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v37, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr_2 = v51[3];
    v36 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v36) {
    goto LABEL_45;
  }
  id v38 = *v36;
  v54[11] = v38;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  v39 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_2;
  uint64_t v53 = getCNContactEmailAddressesKeySymbolLoc_ptr_2;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_2)
  {
    v40 = (void *)ContactsLibrary_3();
    v51[3] = (uint64_t)dlsym(v40, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr_2 = v51[3];
    v39 = (id *)v51[3];
  }
  _Block_object_dispose(&v50, 8);
  if (!v39)
  {
LABEL_45:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v55 = *v39;
  v56 = v49;
  v41 = (void *)MEMORY[0x1E4F1C978];
  id v42 = v55;
  v43 = [v41 arrayWithObjects:v54 count:14];

  return v43;
}

- (void)enumerateContactsInContactStoreUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v5 = (void *)getCNContactStoreClass_softClass_3;
  uint64_t v16 = getCNContactStoreClass_softClass_3;
  if (!getCNContactStoreClass_softClass_3)
  {
    ContactsLibraryCore_4();
    v14[3] = (uint64_t)objc_getClass("CNContactStore");
    getCNContactStoreClass_softClass_3 = v14[3];
    id v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  id v7 = objc_alloc_init(v6);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v8 = (void *)getCNContactFetchRequestClass_softClass_1;
  uint64_t v16 = getCNContactFetchRequestClass_softClass_1;
  if (!getCNContactFetchRequestClass_softClass_1)
  {
    ContactsLibraryCore_4();
    v14[3] = (uint64_t)objc_getClass("CNContactFetchRequest");
    getCNContactFetchRequestClass_softClass_1 = v14[3];
    v8 = (void *)v14[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);
  id v10 = [v9 alloc];
  v11 = [(_PSFamilyMLPredictionTask *)self contactKeysToFetch];
  id v12 = (void *)[v10 initWithKeysToFetch:v11];

  [v12 setContactBatchCount:25];
  [v7 enumerateContactsWithFetchRequest:v12 error:0 usingBlock:v4];
}

- (id)knowledgeEventUsingPredictions:(id)a3 familyRelations:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1C9C8] now];
  v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 setObject:&unk_1EF676788 forKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        v20 = objc_msgSend(v8, "objectForKeyedSubscript:", v19, (void)v28);

        if (!v20)
        {
          v21 = [v14 objectForKeyedSubscript:v19];
          [v8 setObject:v21 forKeyedSubscript:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v16);
  }

  id v22 = (void *)MEMORY[0x1E4F5B510];
  id v23 = [MEMORY[0x1E4F5B5F8] familyPredictionStream];
  id v24 = [MEMORY[0x1E4F5B530] suggestions];
  v36 = v24;
  v37 = v8;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  id v26 = [v22 eventWithStream:v23 source:0 startDate:v7 endDate:v7 identifierStringValue:@"familyPrediction" metadata:v25];

  return v26;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (NSString)directory
{
  return self->_directory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end