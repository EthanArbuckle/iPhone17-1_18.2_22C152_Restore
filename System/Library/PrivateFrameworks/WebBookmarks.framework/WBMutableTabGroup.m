@interface WBMutableTabGroup
+ (id)localTabGroup;
+ (id)localTabGroupWithUUID:(id)a3;
+ (id)privateTabGroup;
+ (id)unnamedTabGroupWithDeviceIdentifier:(id)a3;
+ (id)unnamedTabGroupWithUUID:(id)a3 profileIdentifier:(id)a4 deviceIdentifier:(id)a5;
- (NSArray)deletedTabs;
- (NSString)deviceUUIDString;
- (WBMutableTabGroup)initWithBookmark:(id)a3 tabs:(id)a4 lastSelectedTabUUID:(id)a5 kind:(int64_t)a6;
- (WBMutableTabGroup)initWithTitle:(id)a3 deviceIdentifier:(id)a4 profileIdentifier:(id)a5;
- (WBSCRDTPosition)syncPosition;
- (id)mutableTabWithUUID:(id)a3;
- (void)_fixLastSelectedTabIfNeeded;
- (void)_performWithMutableTabs:(id)a3;
- (void)appendTabs:(id)a3;
- (void)clearDeletedTabs;
- (void)clearTabs;
- (void)deleteTabs:(id)a3;
- (void)insertTabs:(id)a3 afterTab:(id)a4;
- (void)markBackgroundImageAsModified;
- (void)mergeWithTabGroup:(id)a3;
- (void)removeTab:(id)a3;
- (void)reorderTab:(id)a3 afterTab:(id)a4;
- (void)setDeletedTabs:(id)a3;
- (void)setDeviceUUIDString:(id)a3;
- (void)setDisplayTitleProvider:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(int)a3;
- (void)setKind:(int64_t)a3;
- (void)setLastSelectedTabUUID:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setSyncPosition:(id)a3;
- (void)setSyncable:(BOOL)a3;
- (void)setTabs:(id)a3;
- (void)setTitle:(id)a3;
- (void)truncateToNumberOfTabs:(unint64_t)a3;
- (void)updateLastSelectedTab;
@end

@implementation WBMutableTabGroup

uint64_t __48__WBMutableTabGroup__fixLastSelectedTabIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)_fixLastSelectedTabIfNeeded
{
  id v5 = [(NSArray *)self->super._tabs safari_setByApplyingBlock:&__block_literal_global_11];
  if (([v5 containsObject:self->super._lastSelectedTabUUID] & 1) == 0)
  {
    v3 = [(NSArray *)self->super._tabs lastObject];
    v4 = [v3 uuid];
    [(WBMutableTabGroup *)self setLastSelectedTabUUID:v4];
  }
}

- (void)setLastSelectedTabUUID:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->super._lastSelectedTabUUID] & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    lastSelectedTabUUID = self->super._lastSelectedTabUUID;
    self->super._lastSelectedTabUUID = v4;

    [(WBMutableTabGroup *)self updateLastSelectedTab];
  }
}

- (void)updateLastSelectedTab
{
  [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
  lastSelectedTabUUID = self->super._lastSelectedTabUUID;
  if (lastSelectedTabUUID)
  {
    id v6 = [(WBTabGroup *)self tabWithUUID:self->super._lastSelectedTabUUID];
    uint64_t v4 = [v6 identifier];
  }
  else
  {
    uint64_t v4 = 0x7FFFFFFFLL;
  }
  id v5 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v5 setLastSelectedChildID:v4];

  if (lastSelectedTabUUID)
  {
  }
}

- (NSString)deviceUUIDString
{
  return self->_deviceUUIDString;
}

- (NSArray)deletedTabs
{
  v2 = (void *)[(NSMutableArray *)self->super._deletedTabs copy];
  return (NSArray *)v2;
}

id __29__WBMutableTabGroup_setTabs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = [v2 object];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __29__WBMutableTabGroup_setTabs___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [*(id *)(a1 + 32) differenceFromArray:a2 withOptions:4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = objc_msgSend(v3, "insertions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v9 object];
        if ([v9 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL) {
          [v10 didInsertIntoTabGroup:*(void *)(a1 + 40)];
        }
        else {
          [v10 setMoved:1];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v11 = [v3 removals];
  v12 = objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_5);

  if ([v12 count]) {
    [*(id *)(a1 + 40) _fixLastSelectedTabIfNeeded];
  }
  [*(id *)(*(void *)(a1 + 40) + 24) addObjectsFromArray:v12];
  [v12 makeObjectsPerformSelector:sel_markClean];
  uint64_t v13 = [*(id *)(a1 + 32) mutableCopy];
  uint64_t v14 = *(void *)(a1 + 40);
  v15 = *(void **)(v14 + 8);
  *(void *)(v14 + 8) = v13;
}

- (WBMutableTabGroup)initWithBookmark:(id)a3 tabs:(id)a4 lastSelectedTabUUID:(id)a5 kind:(int64_t)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a4;
  v11 = [(WBTabGroup *)self initWithBookmark:a3 lastSelectedTabUUID:a5 kind:a6];
  if (v11)
  {
    uint64_t v12 = [v10 mutableCopy];
    tabs = v11->super._tabs;
    v11->super._tabs = (NSArray *)v12;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = v11->super._tabs;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18++), "_setPropertiesFromTabGroup:", v11, (void)v21);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    [(WBTabGroup *)v11 _tabsDidChange];
    long long v19 = v11;
  }

  return v11;
}

- (void)setTabs:(id)a3
{
  id v4 = a3;
  if (([v4 isEqual:self->super._tabs] & 1) == 0)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __29__WBMutableTabGroup_setTabs___block_invoke;
    v5[3] = &unk_2643D9FB8;
    id v6 = v4;
    uint64_t v7 = self;
    [(WBMutableTabGroup *)self _performWithMutableTabs:v5];
  }
}

- (void)_performWithMutableTabs:(id)a3
{
  (*((void (**)(id, NSArray *))a3 + 2))(a3, self->super._tabs);
  [(WBTabGroup *)self _tabsDidChange];
}

- (void)setDisplayTitleProvider:(id)a3
{
  id v4 = (void *)[a3 copy];
  id displayTitleProvider = self->super._displayTitleProvider;
  self->super._id displayTitleProvider = v4;
  MEMORY[0x270F9A758](v4, displayTitleProvider);
}

- (void)clearDeletedTabs
{
  v3 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C043000, v3, OS_LOG_TYPE_INFO, "Clearing deleted tabs", v4, 2u);
  }
  [(NSMutableArray *)self->super._deletedTabs removeAllObjects];
}

+ (id)localTabGroup
{
  id v2 = objc_opt_class();
  v3 = [MEMORY[0x263F08C38] UUID];
  id v4 = [v3 UUIDString];
  uint64_t v5 = [v2 localTabGroupWithUUID:v4];

  return v5;
}

+ (id)localTabGroupWithUUID:(id)a3
{
  id v3 = a3;
  id v4 = [[WebBookmark alloc] initFolderWithParentID:0x7FFFFFFFLL collectionType:1];
  [v4 setTitle:@"Local"];
  [v4 _setUUID:v3];

  uint64_t v5 = [(WBTabGroup *)[WBMutableTabGroup alloc] initWithBookmark:v4];
  [(WBMutableTabGroup *)v5 setHidden:1];
  [(WBMutableTabGroup *)v5 setSyncable:0];
  [(WBMutableTabGroup *)v5 setKind:0];

  return v5;
}

+ (id)privateTabGroup
{
  id v2 = [[WebBookmark alloc] initFolderWithParentID:0x7FFFFFFFLL collectionType:1];
  [v2 setTitle:@"Private"];
  id v3 = [(WBTabGroup *)[WBMutableTabGroup alloc] initWithBookmark:v2];
  [(WBMutableTabGroup *)v3 setHidden:1];
  [(WBMutableTabGroup *)v3 setSyncable:0];
  [(WBMutableTabGroup *)v3 setKind:1];

  return v3;
}

+ (id)unnamedTabGroupWithUUID:(id)a3 profileIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[WebBookmark alloc] initFolderWithParentID:0 deviceIdentifier:v8 collectionType:1];

  [v11 setTitle:@"Unnamed"];
  [v11 _setUUID:v10];

  uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithBookmark:v11];
  [v12 setKind:3];
  [v12 setSyncable:1];
  uint64_t v13 = (void *)[v9 copy];

  [v12 setProfileIdentifier:v13];
  return v12;
}

+ (id)unnamedTabGroupWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDeviceIdentifier:v4];

  [v5 setKind:3];
  return v5;
}

- (WBMutableTabGroup)initWithTitle:(id)a3 deviceIdentifier:(id)a4 profileIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08C38];
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v9 UUID];
  uint64_t v13 = [v12 UUIDString];
  uint64_t v14 = [(WBTabGroup *)self initWithTitle:v11 uuid:v13 deviceIdentifier:v10];

  if (v14)
  {
    [(WBMutableTabGroup *)v14 setProfileIdentifier:v8];
    uint64_t v15 = v14;
  }

  return v14;
}

- (void)setIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
  id v5 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v5 _setID:v3];
}

- (void)setSyncable:(BOOL)a3
{
  BOOL v3 = a3;
  [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
  id v5 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v5 _setSyncable:v3];
}

- (void)setKind:(int64_t)a3
{
  if (self->super._kind != a3)
  {
    self->super._kind = a3;
    BOOL v5 = [(WBTabGroup *)self isLocal] || [(WBTabGroup *)self isPrivateBrowsing];
    [(WBMutableTabGroup *)self setHidden:v5];
    [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
    id v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    id v8 = v6;
    if (a3 == 3) {
      uint64_t v7 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v7 = 0;
    }
    [v6 setExtraAttributesValue:v7 forKey:@"IsUnnamed"];
  }
}

- (void)setTitle:(id)a3
{
  bookmarkStorage = self->super._bookmarkStorage;
  id v5 = a3;
  [(WBSCopyOnWriteValue *)bookmarkStorage willModify];
  id v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v6 setTitle:v5];
}

- (void)setDeletedTabs:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->super._deletedTabs] & 1) == 0)
  {
    id v4 = (NSMutableArray *)[v6 mutableCopy];
    deletedTabs = self->super._deletedTabs;
    self->super._deletedTabs = v4;
  }
}

- (void)setProfileIdentifier:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v4 = (NSString *)[v6 copy];
    profileIdentifier = self->super._profileIdentifier;
    self->super._profileIdentifier = v4;
  }
}

- (void)setHidden:(BOOL)a3
{
  if ([(WBTabGroup *)self isHidden] != a3)
  {
    id v4 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    id v5 = [v4 extraAttributes];
    if (v5)
    {
      id v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
      uint64_t v7 = [v6 extraAttributes];
      id v9 = (id)[v7 mutableCopy];
    }
    else
    {
      id v9 = [MEMORY[0x263EFF9A0] dictionary];
    }

    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"com.apple.bookmarks.OmitFromUI"];
    [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
    id v8 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
    [v8 setExtraAttributes:v9];
  }
}

- (void)markBackgroundImageAsModified
{
  [(WBSCopyOnWriteValue *)self->super._bookmarkStorage willModify];
  BOOL v3 = NSNumber;
  id v7 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  id v4 = [v7 backgroundImageModifiedState];
  id v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "BOOLValue") ^ 1);
  id v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v6 setBackgroundImageModifiedState:v5];
}

- (WBSCRDTPosition)syncPosition
{
  id v2 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  BOOL v3 = [v2 syncPosition];

  return (WBSCRDTPosition *)v3;
}

- (void)setSyncPosition:(id)a3
{
  bookmarkStorage = self->super._bookmarkStorage;
  id v5 = a3;
  [(WBSCopyOnWriteValue *)bookmarkStorage willModify];
  id v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  [v6 setSyncPosition:v5];
}

- (id)mutableTabWithUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->super._tabsByUUID objectForKeyedSubscript:a3];
}

- (void)appendTabs:(id)a3
{
  tabs = self->super._tabs;
  id v5 = a3;
  id v6 = [(NSArray *)tabs lastObject];
  [(WBMutableTabGroup *)self insertTabs:v5 afterTab:v6];
}

- (void)clearTabs
{
}

- (void)insertTabs:(id)a3 afterTab:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  id v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    *(_DWORD *)buf = 134217984;
    uint64_t v31 = [v6 count];
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Inserting %zu tabs", buf, 0xCu);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = WBS_LOG_CHANNEL_PREFIXTabGroup();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = v15;
          uint64_t v17 = [v14 privacyPreservingDescription];
          *(_DWORD *)buf = 138543362;
          uint64_t v31 = (uint64_t)v17;
          _os_log_impl(&dword_21C043000, v16, OS_LOG_TYPE_INFO, "Tab marked as added: %{public}@", buf, 0xCu);
        }
        [v14 didInsertIntoTabGroup:self];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __41__WBMutableTabGroup_insertTabs_afterTab___block_invoke;
  v21[3] = &unk_2643D9FE0;
  id v22 = v9;
  long long v23 = self;
  id v24 = v20;
  id v18 = v20;
  id v19 = v9;
  [(WBMutableTabGroup *)self _performWithMutableTabs:v21];
}

void __41__WBMutableTabGroup_insertTabs_afterTab___block_invoke(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  BOOL v3 = (void *)a1[5];
  id v4 = (void *)a1[6];
  id v5 = a2;
  id v7 = [v4 uuid];
  id v6 = [v3 mutableTabWithUUID:v7];
  objc_msgSend(v5, "safari_insertObjects:afterObject:", v2, v6);
}

- (void)deleteTabs:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __32__WBMutableTabGroup_deleteTabs___block_invoke;
  v15[3] = &unk_2643DA008;
  v15[4] = self;
  id v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v15);
  id v6 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    uint64_t v8 = [v4 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v8;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "%zu tabs deleted", buf, 0xCu);
  }
  [v5 makeObjectsPerformSelector:sel_markClean];
  [(NSMutableArray *)self->super._deletedTabs addObjectsFromArray:v5];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __32__WBMutableTabGroup_deleteTabs___block_invoke_8;
  uint64_t v13 = &unk_2643DA030;
  id v14 = v5;
  id v9 = v5;
  [(WBMutableTabGroup *)self _performWithMutableTabs:&v10];
  [(WBMutableTabGroup *)self _fixLastSelectedTabIfNeeded];
}

id __32__WBMutableTabGroup_deleteTabs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 uuid];
  id v4 = [v2 mutableTabWithUUID:v3];

  return v4;
}

uint64_t __32__WBMutableTabGroup_deleteTabs___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 removeObjectsInArray:*(void *)(a1 + 32)];
}

- (void)removeTab:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [v4 privacyPreservingDescription];
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_INFO, "Removing tab %{public}@", buf, 0xCu);
  }
  uint64_t v8 = [v4 uuid];
  id v9 = [(WBMutableTabGroup *)self mutableTabWithUUID:v8];

  [v9 didRemoveFromTabGroup];
  [v9 markClean];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __31__WBMutableTabGroup_removeTab___block_invoke;
  v11[3] = &unk_2643DA030;
  id v12 = v9;
  id v10 = v9;
  [(WBMutableTabGroup *)self _performWithMutableTabs:v11];
}

uint64_t __31__WBMutableTabGroup_removeTab___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)reorderTab:(id)a3 afterTab:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = [v6 privacyPreservingDescription];
    uint64_t v11 = [v7 privacyPreservingDescription];
    *(_DWORD *)buf = 138543618;
    long long v21 = v10;
    __int16 v22 = 2114;
    long long v23 = v11;
    _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Reordering tab %{public}@ after tab %{public}@", buf, 0x16u);
  }
  id v12 = [v6 uuid];
  uint64_t v13 = [(WBMutableTabGroup *)self mutableTabWithUUID:v12];

  if (v13)
  {
    if (v7)
    {
      id v14 = [v7 uuid];
      uint64_t v15 = [(WBMutableTabGroup *)self mutableTabWithUUID:v14];
    }
    else
    {
      uint64_t v15 = 0;
    }
    [v13 setMoved:1];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__WBMutableTabGroup_reorderTab_afterTab___block_invoke;
    v17[3] = &unk_2643D9FB8;
    id v18 = v13;
    id v19 = v15;
    id v16 = v15;
    [(WBMutableTabGroup *)self _performWithMutableTabs:v17];
  }
}

void __41__WBMutableTabGroup_reorderTab_afterTab___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 removeObject:v3];
  objc_msgSend(v4, "safari_insertObject:afterObject:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)truncateToNumberOfTabs:(unint64_t)a3
{
  if ([(NSArray *)self->super._tabs count] >= a3 && [(WBTabGroup *)self isSyncable])
  {
    -[NSArray subarrayWithRange:](self->super._tabs, "subarrayWithRange:", 0, a3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NSArray subarrayWithRange:](self->super._tabs, "subarrayWithRange:", a3, [(NSArray *)self->super._tabs count] - a3);
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    overflowRemoteTabs = self->super._overflowRemoteTabs;
    self->super._overflowRemoteTabs = v5;

    id v7 = (NSArray *)[v9 mutableCopy];
    tabs = self->super._tabs;
    self->super._tabs = v7;

    [(WBTabGroup *)self _tabsDidChange];
  }
}

- (void)mergeWithTabGroup:(id)a3
{
  bookmarkStorage = self->super._bookmarkStorage;
  id v5 = (id *)a3;
  [(WBSCopyOnWriteValue *)bookmarkStorage willModify];
  id v6 = [(WBSCopyOnWriteValue *)self->super._bookmarkStorage value];
  id v7 = [v5[5] value];
  [v6 mergeWithBookmark:v7];

  id v11 = [v5 displayTitleProvider];

  id displayTitleProvider = v11;
  if (!v11) {
    id displayTitleProvider = self->super._displayTitleProvider;
  }
  id v9 = (void *)MEMORY[0x21D4A1230](displayTitleProvider);
  id v10 = self->super._displayTitleProvider;
  self->super._id displayTitleProvider = v9;
}

- (void)setDeviceUUIDString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end