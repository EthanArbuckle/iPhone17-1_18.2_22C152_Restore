@interface REMReminderStorage
+ (BOOL)isDate:(id)a3 overdueAtReferenceDate:(id)a4 allDay:(BOOL)a5 showAllDayRemindersAsOverdue:(BOOL)a6;
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)notesReplicaIDSourceWithAccountID:(id)a3 reminderID:(id)a4;
+ (id)objectIDWithUUID:(id)a3;
+ (id)titleReplicaIDSourceWithAccountID:(id)a3 reminderID:(id)a4;
- (BOOL)allDay;
- (BOOL)hasUnfetchedDueDateDeltaAlerts;
- (BOOL)isCompleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOverdue;
- (BOOL)isRecurrent;
- (BOOL)isUnsupported;
- (NSArray)alarms;
- (NSArray)attachments;
- (NSArray)dueDateDeltaAlertsToUpsert;
- (NSArray)recurrenceRules;
- (NSData)dueDateDeltaAlertsData;
- (NSData)importedICSData;
- (NSData)notesDocumentData;
- (NSData)resolutionTokenMapData;
- (NSData)siriFoundInAppsData;
- (NSData)titleDocumentData;
- (NSDate)alternativeDisplayDateDate_forCalendar;
- (NSDate)completionDate;
- (NSDate)creationDate;
- (NSDate)lastBannerPresentationDate;
- (NSDate)lastModifiedDate;
- (NSDateComponents)dueDateComponents;
- (NSDateComponents)startDateComponents;
- (NSSet)assignments;
- (NSSet)dueDateDeltaAlertIdentifiersToDelete;
- (NSSet)hashtagIDsToUndelete;
- (NSSet)hashtags;
- (NSSet)subtaskIDsToUndelete;
- (NSString)daCalendarItemUniqueIdentifier;
- (NSString)daPushKey;
- (NSString)daSyncToken;
- (NSString)externalIdentifier;
- (NSString)externalModificationTag;
- (NSString)legacyNotificationIdentifier;
- (NSString)notesAsString;
- (NSString)primaryLocaleInferredFromLastUsedKeyboard;
- (NSString)timeZone;
- (NSString)titleAsString;
- (NSURL)icsUrl;
- (REMContactRepresentation)contactHandles;
- (REMDisplayDate)displayDate;
- (REMObjectID)accountID;
- (REMObjectID)listID;
- (REMObjectID)objectID;
- (REMObjectID)parentReminderID;
- (REMReminderStorage)initWithCoder:(id)a3;
- (REMReminderStorage)initWithObjectID:(id)a3 listID:(id)a4 accountID:(id)a5;
- (REMResolutionTokenMap)resolutionTokenMap;
- (REMUserActivity)userActivity;
- (id)cdKeyToStorageKeyMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentAssignment;
- (id)datesDebugDescriptionInTimeZone:(id)a3;
- (id)description;
- (id)effectiveDisplayDateComponents_forCalendar;
- (id)fetchedDueDateDeltaAlerts;
- (id)notesDocument;
- (id)notesReplicaIDSource;
- (id)optionalObjectID;
- (id)titleDocument;
- (id)titleReplicaIDSource;
- (int64_t)effectiveMinimumSupportedVersion;
- (int64_t)flagged;
- (int64_t)minimumSupportedVersion;
- (int64_t)siriFoundInAppsUserConfirmation;
- (unint64_t)hash;
- (unint64_t)icsDisplayOrder;
- (unint64_t)priority;
- (unint64_t)storeGeneration;
- (void)encodeWithCoder:(id)a3;
- (void)notesDocument;
- (void)resolutionTokenMap;
- (void)setAccountID:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(id)a3;
- (void)setAlternativeDisplayDateDate_forCalendar:(id)a3;
- (void)setAssignments:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCompletionDate:(id)a3;
- (void)setContactHandles:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDaCalendarItemUniqueIdentifier:(id)a3;
- (void)setDaPushKey:(id)a3;
- (void)setDaSyncToken:(id)a3;
- (void)setDisplayDate:(id)a3;
- (void)setDueDateComponents:(id)a3;
- (void)setDueDateDeltaAlertIdentifiersToDelete:(id)a3;
- (void)setDueDateDeltaAlertsData:(id)a3;
- (void)setDueDateDeltaAlertsToUpsert:(id)a3;
- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setFetchedDueDateDeltaAlerts:(id)a3;
- (void)setFlagged:(int64_t)a3;
- (void)setHashtagIDsToUndelete:(id)a3;
- (void)setHashtags:(id)a3;
- (void)setIcsDisplayOrder:(unint64_t)a3;
- (void)setIcsUrl:(id)a3;
- (void)setImportedICSData:(id)a3;
- (void)setLastBannerPresentationDate:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setListID:(id)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setNotesAsString:(id)a3;
- (void)setNotesDocument:(id)a3;
- (void)setNotesDocumentData:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setParentReminderID:(id)a3;
- (void)setPrimaryLocaleInferredFromLastUsedKeyboard:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRecurrenceRules:(id)a3;
- (void)setResolutionTokenMap:(id)a3;
- (void)setResolutionTokenMapData:(id)a3;
- (void)setSiriFoundInAppsData:(id)a3;
- (void)setSiriFoundInAppsUserConfirmation:(int64_t)a3;
- (void)setStartDateComponents:(id)a3;
- (void)setStoreGenerationIfNeeded:(unint64_t)a3;
- (void)setSubtaskIDsToUndelete:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitleAsString:(id)a3;
- (void)setTitleDocument:(id)a3;
- (void)setTitleDocumentData:(id)a3;
- (void)setUserActivity:(id)a3;
- (void)titleDocument;
- (void)updateDisplayDate;
@end

@implementation REMReminderStorage

- (REMReminderStorage)initWithObjectID:(id)a3 listID:(id)a4 accountID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)REMReminderStorage;
  v12 = [(REMReminderStorage *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    v14 = [v9 uuid];
    uint64_t v15 = [v14 UUIDString];
    daCalendarItemUniqueIdentifier = v13->_daCalendarItemUniqueIdentifier;
    v13->_daCalendarItemUniqueIdentifier = (NSString *)v15;

    objc_storeStrong((id *)&v13->_listID, a4);
    objc_storeStrong((id *)&v13->_accountID, a5);
    v17 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v13->_resolutionTokenMap;
    v13->_resolutionTokenMap = v17;

    uint64_t v19 = [MEMORY[0x1E4F1C9B8] data];
    resolutionTokenMapData = v13->_resolutionTokenMapData;
    v13->_resolutionTokenMapData = (NSData *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CAD0] set];
    subtaskIDsToUndelete = v13->_subtaskIDsToUndelete;
    v13->_subtaskIDsToUndelete = (NSSet *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CAD0] set];
    hashtagIDsToUndelete = v13->_hashtagIDsToUndelete;
    v13->_hashtagIDsToUndelete = (NSSet *)v23;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [REMReminderStorage alloc];
  v5 = [(REMReminderStorage *)self objectID];
  v6 = [(REMReminderStorage *)self listID];
  v7 = [(REMReminderStorage *)self accountID];
  uint64_t v8 = [(REMReminderStorage *)v4 initWithObjectID:v5 listID:v6 accountID:v7];

  id v9 = [(REMReminderStorage *)self parentReminderID];
  [(id)v8 setParentReminderID:v9];

  id v10 = [(REMReminderStorage *)self daCalendarItemUniqueIdentifier];
  [(id)v8 setDaCalendarItemUniqueIdentifier:v10];

  id v11 = [(REMReminderStorage *)self externalIdentifier];
  [(id)v8 setExternalIdentifier:v11];

  v12 = [(REMReminderStorage *)self externalModificationTag];
  [(id)v8 setExternalModificationTag:v12];

  v13 = [(REMReminderStorage *)self daSyncToken];
  [(id)v8 setDaSyncToken:v13];

  v14 = [(REMReminderStorage *)self daPushKey];
  [(id)v8 setDaPushKey:v14];

  uint64_t v15 = [(REMReminderStorage *)self titleDocumentData];
  [(id)v8 setTitleDocumentData:v15];

  v16 = [(REMReminderStorage *)self titleAsString];
  [(id)v8 setTitleAsString:v16];

  v17 = [(REMReminderStorage *)self primaryLocaleInferredFromLastUsedKeyboard];
  [(id)v8 setPrimaryLocaleInferredFromLastUsedKeyboard:v17];

  objc_msgSend((id)v8, "setCompleted:", -[REMReminderStorage isCompleted](self, "isCompleted"));
  v18 = [(REMReminderStorage *)self completionDate];
  [(id)v8 setCompletionDate:v18];

  objc_msgSend((id)v8, "setPriority:", -[REMReminderStorage priority](self, "priority"));
  objc_msgSend((id)v8, "setFlagged:", -[REMReminderStorage flagged](self, "flagged"));
  uint64_t v19 = [(REMReminderStorage *)self startDateComponents];
  [(id)v8 setStartDateComponents:v19];

  v20 = [(REMReminderStorage *)self dueDateComponents];
  [(id)v8 setDueDateComponents:v20];

  uint64_t v21 = [(REMReminderStorage *)self timeZone];
  [(id)v8 setTimeZone:v21];

  objc_msgSend((id)v8, "setAllDay:", -[REMReminderStorage allDay](self, "allDay"));
  v22 = [(REMReminderStorage *)self creationDate];
  [(id)v8 setCreationDate:v22];

  uint64_t v23 = [(REMReminderStorage *)self lastModifiedDate];
  [(id)v8 setLastModifiedDate:v23];

  v24 = [(REMReminderStorage *)self recurrenceRules];
  [(id)v8 setRecurrenceRules:v24];

  v25 = [(REMReminderStorage *)self notesDocumentData];
  [(id)v8 setNotesDocumentData:v25];

  objc_super v26 = [(REMReminderStorage *)self notesAsString];
  [(id)v8 setNotesAsString:v26];

  v27 = [(REMReminderStorage *)self attachments];
  [(id)v8 setAttachments:v27];

  v28 = [(REMReminderStorage *)self alarms];
  [(id)v8 setAlarms:v28];

  v29 = [(REMReminderStorage *)self assignments];
  [(id)v8 setAssignments:v29];

  v30 = [(REMReminderStorage *)self hashtags];
  [(id)v8 setHashtags:v30];

  v31 = [(REMReminderStorage *)self dueDateDeltaAlertsData];
  [(id)v8 setDueDateDeltaAlertsData:v31];

  v32 = [(REMReminderStorage *)self dueDateDeltaAlertsToUpsert];
  [(id)v8 setDueDateDeltaAlertsToUpsert:v32];

  v33 = [(REMReminderStorage *)self dueDateDeltaAlertIdentifiersToDelete];
  [(id)v8 setDueDateDeltaAlertIdentifiersToDelete:v33];

  uint64_t v34 = [(REMResolutionTokenMap *)self->_resolutionTokenMap copy];
  v35 = *(void **)(v8 + 184);
  *(void *)(v8 + 184) = v34;

  v36 = [(REMReminderStorage *)self resolutionTokenMapData];
  [(id)v8 setResolutionTokenMapData:v36];

  v37 = [(REMReminderStorage *)self contactHandles];
  [(id)v8 setContactHandles:v37];

  objc_msgSend((id)v8, "setIcsDisplayOrder:", -[REMReminderStorage icsDisplayOrder](self, "icsDisplayOrder"));
  v38 = [(REMReminderStorage *)self icsUrl];
  [(id)v8 setIcsUrl:v38];

  v39 = [(REMReminderStorage *)self importedICSData];
  [(id)v8 setImportedICSData:v39];

  v40 = [(REMReminderStorage *)self subtaskIDsToUndelete];
  v41 = (void *)[v40 copy];
  [(id)v8 setSubtaskIDsToUndelete:v41];

  v42 = [(REMReminderStorage *)self hashtagIDsToUndelete];
  v43 = (void *)[v42 copy];
  [(id)v8 setHashtagIDsToUndelete:v43];

  v44 = [(REMReminderStorage *)self userActivity];
  v45 = (void *)[v44 copy];
  [(id)v8 setUserActivity:v45];

  v46 = [(REMReminderStorage *)self siriFoundInAppsData];
  v47 = (void *)[v46 copy];
  [(id)v8 setSiriFoundInAppsData:v47];

  objc_msgSend((id)v8, "setSiriFoundInAppsUserConfirmation:", -[REMReminderStorage siriFoundInAppsUserConfirmation](self, "siriFoundInAppsUserConfirmation"));
  v48 = [(REMReminderStorage *)self lastBannerPresentationDate];
  [(id)v8 setLastBannerPresentationDate:v48];

  v49 = [(REMReminderStorage *)self displayDate];
  [(id)v8 setDisplayDate:v49];

  objc_msgSend((id)v8, "setMinimumSupportedVersion:", -[REMReminderStorage minimumSupportedVersion](self, "minimumSupportedVersion"));
  objc_msgSend((id)v8, "setEffectiveMinimumSupportedVersion:", -[REMReminderStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
  *(unsigned char *)(v8 + 8) = self->_hasDeserializedTitleDocument;
  *(unsigned char *)(v8 + 9) = self->_hasDeserializedNotesDocument;
  objc_storeStrong((id *)(v8 + 16), self->_deserializedTitleDocumentCache);
  objc_storeStrong((id *)(v8 + 24), self->_deserializedNotesDocumentCache);
  *(void *)(v8 + 32) = self->_storeGeneration;
  *(void *)(v8 + 40) = self->_copyGeneration + 1;
  uint64_t v50 = [(NSArray *)self->_fetchedDueDateDeltaAlerts copy];
  v51 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = v50;

  v52 = [(REMReminderStorage *)self alternativeDisplayDateDate_forCalendar];
  objc_msgSend((id)v8, "setAlternativeDisplayDateDate_forCalendar:", v52);

  return (id)v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v270 = *MEMORY[0x1E4F143B8];
  v4 = (REMReminderStorage *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMReminderStorage *)self objectID];
      uint64_t v8 = [(REMReminderStorage *)v6 objectID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        id v10 = [(REMReminderStorage *)self objectID];
        id v11 = [(REMReminderStorage *)v6 objectID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_178;
        }
      }
      v14 = [(REMReminderStorage *)self listID];
      uint64_t v15 = [(REMReminderStorage *)v6 listID];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMReminderStorage *)self listID];
        v18 = [(REMReminderStorage *)v6 listID];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_178;
        }
      }
      v20 = [(REMReminderStorage *)self accountID];
      uint64_t v21 = [(REMReminderStorage *)v6 accountID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        uint64_t v23 = [(REMReminderStorage *)self accountID];
        v24 = [(REMReminderStorage *)v6 accountID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_178;
        }
      }
      objc_super v26 = [(REMReminderStorage *)self parentReminderID];
      uint64_t v27 = [(REMReminderStorage *)v6 parentReminderID];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(REMReminderStorage *)self parentReminderID];
        v30 = [(REMReminderStorage *)v6 parentReminderID];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_178;
        }
      }
      v32 = [(REMReminderStorage *)self daCalendarItemUniqueIdentifier];
      uint64_t v33 = [(REMReminderStorage *)v6 daCalendarItemUniqueIdentifier];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        uint64_t v34 = (void *)v33;
        v35 = [(REMReminderStorage *)self daCalendarItemUniqueIdentifier];
        v36 = [(REMReminderStorage *)v6 daCalendarItemUniqueIdentifier];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_178;
        }
      }
      v38 = [(REMReminderStorage *)self externalIdentifier];
      uint64_t v39 = [(REMReminderStorage *)v6 externalIdentifier];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(REMReminderStorage *)self externalIdentifier];
        v42 = [(REMReminderStorage *)v6 externalIdentifier];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_178;
        }
      }
      v44 = [(REMReminderStorage *)self externalModificationTag];
      uint64_t v45 = [(REMReminderStorage *)v6 externalModificationTag];
      if (v44 == (void *)v45)
      {
      }
      else
      {
        v46 = (void *)v45;
        v47 = [(REMReminderStorage *)self externalModificationTag];
        v48 = [(REMReminderStorage *)v6 externalModificationTag];
        int v49 = [v47 isEqual:v48];

        if (!v49) {
          goto LABEL_178;
        }
      }
      uint64_t v50 = [(REMReminderStorage *)self daSyncToken];
      uint64_t v51 = [(REMReminderStorage *)v6 daSyncToken];
      if (v50 == (void *)v51)
      {
      }
      else
      {
        v52 = (void *)v51;
        v53 = [(REMReminderStorage *)self daSyncToken];
        v54 = [(REMReminderStorage *)v6 daSyncToken];
        int v55 = [v53 isEqual:v54];

        if (!v55) {
          goto LABEL_178;
        }
      }
      v56 = [(REMReminderStorage *)self daPushKey];
      uint64_t v57 = [(REMReminderStorage *)v6 daPushKey];
      if (v56 == (void *)v57)
      {
      }
      else
      {
        v58 = (void *)v57;
        v59 = [(REMReminderStorage *)self daPushKey];
        v60 = [(REMReminderStorage *)v6 daPushKey];
        int v61 = [v59 isEqual:v60];

        if (!v61) {
          goto LABEL_178;
        }
      }
      int64_t v62 = [(REMReminderStorage *)self minimumSupportedVersion];
      if (v62 != [(REMReminderStorage *)v6 minimumSupportedVersion]) {
        goto LABEL_178;
      }
      int64_t v63 = [(REMReminderStorage *)self effectiveMinimumSupportedVersion];
      if (v63 != [(REMReminderStorage *)v6 effectiveMinimumSupportedVersion]) {
        goto LABEL_178;
      }
      BOOL v64 = [(REMReminderStorage *)self isCompleted];
      if (v64 != [(REMReminderStorage *)v6 isCompleted]) {
        goto LABEL_178;
      }
      v65 = [(REMReminderStorage *)self completionDate];
      uint64_t v66 = [(REMReminderStorage *)v6 completionDate];
      if (v65 == (void *)v66)
      {
      }
      else
      {
        v67 = (void *)v66;
        v68 = [(REMReminderStorage *)self completionDate];
        v69 = [(REMReminderStorage *)v6 completionDate];
        int v70 = [v68 isEqual:v69];

        if (!v70) {
          goto LABEL_178;
        }
      }
      unint64_t v71 = [(REMReminderStorage *)self priority];
      if (v71 != [(REMReminderStorage *)v6 priority]) {
        goto LABEL_178;
      }
      int64_t v72 = [(REMReminderStorage *)self flagged];
      if (v72 != [(REMReminderStorage *)v6 flagged]) {
        goto LABEL_178;
      }
      v73 = [(REMReminderStorage *)self startDateComponents];
      uint64_t v74 = [(REMReminderStorage *)v6 startDateComponents];
      if (v73 == (void *)v74)
      {
      }
      else
      {
        v75 = (void *)v74;
        v76 = [(REMReminderStorage *)self startDateComponents];
        v77 = [(REMReminderStorage *)v6 startDateComponents];
        int v78 = [v76 isEqual:v77];

        if (!v78) {
          goto LABEL_178;
        }
      }
      v79 = [(REMReminderStorage *)self dueDateComponents];
      uint64_t v80 = [(REMReminderStorage *)v6 dueDateComponents];
      if (v79 == (void *)v80)
      {
      }
      else
      {
        v81 = (void *)v80;
        v82 = [(REMReminderStorage *)self dueDateComponents];
        v83 = [(REMReminderStorage *)v6 dueDateComponents];
        int v84 = [v82 isEqual:v83];

        if (!v84) {
          goto LABEL_178;
        }
      }
      v85 = [(REMReminderStorage *)self timeZone];
      uint64_t v86 = [(REMReminderStorage *)v6 timeZone];
      if (v85 == (void *)v86)
      {
      }
      else
      {
        v87 = (void *)v86;
        v88 = [(REMReminderStorage *)self timeZone];
        v89 = [(REMReminderStorage *)v6 timeZone];
        int v90 = [v88 isEqual:v89];

        if (!v90) {
          goto LABEL_178;
        }
      }
      v91 = [(REMReminderStorage *)self primaryLocaleInferredFromLastUsedKeyboard];
      uint64_t v92 = [(REMReminderStorage *)v6 primaryLocaleInferredFromLastUsedKeyboard];
      if (v91 == (void *)v92)
      {
      }
      else
      {
        v93 = (void *)v92;
        v94 = [(REMReminderStorage *)self primaryLocaleInferredFromLastUsedKeyboard];
        v95 = [(REMReminderStorage *)v6 primaryLocaleInferredFromLastUsedKeyboard];
        int v96 = [v94 isEqual:v95];

        if (!v96) {
          goto LABEL_178;
        }
      }
      BOOL v97 = [(REMReminderStorage *)self allDay];
      if (v97 == [(REMReminderStorage *)v6 allDay])
      {
        v98 = [(REMReminderStorage *)self creationDate];
        uint64_t v99 = [(REMReminderStorage *)v6 creationDate];
        if (v98 == (void *)v99)
        {
        }
        else
        {
          v100 = (void *)v99;
          v101 = [(REMReminderStorage *)self creationDate];
          v102 = [(REMReminderStorage *)v6 creationDate];
          int v103 = [v101 isEqual:v102];

          if (!v103) {
            goto LABEL_178;
          }
        }
        v104 = [(REMReminderStorage *)self lastModifiedDate];
        uint64_t v105 = [(REMReminderStorage *)v6 lastModifiedDate];
        if (v104 == (void *)v105)
        {
        }
        else
        {
          v106 = (void *)v105;
          v107 = [(REMReminderStorage *)self lastModifiedDate];
          v108 = [(REMReminderStorage *)v6 lastModifiedDate];
          int v109 = [v107 isEqual:v108];

          if (!v109) {
            goto LABEL_178;
          }
        }
        v110 = [(REMReminderStorage *)self recurrenceRules];
        uint64_t v111 = [(REMReminderStorage *)v6 recurrenceRules];
        if (v110 == (void *)v111)
        {
        }
        else
        {
          v112 = (void *)v111;
          v113 = [(REMReminderStorage *)self recurrenceRules];
          v114 = [(REMReminderStorage *)v6 recurrenceRules];
          int v115 = [v113 isEqual:v114];

          if (!v115) {
            goto LABEL_178;
          }
        }
        v116 = [(REMReminderStorage *)self attachments];
        uint64_t v117 = [(REMReminderStorage *)v6 attachments];
        if (v116 == (void *)v117)
        {
        }
        else
        {
          v118 = (void *)v117;
          v119 = [(REMReminderStorage *)self attachments];
          v120 = [(REMReminderStorage *)v6 attachments];
          int v121 = [v119 isEqual:v120];

          if (!v121) {
            goto LABEL_178;
          }
        }
        v122 = [(REMReminderStorage *)self alarms];
        uint64_t v123 = [(REMReminderStorage *)v6 alarms];
        if (v122 == (void *)v123)
        {
        }
        else
        {
          v124 = (void *)v123;
          v125 = [(REMReminderStorage *)self alarms];
          v126 = [(REMReminderStorage *)v6 alarms];
          int v127 = [v125 isEqual:v126];

          if (!v127) {
            goto LABEL_178;
          }
        }
        v128 = [(REMReminderStorage *)self assignments];
        uint64_t v129 = [(REMReminderStorage *)v6 assignments];
        if (v128 == (void *)v129)
        {
        }
        else
        {
          v130 = (void *)v129;
          v131 = [(REMReminderStorage *)self assignments];
          v132 = [(REMReminderStorage *)v6 assignments];
          int v133 = [v131 isEqual:v132];

          if (!v133) {
            goto LABEL_178;
          }
        }
        v134 = [(REMReminderStorage *)self hashtags];
        uint64_t v135 = [(REMReminderStorage *)v6 hashtags];
        if (v134 == (void *)v135)
        {
        }
        else
        {
          v136 = (void *)v135;
          v137 = [(REMReminderStorage *)self hashtags];
          v138 = [(REMReminderStorage *)v6 hashtags];
          int v139 = [v137 isEqual:v138];

          if (!v139) {
            goto LABEL_178;
          }
        }
        v140 = [(REMReminderStorage *)self dueDateDeltaAlertsData];
        uint64_t v141 = [(REMReminderStorage *)v6 dueDateDeltaAlertsData];
        if (v140 == (void *)v141)
        {
        }
        else
        {
          v142 = (void *)v141;
          v143 = [(REMReminderStorage *)self dueDateDeltaAlertsData];
          v144 = [(REMReminderStorage *)v6 dueDateDeltaAlertsData];
          int v145 = [v143 isEqual:v144];

          if (!v145) {
            goto LABEL_178;
          }
        }
        v146 = [(REMReminderStorage *)self dueDateDeltaAlertsToUpsert];
        uint64_t v147 = [(REMReminderStorage *)v6 dueDateDeltaAlertsToUpsert];
        if (v146 == (void *)v147)
        {
        }
        else
        {
          v148 = (void *)v147;
          v149 = [(REMReminderStorage *)self dueDateDeltaAlertsToUpsert];
          v150 = [(REMReminderStorage *)v6 dueDateDeltaAlertsToUpsert];
          int v151 = [v149 isEqual:v150];

          if (!v151) {
            goto LABEL_178;
          }
        }
        v152 = [(REMReminderStorage *)self dueDateDeltaAlertIdentifiersToDelete];
        uint64_t v153 = [(REMReminderStorage *)v6 dueDateDeltaAlertIdentifiersToDelete];
        if (v152 == (void *)v153)
        {
        }
        else
        {
          v154 = (void *)v153;
          v155 = [(REMReminderStorage *)self dueDateDeltaAlertIdentifiersToDelete];
          v156 = [(REMReminderStorage *)v6 dueDateDeltaAlertIdentifiersToDelete];
          int v157 = [v155 isEqual:v156];

          if (!v157) {
            goto LABEL_178;
          }
        }
        v158 = [(REMReminderStorage *)self contactHandles];
        uint64_t v159 = [(REMReminderStorage *)v6 contactHandles];
        if (v158 == (void *)v159)
        {
        }
        else
        {
          v160 = (void *)v159;
          v161 = [(REMReminderStorage *)self contactHandles];
          v162 = [(REMReminderStorage *)v6 contactHandles];
          int v163 = [v161 isEqual:v162];

          if (!v163) {
            goto LABEL_178;
          }
        }
        unint64_t v164 = [(REMReminderStorage *)self icsDisplayOrder];
        if (v164 == [(REMReminderStorage *)v6 icsDisplayOrder])
        {
          v165 = [(REMReminderStorage *)self icsUrl];
          uint64_t v166 = [(REMReminderStorage *)v6 icsUrl];
          if (v165 == (void *)v166)
          {
          }
          else
          {
            v167 = (void *)v166;
            v168 = [(REMReminderStorage *)self icsUrl];
            v169 = [(REMReminderStorage *)v6 icsUrl];
            int v170 = [v168 isEqual:v169];

            if (!v170) {
              goto LABEL_178;
            }
          }
          v171 = [(REMReminderStorage *)self importedICSData];
          uint64_t v172 = [(REMReminderStorage *)v6 importedICSData];
          if (v171 == (void *)v172)
          {
          }
          else
          {
            v173 = (void *)v172;
            v174 = [(REMReminderStorage *)self importedICSData];
            v175 = [(REMReminderStorage *)v6 importedICSData];
            int v176 = [v174 isEqual:v175];

            if (!v176) {
              goto LABEL_178;
            }
          }
          v177 = [(REMReminderStorage *)self subtaskIDsToUndelete];
          uint64_t v178 = [(REMReminderStorage *)v6 subtaskIDsToUndelete];
          if (v177 == (void *)v178)
          {
          }
          else
          {
            v179 = (void *)v178;
            v180 = [(REMReminderStorage *)self subtaskIDsToUndelete];
            v181 = [(REMReminderStorage *)v6 subtaskIDsToUndelete];
            int v182 = [v180 isEqual:v181];

            if (!v182) {
              goto LABEL_178;
            }
          }
          v183 = [(REMReminderStorage *)self hashtagIDsToUndelete];
          uint64_t v184 = [(REMReminderStorage *)v6 hashtagIDsToUndelete];
          if (v183 == (void *)v184)
          {
          }
          else
          {
            v185 = (void *)v184;
            v186 = [(REMReminderStorage *)self hashtagIDsToUndelete];
            v187 = [(REMReminderStorage *)v6 hashtagIDsToUndelete];
            int v188 = [v186 isEqual:v187];

            if (!v188) {
              goto LABEL_178;
            }
          }
          v189 = [(REMReminderStorage *)self userActivity];
          uint64_t v190 = [(REMReminderStorage *)v6 userActivity];
          if (v189 == (void *)v190)
          {
          }
          else
          {
            v191 = (void *)v190;
            v192 = [(REMReminderStorage *)self userActivity];
            v193 = [(REMReminderStorage *)v6 userActivity];
            int v194 = [v192 isEqual:v193];

            if (!v194) {
              goto LABEL_178;
            }
          }
          v195 = [(REMReminderStorage *)self siriFoundInAppsData];
          uint64_t v196 = [(REMReminderStorage *)v6 siriFoundInAppsData];
          if (v195 == (void *)v196)
          {
          }
          else
          {
            v197 = (void *)v196;
            v198 = [(REMReminderStorage *)self siriFoundInAppsData];
            v199 = [(REMReminderStorage *)v6 siriFoundInAppsData];
            int v200 = [v198 isEqual:v199];

            if (!v200) {
              goto LABEL_178;
            }
          }
          int64_t v201 = [(REMReminderStorage *)self siriFoundInAppsUserConfirmation];
          if (v201 == [(REMReminderStorage *)v6 siriFoundInAppsUserConfirmation])
          {
            v202 = [(REMReminderStorage *)self lastBannerPresentationDate];
            uint64_t v203 = [(REMReminderStorage *)v6 lastBannerPresentationDate];
            if (v202 == (void *)v203)
            {
            }
            else
            {
              v204 = (void *)v203;
              v205 = [(REMReminderStorage *)self lastBannerPresentationDate];
              v206 = [(REMReminderStorage *)v6 lastBannerPresentationDate];
              int v207 = [v205 isEqual:v206];

              if (!v207) {
                goto LABEL_178;
              }
            }
            v208 = [(REMReminderStorage *)self displayDate];
            uint64_t v209 = [(REMReminderStorage *)v6 displayDate];
            if (v208 == (void *)v209)
            {
            }
            else
            {
              v210 = (void *)v209;
              v211 = [(REMReminderStorage *)self displayDate];
              v212 = [(REMReminderStorage *)v6 displayDate];
              int v213 = [v211 isEqual:v212];

              if (!v213) {
                goto LABEL_178;
              }
            }
            v214 = [(REMReminderStorage *)self alternativeDisplayDateDate_forCalendar];
            uint64_t v215 = [(REMReminderStorage *)v6 alternativeDisplayDateDate_forCalendar];
            if (v214 == (void *)v215)
            {
            }
            else
            {
              v216 = (void *)v215;
              v217 = [(REMReminderStorage *)self alternativeDisplayDateDate_forCalendar];
              v218 = [(REMReminderStorage *)v6 alternativeDisplayDateDate_forCalendar];
              int v219 = [v217 isEqual:v218];

              if (!v219) {
                goto LABEL_178;
              }
            }
            v220 = [(REMReminderStorage *)self titleDocumentData];
            if (v220
              || ([(REMReminderStorage *)v6 titleDocumentData],
                  (v223 = objc_claimAutoreleasedReturnValue()) == 0))
            {
              v221 = [(REMReminderStorage *)self titleDocumentData];
              if (v221)
              {
                v222 = [(REMReminderStorage *)v6 titleDocumentData];

                if (v220) {
                if (!v222)
                }
                  goto LABEL_178;
              }
              else
              {

                if (v220) {
              }
                }
              if (!self->_hasDeserializedTitleDocument)
              {
                v224 = +[REMLogStore read];
                if (os_log_type_enabled(v224, OS_LOG_TYPE_FAULT)) {
                  -[REMReminderStorage isEqual:]();
                }
              }
              v225 = [(REMReminderStorage *)self titleDocument];
              uint64_t v226 = [(REMReminderStorage *)v6 titleDocument];
              if (v225 == (void *)v226)
              {
              }
              else
              {
                v227 = (void *)v226;
                v228 = [(REMReminderStorage *)self titleDocument];
                v229 = [(REMReminderStorage *)v6 titleDocument];
                int v230 = [v228 isEqual:v229];

                if (!v230) {
                  goto LABEL_178;
                }
              }
              v231 = [(REMReminderStorage *)self titleAsString];
              uint64_t v232 = [(REMReminderStorage *)v6 titleAsString];
              if (v231 == (void *)v232)
              {
              }
              else
              {
                v233 = (void *)v232;
                v234 = [(REMReminderStorage *)self titleAsString];
                v235 = [(REMReminderStorage *)v6 titleAsString];
                int v236 = [v234 isEqual:v235];

                if (!v236) {
                  goto LABEL_178;
                }
              }
              v237 = [(REMReminderStorage *)self notesDocumentData];
              if (v237
                || ([(REMReminderStorage *)v6 notesDocumentData],
                    (v223 = objc_claimAutoreleasedReturnValue()) == 0))
              {
                v238 = [(REMReminderStorage *)self notesDocumentData];
                if (v238)
                {
                  v239 = [(REMReminderStorage *)v6 notesDocumentData];

                  if (v237) {
                  if (!v239)
                  }
                    goto LABEL_178;
                }
                else
                {

                  if (v237) {
                }
                  }
                if (!self->_hasDeserializedNotesDocument)
                {
                  v241 = +[REMLogStore read];
                  if (os_log_type_enabled(v241, OS_LOG_TYPE_FAULT)) {
                    -[REMReminderStorage isEqual:]();
                  }
                }
                v242 = [(REMReminderStorage *)self notesDocument];
                uint64_t v243 = [(REMReminderStorage *)v6 notesDocument];
                if (v242 == (void *)v243)
                {
                }
                else
                {
                  v244 = (void *)v243;
                  v245 = [(REMReminderStorage *)self notesDocument];
                  v246 = [(REMReminderStorage *)v6 notesDocument];
                  int v247 = [v245 isEqual:v246];

                  if (!v247) {
                    goto LABEL_178;
                  }
                }
                v248 = [(REMReminderStorage *)self notesAsString];
                uint64_t v249 = [(REMReminderStorage *)v6 notesAsString];
                if (v248 == (void *)v249)
                {
                }
                else
                {
                  v250 = (void *)v249;
                  v251 = [(REMReminderStorage *)self notesAsString];
                  v252 = [(REMReminderStorage *)v6 notesAsString];
                  int v253 = [v251 isEqual:v252];

                  if (!v253) {
                    goto LABEL_178;
                  }
                }
                if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
                {
                  v254 = +[REMLogStore read];
                  if (os_log_type_enabled(v254, OS_LOG_TYPE_ERROR))
                  {
                    v260 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v260);
                    id v261 = (id)objc_claimAutoreleasedReturnValue();
                    resolutionTokenMap = self->_resolutionTokenMap;
                    v263 = v6->_resolutionTokenMap;
                    int v264 = 138543874;
                    id v265 = v261;
                    __int16 v266 = 2112;
                    v267 = resolutionTokenMap;
                    __int16 v268 = 2112;
                    v269 = v263;
                    _os_log_error_impl(&dword_1B9AA2000, v254, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v264, 0x20u);
                  }
                }
                v255 = [(REMReminderStorage *)self resolutionTokenMap];
                uint64_t v256 = [(REMReminderStorage *)v6 resolutionTokenMap];
                if (v255 == (void *)v256)
                {

                  char v13 = 1;
                }
                else
                {
                  v257 = (void *)v256;
                  v258 = [(REMReminderStorage *)self resolutionTokenMap];
                  v259 = [(REMReminderStorage *)v6 resolutionTokenMap];
                  char v13 = [v258 isEqual:v259];
                }
                goto LABEL_179;
              }
            }
          }
        }
      }
    }
LABEL_178:
    char v13 = 0;
LABEL_179:

    goto LABEL_180;
  }
  char v13 = 1;
LABEL_180:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMReminderStorage *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listID"];
  uint64_t v86 = (void *)v6;
  v87 = (void *)v5;
  v7 = -[REMReminderStorage initWithObjectID:listID:accountID:](self, "initWithObjectID:listID:accountID:", v6);
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentReminderID"];
  [(REMReminderStorage *)v7 setParentReminderID:v8];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daCalendarItemUniqueIdentifier"];
  [(REMReminderStorage *)v7 setDaCalendarItemUniqueIdentifier:v9];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
  [(REMReminderStorage *)v7 setExternalIdentifier:v10];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalModificationTag"];
  [(REMReminderStorage *)v7 setExternalModificationTag:v11];

  int v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daSyncToken"];
  [(REMReminderStorage *)v7 setDaSyncToken:v12];

  char v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daPushKey"];
  [(REMReminderStorage *)v7 setDaPushKey:v13];

  -[REMReminderStorage setMinimumSupportedVersion:](v7, "setMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"minimumSupportedVersion"]);
  -[REMReminderStorage setEffectiveMinimumSupportedVersion:](v7, "setEffectiveMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"effectiveMinimumSupportedVersion"]);
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleDocumentData"];
  [(REMReminderStorage *)v7 setTitleDocumentData:v14];

  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleAsString"];
  [(REMReminderStorage *)v7 setTitleAsString:v15];

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryLocaleInferredFromLastUsedKeyboard"];
  [(REMReminderStorage *)v7 setPrimaryLocaleInferredFromLastUsedKeyboard:v16];

  -[REMReminderStorage setCompleted:](v7, "setCompleted:", [v4 decodeBoolForKey:@"isCompleted"]);
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completionDate"];
  [(REMReminderStorage *)v7 setCompletionDate:v17];

  -[REMReminderStorage setPriority:](v7, "setPriority:", [v4 decodeIntegerForKey:@"priority"]);
  -[REMReminderStorage setFlagged:](v7, "setFlagged:", [v4 decodeIntegerForKey:@"flagged"]);
  v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDateComponents"];
  [(REMReminderStorage *)v7 setStartDateComponents:v18];

  int v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDateComponents"];
  [(REMReminderStorage *)v7 setDueDateComponents:v19];

  v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
  [(REMReminderStorage *)v7 setTimeZone:v20];

  -[REMReminderStorage setAllDay:](v7, "setAllDay:", [v4 decodeBoolForKey:@"allDay"]);
  uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
  [(REMReminderStorage *)v7 setCreationDate:v21];

  v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedDate"];
  [(REMReminderStorage *)v7 setLastModifiedDate:v22];

  uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  int v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  objc_super v26 = [v4 decodeObjectOfClasses:v25 forKey:@"recurrenceRules"];
  [(REMReminderStorage *)v7 setRecurrenceRules:v26];

  uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notesDocumentData"];
  [(REMReminderStorage *)v7 setNotesDocumentData:v27];

  v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notesAsString"];
  [(REMReminderStorage *)v7 setNotesAsString:v28];

  v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  int v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v32 = [v4 decodeObjectOfClasses:v31 forKey:@"attachments"];
  [(REMReminderStorage *)v7 setAttachments:v32];

  uint64_t v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v36 = [v4 decodeObjectOfClasses:v35 forKey:@"alarms"];
  [(REMReminderStorage *)v7 setAlarms:v36];

  int v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  v40 = [v4 decodeObjectOfClasses:v39 forKey:@"assignments"];
  [(REMReminderStorage *)v7 setAssignments:v40];

  v41 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v42 = objc_opt_class();
  int v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  v44 = [v4 decodeObjectOfClasses:v43 forKey:@"hashtags"];
  [(REMReminderStorage *)v7 setHashtags:v44];

  uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueDateDeltaAlertsData"];
  [(REMReminderStorage *)v7 setDueDateDeltaAlertsData:v45];

  v46 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v47 = objc_opt_class();
  v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
  int v49 = [v4 decodeObjectOfClasses:v48 forKey:@"dueDateDeltaAlertsToUpsert"];
  [(REMReminderStorage *)v7 setDueDateDeltaAlertsToUpsert:v49];

  uint64_t v50 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
  v53 = [v4 decodeObjectOfClasses:v52 forKey:@"dueDateDeltaAlertIdentifiersToDelete"];
  [(REMReminderStorage *)v7 setDueDateDeltaAlertIdentifiersToDelete:v53];

  -[REMReminderStorage setIcsDisplayOrder:](v7, "setIcsDisplayOrder:", [v4 decodeIntegerForKey:@"icsDisplayOrder"]);
  v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icsUrl"];
  [(REMReminderStorage *)v7 setIcsUrl:v54];

  int v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"importedICSData"];
  [(REMReminderStorage *)v7 setImportedICSData:v55];

  v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];
  [(REMReminderStorage *)v7 setUserActivity:v56];

  uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriFoundInAppsData"];
  [(REMReminderStorage *)v7 setSiriFoundInAppsData:v57];

  unint64_t v58 = [v4 decodeIntegerForKey:@"siriFoundInAppsUserConfirmation"];
  if (v58 >= 3)
  {
    v59 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT)) {
      -[REMReminderStorage initWithCoder:](v58, v59);
    }

    unint64_t v58 = 0;
  }
  [(REMReminderStorage *)v7 setSiriFoundInAppsUserConfirmation:v58];
  v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastBannerPresentationDate"];
  [(REMReminderStorage *)v7 setLastBannerPresentationDate:v60];

  int v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayDate"];
  [(REMReminderStorage *)v7 setDisplayDate:v61];

  int64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMapData"];
  int64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMap"];
  if (v63)
  {
    objc_storeStrong((id *)&v7->_resolutionTokenMap, v63);
    resolutionTokenMapData = v7->_resolutionTokenMapData;
    v7->_resolutionTokenMapData = 0;
  }
  else
  {
    resolutionTokenMap = v7->_resolutionTokenMap;
    v7->_resolutionTokenMap = 0;

    uint64_t v66 = v62;
    resolutionTokenMapData = v7->_resolutionTokenMapData;
    v7->_resolutionTokenMapData = v66;
  }

  v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactHandles"];
  if (v67) {
    [(REMReminderStorage *)v7 setContactHandles:v67];
  }
  v68 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v69 = objc_opt_class();
  int v70 = objc_msgSend(v68, "setWithObjects:", v69, objc_opt_class(), 0);
  unint64_t v71 = [v4 decodeObjectOfClasses:v70 forKey:@"subtaskIDsToUndelete"];

  if (v71)
  {
    int64_t v72 = [MEMORY[0x1E4F1CAD0] setWithArray:v71];
    [(REMReminderStorage *)v7 setSubtaskIDsToUndelete:v72];
  }
  v73 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v74 = objc_opt_class();
  v75 = objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  v76 = [v4 decodeObjectOfClasses:v75 forKey:@"hashtagIDsToUndelete"];

  if (v76)
  {
    v77 = [MEMORY[0x1E4F1CAD0] setWithArray:v76];
    [(REMReminderStorage *)v7 setHashtagIDsToUndelete:v77];
  }
  int v78 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v79 = objc_opt_class();
  uint64_t v80 = objc_msgSend(v78, "setWithObjects:", v79, objc_opt_class(), 0);
  uint64_t v81 = [v4 decodeObjectOfClasses:v80 forKey:@"fetchedDueDateDeltaAlerts"];
  fetchedDueDateDeltaAlerts = v7->_fetchedDueDateDeltaAlerts;
  v7->_fetchedDueDateDeltaAlerts = (NSArray *)v81;

  v83 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alternativeDisplayDateDate_forCalendar"];
  [(REMReminderStorage *)v7 setAlternativeDisplayDateDate_forCalendar:v83];

  return v7;
}

- (id)optionalObjectID
{
  return self->_objectID;
}

- (id)description
{
  v14 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = [(REMReminderStorage *)self objectID];
  uint64_t v5 = [(REMReminderStorage *)self attachments];
  uint64_t v6 = [v5 count];
  v7 = [(REMReminderStorage *)self alarms];
  uint64_t v8 = [v7 count];
  id v9 = [(REMReminderStorage *)self assignments];
  uint64_t v10 = [v9 count];
  id v11 = [(REMReminderStorage *)self hashtags];
  int v12 = [v14 stringWithFormat:@"<%@: %p objectID: %@, attachments.count: %ld, alarms.count: %ld, assignments.count: %ld, hashtags.count: %ld>", v3, self, v4, v6, v8, v10, objc_msgSend(v11, "count")];

  return v12;
}

- (id)datesDebugDescriptionInTimeZone:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v56 = v4;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D48], "rem_formatterWithTimeZone:", v4);
  v7 = [(REMReminderStorage *)self startDateComponents];

  unint64_t v8 = 0x1E4F29000uLL;
  if (v7)
  {
    id v9 = [(REMReminderStorage *)self startDateComponents];
    uint64_t v10 = objc_msgSend(v6, "rem_stringFromDateComponents:", v9);

    id v11 = NSString;
    int v12 = [(REMReminderStorage *)self startDateComponents];
    char v13 = [v12 timeZone];
    v14 = [v11 stringWithFormat:@"startDate: %@ tz: %@", v10, v13];
    [v5 addObject:v14];
  }
  uint64_t v15 = [(REMReminderStorage *)self dueDateComponents];

  if (v15)
  {
    v16 = [(REMReminderStorage *)self dueDateComponents];
    v17 = objc_msgSend(v6, "rem_stringFromDateComponents:", v16);

    v18 = NSString;
    int v19 = [(REMReminderStorage *)self dueDateComponents];
    v20 = [v19 timeZone];
    uint64_t v21 = [v18 stringWithFormat:@"dueDate: %@ tz: %@", v17, v20];
    [v5 addObject:v21];
  }
  v22 = [(REMReminderStorage *)self displayDate];

  if (v22)
  {
    uint64_t v23 = [(REMReminderStorage *)self displayDate];
    uint64_t v24 = [v23 date];
    int v25 = [v6 stringFromDate:v24];

    objc_super v26 = NSString;
    uint64_t v27 = [(REMReminderStorage *)self displayDate];
    v28 = [v27 timeZone];
    v29 = [v26 stringWithFormat:@"displayDate: %@ tz: %@", v25, v28];
    [v5 addObject:v29];
  }
  uint64_t v57 = v6;
  uint64_t v30 = [(REMReminderStorage *)self alarms];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    unint64_t v32 = 0;
    uint64_t v33 = &off_1E61DB000;
    uint64_t v34 = @"alarm[%ld]: %@";
    unint64_t v58 = v5;
    do
    {
      v35 = [(REMReminderStorage *)self alarms];
      v36 = [v35 objectAtIndexedSubscript:v32];

      int v37 = [v36 trigger];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      uint64_t v39 = [v36 trigger];
      v40 = v39;
      if (isKindOfClass)
      {
        v41 = [v39 dateComponents];
        uint64_t v42 = objc_msgSend(v57, "rem_stringFromDateComponents:", v41);

        int v43 = *(void **)(v8 + 24);
        [v40 dateComponents];
        v44 = self;
        uint64_t v45 = v34;
        uint64_t v47 = v46 = v33;
        v48 = [v47 timeZone];
        int v49 = [v43 stringWithFormat:@"%@ tz: %@", v42, v48];

        unint64_t v8 = 0x1E4F29000;
        uint64_t v33 = v46;
        uint64_t v34 = v45;
        self = v44;
      }
      else
      {
        uint64_t v50 = (objc_class *)objc_opt_class();
        int v49 = NSStringFromClass(v50);
      }

      uint64_t v51 = objc_msgSend(*(id *)(v8 + 24), "stringWithFormat:", v34, v32, v49);
      id v5 = v58;
      [v58 addObject:v51];

      ++v32;
      v52 = [(REMReminderStorage *)self alarms];
      unint64_t v53 = [v52 count];

      BOOL v54 = v32 >= v53;
      unint64_t v8 = 0x1E4F29000;
    }
    while (!v54);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v52 = a3;
  id v4 = [(REMReminderStorage *)self objectID];
  [v52 encodeObject:v4 forKey:@"objectID"];

  id v5 = [(REMReminderStorage *)self listID];
  [v52 encodeObject:v5 forKey:@"listID"];

  uint64_t v6 = [(REMReminderStorage *)self accountID];
  [v52 encodeObject:v6 forKey:@"accountID"];

  v7 = [(REMReminderStorage *)self parentReminderID];
  [v52 encodeObject:v7 forKey:@"parentReminderID"];

  unint64_t v8 = [(REMReminderStorage *)self daCalendarItemUniqueIdentifier];
  [v52 encodeObject:v8 forKey:@"daCalendarItemUniqueIdentifier"];

  id v9 = [(REMReminderStorage *)self externalIdentifier];
  [v52 encodeObject:v9 forKey:@"externalIdentifier"];

  uint64_t v10 = [(REMReminderStorage *)self externalModificationTag];
  [v52 encodeObject:v10 forKey:@"externalModificationTag"];

  id v11 = [(REMReminderStorage *)self daSyncToken];
  [v52 encodeObject:v11 forKey:@"daSyncToken"];

  int v12 = [(REMReminderStorage *)self daPushKey];
  [v52 encodeObject:v12 forKey:@"daPushKey"];

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage minimumSupportedVersion](self, "minimumSupportedVersion"), @"minimumSupportedVersion");
  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), @"effectiveMinimumSupportedVersion");
  objc_msgSend(v52, "encodeBool:forKey:", -[REMReminderStorage isCompleted](self, "isCompleted"), @"isCompleted");
  char v13 = [(REMReminderStorage *)self completionDate];
  [v52 encodeObject:v13 forKey:@"completionDate"];

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage priority](self, "priority"), @"priority");
  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage flagged](self, "flagged"), @"flagged");
  v14 = [(REMReminderStorage *)self startDateComponents];
  [v52 encodeObject:v14 forKey:@"startDateComponents"];

  uint64_t v15 = [(REMReminderStorage *)self dueDateComponents];
  [v52 encodeObject:v15 forKey:@"dueDateComponents"];

  v16 = [(REMReminderStorage *)self primaryLocaleInferredFromLastUsedKeyboard];
  [v52 encodeObject:v16 forKey:@"primaryLocaleInferredFromLastUsedKeyboard"];

  v17 = [(REMReminderStorage *)self timeZone];
  [v52 encodeObject:v17 forKey:@"timeZone"];

  objc_msgSend(v52, "encodeBool:forKey:", -[REMReminderStorage allDay](self, "allDay"), @"allDay");
  v18 = [(REMReminderStorage *)self creationDate];
  [v52 encodeObject:v18 forKey:@"creationDate"];

  int v19 = [(REMReminderStorage *)self lastModifiedDate];
  [v52 encodeObject:v19 forKey:@"lastModifiedDate"];

  v20 = [(REMReminderStorage *)self recurrenceRules];
  [v52 encodeObject:v20 forKey:@"recurrenceRules"];

  uint64_t v21 = [(REMReminderStorage *)self attachments];
  [v52 encodeObject:v21 forKey:@"attachments"];

  v22 = [(REMReminderStorage *)self alarms];
  [v52 encodeObject:v22 forKey:@"alarms"];

  uint64_t v23 = [(REMReminderStorage *)self assignments];
  [v52 encodeObject:v23 forKey:@"assignments"];

  uint64_t v24 = [(REMReminderStorage *)self hashtags];
  [v52 encodeObject:v24 forKey:@"hashtags"];

  int v25 = [(REMReminderStorage *)self dueDateDeltaAlertsData];
  [v52 encodeObject:v25 forKey:@"dueDateDeltaAlertsData"];

  objc_super v26 = [(REMReminderStorage *)self dueDateDeltaAlertsToUpsert];
  [v52 encodeObject:v26 forKey:@"dueDateDeltaAlertsToUpsert"];

  uint64_t v27 = [(REMReminderStorage *)self dueDateDeltaAlertIdentifiersToDelete];
  [v52 encodeObject:v27 forKey:@"dueDateDeltaAlertIdentifiersToDelete"];

  v28 = [(REMReminderStorage *)self contactHandles];
  [v52 encodeObject:v28 forKey:@"contactHandles"];

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage icsDisplayOrder](self, "icsDisplayOrder"), @"icsDisplayOrder");
  v29 = [(REMReminderStorage *)self icsUrl];
  [v52 encodeObject:v29 forKey:@"icsUrl"];

  uint64_t v30 = [(REMReminderStorage *)self importedICSData];
  [v52 encodeObject:v30 forKey:@"importedICSData"];

  uint64_t v31 = [(REMReminderStorage *)self userActivity];
  [v52 encodeObject:v31 forKey:@"userActivity"];

  unint64_t v32 = [(REMReminderStorage *)self siriFoundInAppsData];
  [v52 encodeObject:v32 forKey:@"siriFoundInAppsData"];

  objc_msgSend(v52, "encodeInteger:forKey:", -[REMReminderStorage siriFoundInAppsUserConfirmation](self, "siriFoundInAppsUserConfirmation"), @"siriFoundInAppsUserConfirmation");
  uint64_t v33 = [(REMReminderStorage *)self lastBannerPresentationDate];
  [v52 encodeObject:v33 forKey:@"lastBannerPresentationDate"];

  uint64_t v34 = [(REMReminderStorage *)self displayDate];
  [v52 encodeObject:v34 forKey:@"displayDate"];

  if (self->_hasDeserializedTitleDocument)
  {
    if (self->_deserializedTitleDocumentCache)
    {
      v35 = [(REMReminderStorage *)self titleDocumentData];
      uint64_t v36 = [v35 length];

      if (!v36)
      {
        int v37 = [(REMCRMergeableStringDocument *)self->_deserializedTitleDocumentCache serializedData];
        [(REMReminderStorage *)self setTitleDocumentData:v37];
      }
    }
    else
    {
      [(REMReminderStorage *)self setTitleDocumentData:0];
    }
  }
  uint64_t v38 = [(REMReminderStorage *)self titleDocumentData];
  [v52 encodeObject:v38 forKey:@"titleDocumentData"];

  uint64_t v39 = [(REMReminderStorage *)self titleAsString];
  [v52 encodeObject:v39 forKey:@"titleAsString"];

  if (self->_hasDeserializedNotesDocument)
  {
    if (self->_deserializedNotesDocumentCache)
    {
      v40 = [(REMReminderStorage *)self notesDocumentData];
      uint64_t v41 = [v40 length];

      if (!v41)
      {
        uint64_t v42 = [(REMCRMergeableStringDocument *)self->_deserializedNotesDocumentCache serializedData];
        [(REMReminderStorage *)self setNotesDocumentData:v42];
      }
    }
    else
    {
      [(REMReminderStorage *)self setNotesDocumentData:0];
    }
  }
  int v43 = [(REMReminderStorage *)self notesDocumentData];
  [v52 encodeObject:v43 forKey:@"notesDocumentData"];

  v44 = [(REMReminderStorage *)self notesAsString];
  [v52 encodeObject:v44 forKey:@"notesAsString"];

  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    [v52 encodeObject:resolutionTokenMap forKey:@"resolutionTokenMap"];
    [v52 encodeObject:0 forKey:@"resolutionTokenMapData"];
  }
  else
  {
    [v52 encodeObject:0 forKey:@"resolutionTokenMap"];
    v46 = [(REMReminderStorage *)self resolutionTokenMapData];
    [v52 encodeObject:v46 forKey:@"resolutionTokenMapData"];
  }
  uint64_t v47 = [(REMReminderStorage *)self subtaskIDsToUndelete];
  v48 = [v47 allObjects];
  [v52 encodeObject:v48 forKey:@"subtaskIDsToUndelete"];

  int v49 = [(REMReminderStorage *)self hashtagIDsToUndelete];
  uint64_t v50 = [v49 allObjects];
  [v52 encodeObject:v50 forKey:@"hashtagIDsToUndelete"];

  [v52 encodeObject:self->_fetchedDueDateDeltaAlerts forKey:@"fetchedDueDateDeltaAlerts"];
  uint64_t v51 = [(REMReminderStorage *)self alternativeDisplayDateDate_forCalendar];
  [v52 encodeObject:v51 forKey:@"alternativeDisplayDateDate_forCalendar"];
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration) {
    self->_storeGeneration = a3;
  }
}

- (id)titleDocument
{
  if (self->_hasDeserializedTitleDocument)
  {
    uint64_t v3 = self->_deserializedTitleDocumentCache;
  }
  else
  {
    self->_hasDeserializedTitleDocument = 1;
    id v4 = [(REMReminderStorage *)self titleDocumentData];
    id v5 = [(REMReminderStorage *)self titleReplicaIDSource];
    uint64_t v6 = [(REMReminderStorage *)self objectID];
    uint64_t v3 = +[REMCRMergeableStringDocument documentFromSerializedData:v4 replicaIDSource:v5 forKey:@"titleDocument" ofObjectID:v6];

    v7 = [(REMReminderStorage *)self titleDocumentData];

    if (!v7 || v3)
    {
      objc_storeStrong((id *)&self->_deserializedTitleDocumentCache, v3);
    }
    else
    {
      unint64_t v8 = +[REMLogStore read];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[REMReminderStorage titleDocument](v8);
      }
    }
  }

  return v3;
}

- (void)setTitleDocument:(id)a3
{
  id v7 = a3;
  self->_hasDeserializedTitleDocument = 1;
  objc_storeStrong((id *)&self->_deserializedTitleDocumentCache, a3);
  id v5 = [v7 string];
  [(REMReminderStorage *)self setTitleAsString:v5];

  if (v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] data];
    [(REMReminderStorage *)self setTitleDocumentData:v6];
  }
  else
  {
    [(REMReminderStorage *)self setTitleDocumentData:0];
  }
}

- (id)notesDocument
{
  if (self->_hasDeserializedNotesDocument)
  {
    uint64_t v3 = self->_deserializedNotesDocumentCache;
  }
  else
  {
    self->_hasDeserializedNotesDocument = 1;
    id v4 = [(REMReminderStorage *)self notesDocumentData];
    id v5 = [(REMReminderStorage *)self notesReplicaIDSource];
    uint64_t v6 = [(REMReminderStorage *)self objectID];
    uint64_t v3 = +[REMCRMergeableStringDocument documentFromSerializedData:v4 replicaIDSource:v5 forKey:@"notesDocument" ofObjectID:v6];

    id v7 = [(REMReminderStorage *)self notesDocumentData];

    if (!v7 || v3)
    {
      objc_storeStrong((id *)&self->_deserializedNotesDocumentCache, v3);
    }
    else
    {
      unint64_t v8 = +[REMLogStore read];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[REMReminderStorage notesDocument](v8);
      }
    }
  }

  return v3;
}

- (void)setNotesDocument:(id)a3
{
  id v7 = a3;
  self->_hasDeserializedNotesDocument = 1;
  objc_storeStrong((id *)&self->_deserializedNotesDocumentCache, a3);
  id v5 = [v7 string];
  [(REMReminderStorage *)self setNotesAsString:v5];

  if (v7)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] data];
    [(REMReminderStorage *)self setNotesDocumentData:v6];
  }
  else
  {
    [(REMReminderStorage *)self setNotesDocumentData:0];
  }
}

- (NSString)legacyNotificationIdentifier
{
  v2 = [(REMReminderStorage *)self daCalendarItemUniqueIdentifier];
  if (v2)
  {
    if (legacyNotificationIdentifier_onceToken != -1) {
      dispatch_once(&legacyNotificationIdentifier_onceToken, &__block_literal_global_8);
    }
    uint64_t v3 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:legacyNotificationIdentifier_allowedCharacters];
    if (v3)
    {
      id v4 = [NSString stringWithFormat:@"x-apple-eventkit-alert-x-apple-reminder://%@", v3];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

void __50__REMReminderStorage_legacyNotificationIdentifier__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  [v3 removeCharactersInString:@"/?&:$+,;=@"];
  uint64_t v1 = [v3 copy];
  v2 = (void *)legacyNotificationIdentifier_allowedCharacters;
  legacyNotificationIdentifier_allowedCharacters = v1;
}

- (id)currentAssignment
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  uint64_t v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  v2 = [(REMReminderStorage *)self assignments];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__REMReminderStorage_currentAssignment__block_invoke;
  v5[3] = &unk_1E61DC168;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__REMReminderStorage_currentAssignment__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  id v7 = v8;
  id v12 = v4;
  if (v8)
  {
    [v7 orderValue];
    double v10 = v9;
    [v12 orderValue];
    if (v10 > v11) {
      goto LABEL_5;
    }
    uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_storeStrong(v6, a2);
LABEL_5:
}

+ (id)newObjectID
{
  id v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cdEntityName];
  uint64_t v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDReminder";
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMReminderStorage *)self effectiveMinimumSupportedVersion];

  return rem_isUnsupportedVersionByRuntime(v2);
}

- (id)cdKeyToStorageKeyMap
{
  uint64_t v2 = [(REMReminderStorage *)self objectID];
  id v3 = [v2 entityName];
  id v4 = +[REMTemplate cdEntityNameForSavedReminder];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    if (cdSavedReminderKeyToStorageKeyMap_onceToken != -1) {
      dispatch_once(&cdSavedReminderKeyToStorageKeyMap_onceToken, &__block_literal_global_577);
    }
    uint64_t v6 = &cdSavedReminderKeyToStorageKeyMap_mapping;
  }
  else
  {
    if (cdReminderKeyToStorageKeyMap_onceToken != -1) {
      dispatch_once(&cdReminderKeyToStorageKeyMap_onceToken, &__block_literal_global_580);
    }
    uint64_t v6 = &cdReminderKeyToStorageKeyMap_mapping;
  }
  id v7 = (void *)*v6;

  return v7;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  p_resolutionTokenMap = &self->_resolutionTokenMap;
  id v4 = self->_resolutionTokenMap;
  if (v4)
  {
    int v5 = v4;
  }
  else
  {
    uint64_t v6 = [(REMReminderStorage *)self resolutionTokenMapData];
    if (!v6)
    {
      id v7 = +[REMLogStore read];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(REMReminderStorage *)(uint64_t)self resolutionTokenMap];
      }
    }
    uint64_t v8 = [(REMReminderStorage *)self cdKeyToStorageKeyMap];
    double v9 = +[REMResolutionTokenMap resolutionTokenMapWithJSONData:v6 keyMap:v8];

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    int v5 = v9;
  }

  return v5;
}

+ (id)titleReplicaIDSourceWithAccountID:(id)a3 reminderID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[REMReplicaIDSource alloc] initWithAccountID:v6 objectID:v5 property:@"titleDocument"];

  return v7;
}

+ (id)notesReplicaIDSourceWithAccountID:(id)a3 reminderID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[REMReplicaIDSource alloc] initWithAccountID:v6 objectID:v5 property:@"notesDocument"];

  return v7;
}

- (id)titleReplicaIDSource
{
  id v3 = [(REMReminderStorage *)self accountID];
  id v4 = [(REMReminderStorage *)self objectID];
  id v5 = +[REMReminderStorage titleReplicaIDSourceWithAccountID:v3 reminderID:v4];

  return v5;
}

- (id)notesReplicaIDSource
{
  id v3 = [(REMReminderStorage *)self accountID];
  id v4 = [(REMReminderStorage *)self objectID];
  id v5 = +[REMReminderStorage notesReplicaIDSourceWithAccountID:v3 reminderID:v4];

  return v5;
}

- (void)updateDisplayDate
{
  id v3 = [REMDisplayDate alloc];
  id v6 = [(REMReminderStorage *)self dueDateComponents];
  id v4 = [(REMReminderStorage *)self alarms];
  id v5 = [(REMDisplayDate *)v3 initWithDueDateComponents:v6 alarms:v4];
  [(REMReminderStorage *)self setDisplayDate:v5];
}

+ (BOOL)isDate:(id)a3 overdueAtReferenceDate:(id)a4 allDay:(BOOL)a5 showAllDayRemindersAsOverdue:(BOOL)a6
{
  LODWORD(v6) = a6;
  id v9 = a3;
  id v10 = a4;
  double v11 = v10;
  if (a5)
  {
    if (v6)
    {
      id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v12 = [v6 startOfDayForDate:v11];

      [v12 timeIntervalSinceDate:v9];
      LOBYTE(v6) = v13 > 0.0;
    }
  }
  else
  {
    [v10 timeIntervalSinceDate:v9];
    LOBYTE(v6) = v14 > 0.0;
  }

  return (char)v6;
}

- (BOOL)isOverdue
{
  id v3 = [(REMReminderStorage *)self displayDate];

  if (!v3) {
    return 0;
  }
  id v4 = [(REMReminderStorage *)self displayDate];
  id v5 = [v4 date];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = [(REMReminderStorage *)self displayDate];
  uint64_t v8 = [v7 isAllDay];
  id v9 = +[REMUserDefaults daemonUserDefaults];
  BOOL v10 = +[REMReminderStorage isDate:overdueAtReferenceDate:allDay:showAllDayRemindersAsOverdue:](REMReminderStorage, "isDate:overdueAtReferenceDate:allDay:showAllDayRemindersAsOverdue:", v5, v6, v8, [v9 showRemindersAsOverdue]);

  return v10;
}

- (BOOL)isRecurrent
{
  uint64_t v2 = [(REMReminderStorage *)self recurrenceRules];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasUnfetchedDueDateDeltaAlerts
{
  BOOL v3 = [(REMReminderStorage *)self dueDateDeltaAlertsData];
  if (v3)
  {
    id v4 = [(REMReminderStorage *)self fetchedDueDateDeltaAlerts];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)fetchedDueDateDeltaAlerts
{
  return self->_fetchedDueDateDeltaAlerts;
}

- (void)setFetchedDueDateDeltaAlerts:(id)a3
{
  self->_fetchedDueDateDeltaAlerts = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)effectiveDisplayDateComponents_forCalendar
{
  BOOL v3 = [(REMReminderStorage *)self displayDate];
  if (v3)
  {
    id v4 = [(REMReminderStorage *)self alternativeDisplayDateDate_forCalendar];
    if (v4
      && ([(REMReminderStorage *)self isCompleted]
       || ![(REMReminderStorage *)self isRecurrent]))
    {
      id v6 = [v3 timeZone];
      id v7 = (void *)MEMORY[0x1E4F1C9D8];
      uint64_t v8 = [v3 isAllDay];
      if (v6) {
        objc_msgSend(v7, "rem_dateComponentsWithDate:timeZone:isAllDay:", v4, v6, v8);
      }
      else {
      BOOL v5 = objc_msgSend(v7, "rem_dateComponentsWithDateUsingArchivingTimeZone:isAllDay:", v4, v8);
      }
    }
    else
    {
      BOOL v5 = [v3 dateComponentsRepresentation];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setAlternativeDisplayDateDateForCalendarWithDateComponents:(id)a3
{
  id v6 = a3;
  id v4 = [v6 timeZone];
  if (v6)
  {
    if (v4) {
      objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateWithDateComponents:timeZone:", v6, v4);
    }
    else {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1C9D8], "rem_dateWithDateComponentsUsingArchivingTimeZone:", v6);
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  [(REMReminderStorage *)self setAlternativeDisplayDateDate_forCalendar:v5];
}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (void)setDaSyncToken:(id)a3
{
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (void)setDaPushKey:(id)a3
{
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void)setListID:(id)a3
{
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (void)setParentReminderID:(id)a3
{
}

- (NSData)titleDocumentData
{
  return self->_titleDocumentData;
}

- (void)setTitleDocumentData:(id)a3
{
}

- (NSData)notesDocumentData
{
  return self->_notesDocumentData;
}

- (void)setNotesDocumentData:(id)a3
{
}

- (NSString)primaryLocaleInferredFromLastUsedKeyboard
{
  return self->_primaryLocaleInferredFromLastUsedKeyboard;
}

- (void)setPrimaryLocaleInferredFromLastUsedKeyboard:(id)a3
{
}

- (NSString)titleAsString
{
  return self->_titleAsString;
}

- (void)setTitleAsString:(id)a3
{
}

- (NSString)notesAsString
{
  return self->_notesAsString;
}

- (void)setNotesAsString:(id)a3
{
}

- (void)setResolutionTokenMap:(id)a3
{
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (void)setResolutionTokenMapData:(id)a3
{
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
}

- (NSSet)subtaskIDsToUndelete
{
  return self->_subtaskIDsToUndelete;
}

- (void)setSubtaskIDsToUndelete:(id)a3
{
}

- (NSSet)hashtagIDsToUndelete
{
  return self->_hashtagIDsToUndelete;
}

- (void)setHashtagIDsToUndelete:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSArray)recurrenceRules
{
  return self->_recurrenceRules;
}

- (void)setRecurrenceRules:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (REMContactRepresentation)contactHandles
{
  return self->_contactHandles;
}

- (void)setContactHandles:(id)a3
{
}

- (unint64_t)icsDisplayOrder
{
  return self->_icsDisplayOrder;
}

- (void)setIcsDisplayOrder:(unint64_t)a3
{
  self->_icsDisplayOrder = a3;
}

- (NSURL)icsUrl
{
  return self->_icsUrl;
}

- (void)setIcsUrl:(id)a3
{
}

- (NSData)importedICSData
{
  return self->_importedICSData;
}

- (void)setImportedICSData:(id)a3
{
}

- (NSString)daCalendarItemUniqueIdentifier
{
  return self->_daCalendarItemUniqueIdentifier;
}

- (void)setDaCalendarItemUniqueIdentifier:(id)a3
{
}

- (REMUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (NSData)siriFoundInAppsData
{
  return self->_siriFoundInAppsData;
}

- (void)setSiriFoundInAppsData:(id)a3
{
}

- (int64_t)siriFoundInAppsUserConfirmation
{
  return self->_siriFoundInAppsUserConfirmation;
}

- (void)setSiriFoundInAppsUserConfirmation:(int64_t)a3
{
  self->_siriFoundInAppsUserConfirmation = a3;
}

- (NSDate)lastBannerPresentationDate
{
  return self->_lastBannerPresentationDate;
}

- (void)setLastBannerPresentationDate:(id)a3
{
}

- (int64_t)flagged
{
  return self->_flagged;
}

- (void)setFlagged:(int64_t)a3
{
  self->_flagged = a3;
}

- (NSSet)assignments
{
  return self->_assignments;
}

- (void)setAssignments:(id)a3
{
}

- (NSSet)hashtags
{
  return self->_hashtags;
}

- (void)setHashtags:(id)a3
{
}

- (NSData)dueDateDeltaAlertsData
{
  return self->_dueDateDeltaAlertsData;
}

- (void)setDueDateDeltaAlertsData:(id)a3
{
}

- (NSArray)dueDateDeltaAlertsToUpsert
{
  return self->_dueDateDeltaAlertsToUpsert;
}

- (void)setDueDateDeltaAlertsToUpsert:(id)a3
{
}

- (NSSet)dueDateDeltaAlertIdentifiersToDelete
{
  return self->_dueDateDeltaAlertIdentifiersToDelete;
}

- (void)setDueDateDeltaAlertIdentifiersToDelete:(id)a3
{
}

- (NSDate)alternativeDisplayDateDate_forCalendar
{
  return self->_alternativeDisplayDateDate_forCalendar;
}

- (void)setAlternativeDisplayDateDate_forCalendar:(id)a3
{
}

- (REMDisplayDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_alternativeDisplayDateDate_forCalendar, 0);
  objc_storeStrong((id *)&self->_dueDateDeltaAlertIdentifiersToDelete, 0);
  objc_storeStrong((id *)&self->_dueDateDeltaAlertsToUpsert, 0);
  objc_storeStrong((id *)&self->_dueDateDeltaAlertsData, 0);
  objc_storeStrong((id *)&self->_hashtags, 0);
  objc_storeStrong((id *)&self->_assignments, 0);
  objc_storeStrong((id *)&self->_lastBannerPresentationDate, 0);
  objc_storeStrong((id *)&self->_siriFoundInAppsData, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_daCalendarItemUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_importedICSData, 0);
  objc_storeStrong((id *)&self->_icsUrl, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_recurrenceRules, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_hashtagIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_subtaskIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_notesAsString, 0);
  objc_storeStrong((id *)&self->_titleAsString, 0);
  objc_storeStrong((id *)&self->_primaryLocaleInferredFromLastUsedKeyboard, 0);
  objc_storeStrong((id *)&self->_notesDocumentData, 0);
  objc_storeStrong((id *)&self->_titleDocumentData, 0);
  objc_storeStrong((id *)&self->_parentReminderID, 0);
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);
  objc_storeStrong((id *)&self->externalIdentifier, 0);
  objc_storeStrong((id *)&self->_fetchedDueDateDeltaAlerts, 0);
  objc_storeStrong((id *)&self->_deserializedNotesDocumentCache, 0);

  objc_storeStrong((id *)&self->_deserializedTitleDocumentCache, 0);
}

- (void)isEqual:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1B9AA2000, v0, v1, "Tried to compare two REMReminderStorage instances without first deserializing their CRDT notesDocument {self: %@, other: %@}");
}

- (void)isEqual:.cold.2()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1B9AA2000, v0, v1, "Tried to compare two REMReminderStorage instances without first deserializing their CRDT titleDocument {self: %@, other: %@}");
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMSiriFoundInAppsUserConfirmation %ld", (uint8_t *)&v2, 0xCu);
}

- (void)titleDocument
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "Failed to read titleDocument from data. Returning nil.", v1, 2u);
}

- (void)notesDocument
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "Failed to read notesDocument from data. Returning nil.", v1, 2u);
}

- (void)resolutionTokenMap
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from reminder storage. Initialize an empty map {class: %{public}@, reminder: %@}", (uint8_t *)&v6, 0x16u);
}

@end