@interface _REMInProgressSaveRequestsContainer
- (NSMutableArray)inProgressSaveRequests;
- (_REMInProgressSaveRequestsContainer)init;
- (id)_firstMatchInSaveRequests:(id)a3;
- (id)_latestSaveInProgressAccountForObjectID:(id)a3 saveRequest:(id)a4;
- (id)_latestSaveInProgressListForObjectID:(id)a3 fallbackAccount:(id)a4 fallbackParentList:(id)a5 saveRequest:(id)a6;
- (id)_latestSaveInProgressReminderForObjectID:(id)a3 fallbackAccount:(id)a4 fallbackList:(id)a5 fallbackParentList:(id)a6 fallbackParentReminder:(id)a7 saveRequest:(id)a8;
- (id)latestSaveInProgressAccount:(id)a3;
- (id)latestSaveInProgressList:(id)a3;
- (id)latestSaveInProgressReminder:(id)a3;
- (id)latestSaveInProgressReminderForReminderChangeItem:(id)a3;
- (void)saveRequestSaveDidFinish:(id)a3;
- (void)saveRequestSaveDidStart:(id)a3;
- (void)setInProgressSaveRequests:(id)a3;
@end

@implementation _REMInProgressSaveRequestsContainer

- (_REMInProgressSaveRequestsContainer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_REMInProgressSaveRequestsContainer;
  v2 = [(_REMInProgressSaveRequestsContainer *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    inProgressSaveRequests = v2->_inProgressSaveRequests;
    v2->_inProgressSaveRequests = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)saveRequestSaveDidStart:(id)a3
{
  id v4 = a3;
  v5 = [(_REMInProgressSaveRequestsContainer *)self inProgressSaveRequests];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v9 = +[REMLogStore write];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_REMInProgressSaveRequestsContainer saveRequestSaveDidStart:]();
    }
  }
  if (([v4 isSaved] & 1) == 0)
  {
    v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be TRUE", v10, 2u);
    }
  }
  v8 = [(_REMInProgressSaveRequestsContainer *)self inProgressSaveRequests];
  [v8 addObject:v4];
}

- (void)saveRequestSaveDidFinish:(id)a3
{
  id v4 = a3;
  v5 = [(_REMInProgressSaveRequestsContainer *)self inProgressSaveRequests];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[_REMInProgressSaveRequestsContainer saveRequestSaveDidFinish:]();
    }
  }
  else
  {
    v8 = [(_REMInProgressSaveRequestsContainer *)self inProgressSaveRequests];
    [v8 removeObjectAtIndex:v6];
  }
}

- (id)latestSaveInProgressAccount:(id)a3
{
  id v4 = [a3 objectID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67___REMInProgressSaveRequestsContainer_latestSaveInProgressAccount___block_invoke;
  v8[3] = &unk_1E61DD6C8;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(_REMInProgressSaveRequestsContainer *)self _firstMatchInSaveRequests:v8];

  return v6;
}

- (id)latestSaveInProgressList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  uint64_t v6 = [v4 account];
  v7 = [v4 parentList];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64___REMInProgressSaveRequestsContainer_latestSaveInProgressList___block_invoke;
  v13[3] = &unk_1E61DD6F0;
  v13[4] = self;
  id v14 = v5;
  id v15 = v6;
  id v16 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  v11 = [(_REMInProgressSaveRequestsContainer *)self _firstMatchInSaveRequests:v13];

  return v11;
}

- (id)latestSaveInProgressReminder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectID];
  uint64_t v6 = [v4 account];
  v7 = [v4 list];
  id v8 = [v7 parentList];
  id v9 = [v4 parentReminder];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68___REMInProgressSaveRequestsContainer_latestSaveInProgressReminder___block_invoke;
  v17[3] = &unk_1E61DD718;
  v17[4] = self;
  id v18 = v5;
  id v19 = v6;
  id v20 = v7;
  id v21 = v8;
  id v22 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  id v13 = v6;
  id v14 = v5;
  id v15 = [(_REMInProgressSaveRequestsContainer *)self _firstMatchInSaveRequests:v17];

  return v15;
}

- (id)latestSaveInProgressReminderForReminderChangeItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 saveRequest];
  char v6 = [v5 isSaved];

  if ((v6 & 1) == 0)
  {
    v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be TRUE", buf, 2u);
    }
  }
  id v8 = [v4 objectID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89___REMInProgressSaveRequestsContainer_latestSaveInProgressReminderForReminderChangeItem___block_invoke;
  v12[3] = &unk_1E61DD740;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(_REMInProgressSaveRequestsContainer *)self _firstMatchInSaveRequests:v12];

  return v10;
}

- (id)_latestSaveInProgressAccountForObjectID:(id)a3 saveRequest:(id)a4
{
  id v5 = a4;
  char v6 = [v5 _trackedAccountChangeItemForObjectID:a3];
  if (v6)
  {
    v7 = [REMAccount alloc];
    id v8 = [v5 store];
    id v9 = [v6 storage];
    id v10 = [(REMAccount *)v7 initWithStore:v8 storage:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_latestSaveInProgressListForObjectID:(id)a3 fallbackAccount:(id)a4 fallbackParentList:(id)a5 saveRequest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v13 _trackedListChangeItemForObjectID:v10];
  id v15 = v14;
  if (!v14)
  {
    v27 = 0;
    goto LABEL_21;
  }
  id v16 = [v14 accountID];
  uint64_t v17 = [(_REMInProgressSaveRequestsContainer *)self _latestSaveInProgressAccountForObjectID:v16 saveRequest:v13];
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (void *)v17;
  }
  else {
    id v19 = v11;
  }
  id v20 = v19;

  if (!v20)
  {
    v26 = +[REMLogStore write];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[_REMInProgressSaveRequestsContainer _latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:]();
    }
    goto LABEL_16;
  }
  id v21 = [v15 parentListID];

  if (!v21)
  {
    v26 = 0;
    goto LABEL_18;
  }
  id v22 = [v15 parentListID];
  uint64_t v23 = [(_REMInProgressSaveRequestsContainer *)self _latestSaveInProgressListForObjectID:v22 fallbackAccount:v20 fallbackParentList:0 saveRequest:v13];
  v24 = (void *)v23;
  if (v23) {
    v25 = (void *)v23;
  }
  else {
    v25 = v12;
  }
  v26 = v25;

  if (v26)
  {
LABEL_18:
    v28 = [REMList alloc];
    v29 = [v13 store];
    v30 = [v15 storage];
    v27 = [(REMList *)v28 initWithStore:v29 account:v20 storage:v30];

    if (v26) {
      [(REMList *)v27 setParentList:v26];
    }
    goto LABEL_20;
  }
  v26 = +[REMLogStore write];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[_REMInProgressSaveRequestsContainer _latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:]();
  }
LABEL_16:
  v27 = 0;
LABEL_20:

LABEL_21:

  return v27;
}

- (id)_latestSaveInProgressReminderForObjectID:(id)a3 fallbackAccount:(id)a4 fallbackList:(id)a5 fallbackParentList:(id)a6 fallbackParentReminder:(id)a7 saveRequest:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [v19 _trackedReminderChangeItemForObjectID:v14];
  id v21 = v20;
  if (!v20)
  {
    v31 = 0;
    goto LABEL_26;
  }
  id v22 = [v20 listID];

  if (v22)
  {
    id v43 = v18;
    uint64_t v23 = [v21 listID];
    uint64_t v24 = [(_REMInProgressSaveRequestsContainer *)self _latestSaveInProgressListForObjectID:v23 fallbackAccount:v15 fallbackParentList:v17 saveRequest:v19];
    v25 = (void *)v24;
    if (v24) {
      v26 = (void *)v24;
    }
    else {
      v26 = v16;
    }
    v27 = v26;

    if (v27)
    {
      v28 = [REMReminder alloc];
      v29 = [v19 store];
      v30 = [v21 storage];
      v31 = [(REMReminder *)v28 initWithStore:v29 list:v27 storage:v30];
    }
    else
    {
      v40 = +[REMLogStore write];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[_REMInProgressSaveRequestsContainer _latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:]();
      }

      v31 = 0;
    }
    id v18 = v43;
    goto LABEL_25;
  }
  v32 = [v21 parentReminderID];

  if (!v32)
  {
    v27 = +[REMLogStore write];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[_REMInProgressSaveRequestsContainer _latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:]((uint64_t)v14, v27);
    }
    goto LABEL_24;
  }
  v33 = [v21 parentReminderID];
  uint64_t v34 = [(_REMInProgressSaveRequestsContainer *)self _latestSaveInProgressReminderForObjectID:v33 fallbackAccount:v15 fallbackList:v16 fallbackParentList:v17 fallbackParentReminder:0 saveRequest:v19];
  v35 = (void *)v34;
  if (v34) {
    v36 = (void *)v34;
  }
  else {
    v36 = v18;
  }
  v27 = v36;

  if (!v27)
  {
    v41 = +[REMLogStore write];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[_REMInProgressSaveRequestsContainer _latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:]();
    }

LABEL_24:
    v31 = 0;
    goto LABEL_25;
  }
  v37 = [REMReminder alloc];
  [v19 store];
  v38 = id v44 = v18;
  v39 = [v21 storage];
  v31 = [(REMReminder *)v37 initWithStore:v38 storage:v39];

  id v18 = v44;
  [(REMReminder *)v31 setParentReminder:v27];
LABEL_25:

LABEL_26:

  return v31;
}

- (id)_firstMatchInSaveRequests:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(_REMInProgressSaveRequestsContainer *)self inProgressSaveRequests];
  char v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v11 isSaved] & 1) == 0)
        {
          id v12 = +[REMLogStore write];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v16 = 0;
            _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be TRUE", v16, 2u);
          }
        }
        uint64_t v13 = v4[2](v4, v11);
        if (v13)
        {
          id v14 = (void *)v13;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_15:

  return v14;
}

- (NSMutableArray)inProgressSaveRequests
{
  return self->_inProgressSaveRequests;
}

- (void)setInProgressSaveRequests:(id)a3
{
}

- (void)saveRequestSaveDidStart:.cold.1()
{
  OUTLINED_FUNCTION_6_1();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "inProgressSaveRequests");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_3(&dword_1B9AA2000, v3, v4, "rem_log_fault_if ([self.inProgressSaveRequests containsObject:saveRequest]) -- SaveRequest save already in progress {saveRequest: %@, inProgressSaveRequests: %@}", v5, v6, v7, v8, v9);
}

- (void)saveRequestSaveDidFinish:.cold.1()
{
  OUTLINED_FUNCTION_6_1();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "inProgressSaveRequests");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_3(&dword_1B9AA2000, v3, v4, "SaveRequest is not in progress. Ignoring. {saveRequest: %@, inProgressSaveRequests: %@}", v5, v6, v7, v8, v9);
}

- (void)_latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:.cold.1()
{
  OUTLINED_FUNCTION_6_1();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "accountID");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Failed to get account for inProgressList. Returning nil {listObjectID: %@, accountID: %@}", v5, v6, v7, v8, v9);
}

- (void)_latestSaveInProgressListForObjectID:fallbackAccount:fallbackParentList:saveRequest:.cold.2()
{
  OUTLINED_FUNCTION_6_1();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "parentListID");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Failed to get parentlist for inProgressList. Returning nil {listObjectID: %@, trackedListChangeItem.parentListID: %@", v5, v6, v7, v8, v9);
}

- (void)_latestSaveInProgressReminderForObjectID:(uint64_t)a1 fallbackAccount:(NSObject *)a2 fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "ReminderChangeItem missing both listID and parentReminderID. Returning nil {reminderObjectID: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)_latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:.cold.2()
{
  OUTLINED_FUNCTION_6_1();
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "parentReminderID");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Failed to get parent reminder for inProgressReminder. Returning nil {reminderObjectID: %@, parentReminderID: %@}", v5, v6, v7, v8, v9);
}

- (void)_latestSaveInProgressReminderForObjectID:fallbackAccount:fallbackList:fallbackParentList:fallbackParentReminder:saveRequest:.cold.3()
{
  OUTLINED_FUNCTION_6_1();
  int v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "listID");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "Failed to get list for inProgressReminder. Returning nil {reminderObjectID: %@, listID: %@}", v5, v6, v7, v8, v9);
}

@end