@interface REMList
+ (BOOL)isChangeTrackableFetchableModel;
+ (BOOL)isChangeTrackableModel;
+ (BOOL)isOwnedByMeWithSharingStatus:(int64_t)a3;
+ (BOOL)isSharedWithShareeCount:(unint64_t)a3 sharingStatus:(int64_t)a4;
+ (BOOL)rem_DA_supportsConcealedObjects;
+ (BOOL)rem_DA_supportsFetching;
+ (NSString)cdEntityName;
+ (REMObjectID)localAccountDefaultListID;
+ (REMObjectID)siriFoundInAppsListID;
+ (id)fetchRequestWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock;
+ (id)rem_DA_deletedKeyFromTombstoneBlock;
+ (id)rem_DA_fetchByObjectIDBlock;
+ (id)rem_DA_fetchByObjectIDsBlock;
- (BOOL)canBeIncludedInGroup;
- (BOOL)canBeShared;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOriginOfExistingTemplate;
- (BOOL)isOwnedByMe;
- (BOOL)isPinned;
- (BOOL)isShared;
- (BOOL)isSharedToMe;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldUseExternalIdentifierAsDeletionKey;
- (NSOrderedSet)reminderIDsOrdering;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)externalIdentifierForMarkedForDeletionObject;
- (REMAccount)account;
- (REMList)initWithStore:(id)a3 account:(id)a4 storage:(id)a5;
- (REMList)parentList;
- (REMListAppearanceContext)appearanceContext;
- (REMListCalDAVNotificationContext)calDAVNotificationContext;
- (REMListGroceryContext)groceryContext;
- (REMListSectionContext)sectionContext;
- (REMListShareeContext)shareeContext;
- (REMListStorage)storage;
- (REMListSublistContext)sublistContext;
- (REMStore)store;
- (id)ekColor;
- (id)fetchReminderWithExternalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchRemindersAndSubtasksWithError:(id *)a3;
- (id)fetchRemindersCountWithError:(id *)a3;
- (id)fetchRemindersWithError:(id *)a3;
- (id)fetchRemindersWithExternalIdentifiers:(id)a3 error:(id *)a4;
- (id)formattedSharedOwnerName;
- (id)optionalObjectID;
- (id)sharingStatusText;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)hack_overrideReminderIDsOrderingWithOrderedObjectIDs:(id)a3;
- (void)reminderIDsOrdering;
- (void)setParentList:(id)a3;
- (void)setStorage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)shouldUseExternalIdentifierAsDeletionKey;
@end

@implementation REMList

- (REMList)parentList
{
  return self->_parentList;
}

- (REMStore)store
{
  return self->_store;
}

- (void)setParentList:(id)a3
{
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMListStorage objectIDWithUUID:a3];
}

- (id)optionalObjectID
{
  v2 = [(REMList *)self storage];
  v3 = [v2 optionalObjectID];

  return v3;
}

- (REMListStorage)storage
{
  return self->_storage;
}

- (BOOL)canBeShared
{
  v2 = [(REMList *)self account];
  char v3 = [v2 supportsSharingLists];

  return v3;
}

- (REMList)initWithStore:(id)a3 account:(id)a4 storage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMList;
  v12 = [(REMList *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMListStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", [v9 storeGeneration]);
  }

  return v13;
}

- (id)sharingStatusText
{
  char v3 = [(REMList *)self shareeContext];
  uint64_t v4 = [(REMList *)self sharingStatus];
  BOOL v5 = [(REMList *)self isShared];
  int v6 = v4 == 3 || v5;
  if (v6 != 1 || v3 == 0)
  {
    v8 = 0;
    goto LABEL_20;
  }
  if (v4 == 3)
  {
    id v9 = [(REMList *)self formattedSharedOwnerName];
    id v10 = NSString;
    uint64_t v11 = 5;
LABEL_17:
    v12 = _REMGetLocalizedString(v11);
    uint64_t v14 = objc_msgSend(v10, "stringWithFormat:", v12, v9);
    goto LABEL_18;
  }
  if (![(REMList *)self isOwnedByMe])
  {
    id v9 = [(REMList *)self formattedSharedOwnerName];
    id v10 = NSString;
    uint64_t v11 = 4;
    goto LABEL_17;
  }
  id v9 = [v3 shareesExcludingOwner];
  v12 = [v9 firstObject];
  uint64_t v13 = [v9 count];
  if (v13 == 1)
  {
    v16 = [v12 formattedName];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      _REMGetLocalizedString(50);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v18;

    v23 = NSString;
    v24 = _REMGetLocalizedString(2);
    goto LABEL_31;
  }
  if (v13)
  {
    v19 = [v12 formattedName];
    v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      _REMGetLocalizedString(50);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    uint64_t v25 = [v9 count] - 1;
    v23 = NSString;
    v24 = _REMGetLocalizedString(3);
    uint64_t v26 = v25;
LABEL_31:
    v8 = objc_msgSend(v23, "stringWithFormat:", v24, v22, v26);

    goto LABEL_19;
  }
  uint64_t v14 = _REMGetLocalizedString(1);
LABEL_18:
  v8 = (void *)v14;
LABEL_19:

LABEL_20:

  return v8;
}

- (REMListShareeContext)shareeContext
{
  char v3 = [(REMList *)self account];
  uint64_t v4 = [v3 capabilities];
  int v5 = [v4 supportsListSharees];

  if (v5) {
    int v6 = [[REMListShareeContext alloc] initWithList:self];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (REMListGroceryContext)groceryContext
{
  char v3 = [(REMList *)self account];
  uint64_t v4 = [v3 capabilities];
  int v5 = [v4 supportsSections];

  if (v5) {
    int v6 = [[REMListGroceryContext alloc] initWithList:self];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (REMListAppearanceContext)appearanceContext
{
  char v3 = [(REMList *)self account];
  uint64_t v4 = [v3 capabilities];
  int v5 = [v4 supportsSubtasks];

  if (v5) {
    int v6 = [[REMListAppearanceContext alloc] initWithList:self];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (REMAccount)account
{
  return self->_account;
}

- (BOOL)isShared
{
  v2 = self;
  char v3 = [(REMList *)self sharees];
  LOBYTE(v2) = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", [v3 count], -[REMList sharingStatus](v2, "sharingStatus"));

  return (char)v2;
}

+ (BOOL)isSharedWithShareeCount:(unint64_t)a3 sharingStatus:(int64_t)a4
{
  return a3 || a4 == 2;
}

- (BOOL)isPinned
{
  v2 = [(REMList *)self pinnedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentList, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

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
  return &__block_literal_global_234;
}

id __82__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDBlock__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  id v10 = v9;
  if (a3)
  {
    uint64_t v21 = 0;
    uint64_t v11 = (id *)&v21;
    uint64_t v12 = [v9 fetchListIncludingConcealedWithObjectID:v8 error:&v21];
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v11 = (id *)&v20;
    uint64_t v12 = [v9 fetchListWithObjectID:v8 error:&v20];
  }
  uint64_t v13 = (void *)v12;
  id v14 = *v11;
  objc_super v15 = v14;
  if (v14 && [v14 code] != -3000)
  {
    v16 = +[REMLog changeTracking];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v18 = [NSNumber numberWithBool:a3];
      v19 = [v15 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v23 = v8;
      __int16 v24 = 2114;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_error_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_ERROR, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMList {objectID: %{public}@, includeConcealedObjects: %{public}@, error: %@}.", buf, 0x20u);
    }
  }
  if (a5) {
    *a5 = v15;
  }

  return v13;
}

+ (id)rem_DA_fetchByObjectIDsBlock
{
  return &__block_literal_global_237;
}

id __83__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v11 = 0;
  v7 = [a3 fetchListsWithObjectIDs:v6 error:&v11];
  id v8 = v11;
  if (v8)
  {
    id v9 = +[REMLog changeTracking];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __83__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1();
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

+ (id)rem_DA_deletedKeyFromTombstoneBlock
{
  return &__block_literal_global_240;
}

id __90__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromTombstoneBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 daIsEventOnlyContainer];
  char v4 = [v3 BOOLValue];

  if (v4)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [v2 externalIdentifier];
    if (!v5)
    {
      id v6 = [v2 objectIdentifier];
      int v5 = [v6 UUIDString];
    }
  }

  return v5;
}

+ (id)rem_DA_deletedKeyFromConcealedModelObjectBlock
{
  return &__block_literal_global_243;
}

id __101__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  char v4 = REMCheckedDynamicCast(v3, (uint64_t)v2);

  if (v4 && ([v4 daIsEventOnlyContainer] & 1) != 0)
  {
    int v5 = 0;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v7 = +[REMLog changeTracking];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __101__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(v4);
      }
    }
    if ([v4 shouldUseExternalIdentifierAsDeletionKey]) {
      [v4 externalIdentifierForMarkedForDeletionObject];
    }
    else {
    int v5 = [v4 objectID];
    }
  }

  return v5;
}

+ (id)fetchRequestWithPredicateDescriptor:(id)a3 sortDescriptors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[REMListFetchExecutor alloc] initWithPredicateDescriptor:v6 sortDescriptors:v5 options:0];

  id v8 = [[REMFetchRequest alloc] initWithFetchExecutor:v7];

  return v8;
}

+ (REMObjectID)siriFoundInAppsListID
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"405e3bdb-9308-4ad5-85b5-d3c5943d17c5"];
  uint64_t v3 = +[REMList objectIDWithUUID:v2];

  return (REMObjectID *)v3;
}

+ (REMObjectID)localAccountDefaultListID
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3C8C2A71-84BF-4C87-8EFD-BB4827650D15"];
  uint64_t v3 = +[REMList objectIDWithUUID:v2];

  return (REMObjectID *)v3;
}

- (REMListSublistContext)sublistContext
{
  if ([(REMList *)self isGroup]) {
    uint64_t v3 = [[REMListSublistContext alloc] initWithList:self];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (REMListCalDAVNotificationContext)calDAVNotificationContext
{
  uint64_t v3 = [(REMList *)self account];
  char v4 = [v3 capabilities];
  int v5 = [v4 supportsCalDAVNotifications];

  if (v5) {
    id v6 = [[REMListCalDAVNotificationContext alloc] initWithList:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (REMListSectionContext)sectionContext
{
  uint64_t v3 = [(REMList *)self account];
  char v4 = [v3 capabilities];
  int v5 = [v4 supportsSections];

  if (v5) {
    id v6 = [[REMListSectionContext alloc] initWithList:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (REMList *)a3;
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
      id v6 = [(REMList *)v5 store];
      v7 = [(REMList *)self store];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        id v9 = [(REMList *)v5 account];
        uint64_t v10 = [(REMList *)self account];
        if (v9 == (void *)v10)
        {
        }
        else
        {
          id v11 = (void *)v10;
          uint64_t v12 = [(REMList *)v5 account];
          uint64_t v13 = [(REMList *)self account];
          int v14 = [v12 isEqual:v13];

          if (!v14) {
            goto LABEL_12;
          }
        }
        v16 = [(REMList *)v5 parentList];
        uint64_t v17 = [(REMList *)self parentList];
        if (v16 == (void *)v17)
        {
        }
        else
        {
          id v18 = (void *)v17;
          v19 = [(REMList *)v5 parentList];
          uint64_t v20 = [(REMList *)self parentList];
          int v21 = [v19 isEqual:v20];

          if (!v21) {
            goto LABEL_12;
          }
        }
        v22 = [(REMList *)v5 storage];
        id v23 = [(REMList *)self storage];
        char v15 = [v22 isEqual:v23];

        goto LABEL_15;
      }
LABEL_12:
      char v15 = 0;
LABEL_15:

      goto LABEL_16;
    }
    char v15 = 0;
  }
LABEL_16:

  return v15;
}

- (unint64_t)hash
{
  id v2 = [(REMList *)self storage];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(REMList *)self storage];
  id v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(REMList *)self storage];
  id v6 = [v5 debugDescription];
  v7 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v6];

  return (NSString *)v7;
}

- (NSOrderedSet)reminderIDsOrdering
{
  unint64_t v3 = [(REMList *)self storage];
  uint64_t v4 = [v3 reminderIDsMergeableOrdering];

  if (!v4)
  {
    int v8 = +[REMLogStore read];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMList reminderIDsOrdering](self);
    }
  }
  int v5 = [(REMList *)self storage];
  id v6 = [v5 reminderIDsMergeableOrdering];

  return (NSOrderedSet *)v6;
}

- (id)ekColor
{
  id v2 = [(REMList *)self storage];
  unint64_t v3 = [v2 ekColor];

  return v3;
}

- (BOOL)canBeIncludedInGroup
{
  return ![(REMList *)self isSharedToMe];
}

- (BOOL)isOwnedByMe
{
  uint64_t v2 = [(REMList *)self sharingStatus];

  return +[REMList isOwnedByMeWithSharingStatus:v2];
}

+ (BOOL)isOwnedByMeWithSharingStatus:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (BOOL)isSharedToMe
{
  return [(REMList *)self sharingStatus] == 2;
}

- (BOOL)isOriginOfExistingTemplate
{
  uint64_t v2 = [(REMList *)self mostRecentTargetTemplateIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  int v5 = [(REMList *)self storage];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMList;
  if (-[REMList respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(REMList *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMList *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (id)fetchRemindersWithError:(id *)a3
{
  int v5 = [REMRemindersDataView alloc];
  id v6 = [(REMList *)self store];
  id v7 = [(REMRemindersDataView *)v5 initWithStore:v6];

  id v8 = [(REMList *)self objectID];
  id v9 = [(REMRemindersDataView *)v7 fetchRemindersWithListID:v8 includingSubtasks:0 error:a3];

  return v9;
}

- (id)fetchRemindersAndSubtasksWithError:(id *)a3
{
  int v5 = [REMRemindersDataView alloc];
  id v6 = [(REMList *)self store];
  id v7 = [(REMRemindersDataView *)v5 initWithStore:v6];

  id v8 = [(REMList *)self objectID];
  id v9 = [(REMRemindersDataView *)v7 fetchRemindersWithListID:v8 includingSubtasks:1 error:a3];

  return v9;
}

- (id)fetchRemindersCountWithError:(id *)a3
{
  int v5 = [REMRemindersDataView alloc];
  id v6 = [(REMList *)self store];
  id v7 = [(REMRemindersDataView *)v5 initWithStore:v6];

  id v8 = [(REMList *)self objectID];
  id v9 = [(REMRemindersDataView *)v7 fetchRemindersCountWithListID:v8 error:a3];

  return v9;
}

- (id)formattedSharedOwnerName
{
  BOOL v3 = [(REMList *)self sharedOwnerName];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(REMList *)self shareeContext];
    id v7 = [v6 sharedOwner];

    id v8 = [v7 formattedName];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      _REMGetLocalizedString(50);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v5 = v10;
  }

  return v5;
}

- (id)fetchReminderWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [REMRemindersDataView alloc];
  id v8 = [(REMList *)self store];
  id v9 = [(REMRemindersDataView *)v7 initWithStore:v8];

  id v10 = [(REMRemindersDataView *)v9 fetchReminderWithExternalIdentifier:v6 inList:self error:a4];

  return v10;
}

- (id)fetchRemindersWithExternalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [REMRemindersDataView alloc];
  id v8 = [(REMList *)self store];
  id v9 = [(REMRemindersDataView *)v7 initWithStore:v8];

  id v10 = [(REMRemindersDataView *)v9 fetchRemindersWithExternalIdentifiers:v6 inList:self error:a4];

  return v10;
}

+ (id)newObjectID
{
  return +[REMListStorage newObjectID];
}

+ (NSString)cdEntityName
{
  return +[REMListStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMList *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (NSString)externalIdentifierForMarkedForDeletionObject
{
  uint64_t v2 = [(REMList *)self externalIdentifier];
  char v3 = +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:v2];

  return (NSString *)v3;
}

- (BOOL)shouldUseExternalIdentifierAsDeletionKey
{
  char v3 = [(REMList *)self account];

  if (!v3)
  {
    id v7 = +[REMLogStore read];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMList shouldUseExternalIdentifierAsDeletionKey](self);
    }
  }
  char v4 = [(REMList *)self account];
  BOOL v5 = +[REMExternalSyncMetadataUtils shouldUseExternalIdentifierAsDeletionKeyWithAccountType:](REMExternalSyncMetadataUtils, "shouldUseExternalIdentifierAsDeletionKeyWithAccountType:", [v4 type]);

  return v5;
}

- (void)hack_overrideReminderIDsOrderingWithOrderedObjectIDs:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[REMLogStore read];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "hack_overrideReminderIDsOrderingWithOrderedObjectIDs: reminderIDsMergeableOrdering set {ids.count: %@}", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(REMList *)self storage];
  [v7 setReminderIDsMergeableOrdering:v4];
}

- (void)setStorage:(id)a3
{
}

void __83__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_fetchByObjectIDsBlock__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_5_1(v0, v1), "localizedDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1B9AA2000, v3, v4, "REMDAChangeTrackingHelper:_REMDAChangeTrackableModel: ERROR: Failed to fetch REMList {objectIDs: %{public}@, error: %@}.", v5, v6, v7, v8, v9);
}

void __101__REMList_REMDAChangeTrackingHelper_PrivateAdditions__rem_DA_deletedKeyFromConcealedModelObjectBlock__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "rem_log_fault_if (![list respondsToSelector:@selector(shouldUseExternalIdentifierAsDeletionKey)]) -- REMList should conform to REMExternalSyncMetadataProviding {list: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)reminderIDsOrdering
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "rem_log_fault_if (self.storage.reminderIDsMergeableOrdering == nil) -- list.store.reminderIDsMergeableOrdering should not be nil {objectID: %{public}@}", v4, v5, v6, v7, 2u);
}

- (void)shouldUseExternalIdentifierAsDeletionKey
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "rem_log_fault_if (self.account == nil) -- REMList.account is nil for -shouldUseExternalIdentifierAsDeletionKey {listID: %{public}@}", v4, v5, v6, v7, 2u);
}

@end