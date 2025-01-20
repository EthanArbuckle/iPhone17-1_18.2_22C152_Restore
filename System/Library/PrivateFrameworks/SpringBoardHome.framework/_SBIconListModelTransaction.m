@interface _SBIconListModelTransaction
- (SBIcon)replacedIcon;
- (SBIcon)replacementIcon;
- (SBIconListModel)listModel;
- (_SBIconListModelTransaction)initWithListModel:(id)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)assertionCount;
- (void)addAddedIcons:(id)a3;
- (void)addAssertion:(id)a3;
- (void)addMovedIcons:(id)a3;
- (void)addNodeIdentifiers:(id)a3;
- (void)addRemovedIcons:(id)a3;
- (void)commitChanges;
- (void)queueNotifyingListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5 didReplaceIcon:(id)a6 withIcon:(id)a7;
- (void)removeAssertion:(id)a3;
- (void)removeNodeIdentifiers:(id)a3;
- (void)setListModel:(id)a3;
- (void)setReplacedIcon:(id)a3;
- (void)setReplacementIcon:(id)a3;
@end

@implementation _SBIconListModelTransaction

- (_SBIconListModelTransaction)initWithListModel:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SBIconListModelTransaction;
  v5 = [(_SBIconListModelTransaction *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listModel, v4);
    uint64_t v7 = objc_opt_new();
    addedNodeIdentifiers = v6->_addedNodeIdentifiers;
    v6->_addedNodeIdentifiers = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    deletedNodeIdentifiers = v6->_deletedNodeIdentifiers;
    v6->_deletedNodeIdentifiers = (NSMutableSet *)v9;
  }
  return v6;
}

- (void)addNodeIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_deletedNodeIdentifiers containsObject:v9]) {
          [(NSMutableSet *)self->_deletedNodeIdentifiers removeObject:v9];
        }
        else {
          [(NSMutableSet *)self->_addedNodeIdentifiers addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)removeNodeIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_addedNodeIdentifiers containsObject:v9]) {
          [(NSMutableSet *)self->_addedNodeIdentifiers removeObject:v9];
        }
        else {
          [(NSMutableSet *)self->_deletedNodeIdentifiers addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)addAssertion:(id)a3
{
  id v4 = a3;
  coalesceChangesAssertions = self->_coalesceChangesAssertions;
  id v8 = v4;
  if (!coalesceChangesAssertions)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    uint64_t v7 = self->_coalesceChangesAssertions;
    self->_coalesceChangesAssertions = v6;

    id v4 = v8;
    coalesceChangesAssertions = self->_coalesceChangesAssertions;
  }
  [(NSPointerArray *)coalesceChangesAssertions addPointer:v4];
}

- (void)removeAssertion:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(NSPointerArray *)self->_coalesceChangesAssertions count];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSPointerArray *)self->_coalesceChangesAssertions pointerAtIndex:v6];
      if (v7 == v8) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_coalesceChangesAssertions removePointerAtIndex:v6];
  }
LABEL_7:
}

- (unint64_t)assertionCount
{
  return [(NSPointerArray *)self->_coalesceChangesAssertions count];
}

- (void)queueNotifyingListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5 didReplaceIcon:(id)a6 withIcon:(id)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12) {
    [(_SBIconListModelTransaction *)self addAddedIcons:v12];
  }
  if (v13) {
    [(_SBIconListModelTransaction *)self addRemovedIcons:v13];
  }
  if (v14) {
    [(_SBIconListModelTransaction *)self addMovedIcons:v14];
  }
  if (v15)
  {
    uint64_t v17 = [(_SBIconListModelTransaction *)self replacedIcon];
    v18 = (void *)v17;
    if (v17)
    {
      v24[0] = v17;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [(_SBIconListModelTransaction *)self addRemovedIcons:v19];
    }
    [(_SBIconListModelTransaction *)self setReplacedIcon:v15];
  }
  if (v16)
  {
    uint64_t v20 = [(_SBIconListModelTransaction *)self replacementIcon];
    v21 = (void *)v20;
    if (v20)
    {
      uint64_t v23 = v20;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
      [(_SBIconListModelTransaction *)self addAddedIcons:v22];
    }
    [(_SBIconListModelTransaction *)self setReplacementIcon:v16];
  }
}

- (void)addAddedIcons:(id)a3
{
  id v4 = a3;
  addedIcons = self->_addedIcons;
  id v8 = v4;
  if (!addedIcons)
  {
    uint64_t v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v7 = self->_addedIcons;
    self->_addedIcons = v6;

    id v4 = v8;
    addedIcons = self->_addedIcons;
  }
  [(NSMutableOrderedSet *)addedIcons addObjectsFromArray:v4];
  [(NSMutableOrderedSet *)self->_removedIcons removeObjectsInArray:v8];
}

- (void)addRemovedIcons:(id)a3
{
  id v4 = a3;
  removedIcons = self->_removedIcons;
  id v8 = v4;
  if (!removedIcons)
  {
    uint64_t v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v7 = self->_removedIcons;
    self->_removedIcons = v6;

    id v4 = v8;
    removedIcons = self->_removedIcons;
  }
  [(NSMutableOrderedSet *)removedIcons addObjectsFromArray:v4];
  [(NSMutableOrderedSet *)self->_addedIcons removeObjectsInArray:v8];
}

- (void)addMovedIcons:(id)a3
{
  id v4 = a3;
  movedIcons = self->_movedIcons;
  id v8 = v4;
  if (!movedIcons)
  {
    uint64_t v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v7 = self->_movedIcons;
    self->_movedIcons = v6;

    id v4 = v8;
    movedIcons = self->_movedIcons;
  }
  [(NSMutableOrderedSet *)movedIcons addObjectsFromArray:v4];
}

- (void)commitChanges
{
  v3 = [(_SBIconListModelTransaction *)self listModel];
  id v4 = (void *)[(NSMutableSet *)self->_addedNodeIdentifiers copy];
  NSUInteger v5 = (void *)[(NSMutableSet *)self->_deletedNodeIdentifiers copy];
  uint64_t v6 = [v4 count];
  uint64_t v7 = [v5 count];
  if (v6 | v7)
  {
    BOOL v8 = v7 != 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __44___SBIconListModelTransaction_commitChanges__block_invoke;
    v22[3] = &unk_1E6AB22D8;
    BOOL v26 = v6 != 0;
    id v23 = v3;
    id v24 = v4;
    BOOL v27 = v8;
    id v25 = v5;
    [v23 enumerateNodeObserversUsingBlock:v22];
  }
  uint64_t v9 = [(NSMutableOrderedSet *)self->_addedIcons array];
  long long v10 = [(NSMutableOrderedSet *)self->_removedIcons array];
  long long v11 = [(NSMutableOrderedSet *)self->_movedIcons array];
  id v12 = [(_SBIconListModelTransaction *)self replacedIcon];
  uint64_t v13 = [(_SBIconListModelTransaction *)self replacementIcon];
  id v14 = (void *)v13;
  if (v9 || v10 || v11 || v12 || v13)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44___SBIconListModelTransaction_commitChanges__block_invoke_2;
    v15[3] = &unk_1E6AB22B0;
    id v16 = v3;
    id v17 = v9;
    id v18 = v10;
    id v19 = v11;
    id v20 = v12;
    id v21 = v14;
    [v16 _notifyListObservers:v15];
  }
}

- (id)description
{
  return [(_SBIconListModelTransaction *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBIconListModelTransaction *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBIconListModelTransaction *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(_SBIconListModelTransaction *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_addedNodeIdentifiers withName:@"addedNodeIdentifiers"];
  id v6 = (id)[v4 appendObject:self->_deletedNodeIdentifiers withName:@"removedNodeIdentifiers"];
  id v7 = (id)[v4 appendObject:self->_addedIcons withName:@"addedIcons" skipIfNil:1];
  id v8 = (id)[v4 appendObject:self->_removedIcons withName:@"removedIcons" skipIfNil:1];
  id v9 = (id)[v4 appendObject:self->_movedIcons withName:@"movedIcons" skipIfNil:1];
  id v10 = (id)[v4 appendObject:self->_movedIcons withName:@"movedIcons" skipIfNil:1];
  id v11 = (id)[v4 appendObject:self->_replacedIcon withName:@"replacedIcon" skipIfNil:1];
  id v12 = (id)[v4 appendObject:self->_replacementIcon withName:@"replacementIcon" skipIfNil:1];
  uint64_t v13 = [(NSPointerArray *)self->_coalesceChangesAssertions allObjects];
  id v14 = objc_msgSend(v13, "bs_compactMap:", &__block_literal_global_1114);

  id v15 = (id)[v4 appendObject:v14 withName:@"reasons"];
  return v4;
}

- (SBIconListModel)listModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listModel);
  return (SBIconListModel *)WeakRetained;
}

- (void)setListModel:(id)a3
{
}

- (SBIcon)replacedIcon
{
  return self->_replacedIcon;
}

- (void)setReplacedIcon:(id)a3
{
}

- (SBIcon)replacementIcon
{
  return self->_replacementIcon;
}

- (void)setReplacementIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementIcon, 0);
  objc_storeStrong((id *)&self->_replacedIcon, 0);
  objc_destroyWeak((id *)&self->_listModel);
  objc_storeStrong((id *)&self->_movedIcons, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
  objc_storeStrong((id *)&self->_addedIcons, 0);
  objc_storeStrong((id *)&self->_coalesceChangesAssertions, 0);
  objc_storeStrong((id *)&self->_deletedNodeIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedNodeIdentifiers, 0);
}

@end