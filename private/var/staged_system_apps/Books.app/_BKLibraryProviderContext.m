@interface _BKLibraryProviderContext
+ (id)sharedInstance;
- (NSManagedObjectContext)moc;
- (id)initSingleton;
- (void)_mocDidSaveNotification:(id)a3;
- (void)dealloc;
@end

@implementation _BKLibraryProviderContext

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

+ (id)sharedInstance
{
  if (qword_100B4A400 != -1) {
    dispatch_once(&qword_100B4A400, &stru_100A47AD8);
  }
  v2 = (void *)qword_100B4A3F8;

  return v2;
}

- (id)initSingleton
{
  v10.receiver = self;
  v10.super_class = (Class)_BKLibraryProviderContext;
  v2 = [(_BKLibraryProviderContext *)&v10 init];
  if (v2)
  {
    v3 = +[BKLibraryManager defaultManager];
    v4 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    moc = v2->_moc;
    v2->_moc = v4;

    v6 = v2->_moc;
    v7 = [v3 persistentStoreCoordinator];
    [(NSManagedObjectContext *)v6 setPersistentStoreCoordinator:v7];

    [(NSManagedObjectContext *)v2->_moc setUndoManager:0];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_mocDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)_BKLibraryProviderContext;
  [(_BKLibraryProviderContext *)&v4 dealloc];
}

- (void)_mocDidSaveNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 object];
  moc = self->_moc;
  if (moc != v5)
  {
    v7 = [(NSManagedObjectContext *)moc persistentStoreCoordinator];
    uint64_t v8 = [(NSManagedObjectContext *)v5 persistentStoreCoordinator];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      objc_super v10 = [(NSManagedObjectContext *)self->_moc persistentStoreCoordinator];
      v11 = [(NSManagedObjectContext *)v5 persistentStoreCoordinator];
      unsigned int v12 = [v10 hasStoreInCommonWith:v11];

      if (!v12) {
        goto LABEL_7;
      }
    }
    v13 = [(_BKLibraryProviderContext *)self moc];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001314F8;
    v14[3] = &unk_100A43DD8;
    v14[4] = self;
    id v15 = v4;
    [v13 performBlock:v14];
  }
LABEL_7:
}

- (void).cxx_destruct
{
}

@end