@interface ML3Query
+ (BOOL)supportsSecureCoding;
- (BOOL)deleteAllEntitiesFromLibrary;
- (BOOL)deleteAllEntitiesFromLibraryWithDeletionType:(int)a3;
- (BOOL)deleteAllEntitiesFromLibraryWithDeletionType:(int)a3 usingConnection:(id)a4;
- (BOOL)filtersOnDynamicProperties;
- (BOOL)hasEntities;
- (BOOL)hasRowForColumn:(id)a3;
- (BOOL)ignoreRestrictionsPredicates;
- (BOOL)ignoreSystemFilterPredicates;
- (BOOL)isEqual:(id)a3;
- (BOOL)sectionsPersistentIDColumnIsDistinct;
- (BOOL)usingSections;
- (Class)entityClass;
- (ML3AggregateQuery)nonDirectAggregateQuery;
- (ML3MusicLibrary)library;
- (ML3Predicate)predicate;
- (ML3Predicate)predicateIncludingSystemwidePredicates;
- (ML3Query)initWithCoder:(id)a3;
- (ML3Query)initWithLibrary:(id)a3 entityClass:(Class)a4 predicate:(id)a5 orderingTerms:(id)a6 usingSections:(BOOL)a7 nonDirectAggregateQuery:(id)a8 propertyToCount:(id)a9 options:(int64_t)a10;
- (NSArray)orderingTerms;
- (NSString)persistentIDProperty;
- (NSString)propertyToCount;
- (NSString)sectionProperty;
- (NSString)selectCountSQL;
- (NSString)selectPersistentIDsSQL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countStatementParameters;
- (id)description;
- (id)enumerationDatabaseResultForSQL:(id)a3 onConnection:(id)a4 withParameters:(id)a5;
- (id)lowerBoundParametersForOrderingTerms:(id)a3 lowerBoundPersistentID:(int64_t)a4;
- (id)nameOrderPropertyForProperty:(id)a3;
- (id)persistentIDParameters;
- (id)reverseQuery;
- (id)sections;
- (id)sectionsParameters;
- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4;
- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4 distinct:(BOOL)a5;
- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4;
- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 distinct:(BOOL)a5;
- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5;
- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 directionality:(id)a6 usingLowerBound:(BOOL)a7;
- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 directionality:(id)a6 usingLowerBound:(BOOL)a7 distinct:(BOOL)a8 limit:(unint64_t)a9;
- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 limit:(unint64_t)a6;
- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4;
- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 directionality:(id)a5;
- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 distinct:(BOOL)a5;
- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 limit:(unint64_t)a5;
- (id)selectSectionsSQL;
- (id)selectUnorderedPersistentIDsSQL;
- (id)valueForAggregateFunction:(id)a3 onEntitiesForProperty:(id)a4;
- (int64_t)anyEntityPersistentID;
- (int64_t)options;
- (unint64_t)countOfDistinctRowsForColumn:(id)a3;
- (unint64_t)countOfEntities;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6;
- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 sectionProperty:(id)a5 cancelBlock:(id)a6 usingBlock:(id)a7;
- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 usingBlock:(id)a5;
- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsAndSectionsWithProperty:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
- (void)enumerateSectionsUsingBlock:(id)a3;
- (void)loadNamesFromLibrary:(id)a3 onConnection:(id)a4 forPredicate:(id)a5 loadAllNames:(BOOL)a6 cancelHandler:(id)a7;
- (void)setIgnoreRestrictionsPredicates:(BOOL)a3;
- (void)setIgnoreSystemFilterPredicates:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation ML3Query

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

void __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [v5 appendSQLToMutableString:*(void *)(a1 + 32) entityClass:*(void *)(*(void *)(a1 + 40) + 16)];
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 directionality:(id)a6 usingLowerBound:(BOOL)a7 distinct:(BOOL)a8 limit:(unint64_t)a9
{
  BOOL v9 = a8;
  BOOL v50 = a7;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v54 = a4;
  id v51 = a5;
  id v56 = a6;
  v14 = [MEMORY[0x1E4F28E78] string];
  id v58 = v14;
  v53 = [(objc_class *)self->_entityClass databaseTable];
  Class entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class() || (Class v16 = self->_entityClass, v16 == (Class)objc_opt_class()))
  {
    uint64_t v17 = [(ML3Query *)self predicateIncludingSystemwidePredicates];
  }
  else
  {
    uint64_t v17 = [(ML3Query *)self predicate];
  }
  v18 = (void *)v17;
  v52 = (void *)v17;
  [v14 appendString:@"SELECT "];
  if (v9) {
    [v14 appendString:@"DISTINCT "];
  }
  v19 = [v55 componentsJoinedByString:@", "];
  [v14 appendString:v19];

  [v14 appendString:@" FROM "];
  [v14 appendString:v53];
  id v20 = objc_alloc(MEMORY[0x1E4F1CA70]);
  v21 = [v18 SQLJoinClausesForClass:self->_entityClass];
  v22 = (void *)[v20 initWithOrderedSet:v21];

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = v51;
  uint64_t v23 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v84 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = [*(id *)(*((void *)&v83 + 1) + 8 * i) property];
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v27 = [(objc_class *)self->_entityClass joinClausesForProperty:v26];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v79 objects:v90 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v80;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v80 != v29) {
                objc_enumerationMutation(v27);
              }
              [v22 addObject:*(void *)(*((void *)&v79 + 1) + 8 * j)];
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v79 objects:v90 count:16];
          }
          while (v28);
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
    }
    while (v23);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v31 = v55;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v76;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v76 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = *(void *)(*((void *)&v75 + 1) + 8 * k);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        v36 = [(objc_class *)self->_entityClass joinClausesForProperty:v35];
        uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v88 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v72;
          do
          {
            for (uint64_t m = 0; m != v37; ++m)
            {
              if (*(void *)v72 != v38) {
                objc_enumerationMutation(v36);
              }
              [v22 addObject:*(void *)(*((void *)&v71 + 1) + 8 * m)];
            }
            uint64_t v37 = [v36 countByEnumeratingWithState:&v71 objects:v88 count:16];
          }
          while (v37);
        }
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v32);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v40 = v22;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v67 objects:v87 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v68;
    do
    {
      for (uint64_t n = 0; n != v41; ++n)
      {
        if (*(void *)v68 != v42) {
          objc_enumerationMutation(v40);
        }
        uint64_t v44 = *(void *)(*((void *)&v67 + 1) + 8 * n);
        [v58 appendString:@" "];
        [v58 appendString:v44];
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v67 objects:v87 count:16];
    }
    while (v41);
  }

  v45 = v58;
  if (v52)
  {
    [v58 appendString:@" WHERE "];
    [v52 appendSQLToMutableString:v58 entityClass:self->_entityClass];
  }
  if (v50 && [obj count])
  {
    objc_msgSend(v58, "appendString:", @" AND (");
    uint64_t v46 = [obj count];
    if (v46)
    {
      for (iuint64_t i = 0; ii != v46; ++ii)
      {
        if (ii) {
          [v58 appendString:@" OR "];
        }
        objc_msgSend(v58, "appendString:", @"(");
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke;
        v62[3] = &unk_1E5FB28C8;
        uint64_t v66 = ii;
        id v48 = v58;
        id v63 = v48;
        v64 = self;
        id v65 = v56;
        [obj enumerateObjectsUsingBlock:v62];
        [v48 appendString:@""]);
      }
    }
    v45 = v58;
    [v58 appendString:@""]);
  }
  if (v54)
  {
    [v45 appendString:@" GROUP BY "];
    [v45 appendString:v54];
    [v45 appendString:@" ORDER BY "];
    [v45 appendString:v54];
  }
  else if ([obj count])
  {
    [v45 appendString:@" ORDER BY "];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke_2;
    v59[3] = &unk_1E5FB28F0;
    id v60 = v45;
    v61 = self;
    [obj enumerateObjectsUsingBlock:v59];

    v45 = v58;
  }
  if (a9) {
    objc_msgSend(v45, "appendFormat:", @" LIMIT %lu", a9);
  }

  return v58;
}

- (ML3Predicate)predicateIncludingSystemwidePredicates
{
  if ([(objc_class *)self->_entityClass isSubclassOfClass:objc_opt_class()])
  {
    v3 = [(objc_class *)self->_entityClass predicateIncludingSystemwidePredicatesWithPredicate:self->_predicate library:self->_library options:self->_options];
  }
  else
  {
    v3 = self->_predicate;
  }

  return v3;
}

void __95__ML3Query_enumeratePersistentIDsAndProperties_ordered_sectionProperty_cancelBlock_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    BOOL v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v10;
      __int16 v33 = 2114;
      id v34 = v8;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Error enumerating results. err=%{public}@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    uint64_t v11 = *(void *)(a1 + 64);
    if (v11 && (*(unsigned int (**)(void))(v11 + 16))())
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      *a4 = 1;
      goto LABEL_7;
    }
    uint64_t v12 = [v7 int64ForColumnIndex:0];
    if (*(void *)(a1 + 40)) {
      [v7 intForColumnIndex:1];
    }
    if (!*(void *)(a1 + 96))
    {
LABEL_30:
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      goto LABEL_7;
    }
    uint64_t v13 = 0;
    v14 = (void *)(a1 + 104);
    v15 = (void *)(a1 + 152);
    id v30 = v7;
    while (1)
    {
      if (*(unsigned char *)(a1 + 192)
        && std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v14, v13))
      {
        uint64_t v16 = [v7 int64ForColumnIndex:v13 + 1];
        ML3SpotlightMatchPredicateNameForID(v16, v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::find<int>(v15, v13))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          v19 = *(void **)(v18 + 16);
          id v20 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v13];
          v21 = [v19 countingQueryForBaseQuery:v18 countProperty:v20 forIdentifier:v12];

          if (v21)
          {
            objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "countOfEntities"));
            id v22 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v24 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = v14;
              v26 = v15;
              uint64_t v27 = v12;
              uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 16);
              uint64_t v29 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v13];
              *(_DWORD *)buf = 138543618;
              uint64_t v32 = v28;
              __int16 v33 = 2114;
              id v34 = v29;
              _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "No counting query for entity class %{public}@ count property %{public}@", buf, 0x16u);

              uint64_t v12 = v27;
              v15 = v26;
              v14 = v25;
              id v7 = v30;
            }

            id v22 = &unk_1F0910F30;
          }
          *(void *)(*(void *)(a1 + 144) + 8 * v13) = v22;

          goto LABEL_29;
        }
        uint64_t v23 = 1;
        if (*(void *)(a1 + 40)) {
          uint64_t v23 = 2;
        }
        id v17 = [v7 objectAtIndexedSubscript:v23 + v13];
      }
      *(void *)(*(void *)(a1 + 144) + 8 * v13) = v17;
LABEL_29:
      if (*(void *)(a1 + 96) <= (unint64_t)++v13) {
        goto LABEL_30;
      }
    }
  }
LABEL_6:
  *a4 = 1;
LABEL_7:
}

uint64_t __69__ML3Query_enumeratePersistentIDsAndSectionsWithProperty_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__ML3Query_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__ML3Query_enumeratePersistentIDsAndProperties_ordered_cancelBlock_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)anyEntityPersistentID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  library = self->_library;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__ML3Query_anyEntityPersistentID__block_invoke;
  v5[3] = &unk_1E5FB7640;
  v5[4] = self;
  v5[5] = &v6;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasRowForColumn:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  library = self->_library;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__ML3Query_hasRowForColumn___block_invoke;
  v8[3] = &unk_1E5FB57C0;
  v8[4] = self;
  id v9 = v4;
  uint64_t v10 = &v11;
  id v6 = v4;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v8];
  LOBYTE(library) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)library;
}

- (BOOL)hasEntities
{
  return [(ML3Query *)self hasRowForColumn:0];
}

- (ML3Query)initWithLibrary:(id)a3 entityClass:(Class)a4 predicate:(id)a5 orderingTerms:(id)a6 usingSections:(BOOL)a7 nonDirectAggregateQuery:(id)a8 propertyToCount:(id)a9 options:(int64_t)a10
{
  id v26 = a3;
  id v16 = a5;
  id v17 = a6;
  id v25 = a8;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)ML3Query;
  v19 = [(ML3Query *)&v27 init];
  id v20 = v19;
  if (v19)
  {
    v19->_Class entityClass = a4;
    objc_storeStrong((id *)&v19->_predicate, a5);
    uint64_t v21 = [v17 copy];
    orderingTerms = v20->_orderingTerms;
    v20->_orderingTerms = (NSArray *)v21;

    objc_storeStrong((id *)&v20->_propertyToCount, a9);
    objc_storeStrong((id *)&v20->_library, a3);
    v20->_usingSections = a7;
    objc_storeStrong((id *)&v20->_nonDirectAggregateQuery, a8);
    v20->_filtersOnDynamicProperties = [v16 isDynamicForEntityClass:a4];
    v20->_options = a10;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonDirectAggregateQuery, 0);
  objc_storeStrong((id *)&self->_propertyToCount, 0);
  objc_storeStrong((id *)&self->_orderingTerms, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 cancelBlock:(id)a5 usingBlock:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__ML3Query_enumeratePersistentIDsAndProperties_ordered_cancelBlock_usingBlock___block_invoke;
  v12[3] = &unk_1E5FB2828;
  id v13 = v10;
  id v11 = v10;
  [(ML3Query *)self enumeratePersistentIDsAndProperties:a3 ordered:v7 sectionProperty:0 cancelBlock:a5 usingBlock:v12];
}

- (unint64_t)countOfDistinctRowsForColumn:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  library = self->_library;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__ML3Query_countOfDistinctRowsForColumn___block_invoke;
  v9[3] = &unk_1E5FB57C0;
  v9[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v9];
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __33__ML3Query_anyEntityPersistentID__block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) spotlightPredicate];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 library];
    [v5 loadNamesFromLibrary:v6 onConnection:v3 forPredicate:v4 loadAllNames:0 cancelHandler:0];
  }
  unint64_t v7 = *(id **)(a1 + 32);
  uint64_t v8 = [v7[2] databaseTable];
  id v9 = [v8 stringByAppendingString:@".ROWID"];
  v14[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v11 = [v7 selectSQLWithColumns:v10 orderingTerms:*(void *)(*(void *)(a1 + 32) + 32) limit:1];

  uint64_t v12 = [*(id *)(a1 + 32) persistentIDParameters];
  id v13 = [v3 executeQuery:v11 withParameters:v12];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v13 int64ValueForFirstRowAndColumn];
}

void __41__ML3Query_countOfDistinctRowsForColumn___block_invoke(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) spotlightPredicate];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 library];
    [v5 loadNamesFromLibrary:v6 onConnection:v3 forPredicate:v4 loadAllNames:0 cancelHandler:0];
  }
  if (*(void *)(a1 + 40))
  {
    unint64_t v7 = [NSString stringWithFormat:@"COUNT(DISTINCT %@)", *(void *)(a1 + 40)];
  }
  else
  {
    unint64_t v7 = @"COUNT()";
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[10];
  if (v9)
  {
    uint64_t v10 = [NSString stringWithFormat:@"MIN(%@, %lu)", v7, v9];

    uint64_t v8 = *(void **)(a1 + 32);
    unint64_t v7 = (__CFString *)v10;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    v18[0] = v7;
    v18[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  }
  else
  {
    id v17 = v7;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  }
  id v13 = (void *)v12;
  uint64_t v14 = [v8 selectSQLWithColumns:v12 orderingTerms:0 limit:0];

  uint64_t v15 = [*(id *)(a1 + 32) persistentIDParameters];
  id v16 = [v3 executeQuery:v14 withParameters:v15];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v16 int64ValueForFirstRowAndColumn];
}

- (NSArray)orderingTerms
{
  return self->_orderingTerms;
}

- (ML3Predicate)predicate
{
  return self->_predicate;
}

- (BOOL)usingSections
{
  return self->_usingSections;
}

- (int64_t)options
{
  return self->_options;
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSString)sectionProperty
{
  if (self->_usingSections && [(NSArray *)self->_orderingTerms count])
  {
    id v3 = [(NSArray *)self->_orderingTerms objectAtIndex:0];
    id v4 = [v3 property];

    if (v4)
    {
      id v5 = [(objc_class *)self->_entityClass sectionPropertyForProperty:v4];
      goto LABEL_7;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = 0;
LABEL_7:

  return (NSString *)v5;
}

- (BOOL)filtersOnDynamicProperties
{
  return self->_filtersOnDynamicProperties;
}

- (void)enumeratePersistentIDsAndSectionsWithProperty:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__ML3Query_enumeratePersistentIDsAndSectionsWithProperty_usingBlock___block_invoke;
  v8[3] = &unk_1E5FB2828;
  id v9 = v6;
  id v7 = v6;
  [(ML3Query *)self enumeratePersistentIDsAndProperties:0 ordered:1 sectionProperty:a3 cancelBlock:0 usingBlock:v8];
}

void __28__ML3Query_hasRowForColumn___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) spotlightPredicate];
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 library];
    [v4 loadNamesFromLibrary:v5 onConnection:v12 forPredicate:v3 loadAllNames:0 cancelHandler:0];
  }
  id v6 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    id v7 = *(__CFString **)(a1 + 40);
  }
  else {
    id v7 = @"1";
  }
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
  id v9 = [v6 selectSQLWithColumns:v8 orderingTerms:0 limit:1];

  uint64_t v10 = [*(id *)(a1 + 32) persistentIDParameters];
  uint64_t v11 = [v12 executeQuery:v9 withParameters:v10];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v11 hasAtLeastOneRow];
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 sectionProperty:(id)a5 cancelBlock:(id)a6 usingBlock:(id)a7
{
  BOOL v10 = a4;
  unint64_t v12 = (unint64_t)a3;
  unint64_t v13 = (unint64_t)a5;
  id v34 = (unsigned int (**)(void))a6;
  id v31 = a7;
  uint64_t v32 = [(ML3Query *)self library];
  v36 = [v32 checkoutReaderConnection];
  memset(v53, 0, sizeof(v53));
  int v54 = 1065353216;
  if (v12 | v13)
  {
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v12, "count") + 1);
    uint64_t v15 = v14;
    if (v13) {
      [v14 addObject:v13];
    }
    if (v12)
    {
      for (unint64_t i = 0; [(id)v12 count] > i; ++i)
      {
        id v17 = [(id)v12 objectAtIndexedSubscript:i];
        if ([(objc_class *)self->_entityClass propertyIsCountProperty:v17]) {
          std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v53, i, i);
        }
        else {
          [v15 addObject:v17];
        }
      }
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v18 = [(ML3Predicate *)self->_predicate spotlightPredicate];
  memset(v51, 0, sizeof(v51));
  int v52 = 1065353216;
  __int16 v33 = v18;
  if (v18)
  {
    uint64_t v35 = [MEMORY[0x1E4F28E78] string];
    objc_msgSend(v18, "appendSQLToMutableString:entityClass:");
    v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_orderingTerms, "count") + 1);
    [v19 addObjectsFromArray:self->_orderingTerms];
    id v20 = +[ML3OrderingTerm orderingTermWithProperty:v35 direction:2];
    [v19 addObject:v20];

    objc_storeStrong((id *)&self->_orderingTerms, v19);
    unint64_t v21 = 0;
    char v22 = 0;
    while ([v15 count] > v21)
    {
      uint64_t v23 = [v15 objectAtIndex:v21];
      uint64_t v24 = [(ML3Query *)self nameOrderPropertyForProperty:v23];

      if (v24)
      {
        [v15 replaceObjectAtIndex:v21 withObject:v24];
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)v51, v21, v21);
        char v22 = 1;
      }

      ++v21;
    }
    id v25 = [(ML3Query *)self library];
    LOBYTE(v18) = v22 & 1;
    [(ML3Query *)self loadNamesFromLibrary:v25 onConnection:v36 forPredicate:v33 loadAllNames:v22 & 1 cancelHandler:v34];

    if (v34 && v34[2]())
    {
      [v32 checkInDatabaseConnection:v36];
      goto LABEL_28;
    }
  }
  uint64_t v35 = [(ML3Query *)self selectPersistentIDsSQLAndProperties:v15 ordered:v10];
  v19 = [(ML3Query *)self persistentIDParameters];
  id v26 = [(ML3Query *)self enumerationDatabaseResultForSQL:v35 onConnection:v36 withParameters:v19];
  size_t v27 = [(id)v12 count];
  size_t v28 = v27;
  if (v27)
  {
    uint64_t v29 = malloc_type_calloc(v27, 8uLL, 0x80040B8603338uLL);
    id v30 = (void *)v13;
    bzero(v29, 8 * v28);
  }
  else
  {
    id v30 = (void *)v13;
    uint64_t v29 = 0;
  }
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  char v50 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3321888768;
  v37[2] = __95__ML3Query_enumeratePersistentIDsAndProperties_ordered_sectionProperty_cancelBlock_usingBlock___block_invoke;
  v37[3] = &unk_1F08C8828;
  v37[4] = self;
  v43 = v49;
  uint64_t v41 = v34;
  id v38 = v30;
  size_t v45 = v28;
  v47[40] = (_BYTE)v18;
  std::unordered_set<int>::unordered_set((uint64_t)v46, (uint64_t)v51);
  v46[5] = v29;
  id v39 = v33;
  std::unordered_set<int>::unordered_set((uint64_t)v47, (uint64_t)v53);
  id v40 = (id)v12;
  id v42 = v31;
  uint64_t v44 = v48;
  unint64_t v13 = (unint64_t)v30;
  [v26 enumerateRowsWithBlock:v37];
  [v32 checkInDatabaseConnection:v36];
  if (v29) {
    free(v29);
  }

  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v47);
  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v46);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);

LABEL_28:
  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v51);

  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v53);
}

- (ML3MusicLibrary)library
{
  return self->_library;
}

- (id)persistentIDParameters
{
  Class entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class() || (Class v4 = self->_entityClass, v4 == (Class)objc_opt_class()))
  {
    id v5 = [(ML3Query *)self predicateIncludingSystemwidePredicates];
  }
  else
  {
    id v5 = [(ML3Query *)self predicate];
  }
  id v6 = v5;
  id v7 = [v5 databaseStatementParameters];

  return v7;
}

- (id)enumerationDatabaseResultForSQL:(id)a3 onConnection:(id)a4 withParameters:(id)a5
{
  id v5 = [a4 executeQuery:a3 withParameters:a5];

  return v5;
}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4
{
  Class v4 = [(ML3Query *)self selectPersistentIDsSQLAndProperties:a3 ordered:a4 distinct:0];

  return v4;
}

- (id)selectPersistentIDsSQLAndProperties:(id)a3 ordered:(BOOL)a4 distinct:(BOOL)a5
{
  BOOL v19 = a5;
  BOOL v5 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
  Class entityClass = self->_entityClass;
  BOOL v10 = [(ML3Query *)self persistentIDProperty];
  uint64_t v11 = [(objc_class *)entityClass disambiguatedSQLForProperty:v10];

  [v8 addObject:v11];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [(objc_class *)self->_entityClass disambiguatedSQLForProperty:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        [v8 addObject:v16];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  if (v5) {
    [(ML3Query *)self selectSQLWithColumns:v8 groupBy:0 distinct:v19];
  }
  else {
  id v17 = [(ML3Query *)self selectSQLWithColumns:v8 orderingTerms:0 distinct:v19];
  }

  return v17;
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 distinct:(BOOL)a5
{
  BOOL v5 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:a4 orderingTerms:self->_orderingTerms directionality:0 usingLowerBound:0 distinct:a5 limit:self->_limit];

  return v5;
}

- (NSString)persistentIDProperty
{
  v2 = @"ROWID";
  return (NSString *)@"ROWID";
}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 limit:(unint64_t)a5
{
  BOOL v5 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:0 orderingTerms:a4 directionality:0 usingLowerBound:0 distinct:0 limit:a5];

  return v5;
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ML3Query_enumeratePersistentIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E5FB2828;
  id v7 = v4;
  id v5 = v4;
  [(ML3Query *)self enumeratePersistentIDsAndProperties:0 ordered:1 sectionProperty:0 cancelBlock:0 usingBlock:v6];
}

- (void)setIgnoreRestrictionsPredicates:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_options = self->_options & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (unint64_t)countOfEntities
{
  return [(ML3Query *)self countOfDistinctRowsForColumn:self->_propertyToCount];
}

- (void)setIgnoreSystemFilterPredicates:(BOOL)a3
{
  self->_options = self->_options & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (ML3AggregateQuery)nonDirectAggregateQuery
{
  return self->_nonDirectAggregateQuery;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSString)propertyToCount
{
  return self->_propertyToCount;
}

- (BOOL)sectionsPersistentIDColumnIsDistinct
{
  return 0;
}

- (id)countStatementParameters
{
  v2 = [(ML3Query *)self predicateIncludingSystemwidePredicates];
  uint64_t v3 = [v2 databaseStatementParameters];

  return v3;
}

- (NSString)selectCountSQL
{
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObject:@"COUNT(1)"];
  id v4 = [(ML3Query *)self selectSQLWithColumns:v3 orderingTerms:0];

  return (NSString *)v4;
}

- (NSString)selectPersistentIDsSQL
{
  return (NSString *)[(ML3Query *)self selectPersistentIDsSQLAndProperties:0 ordered:1];
}

- (id)selectUnorderedPersistentIDsSQL
{
  return [(ML3Query *)self selectPersistentIDsSQLAndProperties:0 ordered:0];
}

- (id)sectionsParameters
{
  Class entityClass = self->_entityClass;
  if (entityClass == (Class)objc_opt_class() || (Class v4 = self->_entityClass, v4 == (Class)objc_opt_class()))
  {
    id v5 = [(ML3Query *)self predicateIncludingSystemwidePredicates];
  }
  else
  {
    id v5 = [(ML3Query *)self predicate];
  }
  id v6 = v5;
  id v7 = [v5 databaseStatementParameters];

  return v7;
}

- (id)selectSectionsSQL
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  Class v4 = [(ML3Query *)self persistentIDProperty];
  id v5 = [(objc_class *)self->_entityClass disambiguatedSQLForProperty:v4];
  if (self->_limit)
  {
    BOOL v6 = [(ML3Query *)self sectionsPersistentIDColumnIsDistinct];
    unint64_t limit = self->_limit;
    if (v6) {
      [NSString stringWithFormat:@"MIN(COUNT(DISTINCT %@), %lu)", v5, limit];
    }
    else {
      [NSString stringWithFormat:@"MIN(COUNT(%@), %lu)", v5, limit];
    }
  }
  else if ([(ML3Query *)self sectionsPersistentIDColumnIsDistinct])
  {
    [NSString stringWithFormat:@"COUNT(DISTINCT %@)", v5];
  }
  else
  {
    [NSString stringWithFormat:@"COUNT(%@)", v5];
  uint64_t v8 = };
  [v3 addObject:v8];

  id v9 = [(ML3Query *)self sectionProperty];
  if (v9)
  {
    BOOL v10 = [(objc_class *)self->_entityClass disambiguatedSQLForProperty:v9];
    [v3 addObject:v10];
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v11 = [(ML3Query *)self selectSQLWithColumns:v3 groupBy:v10 orderingTerms:0 limit:0];

  return v11;
}

void __101__ML3Query_selectSQLWithColumns_groupBy_orderingTerms_directionality_usingLowerBound_distinct_limit___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 56) < a3)
  {
    *a4 = 1;
    goto LABEL_16;
  }
  id v14 = v7;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@" AND "];
  }
  uint64_t v8 = [v14 property];
  id v9 = *(void **)(a1 + 32);
  BOOL v10 = [*(id *)(*(void *)(a1 + 40) + 16) disambiguatedSQLForProperty:v8];
  [v9 appendString:v10];

  if (*(void *)(a1 + 56) == a3)
  {
    unint64_t v11 = [*(id *)(a1 + 48) count];
    if (v11 > a3
      && ([*(id *)(a1 + 48) objectAtIndex:a3],
          BOOL v10 = objc_claimAutoreleasedReturnValue(),
          [v10 uppercaseString],
          id v9 = objc_claimAutoreleasedReturnValue(),
          [v9 isEqualToString:@"DESC"]))
    {
    }
    else
    {
      int v13 = [v14 direction];
      if (v11 > a3)
      {
      }
      if (v13 != 2)
      {
        id v12 = @" > ";
        goto LABEL_15;
      }
    }
    id v12 = @" < ";
  }
  else
  {
    id v12 = @" = ";
  }
LABEL_15:
  [*(id *)(a1 + 32) appendString:v12];
  [*(id *)(a1 + 32) appendString:@"?"];

  id v7 = v14;
LABEL_16:
}

- (id)lowerBoundParametersForOrderingTerms:(id)a3 lowerBoundPersistentID:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  long long v22 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = [MEMORY[0x1E4F28E78] string];
  uint64_t v25 = [(objc_class *)self->_entityClass databaseTable];
  long long v23 = [MEMORY[0x1E4F1CA70] orderedSet];
  [v21 appendString:@"SELECT "];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke;
  v35[3] = &unk_1E5FB2850;
  id v6 = v21;
  id v36 = v6;
  uint64_t v37 = self;
  id v7 = v23;
  id v38 = v7;
  [v24 enumerateObjectsUsingBlock:v35];
  [v6 appendString:@" FROM "];
  [v6 appendString:v25];
  if ([v7 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
          [v6 appendString:@" "];
          [v6 appendString:v12];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v9);
    }
  }
  [v6 appendString:@" WHERE "];
  int v13 = [(objc_class *)self->_entityClass databaseTable];
  [v6 appendString:v13];

  [v6 appendString:@".ROWID = ?"];
  library = self->_library;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_2;
  v26[3] = &unk_1E5FB28A0;
  id v15 = v6;
  id v27 = v15;
  int64_t v30 = a4;
  id v16 = v24;
  id v28 = v16;
  id v17 = v22;
  id v29 = v17;
  [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v26];
  id v18 = v29;
  id v19 = v17;

  return v19;
}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [v5 appendSQLToMutableString:*(void *)(a1 + 32) entityClass:*(void *)(*(void *)(a1 + 40) + 16)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(void **)(*(void *)(a1 + 40) + 16);
  id v7 = objc_msgSend(v5, "property", 0);
  id v8 = [v6 joinClausesForProperty:v7];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 48) addObject:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 56)];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v7 = [v3 executeQuery:v4 withParameters:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_3;
  v8[3] = &unk_1E5FB6278;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v7 enumerateRowsWithBlock:v8];
}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) count];
  if (v7)
  {
    uint64_t v8 = 0;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    do
    {
      id v10 = *(void **)(a1 + 32);
      v11[0] = v9;
      v11[1] = 3221225472;
      void v11[2] = __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_4;
      v11[3] = &unk_1E5FB2878;
      uint64_t v14 = v8;
      id v12 = v6;
      id v13 = *(id *)(a1 + 40);
      [v10 enumerateObjectsUsingBlock:v11];

      ++v8;
    }
    while (v7 != v8);
  }
  *a4 = 1;
}

void __72__ML3Query_lowerBoundParametersForOrderingTerms_lowerBoundPersistentID___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 48) >= a3)
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = (void *)v5;
    id v9 = (id)v5;
    if (!v5)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    }
    [v6 addObject:v7];
    uint64_t v8 = v9;
    if (!v9)
    {

      uint64_t v8 = 0;
    }
  }
  else
  {
    *a4 = 1;
  }
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 directionality:(id)a6 usingLowerBound:(BOOL)a7
{
  uint64_t v7 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:a4 orderingTerms:a5 directionality:a6 usingLowerBound:a7 distinct:0 limit:self->_limit];

  return v7;
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5 limit:(unint64_t)a6
{
  id v6 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:a4 orderingTerms:a5 directionality:0 usingLowerBound:0 distinct:0 limit:a6];

  return v6;
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4 orderingTerms:(id)a5
{
  uint64_t v5 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:a4 orderingTerms:a5 directionality:0 usingLowerBound:0 distinct:0 limit:self->_limit];

  return v5;
}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 distinct:(BOOL)a5
{
  uint64_t v5 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:0 orderingTerms:a4 directionality:0 usingLowerBound:0 distinct:a5 limit:self->_limit];

  return v5;
}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4
{
  uint64_t v4 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:0 orderingTerms:a4 directionality:0 usingLowerBound:0 distinct:0 limit:self->_limit];

  return v4;
}

- (id)selectSQLWithColumns:(id)a3 orderingTerms:(id)a4 directionality:(id)a5
{
  uint64_t v5 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:0 orderingTerms:a4 directionality:a5 usingLowerBound:0 distinct:0 limit:self->_limit];

  return v5;
}

- (id)selectSQLWithColumns:(id)a3 groupBy:(id)a4
{
  uint64_t v4 = [(ML3Query *)self selectSQLWithColumns:a3 groupBy:a4 orderingTerms:self->_orderingTerms directionality:0 usingLowerBound:0 distinct:0 limit:self->_limit];

  return v4;
}

- (id)valueForAggregateFunction:(id)a3 onEntitiesForProperty:(id)a4
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (-[ML3Query valueForAggregateFunction:onEntitiesForProperty:]::onceToken != -1) {
    dispatch_once(&-[ML3Query valueForAggregateFunction:onEntitiesForProperty:]::onceToken, &__block_literal_global_5003);
  }
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__5004;
  id v26 = __Block_byref_object_dispose__5005;
  id v27 = 0;
  if ([(id)__supportedAggregateFunctions containsObject:v6])
  {
    uint64_t v8 = [(objc_class *)[(ML3Query *)self entityClass] disambiguatedSQLForProperty:v7];
    if (v8)
    {
      id v9 = (void *)[[NSString alloc] initWithFormat:@"%@(%@)", v6, v8];
      v28[0] = v9;
      v28[1] = v7;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      uint64_t v11 = [(ML3Query *)self selectSQLWithColumns:v10 orderingTerms:0];

      id v12 = [(ML3Query *)self persistentIDParameters];
      library = self->_library;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __60__ML3Query_valueForAggregateFunction_onEntitiesForProperty___block_invoke_86;
      void v18[3] = &unk_1E5FB57C0;
      id v14 = v11;
      id v19 = v14;
      id v20 = v12;
      long long v21 = &v22;
      id v15 = v12;
      [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v18];
    }
  }
  id v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __60__ML3Query_valueForAggregateFunction_onEntitiesForProperty___block_invoke_86(void *a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 executeQuery:a1[4] withParameters:a1[5]];
  uint64_t v4 = [v3 objectForFirstRowAndColumn];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __60__ML3Query_valueForAggregateFunction_onEntitiesForProperty___block_invoke()
{
  __supportedAggregateFunctions = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"TOTAL", @"MAX", @"MIN", 0);

  return MEMORY[0x1F41817F8]();
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 ordered:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__ML3Query_enumeratePersistentIDsAndProperties_ordered_usingBlock___block_invoke;
  v10[3] = &unk_1E5FB2828;
  id v11 = v8;
  id v9 = v8;
  [(ML3Query *)self enumeratePersistentIDsAndProperties:a3 ordered:v5 sectionProperty:0 cancelBlock:0 usingBlock:v10];
}

uint64_t __67__ML3Query_enumeratePersistentIDsAndProperties_ordered_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__ML3Query_enumeratePersistentIDsAndProperties_usingBlock___block_invoke;
  v8[3] = &unk_1E5FB2828;
  id v9 = v6;
  id v7 = v6;
  [(ML3Query *)self enumeratePersistentIDsAndProperties:a3 ordered:1 sectionProperty:0 cancelBlock:0 usingBlock:v8];
}

uint64_t __59__ML3Query_enumeratePersistentIDsAndProperties_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  id v4 = a3;
  if (self->_usingSections)
  {
    BOOL v5 = [(ML3Query *)self library];
    id v6 = [(ML3Query *)self selectSectionsSQL];
    id v13 = [(ML3Query *)self sectionProperty];
    id v7 = [(ML3QuerySection *)v5 checkoutReaderConnection];
    id v8 = [(ML3Predicate *)self->_predicate spotlightPredicate];
    if (v8)
    {
      id v9 = [(ML3Query *)self library];
      [(ML3Query *)self loadNamesFromLibrary:v9 onConnection:v7 forPredicate:v8 loadAllNames:0 cancelHandler:0];
    }
    id v10 = [(ML3Query *)self sectionsParameters];
    id v11 = [v7 executeQuery:v6 withParameters:v10];
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __40__ML3Query_enumerateSectionsUsingBlock___block_invoke;
    v14[3] = &unk_1E5FB2800;
    id v12 = v13;
    id v15 = v12;
    uint64_t v17 = v20;
    id v16 = v4;
    id v18 = v19;
    [v11 enumerateRowsWithBlock:v14];
    [(ML3QuerySection *)v5 checkInDatabaseConnection:v7];

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);
  }
  else
  {
    BOOL v5 = objc_alloc_init(ML3QuerySection);
    -[ML3QuerySection setRange:](v5, "setRange:", 0, [(ML3Query *)self countOfEntities]);
    LOBYTE(v20[0]) = 0;
    (*((void (**)(id, ML3QuerySection *, void, void *))v4 + 2))(v4, v5, 0, v20);
  }
}

void __40__ML3Query_enumerateSectionsUsingBlock___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 int64ForColumnIndex:0];
  if (v7
    && (!a1[4] ? (int v8 = 0) : (int v8 = [v6 intForColumnIndex:1]),
        id v9 = -[ML3QuerySection initWithRange:sectionIndex:]([ML3QuerySection alloc], "initWithRange:sectionIndex:", *(void *)(*(void *)(a1[6] + 8) + 24), v7, v8), *(void *)(*(void *)(a1[6] + 8) + 24) += v7, v11 = 0, v9))
  {
    (*(void (**)(void))(a1[5] + 16))();
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    char v10 = v11;
  }
  else
  {
    char v10 = 0;
  }
  *a4 = v10;
}

- (BOOL)deleteAllEntitiesFromLibraryWithDeletionType:(int)a3 usingConnection:(id)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke;
  v6[3] = &unk_1E5FB27D8;
  void v6[4] = self;
  v6[5] = &v8;
  int v7 = a3;
  [a4 performTransactionWithBlock:v6];
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke(uint64_t a1)
{
  v14[0] = 0;
  v14[1] = v14;
  void v14[2] = 0x2020000000;
  v14[3] = 10000;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v9 = 0;
  id v9 = malloc_type_malloc(0x13880uLL, 0x100004000313F17uLL);
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke_2;
  v5[3] = &unk_1E5FB2788;
  v5[4] = &v10;
  v5[5] = v14;
  void v5[6] = &v6;
  [v2 enumeratePersistentIDsUsingBlock:v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) deleteFromLibrary:*(void *)(*(void *)(a1 + 32) + 8) deletionType:*(unsigned int *)(a1 + 48) persistentIDs:v7[3] count:v11[3]];
  free((void *)v7[3]);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v3;
}

void *__73__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType_usingConnection___block_invoke_2(void *result, uint64_t a2, uint64_t a3)
{
  BOOL v5 = result;
  uint64_t v6 = *(void *)(*(void *)(result[4] + 8) + 24);
  uint64_t v7 = *(void *)(result[5] + 8);
  if (v6 == *(void *)(v7 + 24))
  {
    *(void *)(v7 + 24) = 2 * v6;
    result = malloc_type_realloc(*(void **)(*(void *)(result[6] + 8) + 24), 8 * *(void *)(*(void *)(result[5] + 8) + 24), 0x100004000313F17uLL);
    *(void *)(*(void *)(v5[6] + 8) + 24) = result;
  }
  *(void *)(*(void *)(*(void *)(v5[6] + 8) + 24) + 8 * a3) = a2;
  ++*(void *)(*(void *)(v5[4] + 8) + 24);
  return result;
}

- (BOOL)deleteAllEntitiesFromLibraryWithDeletionType:(int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  library = self->_library;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke;
  v6[3] = &unk_1E5FB27B0;
  void v6[4] = self;
  v6[5] = &v8;
  int v7 = a3;
  [(ML3MusicLibrary *)library performDatabaseTransactionWithBlock:v6];
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke(uint64_t a1)
{
  v14[0] = 0;
  v14[1] = v14;
  void v14[2] = 0x2020000000;
  v14[3] = 10000;
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v9 = 0;
  id v9 = malloc_type_malloc(0x13880uLL, 0x100004000313F17uLL);
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke_2;
  v5[3] = &unk_1E5FB2788;
  v5[4] = &v10;
  v5[5] = v14;
  void v5[6] = &v6;
  [v2 enumeratePersistentIDsUsingBlock:v5];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) deleteFromLibrary:*(void *)(*(void *)(a1 + 32) + 8) deletionType:*(unsigned int *)(a1 + 48) persistentIDs:v7[3] count:v11[3]];
  free((void *)v7[3]);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  return v3;
}

void *__57__ML3Query_deleteAllEntitiesFromLibraryWithDeletionType___block_invoke_2(void *result, uint64_t a2, uint64_t a3)
{
  BOOL v5 = result;
  uint64_t v6 = *(void *)(*(void *)(result[4] + 8) + 24);
  uint64_t v7 = *(void *)(result[5] + 8);
  if (v6 == *(void *)(v7 + 24))
  {
    *(void *)(v7 + 24) = 2 * v6;
    result = malloc_type_realloc(*(void **)(*(void *)(result[6] + 8) + 24), 8 * *(void *)(*(void *)(result[5] + 8) + 24), 0x100004000313F17uLL);
    *(void *)(*(void *)(v5[6] + 8) + 24) = result;
  }
  *(void *)(*(void *)(*(void *)(v5[6] + 8) + 24) + 8 * a3) = a2;
  ++*(void *)(*(void *)(v5[4] + 8) + 24);
  return result;
}

- (BOOL)deleteAllEntitiesFromLibrary
{
  return [(ML3Query *)self deleteAllEntitiesFromLibraryWithDeletionType:1];
}

- (id)sections
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __20__ML3Query_sections__block_invoke;
  v6[3] = &unk_1E5FB2760;
  id v4 = v3;
  id v7 = v4;
  [(ML3Query *)self enumerateSectionsUsingBlock:v6];

  return v4;
}

uint64_t __20__ML3Query_sections__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ML3Query;
  id v4 = [(ML3Query *)&v7 description];
  BOOL v5 = [v3 stringWithFormat:@"%@(_predicate = %@, _orderingTerms = %@, _using sections = %d)", v4, self->_predicate, self->_orderingTerms, self->_usingSections];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 1, self->_library);
  v4[2] = self->_entityClass;
  uint64_t v5 = [(ML3Predicate *)self->_predicate copy];
  id v6 = v4[3];
  v4[3] = (id)v5;

  uint64_t v7 = [(NSArray *)self->_orderingTerms copy];
  id v8 = v4[4];
  v4[4] = (id)v7;

  uint64_t v9 = [(ML3AggregateQuery *)self->_nonDirectAggregateQuery copy];
  id v10 = v4[6];
  v4[6] = (id)v9;

  objc_storeStrong(v4 + 5, self->_propertyToCount);
  *((unsigned char *)v4 + 56) = self->_usingSections;
  v4[10] = self->_limit;
  v4[8] = self->_options;
  return v4;
}

- (id)reverseQuery
{
  uint64_t v3 = (void *)[(ML3Query *)self copy];
  uint64_t v4 = +[ML3OrderingTerm reversedTerms:self->_orderingTerms];
  uint64_t v5 = (void *)v3[4];
  v3[4] = v4;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v6 = [(ML3Query *)self entityClass];
    if (v6 == (objc_class *)[v4 entityClass])
    {
      uint64_t v9 = [(ML3Query *)self predicate];
      id v10 = [v4 predicate];
      id v11 = v9;
      id v12 = v10;
      if (v11 == v12)
      {
      }
      else
      {
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          LOBYTE(v7) = 0;
LABEL_23:

          goto LABEL_4;
        }
      }
      id v14 = [(ML3Query *)self orderingTerms];
      id v15 = objc_msgSend(v4, "orderingTerms", v14);
      id v16 = v14;
      id v17 = v15;
      if (v16 == v17)
      {
      }
      else
      {
        int v18 = [v16 isEqual:v17];

        if (!v18)
        {
          LOBYTE(v7) = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      id v19 = [(ML3Query *)self nonDirectAggregateQuery];
      id v20 = [v4 nonDirectAggregateQuery];
      id v21 = v19;
      id v22 = v20;
      if (v21 == v22)
      {
      }
      else
      {
        int v7 = [v21 isEqual:v22];

        if (!v7)
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      int v23 = [(ML3Query *)self usingSections];
      if (v23 == [v4 usingSections]
        && (int v24 = [(ML3Query *)self ignoreSystemFilterPredicates],
            v24 == [v4 ignoreSystemFilterPredicates]))
      {
        BOOL v25 = [(ML3Query *)self ignoreRestrictionsPredicates];
        int v7 = v25 ^ [v4 ignoreRestrictionsPredicates] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
      goto LABEL_21;
    }
  }
  LOBYTE(v7) = 0;
LABEL_4:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(ML3Query *)self library];
  [v10 encodeObject:v4 forKey:@"musicLibrary"];

  uint64_t v5 = NSStringFromClass([(ML3Query *)self entityClass]);
  [v10 encodeObject:v5 forKey:@"entityClass"];

  id v6 = [(ML3Query *)self predicate];
  [v10 encodeObject:v6 forKey:@"predicate"];

  int v7 = [(ML3Query *)self orderingTerms];
  [v10 encodeObject:v7 forKey:@"orderingTerms"];

  id v8 = [(ML3Query *)self nonDirectAggregateQuery];
  [v10 encodeObject:v8 forKey:@"nonDirectAggregateQuery"];

  uint64_t v9 = [(ML3Query *)self propertyToCount];
  [v10 encodeObject:v9 forKey:@"propertyToCount"];

  objc_msgSend(v10, "encodeBool:forKey:", -[ML3Query usingSections](self, "usingSections"), @"usingSections");
  objc_msgSend(v10, "encodeBool:forKey:", -[ML3Query ignoreSystemFilterPredicates](self, "ignoreSystemFilterPredicates"), @"ignoreSystemFilterPredicates");
  objc_msgSend(v10, "encodeBool:forKey:", -[ML3Query ignoreRestrictionsPredicates](self, "ignoreRestrictionsPredicates"), @"ignoreRestrictionsPredicates");
  [v10 encodeInt64:self->_options forKey:@"options"];
}

- (ML3Query)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"musicLibrary"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityClass"];
  Class v7 = NSClassFromString(v6);

  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"orderingTerms"];

  uint64_t v13 = [v4 decodeBoolForKey:@"usingSections"];
  id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonDirectAggregateQuery"];
  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyToCount"];
  id v16 = -[ML3Query initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:](self, "initWithLibrary:entityClass:predicate:orderingTerms:usingSections:nonDirectAggregateQuery:propertyToCount:options:", v5, v7, v8, v12, v13, v14, v15, [v4 decodeInt64ForKey:@"options"]);

  return v16;
}

- (BOOL)ignoreRestrictionsPredicates
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)ignoreSystemFilterPredicates
{
  return self->_options & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)nameOrderPropertyForProperty:(id)a3
{
  v8[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7[0] = @"item_extra.title";
  v7[1] = @"album.album";
  v8[0] = @"item_search.search_title";
  v8[1] = @"item_search.search_album";
  v7[2] = @"album_artist.album_artist";
  v7[3] = @"item_artist.item_artist";
  v8[2] = @"item_search.search_album_artist";
  v8[3] = @"item_search.search_artist";
  v7[4] = @"composer.composer";
  v7[5] = @"item_artist.series_name";
  void v8[4] = @"item_search.search_composer";
  void v8[5] = @"item_search.search_series";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

- (void)loadNamesFromLibrary:(id)a3 onConnection:(id)a4 forPredicate:(id)a5 loadAllNames:(BOOL)a6 cancelHandler:(id)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  if (v8)
  {
    id v14 = +[ML3SpotlightNameCache copyFromLibrary:v16 cancelHandler:v13];
    id v15 = (void *)v12[1];
    v12[1] = v14;
  }
  +[ML3SpotlightMatchingNameCache loadFromLibrary:v16 namesMatchingString:v12[3] cancelHandler:v13];
}

@end