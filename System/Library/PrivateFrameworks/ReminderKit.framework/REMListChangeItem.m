@interface REMListChangeItem
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (void)initialize;
- (BOOL)_lowLevelAddReminderIDToOrdering:(id)a3 relativeToSiblingID:(id)a4 isAfter:(BOOL)a5;
- (BOOL)canBeIncludedInGroup;
- (BOOL)isOwnedByMe;
- (BOOL)isPinned;
- (BOOL)isShared;
- (BOOL)isSharedToMe;
- (BOOL)isUnsupported;
- (BOOL)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSString)description;
- (REMAccount)parentAccount;
- (REMAccountCapabilities)accountCapabilities;
- (REMChangedKeysObserver)changedKeysObserver;
- (REMListAppearanceContextChangeItem)appearanceContext;
- (REMListCalDAVNotificationContextChangeItem)calDAVNotificationContext;
- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5;
- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5 isGroup:(BOOL)a6;
- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5 isGroup:(BOOL)a6 withParentList:(id)a7;
- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoListSublistContextChangeItem:(id)a5;
- (REMListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6;
- (REMListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6;
- (REMListGroceryContextChangeItem)groceryContextChangeItem;
- (REMListSectionContextChangeItem)sectionsContextChangeItem;
- (REMListShareeContextChangeItem)shareeContext;
- (REMListStorage)storage;
- (REMListSublistContextChangeItem)sublistContext;
- (REMSaveRequest)saveRequest;
- (id)_testingOnly_listShareeContextChangeItem;
- (id)changedKeys;
- (id)ekColor;
- (id)lowLevelRemoveReminderIDFromOrdering:(id)a3;
- (id)removeFromAccountAllowingUndo;
- (id)resolutionTokenKeyForChangedKey:(id)a3;
- (id)shallowCopyWithSaveRequest:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)_editReminderIDsOrderingUsingBlock:(id)a3;
- (void)_lowLevelAddReminderChangeItemToOrdering:(id)a3 atIndexOfSibling:(id)a4 isAfter:(BOOL)a5 withParent:(id)a6;
- (void)_lowLevelApplyUndoToOrdering:(id)a3;
- (void)_reassignReminderChangeItem:(id)a3 withParentReminderChangeItem:(id)a4;
- (void)_testingOnly_setReminderIDsMergeableOrder:(id)a3;
- (void)accountCapabilities;
- (void)addReminderChangeItem:(id)a3;
- (void)copyListDataFrom:(id)a3;
- (void)insertReminderChangeItem:(id)a3 adjacentToReminderChangeItem:(id)a4 isAfter:(BOOL)a5 withParentReminderChangeItem:(id)a6;
- (void)insertReminderChangeItem:(id)a3 afterReminderChangeItem:(id)a4;
- (void)insertReminderChangeItem:(id)a3 beforeReminderChangeItem:(id)a4;
- (void)lowLevelAddReminderIDToOrdering:(id)a3 withParentReminderChangeItem:(id)a4;
- (void)removeFromParent;
- (void)setChangedKeysObserver:(id)a3;
- (void)setDaDisplayOrder:(int64_t)a3;
- (void)setDaIsNotificationsCollection:(BOOL)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)undeleteReminderWithID:(id)a3 usingUndo:(id)a4;
- (void)undeleteRemindersWithoutUndoWithIDs:(id)a3;
- (void)undeleteRemindersWithoutUndoWithIDs:(id)a3 isCalDAV:(BOOL)a4;
@end

@implementation REMListChangeItem

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_3;
    __sKeysToObserve_3 = (uint64_t)&unk_1F136C218;

    __resolutionTokenKeyDenylist_3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C230];
    MEMORY[0x1F41817F8]();
  }
}

- (REMListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    v22.receiver = self;
    v22.super_class = (Class)REMListChangeItem;
    v15 = [(REMListChangeItem *)&v22 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_saveRequest, a3);
      objc_storeStrong((id *)&v16->_storage, a4);
      objc_storeStrong((id *)&v16->_changedKeysObserver, a6);
      saveRequest = v16->_saveRequest;
      v18 = [(REMListStorage *)v16->_storage objectID];
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

- (REMListChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)[a4 copy];
  id v13 = [REMChangedKeysObserver alloc];
  id v14 = [(REMChangedKeysObserver *)v13 initWithTarget:v12 keysToObserve:__sKeysToObserve_3 includeInitial:v6];
  v15 = [(REMListChangeItem *)self initWithSaveRequest:v11 storage:v12 accountCapabilities:v10 changedKeysObserver:v14];

  return v15;
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5
{
  return [(REMListChangeItem *)self initWithObjectID:a3 name:a4 insertIntoAccountChangeItem:a5 isGroup:0];
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5 isGroup:(BOOL)a6 withParentList:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v15 && v8)
  {
    v16 = +[REMLogStore write];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[REMListChangeItem initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:]();
    }
  }
  v17 = [REMListStorage alloc];
  v18 = [v14 objectID];
  v19 = [MEMORY[0x1E4F1CAA0] orderedSet];
  v20 = [(REMListStorage *)v17 initWithObjectID:v12 accountID:v18 name:v13 isGroup:v8 reminderIDsMergeableOrdering:v19];

  v21 = [v14 objectID];
  [(REMListStorage *)v20 setParentAccountID:v21];

  objc_super v22 = [v15 objectID];
  [(REMListStorage *)v20 setParentListID:v22];

  [(REMListStorage *)v20 setDaDisplayOrder:0];
  [v14 lowLevelAddMergeableOrderingNodeIDToOrdering:v12 withParentMergeableOrderingNode:v15];
  v23 = [v14 saveRequest];
  v24 = [v14 capabilities];
  v25 = [(REMListChangeItem *)self initWithSaveRequest:v23 storage:v20 accountCapabilities:v24 observeInitialValues:1];

  return v25;
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoAccountChangeItem:(id)a5 isGroup:(BOOL)a6
{
  return [(REMListChangeItem *)self initWithObjectID:a3 name:a4 insertIntoAccountChangeItem:a5 isGroup:a6 withParentList:0];
}

- (REMListChangeItem)initWithObjectID:(id)a3 name:(id)a4 insertIntoListSublistContextChangeItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 listChangeItem];
  id v12 = [v11 saveRequest];
  id v13 = [v12 _updateAccountWithListChangeItem:v11];

  id v14 = [v8 listChangeItem];

  id v15 = [(REMListChangeItem *)self initWithObjectID:v10 name:v9 insertIntoAccountChangeItem:v13 isGroup:0 withParentList:v14];
  return v15;
}

- (REMAccountCapabilities)accountCapabilities
{
  uint64_t v3 = [(REMListChangeItem *)self storage];
  if (!v3) {
    goto LABEL_3;
  }
  v4 = (void *)v3;
  v5 = [(REMListChangeItem *)self saveRequest];
  BOOL v6 = [(REMListChangeItem *)self objectID];
  v7 = [v5 _trackedAccountCapabilitiesForObjectID:v6];

  if (!v7)
  {
LABEL_3:
    id v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMListChangeItem accountCapabilities](self);
    }

    v7 = [[REMAccountCapabilities alloc] initWithAccountType:0];
  }

  return v7;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(REMListChangeItem *)self storage];

  if (v6)
  {
    v7 = [(REMListChangeItem *)self objectID];
    id v8 = [v5 _trackedAccountCapabilitiesForObjectID:v7];

    if (v8)
    {
LABEL_16:
      id v13 = [REMListChangeItem alloc];
      id v14 = [(REMListChangeItem *)self storage];
      id v15 = [(REMListChangeItem *)self changedKeysObserver];
      id v12 = [(REMListChangeItem *)v13 initWithSaveRequest:v5 storage:v14 accountCapabilities:v8 changedKeysObserver:v15];

      goto LABEL_17;
    }
    id v9 = [(REMListChangeItem *)self objectID];

    if (v9)
    {
      if (!v5)
      {
LABEL_15:
        id v8 = [[REMAccountCapabilities alloc] initWithAccountType:0];
        goto LABEL_16;
      }
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        [(REMReminderChangeItem *)self shallowCopyWithSaveRequest:v10];
      }
    }
    else
    {
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[REMListChangeItem shallowCopyWithSaveRequest:]((uint64_t)self, a2);
      }
    }

    goto LABEL_15;
  }
  id v11 = +[REMLogStore write];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[REMReminderChangeItem shallowCopyWithSaveRequest:]();
  }

  id v12 = [(REMListChangeItem *)self storage];

  if (v12) {
    id v12 = 0;
  }
  else {
    NSLog(&cfstr_SIsUnexpectedl.isa, "self.storage");
  }
LABEL_17:

  return v12;
}

- (REMListAppearanceContextChangeItem)appearanceContext
{
  uint64_t v3 = [(REMListChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsListAppearance];

  if (v4) {
    id v5 = [[REMListAppearanceContextChangeItem alloc] initWithListChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (REMListSublistContextChangeItem)sublistContext
{
  if ([(REMListChangeItem *)self isGroup]) {
    uint64_t v3 = [[REMListSublistContextChangeItem alloc] initWithListChangeItem:self];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (REMListCalDAVNotificationContextChangeItem)calDAVNotificationContext
{
  uint64_t v3 = [(REMListChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsCalDAVNotifications];

  if (v4) {
    id v5 = [[REMListCalDAVNotificationContextChangeItem alloc] initWithListChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (REMListShareeContextChangeItem)shareeContext
{
  uint64_t v3 = [(REMListChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsListShareesMutation];

  if (v4) {
    id v5 = [[REMListShareeContextChangeItem alloc] initWithListChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(REMListChangeItem *)self storage];
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)removeFromParent
{
  id v2 = [(REMListChangeItem *)self removeFromAccountAllowingUndo];
}

- (id)removeFromAccountAllowingUndo
{
  uint64_t v3 = [(REMListChangeItem *)self parentAccountID];

  if (v3)
  {
    uint64_t v4 = [(REMListChangeItem *)self saveRequest];
    id v5 = [v4 _updateAccountWithListChangeItem:self];

    BOOL v6 = [(REMListChangeItem *)self objectID];
    uint64_t v3 = [v5 lowLevelRemoveMergeableOrderingNodeIDFromOrdering:v6];
  }
  [(REMListChangeItem *)self setParentAccountID:0];
  [(REMListChangeItem *)self setParentListID:0];

  return v3;
}

- (void)undeleteReminderWithID:(id)a3 usingUndo:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = [(REMListChangeItem *)self reminderIDsToUndelete];
  id v8 = [v7 setByAddingObject:v6];

  [(REMListChangeItem *)self setReminderIDsToUndelete:v8];
  [(REMListChangeItem *)self _lowLevelApplyUndoToOrdering:v9];
}

- (void)addReminderChangeItem:(id)a3
{
}

- (void)insertReminderChangeItem:(id)a3 afterReminderChangeItem:(id)a4
{
}

- (void)insertReminderChangeItem:(id)a3 beforeReminderChangeItem:(id)a4
{
}

- (BOOL)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:(id)a3
{
  id v4 = a3;
  id v5 = [v4 saveRequest];
  id v6 = [(REMListChangeItem *)self saveRequest];

  if (v5 == v6)
  {
    v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMListChangeItem optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:](self);
    }
    char v14 = 0;
  }
  else
  {
    v7 = [v4 objectID];
    id v8 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
    uint64_t v9 = [v8 indexOfObject:v7];

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = [v4 listChangeItem];
      id v11 = [v10 reminderIDsMergeableOrdering];

      uint64_t v12 = [v11 indexOfObject:v7];
      if (v12)
      {
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v13 = +[REMLogStore write];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            -[REMListChangeItem optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:]();
          }
LABEL_20:

          char v14 = 0;
          goto LABEL_21;
        }
        uint64_t v16 = v12 - 1;
        if (v12 < 1)
        {
          id v13 = +[REMLogStore write];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            -[REMListChangeItem optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:]();
          }
          goto LABEL_20;
        }
        id v15 = [v11 objectAtIndexedSubscript:v16];
        v17 = self;
        v18 = v7;
        v19 = v15;
        uint64_t v20 = 1;
      }
      else
      {
        if ((unint64_t)[v11 count] < 2)
        {
          id v15 = 0;
        }
        else
        {
          id v15 = [v11 objectAtIndexedSubscript:1];
        }
        v17 = self;
        v18 = v7;
        v19 = v15;
        uint64_t v20 = 0;
      }
      char v14 = [(REMListChangeItem *)v17 _lowLevelAddReminderIDToOrdering:v18 relativeToSiblingID:v19 isAfter:v20];

LABEL_21:
      goto LABEL_22;
    }
    char v14 = 1;
  }
LABEL_22:

  return v14;
}

- (REMListSectionContextChangeItem)sectionsContextChangeItem
{
  uint64_t v3 = [(REMListChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsSections];

  if (v4) {
    id v5 = [[REMListSectionContextChangeItem alloc] initWithListChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (REMListGroceryContextChangeItem)groceryContextChangeItem
{
  uint64_t v3 = [(REMListChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsSections];

  if (v4) {
    id v5 = [[REMListGroceryContextChangeItem alloc] initWithListChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)undeleteRemindersWithoutUndoWithIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(REMListChangeItem *)self reminderIDsToUndelete];
    id v6 = [v5 setByAddingObjectsFromArray:v4];
    [(REMListChangeItem *)self setReminderIDsToUndelete:v6];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__REMListChangeItem_undeleteRemindersWithoutUndoWithIDs___block_invoke;
    v7[3] = &unk_1E61DDDC8;
    id v8 = v4;
    [(REMListChangeItem *)self _editReminderIDsOrderingUsingBlock:v7];
  }
}

void __57__REMListChangeItem_undeleteRemindersWithoutUndoWithIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)undeleteRemindersWithoutUndoWithIDs:(id)a3 isCalDAV:(BOOL)a4
{
  BOOL v4 = a4;
  [(REMListChangeItem *)self undeleteRemindersWithoutUndoWithIDs:a3];
  if (v4)
  {
    [(REMListChangeItem *)self setRemindersICSDisplayOrderChanged:1];
  }
}

- (void)insertReminderChangeItem:(id)a3 adjacentToReminderChangeItem:(id)a4 isAfter:(BOOL)a5 withParentReminderChangeItem:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = (unint64_t)a6;
  id v13 = [v10 saveRequest];
  uint64_t v14 = [(REMListChangeItem *)self saveRequest];

  if (v13 != v14)
  {
    id v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    v17 = [v10 saveRequest];
    v18 = [(REMListChangeItem *)self saveRequest];
    [v15 raise:v16, @"Original reminder has incorrect save request {original: %@, saveRequest: %@, expectedSaveRequest: %@}", v10, v17, v18 format];
  }
  v19 = [v10 accountID];
  uint64_t v20 = [(REMListChangeItem *)self accountID];
  char v21 = [v19 isEqual:v20];

  if ((v21 & 1) == 0)
  {
    objc_super v22 = +[REMLogStore write];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:](v10, self, v22);
    }
  }
  v23 = [(REMListChangeItem *)self accountCapabilities];
  if ([v23 supportsMoveAcrossLists]) {
    goto LABEL_12;
  }
  uint64_t v24 = [v10 listID];
  if (!v24) {
    goto LABEL_12;
  }
  v25 = (void *)v24;
  v26 = [v10 listID];
  v27 = [(REMListChangeItem *)self objectID];
  char v28 = [v26 isEqual:v27];

  if ((v28 & 1) == 0)
  {
    v23 = +[REMLogStore write];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:]((uint64_t)v10, self);
    }
LABEL_12:
  }
  v29 = [(REMListChangeItem *)self accountCapabilities];
  if (([v29 supportsMoveAcrossSharedLists] & 1) == 0)
  {
    uint64_t v30 = [v10 listID];
    if (v30)
    {
      v31 = (void *)v30;
      v32 = [v10 listID];
      v33 = [(REMListChangeItem *)self objectID];
      if ([v32 isEqual:v33])
      {
      }
      else
      {
        v34 = [v10 listChangeItem];
        if ([v34 isShared])
        {
        }
        else
        {
          BOOL v40 = [(REMListChangeItem *)self isShared];

          if (!v40) {
            goto LABEL_23;
          }
        }
        v29 = +[REMLogStore write];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          -[REMListChangeItem insertReminderChangeItem:adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:]((uint64_t)v10, self);
        }
      }
    }
  }

LABEL_23:
  if (v10 != v11)
  {
LABEL_24:
    [(REMListChangeItem *)self _reassignReminderChangeItem:v10 withParentReminderChangeItem:v12];
    [(REMListChangeItem *)self _lowLevelAddReminderChangeItemToOrdering:v10 atIndexOfSibling:v11 isAfter:v7 withParent:v12];
    goto LABEL_27;
  }
  uint64_t v35 = [v10 parentReminderID];
  id v11 = v10;
  if (v12 | v35)
  {
    v36 = (void *)v35;
    v37 = [v10 parentReminderID];
    v38 = [(id)v12 objectID];
    char v39 = [v37 isEqual:v38];

    id v11 = v10;
    if ((v39 & 1) == 0)
    {

      id v11 = 0;
      goto LABEL_24;
    }
  }
LABEL_27:
}

- (void)lowLevelAddReminderIDToOrdering:(id)a3 withParentReminderChangeItem:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7)
  {
    id v10 = v7;
    id v11 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
    unint64_t v12 = [v10 objectID];
    uint64_t v13 = [v11 indexOfObject:v12];

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = +[REMLogStore write];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        uint64_t v16 = [(REMListChangeItem *)self objectID];
        v17 = [v10 objectID];
        *(_DWORD *)buf = 138412802;
        objc_super v22 = v16;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_fault_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_FAULT, "Tried to add a new subtask with a parent reminder but could not find the parent reminder in the list's reminder IDs ordering {listID: %@, reminderID: %@, parentReminderID: %@}.", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v9 = v13 + 1;
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__REMListChangeItem_lowLevelAddReminderIDToOrdering_withParentReminderChangeItem___block_invoke;
  v18[3] = &unk_1E61DDDF0;
  id v19 = v6;
  uint64_t v20 = v9;
  id v15 = v6;
  [(REMListChangeItem *)self _editReminderIDsOrderingUsingBlock:v18];
}

void __82__REMListChangeItem_lowLevelAddReminderIDToOrdering_withParentReminderChangeItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = a3;
    id v8 = a2;
    uint64_t v6 = [v8 count];
    [v8 addObject:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = a3;
    [a2 insertObject:v9 atIndex:v6];
  }

  id v11 = [NSNumber numberWithUnsignedLong:v6];
  [a3 setObject:v11 forKey:*(void *)(a1 + 32)];
}

- (id)lowLevelRemoveReminderIDFromOrdering:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
  uint64_t v6 = [v5 indexOfObject:v4];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  id v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      id v8 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
      -[REMListChangeItem lowLevelRemoveReminderIDFromOrdering:]((uint64_t)v4, v8, buf, v7);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke;
    v11[3] = &unk_1E61DDE40;
    uint64_t v14 = v6;
    unint64_t v12 = v4;
    uint64_t v13 = &v15;
    [(REMListChangeItem *)self _editReminderIDsOrderingUsingBlock:v11];
    id v7 = v12;
  }

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(REMMutableCRUndo);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke_2;
  id v11 = &unk_1E61DDE18;
  uint64_t v13 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 32);
  [(REMMutableCRUndo *)v4 addUndoBlock:&v8];
  objc_msgSend(v3, "removeObjectAtIndex:", *(void *)(a1 + 48), v8, v9, v10, v11);

  uint64_t v5 = [(REMMutableCRUndo *)v4 immutableCopy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __58__REMListChangeItem_lowLevelRemoveReminderIDFromOrdering___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 count];
  if (v3 >= *(void *)(a1 + 40)) {
    unint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    unint64_t v4 = v3;
  }
  [v5 insertObject:*(void *)(a1 + 32) atIndex:v4];
}

- (void)_lowLevelApplyUndoToOrdering:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__REMListChangeItem__lowLevelApplyUndoToOrdering___block_invoke;
  v6[3] = &unk_1E61DDDC8;
  id v7 = v4;
  id v5 = v4;
  [(REMListChangeItem *)self _editReminderIDsOrderingUsingBlock:v6];
}

void __50__REMListChangeItem__lowLevelApplyUndoToOrdering___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "undoBlocks", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_lowLevelAddReminderIDToOrdering:(id)a3 relativeToSiblingID:(id)a4 isAfter:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    if (v5)
    {
      uint64_t v13 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
      uint64_t v14 = [v13 count];
    }
    else
    {
      uint64_t v14 = 0;
    }
    goto LABEL_8;
  }
  long long v10 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
  uint64_t v11 = [v10 indexOfObject:v9];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = v11 + v5;
LABEL_8:
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82__REMListChangeItem__lowLevelAddReminderIDToOrdering_relativeToSiblingID_isAfter___block_invoke;
    v16[3] = &unk_1E61DDDF0;
    id v17 = v8;
    uint64_t v18 = v14;
    [(REMListChangeItem *)self _editReminderIDsOrderingUsingBlock:v16];

    BOOL v12 = 1;
    goto LABEL_9;
  }
  BOOL v12 = 0;
LABEL_9:

  return v12;
}

void __82__REMListChangeItem__lowLevelAddReminderIDToOrdering_relativeToSiblingID_isAfter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  [a2 insertObject:v5 atIndex:v6];
  id v8 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 40)];
  [v7 setObject:v8 forKey:*(void *)(a1 + 32)];
}

- (id)changedKeys
{
  id v2 = [(REMListChangeItem *)self changedKeysObserver];
  id v3 = [v2 changedKeys];

  return v3;
}

- (id)ekColor
{
  id v2 = [(REMListChangeItem *)self storage];
  id v3 = [v2 ekColor];

  return v3;
}

- (void)setDaDisplayOrder:(int64_t)a3
{
  uint64_t v5 = [(REMListChangeItem *)self storage];
  uint64_t v6 = [v5 daDisplayOrder];

  if (v6 != a3)
  {
    id v7 = [(REMListChangeItem *)self saveRequest];
    id v8 = [v7 _updateAccountWithListChangeItem:self];

    if (v8)
    {
      [v8 setListsDADisplayOrderChanged:1];
      id v9 = [(REMListChangeItem *)self storage];
      [v9 setDaDisplayOrder:a3];

      long long v10 = [(REMListChangeItem *)self changedKeysObserver];
      [v10 keyDidChange:@"daDisplayOrder"];
    }
    else
    {
      long long v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[REMListChangeItem setDaDisplayOrder:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
}

- (void)setDaIsNotificationsCollection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(REMListChangeItem *)self storage];
  int v6 = [v5 daIsNotificationsCollection];

  if (v6 != v3)
  {
    id v7 = [(REMListChangeItem *)self saveRequest];
    id v8 = [v7 _updateAccountWithListChangeItem:self];

    if (!v8)
    {
      uint64_t v11 = +[REMLogStore write];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[REMListChangeItem setDaIsNotificationsCollection:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    [v8 setListsDADisplayOrderChanged:1];
    id v9 = [(REMListChangeItem *)self storage];
    [v9 setDaIsNotificationsCollection:v3];

    long long v10 = [(REMListChangeItem *)self changedKeysObserver];
    [v10 keyDidChange:@"daIsNotificationsCollection"];
  }
}

- (BOOL)isPinned
{
  id v2 = [(REMListChangeItem *)self pinnedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setIsPinned:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(REMListChangeItem *)self accountCapabilities];
  char v6 = [v5 supportsPinnedLists];

  if (v6)
  {
    if ([(REMListChangeItem *)self isPinned] != v3)
    {
      if (v3)
      {
        id v8 = [MEMORY[0x1E4F1C9C8] now];
        [(REMListChangeItem *)self setPinnedDate:v8];
      }
      else
      {
        [(REMListChangeItem *)self setPinnedDate:0];
      }
    }
  }
  else
  {
    id v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMListChangeItem setIsPinned:](self);
    }
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMListChangeItem *)self storage];
  char v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMListChangeItem;
  if (-[REMListChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(REMListChangeItem *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMListChangeItem *)self saveRequest];
  int v9 = [v8 isSaved];

  if (v9)
  {
    long long v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v12, 2u);
    }
  }
  uint64_t v11 = [(REMListChangeItem *)self storage];
  [v11 setValue:v7 forKey:v6];
}

- (void)_reassignReminderChangeItem:(id)a3 withParentReminderChangeItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 removeFromList];
  id v7 = [(REMListChangeItem *)self objectID];
  [v10 setListID:v7];

  id v8 = [(REMListChangeItem *)self accountID];
  [v10 setAccountID:v8];

  if (v6)
  {
    int v9 = [v6 objectID];
    [v10 setParentReminderID:v9];
  }
}

- (void)_lowLevelAddReminderChangeItemToOrdering:(id)a3 atIndexOfSibling:(id)a4 isAfter:(BOOL)a5 withParent:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 listID];
  if (!v13) {
    goto LABEL_3;
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = [v10 listID];
  uint64_t v16 = [(REMListChangeItem *)self objectID];
  char v17 = [v15 isEqual:v16];

  if ((v17 & 1) == 0)
  {
LABEL_3:
    uint64_t v18 = +[REMLogStore write];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[REMListChangeItem _lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  v26 = [v10 objectID];
  id v27 = v11;
  if (!v27) {
    goto LABEL_18;
  }
  char v28 = [v10 listID];
  v29 = [v27 listID];
  int v30 = [v28 isEqual:v29];

  if (!v30) {
    goto LABEL_18;
  }
  v31 = [v10 parentReminderID];
  if (v31 || ([v27 parentReminderID], (v46 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v32 = objc_msgSend(v10, "parentReminderID", v46);
    v33 = [v27 parentReminderID];
    int v34 = [v32 isEqual:v33];

    if (v31)
    {

      if (!v34) {
        goto LABEL_18;
      }
    }
    else
    {

      if ((v34 & 1) == 0) {
        goto LABEL_18;
      }
    }
  }
  uint64_t v35 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
  v36 = [v27 objectID];
  uint64_t v37 = [v35 indexOfObject:v36];

  if (v37 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v39 = v37 + v7;
    goto LABEL_24;
  }
  v38 = +[REMLogStore write];
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
    -[REMListChangeItem _lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:]();
  }

LABEL_18:
  uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
  {
    id v40 = v12;
    v41 = [(REMListChangeItem *)self reminderIDsMergeableOrdering];
    v42 = [v40 objectID];

    uint64_t v43 = [v41 indexOfObject:v42];
    if (v43 != 0x7FFFFFFFFFFFFFFFLL && !v7) {
      uint64_t v39 = v43 + 1;
    }
  }
LABEL_24:
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __98__REMListChangeItem__lowLevelAddReminderChangeItemToOrdering_atIndexOfSibling_isAfter_withParent___block_invoke;
  v47[3] = &unk_1E61DDE68;
  id v48 = v26;
  uint64_t v49 = v39;
  BOOL v50 = v7;
  id v45 = v26;
  [(REMListChangeItem *)self _editReminderIDsOrderingUsingBlock:v47];
}

void __98__REMListChangeItem__lowLevelAddReminderChangeItemToOrdering_atIndexOfSibling_isAfter_withParent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v6 = [v8 count];
      [v8 addObject:*(void *)(a1 + 32)];
    }
    else
    {
      [v8 insertObject:*(void *)(a1 + 32) atIndex:0];
      uint64_t v6 = 0;
    }
  }
  else
  {
    [v8 insertObject:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 40)];
  }
  BOOL v7 = [NSNumber numberWithUnsignedLong:v6];
  [v5 setObject:v7 forKey:*(void *)(a1 + 32)];
}

- (void)_editReminderIDsOrderingUsingBlock:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  char v4 = (void (**)(id, void *, void *))a3;
  id v5 = [(REMListChangeItem *)self saveRequest];
  int v6 = [v5 isSaved];

  if (v6)
  {
    BOOL v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", (uint8_t *)&v23, 2u);
    }
  }
  id v8 = [(REMListChangeItem *)self saveRequest];
  char v9 = [v8 applyCRDTsWithoutMerging];

  if ((v9 & 1) == 0)
  {
    id v10 = [(REMListChangeItem *)self storage];
    id v11 = [v10 reminderIDsMergeableOrdering];

    id v12 = (void *)[v11 mutableCopy];
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v4[2](v4, v12, v13);
    uint64_t v14 = [MEMORY[0x1E4F1CAA0] orderedSetWithOrderedSet:v12];
    uint64_t v15 = [(REMListChangeItem *)self storage];
    [v15 setReminderIDsMergeableOrdering:v14];

    uint64_t v16 = +[REMLogStore write];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      char v17 = [(REMListChangeItem *)self objectID];
      uint64_t v18 = [(REMListChangeItem *)self saveRequest];
      uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      int v23 = 138412802;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      v26 = v18;
      __int16 v27 = 2112;
      char v28 = v19;
      _os_log_impl(&dword_1B9AA2000, v16, OS_LOG_TYPE_INFO, "REMListChangeItem updated storage.reminderIDsMergeableOrdering {objectID: %@, saveReq: %@, ordering.count: %@}", (uint8_t *)&v23, 0x20u);
    }
    if ([v13 count])
    {
      uint64_t v20 = [(REMListChangeItem *)self reminderIDsOrderingHints];
      uint64_t v21 = (void *)[v20 mutableCopy];

      [v21 addEntriesFromDictionary:v13];
      [(REMListChangeItem *)self setReminderIDsOrderingHints:v21];
    }
    uint64_t v22 = [(REMListChangeItem *)self changedKeysObserver];
    [v22 keyDidChange:@"reminderIDsMergeableOrdering"];
  }
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  BOOL v3 = (void *)__resolutionTokenKeyDenylist_3;
  id v4 = a3;
  if ([v3 containsObject:v4]) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)isShared
{
  id v2 = self;
  BOOL v3 = [(REMListChangeItem *)self sharees];
  LOBYTE(v2) = +[REMList isSharedWithShareeCount:sharingStatus:](REMList, "isSharedWithShareeCount:sharingStatus:", [v3 count], -[REMListChangeItem sharingStatus](v2, "sharingStatus"));

  return (char)v2;
}

- (BOOL)isOwnedByMe
{
  uint64_t v2 = [(REMListChangeItem *)self sharingStatus];

  return +[REMList isOwnedByMeWithSharingStatus:v2];
}

- (BOOL)isSharedToMe
{
  return [(REMListChangeItem *)self sharingStatus] == 2;
}

- (BOOL)canBeIncludedInGroup
{
  return ![(REMListChangeItem *)self isSharedToMe];
}

+ (id)newObjectID
{
  return +[REMListStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMListStorage objectIDWithUUID:a3];
}

+ (NSString)cdEntityName
{
  return +[REMListStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMListChangeItem *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMListStorage)storage
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

- (void)copyListDataFrom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  [(REMListChangeItem *)self setName:v5];

  id v6 = [v4 color];
  [(REMListChangeItem *)self setColor:v6];

  -[REMListChangeItem setDaDisplayOrder:](self, "setDaDisplayOrder:", [v4 daDisplayOrder]);
  BOOL v7 = [v4 lastUserAccessDate];
  [(REMListChangeItem *)self setLastUserAccessDate:v7];

  id v8 = [v4 sortingStyle];
  [(REMListChangeItem *)self setSortingStyle:v8];

  char v9 = [v4 pinnedDate];
  [(REMListChangeItem *)self setPinnedDate:v9];

  if ([v4 isGroup])
  {
    id v10 = [(REMListChangeItem *)self accountCapabilities];
    char v11 = [v10 supportsGroups];

    if ((v11 & 1) == 0)
    {
      id v12 = +[REMLogStore write];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[REMListChangeItem(AccountDataMoving) copyListDataFrom:](v4, v12);
      }
    }
  }
}

- (void)_testingOnly_setReminderIDsMergeableOrder:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithOrderedSet:a3];
  id v5 = [(REMListChangeItem *)self storage];
  [v5 setReminderIDsMergeableOrdering:v4];

  id v6 = [(REMListChangeItem *)self changedKeysObserver];
  [v6 keyDidChange:@"reminderIDsMergeableOrdering"];
}

- (id)_testingOnly_listShareeContextChangeItem
{
  uint64_t v2 = [[REMListShareeContextChangeItem alloc] initWithListChangeItem:self];

  return v2;
}

- (void)initWithObjectID:name:insertIntoAccountChangeItem:isGroup:withParentList:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "Tried to initialize a nested group {listChangeItem: %@}", v2, v3, v4, v5, v6);
}

- (void)accountCapabilities
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "trackedAccountCapabilities is unexpectedly nil when getting listChangeItem.accountCapabilities {objectID: %{public}@}", v4, v5, v6, v7, v8);
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.2(uint64_t a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = NSStringFromSelector(a2);
  uint8_t v8 = [v4 stringWithFormat:@"%@.%@", v6, v7];
  int v11 = 138543618;
  id v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v9, v10, "[%{public}@] self.objectID should not be nil when copying this change item {self: %@}", (uint8_t *)&v11);
}

- (void)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 saveRequest];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "Trying to optimistically insert reminderID to the ordering of a REMListChangeItem for a REMReminderChangeItem tracked by the same REMSaveRequest {saveRequest: %@}", v4, v5, v6, v7, v8);
}

- (void)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "Unexpected index of objectID in reminderIDsMergeableOrdering {index: %ld}", v2, v3, v4, v5, v6);
}

- (void)optimisticallyInsertReminderIDToOrderingForReminderChangeItemBeingSaved:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "objectID of reminderChangeItem does not exist in its listChangeItem.reminderIDsMergeableOrdering {objectID: %@}", v2, v3, v4, v5, v6);
}

- (void)insertReminderChangeItem:(uint64_t)a1 adjacentToReminderChangeItem:(void *)a2 isAfter:withParentReminderChangeItem:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 accountID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v3, v4, "Cannot move reminder across shared lists for account {original: %@, accountID: %@}", v5);
}

- (void)insertReminderChangeItem:(uint64_t)a1 adjacentToReminderChangeItem:(void *)a2 isAfter:withParentReminderChangeItem:.cold.2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 accountID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v3, v4, "Cannot move reminder across lists for account {original: %@, accountID: %@}", v5);
}

- (void)insertReminderChangeItem:(NSObject *)a3 adjacentToReminderChangeItem:isAfter:withParentReminderChangeItem:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 accountID];
  uint64_t v7 = [a2 accountID];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  int v11 = v6;
  __int16 v12 = 2112;
  __int16 v13 = v7;
  _os_log_fault_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_FAULT, "Cannot move reminders across accounts {original: %@, accountID: %@, expectedAccountID: %@}", (uint8_t *)&v8, 0x20u);
}

- (void)lowLevelRemoveReminderIDFromOrdering:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "Tried to remove reminder not present in ordering list {objectID: %@, ordering: %@}", buf, 0x16u);
}

- (void)setDaDisplayOrder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, a1, a3, "rem_log_fault_if (accountChangeItem == nil) -- accountChangeItem is nil. Unable to update account when setting daDisplayOrder.", a5, a6, a7, a8, 0);
}

- (void)setDaIsNotificationsCollection:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, a1, a3, "rem_log_fault_if (accountChangeItem == nil) -- accountChangeItem is nil. Unable to update account when setting daIsNotificationsCollection.", a5, a6, a7, a8, 0);
}

- (void)setIsPinned:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "'- [REMListChangeItem setIsPinned:]' should not be called because account does not support pinned lists {objectID: %@}", v4, v5, v6, v7, v8);
}

- (void)_lowLevelAddReminderChangeItemToOrdering:atIndexOfSibling:isAfter:withParent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_1B9AA2000, v0, v1, "Failed to find the insert after index of the given sibling reminder -- Appending to the end {objectID: %@}.", v2, v3, v4, v5, v6);
}

- (void)_lowLevelAddReminderChangeItemToOrdering:(uint64_t)a3 atIndexOfSibling:(uint64_t)a4 isAfter:(uint64_t)a5 withParent:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, a1, a3, "rem_log_fault_if (reminderChangeItem.listID == nil || ![reminderChangeItem.listID isEqual:self.objectID]) -- reminderChangeItem must have been assigned to this list change item at this point", a5, a6, a7, a8, 0);
}

@end