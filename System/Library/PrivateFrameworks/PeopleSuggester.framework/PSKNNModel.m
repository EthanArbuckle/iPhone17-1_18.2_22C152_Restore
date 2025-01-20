@interface PSKNNModel
@end

@implementation PSKNNModel

uint64_t __116___PSKNNModel_PhoneAutocompleteSuggestions__rankedLabelsFromInteractionsForPhoneCallsWithInteractions_andDistances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 objectForKeyedSubscript:@"score"];
  v6 = [v4 objectForKeyedSubscript:@"score"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __80___PSKNNModel_PhoneAutocompleteSuggestions__suggestionExists_withValue_inArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

uint64_t __94___PSKNNModel_rankedMessagesAutocompleteSuggestionsWithPredictionContext_bundleId_candidates___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v8) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v7) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
  }
  else
  {
    uint64_t v11 = [v7 compare:v8];
  }

  return v11;
}

_PSSuggestion *__79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= 0.0)
  {
    uint64_t v10 = +[_PSLogging knnChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke_cold_2(v4, v10);
    }

    id v11 = 0;
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v46 = __Block_byref_object_copy__13;
    v47 = __Block_byref_object_dispose__13;
    id v48 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke_308;
    block[3] = &unk_1E5AE0A98;
    v43 = buf;
    id v5 = v3;
    id v42 = v5;
    dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, block);
    dispatch_async(*(dispatch_queue_t *)(a1 + 32), v6);
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    double v8 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v8 <= 0.0)
    {
      dispatch_time_t v9 = 0;
    }
    else if (v8 <= 9223372040.0)
    {
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    }
    else
    {
      dispatch_time_t v9 = -1;
    }
    if (dispatch_block_wait(v6, v9))
    {
      v12 = +[_PSLogging knnChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [v5 conversationIdentifier];
        __79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke_cold_1(v13, (uint64_t)v44, v12);
      }

      id v11 = 0;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    else
    {
      id v11 = *(id *)(*(void *)&buf[8] + 40);
    }
    v14 = [MEMORY[0x1E4F1C9C8] now];
    [v14 timeIntervalSinceDate:v7];
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 24)
                                                                - v15;

    _Block_object_dispose(buf, 8);
  }
  if (![v11 count]) {
    goto LABEL_32;
  }
  v16 = [v11 firstObject];
  v17 = [v16 displayName];

  if ([*(id *)(a1 + 40) containsObject:v17])
  {

    v18 = 0;
    goto LABEL_33;
  }
  if (v17)
  {
    [*(id *)(a1 + 40) addObject:v17];
    v19 = v17;
  }
  else
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = [v4 groupName];
  if (v20)
  {
    int v21 = [v19 isEqual:v20];
  }
  else
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
    int v21 = [v19 isEqual:v22];
  }
  if (!v17) {

  }
  v23 = *(void **)(a1 + 48);
  v24 = [v11 firstObject];
  v25 = [v23 recipientsForChat:v24];

  v26 = *(void **)(a1 + 48);
  v27 = [v4 recipients];
  int v28 = [v26 suggestedRecipientHandles:v27 differFromFetchedRecipientHandles:v25];

  int v29 = v21 ^ 1;
  if (((v21 ^ 1 | v28) & 1) == 0)
  {

LABEL_32:
    v18 = v4;
    goto LABEL_33;
  }
  v30 = +[_PSLogging knnChannel];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478339;
    *(void *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v29;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v28;
    _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_DEFAULT, "Updating suggestion since groupName(%{private}@) changed: %{BOOL}d or participants changed: %{BOOL}d", buf, 0x18u);
  }

  v31 = [_PSSuggestion alloc];
  v40 = [v4 bundleID];
  v39 = [v4 conversationIdentifier];
  v32 = [v4 derivedIntentIdentifier];
  v33 = [v4 image];
  v34 = [v4 reason];
  v35 = [v4 reasonType];
  v36 = [v4 score];
  v18 = [(_PSSuggestion *)v31 initWithBundleID:v40 conversationIdentifier:v39 groupName:v17 recipients:v25 derivedIntentIdentifier:v32 image:v33 reason:v34 reasonType:v35 score:v36];

  v37 = [v4 messagesGroupIdentifier];
  [(_PSSuggestion *)v18 setMessagesGroupIdentifier:v37];

LABEL_33:

  return v18;
}

void __79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke_308(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversationIdentifier];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v3 = (void (*)(id))getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  v12 = getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  if (!getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_block_invoke;
    v8[3] = &unk_1E5ADE858;
    v8[4] = &v9;
    __getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_block_invoke((uint64_t)v8);
    id v3 = (void (*)(id))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
    uint64_t v7 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU]();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  uint64_t v4 = v3(v2);

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_block_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __33___PSKNNModel_contactKeysToFetch__block_invoke()
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v0 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr_2;
  uint64_t v55 = getCNContactNamePrefixKeySymbolLoc_ptr_2;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr_2)
  {
    v1 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v1, "CNContactNamePrefixKey");
    getCNContactNamePrefixKeySymbolLoc_ptr_2 = v53[3];
    v0 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v0) {
    goto LABEL_50;
  }
  id v2 = *v0;
  v56[0] = v2;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  id v3 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_3;
  uint64_t v55 = getCNContactGivenNameKeySymbolLoc_ptr_3;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_3)
  {
    uint64_t v4 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v4, "CNContactGivenNameKey");
    getCNContactGivenNameKeySymbolLoc_ptr_3 = v53[3];
    id v3 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v3) {
    goto LABEL_50;
  }
  id v5 = *v3;
  v56[1] = v5;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  dispatch_block_t v6 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_3;
  uint64_t v55 = getCNContactMiddleNameKeySymbolLoc_ptr_3;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_3)
  {
    uint64_t v7 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v7, "CNContactMiddleNameKey");
    getCNContactMiddleNameKeySymbolLoc_ptr_3 = v53[3];
    dispatch_block_t v6 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v6) {
    goto LABEL_50;
  }
  id v8 = *v6;
  v56[2] = v8;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v9 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_3;
  uint64_t v55 = getCNContactFamilyNameKeySymbolLoc_ptr_3;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_3)
  {
    uint64_t v10 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v10, "CNContactFamilyNameKey");
    getCNContactFamilyNameKeySymbolLoc_ptr_3 = v53[3];
    uint64_t v9 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v9) {
    goto LABEL_50;
  }
  id v11 = *v9;
  v56[3] = v11;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v12 = (id *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2;
  uint64_t v55 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2)
  {
    v13 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v13, "CNContactPreviousFamilyNameKey");
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2 = v53[3];
    v12 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v12) {
    goto LABEL_50;
  }
  id v51 = *v12;
  v56[4] = v51;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v14 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr_2;
  uint64_t v55 = getCNContactNameSuffixKeySymbolLoc_ptr_2;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr_2)
  {
    double v15 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v15, "CNContactNameSuffixKey");
    getCNContactNameSuffixKeySymbolLoc_ptr_2 = v53[3];
    v14 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v14) {
    goto LABEL_50;
  }
  id v50 = *v14;
  v56[5] = v50;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v16 = (id *)getCNContactNicknameKeySymbolLoc_ptr_3;
  uint64_t v55 = getCNContactNicknameKeySymbolLoc_ptr_3;
  if (!getCNContactNicknameKeySymbolLoc_ptr_3)
  {
    v17 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v17, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr_3 = v53[3];
    v16 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v16) {
    goto LABEL_50;
  }
  id v49 = *v16;
  v56[6] = v49;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v18 = (id *)getCNContactOrganizationNameKeySymbolLoc_ptr;
  uint64_t v55 = getCNContactOrganizationNameKeySymbolLoc_ptr;
  if (!getCNContactOrganizationNameKeySymbolLoc_ptr)
  {
    v19 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v19, "CNContactOrganizationNameKey");
    getCNContactOrganizationNameKeySymbolLoc_ptr = v53[3];
    v18 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v18) {
    goto LABEL_50;
  }
  id v48 = *v18;
  v56[7] = v48;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v20 = (id *)getCNContactImageDataKeySymbolLoc_ptr_0;
  uint64_t v55 = getCNContactImageDataKeySymbolLoc_ptr_0;
  if (!getCNContactImageDataKeySymbolLoc_ptr_0)
  {
    int v21 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v21, "CNContactImageDataKey");
    getCNContactImageDataKeySymbolLoc_ptr_0 = v53[3];
    v20 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v20) {
    goto LABEL_50;
  }
  id v47 = *v20;
  v56[8] = v47;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v22 = (id *)getCNContactImageDataAvailableKeySymbolLoc_ptr_0;
  uint64_t v55 = getCNContactImageDataAvailableKeySymbolLoc_ptr_0;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr_0)
  {
    v23 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v23, "CNContactImageDataAvailableKey");
    getCNContactImageDataAvailableKeySymbolLoc_ptr_0 = v53[3];
    v22 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v22) {
    goto LABEL_50;
  }
  id v46 = *v22;
  v56[9] = v46;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v24 = (id *)getCNContactThumbnailImageDataKeySymbolLoc_ptr_0;
  uint64_t v55 = getCNContactThumbnailImageDataKeySymbolLoc_ptr_0;
  if (!getCNContactThumbnailImageDataKeySymbolLoc_ptr_0)
  {
    v25 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v25, "CNContactThumbnailImageDataKey");
    getCNContactThumbnailImageDataKeySymbolLoc_ptr_0 = v53[3];
    v24 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v24) {
    goto LABEL_50;
  }
  id v26 = *v24;
  v56[10] = v26;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v27 = (id *)getCNContactTypeKeySymbolLoc_ptr_2;
  uint64_t v55 = getCNContactTypeKeySymbolLoc_ptr_2;
  if (!getCNContactTypeKeySymbolLoc_ptr_2)
  {
    int v28 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v28, "CNContactTypeKey");
    getCNContactTypeKeySymbolLoc_ptr_2 = v53[3];
    v27 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v27) {
    goto LABEL_50;
  }
  id v29 = *v27;
  v56[11] = v29;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v30 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_4;
  uint64_t v55 = getCNContactPhoneNumbersKeySymbolLoc_ptr_4;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_4)
  {
    v31 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v31, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr_4 = v53[3];
    v30 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v30) {
    goto LABEL_50;
  }
  id v32 = *v30;
  v56[12] = v32;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v33 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_4;
  uint64_t v55 = getCNContactEmailAddressesKeySymbolLoc_ptr_4;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_4)
  {
    v34 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v34, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr_4 = v53[3];
    v33 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v33) {
    goto LABEL_50;
  }
  id v35 = *v33;
  v56[13] = v35;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v36 = (id *)getCNContactPostalAddressesKeySymbolLoc_ptr_0;
  uint64_t v55 = getCNContactPostalAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactPostalAddressesKeySymbolLoc_ptr_0)
  {
    v37 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v37, "CNContactPostalAddressesKey");
    getCNContactPostalAddressesKeySymbolLoc_ptr_0 = v53[3];
    v36 = (id *)v53[3];
  }
  v45 = v2;
  _Block_object_dispose(&v52, 8);
  if (!v36) {
    goto LABEL_50;
  }
  id v38 = *v36;
  v56[14] = v38;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  v39 = (id *)getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0;
  uint64_t v55 = getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0)
  {
    v40 = (void *)ContactsLibrary_5();
    v53[3] = (uint64_t)dlsym(v40, "CNContactInstantMessageAddressesKey");
    getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0 = v53[3];
    v39 = (id *)v53[3];
  }
  _Block_object_dispose(&v52, 8);
  if (!v39)
  {
LABEL_50:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v57 = *v39;
  v41 = (void *)MEMORY[0x1E4F1C978];
  id v42 = v57;
  uint64_t v43 = [v41 arrayWithObjects:v56 count:16];
  v44 = (void *)contactKeysToFetch_contactKeysToFetch;
  contactKeysToFetch_contactKeysToFetch = v43;
}

uint64_t __58___PSKNNModel_indexesOfObjectsWithKey_withValues_inArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

void __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 containsString:@"@"])
  {
    id v3 = (void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];

    if (v5)
    {
      uint64_t v4 = 0;
      id v3 = (void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    else
    {
      id v3 = (void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v4 = 2;
    }
  }
  ++*v3;
  dispatch_block_t v6 = +[_PSContactCache sharedInstance];
  uint64_t v7 = [v6 getContactForHandle:v9 handleType:v4];

  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F5B3B0] normalizedStringFromContactString:v9];
    [*(id *)(a1 + 40) addObject:v8];
  }
}

uint64_t __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke_338(uint64_t a1, uint64_t a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __54___PSKNNModel_suggestionProxiesWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __44___PSKNNModel_featureVectorFromInteraction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 personInPhoto];
}

uint64_t __89___PSKNNModel_rankedLabelsFromInteractionsMaintainRecipientsArray_andDistances_freqOnly___block_invoke(uint64_t a1, void *a2)
{
  return [a2 personInPhoto];
}

uint64_t __89___PSKNNModel_rankedLabelsFromInteractionsMaintainRecipientsArray_andDistances_freqOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  dispatch_block_t v6 = [v4 objectForKeyedSubscript:@"score"];
  [v6 doubleValue];
  double v8 = v7;
  id v9 = [v5 objectForKeyedSubscript:@"score"];
  [v9 doubleValue];
  double v11 = v10;

  if (v8 >= v11)
  {
    v13 = [v4 objectForKeyedSubscript:@"score"];
    [v13 doubleValue];
    double v15 = v14;
    v16 = [v5 objectForKeyedSubscript:@"score"];
    [v16 doubleValue];
    double v18 = v17;

    if (v15 <= v18) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

uint64_t __119___PSKNNModel_rankedLabelsFromInteractionsSingleRecipientArray_andDistances_freqOnly_contactsOnly_scoreLikeShareSheet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  dispatch_block_t v6 = [v4 objectForKeyedSubscript:@"score"];
  [v6 doubleValue];
  double v8 = v7;
  id v9 = [v5 objectForKeyedSubscript:@"score"];
  [v9 doubleValue];
  double v11 = v10;

  if (v8 >= v11)
  {
    v13 = [v4 objectForKeyedSubscript:@"score"];
    [v13 doubleValue];
    double v15 = v14;
    v16 = [v5 objectForKeyedSubscript:@"score"];
    [v16 doubleValue];
    double v18 = v17;

    if (v15 <= v18) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

uint64_t __88___PSKNNModel_rankedLabelsFromInteractionsSiriNLWithInteractions_andDistances_freqOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  dispatch_block_t v6 = [v4 objectForKeyedSubscript:@"score"];
  [v6 doubleValue];
  double v8 = v7;
  id v9 = [v5 objectForKeyedSubscript:@"score"];
  [v9 doubleValue];
  double v11 = v10;

  if (v8 >= v11)
  {
    v13 = [v4 objectForKeyedSubscript:@"score"];
    [v13 doubleValue];
    double v15 = v14;
    v16 = [v5 objectForKeyedSubscript:@"score"];
    [v16 doubleValue];
    double v18 = v17;

    if (v15 <= v18) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

uint64_t __43___PSKNNModel_indexToInsertNeighbor_array___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 distance];
  double v7 = v6;
  [v5 distance];
  if (v7 >= v8)
  {
    [v4 distance];
    double v11 = v10;
    [v5 distance];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    uint64_t v3 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_cold_1(v2, v3);
    }
  }
}

void __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_471(uint64_t a1, void *a2)
{
  id v27 = a2;
  uint64_t v3 = [v27 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [v3 startLocationId];

    if (v5)
    {
      double v6 = [v3 startLocationId];
      double v7 = [MEMORY[0x1E4F5B580] navigationStartLocationIdentifier];
      [v4 setObject:v6 forKeyedSubscript:v7];
    }
    double v8 = [v3 endLocationId];

    if (v8)
    {
      uint64_t v9 = [v3 endLocationId];
      double v10 = [MEMORY[0x1E4F5B580] navigationEndLocationIdentifier];
      [v4 setObject:v9 forKeyedSubscript:v10];
    }
    double v11 = [v3 contactId];

    if (v11)
    {
      double v12 = [v3 contactId];
      v13 = [MEMORY[0x1E4F5B580] contactId];
      [v4 setObject:v12 forKeyedSubscript:v13];
    }
    double v14 = (void *)MEMORY[0x1E4F1C9C8];
    [v27 timestamp];
    double v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    v16 = (void *)MEMORY[0x1E4F1C9C8];
    [v27 timestamp];
    double v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    id v18 = objc_alloc(MEMORY[0x1E4F5B5F0]);
    v19 = [v3 identifier];
    v20 = [v3 bundleId];
    int v21 = [v3 groupId];
    v22 = (void *)[v18 initWithIdentifier:v19 bundleIdentifier:v20 itemIdentifier:0 groupIdentifier:v21 deviceIdentifier:0 userIdentifier:0];

    v23 = (void *)MEMORY[0x1E4F5B510];
    v24 = [MEMORY[0x1E4F5B520] eventStreamWithName:@"/mapsShareEta/feedback"];
    v25 = [v3 handle];
    id v26 = [v23 eventWithStream:v24 source:v22 startDate:v15 endDate:v17 identifierStringValue:v25 metadata:v4];

    [*(id *)(a1 + 32) addObject:v26];
  }
}

uint64_t __64___PSKNNModel_mapsShareEtaDefaultKnnSuggestions_maxSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __84___PSKNNModel_extractNearestNeighborsForMapsQueryResult_andNeighbors_frequencyOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 >= v8)
  {
    [v4 doubleValue];
    double v11 = v10;
    [v5 doubleValue];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

void __79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_1A314B000, a3, (uint64_t)a3, "Timed out during IMCore groupName fetch for conversation identifier %{private}@", (uint8_t *)a2);
}

void __79___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions_imCoreTimeBudget___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 conversationIdentifier];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A314B000, a2, v4, "Skipping IMCore groupName fetch for conversation identifier %{private}@ (no more time budget)", v5);
}

void __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0(&dword_1A314B000, a2, v4, "Finalizing local events failed: %@", v5);
}

@end