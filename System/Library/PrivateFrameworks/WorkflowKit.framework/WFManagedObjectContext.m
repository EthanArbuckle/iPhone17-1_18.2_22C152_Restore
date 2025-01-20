@interface WFManagedObjectContext
- (WFDatabase)database;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (void)logFaultForIncompatibleSortDescriptorsInFetchRequest:(id)a3;
- (void)setDatabase:(id)a3;
@end

@implementation WFManagedObjectContext

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(WFManagedObjectContext *)self logFaultForIncompatibleSortDescriptorsInFetchRequest:v6];
  v9.receiver = self;
  v9.super_class = (Class)WFManagedObjectContext;
  v7 = [(WFManagedObjectContext *)&v9 executeFetchRequest:v6 error:a4];

  return v7;
}

- (void)logFaultForIncompatibleSortDescriptorsInFetchRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 includesPendingChanges]
    && [v4 resultType] != 2
    && [(WFManagedObjectContext *)self hasChanges])
  {
    v5 = [v4 sortDescriptors];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __79__WFManagedObjectContext_logFaultForIncompatibleSortDescriptorsInFetchRequest___block_invoke;
    v15 = &unk_1E6558FF8;
    id v6 = v4;
    id v16 = v6;
    v17 = self;
    v7 = objc_msgSend(v5, "if_firstObjectPassingTest:", &v12);

    if (v7)
    {
      v8 = getWFDatabaseLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        objc_super v9 = [(WFManagedObjectContext *)self insertedObjects];
        v10 = [(WFManagedObjectContext *)self deletedObjects];
        v11 = [(WFManagedObjectContext *)self updatedObjects];
        *(_DWORD *)buf = 136316162;
        v19 = "-[WFManagedObjectContext logFaultForIncompatibleSortDescriptorsInFetchRequest:]";
        __int16 v20 = 2114;
        id v21 = v6;
        __int16 v22 = 2114;
        v23 = v9;
        __int16 v24 = 2114;
        v25 = v10;
        __int16 v26 = 2114;
        v27 = v11;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Fetch requests with sort descriptors referencing parent entity cannot be run on dirty contexts. Fetch request: %{public}@, inserted: %{public}@, deleted: %{public}@, updated: %{public}@", buf, 0x34u);
      }
    }
  }
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
}

- (WFDatabase)database
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_database);
  return (WFDatabase *)WeakRetained;
}

uint64_t __79__WFManagedObjectContext_logFaultForIncompatibleSortDescriptorsInFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 key];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1C0A8];
    id v6 = [*(id *)(a1 + 32) entityName];
    v7 = [v5 entityForName:v6 inManagedObjectContext:*(void *)(a1 + 40)];

    v8 = [v7 relationshipsByName];
    objc_super v9 = [v3 key];
    v10 = [v8 objectForKeyedSubscript:v9];

    v11 = [v10 inverseRelationship];
    if (v11 && [v10 isToMany] && objc_msgSend(v11, "isToMany")) {
      uint64_t v12 = [v11 isOrdered];
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end