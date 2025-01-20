@interface ML3DatabaseForeignKeyConstraint
- (ML3DatabaseForeignKeyConstraint)initWithForeignTable:(id)a3 localColumns:(id)a4 foreignColumns:(id)a5;
- (ML3DatabaseTable)foreignTable;
- (NSArray)foreignColumns;
- (NSArray)localColumns;
- (id)_foreignKeyClauseSQL;
@end

@implementation ML3DatabaseForeignKeyConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foreignColumns, 0);
  objc_storeStrong((id *)&self->_localColumns, 0);

  objc_storeStrong((id *)&self->_foreignTable, 0);
}

- (NSArray)foreignColumns
{
  return self->_foreignColumns;
}

- (NSArray)localColumns
{
  return self->_localColumns;
}

- (ML3DatabaseTable)foreignTable
{
  return self->_foreignTable;
}

- (id)_foreignKeyClauseSQL
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = [(NSArray *)self->_localColumns count];
  if (v4 != [(NSArray *)self->_foreignColumns count])
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ML3DatabaseForeignKeyConstraint.m", 34, @"Number of local columns (%lu) does not match the number of foreign columns (%lu)", -[NSArray count](self->_localColumns, "count"), -[NSArray count](self->_foreignColumns, "count"));
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v6 = self->_localColumns;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v30 + 1) + 8 * i) name];
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v13 = self->_foreignColumns;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v26 + 1) + 8 * j) name];
        [v12 addObject:v18];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v15);
  }

  v19 = [v5 componentsJoinedByString:@", "];
  v20 = [v12 componentsJoinedByString:@", "];
  v21 = NSString;
  v22 = [(ML3DatabaseTable *)self->_foreignTable name];
  v23 = [v21 stringWithFormat:@"FOREIGN KEY (%@) REFERENCES %@ (%@)", v19, v22, v20];

  return v23;
}

- (ML3DatabaseForeignKeyConstraint)initWithForeignTable:(id)a3 localColumns:(id)a4 foreignColumns:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ML3DatabaseForeignKeyConstraint;
  id v12 = [(ML3DatabaseForeignKeyConstraint *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_foreignTable, a3);
    uint64_t v14 = [v10 copy];
    localColumns = v13->_localColumns;
    v13->_localColumns = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    foreignColumns = v13->_foreignColumns;
    v13->_foreignColumns = (NSArray *)v16;
  }
  return v13;
}

@end