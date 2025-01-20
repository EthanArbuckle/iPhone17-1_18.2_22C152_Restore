@interface MailSceneBackgroundQueryMonitor
+ (OS_os_log)log;
- (BOOL)completedInitialLoad;
- (EMQuery)query;
- (EMQueryingCollection)collection;
- (EMRepository)repository;
- (MailSceneBackgroundQueryMonitor)initWithMessageListItems:(id)a3 messageList:(id)a4 messageRepository:(id)a5 changeTypes:(int64_t)a6;
- (MailSceneBackgroundQueryMonitor)initWithQuery:(id)a3 repository:(id)a4 changeTypes:(int64_t)a5;
- (MailSceneBackgroundResultHandler)handler;
- (NSString)ef_publicDescription;
- (int64_t)action;
- (int64_t)changeTypes;
- (void)_changeOccurred:(int64_t)a3;
- (void)beginMonitoringWithHandler:(id)a3;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)endMonitoring;
- (void)setAction:(int64_t)a3;
- (void)setChangeTypes:(int64_t)a3;
- (void)setCollection:(id)a3;
- (void)setCompletedInitialLoad:(BOOL)a3;
- (void)setHandler:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRepository:(id)a3;
@end

@implementation MailSceneBackgroundQueryMonitor

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001202BC;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699710 != -1) {
    dispatch_once(&qword_100699710, block);
  }
  v2 = (void *)qword_100699708;

  return (OS_os_log *)v2;
}

- (MailSceneBackgroundQueryMonitor)initWithQuery:(id)a3 repository:(id)a4 changeTypes:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MailSceneBackgroundQueryMonitor;
  v11 = [(MailSceneBackgroundQueryMonitor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_changeTypes = a5;
    objc_storeStrong((id *)&v11->_query, a3);
    objc_storeStrong((id *)&v12->_repository, a4);
  }

  return v12;
}

- (MailSceneBackgroundQueryMonitor)initWithMessageListItems:(id)a3 messageList:(id)a4 messageRepository:(id)a5 changeTypes:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  v28 = v10;
  id v29 = a5;
  v12 = [v10 ef_compactMapSelector:@"displayMessageObjectID"];
  v13 = [v11 query];
  objc_super v14 = [v13 predicate];

  v15 = 0;
  if ([v12 count] && v14)
  {
    +[EMMessage predicateForMessagesWithObjectIDs:v12];
    uint64_t v32 = v31 = v14;
    v26 = (void *)v32;
    v16 = +[NSArray arrayWithObjects:&v31 count:2];
    v27 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

    v17 = +[EMMessageListItemPredicates sortDescriptorForDateAscending:0];
    id v18 = [v12 count];
    v19 = [v11 ef_publicDescription];
    v20 = +[NSString stringWithFormat:@"MailSceneBackgroundQueryMonitor query of %lu items originating from %@", v18, v19];

    id v21 = objc_alloc((Class)EMQuery);
    uint64_t v22 = objc_opt_class();
    v30 = v17;
    v23 = +[NSArray arrayWithObjects:&v30 count:1];
    id v24 = [v21 initWithTargetClass:v22 predicate:v27 sortDescriptors:v23 queryOptions:0 label:v20];

    self = [(MailSceneBackgroundQueryMonitor *)self initWithQuery:v24 repository:v29 changeTypes:a6];
    v15 = self;
  }

  return v15;
}

- (void)beginMonitoringWithHandler:(id)a3
{
  id v4 = a3;
  [(MailSceneBackgroundQueryMonitor *)self setHandler:v4];
  v5 = [(MailSceneBackgroundQueryMonitor *)self collection];

  if (!v5)
  {
    id v6 = objc_alloc((Class)EMQueryingCollection);
    v7 = [(MailSceneBackgroundQueryMonitor *)self query];
    v8 = [(MailSceneBackgroundQueryMonitor *)self repository];
    id v9 = [v6 initWithQuery:v7 repository:v8];
    [(MailSceneBackgroundQueryMonitor *)self setCollection:v9];

    id v10 = [(MailSceneBackgroundQueryMonitor *)self collection];
    [v10 beginObserving:self];

    id v11 = +[MailSceneBackgroundQueryMonitor log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [(MailSceneBackgroundQueryMonitor *)self collection];
      int v13 = 138412290;
      objc_super v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Created and started observing collection: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)endMonitoring
{
  [(MailSceneBackgroundQueryMonitor *)self setHandler:0];
  [(MailSceneBackgroundQueryMonitor *)self setCompletedInitialLoad:0];
  v3 = [(MailSceneBackgroundQueryMonitor *)self collection];
  [v3 stopObserving:self];

  [(MailSceneBackgroundQueryMonitor *)self setCollection:0];
}

- (void)_changeOccurred:(int64_t)a3
{
  v5 = sub_100120B70(a3);
  if (![(MailSceneBackgroundQueryMonitor *)self completedInitialLoad]
    || (a3 & ~(unint64_t)[(MailSceneBackgroundQueryMonitor *)self changeTypes]) != 0)
  {
    if ([(MailSceneBackgroundQueryMonitor *)self completedInitialLoad])
    {
      v7 = +[MailSceneBackgroundQueryMonitor log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = sub_100120B70((char)[(MailSceneBackgroundQueryMonitor *)self changeTypes]);
        int v9 = 138543618;
        id v10 = v5;
        __int16 v11 = 2114;
        v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Change occurred: %{public}@. Ignoring since we are only reacting to %{public}@", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      v7 = +[MailSceneBackgroundQueryMonitor log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138543362;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Change occurred: %{public}@. Ignoring since initial load has not completed.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    id v6 = +[MailSceneBackgroundQueryMonitor log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Change occurred: %{public}@. Notifying handler...", (uint8_t *)&v9, 0xCu);
    }

    v7 = [(MailSceneBackgroundQueryMonitor *)self handler];
    [v7 monitor:self requestsAction:[(MailSceneBackgroundQueryMonitor *)self action]];
  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v6 = a4;
  v7 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10045B110((uint64_t)&v8, (uint64_t)[v6 count]);
  }

  [(MailSceneBackgroundQueryMonitor *)self _changeOccurred:1];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v6 = a4;
  v7 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10045B110((uint64_t)&v8, (uint64_t)[v6 count]);
  }

  [(MailSceneBackgroundQueryMonitor *)self _changeOccurred:1];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v6 = a4;
  v7 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10045B148((uint64_t)&v8, (uint64_t)[v6 count]);
  }

  [(MailSceneBackgroundQueryMonitor *)self _changeOccurred:2];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v6 = a4;
  v7 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10045B148((uint64_t)&v8, (uint64_t)[v6 count]);
  }

  [(MailSceneBackgroundQueryMonitor *)self _changeOccurred:2];
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v5 = a4;
  id v6 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10045B180((uint64_t)&v7, (uint64_t)[v5 count]);
  }

  [(MailSceneBackgroundQueryMonitor *)self _changeOccurred:4];
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v5 = a4;
  id v6 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10045B1B8((uint64_t)&v7, (uint64_t)[v5 count]);
  }

  [(MailSceneBackgroundQueryMonitor *)self _changeOccurred:8];
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v6 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10045B1F0(v6);
  }

  [(MailSceneBackgroundQueryMonitor *)self _changeOccurred:16];
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4 = +[MailSceneBackgroundQueryMonitor log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10045B234(v4);
  }

  [(MailSceneBackgroundQueryMonitor *)self setCompletedInitialLoad:1];
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = objc_opt_class();
  id v4 = sub_100120B70((char)[(MailSceneBackgroundQueryMonitor *)self changeTypes]);
  id v5 = +[NSString stringWithFormat:@"<%@: %p> observingChanges=%@", v3, self, v4];

  return (NSString *)v5;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
}

- (void)setChangeTypes:(int64_t)a3
{
  self->_changeTypes = a3;
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (EMRepository)repository
{
  return self->_repository;
}

- (void)setRepository:(id)a3
{
}

- (EMQueryingCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (BOOL)completedInitialLoad
{
  return self->_completedInitialLoad;
}

- (void)setCompletedInitialLoad:(BOOL)a3
{
  self->_completedInitialLoad = a3;
}

- (MailSceneBackgroundResultHandler)handler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);

  return (MailSceneBackgroundResultHandler *)WeakRetained;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_repository, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end