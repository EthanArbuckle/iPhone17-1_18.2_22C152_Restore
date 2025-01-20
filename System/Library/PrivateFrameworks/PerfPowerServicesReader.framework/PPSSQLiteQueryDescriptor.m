@interface PPSSQLiteQueryDescriptor
- (BOOL)returnsDistinctEntities;
- (NSArray)groupByProperties;
- (NSArray)orderByDirections;
- (NSArray)orderByProperties;
- (PPSSQLiteEntity)entity;
- (PPSSQLitePredicate)predicate;
- (PPSSQLiteQueryDescriptor)initWithEntity:(id)a3 predicate:(id)a4;
- (PPSSQLiteQueryDescriptor)initWithEntity:(id)a3 predicate:(id)a4 limitCount:(unint64_t)a5 offsetCount:(unint64_t)a6;
- (id)_sqlForSelectWithProperties:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)limitCount;
- (unint64_t)offsetCount;
- (void)setEntity:(id)a3;
- (void)setGroupByProperties:(id)a3;
- (void)setLimitCount:(unint64_t)a3;
- (void)setOffsetCount:(unint64_t)a3;
- (void)setOrderByDirections:(id)a3;
- (void)setOrderByProperties:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setReturnsDistinctEntities:(BOOL)a3;
@end

@implementation PPSSQLiteQueryDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v5 setEntity:self->_entity];
  id v6 = [(PPSSQLitePredicate *)self->_predicate copyWithZone:a3];
  [v5 setPredicate:v6];

  v7 = (void *)[(NSArray *)self->_groupByProperties copyWithZone:a3];
  [v5 setGroupByProperties:v7];

  v8 = (void *)[(NSArray *)self->_orderByProperties copyWithZone:a3];
  [v5 setOrderByProperties:v8];

  v9 = (void *)[(NSArray *)self->_orderByDirections copyWithZone:a3];
  [v5 setOrderByDirections:v9];

  [v5 setLimitCount:self->_limitCount];
  [v5 setOffsetCount:self->_offsetCount];
  [v5 setReturnsDistinctEntities:self->_returnsDistinctEntities];
  return v5;
}

- (PPSSQLiteQueryDescriptor)initWithEntity:(id)a3 predicate:(id)a4
{
  return [(PPSSQLiteQueryDescriptor *)self initWithEntity:a3 predicate:a4 limitCount:0 offsetCount:0];
}

- (PPSSQLiteQueryDescriptor)initWithEntity:(id)a3 predicate:(id)a4 limitCount:(unint64_t)a5 offsetCount:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PPSSQLiteQueryDescriptor;
  v13 = [(PPSSQLiteQueryDescriptor *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entity, a3);
    uint64_t v15 = [v12 copy];
    predicate = v14->_predicate;
    v14->_predicate = (PPSSQLitePredicate *)v15;

    v14->_limitCount = a5;
    v14->_offsetCount = a6;
  }

  return v14;
}

- (id)_sqlForSelectWithProperties:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v42 = a3;
  id v45 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"SELECT "];
  uint64_t v4 = MEMORY[0x25A2D4DD0]();
  if ([(PPSSQLiteQueryDescriptor *)self returnsDistinctEntities]) {
    [v45 appendString:@"DISTINCT "];
  }
  context = (void *)v4;
  v5 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v42;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v11 = [(PPSSQLiteQueryDescriptor *)self entity];
        id v12 = [v11 disambiguatedSQLForProperty:v10 shouldEscape:0];
        [v5 addObject:v12];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v7);
  }

  v13 = [v5 componentsJoinedByString:@", "];
  [v45 appendString:v13];

  v14 = [(PPSSQLiteQueryDescriptor *)self entity];
  uint64_t v15 = [v14 tableNames];
  v16 = [v15 firstObject];
  [v45 appendFormat:@" FROM '%@'", v16];

  v17 = [(PPSSQLiteQueryDescriptor *)self entity];
  v43 = [v17 joinClause];

  if (v43) {
    [v45 appendFormat:@" %@", v43, context];
  }
  objc_super v18 = [(PPSSQLiteQueryDescriptor *)self predicate];
  v19 = [(PPSSQLiteQueryDescriptor *)self entity];
  v44 = [v18 sqlForEntity:v19];

  if (v44) {
    [v45 appendFormat:@" WHERE %@", v44];
  }
  v20 = [(PPSSQLiteQueryDescriptor *)self groupByProperties];
  uint64_t v21 = [v20 count];

  if (v21 >= 1)
  {
    v22 = objc_opt_new();
    for (uint64_t j = 0; j != v21; ++j)
    {
      v24 = [(PPSSQLiteQueryDescriptor *)self entity];
      v25 = [(PPSSQLiteQueryDescriptor *)self groupByProperties];
      v26 = [v25 objectAtIndexedSubscript:j];
      v27 = [v24 disambiguatedSQLForProperty:v26 shouldEscape:1];

      if ([v22 length]) {
        [v22 appendString:@", "];
      }
      [v22 appendFormat:@"%@", v27];
    }
    [v45 appendFormat:@" GROUP BY %@", v22];
  }
  v28 = [(PPSSQLiteQueryDescriptor *)self orderByProperties];
  uint64_t v29 = [v28 count];

  if (v29 >= 1)
  {
    v30 = objc_opt_new();
    for (unint64_t k = 0; k != v29; ++k)
    {
      v32 = [(PPSSQLiteQueryDescriptor *)self entity];
      v33 = [(PPSSQLiteQueryDescriptor *)self orderByProperties];
      v34 = [v33 objectAtIndexedSubscript:k];
      v35 = [v32 disambiguatedSQLForProperty:v34 shouldEscape:1];

      if ([v30 length]) {
        [v30 appendString:@", "];
      }
      [v30 appendFormat:@"%@ ", v35];
      v36 = [(PPSSQLiteQueryDescriptor *)self orderByDirections];
      BOOL v37 = k < [v36 count];

      if (v37)
      {
        v38 = [(PPSSQLiteQueryDescriptor *)self orderByDirections];
        v39 = [v38 objectAtIndexedSubscript:k];
        [v30 appendString:v39];
      }
      else
      {
        [v30 appendString:@"ASC"];
      }
    }
    [v45 appendFormat:@" ORDER BY %@", v30];
  }
  if ([(PPSSQLiteQueryDescriptor *)self limitCount]) {
    [v45 appendString:@" LIMIT ? "];
  }
  if ([(PPSSQLiteQueryDescriptor *)self offsetCount]) {
    [v45 appendString:@" OFFSET ?"];
  }

  return v45;
}

- (PPSSQLiteEntity)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (PPSSQLitePredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)groupByProperties
{
  return self->_groupByProperties;
}

- (void)setGroupByProperties:(id)a3
{
}

- (NSArray)orderByProperties
{
  return self->_orderByProperties;
}

- (void)setOrderByProperties:(id)a3
{
}

- (NSArray)orderByDirections
{
  return self->_orderByDirections;
}

- (void)setOrderByDirections:(id)a3
{
}

- (unint64_t)limitCount
{
  return self->_limitCount;
}

- (void)setLimitCount:(unint64_t)a3
{
  self->_limitCount = a3;
}

- (unint64_t)offsetCount
{
  return self->_offsetCount;
}

- (void)setOffsetCount:(unint64_t)a3
{
  self->_offsetCount = a3;
}

- (BOOL)returnsDistinctEntities
{
  return self->_returnsDistinctEntities;
}

- (void)setReturnsDistinctEntities:(BOOL)a3
{
  self->_returnsDistinctEntities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderByDirections, 0);
  objc_storeStrong((id *)&self->_orderByProperties, 0);
  objc_storeStrong((id *)&self->_groupByProperties, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end