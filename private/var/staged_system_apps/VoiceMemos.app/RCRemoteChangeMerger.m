@interface RCRemoteChangeMerger
- (RCRemoteChangeMerger)initWithStores:(id)a3 viewContext:(id)a4 transactionAuthorToIgnore:(id)a5;
- (id)backgroundContexts;
- (void)_handleRemoteChangeNotification:(id)a3;
- (void)addContextToMergeChangesInto:(id)a3;
@end

@implementation RCRemoteChangeMerger

- (RCRemoteChangeMerger)initWithStores:(id)a3 viewContext:(id)a4 transactionAuthorToIgnore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)RCRemoteChangeMerger;
  v11 = [(RCRemoteChangeMerger *)&v35 init];
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    storeMergers = v11->storeMergers;
    v11->storeMergers = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v11->_viewContext, a4);
    uint64_t v14 = +[NSHashTable weakObjectsHashTable];
    backgroundContexts = v11->_backgroundContexts;
    v11->_backgroundContexts = (NSHashTable *)v14;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v29 = v8;
    id obj = v8;
    id v16 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v21 = [v20 persistentStoreCoordinator];
          v36 = v20;
          v22 = +[NSArray arrayWithObjects:&v36 count:1];
          v23 = [v21 currentPersistentHistoryTokenFromStores:v22];

          v24 = [[RCStoreChangeMerger alloc] initWithPersistentStore:v20 transactionAuthorToIgnore:v10 startingToken:v23 viewContext:v9];
          [(RCStoreChangeMerger *)v24 setDelegate:v11];
          v25 = v11->storeMergers;
          v26 = [v20 identifier];
          [(NSMutableDictionary *)v25 setObject:v24 forKeyedSubscript:v26];
        }
        id v17 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v17);
    }

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v11 selector:"_handleRemoteChangeNotification:" name:NSPersistentStoreRemoteChangeNotification object:0];

    id v8 = v29;
  }

  return v11;
}

- (void)addContextToMergeChangesInto:(id)a3
{
  id v4 = a3;
  viewContext = self->_viewContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006DCA0;
  v7[3] = &unk_100221C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSManagedObjectContext *)viewContext performBlockAndWait:v7];
}

- (void)_handleRemoteChangeNotification:(id)a3
{
  id v4 = [a3 userInfo];
  storeMergers = self->storeMergers;
  id v6 = [v4 objectForKeyedSubscript:NSStoreUUIDKey];
  v7 = [(NSMutableDictionary *)storeMergers objectForKeyedSubscript:v6];

  uint64_t v8 = [v4 objectForKeyedSubscript:NSPersistentHistoryTokenKey];
  id v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006DDC8;
    v11[3] = &unk_100221C38;
    id v12 = v7;
    id v13 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (id)backgroundContexts
{
  return self->_backgroundContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_backgroundContexts, 0);

  objc_storeStrong((id *)&self->storeMergers, 0);
}

@end