@interface SHSheetActivitiesManager
- (BOOL)activityHelper:(id)a3 matchingWithContext:(id)a4 shouldIncludeSystemActivityType:(id)a5 sessionID:(id)a6;
- (NSArray)applicationActivities;
- (NSArray)applicationActivityTypes;
- (NSArray)excludedActivityTypes;
- (NSArray)hiddenActivities;
- (NSArray)orderedActivities;
- (NSMutableDictionary)internalActivitiesByUUID;
- (NSString)sessionIdentifier;
- (SHSheetActivitiesManager)initWithSessionIdentifier:(id)a3 applicationActivities:(id)a4;
- (SHSheetActivitiesManagerDelegate)delegate;
- (_UIActivityHelper)activityHelper;
- (_UIActivityMatchingContext)currentContext;
- (_UIActivityMatchingResults)currentResults;
- (id)activitiesByUUID;
- (id)activityForActivityType:(id)a3;
- (id)activityForIdentifier:(id)a3;
- (void)_addActivities:(id)a3;
- (void)addActivity:(id)a3;
- (void)preheatActivitiesIfNeeded;
- (void)removeActivity:(id)a3;
- (void)setActivityHelper:(id)a3;
- (void)setCurrentContext:(id)a3;
- (void)setCurrentResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setHiddenActivities:(id)a3;
- (void)setInternalActivitiesByUUID:(id)a3;
- (void)setOrderedActivities:(id)a3;
- (void)updateActivitiesWithContext:(id)a3;
@end

@implementation SHSheetActivitiesManager

- (SHSheetActivitiesManager)initWithSessionIdentifier:(id)a3 applicationActivities:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SHSheetActivitiesManager;
  v8 = [(SHSheetActivitiesManager *)&v29 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sessionIdentifier = v8->_sessionIdentifier;
    v8->_sessionIdentifier = (NSString *)v9;

    v11 = [[_UIActivityHelper alloc] initWithDelegate:v8 sessionID:v8->_sessionIdentifier fetchShortcutsBlock:0];
    activityHelper = v8->_activityHelper;
    v8->_activityHelper = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    internalActivitiesByUUID = v8->_internalActivitiesByUUID;
    v8->_internalActivitiesByUUID = (NSMutableDictionary *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __76__SHSheetActivitiesManager_initWithSessionIdentifier_applicationActivities___block_invoke;
    v26 = &unk_1E5A22920;
    v16 = v8;
    v27 = v16;
    id v28 = v15;
    id v17 = v15;
    [v7 enumerateObjectsUsingBlock:&v23];
    uint64_t v18 = objc_msgSend(v17, "copy", v23, v24, v25, v26);
    applicationActivityTypes = v16->_applicationActivityTypes;
    v16->_applicationActivityTypes = (NSArray *)v18;

    uint64_t v20 = [v7 copy];
    applicationActivities = v16->_applicationActivities;
    v16->_applicationActivities = (NSArray *)v20;
  }
  return v8;
}

void __76__SHSheetActivitiesManager_initWithSessionIdentifier_applicationActivities___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  [v10 setIndexInApplicationDefinedActivities:a3];
  v5 = *(void **)(*(void *)(a1 + 32) + 72);
  id v6 = [v10 activityUUID];
  [v5 setObject:v10 forKeyedSubscript:v6];

  id v7 = [v10 activityType];

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v10 activityType];
    [v8 addObject:v9];
  }
}

- (id)activitiesByUUID
{
  v2 = [(SHSheetActivitiesManager *)self internalActivitiesByUUID];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSArray)orderedActivities
{
  v2 = [(SHSheetActivitiesManager *)self currentResults];
  v3 = [v2 orderedActivities];

  return (NSArray *)v3;
}

- (NSArray)hiddenActivities
{
  if (self->_hiddenActivities) {
    return self->_hiddenActivities;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)excludedActivityTypes
{
  v2 = [(SHSheetActivitiesManager *)self currentResults];
  v3 = [v2 excludedActivityTypes];

  return (NSArray *)v3;
}

- (void)updateActivitiesWithContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Update activities with context:%@", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [(SHSheetActivitiesManager *)self activityHelper];
  id v7 = [v6 orderedAvailableActivitiesForMatchingContext:v4];

  v8 = [v7 orderedActivities];
  [(SHSheetActivitiesManager *)self _addActivities:v8];

  uint64_t v9 = [v7 hiddenActivities];
  [(SHSheetActivitiesManager *)self _addActivities:v9];

  id v10 = [v7 hiddenActivities];
  hiddenActivities = self->_hiddenActivities;
  self->_hiddenActivities = v10;

  [(SHSheetActivitiesManager *)self setCurrentContext:v4];
  [(SHSheetActivitiesManager *)self setCurrentResults:v7];
}

- (id)activityForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SHSheetActivitiesManager *)self internalActivitiesByUUID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)activityForActivityType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(SHSheetActivitiesManager *)self internalActivitiesByUUID];
  id v6 = [v5 allValues];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 activityType];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_addActivities:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Add activities:%@", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        int v12 = [(SHSheetActivitiesManager *)self internalActivitiesByUUID];
        id v13 = [v11 activityUUID];
        [v12 setObject:v11 forKeyedSubscript:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)addActivity:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[SHSheetActivitiesManager _addActivities:](self, "_addActivities:", v6, v7, v8);
}

- (void)removeActivity:(id)a3
{
  id v4 = a3;
  id v6 = [(SHSheetActivitiesManager *)self internalActivitiesByUUID];
  id v5 = [v4 activityUUID];

  [v6 removeObjectForKey:v5];
}

- (void)preheatActivitiesIfNeeded
{
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "Preheating activities", v3, 2u);
  }

  +[UIMessageActivity _preheatAsyncIfNeeded];
}

- (BOOL)activityHelper:(id)a3 matchingWithContext:(id)a4 shouldIncludeSystemActivityType:(id)a5 sessionID:(id)a6
{
  id v7 = a5;
  uint64_t v8 = [(SHSheetActivitiesManager *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(SHSheetActivitiesManager *)self delegate];
    char v11 = [v10 activitiesManager:self shouldShowSystemActivityType:v7];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (void)setHiddenActivities:(id)a3
{
}

- (SHSheetActivitiesManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetActivitiesManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setOrderedActivities:(id)a3
{
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (_UIActivityHelper)activityHelper
{
  return self->_activityHelper;
}

- (void)setActivityHelper:(id)a3
{
}

- (NSMutableDictionary)internalActivitiesByUUID
{
  return self->_internalActivitiesByUUID;
}

- (void)setInternalActivitiesByUUID:(id)a3
{
}

- (_UIActivityMatchingContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (_UIActivityMatchingResults)currentResults
{
  return self->_currentResults;
}

- (void)setCurrentResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentResults, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_internalActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_activityHelper, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_orderedActivities, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hiddenActivities, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end