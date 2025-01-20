@interface REMAccountChangeItem
+ (id)_emptyListIDsOrderingWithAccountID:(id)a3;
+ (void)initialize;
- (BOOL)canCopyReminderLosslesslyToAccountChangeItem:(id)a3;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (REMAccountCapabilities)capabilities;
- (REMAccountChangeItem)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5 insertIntoSaveRequest:(id)a6;
- (REMAccountChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 capabilities:(id)a5 changedKeysObserver:(id)a6;
- (REMAccountChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 capabilities:(id)a5 observeInitialValues:(BOOL)a6;
- (REMAccountGroupContextChangeItem)groupContext;
- (REMAccountPinnedListsContextChangeItem)pinnedListsContext;
- (REMAccountStorage)storage;
- (REMChangedKeysObserver)changedKeysObserver;
- (REMSaveRequest)saveRequest;
- (id)accountTypeHost;
- (id)changedKeys;
- (id)lowLevelRemoveMergeableOrderingNodeIDFromOrdering:(id)a3;
- (id)mergeableOrderingNodesByOrderingMergeableOrderingNodes:(id)a3;
- (id)resolutionTokenKeyForChangedKey:(id)a3;
- (id)shallowCopyWithSaveRequest:(id)a3;
- (id)templatesContextChangeItem;
- (id)valueForUndefinedKey:(id)a3;
- (void)_editListIDsOrderingUsingBlock:(id)a3;
- (void)_lowLevelAddMergeableOrderingNodeToOrdering:(id)a3 atIndexOfSibling:(id)a4 isAfter:(BOOL)a5 withParentMergeableOrderingNode:(id)a6;
- (void)_lowLevelApplyUndoToOrdering:(id)a3;
- (void)_reassignMergeableOrderingNode:(id)a3 withParentListChangeItem:(id)a4;
- (void)addMergeableOrderingNode:(id)a3;
- (void)addSmartListChangeItem:(id)a3;
- (void)capabilities;
- (void)insertMergeableOrderingNode:(id)a3 adjacentToMergeableOrderingNode:(id)a4 isAfter:(BOOL)a5 withParentMergeableOrderingNode:(id)a6;
- (void)insertMergeableOrderingNode:(id)a3 afterMergeableOrderingNode:(id)a4;
- (void)insertMergeableOrderingNode:(id)a3 beforeMergeableOrderingNode:(id)a4;
- (void)insertSmartListChangeItem:(id)a3 afterSmartListChangeItem:(id)a4;
- (void)insertSmartListChangeItem:(id)a3 beforeSmartListChangeItem:(id)a4;
- (void)lowLevelAddMergeableOrderingNodeIDToOrdering:(id)a3 withParentMergeableOrderingNode:(id)a4;
- (void)removeFromStore;
- (void)setChangedKeysObserver:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)test_lowLevelEditOrderingByMovingListObjectID:(id)a3 toTarget:(unint64_t)a4;
- (void)undeleteListWithID:(id)a3 usingUndo:(id)a4;
- (void)undeleteSmartListWithID:(id)a3 usingUndo:(id)a4;
@end

@implementation REMAccountChangeItem

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_0;
    __sKeysToObserve_0 = (uint64_t)&unk_1F136C0B0;

    __resolutionTokenKeyDenylist = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C0C8];
    MEMORY[0x1F41817F8]();
  }
}

- (REMAccountChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 capabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    v22.receiver = self;
    v22.super_class = (Class)REMAccountChangeItem;
    v15 = [(REMAccountChangeItem *)&v22 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_saveRequest, a3);
      objc_storeStrong((id *)&v16->_storage, a4);
      objc_storeStrong((id *)&v16->_changedKeysObserver, a6);
      saveRequest = v16->_saveRequest;
      v18 = [(REMAccountStorage *)v16->_storage objectID];
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

- (REMAccountChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 capabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)[a4 copy];
  id v13 = [REMChangedKeysObserver alloc];
  id v14 = [(REMChangedKeysObserver *)v13 initWithTarget:v12 keysToObserve:__sKeysToObserve_0 includeInitial:v6];
  v15 = [(REMAccountChangeItem *)self initWithSaveRequest:v11 storage:v12 capabilities:v10 changedKeysObserver:v14];

  return v15;
}

- (REMAccountChangeItem)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5 insertIntoSaveRequest:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = +[REMAccountChangeItem _emptyListIDsOrderingWithAccountID:v12];
  id v14 = [[REMAccountStorage alloc] initWithObjectID:v12 type:a4 name:v11 listIDsMergeableOrdering:v13];

  v15 = [[REMAccountCapabilities alloc] initWithAccountType:a4];
  v16 = [(REMAccountChangeItem *)self initWithSaveRequest:v10 storage:v14 capabilities:v15 observeInitialValues:1];

  return v16;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(REMAccountChangeItem *)self storage];

  if (v6)
  {
    v7 = [(REMAccountChangeItem *)self objectID];
    v8 = [v5 _trackedAccountCapabilitiesForObjectID:v7];

    if (v8) {
      goto LABEL_16;
    }
    v9 = [(REMAccountChangeItem *)self objectID];

    if (v9)
    {
      if (!v5) {
        goto LABEL_15;
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
        -[REMReminderChangeItem shallowCopyWithSaveRequest:]();
      }
    }

LABEL_15:
    id v13 = [REMAccountCapabilities alloc];
    id v14 = [(REMAccountChangeItem *)self storage];
    v8 = -[REMAccountCapabilities initWithAccountType:](v13, "initWithAccountType:", [v14 type]);

    if (!v8)
    {
      v8 = +[REMLogStore write];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[REMAccountChangeItem shallowCopyWithSaveRequest:](v8, v19, v20, v21, v22, v23, v24, v25);
      }
      id v12 = 0;
      goto LABEL_17;
    }
LABEL_16:
    v15 = [REMAccountChangeItem alloc];
    v16 = [(REMAccountChangeItem *)self storage];
    v17 = [(REMAccountChangeItem *)self changedKeysObserver];
    id v12 = [(REMAccountChangeItem *)v15 initWithSaveRequest:v5 storage:v16 capabilities:v8 changedKeysObserver:v17];

LABEL_17:
    goto LABEL_18;
  }
  id v11 = +[REMLogStore write];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[REMReminderChangeItem shallowCopyWithSaveRequest:]();
  }

  id v12 = [(REMAccountChangeItem *)self storage];

  if (v12) {
    id v12 = 0;
  }
  else {
    NSLog(&cfstr_SIsUnexpectedl.isa, "self.storage");
  }
LABEL_18:

  return v12;
}

- (REMAccountCapabilities)capabilities
{
  v3 = [(REMAccountChangeItem *)self storage];

  if (!v3)
  {
    v18 = +[REMLogStore write];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[REMReminderChangeItem shallowCopyWithSaveRequest:]();
    }

    uint64_t v19 = [(REMAccountChangeItem *)self storage];

    if (!v19) {
      NSLog(&cfstr_SIsUnexpectedl.isa, "self.storage");
    }
    goto LABEL_13;
  }
  v4 = [(REMAccountChangeItem *)self saveRequest];
  id v5 = [(REMAccountChangeItem *)self objectID];
  BOOL v6 = [v4 _trackedAccountCapabilitiesForObjectID:v5];

  if (!v6)
  {
    v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMAccountChangeItem capabilities](self);
    }

    v8 = [REMAccountCapabilities alloc];
    v9 = [(REMAccountChangeItem *)self storage];
    BOOL v6 = -[REMAccountCapabilities initWithAccountType:](v8, "initWithAccountType:", [v9 type]);

    if (!v6)
    {
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[REMAccountChangeItem shallowCopyWithSaveRequest:](v10, v11, v12, v13, v14, v15, v16, v17);
      }

LABEL_13:
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (REMAccountGroupContextChangeItem)groupContext
{
  v3 = [(REMAccountChangeItem *)self capabilities];
  int v4 = [v3 supportsGroups];

  if (v4) {
    id v5 = [[REMAccountGroupContextChangeItem alloc] initWithAccountChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (REMAccountPinnedListsContextChangeItem)pinnedListsContext
{
  v3 = [(REMAccountChangeItem *)self capabilities];
  int v4 = [v3 supportsPinnedLists];

  if (v4) {
    id v5 = [[REMAccountPinnedListsContextChangeItem alloc] initWithAccountChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)templatesContextChangeItem
{
  v3 = [(REMAccountChangeItem *)self capabilities];
  int v4 = [v3 supportsTemplates];

  if (v4) {
    id v5 = [[REMAccountTemplatesContextChangeItem alloc] initWithAccountChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  id v5 = [(REMAccountChangeItem *)self storage];
  BOOL v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMAccountChangeItem;
  if (-[REMAccountChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(REMAccountChangeItem *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(REMAccountChangeItem *)self saveRequest];
  int v9 = [v8 isSaved];

  if (v9)
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v12, 2u);
    }
  }
  uint64_t v11 = [(REMAccountChangeItem *)self storage];
  [v11 setValue:v7 forKey:v6];
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  v3 = (void *)__resolutionTokenKeyDenylist;
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

- (id)changedKeys
{
  v2 = [(REMAccountChangeItem *)self changedKeysObserver];
  v3 = [v2 changedKeys];

  return v3;
}

- (id)accountTypeHost
{
  v2 = [(REMAccountChangeItem *)self storage];
  v3 = [v2 accountTypeHost];

  return v3;
}

- (BOOL)isUnsupported
{
  v2 = [(REMAccountChangeItem *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (void)addSmartListChangeItem:(id)a3
{
  id v4 = a3;
  [v4 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem addSmartListChangeItem:]"];
  [(REMAccountChangeItem *)self insertMergeableOrderingNode:v4 adjacentToMergeableOrderingNode:0 isAfter:1 withParentMergeableOrderingNode:0];
}

- (void)insertSmartListChangeItem:(id)a3 beforeSmartListChangeItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:]"];
  [v6 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:] (sibling)"];
  [(REMAccountChangeItem *)self insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:0 withParentMergeableOrderingNode:0];
}

- (void)insertSmartListChangeItem:(id)a3 afterSmartListChangeItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertSmartListChangeItem:afterSmartListChangeItem:]"];
  [v6 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertSmartListChangeItem:afterSmartListChangeItem:] (sibling)"];
  [(REMAccountChangeItem *)self insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:1 withParentMergeableOrderingNode:0];
}

- (void)addMergeableOrderingNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem addMergeableOrderingNode:]"];
  }
  [(REMAccountChangeItem *)self insertMergeableOrderingNode:v4 adjacentToMergeableOrderingNode:0 isAfter:1 withParentMergeableOrderingNode:0];
}

- (void)insertMergeableOrderingNode:(id)a3 beforeMergeableOrderingNode:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:]"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:] (sibling)"];
  }
  [(REMAccountChangeItem *)self insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:0 withParentMergeableOrderingNode:0];
}

- (void)insertMergeableOrderingNode:(id)a3 afterMergeableOrderingNode:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertMergeableOrderingNode:afterMergeableOrderingNode:]"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 assertIsCustomSmartListWithAction:@"-[REMAccountChangeItem insertMergeableOrderingNode:afterMergeableOrderingNode:] (sibling)"];
  }
  [(REMAccountChangeItem *)self insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:1 withParentMergeableOrderingNode:0];
}

- (void)undeleteListWithID:(id)a3 usingUndo:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(REMAccountChangeItem *)self listIDsToUndelete];
  v8 = [v7 setByAddingObject:v6];

  [(REMAccountChangeItem *)self setListIDsToUndelete:v8];
  [(REMAccountChangeItem *)self _lowLevelApplyUndoToOrdering:v9];
}

- (void)undeleteSmartListWithID:(id)a3 usingUndo:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(REMAccountChangeItem *)self smartListIDsToUndelete];
  v8 = [v7 setByAddingObject:v6];

  [(REMAccountChangeItem *)self setSmartListIDsToUndelete:v8];
  [(REMAccountChangeItem *)self _lowLevelApplyUndoToOrdering:v9];
}

- (void)removeFromStore
{
}

- (id)mergeableOrderingNodesByOrderingMergeableOrderingNodes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = [v11 remObjectID];
        uint64_t v13 = [v12 uuid];
        uint64_t v14 = [v13 UUIDString];

        if ([v14 length]) {
          [v5 setObject:v11 forKeyedSubscript:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__REMAccountChangeItem_mergeableOrderingNodesByOrderingMergeableOrderingNodes___block_invoke;
  v23[3] = &unk_1E61DCD08;
  id v16 = v5;
  id v24 = v16;
  id v17 = v22;
  id v25 = v17;
  [v15 enumerateObjectsUsingBlock:v23];

  if ([v16 count])
  {
    v18 = +[REMLogStore write];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[REMAccountChangeItem mergeableOrderingNodesByOrderingMergeableOrderingNodes:](v16);
    }
  }
  uint64_t v19 = v25;
  id v20 = v17;

  return v20;
}

void __79__REMAccountChangeItem_mergeableOrderingNodesByOrderingMergeableOrderingNodes___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  char v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v3)
  {
    [*(id *)(a1 + 40) addObject:v3];
    [*(id *)(a1 + 32) removeObjectForKey:v4];
  }
}

- (BOOL)canCopyReminderLosslesslyToAccountChangeItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  uint64_t v6 = [(REMAccountChangeItem *)self type];
  uint64_t v7 = [v4 type];
  uint64_t v8 = [v4 accountTypeHost];

  LOBYTE(v6) = [v5 canCopyReminderLosslesslyFromAccountWithType:v6 toAccountWithType:v7 accountTypeHost:v8];
  return v6;
}

- (void)lowLevelAddMergeableOrderingNodeIDToOrdering:(id)a3 withParentMergeableOrderingNode:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__REMAccountChangeItem_lowLevelAddMergeableOrderingNodeIDToOrdering_withParentMergeableOrderingNode___block_invoke;
  v7[3] = &unk_1E61DCD30;
  id v8 = v5;
  id v6 = v5;
  [(REMAccountChangeItem *)self _editListIDsOrderingUsingBlock:v7];
}

void __101__REMAccountChangeItem_lowLevelAddMergeableOrderingNodeIDToOrdering_withParentMergeableOrderingNode___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  char v3 = [*(id *)(a1 + 32) uuid];
  id v4 = [v3 UUIDString];
  id v5 = (id)[v6 addObject:v4];
}

- (id)lowLevelRemoveMergeableOrderingNodeIDFromOrdering:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
  id v6 = [v4 uuid];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = [v5 indexOfEqualObject:v7];

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = +[REMLogStore write];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v10 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
      -[REMAccountChangeItem lowLevelRemoveMergeableOrderingNodeIDFromOrdering:]((uint64_t)v4, v10, buf, v9);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__REMAccountChangeItem_lowLevelRemoveMergeableOrderingNodeIDFromOrdering___block_invoke;
    v13[3] = &unk_1E61DCD58;
    v13[4] = &v14;
    v13[5] = v8;
    [(REMAccountChangeItem *)self _editListIDsOrderingUsingBlock:v13];
  }
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

uint64_t __74__REMAccountChangeItem_lowLevelRemoveMergeableOrderingNodeIDFromOrdering___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 removeObjectAtIndex:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

- (void)test_lowLevelEditOrderingByMovingListObjectID:(id)a3 toTarget:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
  uint64_t v8 = [v6 uuid];
  uint64_t v9 = [v8 UUIDString];
  uint64_t v10 = [v7 indexOfEqualObject:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMAccountChangeItem test_lowLevelEditOrderingByMovingListObjectID:toTarget:]((uint64_t)v6, self);
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v12 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
  unint64_t v13 = [v12 count];

  if (v13 <= a4)
  {
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMAccountChangeItem test_lowLevelEditOrderingByMovingListObjectID:toTarget:]((uint64_t)v6, self);
    }
    goto LABEL_8;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__REMAccountChangeItem_test_lowLevelEditOrderingByMovingListObjectID_toTarget___block_invoke;
  v14[3] = &__block_descriptor_48_e41_v16__0__REMMutableCRMergeableOrderedSet_8l;
  v14[4] = a4;
  v14[5] = v10;
  [(REMAccountChangeItem *)self _editListIDsOrderingUsingBlock:v14];
LABEL_9:
}

void *__79__REMAccountChangeItem_test_lowLevelEditOrderingByMovingListObjectID_toTarget___block_invoke(void *result, void *a2)
{
  if (result[5] != result[4]) {
    return (id)objc_msgSend(a2, "moveObjectFromIndex:toIndex:");
  }
  return result;
}

+ (id)_emptyListIDsOrderingWithAccountID:(id)a3
{
  char v3 = +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:a3];
  id v4 = [REMCRMergeableOrderedSet alloc];
  id v5 = [MEMORY[0x1E4F1CAA0] orderedSet];
  id v6 = [(REMCRMergeableOrderedSet *)v4 initWithReplicaIDSource:v3 orderedSet:v5];

  return v6;
}

- (void)insertMergeableOrderingNode:(id)a3 adjacentToMergeableOrderingNode:(id)a4 isAfter:(BOOL)a5 withParentMergeableOrderingNode:(id)a6
{
  BOOL v7 = a5;
  id v23 = a3;
  id v10 = a4;
  unint64_t v11 = (unint64_t)a6;
  uint64_t v12 = [v23 saveRequest];
  unint64_t v13 = [(REMAccountChangeItem *)self saveRequest];

  if (v12 != v13)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    uint64_t v16 = [v23 saveRequest];
    id v17 = [(REMAccountChangeItem *)self saveRequest];
    [v14 raise:v15, @"mergeableOrderingNode (%@) has incorrect saveRequest (%@). Expected %@", v23, v16, v17 format];
  }
  if (v23 != v10) {
    goto LABEL_4;
  }
  uint64_t v18 = [v23 parentSubContainerID];
  id v10 = v23;
  if (v11 | v18)
  {
    id v19 = (void *)v18;
    id v20 = [v23 parentSubContainerID];
    uint64_t v21 = [(id)v11 remObjectID];
    char v22 = [v20 isEqual:v21];

    id v10 = v23;
    if ((v22 & 1) == 0)
    {

      id v10 = 0;
LABEL_4:
      [(REMAccountChangeItem *)self _reassignMergeableOrderingNode:v23 withParentListChangeItem:v11];
      [(REMAccountChangeItem *)self _lowLevelAddMergeableOrderingNodeToOrdering:v23 atIndexOfSibling:v10 isAfter:v7 withParentMergeableOrderingNode:v11];
    }
  }
}

- (void)_reassignMergeableOrderingNode:(id)a3 withParentListChangeItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v10 removeFromParentWithAccountChangeItem:self];
  BOOL v7 = [(REMAccountChangeItem *)self objectID];
  [v10 setParentOwnerID:v7];

  uint64_t v8 = [(REMAccountChangeItem *)self objectID];
  [v10 setAccountID:v8];

  if (v6)
  {
    uint64_t v9 = [v6 remObjectID];
    [v10 setParentSubContainerID:v9];
  }
}

- (void)_lowLevelAddMergeableOrderingNodeToOrdering:(id)a3 atIndexOfSibling:(id)a4 isAfter:(BOOL)a5 withParentMergeableOrderingNode:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v39 = a6;
  uint64_t v11 = [v9 accountID];
  if (!v11) {
    goto LABEL_3;
  }
  uint64_t v12 = (void *)v11;
  unint64_t v13 = [v9 accountID];
  uint64_t v14 = [(REMAccountChangeItem *)self objectID];
  char v15 = [v13 isEqual:v14];

  if ((v15 & 1) == 0)
  {
LABEL_3:
    uint64_t v16 = +[REMLogStore write];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[REMAccountChangeItem _lowLevelAddMergeableOrderingNodeToOrdering:atIndexOfSibling:isAfter:withParentMergeableOrderingNode:](v16);
    }
  }
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
  id v17 = [v9 remObjectID];
  uint64_t v18 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
  id v19 = [v17 uuid];
  id v20 = [v19 UUIDString];
  uint64_t v38 = [v18 indexOfEqualObject:v20];

  uint64_t v21 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
  uint64_t v37 = [v21 count];

  if (!v10) {
    goto LABEL_15;
  }
  id v22 = [v9 accountID];
  id v23 = [v10 accountID];
  if (([v22 isEqual:v23] & 1) == 0)
  {

    BOOL v28 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v24 = [v9 parentSubContainerID];
  if (!v24)
  {
    v36 = [v10 parentSubContainerID];
    if (!v36)
    {

LABEL_17:
      id v22 = v10;
      long long v29 = [(REMAccountChangeItem *)self listIDsMergeableOrdering];
      v30 = [v22 remObjectID];
      uint64_t v31 = [v30 uuid];
      v32 = [v31 UUIDString];
      uint64_t v33 = [v29 indexOfEqualObject:v32];
      v51[3] = v33;

      BOOL v28 = v51[3] == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_18;
    }
  }
  id v25 = [v9 parentSubContainerID];
  long long v26 = [v10 parentSubContainerID];
  char v27 = [v25 isEqual:v26];

  if (v24) {
  else
  }

  if (v27) {
    goto LABEL_17;
  }
LABEL_15:
  BOOL v28 = 0;
LABEL_19:
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke;
  v41[3] = &unk_1E61DCDA0;
  BOOL v48 = a5;
  v45 = &v50;
  uint64_t v46 = v38;
  id v34 = v17;
  id v42 = v34;
  BOOL v49 = v28;
  id v35 = v39;
  id v43 = v35;
  v44 = self;
  uint64_t v47 = v37;
  [(REMAccountChangeItem *)self _editListIDsOrderingUsingBlock:v41];

  _Block_object_dispose(&v50, 8);
}

void __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(unsigned char *)(a1 + 81))
    {
      id v6 = +[REMLogStore write];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    unint64_t v13 = *(void **)(a1 + 40);
    if (v13)
    {
      id v14 = v13;
      char v15 = [*(id *)(a1 + 48) listIDsMergeableOrdering];
      uint64_t v16 = [v14 remObjectID];
      id v17 = [v16 uuid];
      uint64_t v18 = [v17 UUIDString];
      uint64_t v19 = [v15 indexOfEqualObject:v18];

      if (v19 != 0x7FFFFFFFFFFFFFFFLL && !*(unsigned char *)(a1 + 80)) {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v19 + 1;
      }
    }
    unint64_t v20 = *(void *)(a1 + 64);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = [*(id *)(a1 + 32) uuid];
      id v22 = [v21 UUIDString];

      if (*(unsigned char *)(a1 + 80)) {
        id v23 = (id)[v3 addObject:v22];
      }
      else {
        id v29 = (id)[v3 insertObject:v22 atIndex:0];
      }
      goto LABEL_24;
    }
    if (!*(unsigned char *)(a1 + 80))
    {
      if (!v20) {
        goto LABEL_28;
      }
      BOOL v28 = v3;
LABEL_27:
      id v30 = (id)objc_msgSend(v28, "moveObjectFromIndex:toIndex:");
      goto LABEL_28;
    }
    uint64_t v26 = *(void *)(a1 + 72) - 1;
  }
  else
  {
    if (*(unsigned char *)(a1 + 80)) {
      *(void *)(v4 + 24) = v5 + 1;
    }
    unint64_t v20 = *(void *)(a1 + 64);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v22 = [*(id *)(a1 + 32) uuid];
      id v24 = [v22 UUIDString];
      id v25 = (id)[v3 insertObject:v24 atIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];

LABEL_24:
      goto LABEL_28;
    }
    unint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v26 = (__PAIR128__(v27, v20) - v27) >> 64;
  }
  if (v20 != v26)
  {
    BOOL v28 = v3;
    goto LABEL_27;
  }
LABEL_28:
}

- (void)_lowLevelApplyUndoToOrdering:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__REMAccountChangeItem__lowLevelApplyUndoToOrdering___block_invoke;
  v6[3] = &unk_1E61DCD30;
  id v7 = v4;
  id v5 = v4;
  [(REMAccountChangeItem *)self _editListIDsOrderingUsingBlock:v6];
}

uint64_t __53__REMAccountChangeItem__lowLevelApplyUndoToOrdering___block_invoke(uint64_t a1, void *a2)
{
  return [a2 undo:*(void *)(a1 + 32)];
}

- (void)_editListIDsOrderingUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(REMAccountChangeItem *)self saveRequest];
  int v6 = [v5 isSaved];

  if (v6)
  {
    id v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v16, 2u);
    }
  }
  uint64_t v8 = [(REMAccountChangeItem *)self storage];
  uint64_t v9 = [v8 listIDsMergeableOrdering];

  uint64_t v10 = [v9 mutableOrderedSet];
  uint64_t v11 = [(REMAccountChangeItem *)self saveRequest];
  uint64_t v12 = [v11 replicaManagerProvider];
  [v10 setReplicaManagerProvider:v12];

  v4[2](v4, v10);
  unint64_t v13 = [v10 immutableOrderedSet];
  id v14 = [(REMAccountChangeItem *)self storage];
  [v14 setListIDsMergeableOrdering:v13];

  char v15 = [(REMAccountChangeItem *)self changedKeysObserver];
  [v15 keyDidChange:@"listIDsMergeableOrdering"];
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMAccountStorage)storage
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedKeysObserver, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_saveRequest, 0);
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)capabilities
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "trackedAccountCapabilities is unexpectedly nil when getting accountChangeItem.capabilities {objectID: %{public}@}", v4, v5, v6, v7, 2u);
}

- (void)mergeableOrderingNodesByOrderingMergeableOrderingNodes:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 allKeys];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "Attemped to get ordering of lists not belonging to the provided account {objectIDs: %@}", v4, v5, v6, v7, 2u);
}

- (void)lowLevelRemoveMergeableOrderingNodeIDFromOrdering:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "Tried to remove node not present in ordering list {objectID: %{public}@, ordering: %{public}@}", buf, 0x16u);
}

- (void)test_lowLevelEditOrderingByMovingListObjectID:(uint64_t)a1 toTarget:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 listIDsMergeableOrdering];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v3, v4, "Tried to move list ID not present in ordering list {objectID: %@, ordering: %@}", v5);
}

- (void)test_lowLevelEditOrderingByMovingListObjectID:(uint64_t)a1 toTarget:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSNumber;
  uint64_t v3 = [a2 listIDsMergeableOrdering];
  uint64_t v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v5, v6, "Tried to move list ID beyond bounds of ordering list {objectID: %@, count: %@}", v7);
}

- (void)_lowLevelAddMergeableOrderingNodeToOrdering:(os_log_t)log atIndexOfSibling:isAfter:withParentMergeableOrderingNode:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (mergeableOrderingNode.accountID == nil || ![mergeableOrderingNode.accountID isEqual:self.objectID]) -- mergeableOrderingNode must have been assigned to this account change item at this point", v1, 2u);
}

void __125__REMAccountChangeItem__lowLevelAddMergeableOrderingNodeToOrdering_atIndexOfSibling_isAfter_withParentMergeableOrderingNode___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end