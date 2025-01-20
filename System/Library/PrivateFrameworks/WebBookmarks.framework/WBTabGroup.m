@interface WBTabGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)_isMutable;
- (BOOL)hasDynamicTitle;
- (BOOL)hasSameKindAsTabGroup:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isIdentical:(id)a3;
- (BOOL)isInDefaultProfile;
- (BOOL)isInserted;
- (BOOL)isLocal;
- (BOOL)isNamed;
- (BOOL)isPrivateBrowsing;
- (BOOL)isShared;
- (BOOL)isSyncable;
- (BOOL)isTabPinnable:(id)a3;
- (BOOL)isUnnamed;
- (BOOL)supportsDeviceTabs;
- (BOOL)tabsAreIdentical:(id)a3;
- (BOOL)usesGlobalPinnedTabs;
- (Class)_tabClass;
- (NSArray)allTabs;
- (NSArray)overflowRemoteTabs;
- (NSArray)tabs;
- (NSArray)unpinnedTabs;
- (NSDictionary)dictionaryRepresentation;
- (NSSet)emptyTabsUUIDSet;
- (NSSet)tabsUUIDSet;
- (NSString)debugRecursiveSyncDescription;
- (NSString)debugSyncDescription;
- (NSString)description;
- (NSString)deviceIdentifier;
- (NSString)displayTitle;
- (NSString)htmlString;
- (NSString)lastSelectedTabUUID;
- (NSString)privacyPreservingDescription;
- (NSString)profileIdentifier;
- (NSString)serverID;
- (NSString)title;
- (NSString)uuid;
- (NSURL)representativeURL;
- (WBSCRDTPosition)syncPosition;
- (WBTab)firstUnpinnedTab;
- (WBTab)lastPinnedTab;
- (WBTab)pinnedStartPage;
- (WBTabGroup)init;
- (WBTabGroup)initWithBookmark:(id)a3;
- (WBTabGroup)initWithBookmark:(id)a3 lastSelectedTabUUID:(id)a4;
- (WBTabGroup)initWithBookmark:(id)a3 lastSelectedTabUUID:(id)a4 kind:(int64_t)a5;
- (WBTabGroup)initWithBookmarkStorage:(id)a3 lastSelectedTabUUID:(id)a4 kind:(int64_t)a5;
- (WBTabGroup)initWithCoder:(id)a3;
- (WBTabGroup)initWithDeviceIdentifier:(id)a3;
- (WBTabGroup)initWithDictionaryRepresentation:(id)a3;
- (WBTabGroup)initWithTitle:(id)a3 deviceIdentifier:(id)a4;
- (WBTabGroup)initWithTitle:(id)a3 uuid:(id)a4 deviceIdentifier:(id)a5;
- (WebBookmark)bookmark;
- (id)_copyWithZone:(_NSZone *)a3 isMutable:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayTitleProvider;
- (id)lastPinnedTabExcluding:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)tabWithUUID:(id)a3;
- (int)identifier;
- (int64_t)kind;
- (unint64_t)hash;
- (void)_tabsDidChange;
- (void)_updateTabLookupTable;
- (void)detectDuplicatedTabs;
- (void)encodeWithCoder:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setKind:(int64_t)a3;
@end

@implementation WBTabGroup

uint64_t __35__WBTabGroup__updateTabLookupTable__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (BOOL)usesGlobalPinnedTabs
{
  return ![(WBTabGroup *)self isNamed];
}

- (BOOL)isNamed
{
  return self->_kind == 2;
}

- (BOOL)isInDefaultProfile
{
  return [(NSString *)self->_profileIdentifier isEqualToString:*MEMORY[0x263F66420]];
}

- (BOOL)isShared
{
  BOOL v3 = [(WBTabGroup *)self isSyncable];
  if (v3)
  {
    v4 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
    char v5 = [v4 hasShareRecord];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isSyncable
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 isSyncable];

  return v3;
}

- (id)tabWithUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_tabsByUUID objectForKeyedSubscript:a3];
}

- (WebBookmark)bookmark
{
  [(WBSCopyOnWriteValue *)self->_bookmarkStorage willModify];
  bookmarkStorage = self->_bookmarkStorage;
  return (WebBookmark *)[(WBSCopyOnWriteValue *)bookmarkStorage value];
}

- (NSString)uuid
{
  v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 UUID];

  return (NSString *)v3;
}

- (NSArray)allTabs
{
  NSUInteger v3 = [(NSArray *)self->_overflowRemoteTabs count];
  v4 = [(WBTabGroup *)self tabs];
  if (v3)
  {
    char v5 = [(WBTabGroup *)self overflowRemoteTabs];
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    v4 = (void *)v6;
  }
  return (NSArray *)v4;
}

- (WBTab)pinnedStartPage
{
  v2 = [(WBTabGroup *)self tabs];
  uint64_t v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_60];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    char v5 = [v2 objectAtIndexedSubscript:v3];
    v4 = (void *)[v5 copy];
  }
  return (WBTab *)v4;
}

- (NSArray)tabs
{
  return self->_tabs;
}

- (WBTab)firstUnpinnedTab
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_tabs;
  uint64_t v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (!objc_msgSend(v6, "isPinned", (void)v8))
        {
          uint64_t v3 = (void *)[v6 copy];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (WBTab *)v3;
}

BOOL __29__WBTabGroup_pinnedStartPage__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPinned])
  {
    uint64_t v3 = [v2 pinnedURL];
    BOOL v4 = v3 == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (NSString)displayTitle
{
  displayTitleProvider = (void (**)(id, SEL))self->_displayTitleProvider;
  if (displayTitleProvider) {
    displayTitleProvider[2](displayTitleProvider, a2);
  }
  else {
  BOOL v4 = [(WBTabGroup *)self title];
  }
  return (NSString *)v4;
}

- (NSArray)unpinnedTabs
{
  cachedUnpinnedTabs = self->_cachedUnpinnedTabs;
  if (!cachedUnpinnedTabs)
  {
    BOOL v4 = [(WBTabGroup *)self tabs];
    objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_62_0);
    char v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_cachedUnpinnedTabs;
    self->_cachedUnpinnedTabs = v5;

    cachedUnpinnedTabs = self->_cachedUnpinnedTabs;
  }
  return cachedUnpinnedTabs;
}

- (NSSet)tabsUUIDSet
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(NSArray *)self->_tabs safari_mapAndFilterObjectsUsingBlock:&__block_literal_global_52];
  BOOL v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

id __25__WBTabGroup_tabsUUIDSet__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F08C38];
  id v3 = a2;
  id v4 = [v2 alloc];
  char v5 = [v3 uuid];

  uint64_t v6 = (void *)[v4 initWithUUIDString:v5];
  return v6;
}

- (WBTabGroup)initWithBookmark:(id)a3 lastSelectedTabUUID:(id)a4 kind:(int64_t)a5
{
  long long v8 = (objc_class *)MEMORY[0x263F66280];
  id v9 = a4;
  id v10 = a3;
  long long v11 = (void *)[[v8 alloc] initWithValue:v10];

  v12 = [(WBTabGroup *)self initWithBookmarkStorage:v11 lastSelectedTabUUID:v9 kind:a5];
  return v12;
}

- (WBTabGroup)initWithBookmarkStorage:(id)a3 lastSelectedTabUUID:(id)a4 kind:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WBTabGroup;
  long long v11 = [(WBTabGroup *)&v29 init];
  if (v11
    && ([v9 value],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isFolder],
        v12,
        v13))
  {
    objc_opt_class();
    v11->_isMutable = objc_opt_isKindOfClass() & 1;
    v14 = objc_opt_class();
    objc_storeStrong((id *)&v11->_tabClass, v14);
    objc_storeStrong((id *)&v11->_bookmarkStorage, a3);
    uint64_t v15 = [v10 copy];
    lastSelectedTabUUID = v11->_lastSelectedTabUUID;
    v11->_lastSelectedTabUUID = (NSString *)v15;

    v17 = (id *)0x263EFF8C0;
    if (v11->_isMutable) {
      v17 = (id *)0x263EFF980;
    }
    uint64_t v18 = [*v17 array];
    tabs = v11->_tabs;
    v11->_tabs = (NSArray *)v18;

    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    tabsByUUID = v11->_tabsByUUID;
    v11->_tabsByUUID = (NSMutableDictionary *)v20;

    v11->_kind = a5;
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    deletedTabs = v11->_deletedTabs;
    v11->_deletedTabs = v22;

    objc_storeStrong((id *)&v11->_profileIdentifier, (id)*MEMORY[0x263F66420]);
    v24 = [(WBTabGroup *)v11 uuid];
    if (!v24
      || (v25 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v24],
          v25,
          !v25))
    {
      v26 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[WBTab initWithBookmarkStorage:](v26, v11);
      }
    }
    v27 = v11;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (void)_tabsDidChange
{
  [(WBTabGroup *)self _updateTabLookupTable];
  cachedUnpinnedTabs = self->_cachedUnpinnedTabs;
  self->_cachedUnpinnedTabs = 0;
}

- (void)_updateTabLookupTable
{
  id v5 = [(NSArray *)self->_tabs safari_mapObjectsUsingBlock:&__block_literal_global_21];
  id v3 = [MEMORY[0x263EFF9A0] dictionaryWithObjects:self->_tabs forKeys:v5];
  tabsByUUID = self->_tabsByUUID;
  self->_tabsByUUID = v3;
}

- (BOOL)isLocal
{
  return self->_kind == 0;
}

- (BOOL)hasDynamicTitle
{
  if (self->_displayTitleProvider) {
    return ![(WBTabGroup *)self isPrivateBrowsing];
  }
  else {
    return 0;
  }
}

- (BOOL)isPrivateBrowsing
{
  return self->_kind == 1;
}

- (BOOL)isUnnamed
{
  return self->_kind == 3;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

uint64_t __26__WBTabGroup_unpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBTabGroup *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WBTabGroup *)v4 uuid];
      uint64_t v6 = [(WBTabGroup *)self uuid];
      char v7 = WBSIsEqual();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (WBTabGroup)init
{
  return 0;
}

- (WBTabGroup)initWithDeviceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[WebBookmark alloc] initFolderWithParentID:0 deviceIdentifier:v4 collectionType:1];

  uint64_t v6 = [(WBTabGroup *)self initWithBookmark:v5];
  return v6;
}

- (WBTabGroup)initWithTitle:(id)a3 deviceIdentifier:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [v9 UUIDString];
  long long v11 = [(WBTabGroup *)self initWithTitle:v8 uuid:v10 deviceIdentifier:v7];

  return v11;
}

- (WBTabGroup)initWithTitle:(id)a3 uuid:(id)a4 deviceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[WebBookmark alloc] initFolderWithParentID:0 deviceIdentifier:v8 collectionType:1];

  [v11 setTitle:v10];
  [v11 _setUUID:v9];

  v12 = [(WBTabGroup *)self initWithBookmark:v11];
  return v12;
}

- (WBTabGroup)initWithBookmark:(id)a3
{
  return [(WBTabGroup *)self initWithBookmark:a3 lastSelectedTabUUID:0];
}

- (WBTabGroup)initWithBookmark:(id)a3 lastSelectedTabUUID:(id)a4
{
  return [(WBTabGroup *)self initWithBookmark:a3 lastSelectedTabUUID:a4 kind:2];
}

- (unint64_t)hash
{
  id v2 = [(WBTabGroup *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_copyWithZone:(_NSZone *)a3 isMutable:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)[(WBSCopyOnWriteValue *)self->_bookmarkStorage copy];
  id v8 = &off_2643D9550;
  if (!v4) {
    id v8 = off_2643D9658;
  }
  uint64_t v9 = [[(__objc2_class *)*v8 allocWithZone:a3] initWithBookmarkStorage:v7 lastSelectedTabUUID:self->_lastSelectedTabUUID kind:self->_kind];
  uint64_t v10 = MEMORY[0x21D4A1230](self->_displayTitleProvider);
  id v11 = *(void **)(v9 + 64);
  *(void *)(v9 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_profileIdentifier copy];
  int v13 = *(void **)(v9 + 72);
  *(void *)(v9 + 72) = v12;

  if (v4)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x263EFF980], "safari_arrayWithArray:copyAction:", self->_tabs, 2);
    uint64_t v15 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v14;

    objc_msgSend(MEMORY[0x263EFF8C0], "safari_arrayWithArray:copyAction:", self->_overflowRemoteTabs, 2);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_isMutable)
  {
    uint64_t v17 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_tabs copyItems:1];
    uint64_t v18 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v17;

    v16 = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_overflowRemoteTabs copyItems:1];
  }
  else
  {
    objc_storeStrong((id *)(v9 + 8), self->_tabs);
    v16 = self->_overflowRemoteTabs;
  }
  v19 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v16;

  uint64_t v20 = [(NSMutableArray *)self->_deletedTabs mutableCopy];
  v21 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v20;

  [(id)v9 _tabsDidChange];
  return (id)v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_isMutable) {
    return [(WBTabGroup *)self _copyWithZone:a3 isMutable:0];
  }
  else {
    return self;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return [(WBTabGroup *)self _copyWithZone:a3 isMutable:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBTabGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bookmark"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSelectedTabUUID"];
  id v7 = -[WBTabGroup initWithBookmark:lastSelectedTabUUID:kind:](self, "initWithBookmark:lastSelectedTabUUID:kind:", v5, v6, [v4 decodeIntegerForKey:@"type"]);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"tabs"];

    if (v7->_isMutable) {
      uint64_t v13 = [v12 mutableCopy];
    }
    else {
      uint64_t v13 = [v12 copy];
    }
    tabs = v7->_tabs;
    v7->_tabs = (NSArray *)v13;

    [(WBTabGroup *)v7 _tabsDidChange];
    uint64_t v15 = v7;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  bookmarkStorage = self->_bookmarkStorage;
  id v6 = a3;
  id v5 = [(WBSCopyOnWriteValue *)bookmarkStorage value];
  [v6 encodeObject:v5 forKey:@"bookmark"];

  [v6 encodeObject:self->_tabs forKey:@"tabs"];
  [v6 encodeObject:self->_lastSelectedTabUUID forKey:@"lastSelectedTabUUID"];
  [v6 encodeInteger:self->_kind forKey:@"type"];
}

- (WBTabGroup)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [WebBookmark alloc];
  id v6 = objc_msgSend(v4, "safari_dictionaryForKey:", @"bookmark");
  id v7 = [(WebBookmark *)v5 initWithDictionaryRepresentationForInMemoryChangeTracking:v6];

  id v8 = objc_msgSend(v4, "safari_stringForKey:", @"lastSelectedTabUUID");
  if (![v8 length])
  {

    id v8 = 0;
  }
  uint64_t v9 = objc_msgSend(v4, "safari_numberForKey:", @"type");
  uint64_t v10 = [v9 integerValue];

  id v11 = [(WBTabGroup *)self initWithBookmark:v7 lastSelectedTabUUID:v8 kind:v10];
  if (v11)
  {
    uint64_t v12 = objc_msgSend(v4, "safari_arrayForKey:", @"tabs");
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __47__WBTabGroup_initWithDictionaryRepresentation___block_invoke;
    v19[3] = &unk_2643DBB18;
    uint64_t v13 = v11;
    uint64_t v20 = v13;
    uint64_t v14 = objc_msgSend(v12, "safari_mapObjectsUsingBlock:", v19);

    if (v13->_isMutable) {
      uint64_t v15 = [v14 mutableCopy];
    }
    else {
      uint64_t v15 = [v14 copy];
    }
    tabs = v13->_tabs;
    v13->_tabs = (NSArray *)v15;

    [(WBTabGroup *)v13 _tabsDidChange];
    uint64_t v17 = v13;
  }
  return v11;
}

id __47__WBTabGroup_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v2, "_tabClass")), "initWithDictionaryRepresentation:", v3);

  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  v12[4] = *MEMORY[0x263EF8340];
  v11[0] = @"bookmark";
  id v3 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  uint64_t v4 = [v3 dictionaryRepresentationForInMemoryChangeTracking];
  id v5 = (void *)v4;
  lastSelectedTabUUID = (__CFString *)self->_lastSelectedTabUUID;
  if (!lastSelectedTabUUID) {
    lastSelectedTabUUID = &stru_26CC2ED50;
  }
  v12[0] = v4;
  v12[1] = lastSelectedTabUUID;
  v11[1] = @"lastSelectedTabUUID";
  v11[2] = @"tabs";
  id v7 = [(NSArray *)self->_tabs valueForKey:@"dictionaryRepresentation"];
  v12[2] = v7;
  v11[3] = @"type";
  id v8 = [NSNumber numberWithInteger:self->_kind];
  v12[3] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];

  return (NSDictionary *)v9;
}

- (void)setBookmark:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F66280];
  id v5 = a3;
  id v6 = (WBSCopyOnWriteValue *)[[v4 alloc] initWithValue:v5];

  bookmarkStorage = self->_bookmarkStorage;
  self->_bookmarkStorage = v6;
}

- (NSString)deviceIdentifier
{
  id v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  id v3 = [v2 deviceIdentifier];

  return (NSString *)v3;
}

- (id)displayTitleProvider
{
  id v2 = (void *)MEMORY[0x21D4A1230](self->_displayTitleProvider, a2);
  return v2;
}

- (BOOL)isHidden
{
  id v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 isHidden];

  return v3;
}

- (NSString)htmlString
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", 70 * -[NSArray count](self->_tabs, "count") + 52);
  [v3 appendString:@"<html><body>"];
  if ([(WBTabGroup *)self isSyncable])
  {
    uint64_t v4 = [(WBTabGroup *)self title];
    [v3 appendFormat:@"<h>%@</h>", v4];
  }
  [v3 appendString:@"<ul>"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_tabs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 url];
        uint64_t v12 = [v10 title];
        [v3 appendFormat:@"<li><a href='%@'>%@</a></li>", v11, v12, (void)v14];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v3 appendString:@"</ul>"];
  [v3 appendString:@"</body></html>"];
  return (NSString *)v3;
}

- (NSSet)emptyTabsUUIDSet
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  char v3 = [(NSArray *)self->_tabs safari_mapAndFilterObjectsUsingBlock:&__block_literal_global_54];
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

id __30__WBTabGroup_emptyTabsUUIDSet__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isBlank])
  {
    id v3 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v4 = [v2 uuid];
    id v5 = (void *)[v3 initWithUUIDString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSURL)representativeURL
{
  id v3 = [(WBTabGroup *)self tabs];
  if (self->_lastSelectedTabUUID)
  {
    uint64_t v4 = -[WBTabGroup tabWithUUID:](self, "tabWithUUID:");
    id v5 = [v4 url];

    uint64_t v6 = [v5 host];
    uint64_t v7 = [v6 length];

    if (v7) {
      goto LABEL_5;
    }
  }
  uint64_t v8 = objc_msgSend(v3, "safari_lastObjectPassingTest:", &__block_literal_global_57);
  id v5 = [v8 url];

LABEL_5:
  return (NSURL *)v5;
}

BOOL __31__WBTabGroup_representativeURL__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 url];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int)identifier
{
  id v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  int v3 = [v2 identifier];

  return v3;
}

- (BOOL)isInserted
{
  id v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  char v3 = [v2 isInserted];

  return v3;
}

- (WBTab)lastPinnedTab
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = self->_tabs;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isPinned", (void)v12))
        {
          id v9 = v8;

          id v5 = v9;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v10 = (void *)[v5 copy];
  return (WBTab *)v10;
}

- (id)lastPinnedTabExcluding:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_tabs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "isPinned", (void)v17);
        if (v11 != v4 && v12 != 0)
        {
          id v14 = v11;

          uint64_t v8 = v14;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  long long v15 = (void *)[v8 copy];
  return v15;
}

- (NSString)title
{
  id v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  uint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (WBSCRDTPosition)syncPosition
{
  id v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  uint64_t v3 = [v2 syncPosition];

  return (WBSCRDTPosition *)v3;
}

- (NSString)serverID
{
  id v2 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  uint64_t v3 = [v2 serverID];

  return (NSString *)v3;
}

- (BOOL)hasSameKindAsTabGroup:(id)a3
{
  int64_t kind = self->_kind;
  return kind == [a3 kind];
}

- (BOOL)supportsDeviceTabs
{
  if ([(WBTabGroup *)self isNamed] || [(WBTabGroup *)self isLocal]) {
    return 0;
  }
  else {
    return ![(WBTabGroup *)self isPrivateBrowsing];
  }
}

- (BOOL)isIdentical:(id)a3
{
  id v4 = a3;
  if (WBSIsEqual())
  {
    id v5 = [(WBTabGroup *)self title];
    uint64_t v6 = [v4 title];
    char v7 = WBSIsEqual();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)tabsAreIdentical:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_tabs count];
  uint64_t v6 = [v4 tabs];
  if (v5 == [v6 count])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 1;
    tabs = self->_tabs;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __31__WBTabGroup_tabsAreIdentical___block_invoke;
    v10[3] = &unk_2643DBB80;
    id v11 = v6;
    int v12 = &v13;
    [(NSArray *)tabs enumerateObjectsUsingBlock:v10];
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __31__WBTabGroup_tabsAreIdentical___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 objectAtIndexedSubscript:a3];
  LOBYTE(a3) = objc_msgSend(v8, "isIdentical:");

  if ((a3 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)isTabPinnable:(id)a3
{
  id v4 = a3;
  if ([v4 canSetPinned])
  {
    if ([v4 isBlank]) {
      BOOL v5 = ![(WBTabGroup *)self usesGlobalPinnedTabs];
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)description
{
  long long v17 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(WBTabGroup *)self identifier];
  BOOL v6 = [(WBTabGroup *)self isSyncable];
  char v7 = @"NO";
  if (v6) {
    char v7 = @"YES";
  }
  id v8 = v7;
  id v9 = [(WBTabGroup *)self title];
  int64_t v10 = [(WBTabGroup *)self kind];
  id v11 = [(WBTabGroup *)self tabs];
  uint64_t v12 = [v11 count];
  uint64_t v13 = [(WBTabGroup *)self uuid];
  id v14 = [(WBTabGroup *)self serverID];
  objc_msgSend(v17, "stringWithFormat:", @"<%@: %p; identifier = %d; syncable = %@; title = %@; int64_t kind = %ld; numberOfTabs = %zu; uuid = %@; serverID = %@>",
    v4,
    self,
    v5,
    v8,
    v9,
    v10,
    v12,
    v13,
  uint64_t v15 = v14);

  return (NSString *)v15;
}

- (NSString)privacyPreservingDescription
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WBTabGroup *)self identifier];
  BOOL v7 = [(WBTabGroup *)self isSyncable];
  id v8 = @"NO";
  if (v7) {
    id v8 = @"YES";
  }
  id v9 = v8;
  int64_t v10 = [(WBTabGroup *)self kind];
  id v11 = [(WBTabGroup *)self tabs];
  uint64_t v12 = [v11 count];
  uint64_t v13 = [(WBTabGroup *)self uuid];
  id v14 = [(WBTabGroup *)self serverID];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier = %d; syncable = %@; int64_t kind = %ld; numberOfTabs = %zu; uuid = %@; serverID = %@>",
    v5,
    self,
    v6,
    v9,
    v10,
    v12,
    v13,
  uint64_t v15 = v14);

  return (NSString *)v15;
}

- (NSString)debugSyncDescription
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  id v4 = [(WBTabGroup *)self title];
  uint64_t v5 = [(WBTabGroup *)self uuid];
  uint64_t v6 = [v3 stringWithFormat:@"%@, UUID: %@", v4, v5];

  BOOL v7 = [(WBSCopyOnWriteValue *)self->_bookmarkStorage value];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__WBTabGroup_debugSyncDescription__block_invoke;
  v11[3] = &unk_2643DA6F8;
  id v12 = v6;
  id v8 = v6;
  [v7 getReadOnlyCachedBookmarkSyncDataUsingBlock:v11];

  id v9 = (void *)[v8 copy];
  return (NSString *)v9;
}

void __34__WBTabGroup_debugSyncDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 record];
  uint64_t v6 = [v5 recordID];
  BOOL v7 = [v6 ckShortDescription];
  [v3 appendFormat:@", recordID: %@", v7];

  id v12 = [v4 shareRecord];

  id v8 = v12;
  if (v12)
  {
    id v9 = *(void **)(a1 + 32);
    int64_t v10 = [v12 recordID];
    id v11 = [v10 ckShortDescription];
    [v9 appendFormat:@", share recordID: %@", v11];

    id v8 = v12;
  }
}

- (NSString)debugRecursiveSyncDescription
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(WBTabGroup *)self debugSyncDescription];
  id v4 = (void *)[v3 mutableCopy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_tabs;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) debugSyncDescription];
        [v4 appendFormat:@"\n\t%@", v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSString *)v4;
}

- (void)detectDuplicatedTabs
{
  id v3 = a1;
  id v4 = [a2 allObjects];
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v5, v6, "Detected duplicated tabs: %@", v7, v8, v9, v10, 2u);
}

uint64_t __34__WBTabGroup_detectDuplicatedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (BOOL)isEmpty
{
  if (![(NSArray *)self->_tabs count]) {
    return 1;
  }
  tabs = self->_tabs;
  return [(NSArray *)tabs safari_allObjectsPassTest:&__block_literal_global_87];
}

uint64_t __21__WBTabGroup_isEmpty__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBlank];
}

- (NSString)lastSelectedTabUUID
{
  return self->_lastSelectedTabUUID;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_int64_t kind = a3;
}

- (BOOL)_isMutable
{
  return self->_isMutable;
}

- (Class)_tabClass
{
  return self->_tabClass;
}

- (NSArray)overflowRemoteTabs
{
  return self->_overflowRemoteTabs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabClass, 0);
  objc_storeStrong((id *)&self->_cachedUnpinnedTabs, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong(&self->_displayTitleProvider, 0);
  objc_storeStrong((id *)&self->_lastSelectedTabUUID, 0);
  objc_storeStrong((id *)&self->_bookmarkStorage, 0);
  objc_storeStrong((id *)&self->_tabsByUUID, 0);
  objc_storeStrong((id *)&self->_deletedTabs, 0);
  objc_storeStrong((id *)&self->_overflowRemoteTabs, 0);
  objc_storeStrong((id *)&self->_tabs, 0);
}

@end