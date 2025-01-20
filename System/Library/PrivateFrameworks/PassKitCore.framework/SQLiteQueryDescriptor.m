@interface SQLiteQueryDescriptor
- (BOOL)returnsDistinctEntities;
- (Class)entityClass;
- (NSArray)groupingProperties;
- (NSArray)orderingDirections;
- (NSArray)orderingProperties;
- (SQLitePredicate)predicate;
- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)limitCount;
- (void)setEntityClass:(Class)a3;
- (void)setGroupingProperties:(id)a3;
- (void)setLimitCount:(int64_t)a3;
- (void)setOrderingDirections:(id)a3;
- (void)setOrderingProperties:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setReturnsDistinctEntities:(BOOL)a3;
@end

@implementation SQLiteQueryDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingProperties, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_orderingProperties, 0);
  objc_storeStrong((id *)&self->_orderingDirections, 0);
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (void)setPredicate:(id)a3
{
}

- (void)setOrderingProperties:(id)a3
{
}

- (void)setOrderingDirections:(id)a3
{
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (void)setGroupingProperties:(id)a3
{
}

- (void)setEntityClass:(Class)a3
{
  self->_entityClass = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_entityClass;
  v5[2] = self->_limitCount;
  id v6 = [(NSArray *)self->_orderingDirections copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSArray *)self->_orderingProperties copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSArray *)self->_groupingProperties copyWithZone:a3];
  v11 = (void *)v5[6];
  v5[6] = v10;

  id v12 = [(SQLitePredicate *)self->_predicate copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  *((unsigned char *)v5 + 56) = self->_returnsDistinctEntities;
  return v5;
}

- (id)_newSelectSQLWithProperties:(id)a3 columns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableString) initWithString:@"SELECT "];
  v9 = v8;
  if (self->_returnsDistinctEntities) {
    [v8 appendString:@"DISTINCT "];
  }
  v44 = v7;
  id v10 = [v7 componentsJoinedByString:@", "];
  [v9 appendString:v10];

  v11 = [(objc_class *)self->_entityClass databaseTable];
  [v9 appendFormat:@" FROM %@", v11];

  id v12 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v13 = [(SQLitePredicate *)self->_predicate SQLJoinClausesForEntityClass:self->_entityClass];
  if (v13) {
    [v12 unionSet:v13];
  }
  v43 = (void *)v13;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(v14);
        }
        [(objc_class *)self->_entityClass addJoinClausesForProperty:*(void *)(*((void *)&v49 + 1) + 8 * i) toJoins:v12];
      }
      id v16 = [v14 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v16);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v19 = v12;
  id v20 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v46;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
        [v9 appendString:@" "];
        [v9 appendString:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v21);
  }

  uint64_t v25 = [(SQLitePredicate *)self->_predicate SQLForEntityClass:self->_entityClass];
  if (v25)
  {
    [v9 appendString:@" WHERE "];
    [v9 appendString:v25];
  }
  v42 = (void *)v25;
  uint64_t v26 = [(NSArray *)self->_groupingProperties count];
  if (v26 >= 1)
  {
    uint64_t v27 = v26;
    id v28 = objc_alloc_init((Class)NSMutableString);
    for (uint64_t k = 0; k != v27; ++k)
    {
      Class entityClass = self->_entityClass;
      v31 = [(NSArray *)self->_groupingProperties objectAtIndex:k];
      v32 = [(objc_class *)entityClass disambiguatedSQLForProperty:v31];

      if ([v28 length]) {
        [v28 appendString:@", "];
      }
      [v28 appendString:v32];
      [v28 appendString:@" "];
    }
    [v9 appendString:@" GROUP BY "];
    [v9 appendString:v28];
  }
  uint64_t v33 = [(NSArray *)self->_orderingProperties count];
  if (v33 >= 1)
  {
    uint64_t v34 = v33;
    id v35 = objc_alloc_init((Class)NSMutableString);
    for (unint64_t m = 0; m != v34; ++m)
    {
      Class v37 = self->_entityClass;
      v38 = [(NSArray *)self->_orderingProperties objectAtIndex:m];
      v39 = [(objc_class *)v37 disambiguatedSQLForProperty:v38];

      if ([v35 length]) {
        [v35 appendString:@", "];
      }
      [v35 appendString:v39];
      [v35 appendString:@" "];
      if (m >= [(NSArray *)self->_orderingDirections count])
      {
        [v35 appendString:@"ASC"];
      }
      else
      {
        v40 = [(NSArray *)self->_orderingDirections objectAtIndex:m];
        [v35 appendString:v40];
      }
    }
    [v9 appendString:@" ORDER BY "];
    [v9 appendString:v35];
  }
  if (self->_limitCount) {
    [v9 appendString:@" LIMIT ?"];
  }

  return v9;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (SQLitePredicate)predicate
{
  return self->_predicate;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (NSArray)orderingDirections
{
  return self->_orderingDirections;
}

- (NSArray)orderingProperties
{
  return self->_orderingProperties;
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (NSArray)groupingProperties
{
  return self->_groupingProperties;
}

@end