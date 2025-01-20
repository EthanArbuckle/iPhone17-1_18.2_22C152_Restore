@interface _PSFTZKWSuggestionsTransformerFactory
+ (id)getCraftedIdentfierForSuggestion:(id)a3;
+ (id)getResultsFromTransformers:(id)a3 suggestions:(id)a4;
- (BOOL)isEligibleRecipient:(id)a3;
- (_CDInteractionStore)interactionStore;
- (_PSFTZKWSuggestionsTransformerFactory)init;
- (_PSFTZKWSuggestionsTransformerFactory)initWithInteractionStore:(id)a3;
- (id)annotateWithTrialExperimentIdentifiers:(id)a3 rolloutIdentifiers:(id)a4;
- (id)deduplicateWithMaxSuggestions:(unint64_t)a3;
- (id)deduplicateWithSeedRecipients:(id)a3;
- (id)filterIDSReachable;
- (id)formatWithBundleIdsForGroupMatching:(id)a3;
- (id)formatWithSuggestion:(id)a3 bundleIdsForGroupMatching:(id)a4 checkForMessagesGroupIdentifier:(BOOL)a5;
- (id)mapRecipientsToContactsWithUnmapped:(BOOL)a3;
@end

@implementation _PSFTZKWSuggestionsTransformerFactory

- (_PSFTZKWSuggestionsTransformerFactory)init
{
  return [(_PSFTZKWSuggestionsTransformerFactory *)self initWithInteractionStore:0];
}

- (_PSFTZKWSuggestionsTransformerFactory)initWithInteractionStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PSFTZKWSuggestionsTransformerFactory;
  v6 = [(_PSFTZKWSuggestionsTransformerFactory *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interactionStore, a3);
    uint64_t v8 = +[_PSContactCache sharedInstance];
    contactCache = v7->_contactCache;
    v7->_contactCache = (_PSContactCache *)v8;
  }
  return v7;
}

- (id)formatWithSuggestion:(id)a3 bundleIdsForGroupMatching:(id)a4 checkForMessagesGroupIdentifier:(BOOL)a5
{
  BOOL v5 = a5;
  v91[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v91[0] = 0;
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = (id *)v91;
    goto LABEL_14;
  }
  if (!self->_interactionStore)
  {
    v14 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_PSFTZKWSuggestionsTransformerFactory formatWithSuggestion:bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:](v14);
    }

    id v90 = v8;
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = &v90;
    goto LABEL_14;
  }
  v10 = [v8 recipients];
  unint64_t v11 = [v10 count];

  if (v11 <= 1)
  {
    id v89 = v8;
    v12 = (void *)MEMORY[0x1E4F1C978];
    v13 = &v89;
LABEL_14:
    id v70 = [v12 arrayWithObjects:v13 count:1];
    goto LABEL_15;
  }
  v15 = [v8 conversationIdentifier];
  if ([v15 length])
  {
    v16 = [v8 groupName];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      if (!v5
        || ([v8 messagesGroupIdentifier],
            v18 = objc_claimAutoreleasedReturnValue(),
            uint64_t v19 = [v18 length],
            v18,
            v19))
      {
        id v88 = v8;
        v12 = (void *)MEMORY[0x1E4F1C978];
        v13 = &v88;
        goto LABEL_14;
      }
    }
  }
  else
  {
  }
  v21 = objc_opt_new();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = [v8 recipients];
  uint64_t v22 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v76;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v76 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        v27 = [v26 contact];
        if (v27)
        {
          v28 = [v26 contact];
          v29 = [v28 identifier];
        }
        else
        {
          v29 = [v26 handle];
        }

        if (!v29)
        {
          v34 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[_PSFTZKWSuggestionsTransformerFactory formatWithSuggestion:bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:]((uint64_t)v8, v34);
          }
          id v70 = (id)MEMORY[0x1E4F1CBF0];
          goto LABEL_54;
        }
        [v21 addObject:v29];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  v30 = [(_PSContactCache *)self->_contactCache getMeContact];
  v31 = [(_PSFTZKWSuggestionsTransformerFactory *)self interactionStore];
  obuint64_t j = v30;
  v32 = [v30 identifier];
  uint64_t v33 = +[_PSInteractionStoreUtils mostRecentInteractionWithExactMatchingIdentifiers:v21 store:v31 bundleIds:v9 meContactIdentifier:v32];

  v34 = v33;
  v35 = +[_PSLogging generalChannel];
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (v33)
  {
    v68 = v21;
    if (v36)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = v33;
      __int16 v82 = 2112;
      id v83 = v8;
      _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_DEFAULT, "Found group interaction mapping %@ for %@", buf, 0x16u);
    }

    uint64_t v37 = +[_PSInteractionStoreUtils conversationIdFromInteraction:v33 bundleIds:v9];
    v38 = [_PSSuggestion alloc];
    v39 = [v8 bundleID];
    v40 = [v34 groupName];
    v41 = [v8 recipients];
    v42 = [v8 reason];
    v43 = [v8 reasonType];
    v67 = (void *)v37;
    v44 = [(_PSSuggestion *)v38 initWithBundleID:v39 conversationIdentifier:v37 groupName:v40 recipients:v41 reason:v42 reasonType:v43];

    if (formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasOnceToken7 != -1) {
      dispatch_once(&formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasOnceToken7, &__block_literal_global_25);
    }
    id v45 = (id)formatWithSuggestion_bundleIdsForGroupMatching_checkForMessagesGroupIdentifier___pasExprOnceResult;
    uint64_t v46 = [v34 bundleId];
    if (v46)
    {
      v47 = (void *)v46;
      v48 = [v34 bundleId];
      int v49 = [v45 containsObject:v48];

      if (v49)
      {
        v50 = [v34 account];
        [(_PSSuggestion *)v44 setMessagesGroupIdentifier:v50];
      }
    }
    v79 = v44;
    id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];

LABEL_52:
    v21 = v68;
    v51 = v67;
    goto LABEL_53;
  }
  id v66 = v9;
  if (v36)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_DEFAULT, "Could not map group suggestion to group interaction. Flattening.", buf, 2u);
  }

  id v70 = (id)objc_opt_new();
  v51 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"handle" ascending:1];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v52 = [v8 recipients];
  v85 = v51;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
  v44 = [v52 sortedArrayUsingDescriptors:v53];

  uint64_t v54 = [(_PSSuggestion *)v44 countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    v67 = v51;
    v68 = v21;
    uint64_t v56 = *(void *)v72;
    do
    {
      v57 = v44;
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v72 != v56) {
          objc_enumerationMutation(v57);
        }
        uint64_t v59 = *(void *)(*((void *)&v71 + 1) + 8 * j);
        v60 = [_PSSuggestion alloc];
        v61 = [v8 bundleID];
        uint64_t v84 = v59;
        v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
        v63 = [v8 reason];
        v64 = [v8 reasonType];
        v65 = [(_PSSuggestion *)v60 initWithBundleID:v61 conversationIdentifier:0 groupName:0 recipients:v62 reason:v63 reasonType:v64];

        [v70 addObject:v65];
      }
      v44 = v57;
      uint64_t v55 = [(_PSSuggestion *)v57 countByEnumeratingWithState:&v71 objects:v86 count:16];
    }
    while (v55);
    v34 = 0;
    id v9 = v66;
    goto LABEL_52;
  }
  id v9 = v66;
LABEL_53:

LABEL_54:
LABEL_15:

  return v70;
}

- (id)formatWithBundleIdsForGroupMatching:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77___PSFTZKWSuggestionsTransformerFactory_formatWithBundleIdsForGroupMatching___block_invoke;
  v8[3] = &unk_1E5AE07B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = (void *)MEMORY[0x1A6243AD0](v8);

  return v6;
}

- (BOOL)isEligibleRecipient:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 handleType] == 2)
  {
    id v5 = +[_PSLogging generalChannel];
    BOOL v6 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v4 handle];
      int v13 = 138412546;
      v14 = v7;
      __int16 v15 = 1024;
      BOOL v16 = 1;
      _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "Recipient %@ is considered reachable and eligible for zkw suggestions %d", (uint8_t *)&v13, 0x12u);
    }
  }
  else
  {
    contactCache = self->_contactCache;
    id v9 = [v4 handle];
    unint64_t v10 = [(_PSContactCache *)contactCache getFaceTimeIDSStatusForHandle:v9 contactType:2];

    BOOL v6 = v10 < 2;
    id v5 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = [v4 handle];
      int v13 = 138412802;
      v14 = v11;
      __int16 v15 = 1024;
      BOOL v16 = v10 < 2;
      __int16 v17 = 2048;
      unint64_t v18 = v10;
      _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "Recipient %@ is considered reachable and eligible for zkw suggestions %d with IDS status %ld", (uint8_t *)&v13, 0x1Cu);
    }
  }

  return v6;
}

- (id)filterIDSReachable
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59___PSFTZKWSuggestionsTransformerFactory_filterIDSReachable__block_invoke;
  v4[3] = &unk_1E5AE07D8;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1A6243AD0](v4, a2);

  return v2;
}

+ (id)getCraftedIdentfierForSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 recipients];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    BOOL v6 = [v3 recipients];
    v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_29);

    id v8 = [v7 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
    id v9 = [v8 componentsJoinedByString:@"|"];
  }
  else
  {
    id v9 = &stru_1EF653EA8;
  }

  return v9;
}

- (id)deduplicateWithSeedRecipients:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithSeedRecipients___block_invoke;
  v7[3] = &unk_1E5AE07D8;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x1A6243AD0](v7);

  return v5;
}

- (id)deduplicateWithMaxSuggestions:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71___PSFTZKWSuggestionsTransformerFactory_deduplicateWithMaxSuggestions___block_invoke;
  v5[3] = &__block_descriptor_40_e26___NSArray_16__0__NSArray_8l;
  v5[4] = a3;
  id v3 = (void *)MEMORY[0x1A6243AD0](v5, a2);

  return v3;
}

- (id)mapRecipientsToContactsWithUnmapped:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77___PSFTZKWSuggestionsTransformerFactory_mapRecipientsToContactsWithUnmapped___block_invoke;
  v5[3] = &unk_1E5AE0890;
  v5[4] = self;
  BOOL v6 = a3;
  id v3 = (void *)MEMORY[0x1A6243AD0](v5, a2);

  return v3;
}

- (id)annotateWithTrialExperimentIdentifiers:(id)a3 rolloutIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99___PSFTZKWSuggestionsTransformerFactory_annotateWithTrialExperimentIdentifiers_rolloutIdentifiers___block_invoke;
  v11[3] = &unk_1E5AE07B0;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = (void *)MEMORY[0x1A6243AD0](v11);

  return v9;
}

+ (id)getResultsFromTransformers:(id)a3 suggestions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    if (getResultsFromTransformers_suggestions___pasOnceToken19 != -1) {
      dispatch_once(&getResultsFromTransformers_suggestions___pasOnceToken19, &__block_literal_global_50_0);
    }
    id v7 = (void *)getResultsFromTransformers_suggestions___pasExprOnceResult;
    uint64_t v14 = 0;
    __int16 v15 = &v14;
    uint64_t v16 = 0x3032000000;
    __int16 v17 = __Block_byref_object_copy__10;
    unint64_t v18 = __Block_byref_object_dispose__10;
    id v19 = v6;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80___PSFTZKWSuggestionsTransformerFactory_getResultsFromTransformers_suggestions___block_invoke_52;
    v11[3] = &unk_1E5AE08E0;
    id v12 = v5;
    id v13 = &v14;
    id v8 = v6;
    id v9 = v7;
    dispatch_sync(v9, v11);
    id v6 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v6;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStore, 0);

  objc_storeStrong((id *)&self->_contactCache, 0);
}

- (void)formatWithSuggestion:(os_log_t)log bundleIdsForGroupMatching:checkForMessagesGroupIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "_PSFTZKWSuggestionsTransformerFactory: cannot apply format transformation if initialized without interaction store.", v1, 2u);
}

- (void)formatWithSuggestion:(uint64_t)a1 bundleIdsForGroupMatching:(NSObject *)a2 checkForMessagesGroupIdentifier:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Group suggestion %@ has recipient without any identifier. Proceeding to filter out entire suggestion", (uint8_t *)&v2, 0xCu);
}

@end