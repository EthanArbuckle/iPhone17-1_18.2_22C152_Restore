@interface REMCDReminder
+ (BOOL)isAbstract;
+ (BOOL)shouldAttemptLocalObjectMerge;
+ (id)cdEntityName;
+ (id)dueDateComponentsWithDueDate:(id)a3 isAllDay:(BOOL)a4 timeZoneName:(id)a5;
+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5;
+ (id)fetchRequest;
+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion;
+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5;
+ (id)propertiesThatShouldTriggerReindexing;
+ (id)recordTypes;
+ (id)timeZoneFromName:(id)a3;
- (BOOL)_validateAssignmentsForInvalidSharees:(id *)a3;
- (BOOL)_validateForReminderTreeConsistency:(id *)a3;
- (BOOL)_validateMoveAcrossLists:(id *)a3;
- (BOOL)_validateMoveAcrossSharedLists:(id *)a3;
- (BOOL)isConnectedToAccountObject:(id)a3;
- (BOOL)markExtraneousAlarmsForDeletion;
- (BOOL)mergeWithLocalObject:(id)a3;
- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately;
- (BOOL)shouldUseResolutionTokenMapForMergingData;
- (BOOL)supportsDeletionByTTL;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForInsert_Swift:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (BOOL)willSave_handledExtraneousAlarmsMarking;
- (BOOL)willSave_handledUpdateDisplayDate;
- (BOOL)willSave_hasProcessedDueDateDeltaAlertsDataChanges;
- (CKRecord)ckServerRecord;
- (NSArray)alarms;
- (NSDateComponents)dueDateComponents;
- (NSDateComponents)startDateComponents;
- (RDDueDateDeltaAlerts)cachedDeserializedDueDateDeltaAlerts;
- (REMCDList)previousList;
- (REMDisplayDate)displayDate;
- (REMDisplayDateUtils)displayDateUtils;
- (id)existingLocalObjectToMergeWithPredicate:(id)a3;
- (id)newlyCreatedRecord;
- (id)objectsToBeDeletedBeforeThisObject;
- (id)parentCloudObject;
- (id)recordType;
- (id)recordZoneName;
- (int64_t)parentEffectiveMinimumSupportedVersion;
- (unint64_t)displayOrder;
- (void)debug_lowLevelRemoveFromParent;
- (void)didSave;
- (void)didSave_Swift;
- (void)fixBrokenReferences;
- (void)incrementSpotlightIndexCount;
- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4;
- (void)prepareForDeletion_Swift;
- (void)processDueDateDeltaAlertsDataChanges;
- (void)setCachedDeserializedDueDateDeltaAlerts:(id)a3;
- (void)setCkServerRecord:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setDisplayOrder:(unint64_t)a3;
- (void)setDueDateComponents:(id)a3;
- (void)setList:(id)a3;
- (void)setPreviousList:(id)a3;
- (void)setStartDateComponents:(id)a3;
- (void)setWillSave_handledExtraneousAlarmsMarking:(BOOL)a3;
- (void)setWillSave_handledUpdateDisplayDate:(BOOL)a3;
- (void)setWillSave_hasProcessedDueDateDeltaAlertsDataChanges:(BOOL)a3;
- (void)updateDisplayDate;
- (void)updateDisplayDateWithAlarm:(id)a3;
- (void)willChangeList:(id)a3 toList:(id)a4;
- (void)willChangeValueForKey_Swfit:(id)a3;
- (void)willSave;
- (void)willSave_Swift;
@end

@implementation REMCDReminder

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"REMCDReminder"];
}

- (void)setList:(id)a3
{
  id v5 = a3;
  v4 = [(REMCDReminder *)self primitiveValueForKey:@"list"];
  [(REMCDReminder *)self setPreviousList:v4];

  if (objc_opt_respondsToSelector()) {
    [(REMCDReminder *)self willChangeList:self->previousList toList:v5];
  }
  [(REMCDObject *)self willChangeValueForKey:@"list"];
  [(REMCDReminder *)self setPrimitiveValue:v5 forKey:@"list"];
  [(REMCDObject *)self didChangeValueForKey:@"list"];
}

- (BOOL)validateForInsert:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)REMCDReminder;
  unsigned int v5 = -[REMCDObject validateForInsert:](&v12, "validateForInsert:");
  if (!v5 || [(REMCDReminder *)self _validateForReminderTreeConsistency:a3])
  {
    char v6 = 1;
    return v5 & v6;
  }
  v7 = [(REMCDObject *)self storeControllerManagedObjectContext];

  if (!v7)
  {
    v9 = 0;
LABEL_9:

    char v6 = 0;
    return v5 & v6;
  }
  v8 = [(REMCDObject *)self storeControllerManagedObjectContext];
  v9 = [v8 validationPolicy];

  if (!v9 || ![v9 saveShouldContinueIfCustomValidationFailed]) {
    goto LABEL_9;
  }
  BOOL v10 = 1;
  [v9 setCustomValidationFailed:1];

  return v10;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)REMCDReminder;
  unsigned __int8 v5 = -[REMCDObject validateForUpdate:](&v12, "validateForUpdate:");
  unsigned int v6 = [(REMCDReminder *)self _validateMoveAcrossLists:a3];
  v7 = [(REMCDObject *)self storeControllerManagedObjectContext];

  if (!v7
    || ([(REMCDObject *)self storeControllerManagedObjectContext],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 validationPolicy],
        v7 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v7))
  {
    char v9 = 1;
    goto LABEL_7;
  }
  char v9 = 0;
  if ([v7 shouldValidateMoveAcrossSharedList])
  {
LABEL_7:
    if (!v6 || ![(REMCDReminder *)self _validateMoveAcrossSharedLists:a3]) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  unsigned __int8 v10 = 0;
  if (!v6)
  {
LABEL_11:
    if (v9) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
LABEL_9:
  if ([(REMCDReminder *)self _validateForReminderTreeConsistency:a3])
  {
    unsigned __int8 v10 = [(REMCDReminder *)self _validateAssignmentsForInvalidSharees:a3];
    goto LABEL_11;
  }
LABEL_13:
  unsigned __int8 v10 = 0;
  if (v9)
  {
LABEL_17:
    v5 &= v10;
    goto LABEL_18;
  }
LABEL_14:
  if ((v10 & 1) != 0 || ![v7 saveShouldContinueIfCustomValidationFailed]) {
    goto LABEL_17;
  }
  [v7 setCustomValidationFailed:1];
LABEL_18:

  return v5;
}

- (BOOL)_validateMoveAcrossLists:(id *)a3
{
  id v5 = objc_alloc((Class)REMAccountCapabilities);
  unsigned int v6 = [(REMCDReminder *)self account];
  id v7 = [v5 initWithAccountType:[v6 type]];

  if ([v7 supportsMoveAcrossLists]) {
    goto LABEL_10;
  }
  uint64_t v8 = [(REMCDReminder *)self previousList];
  if (!v8) {
    goto LABEL_10;
  }
  char v9 = (void *)v8;
  uint64_t v10 = [(REMCDReminder *)self list];
  if (!v10)
  {

    goto LABEL_10;
  }
  v11 = (void *)v10;
  objc_super v12 = [(REMCDReminder *)self previousList];
  v13 = [v12 identifier];
  v14 = [(REMCDReminder *)self list];
  v15 = [v14 identifier];
  unsigned __int8 v16 = [v13 isEqual:v15];

  if (v16)
  {
LABEL_10:
    LOBYTE(a3) = 1;
    goto LABEL_11;
  }
  v17 = +[REMLogStore write];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10074E730(self);
  }

  if (a3)
  {
    v18 = [(REMCDReminder *)self previousList];
    v19 = [v18 remObjectID];
    v20 = [(REMCDReminder *)self list];
    v21 = [v20 remObjectID];
    v22 = [(REMCDReminder *)self account];
    v23 = [v22 remObjectID];
    *a3 = +[REMError validationErrorMoveReminderFromList:v19 toList:v21 inAccount:v23];

    LOBYTE(a3) = 0;
  }
LABEL_11:

  return (char)a3;
}

- (BOOL)_validateMoveAcrossSharedLists:(id *)a3
{
  id v5 = objc_alloc((Class)REMAccountCapabilities);
  unsigned int v6 = [(REMCDReminder *)self account];
  id v7 = [v5 initWithAccountType:[v6 type]];

  if ([v7 supportsMoveAcrossSharedLists]) {
    goto LABEL_7;
  }
  uint64_t v8 = [(REMCDReminder *)self previousList];
  if (!v8) {
    goto LABEL_7;
  }
  char v9 = (void *)v8;
  uint64_t v10 = [(REMCDReminder *)self list];
  if (!v10) {
    goto LABEL_6;
  }
  v11 = (void *)v10;
  objc_super v12 = [(REMCDReminder *)self previousList];
  v13 = [v12 identifier];
  v14 = [(REMCDReminder *)self list];
  v15 = [v14 identifier];
  if ([v13 isEqual:v15])
  {

LABEL_6:
LABEL_7:
    BOOL v16 = 1;
    goto LABEL_8;
  }
  v28 = a3;
  v18 = [(REMCDReminder *)self previousList];
  if ([v18 isShared])
  {
  }
  else
  {
    v19 = [(REMCDReminder *)self list];
    unsigned __int8 v27 = [v19 isShared];

    if ((v27 & 1) == 0) {
      goto LABEL_7;
    }
  }
  v20 = +[REMLogStore write];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10074E828(self);
  }

  if (v28)
  {
    v21 = [(REMCDReminder *)self previousList];
    v22 = [v21 remObjectID];
    v23 = [(REMCDReminder *)self list];
    v24 = [v23 remObjectID];
    v25 = [(REMCDReminder *)self account];
    v26 = [v25 remObjectID];
    id *v28 = +[REMError validationErrorMoveReminderFromList:v22 toList:v24 inAccount:v26];
  }
  BOOL v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)_validateForReminderTreeConsistency:(id *)a3
{
  uint64_t v5 = [(REMCDReminder *)self parentReminder];
  if (!v5) {
    goto LABEL_10;
  }
  unsigned int v6 = (void *)v5;
  uint64_t v7 = [(REMCDReminder *)self children];
  if (!v7)
  {

    goto LABEL_10;
  }
  uint64_t v8 = (void *)v7;
  char v9 = [(REMCDReminder *)self children];
  id v10 = [v9 count];

  if (!v10)
  {
LABEL_10:
    BOOL v15 = 1;
    goto LABEL_11;
  }
  v11 = +[REMLogStore write];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10074EB84(self, v11);
  }

  if (a3)
  {
    objc_super v12 = [(REMCDObject *)self remObjectID];
    v13 = [(REMCDReminder *)self parentReminder];
    v14 = [v13 remObjectID];
    *a3 = +[REMError validationErrorNestedSubtask:v12 parentReminderID:v14];
  }
  BOOL v15 = 0;
LABEL_11:
  uint64_t v16 = [(REMCDReminder *)self parentReminder];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(REMCDReminder *)self parentReminder];
    if ([v18 markedForDeletion])
    {
LABEL_20:

      goto LABEL_21;
    }
    v19 = [(REMCDReminder *)self parentReminder];
    if ([v19 ckNeedsInitialFetchFromCloud])
    {
LABEL_19:

      goto LABEL_20;
    }
    [(REMCDReminder *)self parentReminder];
    BOOL v43 = v15;
    v21 = v20 = a3;
    v22 = [v21 list];
    v23 = [v22 identifier];
    v24 = [(REMCDReminder *)self list];
    v25 = [v24 identifier];

    a3 = v20;
    BOOL v15 = v43;

    if (v23 != v25)
    {
      v26 = +[REMLogStore write];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10074EA40(self);
      }

      if (!a3)
      {
        BOOL v15 = 0;
        goto LABEL_21;
      }
      v17 = [(REMCDObject *)self remObjectID];
      v18 = [(REMCDReminder *)self parentReminder];
      v19 = [v18 remObjectID];
      +[REMError validationErrorSubtaskAndParentNotOnSameList:v17 parentReminderID:v19];
      BOOL v15 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
LABEL_21:
  if (([(REMCDReminder *)self ckNeedsInitialFetchFromCloud] & 1) == 0
    && ([(REMCDReminder *)self markedForDeletion] & 1) == 0)
  {
    unsigned __int8 v27 = [(REMCDReminder *)self children];

    if (v27)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v28 = [(REMCDReminder *)self children];
      id v29 = [v28 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v29)
      {
        id v30 = v29;
        BOOL v44 = v15;
        v42 = a3;
        uint64_t v31 = *(void *)v46;
        while (2)
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v46 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            v34 = [v33 list:v42];
            v35 = [v34 identifier];
            v36 = [(REMCDReminder *)self list];
            v37 = [v36 identifier];

            if (v35 != v37)
            {
              v38 = +[REMLogStore write];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                sub_10074E920(v33, self);
              }

              if (v42)
              {
                v39 = [v33 remObjectID];
                v40 = [(REMCDObject *)self remObjectID];
                id *v42 = +[REMError validationErrorSubtaskAndParentNotOnSameList:v39 parentReminderID:v40];
              }
              BOOL v15 = 0;
              goto LABEL_38;
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v30) {
            continue;
          }
          break;
        }
        BOOL v15 = v44;
      }
LABEL_38:
    }
  }
  return v15;
}

- (BOOL)_validateAssignmentsForInvalidSharees:(id *)a3
{
  id v4 = objc_alloc((Class)REMAccountCapabilities);
  uint64_t v5 = [(REMCDReminder *)self account];
  id v6 = [v4 initWithAccountType:[v5 type]];

  LODWORD(v4) = [v6 supportsAssignments];
  v79 = v6;
  unsigned __int8 v7 = [v6 supportsMoveAcrossSharedLists];
  if (!v4) {
    goto LABEL_51;
  }
  unsigned __int8 v78 = v7;
  uint64_t v8 = [(REMCDReminder *)self previousList];
  if (v8)
  {
    char v9 = [(REMCDReminder *)self list];
    if (v9)
    {
      id v10 = [(REMCDReminder *)self previousList];
      v11 = [v10 identifier];
      [(REMCDReminder *)self list];
      v13 = objc_super v12 = self;
      v14 = [v13 identifier];
      unsigned int v15 = [v11 isEqual:v14] ^ 1;

      self = v12;
    }
    else
    {
      unsigned int v15 = 0;
    }
  }
  else
  {
    unsigned int v15 = 0;
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v16 = [(REMCDReminder *)self assignments];
  v17 = [v16 objectEnumerator];

  obj = v17;
  id v88 = [v17 countByEnumeratingWithState:&v89 objects:v103 count:16];
  if (!v88)
  {
LABEL_50:

    goto LABEL_51;
  }
  char v80 = 0;
  uint64_t v87 = *(void *)v90;
  v84 = self;
  unsigned int v82 = v15;
  do
  {
    v18 = 0;
    do
    {
      if (*(void *)v90 != v87) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v89 + 1) + 8 * (void)v18);
      if (!v15)
      {
        int v36 = 0;
LABEL_28:
        int v53 = 0;
        goto LABEL_29;
      }
      uint64_t v20 = [*(id *)(*((void *)&v89 + 1) + 8 * (void)v18) assignee];
      if (v20)
      {
        v21 = (void *)v20;
        v22 = [v19 assignee];
        v23 = [v22 list];
        v24 = [v23 identifier];
        v25 = [(REMCDReminder *)self list];
        v26 = [v25 identifier];

        if (v24 == v26)
        {
          int v36 = 0;
        }
        else
        {
          unsigned __int8 v27 = +[REMLogStore write];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v19 identifier];
            id v29 = [(REMCDReminder *)v84 identifier];
            v85 = [(REMCDReminder *)v84 previousList];
            id v30 = [v85 identifier];
            uint64_t v31 = [(REMCDReminder *)v84 list];
            v32 = [v31 identifier];
            [(REMCDReminder *)v84 account];
            v34 = v33 = v19;
            v35 = [v34 identifier];
            *(_DWORD *)buf = 138544386;
            v94 = v28;
            __int16 v95 = 2114;
            v96 = v29;
            __int16 v97 = 2114;
            v98 = v30;
            __int16 v99 = 2114;
            v100 = v32;
            __int16 v101 = 2114;
            v102 = v35;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Validation Update: Moving reminder to another list nullifies assignee in its assignments {assignment.identifier: %{public}@, reminder.identifier: %{public}@, fromList.identifier: %{public}@, toList.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x34u);

            v19 = v33;
          }

          int v36 = 1;
          char v80 = 1;
        }
        self = v84;
        unsigned int v15 = v82;
      }
      else
      {
        int v36 = 0;
      }
      uint64_t v37 = [v19 originator];
      if (!v37) {
        goto LABEL_28;
      }
      v38 = (void *)v37;
      v86 = v19;
      v39 = [v19 originator];
      v40 = [v39 list];
      v41 = [v40 identifier];
      v42 = self;
      BOOL v43 = [(REMCDReminder *)self list];
      BOOL v44 = [v43 identifier];

      if (v41 == v44)
      {
        int v53 = 0;
        v19 = v86;
        self = v42;
      }
      else
      {
        long long v45 = +[REMLogStore write];
        self = v42;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          long long v46 = [v86 identifier];
          long long v47 = [(REMCDReminder *)v42 identifier];
          v81 = [(REMCDReminder *)self previousList];
          long long v48 = [v81 identifier];
          v49 = [(REMCDReminder *)v84 list];
          v50 = [v49 identifier];
          v51 = [(REMCDReminder *)v84 account];
          v52 = [v51 identifier];
          *(_DWORD *)buf = 138544386;
          v94 = v46;
          __int16 v95 = 2114;
          v96 = v47;
          __int16 v97 = 2114;
          v98 = v48;
          __int16 v99 = 2114;
          v100 = v50;
          __int16 v101 = 2114;
          v102 = v52;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Validation Update: Moving reminder to another list nullifies origiantor in its assignments {assignment.identifier: %{public}@, reminder.identifier: %{public}@, fromList.identifier: %{public}@, toList.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x34u);

          self = v84;
          unsigned int v15 = v82;
        }
        char v80 = 1;
        int v53 = 1;
        v19 = v86;
      }
LABEL_29:
      uint64_t v54 = [v19 assignee];
      if (v54)
      {
        v55 = (void *)v54;
        v56 = [v19 assignee];
        unsigned __int8 v57 = +[REMCDAssignment isShareeActivelyParticipatingWithSharee:v56];

        if ((v57 & 1) == 0)
        {
          v58 = +[REMLogStore write];
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = [v19 identifier];
            v60 = [(REMCDReminder *)self identifier];
            [(REMCDReminder *)self account];
            v62 = v61 = v19;
            [v62 identifier];
            v64 = v63 = self;
            *(_DWORD *)buf = 138543874;
            v94 = v59;
            __int16 v95 = 2114;
            v96 = v60;
            __int16 v97 = 2114;
            v98 = v64;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Validation Update: Assignee in disallowed status and hence will be nullified {assignment.identifier: %{public}@, reminder.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x20u);

            self = v63;
            v19 = v61;
          }
          int v36 = 1;
        }
      }
      uint64_t v65 = [v19 originator];
      if (v65)
      {
        v66 = (void *)v65;
        v67 = [v19 originator];
        unsigned __int8 v68 = +[REMCDAssignment isShareeActivelyParticipatingWithSharee:v67];

        if ((v68 & 1) == 0)
        {
          v69 = +[REMLogStore write];
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = [v19 identifier];
            v71 = [(REMCDReminder *)self identifier];
            [(REMCDReminder *)self account];
            v73 = v72 = v19;
            [v73 identifier];
            v75 = v74 = self;
            *(_DWORD *)buf = 138543874;
            v94 = v70;
            __int16 v95 = 2114;
            v96 = v71;
            __int16 v97 = 2114;
            v98 = v75;
            _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Validation Update: Originator in disallowed status and hence will be nullified {assignment.identifier: %{public}@, reminder.identifier: %{public}@, account.identifier: %{public}@}", buf, 0x20u);

            self = v74;
            v19 = v72;
          }
          int v53 = 1;
        }
      }
      if (v36) {
        [v19 setAssignee:0];
      }
      if (v53) {
        [v19 setOriginator:0];
      }
      v18 = (char *)v18 + 1;
    }
    while (v88 != v18);
    id v76 = [obj countByEnumeratingWithState:&v89 objects:v103 count:16];
    id v88 = v76;
  }
  while (v76);

  if (!(v78 & 1 | ((v80 & 1) == 0)))
  {
    obj = +[REMLogStore write];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      sub_10074EC74(self, obj);
    }
    goto LABEL_50;
  }
LABEL_51:

  return 1;
}

- (REMDisplayDate)displayDate
{
  v3 = [(REMCDReminder *)self displayDateDate];
  if (v3)
  {
    id v4 = [(REMCDReminder *)self displayDateTimeZone];
    if (v4)
    {
      uint64_t v5 = +[NSTimeZone timeZoneWithName:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v6 = [objc_alloc((Class)REMDisplayDate) initWithDate:v3 allDay:-[REMCDReminder displayDateIsAllDay](self, "displayDateIsAllDay") timeZone:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (REMDisplayDate *)v6;
}

- (void)setDisplayDate:(id)a3
{
  id v10 = a3;
  id v4 = [(REMCDReminder *)self displayDate];
  unsigned __int8 v5 = [v4 isEqual:v10];

  if ((v5 & 1) == 0)
  {
    id v6 = [v10 date];
    [(REMCDReminder *)self setDisplayDateDate:v6];

    -[REMCDReminder setDisplayDateIsAllDay:](self, "setDisplayDateIsAllDay:", [v10 isAllDay]);
    unsigned __int8 v7 = [v10 timeZone];
    uint64_t v8 = [v7 name];
    [(REMCDReminder *)self setDisplayDateTimeZone:v8];

    char v9 = +[NSTimeZone defaultTimeZone];
    -[REMCDReminder setDisplayDateUpdatedForSecondsFromGMT:](self, "setDisplayDateUpdatedForSecondsFromGMT:", [v9 secondsFromGMT]);
  }
}

- (REMDisplayDateUtils)displayDateUtils
{
  displayDateUtils = self->_displayDateUtils;
  if (!displayDateUtils)
  {
    id v4 = (REMDisplayDateUtils *)objc_alloc_init((Class)REMDisplayDateUtils);
    unsigned __int8 v5 = self->_displayDateUtils;
    self->_displayDateUtils = v4;

    displayDateUtils = self->_displayDateUtils;
  }

  return displayDateUtils;
}

- (void)willSave
{
  v9.receiver = self;
  v9.super_class = (Class)REMCDReminder;
  [(REMCDObject *)&v9 willSave];
  if ([(REMCDReminder *)self willSave_handledExtraneousAlarmsMarking])
  {
    char v3 = 0;
  }
  else
  {
    [(REMCDReminder *)self setWillSave_handledExtraneousAlarmsMarking:1];
    id v4 = [(REMCDReminder *)self changedValues];
    unsigned __int8 v5 = [v4 allKeys];

    if ([v5 containsObject:@"alarmStorage"]
      && (objc_opt_respondsToSelector() & 1) != 0
      && [(REMCDReminder *)self markExtraneousAlarmsForDeletion])
    {
      if ([(REMCDReminder *)self willSave_handledUpdateDisplayDate])
      {
        uint64_t v8 = +[REMLogStore write];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          sub_10074EDB0(self, v8);
        }
      }
      char v3 = 1;
    }
    else
    {
      char v3 = 0;
    }
  }
  if (![(REMCDReminder *)self willSave_handledUpdateDisplayDate])
  {
    [(REMCDReminder *)self setWillSave_handledUpdateDisplayDate:1];
    id v6 = [(REMCDReminder *)self changedValues];
    unsigned __int8 v7 = [v6 allKeys];

    if ((v3 & 1) != 0
      || ([v7 containsObject:@"alarmStorage"] & 1) != 0
      || [v7 containsObject:@"dueDate"])
    {
      [(REMCDReminder *)self updateDisplayDate];
    }
  }
}

- (void)didSave
{
  v3.receiver = self;
  v3.super_class = (Class)REMCDReminder;
  [(REMCDObject *)&v3 didSave];
  [(REMCDReminder *)self setWillSave_handledUpdateDisplayDate:0];
  [(REMCDReminder *)self setWillSave_handledExtraneousAlarmsMarking:0];
}

- (void)updateDisplayDate
{
  id v6 = [(REMCDReminder *)self displayDateUtils];
  objc_super v3 = [(REMCDReminder *)self dueDateComponents];
  id v4 = [(REMCDReminder *)self alarms];
  unsigned __int8 v5 = [v6 displayDateWithDueDateComponents:v3 alarms:v4];
  [(REMCDReminder *)self setDisplayDate:v5];
}

- (void)updateDisplayDateWithAlarm:(id)a3
{
  id v4 = a3;
  id v8 = [(REMCDReminder *)self displayDateUtils];
  unsigned __int8 v5 = [(REMCDReminder *)self dueDateComponents];
  id v6 = [v4 modelObject];

  unsigned __int8 v7 = [v8 updateDisplayDateWithDueDateComponents:v5 alarm:v6 alarmsProviding:self];
  [(REMCDReminder *)self setDisplayDate:v7];
}

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMReminder cdEntityName];
}

- (void)incrementSpotlightIndexCount
{
  if ([(REMCDReminder *)self spotlightIndexCount] == (id)0x7FFFFFFFFFFFFFFFLL) {
    objc_super v3 = 0;
  }
  else {
    objc_super v3 = (char *)[(REMCDReminder *)self spotlightIndexCount] + 1;
  }

  [(REMCDReminder *)self setSpotlightIndexCount:v3];
}

+ (id)propertiesThatShouldTriggerReindexing
{
  return +[NSSet setWithArray:&off_1008D7868];
}

- (REMCDList)previousList
{
  return self->previousList;
}

- (void)setPreviousList:(id)a3
{
}

- (BOOL)willSave_handledExtraneousAlarmsMarking
{
  return self->willSave_handledExtraneousAlarmsMarking;
}

- (void)setWillSave_handledExtraneousAlarmsMarking:(BOOL)a3
{
  self->willSave_handledExtraneousAlarmsMarking = a3;
}

- (BOOL)willSave_handledUpdateDisplayDate
{
  return self->willSave_handledUpdateDisplayDate;
}

- (void)setWillSave_handledUpdateDisplayDate:(BOOL)a3
{
  self->willSave_handledUpdateDisplayDate = a3;
}

- (BOOL)willSave_hasProcessedDueDateDeltaAlertsDataChanges
{
  return self->willSave_hasProcessedDueDateDeltaAlertsDataChanges;
}

- (void)setWillSave_hasProcessedDueDateDeltaAlertsDataChanges:(BOOL)a3
{
  self->willSave_hasProcessedDueDateDeltaAlertsDataChanges = a3;
}

- (RDDueDateDeltaAlerts)cachedDeserializedDueDateDeltaAlerts
{
  return self->cachedDeserializedDueDateDeltaAlerts;
}

- (void)setCachedDeserializedDueDateDeltaAlerts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedDeserializedDueDateDeltaAlerts, 0);
  objc_storeStrong((id *)&self->previousList, 0);

  objc_storeStrong((id *)&self->_displayDateUtils, 0);
}

- (BOOL)isConnectedToAccountObject:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(REMCDObject *)self remObjectID];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:v5];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      LOBYTE(v8) = [v6 integerValue] == (id)1;
    }
    else
    {
      [v4 setObject:&off_1008D7270 forKeyedSubscript:v5];
      objc_super v9 = [(REMCDReminder *)self parentReminder];

      if (v9) {
        [(REMCDReminder *)self parentReminder];
      }
      else {
      id v10 = [(REMCDReminder *)self list];
      }
      unsigned int v8 = [v10 isConnectedToAccountObject:v4];

      if (v8) {
        v11 = &off_1008D7288;
      }
      else {
        v11 = &off_1008D72A0;
      }
      [v4 setObject:v11 forKeyedSubscript:v5];
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingEffectiveMinimumSupportedVersion
{
  return +[NSSet setWithObjects:@"parentReminder", @"list", 0];
}

- (int64_t)parentEffectiveMinimumSupportedVersion
{
  objc_super v3 = [(REMCDReminder *)self parentReminder];

  if (v3)
  {
    id v4 = [(REMCDReminder *)self parentReminder];
    id v5 = [v4 effectiveMinimumSupportedVersion];
  }
  else
  {
    id v4 = [(REMCDReminder *)self list];
    if (v4)
    {
      id v6 = [(REMCDReminder *)self list];
      id v5 = [v6 effectiveMinimumSupportedVersion];
    }
    else
    {
      id v5 = (id)kREMSupportedVersionUnset;
    }
  }

  return (int64_t)v5;
}

+ (id)timeZoneFromName:(id)a3
{
  if (a3)
  {
    id v4 = +[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)dueDateComponentsWithDueDate:(id)a3 isAllDay:(BOOL)a4 timeZoneName:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if (v7)
  {
    id v8 = a5;
    objc_super v9 = [(id)objc_opt_class() timeZoneFromName:v8];

    if (v9) {
      +[NSDateComponents rem_dateComponentsWithDate:v7 timeZone:v9 isAllDay:v6];
    }
    else {
    id v10 = +[NSDateComponents rem_dateComponentsWithDateUsingArchivingTimeZone:v7 isAllDay:v6];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSDateComponents)dueDateComponents
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(REMCDReminder *)self dueDate];
  id v5 = [(REMCDReminder *)self allDay];
  BOOL v6 = [(REMCDReminder *)self timeZone];
  id v7 = [v3 dueDateComponentsWithDueDate:v4 isAllDay:v5 timeZoneName:v6];

  return (NSDateComponents *)v7;
}

- (void)setDueDateComponents:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    [self setAllDay:[v4 rem_isAllDayDateComponents]];
    id v5 = [v8 timeZone];
    if ([(REMCDReminder *)self allDay])
    {

      id v5 = 0;
    }
    BOOL v6 = [v5 name];
    [(REMCDReminder *)self setTimeZone:v6];

    if (v5) {
      +[NSDateComponents rem_dateWithDateComponents:v8 timeZone:v5];
    }
    else {
    id v7 = +[NSDateComponents rem_dateWithDateComponentsUsingArchivingTimeZone:v8];
    }
    [(REMCDReminder *)self setDueDate:v7];
  }
  else
  {
    [(REMCDReminder *)self setDueDate:0];
  }
}

- (NSDateComponents)startDateComponents
{
  uint64_t v3 = [(REMCDReminder *)self startDate];

  if (v3)
  {
    id v4 = [(REMCDReminder *)self startDate];
    id v5 = +[NSDateComponents rem_dateComponentsWithDateUsingArchivingTimeZone:v4 isAllDay:0];
  }
  else
  {
    id v5 = 0;
  }

  return (NSDateComponents *)v5;
}

- (void)setStartDateComponents:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = [v4 timeZone];
    if (v5) {
      +[NSDateComponents rem_dateWithDateComponents:v7 timeZone:v5];
    }
    else {
    BOOL v6 = +[NSDateComponents rem_dateWithDateComponentsUsingArchivingTimeZone:v7];
    }
    [(REMCDReminder *)self setStartDate:v6];
  }
  else
  {
    [(REMCDReminder *)self setStartDate:0];
  }
}

- (NSArray)alarms
{
  uint64_t v3 = [(REMCDReminder *)self alarmStorage];
  id v4 = [v3 count];

  if (v4)
  {
    id v5 = [(REMCDReminder *)self alarmStorage];
    BOOL v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = [(REMCDReminder *)self alarmStorage];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v12 isDeleted] & 1) == 0)
          {
            v13 = [v12 modelObject];
            [v6 addObject:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return (NSArray *)v6;
}

- (unint64_t)displayOrder
{
  id v3 = [(REMCDReminder *)self icsDisplayOrder];
  if (!v3)
  {
    id v4 = [(REMCDReminder *)self creationDate];
    [v4 timeIntervalSinceReferenceDate];
    id v3 = (id)v5;
  }
  return (unint64_t)v3;
}

- (void)setDisplayOrder:(unint64_t)a3
{
  if (a3
    || ([(REMCDReminder *)self creationDate],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    [(REMCDReminder *)self setIcsDisplayOrder:a3];
  }
}

- (void)debug_lowLevelRemoveFromParent
{
  [(REMCDReminder *)self setParentReminder:0];

  [(REMCDReminder *)self setList:0];
}

- (BOOL)markExtraneousAlarmsForDeletion
{
  v2 = self;
  Swift::Bool v3 = REMCDReminder.markExtraneousAlarmsForDeletion()();

  return v3;
}

- (void)willChangeList:(id)a3 toList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  REMCDReminder.willChange(_:to:)((REMCDList_optional *)a3, (REMCDList_optional *)a4);
}

- (BOOL)validateForInsert_Swift:(id *)a3
{
  Swift::Bool v3 = self;
  sub_1002DA3F0();

  swift_bridgeObjectRelease();
  return 1;
}

- (void)willSave_Swift
{
  v2 = self;
  REMCDReminder.willSave_Swift()();
}

- (void)didSave_Swift
{
}

- (void)willChangeValueForKey_Swfit:(id)a3
{
}

- (void)prepareForDeletion_Swift
{
  v2 = self;
  _sSo13REMCDReminderC7reminddE24prepareForDeletion_SwiftyyF_0();
}

- (BOOL)shouldUseResolutionTokenMapForMergingData
{
  return 1;
}

+ (id)recordTypes
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v2.super.isa;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = a5;
  objc_super v12 = (void *)static REMCDReminder.existingCloudObject(for:accountID:managedObjectContext:)(v10, v7, v9, v11);

  swift_bridgeObjectRelease();

  return v12;
}

+ (id)newCloudObjectForRecord:(id)a3 account:(id)a4 context:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = static REMCDReminder.newCloudObject(for:account:managedObjectContext:)(v8, v9, (uint64_t)v10);

  return v11;
}

- (id)recordZoneName
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (id)recordType
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (void)mergeDataFromRecord:(id)a3 accountID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  id v9 = a3;
  id v10 = self;
  v11._countAndFlagsBits = v6;
  v11._object = v8;
  REMCDReminder.mergeData(from:accountID:)((CKRecord)v9, v11);

  swift_bridgeObjectRelease();
}

- (CKRecord)ckServerRecord
{
  v4.receiver = self;
  v4.super_class = (Class)REMCDReminder;
  NSString v2 = [(REMCDObject *)&v4 ckServerRecord];

  return v2;
}

- (void)setCkServerRecord:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REMCDReminder;
  id v4 = a3;
  double v5 = self;
  [(REMCDObject *)&v6 setCkServerRecord:v4];
  sub_10033D294();
}

- (id)newlyCreatedRecord
{
  NSString v2 = self;
  Swift::Bool v3 = (void *)REMCDReminder.newlyCreatedRecord()();

  return v3;
}

- (id)parentCloudObject
{
  NSString v2 = self;
  id v3 = [(REMCDReminder *)v2 list];

  return v3;
}

- (BOOL)supportsDeletionByTTL
{
  return 1;
}

- (BOOL)shouldMarkAsDeletedInsteadOfDeletingImmediately
{
  return 1;
}

+ (BOOL)shouldAttemptLocalObjectMerge
{
  return 0;
}

- (id)existingLocalObjectToMergeWithPredicate:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  REMCDReminder.existingLocalObjectToMerge(with:)(v7, (NSPredicate_optional *)a3);
  id v9 = v8;

  return v9;
}

- (BOOL)mergeWithLocalObject:(id)a3
{
  id v4 = (REMCDObject *)a3;
  id v5 = self;
  LOBYTE(self) = REMCDReminder.merge(withLocalObject:)(v4);

  return self & 1;
}

- (id)objectsToBeDeletedBeforeThisObject
{
  NSString v2 = self;
  REMCDReminder.objectsToBeDeletedBeforeThisObject()();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (void)fixBrokenReferences
{
  NSString v2 = self;
  REMCDReminder.fixBrokenReferences()();
}

- (void)processDueDateDeltaAlertsDataChanges
{
  NSString v2 = self;
  REMCDReminder.processDueDateDeltaAlertsDataChanges()();
}

@end