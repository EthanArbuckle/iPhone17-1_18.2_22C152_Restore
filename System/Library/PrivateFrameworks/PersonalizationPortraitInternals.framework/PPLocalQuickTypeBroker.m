@interface PPLocalQuickTypeBroker
+ (id)sharedInstance;
- (PPLocalQuickTypeBroker)init;
- (id)_cacheEntryWithRecipients:(uint64_t)a1;
- (id)_recipientItemCacheKeyForRecipients:(void *)a1;
- (id)filterFeedback:(id)a3;
- (void)hibernateWithCompletion:(id)a3;
- (void)processFeedback:(id)a3;
- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8;
- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4;
- (void)registerFeedback:(id)a3 completion:(id)a4;
- (void)warmUpWithCompletion:(id)a3;
@end

@implementation PPLocalQuickTypeBroker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_urlServant, 0);
  objc_storeStrong((id *)&self->_connectionsServant, 0);
  objc_storeStrong((id *)&self->_eventsServant, 0);
  objc_storeStrong((id *)&self->_contactsServant, 0);
  objc_storeStrong((id *)&self->_navigationServant, 0);
}

- (id)filterFeedback:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1CB79D060]();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v7 = [v4 feedbackItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v33 + 1) + 8 * i) itemString];
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }

  cacheLock = self->_cacheLock;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke;
  v30[3] = &unk_1E65D7888;
  id v31 = v5;
  id v14 = v6;
  id v32 = v14;
  id v15 = v5;
  [(_PASLock *)cacheLock runWithLockAcquired:v30];
  v16 = [v4 feedbackItems];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_3;
  v28[3] = &unk_1E65D7900;
  id v29 = v14;
  id v17 = v14;
  v18 = objc_msgSend(v16, "_pas_mappedArrayWithTransform:", v28);

  v19 = [PPInternalFeedback alloc];
  v20 = [v4 timestamp];
  v21 = [v4 clientIdentifier];
  v22 = [v4 clientBundleId];
  v23 = [v4 mappingId];
  v24 = [v4 build];
  v25 = [(PPInternalFeedback *)v19 initWithFeedbackItems:v18 timestamp:v20 clientIdentifier:v21 clientBundleId:v22 mappingId:v23 storeType:7 build:v24];

  return v25;
}

void __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_2;
  v4[3] = &unk_1E65D78D8;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

id __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 itemString];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    id v6 = v3;
  }
  else {
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F89E30]), "initWithItemString:itemFeedbackType:", &stru_1F253DF18, objc_msgSend(v3, "itemFeedbackType"));
  }
  v7 = v6;

  return v7;
}

void __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a3 + 8);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      uint64_t v10 = *(void **)(a1 + 32);
      v11 = objc_msgSend(v9, "value", (void)v15);
      LODWORD(v10) = [v10 containsObject:v11];

      if (v10)
      {
        v12 = *(void **)(a1 + 40);
        v13 = [v9 value];
        [v12 addObject:v13];
      }
      uint64_t v14 = [*(id *)(a1 + 40) count];
      if (v14 == [*(id *)(a1 + 32) count]) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)processFeedback:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 feedbackItems];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v8 = objc_msgSend(v3, "feedbackItems", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v14 = [v13 itemString];
          uint64_t v15 = [v14 length];

          if (v15) {
            long long v16 = v6;
          }
          else {
            long long v16 = v7;
          }
          [v16 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }

    if ([v6 count])
    {
      id v17 = objc_alloc(MEMORY[0x1E4F89DA0]);
      long long v18 = [v3 timestamp];
      v19 = [v3 clientIdentifier];
      uint64_t v20 = [v3 clientBundleId];
      v21 = [v3 mappingId];
      v22 = (void *)[v17 initWithFeedbackItems:v6 timestamp:v18 clientIdentifier:v19 clientBundleId:v20 mappingId:v21];

      +[PPFeedbackStorage logFeedback:v22 domain:6 domainStatus:2 inBackground:1];
      v23 = [v22 feedbackItems];
      v24 = [v3 clientBundleId];
      v25 = [v3 clientIdentifier];
      +[PPFeedbackUtils recordUserEventsFromFeedback:v3 matchingFeedbackItems:v23 clientBundleId:v24 clientIdentifier:v25 domain:6];
    }
    if ([v7 count])
    {
      id v26 = objc_alloc(MEMORY[0x1E4F89DA0]);
      v27 = [v3 timestamp];
      v28 = [v3 clientIdentifier];
      id v29 = [v3 clientBundleId];
      v30 = [v3 mappingId];
      id v31 = (void *)[v26 initWithFeedbackItems:v7 timestamp:v27 clientIdentifier:v28 clientBundleId:v29 mappingId:v30];

      +[PPFeedbackStorage logFeedback:v31 domain:6 domainStatus:1 inBackground:1];
    }
  }
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138739971;
    id v14 = v6;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "QuickType feedback received: %{sensitive}@", (uint8_t *)&v13, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [(PPQuickTypeContactsServant *)self->_contactsServant registerFeedback:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [(PPQuickTypeEventsServant *)self->_eventsServant registerFeedback:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [(PPQuickTypeConnectionsServant *)self->_connectionsServant registerFeedback:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [(PPQuickTypeNavigationServant *)self->_navigationServant registerFeedback:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [(PPQuickTypeURLServant *)self->_urlServant registerFeedback:v6];
  }
  uint64_t v9 = +[PPInternalFeedback fromBaseFeedback:v6 storeType:7];
  uint64_t v10 = [(PPLocalQuickTypeBroker *)self filterFeedback:v9];

  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    [v11 storePendingFeedback:v10 storeType:7 error:0];
    if (v7) {
      v7[2](v7, 1, 0);
    }
  }
  else
  {
    v12 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "registerFeedback had no matches after filtering", (uint8_t *)&v13, 2u);
    }

    if (v7) {
      v7[2](v7, 1, 0);
    }
  }
}

- (void)hibernateWithCompletion:(id)a3
{
  id v3 = (void (**)(void))a3;
  id v4 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPLocalQuickTypeBroker: hibernate", v5, 2u);
  }

  if (v3) {
    v3[2](v3);
  }
}

- (void)warmUpWithCompletion:(id)a3
{
  id v3 = (void (**)(void))a3;
  id v4 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_INFO, "PPLocalQuickTypeBroker: warmUp", v5, 2u);
  }

  if (v3) {
    v3[2](v3);
  }
}

- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  if (self)
  {
    uint64_t v7 = -[PPLocalQuickTypeBroker _cacheEntryWithRecipients:]((uint64_t)self, a3);
    uint64_t v8 = (void *)v7;
    if (v7) {
      id v9 = *(id *)(v7 + 8);
    }
    else {
      id v9 = 0;
    }

    v6[2](v6, v9);
  }
  else
  {
    id v9 = 0;
    v6[2](v6, 0);
  }
}

- (id)_cacheEntryWithRecipients:(uint64_t)a1
{
  id v3 = a2;
  id v4 = -[PPLocalQuickTypeBroker _recipientItemCacheKeyForRecipients:](v3);
  uint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v12 = 0;
    int v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__11912;
    long long v16 = __Block_byref_object_dispose__11913;
    id v17 = 0;
    id v6 = *(void **)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__PPLocalQuickTypeBroker__cacheEntryWithRecipients___block_invoke;
    v9[3] = &unk_1E65D78B0;
    uint64_t v11 = &v12;
    id v10 = v5;
    [v6 runWithLockAcquired:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_recipientItemCacheKeyForRecipients:(void *)a1
{
  v1 = [a1 sortedArrayUsingSelector:sel_compare_];
  v2 = objc_msgSend(v1, "_pas_componentsJoinedByString:", @":");

  return v2;
}

void __52__PPLocalQuickTypeBroker__cacheEntryWithRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = [*(id *)(a2 + 16) objectForKeyedSubscript:v4];
    if (v5)
    {
      [*(id *)(a2 + 8) removeObject:v4];
      [*(id *)(a2 + 8) addObject:v4];
    }
    uint64_t v6 = [*(id *)(a2 + 8) count];
    if (v6 != [*(id *)(a2 + 16) count])
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel_entryWithKey_ object:a2 file:@"PPLocalQuickTypeBroker.m" lineNumber:65 description:@"PQT cache count mismatch"];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8
{
  uint64_t v14 = (void *)MEMORY[0x1E4F89EE8];
  id v15 = a8;
  id v16 = [v14 quickTypeQueryFromLMTokens:a3 localeIdentifier:a4 recipients:a5 bundleIdentifier:a6];
  [(PPLocalQuickTypeBroker *)self quickTypeItemsWithQuery:v16 limit:a7 completion:v15];
}

- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, PPLocalQuickTypeBroker *, void *))a5;
  id v10 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPQuickTypeBroker quickTypeItemsForQuery limit: %lu query: %@", buf, 0x16u);
  }

  uint64_t v11 = pp_quicktype_signpost_handle();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  int v13 = pp_quicktype_signpost_handle();
  uint64_t v14 = v13;
  unint64_t v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PPLocalQuickTypeBroker.quickTypeItemsWithQuery", "", buf, 2u);
  }

  id v16 = objc_opt_new();
  id v17 = v8;
  long long v18 = v17;
  if (!self)
  {
    id v28 = 0;
    goto LABEL_18;
  }
  v19 = [v17 recipients];
  uint64_t v20 = -[PPLocalQuickTypeBroker _cacheEntryWithRecipients:]((uint64_t)self, v19);

  if (!v20 || ![v18 isResultEquivelentToQuickTypeQuery:v20[2]]) {
    goto LABEL_16;
  }
  v21 = v20;
  id v22 = v18;
  int v23 = [v22 type];
  if (v23 == 2)
  {
    [v21[3] timeIntervalSinceNow];
    double v25 = v24;

    double v26 = -900.0;
    goto LABEL_15;
  }
  if (v23 == 4)
  {
    [v21[3] timeIntervalSinceNow];
    double v25 = v27;

    double v26 = -60.0;
LABEL_15:
    if (v25 <= v26) {
      goto LABEL_16;
    }
LABEL_63:
    id v28 = v21[1];
    goto LABEL_17;
  }
  if (v23 != 5)
  {

    goto LABEL_63;
  }

LABEL_16:
  id v28 = 0;
LABEL_17:

LABEL_18:
  id v29 = (PPLocalQuickTypeBroker *)[v28 mutableCopy];

  if (v29 && [(PPLocalQuickTypeBroker *)v29 count])
  {
    p_super = pp_quicktype_log_handle();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [(PPLocalQuickTypeBroker *)v29 count];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v31;
      _os_log_impl(&dword_1CA9A8000, p_super, OS_LOG_TYPE_DEFAULT, "PQT item cache hit with %tu items", buf, 0xCu);
    }
  }
  else
  {
    unint64_t v96 = v12 - 1;
    os_signpost_id_t v97 = v12;
    id v32 = v18;
    id v33 = v16;
    v94 = v33;
    v95 = v32;
    if (self)
    {
      long long v34 = v33;
      long long v35 = objc_opt_new();
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke;
      v110 = &unk_1E65D7838;
      id v36 = v32;
      id v111 = v36;
      unint64_t v114 = a4;
      id v112 = v34;
      id v93 = v35;
      id v37 = v35;
      id v113 = v37;
      v99 = (void (**)(void *, PPQuickTypeContactsServant *))_Block_copy(buf);
      switch([v36 type])
      {
        case 0u:
          os_signpost_id_t spid = (os_signpost_id_t)v16;
          uint64_t v38 = pp_quicktype_signpost_handle();
          os_signpost_id_t v39 = os_signpost_id_generate(v38);

          v40 = pp_quicktype_signpost_handle();
          v41 = v40;
          if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            *(_WORD *)v103 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "PPLocalQuickTypeBroker.quickTypeItems.semantic", "", v103, 2u);
          }
          os_signpost_id_t v90 = v39;

          v99[2](v99, self->_contactsServant);
          v99[2](v99, (PPQuickTypeContactsServant *)self->_connectionsServant);
          v42 = pp_quicktype_signpost_handle();
          v43 = v42;
          if (v39 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          {
            id v16 = (void *)spid;
            goto LABEL_65;
          }
          id v16 = (void *)spid;
          if (!os_signpost_enabled(v42)) {
            goto LABEL_65;
          }
          *(_WORD *)v103 = 0;
          v44 = "PPLocalQuickTypeBroker.quickTypeItems.semantic";
          v45 = v43;
          os_signpost_id_t v46 = v90;
          goto LABEL_61;
        case 1u:
          v47 = pp_quicktype_signpost_handle();
          os_signpost_id_t v48 = os_signpost_id_generate(v47);

          v49 = pp_quicktype_signpost_handle();
          v50 = v49;
          os_signpost_id_t spida = v48;
          unint64_t v51 = v48 - 1;
          if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
          {
            *(_WORD *)v103 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v50, OS_SIGNPOST_INTERVAL_BEGIN, spida, "PPLocalQuickTypeBroker.quickTypeItems.contacts", "", v103, 2u);
          }

          v99[2](v99, self->_contactsServant);
          v52 = pp_quicktype_signpost_handle();
          v43 = v52;
          if (v51 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52)) {
            goto LABEL_65;
          }
          *(_WORD *)v103 = 0;
          v44 = "PPLocalQuickTypeBroker.quickTypeItems.contacts";
          break;
        case 2u:
          v53 = pp_quicktype_signpost_handle();
          os_signpost_id_t v54 = os_signpost_id_generate(v53);

          v55 = pp_quicktype_signpost_handle();
          v56 = v55;
          os_signpost_id_t spida = v54;
          unint64_t v57 = v54 - 1;
          if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
          {
            *(_WORD *)v103 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v56, OS_SIGNPOST_INTERVAL_BEGIN, spida, "PPLocalQuickTypeBroker.quickTypeItems.events", "", v103, 2u);
          }

          v99[2](v99, (PPQuickTypeContactsServant *)self->_eventsServant);
          v58 = pp_quicktype_signpost_handle();
          v43 = v58;
          if (v57 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v58)) {
            goto LABEL_65;
          }
          *(_WORD *)v103 = 0;
          v44 = "PPLocalQuickTypeBroker.quickTypeItems.events";
          break;
        case 3u:
          v59 = pp_quicktype_signpost_handle();
          os_signpost_id_t v60 = os_signpost_id_generate(v59);

          v61 = pp_quicktype_signpost_handle();
          v62 = v61;
          os_signpost_id_t spida = v60;
          unint64_t v63 = v60 - 1;
          if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
          {
            *(_WORD *)v103 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v62, OS_SIGNPOST_INTERVAL_BEGIN, spida, "PPLocalQuickTypeBroker.quickTypeItems.connections", "", v103, 2u);
          }

          v99[2](v99, (PPQuickTypeContactsServant *)self->_connectionsServant);
          v64 = pp_quicktype_signpost_handle();
          v43 = v64;
          if (v63 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v64)) {
            goto LABEL_65;
          }
          *(_WORD *)v103 = 0;
          v44 = "PPLocalQuickTypeBroker.quickTypeItems.connections";
          break;
        case 4u:
          v65 = pp_quicktype_signpost_handle();
          os_signpost_id_t v66 = os_signpost_id_generate(v65);

          v67 = pp_quicktype_signpost_handle();
          v68 = v67;
          os_signpost_id_t spida = v66;
          unint64_t v69 = v66 - 1;
          if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
          {
            *(_WORD *)v103 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v68, OS_SIGNPOST_INTERVAL_BEGIN, spida, "PPLocalQuickTypeBroker.quickTypeItems.navigation", "", v103, 2u);
          }

          v99[2](v99, (PPQuickTypeContactsServant *)self->_navigationServant);
          v70 = pp_quicktype_signpost_handle();
          v43 = v70;
          if (v69 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v70)) {
            goto LABEL_65;
          }
          *(_WORD *)v103 = 0;
          v44 = "PPLocalQuickTypeBroker.quickTypeItems.navigation";
          break;
        case 5u:
          v71 = pp_quicktype_signpost_handle();
          os_signpost_id_t v72 = os_signpost_id_generate(v71);

          v73 = pp_quicktype_signpost_handle();
          v74 = v73;
          os_signpost_id_t spida = v72;
          unint64_t v75 = v72 - 1;
          if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
          {
            *(_WORD *)v103 = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v74, OS_SIGNPOST_INTERVAL_BEGIN, spida, "PPLocalQuickTypeBroker.quickTypeItems.url", "", v103, 2u);
          }

          v99[2](v99, (PPQuickTypeContactsServant *)self->_urlServant);
          v76 = pp_quicktype_signpost_handle();
          v43 = v76;
          if (v75 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v76)) {
            goto LABEL_65;
          }
          *(_WORD *)v103 = 0;
          v44 = "PPLocalQuickTypeBroker.quickTypeItems.url";
          break;
        default:
          goto LABEL_66;
      }
      v45 = v43;
      os_signpost_id_t v46 = spida;
LABEL_61:
      _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v45, OS_SIGNPOST_INTERVAL_END, v46, v44, "", v103, 2u);
LABEL_65:

LABEL_66:
      if ((unint64_t)[v37 count] >= 2)
      {
        [v37 sortUsingSelector:sel_reverseCompare_];
        v77 = objc_opt_new();
        v78 = objc_opt_new();
        *(void *)v103 = MEMORY[0x1E4F143A8];
        uint64_t v104 = 3221225472;
        v105 = __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_118;
        v106 = &unk_1E65D7860;
        id v107 = v77;
        id v108 = v78;
        id v79 = v78;
        id v80 = v77;
        [v37 enumerateObjectsUsingBlock:v103];
        [v37 removeObjectsAtIndexes:v79];
      }
      v81 = [v36 recipients];
      v82 = -[PPLocalQuickTypeBroker _recipientItemCacheKeyForRecipients:](v81);

      if (v82)
      {
        uint64_t v83 = objc_opt_new();
        objc_storeStrong((id *)(v83 + 16), a3);
        objc_storeStrong((id *)(v83 + 8), v93);
        uint64_t v84 = objc_opt_new();
        v85 = *(void **)(v83 + 24);
        *(void *)(v83 + 24) = v84;

        cacheLock = self->_cacheLock;
        v100[0] = MEMORY[0x1E4F143A8];
        v100[1] = 3221225472;
        v100[2] = __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_2;
        v100[3] = &unk_1E65D7888;
        id v101 = (id)v83;
        id v102 = v82;
        id v87 = (id)v83;
        [(_PASLock *)cacheLock runWithLockAcquired:v100];
      }
      self = (PPLocalQuickTypeBroker *)v37;
    }
    unint64_t v15 = v96;

    p_super = &v29->super;
    id v29 = self;
    os_signpost_id_t v12 = v97;
  }

  if ([(PPLocalQuickTypeBroker *)v29 count] > a4) {
    -[PPLocalQuickTypeBroker removeObjectsInRange:](v29, "removeObjectsInRange:", a4, [(PPLocalQuickTypeBroker *)v29 count] - a4);
  }
  v88 = pp_quicktype_signpost_handle();
  v89 = v88;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA9A8000, v89, OS_SIGNPOST_INTERVAL_END, v12, "PPLocalQuickTypeBroker.quickTypeItemsWithQuery", "", buf, 2u);
  }

  v9[2](v9, v29, v16);
}

void __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v5 = [v3 quickTypeItemsWithQuery:*(void *)(a1 + 32) limit:*(void *)(a1 + 56) explanationSet:*(void *)(a1 + 40)];
  if (v5)
  {
    uint64_t v6 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = v7;
      uint64_t v9 = [v5 count];
      uint64_t v10 = [*(id *)(a1 + 40) count];
      int v11 = 138412802;
      os_signpost_id_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "%@ returned %lu items and explanation set now has %lu explanations", (uint8_t *)&v11, 0x20u);
    }
    [*(id *)(a1 + 48) addObjectsFromArray:v5];
  }
}

void __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_118(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v10 = v5;
  uint64_t v7 = [v5 value];
  LODWORD(v6) = [v6 containsObject:v7];

  if (v6)
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v10 value];
    [v8 addObject:v9];
  }
}

uint64_t __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setEntry:*(void *)(a1 + 32) key:*(void *)(a1 + 40)];
}

- (PPLocalQuickTypeBroker)init
{
  id v3 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_DEBUG, "instantiating PPLocalQuickTypeBroker", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)PPLocalQuickTypeBroker;
  id v4 = [(PPLocalQuickTypeBroker *)&v20 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [v5 initWithGuardedData:v6];
    cacheLock = v4->_cacheLock;
    v4->_cacheLock = (_PASLock *)v7;

    uint64_t v9 = objc_opt_new();
    navigationServant = v4->_navigationServant;
    v4->_navigationServant = (PPQuickTypeNavigationServant *)v9;

    uint64_t v11 = objc_opt_new();
    contactsServant = v4->_contactsServant;
    v4->_contactsServant = (PPQuickTypeContactsServant *)v11;

    uint64_t v13 = objc_opt_new();
    eventsServant = v4->_eventsServant;
    v4->_eventsServant = (PPQuickTypeEventsServant *)v13;

    uint64_t v15 = objc_opt_new();
    connectionsServant = v4->_connectionsServant;
    v4->_connectionsServant = (PPQuickTypeConnectionsServant *)v15;

    uint64_t v17 = objc_opt_new();
    urlServant = v4->_urlServant;
    v4->_urlServant = (PPQuickTypeURLServant *)v17;

    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    double v24 = __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke;
    double v25 = &unk_1E65DBE30;
    double v26 = v4;
    [MEMORY[0x1E4F89EC0] addContactsObserverForLifetimeOfObject:v4 block:buf];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke_2;
    v21[3] = &unk_1E65DAC60;
    v21[4] = v4;
    [MEMORY[0x1E4F89EC0] addEventKitObserverForLifetimeOfObject:v4 block:v21];
  }
  return v4;
}

uint64_t __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(v1 + 48) runWithLockAcquired:&__block_literal_global_109_11968];
  }
  return result;
}

uint64_t __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(v1 + 48) runWithLockAcquired:&__block_literal_global_109_11968];
  }
  return result;
}

void __38__PPLocalQuickTypeBroker__clearCaches__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  id v3 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "PPLocalQuickTypeBroker: clearing caches", v8, 2u);
  }

  if (v2)
  {
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)v2[1];
    v2[1] = v4;

    uint64_t v6 = objc_opt_new();
    uint64_t v7 = (void *)v2[2];
    v2[2] = v6;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken5, &__block_literal_global_11972);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_11973;
  return v2;
}

void __40__PPLocalQuickTypeBroker_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_11973;
  sharedInstance__pasExprOnceResult_11973 = v1;
}

@end