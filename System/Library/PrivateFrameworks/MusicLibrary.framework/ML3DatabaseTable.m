@interface ML3DatabaseTable
- (NSArray)columns;
- (NSArray)foreignKeyConstraints;
- (NSString)name;
- (id)_copyWithZone:(_NSZone *)a3 concreteClass:(Class)a4;
- (id)columnDefinitionsSQL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createTableSQLWithExistenceClause:(BOOL)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation ML3DatabaseTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignKeyConstraints, 0);
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)foreignKeyConstraints
{
  return self->_foreignKeyConstraints;
}

- (NSArray)columns
{
  return self->_columns;
}

- (NSString)name
{
  return self->_name;
}

- (id)_copyWithZone:(_NSZone *)a3 concreteClass:(Class)a4
{
  v5 = [[(objc_class *)a4 allocWithZone:a3] init];
  v6 = [(ML3DatabaseTable *)self name];
  uint64_t v7 = [v6 copy];
  v8 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v7;

  v9 = [(ML3DatabaseTable *)self columns];
  uint64_t v10 = [v9 copy];
  v11 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v10;

  v12 = [(ML3DatabaseTable *)self foreignKeyConstraints];
  uint64_t v13 = [v12 copy];
  v14 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v13;

  return v5;
}

- (id)createTableSQLWithExistenceClause:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = [(ML3DatabaseTable *)self columnDefinitionsSQL];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [(ML3DatabaseTable *)self foreignKeyConstraints];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v23 + 1) + 8 * i) _foreignKeyClauseSQL];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v6 componentsJoinedByString:@", "];
  v14 = &stru_1F08D4D70;
  if (v3) {
    v14 = @" IF NOT EXISTS";
  }
  v15 = v14;
  uint64_t v16 = [v6 count];
  v17 = NSString;
  uint64_t v18 = [(ML3DatabaseTable *)self name];
  v19 = (void *)v18;
  if (v16) {
    [v17 stringWithFormat:@"CREATE TABLE%@ %@ (%@, %@)", v15, v18, v5, v13];
  }
  else {
  v20 = [v17 stringWithFormat:@"CREATE TABLE%@ %@ (%@)", v15, v18, v5, v22];
  }

  return v20;
}

- (id)columnDefinitionsSQL
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(ML3DatabaseTable *)self columns];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) _columnDefinitionSQL];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 componentsJoinedByString:@", "];

  return v10;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ML3DatabaseTable *)self _copyWithZone:a3 concreteClass:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(ML3DatabaseTable *)self _copyWithZone:a3 concreteClass:v5];
}

@end