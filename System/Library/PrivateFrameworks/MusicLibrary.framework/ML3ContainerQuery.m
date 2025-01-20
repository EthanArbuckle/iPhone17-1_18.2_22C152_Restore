@interface ML3ContainerQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEntities;
- (BOOL)requiresSmartLimiting;
- (ML3Container)container;
- (ML3ContainerQuery)initWithCoder:(id)a3;
- (ML3ContainerQuery)initWithEntityClass:(Class)a3 container:(id)a4 predicate:(id)a5 orderingTerms:(id)a6;
- (NSArray)limitedPersistentIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)enumerationDatabaseResultForSQL:(id)a3 onConnection:(id)a4 withParameters:(id)a5;
- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4;
- (id)valueForAggregateFunction:(id)a3 onEntitiesForProperty:(id)a4;
- (unint64_t)countOfDistinctRowsForColumn:(id)a3;
- (unint64_t)countOfEntities;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3ContainerQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitedPersistentIDs, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_containerPredicate, 0);
}

- (NSArray)limitedPersistentIDs
{
  return self->_limitedPersistentIDs;
}

- (ML3Container)container
{
  return self->_container;
}

- (id)enumerationDatabaseResultForSQL:(id)a3 onConnection:(id)a4 withParameters:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(ML3ContainerQuery *)self requiresSmartLimiting]
    && ![(ML3Container *)self->_container isLimitedByCount])
  {
    v12 = [(ML3Container *)self->_container limitingProperty];
    v11 = objc_msgSend(v9, "executeQuery:withParameters:limitProperty:limitValue:", v8, v10, v12, -[ML3Container limitValue](self->_container, "limitValue"));
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ML3ContainerQuery;
    v11 = [(ML3Query *)&v14 enumerationDatabaseResultForSQL:v8 onConnection:v9 withParameters:v10];
  }

  return v11;
}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(ML3ContainerQuery *)self requiresSmartLimiting])
  {
    if ([(ML3Container *)self->_container isLimitedByCount])
    {
      int v7 = 1;
      goto LABEL_8;
    }
    uint64_t v8 = [(ML3Container *)self->_container limitingProperty];
    id v9 = (void *)v8;
    if (v6)
    {
      uint64_t v10 = [v6 arrayByAddingObject:v8];

      int v7 = 0;
      id v6 = (id)v10;
      goto LABEL_8;
    }
    v15[0] = v8;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  int v7 = 0;
LABEL_8:
  v14.receiver = self;
  v14.super_class = (Class)ML3ContainerQuery;
  v11 = [(ML3Query *)&v14 selectPersistentIDsSQLAndProperties:v6 ordered:v4];
  if (v7)
  {
    uint64_t v12 = objc_msgSend(v11, "stringByAppendingFormat:", @" LIMIT %lu", -[ML3Container limitValue](self->_container, "limitValue"));

    v11 = (void *)v12;
  }

  return v11;
}

- (id)valueForAggregateFunction:(id)a3 onEntitiesForProperty:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (valueForAggregateFunction_onEntitiesForProperty__onceToken != -1) {
    dispatch_once(&valueForAggregateFunction_onEntitiesForProperty__onceToken, &__block_literal_global_8426);
  }
  if ([(ML3ContainerQuery *)self requiresSmartLimiting])
  {
    if ([(id)__supportedAggregateFunctions containsObject:v7])
    {
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      uint64_t v20 = 0;
      library = self->super._library;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_2;
      v13[3] = &unk_1E5FB4D70;
      v13[4] = self;
      id v14 = v8;
      id v15 = v7;
      v16 = &v17;
      [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v13];
      uint64_t v10 = [NSNumber numberWithLongLong:v18[3]];

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"ML3ContainerQuery.m", 209, @"Attempting to get value for unsupported aggregate function %@", v7 object file lineNumber description];

      uint64_t v10 = 0;
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)ML3ContainerQuery;
    uint64_t v10 = [(ML3Query *)&v21 valueForAggregateFunction:v7 onEntitiesForProperty:v8];
  }

  return v10;
}

void __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 24) spotlightPredicate];
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = [v5 library];
    [v5 loadNamesFromLibrary:v6 onConnection:v3 forPredicate:v4 loadAllNames:0 cancelHandler:0];
  }
  id v7 = *(void **)(a1 + 32);
  v18[0] = *(void *)(a1 + 40);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  if ([*(id *)(*(void *)(a1 + 32) + 96) isLimitedByCount]) {
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 96) limitValue];
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [v7 selectSQLWithColumns:v8 orderingTerms:0 limit:v9];

  v11 = [*(id *)(a1 + 32) persistentIDParameters];
  uint64_t v12 = [*(id *)(a1 + 32) enumerationDatabaseResultForSQL:v10 onConnection:v3 withParameters:v11];
  if ([*(id *)(a1 + 48) isEqualToString:@"TOTAL"])
  {
    v13 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v14 = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_3;
LABEL_12:
    v13[2] = v14;
    v13[3] = &unk_1E5FB77B8;
    v13[4] = *(void *)(a1 + 56);
    objc_msgSend(v12, "enumerateRowsWithBlock:");
    goto LABEL_13;
  }
  if ([*(id *)(a1 + 48) isEqualToString:@"MAX"])
  {
    v13 = v16;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v14 = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_4;
    goto LABEL_12;
  }
  if ([*(id *)(a1 + 48) isEqualToString:@"MIN"])
  {
    v13 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v14 = __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_5;
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 int64ForColumnIndex:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 int64ForColumnIndex:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (result > v5) {
    uint64_t v5 = result;
  }
  *(void *)(v4 + 24) = v5;
  return result;
}

uint64_t __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t result = [a2 int64ForColumnIndex:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (result < v5) {
    uint64_t v5 = result;
  }
  *(void *)(v4 + 24) = v5;
  return result;
}

uint64_t __69__ML3ContainerQuery_valueForAggregateFunction_onEntitiesForProperty___block_invoke()
{
  __supportedAggregateFunctions = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TOTAL", @"MAX", @"MIN", 0);

  return MEMORY[0x1F41817F8]();
}

- (unint64_t)countOfEntities
{
  return [(ML3ContainerQuery *)self countOfDistinctRowsForColumn:self->super._propertyToCount];
}

- (unint64_t)countOfDistinctRowsForColumn:(id)a3
{
  id v4 = a3;
  if ([(ML3ContainerQuery *)self requiresSmartLimiting])
  {
    if ([(ML3Container *)self->_container isLimitedByCount])
    {
      v15.receiver = self;
      v15.super_class = (Class)ML3ContainerQuery;
      id v5 = [(ML3Query *)&v15 countOfDistinctRowsForColumn:v4];
      unint64_t v6 = [(ML3Container *)self->_container limitValue];
      if ((unint64_t)v5 >= v6) {
        unint64_t v7 = v6;
      }
      else {
        unint64_t v7 = (unint64_t)v5;
      }
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2020000000;
      uint64_t v14 = 0;
      library = self->super._library;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke;
      v10[3] = &unk_1E5FB7640;
      v10[4] = self;
      v10[5] = &v11;
      [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v10];
      unint64_t v7 = v12[3];
      _Block_object_dispose(&v11, 8);
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)ML3ContainerQuery;
    unint64_t v7 = [(ML3Query *)&v16 countOfDistinctRowsForColumn:v4];
  }

  return v7;
}

void __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) spotlightPredicate];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    unint64_t v6 = [v5 library];
    [v5 loadNamesFromLibrary:v6 onConnection:v3 forPredicate:v4 loadAllNames:0 cancelHandler:0];
  }
  unint64_t v7 = [*(id *)(a1 + 32) selectPersistentIDsSQLAndProperties:0 ordered:1];
  id v8 = [*(id *)(a1 + 32) persistentIDParameters];
  uint64_t v9 = [*(id *)(a1 + 32) enumerationDatabaseResultForSQL:v7 onConnection:v3 withParameters:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke_2;
  v10[3] = &unk_1E5FB77B8;
  v10[4] = *(void *)(a1 + 40);
  [v9 enumerateRowsWithBlock:v10];
}

uint64_t __50__ML3ContainerQuery_countOfDistinctRowsForColumn___block_invoke_2(uint64_t result)
{
  return result;
}

- (BOOL)hasEntities
{
  if ([(ML3ContainerQuery *)self requiresSmartLimiting])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    library = self->super._library;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__ML3ContainerQuery_hasEntities__block_invoke;
    v6[3] = &unk_1E5FB7640;
    v6[4] = self;
    v6[5] = &v7;
    [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v6];
    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ML3ContainerQuery;
    return [(ML3Query *)&v11 hasEntities];
  }
  return v4;
}

void __32__ML3ContainerQuery_hasEntities__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) spotlightPredicate];
  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    id v5 = [v4 library];
    [v4 loadNamesFromLibrary:v5 onConnection:v13 forPredicate:v3 loadAllNames:0 cancelHandler:0];
  }
  unint64_t v6 = [*(id *)(a1 + 32) selectPersistentIDsSQLAndProperties:0 ordered:0];
  if ([*(id *)(*(void *)(a1 + 32) + 96) isLimitedByCount])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 96) limitValue] < 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = (int)log10((double)[*(id *)(*(void *)(a1 + 32) + 96) limitValue]) + 1;
    }
    uint64_t v9 = NSString;
    char v10 = objc_msgSend(v6, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v6, "length") - v7, v7, @"1");
    id v8 = [v9 stringWithFormat:@"SELECT 1 FROM (%@)", v10];
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"SELECT 1 FROM (%@ LIMIT 1)", v6];
  }
  objc_super v11 = [*(id *)(a1 + 32) persistentIDParameters];
  uint64_t v12 = [*(id *)(a1 + 32) enumerationDatabaseResultForSQL:v8 onConnection:v13 withParameters:v11];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [v12 hasAtLeastOneRow];
}

- (BOOL)requiresSmartLimiting
{
  id v3 = [(ML3Entity *)self->_container valueForProperty:@"smart_is_limited"];
  if ([v3 intValue])
  {
    BOOL v4 = [(ML3Entity *)self->_container valueForProperty:@"smart_is_dynamic"];
    BOOL v5 = [v4 intValue] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ML3Query *)self library];
  [v4 encodeObject:v5 forKey:@"musicLibrary"];

  unint64_t v6 = NSStringFromClass([(ML3Query *)self entityClass]);
  [v4 encodeObject:v6 forKey:@"entityClass"];

  uint64_t v7 = [(ML3ContainerQuery *)self container];
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v7, "persistentID"), @"containerPersistentID");

  id v8 = [(ML3Query *)self predicate];
  [v4 encodeObject:v8 forKey:@"predicate"];

  id v9 = [(ML3Query *)self orderingTerms];
  [v4 encodeObject:v9 forKey:@"orderingTerms"];
}

- (ML3ContainerQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicLibrary"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityClass"];
  Class v7 = NSClassFromString(v6);

  id v8 = +[ML3Entity newWithPersistentID:inLibrary:](ML3Container, "newWithPersistentID:inLibrary:", [v4 decodeInt64ForKey:@"containerPersistentID"], v5);
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
  char v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"orderingTerm"];

  uint64_t v14 = [(ML3ContainerQuery *)self initWithEntityClass:v7 container:v8 predicate:v9 orderingTerms:v13];
  return v14;
}

- (ML3ContainerQuery)initWithEntityClass:(Class)a3 container:(id)a4 predicate:(id)a5 orderingTerms:(id)a6
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "persistentID"));
  objc_super v15 = +[ML3ComparisonPredicate predicateWithProperty:@"container_item.container_pid" value:v14 comparison:1];
  containerPredicate = self->_containerPredicate;
  self->_containerPredicate = v15;

  objc_storeStrong((id *)&self->_container, a4);
  uint64_t v17 = [v11 valueForProperty:@"smart_is_dynamic"];
  int v18 = [v17 intValue];

  uint64_t v19 = [v11 valueForProperty:@"distinguished_kind"];
  int v20 = [v19 intValue];

  if (v18)
  {
    objc_super v21 = [v11 smartCriteriaPredicate];
  }
  else
  {
    objc_super v21 = self->_containerPredicate;
  }
  v22 = v21;
  if (v12)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v12, v21, 0);
    v24 = +[ML3CompoundPredicate predicateMatchingPredicates:v23];

    if (v13) {
      goto LABEL_20;
    }
  }
  else
  {
    v24 = v21;
    if (v13) {
      goto LABEL_20;
    }
  }
  if ([(ML3ContainerQuery *)self requiresSmartLimiting])
  {
    v25 = [v11 limitOrderingTerms];
    v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [v11 displayOrderingTerms];
    }
  }
  else
  {
    if (v18)
    {
      id v13 = [v11 displayOrderingTerms];
      goto LABEL_20;
    }
    v28 = [v11 valueForProperty:@"has_cloud_play_order"];
    int v29 = [v28 intValue];

    if (v29)
    {
      id v13 = [v11 cloudDisplayOrderingTerms];
      if (v13) {
        goto LABEL_20;
      }
      v26 = +[ML3OrderingTerm orderingTermWithProperty:@"container_item.position"];
      v41[0] = v26;
      v30 = (void *)MEMORY[0x1E4F1C978];
      v31 = (void **)v41;
    }
    else
    {
      v26 = +[ML3OrderingTerm orderingTermWithProperty:@"container_item.position"];
      v40 = v26;
      v30 = (void *)MEMORY[0x1E4F1C978];
      v31 = &v40;
    }
    id v27 = [v30 arrayWithObjects:v31 count:1];
  }
  id v13 = v27;

LABEL_20:
  BOOL v32 = v18 == 0;
  if (v20 == 71) {
    BOOL v32 = 1;
  }
  BOOL v33 = !v32;
  uint64_t v34 = 4;
  if (v33) {
    uint64_t v34 = 0;
  }
  uint64_t v35 = v34 | (8 * (v20 == 71));
  v36 = [v11 library];
  v39.receiver = self;
  v39.super_class = (Class)ML3ContainerQuery;
  v37 = [(ML3Query *)&v39 initWithLibrary:v36 entityClass:a3 predicate:v24 orderingTerms:v13 usingSections:0 nonDirectAggregateQuery:0 propertyToCount:0 options:v35];

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ML3ContainerQuery;
  id v4 = [(ML3Query *)&v8 copyWithZone:a3];
  uint64_t v5 = [(ML3Predicate *)self->_containerPredicate copy];
  unint64_t v6 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v5;

  objc_storeStrong((id *)v4 + 12, self->_container);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end