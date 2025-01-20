@interface PPContactStore
- (BOOL)iterContactNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)iterRankedContactsWithQuery:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)loadContactNameRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4;
- (PPContactStore)init;
- (id)_recordGenerator;
- (id)contactHandlesForSource:(id)a3 error:(id *)a4;
- (id)contactHandlesForTopics:(id)a3 error:(id *)a4;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4;
- (void)_loadContactNameRecordsWithDelegate:(id)a3;
- (void)_sendChangesToDelegates;
- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5;
- (void)registerFeedback:(id)a3 completion:(id)a4;
@end

@implementation PPContactStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
  objc_storeStrong((id *)&self->_monitoringHelper, 0);
}

- (BOOL)loadContactNameRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id location = 0;
  objc_initWeak(&location, self);
  monitoringHelper = self->_monitoringHelper;
  v7 = [(PPContactStore *)self _recordGenerator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke;
  v9[3] = &unk_1E550F488;
  objc_copyWeak(&v10, &location);
  LOBYTE(monitoringHelper) = [(PPRecordMonitoringHelper *)monitoringHelper loadRecordsAndMonitorChangesWithDelegate:v5 recordGenerator:v7 notificationRegistrationBlock:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return (char)monitoringHelper;
}

void __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2;
    v3[3] = &unk_1E550F488;
    objc_copyWeak(&v4, v1);
    +[PPNotificationManager addContactsObserverForLifetimeOfObject:WeakRetained block:v3];
    objc_destroyWeak(&v4);
  }
}

void __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((void *)WeakRetained + 1);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3;
    v4[3] = &unk_1E550F7E0;
    v4[4] = v2;
    [v3 handleChangeNotificationWithName:@"Contacts" afterDelaySeconds:v4 handler:0.0];
  }
}

uint64_t __76__PPContactStore_loadContactNameRecordsAndMonitorChangesWithDelegate_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendChangesToDelegates];
}

- (void)_loadContactNameRecordsWithDelegate:(id)a3
{
  monitoringHelper = self->_monitoringHelper;
  id v5 = a3;
  id v6 = [(PPContactStore *)self _recordGenerator];
  [(PPRecordMonitoringHelper *)monitoringHelper loadRecordsWithDelegate:v5 recordGenerator:v6];
}

- (void)_sendChangesToDelegates
{
  monitoringHelper = self->_monitoringHelper;
  id v3 = [(PPContactStore *)self _recordGenerator];
  [(PPRecordMonitoringHelper *)monitoringHelper sendChangesToDelegatesWithChangeGenerator:&__block_literal_global_25 recordGenerator:v3];
}

id __41__PPContactStore__sendChangesToDelegates__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3145;
  v18 = __Block_byref_object_dispose__3146;
  id v19 = 0;
  id v5 = +[PPContactClient sharedInstance];
  id v6 = [v4 name];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__PPContactStore__sendChangesToDelegates__block_invoke_26;
  v12[3] = &unk_1E550E898;
  v12[4] = &v14;
  id v13 = 0;
  [v5 contactNameRecordChangesForClient:v6 error:&v13 handleBatch:v12];
  id v7 = v13;

  if ([(id)v15[5] changesTruncated])
  {
    v8 = pp_contacts_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_DEFAULT, "delegate %@ had contact changes truncated, must reset", buf, 0xCu);
    }

    if (a3) {
      *a3 = 1;
    }
  }
  if (v7)
  {
    v9 = pp_contacts_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_error_impl(&dword_18CAA6000, v9, OS_LOG_TYPE_ERROR, "contactNameRecordChangesForClient returned error: %@", buf, 0xCu);
    }
  }
  id v10 = [(id)v15[5] changes];

  _Block_object_dispose(&v14, 8);
  return v10;
}

void __41__PPContactStore__sendChangesToDelegates__block_invoke_26(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    id v7 = pp_contacts_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "contactNameRecordChangesForClient sent an empty batch", v8, 2u);
    }
  }
}

- (id)_recordGenerator
{
  return &__block_literal_global_3152;
}

id __34__PPContactStore__recordGenerator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_opt_new();
  uint64_t v4 = +[PPContactClient sharedInstance];
  uint64_t v5 = [v2 name];
  id v15 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __34__PPContactStore__recordGenerator__block_invoke_2;
  id v13 = &unk_1E550E8E0;
  id v6 = v3;
  id v14 = v6;
  [v4 contactNameRecordsForClient:v5 error:&v15 handleBatch:&v10];
  id v7 = v15;

  if (v7)
  {
    v8 = pp_contacts_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v2;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_error_impl(&dword_18CAA6000, v8, OS_LOG_TYPE_ERROR, "error during contactNameRecordsForClient for delegate %@: %@", buf, 0x16u);
    }
  }
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_21, v10, v11, v12, v13);

  return v6;
}

uint64_t __34__PPContactStore__recordGenerator__block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (!*a3) {
    return [*(id *)(result + 32) addObjectsFromArray:a2];
  }
  return result;
}

int64_t __34__PPContactStore__recordGenerator__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 score];
  double v6 = v5;
  [v4 score];
  double v8 = v7;

  return +[PPUtils reverseCompareDouble:v6 withDouble:v8];
}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[PPContactClient sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __104__PPContactStore_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke;
  v12[3] = &unk_1E550E4F0;
  id v13 = v7;
  id v11 = v7;
  [v10 feedbackDisambiguationResultWithChoicesIdentifiers:v9 chosenContactIdentifier:v8 completion:v12];
}

void __104__PPContactStore_feedbackDisambiguationResultWithChoicesIdentifiers_chosenContactIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = pp_contacts_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl(&dword_18CAA6000, v4, OS_LOG_TYPE_ERROR, "Error from feedbackDisambiguationResultWithChoicesIdentifiers: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    id v4 = self->_clientFeedbackHelper;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 isMapped])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PPContactStore.m" lineNumber:131 description:@"You cannot send mapped feedback on named entities. Please use PPFeedback to create the feedback for named entities."];
  }
  id v9 = [(PPContactStore *)self clientIdentifier];
  uint64_t v10 = [v9 length];

  if (!v10)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    [v15 handleFailureInMethod:a2, self, @"PPContactStore.m", 132, @"The clientIdentifier property must be set on the %@ in order to send feedback.", v17 object file lineNumber description];
  }
  id v11 = [(PPContactStore *)self clientIdentifier];
  [v8 setClientIdentifier:v11];

  v12 = +[PPContactClient sharedInstance];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __46__PPContactStore_registerFeedback_completion___block_invoke;
  v18[3] = &unk_1E550F8A8;
  v18[4] = self;
  id v19 = v7;
  id v13 = v7;
  [v12 registerFeedback:v8 completion:v18];
}

void __46__PPContactStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  if (v5)
  {
    id v7 = pp_contacts_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_error_impl(&dword_18CAA6000, v7, OS_LOG_TYPE_ERROR, "Error from registerFeedback:completion: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (id)contactHandlesForSource:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = pp_contacts_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  int v9 = pp_contacts_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPContactStore.contactHandlesForSource", (const char *)&unk_18CB1211E, buf, 2u);
  }

  uint64_t v11 = +[PPContactClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__PPContactStore_contactHandlesForSource_error___block_invoke;
  v19[3] = &unk_1E550E8E0;
  id v20 = v6;
  id v12 = v6;
  int v13 = [v11 contactHandlesForSource:v5 error:a4 handleBatch:v19];

  id v14 = pp_contacts_signpost_handle();
  id v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPContactStore.contactHandlesForSource", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13) {
    uint64_t v16 = v12;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  return v17;
}

uint64_t __48__PPContactStore_contactHandlesForSource_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

- (id)contactHandlesForTopics:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = pp_contacts_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  int v9 = pp_contacts_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPContactStore.contactHandlesForTopics", (const char *)&unk_18CB1211E, buf, 2u);
  }

  uint64_t v11 = +[PPContactClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__PPContactStore_contactHandlesForTopics_error___block_invoke;
  v19[3] = &unk_1E550E8E0;
  id v20 = v6;
  id v12 = v6;
  int v13 = [v11 contactHandlesForTopics:v5 error:a4 handleBatch:v19];

  id v14 = pp_contacts_signpost_handle();
  id v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPContactStore.contactHandlesForTopics", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13) {
    uint64_t v16 = v12;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  return v17;
}

uint64_t __48__PPContactStore_contactHandlesForTopics_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

- (id)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = pp_contacts_signpost_handle();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  int v9 = pp_contacts_signpost_handle();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPContactStore.upcomingRelevantContactsForQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  uint64_t v11 = +[PPContactClient sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__PPContactStore_upcomingRelevantContactsForQuery_error___block_invoke;
  v19[3] = &unk_1E550E8E0;
  id v20 = v6;
  id v12 = v6;
  int v13 = [v11 upcomingRelevantContactsForQuery:v5 error:a4 handleBatch:v19];

  id v14 = pp_contacts_signpost_handle();
  id v15 = v14;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18CAA6000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPContactStore.upcomingRelevantContactsForQuery", (const char *)&unk_18CB1211E, buf, 2u);
  }

  if (v13) {
    uint64_t v16 = v12;
  }
  else {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  return v17;
}

uint64_t __57__PPContactStore_upcomingRelevantContactsForQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

- (BOOL)iterContactNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  int v9 = +[PPContactClient sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PPContactStore_iterContactNameRecordsForClient_error_block___block_invoke;
  v12[3] = &unk_1E550F880;
  id v13 = v7;
  id v10 = v7;
  LOBYTE(a4) = [v9 contactNameRecordsForClient:v8 error:a4 handleBatch:v12];

  return (char)a4;
}

void __62__PPContactStore_iterContactNameRecordsForClient_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)iterRankedContactsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = +[PPContactClient sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PPContactStore_iterRankedContactsWithQuery_error_block___block_invoke;
  v12[3] = &unk_1E550F880;
  id v13 = v7;
  id v10 = v7;
  LOBYTE(a4) = [v9 rankedContactsWithQuery:v8 error:a4 handleBatch:v12];

  return (char)a4;
}

void __58__PPContactStore_iterRankedContactsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!*a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (*a3) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (PPContactStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)PPContactStore;
  id v2 = [(PPContactStore *)&v8 init];
  if (v2)
  {
    id v3 = [[PPRecordMonitoringHelper alloc] initWithName:@"ContactStore"];
    monitoringHelper = v2->_monitoringHelper;
    v2->_monitoringHelper = v3;

    id v5 = [[PPClientFeedbackHelper alloc] initWithParentObject:v2];
    clientFeedbackHelper = v2->_clientFeedbackHelper;
    v2->_clientFeedbackHelper = v5;
  }
  return v2;
}

@end