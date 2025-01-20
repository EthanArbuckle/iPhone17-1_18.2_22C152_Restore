@interface PDPostMigrationContext
- (BOOL)hasDatabasePopulationOperations;
- (PDPostMigrationContext)init;
- (PDPostMigrationContext)initWithDatabase:(id)a3;
- (void)addAutomaticSelectionCriteriaRegeneration;
- (void)addDatabasePopulationOperation:(id)a3;
- (void)addPassDaemonDataRegeneration;
- (void)addPassStyleRegeneration;
- (void)addPaymentApplicationRegeneration;
- (void)addPostMigrationOperation:(id)a3;
- (void)performDatabasePopulationOperationsWithPasses:(id)a3;
- (void)performPostMigrationOperations;
@end

@implementation PDPostMigrationContext

- (PDPostMigrationContext)init
{
  return 0;
}

- (PDPostMigrationContext)initWithDatabase:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDPostMigrationContext;
  v6 = [(PDPostMigrationContext *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    databasePopulationOperations = v7->_databasePopulationOperations;
    v7->_databasePopulationOperations = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    postMigrationOperations = v7->_postMigrationOperations;
    v7->_postMigrationOperations = v10;
  }
  return v7;
}

- (void)addDatabasePopulationOperation:(id)a3
{
  databasePopulationOperations = self->_databasePopulationOperations;
  id v4 = [a3 copy];
  [(NSMutableArray *)databasePopulationOperations addObject:v4];
}

- (void)addPostMigrationOperation:(id)a3
{
  postMigrationOperations = self->_postMigrationOperations;
  id v4 = [a3 copy];
  [(NSMutableArray *)postMigrationOperations addObject:v4];
}

- (BOOL)hasDatabasePopulationOperations
{
  return [(NSMutableArray *)self->_databasePopulationOperations count] != 0;
}

- (void)performDatabasePopulationOperationsWithPasses:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = (char *)[v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        v9 = self->_databasePopulationOperations;
        id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            objc_super v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * (void)v13) + 16))();
              objc_super v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = (char *)[v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
}

- (void)performPostMigrationOperations
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_postMigrationOperations;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v7 + 1) + 8 * (void)v6));
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)addAutomaticSelectionCriteriaRegeneration
{
  if (!self->_willRegenerateAutomaticSelectionCriteria && !self->_willRegeneratePaymentApplications)
  {
    self->_willRegenerateAutomaticSelectionCriteria = 1;
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100411394;
    v3[3] = &unk_10074FC48;
    objc_copyWeak(&v4, &location);
    [(PDPostMigrationContext *)self addDatabasePopulationOperation:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)addPaymentApplicationRegeneration
{
  if (!self->_willRegeneratePaymentApplications)
  {
    self->_willRegeneratePaymentApplications = 1;
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100411738;
    v3[3] = &unk_10074FC48;
    objc_copyWeak(&v4, &location);
    [(PDPostMigrationContext *)self addDatabasePopulationOperation:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)addPassDaemonDataRegeneration
{
  if (!self->_willRegeneratePassDaemonData)
  {
    self->_willRegeneratePassDaemonData = 1;
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100411AF4;
    v3[3] = &unk_10074FC48;
    objc_copyWeak(&v4, &location);
    [(PDPostMigrationContext *)self addDatabasePopulationOperation:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)addPassStyleRegeneration
{
  if (!self->_willRegeneratePassStyle)
  {
    self->_willRegeneratePassStyle = 1;
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100411D70;
    v3[3] = &unk_10074FC48;
    objc_copyWeak(&v4, &location);
    [(PDPostMigrationContext *)self addDatabasePopulationOperation:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postMigrationOperations, 0);
  objc_storeStrong((id *)&self->_databasePopulationOperations, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end