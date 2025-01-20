@interface _SFBrowserSavedState
+ (BOOL)shouldMergeAllWindowsIfNeeded;
+ (_SFBrowserSavedState)sharedBrowserSavedState;
+ (id)defaultBrowserStateDatabase;
+ (id)defaultPPTBrowserStateDatabase;
+ (id)ephemeralSavedState;
+ (id)inMemoryDatabase;
+ (void)setSharedBrowserSavedState:(id)a3;
+ (void)setShouldMergeAllWindowsIfNeeded:(BOOL)a3;
- (BOOL)activeDocumentIsValidForBrowserControllerWithUUID:(id)a3;
- (BOOL)secureDeleteEnabled;
- (BOOL)shouldBeUsedDuringTest;
- (NSArray)browserWindows;
- (_SFBrowserSavedState)initWithDatabaseURL:(id)a3;
- (id)readSavedSessionStateDataForTabWithUUID:(id)a3;
- (id)recentlyClosedTabsForProfileWithIdentifier:(id)a3;
- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3;
- (id)tabStateDataForUUID:(id)a3;
- (void)_checkPointWriteAheadLogIfNeeded;
- (void)_notifyThatRecentlyClosedTabsWereRemoved:(id)a3;
- (void)_readBrowserControllersSavedState;
- (void)_readRecentlyClosedTabsStateIfNecessary;
- (void)_removeRecentlyClosedTabStateData:(id)a3;
- (void)addRecentlyClosedTabs:(id)a3;
- (void)clearRecentlyClosedTabsForProfileWithIdentifier:(id)a3;
- (void)clearSavedStatesForProfileWithIdentifier:(id)a3 closingDatabase:(BOOL)a4;
- (void)dealloc;
- (void)historyItemsWereRemoved:(id)a3;
- (void)loadSessionStateDataAndRemoveRecentlyClosedTab:(id)a3;
- (void)regenerateTabUUIDsForDeviceRestoration;
- (void)removeRecentlyClosedTabWithStateData:(id)a3;
- (void)removeTabStateWithTabData:(id)a3;
- (void)removeTabsStateForBrowserControllerWithUUID:(id)a3 andRemoveWindow:(BOOL)a4;
- (void)saveTabStateData:(id)a3;
- (void)saveTabsState:(id)a3 forBrowserControllerWithUUID:(id)a4 completion:(id)a5;
- (void)setActiveDocumentIsValid:(BOOL)a3 forBrowserControllerWithUUID:(id)a4;
- (void)setBrowserWindows:(id)a3;
- (void)setSecureDeleteEnabled:(BOOL)a3;
- (void)updateBrowserWindowState:(id)a3 tabs:(id)a4;
- (void)updateSceneID:(id)a3;
@end

@implementation _SFBrowserSavedState

- (id)recentlyClosedTabsForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  [(_SFBrowserSavedState *)self _readRecentlyClosedTabsStateIfNecessary];
  recentlyClosedTabs = self->_recentlyClosedTabs;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67___SFBrowserSavedState_recentlyClosedTabsForProfileWithIdentifier___block_invoke;
  v9[3] = &unk_1E54ED9E0;
  id v6 = v4;
  id v10 = v6;
  v7 = [(NSMutableArray *)recentlyClosedTabs safari_filterObjectsUsingBlock:v9];

  return v7;
}

- (void)_readRecentlyClosedTabsStateIfNecessary
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_haveLoadedRecentlyClosedTabs)
  {
    self->_haveLoadedRecentlyClosedTabs = 1;
    v3 = [MEMORY[0x1E4F1CA48] array];
    recentlyClosedTabs = self->_recentlyClosedTabs;
    self->_recentlyClosedTabs = v3;

    v5 = [MEMORY[0x1E4F28BD0] set];
    tabCountByWindowUUID = self->_tabCountByWindowUUID;
    self->_tabCountByWindowUUID = v5;

    [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore recentlyClosedWindows];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v7)
    {
      uint64_t v20 = *(void *)v29;
      do
      {
        uint64_t v21 = v7;
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(obj);
          }
          browserStateSQLiteStore = self->_browserStateSQLiteStore;
          id v10 = [*(id *)(*((void *)&v28 + 1) + 8 * i) UUIDString];
          v23 = [(SFBrowserStateSQLiteStore *)browserStateSQLiteStore tabStatesWithBrowserWindowUUID:v10];

          v11 = [v23 objectForKeyedSubscript:@"SafariStateDocuments"];
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          v22 = v11;
          v12 = [v11 reverseObjectEnumerator];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v12);
                }
                v16 = [[SFTabStateData alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v24 + 1) + 8 * j)];
                [(NSMutableArray *)self->_recentlyClosedTabs addObject:v16];
                v17 = self->_tabCountByWindowUUID;
                v18 = [(SFTabStateData *)v16 owningBrowserWindowUUIDString];
                [(NSCountedSet *)v17 addObject:v18];
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }
  }
}

+ (id)defaultBrowserStateDatabase
{
  id v2 = objc_alloc((Class)a1);
  if (!safariTabStateDatabaseURL(void)::browserStateDatabaseURL)
  {
    uint64_t v3 = databaseURLForFileName(&cfstr_BrowserstateDb.isa);
    id v4 = (void *)safariTabStateDatabaseURL(void)::browserStateDatabaseURL;
    safariTabStateDatabaseURL(void)::browserStateDatabaseURL = v3;
  }
  v5 = objc_msgSend(v2, "initWithDatabaseURL:");

  return v5;
}

- (_SFBrowserSavedState)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFBrowserSavedState;
  v5 = [(_SFBrowserSavedState *)&v10 init];
  if (v5)
  {
    id v6 = [[SFBrowserStateSQLiteStore alloc] initWithDatabaseURL:v4];
    browserStateSQLiteStore = v5->_browserStateSQLiteStore;
    v5->_browserStateSQLiteStore = v6;

    [(_SFBrowserSavedState *)v5 _readBrowserControllersSavedState];
    v8 = v5;
  }

  return v5;
}

- (void)_readBrowserControllersSavedState
{
  if ([(id)objc_opt_class() shouldMergeAllWindowsIfNeeded]) {
    [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore mergeAllWindows];
  }
  uint64_t v3 = [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore browserWindows];
  browserWindows = self->_browserWindows;
  self->_browserWindows = v3;
}

+ (BOOL)shouldMergeAllWindowsIfNeeded
{
  return shouldMergeAllWindowsIfNeeded;
}

+ (void)setShouldMergeAllWindowsIfNeeded:(BOOL)a3
{
  shouldMergeAllWindowsIfNeeded = a3;
}

+ (_SFBrowserSavedState)sharedBrowserSavedState
{
  id v2 = (void *)sharedBrowserSavedStateInstance;
  if (!sharedBrowserSavedStateInstance)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47___SFBrowserSavedState_sharedBrowserSavedState__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (+[_SFBrowserSavedState sharedBrowserSavedState]::onceToken != -1) {
      dispatch_once(&+[_SFBrowserSavedState sharedBrowserSavedState]::onceToken, block);
    }
    id v2 = (void *)sharedBrowserSavedStateInstance;
  }
  id v3 = v2;

  return (_SFBrowserSavedState *)v3;
}

+ (void)setSharedBrowserSavedState:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v5 = [v4 launchedToTest];
  if (sharedBrowserSavedStateInstance) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }

  if ((v6 & 1) == 0)
  {
    v8 = [NSString stringWithFormat:&stru_1EDA07C28];
    v9 = NSString;
    objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/MobileSafariFramework/_SFBrowserSavedState.mm"];
    v11 = [v10 lastPathComponent];
    uint64_t v12 = [v8 length];
    if (v12)
    {
      uint64_t v13 = [NSString stringWithFormat:@", %@", v8];
    }
    else
    {
      uint64_t v13 = &stru_1EDA07C28;
    }
    uint64_t v14 = [v9 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "[[UIApplication sharedApplication] launchedToTest] || !sharedBrowserSavedStateInstance", "+[_SFBrowserSavedState setSharedBrowserSavedState:]", v11, 88, v13];
    if (v12) {

    }
    v15 = [MEMORY[0x1E4F29060] callStackSymbols];
    NSLog(&stru_1EDA07EA8.isa, v14, v15);

    abort();
  }
  uint64_t v7 = (void *)sharedBrowserSavedStateInstance;
  sharedBrowserSavedStateInstance = (uint64_t)v3;
}

+ (id)ephemeralSavedState
{
  return +[_SFBrowserSavedState inMemoryDatabase];
}

+ (id)inMemoryDatabase
{
  id v2 = (void *)[objc_alloc((Class)a1) initWithDatabaseURL:0];

  return v2;
}

+ (id)defaultPPTBrowserStateDatabase
{
  id v2 = objc_alloc((Class)a1);
  if (!safariPPTTabStateDatabaseURL(void)::browserStatePPTDatabaseURL)
  {
    uint64_t v3 = databaseURLForFileName(&cfstr_Browserstatepp.isa);
    id v4 = (void *)safariPPTTabStateDatabaseURL(void)::browserStatePPTDatabaseURL;
    safariPPTTabStateDatabaseURL(void)::browserStatePPTDatabaseURL = v3;
  }
  char v5 = objc_msgSend(v2, "initWithDatabaseURL:");

  return v5;
}

- (void)dealloc
{
  [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore closeDatabase];
  v3.receiver = self;
  v3.super_class = (Class)_SFBrowserSavedState;
  [(_SFBrowserSavedState *)&v3 dealloc];
}

- (void)setBrowserWindows:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSArray *)self->_browserWindows isEqualToArray:v4])
  {
    char v5 = (NSArray *)[v4 copy];
    browserWindows = self->_browserWindows;
    self->_browserWindows = v5;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          browserStateSQLiteStore = self->_browserStateSQLiteStore;
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "dictionaryRepresentation", (void)v13);
          [(SFBrowserStateSQLiteStore *)browserStateSQLiteStore updateBrowserWindowStateWithDictionary:v12 completion:0];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (id)savedTabsStateForBrowserControllerWithUUID:(id)a3
{
  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  id v4 = [a3 UUIDString];
  char v5 = [(SFBrowserStateSQLiteStore *)browserStateSQLiteStore tabStatesWithBrowserWindowUUID:v4];

  return v5;
}

- (void)saveTabsState:(id)a3 forBrowserControllerWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v7 = a5;
  [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore updateBrowserWindowStateWithDictionary:v8 completion:v7];
  [(_SFBrowserSavedState *)self _checkPointWriteAheadLogIfNeeded];
}

- (void)_checkPointWriteAheadLogIfNeeded
{
  if (self->_checkPointWriteAheadLogOnNextUpdate)
  {
    [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore checkPointWriteAheadLog];
    self->_checkPointWriteAheadLogOnNextUpdate = 0;
  }
}

- (void)setSecureDeleteEnabled:(BOOL)a3
{
  if (self->_secureDeleteEnabled != a3)
  {
    self->_secureDeleteEnabled = a3;
    -[SFBrowserStateSQLiteStore setSecureDeleteEnabled:](self->_browserStateSQLiteStore, "setSecureDeleteEnabled:");
  }
}

- (void)removeTabsStateForBrowserControllerWithUUID:(id)a3 andRemoveWindow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  id v10 = v6;
  id v8 = [v6 UUIDString];
  [(SFBrowserStateSQLiteStore *)browserStateSQLiteStore deleteTabStateWithBrowserWindowUUID:v8 andRemoveWindow:v4];

  if (v4)
  {
    uint64_t v9 = +[_SFBrowserWindowSettings settings];
    [v9 removeWindowWithUUID:v10];
  }
  [(_SFBrowserSavedState *)self _checkPointWriteAheadLogIfNeeded];
}

- (void)setActiveDocumentIsValid:(BOOL)a3 forBrowserControllerWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  char v5 = +[_SFBrowserWindowSettings settings];
  [v5 setActiveDocumentIsValid:v4 forWindowWithUUID:v6];
}

- (BOOL)activeDocumentIsValidForBrowserControllerWithUUID:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_SFBrowserWindowSettings settings];
  char v5 = [v4 activeDocumentIsValidForWindowWithUUID:v3];

  return v5;
}

- (void)saveTabStateData:(id)a3
{
}

- (id)tabStateDataForUUID:(id)a3
{
  id v3 = [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore tabStateDataForUUID:a3];

  return v3;
}

- (void)clearSavedStatesForProfileWithIdentifier:(id)a3 closingDatabase:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  -[SFBrowserStateSQLiteStore deleteSavedStatesForProfileWithIdentifier:](self->_browserStateSQLiteStore, "deleteSavedStatesForProfileWithIdentifier:");
  if (v4)
  {
    [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore closeDatabase];
    browserStateSQLiteStore = self->_browserStateSQLiteStore;
    self->_browserStateSQLiteStore = 0;
  }
}

- (void)updateSceneID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore updateSceneID:v4])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    char v5 = self->_browserWindows;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "UUID", (void)v14);
          v11 = [v4 UUID];
          char v12 = [v10 isEqual:v11];

          if (v12)
          {
            long long v13 = [v4 sceneID];
            [v9 setSceneID:v13];

            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)updateBrowserWindowState:(id)a3 tabs:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore updateBrowserWindowWithData:v7 tabs:v6];
  [(_SFBrowserSavedState *)self _checkPointWriteAheadLogIfNeeded];
}

- (id)readSavedSessionStateDataForTabWithUUID:(id)a3
{
  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  id v4 = [a3 UUIDString];
  char v5 = [(SFBrowserStateSQLiteStore *)browserStateSQLiteStore readSavedSessionStateDataForTabWithUUIDString:v4];

  return v5;
}

- (void)removeTabStateWithTabData:(id)a3
{
  id v4 = a3;
  if ([v4 privateBrowsing]) {
    self->_checkPointWriteAheadLogOnNextUpdate = 1;
  }
  [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore removeTabWithTabData:v4];
}

- (void)addRecentlyClosedTabs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(_SFBrowserSavedState *)self _readRecentlyClosedTabsStateIfNecessary];
  char v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];

  if (!self->_recentlyClosedTabs)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    recentlyClosedTabs = self->_recentlyClosedTabs;
    self->_recentlyClosedTabs = v7;

    uint64_t v9 = [MEMORY[0x1E4F28BD0] set];
    tabCountByWindowUUID = self->_tabCountByWindowUUID;
    self->_tabCountByWindowUUID = v9;
  }
  if ((unint64_t)[v4 count] < 0xC9)
  {
    id v11 = v4;
  }
  else
  {
    objc_msgSend(v4, "subarrayWithRange:", objc_msgSend(v4, "count") - 200, 200);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        -[NSMutableArray insertObject:atIndex:](self->_recentlyClosedTabs, "insertObject:atIndex:", v16, 0, (void)v20);
        [v16 setOwningBrowserWindowUUIDString:v6];
        [(NSCountedSet *)self->_tabCountByWindowUUID addObject:v6];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  long long v17 = [[_SFBrowserWindowStateData alloc] initWithUUIDString:v6 sceneID:0];
  [(_SFBrowserWindowStateData *)v17 setDatabaseID:0x7FFFFFFFFFFFFFFFLL];
  [(_SFBrowserWindowStateData *)v17 setType:2];
  [(_SFBrowserWindowStateData *)v17 setNeedsQuickUpdate:1];
  [(_SFBrowserSavedState *)self updateBrowserWindowState:v17 tabs:v12];
  while ((unint64_t)[(NSMutableArray *)self->_recentlyClosedTabs count] >= 0xC9)
  {
    uint64_t v18 = [(NSMutableArray *)self->_recentlyClosedTabs lastObject];
    [(_SFBrowserSavedState *)self _removeRecentlyClosedTabStateData:v18];

    [(NSMutableArray *)self->_recentlyClosedTabs removeLastObject];
  }
  uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 postNotificationName:@"SFRecentlyClosedTabsWereAdded" object:self];
}

- (void)loadSessionStateDataAndRemoveRecentlyClosedTab:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  recentlyClosedTabs = self->_recentlyClosedTabs;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71___SFBrowserSavedState_loadSessionStateDataAndRemoveRecentlyClosedTab___block_invoke;
  v11[3] = &unk_1E54ED9B8;
  id v6 = v4;
  id v12 = v6;
  [(NSMutableArray *)recentlyClosedTabs safari_removeObjectsPassingTest:v11];
  browserStateSQLiteStore = self->_browserStateSQLiteStore;
  id v8 = [v6 UUIDString];
  uint64_t v9 = [(SFBrowserStateSQLiteStore *)browserStateSQLiteStore readSavedSessionStateDataForTabWithUUIDString:v8];
  [v6 setSessionStateData:v9];

  [(_SFBrowserSavedState *)self _removeRecentlyClosedTabStateData:v6];
  v13[0] = v6;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(_SFBrowserSavedState *)self _notifyThatRecentlyClosedTabsWereRemoved:v10];
}

- (void)clearRecentlyClosedTabsForProfileWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  [(_SFBrowserSavedState *)self _readRecentlyClosedTabsStateIfNecessary];
  recentlyClosedTabs = self->_recentlyClosedTabs;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __72___SFBrowserSavedState_clearRecentlyClosedTabsForProfileWithIdentifier___block_invoke;
  v19[3] = &unk_1E54ED9E0;
  id v5 = v14;
  id v20 = v5;
  id v6 = [(NSMutableArray *)recentlyClosedTabs safari_filterObjectsUsingBlock:v19];
  [(NSMutableArray *)self->_recentlyClosedTabs removeObjectsInArray:v6];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = self->_browserWindows;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        tabCountByWindowUUID = self->_tabCountByWindowUUID;
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) UUID];
        uint64_t v13 = [v12 UUIDString];
        [(NSCountedSet *)tabCountByWindowUUID removeObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v8);
  }

  [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore deleteRecentlyClosedWindowsWithProfileIdentifier:v5];
  [(_SFBrowserSavedState *)self _notifyThatRecentlyClosedTabsWereRemoved:v6];
}

- (void)_notifyThatRecentlyClosedTabsWereRemoved:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v7 = @"SFRemovedTabStateDataKey";
    v8[0] = v4;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"SFRecentlyClosedTabsWereRemoved" object:self userInfo:v5];
  }
}

- (void)historyItemsWereRemoved:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  MEMORY[0x192F95920](v22, @"com.apple.SafariServices._SFBrowserSavedState.HistoryItemsWereRemoved");
  [(_SFBrowserSavedState *)self _readRecentlyClosedTabsStateIfNecessary];
  id v5 = objc_msgSend(v4, "safari_setByApplyingBlock:", &__block_literal_global_63);
  if ([v5 count])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    recentlyClosedTabs = self->_recentlyClosedTabs;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __48___SFBrowserSavedState_historyItemsWereRemoved___block_invoke_2;
    v19[3] = &unk_1E54EDA28;
    id v8 = v6;
    id v20 = v8;
    id v21 = v5;
    uint64_t v9 = [(NSMutableArray *)recentlyClosedTabs safari_filterObjectsUsingBlock:v19];
    [(SFBrowserStateSQLiteStore *)self->_browserStateSQLiteStore removeSavedSessionStateDataForTabsWithUUIDStrings:v8];
    if ([v9 count])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            -[_SFBrowserSavedState _removeRecentlyClosedTabStateData:](self, "_removeRecentlyClosedTabStateData:", v14, (void)v15);
            [(NSMutableArray *)self->_recentlyClosedTabs removeObject:v14];
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v11);
      }

      [(_SFBrowserSavedState *)self _notifyThatRecentlyClosedTabsWereRemoved:v10];
    }
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v22);
}

- (void)_removeRecentlyClosedTabStateData:(id)a3
{
  id v6 = a3;
  id v4 = [v6 owningBrowserWindowUUIDString];
  [(NSCountedSet *)self->_tabCountByWindowUUID removeObject:v4];
  if ([(NSCountedSet *)self->_tabCountByWindowUUID containsObject:v4])
  {
    [(_SFBrowserSavedState *)self removeTabStateWithTabData:v6];
  }
  else
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    [(_SFBrowserSavedState *)self removeTabsStateForBrowserControllerWithUUID:v5 andRemoveWindow:1];
  }
}

- (void)removeRecentlyClosedTabWithStateData:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_recentlyClosedTabs count];
  [(_SFBrowserSavedState *)self _removeRecentlyClosedTabStateData:v4];
  [(NSMutableArray *)self->_recentlyClosedTabs removeObject:v4];
  if ([(NSMutableArray *)self->_recentlyClosedTabs count] < v5)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(_SFBrowserSavedState *)self _notifyThatRecentlyClosedTabsWereRemoved:v6];
  }
}

- (void)regenerateTabUUIDsForDeviceRestoration
{
}

- (NSArray)browserWindows
{
  return self->_browserWindows;
}

- (BOOL)secureDeleteEnabled
{
  return self->_secureDeleteEnabled;
}

- (BOOL)shouldBeUsedDuringTest
{
  return self->_shouldBeUsedDuringTest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserWindows, 0);
  objc_storeStrong((id *)&self->_tabCountByWindowUUID, 0);
  objc_storeStrong((id *)&self->_recentlyClosedTabs, 0);

  objc_storeStrong((id *)&self->_browserStateSQLiteStore, 0);
}

@end