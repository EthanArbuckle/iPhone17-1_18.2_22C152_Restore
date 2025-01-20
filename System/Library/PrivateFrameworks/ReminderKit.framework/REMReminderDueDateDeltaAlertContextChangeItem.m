@interface REMReminderDueDateDeltaAlertContextChangeItem
- (REMReminderChangeItem)reminderChangeItem;
- (REMReminderDueDateDeltaAlertContextChangeItem)initWithReminderChangeItem:(id)a3;
- (id)addDueDateDeltaAlertWithDueDateDelta:(id)a3;
- (id)addDueDateDeltaAlertWithDueDateDelta:(id)a3 identifier:(id)a4 creationDate:(id)a5;
- (id)addDueDateDeltaAlertWithDueDateDeltaAlert:(id)a3;
- (id)updateDueDateDeltaAlert:(id)a3;
- (void)_addOrUpdateDueDateDeltaAlert:(id)a3;
- (void)clearPendingDueDateDeltaAlertUpserts;
- (void)removeAllFetchedDueDateDeltaAlerts;
- (void)removeDueDateDeltaAlertsWithIdentifiers:(id)a3;
- (void)setReminderChangeItem:(id)a3;
@end

@implementation REMReminderDueDateDeltaAlertContextChangeItem

- (REMReminderDueDateDeltaAlertContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5 = a3;
  if (!v5) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "reminderChangeItem");
  }
  v9.receiver = self;
  v9.super_class = (Class)REMReminderDueDateDeltaAlertContextChangeItem;
  v6 = [(REMReminderDueDateDeltaAlertContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);
  }

  return v7;
}

- (id)addDueDateDeltaAlertWithDueDateDelta:(id)a3 identifier:(id)a4 creationDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F29128] UUID];
    if (v11) {
      goto LABEL_3;
    }
  }
  v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "rem_now");
LABEL_3:
  v12 = [REMDueDateDeltaAlert alloc];
  v13 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  v14 = [v13 objectID];
  v15 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  v16 = [v15 accountID];
  v17 = [(REMDueDateDeltaAlert *)v12 initWithIdentifier:v9 reminderID:v14 accountID:v16 dueDateDelta:v8 creationDate:v11 acknowledgedDate:0 minimumSupportedAppVersion:0];

  [(REMReminderDueDateDeltaAlertContextChangeItem *)self _addOrUpdateDueDateDeltaAlert:v17];

  return v17;
}

- (id)addDueDateDeltaAlertWithDueDateDelta:(id)a3
{
  return [(REMReminderDueDateDeltaAlertContextChangeItem *)self addDueDateDeltaAlertWithDueDateDelta:a3 identifier:0 creationDate:0];
}

- (id)updateDueDateDeltaAlert:(id)a3
{
  id v4 = a3;
  id v5 = [[REMDueDateDeltaAlertChangeItem alloc] initWithReminderDueDateDeltaAlertContextChangeItem:self dueDateDeltaAlert:v4];

  return v5;
}

- (void)removeDueDateDeltaAlertsWithIdentifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[REMLogStore write];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      __int16 v28 = 2112;
      id v29 = v4;
      _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Removing dueDateDeltaAlerts {reminderChangeItem: %@, identifiers: %@}", buf, 0x16u);
    }
    v7 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    id v8 = [v7 storage];
    id v9 = [v8 dueDateDeltaAlertIdentifiersToDelete];
    id v10 = (id)[v9 mutableCopy];

    if (!v10) {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    v11 = [v4 allObjects];
    [v10 addObjectsFromArray:v11];

    v12 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    v13 = [v12 storage];
    [v13 setDueDateDeltaAlertIdentifiersToDelete:v10];

    v14 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    v15 = [v14 storage];
    v16 = [v15 fetchedDueDateDeltaAlerts];
    v17 = (void *)MEMORY[0x1E4F28F60];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89__REMReminderDueDateDeltaAlertContextChangeItem_removeDueDateDeltaAlertsWithIdentifiers___block_invoke;
    v24[3] = &unk_1E61DC190;
    id v25 = v4;
    v18 = [v17 predicateWithBlock:v24];
    v19 = [v16 filteredArrayUsingPredicate:v18];

    v20 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    v21 = [v20 storage];
    [v21 setFetchedDueDateDeltaAlerts:v19];

    v22 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    v23 = [v22 changedKeysObserver];
    [v23 keyDidChange:@"dueDateDeltaAlertsData"];
  }
}

uint64_t __89__REMReminderDueDateDeltaAlertContextChangeItem_removeDueDateDeltaAlertsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v5 = REMDynamicCast(v4, (uint64_t)v3);

  v6 = *(void **)(a1 + 32);
  v7 = [v5 identifier];
  uint64_t v8 = [v6 containsObject:v7] ^ 1;

  return v8;
}

- (void)_addOrUpdateDueDateDeltaAlert:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    int v17 = 138412546;
    v18 = v6;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Adding dueDateDeltaAlert {reminderChangeItem: %@, dueDateDeltaAlert: %@}", (uint8_t *)&v17, 0x16u);
  }
  v7 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  uint64_t v8 = [v7 storage];
  id v9 = [v8 dueDateDeltaAlertsToUpsert];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v10 addObject:v4];
  v11 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  v12 = [v11 storage];
  [v12 setDueDateDeltaAlertsToUpsert:v10];

  v13 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  v14 = [v13 storage];
  [v14 setFetchedDueDateDeltaAlerts:v10];

  v15 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  v16 = [v15 changedKeysObserver];
  [v16 keyDidChange:@"dueDateDeltaAlertsData"];
}

- (void)clearPendingDueDateDeltaAlertUpserts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    id v5 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
    v6 = [v5 storage];
    v7 = [v6 dueDateDeltaAlertsToUpsert];
    int v12 = 138412546;
    v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = [v7 count];
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_INFO, "Clearing dueDateDeltaAlertsToUpsert {reminderChangeItem: %@, dueDateDeltaAlertsToUpsertCount: %lu}", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v8 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  id v9 = [v8 storage];
  [v9 setDueDateDeltaAlertsToUpsert:0];

  id v10 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  v11 = [v10 changedKeysObserver];
  [v11 keyDidChange:@"dueDateDeltaAlertsData"];
}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)addDueDateDeltaAlertWithDueDateDeltaAlert:(id)a3
{
  id v4 = a3;
  uint64_t v16 = [REMDueDateDeltaAlert alloc];
  uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  v6 = [v5 objectID];
  v7 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  uint64_t v8 = [v7 accountID];
  id v9 = [v4 dueDateDelta];
  id v10 = [v4 creationDate];
  v11 = [v4 acknowledgedDate];
  uint64_t v12 = [v4 minimumSupportedAppVersion];

  v13 = [(REMDueDateDeltaAlert *)v16 initWithIdentifier:v15 reminderID:v6 accountID:v8 dueDateDelta:v9 creationDate:v10 acknowledgedDate:v11 minimumSupportedAppVersion:v12];
  [(REMReminderDueDateDeltaAlertContextChangeItem *)self _addOrUpdateDueDateDeltaAlert:v13];

  return v13;
}

- (void)removeAllFetchedDueDateDeltaAlerts
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(REMReminderDueDateDeltaAlertContextChangeItem *)self reminderChangeItem];
  id v5 = [v4 storage];
  v6 = [v5 fetchedDueDateDeltaAlerts];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v10) identifier];
        [v3 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(REMReminderDueDateDeltaAlertContextChangeItem *)self removeDueDateDeltaAlertsWithIdentifiers:v3];
}

@end