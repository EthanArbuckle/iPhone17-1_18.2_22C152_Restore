@interface REMSaveRequest
- (BOOL)_changeItemsAreAllEmpty;
- (BOOL)applyCRDTsWithoutMerging;
- (BOOL)cloneCompletedRecurrentRemindersAtSave;
- (BOOL)isSaved;
- (BOOL)saveIsNoopIfNoChangedKeys;
- (BOOL)saveSynchronouslyWithError:(id *)a3;
- (BOOL)syncToCloudKit;
- (BOOL)updateLastModifiedDates;
- (BOOL)updateReminderChangeItem:(id)a3 fromICSData:(id)a4 isNew:(BOOL)a5 withOptions:(id)a6 error:(id *)a7;
- (NSMutableDictionary)trackedAccountCapabilities;
- (NSMutableDictionary)trackedAccountChangeItems;
- (NSMutableDictionary)trackedListChangeItems;
- (NSMutableDictionary)trackedListSectionChangeItems;
- (NSMutableDictionary)trackedReminderChangeItems;
- (NSMutableDictionary)trackedSmartListChangeItems;
- (NSMutableDictionary)trackedSmartListSectionChangeItems;
- (NSMutableDictionary)trackedTemplateChangeItems;
- (NSMutableDictionary)trackedTemplateSectionChangeItems;
- (NSMutableSet)saveRequestChangeEvents;
- (NSString)author;
- (REMReplicaManagerProviding)replicaManagerProvider;
- (REMSaveRequest)initWithStore:(id)a3;
- (REMSaveRequestNotifyChangeDelegate)notifyChangeDelegate;
- (REMStore)store;
- (id)__addAccountWithType:(int64_t)a3 name:(id)a4;
- (id)__addAccountWithType:(int64_t)a3 name:(id)a4 accountObjectID:(id)a5;
- (id)_addCalDavAccountWithName:(id)a3;
- (id)_addCalDavAccountWithName:(id)a3 accountObjectID:(id)a4;
- (id)_addExchangeAccountWithName:(id)a3;
- (id)_addExchangeAccountWithName:(id)a3 accountObjectID:(id)a4;
- (id)_addLocalAccountWithName:(id)a3;
- (id)_addLocalAccountWithName:(id)a3 accountObjectID:(id)a4;
- (id)_addTestOnlyExtraPrimaryCKAccountWithName:(id)a3;
- (id)_addTestOnlyExtraPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4;
- (id)_addTestOnlyLocalInternalAccountWithName:(id)a3;
- (id)_addTestOnlyLocalInternalAccountWithName:(id)a3 accountObjectID:(id)a4;
- (id)_addTestOnlyNonPrimaryCKAccountWithName:(id)a3;
- (id)_addTestOnlyNonPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4;
- (id)_addTestOnlyPrimaryCKAccountWithName:(id)a3;
- (id)_addTestOnlyPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4;
- (id)_copyReminder:(id)a3 toListChangeItem:(id)a4;
- (id)_copyReminder:(id)a3 toReminderSubtaskContextChangeItem:(id)a4;
- (id)_copyReminderChangeItem:(id)a3 toListChangeItem:(id)a4;
- (id)_copyReminderChangeItem:(id)a3 toReminderSubtaskContextChangeItem:(id)a4;
- (id)_iCalendarDataFromICSTodoItem:(id)a3 icsCalendar:(id)a4;
- (id)_trackedAccountCapabilitiesForObjectID:(id)a3;
- (id)_trackedAccountChangeItemForObjectID:(id)a3;
- (id)_trackedListChangeItemForObjectID:(id)a3;
- (id)_trackedListSectionChangeItemForObjectID:(id)a3;
- (id)_trackedReminderChangeItemForObjectID:(id)a3;
- (id)_trackedSmartListChangeItemForObjectID:(id)a3;
- (id)_trackedSmartListSectionChangeItemForObjectID:(id)a3;
- (id)_trackedTemplateChangeItemForObjectID:(id)a3;
- (id)_trackedTemplateSectionChangeItemForObjectID:(id)a3;
- (id)_updateAccountWithListChangeItem:(id)a3;
- (id)_updateListStorage:(id)a3 accountCapabilities:(id)a4;
- (id)_updateListWithReminderChangeItem:(id)a3;
- (id)addCustomSmartListWithName:(id)a3 toAccountChangeItem:(id)a4 smartListObjectID:(id)a5;
- (id)addCustomSmartListWithName:(id)a3 toListSublistContextChangeItem:(id)a4 smartListObjectID:(id)a5;
- (id)addGroupWithName:(id)a3 toAccountGroupContextChangeItem:(id)a4;
- (id)addGroupWithName:(id)a3 toAccountGroupContextChangeItem:(id)a4 groupObjectID:(id)a5;
- (id)addListSectionWithDisplayName:(id)a3 toListSectionContextChangeItem:(id)a4;
- (id)addListSectionWithDisplayName:(id)a3 toListSectionContextChangeItem:(id)a4 listSectionObjectID:(id)a5;
- (id)addListUsingPublicTemplateWithREMListRepresentation:(id)a3 toAccountChangeItem:(id)a4;
- (id)addListUsingTemplate:(id)a3 toAccountChangeItem:(id)a4;
- (id)addListWithName:(id)a3 toAccountChangeItem:(id)a4;
- (id)addListWithName:(id)a3 toAccountChangeItem:(id)a4 listObjectID:(id)a5;
- (id)addListWithName:(id)a3 toListSublistContextChangeItem:(id)a4;
- (id)addListWithName:(id)a3 toListSublistContextChangeItem:(id)a4 listObjectID:(id)a5;
- (id)addReminderWithTitle:(id)a3 toListChangeItem:(id)a4;
- (id)addReminderWithTitle:(id)a3 toListChangeItem:(id)a4 reminderObjectID:(id)a5;
- (id)addReminderWithTitle:(id)a3 toReminderSubtaskContextChangeItem:(id)a4;
- (id)addReminderWithTitle:(id)a3 toReminderSubtaskContextChangeItem:(id)a4 reminderObjectID:(id)a5;
- (id)addSmartListSectionWithDisplayName:(id)a3 toSmartListSectionContextChangeItem:(id)a4;
- (id)addSmartListSectionWithDisplayName:(id)a3 toSmartListSectionContextChangeItem:(id)a4 smartListSectionObjectID:(id)a5;
- (id)addTemplateSectionWithDisplayName:(id)a3 toTemplateSectionContextChangeItem:(id)a4;
- (id)addTemplateSectionWithDisplayName:(id)a3 toTemplateSectionContextChangeItem:(id)a4 templateSectionObjectID:(id)a5;
- (id)addTemplateWithName:(id)a3 configuration:(id)a4 toAccountChangeItem:(id)a5;
- (id)addTemplateWithName:(id)a3 configuration:(id)a4 toAccountChangeItem:(id)a5 templateObjectID:(id)a6;
- (id)advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks;
- (id)advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks;
- (id)advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:(id)a3;
- (id)description;
- (id)icsDueOrEndDateWithICSCalendarItem:(id)a3 options:(id)a4;
- (id)importRemindersFromICSData:(id)a3 insertIntoListChangeItem:(id)a4 error:(id *)a5;
- (id)updateAccount:(id)a3;
- (id)updateList:(id)a3;
- (id)updateListSection:(id)a3;
- (id)updateReminder:(id)a3;
- (id)updateSmartList:(id)a3;
- (id)updateSmartListSection:(id)a3;
- (id)updateTemplate:(id)a3;
- (id)updateTemplateSection:(id)a3;
- (void)_addAlarmsToReminderChangeItem:(id)a3 withICSAlarm:(id)a4 icsCalendar:(id)a5;
- (void)_populateAlarmsInReminderChangeItem:(id)a3 withICSAlarms:(id)a4 icsCalendar:(id)a5;
- (void)_populateRecurrencesInReminderChangeItem:(id)a3 withICSComponent:(id)a4 icsCalendar:(id)a5;
- (void)_populateReminderChangeItem:(id)a3 withICSTodoItem:(id)a4 icsCalendar:(id)a5 isNew:(BOOL)a6 withOptions:(id)a7;
- (void)_prepareSave:(id)a3;
- (void)_trackAccountCapabilities:(id)a3 forObjectID:(id)a4;
- (void)_trackAccountChangeItem:(id)a3;
- (void)_trackListChangeItem:(id)a3;
- (void)_trackListSectionChangeItem:(id)a3;
- (void)_trackReminderChangeItem:(id)a3;
- (void)_trackSmartListChangeItem:(id)a3;
- (void)_trackSmartListSectionChangeItem:(id)a3;
- (void)_trackTemplateChangeItem:(id)a3;
- (void)_trackTemplateSectionChangeItem:(id)a3;
- (void)_updateResolutionTokenMapForChangeItem:(id)a3;
- (void)_updateTrackedAccountChangeItem:(id)a3 withObjectID:(id)a4;
- (void)_updateTrackedListChangeItem:(id)a3 withObjectID:(id)a4;
- (void)_updateTrackedReminderChangeItem:(id)a3 withObjectID:(id)a4;
- (void)_updateTrackedSmartListChangeItem:(id)a3 withObjectID:(id)a4;
- (void)_willSaveAccountChangeItems:(id)a3 listChangeItems:(id)a4 listSectionChangeItems:(id)a5 smartListChangeItems:(id)a6 smartListSectionChangeItems:(id)a7 templateChangeItems:(id)a8 templateSectionChangeItems:(id)a9 reminderChangeItems:(id)a10;
- (void)advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks;
- (void)notifyChangeDelegateForSaveSuccess:(BOOL)a3;
- (void)performPreSaveActions;
- (void)preFetchDueDateDeltaAlertsForCompletedRecurrenceClone;
- (void)preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:(id)a3;
- (void)saveWithQueue:(id)a3 completion:(id)a4;
- (void)setApplyCRDTsWithoutMerging:(BOOL)a3;
- (void)setAuthor:(id)a3;
- (void)setCloneCompletedRecurrentRemindersAtSave:(BOOL)a3;
- (void)setNotifyChangeDelegate:(id)a3;
- (void)setReplicaManagerProvider:(id)a3;
- (void)setSaveIsNoopIfNoChangedKeys:(BOOL)a3;
- (void)setSaveRequestChangeEvents:(id)a3;
- (void)setSaved:(BOOL)a3;
- (void)setSyncToCloudKit:(BOOL)a3;
- (void)setUpdateLastModifiedDates:(BOOL)a3;
- (void)updateReminderChangeItem:(id)a3 fromICSTodo:(id)a4 icsCalendar:(id)a5 isNew:(BOOL)a6 withOptions:(id)a7;
- (void)updateUIDInReminderChangeItem:(id)a3 fromICSComponent:(id)a4 icsCalendar:(id)a5;
@end

@implementation REMSaveRequest

- (id)importRemindersFromICSData:(id)a3 insertIntoListChangeItem:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = &off_1E61DB000;
  v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [v9 objectID];
    *(_DWORD *)buf = 138412290;
    v50 = v13;
    _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_INFO, "Importing ICS data into list change item {%@}.", buf, 0xCu);
  }
  id v48 = 0;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithData:v8 options:0 error:&v48];
  id v15 = v48;
  if (v15 || !v14)
  {
    v34 = +[REMLogStore write];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[REMSaveRequest(Importing) importRemindersFromICSData:insertIntoListChangeItem:error:]((uint64_t)v15, v34);
    }

    if (a5) {
      *a5 = v15;
    }
  }
  else
  {
    v16 = [v9 saveRequest];
    if ([v16 updateLastModifiedDates]) {
      [v16 setUpdateLastModifiedDates:0];
    }
    id v37 = v8;
    v17 = v16;
    if ([v16 cloneCompletedRecurrentRemindersAtSave]) {
      [v16 setCloneCompletedRecurrentRemindersAtSave:0];
    }
    v36 = v14;
    [v14 calendar];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v43 = long long v47 = 0u;
    id obj = [v43 componentKeys];
    uint64_t v42 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v45;
      v38 = v16;
      v39 = v10;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v45 != v41) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v20 = [v43 componentForKey:v19];
          if (!v20)
          {
            v21 = [v11[258] write];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v19;
              _os_log_impl(&dword_1B9AA2000, v21, OS_LOG_TYPE_INFO, "Could not find a component with {key: %@}.", buf, 0xCu);
            }
          }
          uint64_t v22 = objc_opt_class();
          v23 = REMDynamicCast(v22, (uint64_t)v20);
          v24 = v23;
          if (v23)
          {
            v25 = objc_msgSend(v23, "rem_nonNilSummary");
            v26 = [v17 addReminderWithTitle:v25 toListChangeItem:v9];

            [(REMSaveRequest *)self _populateReminderChangeItem:v26 withICSTodoItem:v24 icsCalendar:v43 isNew:1 withOptions:0];
            v27 = [(REMSaveRequest *)self _iCalendarDataFromICSTodoItem:v24 icsCalendar:v43];
            [v26 setImportedICSData:v27];

            [v10 addObject:v26];
            v28 = [v11[258] write];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = [v26 objectID];
              [v9 objectID];
              v30 = v11;
              v31 = self;
              v33 = id v32 = v9;
              *(_DWORD *)buf = 138412546;
              v50 = v29;
              __int16 v51 = 2112;
              v52 = v33;
              _os_log_impl(&dword_1B9AA2000, v28, OS_LOG_TYPE_INFO, "Added ICSTodo as reminder change item into list change item {reminder: %@, list: %@}.", buf, 0x16u);

              id v9 = v32;
              self = v31;
              v11 = v30;
              v17 = v38;

              v10 = v39;
            }
          }
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v42);
    }

    v14 = v36;
    id v8 = v37;
    id v15 = 0;
  }

  return v10;
}

- (void)updateReminderChangeItem:(id)a3 fromICSTodo:(id)a4 icsCalendar:(id)a5 isNew:(BOOL)a6 withOptions:(id)a7
{
  BOOL v7 = a6;
  id v17 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v14 saveRequest];
  if ([v15 updateLastModifiedDates]) {
    [v15 setUpdateLastModifiedDates:0];
  }
  if ([v15 cloneCompletedRecurrentRemindersAtSave]) {
    [v15 setCloneCompletedRecurrentRemindersAtSave:0];
  }
  [(REMSaveRequest *)self _populateReminderChangeItem:v14 withICSTodoItem:v13 icsCalendar:v12 isNew:v7 withOptions:v17];
  v16 = [(REMSaveRequest *)self _iCalendarDataFromICSTodoItem:v13 icsCalendar:v12];

  [v14 setImportedICSData:v16];
}

- (BOOL)updateReminderChangeItem:(id)a3 fromICSData:(id)a4 isNew:(BOOL)a5 withOptions:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v42 = 0;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithData:v13 options:0 error:&v42];
  id v16 = v42;
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v15 == 0;
  }
  if (v17)
  {
    v18 = +[REMLogStore write];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[REMSaveRequest(Importing) importRemindersFromICSData:insertIntoListChangeItem:error:]((uint64_t)v16, v18);
    }

    BOOL v19 = 0;
    if (a7) {
      *a7 = v16;
    }
  }
  else
  {
    v36 = self;
    BOOL v37 = v9;
    v20 = [v15 calendar];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v21 = [v20 componentKeys];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      id v33 = v16;
      v34 = v15;
      id v35 = v12;
      uint64_t v24 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          v27 = [v20 componentForKey:v26];
          if (!v27)
          {
            v28 = +[REMLogStore write];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v44 = v26;
              _os_log_impl(&dword_1B9AA2000, v28, OS_LOG_TYPE_INFO, "Could not find a component with {key: %@}.", buf, 0xCu);
            }
          }
          uint64_t v29 = objc_opt_class();
          uint64_t v30 = REMDynamicCast(v29, (uint64_t)v27);
          if (v30)
          {
            v31 = (void *)v30;
            id v12 = v35;
            [(REMSaveRequest *)v36 updateReminderChangeItem:v35 fromICSTodo:v30 icsCalendar:v20 isNew:v37 withOptions:v14];

            BOOL v19 = 1;
            goto LABEL_24;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v45 count:16];
        if (v23) {
          continue;
        }
        break;
      }
      BOOL v19 = 0;
      id v12 = v35;
LABEL_24:
      id v16 = v33;
      id v15 = v34;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  return v19;
}

- (void)updateUIDInReminderChangeItem:(id)a3 fromICSComponent:(id)a4 icsCalendar:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(v8, "recurrence_id");

  if (v10)
  {
    v11 = objc_msgSend(v8, "recurrence_id");
    v10 = objc_msgSend(v11, "rem_dateWithICSCalendar:", v9);
  }
  id v12 = [v8 uid];
  if (v10)
  {
    [v10 timeIntervalSinceReferenceDate];
    if (fabs(v13) >= 2.22044605e-16)
    {
      id v14 = [v8 uid];
      uint64_t v15 = REMGetRecurrenceUIDFromRealUID(v14, v10);

      id v12 = (void *)v15;
    }
  }
  if (v12)
  {
    id v16 = +[REMLogStore write];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      BOOL v17 = [v7 objectID];
      int v18 = 138412546;
      BOOL v19 = v17;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_INFO, "Setting ICS item UID to reminder change item {%@, uid: %@}.", (uint8_t *)&v18, 0x16u);
    }
    [v7 setDaCalendarItemUniqueIdentifier:v12];
  }
}

- (id)_iCalendarDataFromICSTodoItem:(id)a3 icsCalendar:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB7F00]);
  if (v7)
  {
    objc_msgSend(v7, "setX_calendarserver_access:", objc_msgSend(v6, "x_calendarserver_access"));
    v11[0] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v7 setComponents:v8 options:2];

    id v9 = _iCalendarDataFromICSCalendar(v7, 1);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_populateReminderChangeItem:(id)a3 withICSTodoItem:(id)a4 icsCalendar:(id)a5 isNew:(BOOL)a6 withOptions:(id)a7
{
  BOOL v59 = a6;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = objc_msgSend(v12, "rem_nonNilSummary");
  [v11 setTitleAsString:v15];

  id v16 = [v12 description];

  if (v16)
  {
    BOOL v17 = [v12 description];
    [v11 setNotesAsString:v17];
  }
  int v18 = objc_msgSend(v12, "last_modified");
  if (!v18)
  {
    int v18 = [v12 dtstamp];
  }
  v62 = v18;
  BOOL v19 = objc_msgSend(v18, "rem_dateAsUTC");
  [v11 setLastModifiedDate:v19];

  __int16 v20 = [v12 created];
  uint64_t v21 = objc_msgSend(v20, "rem_dateAsUTC");

  [v11 setCreationDate:v21];
  objc_msgSend(v11, "setPriority:", objc_msgSend(v12, "priority"));
  uint64_t v22 = [(REMSaveRequest *)self icsDueOrEndDateWithICSCalendarItem:v12 options:v14];
  v64 = v22;
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = [v22 components];
    [v11 setDueDateComponents:v24];

    v25 = [v13 systemTimeZoneForDate:v23];
    uint64_t v26 = [v11 dueDateComponents];
    [v26 setTimeZone:v25];
  }
  else
  {
    [v11 setDueDateComponents:0];
  }
  id v60 = v14;
  v61 = (void *)v21;
  v63 = v13;
  [(REMSaveRequest *)self updateUIDInReminderChangeItem:v11 fromICSComponent:v12 icsCalendar:v13];
  v27 = [v12 url];

  if (v27)
  {
    v28 = [v12 url];
    [v11 setIcsUrl:v28];
  }
  uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v30 = [v12 components];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v66 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v29 addObject:v35];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v32);
  }

  [(REMSaveRequest *)self _populateAlarmsInReminderChangeItem:v11 withICSAlarms:v29 icsCalendar:v63];
  [(REMSaveRequest *)self _populateRecurrencesInReminderChangeItem:v11 withICSComponent:v12 icsCalendar:v63];
  v36 = [v12 completed];
  BOOL v37 = objc_msgSend(v36, "rem_dateAsUTC");

  if (!v37)
  {
    if ([v12 percentComplete] == 100 || objc_msgSend(v12, "status") == 4)
    {
      if (v64) {
        objc_msgSend(v64, "rem_dateWithICSCalendar:", v63);
      }
      else {
      BOOL v37 = [MEMORY[0x1E4F1C9C8] date];
      }
    }
    else
    {
      BOOL v37 = 0;
    }
  }
  [v11 setCompleted:v37 != 0];
  [v11 setCompletionDate:v37];
  long long v38 = objc_msgSend(v12, "x_apple_activity");
  uint64_t v39 = [v38 count];

  if (v39)
  {
    uint64_t v40 = objc_opt_class();
    long long v41 = objc_msgSend(v12, "x_apple_activity");
    id v42 = [v41 firstObject];
    v43 = REMCheckedDynamicCast(v40, (uint64_t)v42);

    uint64_t v44 = objc_opt_class();
    long long v45 = [v43 value];
    uint64_t v46 = REMCheckedDynamicCast(v44, (uint64_t)v45);

    if (v46)
    {
      long long v47 = [[REMUserActivity alloc] initWithUniversalLink:v46];
      [v11 setUserActivity:v47];
    }
  }
  id v48 = objc_msgSend(v12, "x_apple_appLinkData");

  if (v48)
  {
    v49 = [REMUserActivity alloc];
    v50 = objc_msgSend(v12, "x_apple_appLinkData");
    __int16 v51 = [(REMUserActivity *)v49 initWithUserActivityData:v50];
    [v11 setUserActivity:v51];
  }
  uint64_t v52 = objc_msgSend(v12, "x_apple_sort_order");
  if (!v52 && !v61)
  {
    v53 = +[REMLogStore write];
    uint64_t v54 = v60;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[REMSaveRequest(Importing) _populateReminderChangeItem:withICSTodoItem:icsCalendar:isNew:withOptions:](v12, v53);
    }

    v55 = [MEMORY[0x1E4F1C9C8] date];
    [v55 timeIntervalSinceReferenceDate];
    [v11 setIcsDisplayOrder:(unint64_t)v56];
    goto LABEL_40;
  }
  [v11 setIcsDisplayOrder:v52];
  uint64_t v54 = v60;
  if (v59)
  {
    v55 = [v11 listChangeItem];
    [v55 setRemindersICSDisplayOrderChanged:1];
LABEL_40:
  }
  v57 = objc_msgSend(v12, "x_apple_alternative_due_date_for_calendar");
  v58 = objc_msgSend(v57, "rem_dateAsUTC");

  [v11 setAlternativeDisplayDateDateForCalendarWithNormalizedDate:v58];
}

- (id)icsDueOrEndDateWithICSCalendarItem:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 due];

  if (!v7)
  {
    uint64_t v8 = objc_opt_class();
    id v9 = [v6 valueForKey:@"ImportOptionConsiderDTENDForDueDate"];
    v10 = REMDynamicCast(v8, (uint64_t)v9);

    if ([v10 unsignedIntegerValue] == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v11 = [v5 performSelector:sel_dtend];

      goto LABEL_7;
    }
  }
  id v11 = [v5 due];
LABEL_7:

  return v11;
}

- (void)_populateAlarmsInReminderChangeItem:(id)a3 withICSAlarms:(id)a4 icsCalendar:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 removeAllAlarms];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    uint64_t v26 = *(void *)v29;
    id v27 = v8;
    id v25 = v11;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (![v16 action])
        {
          BOOL v17 = [v16 trigger];
          if ([v17 isDurationBased])
          {
          }
          else
          {
            int v18 = [v16 trigger];
            [v18 value];
            id v19 = v10;
            v21 = __int16 v20 = self;
            [v21 components];
            v23 = uint64_t v22 = v13;
            char v24 = REMIsInvalidICSAlarmDateComponents(v23);

            uint64_t v13 = v22;
            self = v20;
            id v10 = v19;
            id v11 = v25;
            uint64_t v14 = v26;

            id v8 = v27;
            if (v24) {
              continue;
            }
          }
        }
        [(REMSaveRequest *)self _addAlarmsToReminderChangeItem:v8 withICSAlarm:v16 icsCalendar:v10];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);
  }
}

- (void)_addAlarmsToReminderChangeItem:(id)a3 withICSAlarm:(id)a4 icsCalendar:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [v8 uid];
  if (![v11 length])
  {
    uint64_t v12 = objc_msgSend(v8, "x_wr_alarmuid");

    id v11 = (void *)v12;
  }
  uint64_t v13 = +[REMLogStore write];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[REMSaveRequest(Importing) _addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:]((uint64_t)v11, v7, v13);
  }

  if (!v11)
  {
    id v11 = [MEMORY[0x1E4FB7F18] makeUID];
    uint64_t v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v7 objectID];
      *(_DWORD *)buf = 138412546;
      v101 = v11;
      __int16 v102 = 2112;
      v103 = v15;
      _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_INFO, "Imported ICS alarm has no UID, generating one {alarmUID: %@, reminderID: %@}.", buf, 0x16u);
    }
  }
  id v16 = [v8 trigger];
  int v17 = [v16 isDurationBased];
  v89 = v16;
  int v18 = [v16 value];
  if (v17)
  {
    id v19 = [REMAlarmTimeIntervalTrigger alloc];
    [v18 timeInterval];
    __int16 v20 = -[REMAlarmTimeIntervalTrigger initWithTimeInterval:](v19, "initWithTimeInterval:");
    uint64_t v21 = [v7 addAlarmWithTrigger:v20];
    [v21 setAlarmUID:v11];
    [v10 addObject:v21];
  }
  else
  {
    uint64_t v22 = v10;
    __int16 v20 = (REMAlarmTimeIntervalTrigger *)[objc_alloc(MEMORY[0x1E4FB7F28]) initWithValue:v18];
    uint64_t v21 = [(REMAlarmTimeIntervalTrigger *)v20 components];
    uint64_t v23 = [v9 systemTimeZoneForDate:v20];
    [v21 setTimeZone:v23];

    if ((REMIsInvalidICSAlarmDateComponents(v21) & 1) == 0)
    {
      char v24 = [[REMAlarmDateTrigger alloc] initWithDateComponents:v21];
      [v7 addAlarmWithTrigger:v24];
      uint64_t v26 = v25 = v11;
      [v26 setAlarmUID:v25];
      [v22 addObject:v26];

      id v11 = v25;
    }
    id v10 = v22;
  }

  id v27 = objc_msgSend(v8, "x_apple_proximity");
  if ([v27 isEqualToString:*MEMORY[0x1E4FB8328]])
  {
    uint64_t v28 = 1;
  }
  else if ([v27 isEqualToString:*MEMORY[0x1E4FB8338]])
  {
    uint64_t v28 = 2;
  }
  else
  {
    uint64_t v28 = 0;
  }

  long long v29 = objc_msgSend(v8, "x_apple_proximity");
  if ([v29 isEqualToString:*MEMORY[0x1E4FB8330]])
  {
    uint64_t v30 = 1;
  }
  else if ([v29 isEqualToString:*MEMORY[0x1E4FB8340]])
  {
    uint64_t v30 = 2;
  }
  else
  {
    uint64_t v30 = 0;
  }

  uint64_t v31 = objc_msgSend(v8, "x_apple_structured_location");
  uint64_t v87 = [v8 location];
  v88 = (void *)v31;
  if (v28 | v30 || v31 | v87)
  {
    if ((v28 | v30) != 0 && (v31 | v87) != 0)
    {
      if (![v10 count]) {
        goto LABEL_38;
      }
      uint64_t v32 = +[REMLogStore write];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = [v7 objectID];
        *(_DWORD *)buf = 138412546;
        v101 = v11;
        __int16 v102 = 2112;
        v103 = v33;
        _os_log_impl(&dword_1B9AA2000, v32, OS_LOG_TYPE_INFO, "Importing a Proximity/Location trigger when we have already imported a TimeInterval/Date trigger from the same ICSAlarm. So we found a concrete case that they co-exist. {alarmUID: %@, reminderID: %@}", buf, 0x16u);
      }
    }
    else
    {
      if (v31 | v87)
      {
        if (!(v28 | v30))
        {
          v34 = +[REMLogStore write];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[REMSaveRequest(Importing) _addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:]((uint64_t)v11, v7);
          }

          uint64_t v28 = 1;
          goto LABEL_39;
        }
LABEL_38:
        if (!v28)
        {
          if (v30) {
            uint64_t v30 = [[REMAlarmVehicleTrigger alloc] initWithEvent:v30];
          }
          goto LABEL_67;
        }
LABEL_39:
        id v83 = v7;
        id v35 = v8;
        v36 = objc_msgSend(v35, "x_apple_structured_location");
        BOOL v37 = [v35 location];

        if (v36)
        {
          id v85 = v9;
          v81 = v10;
          long long v38 = [REMStructuredLocation alloc];
          uint64_t v39 = [v36 title];
          uint64_t v40 = [(REMStructuredLocation *)v38 initWithTitle:v39];

          long long v41 = [v36 value];
          id v42 = [v41 scheme];
          v43 = [v42 lowercaseString];
          int v44 = [v43 isEqualToString:@"geo"];

          v82 = v41;
          if (v44)
          {
            long long v45 = [v41 absoluteString];
            uint64_t v46 = [v45 substringFromIndex:4];
            uint64_t v47 = [v46 rangeOfString:@";"];
            v79 = v37;
            if (v48)
            {
              uint64_t v49 = [v46 substringToIndex:v47];

              uint64_t v46 = (void *)v49;
            }
            id v9 = v85;
            v50 = v11;
            __int16 v51 = objc_msgSend(v46, "componentsSeparatedByString:", @",", v79);
            if ([v51 count] == 2)
            {
              uint64_t v52 = [v51 objectAtIndex:0];
              [v52 doubleValue];
              -[REMStructuredLocation setLatitude:](v40, "setLatitude:");

              v53 = [v51 objectAtIndex:1];
              [v53 doubleValue];
              -[REMStructuredLocation setLongitude:](v40, "setLongitude:");
            }
            else
            {
              v53 = +[REMLogStore write];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v101 = v46;
                _os_log_impl(&dword_1B9AA2000, v53, OS_LOG_TYPE_INFO, "Ignoring invalid coordinates when converting location from ICS: %@", buf, 0xCu);
              }
            }

            id v11 = v50;
            BOOL v37 = v80;
          }
          else
          {
            long long v45 = +[REMLogStore write];
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v101 = v41;
              _os_log_impl(&dword_1B9AA2000, v45, OS_LOG_TYPE_INFO, "Ignoring unexpected location URL scheme when converting location from ICS: %@.", buf, 0xCu);
            }
            id v9 = v85;
          }

          uint64_t v54 = [v36 parameterValueForName:@"X-APPLE-RADIUS"];
          if (!v54)
          {
            uint64_t v54 = [v36 parameterValueForName:@"X-Apple-Radius"];
          }
          [v54 doubleValue];
          -[REMStructuredLocation setRadius:](v40, "setRadius:");
          v55 = [v36 address];
          [(REMStructuredLocation *)v40 setAddress:v55];

          double v56 = [v36 routing];
          [(REMStructuredLocation *)v40 setRouting:v56];

          v57 = [v36 parameterValueForName:@"X-APPLE-REFERENCEFRAME"];
          if (v57) {
            [(REMStructuredLocation *)v40 setReferenceFrameString:v57];
          }
          v58 = [v36 parameterValueForName:@"X-APPLE-ABUID"];
          if (v58
            || ([v36 parameterValueForName:@"X-Apple-ABUID"],
                (v58 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            [(REMStructuredLocation *)v40 setContactLabel:v58];
          }
          BOOL v59 = [v36 mapKitHandle];
          if (v59) {
            [(REMStructuredLocation *)v40 setMapKitHandle:v59];
          }

          id v10 = v81;
        }
        else
        {
          if (!v37) {
            BOOL v37 = &stru_1F1339A18;
          }
          uint64_t v40 = [[REMStructuredLocation alloc] initWithTitle:v37];
        }

        uint64_t v30 = [[REMAlarmLocationTrigger alloc] initWithStructuredLocation:v40 proximity:v28];
        id v7 = v83;
LABEL_67:
        id v60 = [v7 addAlarmWithTrigger:v30];
        [v60 setAlarmUID:v11];
        [v10 addObject:v60];

        goto LABEL_68;
      }
      uint64_t v32 = +[REMLogStore write];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[REMSaveRequest(Importing) _addAlarmsToReminderChangeItem:withICSAlarm:icsCalendar:]((uint64_t)v11, v7);
      }
    }

    goto LABEL_38;
  }
LABEL_68:
  v61 = [v8 acknowledged];

  if (v61)
  {
    v62 = [v8 acknowledged];
    v63 = (void *)[objc_alloc(MEMORY[0x1E4FB7F28]) initWithValue:v62];
    v64 = objc_msgSend(v63, "rem_dateWithICSCalendar:", v9);
  }
  else
  {
    v64 = 0;
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v65 = v10;
  uint64_t v66 = [v65 countByEnumeratingWithState:&v94 objects:v99 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v67; ++i)
      {
        if (*(void *)v95 != v68) {
          objc_enumerationMutation(v65);
        }
        [*(id *)(*((void *)&v94 + 1) + 8 * i) setAcknowledgedDate:v64];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v94 objects:v99 count:16];
    }
    while (v67);
  }

  uint64_t v70 = [v8 relatedTo];

  if (v70)
  {
    v84 = v11;
    id v86 = v9;
    id v71 = v7;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v72 = v65;
    uint64_t v73 = [v72 countByEnumeratingWithState:&v90 objects:v98 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v74; ++j)
        {
          if (*(void *)v91 != v75) {
            objc_enumerationMutation(v72);
          }
          v77 = *(void **)(*((void *)&v90 + 1) + 8 * j);
          v78 = [v8 relatedTo];
          [v77 setOriginalAlarmUID:v78];
        }
        uint64_t v74 = [v72 countByEnumeratingWithState:&v90 objects:v98 count:16];
      }
      while (v74);
    }

    id v7 = v71;
    id v11 = v84;
    id v9 = v86;
  }
}

- (void)_populateRecurrencesInReminderChangeItem:(id)a3 withICSComponent:(id)a4 icsCalendar:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 removeAllRecurrenceRules];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v49 = v7;
  id obj = [v7 rrule];
  uint64_t v8 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v70;
    uint64_t v50 = *(void *)v70;
    do
    {
      uint64_t v11 = 0;
      uint64_t v51 = v9;
      do
      {
        if (*(void *)v70 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v69 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_37;
        }
        uint64_t v13 = [v6 accountID];
        uint64_t v68 = [v6 objectID];
        id v14 = v12;
        id v65 = v13;
        uint64_t v15 = [v14 freq];
        int v16 = v15;
        uint64_t v17 = 0;
        switch(v15)
        {
          case 1:
          case 2:
          case 3:
            int v18 = +[REMLogStore write];
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              goto LABEL_11;
            }
            *(_DWORD *)buf = 67109120;
            LODWORD(v79) = v16;
            id v19 = v18;
            __int16 v20 = "Encountered an ICS frequency that we don't handle: %d. Defaulting to daily";
            goto LABEL_46;
          case 4:
            break;
          case 5:
            uint64_t v17 = 1;
            break;
          case 6:
            uint64_t v17 = 2;
            break;
          case 7:
            uint64_t v17 = 3;
            break;
          default:
            int v18 = +[REMLogStore write];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v79) = v16;
              id v19 = v18;
              __int16 v20 = "Encountered an unknown ICS frequency: %d";
LABEL_46:
              _os_log_error_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_ERROR, v20, buf, 8u);
            }
LABEL_11:

            uint64_t v17 = 0;
            break;
        }
        uint64_t v21 = [v14 interval];
        uint64_t v22 = [v21 integerValue];

        uint64_t v23 = [v14 wkst];
        char v24 = v23;
        if (v23) {
          uint64_t v60 = REMWeekdayFromICSWeekday([v23 integerValue]);
        }
        else {
          uint64_t v60 = 0;
        }
        uint64_t v25 = [v14 until];
        uint64_t v62 = v17;
        v63 = v24;
        if (v25)
        {
          uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4FB7F28]) initWithValue:v25];
          id v27 = objc_msgSend(v26, "rem_dateAsUTC");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v28 = [v27 dateByAddingTimeInterval:86399.0];

            id v27 = (void *)v28;
          }
          BOOL v59 = +[REMRecurrenceEnd recurrenceEndWithEndDate:v27];

          goto LABEL_21;
        }
        long long v29 = [v14 count];

        if (v29)
        {
          uint64_t v26 = [v14 count];
          BOOL v59 = +[REMRecurrenceEnd recurrenceEndWithOccurrenceCount:](REMRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", [v26 unsignedIntegerValue]);
LABEL_21:

          goto LABEL_22;
        }
        BOOL v59 = 0;
LABEL_22:
        v61 = (void *)v25;
        uint64_t v66 = v12;
        v64 = v14;
        uint64_t v30 = [v14 byday];
        uint64_t v67 = v11;
        v58 = v30;
        if ([v30 count])
        {
          uint64_t v56 = v22;
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v30, "count"));
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v32 = v30;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v73 objects:buf count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v74;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v74 != v35) {
                  objc_enumerationMutation(v32);
                }
                BOOL v37 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                uint64_t v38 = REMWeekdayFromICSWeekday([v37 weekday]);
                uint64_t v39 = [v37 number];
                uint64_t v40 = +[REMRecurrenceDayOfWeek dayOfWeek:weekNumber:](REMRecurrenceDayOfWeek, "dayOfWeek:weekNumber:", v38, [v39 integerValue]);

                [v31 addObject:v40];
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v73 objects:buf count:16];
            }
            while (v34);
          }

          uint64_t v22 = v56;
        }
        else
        {
          uint64_t v31 = 0;
        }
        if (v22 <= 1) {
          uint64_t v41 = 1;
        }
        else {
          uint64_t v41 = v22;
        }
        uint64_t v57 = v41;
        id v54 = +[REMRecurrenceRule newObjectID];
        v55 = [REMRecurrenceRule alloc];
        v53 = [v64 bymonthday];
        id v42 = [v64 bymonth];
        v43 = [v64 byweekno];
        int v44 = [v64 byyearday];
        long long v45 = [v64 bysetpos];
        uint64_t v46 = [(REMRecurrenceRule *)v55 initRecurrenceRuleWithObjectID:v54 accountID:v65 reminderID:v68 frequency:v62 interval:v57 firstDayOfTheWeek:v60 daysOfTheWeek:v31 daysOfTheMonth:v53 monthsOfTheYear:v42 weeksOfTheYear:v43 daysOfTheYear:v44 setPositions:v45 end:v59];

        uint64_t v10 = v50;
        uint64_t v9 = v51;
        uint64_t v12 = v66;
        uint64_t v11 = v67;
        if (v46)
        {
          [v6 addRecurrenceRule:v46];
          goto LABEL_39;
        }
LABEL_37:
        uint64_t v46 = +[REMLogStore write];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          uint64_t v47 = [v6 objectID];
          *(_DWORD *)buf = 138412546;
          v79 = v12;
          __int16 v80 = 2112;
          v81 = v47;
          _os_log_error_impl(&dword_1B9AA2000, v46, OS_LOG_TYPE_ERROR, "Couldn't populate the recurrence rule {icsRecurrence: %@, reminderID: %@}", buf, 0x16u);
        }
LABEL_39:

        ++v11;
      }
      while (v11 != v9);
      uint64_t v48 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
      uint64_t v9 = v48;
    }
    while (v48);
  }
}

- (REMSaveRequest)initWithStore:(id)a3
{
  id v5 = a3;
  if (!v5) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "store");
  }
  v38.receiver = self;
  v38.super_class = (Class)REMSaveRequest;
  id v6 = [(REMSaveRequest *)&v38 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedAccountChangeItems = v7->_trackedAccountChangeItems;
    v7->_trackedAccountChangeItems = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedListChangeItems = v7->_trackedListChangeItems;
    v7->_trackedListChangeItems = v10;

    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedSmartListChangeItems = v7->_trackedSmartListChangeItems;
    v7->_trackedSmartListChangeItems = v12;

    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedTemplateChangeItems = v7->_trackedTemplateChangeItems;
    v7->_trackedTemplateChangeItems = v14;

    int v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedReminderChangeItems = v7->_trackedReminderChangeItems;
    v7->_trackedReminderChangeItems = v16;

    int v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedAccountCapabilities = v7->_trackedAccountCapabilities;
    v7->_trackedAccountCapabilities = v18;

    __int16 v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedListSectionChangeItems = v7->_trackedListSectionChangeItems;
    v7->_trackedListSectionChangeItems = v20;

    uint64_t v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedSmartListSectionChangeItems = v7->_trackedSmartListSectionChangeItems;
    v7->_trackedSmartListSectionChangeItems = v22;

    char v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    trackedTemplateSectionChangeItems = v7->_trackedTemplateSectionChangeItems;
    v7->_trackedTemplateSectionChangeItems = v24;

    uint64_t v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    saveRequestChangeEvents = v7->_saveRequestChangeEvents;
    v7->_saveRequestChangeEvents = v26;

    *(_WORD *)&v7->_updateLastModifiedDates = 1;
    v7->_cloneCompletedRecurrentRemindersAtSave = 1;
    v7->_syncToCloudKit = 1;
    switch([v5 mode])
    {
      case 1:
        uint64_t v28 = +[REMLogStore write];
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
          goto LABEL_13;
        }
        *(_WORD *)buf = 0;
        long long v29 = "Creating saveRequest in migration mode";
        goto LABEL_12;
      case 2:
        uint64_t v30 = +[REMLogStore write];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B9AA2000, v30, OS_LOG_TYPE_INFO, "Creating saveRequest in CalDAV-Sync mode", buf, 2u);
        }

        *(_WORD *)&v7->_cloneCompletedRecurrentRemindersAtSave = 256;
        v7->_updateLastModifiedDates = 0;
        uint64_t v31 = [v5 replicaManagerProviderForCalDAVSync];
        replicaManagerProvider = v7->_replicaManagerProvider;
        v7->_replicaManagerProvider = (REMReplicaManagerProviding *)v31;

        break;
      case 3:
        uint64_t v28 = +[REMLogStore write];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          long long v29 = "Creating saveRequest in EventKitSync mode";
LABEL_12:
          _os_log_impl(&dword_1B9AA2000, v28, OS_LOG_TYPE_INFO, v29, buf, 2u);
        }
LABEL_13:

        *(_WORD *)&v7->_cloneCompletedRecurrentRemindersAtSave = 256;
        goto LABEL_17;
      case 4:
        uint64_t v33 = +[REMLogStore write];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B9AA2000, v33, OS_LOG_TYPE_INFO, "Creating saveRequest in AccountDataMoving mode", buf, 2u);
        }

        v7->_cloneCompletedRecurrentRemindersAtSave = 0;
LABEL_17:
        v7->_updateLastModifiedDates = 0;
        break;
      default:
        break;
    }
    if (!v7->_replicaManagerProvider)
    {
      uint64_t v34 = [[_REMDefaultReplicaManagerProvider alloc] initWithStore:v5];
      uint64_t v35 = v7->_replicaManagerProvider;
      v7->_replicaManagerProvider = (REMReplicaManagerProviding *)v34;
    }
  }

  return v7;
}

- (id)description
{
  id v19 = NSString;
  uint64_t v18 = objc_opt_class();
  uint64_t v21 = [(REMSaveRequest *)self trackedAccountChangeItems];
  uint64_t v16 = [v21 count];
  __int16 v20 = [(REMSaveRequest *)self trackedListChangeItems];
  uint64_t v15 = [v20 count];
  uint64_t v17 = [(REMSaveRequest *)self trackedSmartListChangeItems];
  uint64_t v14 = [v17 count];
  v3 = [(REMSaveRequest *)self trackedTemplateChangeItems];
  uint64_t v4 = [v3 count];
  id v5 = [(REMSaveRequest *)self trackedReminderChangeItems];
  uint64_t v6 = [v5 count];
  id v7 = [(REMSaveRequest *)self trackedListSectionChangeItems];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [(REMSaveRequest *)self trackedSmartListSectionChangeItems];
  uint64_t v10 = [v9 count];
  uint64_t v11 = [(REMSaveRequest *)self trackedTemplateSectionChangeItems];
  uint64_t v12 = [v19 stringWithFormat:@"<%@: %p acounts.count: %ld, lists.count: %ld, smartLists.count: %ld, templates.count: %ld, reminders.count: %ld, listSections.count: %ld>, smartListSections.count: %ld, templateSections.count: %ld>", v18, self, v16, v15, v14, v4, v6, v8, v10, objc_msgSend(v11, "count")];

  return v12;
}

- (id)updateAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 storage];
    if (v6)
    {
      id v7 = [v5 objectID];
      if (v7)
      {
        uint64_t v8 = [(REMSaveRequest *)self _trackedAccountChangeItemForObjectID:v7];
        if (!v8)
        {
          uint64_t v9 = [REMAccountChangeItem alloc];
          uint64_t v10 = [v5 capabilities];
          uint64_t v8 = [(REMAccountChangeItem *)v9 initWithSaveRequest:self storage:v6 capabilities:v10 observeInitialValues:0];

          [(REMSaveRequest *)self _trackAccountChangeItem:v8];
        }
      }
      else
      {
        uint64_t v13 = +[REMLogStore write];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
        }

        NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v12 = +[REMLogStore write];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateAccount:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "accountStorage");
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateAccount:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "account");
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_updateAccountWithListChangeItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 parentAccountID];
    if (v6)
    {
      id v7 = [(REMSaveRequest *)self _trackedAccountChangeItemForObjectID:v6];
      if (!v7) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Assertion Failure. Missing REMAccountChangeItem associated with REMListChangeItem. {listChangeItem: %@}", v5 format];
      }
    }
    else
    {
      uint64_t v9 = +[REMLogStore write];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest _updateAccountWithListChangeItem:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "accountObjectID");
      id v7 = 0;
    }
  }
  else
  {
    uint64_t v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateAccountWithListChangeItem:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "listChangeItem");
    id v7 = 0;
  }

  return v7;
}

- (id)addGroupWithName:(id)a3 toAccountGroupContextChangeItem:(id)a4 groupObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      if (!v10) {
        id v10 = +[REMList newObjectID];
      }
      uint64_t v11 = [v9 accountChangeItem];
      uint64_t v12 = [v11 saveRequest];

      if (v12 != self)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v14 = *MEMORY[0x1E4F1C3B8];
        uint64_t v15 = [v11 saveRequest];
        [v13 raise:v14, @"accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v11, v15, self format];
      }
      uint64_t v16 = [[REMListChangeItem alloc] initWithObjectID:v10 name:v8 insertIntoAccountChangeItem:v11 isGroup:1];
      [(REMSaveRequest *)self _trackListChangeItem:v16];

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "name");
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = +[REMLogStore write];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest addGroupWithName:toAccountGroupContextChangeItem:groupObjectID:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "accountGroupContextChangeItem");
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (id)addGroupWithName:(id)a3 toAccountGroupContextChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addGroupWithName:a3 toAccountGroupContextChangeItem:a4 groupObjectID:0];
}

- (id)addListWithName:(id)a3 toAccountChangeItem:(id)a4 listObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      uint64_t v11 = [v9 saveRequest];

      if (v11 != self)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v13 = *MEMORY[0x1E4F1C3B8];
        uint64_t v14 = [v9 saveRequest];
        [v12 raise:v13, @"accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v9, v14, self format];
      }
      if (!v10) {
        id v10 = +[REMList newObjectID];
      }
      uint64_t v15 = [[REMListChangeItem alloc] initWithObjectID:v10 name:v8 insertIntoAccountChangeItem:v9];
      [(REMSaveRequest *)self _trackListChangeItem:v15];
      goto LABEL_12;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "name");
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = +[REMLogStore write];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "accountChangeItem");
  uint64_t v15 = 0;
LABEL_12:

  return v15;
}

- (id)addListWithName:(id)a3 toAccountChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addListWithName:a3 toAccountChangeItem:a4 listObjectID:0];
}

- (id)addListWithName:(id)a3 toListSublistContextChangeItem:(id)a4 listObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    NSLog(&cfstr_SIsUnexpectedl.isa, "listSublistContextChangeItem");
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "name");
  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_11:
  id v10 = +[REMList newObjectID];
LABEL_4:
  uint64_t v11 = [v9 listChangeItem];
  uint64_t v12 = [v11 saveRequest];

  if (v12 != self)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    uint64_t v15 = [v11 saveRequest];
    [v13 raise:v14, @"listSublistContextChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v9, v15, self format];
  }
  uint64_t v16 = [[REMListChangeItem alloc] initWithObjectID:v10 name:v8 insertIntoListSublistContextChangeItem:v9];
  [(REMSaveRequest *)self _trackListChangeItem:v16];

  return v16;
}

- (id)addListWithName:(id)a3 toListSublistContextChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addListWithName:a3 toListSublistContextChangeItem:a4 listObjectID:0];
}

- (id)addListUsingTemplate:(id)a3 toAccountChangeItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 templatesContextChangeItem];

  if (v8)
  {
    id v9 = [v6 name];

    if (!v9)
    {
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[REMSaveRequest addListUsingTemplate:toAccountChangeItem:](v6);
      }
    }
    uint64_t v11 = [v6 name];
    uint64_t v12 = [(REMSaveRequest *)self addListWithName:v11 toAccountChangeItem:v7 listObjectID:0];
    uint64_t v13 = [v6 color];
    [v12 setColor:v13];

    uint64_t v14 = [v6 badgeEmblem];
    [v12 setBadgeEmblem:v14];

    objc_msgSend(v12, "setShowingLargeAttachments:", objc_msgSend(v6, "showingLargeAttachments"));
    uint64_t v15 = [v6 sortingStyle];
    [v12 setSortingStyle:v15];

    uint64_t v16 = [v6 objectID];
    [v12 setTemplateID:v16];
  }
  else
  {
    uint64_t v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[REMSaveRequest addListUsingTemplate:toAccountChangeItem:](v7);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)addListUsingPublicTemplateWithREMListRepresentation:(id)a3 toAccountChangeItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 templatesContextChangeItem];

  if (v8)
  {
    id v9 = [v6 name];

    if (!v9)
    {
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[REMSaveRequest addListUsingPublicTemplateWithREMListRepresentation:toAccountChangeItem:](v6);
      }
    }
    uint64_t v11 = [v6 name];
    uint64_t v12 = [(REMSaveRequest *)self addListWithName:v11 toAccountChangeItem:v7 listObjectID:0];
    uint64_t v13 = [v6 color];
    [v12 setColor:v13];

    uint64_t v14 = [v6 badgeEmblem];
    [v12 setBadgeEmblem:v14];

    objc_msgSend(v12, "setShowingLargeAttachments:", objc_msgSend(v6, "showingLargeAttachments"));
    uint64_t v15 = [v6 sortingStyle];
    [v12 setSortingStyle:v15];

    uint64_t v16 = [v6 objectID];
    [v12 setTemplateID:v16];
  }
  else
  {
    uint64_t v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[REMSaveRequest addListUsingPublicTemplateWithREMListRepresentation:toAccountChangeItem:](v7);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)updateList:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 storage];
    if (v6)
    {
      id v7 = [v5 account];
      id v8 = [(REMSaveRequest *)self updateAccount:v7];

      id v9 = [v5 parentList];
      if (v9) {
        id v10 = [(REMSaveRequest *)self updateList:v9];
      }
      uint64_t v11 = [v5 storage];
      uint64_t v12 = [v5 account];
      uint64_t v13 = [v12 capabilities];
      uint64_t v14 = [(REMSaveRequest *)self _updateListStorage:v11 accountCapabilities:v13];
    }
    else
    {
      uint64_t v16 = +[REMLogStore write];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateList:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "listStorage");
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = +[REMLogStore write];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateList:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "list");
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_updateListStorage:(id)a3 accountCapabilities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    uint64_t v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateList:]();
    }

    uint64_t v12 = "listStorage";
    goto LABEL_12;
  }
  if (!v7)
  {
    uint64_t v13 = +[REMLogStore write];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateListStorage:accountCapabilities:]();
    }

    uint64_t v12 = "accountCapabilities";
LABEL_12:
    NSLog(&cfstr_SIsUnexpectedl.isa, v12);
    id v10 = 0;
    goto LABEL_17;
  }
  id v9 = [v6 objectID];
  if (v9)
  {
    id v10 = [(REMSaveRequest *)self _trackedListChangeItemForObjectID:v9];
    if (!v10)
    {
      id v10 = [[REMListChangeItem alloc] initWithSaveRequest:self storage:v6 accountCapabilities:v8 observeInitialValues:0];
      [(REMSaveRequest *)self _trackListChangeItem:v10];
    }
  }
  else
  {
    uint64_t v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v10 = 0;
  }

LABEL_17:

  return v10;
}

- (id)_updateListWithReminderChangeItem:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v9 = +[REMLogStore write];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateListWithReminderChangeItem:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "reminderChangeItem");
    goto LABEL_12;
  }
  id v6 = [v4 storage];

  if (!v6)
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateListWithReminderChangeItem:]();
    }

    id v8 = [v5 storage];

    if (!v8)
    {
      NSLog(&cfstr_SIsUnexpectedl.isa, "reminderChangeItem.storage");
      goto LABEL_17;
    }
LABEL_12:
    id v8 = 0;
    goto LABEL_17;
  }
  id v7 = [v5 listID];
  if (v7)
  {
    id v8 = [(REMSaveRequest *)self _trackedListChangeItemForObjectID:v7];
    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Assertion Failure. Missing REMListChangeItem associated with REMReminderChangeItem. {reminderChangeItem: %@}", v5 format];
    }
  }
  else
  {
    uint64_t v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
    id v8 = 0;
  }

LABEL_17:

  return v8;
}

- (id)addCustomSmartListWithName:(id)a3 toAccountChangeItem:(id)a4 smartListObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      uint64_t v11 = [v9 saveRequest];

      uint64_t v12 = (uint64_t *)MEMORY[0x1E4F1C3B8];
      if (v11 != self)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v14 = *MEMORY[0x1E4F1C3B8];
        uint64_t v15 = [v9 saveRequest];
        [v13 raise:v14, @"accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v9, v15, self format];
      }
      uint64_t v16 = [v9 capabilities];
      char v17 = [v16 supportsCustomSmartLists];

      if ((v17 & 1) == 0)
      {
        uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *v12;
        __int16 v20 = [v9 objectID];
        [v18 raise:v19, @"Cannot add CSL because the given accountChangeItem does not support it {accountID: %@}", v20 format];
      }
      if (v10) {
        id v21 = v10;
      }
      else {
        id v21 = +[REMSmartList newObjectID];
      }
      char v24 = v21;
      uint64_t v23 = [[REMSmartListChangeItem alloc] initWithCustomSmartListObjectID:v21 insertIntoAccountChangeItem:v9];
      [(REMSaveRequest *)self _trackSmartListChangeItem:v23];
      [(REMSmartListChangeItem *)v23 setName:v8];

      goto LABEL_15;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "name");
    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = +[REMLogStore write];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "accountChangeItem");
  uint64_t v23 = 0;
LABEL_15:

  return v23;
}

- (id)updateSmartList:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 storage];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 objectID];
      if (v8)
      {
        id v9 = [(REMSaveRequest *)self _trackedSmartListChangeItemForObjectID:v8];
        if (!v9)
        {
          id v9 = -[REMSmartListChangeItem initWithSaveRequest:storage:observeInitialValues:]([REMSmartListChangeItem alloc], "initWithSaveRequest:storage:observeInitialValues:", self, v7, [v5 isPersisted] ^ 1);
          [(REMSaveRequest *)self _trackSmartListChangeItem:v9];
        }
      }
      else
      {
        uint64_t v12 = +[REMLogStore write];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
        }

        NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
        id v9 = 0;
      }
    }
    else
    {
      uint64_t v11 = +[REMLogStore write];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateSmartList:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "smartListStorage");
      id v9 = 0;
    }
  }
  else
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateSmartList:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "smartList");
    id v9 = 0;
  }

  return v9;
}

- (id)addTemplateWithName:(id)a3 configuration:(id)a4 toAccountChangeItem:(id)a5 templateObjectID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    NSLog(&cfstr_SIsUnexpectedl.isa, "configuration");
    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "name");
  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12)
  {
LABEL_4:
    uint64_t v14 = [v12 saveRequest];

    if (v14 != self)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v16 = *MEMORY[0x1E4F1C3B8];
      char v17 = [v12 saveRequest];
      [v15 raise:v16, @"accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v12, v17, self format];
    }
    uint64_t v18 = [[REMTemplateChangeItem alloc] initWithObjectID:v13 name:v10 configuration:v11 insertIntoAccountChangeItem:v12];
    [(REMSaveRequest *)self _trackTemplateChangeItem:v18];
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v19 = +[REMLogStore write];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "accountChangeItem");
  uint64_t v18 = 0;
LABEL_12:

  return v18;
}

- (id)addTemplateWithName:(id)a3 configuration:(id)a4 toAccountChangeItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[REMTemplate newObjectID];
  id v12 = [(REMSaveRequest *)self addTemplateWithName:v10 configuration:v9 toAccountChangeItem:v8 templateObjectID:v11];

  return v12;
}

- (id)updateTemplate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 storage];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 objectID];
      if (v8)
      {
        id v9 = [(REMSaveRequest *)self _trackedTemplateChangeItemForObjectID:v8];
        if (!v9)
        {
          id v9 = -[REMTemplateChangeItem initWithSaveRequest:storage:observeInitialValues:]([REMTemplateChangeItem alloc], "initWithSaveRequest:storage:observeInitialValues:", self, v7, [v5 isPersisted] ^ 1);
          [(REMSaveRequest *)self _trackTemplateChangeItem:v9];
        }
      }
      else
      {
        id v12 = +[REMLogStore write];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
        }

        NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
        id v9 = 0;
      }
    }
    else
    {
      id v11 = +[REMLogStore write];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateTemplate:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "templateStorage");
      id v9 = 0;
    }
  }
  else
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateTemplate:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "remTemplate");
    id v9 = 0;
  }

  return v9;
}

- (id)addReminderWithTitle:(id)a3 toListChangeItem:(id)a4 reminderObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "title");
    if (v9) {
      goto LABEL_3;
    }
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "listChangeItem");
LABEL_3:
  id v11 = [v9 objectID];
  id v12 = [v11 entityName];
  id v13 = +[REMTemplate cdEntityName];
  int v14 = [v12 isEqualToString:v13];

  if (v10)
  {
    uint64_t v15 = [v10 entityName];
    if (v14)
    {
      uint64_t v16 = +[REMTemplate cdEntityNameForSavedReminder];
      char v17 = [v15 isEqualToString:v16];

      if (v17) {
        goto LABEL_18;
      }
      uint64_t v18 = +[REMLogStore write];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest addReminderWithTitle:toListChangeItem:reminderObjectID:]();
      }
    }
    else
    {
      __int16 v20 = +[REMReminder cdEntityName];
      char v21 = [v15 isEqualToString:v20];

      if (v21) {
        goto LABEL_18;
      }
      uint64_t v18 = +[REMLogStore write];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest addReminderWithTitle:toListChangeItem:reminderObjectID:]();
      }
    }
  }
  else
  {
    if (v14) {
      id v19 = +[REMTemplate newObjectIDForSavedReminder];
    }
    else {
      id v19 = +[REMReminder newObjectID];
    }
    id v10 = v19;
  }
LABEL_18:
  uint64_t v22 = [v9 saveRequest];

  uint64_t v23 = (void *)MEMORY[0x1E4F1C3B8];
  if (v22 != self)
  {
    char v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3B8];
    uint64_t v26 = [v9 saveRequest];
    [v24 raise:v25, @"listChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v9, v26, self format];
  }
  if ([v9 isGroup]) {
    [MEMORY[0x1E4F1CA00] raise:*v23, @"listChangeItem is a group and adding reminder to group is not currently supported {listChangeItem: %@}", v9 format];
  }
  id v27 = [[REMReminderChangeItem alloc] initWithObjectID:v10 title:v8 insertIntoListChangeItem:v9];
  [(REMSaveRequest *)self _trackReminderChangeItem:v27];

  return v27;
}

- (id)addReminderWithTitle:(id)a3 toListChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addReminderWithTitle:a3 toListChangeItem:a4 reminderObjectID:0];
}

- (id)addReminderWithTitle:(id)a3 toReminderSubtaskContextChangeItem:(id)a4 reminderObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "title");
    if (v9) {
      goto LABEL_3;
    }
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "parentReminderSubtaskContextChangeItem");
LABEL_3:
  id v11 = [v9 reminderChangeItem];
  id v12 = [v11 objectID];
  id v13 = [v12 entityName];
  int v14 = +[REMTemplate cdEntityNameForSavedReminder];
  int v15 = [v13 isEqualToString:v14];

  if (v10)
  {
    uint64_t v16 = [v10 entityName];
    if (v15)
    {
      char v17 = +[REMTemplate cdEntityNameForSavedReminder];
      char v18 = [v16 isEqualToString:v17];

      if (v18) {
        goto LABEL_18;
      }
      id v19 = +[REMLogStore write];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:]();
      }
    }
    else
    {
      char v21 = +[REMReminder cdEntityName];
      char v22 = [v16 isEqualToString:v21];

      if (v22) {
        goto LABEL_18;
      }
      id v19 = +[REMLogStore write];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:]();
      }
    }
  }
  else
  {
    if (v15) {
      id v20 = +[REMTemplate newObjectIDForSavedReminder];
    }
    else {
      id v20 = +[REMReminder newObjectID];
    }
    id v10 = v20;
  }
LABEL_18:
  uint64_t v23 = [v9 reminderChangeItem];
  char v24 = [v23 saveRequest];

  if (v24 != self)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v26 = *MEMORY[0x1E4F1C3B8];
    id v27 = [v23 saveRequest];
    [v25 raise:v26, @"parentReminderChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v23, v27, self format];
  }
  uint64_t v28 = [[REMReminderChangeItem alloc] initWithObjectID:v10 title:v8 insertIntoParentReminderSubtaskContextChangeItem:v9];
  [(REMSaveRequest *)self _trackReminderChangeItem:v28];

  return v28;
}

- (id)addReminderWithTitle:(id)a3 toReminderSubtaskContextChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addReminderWithTitle:a3 toReminderSubtaskContextChangeItem:a4 reminderObjectID:0];
}

- (id)updateReminder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 storage];
    if (v6)
    {
      id v7 = [v5 objectID];
      if (v7)
      {
        id v8 = [(REMSaveRequest *)self _trackedReminderChangeItemForObjectID:v7];
        if (!v8)
        {
          id v9 = [REMReminderChangeItem alloc];
          id v10 = [v5 storage];
          id v11 = [v5 account];
          id v12 = [v11 capabilities];
          id v8 = [(REMReminderChangeItem *)v9 initWithSaveRequest:self storage:v10 accountCapabilities:v12 observeInitialValues:0];

          [(REMSaveRequest *)self _trackReminderChangeItem:v8];
        }
        id v13 = [v5 list];
        id v14 = [(REMSaveRequest *)self updateList:v13];
      }
      else
      {
        char v17 = +[REMLogStore write];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
        }

        NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
        id v8 = 0;
      }
    }
    else
    {
      uint64_t v16 = +[REMLogStore write];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateReminder:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
      id v8 = 0;
    }
  }
  else
  {
    int v15 = +[REMLogStore write];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateReminder:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "reminder");
    id v8 = 0;
  }

  return v8;
}

- (id)addListSectionWithDisplayName:(id)a3 toListSectionContextChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addListSectionWithDisplayName:a3 toListSectionContextChangeItem:a4 listSectionObjectID:0];
}

- (id)addListSectionWithDisplayName:(id)a3 toListSectionContextChangeItem:(id)a4 listSectionObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      id v11 = [v9 listChangeItem];
      id v12 = [v11 saveRequest];

      if (v12 != self)
      {
        id v13 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v14 = *MEMORY[0x1E4F1C3B8];
        int v15 = [v11 saveRequest];
        [v13 raise:v14, @"listSectionContextChangeItem.listChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v11, v15, self format];
      }
      if (!v10) {
        id v10 = +[REMListSection newObjectID];
      }
      uint64_t v16 = [[REMListSectionChangeItem alloc] initWithObjectID:v10 displayName:v8 insertIntoListChangeItem:v11];
      char v17 = [MEMORY[0x1E4F1C9C8] now];
      [(REMListSectionChangeItem *)v16 setCreationDate:v17];

      [(REMSaveRequest *)self _trackListSectionChangeItem:v16];
      [v9 setShouldUpdateSectionsOrdering:1];

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "displayName");
    if (v9) {
      goto LABEL_3;
    }
  }
  char v18 = +[REMLogStore write];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest addListSectionWithDisplayName:toListSectionContextChangeItem:listSectionObjectID:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "listSectionContextChangeItem");
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (id)updateListSection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 storage];
    if (v6)
    {
      id v7 = [v5 objectID];
      if (v7)
      {
        id v8 = [(REMSaveRequest *)self _trackedListSectionChangeItemForObjectID:v7];
        if (!v8)
        {
          id v9 = [REMListSectionChangeItem alloc];
          id v10 = [v5 storage];
          id v11 = [v5 accountCapabilities];
          id v8 = [(REMBaseSectionChangeItem *)v9 initWithSaveRequest:self storage:v10 accountCapabilities:v11 observeInitialValues:0];

          [(REMSaveRequest *)self _trackListSectionChangeItem:v8];
        }
        id v12 = [v5 list];
        id v13 = [(REMSaveRequest *)self updateList:v12];
      }
      else
      {
        uint64_t v16 = +[REMLogStore write];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
        }

        NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
        id v8 = 0;
      }
    }
    else
    {
      int v15 = +[REMLogStore write];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateReminder:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateListSection:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "remListSection");
    id v8 = 0;
  }

  return v8;
}

- (id)addSmartListSectionWithDisplayName:(id)a3 toSmartListSectionContextChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addSmartListSectionWithDisplayName:a3 toSmartListSectionContextChangeItem:a4 smartListSectionObjectID:0];
}

- (id)addSmartListSectionWithDisplayName:(id)a3 toSmartListSectionContextChangeItem:(id)a4 smartListSectionObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      id v11 = [v9 smartListChangeItem];
      id v12 = [v11 saveRequest];

      if (v12 != self)
      {
        id v13 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v14 = *MEMORY[0x1E4F1C3B8];
        int v15 = [v11 saveRequest];
        [v13 raise:v14, @"smartListSectionContextChangeItem.smartListChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v11, v15, self format];
      }
      if (!v10) {
        id v10 = +[REMSmartListSection newObjectID];
      }
      uint64_t v16 = [[REMSmartListSectionChangeItem alloc] initWithObjectID:v10 displayName:v8 insertIntoSmartListChangeItem:v11];
      char v17 = [MEMORY[0x1E4F1C9C8] now];
      [(REMSmartListSectionChangeItem *)v16 setCreationDate:v17];

      [(REMSaveRequest *)self _trackSmartListSectionChangeItem:v16];
      [v9 setShouldUpdateSectionsOrdering:1];

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "displayName");
    if (v9) {
      goto LABEL_3;
    }
  }
  char v18 = +[REMLogStore write];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest addSmartListSectionWithDisplayName:toSmartListSectionContextChangeItem:smartListSectionObjectID:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "smartListSectionContextChangeItem");
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (id)updateSmartListSection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 storage];
    if (v6)
    {
      id v7 = [v5 objectID];
      if (v7)
      {
        id v8 = [(REMSaveRequest *)self _trackedSmartListSectionChangeItemForObjectID:v7];
        if (!v8)
        {
          id v9 = [REMSmartListSectionChangeItem alloc];
          id v10 = [v5 storage];
          id v11 = [v5 accountCapabilities];
          id v8 = [(REMBaseSectionChangeItem *)v9 initWithSaveRequest:self storage:v10 accountCapabilities:v11 observeInitialValues:0];

          [(REMSaveRequest *)self _trackSmartListSectionChangeItem:v8];
        }
        id v12 = [v5 smartList];
        id v13 = [(REMSaveRequest *)self updateSmartList:v12];
      }
      else
      {
        uint64_t v16 = +[REMLogStore write];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
        }

        NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
        id v8 = 0;
      }
    }
    else
    {
      int v15 = +[REMLogStore write];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateReminder:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateSmartListSection:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "remSmartListSection");
    id v8 = 0;
  }

  return v8;
}

- (id)addTemplateSectionWithDisplayName:(id)a3 toTemplateSectionContextChangeItem:(id)a4
{
  return [(REMSaveRequest *)self addTemplateSectionWithDisplayName:a3 toTemplateSectionContextChangeItem:a4 templateSectionObjectID:0];
}

- (id)addTemplateSectionWithDisplayName:(id)a3 toTemplateSectionContextChangeItem:(id)a4 templateSectionObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      id v11 = [v9 templateChangeItem];
      id v12 = [v11 saveRequest];

      if (v12 != self)
      {
        id v13 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v14 = *MEMORY[0x1E4F1C3B8];
        int v15 = [v11 saveRequest];
        [v13 raise:v14, @"templateSectionContextChangeItem.templateChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v11, v15, self format];
      }
      if (!v10) {
        id v10 = +[REMTemplateSection newObjectID];
      }
      uint64_t v16 = [[REMTemplateSectionChangeItem alloc] initWithObjectID:v10 displayName:v8 insertIntoTemplateChangeItem:v11];
      char v17 = [MEMORY[0x1E4F1C9C8] now];
      [(REMTemplateSectionChangeItem *)v16 setCreationDate:v17];

      [(REMSaveRequest *)self _trackTemplateSectionChangeItem:v16];
      [v9 setShouldUpdateSectionsOrdering:1];

      goto LABEL_12;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "displayName");
    if (v9) {
      goto LABEL_3;
    }
  }
  char v18 = +[REMLogStore write];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest addTemplateSectionWithDisplayName:toTemplateSectionContextChangeItem:templateSectionObjectID:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "templateSectionContextChangeItem");
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (id)updateTemplateSection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 storage];
    if (v6)
    {
      id v7 = [v5 objectID];
      if (v7)
      {
        id v8 = [(REMSaveRequest *)self _trackedTemplateSectionChangeItemForObjectID:v7];
        if (!v8)
        {
          id v9 = [REMTemplateSectionChangeItem alloc];
          id v10 = [v5 storage];
          id v11 = [v5 accountCapabilities];
          id v8 = [(REMBaseSectionChangeItem *)v9 initWithSaveRequest:self storage:v10 accountCapabilities:v11 observeInitialValues:0];

          [(REMSaveRequest *)self _trackTemplateSectionChangeItem:v8];
        }
        id v12 = [v5 parentTemplate];
        id v13 = [(REMSaveRequest *)self updateTemplate:v12];
      }
      else
      {
        uint64_t v16 = +[REMLogStore write];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
        }

        NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
        id v8 = 0;
      }
    }
    else
    {
      int v15 = +[REMLogStore write];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest updateReminder:]();
      }

      NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest updateTemplateSection:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "remTemplateSection");
    id v8 = 0;
  }

  return v8;
}

- (void)_updateResolutionTokenMapForChangeItem:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 resolutionTokenMap];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CA80] set];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = [v3 changedKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [v3 resolutionTokenKeyForChangedKey:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v4, "updateForKey:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v12 = +[REMLogStore write];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[REMSaveRequest _updateResolutionTokenMapForChangeItem:](v12);
    }
  }
}

- (void)_willSaveAccountChangeItems:(id)a3 listChangeItems:(id)a4 listSectionChangeItems:(id)a5 smartListChangeItems:(id)a6 smartListSectionChangeItems:(id)a7 templateChangeItems:(id)a8 templateSectionChangeItems:(id)a9 reminderChangeItems:(id)a10
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v92 = a8;
  id v97 = a9;
  locatiouint64_t n = (id *)a10;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id obj = v16;
  uint64_t v21 = [obj countByEnumeratingWithState:&v128 objects:v139 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v129;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v129 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v128 + 1) + 8 * i);
        uint64_t v26 = (void *)MEMORY[0x1BA9DB950]();
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v25];
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v128 objects:v139 count:16];
    }
    while (v22);
  }

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v27 = v17;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v124 objects:v138 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v125;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v125 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v124 + 1) + 8 * j);
        uint64_t v33 = (void *)MEMORY[0x1BA9DB950]();
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v124 objects:v138 count:16];
    }
    while (v29);
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v95 = v18;
  uint64_t v34 = [v95 countByEnumeratingWithState:&v120 objects:v137 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v121;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v121 != v36) {
          objc_enumerationMutation(v95);
        }
        uint64_t v38 = *(void *)(*((void *)&v120 + 1) + 8 * k);
        uint64_t v39 = (void *)MEMORY[0x1BA9DB950]();
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v38];
      }
      uint64_t v35 = [v95 countByEnumeratingWithState:&v120 objects:v137 count:16];
    }
    while (v35);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v94 = v19;
  uint64_t v40 = [v94 countByEnumeratingWithState:&v116 objects:v136 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v117;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v117 != v42) {
          objc_enumerationMutation(v94);
        }
        uint64_t v44 = *(void *)(*((void *)&v116 + 1) + 8 * m);
        long long v45 = (void *)MEMORY[0x1BA9DB950]();
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v44];
      }
      uint64_t v41 = [v94 countByEnumeratingWithState:&v116 objects:v136 count:16];
    }
    while (v41);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v46 = v20;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v112 objects:v135 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v113;
    do
    {
      for (uint64_t n = 0; n != v48; ++n)
      {
        if (*(void *)v113 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = *(void *)(*((void *)&v112 + 1) + 8 * n);
        uint64_t v52 = (void *)MEMORY[0x1BA9DB950]();
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v51];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v112 objects:v135 count:16];
    }
    while (v48);
  }
  long long v90 = v27;

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v53 = v92;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v108 objects:v134 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v109;
    do
    {
      for (iuint64_t i = 0; ii != v55; ++ii)
      {
        if (*(void *)v109 != v56) {
          objc_enumerationMutation(v53);
        }
        uint64_t v58 = *(void *)(*((void *)&v108 + 1) + 8 * ii);
        BOOL v59 = (void *)MEMORY[0x1BA9DB950]();
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v58];
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v108 objects:v134 count:16];
    }
    while (v55);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v60 = v97;
  uint64_t v61 = [v60 countByEnumeratingWithState:&v104 objects:v133 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v105;
    do
    {
      for (juint64_t j = 0; jj != v62; ++jj)
      {
        if (*(void *)v105 != v63) {
          objc_enumerationMutation(v60);
        }
        uint64_t v65 = *(void *)(*((void *)&v104 + 1) + 8 * jj);
        uint64_t v66 = (void *)MEMORY[0x1BA9DB950]();
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v65];
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v104 objects:v133 count:16];
    }
    while (v62);
  }
  v88 = v53;
  v89 = v46;
  uint64_t v87 = v60;

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v93 = location;
  uint64_t v67 = [v93 countByEnumeratingWithState:&v100 objects:v132 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v98 = *(void *)v101;
    do
    {
      for (kuint64_t k = 0; kk != v68; ++kk)
      {
        if (*(void *)v101 != v98) {
          objc_enumerationMutation(v93);
        }
        long long v70 = *(void **)(*((void *)&v100 + 1) + 8 * kk);
        long long v71 = (void *)MEMORY[0x1BA9DB950]();
        long long v72 = [MEMORY[0x1E4F1C9C8] date];
        long long v73 = [v70 creationDate];

        if (!v73) {
          [v70 setCreationDate:v72];
        }
        if ([(REMSaveRequest *)self updateLastModifiedDates]
          || ([v70 lastModifiedDate],
              long long v74 = objc_claimAutoreleasedReturnValue(),
              v74,
              !v74))
        {
          [v70 setLastModifiedDate:v72];
        }
        [(REMSaveRequest *)self _updateResolutionTokenMapForChangeItem:v70];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_notifyChangeDelegate);

        if (WeakRetained)
        {
          long long v76 = [v70 listChangeItem];
          v77 = [v76 sharees];
          BOOL v78 = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", [v77 count], objc_msgSend(v76, "sharingStatus"));

          if (v78)
          {
            v79 = [v70 changedKeys];
            int v80 = [v79 containsObject:@"objectID"];

            v81 = [v70 changedKeys];
            if ([v81 containsObject:@"titleDocument"])
            {

              if (!v80) {
                goto LABEL_71;
              }
LABEL_69:
              v84 = [(REMSaveRequest *)self saveRequestChangeEvents];
              id v85 = v84;
              id v86 = &unk_1F136C2F0;
LABEL_72:
              [v84 addObject:v86];
            }
            else
            {
              uint64_t v82 = [v70 changedKeys];
              if ([v82 containsObject:@"notesDocument"])
              {

                if (v80) {
                  goto LABEL_69;
                }
LABEL_71:
                v84 = [(REMSaveRequest *)self saveRequestChangeEvents];
                id v85 = v84;
                id v86 = &unk_1F136C308;
                goto LABEL_72;
              }
              id v83 = [v70 changedKeys];
              int v91 = [v83 containsObject:@"hashtags"];

              if (v80) {
                goto LABEL_69;
              }
              if (v91) {
                goto LABEL_71;
              }
            }
          }
        }
      }
      uint64_t v68 = [v93 countByEnumeratingWithState:&v100 objects:v132 count:16];
    }
    while (v68);
  }
}

- (void)saveWithQueue:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "queue");
    if (v8) {
      goto LABEL_3;
    }
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "completion");
LABEL_3:
  if ([(REMSaveRequest *)self _changeItemsAreAllEmpty])
  {
    uint64_t v9 = [(REMSaveRequest *)self author];
    if ([v9 isEqualToString:@"com.apple.eventkitsyncd"])
    {

LABEL_9:
      id v11 = +[REMLogStore write];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(REMSaveRequest *)self author];
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v12;
        __int16 v24 = 1024;
        BOOL v25 = [(REMSaveRequest *)self saveIsNoopIfNoChangedKeys];
        _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_DEFAULT, "Save Request has no changed keys. Opted to return early as no-op. {author: %{public}@, saveIsNoopIfNoChangedKeys: %d}", buf, 0x12u);
      }
      id v13 = [(REMSaveRequest *)self store];
      [v13 processNoOpSaveRequest:self queue:v6 completion:v8];
      goto LABEL_18;
    }
    BOOL v10 = [(REMSaveRequest *)self saveIsNoopIfNoChangedKeys];

    if (v10) {
      goto LABEL_9;
    }
    uint64_t v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(REMSaveRequest *)self author];
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v15;
      _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_DEFAULT, "LOOKATME: Save Request has no changed keys. Save will continue. Revisit if caller should avoid such saves. {author: %{public}@}", buf, 0xCu);
    }
  }
  [(REMSaveRequest *)self setSaved:1];
  id v16 = +[REMLogStore write];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.reminderkit.REMSaveRequest}", buf, 2u);
  }

  id v17 = (void *)os_transaction_create();
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __43__REMSaveRequest_saveWithQueue_completion___block_invoke;
  activity_block[3] = &unk_1E61DC3A8;
  activity_block[4] = self;
  id v19 = v6;
  id v20 = v17;
  id v21 = v8;
  id v13 = v17;
  _os_activity_initiate(&dword_1B9AA2000, "REMSaveRequest save async", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);

LABEL_18:
}

void __43__REMSaveRequest_saveWithQueue_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__REMSaveRequest_saveWithQueue_completion___block_invoke_2;
  v3[3] = &unk_1E61DDB70;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 _prepareSave:v3];
}

void __43__REMSaveRequest_saveWithQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v17 = *(void **)(a1 + 32);
  id v32 = a9;
  id v31 = a8;
  id v29 = a7;
  id v30 = a6;
  id v28 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = a2;
  id v21 = [v17 store];
  uint64_t v22 = *(void **)(a1 + 32);
  id v27 = [v22 author];
  uint64_t v23 = [*(id *)(a1 + 32) replicaManagerProvider];
  uint64_t v24 = *(void *)(a1 + 40);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __43__REMSaveRequest_saveWithQueue_completion___block_invoke_3;
  v33[3] = &unk_1E61DDB48;
  id v25 = *(id *)(a1 + 56);
  uint64_t v26 = *(void *)(a1 + 32);
  id v35 = v25;
  v33[4] = v26;
  id v34 = *(id *)(a1 + 48);
  [v21 saveSaveRequest:v22 accountChangeItems:v20 listChangeItems:v19 listSectionChangeItems:v18 smartListChangeItems:v28 smartListSectionChangeItems:v30 templateChangeItems:v29 templateSectionChangeItems:v31 reminderChangeItems:v32 author:v27 replicaManagerProvider:v23 queue:v24 completion:v33];
}

id __43__REMSaveRequest_saveWithQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) notifyChangeDelegateForSaveSuccess:a2 == 0];
  id v4 = +[REMLogStore write];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B9AA2000, v4, OS_LOG_TYPE_DEFAULT, "os_transaction RELEASE {name: com.apple.reminderkit.REMSaveRequest}", v6, 2u);
  }

  return self;
}

- (BOOL)saveSynchronouslyWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__12;
  id v19 = __Block_byref_object_dispose__12;
  id v20 = 0;
  if ([(REMSaveRequest *)self _changeItemsAreAllEmpty])
  {
    id v5 = [(REMSaveRequest *)self author];
    if ([v5 isEqualToString:@"com.apple.eventkitsyncd"])
    {

LABEL_5:
      id v7 = +[REMLogStore write];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(REMSaveRequest *)self author];
        BOOL v9 = [(REMSaveRequest *)self saveIsNoopIfNoChangedKeys];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "Save Request has no changed keys. Opted to return early as no-op. {author: %{public}@, saveIsNoopIfNoChangedKeys: %d}", buf, 0x12u);
      }
      BOOL v10 = 1;
      goto LABEL_14;
    }
    BOOL v6 = [(REMSaveRequest *)self saveIsNoopIfNoChangedKeys];

    if (v6) {
      goto LABEL_5;
    }
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(REMSaveRequest *)self author];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_DEFAULT, "LOOKATME: Save Request has no changed keys. Save will continue. Revisit if caller should avoid such saves. {author: %{public}@}", buf, 0xCu);
    }
  }
  [(REMSaveRequest *)self setSaved:1];
  id v7 = _os_activity_create(&dword_1B9AA2000, "REMSaveRequest save sync", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  os_activity_scope_enter(v7, (os_activity_scope_state_t)buf);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__REMSaveRequest_saveSynchronouslyWithError___block_invoke;
  v14[3] = &unk_1E61DDB98;
  v14[4] = self;
  v14[5] = &v21;
  v14[6] = &v15;
  [(REMSaveRequest *)self _prepareSave:v14];
  if (a3) {
    *a3 = (id) v16[5];
  }
  BOOL v10 = *((unsigned char *)v22 + 24) != 0;
  os_activity_scope_leave((os_activity_scope_state_t)buf);
LABEL_14:

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v10;
}

void __45__REMSaveRequest_saveSynchronouslyWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v17 = *(void **)(a1 + 32);
  id v18 = a9;
  id v32 = a8;
  id v30 = a7;
  id v31 = a6;
  id v29 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = a2;
  uint64_t v33 = [v17 store];
  uint64_t v22 = *(void **)(a1 + 32);
  id v34 = [v22 author];
  uint64_t v23 = [*(id *)(a1 + 32) replicaManagerProvider];
  id v35 = 0;
  char v28 = [v33 saveSaveRequest:v22 accountChangeItems:v21 listChangeItems:v20 listSectionChangeItems:v19 smartListChangeItems:v29 smartListSectionChangeItems:v31 templateChangeItems:v30 templateSectionChangeItems:v32 reminderChangeItems:v18 author:v34 replicaManagerProvider:v23 error:&v35];

  id v24 = v35;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v28;

  uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;
  id v27 = v24;

  [*(id *)(a1 + 32) notifyChangeDelegateForSaveSuccess:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)notifyChangeDelegateForSaveSuccess:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(REMSaveRequest *)self saveRequestChangeEvents];
    if ([v4 count])
    {
      id v5 = [(REMSaveRequest *)self notifyChangeDelegate];

      if (v5)
      {
        BOOL v6 = +[REMLogStore write];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_DEFAULT, "notifyChangeDelegateForSaveSuccess: SHOULD_NOTIFY {name: com.apple.reminderkit.REMSaveRequest}", buf, 2u);
        }

        id v7 = [(REMSaveRequest *)self saveRequestChangeEvents];
        uint64_t v8 = (void *)[v7 copy];

        BOOL v9 = [(REMSaveRequest *)self notifyChangeDelegate];
        BOOL v10 = [v9 callbackQueue];

        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        uint64_t v15 = __53__REMSaveRequest_notifyChangeDelegateForSaveSuccess___block_invoke;
        id v16 = &unk_1E61DCB18;
        uint64_t v17 = self;
        id v18 = v8;
        id v11 = v8;
        dispatch_async(v10, &v13);
      }
    }
    else
    {
    }
  }
  id v12 = [(REMSaveRequest *)self saveRequestChangeEvents];
  [v12 removeAllObjects];
}

void __53__REMSaveRequest_notifyChangeDelegateForSaveSuccess___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) notifyChangeDelegate];
  [v2 notifyEventFromSaveRequest:*(void *)(a1 + 40)];
}

- (BOOL)_changeItemsAreAllEmpty
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v3 = [(REMSaveRequest *)self trackedAccountChangeItems];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v98 objects:v109 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v99;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v99 != v7) {
        objc_enumerationMutation(v4);
      }
      BOOL v9 = [*(id *)(*((void *)&v98 + 1) + 8 * v8) valueWithoutPerformingCopy];
      BOOL v10 = [v9 changedKeys];
      uint64_t v11 = [v10 count];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v98 objects:v109 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v12 = [(REMSaveRequest *)self trackedListChangeItems];
    id v4 = [v12 allValues];

    uint64_t v13 = [v4 countByEnumeratingWithState:&v94 objects:v108 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v95;
LABEL_11:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v95 != v15) {
          objc_enumerationMutation(v4);
        }
        uint64_t v17 = [*(id *)(*((void *)&v94 + 1) + 8 * v16) valueWithoutPerformingCopy];
        id v18 = [v17 changedKeys];
        uint64_t v19 = [v18 count];

        if (v19) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v4 countByEnumeratingWithState:&v94 objects:v108 count:16];
          if (v14) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v20 = [(REMSaveRequest *)self trackedSmartListChangeItems];
      id v4 = [v20 allValues];

      uint64_t v21 = [v4 countByEnumeratingWithState:&v90 objects:v107 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v91;
LABEL_19:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v91 != v23) {
            objc_enumerationMutation(v4);
          }
          uint64_t v25 = [*(id *)(*((void *)&v90 + 1) + 8 * v24) valueWithoutPerformingCopy];
          uint64_t v26 = [v25 changedKeys];
          uint64_t v27 = [v26 count];

          if (v27) {
            break;
          }
          if (v22 == ++v24)
          {
            uint64_t v22 = [v4 countByEnumeratingWithState:&v90 objects:v107 count:16];
            if (v22) {
              goto LABEL_19;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        char v28 = [(REMSaveRequest *)self trackedTemplateChangeItems];
        id v4 = [v28 allValues];

        uint64_t v29 = [v4 countByEnumeratingWithState:&v86 objects:v106 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v87;
LABEL_27:
          uint64_t v32 = 0;
          while (1)
          {
            if (*(void *)v87 != v31) {
              objc_enumerationMutation(v4);
            }
            uint64_t v33 = [*(id *)(*((void *)&v86 + 1) + 8 * v32) valueWithoutPerformingCopy];
            id v34 = [v33 changedKeys];
            uint64_t v35 = [v34 count];

            if (v35) {
              break;
            }
            if (v30 == ++v32)
            {
              uint64_t v30 = [v4 countByEnumeratingWithState:&v86 objects:v106 count:16];
              if (v30) {
                goto LABEL_27;
              }
              goto LABEL_33;
            }
          }
        }
        else
        {
LABEL_33:

          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          uint64_t v36 = [(REMSaveRequest *)self trackedReminderChangeItems];
          id v4 = [v36 allValues];

          uint64_t v37 = [v4 countByEnumeratingWithState:&v82 objects:v105 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v83;
LABEL_35:
            uint64_t v40 = 0;
            while (1)
            {
              if (*(void *)v83 != v39) {
                objc_enumerationMutation(v4);
              }
              uint64_t v41 = [*(id *)(*((void *)&v82 + 1) + 8 * v40) valueWithoutPerformingCopy];
              uint64_t v42 = [v41 changedKeys];
              uint64_t v43 = [v42 count];

              if (v43) {
                break;
              }
              if (v38 == ++v40)
              {
                uint64_t v38 = [v4 countByEnumeratingWithState:&v82 objects:v105 count:16];
                if (v38) {
                  goto LABEL_35;
                }
                goto LABEL_41;
              }
            }
          }
          else
          {
LABEL_41:

            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            uint64_t v44 = [(REMSaveRequest *)self trackedListSectionChangeItems];
            id v4 = [v44 allValues];

            uint64_t v45 = [v4 countByEnumeratingWithState:&v78 objects:v104 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v79;
LABEL_43:
              uint64_t v48 = 0;
              while (1)
              {
                if (*(void *)v79 != v47) {
                  objc_enumerationMutation(v4);
                }
                uint64_t v49 = [*(id *)(*((void *)&v78 + 1) + 8 * v48) valueWithoutPerformingCopy];
                uint64_t v50 = [v49 changedKeys];
                uint64_t v51 = [v50 count];

                if (v51) {
                  break;
                }
                if (v46 == ++v48)
                {
                  uint64_t v46 = [v4 countByEnumeratingWithState:&v78 objects:v104 count:16];
                  if (v46) {
                    goto LABEL_43;
                  }
                  goto LABEL_49;
                }
              }
            }
            else
            {
LABEL_49:

              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              uint64_t v52 = [(REMSaveRequest *)self trackedSmartListSectionChangeItems];
              id v4 = [v52 allValues];

              uint64_t v53 = [v4 countByEnumeratingWithState:&v74 objects:v103 count:16];
              if (v53)
              {
                uint64_t v54 = v53;
                uint64_t v55 = *(void *)v75;
LABEL_51:
                uint64_t v56 = 0;
                while (1)
                {
                  if (*(void *)v75 != v55) {
                    objc_enumerationMutation(v4);
                  }
                  uint64_t v57 = [*(id *)(*((void *)&v74 + 1) + 8 * v56) valueWithoutPerformingCopy];
                  uint64_t v58 = [v57 changedKeys];
                  uint64_t v59 = [v58 count];

                  if (v59) {
                    break;
                  }
                  if (v54 == ++v56)
                  {
                    uint64_t v54 = [v4 countByEnumeratingWithState:&v74 objects:v103 count:16];
                    if (v54) {
                      goto LABEL_51;
                    }
                    goto LABEL_57;
                  }
                }
              }
              else
              {
LABEL_57:

                long long v72 = 0u;
                long long v73 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                id v60 = [(REMSaveRequest *)self trackedTemplateSectionChangeItems];
                id v4 = [v60 allValues];

                uint64_t v61 = [v4 countByEnumeratingWithState:&v70 objects:v102 count:16];
                if (!v61)
                {
                  BOOL v68 = 1;
                  goto LABEL_67;
                }
                uint64_t v62 = v61;
                uint64_t v63 = *(void *)v71;
LABEL_59:
                uint64_t v64 = 0;
                while (1)
                {
                  if (*(void *)v71 != v63) {
                    objc_enumerationMutation(v4);
                  }
                  uint64_t v65 = [*(id *)(*((void *)&v70 + 1) + 8 * v64) valueWithoutPerformingCopy];
                  uint64_t v66 = [v65 changedKeys];
                  uint64_t v67 = [v66 count];

                  if (v67) {
                    break;
                  }
                  if (v62 == ++v64)
                  {
                    uint64_t v62 = [v4 countByEnumeratingWithState:&v70 objects:v102 count:16];
                    BOOL v68 = 1;
                    if (v62) {
                      goto LABEL_59;
                    }
                    goto LABEL_67;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v68 = 0;
LABEL_67:

  return v68;
}

- (void)_prepareSave:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  long long v74 = (void (**)(id, void *, void *, void *, void *, void *, void *, void *, void *))a3;
  if (!v74) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "saveBlock");
  }
  [(REMSaveRequest *)self performPreSaveActions];
  id v4 = [(REMSaveRequest *)self trackedAccountChangeItems];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [(REMSaveRequest *)self trackedListChangeItems];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [(REMSaveRequest *)self trackedSmartListChangeItems];
  BOOL v9 = [v8 allValues];

  BOOL v10 = [(REMSaveRequest *)self trackedTemplateChangeItems];
  uint64_t v11 = [v10 allValues];

  id v12 = [(REMSaveRequest *)self trackedReminderChangeItems];
  uint64_t v13 = [v12 allValues];

  uint64_t v14 = [(REMSaveRequest *)self trackedListSectionChangeItems];
  long long v69 = [v14 allValues];

  uint64_t v15 = [(REMSaveRequest *)self trackedSmartListSectionChangeItems];
  id v75 = [v15 allValues];

  uint64_t v16 = [(REMSaveRequest *)self trackedTemplateSectionChangeItems];
  long long v72 = [v16 allValues];

  long long v81 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id obj = v5;
  uint64_t v17 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v111;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v111 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = [*(id *)(*((void *)&v110 + 1) + 8 * i) valueForSaveRequest:self];
        [v81 addObject:v21];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
    }
    while (v18);
  }

  long long v80 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v22 = v7;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v106 objects:v120 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v107;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v107 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = [*(id *)(*((void *)&v106 + 1) + 8 * j) valueForSaveRequest:self];
        [v80 addObject:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v106 objects:v120 count:16];
    }
    while (v24);
  }

  long long v79 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v28 = v9;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v102 objects:v119 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v103;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v103 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = [*(id *)(*((void *)&v102 + 1) + 8 * k) valueForSaveRequest:self];
        [v79 addObject:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v102 objects:v119 count:16];
    }
    while (v30);
  }

  long long v78 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v34 = v11;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v98 objects:v118 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v99;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v99 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = [*(id *)(*((void *)&v98 + 1) + 8 * m) valueForSaveRequest:self];
        [v78 addObject:v39];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v98 objects:v118 count:16];
    }
    while (v36);
  }
  BOOL v68 = v34;

  uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v41 = v13;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v94 objects:v117 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v95;
    do
    {
      for (uint64_t n = 0; n != v43; ++n)
      {
        if (*(void *)v95 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = [*(id *)(*((void *)&v94 + 1) + 8 * n) valueForSaveRequest:self];
        [v40 addObject:v46];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v94 objects:v117 count:16];
    }
    while (v43);
  }
  long long v71 = v28;
  long long v73 = v22;

  uint64_t v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v69, "count"));
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v48 = v69;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v90 objects:v116 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v91;
    do
    {
      for (iuint64_t i = 0; ii != v50; ++ii)
      {
        if (*(void *)v91 != v51) {
          objc_enumerationMutation(v48);
        }
        uint64_t v53 = [*(id *)(*((void *)&v90 + 1) + 8 * ii) valueForSaveRequest:self];
        [v47 addObject:v53];
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v90 objects:v116 count:16];
    }
    while (v50);
  }
  long long v70 = v41;

  uint64_t v54 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v75, "count"));
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v76 = v75;
  uint64_t v55 = [v76 countByEnumeratingWithState:&v86 objects:v115 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v87;
    do
    {
      for (juint64_t j = 0; jj != v56; ++jj)
      {
        if (*(void *)v87 != v57) {
          objc_enumerationMutation(v76);
        }
        uint64_t v59 = [*(id *)(*((void *)&v86 + 1) + 8 * jj) valueForSaveRequest:self];
        [v54 addObject:v59];
      }
      uint64_t v56 = [v76 countByEnumeratingWithState:&v86 objects:v115 count:16];
    }
    while (v56);
  }
  uint64_t v67 = v48;

  id v60 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v72, "count"));
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v61 = v72;
  uint64_t v62 = [v61 countByEnumeratingWithState:&v82 objects:v114 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v83;
    do
    {
      for (kuint64_t k = 0; kk != v63; ++kk)
      {
        if (*(void *)v83 != v64) {
          objc_enumerationMutation(v61);
        }
        uint64_t v66 = [*(id *)(*((void *)&v82 + 1) + 8 * kk) valueForSaveRequest:self];
        [v60 addObject:v66];
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v82 objects:v114 count:16];
    }
    while (v63);
  }

  [(REMSaveRequest *)self _willSaveAccountChangeItems:v81 listChangeItems:v80 listSectionChangeItems:v47 smartListChangeItems:v79 smartListSectionChangeItems:v54 templateChangeItems:v78 templateSectionChangeItems:v60 reminderChangeItems:v40];
  v74[2](v74, v81, v80, v47, v79, v54, v78, v60, v40);
}

- (void)performPreSaveActions
{
  if ([(REMSaveRequest *)self cloneCompletedRecurrentRemindersAtSave]) {
    id v3 = [(REMSaveRequest *)self advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks];
  }
}

- (void)preFetchDueDateDeltaAlertsForCompletedRecurrenceClone
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 allKeys];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_ERROR, "preFetchDueDateDeltaAlertsForCompletedRecurrenceClone - Error fetching dueDateDeltaAlerts for reminders {error: %{public}@, reminderIDs: %{public}@}", (uint8_t *)&v6, 0x16u);
}

- (void)preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v45 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "%{public}@: Preflight - Collect parentsOfRecurrentSubtasks", buf, 0xCu);
  }
  uint64_t v32 = v4;

  int v6 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v7 = [(REMSaveRequest *)self trackedReminderChangeItems];
  __int16 v8 = objc_msgSend(v6, "setWithCapacity:", objc_msgSend(v7, "count"));

  BOOL v9 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v10 = [(REMSaveRequest *)self trackedReminderChangeItems];
  uint64_t v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v38 + 1) + 8 * i) valueForSaveRequest:self];
        uint64_t v17 = [v16 objectID];
        [v8 addObject:v17];

        if ([v16 isCompleted])
        {
          uint64_t v18 = [v16 recurrenceRules];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            id v20 = [v16 parentReminderID];
            if (v20) {
              [v9 addObject:v20];
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v13);
  }

  uint64_t v21 = +[REMLogStore write];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v45 = v32;
    _os_log_impl(&dword_1B9AA2000, v21, OS_LOG_TYPE_INFO, "%{public}@: Preflight -  Fetch and update parents of recurrent subtasks", buf, 0xCu);
  }

  [v9 minusSet:v8];
  if ([v9 count])
  {
    id v22 = [(REMSaveRequest *)self store];
    uint64_t v23 = [v9 allObjects];
    id v37 = 0;
    uint64_t v24 = [v22 fetchRemindersWithObjectIDs:v23 error:&v37];
    id v25 = v37;

    if (v25)
    {
      uint64_t v26 = +[REMLogStore write];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[REMSaveRequest preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:]();
      }
    }
    else
    {
      if (![v24 count]) {
        goto LABEL_22;
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v26 = [v24 objectEnumerator];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = [(REMSaveRequest *)self updateReminder:*(void *)(*((void *)&v33 + 1) + 8 * j)];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v28);
      }
    }

LABEL_22:
  }
}

- (id)advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = &off_1E61DB000;
  id v4 = +[REMLogStore write];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9AA2000, v4, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Started advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks", buf, 2u);
  }

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "rem_now");
  id v37 = objc_opt_new();
  [(REMSaveRequest *)self preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:@"IncompleteRecurrenceClone"];
  int v6 = +[REMLogStore write];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Incomplete Duplicate and Advance Forward", buf, 2u);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = [(REMSaveRequest *)self trackedReminderChangeItems];
  __int16 v8 = [v7 allValues];

  uint64_t v39 = [v8 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v39)
  {
    uint64_t v9 = *(void *)v41;
    long long v35 = v5;
    long long v36 = self;
    uint64_t v38 = *(void *)v41;
    long long v34 = v8;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v11 = [*(id *)(*((void *)&v40 + 1) + 8 * v10) valueForSaveRequest:self];
        uint64_t v12 = [v3[258] write];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [v11 objectID];
          *(_DWORD *)buf = 138543362;
          id v45 = v13;
          _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Performing check for has recurrenceRules {reminderID: %{public}@};",
            buf,
            0xCu);
        }
        uint64_t v14 = [v11 recurrenceRules];
        uint64_t v15 = [v14 count];

        if (v15)
        {
          uint64_t v16 = [v11 dueDateComponents];
          [v11 nextRecurrentAdvanceAmountForDateComponents:v16 afterDate:v5];
          double v18 = v17;

          if (v18 <= 0.0)
          {
            uint64_t v19 = [v3[258] write];
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
              goto LABEL_25;
            }
            id v20 = [v11 objectID];
            *(_DWORD *)buf = 138543618;
            id v45 = v20;
            __int16 v46 = 2048;
            *(double *)uint64_t v47 = v18;
            _os_log_fault_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_FAULT, "IncompleteRecurrenceClone: Unable to clone recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", buf, 0x16u);
          }
          else
          {
            uint64_t v19 = +[REMReminder newObjectID];
            id v20 = [v11 duplicateForRecurrenceUsingReminderID:v19];
            if (v20)
            {
              uint64_t v21 = [v11 objectID];
              [v37 setObject:v20 forKeyedSubscript:v21];

              [v11 cleanupDuplicate:v20 markAsCompleted:0];
              [v11 advanceForwardToNextRecurrenceAfterDate:v5];
            }
            else
            {
              id v31 = [v3[258] write];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
                [(REMSaveRequest *)(uint64_t)v52 advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks];
              }
            }
          }
        }
        else
        {
          id v22 = [v11 recurrenceRules];
          uint64_t v19 = [v22 firstObject];

          uint64_t v23 = [v3[258] write];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = [v11 objectID];
            int v25 = [v11 isCompleted];
            uint64_t v26 = [v19 objectID];
            uint64_t v27 = [v19 iCalendarDescription];
            uint64_t v28 = NSNumber;
            uint64_t v29 = [v11 recurrenceRules];
            uint64_t v30 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
            *(_DWORD *)buf = 138544386;
            id v45 = v24;
            __int16 v46 = 1026;
            *(_DWORD *)uint64_t v47 = v25;
            __int16 v8 = v34;
            *(_WORD *)&v47[4] = 2114;
            *(void *)&v47[6] = v26;
            __int16 v48 = 2114;
            uint64_t v49 = v27;
            __int16 v50 = 2114;
            uint64_t v51 = v30;
            _os_log_impl(&dword_1B9AA2000, v23, OS_LOG_TYPE_INFO, "IncompleteRecurrenceClone: Skipping advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks to advance forward date alarm for reminder, didn't meet conditions for hasRecurrenceRules {reminderID: %{public}@, isCompleted:%{public}i, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@, ruleCount: %{public}@};",
              buf,
              0x30u);

            uint64_t v5 = v35;
            self = v36;

            id v3 = &off_1E61DB000;
          }

          uint64_t v9 = v38;
        }
LABEL_25:

        ++v10;
      }
      while (v39 != v10);
      uint64_t v39 = [v8 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v39);
  }

  uint64_t v32 = (void *)[v37 copy];

  return v32;
}

- (id)advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks
{
  return [(REMSaveRequest *)self advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:0];
}

- (id)advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v62 = (void (**)(id, void *))a3;
  id v4 = &off_1E61DB000;
  uint64_t v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Started advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate", buf, 2u);
  }

  id v60 = objc_opt_new();
  [(REMSaveRequest *)self preFetchDueDateDeltaAlertsForCompletedRecurrenceClone];
  [(REMSaveRequest *)self preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:@"CompletedRecurrenceClone"];
  int v6 = +[REMLogStore write];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Complete Duplicate and Advance Forward", buf, 2u);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  uint64_t v7 = [(REMSaveRequest *)self trackedReminderChangeItems];
  __int16 v8 = [v7 allValues];

  id obj = v8;
  uint64_t v67 = [v8 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v69;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v69 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v68 + 1) + 8 * v9) valueForSaveRequest:self];
        uint64_t v11 = [v4[258] write];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = [v10 objectID];
          *(_DWORD *)buf = 138543362;
          long long v74 = v12;
          _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Performing check for isCompleted and has recurrenceRules {reminderID: %{public}@};",
            buf,
            0xCu);
        }
        uint64_t v13 = [v10 changedKeys];
        if (![v13 containsObject:@"completed"]
          || ([v10 isCompleted] & 1) == 0)
        {

LABEL_23:
          long long v34 = [v10 recurrenceRules];
          double v17 = [v34 firstObject];

          long long v35 = [v4[258] write];
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
            goto LABEL_26;
          }
          long long v36 = [v10 objectID];
          uint64_t v37 = v9;
          int v38 = [v10 isCompleted];
          uint64_t v39 = [v17 objectID];
          long long v40 = [v17 iCalendarDescription];
          long long v41 = NSNumber;
          [v10 recurrenceRules];
          uint64_t v65 = v17;
          v43 = long long v42 = self;
          uint64_t v44 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
          *(_DWORD *)buf = 138544386;
          long long v74 = v36;
          __int16 v75 = 1026;
          *(_DWORD *)id v76 = v38;
          uint64_t v9 = v37;
          *(_WORD *)&v76[4] = 2114;
          *(void *)&v76[6] = v39;
          *(_WORD *)&v76[14] = 2114;
          *(void *)&v76[16] = v40;
          *(_WORD *)&v76[24] = 2114;
          *(void *)&v76[26] = v44;
          _os_log_impl(&dword_1B9AA2000, v35, OS_LOG_TYPE_INFO, "CompletedRecurrenceClone: Skipping advanceForwardRecurrenceAfterNowAndAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasks to advance forward date alarm for reminder, didn't meet conditions for isCompleted and hasRecurrenceRules {reminderID: %{public}@, isCompleted:%{public}i, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@, ruleCount: %{public}@};",
            buf,
            0x30u);

          id v4 = &off_1E61DB000;
          self = v42;
          double v17 = v65;

LABEL_25:
          goto LABEL_26;
        }
        uint64_t v14 = [v10 recurrenceRules];
        uint64_t v15 = [v14 count];

        if (!v15) {
          goto LABEL_23;
        }
        if (!v62
          || ([v10 objectID],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              v62[2](v62, v16),
              double v17 = objc_claimAutoreleasedReturnValue(),
              v16,
              !v17))
        {
          double v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "rem_now");
        }
        double v18 = [v10 dueDateComponents];
        [v10 nextRecurrentAdvanceAmountForDateComponents:v18 afterDate:v17];
        double v20 = v19;

        if (v20 <= 0.0)
        {
          long long v35 = [v4[258] write];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            long long v36 = [v10 objectID];
            *(_DWORD *)buf = 138543618;
            long long v74 = v36;
            __int16 v75 = 2048;
            *(double *)id v76 = v20;
            _os_log_fault_impl(&dword_1B9AA2000, v35, OS_LOG_TYPE_FAULT, "CompletedRecurrenceClone: Unable to clone recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", buf, 0x16u);
            goto LABEL_25;
          }
        }
        else
        {
          uint64_t v61 = v9;
          uint64_t v21 = [v10 dueDateComponents];
          id v22 = [v21 timeZone];
          uint64_t v23 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
          int v24 = [v22 isEqual:v23];

          if (v24)
          {
            uint64_t v64 = v17;
            int v25 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
            uint64_t v26 = [v10 dueDateComponents];
            uint64_t v27 = (void *)MEMORY[0x1E4F1C9D8];
            uint64_t v28 = v10;
            uint64_t v29 = [v10 dueDateComponents];
            uint64_t v30 = objc_msgSend(v27, "rem_dateWithDateComponents:timeZone:", v29, v25);

            id v31 = [v25 nextDaylightSavingTimeTransitionAfterDate:v30];
            uint64_t v32 = v31;
            if (v31)
            {
              id v33 = v31;
            }
            else
            {
              id v33 = [MEMORY[0x1E4F1C9C8] distantFuture];
            }
            id v45 = v33;

            [v45 timeIntervalSinceDate:v30];
            if (v46 < v20)
            {
              uint64_t v47 = [v4[258] write];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v48 = [v10 objectID];
                uint64_t v59 = objc_msgSend(v26, "rem_stringRepresentation");
                *(_DWORD *)buf = 138544386;
                long long v74 = v48;
                __int16 v75 = 2114;
                *(void *)id v76 = v25;
                *(_WORD *)&v76[8] = 2114;
                *(void *)&v76[10] = v59;
                *(_WORD *)&v76[18] = 2114;
                *(void *)&v76[20] = v45;
                *(_WORD *)&v76[28] = 2048;
                *(double *)&v76[30] = v20;
                _os_log_impl(&dword_1B9AA2000, v47, OS_LOG_TYPE_DEFAULT, "CompletedRecurrenceClone: FYI we are advancing a GMT due date across a DST boundary, this user maybe impacted by an hour drift caused by loss of user original due date time zone. {reminderID: %{public}@, userTimeZone: %{public}@, dueDateComponents(before): %{public}@, nextDSTDate: %{public}@, dueDateAdvanceAmount: %f}", buf, 0x34u);
              }
            }

            uint64_t v10 = v28;
            double v17 = v64;
          }
          long long v35 = +[REMReminder newObjectID];
          uint64_t v49 = objc_msgSend(v10, "duplicateForRecurrenceUsingReminderID:");
          if (v49)
          {
            __int16 v50 = [v10 objectID];
            [v60 setObject:v49 forKeyedSubscript:v50];

            [v10 cleanupDuplicate:v49 markAsCompleted:1];
            [v10 setCompleted:0];
            uint64_t v51 = [v10 recurrenceRules];
            uint64_t v52 = v17;
            [v10 advanceForwardToNextRecurrenceAfterDate:v17];
            uint64_t v53 = v10;
            uint64_t v54 = [v10 displayDate];
            uint64_t v55 = [v54 date];

            [v49 setAlternativeDisplayDateDateForCalendarToPreviousRecurrentDateBefore:v55 recurrenceRules:v51];
          }
          else
          {
            uint64_t v52 = v17;
            uint64_t v53 = v10;
            uint64_t v51 = [v4[258] write];
            if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
              -[REMSaveRequest advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:]((uint64_t)v72, (uint64_t)v10);
            }
          }
          uint64_t v9 = v61;

          uint64_t v10 = v53;
          double v17 = v52;
        }
LABEL_26:

        ++v9;
      }
      while (v67 != v9);
      uint64_t v56 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
      uint64_t v67 = v56;
    }
    while (v56);
  }

  [(REMSaveRequest *)self setCloneCompletedRecurrentRemindersAtSave:0];
  uint64_t v57 = (void *)[v60 copy];

  return v57;
}

- (id)_trackedAccountChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedAccountChangeItems];
    int v6 = [v5 objectForKeyedSubscript:v4];

    uint64_t v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_trackAccountChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:]();
    }

    uint64_t v11 = "accountChangeItem";
    goto LABEL_7;
  }
  int v6 = [v4 objectID];

  if (v6)
  {
    uint64_t v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedAccountChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackAccountChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "accountChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (void)_updateTrackedAccountChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v15 = +[REMLogStore write];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest addListWithName:toAccountChangeItem:listObjectID:]();
    }

    uint64_t v16 = "accountChangeItem";
    goto LABEL_15;
  }
  __int16 v8 = [v6 objectID];

  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = [(REMSaveRequest *)self trackedAccountChangeItems];
      uint64_t v10 = [v6 objectID];
      uint64_t v11 = [v9 objectForKeyedSubscript:v10];

      uint64_t v12 = [(REMSaveRequest *)self trackedAccountChangeItems];
      uint64_t v13 = [v6 objectID];
      [v12 removeObjectForKey:v13];

      [v6 setObjectID:v7];
      uint64_t v14 = [(REMSaveRequest *)self trackedAccountChangeItems];
      [v14 setObject:v11 forKeyedSubscript:v7];

      goto LABEL_16;
    }
    double v19 = +[REMLogStore write];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:]();
    }

    uint64_t v16 = "newObjectID";
LABEL_15:
    NSLog(&cfstr_SIsUnexpectedl.isa, v16);
    goto LABEL_16;
  }
  double v17 = +[REMLogStore write];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackAccountChangeItem:]();
  }

  double v18 = [v6 objectID];

  if (!v18)
  {
    uint64_t v16 = "accountChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_trackedListChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedListChangeItems];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v7 = 0;
  }

  return v7;
}

- (void)_trackListChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateAccountWithListChangeItem:]();
    }

    uint64_t v11 = "listChangeItem";
    goto LABEL_7;
  }
  id v6 = [v4 objectID];

  if (v6)
  {
    id v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedListChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackListChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "listChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (void)_updateTrackedListChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v15 = +[REMLogStore write];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateAccountWithListChangeItem:]();
    }

    uint64_t v16 = "listChangeItem";
    goto LABEL_15;
  }
  __int16 v8 = [v6 objectID];

  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = [(REMSaveRequest *)self trackedListChangeItems];
      uint64_t v10 = [v6 objectID];
      uint64_t v11 = [v9 objectForKeyedSubscript:v10];

      uint64_t v12 = [(REMSaveRequest *)self trackedListChangeItems];
      uint64_t v13 = [v6 objectID];
      [v12 removeObjectForKey:v13];

      [v6 setObjectID:v7];
      uint64_t v14 = [(REMSaveRequest *)self trackedListChangeItems];
      [v14 setObject:v11 forKeyedSubscript:v7];

      goto LABEL_16;
    }
    double v19 = +[REMLogStore write];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:]();
    }

    uint64_t v16 = "newObjectID";
LABEL_15:
    NSLog(&cfstr_SIsUnexpectedl.isa, v16);
    goto LABEL_16;
  }
  double v17 = +[REMLogStore write];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackListChangeItem:]();
  }

  double v18 = [v6 objectID];

  if (!v18)
  {
    uint64_t v16 = "listChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_trackedSmartListChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedSmartListChangeItems];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v7 = 0;
  }

  return v7;
}

- (void)_trackSmartListChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackSmartListChangeItem:]();
    }

    uint64_t v11 = "smartListChangeItem";
    goto LABEL_7;
  }
  id v6 = [v4 objectID];

  if (v6)
  {
    id v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedSmartListChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackSmartListChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "smartListChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (void)_updateTrackedSmartListChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v15 = +[REMLogStore write];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackSmartListChangeItem:]();
    }

    uint64_t v16 = "smartListChangeItem";
    goto LABEL_15;
  }
  __int16 v8 = [v6 objectID];

  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = [(REMSaveRequest *)self trackedSmartListChangeItems];
      uint64_t v10 = [v6 objectID];
      uint64_t v11 = [v9 objectForKeyedSubscript:v10];

      uint64_t v12 = [(REMSaveRequest *)self trackedSmartListChangeItems];
      uint64_t v13 = [v6 objectID];
      [v12 removeObjectForKey:v13];

      [v6 setObjectID:v7];
      uint64_t v14 = [(REMSaveRequest *)self trackedSmartListChangeItems];
      [v14 setObject:v11 forKeyedSubscript:v7];

      goto LABEL_16;
    }
    double v19 = +[REMLogStore write];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:]();
    }

    uint64_t v16 = "newObjectID";
LABEL_15:
    NSLog(&cfstr_SIsUnexpectedl.isa, v16);
    goto LABEL_16;
  }
  double v17 = +[REMLogStore write];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackSmartListChangeItem:]();
  }

  double v18 = [v6 objectID];

  if (!v18)
  {
    uint64_t v16 = "smartListChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_trackedTemplateChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedTemplateChangeItems];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v7 = 0;
  }

  return v7;
}

- (void)_trackTemplateChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackTemplateChangeItem:]();
    }

    uint64_t v11 = "templateChangeItem";
    goto LABEL_7;
  }
  id v6 = [v4 objectID];

  if (v6)
  {
    id v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedTemplateChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackTemplateChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "templateChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (void)_trackListSectionChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackListSectionChangeItem:]();
    }

    uint64_t v11 = "listSectionChangeItem";
    goto LABEL_7;
  }
  id v6 = [v4 objectID];

  if (v6)
  {
    id v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedListSectionChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackListSectionChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "listSectionChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (id)_trackedListSectionChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedListSectionChangeItems];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v7 = 0;
  }

  return v7;
}

- (void)_trackSmartListSectionChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackSmartListSectionChangeItem:]();
    }

    uint64_t v11 = "smartListSectionChangeItem";
    goto LABEL_7;
  }
  id v6 = [v4 objectID];

  if (v6)
  {
    id v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedSmartListSectionChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackSmartListSectionChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "smartListSectionChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (id)_trackedSmartListSectionChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedSmartListSectionChangeItems];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v7 = 0;
  }

  return v7;
}

- (void)_trackTemplateSectionChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackTemplateSectionChangeItem:]();
    }

    uint64_t v11 = "templateSectionChangeItem";
    goto LABEL_7;
  }
  id v6 = [v4 objectID];

  if (v6)
  {
    id v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedTemplateSectionChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackTemplateSectionChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "templateSectionChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (id)_trackedTemplateSectionChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedTemplateSectionChangeItems];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v7 = 0;
  }

  return v7;
}

- (id)_trackedReminderChangeItemForObjectID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(REMSaveRequest *)self trackedReminderChangeItems];
    id v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [v6 valueForSaveRequest:self];
  }
  else
  {
    __int16 v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    id v7 = 0;
  }

  return v7;
}

- (void)_trackReminderChangeItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackReminderChangeItem:]();
    }

    uint64_t v11 = "reminderChangeItem";
    goto LABEL_7;
  }
  id v6 = [v4 objectID];

  if (v6)
  {
    id v7 = [[REMSaveRequestTrackedValueContainer alloc] initWithValue:v5];
    __int16 v8 = [(REMSaveRequest *)self trackedReminderChangeItems];
    uint64_t v9 = [v5 objectID];
    [v8 setObject:v7 forKeyedSubscript:v9];

    goto LABEL_11;
  }
  uint64_t v12 = +[REMLogStore write];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackReminderChangeItem:]();
  }

  uint64_t v13 = [v5 objectID];

  if (!v13)
  {
    uint64_t v11 = "reminderChangeItem.objectID";
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, v11);
  }
LABEL_11:
}

- (void)_updateTrackedReminderChangeItem:(id)a3 withObjectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v15 = +[REMLogStore write];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackReminderChangeItem:]();
    }

    uint64_t v16 = "reminderChangeItem";
    goto LABEL_15;
  }
  __int16 v8 = [v6 objectID];

  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = [(REMSaveRequest *)self trackedReminderChangeItems];
      uint64_t v10 = [v6 objectID];
      uint64_t v11 = [v9 objectForKeyedSubscript:v10];

      uint64_t v12 = [(REMSaveRequest *)self trackedReminderChangeItems];
      uint64_t v13 = [v6 objectID];
      [v12 removeObjectForKey:v13];

      [v6 setObjectID:v7];
      uint64_t v14 = [(REMSaveRequest *)self trackedReminderChangeItems];
      [v14 setObject:v11 forKeyedSubscript:v7];

      goto LABEL_16;
    }
    double v19 = +[REMLogStore write];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateTrackedAccountChangeItem:withObjectID:]();
    }

    uint64_t v16 = "newObjectID";
LABEL_15:
    NSLog(&cfstr_SIsUnexpectedl.isa, v16);
    goto LABEL_16;
  }
  double v17 = +[REMLogStore write];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[REMSaveRequest _trackReminderChangeItem:]();
  }

  double v18 = [v6 objectID];

  if (!v18)
  {
    uint64_t v16 = "reminderChangeItem.objectID";
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_trackAccountCapabilities:(id)a3 forObjectID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _trackAccountCapabilities:forObjectID:]();
    }

    uint64_t v12 = "accountCapabilities";
    goto LABEL_12;
  }
  __int16 v8 = +[REMLogStore write];
  uint64_t v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    uint64_t v12 = "objectID";
LABEL_12:
    NSLog(&cfstr_SIsUnexpectedl.isa, v12);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl(&dword_1B9AA2000, v9, OS_LOG_TYPE_DEBUG, "_trackAccountCapabilities {SaveRequest: %@ accountCapabilities: %@ objectID: %@", buf, 0x20u);
  }

  uint64_t v10 = [(REMSaveRequest *)self trackedAccountCapabilities];
  [v10 setObject:v6 forKeyedSubscript:v7];

LABEL_13:
}

- (id)_trackedAccountCapabilitiesForObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[REMLogStore write];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[REMSaveRequest _trackedAccountCapabilitiesForObjectID:]();
    }

    id v7 = [(REMSaveRequest *)self trackedAccountCapabilities];
    __int16 v8 = [v7 objectForKeyedSubscript:v4];

    if (v8)
    {
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v11 = +[REMLogStore write];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[REMSaveRequest _trackedAccountCapabilitiesForObjectID:]();
      }

      uint64_t v9 = [[REMAccountCapabilities alloc] initWithAccountType:0];
    }
    uint64_t v10 = v9;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_copyReminder:(id)a3 toListChangeItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    double v20 = +[REMLogStore write];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _copyReminder:toListChangeItem:]();
    }

    uint64_t v21 = "original";
    goto LABEL_14;
  }
  if (!v7)
  {
    id v22 = +[REMLogStore write];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateAccountWithListChangeItem:]();
    }

    uint64_t v21 = "listChangeItem";
LABEL_14:
    NSLog(&cfstr_SIsUnexpectedl.isa, v21);
    uint64_t v19 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = [v7 saveRequest];

  uint64_t v10 = (void *)MEMORY[0x1E4F1C3B8];
  if (v9 != self)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = [v8 saveRequest];
    [v11 raise:v12, @"List has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}", v8, v13, self format];
  }
  if ([v8 isGroup]) {
    [MEMORY[0x1E4F1CA00] raise:*v10, @"listChangeItem is a group and adding reminder to group is not currently supported {listChangeItem: %@}", v8 format];
  }
  uint64_t v14 = [REMReminderChangeItem alloc];
  __int16 v15 = [v6 storage];
  id v16 = [v6 account];
  __int16 v17 = [v16 capabilities];
  id v18 = [(REMReminderChangeItem *)v14 initWithSaveRequest:self storage:v15 accountCapabilities:v17 observeInitialValues:0];

  uint64_t v19 = [[REMReminderChangeItem alloc] initWithReminderChangeItem:v18 insertIntoListChangeItem:v8];
  [(REMSaveRequest *)self _trackReminderChangeItem:v19];

LABEL_15:
  return v19;
}

- (id)_copyReminder:(id)a3 toReminderSubtaskContextChangeItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    double v20 = +[REMLogStore write];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _copyReminder:toListChangeItem:]();
    }

    uint64_t v21 = "original";
    goto LABEL_12;
  }
  if (!v7)
  {
    id v22 = +[REMLogStore write];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _copyReminder:toReminderSubtaskContextChangeItem:]();
    }

    uint64_t v21 = "parentReminderSubtaskContextChangeItem";
LABEL_12:
    NSLog(&cfstr_SIsUnexpectedl.isa, v21);
    uint64_t v19 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = [v7 reminderChangeItem];
  uint64_t v10 = [v9 saveRequest];

  if (v10 != self)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = [v9 saveRequest];
    [v11 raise:v12, @"Parent reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}", v9, v13, self format];
  }
  uint64_t v14 = [REMReminderChangeItem alloc];
  __int16 v15 = [v6 storage];
  id v16 = [v6 account];
  __int16 v17 = [v16 capabilities];
  id v18 = [(REMReminderChangeItem *)v14 initWithSaveRequest:self storage:v15 accountCapabilities:v17 observeInitialValues:0];

  uint64_t v19 = [[REMReminderChangeItem alloc] initWithReminderChangeItem:v18 insertIntoParentReminderSubtaskContextChangeItem:v8];
  [(REMSaveRequest *)self _trackReminderChangeItem:v19];

LABEL_13:
  return v19;
}

- (id)_copyReminderChangeItem:(id)a3 toListChangeItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    uint64_t v19 = +[REMLogStore write];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _copyReminder:toListChangeItem:]();
    }

    double v20 = "original";
    goto LABEL_16;
  }
  if (!v7)
  {
    uint64_t v21 = +[REMLogStore write];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _updateAccountWithListChangeItem:]();
    }

    double v20 = "listChangeItem";
LABEL_16:
    NSLog(&cfstr_SIsUnexpectedl.isa, v20);
    id v18 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = [v6 saveRequest];

  uint64_t v10 = (uint64_t *)MEMORY[0x1E4F1C3B8];
  if (v9 != self)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = [v6 saveRequest];
    [v11 raise:v12, @"Original reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}", v6, v13, self format];
  }
  uint64_t v14 = [v8 saveRequest];

  if (v14 != self)
  {
    __int16 v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *v10;
    __int16 v17 = [v8 saveRequest];
    [v15 raise:v16, @"List has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}", v8, v17, self format];
  }
  if ([v8 isGroup]) {
    [MEMORY[0x1E4F1CA00] raise:*v10, @"listChangeItem is a group and adding reminder to group is not currently supported {listChangeItem: %@}", v8 format];
  }
  id v18 = [[REMReminderChangeItem alloc] initWithReminderChangeItem:v6 insertIntoListChangeItem:v8];
  [(REMSaveRequest *)self _trackReminderChangeItem:v18];
LABEL_17:

  return v18;
}

- (id)_copyReminderChangeItem:(id)a3 toReminderSubtaskContextChangeItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6)
  {
    double v20 = +[REMLogStore write];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _copyReminder:toListChangeItem:]();
    }

    uint64_t v21 = "original";
    goto LABEL_14;
  }
  if (!v7)
  {
    id v22 = +[REMLogStore write];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[REMSaveRequest _copyReminder:toReminderSubtaskContextChangeItem:]();
    }

    uint64_t v21 = "parentReminderSubtaskContextChangeItem";
LABEL_14:
    NSLog(&cfstr_SIsUnexpectedl.isa, v21);
    uint64_t v19 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = [v6 saveRequest];

  uint64_t v10 = (uint64_t *)MEMORY[0x1E4F1C3B8];
  if (v9 != self)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = [v6 saveRequest];
    [v11 raise:v12, @"Original reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}", v6, v13, self format];
  }
  uint64_t v14 = [v8 reminderChangeItem];
  __int16 v15 = [v14 saveRequest];

  if (v15 != self)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *v10;
    id v18 = [v14 saveRequest];
    [v16 raise:v17, @"Parent reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}", v14, v18, self format];
  }
  uint64_t v19 = [[REMReminderChangeItem alloc] initWithReminderChangeItem:v6 insertIntoParentReminderSubtaskContextChangeItem:v8];
  [(REMSaveRequest *)self _trackReminderChangeItem:v19];

LABEL_15:
  return v19;
}

- (REMStore)store
{
  return self->_store;
}

- (NSMutableDictionary)trackedTemplateChangeItems
{
  return self->_trackedTemplateChangeItems;
}

- (NSMutableDictionary)trackedListSectionChangeItems
{
  return self->_trackedListSectionChangeItems;
}

- (NSMutableDictionary)trackedSmartListSectionChangeItems
{
  return self->_trackedSmartListSectionChangeItems;
}

- (NSMutableDictionary)trackedTemplateSectionChangeItems
{
  return self->_trackedTemplateSectionChangeItems;
}

- (NSMutableSet)saveRequestChangeEvents
{
  return self->_saveRequestChangeEvents;
}

- (void)setSaveRequestChangeEvents:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (BOOL)isSaved
{
  return self->_saved;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
}

- (NSMutableDictionary)trackedAccountChangeItems
{
  return self->_trackedAccountChangeItems;
}

- (NSMutableDictionary)trackedListChangeItems
{
  return self->_trackedListChangeItems;
}

- (NSMutableDictionary)trackedSmartListChangeItems
{
  return self->_trackedSmartListChangeItems;
}

- (NSMutableDictionary)trackedReminderChangeItems
{
  return self->_trackedReminderChangeItems;
}

- (NSMutableDictionary)trackedAccountCapabilities
{
  return self->_trackedAccountCapabilities;
}

- (BOOL)updateLastModifiedDates
{
  return self->_updateLastModifiedDates;
}

- (void)setUpdateLastModifiedDates:(BOOL)a3
{
  self->_updateLastModifiedDates = a3;
}

- (BOOL)saveIsNoopIfNoChangedKeys
{
  return self->_saveIsNoopIfNoChangedKeys;
}

- (void)setSaveIsNoopIfNoChangedKeys:(BOOL)a3
{
  self->_saveIsNoopIfNoChangedKeys = a3;
}

- (BOOL)cloneCompletedRecurrentRemindersAtSave
{
  return self->_cloneCompletedRecurrentRemindersAtSave;
}

- (void)setCloneCompletedRecurrentRemindersAtSave:(BOOL)a3
{
  self->_cloneCompletedRecurrentRemindersAtSave = a3;
}

- (BOOL)applyCRDTsWithoutMerging
{
  return self->_applyCRDTsWithoutMerging;
}

- (void)setApplyCRDTsWithoutMerging:(BOOL)a3
{
  self->_applyCRDTsWithoutMerging = a3;
}

- (BOOL)syncToCloudKit
{
  return self->_syncToCloudKit;
}

- (void)setSyncToCloudKit:(BOOL)a3
{
  self->_syncToCloudKit = a3;
}

- (REMReplicaManagerProviding)replicaManagerProvider
{
  return self->_replicaManagerProvider;
}

- (void)setReplicaManagerProvider:(id)a3
{
}

- (REMSaveRequestNotifyChangeDelegate)notifyChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notifyChangeDelegate);

  return (REMSaveRequestNotifyChangeDelegate *)WeakRetained;
}

- (void)setNotifyChangeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notifyChangeDelegate);
  objc_storeStrong((id *)&self->_replicaManagerProvider, 0);
  objc_storeStrong((id *)&self->_trackedAccountCapabilities, 0);
  objc_storeStrong((id *)&self->_trackedReminderChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedSmartListChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedListChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedAccountChangeItems, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_saveRequestChangeEvents, 0);
  objc_storeStrong((id *)&self->_trackedTemplateSectionChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedSmartListSectionChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedListSectionChangeItems, 0);
  objc_storeStrong((id *)&self->_trackedTemplateChangeItems, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (id)_addLocalAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return [(REMSaveRequest *)self __addAccountWithType:1 name:a3 accountObjectID:a4];
}

- (id)_addLocalAccountWithName:(id)a3
{
  return [(REMSaveRequest *)self _addLocalAccountWithName:a3 accountObjectID:0];
}

- (id)_addCalDavAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return [(REMSaveRequest *)self __addAccountWithType:3 name:a3 accountObjectID:a4];
}

- (id)_addCalDavAccountWithName:(id)a3
{
  return [(REMSaveRequest *)self _addCalDavAccountWithName:a3 accountObjectID:0];
}

- (id)_addExchangeAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return [(REMSaveRequest *)self __addAccountWithType:4 name:a3 accountObjectID:a4];
}

- (id)_addExchangeAccountWithName:(id)a3
{
  return [(REMSaveRequest *)self _addExchangeAccountWithName:a3 accountObjectID:0];
}

- (id)_addTestOnlyLocalInternalAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return [(REMSaveRequest *)self __addAccountWithType:5 name:a3 accountObjectID:a4];
}

- (id)_addTestOnlyLocalInternalAccountWithName:(id)a3
{
  return [(REMSaveRequest *)self _addTestOnlyLocalInternalAccountWithName:a3 accountObjectID:0];
}

- (id)_addTestOnlyPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [(REMSaveRequest *)self __addAccountWithType:_auto_REMAccountTypeForPrimaryCloudKit() name:v7 accountObjectID:v6];

  return v8;
}

- (id)_addTestOnlyPrimaryCKAccountWithName:(id)a3
{
  return [(REMSaveRequest *)self _addTestOnlyPrimaryCKAccountWithName:a3 accountObjectID:0];
}

- (id)_addTestOnlyExtraPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [(REMSaveRequest *)self __addAccountWithType:_auto_REMAccountTypeForPrimaryCloudKit() name:v7 accountObjectID:v6];

  uint64_t v9 = [v8 storage];
  [v9 _setIsAddingExtraPrimaryCKAccountForTesting:1];

  return v8;
}

- (id)_addTestOnlyExtraPrimaryCKAccountWithName:(id)a3
{
  return [(REMSaveRequest *)self _addTestOnlyExtraPrimaryCKAccountWithName:a3 accountObjectID:0];
}

- (id)_addTestOnlyNonPrimaryCKAccountWithName:(id)a3 accountObjectID:(id)a4
{
  return [(REMSaveRequest *)self __addAccountWithType:6 name:a3 accountObjectID:a4];
}

- (id)_addTestOnlyNonPrimaryCKAccountWithName:(id)a3
{
  return [(REMSaveRequest *)self _addTestOnlyNonPrimaryCKAccountWithName:a3 accountObjectID:0];
}

- (id)__addAccountWithType:(int64_t)a3 name:(id)a4 accountObjectID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "name");
    if (v10) {
      goto LABEL_3;
    }
  }
  id v10 = +[REMAccount newObjectID];
LABEL_3:
  uint64_t v11 = [[REMAccountChangeItem alloc] initWithObjectID:v10 type:a3 name:v8 insertIntoSaveRequest:self];
  [(REMSaveRequest *)self _trackAccountChangeItem:v11];

  return v11;
}

- (id)__addAccountWithType:(int64_t)a3 name:(id)a4
{
  return [(REMSaveRequest *)self __addAccountWithType:a3 name:a4 accountObjectID:0];
}

- (id)addCustomSmartListWithName:(id)a3 toListSublistContextChangeItem:(id)a4 smartListObjectID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "name");
    if (v9) {
      goto LABEL_3;
    }
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "listSublistContextChangeItem");
LABEL_3:
  uint64_t v11 = [v9 listChangeItem];
  uint64_t v12 = [(REMSaveRequest *)self _updateAccountWithListChangeItem:v11];
  uint64_t v13 = [v12 saveRequest];

  uint64_t v14 = (void *)MEMORY[0x1E4F1C3B8];
  if (v13 != self)
  {
    __int16 v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    [v12 saveRequest];
    v18 = uint64_t v17 = v14;
    [v15 raise:v16, @"accountChangeItem (%@) has incorrect saveRequest (%@). Expected %@", v12, v18, self format];

    uint64_t v14 = v17;
  }
  uint64_t v19 = [v12 capabilities];
  char v20 = [v19 supportsCustomSmartLists];

  if ((v20 & 1) == 0)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *v14;
    uint64_t v23 = [v12 objectID];
    [v21 raise:v22, @"Cannot add CSL to sublist context because the account does not support it {accountID: %@}", v23 format];
  }
  if (!v10) {
    id v10 = +[REMSmartList newObjectID];
  }
  int v24 = [[REMSmartListChangeItem alloc] initWithCustomSmartListObjectID:v10 insertIntoListSublistContextChangeItem:v9];
  [(REMSaveRequest *)self _trackSmartListChangeItem:v24];
  [(REMSmartListChangeItem *)v24 setName:v8];

  return v24;
}

- (void)updateAccount:.cold.1()
{
  OUTLINED_FUNCTION_7();
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateAccount:.cold.2()
{
  OUTLINED_FUNCTION_7();
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_updateAccountWithListChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_updateAccountWithListChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)addGroupWithName:toAccountGroupContextChangeItem:groupObjectID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)addListWithName:toAccountChangeItem:listObjectID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)addListUsingTemplate:(void *)a1 toAccountChangeItem:.cold.1(void *a1)
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v2, v3, "Failed to add list using template because account does not support templates. {accountChangeItem.objectID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)addListUsingTemplate:(void *)a1 toAccountChangeItem:.cold.2(void *a1)
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v2, v3, "Template has no name {templateID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)addListUsingPublicTemplateWithREMListRepresentation:(void *)a1 toAccountChangeItem:.cold.1(void *a1)
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v2, v3, "Failed to add list using public template because account does not support templates. {accountChangeItem.objectID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)addListUsingPublicTemplateWithREMListRepresentation:(void *)a1 toAccountChangeItem:.cold.2(void *a1)
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v2, v3, "Public template has no name {publicTemplateObjectID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)updateList:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateList:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_updateListStorage:accountCapabilities:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_updateListWithReminderChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_updateListWithReminderChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateSmartList:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateSmartList:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateTemplate:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateTemplate:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)addReminderWithTitle:toListChangeItem:reminderObjectID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMTemplate cdEntityNameForSavedReminder]]) -- Failed to add new reminder to a list, which represents a template, because reminderObjectID.entityName was not REMCDSavedReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
}

- (void)addReminderWithTitle:toListChangeItem:reminderObjectID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMReminder cdEntityName]]) -- Failed to add new reminder to a list, which does not represents a template, because reminderObjectID.entityName was not REMCDReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
}

- (void)addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMTemplate cdEntityNameForSavedReminder]]) -- Failed to add new reminder to parent saved reminder in a template because reminderObjectID.entityName was not REMCDSavedReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
}

- (void)addReminderWithTitle:toReminderSubtaskContextChangeItem:reminderObjectID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (![[reminderObjectID entityName] isEqualToString:[REMReminder cdEntityName]]) -- Failed to add new reminder to parent reminder in a list because reminderObjectID.entityName was not REMCDReminder {reminderObjectID: %@}", v2, v3, v4, v5, v6);
}

- (void)updateReminder:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateReminder:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)addListSectionWithDisplayName:toListSectionContextChangeItem:listSectionObjectID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateListSection:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)addSmartListSectionWithDisplayName:toSmartListSectionContextChangeItem:smartListSectionObjectID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateSmartListSection:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)addTemplateSectionWithDisplayName:toTemplateSectionContextChangeItem:templateSectionObjectID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)updateTemplateSection:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_updateResolutionTokenMapForChangeItem:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "resolutionTokenMap should never be undefined", v1, 2u);
}

- (void)preFlightActionSaveAndUpdateParentsOfRecurrentSubtasksWithLogPrefix:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "%{public}@: Preflight -  Error fetching parentsOfRecurrentSubtasks {error: %@}", v1, 0x16u);
}

- (void)advanceForwardRecurrenceAfterNowAndCreateIncompleteCloneWithoutRecurrenceRulesAndSubtasks
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "objectID");
  _DWORD *v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_10_0(&dword_1B9AA2000, v5, v6, "IncompleteRecurrenceClone: Unable to clone recurrent reminder {reminderID: %{public}@}");
}

- (void)advanceForwardRecurrenceAndCreateCompletedCloneWithoutRecurrenceRulesAndSubtasksAfterDate:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2_2(a1, a2), "objectID");
  _DWORD *v3 = 138543362;
  void *v2 = v4;
  OUTLINED_FUNCTION_10_0(&dword_1B9AA2000, v5, v6, "CompletedRecurrenceClone: Unable to clone recurrent reminder {reminderID: %{public}@}");
}

- (void)_trackAccountChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_updateTrackedAccountChangeItem:withObjectID:.cold.3()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackListChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackSmartListChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackSmartListChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackTemplateChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackTemplateChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackListSectionChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackListSectionChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackSmartListSectionChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackSmartListSectionChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackTemplateSectionChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackTemplateSectionChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackReminderChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackReminderChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackAccountCapabilities:forObjectID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_trackedAccountCapabilitiesForObjectID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "Don't have account capabilities for {objectID: %@}", v2, v3, v4, v5, v6);
}

- (void)_trackedAccountCapabilitiesForObjectID:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_DEBUG, "_trackedAccountCapabilitiesForObjectID {SaveRequest: %@ objectID: %@", v1, 0x16u);
}

- (void)_copyReminder:toListChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)_copyReminder:toReminderSubtaskContextChangeItem:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

@end