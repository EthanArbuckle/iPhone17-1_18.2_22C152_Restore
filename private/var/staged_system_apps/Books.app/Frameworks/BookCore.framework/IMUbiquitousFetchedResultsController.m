@interface IMUbiquitousFetchedResultsController
- (IMUbiquitousFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4 sectionNameKeyPath:(id)a5 cacheName:(id)a6;
- (NSOperationQueue)queue;
- (void)coordinatorWillRemoveStore:(id)a3;
- (void)dealloc;
- (void)setQueue:(id)a3;
@end

@implementation IMUbiquitousFetchedResultsController

- (IMUbiquitousFetchedResultsController)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4 sectionNameKeyPath:(id)a5 cacheName:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)IMUbiquitousFetchedResultsController;
  v6 = [(IMUbiquitousFetchedResultsController *)&v11 initWithFetchRequest:a3 managedObjectContext:a4 sectionNameKeyPath:a5 cacheName:a6];
  if (v6)
  {
    uint64_t v7 = +[NSOperationQueue currentQueue];
    queue = v6->_queue;
    v6->_queue = (NSOperationQueue *)v7;

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v6 selector:"coordinatorWillRemoveStore:" name:NSPersistentStoreCoordinatorStoresDidChangeNotification object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSPersistentStoreCoordinatorStoresDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)IMUbiquitousFetchedResultsController;
  [(IMUbiquitousFetchedResultsController *)&v4 dealloc];
}

- (void)coordinatorWillRemoveStore:(id)a3
{
  objc_super v4 = [a3 object];
  v5 = [v4 persistentStoreCoordinator];
  v6 = [(IMUbiquitousFetchedResultsController *)self managedObjectContext];
  uint64_t v7 = [v6 persistentStoreCoordinator];
  unsigned int v8 = [v5 isEqual:v7];

  if (v8)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_182E90;
    v15[3] = &unk_2C3C50;
    v15[4] = self;
    v9 = objc_retainBlock(v15);
    v10 = +[NSOperationQueue currentQueue];
    objc_super v11 = [(IMUbiquitousFetchedResultsController *)self queue];

    if (v10 == v11)
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      v12 = +[NSBlockOperation blockOperationWithBlock:v9];
      [v12 setQueuePriority:8];
      v13 = [(IMUbiquitousFetchedResultsController *)self queue];
      v14 = +[NSArray arrayWithObject:v12];
      [v13 addOperations:v14 waitUntilFinished:1];
    }
  }
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end