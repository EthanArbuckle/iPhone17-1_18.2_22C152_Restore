@interface PPLocalContactStore
+ (id)defaultStore;
- (BOOL)chineseBirthdayFound;
- (BOOL)iterContactNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5;
- (PPLocalContactStore)init;
- (PPLocalContactStore)initWithStorage:(id)a3 namedEntityStoreOverride:(id)a4;
- (double)similarityForNamedEntity:(id)a3 nameRecord:(id)a4;
- (id)_incompleteContactFromContactsRecord:(id)a3;
- (id)_scoredContactFromContactsRecord:(id)a3 score:(double)a4;
- (id)cachedSignificantContactHandles;
- (id)contactHandlesForSource:(id)a3 error:(id *)a4;
- (id)contactHandlesForTopics:(id)a3 error:(id *)a4;
- (id)contactNameRecordChangesForClient:(id)a3 error:(id *)a4;
- (id)contactsChangeHistoryForClient:(id)a3 error:(id *)a4;
- (id)contactsWithQuery:(id)a3 error:(id *)a4;
- (id)contactsWithQuery:(id)a3 explanationSet:(id)a4 timeoutSeconds:(id)a5 error:(id *)a6;
- (id)meCard;
- (id)rankedContactsWithQuery:(id)a3 error:(id *)a4;
- (id)resolveContactsForNamedEntities:(id)a3;
- (id)scoredContactsWithContacts:(id)a3;
- (id)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4;
- (void)clearChangeHistoryForClient:(id)a3 historyResult:(id)a4;
- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4;
- (void)rebuildCachedSignificantContactHandlesWithShouldContinue:(id)a3;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPLocalContactStore

- (id)cachedSignificantContactHandles
{
  return [(PPContactStorage *)self->_contactStorage cachedSignificantContactHandles];
}

+ (id)defaultStore
{
  pthread_mutex_lock(&defaultStore_lock);
  if (!defaultStore_instance)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance;
    defaultStore_instance = v2;

    if (!defaultStore_instance)
    {
      v4 = pp_contacts_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPLocalContactStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }
    }
  }
  id v5 = (id)defaultStore_instance;
  pthread_mutex_unlock(&defaultStore_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_contactStorage, 0);
}

- (BOOL)chineseBirthdayFound
{
  return [(PPContactStorage *)self->_contactStorage chineseBirthdayFound];
}

- (void)clearChangeHistoryForClient:(id)a3 historyResult:(id)a4
{
}

- (id)contactsChangeHistoryForClient:(id)a3 error:(id *)a4
{
  return [(PPContactStorage *)self->_contactStorage contactsChangeHistoryForClient:a3 error:a4];
}

- (void)rebuildCachedSignificantContactHandlesWithShouldContinue:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(void))a3;
  id v5 = +[PPPeopleSuggester sharedInstance];
  v6 = [v5 rankedContactIdentifiers];

  if (v4[2](v4))
  {
    v7 = +[PPConfiguration sharedInstance];
    unsigned int v8 = [v7 maxRelevantHighlightContacts];

    unint64_t v9 = [v6 count];
    if (v9 >= v8) {
      unint64_t v10 = v8;
    }
    else {
      unint64_t v10 = v9;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v12 = objc_msgSend(v6, "_pas_proxySubarrayWithRange:", 0, v10);
    v13 = [v11 initWithArray:v12];

    v14 = objc_opt_new();
    v15 = objc_opt_new();
    v16 = [v13 allObjects];
    [v15 setMatchingIdentifiers:v16];

    v17 = +[PPLocalContactStore defaultStore];
    id v62 = 0;
    uint64_t v18 = [v17 contactsWithQuery:v15 error:&v62];
    id v19 = v62;

    v46 = (void *)v18;
    if (!v18)
    {
      v20 = pp_social_highlights_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v19;
        _os_log_error_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_ERROR, "PPSocialHighlightRanker: unable to fetch contacts: %@", buf, 0xCu);
      }

      v46 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (v4[2](v4))
    {
      id v42 = v19;
      v43 = v15;
      v44 = v13;
      v41 = self;
      v45 = v6;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = v46;
      uint64_t v49 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v49)
      {
        uint64_t v48 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v59 != v48) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            v23 = [v22 emailAddresses];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v64 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v55;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v55 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  v28 = (void *)MEMORY[0x1E4F5B3B0];
                  v29 = [*(id *)(*((void *)&v54 + 1) + 8 * j) value];
                  v30 = [v28 normalizedStringFromContactString:v29];

                  [v14 addObject:v30];
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v54 objects:v64 count:16];
              }
              while (v25);
            }

            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            v31 = [v22 phoneNumbers];
            uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v63 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v51;
              do
              {
                for (uint64_t k = 0; k != v33; ++k)
                {
                  if (*(void *)v51 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  v36 = (void *)MEMORY[0x1E4F5B3B0];
                  v37 = [*(id *)(*((void *)&v50 + 1) + 8 * k) value];
                  v38 = [v36 normalizedStringFromContactString:v37];

                  [v14 addObject:v38];
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v63 count:16];
              }
              while (v33);
            }
          }
          uint64_t v49 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
        }
        while (v49);
      }

      if (v4[2](v4))
      {
        [(PPContactStorage *)v41->_contactStorage setCachedSignificantContactHandles:v14];
        v13 = v44;
        v6 = v45;
        v15 = v43;
        id v19 = v42;
LABEL_41:

        goto LABEL_42;
      }
      v39 = pp_contacts_log_handle();
      v13 = v44;
      v6 = v45;
      v15 = v43;
      id v19 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v40 = "PPLocalContactStore: stopped cache rebuild before serialization.";
        goto LABEL_39;
      }
    }
    else
    {
      v39 = pp_contacts_log_handle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v40 = "PPLocalContactStore: stopped cache rebuild after contact matching call.";
LABEL_39:
        _os_log_impl(&dword_1CA9A8000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, 2u);
      }
    }

    goto LABEL_41;
  }
  v13 = pp_contacts_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: stopped cache rebuild after people suggester call.", buf, 2u);
  }
LABEL_42:
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  v7 = pp_contacts_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138739971;
    id v11 = v5;
    _os_log_debug_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEBUG, "Contact feedback received: %{sensitive}@", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v8 = [v5 feedbackItems];
  uint64_t v9 = [v8 count];

  if (v9) {
    +[PPFeedbackStorage logFeedback:v5 domain:4 domainStatus:2 inBackground:0];
  }
  if (v6) {
    v6[2](v6, 1, 0);
  }
}

- (id)contactNameRecordChangesForClient:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  contactStorage = self->_contactStorage;
  id v22 = 0;
  unsigned int v8 = [(PPContactStorage *)contactStorage contactsChangeHistoryForClient:v6 error:&v22];
  id v9 = v22;
  if (v8)
  {
    char v21 = 0;
    int v10 = self->_contactStorage;
    id v20 = 0;
    id v11 = [(PPContactStorage *)v10 contactNameRecordsWithHistoryResult:v8 truncated:&v21 error:&v20];
    id v12 = v20;
    v13 = v12;
    if (v21)
    {
      v14 = pp_contacts_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "Contacts change history truncated", buf, 2u);
      }

      [(PPContactStorage *)self->_contactStorage clearChangeHistoryForClient:v6 historyResult:v8];
      v15 = [MEMORY[0x1E4F89DE0] contactNameRecordChangeResultWithChanges:0 changesTruncated:1];
    }
    else if (v11)
    {
      +[PPContactScorer scoreContactNameRecords:v11];
      [(PPContactStorage *)self->_contactStorage clearChangeHistoryForClient:v6 historyResult:v8];
      v17 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_97);
      v15 = [MEMORY[0x1E4F89DE0] contactNameRecordChangeResultWithChanges:v17 changesTruncated:0];
    }
    else
    {
      if (a4) {
        *a4 = v12;
      }
      uint64_t v18 = pp_contacts_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v13;
        _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "contactNameRecordChangeResultWithChanges failed with error: %@", buf, 0xCu);
      }

      v15 = 0;
    }
  }
  else
  {
    v16 = pp_contacts_log_handle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "failed to load CN change history during changes call: %@", buf, 0xCu);
    }

    v15 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v15;
}

uint64_t __63__PPLocalContactStore_contactNameRecordChangesForClient_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clientCopy];
}

- (BOOL)iterContactNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  contactStorage = self->_contactStorage;
  id v23 = 0;
  id v11 = [(PPContactStorage *)contactStorage contactsChangeHistoryForClient:v8 error:&v23];
  id v12 = v23;
  if (!v11)
  {
    v13 = pp_contacts_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v12;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: failed to load CN change history during full name load: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v12;
    }
  }
  v14 = self->_contactStorage;
  id v22 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__PPLocalContactStore_iterContactNameRecordsForClient_error_block___block_invoke;
  v20[3] = &unk_1E65D53B8;
  id v15 = v9;
  id v21 = v15;
  BOOL v16 = [(PPContactStorage *)v14 iterAllNameRecordsFromAllSourcesWithError:&v22 block:v20];
  id v17 = v22;
  if (v16)
  {
    if (v11) {
      [(PPContactStorage *)self->_contactStorage clearChangeHistoryForClient:v8 historyResult:v11];
    }
  }
  else
  {
    uint64_t v18 = pp_contacts_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v17;
      _os_log_error_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_ERROR, "PPLocalContactStore: failed to load internal name records: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v17;
    }
  }

  return v16;
}

void __67__PPLocalContactStore_iterContactNameRecordsForClient_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a2;
  id v9 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v6, 0);

  +[PPContactScorer scoreContactNameRecords:v9];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v9 objectAtIndexedSubscript:0];
  (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v8, a3);
}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = pp_contacts_log_handle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    uint64_t v9 = [v5 count];
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: feedbackDisambiguationResultWithChoicesIdentifiers choice count: %tu chose: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)contactHandlesForSource:(id)a3 error:(id *)a4
{
  return -[PPContactStorage contactHandlesForSource:](self->_contactStorage, "contactHandlesForSource:", a3, a4);
}

- (id)contactHandlesForTopics:(id)a3 error:(id *)a4
{
  return -[PPContactStorage contactHandlesForTopics:](self->_contactStorage, "contactHandlesForTopics:", a3, a4);
}

- (id)scoredContactsWithContacts:(id)a3
{
  return +[PPContactScorer scoredContactsWithContacts:a3];
}

- (id)contactsWithQuery:(id)a3 explanationSet:(id)a4 timeoutSeconds:(id)a5 error:(id *)a6
{
  return [(PPContactStorage *)self->_contactStorage contactsWithQuery:a3 explanationSet:a4 timeoutSeconds:a5 error:a6];
}

- (id)contactsWithQuery:(id)a3 error:(id *)a4
{
  return [(PPContactStorage *)self->_contactStorage contactsWithQuery:a3 explanationSet:0 timeoutSeconds:0 error:a4];
}

- (id)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  int v8 = [v6 startDate];
  [v7 setFromDate:v8];

  uint64_t v9 = [v6 endDate];
  [v7 setToDate:v9];

  __int16 v10 = (void *)MEMORY[0x1CB79D060]([v7 setMatchCategory:1]);
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F2568D08, 0);
  [v7 setMatchingCategories:v11];

  uint64_t v12 = [v6 sourceBundleIds];
  [v7 setMatchingSourceBundleIds:v12];

  [v7 setLimit:50];
  v13 = [(PPLocalNamedEntityStore *)self->_namedEntityStore rankedNamedEntitiesWithQuery:v7 error:a4];
  v14 = v13;
  if (v13)
  {
    if ([v13 count])
    {
      id v15 = [(PPLocalContactStore *)self resolveContactsForNamedEntities:v14];
      BOOL v16 = objc_opt_new();
      id v17 = [v15 sortedArrayUsingComparator:&__block_literal_global_92];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __62__PPLocalContactStore_upcomingRelevantContactsForQuery_error___block_invoke_2;
      v24[3] = &unk_1E65D5390;
      id v25 = v16;
      id v18 = v16;
      id v19 = objc_msgSend(v17, "_pas_filteredArrayWithTest:", v24);

      id v20 = pp_contacts_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [v15 count];
        uint64_t v22 = [v19 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v27 = v21;
        __int16 v28 = 2048;
        uint64_t v29 = v22;
        _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_INFO, "PPLocalContactStore: resolved a total of %tu matches into %tu contacts.", buf, 0x16u);
      }
    }
    else
    {
      id v15 = pp_contacts_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: no named entities retrieved, returning no contacts.", buf, 2u);
      }
      id v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v15 = pp_contacts_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "PPLocalContactStore: unable to fetch named entities.", buf, 2u);
    }
    id v19 = 0;
  }

  return v19;
}

uint64_t __62__PPLocalContactStore_upcomingRelevantContactsForQuery_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 contact];
  id v6 = [v5 identifier];
  int v7 = [v4 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v3 contact];
    __int16 v10 = [v9 identifier];
    [v8 addObject:v10];
  }
  return v7 ^ 1u;
}

uint64_t __62__PPLocalContactStore_upcomingRelevantContactsForQuery_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 score];
  double v7 = v6;
  [v5 score];
  double v9 = v8;

  return [v4 reverseCompareDouble:v7 withDouble:v9];
}

- (id)resolveContactsForNamedEntities:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  contactStorage = self->_contactStorage;
  id v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PPLocalContactStore_resolveContactsForNamedEntities___block_invoke;
  v13[3] = &unk_1E65D5368;
  id v7 = v4;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  BOOL v16 = self;
  LOBYTE(contactStorage) = [(PPContactStorage *)contactStorage iterAllNameRecordsFromAllSourcesWithError:&v17 block:v13];
  id v9 = v17;
  if (contactStorage)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = pp_contacts_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v9;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "PPLocalContactStore: error iterating name records: %@", buf, 0xCu);
    }

    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

void __55__PPLocalContactStore_resolveContactsForNamedEntities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 source] == 1)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v37 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v37) {
      goto LABEL_20;
    }
    uint64_t v36 = *(void *)v40;
    while (1)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = a1;
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v39 + 1) + 8 * v4);
        uint64_t v38 = MEMORY[0x1CB79D060]();
        id v7 = [v3 firstName];
        id v8 = [v6 item];
        id v9 = [v8 name];
        uint64_t v10 = [v7 localizedCaseInsensitiveCompare:v9];

        id v11 = [v3 lastName];
        uint64_t v12 = [v6 item];
        v13 = [v12 name];
        uint64_t v14 = [v11 localizedCaseInsensitiveCompare:v13];

        id v15 = [v3 nickname];
        BOOL v16 = [v6 item];
        id v17 = [v16 name];
        uint64_t v18 = [v15 localizedCaseInsensitiveCompare:v17];

        if (!v10 || !v14 || !v18)
        {
          a1 = v5;
          id v23 = *(void **)(v5 + 40);
          id v24 = *(void **)(v5 + 48);
          [v6 score];
          goto LABEL_13;
        }
        id v19 = [v3 localizedFullName];
        uint64_t v20 = [v6 item];
        uint64_t v21 = [v20 name];
        int v22 = [v19 localizedCaseInsensitiveContainsString:v21];

        a1 = v5;
        if (v22)
        {
          id v23 = *(void **)(v5 + 40);
          id v24 = *(void **)(v5 + 48);
          [v6 score];
          double v26 = v25 * 0.9;
LABEL_13:
          uint64_t v27 = [v24 _scoredContactFromContactsRecord:v3 score:v26];
          [v23 addObject:v27];
          __int16 v28 = (void *)v38;
LABEL_14:

          goto LABEL_15;
        }
        [*(id *)(v5 + 48) similarityForNamedEntity:v6 nameRecord:v3];
        __int16 v28 = (void *)v38;
        if (v29 > 0.5)
        {
          double v30 = v29;
          v31 = *(void **)(a1 + 40);
          uint64_t v32 = *(void **)(a1 + 48);
          [v6 score];
          uint64_t v27 = [v32 _scoredContactFromContactsRecord:v3 score:v30 * 0.9 * v33];
          [v31 addObject:v27];
          goto LABEL_14;
        }
LABEL_15:
        ++v4;
      }
      while (v37 != v4);
      uint64_t v34 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v37 = v34;
      if (!v34)
      {
LABEL_20:

        break;
      }
    }
  }
}

- (id)_scoredContactFromContactsRecord:(id)a3 score:(double)a4
{
  double v6 = (objc_class *)MEMORY[0x1E4F89EF0];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = [(PPLocalContactStore *)self _incompleteContactFromContactsRecord:v7];

  uint64_t v10 = (void *)[v8 initWithContact:v9 scoredPhoneNumbers:MEMORY[0x1E4F1CBF0] scoredEmailAddresses:MEMORY[0x1E4F1CBF0] scoredSocialProfiles:MEMORY[0x1E4F1CBF0] scoredPostalAddresses:MEMORY[0x1E4F1CBF0] score:0 flags:a4];
  return v10;
}

- (id)_incompleteContactFromContactsRecord:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F89DD0];
  id v4 = a3;
  id v5 = [v3 alloc];
  double v6 = [v4 sourceIdentifier];
  id v7 = [v4 firstName];
  id v8 = [v4 middleName];
  id v9 = [v4 lastName];
  uint64_t v10 = [v4 nickname];
  id v11 = [v4 localizedFullName];

  uint64_t v12 = objc_msgSend(v5, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v6, 1, 0, v7, v8, v9, 0, v10, v11, 0, 0, 0, 0, 0, 0,
                  0,
                  0);

  return v12;
}

- (double)similarityForNamedEntity:(id)a3 nameRecord:(id)a4
{
  id v5 = a4;
  double v6 = [a3 item];
  id v7 = [v6 name];
  id v8 = [v7 localizedLowercaseString];
  uint64_t v9 = *MEMORY[0x1E4F1C4E0];
  uint64_t v10 = [v8 stringByApplyingTransform:*MEMORY[0x1E4F1C4E0] reverse:0];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = &stru_1F253DF18;
  }
  v13 = v12;

  id v14 = [NSString alloc];
  id v15 = [v5 firstName];
  BOOL v16 = [v5 lastName];

  id v17 = (void *)[v14 initWithFormat:@"%@ %@", v15, v16];
  uint64_t v18 = [v17 stringByApplyingTransform:v9 reverse:0];
  id v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (__CFString *)v18;
  }
  else {
    uint64_t v20 = &stru_1F253DF18;
  }
  uint64_t v21 = v20;

  [MEMORY[0x1E4F89FC8] jaroSimilarityForString:v13 other:v21];
  double v23 = v22;

  return v23;
}

- (id)rankedContactsWithQuery:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 hasNoConstraints])
  {
    a4 = +[PPContactScorer mostRelevantContactsWithStore:self];
  }
  else if ([v6 onlyQueryMostRelevantContacts])
  {
    id v7 = [v6 matchingName];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      uint64_t v9 = [v6 matchingName];
      a4 = +[PPContactScorer mostRelevantContactsWithName:v9 store:self];
    }
    else
    {
      if (a4)
      {
        id v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F89FD0];
        uint64_t v20 = *MEMORY[0x1E4F89FD8];
        v21[0] = @"PPLocalContactStore rankedContactsWithQuery passed PPContactQuery with onlyQueryMostRelevantContacts and an unsupported matching property";
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        *a4 = [v11 errorWithDomain:v12 code:8 userInfo:v13];
      }
      id v14 = pp_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v18 = 138412290;
        id v19 = @"PPLocalContactStore rankedContactsWithQuery passed PPContactQuery with onlyQueryMostRelevantContacts and an unsupported matching property";
        _os_log_fault_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v18, 0xCu);
      }

      a4 = 0;
    }
  }
  else
  {
    uint64_t v10 = [(PPLocalContactStore *)self contactsWithQuery:v6 error:a4];
    if (v10)
    {
      a4 = +[PPContactScorer scoredContactsWithContacts:v10];
    }
    else if (a4)
    {
      id v15 = pp_contacts_log_handle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v17 = (__CFString *)*a4;
        int v18 = 138412290;
        id v19 = v17;
        _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, "rankedContactsWithQuery: %@", (uint8_t *)&v18, 0xCu);
      }

      a4 = 0;
    }
  }
  return a4;
}

- (id)meCard
{
  return [(PPContactStorage *)self->_contactStorage meCard];
}

- (PPLocalContactStore)init
{
  id v3 = +[PPSQLDatabase sharedInstance];
  if (v3)
  {
    id v4 = [[PPContactStorage alloc] initWithDatabase:v3 foundInAppsHarvestStoreGetter:&__block_literal_global_3652];
    id v5 = [[PPNamedEntityStorage alloc] initWithDatabase:v3];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F93B68]) initWithResult:self];
    id v7 = [PPLocalNamedEntityStore alloc];
    uint64_t v8 = +[PPTrialWrapper sharedInstance];
    uint64_t v9 = [(PPLocalNamedEntityStore *)v7 initWithStorage:v5 topicStoreForNamedEntityMapping:0 lazyContactStoreForMapsFeedback:v6 trialWrapper:v8];

    if (v4)
    {
      self = [(PPLocalContactStore *)self initWithStorage:v4 namedEntityStoreOverride:v9];
      uint64_t v10 = self;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __27__PPLocalContactStore_init__block_invoke()
{
  return [MEMORY[0x1E4F5DF80] defaultHarvestStore];
}

- (PPLocalContactStore)initWithStorage:(id)a3 namedEntityStoreOverride:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPLocalContactStore;
  uint64_t v9 = [(PPLocalContactStore *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStorage, a3);
    objc_storeStrong((id *)&v10->_namedEntityStore, a4);
  }

  return v10;
}

@end