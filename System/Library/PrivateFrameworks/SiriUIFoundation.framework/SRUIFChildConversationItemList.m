@interface SRUIFChildConversationItemList
- (BOOL)itemIsRestoredAtIndex:(int64_t)a3;
- (NSUUID)_parentItemIdentifier;
- (SRUIFChildConversationItemList)initWithConversation:(id)a3 parentItemIdentifier:(id)a4;
- (SRUIFConversation)_conversation;
- (id)_identifierOfItemAtIndex:(int64_t)a3;
- (id)_indexPathForItemAtIndex:(int64_t)a3;
- (id)_indexPathForLastRestoredItem;
- (id)identifiersForItemsAtIndexes:(id)a3;
- (id)itemAtIndex:(int64_t)a3;
- (id)itemWithIdentifier:(id)a3;
- (int64_t)numberOfItems;
- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6;
- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5;
- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemAtIndex:(int64_t)a6;
- (void)removeItemsAtIndexes:(id)a3;
- (void)removeItemsWithIdentifiers:(id)a3;
@end

@implementation SRUIFChildConversationItemList

- (SRUIFChildConversationItemList)initWithConversation:(id)a3 parentItemIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRUIFChildConversationItemList;
  v9 = [(SRUIFChildConversationItemList *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversation, a3);
    uint64_t v11 = [v8 copy];
    parentItemIdentifier = v10->_parentItemIdentifier;
    v10->_parentItemIdentifier = (NSUUID *)v11;
  }
  return v10;
}

- (int64_t)numberOfItems
{
  v3 = [(SRUIFChildConversationItemList *)self _conversation];
  v4 = [(SRUIFChildConversationItemList *)self _parentItemIdentifier];
  int64_t v5 = [v3 numberOfChildrenForItemWithIdentifier:v4];

  return v5;
}

- (id)itemAtIndex:(int64_t)a3
{
  int64_t v5 = [(SRUIFChildConversationItemList *)self _conversation];
  v6 = [(SRUIFChildConversationItemList *)self _indexPathForItemAtIndex:a3];
  id v7 = [v5 itemAtIndexPath:v6];

  return v7;
}

- (id)itemWithIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SRUIFChildConversationItemList *)self _conversation];
  v6 = [v5 itemWithIdentifier:v4];

  id v7 = [v6 identifier];
  id v8 = [v5 parentOfItemWithIdentifier:v7];

  v9 = [v8 identifier];
  uint64_t v10 = [(SRUIFChildConversationItemList *)self _parentItemIdentifier];
  if (v9 == (void *)v10)
  {
  }
  else
  {
    uint64_t v11 = (void *)v10;
    v12 = [v8 identifier];
    v13 = [(SRUIFChildConversationItemList *)self _parentItemIdentifier];
    char v14 = [v12 isEqual:v13];

    if (v14) {
      goto LABEL_6;
    }
    v9 = v6;
    v6 = 0;
  }

LABEL_6:
  return v6;
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5
{
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemAtIndex:(int64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [(SRUIFChildConversationItemList *)self _identifierOfItemAtIndex:a6];
  [(SRUIFChildConversationItemList *)self _addItemsForAceObjects:v11 type:a4 dialogPhase:v10 asChildrenOfItemWithIdentifier:v12];
}

- (id)identifiersForItemsAtIndexes:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__SRUIFChildConversationItemList_identifiersForItemsAtIndexes___block_invoke;
  v10[3] = &unk_264785AF0;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v5 enumerateIndexesUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __63__SRUIFChildConversationItemList_identifiersForItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _identifierOfItemAtIndex:a2];
  [v2 addObject:v3];
}

- (void)removeItemsAtIndexes:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __55__SRUIFChildConversationItemList_removeItemsAtIndexes___block_invoke;
  id v12 = &unk_264785AF0;
  id v13 = v6;
  char v14 = self;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v9];

  id v8 = [(SRUIFChildConversationItemList *)self _conversation];
  [v8 removeItemsWithIdentifiers:v7];
}

void __55__SRUIFChildConversationItemList_removeItemsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _identifierOfItemAtIndex:a2];
  [v2 addObject:v3];
}

- (void)removeItemsWithIdentifiers:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __61__SRUIFChildConversationItemList_removeItemsWithIdentifiers___block_invoke;
  id v12 = &unk_264785B18;
  id v13 = self;
  id v14 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v9];

  id v8 = [(SRUIFChildConversationItemList *)self _conversation];
  [v8 removeItemsWithIdentifiers:v7];
}

void __61__SRUIFChildConversationItemList_removeItemsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) _conversation];
  int v4 = [v3 hasItemWithIdentifier:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (BOOL)itemIsRestoredAtIndex:(int64_t)a3
{
  id v5 = [(SRUIFChildConversationItemList *)self _indexPathForLastRestoredItem];
  if (v5)
  {
    v6 = [(SRUIFChildConversationItemList *)self _indexPathForItemAtIndex:a3];
    BOOL v7 = [v6 compare:v5] != 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_identifierOfItemAtIndex:(int64_t)a3
{
  id v3 = [(SRUIFChildConversationItemList *)self itemAtIndex:a3];
  int v4 = [v3 identifier];

  return v4;
}

- (id)_indexPathForItemAtIndex:(int64_t)a3
{
  id v5 = [(SRUIFChildConversationItemList *)self _conversation];
  v6 = [(SRUIFChildConversationItemList *)self _parentItemIdentifier];
  BOOL v7 = [v5 indexPathForItemWithIdentifier:v6];
  id v8 = [v7 indexPathByAddingIndex:a3];

  return v8;
}

- (id)_indexPathForLastRestoredItem
{
  v2 = [(SRUIFChildConversationItemList *)self _conversation];
  id v3 = [v2 lastRestoredItem];
  int v4 = v3;
  if (v3
    && ([v3 identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v2 hasItemWithIdentifier:v5],
        v5,
        v6))
  {
    BOOL v7 = [v4 identifier];
    id v8 = [v2 indexPathForItemWithIdentifier:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(SRUIFChildConversationItemList *)self _conversation];
  [v13 addItemsForAceObjects:v12 type:a4 dialogPhase:v11 asChildrenOfItemWithIdentifier:v10];
}

- (SRUIFConversation)_conversation
{
  return self->_conversation;
}

- (NSUUID)_parentItemIdentifier
{
  return self->_parentItemIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end