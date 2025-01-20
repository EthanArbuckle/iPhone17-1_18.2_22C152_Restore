@interface BKPaginationOperation
- (AEAnnotationProvider)annotationProvider;
- (BKPaginationJob)job;
- (BKPaginationOperationController)paginationOperationController;
- (BOOL)isJobGenerationValid;
- (BOOL)needsBookManagedObjectContext;
- (NSManagedObjectID)bookObjectID;
- (NSString)bookDatabaseKey;
- (id)init:(id)a3 paginationOperationController:(id)a4 annotationProvider:(id)a5;
- (void)cancel;
- (void)main;
- (void)performBackgroundAnnotationsBlockAndWait:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)setAnnotationProvider:(id)a3;
- (void)setBookDatabaseKey:(id)a3;
- (void)setBookObjectID:(id)a3;
- (void)setPaginationOperationController:(id)a3;
@end

@implementation BKPaginationOperation

- (id)init:(id)a3 paginationOperationController:(id)a4 annotationProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(BKPaginationOperation *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_job, a3);
    uint64_t v14 = [v10 persistentStoreCoordinator];
    psc = v13->_psc;
    v13->_psc = (NSPersistentStoreCoordinator *)v14;

    uint64_t v16 = [v10 bookObjectID];
    bookObjectID = v13->_bookObjectID;
    v13->_bookObjectID = (NSManagedObjectID *)v16;

    v18 = [v10 bookDatabaseKey];
    v19 = (NSString *)[v18 copy];
    bookDatabaseKey = v13->_bookDatabaseKey;
    v13->_bookDatabaseKey = v19;

    objc_storeWeak((id *)&v13->_paginationOperationController, v10);
    objc_storeStrong((id *)&v13->_annotationProvider, a5);
  }

  return v13;
}

- (BOOL)isJobGenerationValid
{
  v2 = self;
  v3 = [(BKPaginationOperation *)self paginationOperationController];
  id v4 = [v3 jobGeneration];
  LOBYTE(v2) = v4 == (id)[(BKPaginationJob *)v2->_job jobGeneration];

  return (char)v2;
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self->_operationMoc;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8C0F8;
    v7[3] = &unk_1DB210;
    v8 = v5;
    id v9 = v4;
    v6 = v5;
    [(NSManagedObjectContext *)v6 performBlockAndWait:v7];
  }
}

- (void)performBackgroundAnnotationsBlockAndWait:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(BKPaginationOperation *)self annotationProvider];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8C1F0;
    v6[3] = &unk_1DCC28;
    id v7 = v4;
    [v5 performBlockOnUserSideQueueAndWait:v6];
  }
}

- (void)cancel
{
  objc_storeWeak((id *)&self->_paginationOperationController, 0);
  v3.receiver = self;
  v3.super_class = (Class)BKPaginationOperation;
  [(BKPaginationOperation *)&v3 cancel];
}

- (BOOL)needsBookManagedObjectContext
{
  return 1;
}

- (void)main
{
  if ([(BKPaginationOperation *)self needsBookManagedObjectContext])
  {
    id v4 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    operationMoc = self->_operationMoc;
    self->_operationMoc = v4;

    [(NSManagedObjectContext *)self->_operationMoc setPersistentStoreCoordinator:self->_psc];
    [(NSManagedObjectContext *)self->_operationMoc setMergePolicy:NSRollbackMergePolicy];
  }
  if (([(BKPaginationOperation *)self isCancelled] & 1) == 0) {
    [(BKPaginationOperation *)self execute];
  }
  v6 = self->_operationMoc;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_8C3D4;
  v8[3] = &unk_1DAB88;
  v8[4] = self;
  [(NSManagedObjectContext *)v6 performBlockAndWait:v8];
  id v7 = self->_operationMoc;
  self->_operationMoc = 0;

  objc_storeWeak((id *)&self->_paginationOperationController, 0);
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (void)setAnnotationProvider:(id)a3
{
}

- (BKPaginationJob)job
{
  return self->_job;
}

- (NSString)bookDatabaseKey
{
  return self->_bookDatabaseKey;
}

- (void)setBookDatabaseKey:(id)a3
{
}

- (BKPaginationOperationController)paginationOperationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paginationOperationController);

  return (BKPaginationOperationController *)WeakRetained;
}

- (void)setPaginationOperationController:(id)a3
{
}

- (NSManagedObjectID)bookObjectID
{
  return self->_bookObjectID;
}

- (void)setBookObjectID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_destroyWeak((id *)&self->_paginationOperationController);
  objc_storeStrong((id *)&self->_bookDatabaseKey, 0);
  objc_storeStrong((id *)&self->_bookObjectID, 0);
  objc_storeStrong((id *)&self->_operationMoc, 0);
  objc_storeStrong((id *)&self->_psc, 0);

  objc_storeStrong((id *)&self->_job, 0);
}

@end