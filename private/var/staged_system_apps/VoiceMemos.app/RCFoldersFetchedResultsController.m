@interface RCFoldersFetchedResultsController
+ (NSString)builtinFoldersSectionIdentifier;
+ (NSString)userFoldersSectionIdentifier;
- (NSArray)builtinFolders;
- (NSArray)userFolders;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSMutableDictionary)builtInContentControllers;
- (NSMutableDictionary)userContentControllers;
- (RCFoldersFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (id)_contentControllerForId:(id)a3;
- (id)folderAtIndexPath:(id)a3;
- (id)folderWithIdentifier:(id)a3;
- (id)indexPathForFolder:(id)a3;
- (id)playableRecordingsInFolder:(id)a3;
- (unint64_t)playableCountForFolder:(id)a3;
- (void)addContentObserver:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)reloadBuiltinFolder:(id)a3;
- (void)reloadUserFolder:(id)a3;
- (void)removeContentObserver:(id)a3;
@end

@implementation RCFoldersFetchedResultsController

+ (NSString)builtinFoldersSectionIdentifier
{
  return (NSString *)@"0";
}

+ (NSString)userFoldersSectionIdentifier
{
  return (NSString *)@"1";
}

- (RCFoldersFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RCFoldersFetchedResultsController;
  v8 = [(RCFoldersFetchedResultsController *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a4);
    v10 = (NSFetchedResultsController *)[objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v6 managedObjectContext:v7 sectionNameKeyPath:0 cacheName:0];
    userFoldersController = v9->_userFoldersController;
    v9->_userFoldersController = v10;

    [(NSFetchedResultsController *)v9->_userFoldersController setDelegate:v9];
    uint64_t v12 = objc_opt_new();
    pendingUpdates = v9->_pendingUpdates;
    v9->_pendingUpdates = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    folderContentsDelegate = v9->_folderContentsDelegate;
    v9->_folderContentsDelegate = (__RCFolderContentsDelegate *)v14;

    [(__RCFolderContentsDelegate *)v9->_folderContentsDelegate setFoldersController:v9];
    uint64_t v16 = +[NSHashTable weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v16;
  }
  return v9;
}

- (NSMutableDictionary)userContentControllers
{
  userContentControllers = self->_userContentControllers;
  if (!userContentControllers)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_userContentControllers;
    self->_userContentControllers = v4;

    id v6 = +[RCApplicationModel sharedApplicationModel];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = [(RCFoldersFetchedResultsController *)self userFolders];
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v13 = [v6 recordingsControllerWithFolder:v12];
          uint64_t v14 = self->_userContentControllers;
          v15 = [v12 folderControllerID];
          [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

          [v13 setDelegate:self->_folderContentsDelegate];
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    userContentControllers = self->_userContentControllers;
  }

  return userContentControllers;
}

- (NSMutableDictionary)builtInContentControllers
{
  builtInContentControllers = self->_builtInContentControllers;
  if (!builtInContentControllers)
  {
    v4 = +[RCApplicationModel sharedApplicationModel];
    v5 = (NSDictionary *)objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = +[RCBuiltinRecordingsFolder allBuiltInFolders];
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = [v4 recordingsControllerWithFolder:v11];
          v13 = [v11 folderControllerID];
          [(NSDictionary *)v5 setObject:v12 forKeyedSubscript:v13];

          [v12 setDelegate:self->_folderContentsDelegate];
        }
        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v14 = self->_builtInContentControllers;
    self->_builtInContentControllers = v5;

    builtInContentControllers = self->_builtInContentControllers;
  }

  return (NSMutableDictionary *)builtInContentControllers;
}

- (id)_contentControllerForId:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "__rc_folderType") == (id)4) {
    [(RCFoldersFetchedResultsController *)self userContentControllers];
  }
  else {
  v5 = [(RCFoldersFetchedResultsController *)self builtInContentControllers];
  }
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)playableRecordingsInFolder:(id)a3
{
  id v4 = [a3 folderControllerID];
  v5 = [(RCFoldersFetchedResultsController *)self _contentControllerForId:v4];

  id v6 = [v5 fetchedRecordings];

  return v6;
}

- (void)addContentObserver:(id)a3
{
}

- (void)removeContentObserver:(id)a3
{
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 - 3 < 2)
  {
    [(NSMutableArray *)self->_pendingUpdates addObject:v12];
  }
  else if (a6 == 1)
  {
    long long v20 = +[RCApplicationModel sharedApplicationModel];
    v21 = [v20 recordingsControllerWithFolder:v12];

    userContentControllers = self->_userContentControllers;
    v23 = [v12 folderControllerID];
    [(NSMutableDictionary *)userContentControllers setObject:v21 forKeyedSubscript:v23];

    [v21 setDelegate:self->_folderContentsDelegate];
  }
  else if (a6 == 2)
  {
    v15 = self->_userContentControllers;
    long long v16 = [v12 folderControllerID];
    long long v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];

    [v17 setDelegate:0];
    long long v18 = self->_userContentControllers;
    long long v19 = [v12 folderControllerID];
    [(NSMutableDictionary *)v18 setObject:0 forKeyedSubscript:v19];
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = [(RCFoldersFetchedResultsController *)self currentSnapshot];
  if (v4)
  {
    if ([(NSMutableArray *)self->_pendingUpdates count])
    {
      v5 = sub_10009C634(self->_pendingUpdates);
      [v4 reconfigureItemsWithIdentifiers:v5];

      [(NSMutableArray *)self->_pendingUpdates removeAllObjects];
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = self->_observers;
    id v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) controller:didChangeContentWithSnapshot:self v4 v11];
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  NSClassFromString(@"NSDiffableDataSourceSnapshot");
  v3 = objc_opt_new();
  if (v3)
  {
    CFStringRef v12 = @"0";
    id v4 = +[NSArray arrayWithObjects:&v12 count:1];
    [v3 appendSectionsWithIdentifiers:v4];

    v5 = [(RCFoldersFetchedResultsController *)self builtinFolders];
    id v6 = sub_10009C634(v5);
    [v3 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:@"0"];

    id v7 = [(RCFoldersFetchedResultsController *)self userFolders];
    if ([v7 count])
    {
      CFStringRef v11 = @"1";
      id v8 = +[NSArray arrayWithObjects:&v11 count:1];
      [v3 appendSectionsWithIdentifiers:v8];

      uint64_t v9 = sub_10009C634(v7);
      [v3 appendItemsWithIdentifiers:v9 intoSectionWithIdentifier:@"1"];
    }
  }

  return (NSDiffableDataSourceSnapshot *)v3;
}

- (NSArray)builtinFolders
{
  builtinFolders = self->_builtinFolders;
  if (!builtinFolders)
  {
    id v4 = +[RCBuiltinRecordingsFolder allBuiltInFolders];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009C9B0;
    v8[3] = &unk_100222CE8;
    v8[4] = self;
    [v4 na_filter:v8];
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_builtinFolders;
    self->_builtinFolders = v5;

    builtinFolders = self->_builtinFolders;
  }

  return builtinFolders;
}

- (void)reloadBuiltinFolder:(id)a3
{
  id v4 = a3;
  v5 = +[RCBuiltinRecordingsFolder allBuiltInFolders];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009CC00;
  v20[3] = &unk_100222CE8;
  v20[4] = self;
  [v5 na_filter:v20];
  id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  builtinFolders = self->_builtinFolders;
  self->_builtinFolders = v6;

  id v8 = [(RCFoldersFetchedResultsController *)self currentSnapshot];
  if (v8)
  {
    if (![v4 folderType]
      || [(RCFoldersFetchedResultsController *)self playableCountForFolder:v4])
    {
      uint64_t v9 = [v4 folderControllerID];
      v22 = v9;
      uint64_t v10 = +[NSArray arrayWithObjects:&v22 count:1];
      [v8 reconfigureItemsWithIdentifiers:v10];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    CFStringRef v11 = self->_observers;
    id v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) controller:didChangeContentWithSnapshot:self v8 v16];
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)reloadUserFolder:(id)a3
{
  id v4 = a3;
  v5 = [(RCFoldersFetchedResultsController *)self currentSnapshot];
  if (v5)
  {
    id v6 = [v4 folderControllerID];
    long long v18 = v6;
    id v7 = +[NSArray arrayWithObjects:&v18 count:1];
    [v5 reconfigureItemsWithIdentifiers:v7];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = self->_observers;
    id v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) controller:didChangeContentWithSnapshot:self v5 v13];
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (NSArray)userFolders
{
  if (!self->_hasPerformedUserControllerFetch)
  {
    userFoldersController = self->_userFoldersController;
    id v9 = 0;
    unsigned __int8 v4 = [(NSFetchedResultsController *)userFoldersController performFetch:&v9];
    id v5 = v9;
    self->_hasPerformedUserControllerFetch = v4;
    if ((v4 & 1) == 0)
    {
      id v6 = OSLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10016DC84((uint64_t)v5, v6);
      }
    }
  }
  id v7 = [(NSFetchedResultsController *)self->_userFoldersController _fetchedObjects];

  return (NSArray *)v7;
}

- (id)folderWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 __rc_folderType];
  if (v5 == (id)4)
  {
    id v6 = [(NSManagedObjectContext *)self->_context existingObjectWithID:v4 error:0];
  }
  else
  {
    id v7 = v5;
    id v8 = +[RCBuiltinRecordingsFolder allBuiltInFolders];
    id v6 = [v8 objectAtIndexedSubscript:v7];
  }

  return v6;
}

- (id)folderAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section]) {
    [(RCFoldersFetchedResultsController *)self userFolders];
  }
  else {
  id v5 = [(RCFoldersFetchedResultsController *)self builtinFolders];
  }
  id v6 = [v4 row];

  if (v6 >= [v5 count])
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (id)indexPathForFolder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 folderType] == (id)4;
  BOOL v6 = v5;
  if (v5) {
    [(RCFoldersFetchedResultsController *)self userFolders];
  }
  else {
  id v7 = [(RCFoldersFetchedResultsController *)self builtinFolders];
  }
  id v8 = [v7 indexOfObject:v4];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = +[NSIndexPath indexPathForRow:v8 inSection:v6];
  }

  return v9;
}

- (unint64_t)playableCountForFolder:(id)a3
{
  id v4 = [a3 folderControllerID];
  BOOL v5 = [(RCFoldersFetchedResultsController *)self _contentControllerForId:v4];

  BOOL v6 = [v5 fetchedObjects];
  id v7 = [v6 count];

  return (unint64_t)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_builtinFolders, 0);
  objc_storeStrong((id *)&self->_folderContentsDelegate, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_userContentControllers, 0);
  objc_storeStrong((id *)&self->_builtInContentControllers, 0);
  objc_storeStrong((id *)&self->_userFoldersController, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end