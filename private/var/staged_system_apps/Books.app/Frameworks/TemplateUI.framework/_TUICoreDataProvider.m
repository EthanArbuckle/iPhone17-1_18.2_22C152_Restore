@interface _TUICoreDataProvider
- (NSFetchedResultsController)controller;
- (TUIDynamicArray)limitedArray;
- (TUIMutableDynamicArray)rootArray;
- (TUITransaction)transaction;
- (_TUICoreDataGeneration)captureGeneration;
- (_TUICoreDataProvider)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4;
- (id)_startObserving;
- (unint64_t)countForGeneration:(id)a3;
- (unint64_t)fetchLimit;
- (void)_contextDidMergeChanges:(id)a3;
- (void)_contextDidSave:(id)a3;
- (void)_updatePredicate:(id)a3;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerWillChangeContent:(id)a3;
- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5;
- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5;
@end

@implementation _TUICoreDataProvider

- (_TUICoreDataProvider)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_TUICoreDataProvider;
  v8 = [(_TUICoreDataProvider *)&v18 init];
  if (v8)
  {
    id v9 = [v6 copy];

    id v10 = [v9 fetchLimit];
    v8->_fetchLimit = (unint64_t)v10;
    if (v10)
    {
      [v9 setFetchLimit:0];
      [v9 setFetchBatchSize:v8->_fetchLimit];
    }
    v11 = (NSFetchedResultsController *)[objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v9 managedObjectContext:v7 sectionNameKeyPath:0 cacheName:0];
    controller = v8->_controller;
    v8->_controller = v11;

    [(NSFetchedResultsController *)v8->_controller setDelegate:v8];
    v13 = +[NSNotificationCenter defaultCenter];
    v14 = [(NSFetchedResultsController *)v8->_controller managedObjectContext];
    [v13 addObserver:v8 selector:"_contextDidSave:" name:NSManagedObjectContextDidSaveNotification object:v14];

    v15 = +[NSNotificationCenter defaultCenter];
    v16 = [(NSFetchedResultsController *)v8->_controller managedObjectContext];
    [v15 addObserver:v8 selector:"_contextDidMergeChanges:" name:NSManagedObjectContextDidMergeChangesObjectIDsNotification object:v16];
  }
  else
  {
    id v9 = v6;
  }

  return v8;
}

- (unint64_t)countForGeneration:(id)a3
{
  return (unint64_t)[a3 count];
}

- (void)fetchDataForRange:(_NSRange)a3 generation:(id)a4 block:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_331E0;
  v9[3] = &unk_252628;
  id v10 = a5;
  NSUInteger v11 = location;
  NSUInteger v12 = length;
  id v8 = v10;
  [a4 performBlockAndWait:v9];
}

- (void)fetchDataForIndexes:(id)a3 generation:(id)a4 block:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_333D4;
  v9[3] = &unk_252650;
  id v10 = a3;
  id v11 = a5;
  id v7 = v10;
  id v8 = v11;
  [a4 performBlockAndWait:v9];
}

- (id)_startObserving
{
  [(NSFetchedResultsController *)self->_controller managedObjectContext];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  NSUInteger v12 = sub_3361C;
  v13 = sub_3362C;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_33634;
  v6[3] = &unk_251800;
  v6[4] = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  id v8 = &v9;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)_updatePredicate:(id)a3
{
  id v4 = a3;
  v5 = [(NSFetchedResultsController *)self->_controller fetchRequest];
  id v6 = [v5 copy];

  [v6 setFetchBatchSize:0];
  [v6 setFetchLimit:self->_fetchLimit];
  [v6 setResultType:1];
  id v7 = [v6 copy];
  [v7 setPredicate:v4];
  id v8 = [(NSFetchedResultsController *)self->_controller managedObjectContext];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_338FC;
  v12[3] = &unk_252678;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  id v11 = v6;
  [v8 performBlockAndWait:v12];
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = [_TUICoreDataGeneration alloc];
  v5 = [(NSFetchedResultsController *)self->_controller managedObjectContext];
  id v6 = [(NSFetchedResultsController *)self->_controller fetchRequest];
  id v7 = [(_TUICoreDataGeneration *)v4 initWithContext:v5 fetchRequest:v6];
  captureGeneration = self->_captureGeneration;
  self->_captureGeneration = v7;

  id v9 = +[TUITransactionOptions defaultImplicitOptions];
  id v10 = +[TUITransaction transactionWithOptions:v9];
  transaction = self->_transaction;
  self->_transaction = v10;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
  [WeakRetained _beginBatchUpdatesWithTransaction:self->_transaction generation:self->_captureGeneration];
}

- (void)_contextDidSave:(id)a3
{
  captureGeneration = self->_captureGeneration;
  if (captureGeneration)
  {
    v5 = [(NSFetchedResultsController *)self->_controller fetchedObjects];
    -[_TUICoreDataGeneration updateCount:](captureGeneration, "updateCount:", [v5 count]);

    id v6 = self->_captureGeneration;
    id v7 = [(NSFetchedResultsController *)self->_controller managedObjectContext];
    [(_TUICoreDataGeneration *)v6 captureTokenFromContext:v7];

    id v8 = self->_captureGeneration;
    self->_captureGeneration = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
    [WeakRetained _endBatchUpdates];

    [(TUITransaction *)self->_transaction commit];
    transaction = self->_transaction;
    self->_transaction = 0;
  }
}

- (void)_contextDidMergeChanges:(id)a3
{
  captureGeneration = self->_captureGeneration;
  if (captureGeneration)
  {
    v5 = [(NSFetchedResultsController *)self->_controller fetchedObjects];
    -[_TUICoreDataGeneration updateCount:](captureGeneration, "updateCount:", [v5 count]);

    id v6 = self->_captureGeneration;
    id v7 = [(NSFetchedResultsController *)self->_controller managedObjectContext];
    [(_TUICoreDataGeneration *)v6 captureTokenFromContext:v7];

    id v8 = self->_captureGeneration;
    self->_captureGeneration = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
    [WeakRetained _endBatchUpdates];

    [(TUITransaction *)self->_transaction commit];
    transaction = self->_transaction;
    self->_transaction = 0;
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  switch(a6)
  {
    case 1uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      [WeakRetained insertItemAtIndex:[v14 tui_row]];
      goto LABEL_6;
    case 2uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      [WeakRetained deleteItemAtIndex:[v13 tui_row]];
      goto LABEL_6;
    case 3uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      [WeakRetained moveItemFromIndex:[v13 tui_row] toIndex:[v14 tui_row]];
      goto LABEL_6;
    case 4uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);
      [WeakRetained updateItemAtIndex:[v13 tui_row]];
LABEL_6:

      break;
    default:
      break;
  }
}

- (TUIMutableDynamicArray)rootArray
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootArray);

  return (TUIMutableDynamicArray *)WeakRetained;
}

- (TUIDynamicArray)limitedArray
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_limitedArray);

  return (TUIDynamicArray *)WeakRetained;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (NSFetchedResultsController)controller
{
  return self->_controller;
}

- (_TUICoreDataGeneration)captureGeneration
{
  return self->_captureGeneration;
}

- (TUITransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_captureGeneration, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_limitedArray);

  objc_destroyWeak((id *)&self->_rootArray);
}

@end