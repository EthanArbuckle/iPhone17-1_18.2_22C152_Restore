@interface PSFTZKWSuggestionsTransformerFactory
@end

@implementation PSFTZKWSuggestionsTransformerFactory

void __120___PSFTZKWSuggestionsTransformerFactory_formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  v1 = (void *)MEMORY[0x1A6243860]();
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v3 = +[_PSConstants mobileMessagesBundleId];
  v4 = +[_PSConstants macMessagesBundleId];
  uint64_t v5 = objc_msgSend(v2, "initWithObjects:", v3, v4, 0);

  v6 = (void *)formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasExprOnceResult;
  formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasExprOnceResult = v5;
}

id __77___PSFTZKWSuggestionsTransformerFactory_formatWithBundleIdsForGroupMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    v4 = objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(a1 + 32), "formatWithSuggestion:bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), *(void *)(a1 + 40), 1, (void)v12);
          [v4 addObjectsFromArray:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

id __59___PSFTZKWSuggestionsTransformerFactory_filterIDSReachable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v26 = (id)objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = v3;
    id obj = v3;
    uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v36;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v4;
          id v5 = *(void **)(*((void *)&v35 + 1) + 8 * v4);
          uint64_t v6 = objc_opt_new();
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          v29 = v5;
          uint64_t v7 = [v5 recipients];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v41 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v32 != v10) {
                  objc_enumerationMutation(v7);
                }
                long long v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                if ([*(id *)(a1 + 32) isEligibleRecipient:v12])
                {
                  [v6 addObject:v12];
                }
                else
                {
                  long long v13 = +[_PSLogging generalChannel];
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v14 = [v12 handle];
                    *(_DWORD *)buf = 138412290;
                    v40 = v14;
                    _os_log_impl(&dword_1A314B000, v13, OS_LOG_TYPE_DEFAULT, "Filtering recipient %@ since not IDS eligible", buf, 0xCu);
                  }
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v41 count:16];
            }
            while (v9);
          }

          if ([v6 count])
          {
            uint64_t v15 = [v6 count];
            v16 = [v29 recipients];
            uint64_t v17 = [v16 count];

            if (v15 == v17)
            {
              [v26 addObject:v29];
            }
            else
            {
              v18 = [_PSSuggestion alloc];
              v19 = [v29 bundleID];
              v20 = [v29 reason];
              v21 = [v29 reasonType];
              v22 = [(_PSSuggestion *)v18 initWithBundleID:v19 conversationIdentifier:0 groupName:0 recipients:v6 reason:v20 reasonType:v21];
              [v26 addObject:v22];
            }
          }

          uint64_t v4 = v30 + 1;
        }
        while (v30 + 1 != v28);
        uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v28);
    }

    id v3 = v24;
  }
  else
  {
    id v26 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

id __74___PSFTZKWSuggestionsTransformerFactory_getCraftedIdentfierForSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 contact];

  if (v3)
  {
    uint64_t v4 = [v2 contact];

    id v5 = [v4 identifier];
    id v2 = v4;
  }
  else
  {
    id v5 = [v2 handle];
  }

  return v5;
}

id __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithSeedRecipients___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count] && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    id v20 = (id)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (!v5) {
      goto LABEL_17;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v9 recipients];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          long long v12 = [v9 recipients];
          unint64_t v13 = [v12 count];

          if (v13 > 1) {
            continue;
          }
          long long v14 = [v9 recipients];
          uint64_t v15 = [v14 firstObject];

          v16 = *(void **)(a1 + 32);
          uint64_t v17 = [v15 handle];
          LOBYTE(v16) = [v16 containsObject:v17];

          if ((v16 & 1) == 0) {
            [v20 addObject:v9];
          }
        }
        else
        {
          uint64_t v15 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v9;
            _os_log_fault_impl(&dword_1A314B000, v15, OS_LOG_TYPE_FAULT, "Empty recipients list in suggestion: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (!v6)
      {
LABEL_17:

        id v3 = v19;
        goto LABEL_19;
      }
    }
  }
  id v20 = v3;
LABEL_19:

  return v20;
}

id __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithMaxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = objc_opt_new();
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v70 = v3;
    id obj = v3;
    uint64_t v7 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v102;
      uint64_t v72 = a1;
      v73 = v4;
      v71 = v5;
      uint64_t v74 = *(void *)v102;
LABEL_4:
      uint64_t v10 = 0;
      uint64_t v75 = v8;
      while (1)
      {
        if (*(void *)v102 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(NSObject **)(*((void *)&v101 + 1) + 8 * v10);
        if ([v4 count] == *(void *)(a1 + 32)) {
          goto LABEL_83;
        }
        v84 = v11;
        long long v12 = [v11 recipients];
        uint64_t v13 = [v12 count];

        uint64_t v83 = v10;
        if (v13 == 1) {
          break;
        }
        if (v13)
        {
          uint64_t v63 = [v84 conversationIdentifier];
          if (!v63) {
            goto LABEL_81;
          }
          v64 = (void *)v63;
          v65 = [v84 conversationIdentifier];
          char v66 = [v5 containsObject:v65];

          uint64_t v15 = v84;
          if (v66) {
            goto LABEL_81;
          }
          v67 = [v84 conversationIdentifier];
          [v5 addObject:v67];

          long long v14 = +[_PSFTZKWSuggestionsTransformerFactory getCraftedIdentfierForSuggestion:v84];
          if (([v5 containsObject:v14] & 1) == 0)
          {
            [v5 addObject:v14];
LABEL_80:

            [v4 addObject:v15];
            goto LABEL_81;
          }
        }
        else
        {
          long long v14 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v110 = v84;
            _os_log_error_impl(&dword_1A314B000, v14, OS_LOG_TYPE_ERROR, "No recipient filled in suggestion %@", buf, 0xCu);
          }
        }

LABEL_81:
        uint64_t v10 = v83 + 1;
        if (v83 + 1 == v8)
        {
          uint64_t v8 = [obj countByEnumeratingWithState:&v101 objects:v111 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_83;
        }
      }
      uint64_t v15 = v84;
      v16 = [v84 recipients];
      uint64_t v17 = [v16 firstObject];

      v18 = objc_opt_new();
      id v19 = v17;
      id v20 = objc_opt_new();
      uint64_t v21 = [v19 identifier];
      if (v21) {
        [v18 addObject:v21];
      }
      v77 = (void *)v21;
      long long v22 = [v19 handle];
      if (v22) {
        [v18 addObject:v22];
      }
      [v19 contact];
      v80 = v78 = v19;
      if (v80)
      {
        long long v23 = [v80 identifier];
        [v18 addObject:v23];

        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        long long v24 = [v80 emailAddresses];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v97 objects:v108 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v98;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v98 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v97 + 1) + 8 * i);
              uint64_t v30 = [v29 identifier];
              [v18 addObject:v30];

              long long v31 = [v29 value];
              [v18 addObject:v31];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v97 objects:v108 count:16];
          }
          while (v26);
        }

        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        long long v32 = [v80 phoneNumbers];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v93 objects:v107 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v94;
          do
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v94 != v35) {
                objc_enumerationMutation(v32);
              }
              long long v37 = *(void **)(*((void *)&v93 + 1) + 8 * j);
              long long v38 = [v37 identifier];
              [v18 addObject:v38];

              v39 = [v37 value];
              [v20 addObject:v39];
              v40 = [v39 stringValue];

              if (v40)
              {
                v41 = [v39 stringValue];
                [v18 addObject:v41];
              }
              v42 = [v39 digits];

              if (v42)
              {
                uint64_t v43 = [v39 digits];
                [v18 addObject:v43];
              }
              v44 = [v39 stringValue];

              if (v44)
              {
                v45 = [v39 stringValue];
                [v18 addObject:v45];
              }
              v46 = [v39 formattedStringValue];

              if (v46)
              {
                v47 = [v39 formattedStringValue];
                [v18 addObject:v47];
              }
              v48 = [v39 formattedInternationalStringValue];

              if (v48)
              {
                v49 = [v39 formattedInternationalStringValue];
                [v18 addObject:v49];
              }
              v50 = [v39 unformattedInternationalStringValue];

              if (v50)
              {
                v51 = [v39 unformattedInternationalStringValue];
                [v18 addObject:v51];
              }
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v93 objects:v107 count:16];
          }
          while (v34);
        }

        a1 = v72;
        id v4 = v73;
        uint64_t v5 = v71;
        uint64_t v15 = v84;
      }
      if ([v5 intersectsSet:v18] & 1) != 0 || (objc_msgSend(v6, "intersectsSet:", v20))
      {
LABEL_74:
        [v5 unionSet:v18];
        [v6 unionSet:v20];
LABEL_75:
        v68 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v78;
          _os_log_impl(&dword_1A314B000, v68, OS_LOG_TYPE_DEFAULT, "Recipient already added %@", buf, 0xCu);
        }

        uint64_t v9 = v74;
        uint64_t v8 = v75;
        goto LABEL_81;
      }
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v52 = v20;
      uint64_t v82 = [v52 countByEnumeratingWithState:&v89 objects:v106 count:16];
      if (v82)
      {
        id v79 = v52;
        char v53 = 0;
        uint64_t v81 = *(void *)v90;
        while (2)
        {
          for (uint64_t k = 0; k != v82; ++k)
          {
            if (*(void *)v90 != v81) {
              objc_enumerationMutation(v79);
            }
            if (v53)
            {

              a1 = v72;
              id v4 = v73;
              uint64_t v5 = v71;
              goto LABEL_74;
            }
            v55 = *(void **)(*((void *)&v89 + 1) + 8 * k);
            long long v87 = 0u;
            long long v88 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            id v56 = v6;
            uint64_t v57 = [v56 countByEnumeratingWithState:&v85 objects:v105 count:16];
            if (v57)
            {
              uint64_t v58 = v57;
              v59 = v22;
              v60 = v6;
              uint64_t v61 = *(void *)v86;
              while (2)
              {
                for (uint64_t m = 0; m != v58; ++m)
                {
                  if (*(void *)v86 != v61) {
                    objc_enumerationMutation(v56);
                  }
                  if ([v55 isLikePhoneNumber:*(void *)(*((void *)&v85 + 1) + 8 * m)])
                  {
                    char v53 = 1;
                    goto LABEL_63;
                  }
                }
                uint64_t v58 = [v56 countByEnumeratingWithState:&v85 objects:v105 count:16];
                if (v58) {
                  continue;
                }
                break;
              }
              char v53 = 0;
LABEL_63:
              uint64_t v6 = v60;
              long long v22 = v59;
            }
            else
            {
              char v53 = 0;
            }
          }
          uint64_t v82 = [v79 countByEnumeratingWithState:&v89 objects:v106 count:16];
          if (v82) {
            continue;
          }
          break;
        }
        id v52 = v79;

        uint64_t v5 = v71;
        [v71 unionSet:v18];
        [v56 unionSet:v79];
        a1 = v72;
        id v4 = v73;
        uint64_t v15 = v84;
        if (v53) {
          goto LABEL_75;
        }
      }
      else
      {

        [v5 unionSet:v18];
        [v6 unionSet:v52];
      }

      uint64_t v9 = v74;
      uint64_t v8 = v75;
      long long v14 = v78;
      goto LABEL_80;
    }
LABEL_83:

    id v3 = v70;
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

id __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    id v4 = (void *)getCNContactFormatterClass_softClass_4;
    uint64_t v18 = getCNContactFormatterClass_softClass_4;
    if (!getCNContactFormatterClass_softClass_4)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __getCNContactFormatterClass_block_invoke_4;
      v14[3] = &unk_1E5ADE858;
      v14[4] = &v15;
      __getCNContactFormatterClass_block_invoke_4((uint64_t)v14);
      id v4 = (void *)v16[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v15, 8);
    uint64_t v6 = objc_opt_new();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2;
    v11[3] = &unk_1E5AE0868;
    uint64_t v7 = *(void *)(a1 + 32);
    char v13 = *(unsigned char *)(a1 + 40);
    v11[4] = v7;
    id v12 = v6;
    id v8 = v6;
    uint64_t v9 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v11);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

_PSSuggestion *__77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [v3 recipients];
    if ((unint64_t)[v6 count] < 2)
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v7 = [v3 groupName];
      if ([v7 length])
      {
        BOOL v8 = 1;
      }
      else
      {
        uint64_t v17 = [v3 conversationIdentifier];
        BOOL v8 = v17 != 0;
      }
    }

    uint64_t v18 = [v3 recipients];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_36;
    v41[3] = &unk_1E5AE0840;
    v41[4] = *(void *)(a1 + 32);
    BOOL v44 = v8;
    char v45 = *(unsigned char *)(a1 + 48);
    id v19 = v3;
    id v42 = v19;
    id v43 = *(id *)(a1 + 40);
    id v20 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v41);

    if ([v20 count])
    {
      id v39 = v3;
      if ((unint64_t)[v20 count] < 2)
      {
        uint64_t v21 = 0;
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = [v19 conversationIdentifier];
        uint64_t v21 = [v19 groupName];
      }
      v29 = [_PSSuggestion alloc];
      long long v38 = [v19 bundleID];
      uint64_t v30 = [v19 derivedIntentIdentifier];
      long long v31 = [v19 image];
      long long v32 = [v19 reason];
      uint64_t v33 = [v19 reasonType];
      uint64_t v34 = [v19 score];
      LOBYTE(v37) = [v19 familySuggestion];
      long long v22 = v40;
      v16 = [(_PSSuggestion *)v29 initWithBundleID:v38 conversationIdentifier:v40 groupName:v21 recipients:v20 derivedIntentIdentifier:v30 image:v31 reason:v32 reasonType:v33 score:v34 familySuggestion:v37];

      uint64_t v35 = [v19 messagesGroupIdentifier];
      [(_PSSuggestion *)v16 setMessagesGroupIdentifier:v35];

      id v3 = v39;
    }
    else
    {
      long long v22 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_2((uint64_t)v19, v22, v23, v24, v25, v26, v27, v28);
      }
      v16 = 0;
    }
  }
  else
  {
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    }

    v16 = 0;
  }

  return v16;
}

_PSRecipient *__77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 contact];
  if (v4
    || (uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8),
        [v3 handle],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "getContactForHandle:handleType:", v6, objc_msgSend(v3, "handleType")),
        id v4 = objc_claimAutoreleasedReturnValue(),
        v6,
        v4))
  {
    if ([v4 contactType] == 1)
    {
      uint64_t v7 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_36_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);
      }

LABEL_7:
      uint64_t v14 = 0;
      goto LABEL_14;
    }
    uint64_t v15 = [v3 handle];
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      v16 = [v3 handle];

      if (v16)
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void **)(v17 + 8);
        uint64_t v19 = *(void *)(v17 + 16);
        id v20 = [v3 handle];
        uint64_t v21 = [v18 getFaceTimeableHandleForContact:v4 interactionStore:v19 seedRecipientHandle:v20];

        uint64_t v15 = (void *)v21;
      }
    }
    long long v22 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v3 handle];
      int v38 = 138412546;
      id v39 = v23;
      __int16 v40 = 2112;
      v41 = v15;
      _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_DEFAULT, "Mapped handle %@ to handle %@ and to contact", (uint8_t *)&v38, 0x16u);
    }
    uint64_t v24 = [_PSRecipient alloc];
    uint64_t v25 = [v4 identifier];
    uint64_t v26 = [v3 senderHandle];
    uint64_t v27 = [*(id *)(a1 + 48) stringFromContact:v4];
    uint64_t v14 = [(_PSRecipient *)v24 initWithIdentifier:v25 senderHandle:v26 handle:v15 displayName:v27 contact:v4];
  }
  else
  {
    if (!*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
    {
      id v4 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = [v3 handle];
        int v38 = 138412290;
        id v39 = v37;
        _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "Filtering %@ since no mapped contact found and unmapped suggestions are not allowed", (uint8_t *)&v38, 0xCu);
      }
      goto LABEL_7;
    }
    v29 = [v3 displayName];
    uint64_t v30 = [v29 length];

    if (v30)
    {
      uint64_t v14 = (_PSRecipient *)v3;
    }
    else
    {
      long long v31 = [_PSRecipient alloc];
      long long v32 = [v3 handle];
      uint64_t v33 = [v3 senderHandle];
      uint64_t v34 = [v3 handle];
      uint64_t v35 = [v3 handle];
      long long v36 = [v3 contact];
      uint64_t v14 = [(_PSRecipient *)v31 initWithIdentifier:v32 senderHandle:v33 handle:v34 displayName:v35 contact:v36];
    }
  }
LABEL_14:

  return v14;
}

id __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 count])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [v4 experimentId];
    uint64_t v7 = [*(id *)(a1 + 32) deploymentId];
    uint64_t v8 = [*(id *)(a1 + 32) treatmentId];
    [v5 stringWithFormat:@"Experiment:%@/%u/%@", v6, v7, v8];
  }
  else
  {
    uint64_t v10 = *(void **)(a1 + 40);
    if (!v10)
    {
      uint64_t v13 = @"Default";
      goto LABEL_8;
    }
    uint64_t v11 = NSString;
    uint64_t v6 = [v10 rolloutId];
    uint64_t v12 = [*(id *)(a1 + 40) deploymentId];
    uint64_t v8 = [*(id *)(a1 + 40) factorPackId];
    [v11 stringWithFormat:@"Rollout:%@/%u/%@", v6, v12, v8];
  }
  uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke_2;
  v16[3] = &unk_1E5AE08B8;
  uint64_t v17 = v13;
  uint64_t v14 = v13;
  uint64_t v9 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", v16);

LABEL_9:

  return v9;
}

id __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTrialID:*(void *)(a1 + 32)];

  return v3;
}

void __80___PSFTZKWSuggestionsTransformerFactory_getResultsFromTransformers_suggestions___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("ps_ft_zkw_transformer", v1);

  id v3 = (void *)getResultsFromTransformers_suggestions___pasExprOnceResult;
  getResultsFromTransformers_suggestions___pasExprOnceResult = (uint64_t)v2;
}

void __80___PSFTZKWSuggestionsTransformerFactory_getResultsFromTransformers_suggestions___block_invoke_52(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
      if (!objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "count", (void)v11)) {
        break;
      }
      uint64_t v8 = (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke_36_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end