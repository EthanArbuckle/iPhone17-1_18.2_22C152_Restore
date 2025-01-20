@interface SSSQLiteQueryDescriptor
- (BOOL)returnsDistinctEntities;
- (Class)entityClass;
- (Class)memoryEntityClass;
- (NSArray)orderingDirections;
- (NSArray)orderingProperties;
- (NSString)orderingClause;
- (SSSQLitePredicate)predicate;
- (id)_newSelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4 columns:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)limitCount;
- (void)dealloc;
- (void)setEntityClass:(Class)a3;
- (void)setLimitCount:(int64_t)a3;
- (void)setMemoryEntityClass:(Class)a3;
- (void)setOrderingClause:(id)a3;
- (void)setOrderingDirections:(id)a3;
- (void)setOrderingProperties:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setReturnsDistinctEntities:(BOOL)a3;
@end

@implementation SSSQLiteQueryDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_entityClass;
  *(void *)(v5 + 16) = self->_limitCount;
  *(void *)(v5 + 24) = self->_memoryEntityClass;
  *(void *)(v5 + 32) = [(NSString *)self->_orderingClause copyWithZone:a3];
  *(void *)(v5 + 40) = [(NSArray *)self->_orderingDirections copyWithZone:a3];
  *(void *)(v5 + 48) = [(NSArray *)self->_orderingProperties copyWithZone:a3];
  *(void *)(v5 + 56) = [(SSSQLitePredicate *)self->_predicate copyWithZone:a3];
  *(unsigned char *)(v5 + 64) = self->_returnsDistinctEntities;
  return (id)v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSQLiteQueryDescriptor;
  [(SSSQLiteQueryDescriptor *)&v3 dealloc];
}

- (void)setPredicate:(id)a3
{
}

- (void)setOrderingProperties:(id)a3
{
}

- (void)setEntityClass:(Class)a3
{
  self->_entityClass = a3;
}

- (void)setMemoryEntityClass:(Class)a3
{
  self->_memoryEntityClass = a3;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (id)_newSelectSQLWithProperties:(const void *)a3 count:(unint64_t)a4 columns:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"SELECT "];
  v10 = v9;
  if (self->_returnsDistinctEntities) {
    [v9 appendString:@"DISTINCT "];
  }
  [v10 appendString:objc_msgSend(a5, "componentsJoinedByString:", @", ")];
  [v10 appendFormat:@" FROM %@", -[objc_class databaseTable](self->_entityClass, "databaseTable")];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = [(SSSQLitePredicate *)self->_predicate SQLJoinClausesForEntityClass:self->_entityClass];
  if (v12) {
    [v11 unionSet:v12];
  }
  for (; a4; --a4)
  {
    uint64_t v13 = [(objc_class *)self->_entityClass joinClauseForProperty:*a3];
    if (v13) {
      [v11 addObject:v13];
    }
    ++a3;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v11);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        [v10 appendString:@" "];
        [v10 appendString:v18];
      }
      uint64_t v15 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v15);
  }

  id v19 = [(SSSQLitePredicate *)self->_predicate SQLForEntityClass:self->_entityClass];
  if (v19)
  {
    id v20 = v19;
    [v10 appendString:@" WHERE "];
    [v10 appendString:v20];
  }
  uint64_t v21 = [(NSArray *)self->_orderingProperties count];
  if (self->_orderingClause)
  {
    [v10 appendString:@" ORDER BY "];
    [v10 appendString:self->_orderingClause];
  }
  else
  {
    uint64_t v22 = v21;
    if (v21 >= 1)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      unint64_t v24 = 0;
      do
      {
        uint64_t v25 = [(objc_class *)self->_entityClass disambiguatedSQLForProperty:[(NSArray *)self->_orderingProperties objectAtIndex:v24]];
        if ([v23 length]) {
          [v23 appendString:@", "];
        }
        [v23 appendString:v25];
        [v23 appendString:@" "];
        if (v24 >= [(NSArray *)self->_orderingDirections count])
        {
          v27 = v23;
          v26 = @"ASC";
        }
        else
        {
          v26 = [(NSArray *)self->_orderingDirections objectAtIndex:v24];
          v27 = v23;
        }
        [v27 appendString:v26];
        ++v24;
      }
      while (v22 != v24);
      [v10 appendString:@" ORDER BY "];
      [v10 appendString:v23];
    }
  }
  if (self->_limitCount) {
    [v10 appendString:@" LIMIT ?"];
  }
  return v10;
}

- (SSSQLitePredicate)predicate
{
  return self->_predicate;
}

- (int64_t)limitCount
{
  return self->_limitCount;
}

- (void)setOrderingDirections:(id)a3
{
}

- (void)setLimitCount:(int64_t)a3
{
  self->_limitCount = a3;
}

- (Class)memoryEntityClass
{
  return self->_memoryEntityClass;
}

- (NSString)orderingClause
{
  return self->_orderingClause;
}

- (void)setOrderingClause:(id)a3
{
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

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

@end