@interface _TUICoreDataGeneration
- (_TUICoreDataGeneration)initWithContext:(id)a3 fetchRequest:(id)a4;
- (id)description;
- (unint64_t)count;
- (void)captureTokenFromContext:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)updateCount:(unint64_t)a3;
@end

@implementation _TUICoreDataGeneration

- (_TUICoreDataGeneration)initWithContext:(id)a3 fetchRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_TUICoreDataGeneration;
  v8 = [(_TUICoreDataGeneration *)&v14 init];
  if (v8)
  {
    v9 = (NSFetchRequest *)[v7 copy];
    fetchRequest = v8->_fetchRequest;
    v8->_fetchRequest = v9;

    v8->_fetchLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = [v6 persistentStoreCoordinator];
    coordinator = v8->_coordinator;
    v8->_coordinator = (NSPersistentStoreCoordinator *)v11;

    v8->_count = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)updateCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void)captureTokenFromContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_32C5C;
  v4[3] = &unk_251828;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@ qgt=%@>", v4, self->_token];

  return v5;
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchLock);
  if (!self->_context)
  {
    id v5 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    context = self->_context;
    self->_context = v5;

    [(NSManagedObjectContext *)self->_context setPersistentStoreCoordinator:self->_coordinator];
    [(NSManagedObjectContext *)self->_context setUndoManager:0];
  }
  id v7 = self->_context;
  if (self->_fetched)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_32F00;
    v11[3] = &unk_252600;
    v11[4] = self;
    id v12 = v4;
    id v8 = v4;
    [(NSManagedObjectContext *)v7 performBlockAndWait:v11];
    v9 = v12;
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_32E88;
    v13[3] = &unk_2525D8;
    v13[4] = self;
    id v14 = v4;
    id v10 = v4;
    [(NSManagedObjectContext *)v7 performBlockAndWait:v13];
    self->_fetched = 1;
    v9 = v14;
  }

  os_unfair_lock_unlock(&self->_fetchLock);
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end