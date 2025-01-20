@interface MTSafeUuidQueryObserver
- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (id)addResultsChangedHandler:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerWillChangeContent:(id)a3;
- (void)notifyObservers;
- (void)startObserving;
@end

@implementation MTSafeUuidQueryObserver

- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (NSMutableSet *)objc_opt_new();
  currentItems = self->currentItems;
  self->currentItems = v8;

  v12.receiver = self;
  v12.super_class = (Class)MTSafeUuidQueryObserver;
  v10 = [(MTSafeUuidQueryObserver *)&v12 initWithFetchRequest:v7 managedObjectContext:v6];

  return v10;
}

- (void)startObserving
{
  v4.receiver = self;
  v4.super_class = (Class)MTSafeUuidQueryObserver;
  [(MTSafeUuidQueryObserver *)&v4 startObserving];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001042CC;
  v3[3] = &unk_100550320;
  v3[4] = self;
  [(MTSafeUuidQueryObserver *)self results:v3];
}

- (id)addResultsChangedHandler:(id)a3
{
  id v4 = objc_retainBlock(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTSafeUuidQueryObserver;
  v5 = [(MTSafeUuidQueryObserver *)&v7 addResultsChangedHandler:v4];

  return v5;
}

- (void)notifyObservers
{
  id v3 = [(NSMutableSet *)self->currentItems mutableCopy];
  [v3 intersectSet:self->currentInserts];
  [(NSMutableSet *)self->currentInserts minusSet:v3];
  [(NSMutableSet *)self->currentUpdates unionSet:v3];
  [(NSMutableSet *)self->currentDeletes intersectSet:self->currentItems];
  [(NSMutableSet *)self->currentUpdates intersectSet:self->currentItems];
  [(NSMutableSet *)self->currentItems unionSet:self->currentInserts];
  [(NSMutableSet *)self->currentItems minusSet:self->currentDeletes];
  id v4 = [(NSMutableSet *)self->currentInserts copy];
  id v5 = [(NSMutableSet *)self->currentDeletes copy];
  id v6 = [(NSMutableSet *)self->currentUpdates copy];
  currentInserts = self->currentInserts;
  self->currentInserts = 0;

  currentDeletes = self->currentDeletes;
  self->currentDeletes = 0;

  currentUpdates = self->currentUpdates;
  self->currentUpdates = 0;

  if ([v6 count] || objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
  {
    v10 = [(MTSafeUuidQueryObserver *)self handlers];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100104560;
    v11[3] = &unk_1005517A0;
    id v12 = v5;
    id v13 = v4;
    id v14 = v6;
    [v10 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = (NSMutableSet *)objc_opt_new();
  currentInserts = self->currentInserts;
  self->currentInserts = v4;

  id v6 = (NSMutableSet *)objc_opt_new();
  currentDeletes = self->currentDeletes;
  self->currentDeletes = v6;

  v8 = (NSMutableSet *)objc_opt_new();
  currentUpdates = self->currentUpdates;
  self->currentUpdates = v8;

  _objc_release_x1(v8, currentUpdates);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v9 = a4;
  v10 = [v9 valueForKey:@"uuid"];
  if (v10)
  {
    if (a6 == 2)
    {
      uint64_t v11 = 16;
    }
    else if (a6 == 1)
    {
      uint64_t v11 = 8;
    }
    else
    {
      uint64_t v11 = 24;
    }
    [*(id *)&self->MTBaseQueryObserver_opaque[v11] addObject:v10];
  }
  else
  {
    id v12 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MTSafeUUIDQueryObserver has no UUID for object %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currentItems, 0);
  objc_storeStrong((id *)&self->currentUpdates, 0);
  objc_storeStrong((id *)&self->currentDeletes, 0);

  objc_storeStrong((id *)&self->currentInserts, 0);
}

@end