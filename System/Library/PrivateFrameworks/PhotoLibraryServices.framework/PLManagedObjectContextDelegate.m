@interface PLManagedObjectContextDelegate
- (NSSQLiteDatabaseTraceDelegate)fetchRecorder;
- (NSSQLiteDatabaseTraceDelegate)photoKitFetchInstrumentation;
- (NSSQLiteDatabaseTraceDelegate)photoKitStatsTracker;
- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7;
- (void)managedObjectContext:(id)a3 willExecuteFetchRequest:(id)a4;
- (void)setFetchRecorder:(id)a3;
- (void)setPhotoKitFetchInstrumentation:(id)a3;
- (void)setPhotoKitStatsTracker:(id)a3;
@end

@implementation PLManagedObjectContextDelegate

id __66__PLManagedObjectContextDelegate_setPhotoKitFetchInstrumentation___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

id __62__PLManagedObjectContextDelegate_photoKitFetchInstrumentation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  return WeakRetained;
}

id __54__PLManagedObjectContextDelegate_photoKitStatsTracker__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  return WeakRetained;
}

id __47__PLManagedObjectContextDelegate_fetchRecorder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  return WeakRetained;
}

- (void)setPhotoKitFetchInstrumentation:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(PLManagedObjectContextDelegate *)self fetchRecorder];
  [v16 managedObjectContext:v15 didExecuteFetchRequest:v14 withSQLString:v13 bindVariables:v12 rowCount:a7];

  v17 = [(PLManagedObjectContextDelegate *)self photoKitFetchInstrumentation];
  [v17 managedObjectContext:v15 didExecuteFetchRequest:v14 withSQLString:v13 bindVariables:v12 rowCount:a7];

  id v18 = [(PLManagedObjectContextDelegate *)self photoKitStatsTracker];
  [v18 managedObjectContext:v15 didExecuteFetchRequest:v14 withSQLString:v13 bindVariables:v12 rowCount:a7];
}

- (void)managedObjectContext:(id)a3 willExecuteFetchRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PLManagedObjectContextDelegate *)self fetchRecorder];
  [v8 managedObjectContext:v7 willExecuteFetchRequest:v6];

  v9 = [(PLManagedObjectContextDelegate *)self photoKitFetchInstrumentation];
  [v9 managedObjectContext:v7 willExecuteFetchRequest:v6];

  id v10 = [(PLManagedObjectContextDelegate *)self photoKitStatsTracker];
  [v10 managedObjectContext:v7 willExecuteFetchRequest:v6];
}

- (NSSQLiteDatabaseTraceDelegate)photoKitStatsTracker
{
  v2 = PLResultWithUnfairLock();
  return (NSSQLiteDatabaseTraceDelegate *)v2;
}

- (NSSQLiteDatabaseTraceDelegate)photoKitFetchInstrumentation
{
  v2 = PLResultWithUnfairLock();
  return (NSSQLiteDatabaseTraceDelegate *)v2;
}

- (NSSQLiteDatabaseTraceDelegate)fetchRecorder
{
  v2 = PLResultWithUnfairLock();
  return (NSSQLiteDatabaseTraceDelegate *)v2;
}

- (void)setFetchRecorder:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

id __51__PLManagedObjectContextDelegate_setFetchRecorder___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoKitStatsTracker);
  objc_destroyWeak((id *)&self->_photoKitFetchInstrumentation);
  objc_destroyWeak((id *)&self->_fetchRecorder);
}

- (void)setPhotoKitStatsTracker:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

id __58__PLManagedObjectContextDelegate_setPhotoKitStatsTracker___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

@end