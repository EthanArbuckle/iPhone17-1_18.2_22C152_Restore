@interface REMSmartListChangeItem
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (void)initialize;
- (BOOL)isPinned;
- (BOOL)isSubContainer;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (REMAccount)parentAccount;
- (REMAccountCapabilities)accountCapabilities;
- (REMChangedKeysObserver)changedKeysObserver;
- (REMSaveRequest)saveRequest;
- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoAccountChangeItem:(id)a4;
- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoAccountChangeItem:(id)a4 withParentListChangeItem:(id)a5;
- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoListSublistContextChangeItem:(id)a4;
- (REMSmartListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 changedKeysObserver:(id)a5;
- (REMSmartListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 observeInitialValues:(BOOL)a5;
- (REMSmartListCustomContextChangeItem)customContext;
- (REMSmartListSectionContextChangeItem)sectionsContextChangeItem;
- (REMSmartListStorage)storage;
- (id)changedKeys;
- (id)removeFromParentAllowingUndoWithAccountChangeItem:(id)a3;
- (id)resolutionTokenKeyForChangedKey:(id)a3;
- (id)shallowCopyWithSaveRequest:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)assertIsCustomSmartListWithAction:(id)a3;
- (void)removeFromParentWithAccountChangeItem:(id)a3;
- (void)setChangedKeysObserver:(id)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation REMSmartListChangeItem

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_2;
    __sKeysToObserve_2 = (uint64_t)&unk_1F136C1E8;

    __resolutionTokenKeyDenylist_2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C200];
    MEMORY[0x1F41817F8]();
  }
}

- (REMSmartListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 changedKeysObserver:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)REMSmartListChangeItem;
    v13 = [(REMSmartListChangeItem *)&v18 init];
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_saveRequest, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v16 = +[REMLogStore write];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListChangeItem initWithSaveRequest:storage:changedKeysObserver:]((uint64_t)self, a2);
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
    v15 = 0;
  }

  return v15;
}

- (REMSmartListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 observeInitialValues:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void *)[a4 copy];
  id v10 = [REMChangedKeysObserver alloc];
  id v11 = [(REMChangedKeysObserver *)v10 initWithTarget:v9 keysToObserve:__sKeysToObserve_2 includeInitial:v5];
  id v12 = [(REMSmartListChangeItem *)self initWithSaveRequest:v8 storage:v9 changedKeysObserver:v11];

  return v12;
}

- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoAccountChangeItem:(id)a4
{
  return [(REMSmartListChangeItem *)self initWithCustomSmartListObjectID:a3 insertIntoAccountChangeItem:a4 withParentListChangeItem:0];
}

- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoAccountChangeItem:(id)a4 withParentListChangeItem:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 capabilities];
  char v12 = [v11 supportsCustomSmartLists];

  if ((v12 & 1) == 0)
  {
    v27 = +[REMLogStore write];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListChangeItem initWithCustomSmartListObjectID:insertIntoAccountChangeItem:withParentListChangeItem:](v8);
    }
  }
  v13 = [REMSmartListStorage alloc];
  v14 = [v8 objectID];
  v15 = [(REMSmartListStorage *)v13 initWithObjectID:v10 accountID:v14 smartListType:@"com.apple.reminders.smartlist.custom"];

  v16 = [v8 objectID];
  [(REMSmartListStorage *)v15 setParentAccountID:v16];

  id v17 = +[REMManualOrdering newObjectID];
  objc_super v18 = [REMManualOrdering alloc];
  v19 = [v10 uuid];
  v20 = [v19 UUIDString];
  v21 = objc_opt_new();
  v22 = [(REMManualOrdering *)v18 initWithObjectID:v17 listType:2 listID:v20 modifiedDate:v21];

  [(REMSmartListStorage *)v15 setManualOrdering:v22];
  v23 = [v9 objectID];
  [(REMSmartListStorage *)v15 setParentListID:v23];

  [v8 lowLevelAddMergeableOrderingNodeIDToOrdering:v10 withParentMergeableOrderingNode:v9];
  v24 = [v8 saveRequest];
  v25 = [(REMSmartListChangeItem *)self initWithSaveRequest:v24 storage:v15 observeInitialValues:1];

  return v25;
}

- (REMSmartListChangeItem)initWithCustomSmartListObjectID:(id)a3 insertIntoListSublistContextChangeItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 listChangeItem];
  id v9 = [v8 saveRequest];
  id v10 = [v9 _updateAccountWithListChangeItem:v8];

  id v11 = [v6 listChangeItem];

  char v12 = [(REMSmartListChangeItem *)self initWithCustomSmartListObjectID:v7 insertIntoAccountChangeItem:v10 withParentListChangeItem:v11];
  return v12;
}

- (id)changedKeys
{
  v2 = [(REMSmartListChangeItem *)self changedKeysObserver];
  v3 = [v2 changedKeys];

  return v3;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  v3 = (void *)__resolutionTokenKeyDenylist_2;
  id v4 = a3;
  if ([v3 containsObject:v4]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5 = a3;
  id v6 = [(REMSmartListChangeItem *)self storage];

  if (v6)
  {
    id v7 = [REMSmartListChangeItem alloc];
    id v8 = [(REMSmartListChangeItem *)self storage];
    id v9 = [(REMSmartListChangeItem *)self changedKeysObserver];
    id v10 = [(REMSmartListChangeItem *)v7 initWithSaveRequest:v5 storage:v8 changedKeysObserver:v9];
  }
  else
  {
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListChangeItem shallowCopyWithSaveRequest:]((uint64_t)self, a2);
    }

    id v10 = [(REMSmartListChangeItem *)self storage];

    if (v10) {
      id v10 = 0;
    }
    else {
      NSLog(&cfstr_SIsUnexpectedl.isa, "self.storage");
    }
  }

  return v10;
}

- (void)assertIsCustomSmartListWithAction:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListChangeItem *)self smartListType];
  char v6 = [@"com.apple.reminders.smartlist.custom" isEqual:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListChangeItem assertIsCustomSmartListWithAction:]((uint64_t)v4, self);
    }

    id v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3B8];
    id v10 = [(REMSmartListChangeItem *)self remObjectID];
    [v8 raise:v9, @"Action is only applicable to CSL {action: %@, smartList: %@}", v4, v10 format];
  }
}

- (REMAccountCapabilities)accountCapabilities
{
  v2 = [(REMSmartListChangeItem *)self storage];
  v3 = [v2 accountCapabilities];

  return (REMAccountCapabilities *)v3;
}

- (BOOL)isPinned
{
  v2 = [(REMSmartListChangeItem *)self pinnedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setIsPinned:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(REMSmartListChangeItem *)self accountCapabilities];
  char v6 = [v5 supportsPinnedLists];

  if (v6)
  {
    if ([(REMSmartListChangeItem *)self isPinned] != v3)
    {
      if (v3)
      {
        id v8 = [MEMORY[0x1E4F1C9C8] now];
        [(REMSmartListChangeItem *)self setPinnedDate:v8];
      }
      else
      {
        [(REMSmartListChangeItem *)self setPinnedDate:0];
      }
    }
  }
  else
  {
    id v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListChangeItem setIsPinned:](self);
    }
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListChangeItem *)self storage];
  char v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMSmartListChangeItem;
  if (-[REMSmartListChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(REMSmartListChangeItem *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMSmartListChangeItem *)self saveRequest];
  int v9 = [v8 isSaved];

  if (v9)
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v12 = 0;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v12, 2u);
    }
  }
  id v11 = [(REMSmartListChangeItem *)self storage];
  [v11 setValue:v7 forKey:v6];
}

- (BOOL)isSubContainer
{
  return 0;
}

- (void)removeFromParentWithAccountChangeItem:(id)a3
{
  id v3 = [(REMSmartListChangeItem *)self removeFromParentAllowingUndoWithAccountChangeItem:a3];
}

+ (id)newObjectID
{
  return +[REMSmartListStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMSmartListStorage objectIDWithUUID:a3];
}

+ (NSString)cdEntityName
{
  return +[REMSmartListStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  v2 = [(REMSmartListChangeItem *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (id)removeFromParentAllowingUndoWithAccountChangeItem:(id)a3
{
  id v4 = a3;
  id v5 = [(REMSmartListChangeItem *)self parentAccountID];

  if (v5)
  {
    id v6 = [(REMSmartListChangeItem *)self saveRequest];
    id v7 = [(REMSmartListChangeItem *)self parentAccountID];
    id v8 = [v6 _trackedAccountChangeItemForObjectID:v7];

    if (!v8 || v8 != v4)
    {
      int v9 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v10 = *MEMORY[0x1E4F1C3B8];
      id v11 = [(REMSmartListChangeItem *)self parentAccountID];
      char v12 = [v4 objectID];
      [v9 raise:v10, @"REMSmartListChangeItem tries to remove itself from an untracked or unknown account change item {parentAccountID: %@, accountChangeItem.objectID: %@}", v11, v12 format];
    }
    v13 = [(REMSmartListChangeItem *)self objectID];
    v14 = [v8 lowLevelRemoveMergeableOrderingNodeIDFromOrdering:v13];
  }
  else
  {
    v14 = 0;
  }
  [(REMSmartListChangeItem *)self setParentAccountID:0];
  [(REMSmartListChangeItem *)self setParentListID:0];

  return v14;
}

- (REMSmartListCustomContextChangeItem)customContext
{
  char v3 = [(REMSmartListChangeItem *)self smartListType];
  int v4 = [v3 isEqualToString:@"com.apple.reminders.smartlist.custom"];

  if (v4) {
    id v5 = [[REMSmartListCustomContextChangeItem alloc] initWithSmartListChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (REMSmartListSectionContextChangeItem)sectionsContextChangeItem
{
  char v3 = [(REMSmartListChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsSections];

  if (v4) {
    id v5 = [[REMSmartListSectionContextChangeItem alloc] initWithSmartListChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMSmartListStorage)storage
{
  return self->_storage;
}

- (REMChangedKeysObserver)changedKeysObserver
{
  return self->_changedKeysObserver;
}

- (void)setChangedKeysObserver:(id)a3
{
}

- (REMAccount)parentAccount
{
  return self->_parentAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAccount, 0);
  objc_storeStrong((id *)&self->_changedKeysObserver, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_saveRequest, 0);
}

- (void)initWithSaveRequest:(uint64_t)a1 storage:(const char *)a2 changedKeysObserver:.cold.1(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];
  OUTLINED_FUNCTION_1();
  id v11 = "storage";
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10);
}

- (void)initWithCustomSmartListObjectID:(void *)a1 insertIntoAccountChangeItem:withParentListChangeItem:.cold.1(void *a1)
{
  v1 = [a1 remObjectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "rem_log_fault_if (!accountChangeItem.capabilities.supportsCustomSmartLists) -- Attempt to create REMSmartListChangeItem into account not supporting CSL {account: %{public}@}", v4, v5, v6, v7, 2u);
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];
  OUTLINED_FUNCTION_1();
  id v11 = "self.storage";
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10);
}

- (void)assertIsCustomSmartListWithAction:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 remObjectID];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v4, v5, "Action is only applicable to CSL {action: %{public}@, smartList: %{public}@}", (uint8_t *)&v6);
}

- (void)setIsPinned:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "'- [REMSmartListChangeItem setIsPinned:]' should not be called because account does not support pinned lists {objectID: %@}", v4, v5, v6, v7, 2u);
}

@end