@interface REMListSublistContextChangeItem
- (REMListChangeItem)listChangeItem;
- (REMListSublistContextChangeItem)initWithListChangeItem:(id)a3;
- (id)_accountChangeItem;
- (void)_insertMergeableOrderingNode:(id)a3 adjacentToMergeableOrderingNode:(id)a4 isAfter:(BOOL)a5;
- (void)addListChangeItem:(id)a3;
- (void)addMergeableOrderingNode:(id)a3;
- (void)addSmartListChangeItem:(id)a3;
- (void)insertListChangeItem:(id)a3 afterListChangeItem:(id)a4;
- (void)insertListChangeItem:(id)a3 beforeListChangeItem:(id)a4;
- (void)insertMergeableOrderingNode:(id)a3 afterMergeableOrderingNode:(id)a4;
- (void)insertMergeableOrderingNode:(id)a3 beforeMergeableOrderingNode:(id)a4;
- (void)insertSmartListChangeItem:(id)a3 afterSmartListChangeItem:(id)a4;
- (void)insertSmartListChangeItem:(id)a3 beforeSmartListChangeItem:(id)a4;
- (void)setListChangeItem:(id)a3;
- (void)undeleteChildListWithID:(id)a3 usingUndo:(id)a4;
- (void)undeleteChildSmartListWithID:(id)a3 usingUndo:(id)a4;
@end

@implementation REMListSublistContextChangeItem

- (REMListSublistContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSublistContextChangeItem;
  v6 = [(REMListSublistContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listChangeItem, a3);
  }

  return v7;
}

- (void)addListChangeItem:(id)a3
{
}

- (void)insertListChangeItem:(id)a3 beforeListChangeItem:(id)a4
{
}

- (void)insertListChangeItem:(id)a3 afterListChangeItem:(id)a4
{
}

- (void)_insertMergeableOrderingNode:(id)a3 adjacentToMergeableOrderingNode:(id)a4 isAfter:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isSubContainer])
  {
    v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[REMListSublistContextChangeItem _insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:]();
    }
  }
  v11 = [(REMListSublistContextChangeItem *)self listChangeItem];
  v12 = [v11 saveRequest];
  v13 = [(REMListSublistContextChangeItem *)self listChangeItem];
  v14 = [v12 _updateAccountWithListChangeItem:v13];

  v15 = [(REMListSublistContextChangeItem *)self listChangeItem];
  [v14 insertMergeableOrderingNode:v8 adjacentToMergeableOrderingNode:v9 isAfter:v5 withParentMergeableOrderingNode:v15];
}

- (void)addSmartListChangeItem:(id)a3
{
  id v4 = a3;
  [v4 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem addSmartListChangeItem:]"];
  [(REMListSublistContextChangeItem *)self _insertMergeableOrderingNode:v4 adjacentToMergeableOrderingNode:0 isAfter:0];
}

- (void)insertSmartListChangeItem:(id)a3 beforeSmartListChangeItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:]"];
  [v6 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem insertSmartListChangeItem:beforeSmartListChangeItem:] (sibling)"];
  [(REMListSublistContextChangeItem *)self _insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:0];
}

- (void)insertSmartListChangeItem:(id)a3 afterSmartListChangeItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem insertSmartListChangeItem:afterSmartListChangeItem:]"];
  [v6 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem insertSmartListChangeItem:afterSmartListChangeItem:] (sibling)"];
  [(REMListSublistContextChangeItem *)self _insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:1];
}

- (void)addMergeableOrderingNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem addMergeableOrderingNode:]"];
  }
  [(REMListSublistContextChangeItem *)self _insertMergeableOrderingNode:v4 adjacentToMergeableOrderingNode:0 isAfter:0];
}

- (void)insertMergeableOrderingNode:(id)a3 beforeMergeableOrderingNode:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:]"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 assertIsCustomSmartListWithAction:@"-[REMListSublistContextChangeItem insertMergeableOrderingNode:beforeMergeableOrderingNode:] (sibling)"];
  }
  [(REMListSublistContextChangeItem *)self _insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:0];
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
  [(REMListSublistContextChangeItem *)self _insertMergeableOrderingNode:v7 adjacentToMergeableOrderingNode:v6 isAfter:1];
}

- (void)undeleteChildListWithID:(id)a3 usingUndo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMListSublistContextChangeItem *)self _accountChangeItem];
  [v8 undeleteListWithID:v7 usingUndo:v6];

  id v12 = [(REMListSublistContextChangeItem *)self listChangeItem];
  id v9 = [v12 childListIDsToUndelete];
  v10 = [v9 setByAddingObject:v7];

  v11 = [(REMListSublistContextChangeItem *)self listChangeItem];
  [v11 setChildListIDsToUndelete:v10];
}

- (void)undeleteChildSmartListWithID:(id)a3 usingUndo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMListSublistContextChangeItem *)self _accountChangeItem];
  [v8 undeleteSmartListWithID:v7 usingUndo:v6];

  id v12 = [(REMListSublistContextChangeItem *)self listChangeItem];
  id v9 = [v12 childSmartListIDsToUndelete];
  v10 = [v9 setByAddingObject:v7];

  v11 = [(REMListSublistContextChangeItem *)self listChangeItem];
  [v11 setChildSmartListIDsToUndelete:v10];
}

- (id)_accountChangeItem
{
  v3 = [(REMListSublistContextChangeItem *)self listChangeItem];
  id v4 = [v3 saveRequest];
  BOOL v5 = [(REMListSublistContextChangeItem *)self listChangeItem];
  id v6 = [v4 _updateAccountWithListChangeItem:v5];

  return v6;
}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_insertMergeableOrderingNode:adjacentToMergeableOrderingNode:isAfter:.cold.1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [v1 remObjectID];
  v3 = [v0 listChangeItem];
  id v4 = [v3 objectID];
  int v7 = 138543618;
  id v8 = v2;
  __int16 v9 = 2114;
  v10 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1B9AA2000, v5, v6, "Nested group is not supported {orderingNodeObjectID: %{public}@, parentListID: %{public}@}", (uint8_t *)&v7);
}

@end