@interface PSFamilyRecommender
@end

@implementation PSFamilyRecommender

uint64_t __59___PSFamilyRecommender_fetchAllContactIdsFromContactStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

uint64_t __48___PSFamilyRecommender_indexToInsertDate_array___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timeIntervalSinceDate:v5];
  if (v6 >= 0.0)
  {
    [v4 timeIntervalSinceDate:v5];
    uint64_t v7 = v8 > 0.0;
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __37___PSFamilyRecommender_currentFamily__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  id v38 = a3;
  if (v38)
  {
    id v4 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __37___PSFamilyRecommender_currentFamily__block_invoke_cold_1();
    }
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  objc_msgSend(v40, "members", v38);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v53;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v53 != v42)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v44 = v5;
        uint64_t v7 = *(void **)(*((void *)&v52 + 1) + 8 * v5);
        v45 = [v7 dictionary];
        v46 = [v45 objectForKeyedSubscript:@"member-phone-numbers"];
        if ((unint64_t)[v46 length] >= 2)
        {
          double v8 = [v46 componentsSeparatedByString:@", "];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v65 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v49;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v49 != v11) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                v14 = [*(id *)(a1 + 32) contactStore];
                id CNContactClass_1 = getCNContactClass_1();
                uint64_t v61 = 0;
                v62 = &v61;
                uint64_t v63 = 0x2050000000;
                v16 = (void *)getCNPhoneNumberClass_softClass_0;
                uint64_t v64 = getCNPhoneNumberClass_softClass_0;
                if (!getCNPhoneNumberClass_softClass_0)
                {
                  uint64_t v56 = MEMORY[0x1E4F143A8];
                  uint64_t v57 = 3221225472;
                  v58 = __getCNPhoneNumberClass_block_invoke_0;
                  v59 = &unk_1E5ADE858;
                  v60 = &v61;
                  ContactsLibraryCore_1();
                  Class Class = objc_getClass("CNPhoneNumber");
                  *(void *)(v60[1] + 24) = Class;
                  getCNPhoneNumberClass_softClass_0 = *(void *)(v60[1] + 24);
                  v16 = (void *)v62[3];
                }
                id v18 = v16;
                _Block_object_dispose(&v61, 8);
                v19 = [v18 phoneNumberWithStringValue:v13];
                v20 = [CNContactClass_1 predicateForContactsMatchingPhoneNumber:v19];
                v21 = [*(id *)(a1 + 32) contactKeysToFetch];
                v22 = [v14 unifiedContactsMatchingPredicate:v20 keysToFetch:v21 error:0];
                v23 = [v22 firstObject];

                if (v23)
                {
                  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v23];

                  goto LABEL_29;
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v65 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
LABEL_29:

          goto LABEL_30;
        }
        v24 = [v7 appleID];

        if (v24)
        {
          v25 = [*(id *)(a1 + 32) contactStore];
          id v26 = getCNContactClass_1();
          v27 = [v7 appleID];
          v28 = [v26 predicateForContactsMatchingEmailAddress:v27];
          v29 = [*(id *)(a1 + 32) contactKeysToFetch];
          v30 = [v25 unifiedContactsMatchingPredicate:v28 keysToFetch:v29 error:0];
          id v9 = [v30 firstObject];

          if (v9) {
            goto LABEL_24;
          }
        }
        v31 = [v7 inviteEmail];

        if (v31)
        {
          v32 = [*(id *)(a1 + 32) contactStore];
          id v33 = getCNContactClass_1();
          v34 = [v7 inviteEmail];
          v35 = [v33 predicateForContactsMatchingEmailAddress:v34];
          v36 = [*(id *)(a1 + 32) contactKeysToFetch];
          v37 = [v32 unifiedContactsMatchingPredicate:v35 keysToFetch:v36 error:0];
          id v9 = [v37 firstObject];

          if (v9)
          {
LABEL_24:
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
LABEL_30:
          }
        }

        uint64_t v5 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v52 objects:v66 count:16];
    }
    while (v43);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) identifier];
    uint64_t v5 = [v3 identifier];
    if ([v4 isEqualToString:v5])
    {
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v7 = *(void **)(a1 + 40);
      double v8 = [v3 identifier];
      if ([v7 containsObject:v8])
      {
        uint64_t v6 = 0;
      }
      else
      {
        id v9 = *(void **)(a1 + 48);
        uint64_t v10 = [v3 identifier];
        uint64_t v6 = [v9 containsObject:v10] ^ 1;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(a1 + 32) recipientFromFamilyContactId:*(void *)(*((void *)&v14 + 1) + 8 * v10) familySuggestions:0 me:*(void *)(a1 + 40) currentFamilyIds:*(void *)(a1 + 48)];
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 72) + 16))())
        {
          [*(id *)(a1 + 56) addObject:v11];
          v12 = *(void **)(a1 + 64);
          uint64_t v13 = [v11 identifier];
          [v12 addObject:v13];

          v6[2](v6, v11);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_473(uint64_t a1, void *a2)
{
  return [a2 setFamilyHeuristic:1];
}

void __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_478(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPhotosInference:1];
  [v2 setFamilyHeuristic:0];
}

void __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_481(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPhotosInference:1];
  [v2 setFamilyHeuristic:0];
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_496(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_502(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 <= v8)
  {
    [v4 doubleValue];
    double v11 = v10;
    [v5 doubleValue];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_509(uint64_t a1, void *a2)
{
  return [a2 setFamilyHeuristic:1];
}

void __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke_cold_1(a1 + 40, v5);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __78___PSFamilyRecommender_logFeedbackForFamilyRecommenderCallHasRecommendations___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __37___PSFamilyRecommender_currentFamily__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "FAFamilyMember request error %@", v2, v3, v4, v5, v6);
}

void __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "Fetched emergency contacts %@", (uint8_t *)&v3, 0xCu);
}

@end