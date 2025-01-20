@interface REMReminder
+ (BOOL)isChangeTrackableFetchableModel;
+ (BOOL)isChangeTrackableModel;
+ (BOOL)rem_DA_supportsConcealedObjects;
+ (BOOL)rem_DA_supportsFetching;
+ (NSString)cdEntityName;
+ (id)fetchRequestForRemindersListID:(id)a3;
+ (id)fetchRequestForRemindersListID:(id)a3 withSortDescriptors:(id)a4;
+ (id)fetchRequestForScheduledRemindersWithDueDateOnOrAfter:(id)a3;
+ (id)fetchRequestWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock;
+ (id)rem_DA_deletedKeyFromTombstoneBlock;
+ (id)rem_DA_fetchByObjectIDBlock;
+ (id)rem_DA_fetchByObjectIDsBlock;
- (BOOL)allDay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubtask;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldUseExternalIdentifierAsDeletionKey;
- (NSAttributedString)notes;
- (NSAttributedString)title;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)externalIdentifierForMarkedForDeletionObject;
- (NSString)notesAsString;
- (NSString)timeZone;
- (NSString)titleAsString;
- (REMAccount)account;
- (REMList)list;
- (REMReminder)initWithStore:(id)a3 account:(id)a4 storage:(id)a5;
- (REMReminder)initWithStore:(id)a3 list:(id)a4 storage:(id)a5;
- (REMReminder)initWithStore:(id)a3 storage:(id)a4;
- (REMReminder)parentReminder;
- (REMReminderAssignmentContext)assignmentContext;
- (REMReminderAttachmentContext)attachmentContext;
- (REMReminderDueDateDeltaAlertContext)dueDateDeltaAlertContext;
- (REMReminderFlaggedContext)flaggedContext;
- (REMReminderHashtagContext)hashtagContext;
- (REMReminderStorage)storage;
- (REMReminderSubtaskContext)subtaskContext;
- (REMStore)store;
- (id)datesDebugDescriptionInTimeZone:(id)a3;
- (id)optionalObjectID;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)allDay;
- (void)setParentReminder:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)shouldUseExternalIdentifierAsDeletionKey;
- (void)timeZone;
@end

@implementation REMReminder

+ (BOOL)isChangeTrackableModel
{
  return 1;
}

+ (BOOL)isChangeTrackableFetchableModel
{
  return 1;
}

+ (BOOL)rem_DA_supportsFetching
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && [a1 performSelector:sel_isChangeTrackableFetchableModel] != 0;
}

+ (BOOL)rem_DA_supportsConcealedObjects
{
  return 1;
}

+ (id)rem_DA_fetchByObjectIDBlock
{
  return &__block_literal_global_282;
}

id __86__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  v10 = v9;
  if (a3)
  {
    uint64_t v21 = 0;
    v11 = (id *)&v21;
    uint64_t v12 = [v9 fetchReminderIncludingConcealedWithObjectID:v8 error:&v21];
  }
  else
  {
    uint64_t v20 = 0;
    v11 = (id *)&v20;
    uint64_t v12 = [v9 fetchReminderWithObjectID:v8 error:&v20];
  }
  v13 = (void *)v12;
  id v14 = *v11;
  v15 = v14;
  if (v14 && [v14 code] != -3000)
  {
    v16 = +[REMLog changeTracking];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = [NSNumber numberWithBool:a3];
      v19 = [v15 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v23 = v8;
      __int16 v24 = 2114;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_error_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMReminder {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);
    }
  }
  if (a5) {
    *a5 = v15;
  }

  return v13;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_284;
}

id __87__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v11 = 0;
  v7 = [a3 fetchRemindersWithObjectIDs:v6 error:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = +[REMLog changeTracking];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __87__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_286;
}

id __94__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 externalIdentifier];
  if (!v3)
  {
    v4 = [v2 objectIdentifier];
    v3 = [v4 UUIDString];
  }

  return v3;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_288;
}

id __105__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  v4 = REMCheckedDynamicCast(v3, (uint64_t)v2);

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = +[REMLog changeTracking];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __105__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(v4);
    }
  }
  if ([v4 shouldUseExternalIdentifierAsDeletionKey]) {
    [v4 externalIdentifierForMarkedForDeletionObject];
  }
  else {
  v5 = [v4 objectID];
  }

  return v5;
}

+ (id)fetchRequestWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[REMReminderFetchExecutor alloc] initWithPredicateDescriptor:v6 sortDescriptors:v5 options:0];

  id v8 = [[REMFetchRequest alloc] initWithFetchExecutor:v7];

  return v8;
}

+ (id)fetchRequestForRemindersListID:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = +[REMReminderSortDescriptor sortDescriptorSortingByCreationDateAscending:1];
  v7 = [v4 arrayWithObject:v6];

  id v8 = [a1 fetchRequestForRemindersListID:v5 withSortDescriptors:v7];

  return v8;
}

+ (id)fetchRequestForRemindersListID:(id)a3 withSortDescriptors:(id)a4
{
  id v5 = a4;
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v5;
  id v8 = +[REMReminderPredicateDescriptor predicateDescriptorForRemindersWithListID:a3];
  id v9 = [[REMReminderFetchExecutor alloc] initWithPredicateDescriptor:v8 sortDescriptors:v6 options:3];
  v10 = [[REMFetchRequest alloc] initWithFetchExecutor:v9];

  return v10;
}

+ (id)fetchRequestForScheduledRemindersWithDueDateOnOrAfter:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[REMReminderPredicateDescriptor predicateDescriptorForRemindersWithDueDateOnOrAfter:a3];
  v13[0] = v3;
  v4 = +[REMReminderPredicateDescriptor predicateDescriptorForRemindersWithCompleted:0];
  v13[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v6 = +[REMReminderPredicateDescriptor andPredicateDescriptorWithDescriptors:v5];

  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = +[REMReminderSortDescriptor sortDescriptorSortingByDueDateAscending:1];
  id v9 = [v7 arrayWithObject:v8];

  v10 = [[REMReminderFetchExecutor alloc] initWithPredicateDescriptor:v6 sortDescriptors:v9 options:4];
  id v11 = [[REMFetchRequest alloc] initWithFetchExecutor:v10];

  return v11;
}

- (REMReminder)initWithStore:(id)a3 list:(id)a4 storage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REMReminder;
  uint64_t v12 = [(REMReminder *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    uint64_t v14 = [v10 account];
    account = v13->_account;
    v13->_account = (REMAccount *)v14;

    objc_storeStrong((id *)&v13->_list, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMReminderStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", [v9 storeGeneration]);
  }

  return v13;
}

- (REMReminder)initWithStore:(id)a3 storage:(id)a4
{
  return [(REMReminder *)self initWithStore:a3 account:0 storage:a4];
}

- (REMReminder)initWithStore:(id)a3 account:(id)a4 storage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMReminder;
  uint64_t v12 = [(REMReminder *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    if (v10) {
      objc_storeStrong((id *)&v13->_account, a4);
    }
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMReminderStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", [v9 storeGeneration]);
  }

  return v13;
}

- (id)optionalObjectID
{
  id v2 = [(REMReminder *)self storage];
  uint64_t v3 = [v2 optionalObjectID];

  return v3;
}

- (BOOL)isSubtask
{
  id v2 = [(REMReminder *)self parentReminder];
  BOOL v3 = v2 != 0;

  return v3;
}

- (REMReminderSubtaskContext)subtaskContext
{
  BOOL v3 = [(REMReminder *)self account];
  v4 = [v3 capabilities];
  if ([v4 supportsSubtasks])
  {
    BOOL v5 = [(REMReminder *)self isSubtask];

    if (!v5)
    {
      id v6 = [[REMReminderSubtaskContext alloc] initWithReminder:self];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (REMReminderAttachmentContext)attachmentContext
{
  BOOL v3 = [(REMReminder *)self account];
  v4 = [v3 capabilities];
  int v5 = [v4 supportsAttachments];

  if (v5) {
    id v6 = [[REMReminderAttachmentContext alloc] initWithReminder:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (REMReminderFlaggedContext)flaggedContext
{
  BOOL v3 = [(REMReminder *)self account];
  v4 = [v3 capabilities];
  int v5 = [v4 supportsFlagged];

  if (v5) {
    id v6 = [[REMReminderFlaggedContext alloc] initWithReminder:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (REMReminderAssignmentContext)assignmentContext
{
  BOOL v3 = [(REMReminder *)self account];
  v4 = [v3 capabilities];
  int v5 = [v4 supportsAssignments];

  if (v5) {
    id v6 = [[REMReminderAssignmentContext alloc] initWithReminder:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (REMReminderHashtagContext)hashtagContext
{
  BOOL v3 = [(REMReminder *)self account];
  v4 = [v3 capabilities];
  int v5 = [v4 supportsHashtags];

  if (v5) {
    id v6 = [[REMReminderHashtagContext alloc] initWithReminder:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (REMReminderDueDateDeltaAlertContext)dueDateDeltaAlertContext
{
  BOOL v3 = [(REMReminder *)self account];
  v4 = [v3 capabilities];
  int v5 = [v4 supportsDueDateDeltaAlerts];

  if (v5) {
    id v6 = [[REMReminderDueDateDeltaAlertContext alloc] initWithReminder:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMReminder *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      id v6 = [(REMReminder *)v5 store];
      id v7 = [(REMReminder *)self store];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        id v9 = [(REMReminder *)v5 list];
        uint64_t v10 = [(REMReminder *)self list];
        if (v9 == (void *)v10)
        {
        }
        else
        {
          id v11 = (void *)v10;
          uint64_t v12 = [(REMReminder *)v5 list];
          v13 = [(REMReminder *)self list];
          int v14 = [v12 isEqual:v13];

          if (!v14) {
            goto LABEL_6;
          }
        }
        v16 = [(REMReminder *)v5 storage];
        objc_super v17 = [(REMReminder *)self storage];
        char v15 = [v16 isEqual:v17];

        goto LABEL_11;
      }
LABEL_6:
      char v15 = 0;
LABEL_11:

      goto LABEL_12;
    }
    char v15 = 0;
  }
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  id v2 = [(REMReminder *)self storage];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(REMReminder *)self storage];
  id v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(REMReminder *)self storage];
  id v6 = [v5 debugDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v6];

  return (NSString *)v7;
}

- (id)datesDebugDescriptionInTimeZone:(id)a3
{
  id v4 = a3;
  int v5 = [(REMReminder *)self storage];
  id v6 = [v5 datesDebugDescriptionInTimeZone:v4];

  return v6;
}

- (NSAttributedString)title
{
  id v2 = [(REMReminder *)self storage];
  unint64_t v3 = [v2 titleDocument];
  id v4 = [v3 attributedString];

  return (NSAttributedString *)v4;
}

- (NSString)titleAsString
{
  id v2 = [(REMReminder *)self storage];
  unint64_t v3 = [v2 titleAsString];

  return (NSString *)v3;
}

- (NSAttributedString)notes
{
  id v2 = [(REMReminder *)self storage];
  unint64_t v3 = [v2 notesDocument];
  id v4 = [v3 attributedString];

  return (NSAttributedString *)v4;
}

- (NSString)notesAsString
{
  id v2 = [(REMReminder *)self storage];
  unint64_t v3 = [v2 notesAsString];

  return (NSString *)v3;
}

- (NSString)timeZone
{
  unint64_t v3 = [(REMReminder *)self dueDateComponents];
  id v4 = [v3 timeZone];
  int v5 = [v4 name];

  if (!v5)
  {
    unint64_t v3 = [(REMReminder *)self storage];
    uint64_t v6 = [v3 timeZone];
    if (!v6)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v4 = (void *)v6;
  }
  id v7 = [(REMReminder *)self storage];
  int v8 = [v7 timeZone];
  char v9 = [v5 isEqual:v8];

  if (!v5)
  {

    if (v9) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ((v9 & 1) == 0)
  {
LABEL_8:
    unint64_t v3 = +[REMLogStore read];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      [(REMReminder *)self timeZone];
    }
    goto LABEL_10;
  }
LABEL_11:

  return (NSString *)v5;
}

- (BOOL)allDay
{
  unint64_t v3 = [(REMReminder *)self dueDateComponents];
  int v4 = objc_msgSend(v3, "rem_isAllDayDateComponents");

  int v5 = [(REMReminder *)self storage];
  int v6 = [v5 allDay];

  if (v4 != v6)
  {
    id v7 = +[REMLogStore read];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMReminder allDay](self);
    }
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(REMReminder *)self storage];
  int v6 = [v5 valueForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMReminder *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMReminder;
  if (-[REMReminder respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(REMReminder *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

+ (id)newObjectID
{
  return +[REMReminderStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMReminderStorage objectIDWithUUID:a3];
}

+ (NSString)cdEntityName
{
  return +[REMReminderStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  id v2 = [(REMReminder *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (NSString)externalIdentifierForMarkedForDeletionObject
{
  id v2 = [(REMReminder *)self externalIdentifier];
  char v3 = +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:v2];

  return (NSString *)v3;
}

- (BOOL)shouldUseExternalIdentifierAsDeletionKey
{
  char v3 = [(REMReminder *)self account];

  if (!v3)
  {
    objc_super v7 = +[REMLogStore read];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMReminder shouldUseExternalIdentifierAsDeletionKey](self);
    }
  }
  char v4 = [(REMReminder *)self account];
  BOOL v5 = +[REMExternalSyncMetadataUtils shouldUseExternalIdentifierAsDeletionKeyWithAccountType:](REMExternalSyncMetadataUtils, "shouldUseExternalIdentifierAsDeletionKeyWithAccountType:", [v4 type]);

  return v5;
}

- (REMStore)store
{
  return self->_store;
}

- (REMAccount)account
{
  return self->_account;
}

- (REMList)list
{
  return self->_list;
}

- (REMReminderStorage)storage
{
  return self->_storage;
}

- (REMReminder)parentReminder
{
  return self->_parentReminder;
}

- (void)setParentReminder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentReminder, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

void __87__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  id v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "localizedDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMReminder {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);
}

void __105__REMReminder_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "rem_log_fault_if (![reminder respondsToSelector:@selector(shouldUseExternalIdentifierAsDeletionKey)]) -- REMReminder should conform to REMExternalSyncMetadataProviding {reminder: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)timeZone
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 dueDateComponents];
  uint64_t v5 = [v4 timeZone];
  uint64_t v6 = [a1 storage];
  uint64_t v7 = [v6 timeZone];
  int v8 = 138412546;
  uint8_t v9 = v5;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Found internal inconsistency between reminder.storage.timeZone vs reminder.storage.dueDateComponents.timeZone {dueDateComponents.timeZone: %@, storage.timeZone: %@}.", (uint8_t *)&v8, 0x16u);
}

- (void)allDay
{
  uint64_t v1 = [a1 dueDateComponents];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "Found internal inconsistency between reminder.storage.allDay vs reminder.storage.dueDateComponents {dueDateComponents: %@}.", v4, v5, v6, v7, 2u);
}

- (void)shouldUseExternalIdentifierAsDeletionKey
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "rem_log_fault_if (self.account == nil) -- REMReminder.account is nil for -shouldUseExternalIdentifierAsDeletionKey {reminderID: %{public}@}", v4, v5, v6, v7, 2u);
}

@end