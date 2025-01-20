@interface WFCoherenceDatabaseResult
- (WFCoherenceDatabaseResult)initWithDatabase:(id)a3 libraryQuery:(id)a4;
- (WFLibraryQuery)libraryQuery;
- (id)description;
- (id)unsearchedDescriptorsWithError:(id *)a3;
@end

@implementation WFCoherenceDatabaseResult

- (void).cxx_destruct
{
}

- (WFLibraryQuery)libraryQuery
{
  return self->_libraryQuery;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFCoherenceDatabaseResult *)self libraryQuery];
  v7 = [v3 stringWithFormat:@"<%@: %p, query: %@>", v5, self, v6];

  return v7;
}

- (id)unsearchedDescriptorsWithError:(id *)a3
{
  v5 = [(WFCoherenceDatabaseResult *)self libraryQuery];
  uint64_t v6 = [v5 type];

  if (v6 == 1)
  {
    v7 = [(WFCoherenceDatabaseResult *)self libraryQuery];
    uint64_t v14 = [(WFDatabaseResult *)self database];
    v9 = (void *)v14;
    if (v14) {
      v15 = *(void **)(v14 + 120);
    }
    else {
      v15 = 0;
    }
    id v11 = v15;
    v12 = [(WFDatabaseResult *)self database];
    uint64_t v13 = [v7 performReturningShortcutsIn:v11 database:v12 error:a3];
    goto LABEL_9;
  }
  if (!v6)
  {
    v7 = [(WFCoherenceDatabaseResult *)self libraryQuery];
    uint64_t v8 = [(WFDatabaseResult *)self database];
    v9 = (void *)v8;
    if (v8) {
      v10 = *(void **)(v8 + 120);
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    v12 = [(WFDatabaseResult *)self database];
    uint64_t v13 = [v7 performReturningCollectionsIn:v11 database:v12 error:a3];
LABEL_9:
    v16 = (void *)v13;

    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:
  return v16;
}

- (WFCoherenceDatabaseResult)initWithDatabase:(id)a3 libraryQuery:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFCoherenceDatabaseResult;
  uint64_t v8 = [(WFDatabaseResult *)&v12 _init];
  v9 = v8;
  if (v8)
  {
    [(WFDatabaseResult *)v8 setDatabase:v6];
    objc_storeStrong((id *)&v9->_libraryQuery, a4);
    [v6 startObservingChangesForResult:v9];
    v10 = v9;
  }

  return v9;
}

@end