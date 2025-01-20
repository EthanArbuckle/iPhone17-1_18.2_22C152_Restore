@interface ML3AggregateQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEntities;
- (BOOL)isFastCountable;
- (BOOL)sectionsPersistentIDColumnIsDistinct;
- (Class)aggregateEntityClass;
- (Class)entityClass;
- (ML3AggregateQuery)initWithCoder:(id)a3;
- (ML3AggregateQuery)initWithUnitQuery:(id)a3 aggregateEntityClass:(Class)a4 foreignPersistentIDProperty:(id)a5;
- (NSString)foreignPersistentIDProperty;
- (id)copyWithZone:(_NSZone *)a3;
- (id)persistentIDProperty;
- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4;
- (unint64_t)countOfEntities;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIsFastCountable:(BOOL)a3;
@end

@implementation ML3AggregateQuery

- (unint64_t)countOfEntities
{
  if (self->super._propertyToCount)
  {
    return -[ML3Query countOfDistinctRowsForColumn:](self, "countOfDistinctRowsForColumn:");
  }
  else
  {
    v4 = [(ML3AggregateQuery *)self persistentIDProperty];
    unint64_t v5 = [(ML3Query *)self countOfDistinctRowsForColumn:v4];

    return v5;
  }
}

- (ML3AggregateQuery)initWithUnitQuery:(id)a3 aggregateEntityClass:(Class)a4 foreignPersistentIDProperty:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 library];
  uint64_t v11 = [v9 entityClass];
  v12 = [v9 predicate];
  v13 = [v9 orderingTerms];
  uint64_t v14 = [v9 usingSections];
  uint64_t v15 = [v9 options];

  v20.receiver = self;
  v20.super_class = (Class)ML3AggregateQuery;
  v16 = [(ML3Query *)&v20 initWithLibrary:v10 entityClass:v11 predicate:v12 orderingTerms:v13 usingSections:v14 nonDirectAggregateQuery:0 propertyToCount:0 options:v15];

  if (v16)
  {
    v16->_aggregateEntityClass = a4;
    uint64_t v17 = [v8 copy];
    foreignPersistentIDProperty = v16->_foreignPersistentIDProperty;
    v16->_foreignPersistentIDProperty = (NSString *)v17;
  }
  return v16;
}

- (id)persistentIDProperty
{
  return self->_foreignPersistentIDProperty;
}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4
{
  BOOL v16 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [(objc_class *)self->_aggregateEntityClass foreignPropertyForProperty:v11 entityClass:self->super._entityClass];
        if (!v8) {
          id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        if (v12) {
          v13 = v12;
        }
        else {
          v13 = v11;
        }
        [v8 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)ML3AggregateQuery;
  uint64_t v14 = [(ML3Query *)&v17 selectPersistentIDsSQLAndProperties:v8 ordered:v16 distinct:1];

  return v14;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  foreignPersistentIDProperty = self->_foreignPersistentIDProperty;
  self->_foreignPersistentIDProperty = 0;

  v4.receiver = self;
  v4.super_class = (Class)ML3AggregateQuery;
  [(ML3AggregateQuery *)&v4 dealloc];
}

- (void)setIsFastCountable:(BOOL)a3
{
  self->_isFastCountable = a3;
}

- (BOOL)isFastCountable
{
  return self->_isFastCountable;
}

- (NSString)foreignPersistentIDProperty
{
  return self->_foreignPersistentIDProperty;
}

- (Class)aggregateEntityClass
{
  return self->_aggregateEntityClass;
}

- (BOOL)sectionsPersistentIDColumnIsDistinct
{
  return 1;
}

- (BOOL)hasEntities
{
  return [(ML3Query *)self hasRowForColumn:self->super._propertyToCount];
}

- (Class)entityClass
{
  return self->_aggregateEntityClass;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ML3AggregateQuery;
  id v4 = a3;
  [(ML3Query *)&v7 encodeWithCoder:v4];
  id v5 = NSStringFromClass([(ML3AggregateQuery *)self aggregateEntityClass]);
  [v4 encodeObject:v5 forKey:@"aggregateEntityClass"];

  uint64_t v6 = [(ML3AggregateQuery *)self foreignPersistentIDProperty];
  [v4 encodeObject:v6 forKey:@"foreignPersistentIDProperty"];
}

- (ML3AggregateQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3AggregateQuery;
  id v5 = [(ML3Query *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aggregateEntityClass"];
    v5->_aggregateEntityClass = NSClassFromString(v6);

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foreignPersistentIDProperty"];
    uint64_t v8 = [v7 copy];
    foreignPersistentIDProperty = v5->_foreignPersistentIDProperty;
    v5->_foreignPersistentIDProperty = (NSString *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ML3AggregateQuery;
  id v4 = [(ML3Query *)&v6 copyWithZone:a3];
  *((void *)v4 + 11) = self->_aggregateEntityClass;
  objc_storeStrong((id *)v4 + 12, self->_foreignPersistentIDProperty);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end