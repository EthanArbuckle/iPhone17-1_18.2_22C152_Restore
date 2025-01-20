@interface REMReminderChangeItem
+ (id)resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDReminder:(id)a3;
+ (id)resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDSavedReminder:(id)a3;
+ (void)_ensureDueDateDeltaAlertsAreFetchedIfNecessary:(id)a3;
+ (void)initialize;
- (BOOL)canSetAlternativeDisplayDateDateForCalendar;
- (BOOL)isSubtask;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSAttributedString)notes;
- (NSAttributedString)title;
- (NSString)description;
- (NSString)notesAsString;
- (NSString)primaryLocaleInferredFromLastUsedKeyboard;
- (NSString)titleAsString;
- (REMAccountCapabilities)accountCapabilities;
- (REMChangedKeysObserver)changedKeysObserver;
- (REMDueDateDeltaAlert)fetchedCurrentDueDateDeltaAlert;
- (REMListChangeItem)listChangeItem;
- (REMReminderAssignmentContextChangeItem)assignmentContext;
- (REMReminderAttachmentContextChangeItem)attachmentContext;
- (REMReminderChangeItem)initWithObjectID:(id)a3 title:(id)a4 insertIntoListChangeItem:(id)a5;
- (REMReminderChangeItem)initWithObjectID:(id)a3 title:(id)a4 insertIntoParentReminderSubtaskContextChangeItem:(id)a5;
- (REMReminderChangeItem)initWithReminderChangeItem:(id)a3 insertIntoListChangeItem:(id)a4;
- (REMReminderChangeItem)initWithReminderChangeItem:(id)a3 insertIntoParentReminderSubtaskContextChangeItem:(id)a4;
- (REMReminderChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6;
- (REMReminderChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6;
- (REMReminderDueDateDeltaAlertContextChangeItem)dueDateDeltaAlertContext;
- (REMReminderFlaggedContextChangeItem)flaggedContext;
- (REMReminderHashtagContextChangeItem)hashtagContext;
- (REMReminderStorage)storage;
- (REMReminderSubtaskContextChangeItem)subtaskContext;
- (REMSaveRequest)saveRequest;
- (double)_timeIntervalToAddSinceStartDate:(id)a3 withNow:(id)a4 step:(double)a5;
- (double)nextRecurrentAdvanceAmountForDateComponents:(id)a3 afterDate:(id)a4;
- (id)_cleanupOriginalAlarmsForSnoozing;
- (id)_editDocument:(id)a3 replicaIDSource:(id)a4 newString:(id)a5;
- (id)addAlarmWithTrigger:(id)a3;
- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11;
- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 end:(id)a5;
- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 firstDayOfTheWeek:(int64_t)a5 daysOfTheWeek:(id)a6 daysOfTheMonth:(id)a7 monthsOfTheYear:(id)a8 weeksOfTheYear:(id)a9 daysOfTheYear:(id)a10 setPositions:(id)a11 end:(id)a12;
- (id)changedKeys;
- (id)confirmForSiriFoundInAppsAppendingToList:(id)a3;
- (id)datesDebugDescriptionInTimeZone:(id)a3;
- (id)dedupedAndFilteredNonSnoozeAlarms:(id)a3;
- (id)duplicateForRecurrenceUsingReminderID:(id)a3;
- (id)nextRecurrentDueDateComponentsAfter:(id)a3;
- (id)removeFromListAllowingUndo;
- (id)resolutionTokenKeyForChangedKey:(id)a3;
- (id)shallowCopyWithSaveRequest:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)_copyAlarmsInto:(id)a3;
- (void)_createSnoozeAlarmWithDateComponents:(id)a3;
- (void)accountCapabilities;
- (void)addAlarm:(id)a3;
- (void)addAlarm:(id)a3 updateDisplayDate:(BOOL)a4;
- (void)addRecurrenceRule:(id)a3;
- (void)advanceForwardDateAlarmsAfterDate:(id)a3;
- (void)advanceForwardRecurrenceAfterNow;
- (void)advanceForwardToNextRecurrenceAfterDate:(id)a3;
- (void)cleanupDuplicate:(id)a3 markAsCompleted:(BOOL)a4;
- (void)clearAlternativeDisplayDateDateForCalendarIfInvalid;
- (void)clearAlternativeDisplayDateDateForCalendarWithReason:(id)a3;
- (void)copyInto:(id)a3;
- (void)decrementRecurrenceRuleEndCount;
- (void)insertRecurrenceRule:(id)a3 afterRecurrenceRule:(id)a4;
- (void)insertRecurrenceRule:(id)a3 beforeRecurrenceRule:(id)a4;
- (void)rejectForSiriFoundInApps;
- (void)removeAlarm:(id)a3;
- (void)removeAlarm:(id)a3 updateDisplayDate:(BOOL)a4;
- (void)removeAllAlarms;
- (void)removeAllRecurrenceRules;
- (void)removeAllSnoozeAlarms;
- (void)removeFromList;
- (void)removeFromParentReminder;
- (void)removeRecurrenceRule:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setAlarms:(id)a3 updateDisplayDate:(BOOL)a4;
- (void)setAlternativeDisplayDateDateForCalendarToPreviousRecurrentDateBefore:(id)a3 recurrenceRules:(id)a4;
- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(id)a3;
- (void)setAlternativeDisplayDateDateForCalendarWithNormalizedDate:(id)a3;
- (void)setChangedKeysObserver:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDueDateComponents:(id)a3;
- (void)setDueDateComponentsWithAlarmsIfNeeded:(id)a3;
- (void)setIcsDisplayOrder:(unint64_t)a3;
- (void)setNotes:(id)a3;
- (void)setNotesAsString:(id)a3;
- (void)setPrimaryLocaleInferredFromLastUsedKeyboard:(id)a3;
- (void)setRecurrenceRules:(id)a3;
- (void)setStorage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAsString:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)snoozeForever;
- (void)snoozeFromDueDateForFutureIntegralMultipleOfTimeInterval:(double)a3;
- (void)snoozeFromNowForTimeInterval:(double)a3;
- (void)snoozeToDate:(id)a3;
- (void)snoozeToNextThirds;
- (void)updateAccountCapabilities:(id)a3;
- (void)updateDisplayDate;
@end

@implementation REMReminderChangeItem

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve;
    __sKeysToObserve = (uint64_t)&unk_1F136C038;

    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C050];
    v4 = (void *)__resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDReminder;
    __resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDReminder = v3;

    __resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDSavedReminder = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C068];
    MEMORY[0x1F41817F8]();
  }
}

- (REMReminderChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    v22.receiver = self;
    v22.super_class = (Class)REMReminderChangeItem;
    v15 = [(REMReminderChangeItem *)&v22 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_saveRequest, a3);
      objc_storeStrong((id *)&v16->_storage, a4);
      objc_storeStrong((id *)&v16->_changedKeysObserver, a6);
      saveRequest = v16->_saveRequest;
      v18 = [(REMReminderStorage *)v16->_storage objectID];
      [(REMSaveRequest *)saveRequest _trackAccountCapabilities:v13 forObjectID:v18];
    }
    self = v16;
    v19 = self;
  }
  else
  {
    v20 = +[REMLogStore write];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[REMReminderChangeItem initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
    v19 = 0;
  }

  return v19;
}

- (REMReminderChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)[a4 copy];
  id v13 = [REMChangedKeysObserver alloc];
  id v14 = [(REMChangedKeysObserver *)v13 initWithTarget:v12 keysToObserve:__sKeysToObserve includeInitial:v6];
  v15 = [(REMReminderChangeItem *)self initWithSaveRequest:v11 storage:v12 accountCapabilities:v10 changedKeysObserver:v14];

  return v15;
}

- (REMReminderChangeItem)initWithObjectID:(id)a3 title:(id)a4 insertIntoListChangeItem:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = [v10 accountID];
  id v12 = [REMReminderStorage alloc];
  id v13 = [v10 objectID];
  id v14 = [(REMReminderStorage *)v12 initWithObjectID:v8 listID:v13 accountID:v11];

  if (!v9) {
    v9 = &stru_1F1339A18;
  }
  v15 = [REMCRMergeableStringDocument alloc];
  v16 = [(REMReminderStorage *)v14 titleReplicaIDSource];
  v17 = [(REMCRMergeableStringDocument *)v15 initWithReplicaIDSource:v16 string:v9];

  [(REMReminderStorage *)v14 setTitleDocument:v17];
  [v10 lowLevelAddReminderIDToOrdering:v8 withParentReminderChangeItem:0];
  v18 = [v10 groceryContextChangeItem];
  int v19 = [v18 shouldCategorizeGroceryItems];

  if (v19)
  {
    v20 = [v10 groceryContextChangeItem];
    v26[0] = v8;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [v20 categorizeGroceryItemsWithReminderIDs:v21];
  }
  objc_super v22 = [v10 saveRequest];
  v23 = [v10 accountCapabilities];
  v24 = [(REMReminderChangeItem *)self initWithSaveRequest:v22 storage:v14 accountCapabilities:v23 observeInitialValues:1];

  return v24;
}

- (REMReminderChangeItem)initWithObjectID:(id)a3 title:(id)a4 insertIntoParentReminderSubtaskContextChangeItem:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (__CFString *)a4;
  v9 = [a5 reminderChangeItem];
  id v10 = [v9 accountID];
  id v11 = [REMReminderStorage alloc];
  id v12 = [v9 listID];
  id v13 = [(REMReminderStorage *)v11 initWithObjectID:v7 listID:v12 accountID:v10];

  id v14 = [v9 objectID];
  [(REMReminderStorage *)v13 setParentReminderID:v14];

  if (!v8) {
    id v8 = &stru_1F1339A18;
  }
  v15 = [REMCRMergeableStringDocument alloc];
  v16 = [(REMReminderStorage *)v13 titleReplicaIDSource];
  v17 = [(REMCRMergeableStringDocument *)v15 initWithReplicaIDSource:v16 string:v8];

  [(REMReminderStorage *)v13 setTitleDocument:v17];
  v18 = [v9 saveRequest];
  int v19 = [v18 _updateListWithReminderChangeItem:v9];
  if (!v19)
  {
    v27 = +[REMLogStore write];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[REMReminderChangeItem initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:]();
    }
  }
  [v19 lowLevelAddReminderIDToOrdering:v7 withParentReminderChangeItem:v9];
  v20 = [v19 groceryContextChangeItem];
  int v21 = [v20 shouldCategorizeGroceryItems];

  if (v21)
  {
    objc_super v22 = [v19 groceryContextChangeItem];
    v29[0] = v7;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [v22 categorizeGroceryItemsWithReminderIDs:v23];
  }
  v24 = [v9 accountCapabilities];
  v25 = [(REMReminderChangeItem *)self initWithSaveRequest:v18 storage:v13 accountCapabilities:v24 observeInitialValues:1];

  return v25;
}

- (REMReminderChangeItem)initWithReminderChangeItem:(id)a3 insertIntoListChangeItem:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[REMReminder newObjectID];
  v9 = [REMReminderStorage alloc];
  id v10 = [v6 objectID];
  id v11 = [v6 accountID];
  id v12 = [(REMReminderStorage *)v9 initWithObjectID:v8 listID:v10 accountID:v11];

  [v6 lowLevelAddReminderIDToOrdering:v8 withParentReminderChangeItem:0];
  id v13 = [v6 groceryContextChangeItem];
  LODWORD(v11) = [v13 shouldCategorizeGroceryItems];

  if (v11)
  {
    id v14 = [v6 groceryContextChangeItem];
    v20[0] = v8;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v14 categorizeGroceryItemsWithReminderIDs:v15];
  }
  v16 = [v7 saveRequest];
  v17 = [v6 accountCapabilities];
  v18 = [(REMReminderChangeItem *)self initWithSaveRequest:v16 storage:v12 accountCapabilities:v17 observeInitialValues:1];

  [v7 copyInto:v18];
  return v18;
}

- (REMReminderChangeItem)initWithReminderChangeItem:(id)a3 insertIntoParentReminderSubtaskContextChangeItem:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[REMReminder newObjectID];
  v9 = [v6 reminderChangeItem];

  id v10 = [v9 accountID];
  id v11 = [REMReminderStorage alloc];
  id v12 = [v9 listID];
  id v13 = [(REMReminderStorage *)v11 initWithObjectID:v8 listID:v12 accountID:v10];

  id v14 = [v9 objectID];
  [(REMReminderStorage *)v13 setParentReminderID:v14];

  v15 = [v9 saveRequest];
  v16 = [v15 _updateListWithReminderChangeItem:v9];
  if (!v16)
  {
    v25 = +[REMLogStore write];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[REMReminderChangeItem initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:]();
    }
  }
  [v16 lowLevelAddReminderIDToOrdering:v8 withParentReminderChangeItem:v9];
  v17 = [v16 groceryContextChangeItem];
  int v18 = [v17 shouldCategorizeGroceryItems];

  if (v18)
  {
    int v19 = [v16 groceryContextChangeItem];
    v26[0] = v8;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [v19 categorizeGroceryItemsWithReminderIDs:v20];
  }
  int v21 = [v7 saveRequest];
  objc_super v22 = [v9 accountCapabilities];
  v23 = [(REMReminderChangeItem *)self initWithSaveRequest:v21 storage:v13 accountCapabilities:v22 observeInitialValues:1];

  [v7 copyInto:v23];
  return v23;
}

- (REMAccountCapabilities)accountCapabilities
{
  uint64_t v3 = [(REMReminderChangeItem *)self storage];
  if (!v3) {
    goto LABEL_3;
  }
  v4 = (void *)v3;
  v5 = [(REMReminderChangeItem *)self saveRequest];
  id v6 = [(REMReminderChangeItem *)self objectID];
  id v7 = [v5 _trackedAccountCapabilitiesForObjectID:v6];

  if (!v7)
  {
LABEL_3:
    id v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMReminderChangeItem accountCapabilities](self);
    }

    id v7 = [[REMAccountCapabilities alloc] initWithAccountType:0];
  }

  return v7;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMReminderChangeItem *)self storage];
  id v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (id)datesDebugDescriptionInTimeZone:(id)a3
{
  id v4 = a3;
  v5 = [(REMReminderChangeItem *)self storage];
  id v6 = [v5 datesDebugDescriptionInTimeZone:v4];

  return v6;
}

- (id)duplicateForRecurrenceUsingReminderID:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [(REMReminderChangeItem *)v5 saveRequest];
  id v7 = [(REMReminderChangeItem *)v5 titleAsString];
  uint64_t v8 = [v7 copy];
  v9 = (void *)v8;
  id v10 = &stru_1F1339A18;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  id v11 = v10;

  id v12 = [(REMReminderChangeItem *)v5 accountCapabilities];
  int v13 = [v12 insertsCompletedRecurrentCloneAtTail];

  id v14 = [(REMReminderChangeItem *)v5 parentReminderID];

  if (v14)
  {
    v15 = [(REMReminderChangeItem *)v5 parentReminderID];
    v16 = [v6 _trackedReminderChangeItemForObjectID:v15];

    v17 = [v16 subtaskContext];
    if (v17)
    {
      int v18 = [v6 addReminderWithTitle:v11 toReminderSubtaskContextChangeItem:v17 reminderObjectID:v4];
      [v17 insertReminderChangeItem:v18 beforeReminderChangeItem:v5];
    }
    else
    {
      v20 = +[REMLogStore write];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[REMReminderChangeItem duplicateForRecurrenceUsingReminderID:](v5);
      }

      int v18 = 0;
    }
  }
  else
  {
    int v19 = [(REMReminderChangeItem *)v5 listID];

    if (!v19)
    {
      v25 = +[REMLogStore write];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[REMReminderChangeItem duplicateForRecurrenceUsingReminderID:]();
      }
      int v18 = 0;
      goto LABEL_22;
    }
    v16 = [v6 _updateListWithReminderChangeItem:v5];
    if (v16)
    {
      int v18 = [v6 addReminderWithTitle:v11 toListChangeItem:v16 reminderObjectID:v4];
      if (v13) {
        [v16 insertReminderChangeItem:v18 adjacentToReminderChangeItem:0 isAfter:1 withParentReminderChangeItem:0];
      }
      else {
        [v16 insertReminderChangeItem:v18 beforeReminderChangeItem:v5];
      }
    }
    else
    {
      v32 = +[REMLogStore write];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[REMReminderChangeItem duplicateForRecurrenceUsingReminderID:](v5);
      }

      int v18 = 0;
    }
  }

  if (v18)
  {
    [(REMReminderChangeItem *)v5 copyInto:v18];
    uint64_t v21 = [(REMReminderChangeItem *)v5 assignmentContext];
    if (v21)
    {
      objc_super v22 = (void *)v21;
      v23 = [v18 assignmentContext];

      if (v23)
      {
        v24 = [(REMReminderChangeItem *)v5 assignmentContext];
        v25 = [v24 currentAssignment];

        if (v25)
        {
          v26 = [v18 assignmentContext];
          v27 = [v25 assigneeID];
          v28 = [v25 originatorID];
          v29 = objc_msgSend(v26, "addAssignmentWithAssigneeID:originatorID:status:", v27, v28, -[NSObject status](v25, "status"));

          v30 = [v25 assignedDate];
          [v29 setAssignedDate:v30];
        }
LABEL_22:
      }
    }
  }

  return v18;
}

- (void)copyInto:(id)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  id v6 = [(REMReminderChangeItem *)v5 title];
  id v7 = (void *)[v6 copy];
  [v4 setTitle:v7];

  uint64_t v8 = [(REMReminderChangeItem *)v5 notes];
  v9 = (void *)[v8 copy];
  [v4 setNotes:v9];

  id v10 = [(REMReminderChangeItem *)v5 creationDate];
  id v11 = (void *)[v10 copy];
  [v4 setCreationDate:v11];

  id v12 = [(REMReminderChangeItem *)v5 lastModifiedDate];
  int v13 = (void *)[v12 copy];
  [v4 setLastModifiedDate:v13];

  objc_msgSend(v4, "setCompleted:", -[REMReminderChangeItem isCompleted](v5, "isCompleted"));
  id v14 = [(REMReminderChangeItem *)v5 completionDate];
  v15 = (void *)[v14 copy];
  [v4 setCompletionDate:v15];

  objc_msgSend(v4, "setPriority:", -[REMReminderChangeItem priority](v5, "priority"));
  v16 = [(REMReminderChangeItem *)v5 startDateComponents];
  v17 = (void *)[v16 copy];
  [v4 setStartDateComponents:v17];

  int v18 = [(REMReminderChangeItem *)v5 dueDateComponents];
  int v19 = (void *)[v18 copy];
  [v4 setDueDateComponents:v19];

  v20 = [(REMReminderChangeItem *)v5 lastBannerPresentationDate];
  uint64_t v21 = (void *)[v20 copy];
  [v4 setLastBannerPresentationDate:v21];

  objc_super v22 = [(REMReminderChangeItem *)v5 userActivity];
  v23 = (void *)[v22 copy];
  [v4 setUserActivity:v23];

  v24 = [(REMReminderChangeItem *)v5 icsUrl];
  v25 = (void *)[v24 copy];
  [v4 setIcsUrl:v25];

  v26 = [(REMReminderChangeItem *)v5 alternativeDisplayDateDate_forCalendar];
  objc_msgSend(v4, "setAlternativeDisplayDateDate_forCalendar:", v26);

  [v4 removeAllRecurrenceRules];
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  v104 = v5;
  obuint64_t j = [(REMReminderChangeItem *)v5 recurrenceRules];
  uint64_t v27 = [obj countByEnumeratingWithState:&v124 objects:v131 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v125 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = *(void *)(*((void *)&v124 + 1) + 8 * i);
        v32 = [REMRecurrenceRule alloc];
        id v33 = +[REMRecurrenceRule newObjectID];
        v34 = [v4 accountID];
        v35 = [v4 objectID];
        v36 = [(REMRecurrenceRule *)v32 initWithRecurrenceRule:v31 objectID:v33 accountID:v34 reminderID:v35];

        [v4 addRecurrenceRule:v36];
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v124 objects:v131 count:16];
    }
    while (v28);
  }

  v37 = v104;
  [(REMReminderChangeItem *)v104 _copyAlarmsInto:v4];
  [(REMReminderChangeItem *)v104 subtaskContext];

  uint64_t v38 = [(REMReminderChangeItem *)v104 attachmentContext];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [v4 attachmentContext];

    if (v40)
    {
      v41 = [v4 attachmentContext];
      [v41 removeAllAttachments];

      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      v42 = [(REMReminderChangeItem *)v104 attachmentContext];
      v43 = [v42 attachments];

      id obja = v43;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v120 objects:v130 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v121;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v121 != v46) {
              objc_enumerationMutation(obja);
            }
            uint64_t v48 = *(void *)(*((void *)&v120 + 1) + 8 * j);
            v49 = [REMAttachment alloc];
            v50 = (void *)[(id)objc_opt_class() newObjectID];
            v51 = [v4 accountID];
            v52 = [v4 objectID];
            v53 = [(REMAttachment *)v49 initWithAttachment:v48 objectID:v50 accountID:v51 reminderID:v52];

            v54 = [v4 attachmentContext];
            [v54 addAttachment:v53];
          }
          uint64_t v45 = [obja countByEnumeratingWithState:&v120 objects:v130 count:16];
        }
        while (v45);
      }

      v37 = v104;
    }
  }
  uint64_t v55 = [(REMReminderChangeItem *)v37 flaggedContext];
  if (v55)
  {
    v56 = (void *)v55;
    v57 = [v4 flaggedContext];

    if (v57)
    {
      v58 = [(REMReminderChangeItem *)v37 flaggedContext];
      uint64_t v59 = [v58 flagged];
      v60 = [v4 flaggedContext];
      [v60 setFlagged:v59];
    }
  }
  v61 = [v4 assignmentContext];

  if (v61)
  {
    v62 = [v4 assignmentContext];
    [v62 removeAllAssignments];
  }
  v63 = [v4 hashtagContext];

  if (!v63) {
    goto LABEL_51;
  }
  v64 = [v4 hashtagContext];
  [v64 removeAllHashtags];

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v65 = [(REMReminderChangeItem *)v37 hashtagContext];
  v66 = [v65 hashtags];

  id objb = (id)[v66 countByEnumeratingWithState:&v116 objects:v129 count:16];
  if (!objb)
  {

    v67 = 0;
    v92 = 0;
    goto LABEL_50;
  }
  v67 = 0;
  uint64_t v107 = 0;
  v108 = 0;
  id v105 = v66;
  uint64_t v106 = *(void *)v117;
  do
  {
    for (k = 0; k != objb; k = (char *)k + 1)
    {
      v69 = v67;
      if (*(void *)v117 != v106) {
        objc_enumerationMutation(v105);
      }
      v70 = *(void **)(*((void *)&v116 + 1) + 8 * (void)k);
      v71 = [REMHashtag alloc];
      v72 = (void *)[(id)objc_opt_class() newObjectID];
      v73 = [v4 accountID];
      v74 = [v4 objectID];
      uint64_t v75 = [v70 type];
      v76 = [v70 name];
      v77 = [(REMHashtag *)v71 initWithObjectID:v72 accountID:v73 reminderID:v74 type:v75 name:v76];

      v78 = [v4 hashtagContext];
      [v78 addHashtag:v77];

      if ([v70 type] != 1)
      {
        v67 = v69;
        goto LABEL_42;
      }
      v79 = objc_alloc_init(TTREMHashtag);
      v80 = [v70 objectIdentifier];
      [(TTREMHashtag *)v79 setObjectIdentifier:v80];

      v81 = objc_alloc_init(TTREMHashtag);
      v82 = [(REMHashtag *)v77 objectIdentifier];
      [(TTREMHashtag *)v81 setObjectIdentifier:v82];

      v83 = v108;
      v67 = v69;
      if (v108) {
        goto LABEL_33;
      }
      v84 = [v4 title];

      if (v84)
      {
        id v85 = objc_alloc(MEMORY[0x1E4F28E48]);
        v86 = [v4 title];
        uint64_t v87 = [v85 initWithAttributedString:v86];

        v83 = (void *)v87;
LABEL_33:
        if (!v69) {
          goto LABEL_34;
        }
        goto LABEL_41;
      }
      v83 = 0;
      if (!v69)
      {
LABEL_34:
        v88 = v83;
        v89 = [v4 notes];

        if (v89)
        {
          id v90 = objc_alloc(MEMORY[0x1E4F28E48]);
          v91 = [v4 notes];
          v67 = (void *)[v90 initWithAttributedString:v91];
        }
        else
        {
          v67 = 0;
        }
        v83 = v88;
      }
LABEL_41:
      v108 = v83;
      LODWORD(v107) = objc_msgSend(v83, "rem_replaceTTREMHashtag:withTTREMHashtag:", v79, v81) | v107;
      HIDWORD(v107) |= objc_msgSend(v67, "rem_replaceTTREMHashtag:withTTREMHashtag:", v79, v81);

LABEL_42:
    }
    id objb = (id)[v105 countByEnumeratingWithState:&v116 objects:v129 count:16];
  }
  while (objb);

  if (v107) {
    [v4 setTitle:v108];
  }
  v37 = v104;
  if ((v107 & 0x100000000) != 0) {
    [v4 setNotes:v67];
  }
  v92 = v108;
LABEL_50:

LABEL_51:
  v93 = [v4 dueDateDeltaAlertContext];

  if (v93)
  {
    [(id)objc_opt_class() _ensureDueDateDeltaAlertsAreFetchedIfNecessary:v4];
    v94 = [v4 dueDateDeltaAlertContext];
    [v94 removeAllFetchedDueDateDeltaAlerts];

    [(id)objc_opt_class() _ensureDueDateDeltaAlertsAreFetchedIfNecessary:v37];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v95 = [(REMReminderChangeItem *)v37 storage];
    v96 = [v95 fetchedDueDateDeltaAlerts];

    uint64_t v97 = [v96 countByEnumeratingWithState:&v112 objects:v128 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v113;
      do
      {
        for (uint64_t m = 0; m != v98; ++m)
        {
          if (*(void *)v113 != v99) {
            objc_enumerationMutation(v96);
          }
          uint64_t v101 = *(void *)(*((void *)&v112 + 1) + 8 * m);
          v102 = [v4 dueDateDeltaAlertContext];
          id v103 = (id)[v102 addDueDateDeltaAlertWithDueDateDeltaAlert:v101];
        }
        uint64_t v98 = [v96 countByEnumeratingWithState:&v112 objects:v128 count:16];
      }
      while (v98);
    }

    v37 = v104;
  }
}

+ (void)_ensureDueDateDeltaAlertsAreFetchedIfNecessary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 storage];
  int v5 = [v4 hasUnfetchedDueDateDeltaAlerts];

  if (v5)
  {
    id v6 = [v3 saveRequest];
    id v7 = [v6 store];

    uint64_t v8 = [v3 remObjectID];
    v9 = +[REMReminderFetchOptions fetchOptionsIncludingDueDateDeltaAlerts];
    id v15 = 0;
    id v10 = [v7 fetchReminderWithObjectID:v8 fetchOptions:v9 error:&v15];
    id v11 = v15;

    if (v11)
    {
      id v12 = +[REMLogStore write];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[REMReminderChangeItem _ensureDueDateDeltaAlertsAreFetchedIfNecessary:]();
      }
    }
    else
    {
      int v13 = [v10 storage];
      id v12 = [v13 fetchedDueDateDeltaAlerts];

      if ([v12 count])
      {
        id v14 = [v3 storage];
        [v14 setFetchedDueDateDeltaAlerts:v12];
      }
    }
  }
}

- (void)_copyAlarmsInto:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = self;
  v35 = v4;
  [v4 removeAllAlarms];
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v7 = [(REMReminderChangeItem *)v5 alarms];
  v36 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v9 = [(REMReminderChangeItem *)v5 alarms];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v34 = v5;
  id v11 = [(REMReminderChangeItem *)v5 alarms];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v17 = [REMAlarm alloc];
        id v18 = +[REMAlarm newObjectID];
        int v19 = [(REMAlarm *)v17 initWithAlarm:v16 objectID:v18];

        [v10 addObject:v19];
        uint64_t v20 = [v16 alarmUID];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          objc_super v22 = [(REMAlarm *)v19 alarmUID];

          if (v22)
          {
            v23 = [(REMAlarm *)v19 alarmUID];
            v24 = [v16 alarmUID];
            [v36 setObject:v23 forKeyedSubscript:v24];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v13);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v25 = v10;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v31 = [v30 originalAlarmUID];

        if (v31)
        {
          v32 = [v30 originalAlarmUID];
          id v33 = [v36 objectForKeyedSubscript:v32];
          [v30 setOriginalAlarmUID:v33];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v27);
  }

  [v35 setAlarms:v25];
}

- (id)dedupedAndFilteredNonSnoozeAlarms:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v47 = objc_opt_new();
  v50 = objc_opt_new();
  uint64_t v46 = objc_opt_new();
  id v4 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
  v51 = v4;
  if (!v6)
  {
    id v48 = 0;
    goto LABEL_31;
  }
  uint64_t v7 = v6;
  id v48 = 0;
  uint64_t v8 = *(void *)v53;
  id v49 = v5;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v53 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      if (([v10 isSnooze] & 1) == 0)
      {
        id v11 = [v10 trigger];
        int v12 = [v11 isTemporal];

        if (!v12)
        {
          [v4 addObject:v10];
          continue;
        }
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = [v10 trigger];
        id v15 = REMDynamicCast(v13, (uint64_t)v14);

        if (v15)
        {
          [v15 timeInterval];
          if (v16 >= 3153600000.0)
          {
LABEL_26:

            continue;
          }
          v17 = NSNumber;
          [v15 timeInterval];
          id v18 = objc_msgSend(v17, "numberWithDouble:");
          char v19 = [v50 containsObject:v18];

          if (v19)
          {
            id v5 = v49;
            goto LABEL_26;
          }
          [v4 addObject:v10];
          v34 = NSNumber;
          [v15 timeInterval];
          v23 = objc_msgSend(v34, "numberWithDouble:");
          [v50 addObject:v23];
          id v5 = v49;
LABEL_25:

          goto LABEL_26;
        }
        id v20 = v5;
        uint64_t v21 = objc_opt_class();
        objc_super v22 = [v10 trigger];
        v23 = REMDynamicCast(v21, (uint64_t)v22);

        if (!v23
          || ([v23 dateComponents],
              v24 = objc_claimAutoreleasedReturnValue(),
              v24,
              !v24))
        {
          id v5 = v20;
          id v4 = v51;
          goto LABEL_25;
        }
        id v25 = [v23 dateComponents];
        uint64_t v26 = objc_msgSend(v25, "rem_stringRepresentation");

        if (([v47 containsObject:v26] & 1) == 0)
        {
          [v46 addObject:v10];
          [v47 addObject:v26];
          if (v48)
          {
            long long v44 = v26;
            uint64_t v27 = objc_opt_class();
            uint64_t v28 = [v48 trigger];
            uint64_t v29 = REMDynamicCast(v27, (uint64_t)v28);

            v30 = [v23 dateComponents];
            uint64_t v45 = v29;
            uint64_t v31 = [v29 dateComponents];
            uint64_t v32 = objc_msgSend(v30, "rem_compare:", v31);

            if (v32 == -1)
            {
              id v33 = v10;

              id v48 = v33;
            }
            id v5 = v20;

            id v4 = v51;
            uint64_t v26 = v44;
            goto LABEL_24;
          }
          id v48 = v10;
        }
        id v5 = v20;
        id v4 = v51;
LABEL_24:

        goto LABEL_25;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v52 objects:v60 count:16];
  }
  while (v7);
LABEL_31:

  v35 = v50;
  if ([v46 count])
  {
    v36 = [(REMReminderChangeItem *)self accountCapabilities];
    int v37 = [v36 supportsMultipleDateAlarmsOnRecurrence];

    if (v37)
    {
      id v4 = v51;
      [v51 addObjectsFromArray:v46];
      v35 = v50;
    }
    else
    {
      v35 = v50;
      id v4 = v51;
      if (v48)
      {
        [v51 addObject:v48];
        long long v38 = +[REMLogStore write];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          long long v39 = [(REMReminderChangeItem *)self objectID];
          uint64_t v40 = [v46 count];
          *(_DWORD *)buf = 138543618;
          v57 = v39;
          __int16 v58 = 2048;
          uint64_t v59 = v40;
          _os_log_impl(&dword_1B9AA2000, v38, OS_LOG_TYPE_INFO, "Only keeping earliest date alarm of reminder {reminderID: %{public}@, supportsMultipleDateAlarmsOnRecurrence: false, dateAlarms count:%lu}", buf, 0x16u);

          v35 = v50;
          id v4 = v51;
        }
      }
    }
  }
  long long v41 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return v41;
}

- (void)cleanupDuplicate:(id)a3 markAsCompleted:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  [v12 setCompleted:v4];
  [v12 removeAllRecurrenceRules];
  uint64_t v6 = [v12 alarms];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  v9 = [v12 dedupedAndFilteredNonSnoozeAlarms:v8];
  [v12 setAlarms:v9];

  id v10 = [(REMReminderChangeItem *)self accountCapabilities];
  LODWORD(v9) = [v10 insertsCompletedRecurrentCloneAtTail];

  if (v9) {
    [MEMORY[0x1E4F1C9C8] now];
  }
  else {
  id v11 = [(REMReminderChangeItem *)self creationDate];
  }
  [v12 setCreationDate:v11];
}

- (void)advanceForwardRecurrenceAfterNow
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v2, v3, "advanceForwardRecurrenceAfterNow: Unable to advance recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", v4);
}

- (void)advanceForwardToNextRecurrenceAfterDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMReminderChangeItem *)self dueDateComponents];
  [(REMReminderChangeItem *)self nextRecurrentAdvanceAmountForDateComponents:v5 afterDate:v4];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    uint64_t v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[REMReminderChangeItem advanceForwardToNextRecurrenceAfterDate:](self);
    }
  }
  else
  {
    uint64_t v8 = [(REMReminderChangeItem *)self dueDateComponents];

    if (v8)
    {
      v9 = [(REMReminderChangeItem *)self dueDateComponents];
      id v10 = objc_msgSend(v9, "rem_dateComponentsByAddingTimeInterval:", v7);

      [(REMReminderChangeItem *)self setDueDateComponents:v10];
    }
    id v11 = [(REMReminderChangeItem *)self startDateComponents];

    if (v11)
    {
      id v12 = [(REMReminderChangeItem *)self startDateComponents];
      uint64_t v13 = objc_msgSend(v12, "rem_dateComponentsByAddingTimeInterval:", v7);

      [(REMReminderChangeItem *)self setStartDateComponents:v13];
    }
    [(REMReminderChangeItem *)self advanceForwardDateAlarmsAfterDate:v4];
    [(REMReminderChangeItem *)self decrementRecurrenceRuleEndCount];
  }
}

- (void)advanceForwardDateAlarmsAfterDate:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  uint64_t v4 = [(REMReminderChangeItem *)self alarms];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  double v7 = [(REMReminderChangeItem *)self dedupedAndFilteredNonSnoozeAlarms:v6];

  v83 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v84 objects:v100 count:16];
  if (!v9)
  {

    id v49 = 0;
    goto LABEL_48;
  }
  uint64_t v11 = v9;
  v81 = self;
  v78 = 0;
  char v79 = 0;
  char v12 = 0;
  uint64_t v13 = *(void *)v85;
  uint64_t v14 = &off_1E61DB000;
  *(void *)&long long v10 = 138543618;
  long long v69 = v10;
  id v82 = v8;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v85 != v13) {
        objc_enumerationMutation(v8);
      }
      double v16 = *(void **)(*((void *)&v84 + 1) + 8 * i);
      v17 = objc_msgSend(v16, "trigger", v69);
      int v18 = [v17 isTemporal];

      if (!v18)
      {
        [v83 addObject:v16];
        continue;
      }
      uint64_t v19 = objc_opt_class();
      id v20 = [v16 trigger];
      uint64_t v21 = REMDynamicCast(v19, (uint64_t)v20);

      if (v21)
      {
        id v22 = objc_alloc((Class)v14[139]);
        [v21 timeInterval];
        v23 = objc_msgSend(v22, "initWithTimeInterval:");
        v24 = [[REMAlarm alloc] initWithTrigger:v23];
        [v83 addObject:v24];
LABEL_27:

        id v8 = v82;
        goto LABEL_28;
      }
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = [v16 trigger];
      v23 = REMDynamicCast(v25, (uint64_t)v26);

      if (v23)
      {
        uint64_t v27 = [(REMReminderChangeItem *)v81 dueDateComponents];
        v24 = [v27 timeZone];

        if (v24)
        {
          v24 = v24;
          uint64_t v28 = (void *)MEMORY[0x1E4F1C9D8];
          uint64_t v29 = [v23 dateComponents];
          v30 = objc_msgSend(v28, "rem_dateWithDateComponents:timeZone:", v29, v24);

          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateComponentsWithDate:timeZone:isAllDay:", v30, v24, 0);
          [(REMReminderChangeItem *)v81 nextRecurrentAdvanceAmountForDateComponents:v31 afterDate:v74];
          if (v32 != 0.0)
          {
            double v33 = v32;
            v76 = v31;
            v77 = v30;
            v34 = [v23 dateComponents];
            v35 = objc_msgSend(v34, "rem_dateComponentsByAddingTimeInterval:", v33);

            v80 = [[REMAlarmDateTrigger alloc] initWithDateComponents:v35];
            uint64_t v75 = [[REMAlarm alloc] initWithTrigger:v80];
            objc_msgSend(v83, "addObject:");
            v36 = +[REMLogStore write];
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              [(REMReminderChangeItem *)v81 objectID];
              v71 = v35;
              v73 = (REMAlarmDateTrigger *)objc_claimAutoreleasedReturnValue();
              int v37 = [v23 dateComponents];
              long long v38 = [(REMAlarmDateTrigger *)v80 dateComponents];
              [MEMORY[0x1E4F1CAF0] defaultTimeZone];
              v70 = v72 = v36;
              long long v39 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
              uint64_t v40 = [MEMORY[0x1E4F1CAF0] localTimeZone];
              *(_DWORD *)buf = 138544642;
              v89 = v73;
              __int16 v90 = 2114;
              v91 = v37;
              __int16 v92 = 2114;
              v93 = v38;
              __int16 v94 = 2114;
              v95 = v70;
              __int16 v96 = 2114;
              uint64_t v97 = v39;
              __int16 v98 = 2114;
              uint64_t v99 = v40;
              long long v41 = (void *)v40;
              _os_log_impl(&dword_1B9AA2000, v72, OS_LOG_TYPE_DEFAULT, "AdvanceRecurrence: Advancing forward alarm of reminder with new date trigger {reminderID: %{public}@, oldDateTrigger: %{public}@, newDateTrigger: %{public}@, defaultTimeZone: %{public}@}, systemTimeZone: %{public}@, localTimeZone: %{public}@};",
                buf,
                0x3Eu);

              v35 = v71;
              v36 = v72;
            }

            id v42 = v78;
            if (!v78 || objc_msgSend(v35, "rem_compare:", v78) == -1)
            {
              id v43 = v35;

              id v42 = v43;
            }
            uint64_t v31 = v76;
            v78 = v42;

            char v79 = 1;
            v30 = v77;
          }
        }
        else
        {
          long long v44 = +[REMLogStore write];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            uint64_t v45 = [(REMReminderChangeItem *)v81 objectID];
            uint64_t v46 = [(REMReminderChangeItem *)v81 dueDateComponents];
            *(_DWORD *)buf = v69;
            v89 = v45;
            __int16 v90 = 2114;
            v91 = v46;
            _os_log_fault_impl(&dword_1B9AA2000, v44, OS_LOG_TYPE_FAULT, "AdvanceRecurrence: Unable to advance forward date alarm for reminder with dueDate missing timezone {reminderID: %{public}@, dueDate: %{public}@}", buf, 0x16u);
          }
        }
        char v12 = 1;
        goto LABEL_27;
      }
LABEL_28:

      uint64_t v14 = &off_1E61DB000;
    }
    uint64_t v11 = [v8 countByEnumeratingWithState:&v84 objects:v100 count:16];
  }
  while (v11);

  if ((v12 & 1) == 0)
  {
LABEL_46:
    self = v81;
LABEL_47:
    id v49 = v78;
    goto LABEL_48;
  }
  if ((v79 & 1) == 0)
  {
    long long v55 = [(REMReminderChangeItem *)v81 dueDateComponents];
    uint64_t v61 = [[REMAlarmDateTrigger alloc] initWithDateComponents:v55];
    v62 = [[REMAlarm alloc] initWithTrigger:v61];
    [v83 addObject:v62];
    v63 = +[REMLogStore write];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      v64 = [(REMReminderChangeItem *)v81 objectID];
      v65 = [(REMReminderChangeItem *)v81 dueDateComponents];
      *(_DWORD *)buf = v69;
      v89 = v64;
      __int16 v90 = 2114;
      v91 = v65;
      _os_log_impl(&dword_1B9AA2000, v63, OS_LOG_TYPE_INFO, "AdvanceRecurrence: Adding new date alarm of reminder with dueDate {reminderID: %{public}@, dueDate: %{public}@};"
        " failed to advance forward any previous date alarms",
        buf,
        0x16u);
    }
    goto LABEL_44;
  }
  self = v81;
  uint64_t v47 = [(REMReminderChangeItem *)v81 accountCapabilities];
  if (([v47 supportsMultipleDateAlarmsOnRecurrence] & 1) != 0 || !v78)
  {

    goto LABEL_47;
  }
  id v48 = [(REMReminderChangeItem *)v81 dueDateComponents];
  id v49 = v78;
  char v50 = [v48 isEqual:v78];

  if (v50) {
    goto LABEL_48;
  }
  v51 = [(REMReminderChangeItem *)v81 dueDateComponents];
  long long v52 = [v51 timeZone];
  long long v53 = [v78 timeZone];
  int v54 = [v52 isEqual:v53];

  long long v55 = +[REMLogStore write];
  BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
  if (!v54)
  {
    if (!v56) {
      goto LABEL_45;
    }
    uint64_t v61 = [(REMReminderChangeItem *)v81 objectID];
    v66 = [(REMReminderChangeItem *)v81 dueDateComponents];
    v67 = objc_msgSend(v66, "rem_stringRepresentation");
    v68 = objc_msgSend(v78, "rem_stringRepresentation");
    *(_DWORD *)buf = 138543874;
    v89 = v61;
    __int16 v90 = 2114;
    v91 = v67;
    __int16 v92 = 2114;
    v93 = v68;
    _os_log_impl(&dword_1B9AA2000, v55, OS_LOG_TYPE_DEFAULT, "AdvanceRecurrence: Skipped fixing dueDate drift to match displayDate since timezone does not match {reminderID: %{public}@, dueDate: %{public}@, displayDate: %{public}@};",
      buf,
      0x20u);

LABEL_44:
LABEL_45:

    goto LABEL_46;
  }
  if (v56)
  {
    v57 = [(REMReminderChangeItem *)v81 objectID];
    __int16 v58 = [(REMReminderChangeItem *)v81 dueDateComponents];
    uint64_t v59 = objc_msgSend(v58, "rem_stringRepresentation");
    v60 = objc_msgSend(v78, "rem_stringRepresentation");
    *(_DWORD *)buf = 138543874;
    v89 = v57;
    __int16 v90 = 2114;
    v91 = v59;
    __int16 v92 = 2114;
    v93 = v60;
    _os_log_impl(&dword_1B9AA2000, v55, OS_LOG_TYPE_DEFAULT, "AdvanceRecurrence: Fixing dueDate drift to match displayDate {reminderID: %{public}@, dueDate: %{public}@, displayDate: %{public}@};",
      buf,
      0x20u);
  }
  self = v81;
  id v49 = v78;
  [(REMReminderChangeItem *)v81 setDueDateComponents:v78];
LABEL_48:
  [(REMReminderChangeItem *)self setAlarms:v83];
}

- (void)decrementRecurrenceRuleEndCount
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(REMReminderChangeItem *)self recurrenceRules];
  [(REMReminderChangeItem *)self removeAllRecurrenceRules];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v28;
    id v8 = &off_1E61DB000;
    *(void *)&long long v5 = 138543874;
    long long v25 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        long long v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "recurrenceEnd", v25);
        unint64_t v12 = [v11 occurrenceCount];

        if (v12 < 2)
        {
          [(REMReminderChangeItem *)self addRecurrenceRule:v10];
          uint64_t v14 = [v8[258] write];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v22 = [(REMReminderChangeItem *)self objectID];
            v23 = [v10 objectID];
            v24 = [v10 iCalendarDescription];
            *(_DWORD *)buf = v25;
            double v32 = v22;
            __int16 v33 = 2114;
            v34 = v23;
            __int16 v35 = 2114;
            v36 = v24;
            _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_INFO, "AdvanceRecurrence: Keep old recurrence rule of reminder {reminderID: %{public}@, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@};",
              buf,
              0x20u);

            id v8 = &off_1E61DB000;
          }
        }
        else
        {
          uint64_t v13 = [v10 recurrenceEnd];
          uint64_t v14 = +[REMRecurrenceEnd recurrenceEndWithOccurrenceCount:](REMRecurrenceEnd, "recurrenceEndWithOccurrenceCount:", [v13 occurrenceCount] - 1);

          id v15 = [REMRecurrenceRule alloc];
          id v16 = +[REMRecurrenceRule newObjectID];
          v17 = [(REMRecurrenceRule *)v15 initWithRecurrenceRule:v10 objectID:v16 end:v14];

          [(REMReminderChangeItem *)self addRecurrenceRule:v17];
          int v18 = [v8[258] write];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = [(REMReminderChangeItem *)self objectID];
            id v20 = [(REMRecurrenceRule *)v17 objectID];
            uint64_t v21 = [(REMRecurrenceRule *)v17 iCalendarDescription];
            *(_DWORD *)buf = v25;
            double v32 = v19;
            __int16 v33 = 2114;
            v34 = v20;
            __int16 v35 = 2114;
            v36 = v21;
            _os_log_impl(&dword_1B9AA2000, v18, OS_LOG_TYPE_INFO, "AdvanceRecurrence: New recurrence rules of reminder {reminderID: %{public}@, recurrenceRuleID: %{public}@, recurrenceRule: %{public}@};",
              buf,
              0x20u);

            id v8 = &off_1E61DB000;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v6);
  }
}

- (BOOL)canSetAlternativeDisplayDateDateForCalendar
{
  uint64_t v3 = [(REMReminderChangeItem *)self displayDate];
  if (v3)
  {
    if ([(REMReminderChangeItem *)self isCompleted]) {
      LOBYTE(v4) = 1;
    }
    else {
      int v4 = [(REMReminderChangeItem *)self isRecurrent] ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)clearAlternativeDisplayDateDateForCalendarIfInvalid
{
  uint64_t v3 = [(REMReminderChangeItem *)self alternativeDisplayDateDate_forCalendar];
  if (v3)
  {
    int v4 = (void *)v3;
    BOOL v5 = [(REMReminderChangeItem *)self canSetAlternativeDisplayDateDateForCalendar];

    if (!v5)
    {
      [(REMReminderChangeItem *)self clearAlternativeDisplayDateDateForCalendarWithReason:@"incomplete & recurrent"];
    }
  }
}

- (void)clearAlternativeDisplayDateDateForCalendarWithReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(REMReminderChangeItem *)self objectID];
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    long long v10 = v6;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "setCompleted: clear alternativeDisplayDateDate_forCalendar {reason: \"%{public}@\", reminderID: %{public}@}", (uint8_t *)&v7, 0x16u);
  }
  [(REMReminderChangeItem *)self setAlternativeDisplayDateDate_forCalendar:0];
}

- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(id)a3
{
  id v4 = a3;
  if (v4
    && ![(REMReminderChangeItem *)self canSetAlternativeDisplayDateDateForCalendar])
  {
    uint64_t v6 = +[REMLogStore write];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REMReminderChangeItem setAlternativeDisplayDateDateForCalendarWithDateComponents:](self);
    }
  }
  else
  {
    BOOL v5 = [(REMReminderChangeItem *)self storage];
    [v5 setAlternativeDisplayDateDateForCalendarWithDateComponents:v4];
  }
}

- (void)setAlternativeDisplayDateDateForCalendarWithNormalizedDate:(id)a3
{
  id v4 = a3;
  if (v4
    && ![(REMReminderChangeItem *)self canSetAlternativeDisplayDateDateForCalendar])
  {
    uint64_t v6 = +[REMLogStore write];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[REMReminderChangeItem setAlternativeDisplayDateDateForCalendarWithDateComponents:](self);
    }
  }
  else
  {
    BOOL v5 = [(REMReminderChangeItem *)self storage];
    objc_msgSend(v5, "setAlternativeDisplayDateDate_forCalendar:", v4);
  }
}

- (void)setAlternativeDisplayDateDateForCalendarToPreviousRecurrentDateBefore:(id)a3 recurrenceRules:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(REMReminderChangeItem *)self canSetAlternativeDisplayDateDateForCalendar])
  {
    id v8 = [(REMReminderChangeItem *)self displayDate];
    __int16 v9 = v8;
    if (v8)
    {
      long long v10 = [v8 timeZone];
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      }
      uint64_t v13 = v12;

      uint64_t v14 = [v9 date];
      id v15 = +[REMRecurrenceRule previousRecurrentDueDateBefore:v6 dueDate:v14 timeZone:v13 allDay:[v9 isAllDay] recurrenceRules:v7];

      if (v15)
      {
        id v16 = [REMDisplayDate alloc];
        uint64_t v17 = [v9 isAllDay];
        int v18 = [v9 timeZone];
        uint64_t v19 = [(REMDisplayDate *)v16 initWithDate:v15 allDay:v17 timeZone:v18];

        id v20 = +[REMLogStore write];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = [(REMReminderChangeItem *)self objectID];
          int v25 = 138543618;
          uint64_t v26 = v19;
          __int16 v27 = 2114;
          long long v28 = v21;
          _os_log_impl(&dword_1B9AA2000, v20, OS_LOG_TYPE_DEFAULT, "setAlternativeDisplayDate: set previousRecurrentDueDate {displayDate: %{public}@, reminderID: %{public}@}", (uint8_t *)&v25, 0x16u);
        }
        id v22 = [v19 dateComponentsRepresentation];
        v23 = [(REMReminderChangeItem *)self storage];
        [v23 setAlternativeDisplayDateDateForCalendarWithDateComponents:v22];
      }
      else
      {
        uint64_t v19 = +[REMLogStore write];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v24 = [(REMReminderChangeItem *)self objectID];
          int v25 = 138543362;
          uint64_t v26 = v24;
          _os_log_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_INFO, "setAlternativeDisplayDate: previousRecurrentDueDateBefore is nil {reminderID: %{public}@}", (uint8_t *)&v25, 0xCu);
        }
      }
    }
  }
  else
  {
    __int16 v9 = +[REMLogStore write];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[REMReminderChangeItem setAlternativeDisplayDateDateForCalendarWithDateComponents:](self);
    }
  }
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5 = a3;
  id v6 = [(REMReminderChangeItem *)self storage];

  if (v6)
  {
    id v7 = [(REMReminderChangeItem *)self objectID];
    id v8 = [v5 _trackedAccountCapabilitiesForObjectID:v7];

    if (v8)
    {
LABEL_16:
      uint64_t v13 = [REMReminderChangeItem alloc];
      uint64_t v14 = [(REMReminderChangeItem *)self storage];
      id v15 = [(REMReminderChangeItem *)self changedKeysObserver];
      id v12 = [(REMReminderChangeItem *)v13 initWithSaveRequest:v5 storage:v14 accountCapabilities:v8 changedKeysObserver:v15];

      goto LABEL_17;
    }
    __int16 v9 = [(REMReminderChangeItem *)self objectID];

    if (v9)
    {
      if (!v5)
      {
LABEL_15:
        id v8 = [[REMAccountCapabilities alloc] initWithAccountType:0];
        goto LABEL_16;
      }
      long long v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        [(REMReminderChangeItem *)self shallowCopyWithSaveRequest:v10];
      }
    }
    else
    {
      long long v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[REMReminderChangeItem shallowCopyWithSaveRequest:]();
      }
    }

    goto LABEL_15;
  }
  uint64_t v11 = +[REMLogStore write];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[REMReminderChangeItem shallowCopyWithSaveRequest:]();
  }

  id v12 = [(REMReminderChangeItem *)self storage];

  if (v12) {
    id v12 = 0;
  }
  else {
    NSLog(&cfstr_SIsUnexpectedl.isa, "self.storage");
  }
LABEL_17:

  return v12;
}

- (REMListChangeItem)listChangeItem
{
  uint64_t v3 = [(REMReminderChangeItem *)self listID];
  if (v3)
  {
    id v4 = [(REMReminderChangeItem *)self saveRequest];
    id v5 = [v4 _trackedListChangeItemForObjectID:v3];
  }
  else
  {
    id v5 = 0;
  }

  return (REMListChangeItem *)v5;
}

- (NSAttributedString)title
{
  uint64_t v2 = [(REMReminderChangeItem *)self storage];
  uint64_t v3 = [v2 titleDocument];
  id v4 = [v3 attributedString];

  return (NSAttributedString *)v4;
}

- (NSString)titleAsString
{
  uint64_t v2 = [(REMReminderChangeItem *)self storage];
  uint64_t v3 = [v2 titleAsString];

  return (NSString *)v3;
}

- (id)_editDocument:(id)a3 replicaIDSource:(id)a4 newString:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)a5;
  if (!(v8 | v10))
  {
    id v14 = 0;
    goto LABEL_12;
  }
  id v11 = (id)v10;
  if (v10)
  {
    if (v8) {
      goto LABEL_4;
    }
LABEL_8:
    id v15 = [[REMMutableCRMergeableStringDocument alloc] initWithReplicaIDSource:v9];
LABEL_10:
    id v16 = v15;
    uint64_t v17 = [(REMReminderChangeItem *)self saveRequest];
    int v18 = [v17 replicaManagerProvider];
    [(REMMutableCRMergeableStringDocument *)v16 setReplicaManagerProvider:v18];

    id v14 = [(REMMutableCRMergeableStringDocument *)v16 wipeAndReplaceWithString:v11];

    goto LABEL_11;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  if (!v8) {
    goto LABEL_8;
  }
LABEL_4:
  id v12 = [(id)v8 attributedString];
  int v13 = [v11 isEqualToAttributedString:v12];

  if (!v13)
  {
    id v15 = [(id)v8 mutableDocument];
    goto LABEL_10;
  }
  id v14 = (id)v8;
LABEL_11:

LABEL_12:

  return v14;
}

- (void)setPrimaryLocaleInferredFromLastUsedKeyboard:(id)a3
{
  id v4 = a3;
  id v5 = [(REMReminderChangeItem *)self storage];
  [v5 setPrimaryLocaleInferredFromLastUsedKeyboard:v4];
}

- (NSString)primaryLocaleInferredFromLastUsedKeyboard
{
  uint64_t v2 = [(REMReminderChangeItem *)self storage];
  uint64_t v3 = [v2 primaryLocaleInferredFromLastUsedKeyboard];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(REMReminderChangeItem *)self storage];
  id v12 = [v5 titleReplicaIDSource];

  id v6 = [(REMReminderChangeItem *)self storage];
  id v7 = [v6 titleDocument];
  unint64_t v8 = [(REMReminderChangeItem *)self _editDocument:v7 replicaIDSource:v12 newString:v4];

  id v9 = [(REMReminderChangeItem *)self storage];
  [v9 setTitleDocument:v8];

  unint64_t v10 = [(REMReminderChangeItem *)self changedKeysObserver];
  [v10 keyDidChange:@"titleDocument"];

  id v11 = [(REMReminderChangeItem *)self changedKeysObserver];
  [v11 keyDidChange:@"titleDocumentData"];
}

- (void)setTitleAsString:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28B18];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:v5];
  }
  else
  {
    id v6 = 0;
  }
  [(REMReminderChangeItem *)self setTitle:v6];
}

- (void)setCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(REMReminderChangeItem *)self storage];
  [v5 setCompleted:v3];

  if (v3)
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    [(REMReminderChangeItem *)self setCompletionDate:v6];
  }
  else
  {
    [(REMReminderChangeItem *)self setCompletionDate:0];
  }
  id v7 = [(REMReminderChangeItem *)self changedKeysObserver];
  [v7 keyDidChange:@"completed"];

  [(REMReminderChangeItem *)self clearAlternativeDisplayDateDateForCalendarIfInvalid];
}

- (NSAttributedString)notes
{
  uint64_t v2 = [(REMReminderChangeItem *)self storage];
  BOOL v3 = [v2 notesDocument];
  id v4 = [v3 attributedString];

  return (NSAttributedString *)v4;
}

- (NSString)notesAsString
{
  uint64_t v2 = [(REMReminderChangeItem *)self storage];
  BOOL v3 = [v2 notesAsString];

  return (NSString *)v3;
}

- (void)setNotes:(id)a3
{
  id v4 = a3;
  id v5 = [(REMReminderChangeItem *)self storage];
  id v12 = [v5 notesReplicaIDSource];

  id v6 = [(REMReminderChangeItem *)self storage];
  id v7 = [v6 notesDocument];
  unint64_t v8 = [(REMReminderChangeItem *)self _editDocument:v7 replicaIDSource:v12 newString:v4];

  id v9 = [(REMReminderChangeItem *)self storage];
  [v9 setNotesDocument:v8];

  unint64_t v10 = [(REMReminderChangeItem *)self changedKeysObserver];
  [v10 keyDidChange:@"notesDocument"];

  id v11 = [(REMReminderChangeItem *)self changedKeysObserver];
  [v11 keyDidChange:@"notesDocumentData"];
}

- (void)setNotesAsString:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F28B18];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:v5];
  }
  else
  {
    id v6 = 0;
  }
  [(REMReminderChangeItem *)self setNotes:v6];
}

- (void)setDueDateComponents:(id)a3
{
  id v4 = a3;
  id v5 = [(REMReminderChangeItem *)self dueDateComponents];
  objc_msgSend(v4, "rem_gregorianEquivalent");
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(REMReminderChangeItem *)self storage];
  [v6 setDueDateComponents:v12];

  id v7 = [(REMReminderChangeItem *)self storage];
  [v7 updateDisplayDate];

  if (v12)
  {
    uint64_t v8 = objc_msgSend(v12, "rem_isAllDayDateComponents");
    id v9 = [(REMReminderChangeItem *)self storage];
    [v9 setAllDay:v8];

    if (v8)
    {
      unint64_t v10 = 0;
    }
    else
    {
      id v9 = [v12 timeZone];
      unint64_t v10 = [v9 name];
    }
    id v11 = [(REMReminderChangeItem *)self storage];
    [v11 setTimeZone:v10];

    if ((v8 & 1) == 0)
    {
    }
    if (!v5 || ([v5 isEqual:v12] & 1) == 0) {
      goto LABEL_11;
    }
  }
  else if (v5)
  {
LABEL_11:
    [(REMReminderChangeItem *)self clearAlternativeDisplayDateDateForCalendarWithReason:@"Due date changed"];
  }
}

- (void)setDueDateComponentsWithAlarmsIfNeeded:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(a3, "rem_gregorianEquivalent");
  int v5 = objc_msgSend(v4, "rem_isAllDayDateComponents");
  if (v4)
  {
    if (v5)
    {
      [v4 setTimeZone:0];
    }
    else
    {
      id v6 = [v4 timeZone];

      if (!v6)
      {
        id v7 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
        [v4 setTimeZone:v7];
      }
    }
  }
  [(REMReminderChangeItem *)self setDueDateComponents:v4];
  [(REMReminderChangeItem *)self removeAllSnoozeAlarms];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [(REMReminderChangeItem *)self alarms];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v20 = v5;
    char v11 = 0;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v14 trigger];
        int v16 = [v15 isTemporal];

        if (v16)
        {
          [(REMReminderChangeItem *)self removeAlarm:v14 updateDisplayDate:0];
          char v11 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);

    LOBYTE(v5) = v20;
    if (v11) {
      [(REMReminderChangeItem *)self updateDisplayDate];
    }
    if (v4)
    {
LABEL_18:
      if ((v5 & 1) == 0)
      {
        uint64_t v17 = [[REMAlarmDateTrigger alloc] initWithDateComponents:v4];
        id v18 = [(REMReminderChangeItem *)self addAlarmWithTrigger:v17];
LABEL_23:

        goto LABEL_24;
      }
      goto LABEL_24;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_18;
    }
  }
  [(REMReminderChangeItem *)self removeAllRecurrenceRules];
  uint64_t v19 = [(REMReminderChangeItem *)self dueDateDeltaAlertContext];

  if (v19)
  {
    [(id)objc_opt_class() _ensureDueDateDeltaAlertsAreFetchedIfNecessary:self];
    uint64_t v17 = [(REMReminderChangeItem *)self dueDateDeltaAlertContext];
    [(REMAlarmDateTrigger *)v17 removeAllFetchedDueDateDeltaAlerts];
    goto LABEL_23;
  }
LABEL_24:
}

- (void)setIcsDisplayOrder:(unint64_t)a3
{
  int v5 = [(REMReminderChangeItem *)self storage];
  uint64_t v6 = [v5 icsDisplayOrder];

  if (v6 != a3)
  {
    id v7 = [(REMReminderChangeItem *)self saveRequest];
    uint64_t v8 = [v7 _updateListWithReminderChangeItem:self];

    if (v8)
    {
      [v8 setRemindersICSDisplayOrderChanged:1];
      uint64_t v9 = [(REMReminderChangeItem *)self storage];
      [v9 setIcsDisplayOrder:a3];

      uint64_t v10 = [(REMReminderChangeItem *)self changedKeysObserver];
      [v10 keyDidChange:@"icsDisplayOrder"];
    }
    else
    {
      uint64_t v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[REMReminderChangeItem setIcsDisplayOrder:]();
      }
    }
  }
}

- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 end:(id)a5
{
  id v8 = a5;
  id v9 = +[REMRecurrenceRule newObjectID];
  uint64_t v10 = [REMRecurrenceRule alloc];
  char v11 = [(REMReminderChangeItem *)self accountID];
  uint64_t v12 = [(REMReminderChangeItem *)self objectID];
  id v13 = [(REMRecurrenceRule *)v10 initRecurrenceRuleWithObjectID:v9 accountID:v11 reminderID:v12 frequency:a3 interval:a4 end:v8];

  [(REMReminderChangeItem *)self addRecurrenceRule:v13];

  return v13;
}

- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 daysOfTheWeek:(id)a5 daysOfTheMonth:(id)a6 monthsOfTheYear:(id)a7 weeksOfTheYear:(id)a8 daysOfTheYear:(id)a9 setPositions:(id)a10 end:(id)a11
{
  return [(REMReminderChangeItem *)self addRecurrenceRuleWithFrequency:a3 interval:a4 firstDayOfTheWeek:0 daysOfTheWeek:a5 daysOfTheMonth:a6 monthsOfTheYear:a7 weeksOfTheYear:a8 daysOfTheYear:a9 setPositions:a10 end:a11];
}

- (id)addRecurrenceRuleWithFrequency:(int64_t)a3 interval:(int64_t)a4 firstDayOfTheWeek:(int64_t)a5 daysOfTheWeek:(id)a6 daysOfTheMonth:(id)a7 monthsOfTheYear:(id)a8 weeksOfTheYear:(id)a9 daysOfTheYear:(id)a10 setPositions:(id)a11 end:(id)a12
{
  id v16 = a12;
  id v28 = a11;
  id v27 = a10;
  id v26 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v29 = +[REMRecurrenceRule newObjectID];
  int v25 = [REMRecurrenceRule alloc];
  uint64_t v20 = [(REMReminderChangeItem *)self accountID];
  long long v21 = [(REMReminderChangeItem *)self objectID];
  long long v22 = (void *)v20;
  id v23 = [(REMRecurrenceRule *)v25 initRecurrenceRuleWithObjectID:v29 accountID:v20 reminderID:v21 frequency:a3 interval:a4 firstDayOfTheWeek:a5 daysOfTheWeek:v19 daysOfTheMonth:v18 monthsOfTheYear:v17 weeksOfTheYear:v26 daysOfTheYear:v27 setPositions:v28 end:v16];

  [(REMReminderChangeItem *)self addRecurrenceRule:v23];

  return v23;
}

- (void)addRecurrenceRule:(id)a3
{
}

- (void)insertRecurrenceRule:(id)a3 beforeRecurrenceRule:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Adding recurrenceRule before recurrenceRule {reminderChangeItem: %@, recurrenceRule: %@, siblisngRecurrenceRule: %@}", (uint8_t *)&v12, 0x20u);
  }

  id v9 = [(REMReminderChangeItem *)self recurrenceRules];
  id v10 = (id)[v9 mutableCopy];

  if (v10)
  {
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v7)
    {
LABEL_8:
      uint64_t v11 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v11 = [v10 indexOfObject:v7];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
LABEL_9:
  [v10 insertObject:v6 atIndex:v11];
  [(REMReminderChangeItem *)self setRecurrenceRules:v10];
}

- (void)insertRecurrenceRule:(id)a3 afterRecurrenceRule:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412802;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Adding recurrenceRule after recurrenceRule {reminderChangeItem: %@, recurrenceRule: %@, siblisngRecurrenceRule: %@}", (uint8_t *)&v12, 0x20u);
  }

  id v9 = [(REMReminderChangeItem *)self recurrenceRules];
  id v10 = (id)[v9 mutableCopy];

  if (v10)
  {
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (!v7) {
      goto LABEL_8;
    }
  }
  uint64_t v11 = [v10 indexOfObject:v7];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v10 insertObject:v6 atIndex:v11 + 1];
    goto LABEL_10;
  }
LABEL_8:
  [v10 addObject:v6];
LABEL_10:
  [(REMReminderChangeItem *)self setRecurrenceRules:v10];
}

- (void)removeRecurrenceRule:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Removing recurrenceRule {reminderChangeItem: %@, recurrenceRule: %@}", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [(REMReminderChangeItem *)self recurrenceRules];
  id v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:v4];
  [(REMReminderChangeItem *)self setRecurrenceRules:v7];
}

- (void)removeAllRecurrenceRules
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    int v5 = self;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_INFO, "Removing all recurrenceRules {reminderChangeItem: %@}", (uint8_t *)&v4, 0xCu);
  }

  [(REMReminderChangeItem *)self setRecurrenceRules:MEMORY[0x1E4F1CBF0]];
}

- (void)setRecurrenceRules:(id)a3
{
  id v4 = a3;
  int v5 = [(REMReminderChangeItem *)self storage];
  [v5 setRecurrenceRules:v4];

  [(REMReminderChangeItem *)self clearAlternativeDisplayDateDateForCalendarIfInvalid];
}

- (double)nextRecurrentAdvanceAmountForDateComponents:(id)a3 afterDate:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    int v8 = [v6 timeZone];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    }
    uint64_t v12 = v10;

    id v13 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateWithDateComponents:timeZone:", v6, v12);
    uint64_t v14 = objc_msgSend(v6, "rem_isAllDayDateComponents");
    id v15 = [v7 laterDate:v13];

    uint64_t v16 = [(REMReminderChangeItem *)self recurrenceRules];
    id v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = MEMORY[0x1E4F1CBF0];
    }
    id v19 = +[REMRecurrenceRule nextRecurrentDueDateAfter:v15 dueDate:v13 timeZone:v12 allDay:v14 recurrenceRules:v18];

    if (v19)
    {
      [v19 timeIntervalSinceDate:v13];
      double v11 = v20;
    }
    else
    {
      double v11 = 0.0;
    }
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (id)nextRecurrentDueDateComponentsAfter:(id)a3
{
  id v4 = a3;
  int v5 = [(REMReminderChangeItem *)self dueDateComponents];
  id v6 = [v5 timeZone];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  }
  id v9 = v8;

  id v10 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateWithDateComponents:timeZone:", v5, v9);
  uint64_t v11 = objc_msgSend(v5, "rem_isAllDayDateComponents");
  uint64_t v12 = [v4 laterDate:v10];

  uint64_t v13 = [(REMReminderChangeItem *)self recurrenceRules];
  uint64_t v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v16 = +[REMRecurrenceRule nextRecurrentDueDateAfter:v12 dueDate:v10 timeZone:v9 allDay:v11 recurrenceRules:v15];

  if (v16)
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateComponentsWithDate:timeZone:isAllDay:", v16, v9, v11);
    uint64_t v18 = [v5 timeZone];

    if (!v18)
    {
      uint64_t v19 = objc_msgSend(v17, "rem_strippingTimeZone");

      id v17 = (void *)v19;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)addAlarmWithTrigger:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(REMReminderChangeItem *)self dueDateComponents];

    if (!v5)
    {
      id v6 = +[REMLogStore write];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        -[REMReminderChangeItem addAlarmWithTrigger:]();
      }
    }
  }
  id v7 = [[REMAlarm alloc] initWithTrigger:v4];
  [(REMReminderChangeItem *)self addAlarm:v7];

  return v7;
}

- (void)addAlarm:(id)a3
{
}

- (void)addAlarm:(id)a3 updateDisplayDate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[REMLogStore write];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_INFO, "Adding alarm  {reminderChangeItem: %@, alarm: %@}", (uint8_t *)&v12, 0x16u);
  }

  id v8 = [(REMReminderChangeItem *)self alarms];
  id v9 = (id)[v8 mutableCopy];

  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v9 addObject:v6];
  id v10 = [(REMReminderChangeItem *)self storage];
  [v10 setAlarms:v9];

  if (v4)
  {
    uint64_t v11 = [(REMReminderChangeItem *)self storage];
    [v11 updateDisplayDate];
  }
}

- (void)setAlarms:(id)a3
{
  BOOL v4 = (void *)[a3 copy];
  int v5 = [(REMReminderChangeItem *)self storage];
  [v5 setAlarms:v4];

  id v6 = [(REMReminderChangeItem *)self storage];
  [v6 updateDisplayDate];
}

- (void)setAlarms:(id)a3 updateDisplayDate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void *)[a3 copy];
  id v7 = [(REMReminderChangeItem *)self storage];
  [v7 setAlarms:v6];

  if (v4)
  {
    id v8 = [(REMReminderChangeItem *)self storage];
    [v8 updateDisplayDate];
  }
}

- (void)removeAlarm:(id)a3
{
}

- (void)removeAlarm:(id)a3 updateDisplayDate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(REMReminderChangeItem *)self alarms];
  id v10 = (id)[v7 mutableCopy];

  [v10 removeObject:v6];
  id v8 = [(REMReminderChangeItem *)self storage];
  [v8 setAlarms:v10];

  if (v4)
  {
    id v9 = [(REMReminderChangeItem *)self storage];
    [v9 updateDisplayDate];
  }
}

- (void)removeAllAlarms
{
  BOOL v3 = [(REMReminderChangeItem *)self storage];
  [v3 setAlarms:MEMORY[0x1E4F1CBF0]];

  id v4 = [(REMReminderChangeItem *)self storage];
  [v4 updateDisplayDate];
}

- (void)updateDisplayDate
{
  id v2 = [(REMReminderChangeItem *)self storage];
  [v2 updateDisplayDate];
}

- (BOOL)isSubtask
{
  id v2 = [(REMReminderChangeItem *)self parentReminderID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (REMReminderSubtaskContextChangeItem)subtaskContext
{
  BOOL v3 = [(REMReminderChangeItem *)self accountCapabilities];
  if ([v3 supportsSubtasks])
  {
    BOOL v4 = [(REMReminderChangeItem *)self isSubtask];

    if (!v4)
    {
      int v5 = [[REMReminderSubtaskContextChangeItem alloc] initWithReminderChangeItem:self];
      goto LABEL_6;
    }
  }
  else
  {
  }
  int v5 = 0;
LABEL_6:

  return v5;
}

- (REMReminderAttachmentContextChangeItem)attachmentContext
{
  BOOL v3 = [(REMReminderChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsAttachments];

  if (v4) {
    int v5 = [[REMReminderAttachmentContextChangeItem alloc] initWithReminderChangeItem:self];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (REMReminderFlaggedContextChangeItem)flaggedContext
{
  BOOL v3 = [(REMReminderChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsFlagged];

  if (v4) {
    int v5 = [[REMReminderFlaggedContextChangeItem alloc] initWithReminderChangeItem:self];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (REMReminderAssignmentContextChangeItem)assignmentContext
{
  BOOL v3 = [(REMReminderChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsAssignments];

  if (v4) {
    int v5 = [[REMReminderAssignmentContextChangeItem alloc] initWithReminderChangeItem:self];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (REMReminderHashtagContextChangeItem)hashtagContext
{
  BOOL v3 = [(REMReminderChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsHashtags];

  if (v4) {
    int v5 = [[REMReminderHashtagContextChangeItem alloc] initWithReminderChangeItem:self];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (REMReminderDueDateDeltaAlertContextChangeItem)dueDateDeltaAlertContext
{
  BOOL v3 = [(REMReminderChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsDueDateDeltaAlerts];

  if (v4) {
    int v5 = [[REMReminderDueDateDeltaAlertContextChangeItem alloc] initWithReminderChangeItem:self];
  }
  else {
    int v5 = 0;
  }

  return v5;
}

- (REMDueDateDeltaAlert)fetchedCurrentDueDateDeltaAlert
{
  id v2 = [(REMReminderChangeItem *)self storage];
  BOOL v3 = [v2 fetchedDueDateDeltaAlerts];
  int v4 = [v3 lastObject];

  return (REMDueDateDeltaAlert *)v4;
}

- (id)removeFromListAllowingUndo
{
  BOOL v3 = [(REMReminderChangeItem *)self listID];

  if (v3)
  {
    int v4 = [(REMReminderChangeItem *)self saveRequest];
    int v5 = [v4 _updateListWithReminderChangeItem:self];

    id v6 = [(REMReminderChangeItem *)self objectID];
    BOOL v3 = [v5 lowLevelRemoveReminderIDFromOrdering:v6];
  }
  [(REMReminderChangeItem *)self setListID:0];
  [(REMReminderChangeItem *)self setParentReminderID:0];

  return v3;
}

- (void)removeFromList
{
  id v2 = [(REMReminderChangeItem *)self removeFromListAllowingUndo];
}

- (void)updateAccountCapabilities:(id)a3
{
  id v4 = a3;
  [(REMReminderChangeItem *)self willChangeValueForKey:@"accountCapabilities"];
  int v5 = [(REMReminderChangeItem *)self saveRequest];
  id v6 = [(REMReminderChangeItem *)self objectID];
  [v5 _trackAccountCapabilities:v4 forObjectID:v6];

  [(REMReminderChangeItem *)self didChangeValueForKey:@"accountCapabilities"];
}

- (void)removeFromParentReminder
{
  id v2 = [(REMReminderChangeItem *)self removeFromParentReminderAllowingUndo];
}

- (id)changedKeys
{
  id v2 = [(REMReminderChangeItem *)self changedKeysObserver];
  BOOL v3 = [v2 changedKeys];

  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(REMReminderChangeItem *)self storage];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMReminderChangeItem;
  if (-[REMReminderChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(REMReminderChangeItem *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMReminderChangeItem *)self saveRequest];
  int v9 = [v8 isSaved];

  if (v9)
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v12, 2u);
    }
  }
  uint64_t v11 = [(REMReminderChangeItem *)self storage];
  [v11 setValue:v7 forKey:v6];
}

+ (id)resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDReminder:(id)a3
{
  BOOL v3 = (void *)__resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDReminder;
  id v4 = a3;
  if ([v3 containsObject:v4]) {
    int v5 = 0;
  }
  else {
    int v5 = v4;
  }
  id v6 = v5;

  return v6;
}

+ (id)resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDSavedReminder:(id)a3
{
  BOOL v3 = (void *)__resolutionTokenKeyDenylistForREMReminderChangeItemOfREMCDSavedReminder;
  id v4 = a3;
  if ([v3 containsObject:v4]) {
    int v5 = 0;
  }
  else {
    int v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(REMReminderChangeItem *)self objectID];
  id v6 = [v5 entityName];
  id v7 = +[REMTemplate cdEntityNameForSavedReminder];
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    +[REMReminderChangeItem resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDSavedReminder:v4];
  }
  else {
  int v9 = +[REMReminderChangeItem resolutionTokenKeyForChangedKeyInREMReminderChangeItemOfREMCDReminder:v4];
  }

  return v9;
}

- (BOOL)isUnsupported
{
  id v2 = [(REMReminderChangeItem *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMReminderStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (REMChangedKeysObserver)changedKeysObserver
{
  return self->_changedKeysObserver;
}

- (void)setChangedKeysObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedKeysObserver, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_saveRequest, 0);
}

- (id)confirmForSiriFoundInAppsAppendingToList:(id)a3
{
  id v4 = a3;
  int v5 = [(REMReminderChangeItem *)self saveRequest];
  id v6 = [v5 addReminderWithTitle:&stru_1F1339A18 toListChangeItem:v4];

  [(REMReminderChangeItem *)self copyInto:v6];
  [(REMReminderChangeItem *)self setCompleted:1];
  [(REMReminderChangeItem *)self setSiriFoundInAppsUserConfirmation:1];

  return v6;
}

- (void)rejectForSiriFoundInApps
{
  [(REMReminderChangeItem *)self setCompleted:1];

  [(REMReminderChangeItem *)self setSiriFoundInAppsUserConfirmation:2];
}

- (void)removeAllSnoozeAlarms
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(REMReminderChangeItem *)self alarms];
  id v4 = (void *)v3;
  int v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    int v5 = (void *)v3;
  }
  id v6 = v5;

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSnooze", (void)v14))
        {
          [(REMReminderChangeItem *)self removeAlarm:v13 updateDisplayDate:0];
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);

    if (v10) {
      [(REMReminderChangeItem *)self updateDisplayDate];
    }
  }
  else
  {
  }
}

- (void)snoozeFromNowForTimeInterval:(double)a3
{
  int v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v5 dateByAddingTimeInterval:a3];

  [(REMReminderChangeItem *)self snoozeToDate:v6];
}

- (void)snoozeToDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9D8];
  int v5 = (void *)MEMORY[0x1E4F1CAF0];
  id v6 = a3;
  id v7 = [v5 defaultTimeZone];
  objc_msgSend(v4, "rem_dateComponentsWithDate:timeZone:isAllDay:", v6, v7, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [(REMReminderChangeItem *)self _createSnoozeAlarmWithDateComponents:v8];
}

- (void)snoozeToNextThirds
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9D8];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  int v5 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  objc_msgSend(v3, "rem_dateComponentsWithDate:timeZone:isAllDay:", v4, v5, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = objc_opt_class();
  objc_msgSend(v7, "setHour:", objc_msgSend(v6, "nextThirdsHour:", objc_msgSend((id)objc_opt_class(), "nextThirdsHourFromHour:", objc_msgSend(v7, "hour"))));
  [v7 setMinute:0];
  [v7 setSecond:0];
  [(REMReminderChangeItem *)self _createSnoozeAlarmWithDateComponents:v7];
}

- (void)snoozeForever
{
  id v2 = [(REMReminderChangeItem *)self _cleanupOriginalAlarmsForSnoozing];
}

- (void)snoozeFromDueDateForFutureIntegralMultipleOfTimeInterval:(double)a3
{
  id v15 = [(REMReminderChangeItem *)self dueDateComponents];
  if (v15)
  {
    int v5 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateWithDateComponents:timeZone:", v15, v5);
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [(REMReminderChangeItem *)self _timeIntervalToAddSinceStartDate:v6 withNow:v7 step:a3];
    double v9 = v8;

    char v10 = objc_msgSend(v15, "rem_dateComponentsByAddingTimeInterval:", v9);
    [(REMReminderChangeItem *)self _createSnoozeAlarmWithDateComponents:v10];
  }
  else
  {
    uint64_t v11 = [(REMReminderChangeItem *)self displayDate];
    int v5 = [v11 date];

    if (v5)
    {
      int v12 = [MEMORY[0x1E4F1C9C8] date];
      [(REMReminderChangeItem *)self _timeIntervalToAddSinceStartDate:v5 withNow:v12 step:a3];
      double v14 = v13;

      [v5 dateByAddingTimeInterval:v14];
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a3];
    id v6 = };
    [(REMReminderChangeItem *)self snoozeToDate:v6];
  }
}

- (double)_timeIntervalToAddSinceStartDate:(id)a3 withNow:(id)a4 step:(double)a5
{
  [a4 timeIntervalSinceDate:a3];
  return (double)(uint64_t)fmax(ceil(v6 / a5), 1.0) * a5;
}

- (void)_createSnoozeAlarmWithDateComponents:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    int v5 = [(REMReminderChangeItem *)self _cleanupOriginalAlarmsForSnoozing];
    double v6 = [[REMAlarmDateTrigger alloc] initWithDateComponents:v4];

    id v7 = [(REMReminderChangeItem *)self addAlarmWithTrigger:v6];
    [v7 setOriginalAlarmUID:v5];
    double v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = [v7 description];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Adding snooze alarm: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)_cleanupOriginalAlarmsForSnoozing
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(REMReminderChangeItem *)self alarms];
  id v4 = (void *)v3;
  int v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    int v5 = (void *)v3;
  }
  id v6 = v5;

  __int16 v33 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [(REMReminderChangeItem *)self dedupedAndFilteredNonSnoozeAlarms:v6];
  uint64_t v8 = [v6 count];
  BOOL v32 = v8 != [v7 count];
  [(REMReminderChangeItem *)self setAlarms:v7 updateDisplayDate:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v15 isOriginal])
        {
          long long v16 = +[REMLogStore write];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            long long v17 = [v15 description];
            *(_DWORD *)buf = 138412290;
            long long v39 = v17;
            _os_log_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_INFO, "Acknowledging original alarm: %@", buf, 0xCu);
          }
          if (!v12
            || ([v15 trigger],
                uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                int v19 = [v18 isTemporal],
                v18,
                v19))
          {
            uint64_t v20 = [v15 alarmUID];

            uint64_t v12 = (void *)v20;
          }
          long long v21 = [v15 trigger];
          int v22 = [v21 isTemporal];

          if (v22)
          {
            [(REMReminderChangeItem *)self removeAlarm:v15 updateDisplayDate:0];
            id v23 = [REMAlarm alloc];
            id v24 = +[REMAlarm newObjectID];
            int v25 = [(REMAlarm *)v23 initWithAlarm:v15 objectID:v24];

            [(REMReminderChangeItem *)self addAlarm:v25 updateDisplayDate:0];
            [v25 setAcknowledgedDate:v33];
            id v26 = [v15 alarmUID];
            [v25 setAlarmUID:v26];

            id v27 = +[REMLogStore write];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = [v25 description];
              *(_DWORD *)buf = 138412290;
              long long v39 = v28;
              _os_log_impl(&dword_1B9AA2000, v27, OS_LOG_TYPE_INFO, "Replacing alarm with acknowledged version: %@", buf, 0xCu);
            }
            BOOL v32 = 1;
          }
          else
          {
            int v25 = +[REMLogStore write];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              id v29 = [v15 description];
              *(_DWORD *)buf = 138412290;
              long long v39 = v29;
              _os_log_impl(&dword_1B9AA2000, v25, OS_LOG_TYPE_INFO, "Not replacing non-temporal alarm: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  if (v32) {
    [(REMReminderChangeItem *)self updateDisplayDate];
  }
  id v30 = v12;

  return v30;
}

- (void)initWithSaveRequest:storage:accountCapabilities:changedKeysObserver:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = NSString;
  id v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  id v4 = NSStringFromSelector(v0);
  int v5 = [v1 stringWithFormat:@"%@.%@", v3, v4];
  OUTLINED_FUNCTION_1();
  id v9 = "storage";
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8);
}

- (void)initWithObjectID:title:insertIntoParentReminderSubtaskContextChangeItem:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (listChangeItem == nil) -- listChangeItem is nil. Unable to insert ordering info to the list.", v2, v3, v4, v5, v6);
}

- (void)accountCapabilities
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "trackedAccountCapabilities is unexpectedly nil when getting reminderChangeItem.accountCapabilities {objectID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)duplicateForRecurrenceUsingReminderID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "Malformed original reminder - either parentReminderID or listID must be non-nil.", v2, v3, v4, v5, v6);
}

- (void)duplicateForRecurrenceUsingReminderID:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 listID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "Unable to duplicate. Cannot find list with listID {listID: %@}", v4, v5, v6, v7, v8);
}

- (void)duplicateForRecurrenceUsingReminderID:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 parentReminderID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "Unable to duplicate. parentReminderID is present but parentReminder.subtaskContext is nil. {parentReminderID: %@}", v4, v5, v6, v7, v8);
}

+ (void)_ensureDueDateDeltaAlertsAreFetchedIfNecessary:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [v2 remObjectID];
  OUTLINED_FUNCTION_2();
  __int16 v5 = 2114;
  uint64_t v6 = v1;
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "_ensureDueDateDeltaAlertsAreFetchedIfNecessary - Error fetching dueDateDeltaAlerts {reminder: %{public}@, error: %{public}@}", v4, 0x16u);
}

- (void)advanceForwardToNextRecurrenceAfterDate:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v2, v3, "AdvanceRecurrence: Unable to advance recurrent reminder with dueDateAdvanceAmount < 0 {reminderID: %{public}@, dueDateAdvanceAmount: %f}", v4);
}

- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B9AA2000, v2, v3, "setAlternativeDisplayDate: cannot set date on reminder {reminderID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)shallowCopyWithSaveRequest:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = NSString;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = NSStringFromSelector(v0);
  uint64_t v5 = [v1 stringWithFormat:@"%@.%@", v3, v4];
  OUTLINED_FUNCTION_1();
  id v9 = "self.storage";
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8);
}

- (void)shallowCopyWithSaveRequest:.cold.2()
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = v1;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = NSStringFromSelector(v0);
  uint64_t v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];
  int v10 = 138543618;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v2;
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v8, v9, "[%{public}@] self.objectID should not be nil when copying this change item {self: %@}", (uint8_t *)&v10);
}

- (void)shallowCopyWithSaveRequest:(NSObject *)a3 .cold.3(void *a1, const char *a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = NSString;
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = NSStringFromSelector(a2);
  int v10 = [v6 stringWithFormat:@"%@.%@", v8, v9];
  uint64_t v11 = [a1 objectID];
  *(_DWORD *)buf = 138543618;
  uint64_t v13 = v10;
  __int16 v14 = 2114;
  id v15 = v11;
  _os_log_fault_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_FAULT, "[%{public}@] _trackedAccountCapabilitiesForObjectID should NOT yield nil result when copying this change item with a non-nil save request {objectID: %{public}@}", buf, 0x16u);
}

- (void)setIcsDisplayOrder:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "rem_log_fault_if (listChangeItem == nil) -- listChangeItem is nil. Unable to update list when setting icsDisplayOrder.", v2, v3, v4, v5, v6);
}

- (void)addAlarmWithTrigger:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "Behavior is undefined if you set a time interval (duration) alarm trigger without a due date on the reminder!", v2, v3, v4, v5, v6);
}

@end