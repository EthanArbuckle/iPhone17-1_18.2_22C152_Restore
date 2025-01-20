@interface ML3Entity
+ (BOOL)_deleteRowForPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 library:(id)a5 table:(id)a6 usingColumn:(id)a7 usingConnection:(id)a8;
+ (BOOL)_shouldIncrementRevisionForType:(int)a3 persistentID:(int64_t)a4 usingConnection:(id)a5;
+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 usingConnection:(id)a8;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6;
+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7;
+ (BOOL)incrementRevisionForRevisionTypeContentWithConnection:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6;
+ (BOOL)incrementRevisionForRevisionTypeContentWithConnection:(id)a3 deletionType:(int)a4 persistentIDs:(id)a5;
+ (BOOL)incrementRevisionForRevisionTypeContentWithLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(id)a5;
+ (BOOL)incrementRevisionWithLibrary:(id)a3 persistentID:(int64_t)a4 deletionType:(int)a5 revisionType:(int)a6;
+ (BOOL)incrementRevisionWithLibrary:(id)a3 persistentID:(int64_t)a4 deletionType:(int)a5 revisionType:(int)a6 usingConnection:(id)a7;
+ (BOOL)insertValues:(id)a3 intoTable:(id)a4 persistentID:(int64_t)a5 connection:(id)a6;
+ (BOOL)insertValues:(id)a3 intoTable:(id)a4 persistentID:(int64_t)a5 library:(id)a6;
+ (BOOL)insertionChangesLibraryContents;
+ (BOOL)libraryContentsChangeForProperty:(id)a3;
+ (BOOL)libraryDynamicChangeForProperty:(id)a3;
+ (BOOL)propertyIsCountProperty:(id)a3;
+ (BOOL)removeFromMyLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6;
+ (BOOL)setDifferentValues:(id)a3 forProperties:(id)a4 forEntityPersistentIDs:(id)a5 inLibrary:(id)a6 usingConnection:(id)a7;
+ (BOOL)setValues:(id)a3 forProperties:(id)a4 forEntityPersistentIDs:(id)a5 inLibrary:(id)a6 usingConnection:(id)a7;
+ (id)URLForEntityWithPersistentID:(int64_t)a3 libraryUID:(id)a4;
+ (id)_createDisambiguatedSQLForProperty:(id)a3;
+ (id)_entityForURLComponents:(id)a3 inLibrary:(id)a4 verifyExistence:(BOOL)a5 reason:(id *)a6;
+ (id)aggregateQueryWithUnitQuery:(id)a3 foreignPersistentIDProperty:(id)a4;
+ (id)allItemsQueryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6;
+ (id)allProperties;
+ (id)anyInLibrary:(id)a3 predicate:(id)a4;
+ (id)anyInLibrary:(id)a3 predicate:(id)a4 options:(int64_t)a5;
+ (id)collectionClassesToUpdateBeforeDelete;
+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5;
+ (id)defaultFilterPredicates;
+ (id)defaultOrderingTerms;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)disambiguatedSelectSQLForProperty:(id)a3;
+ (id)entityFromURL:(id)a3 inLibrary:(id)a4;
+ (id)entityFromURL:(id)a3 inLibrary:(id)a4 verifyExistence:(BOOL)a5;
+ (id)entityFromURL:(id)a3 reason:(id *)a4;
+ (id)entityURLScheme;
+ (id)extraTablesToDelete;
+ (id)extraTablesToInsert;
+ (id)foreignColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4;
+ (id)indexableSQLForProperties:(id)a3;
+ (id)joinClausesForProperty:(id)a3;
+ (id)newSelectAllEntitiesSQLForProperties:(const void *)a3 count:(unint64_t)a4 predicate:(id)a5;
+ (id)newSelectSQLForProperties:(const void *)a3 count:(unint64_t)a4 predicate:(id)a5;
+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4;
+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5;
+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6;
+ (id)newWithPersistentID:(int64_t)a3 inLibrary:(id)a4;
+ (id)orderingSQLForProperties:(id)a3 directionality:(id)a4;
+ (id)persistentIDColumnForTable:(id)a3;
+ (id)predicateByOptimizingComparisonPredicate:(id)a3;
+ (id)predicateByOptimizingPredicate:(id)a3;
+ (id)predicateIncludingSystemwidePredicatesWithPredicate:(id)a3 library:(id)a4 options:(int64_t)a5;
+ (id)predisambiguatedProperties;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 options:(int64_t)a5;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6 usingSections:(BOOL)a7;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 usingSections:(BOOL)a6;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 propertyToCount:(id)a6;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 propertyToCount:(id)a6 options:(int64_t)a7;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6 options:(int64_t)a7;
+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 usingSections:(BOOL)a5;
+ (id)sectionPropertyForProperty:(id)a3;
+ (id)subselectPropertyForProperty:(id)a3;
+ (id)subselectStatementForProperty:(id)a3;
+ (id)unrestrictedAllItemsQueryWithlibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5;
+ (id)unrestrictedQueryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5;
+ (id)unsettableProperties;
+ (int64_t)revisionTrackingCode;
+ (void)_didChangeValueForProperties:(id)a3 inLibrary:(id)a4;
+ (void)enumeratePersistentIDsInLibrary:(id)a3 afterRevision:(int64_t)a4 usingBlock:(id)a5;
+ (void)enumeratePersistentIDsInLibrary:(id)a3 matchingPredicate:(id)a4 orderingTerms:(id)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 options:(int64_t)a8 usingBlock:(id)a9;
+ (void)predisambiguateProperties:(id)a3 toDictionary:(id)a4;
- (BOOL)deleteFromLibrary;
- (BOOL)existsInLibrary;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPredicate:(id)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValues:(const void *)a3 forProperties:(const void *)a4 count:(unint64_t)a5;
- (BOOL)setValues:(id)a3 forProperties:(id)a4;
- (BOOL)setValues:(id)a3 forProperties:(id)a4 usingConnection:(id)a5;
- (BOOL)setValuesForPropertiesWithDictionary:(id)a3;
- (ML3Entity)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5;
- (ML3Entity)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6;
- (ML3Entity)initWithPersistentID:(int64_t)a3 inLibrary:(id)a4;
- (ML3MusicLibrary)library;
- (id)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getValuesForProperties:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)persistentID;
- (unint64_t)hash;
- (void)didChangeValueForProperties:(id)a3;
- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5;
- (void)incrementRevision;
- (void)setLibrary:(id)a3;
- (void)setValues:(id)a3 forProperties:(id)a4 async:(BOOL)a5 withCompletionBlock:(id)a6;
@end

@implementation ML3Entity

+ (void)predisambiguateProperties:(id)a3 toDictionary:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        v12 = [(id)objc_opt_class() _createDisambiguatedSQLForProperty:v11];
        [v6 setObject:v12 forKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

+ (id)_createDisambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  id v5 = [a1 joinClausesForProperty:v4];
  if ([v5 count])
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [a1 databaseTable];
    id v6 = [v7 stringWithFormat:@"%@.%@", v8, v4];
  }

  return v6;
}

+ (id)joinClausesForProperty:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"entity_revision.revision"])
  {
    id v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:80];
    objc_msgSend(v4, "appendString:", @"JOIN entity_revision ON (");
    id v5 = [a1 databaseTable];
    [v4 appendString:v5];

    [v4 appendString:@".ROWID = entity_revision.entity_pid"]);
    v8[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __43__ML3Entity_getValues_forProperties_count___block_invoke(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = NSNumber;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a1[5] + 16);
  id v6 = a2;
  uint64_t v7 = [v3 numberWithLongLong:v5];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = [v6 executeQuery:v4 withParameters:v8];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__ML3Entity_getValues_forProperties_count___block_invoke_2;
  v10[3] = &__block_descriptor_40_e40_v32__0__ML3DatabaseRow_8__NSError_16_B24l;
  v10[4] = a1[6];
  [v9 enumerateRowsWithBlock:v10];
}

void __43__ML3Entity_getValues_forProperties_count___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  uint64_t v6 = [v14 columnCount];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    unsigned int v9 = 1;
    do
    {
      uint64_t v10 = [v14 objectAtIndexedSubscript:v8];
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = *(void **)(v11 + 8 * v8);
      *(void *)(v11 + 8 * v8) = v10;

      uint64_t v8 = v9;
    }
    while (v7 > v9++);
  }
  *a4 = 1;
}

- (void).cxx_destruct
{
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 predisambiguatedProperties];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v6 = [(id)objc_opt_class() _createDisambiguatedSQLForProperty:v4];
  }

  return v6;
}

+ (id)predicateIncludingSystemwidePredicatesWithPredicate:(id)a3 library:(id)a4 options:(int64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [a1 defaultFilterPredicates];
  [v10 addObjectsFromArray:v11];

  if (v5) {
    goto LABEL_7;
  }
  if ((id)objc_opt_class() != a1)
  {
    v12 = [v9 libraryEntityFilterPredicatesForEntityClass:a1];
    if (v12) {
      [v10 addObjectsFromArray:v12];
    }
  }
  if ((id)objc_opt_class() != a1)
  {
LABEL_7:
    if ((v5 & 2) != 0) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  id v14 = [v9 libraryEntityFilterPredicatesForContainerClass:a1];
  if (v14) {
    [v10 addObjectsFromArray:v14];
  }

  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((id)objc_opt_class() == a1 && [v9 mediaRestrictionEnabled])
    {
      long long v13 = +[ML3ComparisonPredicate predicateWithProperty:@"ML3IsCurrentlyRestrictedMedia(item.media_type, item_extra.content_rating, item_extra.content_rating_level, (SELECT value FROM _MLDatabaseProperties WHERE key='MPExplicitContentAllowedBoolean'))" equalToInteger:0];
      [v10 addObject:v13];
    }
  }
LABEL_14:
  if ((v5 & 8) != 0 && (id)objc_opt_class() == a1)
  {
    long long v16 = +[ML3PropertyPredicate predicateWithProperty:@"(item.base_location_id OR item.remote_location_id)"];
    [v10 addObject:v16];

    if ((v5 & 4) != 0) {
      goto LABEL_20;
    }
  }
  else if ((v5 & 4) != 0)
  {
    goto LABEL_20;
  }
  if ((id)objc_opt_class() != a1)
  {
    long long v15 = +[ML3PropertyPredicate predicateWithProperty:@"in_my_library"];
    [v10 addObject:v15];
  }
LABEL_20:
  if (v8) {
    [v10 addObject:v8];
  }
  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v17 = +[ML3CompoundPredicate predicateMatchingPredicates:v10];
LABEL_26:
    uint64_t v18 = (void *)v17;
    goto LABEL_28;
  }
  if ([v10 count] == 1)
  {
    uint64_t v17 = [v10 lastObject];
    goto LABEL_26;
  }
  uint64_t v18 = 0;
LABEL_28:

  return v18;
}

+ (id)defaultFilterPredicates
{
  return (id)[MEMORY[0x1E4F1C978] array];
}

+ (id)subselectStatementForProperty:(id)a3
{
  return 0;
}

+ (id)predisambiguatedProperties
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"entity_revision.revision";
  v4[1] = @"entity_revision.deleted";
  v5[0] = @"entity_revision.revision";
  v5[1] = @"entity_revision.deleted";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

+ (id)newWithPersistentID:(int64_t)a3 inLibrary:(id)a4
{
  id v6 = a4;
  unint64_t v7 = (void *)[objc_alloc((Class)a1) initWithPersistentID:a3 inLibrary:v6];

  return v7;
}

- (ML3Entity)initWithPersistentID:(int64_t)a3 inLibrary:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3Entity;
  id v8 = [(ML3Entity *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    v8->_persistentID = a3;
    if (!v7)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:v9 file:@"ML3Entity.m" lineNumber:63 description:&stru_1F08D4D70];
    }
    objc_storeWeak((id *)&v9->_library, v7);
  }

  return v9;
}

+ (id)allItemsQueryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [[ML3Query alloc] initWithLibrary:v10 entityClass:a1 predicate:v11 orderingTerms:v12 usingSections:v6 nonDirectAggregateQuery:0 propertyToCount:0 options:4];

  return v13;
}

+ (id)anyInLibrary:(id)a3 predicate:(id)a4 options:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [[ML3Query alloc] initWithLibrary:v8 entityClass:a1 predicate:v9 orderingTerms:0 usingSections:0 nonDirectAggregateQuery:0 propertyToCount:0 options:a5];
  uint64_t v11 = [(ML3Query *)v10 anyEntityPersistentID];
  if (v11) {
    id v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPersistentID:v11 inLibrary:v8];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [[ML3Query alloc] initWithLibrary:v8 entityClass:a1 predicate:v9 orderingTerms:v10 usingSections:0 nonDirectAggregateQuery:0 propertyToCount:0 options:0];

  return v11;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 defaultOrderingTerms];
  id v9 = [a1 queryWithLibrary:v6 predicate:v7 orderingTerms:v8 usingSections:0];

  return v9;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [[ML3Query alloc] initWithLibrary:v10 entityClass:a1 predicate:v11 orderingTerms:v12 usingSections:v6 nonDirectAggregateQuery:0 propertyToCount:0 options:0];

  return v13;
}

+ (id)aggregateQueryWithUnitQuery:(id)a3 foreignPersistentIDProperty:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[ML3AggregateQuery alloc] initWithUnitQuery:v7 aggregateEntityClass:a1 foreignPersistentIDProperty:v6];

  return v8;
}

+ (id)foreignPropertyForProperty:(id)a3 entityClass:(Class)a4
{
  return 0;
}

- (void)getValues:(id *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    size_t v5 = a5;
    id v6 = a4;
    if (a5 == 1 && [(id)*a4 isEqualToString:@"ROWID"])
    {
      *a3 = [NSNumber numberWithLongLong:self->_persistentID];
    }
    else
    {
      v27[1] = v27;
      id v9 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v9, v5);
      uint64_t v10 = 8 * v5;
      v29 = (char *)v27 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v29, 8 * v5);
      uint64_t v11 = 0;
      size_t v12 = 0;
      do
      {
        a3[v11] = 0;
        if ([(id)objc_opt_class() propertyIsCountProperty:v6[v11]]) {
          v9[v11] = 1;
        }
        else {
          objc_storeStrong((id *)&v29[8 * v12++], (id)v6[v11]);
        }
        ++v11;
      }
      while (v5 != v11);
      bzero(a3, 8 * v5);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
      if (v12)
      {
        id v14 = (id *)malloc_type_calloc(8uLL, v12, 0x11EAEA48uLL);
        long long v15 = (void *)[(id)objc_opt_class() newSelectSQLForProperties:v29 count:v12 predicate:0];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __43__ML3Entity_getValues_forProperties_count___block_invoke;
        v30[3] = &unk_1E5FAFB58;
        id v31 = v15;
        v32 = self;
        v28 = v14;
        v33 = v14;
        id v16 = v15;
        [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v30];
      }
      else
      {
        v28 = 0;
      }
      uint64_t v17 = 0;
      do
      {
        if (*v9++)
        {
          v19 = objc_opt_class();
          id v20 = WeakRetained;
          v21 = [(id)objc_opt_class() queryWithLibrary:WeakRetained predicate:0];
          v22 = [v19 countingQueryForBaseQuery:v21 countProperty:*v6 forIdentifier:self->_persistentID];

          if (v22)
          {
            objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "countOfEntities"));
            id v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v23 = &unk_1F0910BE8;
          }
          *a3 = v23;

          id WeakRetained = v20;
        }
        else
        {
          v24 = v28;
          *a3 = v28[v17];
          id v25 = v24[v17];
          v24[v17] = 0;

          ++v17;
        }
        ++a3;
        ++v6;
        --v5;
      }
      while (v5);
      free(v28);

      v26 = v29 - 8;
      do
      {

        v10 -= 8;
      }
      while (v10);
    }
  }
}

+ (id)newSelectSQLForProperties:(const void *)a3 count:(unint64_t)a4 predicate:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if (v7)
  {
    id v8 = 0;
    id v9 = 0;
LABEL_3:
    v48 = v9;
    v49 = v8;
    v47 = [a1 databaseTable];
    uint64_t v10 = [v7 SQLForEntityClass:a1];
    uint64_t v11 = (void *)v10;
    if (v10) {
      size_t v12 = (__CFString *)v10;
    }
    else {
      size_t v12 = &stru_1F08D4D70;
    }
    long long v13 = v12;

    v46 = v13;
    uint64_t v14 = [(__CFString *)v13 length];
    long long v15 = @" AND ";
    if (!v14) {
      long long v15 = &stru_1F08D4D70;
    }
    v45 = v15;
    id v16 = [v7 SQLJoinClausesForClass:a1];
    id v17 = (id)[v16 mutableCopy];

    unint64_t v18 = a4;
    if (a4)
    {
      uint64_t v19 = 0;
      id v20 = a3;
      do
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v21 = [a1 joinClausesForProperty:v20[v19]];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v55 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v52 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v51 + 1) + 8 * i);
              if (!v17) {
                id v17 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
              }
              [v17 addObject:v26];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v55 count:16];
          }
          while (v23);
        }

        ++v19;
        id v20 = a3;
      }
      while (v19 != v18);
    }
    else
    {
      id v20 = a3;
    }
    if ([v17 count])
    {
      v33 = [v17 objectEnumerator];
      uint64_t v34 = [v33 allObjects];
      v35 = [v34 componentsJoinedByString:@" "];
    }
    else
    {
      v35 = &stru_1F08D4D70;
    }
    uint64_t v36 = [a1 disambiguatedSelectSQLForProperty:*v20];
    v37 = (void *)v36;
    if (v18 < 2)
    {
      v38 = (void *)v36;
    }
    else
    {
      v38 = [MEMORY[0x1E4F28E78] stringWithString:v36];
      unint64_t v39 = v18 - 1;
      v40 = (uint64_t *)(v20 + 1);
      do
      {
        [v38 appendString:@","];
        uint64_t v41 = *v40++;
        v42 = [a1 disambiguatedSelectSQLForProperty:v41];
        [v38 appendString:v42];

        --v39;
      }
      while (v39);
    }
    v43 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ FROM %@ %@ WHERE %@.ROWID = ?%@%@", v38, v47, v35, v47, v45, v46];
    id v9 = v48;
    if (!v7 && v48) {
      [v49 setObject:v43 forKey:v48];
    }

    id v8 = v49;
    goto LABEL_42;
  }
  v27 = [MEMORY[0x1E4F29060] currentThread];
  v28 = [v27 threadDictionary];

  id v29 = [v28 objectForKey:@"ML3EntityPropertySelectSQLCache"];
  if (!v29)
  {
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v28 setObject:v29 forKey:@"ML3EntityPropertySelectSQLCache"];
  }
  v30 = NSStringFromClass((Class)a1);
  id v8 = [v29 objectForKey:v30];

  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v31 = NSStringFromClass((Class)a1);
    [v29 setObject:v8 forKey:v31];
  }
  if (a4 == 1)
  {
    v32 = (id)*a3;
  }
  else
  {
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:a3 count:a4];
  }
  id v9 = v32;
  v43 = [v8 objectForKey:v32];

  id v7 = 0;
  if (!v43) {
    goto LABEL_3;
  }
LABEL_42:

  return v43;
}

+ (BOOL)propertyIsCountProperty:(id)a3
{
  return 0;
}

+ (id)disambiguatedSelectSQLForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"entity_revision.revision"])
  {
    size_t v5 = @"MAX(entity_revision.revision)";
  }
  else
  {
    size_t v5 = [a1 disambiguatedSQLForProperty:v4];
  }

  return v5;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)setLibrary:(id)a3
{
}

- (ML3MusicLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);

  return (ML3MusicLibrary *)WeakRetained;
}

- (void)incrementRevision
{
  v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  [v3 incrementRevisionWithLibrary:WeakRetained persistentID:self->_persistentID deletionType:0 revisionType:0];
}

- (BOOL)deleteFromLibrary
{
  v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  LOBYTE(self) = [v3 deleteFromLibrary:WeakRetained deletionType:2 persistentIDs:&self->_persistentID count:1];

  return (char)self;
}

- (void)didChangeValueForProperties:(id)a3
{
  id v4 = a3;
  size_t v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  [v5 _didChangeValueForProperties:v4 inLibrary:WeakRetained];
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v13[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:v13 count:1];
  id v12 = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];

  LOBYTE(v8) = [(ML3Entity *)self setValues:v9 forProperties:v10];
  return (char)v8;
}

- (BOOL)setValuesForPropertiesWithDictionary:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 allKeys];
  id v6 = [v4 allValues];

  LOBYTE(self) = [(ML3Entity *)self setValues:v6 forProperties:v5];
  return (char)self;
}

- (BOOL)setValues:(id)a3 forProperties:(id)a4 usingConnection:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ML3Entity persistentID](self, "persistentID"));
  v16[0] = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v14 = [(ML3Entity *)self library];
  LOBYTE(self) = [v11 setValues:v10 forProperties:v9 forEntityPersistentIDs:v13 inLibrary:v14 usingConnection:v8];

  return (char)self;
}

- (void)setValues:(id)a3 forProperties:(id)a4 async:(BOOL)a5 withCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, BOOL, void))a6;
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
    int v14 = [WeakRetained isCurrentThreadInTransaction];

    if (v14)
    {
      long long v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "Warning: ignoring asynchronous flag", buf, 2u);
      }

      goto LABEL_10;
    }
    if (!a5)
    {
LABEL_10:
      v12[2](v12, [(ML3Entity *)self setValues:v10 forProperties:v11], 0);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (a5)
  {
LABEL_9:
    id v16 = [(ML3Entity *)self library];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__ML3Entity_setValues_forProperties_async_withCompletionBlock___block_invoke;
    v17[3] = &unk_1E5FAF5E8;
    v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    [v16 performAsyncDatabaseWriteTransactionWithBlock:v17 completionBlock:v12];

    goto LABEL_11;
  }
  [(ML3Entity *)self setValues:v10 forProperties:v11];
LABEL_11:
}

uint64_t __63__ML3Entity_setValues_forProperties_async_withCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValues:*(void *)(a1 + 40) forProperties:*(void *)(a1 + 48)];
}

- (BOOL)setValues:(id)a3 forProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ML3Entity *)self library];
  id v9 = [v8 checkoutWriterConnection];
  [v9 pushTransaction];
  LOBYTE(self) = [(ML3Entity *)self setValues:v7 forProperties:v6 usingConnection:v9];

  [v9 popTransactionAndCommit:1];
  [v8 checkInDatabaseConnection:v9];

  return (char)self;
}

- (BOOL)setValues:(const void *)a3 forProperties:(const void *)a4 count:(unint64_t)a5
{
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
  if (a5)
  {
    unint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      if (a3[v11])
      {
        objc_msgSend(v9, "addObject:");
      }
      else
      {
        long long v13 = [MEMORY[0x1E4F1CA98] null];
        [v9 addObject:v13];
      }
      if (a4[v11])
      {
        objc_msgSend(v10, "addObject:");
      }
      else
      {
        int v14 = [MEMORY[0x1E4F1CA98] null];
        [v10 addObject:v14];
      }
      unint64_t v11 = v12++;
    }
    while (v11 < a5);
  }
  BOOL v15 = [(ML3Entity *)self setValues:v9 forProperties:v10];

  return v15;
}

- (id)valueForProperty:(id)a3
{
  id v6 = 0;
  id v7 = a3;
  [(ML3Entity *)self getValues:&v6 forProperties:&v7 count:1];
  id v4 = v6;

  return v4;
}

- (id)getValuesForProperties:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  if ([v4 count])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v36 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ([v13 isEqualToString:@"ROWID"])
          {
            int v14 = [NSNumber numberWithLongLong:self->_persistentID];
            [v5 setObject:v14 forKey:@"ROWID"];
          }
          else
          {
            if ([(id)objc_opt_class() propertyIsCountProperty:v13]) {
              BOOL v15 = v7;
            }
            else {
              BOOL v15 = v6;
            }
            [v15 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v10);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
    id v17 = objc_opt_class();
    id v18 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:self->_persistentID];
    id v19 = [v17 unrestrictedAllItemsQueryWithlibrary:WeakRetained predicate:v18 orderingTerms:0];

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __36__ML3Entity_getValuesForProperties___block_invoke;
    v41[3] = &unk_1E5FB4998;
    id v42 = v6;
    v35 = v5;
    id v20 = v5;
    id v43 = v20;
    id v33 = v42;
    uint64_t v34 = v19;
    [v19 enumeratePersistentIDsAndProperties:v42 usingBlock:v41];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v21 = v7;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          v27 = objc_opt_class();
          v28 = [(id)objc_opt_class() queryWithLibrary:WeakRetained predicate:0];
          id v29 = [v27 countingQueryForBaseQuery:v28 countProperty:v26 forIdentifier:self->_persistentID];

          if (v29) {
            uint64_t v30 = [v29 countOfEntities];
          }
          else {
            uint64_t v30 = 0;
          }
          id v31 = [NSNumber numberWithUnsignedInteger:v30];
          [v20 setObject:v31 forKey:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v23);
    }

    size_t v5 = v35;
    id v4 = v36;
  }

  return v5;
}

unint64_t __36__ML3Entity_getValuesForProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      uint64_t v7 = *(void *)(a3 + 8 * i);
      if (v7)
      {
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = [*(id *)(a1 + 32) objectAtIndex:i];
        [v8 setObject:v7 forKey:v9];
      }
      unint64_t result = [*(id *)(a1 + 32) count];
    }
  }
  return result;
}

- (id)URL
{
  v3 = objc_opt_class();
  int64_t v4 = [(ML3Entity *)self persistentID];
  size_t v5 = [(ML3Entity *)self library];
  id v6 = [v5 libraryUID];
  uint64_t v7 = [v3 URLForEntityWithPersistentID:v4 libraryUID:v6];

  return v7;
}

- (BOOL)matchesPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  int v14 = @"ROWID";
  size_t v5 = (void *)[(id)objc_opt_class() newSelectSQLForProperties:&v14 count:1 predicate:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__ML3Entity_matchesPredicate___block_invoke;
  v10[3] = &unk_1E5FB4D70;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  id v8 = v5;
  id v12 = v8;
  long long v13 = &v15;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v10];

  LOBYTE(WeakRetained) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)WeakRetained;
}

void __30__ML3Entity_matchesPredicate___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = NSNumber;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  id v5 = a2;
  id v6 = [v3 numberWithLongLong:v4];
  v11[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [*(id *)(a1 + 40) databaseStatementParameters];
  [v8 addObjectsFromArray:v9];

  uint64_t v10 = [v5 executeQuery:*(void *)(a1 + 48) withParameters:v8];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v10 hasAtLeastOneRow];
}

- (BOOL)existsInLibrary
{
  v3 = objc_opt_class();
  uint64_t v4 = (void *)[@"SELECT 1 FROM " mutableCopy];
  id v5 = [v3 databaseTable];
  [v4 appendString:v5];

  [v4 appendString:@" WHERE ROWID = ? LIMIT 1;"];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__ML3Entity_existsInLibrary__block_invoke;
  v9[3] = &unk_1E5FB57C0;
  id v7 = v4;
  id v10 = v7;
  id v11 = self;
  id v12 = &v13;
  [WeakRetained databaseConnectionAllowingWrites:0 withBlock:v9];

  LOBYTE(self) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

void __28__ML3Entity_existsInLibrary__block_invoke(void *a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = NSNumber;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a1[5] + 16);
  id v6 = a2;
  id v7 = [v3 numberWithLongLong:v5];
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v9 = [v6 executeQuery:v4 withParameters:v8];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v9 hasAtLeastOneRow];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)ML3Entity;
  v3 = [(ML3Entity *)&v6 description];
  uint64_t v4 = objc_msgSend(v3, "stringByAppendingFormat:", @"(pid = %lld)", self->_persistentID);

  return v4;
}

- (unint64_t)hash
{
  return self->_persistentID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && v4[2] == self->_persistentID)
  {
    objc_super v6 = [v4 library];
    id v7 = [(ML3Entity *)self library];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t persistentID = self->_persistentID;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  id v7 = (void *)[v4 initWithPersistentID:persistentID inLibrary:WeakRetained];

  return v7;
}

- (ML3Entity)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v31 = a5;
  id v13 = a6;
  int v14 = [v11 objectForKey:@"ROWID"];
  uint64_t v15 = v14;
  if (v14) {
    uint64_t IntegerUUID = [v14 longLongValue];
  }
  else {
    uint64_t IntegerUUID = ML3CreateIntegerUUID();
  }
  uint64_t v17 = IntegerUUID;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v19 = [(id)objc_opt_class() unsettableProperties];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke;
  v43[3] = &unk_1E5FAF520;
  id v20 = v19;
  id v44 = v20;
  id v21 = self;
  long long v45 = v21;
  SEL v47 = a2;
  id v22 = v18;
  id v46 = v22;
  [v11 enumerateKeysAndObjectsUsingBlock:v43];
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 1;
  uint64_t v23 = v13;
  if (!v13)
  {
    uint64_t v23 = [v12 checkoutWriterConnection];
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_2;
  v32[3] = &unk_1E5FAF570;
  uint64_t v24 = v21;
  id v33 = v24;
  id v25 = v22;
  id v34 = v25;
  uint64_t v38 = v17;
  id v26 = v12;
  id v35 = v26;
  long long v37 = &v39;
  id v27 = v23;
  id v36 = v27;
  [v27 performTransactionWithBlock:v32];
  if (!v13)
  {
    [v26 checkInDatabaseConnection:v27];

    id v27 = 0;
  }
  if (*((unsigned char *)v40 + 24)
    && (int v28 = [(id)objc_opt_class() incrementRevisionWithLibrary:v26 persistentID:v17 deletionType:0 revisionType:0], *((unsigned char *)v40 + 24) = v28, v28))
  {
    uint64_t v24 = [(ML3Entity *)v24 initWithPersistentID:v17 inLibrary:v26];
    id v29 = v24;
  }
  else
  {
    id v29 = 0;
  }

  _Block_object_dispose(&v39, 8);
  return v29;
}

void __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v14]) {
    goto LABEL_2;
  }
  BOOL v8 = [(id)objc_opt_class() joinClausesForProperty:v14];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    objc_super v6 = [(id)objc_opt_class() foreignDatabaseTableForProperty:v14];
    if (!v6)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"ML3Entity.m", 327, @"Cannot perform insert with %@ property: no table", v14 object file lineNumber description];
    }
    id v10 = [(id)objc_opt_class() foreignColumnForProperty:v14];
    if (!v10)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"ML3Entity.m", 329, @"Cannot perform insert with %@ property: no column", v14 object file lineNumber description];

      id v7 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if ([v14 isEqualToString:@"ROWID"])
    {
LABEL_2:
      objc_super v6 = 0;
      id v7 = 0;
      goto LABEL_15;
    }
    objc_super v6 = [(id)objc_opt_class() databaseTable];
    id v10 = v14;
  }
  id v7 = v10;
LABEL_11:
  if (v6)
  {
    id v12 = [*(id *)(a1 + 48) objectForKey:v6];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 48) setValue:v12 forKey:v6];
    }
    [v12 setValue:v5 forKey:v7];
  }
LABEL_15:
}

uint64_t __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_3;
  v23[3] = &unk_1E5FAF548;
  uint64_t v3 = *(void *)(a1 + 72);
  id v26 = v2;
  uint64_t v27 = v3;
  id v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  id v24 = v5;
  uint64_t v25 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v23];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v2 extraTablesToInsert];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = [*(id *)(a1 + 40) objectForKey:v12];

        if (!v13) {
          [v2 insertValues:0 intoTable:v12 persistentID:*(void *)(a1 + 72) library:*(void *)(a1 + 48)];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v9);
  }

  if ([(id)objc_opt_class() insertionChangesLibraryContents])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_4;
    v17[3] = &unk_1E5FB75F0;
    id v14 = *(void **)(a1 + 56);
    id v18 = *(id *)(a1 + 48);
    [v14 enqueueBlockForTransactionCommit:v17];
  }
  uint64_t v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

  return v15;
}

uint64_t __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 48) insertValues:a3 intoTable:a2 persistentID:*(void *)(a1 + 56) library:*(void *)(a1 + 32)];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __75__ML3Entity_initWithDictionary_inLibrary_cachedNameOrders_usingConnection___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) notifyEntitiesAddedOrRemoved];
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 notifyContentsDidChange];
  }
  return result;
}

- (ML3Entity)initWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  return [(ML3Entity *)self initWithDictionary:a3 inLibrary:a4 cachedNameOrders:a5 usingConnection:0];
}

+ (void)enumeratePersistentIDsInLibrary:(id)a3 afterRevision:(int64_t)a4 usingBlock:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    id v8 = a3;
    uint64_t v9 = [(id)objc_opt_class() revisionTrackingCode];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __70__ML3Entity_enumeratePersistentIDsInLibrary_afterRevision_usingBlock___block_invoke;
    v10[3] = &unk_1E5FAF6D8;
    id v11 = v7;
    [v8 enumeratePersistentIDsAfterRevision:a4 revisionTrackingCode:v9 maximumRevisionType:3 usingBlock:v10];
  }
}

uint64_t __70__ML3Entity_enumeratePersistentIDsInLibrary_afterRevision_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (int64_t)revisionTrackingCode
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)orderingSQLForProperties:(id)a3 directionality:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [a1 disambiguatedSQLForProperty:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        id v13 = @"ASC";
        if ([v6 count] > (unint64_t)(v9 + i))
        {
          id v13 = [v6 objectAtIndex:(v9 + i)];
        }
        id v14 = [(__CFString *)v13 uppercaseString];
        int v15 = [v14 isEqual:@"DESC"];

        if (v15)
        {
          uint64_t v16 = [v12 stringByAppendingFormat:@" %@", @"DESC"];

          uint64_t v12 = (void *)v16;
        }
        [v21 addObject:v12];
      }
      v9 += i;
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v17 = [v21 componentsJoinedByString:@", "];

  return v17;
}

+ (id)indexableSQLForProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [a1 joinClausesForProperty:*(void *)(*((void *)&v14 + 1) + 8 * v9)];

        if (v10)
        {
          id v11 = [MEMORY[0x1E4F28B00] currentHandler];
          [v11 handleFailureInMethod:a2 object:a1 file:@"ML3Entity.m" lineNumber:1348 description:@"Properties requiring a join cannot be indexed"];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  uint64_t v12 = [v5 componentsJoinedByString:@", "];

  return v12;
}

+ (id)allProperties
{
  return 0;
}

+ (id)collectionClassesToUpdateBeforeDelete
{
  return 0;
}

+ (id)persistentIDColumnForTable:(id)a3
{
  return 0;
}

+ (id)extraTablesToInsert
{
  return 0;
}

+ (id)extraTablesToDelete
{
  return 0;
}

+ (BOOL)removeFromMyLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  return 0;
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 canonicalizeCollections:(BOOL)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 usingConnection:(id)a8
{
  id v15 = a3;
  id v16 = a8;
  if (a7)
  {
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke;
    v19[3] = &unk_1E5FAF6B0;
    unint64_t v23 = a7;
    id v24 = a1;
    long long v25 = a6;
    id v20 = v15;
    SEL v26 = a2;
    BOOL v28 = a5;
    id v21 = v16;
    long long v22 = &v29;
    int v27 = a4;
    [v21 performTransactionWithBlock:v19];
    BOOL v17 = *((unsigned char *)v30 + 24) != 0;

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

uint64_t __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    id v4 = [*(id *)(a1 + 64) databaseTable];
    *(_DWORD *)buf = 134218242;
    *(void *)v77 = v3;
    *(_WORD *)&v77[8] = 2114;
    *(void *)&v77[10] = v4;
    _os_log_impl(&dword_1B022D000, v2, OS_LOG_TYPE_DEFAULT, "deleting %lu rows from %{public}@ table", buf, 0x16u);
  }
  uint64_t v6 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = [v6 databaseTable];
  LODWORD(v5) = [v6 _deleteRowForPersistentIDs:v5 count:v7 library:v8 table:v9 usingColumn:@"ROWID" usingConnection:*(void *)(a1 + 40)];

  if (!v5) {
    return 0;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  obuint64_t j = [*(id *)(a1 + 64) extraTablesToDelete];
  uint64_t v10 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v72;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v72 != v12) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        id v15 = [*(id *)(a1 + 64) persistentIDColumnForTable:v14];
        if (!v15)
        {
          v60 = [MEMORY[0x1E4F28B00] currentHandler];
          [v60 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 64), @"ML3Entity.m", 1207, @"no pid column for %@ %@", objc_opt_class(), v14 object file lineNumber description];
        }
        id v16 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 134218498;
          *(void *)v77 = v17;
          *(_WORD *)&v77[8] = 2114;
          *(void *)&v77[10] = v14;
          __int16 v78 = 2114;
          v79 = v15;
          _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "deleting %lu rows from %{public}@ table using column=%{public}@", buf, 0x20u);
        }

        if (([*(id *)(a1 + 64) _deleteRowForPersistentIDs:*(void *)(a1 + 72) count:*(void *)(a1 + 56) library:*(void *)(a1 + 32) table:v14 usingColumn:v15 usingConnection:*(void *)(a1 + 40)] & 1) == 0)
        {
          uint64_t v56 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v57 = *(void *)(a1 + 64);
            v58 = [v14 stringByAppendingFormat:@".%@", v15];
            *(_DWORD *)buf = 138543618;
            *(void *)v77 = v57;
            *(_WORD *)&v77[8] = 2114;
            *(void *)&v77[10] = v58;
            _os_log_impl(&dword_1B022D000, v56, OS_LOG_TYPE_ERROR, "Could not delete %{public}@ %{public}@", buf, 0x16u);
          }
          goto LABEL_57;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v18 = objc_opt_class();
  if (v18 == objc_opt_class())
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(void *)(a1 + 56)];
    if (*(void *)(a1 + 56))
    {
      unint64_t v20 = 0;
      do
      {
        id v21 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 72) + 8 * v20)];
        [v19 addObject:v21];

        ++v20;
      }
      while (v20 < *(void *)(a1 + 56));
    }
    long long v22 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      *(void *)v77 = v23;
      _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "deleting %lu items from item store, stats table", buf, 0xCu);
    }

    unint64_t v24 = *(void *)(a1 + 56);
    if (v24)
    {
      id v25 = 0;
      unint64_t v26 = 0;
      unint64_t v27 = 0x1E5FAE000uLL;
      id obja = v19;
      do
      {
        unint64_t v28 = v24 - v26;
        if (v28 >= 0x1F4) {
          uint64_t v29 = 500;
        }
        else {
          uint64_t v29 = v28;
        }
        uint64_t v30 = objc_msgSend(v19, "subarrayWithRange:", v26, v29);
        uint64_t v31 = [*(id *)(v27 + 3160) defaultRenderer];
        char v32 = objc_msgSend(v31, "statementWithPrefix:inParameterCount:", @"DELETE FROM item_stats WHERE item_pid IN(SELECT item_pid FROM item_store WHERE sync_id = 0 AND item_pid"), v29;

        id v33 = [v32 stringByAppendingString:@""]);

        id v34 = *(void **)(a1 + 40);
        id v70 = v25;
        char v35 = [v34 executeUpdate:v33 withParameters:v30 error:&v70];
        id v36 = v70;

        if ((v35 & 1) == 0)
        {
          long long v37 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v77 = v36;
            _os_log_impl(&dword_1B022D000, v37, OS_LOG_TYPE_DEFAULT, "Failed to clean up item_stats where sync_id = 0 with error: %{public}@", buf, 0xCu);
          }
        }
        unint64_t v38 = v27;
        uint64_t v39 = [*(id *)(v27 + 3160) defaultRenderer];
        long long v40 = [v39 statementWithPrefix:@"DELETE FROM item_store WHERE sync_id = 0 AND item_pid" inParameterCount:v29];

        uint64_t v41 = *(void **)(a1 + 40);
        id v69 = v36;
        char v42 = [v41 executeUpdate:v40 withParameters:v30 error:&v69];
        id v25 = v69;

        if ((v42 & 1) == 0)
        {
          id v43 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)v77 = v25;
            _os_log_impl(&dword_1B022D000, v43, OS_LOG_TYPE_DEFAULT, "Failed to clean up item_store where sync_id = 0 with error: %{public}@", buf, 0xCu);
          }
        }
        v26 += v29;

        unint64_t v24 = *(void *)(a1 + 56);
        unint64_t v27 = v38;
        uint64_t v19 = obja;
      }
      while (v26 < v24);
    }
  }
  if (!*(unsigned char *)(a1 + 92)) {
    goto LABEL_50;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = [*(id *)(a1 + 64) collectionClassesToUpdateBeforeDelete];
  uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (!v44)
  {
LABEL_49:

LABEL_50:
    [*(id *)(a1 + 64) incrementRevisionForRevisionTypeContentWithConnection:*(void *)(a1 + 40) deletionType:*(unsigned int *)(a1 + 88) persistentIDs:*(void *)(a1 + 72) count:*(void *)(a1 + 56)];
    uint64_t v50 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = *(_DWORD *)(a1 + 88);
      uint64_t v52 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v77 = v51;
      *(_WORD *)&v77[4] = 2048;
      *(void *)&v77[6] = v52;
      _os_log_impl(&dword_1B022D000, v50, OS_LOG_TYPE_DEFAULT, "finished incrementing revsion with deletionType=%d for %lu persistentIDs", buf, 0x12u);
    }

    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_221;
    v63[3] = &unk_1E5FB75F0;
    long long v53 = *(void **)(a1 + 40);
    id v64 = *(id *)(a1 + 32);
    [v53 enqueueBlockForTransactionCommit:v63];
    uint64_t v54 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v55 = 1;
    *(unsigned char *)(v54 + 24) = 1;

    return v55;
  }
  uint64_t v45 = v44;
  uint64_t v46 = *(void *)v66;
LABEL_41:
  uint64_t v47 = 0;
  while (1)
  {
    if (*(void *)v66 != v46) {
      objc_enumerationMutation(obj);
    }
    v48 = *(void **)(*((void *)&v65 + 1) + 8 * v47);
    v49 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v77 = v48;
      _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_DEFAULT, "canonicalize collection=%{public}@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v48 canonicalizeCollectionRepresentativeItemsInLibrary:*(void *)(a1 + 32) usingConnection:*(void *)(a1 + 40)];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      break;
    }
    if (v45 == ++v47)
    {
      uint64_t v45 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
      if (v45) {
        goto LABEL_41;
      }
      goto LABEL_49;
    }
  }
LABEL_57:
  uint64_t v55 = 0;

  return v55;
}

uint64_t __104__ML3Entity_deleteFromLibrary_deletionType_canonicalizeCollections_persistentIDs_count_usingConnection___block_invoke_221(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyEntitiesAddedOrRemoved];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 notifyContentsDidChange];
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6 usingConnection:(id)a7
{
  return [a1 deleteFromLibrary:a3 deletionType:*(void *)&a4 canonicalizeCollections:1 persistentIDs:a5 count:a6 usingConnection:a7];
}

+ (BOOL)deleteFromLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __64__ML3Entity_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke;
  v13[3] = &unk_1E5FAF688;
  id v15 = &v20;
  id v16 = a1;
  id v11 = v10;
  int v19 = a4;
  id v14 = v11;
  uint64_t v17 = a5;
  unint64_t v18 = a6;
  [v11 databaseConnectionAllowingWrites:1 withBlock:v13];
  LOBYTE(a6) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a6;
}

uint64_t __64__ML3Entity_deleteFromLibrary_deletionType_persistentIDs_count___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 48) deleteFromLibrary:*(void *)(a1 + 32) deletionType:*(unsigned int *)(a1 + 72) persistentIDs:*(void *)(a1 + 56) count:*(void *)(a1 + 64) usingConnection:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)_deleteRowForPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 library:(id)a5 table:(id)a6 usingColumn:(id)a7 usingConnection:(id)a8
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v34 = a8;
  if (a4)
  {
    id v32 = v12;
    id v31 = v14;
    id v15 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE %@", v13, v14];
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = (void *)MEMORY[0x1B3E93C70]();
      if (a4 - v16 >= 0x1F4) {
        uint64_t v18 = 500;
      }
      else {
        uint64_t v18 = a4 - v16;
      }
      int v19 = +[ML3DatabaseStatementRenderer defaultRenderer];
      uint64_t v20 = [v19 statementWithPrefix:v15 inParameterCount:v18];

      id v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
      unint64_t v22 = v18 + v16;
      if (v18 + v16 >= a4) {
        unint64_t v23 = a4;
      }
      else {
        unint64_t v23 = v18 + v16;
      }
      uint64_t v24 = v16 - v23;
      if (v16 < v23)
      {
        id v25 = &a3[v16];
        do
        {
          uint64_t v26 = *v25++;
          unint64_t v27 = [NSNumber numberWithLongLong:v26];
          [v21 addObject:v27];

          BOOL v29 = __CFADD__(v24++, 1);
        }
        while (!v29);
      }
      int v28 = [v34 executeUpdate:v20 withParameters:v21 error:0];

      if (v28) {
        BOOL v29 = v22 >= a4;
      }
      else {
        BOOL v29 = 1;
      }
      unint64_t v16 = v22;
    }
    while (!v29);

    id v12 = v32;
    id v14 = v31;
  }
  else
  {
    LOBYTE(v28) = 1;
  }

  return v28;
}

+ (BOOL)libraryDynamicChangeForProperty:(id)a3
{
  return 1;
}

+ (BOOL)assistantLibraryContentsChangeForProperty:(id)a3
{
  return 1;
}

+ (BOOL)libraryContentsChangeForProperty:(id)a3
{
  return 1;
}

+ (void)_didChangeValueForProperties:(id)a3 inLibrary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v18 = v6;
    uint64_t v10 = *(void *)v20;
    unsigned int v11 = 3;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v13 isEqualToString:@"ROWID"] & 1) == 0)
        {
          id v14 = [(id)objc_opt_class() unsettableProperties];
          char v15 = [v14 containsObject:v13];

          if ((v15 & 1) == 0)
          {
            if ([(id)objc_opt_class() libraryContentsChangeForProperty:v13])
            {
              id v6 = v18;
              [v18 notifyContentsDidChange];
              if ([(id)objc_opt_class() assistantLibraryContentsChangeForProperty:v13]) {
                [v18 notifyAssistantContentsDidChange];
              }
              goto LABEL_22;
            }
            int v16 = [(id)objc_opt_class() libraryDynamicChangeForProperty:v13];
            if (v11 >= 2) {
              int v17 = 2;
            }
            else {
              int v17 = v11;
            }
            if (v16) {
              unsigned int v11 = 1;
            }
            else {
              unsigned int v11 = v17;
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    if (v11 == 2)
    {
      id v6 = v18;
      [v18 notifyInvisiblePropertyDidChange];
    }
    else
    {
      id v6 = v18;
      if (v11 == 1) {
        [v18 notifyNonContentsPropertyDidChange];
      }
    }
  }
  else
  {
LABEL_22:
  }
}

+ (BOOL)setDifferentValues:(id)a3 forProperties:(id)a4 forEntityPersistentIDs:(id)a5 inLibrary:(id)a6 usingConnection:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = 1;
  if (v12 && v13 && v15 && [v14 count])
  {
    if ([v15 isHomeSharingLibrary])
    {
      uint64_t v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v19 = [v13 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_ERROR, "Ignoring write to read-only Home Sharing database. Properties: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v20 = [v12 count];
      if (v20 == [v14 count])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        LOBYTE(v55) = 1;
        uint64_t v21 = [v13 count];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke;
        v49[3] = &unk_1E5FAF660;
        v49[4] = buf;
        v49[5] = v21;
        [v12 enumerateObjectsUsingBlock:v49];
        if (*(unsigned char *)(*(void *)&buf[8] + 24))
        {
          uint64_t v45 = 0;
          uint64_t v46 = &v45;
          uint64_t v47 = 0x2020000000;
          char v48 = 0;
          v53[0] = v14;
          v52[0] = @"MLDatabaseOperationAttributePersistentIDsArrayKey";
          v52[1] = @"MLDatabaseOperationAttributeEntityClassKey";
          long long v22 = (objc_class *)objc_opt_class();
          unint64_t v23 = NSStringFromClass(v22);
          v53[1] = v23;
          v53[2] = v12;
          v52[2] = @"MLDatabaseOperationAttributeValuesKey";
          v52[3] = @"MLDatabaseOperationAttributePropertiesKey";
          v52[4] = @"MLDatabaseOperationAttributeApplyDifferentValuesToPIDs";
          v53[3] = v13;
          v53[4] = MEMORY[0x1E4F1CC38];
          id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:5];

          long long v37 = [v16 currentTransactionID];
          uint64_t v24 = (void *)MEMORY[0x1E4F1CA60];
          uint64_t v50 = @"MLDatabaseOperationOptionDatabasePathKey";
          id v25 = [v15 databasePath];
          int v51 = v25;
          uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          unint64_t v27 = [v24 dictionaryWithDictionary:v26];

          if (v37) {
            [v27 setObject:v37 forKey:@"MLDatabaseOperationOptionTransactionIdentifierKey"];
          }
          dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
          BOOL v29 = +[MLMediaLibraryService sharedMediaLibraryService];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2;
          v38[3] = &unk_1E5FAF638;
          id v43 = &v45;
          id v39 = v16;
          id v44 = a1;
          id v40 = v13;
          id v41 = v15;
          uint64_t v30 = v28;
          char v42 = v30;
          [v29 performDatabaseOperation:1 withAttributes:v36 options:v27 completionHandler:v38];
          dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
          BOOL v17 = *((unsigned char *)v46 + 24) != 0;

          _Block_object_dispose(&v45, 8);
        }
        else
        {
          BOOL v17 = 0;
        }
        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v31 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = [v12 count];
          *(_WORD *)&buf[22] = 2048;
          uint64_t v55 = [v14 count];
          _os_log_impl(&dword_1B022D000, v31, OS_LOG_TYPE_ERROR, "Ignoring not setting properties=%{public}@ as the input is not valid (values.count=%lu, persistentIDs.count=%lu)", buf, 0x20u);
        }

        uint64_t v32 = [v12 count];
        if (v32 == [v14 count])
        {
          id v34 = [MEMORY[0x1E4F28B00] currentHandler];
          char v35 = [NSString stringWithUTF8String:"+[ML3Entity setDifferentValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:]"];
          [v34 handleFailureInFunction:v35, @"ML3Entity.m", 1035, @"Invalid parameter not satisfying: %@", @"values.count != persistentIDs.count" file lineNumber description];
        }
        BOOL v17 = 0;
      }
    }
  }

  return v17;
}

void __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ([v6 count] != *(void *)(a1 + 40))
  {
    id v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "Not enough values to update all properties in %{public}@", buf, 0xCu);
    }

    if (a4)
    {
      *a4 = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      if ([v6 count] == *(void *)(a1 + 40))
      {
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v9 = [NSString stringWithUTF8String:"+[ML3Entity setDifferentValues:forProperties:forEntityPersistentIDs:inLibrary:usingConnection:]_block_invoke"];
        [v8 handleFailureInFunction:v9, @"ML3Entity.m", 1048, @"Invalid parameter not satisfying: %@", @"obj.count != propsCount" file lineNumber description];
      }
    }
  }
}

void __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_3;
    v9[3] = &unk_1E5FAF610;
    uint64_t v12 = *(void *)(a1 + 72);
    id v7 = *(void **)(a1 + 32);
    uint64_t v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v7 enqueueBlockForTransactionCommit:v9];

    uint64_t v8 = v10;
  }
  else
  {
    if (!v5) {
      goto LABEL_4;
    }
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Daemon reported set values for properties was unsuccessful. %{public}@", buf, 0xCu);
    }
  }

LABEL_4:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __95__ML3Entity_setDifferentValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 48) _didChangeValueForProperties:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
}

+ (BOOL)setValues:(id)a3 forProperties:(id)a4 forEntityPersistentIDs:(id)a5 inLibrary:(id)a6 usingConnection:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = 1;
  if (v12 && v13 && v15 && [v14 count])
  {
    if ([v15 isHomeSharingLibrary])
    {
      uint64_t v18 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v19 = [v13 componentsJoinedByString:@", "];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_ERROR, "Ignoring write to read-only Home Sharing database. Properties: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v44 = 0x2020000000;
      char v45 = 0;
      v42[0] = v14;
      v41[0] = @"MLDatabaseOperationAttributePersistentIDsArrayKey";
      v41[1] = @"MLDatabaseOperationAttributeEntityClassKey";
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      v42[1] = v21;
      v42[2] = v12;
      v41[2] = @"MLDatabaseOperationAttributeValuesKey";
      v41[3] = @"MLDatabaseOperationAttributePropertiesKey";
      v42[3] = v13;
      id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:4];

      long long v22 = [v16 currentTransactionID];
      unint64_t v23 = (void *)MEMORY[0x1E4F1CA60];
      id v39 = @"MLDatabaseOperationOptionDatabasePathKey";
      uint64_t v24 = [v15 databasePath];
      id v40 = v24;
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v26 = [v23 dictionaryWithDictionary:v25];

      if (v22) {
        [v26 setObject:v22 forKey:@"MLDatabaseOperationOptionTransactionIdentifierKey"];
      }
      dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
      dispatch_semaphore_t v28 = +[MLMediaLibraryService sharedMediaLibraryService];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke;
      v32[3] = &unk_1E5FAF638;
      p_long long buf = &buf;
      id v33 = v16;
      id v38 = a1;
      id v34 = v13;
      id v35 = v15;
      BOOL v29 = v27;
      id v36 = v29;
      [v28 performDatabaseOperation:1 withAttributes:v31 options:v26 completionHandler:v32];
      dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
      BOOL v17 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

      _Block_object_dispose(&buf, 8);
    }
  }

  return v17;
}

void __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2;
    v9[3] = &unk_1E5FAF610;
    uint64_t v12 = *(void *)(a1 + 72);
    id v7 = *(void **)(a1 + 32);
    uint64_t v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    [v7 enqueueBlockForTransactionCommit:v9];

    uint64_t v8 = v10;
  }
  else
  {
    if (!v5) {
      goto LABEL_4;
    }
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "Daemon reported set values for properties was unsuccessful. %{public}@", buf, 0xCu);
    }
  }

LABEL_4:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

uint64_t __86__ML3Entity_setValues_forProperties_forEntityPersistentIDs_inLibrary_usingConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 48) _didChangeValueForProperties:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
}

+ (id)countingQueryForBaseQuery:(id)a3 countProperty:(id)a4 forIdentifier:(int64_t)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543618;
    id v12 = (id)[v6 entityClass];
    __int16 v13 = 2114;
    id v14 = v7;
    id v9 = v12;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "Invalid count query for entity class %{public}@, count property %{public}@", (uint8_t *)&v11, 0x16u);
  }
  return 0;
}

+ (id)foreignColumnForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

+ (id)sectionPropertyForProperty:(id)a3
{
  return 0;
}

+ (id)defaultOrderingTerms
{
  return 0;
}

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5 usingConnection:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithDictionary:v13 inLibrary:v12 cachedNameOrders:v11 usingConnection:v10];

  return v14;
}

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4 cachedNameOrders:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithDictionary:v10 inLibrary:v9 cachedNameOrders:v8 usingConnection:0];

  return v11;
}

+ (id)newWithDictionary:(id)a3 inLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithDictionary:v7 inLibrary:v6 cachedNameOrders:0 usingConnection:0];

  return v8;
}

+ (id)predicateByOptimizingComparisonPredicate:(id)a3
{
  return a3;
}

+ (id)predicateByOptimizingPredicate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a1 predicateByOptimizingComparisonPredicate:v4];

    id v4 = (id)v5;
  }

  return v4;
}

+ (id)URLForEntityWithPersistentID:(int64_t)a3 libraryUID:(id)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F29088];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  id v9 = [a1 entityURLScheme];
  [v8 setScheme:v9];

  [v8 setHost:v7];
  id v10 = NSString;
  v17[0] = @"/";
  id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(a1, "revisionTrackingCode"));
  v17[1] = v11;
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
  v17[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  id v14 = [v10 pathWithComponents:v13];
  [v8 setPath:v14];

  uint64_t v15 = [v8 URL];

  return v15;
}

+ (id)_entityForURLComponents:(id)a3 inLibrary:(id)a4 verifyExistence:(BOOL)a5 reason:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 scheme];
  id v13 = [a1 entityURLScheme];
  char v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    uint64_t v15 = [v10 host];
    id v16 = [v11 libraryUID];
    char v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      uint64_t v18 = [v10 path];
      id v19 = [v18 pathComponents];

      if ((unint64_t)[v19 count] > 2)
      {
        id v25 = [v19 objectAtIndexedSubscript:1];
        unint64_t v26 = [v25 integerValue];

        dispatch_semaphore_t v27 = [v19 objectAtIndexedSubscript:2];
        uint64_t v28 = [v27 longLongValue];

        BOOL v29 = (objc_class *)MLEntityClassForType(v26);
        if (v29)
        {
          if (v28)
          {
            uint64_t v30 = v29;
            id v31 = (void *)[[v29 alloc] initWithPersistentID:v28 inLibrary:v11];
            id v32 = v31;
            if (!v7 || ([v31 existsInLibrary] & 1) != 0)
            {
              id v32 = v32;
              uint64_t v24 = v32;
LABEL_23:

              goto LABEL_24;
            }
            id v34 = [NSString stringWithFormat:@"No %@ entity exists with persistentID: %lld", v30, v28];
            id v35 = v34;
            if (a6) {
              *a6 = v34;
            }

LABEL_22:
            uint64_t v24 = 0;
            goto LABEL_23;
          }
          objc_msgSend(NSString, "stringWithFormat:", @"Invalid entity persistentID: %lld", 0);
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"Invalid entity type: %ld", v26);
        }
      }
      else
      {
        [NSString stringWithFormat:@"Insufficient path components [requires three]: %@", v19];
      id v33 = };
      id v32 = v33;
      if (a6)
      {
        id v32 = v33;
        uint64_t v24 = 0;
        *a6 = v32;
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    long long v22 = NSString;
    uint64_t v21 = [v10 host];
    unint64_t v23 = [v11 libraryUID];
    [v22 stringWithFormat:@"Library UID mismatch: %@ != %@", v21, v23];
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v20 = NSString;
    uint64_t v21 = [v10 scheme];
    id v19 = [v20 stringWithFormat:@"Invalid URL scheme: %@", v21];
  }

  if (a6)
  {
    id v19 = v19;
    uint64_t v24 = 0;
    *a6 = v19;
  }
  else
  {
    uint64_t v24 = 0;
  }
LABEL_24:

  return v24;
}

+ (id)entityFromURL:(id)a3 inLibrary:(id)a4 verifyExistence:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (objc_class *)MEMORY[0x1E4F29088];
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[[v8 alloc] initWithURL:v10 resolvingAgainstBaseURL:0];

  id v12 = [a1 _entityForURLComponents:v11 inLibrary:v9 verifyExistence:v5 reason:0];

  return v12;
}

+ (id)entityFromURL:(id)a3 inLibrary:(id)a4
{
  return (id)[a1 entityFromURL:a3 inLibrary:a4 verifyExistence:1];
}

+ (id)entityFromURL:(id)a3 reason:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v6 resolvingAgainstBaseURL:0];
  id v8 = [v7 scheme];
  id v9 = [a1 entityURLScheme];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    dispatch_semaphore_t v27 = a4;
    id v28 = v6;
    id v11 = [v7 host];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = +[ML3MusicLibrary allLibraries];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          char v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v18 = [v17 libraryUID];
          char v19 = [v11 isEqualToString:v18];

          if (v19)
          {
            long long v22 = [a1 _entityForURLComponents:v7 inLibrary:v17 verifyExistence:1 reason:v27];

            goto LABEL_17;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    uint64_t v20 = [NSString stringWithFormat:@"No library with UID: %@", v11];
    uint64_t v21 = v20;
    if (v27) {
      id *v27 = v20;
    }

    long long v22 = 0;
LABEL_17:
    id v6 = v28;
  }
  else
  {
    unint64_t v23 = NSString;
    uint64_t v24 = [v7 scheme];
    id v25 = [v23 stringWithFormat:@"Invalid URL scheme: %@", v24];

    if (a4) {
      *a4 = v25;
    }

    long long v22 = 0;
  }

  return v22;
}

+ (id)entityURLScheme
{
  return @"x-media-library";
}

+ (id)newSelectAllEntitiesSQLForProperties:(const void *)a3 count:(unint64_t)a4 predicate:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v39 = [a1 databaseTable];
  uint64_t v9 = [v8 SQLForEntityClass:a1];
  int v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_1F08D4D70;
  }
  id v12 = v11;

  id v38 = v12;
  uint64_t v13 = [(__CFString *)v12 length];
  uint64_t v14 = @" WHERE ";
  if (!v13) {
    uint64_t v14 = &stru_1F08D4D70;
  }
  long long v37 = v14;
  id v40 = v8;
  id v41 = a1;
  uint64_t v15 = [v8 SQLJoinClausesForClass:a1];
  id v16 = (id)[v15 mutableCopy];

  if (a4)
  {
    uint64_t v17 = 0;
    do
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v18 = a3;
      char v19 = [v41 joinClausesForProperty:a3[v17]];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v43 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            if (!v16) {
              id v16 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
            }
            [v16 addObject:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v21);
      }

      ++v17;
      a3 = v18;
    }
    while (v17 != a4);
  }
  if ([v16 count])
  {
    id v25 = [v16 objectEnumerator];
    unint64_t v26 = [v25 allObjects];
    dispatch_semaphore_t v27 = [v26 componentsJoinedByString:@" "];
  }
  else
  {
    dispatch_semaphore_t v27 = &stru_1F08D4D70;
  }
  uint64_t v28 = [v41 disambiguatedSelectSQLForProperty:*a3];
  long long v29 = (void *)v28;
  if (a4 < 2)
  {
    long long v30 = (void *)v28;
  }
  else
  {
    long long v30 = [MEMORY[0x1E4F28E78] stringWithString:v28];
    unint64_t v31 = a4 - 1;
    long long v32 = a3 + 1;
    do
    {
      [v30 appendString:@","];
      uint64_t v33 = (uint64_t)*v32++;
      uint64_t v34 = [v41 disambiguatedSelectSQLForProperty:v33];
      [v30 appendString:v34];

      --v31;
    }
    while (v31);
  }
  id v35 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@ FROM %@ %@%@%@", v30, v39, v27, v37, v38];

  return v35;
}

+ (id)subselectPropertyForProperty:(id)a3
{
  return 0;
}

+ (void)enumeratePersistentIDsInLibrary:(id)a3 matchingPredicate:(id)a4 orderingTerms:(id)a5 persistentIDs:(const int64_t *)a6 count:(unint64_t)a7 options:(int64_t)a8 usingBlock:(id)a9
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  char v19 = v18;
  if (a7)
  {
    unint64_t v46 = a7;
    uint64_t v47 = a6;
    v49 = v18;
    uint64_t v20 = [a1 databaseTable];
    id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    [v21 appendString:@"SELECT "];
    [v21 appendString:v20];
    [v21 appendString:@".ROWID FROM "];
    char v48 = (void *)v20;
    [v21 appendString:v20];
    id v53 = a1;
    int v51 = v15;
    long long v45 = [a1 predicateIncludingSystemwidePredicatesWithPredicate:v16 library:v15 options:a8];

    uint64_t v22 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v50 = v17;
    id v23 = v17;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v71 objects:v77 count:16];
    obuint64_t j = v23;
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v72 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v29 = objc_msgSend(v28, "property", v45);
          long long v30 = [v53 joinClausesForProperty:v29];

          uint64_t v31 = [v30 countByEnumeratingWithState:&v67 objects:v76 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v68;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v68 != v33) {
                  objc_enumerationMutation(v30);
                }
                [v22 addObject:*(void *)(*((void *)&v67 + 1) + 8 * j)];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v67 objects:v76 count:16];
            }
            while (v32);
          }
        }
        id v23 = obj;
        uint64_t v25 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v25);
    }

    id v35 = v45;
    id v36 = [v45 SQLJoinClausesForClass:v53];
    if ([v36 count]) {
      [v22 unionOrderedSet:v36];
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    id v37 = v22;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v64 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v63 + 1) + 8 * k);
          objc_msgSend(v21, "appendString:", @" ", v45);
          [v21 appendString:v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v39);
    }

    [v21 appendString:@" WHERE "];
    if (v35)
    {
      [v35 appendSQLToMutableString:v21 entityClass:v53];
      [v21 appendString:@" AND "];
    }
    objc_msgSend(v21, "appendString:", v48, v45);
    objc_msgSend(v21, "appendString:", @".ROWID IN (?");
    id v15 = v51;
    if (v46 >= 2)
    {
      unint64_t v43 = v46 - 1;
      do
      {
        [v21 appendString:@",?"];
        --v43;
      }
      while (v43);
    }
    [v21 appendString:@""]);
    if ([obj count])
    {
      [v21 appendString:@"ORDER BY "];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke;
      v60[3] = &unk_1E5FAF598;
      id v61 = v21;
      id v62 = v53;
      [obj enumerateObjectsUsingBlock:v60];
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_2;
    v54[3] = &unk_1E5FAF5C0;
    id v16 = v35;
    unint64_t v58 = v46;
    v59 = v47;
    id v55 = v16;
    id v56 = v21;
    char v19 = v49;
    id v57 = v49;
    id v44 = v21;
    [v51 databaseConnectionAllowingWrites:0 withBlock:v54];

    id v17 = v50;
  }
}

void __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [v5 appendSQLToMutableString:*(void *)(a1 + 32) entityClass:*(void *)(a1 + 40)];
}

void __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) databaseStatementParameters];
  id v5 = (void *)[v4 mutableCopy];

  if (*(void *)(a1 + 56))
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      id v8 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 64) + 8 * v6)];
      [v5 addObject:v8];

      uint64_t v6 = v7;
    }
    while (*(void *)(a1 + 56) > (unint64_t)v7++);
  }
  int v10 = [v3 executeQuery:*(void *)(a1 + 40) withParameters:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_3;
  v11[3] = &unk_1E5FB26C0;
  id v12 = *(id *)(a1 + 48);
  [v10 enumerateRowsWithBlock:v11];
}

uint64_t __116__ML3Entity_enumeratePersistentIDsInLibrary_matchingPredicate_orderingTerms_persistentIDs_count_options_usingBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v6 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [a2 int64ForColumnIndex:0], &v6);
  *a4 = v6;
  return result;
}

+ (BOOL)insertionChangesLibraryContents
{
  return 1;
}

+ (BOOL)incrementRevisionWithLibrary:(id)a3 persistentID:(int64_t)a4 deletionType:(int)a5 revisionType:(int)a6 usingConnection:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  void v30[4] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  if (!v9 || !v8)
  {
    if (a4) {
      goto LABEL_4;
    }
LABEL_11:
    if (MSVDeviceOSIsInternalInstall())
    {
      dispatch_semaphore_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:a1 file:@"ML3Entity.m" lineNumber:278 description:@"incrementRevisionWithLibrary called with invalid pid"];
    }
    goto LABEL_13;
  }
  uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"ML3Entity.m", 275, @"Wrong revision type for deletion type: %d, %d", v8, v9 object file lineNumber description];

  if (!a4) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v15 = [a1 revisionTrackingCode];
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_5:
    LOBYTE(v16) = 1;
    goto LABEL_14;
  }
  uint64_t v17 = v15;
  if (![a1 _shouldIncrementRevisionForType:v8 persistentID:a4 usingConnection:v14])
  {
LABEL_13:
    LOBYTE(v16) = 0;
    goto LABEL_14;
  }
  id v18 = [NSNumber numberWithLongLong:a4];
  v30[0] = v18;
  char v19 = [NSNumber numberWithUnsignedInt:v9];
  v30[1] = v19;
  uint64_t v20 = [NSNumber numberWithInteger:v17];
  v30[2] = v20;
  id v21 = [NSNumber numberWithUnsignedInt:v8];
  v30[3] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  int v16 = [v14 executeUpdate:@"REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES (?, ?, ?, ?)", v22, 0 withParameters error];

  if (!v8 && v16)
  {
    id v23 = [NSNumber numberWithLongLong:a4];
    v29[0] = v23;
    uint64_t v24 = [NSNumber numberWithUnsignedInt:0];
    v29[1] = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    [v14 executeUpdate:@"DELETE FROM entity_revision WHERE entity_pid=? AND revision_type > ?" withParameters:v25 error:0];

    goto LABEL_5;
  }
LABEL_14:

  return v16;
}

+ (BOOL)incrementRevisionWithLibrary:(id)a3 persistentID:(int64_t)a4 deletionType:(int)a5 revisionType:(int)a6
{
  id v10 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __81__ML3Entity_incrementRevisionWithLibrary_persistentID_deletionType_revisionType___block_invoke;
  v13[3] = &unk_1E5FB56F0;
  uint64_t v15 = &v20;
  id v16 = a1;
  id v11 = v10;
  id v14 = v11;
  int64_t v17 = a4;
  int v18 = a5;
  int v19 = a6;
  [v11 databaseConnectionAllowingWrites:1 withBlock:v13];
  LOBYTE(a6) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return a6;
}

void __81__ML3Entity_incrementRevisionWithLibrary_persistentID_deletionType_revisionType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [(id)objc_opt_class() incrementRevisionWithLibrary:*(void *)(a1 + 32) persistentID:*(void *)(a1 + 56) deletionType:*(unsigned int *)(a1 + 64) revisionType:*(unsigned int *)(a1 + 68) usingConnection:v3];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

+ (BOOL)incrementRevisionForRevisionTypeContentWithConnection:(id)a3 deletionType:(int)a4 persistentIDs:(const int64_t *)a5 count:(unint64_t)a6
{
  uint64_t v22 = a5;
  uint64_t v7 = *(void *)&a4;
  id v23 = a3;
  if (a6)
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = (void *)MEMORY[0x1B3E93C70]();
      if (a6 - v9 >= 0x1F4) {
        uint64_t v11 = 500;
      }
      else {
        uint64_t v11 = a6 - v9;
      }
      id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", v11, v22);
      unint64_t v13 = v11 + v9;
      if (v11 + v9 >= a6) {
        unint64_t v14 = a6;
      }
      else {
        unint64_t v14 = v11 + v9;
      }
      uint64_t v15 = v9 - v14;
      if (v9 < v14)
      {
        id v16 = &v22[v9];
        do
        {
          uint64_t v17 = *v16++;
          int v18 = [NSNumber numberWithLongLong:v17];
          [v12 addObject:v18];

          BOOL v20 = __CFADD__(v15++, 1);
        }
        while (!v20);
      }
      int v19 = [a1 incrementRevisionForRevisionTypeContentWithConnection:v23 deletionType:v7 persistentIDs:v12];

      if (v19) {
        BOOL v20 = v13 >= a6;
      }
      else {
        BOOL v20 = 1;
      }
      unint64_t v9 = v13;
    }
    while (!v20);
  }
  else
  {
    LOBYTE(v19) = 1;
  }

  return v19;
}

+ (BOOL)incrementRevisionForRevisionTypeContentWithConnection:(id)a3 deletionType:(int)a4 persistentIDs:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 count];
  uint64_t v11 = [a1 revisionTrackingCode];
  id v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    obuint64_t j = v6;
    long long v79 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v76 = 0u;
    id v13 = v9;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v76 objects:v84 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v77 != v17) {
            objc_enumerationMutation(v14);
          }
          int v19 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if (objc_msgSend(a1, "_shouldIncrementRevisionForType:persistentID:usingConnection:", 0, objc_msgSend(v19, "longLongValue"), v8))objc_msgSend(v12, "addObject:", v19); {
        }
          }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v76 objects:v84 count:16];
      }
      while (v16);
    }

    id v9 = v13;
    uint64_t v6 = obj;
  }
  uint64_t v20 = [v12 count];
  if (v20)
  {
    unint64_t v59 = v20;
    id v57 = v9;
    uint64_t v21 = -1;
    int v22 = 1;
    id v56 = [&stru_1F08D4D70 stringByPaddingToLength:500 * objc_msgSend(@",(?,?,?,?)", "length") - 1, @",(?,?,?,?)", 1 withString startingAtIndex];
    v60 = objc_msgSend(@"REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES ", "stringByAppendingString:");
    id v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2000];
    long long v66 = [NSNumber numberWithUnsignedInt:v6];
    long long v65 = [NSNumber numberWithInteger:v11];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obja = v12;
    uint64_t v24 = [obja countByEnumeratingWithState:&v72 objects:v83 count:16];
    unint64_t v58 = v12;
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v55 = -1;
      uint64_t v26 = 0;
      int v63 = 0;
      uint64_t v27 = *(void *)v73;
      while (2)
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v73 != v27) {
            objc_enumerationMutation(obja);
          }
          long long v29 = *(void **)(*((void *)&v72 + 1) + 8 * j);
          if (objc_msgSend(v29, "longLongValue", v55))
          {
            [v23 addObject:v29];
            [v23 addObject:v66];
            [v23 addObject:v65];
            [v23 addObject:&unk_1F0910BE8];
            if ([v23 count] == 2000)
            {
              id v71 = v26;
              char v30 = [v8 executeUpdate:v60 withParameters:v23 error:&v71];
              id v31 = v71;

              if ((v30 & 1) == 0)
              {
                id v36 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138543362;
                  id v82 = v31;
                  _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_DEFAULT, "Failed to insert batch of persistent ids in entity_revision, error = %{public}@", buf, 0xCu);
                }

                int v22 = 0;
                goto LABEL_36;
              }
              if (v63) {
                int v32 = v63;
              }
              else {
                int v32 = 1;
              }
              int v63 = v32;
              [v23 removeAllObjects];
              uint64_t v26 = v31;
            }
          }
          else if (MSVDeviceOSIsInternalInstall())
          {
            uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
            [v33 handleFailureInMethod:a2 object:a1 file:@"ML3Entity.m" lineNumber:183 description:@"incrementRevisionForRevisionTypeContentWithConnection called with invalid pid"];
          }
        }
        uint64_t v25 = [obja countByEnumeratingWithState:&v72 objects:v83 count:16];
        if (v25) {
          continue;
        }
        break;
      }
      int v22 = 1;
      id v31 = v26;
LABEL_36:
      id v12 = v58;
      char v37 = v63;
      uint64_t v21 = v55;
    }
    else
    {
      id v31 = 0;
      char v37 = 0;
    }

    if ([v23 count])
    {
      uint64_t v38 = [&stru_1F08D4D70 stringByPaddingToLength:v21 + ((unint64_t)objc_msgSend(v23, "count") >> 2) * objc_msgSend(@",(?,?,?,?)", "length"), @",(?,?,?,?)", 1 withString startingAtIndex];
      uint64_t v39 = objc_msgSend(@"REPLACE INTO entity_revision (entity_pid, deleted, class, revision_type) VALUES ", "stringByAppendingString:", v38);
      id v70 = v31;
      char v40 = [v8 executeUpdate:v39 withParameters:v23 error:&v70];
      id v41 = v70;

      if ((v40 & 1) == 0)
      {
        id v53 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v82 = v41;
          _os_log_impl(&dword_1B022D000, v53, OS_LOG_TYPE_DEFAULT, "Failed to insert batch of persistent ids in entity_revision, error = %{public}@", buf, 0xCu);
        }

        goto LABEL_59;
      }
      if ((v37 & 1) == 0) {
        char v37 = 1;
      }

      id v31 = v41;
    }
    else if (!v22)
    {
LABEL_56:
      uint64_t v38 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v82 = v31;
        _os_log_impl(&dword_1B022D000, v38, OS_LOG_TYPE_DEFAULT, "Failed to delete persistent ids in entity_revision, error = %{public}@", buf, 0xCu);
      }
      id v41 = v31;
LABEL_59:

      char v52 = 0;
      id v31 = v41;
      goto LABEL_60;
    }
    char v64 = v37;
    unint64_t v42 = 0;
    unint64_t v43 = v59;
    do
    {
      id v44 = v31;
      contexta = (void *)MEMORY[0x1B3E93C70]();
      if (v43 - v42 >= 0x1F4) {
        uint64_t v45 = 500;
      }
      else {
        uint64_t v45 = v43 - v42;
      }
      unint64_t v46 = +[ML3DatabaseStatementRenderer defaultRenderer];
      uint64_t v47 = [v46 statementWithPrefix:@"DELETE FROM entity_revision WHERE revision_type > ? AND entity_pid" inParameterCount:v45];

      char v48 = objc_msgSend(obja, "subarrayWithRange:", v42, v45);
      v80 = &unk_1F0910BE8;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
      id v50 = [v49 arrayByAddingObjectsFromArray:v48];

      id v69 = v44;
      int v51 = [v8 executeUpdate:v47 withParameters:v50 error:&v69];
      id v31 = v69;

      unint64_t v43 = v59;
      if (!v51) {
        break;
      }
      v42 += v45;
    }
    while (v42 < v59);
    if (v51)
    {
      char v52 = 1;
      id v12 = v58;
      char v37 = v64;
LABEL_60:

      char v35 = v52 & v37;
      id v9 = v57;
      goto LABEL_61;
    }
    id v12 = v58;
    char v37 = v64;
    goto LABEL_56;
  }
  uint64_t v34 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_DEBUG, "No entities for which to increment revision numbers.", buf, 2u);
  }

  char v35 = 0;
LABEL_61:

  return v35;
}

+ (BOOL)incrementRevisionForRevisionTypeContentWithLibrary:(id)a3 deletionType:(int)a4 persistentIDs:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__ML3Entity_incrementRevisionForRevisionTypeContentWithLibrary_deletionType_persistentIDs___block_invoke;
  v12[3] = &unk_1E5FAF4F8;
  id v14 = &v17;
  id v15 = a1;
  int v16 = a4;
  id v10 = v9;
  id v13 = v10;
  [v8 performDatabaseTransactionWithBlock:v12];
  LOBYTE(a4) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return a4;
}

uint64_t __91__ML3Entity_incrementRevisionForRevisionTypeContentWithLibrary_deletionType_persistentIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 48) incrementRevisionForRevisionTypeContentWithConnection:a2 deletionType:*(unsigned int *)(a1 + 56) persistentIDs:*(void *)(a1 + 32)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

+ (BOOL)_shouldIncrementRevisionForType:(int)a3 persistentID:(int64_t)a4 usingConnection:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a1 revisionTrackingCode];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v10 = 0;
  }
  else if (a3 && v9 == +[ML3Track revisionTrackingCode])
  {
    char v10 = (char)+[ML3Track trackWithPersistentID:a4 existsInLibraryWithConnection:v8];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

+ (id)unsettableProperties
{
  return 0;
}

+ (BOOL)insertValues:(id)a3 intoTable:(id)a4 persistentID:(int64_t)a5 connection:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v38 = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v12 appendString:@"INSERT OR REPLACE INTO "];
  [v12 appendString:v11];
  objc_msgSend(v12, "appendString:", @" (");
  uint64_t v39 = v11;
  uint64_t v13 = [a1 persistentIDColumnForTable:v11];
  id v14 = (void *)v13;
  id v15 = @"ROWID";
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  int v16 = v15;

  char v37 = v16;
  [v12 appendString:v16];
  uint64_t v17 = [v10 allKeys];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        [v12 appendString:@", "];
        [v12 appendString:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v19);
  }
  [v12 appendString:@") VALUES (?"];
  if ([v17 count])
  {
    unint64_t v23 = 0;
    do
    {
      [v12 appendString:@", ?"];
      ++v23;
    }
    while (v23 < [v17 count]);
  }
  [v12 appendString:@";"]);
  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count") + 1);
  uint64_t v25 = [NSNumber numberWithLongLong:a5];
  [v24 addObject:v25];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = v17;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = [v10 objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * j)];
        int v32 = v31;
        if (v31)
        {
          id v33 = v31;
        }
        else
        {
          id v33 = [MEMORY[0x1E4F1CA98] null];
        }
        uint64_t v34 = v33;

        [v24 addObject:v34];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v28);
  }

  char v35 = [v38 executeUpdate:v12 withParameters:v24 error:0];
  return v35;
}

+ (BOOL)insertValues:(id)a3 intoTable:(id)a4 persistentID:(int64_t)a5 library:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __57__ML3Entity_insertValues_intoTable_persistentID_library___block_invoke;
  v16[3] = &unk_1E5FAF4D0;
  uint64_t v19 = &v22;
  id v20 = a1;
  id v13 = v10;
  id v17 = v13;
  id v14 = v11;
  id v18 = v14;
  int64_t v21 = a5;
  [v12 databaseConnectionAllowingWrites:1 withBlock:v16];
  LOBYTE(a5) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return a5;
}

void __57__ML3Entity_insertValues_intoTable_persistentID_library___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  char v4 = [(id)objc_opt_class() insertValues:a1[4] intoTable:a1[5] persistentID:a1[8] connection:v3];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v4;
}

+ (id)unrestrictedAllItemsQueryWithlibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[ML3Query alloc] initWithLibrary:v8 entityClass:a1 predicate:v9 orderingTerms:v10 usingSections:0 nonDirectAggregateQuery:0 propertyToCount:0 options:7];

  return v11;
}

+ (id)unrestrictedQueryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[ML3Query alloc] initWithLibrary:v8 entityClass:a1 predicate:v9 orderingTerms:v10 usingSections:0 nonDirectAggregateQuery:0 propertyToCount:0 options:3];

  return v11;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 usingSections:(BOOL)a6 options:(int64_t)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [[ML3Query alloc] initWithLibrary:v12 entityClass:a1 predicate:v13 orderingTerms:v14 usingSections:v8 nonDirectAggregateQuery:0 propertyToCount:0 options:a7];

  return v15;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 propertyToCount:(id)a6 options:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = [[ML3Query alloc] initWithLibrary:v12 entityClass:a1 predicate:v13 orderingTerms:v14 usingSections:0 nonDirectAggregateQuery:0 propertyToCount:v15 options:a7];

  return v16;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 propertyToCount:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [[ML3Query alloc] initWithLibrary:v10 entityClass:a1 predicate:v11 orderingTerms:v12 usingSections:0 nonDirectAggregateQuery:0 propertyToCount:v13 options:0];

  return v14;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 usingSections:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 defaultOrderingTerms];
  id v11 = [[ML3Query alloc] initWithLibrary:v8 entityClass:a1 predicate:v9 orderingTerms:v10 usingSections:v5 nonDirectAggregateQuery:0 propertyToCount:0 options:0];

  return v11;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 options:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 defaultOrderingTerms];
  id v11 = [a1 queryWithLibrary:v8 predicate:v9 orderingTerms:v10 usingSections:0 options:a5];

  return v11;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6 usingSections:(BOOL)a7
{
  uint64_t v7 = objc_msgSend(a1, "queryWithLibrary:predicate:usingSections:", a3, a4, a7, a6);

  return v7;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 usingSections:(BOOL)a6
{
  uint64_t v6 = [a1 queryWithLibrary:a3 predicate:a4 usingSections:a6];

  return v6;
}

+ (id)queryWithLibrary:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  BOOL v5 = objc_msgSend(a1, "queryWithLibrary:predicate:", a3, a4, a5);

  return v5;
}

+ (id)anyInLibrary:(id)a3 predicate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [(id)objc_opt_class() anyInLibrary:v5 predicate:v6 options:0];

  return v7;
}

@end