@interface MFSearchableIndexManager_iOS
+ (BOOL)shouldCancelSearchQuery;
+ (void)addSearchQueryCancelable:(id)a3;
+ (void)removeSearchQueryCancelable:(id)a3;
- (EDSearchableIndex)index;
- (EDSearchableIndexPersistence)persistence;
- (EDSearchableIndexScheduler)scheduler;
- (MFSearchableIndexManager_iOS)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6;
- (void)enableIndexingAndBeginScheduling:(BOOL)a3;
- (void)enableIndexingAndBeginScheduling:(BOOL)a3 budgetConfiguration:(id)a4;
- (void)setIndex:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation MFSearchableIndexManager_iOS

+ (BOOL)shouldCancelSearchQuery
{
  v2 = +[MFActivityMonitor currentMonitor];
  char v3 = [v2 shouldCancel];

  return v3;
}

+ (void)addSearchQueryCancelable:(id)a3
{
  id v4 = a3;
  char v3 = +[MFActivityMonitor currentMonitor];
  [v3 addCancelable:v4];
}

+ (void)removeSearchQueryCancelable:(id)a3
{
  id v4 = a3;
  char v3 = +[MFActivityMonitor currentMonitor];
  [v3 removeCancelable:v4];
}

- (MFSearchableIndexManager_iOS)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MFSearchableIndexManager_iOS;
  v14 = [(EDSearchableIndexManager *)&v18 initWithDatabase:v10 messagePersistence:v11 richLinkPersistence:v12 hookResponder:v13];
  if (v14)
  {
    v15 = [(EDSearchableIndexPersistence *)[MFSearchableIndexPersistence_iOS alloc] initWithDatabase:v10 messagePersistence:v11 richLinkPersistence:v12 hookResponder:v13];
    persistence = v14->_persistence;
    v14->_persistence = &v15->super;
  }
  return v14;
}

- (void)enableIndexingAndBeginScheduling:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F60C18] defaultConfiguration];
  -[MFSearchableIndexManager_iOS enableIndexingAndBeginScheduling:budgetConfiguration:](self, "enableIndexingAndBeginScheduling:budgetConfiguration:", v3);
}

- (void)enableIndexingAndBeginScheduling:(BOOL)a3 budgetConfiguration:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_indexLock);
  v7 = [(MFSearchableIndexManager_iOS *)self index];

  if (!v7)
  {
    v8 = [MFSearchableIndex_iOS alloc];
    v9 = [(id)objc_opt_class() searchableIndexName];
    id v10 = [(MFSearchableIndex_iOS *)v8 initWithName:v9 dataSource:self->_persistence];
    [(MFSearchableIndexManager_iOS *)self setIndex:v10];

    id v11 = [(id)objc_opt_class() searchableIndexBundleID];
    id v12 = [(MFSearchableIndexManager_iOS *)self index];
    [v12 setSearchableIndexBundleID:v11];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F60C48]) initWithSchedulable:self->_index budgetConfiguration:v6];
    [(MFSearchableIndexManager_iOS *)self setScheduler:v13];

    v14 = [(MFSearchableIndexManager_iOS *)self scheduler];
    v15 = [(MFSearchableIndexManager_iOS *)self index];
    [v15 setSchedulableDelegate:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F60C78]);
    v17 = [(MFSearchableIndexManager_iOS *)self index];
    objc_super v18 = [(EDSearchableIndexPersistence *)self->_persistence messagePersistence];
    v19 = (void *)[v16 initWithSearchableIndex:v17 persistence:v18];
    [(EDSearchableIndexManager *)self setSpotlightDaemonClient:v19];
  }
  os_unfair_lock_unlock(&self->_indexLock);
  v20.receiver = self;
  v20.super_class = (Class)MFSearchableIndexManager_iOS;
  [(EDSearchableIndexManager *)&v20 enableIndexingAndBeginScheduling:v4 budgetConfiguration:v6];
}

- (EDSearchableIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (EDSearchableIndexPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (EDSearchableIndexScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end