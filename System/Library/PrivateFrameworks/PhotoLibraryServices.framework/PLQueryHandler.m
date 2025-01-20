@interface PLQueryHandler
+ (BOOL)_containsKey:(int)a3 inQuery:(id)a4;
+ (BOOL)_findAndReplaceLatitudeLongitudeKeyInQuery:(id)a3;
+ (BOOL)_isTextComparator:(int)a3;
+ (BOOL)_isTextFieldQuery:(int)a3;
+ (BOOL)_needEqualityForDoubleQuery:(int)a3;
+ (BOOL)_needToNegateQueryForComparator:(int)a3;
+ (BOOL)fixUserQueryDataInQuery:(id)a3;
+ (BOOL)hasMatchingFetchingAlbumForSingleQuery:(id)a3 outKind:(int *)a4;
+ (BOOL)includesHiddenAssetsInQuery:(id)a3;
+ (BOOL)includesHiddenAssetsKeyInQuery:(id)a3;
+ (id)_assetsPredicateForPersonPredicate:(id)a3 assetObjectIDs:(id *)a4 additionalAssetPredicate:(id)a5 invert:(BOOL)a6 inLibrary:(id)a7;
+ (id)_convertQueryKeyTypeToString:(int)a3;
+ (id)_convertQueryValueForAssetType:(int)a3;
+ (id)_equalityPredicateForDoubleQuery:(id)a3 withValue:(double)a4 comparator:(int)a5 inLibrary:(id)a6;
+ (id)_expressionForStringValue:(id)a3 inLibrary:(id)a4;
+ (id)_getConvertedKeys:(id)a3;
+ (id)_getConvertedQueryKey:(id)a3;
+ (id)_getTargetDateForTheLastDays:(int64_t)a3 weeks:(int64_t)a4 months:(int64_t)a5 years:(int64_t)a6 seconds:(int64_t)a7 targetDate:(id)a8;
+ (id)_getTargetDateWithUnit:(int)a3 dateValue:(id)a4;
+ (id)_infoFromSingleQuery:(id)a3;
+ (id)_personMatchesPredicateForCriteria:(id)a3;
+ (id)_personNameQueryKeyPaths;
+ (id)_predicateForAbleToUploadQuery;
+ (id)_predicateForDoubleQuery:(id)a3 inLibrary:(id)a4;
+ (id)_predicateForEmptyQuery:(id)a3 inLibrary:(id)a4;
+ (id)_predicateForIsReferencedQuery:(id)a3 inLibrary:(id)a4;
+ (id)_predicateForLoopingQuery:(id)a3 inLibrary:(id)a4;
+ (id)_predicateForNotAbleToUploadQuery;
+ (id)_predicateForPersonQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)_predicateForPersonUUIDQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)_predicateForPersonUUIDinMomentForSharedLibraryQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)_predicateForProResQuery:(id)a3 inLibrary:(id)a4;
+ (id)_predicateForQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)_predicateForRangeQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)_predicateForSingleQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)_predicateForTaggedWithGPSQuery:(id)a3 inLibrary:(id)a4;
+ (id)_predicateForTextQuery:(id)a3 inLibrary:(id)a4;
+ (id)_predicateFromAlbumKind:(int)a3 negate:(BOOL)a4;
+ (id)_predicateFromSearchIndexForText:(id)a3 comparator:(int)a4 inLibrary:(id)a5;
+ (id)_singleQueryInQuery:(id)a3 passingTest:(id)a4;
+ (id)constructQueryFromData:(id)a3;
+ (id)dataFromQuery:(id)a3;
+ (id)infoFromQuery:(id)a3;
+ (id)predicateForQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5;
+ (id)queryFromInfo:(id)a3;
+ (int)_convertComparatorToNumericComparator:(int)a3;
+ (unint64_t)_comparatorToOperatorType:(int)a3;
@end

@implementation PLQueryHandler

+ (id)constructQueryFromData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F8B9A0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithData:v4];

  return v5;
}

+ (BOOL)_findAndReplaceLatitudeLongitudeKeyInQuery:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 hasFirst])
  {
    if (![v3 hasSecond])
    {
      char v7 = 0;
      goto LABEL_8;
    }
LABEL_6:
    v8 = [v3 second];
    char v7 = +[PLQueryHandler _findAndReplaceLatitudeLongitudeKeyInQuery:v8];

    goto LABEL_8;
  }
  id v4 = [v3 first];
  BOOL v5 = +[PLQueryHandler _findAndReplaceLatitudeLongitudeKeyInQuery:v4];

  int v6 = [v3 hasSecond];
  char v7 = v6 | v5;
  if (v6 && !v5) {
    goto LABEL_6;
  }
LABEL_8:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = objc_msgSend(v3, "singleQueries", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v14 key] == 307 || objc_msgSend(v14, "key") == 308)
        {
          [v14 setKey:319];
          if ([v14 comparator] == 51)
          {
            uint64_t v15 = 1;
            goto LABEL_19;
          }
          if ([v14 comparator] == 50)
          {
            uint64_t v15 = 2;
LABEL_19:
            [v14 setComparator:v15];
          }
          char v7 = 1;
          continue;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v7 & 1;
}

+ (BOOL)fixUserQueryDataInQuery:(id)a3
{
  return +[PLQueryHandler _findAndReplaceLatitudeLongitudeKeyInQuery:a3];
}

+ (BOOL)includesHiddenAssetsInQuery:(id)a3
{
  id v3 = [a1 _singleQueryInQuery:a3 passingTest:&__block_literal_global_300_38339];
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __46__PLQueryHandler_includesHiddenAssetsInQuery___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 key] == 2
    && [v2 hasComparator]
    && [v2 comparator] == 1)
  {
    uint64_t v3 = [v2 BOOLValue];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (BOOL)includesHiddenAssetsKeyInQuery:(id)a3
{
  return +[PLQueryHandler _containsKey:2 inQuery:a3];
}

+ (id)_singleQueryInQuery:(id)a3 passingTest:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (uint64_t (**)(id, void *))a4;
  if (v6)
  {
    if ([v6 singleQueriesCount])
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v8 = objc_msgSend(v6, "singleQueries", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
          if (v7[2](v7, v13)) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v14 = v13;

        if (v14) {
          goto LABEL_16;
        }
      }
      else
      {
LABEL_11:
      }
    }
    uint64_t v15 = [v6 first];
    id v14 = [a1 _singleQueryInQuery:v15 passingTest:v7];

    if (!v14)
    {
      v16 = [v6 second];
      id v14 = [a1 _singleQueryInQuery:v16 passingTest:v7];
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_16:

  return v14;
}

+ (BOOL)_containsKey:(int)a3 inQuery:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    if ([v5 singleQueriesCount])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      char v7 = objc_msgSend(v6, "singleQueries", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v8)
      {
LABEL_11:
        BOOL v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * v11) key] == v4) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
      char v7 = [v6 first];
      if (!+[PLQueryHandler _containsKey:v4 inQuery:v7])
      {
        v13 = [v6 second];
        BOOL v12 = +[PLQueryHandler _containsKey:v4 inQuery:v13];

        goto LABEL_16;
      }
    }
    BOOL v12 = 1;
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

+ (id)_predicateForQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v18 = 0;
    goto LABEL_48;
  }
  if (![v7 singleQueriesCount])
  {
    int v19 = [v7 conjunction];
    uint64_t v20 = [v7 first];
    uint64_t v10 = +[PLQueryHandler _predicateForQuery:v20 inLibrary:v8 changeDetectionCriteria:v9];

    if (v19 == 2)
    {
      if (v10)
      {
        id v18 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v10];
      }
      else
      {
        id v18 = 0;
      }
      goto LABEL_47;
    }
    uint64_t v22 = [v7 second];
    uint64_t v23 = +[PLQueryHandler _predicateForQuery:v22 inLibrary:v8 changeDetectionCriteria:v9];

    if (!v10 || !v23)
    {
      if (v23) {
        id v18 = 0;
      }
      else {
        id v18 = v10;
      }
      goto LABEL_46;
    }
    int v24 = [v7 conjunction];
    v25 = (void *)MEMORY[0x1E4F28BA0];
    if (v24)
    {
      v40[0] = v10;
      v40[1] = v23;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      uint64_t v27 = [v25 andPredicateWithSubpredicates:v26];
    }
    else
    {
      v41[0] = v10;
      v41[1] = v23;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
      uint64_t v27 = [v25 orPredicateWithSubpredicates:v26];
    }
    id v18 = (id)v27;
    goto LABEL_45;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "singleQueriesCount"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v35 = v7;
  uint64_t v11 = [v7 singleQueries];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    char v14 = 0;
    uint64_t v15 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v15) {
          objc_enumerationMutation(v11);
        }
        long long v17 = +[PLQueryHandler _predicateForSingleQuery:*(void *)(*((void *)&v36 + 1) + 8 * i) inLibrary:v8 changeDetectionCriteria:v9];
        if (v17) {
          [v10 addObject:v17];
        }
        else {
          char v14 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v13);
  }
  else
  {
    char v14 = 0;
  }

  if (![v10 count])
  {
    id v18 = 0;
    id v7 = v35;
    goto LABEL_30;
  }
  id v7 = v35;
  if (![v35 conjunction])
  {
    uint64_t v21 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];
    goto LABEL_29;
  }
  if ([v35 conjunction] == 1)
  {
    uint64_t v21 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v10];
LABEL_29:
    id v18 = (id)v21;
    goto LABEL_30;
  }
  if ([v35 conjunction] == 2)
  {
    v28 = (void *)MEMORY[0x1E4F28BA0];
    v29 = [v10 firstObject];
    id v18 = [v28 notPredicateWithSubpredicate:v29];

    if ((unint64_t)[v10 count] >= 2)
    {
      v30 = PLUserSmartAlbumGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = [v35 logDescription];
        *(_DWORD *)buf = 138412546;
        v43 = v31;
        __int16 v44 = 2112;
        id v45 = v18;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Only processing the first single query for NOT conjection, query: %@, predicate: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v18 = 0;
  }
LABEL_30:
  if (v14)
  {
    uint64_t v23 = PLUserSmartAlbumGetLog();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
LABEL_46:

      goto LABEL_47;
    }
    v26 = [v7 logDescription];
    *(_DWORD *)buf = 138412546;
    v43 = v26;
    __int16 v44 = 2112;
    id v45 = v18;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Dropping some unsupported predicate, query: %@, predicate: %@", buf, 0x16u);
LABEL_45:

    goto LABEL_46;
  }
LABEL_47:

LABEL_48:
  v32 = PLUserSmartAlbumGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v33 = [v7 logDescription];
    *(_DWORD *)buf = 138412546;
    v43 = v33;
    __int16 v44 = 2112;
    id v45 = v18;
    _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEBUG, "Query: %@, predicate: %@", buf, 0x16u);
  }
  return v18;
}

+ (id)predicateForQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[PLQueryHandler _predicateForQuery:a3 inLibrary:a4 changeDetectionCriteria:a5];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForSmartAlbumExclusions"), 1);
    id v8 = (void *)MEMORY[0x1E4F28BA0];
    v12[0] = v6;
    v12[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }
  return v10;
}

+ (id)_predicateForSingleQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v52 = 0;
  if ([v8 comparator] == 50 || objc_msgSend(v8, "comparator") == 51)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForEmptyQuery:v8 inLibrary:v9];
LABEL_4:
    uint64_t v12 = (void *)v11;
    goto LABEL_5;
  }
  if ([v8 comparator] == 30)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForRangeQuery:v8 inLibrary:v9 changeDetectionCriteria:v10];
    goto LABEL_4;
  }
  if ([v8 key] == 402)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForTextQuery:v8 inLibrary:v9];
    goto LABEL_4;
  }
  if ([v8 key] == 550)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForPersonQuery:v8 inLibrary:v9 changeDetectionCriteria:v10];
    goto LABEL_4;
  }
  if ([v8 key] == 551)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForPersonUUIDQuery:v8 inLibrary:v9 changeDetectionCriteria:v10];
    goto LABEL_4;
  }
  if ([v8 key] == 553)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForPersonUUIDinMomentForSharedLibraryQuery:v8 inLibrary:v9 changeDetectionCriteria:v10];
    goto LABEL_4;
  }
  if ([v8 key] == 6)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForIsReferencedQuery:v8 inLibrary:v9];
    goto LABEL_4;
  }
  if ([v8 valueType] == 2)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForDoubleQuery:v8 inLibrary:v9];
    goto LABEL_4;
  }
  if ([v8 key] == 5)
  {
    char v14 = [v8 firstValue];
    uint64_t v15 = integerFromData();

    if (v15 == 13)
    {
      uint64_t v11 = +[PLQueryHandler _predicateForLoopingQuery:v8 inLibrary:v9];
      goto LABEL_4;
    }
  }
  if ([v8 key] == 5
    && +[PLQueryHandler hasMatchingFetchingAlbumForSingleQuery:v8 outKind:&v52])
  {
    uint64_t v11 = +[PLQueryHandler _predicateFromAlbumKind:negate:](PLQueryHandler, "_predicateFromAlbumKind:negate:", v52, [v8 comparator] == 2);
    goto LABEL_4;
  }
  if ([v8 key] == 319)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForTaggedWithGPSQuery:v8 inLibrary:v9];
    goto LABEL_4;
  }
  if ([v8 key] == 600)
  {
    uint64_t v12 = 0;
    goto LABEL_5;
  }
  if ([v8 key] == 1000)
  {
    if ([v8 comparator] == 2) {
      +[PLQueryHandler _predicateForAbleToUploadQuery];
    }
    else {
    uint64_t v11 = +[PLQueryHandler _predicateForNotAbleToUploadQuery];
    }
    goto LABEL_4;
  }
  if ([v8 key] == 9)
  {
    uint64_t v11 = +[PLQueryHandler _predicateForProResQuery:v8 inLibrary:v9];
    goto LABEL_4;
  }
  long long v16 = [a1 _getConvertedKeys:v8];
  long long v17 = v16;
  if (v16)
  {
    v51 = [v16 objectForKey:@"key"];
    if (![v51 length])
    {
      uint64_t v12 = 0;
LABEL_59:

      goto LABEL_60;
    }
    v50 = [v17 objectForKey:@"firstValue"];
    id v18 = [v17 objectForKey:@"comparator"];
    uint64_t v19 = [v18 integerValue];

    if (([v8 key] == 200 || objc_msgSend(v8, "key") == 201)
      && ([v8 comparator] == 1 || objc_msgSend(v8, "comparator") == 2))
    {
      uint64_t v20 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      uint64_t v21 = [v20 startOfDayForDate:v50];
      uint64_t v22 = +[PLQueryHandler _getTargetDateForTheLastDays:-1 weeks:0 months:0 years:0 seconds:0 targetDate:v21];
      int v23 = [v8 comparator];
      id v24 = objc_alloc(MEMORY[0x1E4F8B9A8]);
      if (v23 == 1)
      {
        v25 = (void *)[v24 initWithConjunction:1];
        objc_msgSend(v25, "addIsAfterDateQueryKey:withDate:", objc_msgSend(v8, "key"), v21);
        objc_msgSend(v25, "addIsBeforeDateQueryKey:withDate:", objc_msgSend(v8, "key"), v22);
      }
      else
      {
        v25 = (void *)[v24 initWithConjunction:0];
        objc_msgSend(v25, "addIsBeforeDateQueryKey:withDate:", objc_msgSend(v8, "key"), v21);
        objc_msgSend(v25, "addIsAfterDateQueryKey:withDate:", objc_msgSend(v8, "key"), v22);
      }
      v33 = [v25 query];

      id v34 = +[PLQueryHandler predicateForQuery:v33 inLibrary:v9 changeDetectionCriteria:v10];
      goto LABEL_57;
    }
    unint64_t v26 = +[PLQueryHandler _comparatorToOperatorType:v19];
    if (+[PLQueryHandler _isTextComparator:v19]) {
      uint64_t v27 = 3;
    }
    else {
      uint64_t v27 = 0;
    }
    if ([v8 key] == 4)
    {
      v28 = (void *)MEMORY[0x1E4F28C68];
      v29 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"modernResources"];
      v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"($resource.resourceType == %d OR $resource.resourceType == %d) AND $resource.utiConformanceHint == %d", 0, 4, 2);
      v31 = @"resource";
LABEL_54:
      v32 = [v28 expressionForSubquery:v29 usingIteratorVariable:v31 predicate:v30];

      uint64_t v20 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"%@.@count", v32];

LABEL_71:
      uint64_t v27 = 0;
      char v43 = 1;
LABEL_72:
      uint64_t v21 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v50];
      uint64_t v44 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v20 rightExpression:v21 modifier:0 type:v26 options:v27];
      uint64_t v12 = (void *)v44;
      if ((v43 & 1) != 0
        || !v44
        || !+[PLQueryHandler _needToNegateQueryForComparator:v19])
      {
        goto LABEL_58;
      }
      uint64_t v22 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v12];
      v33 = (void *)[v8 copy];
      [v33 setComparator:50];
      v49 = +[PLQueryHandler _predicateForSingleQuery:v33 inLibrary:v9 changeDetectionCriteria:v10];
      if (v49)
      {
        id v45 = (void *)MEMORY[0x1E4F28BA0];
        v55[0] = v22;
        v55[1] = v49;
        uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
        id v34 = [v45 orPredicateWithSubpredicates:v47];

        uint64_t v12 = (void *)v47;
      }
      else
      {
        v46 = PLUserSmartAlbumGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v48 = [v8 logDescription];
          *(_DWORD *)buf = 138412290;
          v54 = v48;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, "Only negate the predicate, not checking null value for query: %@", buf, 0xCu);
        }
        id v34 = v22;
      }

LABEL_57:
      uint64_t v12 = v34;
LABEL_58:

      goto LABEL_59;
    }
    if ([v8 key] == 100)
    {
      if (([v8 hasFirstValue] & 1) == 0)
      {
        v28 = (void *)MEMORY[0x1E4F28C68];
        v29 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"albums"];
        v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$album.kind == %d AND $album.trashedState == %d", 2, 0);
        v31 = @"album";
        goto LABEL_54;
      }
      v35 = [v8 firstValue];
      long long v36 = stringFromData();

      long long v37 = (void *)MEMORY[0x1E4F28C68];
      long long v38 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"albums"];
      long long v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$album.cloudGUID == %@ OR $album.uuid == %@", v36, v36];
      v40 = @"album";
    }
    else
    {
      if ([v8 key] != 500)
      {
        uint64_t v20 = +[PLQueryHandler _expressionForStringValue:v51 inLibrary:v9];
        char v43 = 0;
        goto LABEL_72;
      }
      if (([v8 hasFirstValue] & 1) == 0)
      {
        uint64_t v20 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"additionalAttributes.keywords.@count"];
        goto LABEL_71;
      }
      v41 = [v8 firstValue];
      long long v36 = stringFromData();

      long long v37 = (void *)MEMORY[0x1E4F28C68];
      long long v38 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"additionalAttributes.keywords"];
      long long v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$keyword.title LIKE[cd] %@", v36];
      v40 = @"keyword";
    }
    v42 = [v37 expressionForSubquery:v38 usingIteratorVariable:v40 predicate:v39];

    uint64_t v20 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"%@.@count", v42];

    goto LABEL_71;
  }
  uint64_t v12 = 0;
LABEL_60:

LABEL_5:
  return v12;
}

+ (BOOL)hasMatchingFetchingAlbumForSingleQuery:(id)a3 outKind:(int *)a4
{
  uint64_t v5 = [a3 firstValue];
  uint64_t v6 = integerFromData();

  uint64_t v7 = v6 - 2;
  if ((unint64_t)(v6 - 2) > 0xF || ((0xF77Fu >> v7) & 1) == 0) {
    return 0;
  }
  *a4 = dword_19BA9AA0C[v7];
  return 1;
}

+ (id)_predicateForAbleToUploadQuery
{
  return +[PLManagedAsset predicateForUploadableAssetsWithoutCloudLocalState:4];
}

+ (id)_predicateForNotAbleToUploadQuery
{
  return +[PLManagedAsset predicateForUploadableAssetsWithCloudLocalState:4];
}

+ (id)_predicateForTaggedWithGPSQuery:(id)a3 inLibrary:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 _getConvertedKeys:a3];
  id v8 = [v7 objectForKey:@"key"];
  if ([v8 length])
  {
    id v9 = [v7 objectForKey:@"comparator"];
    uint64_t v10 = [v9 integerValue];

    unint64_t v11 = +[PLQueryHandler _comparatorToOperatorType:v10];
    uint64_t v12 = +[PLQueryHandler _expressionForStringValue:v8 inLibrary:v6];
    uint64_t v13 = (void *)MEMORY[0x1E4F28C68];
    char v14 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v15 = [v13 expressionForConstantValue:v14];

    long long v16 = (void *)MEMORY[0x1E4F28BA0];
    long long v17 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v12 rightExpression:v15 modifier:0 type:v11 options:0];
    id v18 = [v16 notPredicateWithSubpredicate:v17];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

+ (id)_predicateForProResQuery:(id)a3 inLibrary:(id)a4
{
  id v4 = a3;
  uint64_t v5 = +[PLManagedAsset predicateForProResAssets];
  int v6 = [v4 comparator];

  if (v6 == 2)
  {
    uint64_t v7 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v5];

    uint64_t v5 = (void *)v7;
  }
  return v5;
}

+ (id)_predicateFromAlbumKind:(int)a3 negate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = +[PLFetchingAlbum predicateForAlbumKind:*(void *)&a3];
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v5];

    uint64_t v5 = (void *)v6;
  }
  return v5;
}

+ (id)_predicateForLoopingQuery:(id)a3 inLibrary:(id)a4
{
  BOOL v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "predicateWithFormat:", @"noindex:(kind) == %d AND noindex:(playbackStyle) == %d", 1, 5);
  int v7 = [v5 comparator];

  if (v7 == 2)
  {
    uint64_t v8 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v6];

    uint64_t v6 = (void *)v8;
  }
  return v6;
}

+ (id)_predicateForIsReferencedQuery:(id)a3 inLibrary:(id)a4
{
  int v4 = [a3 comparator];
  id v5 = (void *)MEMORY[0x1E4F8BA10];
  uint64_t v6 = [MEMORY[0x1E4F8BA10] maskForReferencedAsset];
  if (v4 == 2) {
    [v5 predicateForExcludeMask:v6 useIndex:1];
  }
  else {
  int v7 = [v5 predicateForIncludeMask:v6 useIndex:1];
  }
  return v7;
}

+ (id)_assetsPredicateForPersonPredicate:(id)a3 assetObjectIDs:(id *)a4 additionalAssetPredicate:(id)a5 invert:(BOOL)a6 inLibrary:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__38406;
  v37[4] = __Block_byref_object_dispose__38407;
  id v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__38406;
  v35[4] = __Block_byref_object_dispose__38407;
  id v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__38406;
  v33 = __Block_byref_object_dispose__38407;
  id v34 = 0;
  char v14 = [v13 managedObjectContext];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __110__PLQueryHandler__assetsPredicateForPersonPredicate_assetObjectIDs_additionalAssetPredicate_invert_inLibrary___block_invoke;
  int v23 = &unk_1E58696E0;
  id v15 = v11;
  id v24 = v15;
  unint64_t v26 = v37;
  uint64_t v27 = v35;
  id v16 = v12;
  id v25 = v16;
  v28 = &v29;
  [v14 performBlockAndWait:&v20];

  if (v30[5])
  {
    if (v8) {
      long long v17 = @"NONE self IN %@";
    }
    else {
      long long v17 = @"ANY self IN %@";
    }
    id v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v17, v30[5], v20, v21, v22, v23, v24);
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v18 = 0;
  if (a4) {
LABEL_6:
  }
    *a4 = (id) v30[5];
LABEL_7:

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v37, 8);
  return v18;
}

void __110__PLQueryHandler__assetsPredicateForPersonPredicate_assetObjectIDs_additionalAssetPredicate_invert_inLibrary___block_invoke(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v3 = +[PLPerson entityName];
  int v4 = (void *)[v2 initWithEntityName:v3];

  [v4 setPredicate:a1[4]];
  [v4 setResultType:1];
  id v37 = 0;
  uint64_t v5 = [v4 execute:&v37];
  id v6 = v37;
  uint64_t v7 = *(void *)(a1[6] + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v6;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Error executing person query: %@", buf, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"personForFace", v10];
    id v12 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    id v13 = +[PLDetectedFace entityName];
    char v14 = (void *)[v12 initWithEntityName:v13];

    [v14 setPredicate:v11];
    [v14 setResultType:1];
    id v36 = 0;
    uint64_t v15 = [v14 execute:&v36];
    id v16 = v36;
    uint64_t v17 = *(void *)(a1[7] + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v15;

    if (!*(void *)(*(void *)(a1[7] + 8) + 40))
    {
      uint64_t v19 = PLBackendGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v16;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error executing detectedFaces query: %@", buf, 0xCu);
      }
    }
  }
  uint64_t v20 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"detectedFaces", v20];
    uint64_t v22 = (void *)v21;
    uint64_t v23 = a1[5];
    if (v23)
    {
      id v24 = (void *)MEMORY[0x1E4F28BA0];
      v38[0] = v21;
      v38[1] = v23;
      id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
      uint64_t v26 = [v24 andPredicateWithSubpredicates:v25];

      uint64_t v22 = (void *)v26;
    }
    id v27 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    v28 = +[PLManagedAsset entityName];
    uint64_t v29 = (void *)[v27 initWithEntityName:v28];

    [v29 setPredicate:v22];
    [v29 setResultType:1];
    id v35 = 0;
    uint64_t v30 = [v29 execute:&v35];
    id v31 = v35;
    uint64_t v32 = *(void *)(a1[8] + 8);
    v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v30;

    if (!*(void *)(*(void *)(a1[8] + 8) + 40))
    {
      id v34 = PLBackendGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v31;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Error executing assetObjectIDs query: %@", buf, 0xCu);
      }
    }
  }
}

+ (id)_predicateForPersonUUIDinMomentForSharedLibraryQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 firstValue];
  id v12 = stringFromData();

  unint64_t v13 = 0x1E4F28000uLL;
  if (([v8 comparator] & 0xFFFFFFFE) == 0x16)
  {
    char v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUUID == %@", v12];
    int v15 = [v8 comparator];
    BOOL v16 = v15 == 23;
    if (v14)
    {
      BOOL v17 = v15 == 23;
      id v18 = +[PLPerson entityName];
      [v10 addAttributeKeyPath:@"personUUID" forEntityName:v18];

      uint64_t v19 = +[PLPerson entityName];
      [v10 addRelationshipKeyPath:@"detectedFaces" forEntityName:v19];

      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == nil", @"additionalAttributes.syndicationIdentifier");
      uint64_t v21 = +[PLLibraryScope compoundPredicateForMarkingOnboardingPreviewAssetsWithRulePredicate:v20];
      id v42 = 0;
      id v22 = (id)[a1 _assetsPredicateForPersonPredicate:v14 assetObjectIDs:&v42 additionalAssetPredicate:v21 invert:v17 inLibrary:v9];
      id v23 = v42;

      unint64_t v13 = 0x1E4F28000;
      goto LABEL_6;
    }
  }
  else
  {
    char v14 = 0;
    BOOL v16 = 0;
  }
  id v23 = 0;
LABEL_6:
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy__38406;
  id v40 = __Block_byref_object_dispose__38407;
  id v41 = 0;
  id v24 = [v9 managedObjectContext];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __105__PLQueryHandler__predicateForPersonUUIDinMomentForSharedLibraryQuery_inLibrary_changeDetectionCriteria___block_invoke;
  v32[3] = &unk_1E5875340;
  id v25 = v23;
  id v33 = v25;
  id v26 = v9;
  id v34 = v26;
  id v35 = &v36;
  [v24 performBlockAndWait:v32];

  id v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v25];
  v28 = [v27 setByAddingObjectsFromArray:v37[5]];

  if (v28)
  {
    if (v16) {
      uint64_t v29 = @"NONE self IN %@";
    }
    else {
      uint64_t v29 = @"ANY self IN %@";
    }
    uint64_t v30 = objc_msgSend(*(id *)(v13 + 3936), "predicateWithFormat:", v29, v28);
  }
  else
  {
    uint64_t v30 = 0;
  }

  _Block_object_dispose(&v36, 8);
  return v30;
}

void __105__PLQueryHandler__predicateForPersonUUIDinMomentForSharedLibraryQuery_inLibrary_changeDetectionCriteria___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v31 = 0;
  int v4 = +[PLMoment batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:v2 andAssetPredicate:0 inManagedObjectContext:v3 error:&v31];
  id v5 = v31;

  if (v4)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    uint64_t v7 = +[PLPhotosHighlight entityName];
    id v8 = [v6 initWithEntityName:v7];

    id v9 = (void *)MEMORY[0x1E4F28BA0];
    id v10 = +[PLPhotosHighlight predicateForAllTripHighlights];
    v32[0] = v10;
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K in %@", @"dayGroupAssets", *(void *)(a1 + 32)];
    v32[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    unint64_t v13 = [v9 andPredicateWithSubpredicates:v12];
    [v8 setPredicate:v13];

    [v8 setResultType:1];
    id v30 = 0;
    char v14 = [v8 execute:&v30];
    id v15 = v30;
    BOOL v16 = PLBackendGetLog();
    BOOL v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v14;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Fetched trip highlights with people: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v15;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Error fetching trip highlights for day group assets: %@", buf, 0xCu);
      }
      char v14 = (void *)MEMORY[0x1E4F1CBF0];
    }

    id v18 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v19 = [v4 allValues];
    uint64_t v20 = [v18 predicateWithFormat:@"%K in %@ OR %K in %@", @"moment", v19, @"dayGroupHighlightBeingAssets", v14];

    id v21 = objc_alloc(MEMORY[0x1E4F1C0D0]);
    id v22 = +[PLManagedAsset entityName];
    id v23 = (void *)[v21 initWithEntityName:v22];

    [v23 setPredicate:v20];
    [v23 setResultType:1];
    id v29 = 0;
    uint64_t v24 = [v23 execute:&v29];
    id v25 = v29;
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v24;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v28 = PLBackendGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v25;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Error executing allAssetsObjectIDs query: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error executing batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs: %@", buf, 0xCu);
    }
  }
}

+ (id)_predicateForPersonUUIDQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 firstValue];
  id v12 = stringFromData();

  if (([v8 comparator] & 0xFFFFFFFE) == 0x16)
  {
    unint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"personUUID == %@", v12];
    int v14 = [v8 comparator];
    if (v13)
    {
      BOOL v15 = v14 == 23;
      BOOL v16 = +[PLPerson entityName];
      [v10 addAttributeKeyPath:@"personUUID" forEntityName:v16];

      BOOL v17 = +[PLPerson entityName];
      [v10 addRelationshipKeyPath:@"detectedFaces" forEntityName:v17];

      id v18 = [a1 _assetsPredicateForPersonPredicate:v13 assetObjectIDs:0 additionalAssetPredicate:0 invert:v15 inLibrary:v9];
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  id v18 = 0;
LABEL_6:

  return v18;
}

+ (id)_predicateForPersonQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 firstValue];
  id v12 = stringFromData();

  unint64_t v13 = [MEMORY[0x1E4F28FD8] escapedPatternForString:v12];
  int v14 = [NSString stringWithFormat:@"(^|.*\\s+)%@(\\s+.*|$)", v13];
  BOOL v15 = [NSString stringWithFormat:@".*%@.*", v13];
  int v16 = [v10 comparator];

  switch(v16)
  {
    case 20:
      id v17 = a1;
      id v18 = v15;
      goto LABEL_8;
    case 21:
      id v19 = a1;
      uint64_t v20 = v15;
      goto LABEL_10;
    case 22:
      id v17 = a1;
      id v18 = v14;
LABEL_8:
      id v21 = [v17 _personMatchesPredicateForCriteria:v18];
      goto LABEL_15;
    case 23:
      id v19 = a1;
      uint64_t v20 = v14;
LABEL_10:
      id v21 = [v19 _personMatchesPredicateForCriteria:v20];
      uint64_t v22 = 1;
      if (!v21) {
        goto LABEL_20;
      }
      goto LABEL_16;
    case 24:
      [NSString stringWithFormat:@"(^|\\s+)%@.*", v13];
      goto LABEL_14;
    case 25:
      [NSString stringWithFormat:@".*%@(\\s+|$)", v13];
      id v23 = LABEL_14:;
      id v21 = +[PLQueryHandler _personMatchesPredicateForCriteria:v23];

LABEL_15:
      uint64_t v22 = 0;
      if (!v21) {
        goto LABEL_20;
      }
LABEL_16:
      uint64_t v24 = +[PLPerson entityName];
      [v9 addAttributeKeyPath:@"fullName" forEntityName:v24];

      id v25 = +[PLPerson entityName];
      [v9 addAttributeKeyPath:@"displayName" forEntityName:v25];

      uint64_t v26 = +[PLPerson entityName];
      [v9 addRelationshipKeyPath:@"detectedFaces" forEntityName:v26];

      id v27 = [a1 _assetsPredicateForPersonPredicate:v21 assetObjectIDs:0 additionalAssetPredicate:0 invert:v22 inLibrary:v8];
      goto LABEL_21;
    default:
      if (v16 == 50)
      {
        objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count == 0", @"detectedFaces");
        goto LABEL_18;
      }
      if (v16 == 51)
      {
        objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count > 0", @"detectedFaces");
        id v27 = LABEL_18:;
        id v21 = 0;
        goto LABEL_21;
      }
      id v21 = 0;
LABEL_20:
      id v27 = 0;
LABEL_21:

      return v27;
  }
}

+ (id)_personMatchesPredicateForCriteria:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _personNameQueryKeyPaths];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K MATCHES[cd] %@", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, (void)v15];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  unint64_t v13 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v6];

  return v13;
}

+ (id)_personNameQueryKeyPaths
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"fullName";
  v4[1] = @"displayName";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)_predicateForDoubleQuery:(id)a3 inLibrary:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 firstValue];
  doubleFromData();
  double v9 = v8;

  uint64_t v10 = +[PLQueryHandler _getConvertedQueryKey:v5];
  if (![v10 length])
  {
    long long v17 = 0;
    goto LABEL_23;
  }
  if (+[PLQueryHandler _needEqualityForDoubleQuery:](PLQueryHandler, "_needEqualityForDoubleQuery:", [v5 comparator]))
  {
    if ([v5 comparator] == 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    id v12 = +[PLQueryHandler _equalityPredicateForDoubleQuery:v10 withValue:v11 comparator:v6 inLibrary:v9];
    if ([v5 hasSecondValue])
    {
      unint64_t v13 = (void *)MEMORY[0x1E4F28BA0];
      v30[0] = v12;
      int v14 = +[PLQueryHandler _equalityPredicateForDoubleQuery:v10 withValue:1 comparator:v6 inLibrary:v9];
      v30[1] = v14;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      uint64_t v16 = [v13 orPredicateWithSubpredicates:v15];

      id v12 = (void *)v16;
    }
  }
  else
  {
    id v12 = 0;
  }
  long long v18 = +[PLQueryHandler _expressionForStringValue:v10 inLibrary:v6];
  id v19 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v20 = [NSNumber numberWithDouble:v9];
  id v21 = [v19 expressionForConstantValue:v20];

  uint64_t v22 = [v5 comparator];
  if ([v5 key] == 300)
  {
    if ((v22 - 3) >= 3)
    {
      if (v22 == 6) {
        uint64_t v22 = 5;
      }
      else {
        uint64_t v22 = v22;
      }
    }
    else
    {
      uint64_t v22 = dword_19BA9AA00[(v22 - 3)];
    }
  }
  unint64_t v23 = +[PLQueryHandler _comparatorToOperatorType:v22];
  if (v12)
  {
    if ((v22 - 1) > 1)
    {
      id v25 = (void *)MEMORY[0x1E4F28BA0];
      uint64_t v26 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v18 rightExpression:v21 modifier:0 type:v23 options:0];
      v29[0] = v26;
      v29[1] = v12;
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      long long v17 = [v25 orPredicateWithSubpredicates:v27];

      goto LABEL_22;
    }
    id v24 = v12;
  }
  else
  {
    id v24 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v18 rightExpression:v21 modifier:0 type:v23 options:0];
  }
  long long v17 = v24;
LABEL_22:

LABEL_23:
  return v17;
}

+ (id)_equalityPredicateForDoubleQuery:(id)a3 withValue:(double)a4 comparator:(int)a5 inLibrary:(id)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  double v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a6;
  id v10 = a3;
  uint64_t v11 = +[PLQueryHandler _expressionForStringValue:v10 inLibrary:v9];
  id v12 = (void *)MEMORY[0x1E4F28C68];
  unint64_t v13 = [NSNumber numberWithDouble:a4];
  int v14 = [v12 expressionForConstantValue:v13];
  long long v15 = objc_msgSend(v8, "arrayWithObjects:", v11, v14, 0);

  uint64_t v16 = [MEMORY[0x1E4F28C68] expressionForFunction:@"from:subtract:" arguments:v15];
  long long v17 = (void *)MEMORY[0x1E4F28C68];
  v40[0] = v16;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  id v19 = [v17 expressionForFunction:@"abs:" arguments:v18];

  uint64_t v20 = (void *)MEMORY[0x1E4F28C68];
  id v21 = [NSNumber numberWithDouble:2.22044605e-16];
  uint64_t v22 = [v20 expressionForConstantValue:v21];

  if (a5 == 1)
  {
    unint64_t v23 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v19 rightExpression:v22 modifier:0 type:0 options:0];
    id v24 = +[PLQueryHandler _expressionForStringValue:v10 inLibrary:v9];

    id v25 = (void *)MEMORY[0x1E4F28C68];
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
    id v27 = [v25 expressionForConstantValue:v26];

    v28 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v24 rightExpression:v27 modifier:0 type:5 options:0];
    id v29 = (void *)MEMORY[0x1E4F28BA0];
    v39[0] = v23;
    v39[1] = v28;
    id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v31 = [v29 andPredicateWithSubpredicates:v30];
  }
  else
  {
    unint64_t v23 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v19 rightExpression:v22 modifier:0 type:3 options:0];
    id v24 = +[PLQueryHandler _expressionForStringValue:v10 inLibrary:v9];

    uint64_t v32 = (void *)MEMORY[0x1E4F28C68];
    id v33 = [MEMORY[0x1E4F1CA98] null];
    id v27 = [v32 expressionForConstantValue:v33];

    v28 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v24 rightExpression:v27 modifier:0 type:4 options:0];
    id v34 = (void *)MEMORY[0x1E4F28BA0];
    v38[0] = v23;
    v38[1] = v28;
    id v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    uint64_t v31 = [v34 orPredicateWithSubpredicates:v30];
  }
  uint64_t v35 = (void *)v31;

  return v35;
}

+ (BOOL)_needEqualityForDoubleQuery:(int)a3
{
  return (a3 < 0x1F) & (0x40000066u >> a3);
}

+ (id)_predicateForRangeQuery:(id)a3 inLibrary:(id)a4 changeDetectionCriteria:(id)a5
{
  id v7 = a3;
  double v8 = (objc_class *)MEMORY[0x1E4F8B9A8];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = (void *)[[v8 alloc] initWithConjunction:1];
  if ([v7 valueType] == 4)
  {
    id v12 = [v7 firstValue];
    unint64_t v13 = dateFromData();

    int v14 = [v7 secondValue];
    long long v15 = dateFromData();

    uint64_t v16 = [v7 key];
    long long v17 = +[PLQueryHandler _getTargetDateForTheLastDays:-1 weeks:0 months:0 years:0 seconds:0 targetDate:v15];
    [v11 addIsAfterDateQueryKey:v16 withDate:v13];
    [v11 addIsBeforeDateQueryKey:v16 withDate:v17];
  }
  else
  {
    int v18 = [v7 valueType];
    id v19 = [v7 firstValue];
    if (v18 == 2)
    {
      doubleFromData();
      double v21 = v20;

      uint64_t v22 = [v7 secondValue];
      doubleFromData();
      double v24 = v23;

      LODWORD(v22) = [v7 key];
      uint64_t v25 = [v7 key];
      if (v22 == 300)
      {
        [v11 addDoubleQueryKey:v25 withValue:6 comparator:v21];
        uint64_t v26 = [v7 key];
        id v27 = v11;
        double v28 = v24;
        uint64_t v29 = 5;
      }
      else
      {
        [v11 addDoubleQueryKey:v25 withValue:5 comparator:v21];
        uint64_t v26 = [v7 key];
        id v27 = v11;
        double v28 = v24;
        uint64_t v29 = 6;
      }
      [v27 addDoubleQueryKey:v26 withValue:v29 comparator:v28];
    }
    else
    {
      uint64_t v30 = integerFromData();

      uint64_t v31 = [v7 secondValue];
      uint64_t v32 = integerFromData();

      objc_msgSend(v11, "addIntegerQueryKey:withValue:comparator:", objc_msgSend(v7, "key"), v30, 5);
      objc_msgSend(v11, "addIntegerQueryKey:withValue:comparator:", objc_msgSend(v7, "key"), v32, 6);
    }
  }
  id v33 = [v11 query];
  id v34 = +[PLQueryHandler predicateForQuery:v33 inLibrary:v10 changeDetectionCriteria:v9];

  return v34;
}

+ (id)_predicateForTextQuery:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (PLPlatformSearchSupported() && [v5 hasFirstValue])
  {
    id v7 = [v5 firstValue];
    double v8 = stringFromData();

    BOOL v9 = +[PLQueryHandler _needToNegateQueryForComparator:](PLQueryHandler, "_needToNegateQueryForComparator:", [v5 comparator]);
    id v10 = +[PLQueryHandler _predicateFromSearchIndexForText:comparator:inLibrary:](PLQueryHandler, "_predicateFromSearchIndexForText:comparator:inLibrary:", v8, [v5 comparator], v6);
    if (v10 && v9)
    {
      uint64_t v11 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v10];

      id v10 = (void *)v11;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_predicateFromSearchIndexForText:(id)a3 comparator:(int)a4 inLibrary:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = __Block_byref_object_copy__38406;
  id v41 = __Block_byref_object_dispose__38407;
  id v42 = 0;
  BOOL v9 = [v8 pathManager];
  id v10 = [[PSIDatabase alloc] initWithPathManager:v9 options:1];
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_38501);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2;
  block[3] = &unk_1E58696B8;
  id v12 = v10;
  uint64_t v32 = v12;
  int v36 = a4;
  id v13 = v7;
  id v33 = v13;
  uint64_t v35 = &v37;
  int v14 = v11;
  id v34 = v14;
  long long v15 = (void (**)(void))dispatch_block_create((dispatch_block_flags_t)0, block);
  if (PLIsReallyAssetsd())
  {
    uint64_t v16 = [v8 libraryServicesManager];
    BOOL v17 = [v16 state] > 5;

    if (v17)
    {
      int v18 = [v8 libraryServicesManager];
      id v19 = [v18 searchIndexManager];

      if (v19)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2_195;
        v27[3] = &unk_1E5875198;
        double v28 = v15;
        [v19 ensureSearchIndexExistsWithCompletionHandler:v27];
        dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
        double v20 = v28;
      }
      else
      {
        double v20 = PLSearchBackendQueryGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v44 = v8;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Unable to querySearchIndex. nil searchIndexManager for library: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if (v12)
    {
      v15[2](v15);
    }
    else
    {
      double v21 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Unable to execute query, failure to confirm search index existence.", buf, 2u);
      }

      uint64_t v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      double v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_UTILITY, 0);

      double v24 = dispatch_queue_create("com.apple.photos.search.query_handler", v23);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_194;
      v29[3] = &unk_1E5875CE0;
      id v30 = v8;
      dispatch_async(v24, v29);
      v14[2](v14);
    }
    dispatch_block_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v25 = (id)v38[5];

  _Block_object_dispose(&v37, 8);
  return v25;
}

void __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [[PLSearchProcessor alloc] initWithDatabase:*(void *)(a1 + 32)];
  unsigned int v3 = *(_DWORD *)(a1 + 64) - 22;
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_19BA9A9E8[v3];
  }
  id v5 = [[PSIQueryToken alloc] initWithText:*(void *)(a1 + 40) userCategory:0 matchType:v4];
  id v6 = *(void **)(a1 + 32);
  v13[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v8 = (void *)[v6 newQueryWithSearchText:0 queryTokens:v7 useWildcardSearchText:1 libraryScope:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_3;
  v11[3] = &unk_1E5869690;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v9 = (id)v10;
  long long v12 = v10;
  [(PLSearchProcessor *)v2 performQuery:v8 withResultsHandler:v11];
}

void __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_194(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetsdClient];
  v1 = [v2 libraryInternalClient];
  [v1 waitForSearchIndexExistenceWithError:0];
}

uint64_t __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_2_195(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__PLQueryHandler__predicateFromSearchIndexForText_comparator_inLibrary___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = [a5 assetUUIDs];
  id v7 = (void *)v6;
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    id v8 = (void *)v6;
  }
  id v9 = v8;

  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v9];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  id v13 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v13();
}

+ (id)_predicateForEmptyQuery:(id)a3 inLibrary:(id)a4
{
  void v40[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 key] == 100)
  {
    if ([v6 comparator] == 51) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 4;
    }
    id v9 = (void *)MEMORY[0x1E4F28C68];
    uint64_t v10 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"albums"];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"$album.kind == %d AND $album.trashedState == %d", 2, 0);
    long long v12 = [v9 expressionForSubquery:v10 usingIteratorVariable:@"album" predicate:v11];

    id v13 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"%@.@count", v12];
    int v14 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1EEBEE3E8];
    id v15 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v13 rightExpression:v14 modifier:0 type:v8 options:0];
  }
  else
  {
    if ([v6 key] == 500)
    {
      if ([v6 comparator] == 51) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 4;
      }
      BOOL v17 = [v6 firstValue];
      int v18 = stringFromData();

      id v19 = (void *)MEMORY[0x1E4F28C68];
      double v20 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"additionalAttributes.keywords"];
      double v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"$keyword.title LIKE[cd] %@", v18];
      uint64_t v22 = [v19 expressionForSubquery:v20 usingIteratorVariable:@"keyword" predicate:v21];

      double v23 = [MEMORY[0x1E4F28C68] expressionWithFormat:@"%@.@count", v22];
      double v24 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1EEBEE3E8];
      id v15 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v23 rightExpression:v24 modifier:0 type:v16 options:0];
    }
    else
    {
      int v18 = +[PLQueryHandler _getConvertedQueryKey:v6];
      if ([v18 length])
      {
        int v25 = [v6 comparator];
        if (v25 == 51) {
          uint64_t v26 = 5;
        }
        else {
          uint64_t v26 = 4;
        }
        id v27 = +[PLQueryHandler _expressionForStringValue:v18 inLibrary:v7];
        double v28 = (void *)MEMORY[0x1E4F28C68];
        uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
        id v30 = [v28 expressionForConstantValue:v29];

        uint64_t v31 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v27 rightExpression:v30 modifier:0 type:v26 options:0];
        if (objc_msgSend(a1, "_isTextFieldQuery:", objc_msgSend(v6, "key")))
        {
          uint64_t v32 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&stru_1EEB2EB80];
          uint64_t v33 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v27 rightExpression:v32 modifier:0 type:v26 options:0];
          id v34 = (void *)v33;
          uint64_t v35 = (void *)MEMORY[0x1E4F28BA0];
          if (v25 == 51)
          {
            v40[0] = v31;
            v40[1] = v33;
            int v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
            uint64_t v37 = [v35 andPredicateWithSubpredicates:v36];
          }
          else
          {
            v39[0] = v31;
            v39[1] = v33;
            int v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
            uint64_t v37 = [v35 orPredicateWithSubpredicates:v36];
          }
          id v15 = (id)v37;
        }
        else
        {
          id v15 = v31;
        }
      }
      else
      {
        id v15 = 0;
      }
    }
  }
  return v15;
}

+ (BOOL)_needToNegateQueryForComparator:(int)a3
{
  return (a3 < 0x21) & (0x100A00000uLL >> a3);
}

+ (id)_expressionForStringValue:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 componentsSeparatedByString:@"."];
  uint64_t v8 = [v6 managedObjectContext];

  id v9 = [v8 persistentStoreCoordinator];
  uint64_t v10 = [v9 managedObjectModel];
  uint64_t v11 = [v10 entitiesByName];

  long long v12 = +[PLManagedAsset entityName];
  id v13 = [v11 objectForKeyedSubscript:v12];

  int v14 = [v11 objectForKeyedSubscript:@"ExtendedAttributes"];
  id v15 = [v11 objectForKeyedSubscript:@"AdditionalAssetAttributes"];
  uint64_t v16 = [v11 objectForKeyedSubscript:@"AssetDescription"];
  if ([v7 count] == 1)
  {
    BOOL v17 = [v13 propertiesByName];
    int v18 = [v7 objectAtIndexedSubscript:0];
    id v19 = [v17 objectForKey:v18];

    if (v19)
    {
      double v20 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v5];
LABEL_4:

      goto LABEL_27;
    }
    goto LABEL_25;
  }
  if ([v7 count] == 2)
  {
    BOOL v17 = [v13 propertiesByName];
    double v21 = [v7 objectAtIndexedSubscript:0];
    uint64_t v22 = [v17 objectForKey:v21];

    if (v22)
    {
      double v23 = [v7 objectAtIndexedSubscript:0];
      int v24 = [v23 isEqualToString:@"extendedAttributes"];

      if (v24)
      {
        int v25 = [v14 propertiesByName];
        uint64_t v26 = [v7 objectAtIndexedSubscript:1];
        v50 = v25;
        id v27 = [v25 objectForKey:v26];

        if (!v27) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      char v43 = [v7 objectAtIndexedSubscript:0];
      int v44 = [v43 isEqualToString:@"additionalAttributes"];

      if (v44)
      {
        uint64_t v45 = [v15 propertiesByName];
        v46 = [v7 objectAtIndexedSubscript:1];
        v50 = v45;
        uint64_t v47 = [v45 objectForKey:v46];

        if (!v47)
        {
LABEL_23:
          double v28 = v50;
          goto LABEL_24;
        }
LABEL_19:
        double v20 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v5];

        goto LABEL_4;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  if ([v7 count] == 3)
  {
    BOOL v17 = [v13 propertiesByName];
    double v28 = [v7 objectAtIndexedSubscript:0];
    uint64_t v29 = [v17 objectForKey:v28];
    if (!v29)
    {
LABEL_24:

      goto LABEL_25;
    }
    id v30 = (void *)v29;
    v49 = v14;
    [v7 objectAtIndexedSubscript:0];
    uint64_t v31 = v51 = v28;
    int v32 = [v31 isEqualToString:@"additionalAttributes"];

    if (v32)
    {
      uint64_t v33 = [v15 propertiesByName];
      id v34 = [v7 objectAtIndexedSubscript:1];
      v50 = v33;
      uint64_t v35 = [v33 objectForKey:v34];

      if (v35)
      {
        int v36 = [v7 objectAtIndexedSubscript:1];
        int v37 = [v36 isEqualToString:@"assetDescription"];

        if (v37)
        {
          uint64_t v38 = [v16 propertiesByName];
          uint64_t v39 = [v7 objectAtIndexedSubscript:2];
          id v40 = [v38 objectForKey:v39];

          if (v40)
          {
            uint64_t v41 = [MEMORY[0x1E4F28C68] expressionForKeyPath:v5];
            id v42 = v38;
            double v20 = (void *)v41;

            int v14 = v49;
            goto LABEL_27;
          }
        }
      }
      int v14 = v49;
      goto LABEL_23;
    }
    int v14 = v49;
    goto LABEL_25;
  }
LABEL_26:
  double v20 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v5];
LABEL_27:

  return v20;
}

+ (unint64_t)_comparatorToOperatorType:(int)a3
{
  unint64_t result = 4;
  switch(a3)
  {
    case 2:
      return 5;
    case 3:
      return 2;
    case 4:
      return 0;
    case 5:
      return 3;
    case 6:
      return 1;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
      return result;
    case 20:
    case 21:
      return 99;
    case 22:
    case 23:
      return 7;
    case 24:
      return 8;
    case 25:
      return 9;
    case 31:
    case 32:
      return 10;
    default:
      if (a3 == 40) {
        return 3;
      }
      if (a3 == 41) {
        return 0;
      }
      return result;
  }
}

+ (id)_getConvertedKeys:(id)a3
{
  id v3 = a3;
  if (+[PLQueryHandler _isTextComparator:](PLQueryHandler, "_isTextComparator:", [v3 comparator]))
  {
    uint64_t v4 = &stru_1EEB2EB80;
    id v5 = &stru_1EEB2EB80;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v4 = [MEMORY[0x1E4F1CA98] null];
  }
  id v6 = +[PLQueryHandler _getConvertedQueryKey:v3];
  int v7 = [v3 key];
  int v8 = [v3 valueType];
  uint64_t v9 = [v3 comparator];
  if (v7 > 199)
  {
    if ((v7 - 200) < 2)
    {
      if ([v3 valueType] == 1)
      {
        uint64_t v16 = [v3 unit];
        BOOL v17 = [v3 firstValue];
        long long v12 = +[PLQueryHandler _getTargetDateWithUnit:v16 dateValue:v17];
      }
      else
      {
        int v25 = [v3 firstValue];
        dateFromData();
        long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_51;
    }
    if (v7 != 500) {
      goto LABEL_8;
    }
LABEL_15:

    char v18 = [v3 hasFirstValue];
    if (v9 == 22) {
      unsigned int v19 = 1;
    }
    else {
      unsigned int v19 = 2;
    }
    if (v9 == 22) {
      unsigned int v20 = 5;
    }
    else {
      unsigned int v20 = 4;
    }
    long long v12 = (__CFString *)&unk_1EEBEE3D0;
    if (v18) {
      uint64_t v9 = v19;
    }
    else {
      uint64_t v9 = v20;
    }
    goto LABEL_51;
  }
  switch(v7)
  {
    case 3:

      if (v9 == 1) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 1;
      }
      long long v12 = (__CFString *)&unk_1EEBEE3E8;
      goto LABEL_51;
    case 5:
      double v21 = [v3 firstValue];
      uint64_t v22 = integerFromData();

      double v23 = [v3 firstValue];
      long long v12 = +[PLQueryHandler _convertQueryValueForAssetType:integerFromData()];

      uint64_t v24 = +[PLQueryHandler _convertComparatorToNumericComparator:](PLQueryHandler, "_convertComparatorToNumericComparator:", [v3 comparator]);
      if (v22 == 9)
      {
        if ([v3 comparator] == 1) {
          uint64_t v9 = 31;
        }
        else {
          uint64_t v9 = 32;
        }
      }
      else
      {
        uint64_t v9 = v24;
      }
      goto LABEL_51;
    case 100:
      goto LABEL_15;
  }
LABEL_8:
  switch(v8)
  {
    case 1:
      uint64_t v10 = NSNumber;
      uint64_t v11 = [v3 firstValue];
      long long v12 = [v10 numberWithInteger:integerFromData()];

      if ([v3 hasSecondValue])
      {
        id v13 = NSNumber;
        int v14 = [v3 secondValue];
        uint64_t v15 = [v13 numberWithInteger:integerFromData()];
        goto LABEL_36;
      }
      break;
    case 2:
      uint64_t v26 = NSNumber;
      id v27 = [v3 firstValue];
      doubleFromData();
      objc_msgSend(v26, "numberWithDouble:");
      long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ([v3 hasSecondValue])
      {
        double v28 = NSNumber;
        int v14 = [v3 secondValue];
        doubleFromData();
        uint64_t v15 = objc_msgSend(v28, "numberWithDouble:");
LABEL_36:
        uint64_t v29 = (__CFString *)v15;

        uint64_t v4 = v29;
      }
      break;
    case 3:
      if ([v3 hasFirstValue])
      {
        uint64_t v30 = [v3 firstValue];
        stringFromData();
        long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        id v5 = (__CFString *)v30;
      }
      else
      {
        long long v12 = &stru_1EEB2EB80;
      }

      if ([v3 hasSecondValue])
      {
        int v32 = [v3 secondValue];
        uint64_t v33 = stringFromData();
        goto LABEL_50;
      }
      break;
    case 4:
      uint64_t v31 = [v3 firstValue];
      dateFromData();
      long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if ([v3 hasSecondValue])
      {
        int v32 = [v3 secondValue];
        uint64_t v33 = dateFromData();
        goto LABEL_50;
      }
      break;
    case 5:
      if ([v3 hasFirstValue])
      {
        id v34 = [v3 firstValue];
        circularRegionFromData();
        long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        long long v12 = v5;
      }
      if ([v3 hasSecondValue])
      {
        int v32 = [v3 secondValue];
        uint64_t v33 = circularRegionFromData();
LABEL_50:
        uint64_t v35 = (__CFString *)v33;

        uint64_t v4 = v35;
      }
      break;
    default:
      long long v12 = v5;
      break;
  }
LABEL_51:
  if (v6)
  {
    int v36 = (void *)MEMORY[0x1E4F1C9E8];
    int v37 = [NSNumber numberWithInt:v9];
    uint64_t v38 = objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", v6, @"key", v12, @"firstValue", v4, @"secondValue", v37, @"comparator", 0);
  }
  else
  {
    uint64_t v38 = 0;
  }

  return v38;
}

+ (int)_convertComparatorToNumericComparator:(int)a3
{
  int result = a3;
  if ((a3 - 20) <= 5) {
    return dword_19BA9A9D0[a3 - 20];
  }
  return result;
}

+ (BOOL)_isTextComparator:(int)a3
{
  return (a3 - 20) < 6;
}

+ (BOOL)_isTextFieldQuery:(int)a3
{
  return (a3 - 301) <= 0xA && ((1 << (a3 - 45)) & 0x611) != 0 || (a3 - 400) < 4;
}

+ (id)_getConvertedQueryKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 key];
  if (v4 == 5)
  {
    id v5 = [v3 firstValue];
    uint64_t v6 = integerFromData();

    if (v6 == 9) {
      int v7 = @"hdrType";
    }
    else {
      int v7 = &stru_1EEB2EB80;
    }
  }
  else
  {
    int v7 = +[PLQueryHandler _convertQueryKeyTypeToString:v4];
  }

  return v7;
}

+ (id)_convertQueryValueForAssetType:(int)a3
{
  if (a3 == 9)
  {
    id v5 = +[PLManagedAsset allHDRValues];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)_convertQueryKeyTypeToString:(int)a3
{
  id result = &stru_1EEB2EB80;
  if (a3 <= 299)
  {
    if (a3 > 99)
    {
      if (a3 == 100) {
        return @"special";
      }
      uint64_t v4 = @"addedDate";
      if (a3 != 201) {
        uint64_t v4 = &stru_1EEB2EB80;
      }
      if (a3 == 200) {
        return @"dateCreated";
      }
      else {
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 1:
          id result = @"favorite";
          break;
        case 2:
          id result = @"hidden";
          break;
        case 3:
          id result = @"adjustmentsState";
          break;
        case 4:
        case 6:
        case 9:
          return @"special";
        default:
          return result;
      }
    }
  }
  else
  {
    if (a3 <= 400)
    {
      switch(a3)
      {
        case 300:
          id result = @"extendedAttributes.aperture";
          break;
        case 301:
          id result = @"extendedAttributes.cameraModel";
          break;
        case 302:
          id result = @"extendedAttributes.flashFired";
          break;
        case 303:
          id result = @"extendedAttributes.focalLength";
          break;
        case 304:
          id result = @"extendedAttributes.iso";
          break;
        case 305:
          id result = @"extendedAttributes.lensModel";
          break;
        case 306:
          id result = @"extendedAttributes.shutterSpeed";
          break;
        case 307:
        case 308:
          return result;
        case 309:
          id result = @"extendedAttributes.bitrate";
          break;
        case 310:
          id result = @"extendedAttributes.cameraMake";
          break;
        case 311:
          id result = @"extendedAttributes.codec";
          break;
        case 312:
          id result = @"extendedAttributes.duration";
          break;
        case 313:
          id result = @"extendedAttributes.exposureBias";
          break;
        case 314:
          id result = @"extendedAttributes.fps";
          break;
        case 315:
          id result = @"extendedAttributes.meteringMode";
          break;
        case 316:
          id result = @"extendedAttributes.sampleRate";
          break;
        case 317:
          id result = @"extendedAttributes.trackFormat";
          break;
        case 318:
          id result = @"extendedAttributes.whiteBalance";
          break;
        case 319:
          id result = @"locationData";
          break;
        default:
          if (a3 == 400) {
            id result = @"additionalAttributes.originalFilename";
          }
          break;
      }
      return result;
    }
    if (a3 > 549)
    {
      if (((a3 - 550) > 0x32 || ((1 << (a3 - 38)) & 0x400000000000BLL) == 0)
        && a3 != 1000)
      {
        return result;
      }
      return @"special";
    }
    switch(a3)
    {
      case 401:
        return @"additionalAttributes.title";
      case 403:
        return @"additionalAttributes.assetDescription.longDescription";
      case 500:
        return @"special";
    }
  }
  return result;
}

+ (id)_getTargetDateForTheLastDays:(int64_t)a3 weeks:(int64_t)a4 months:(int64_t)a5 years:(int64_t)a6 seconds:(int64_t)a7 targetDate:(id)a8
{
  id v13 = a8;
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F1C9C8] date];
  }
  int v14 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v15 setDay:-a3];
  [v15 setWeekOfYear:-a4];
  [v15 setMonth:-a5];
  [v15 setYear:-a6];
  [v15 setSecond:-a7];
  uint64_t v16 = [v14 dateByAddingComponents:v15 toDate:v13 options:0];
  BOOL v17 = [v14 startOfDayForDate:v16];

  return v17;
}

+ (id)_getTargetDateWithUnit:(int)a3 dateValue:(id)a4
{
  uint64_t v5 = integerFromData();
  switch(a3)
  {
    case 1:
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      goto LABEL_5;
    case 2:
      uint64_t v6 = 0;
      uint64_t v7 = v5;
LABEL_5:
      uint64_t v9 = 0;
      goto LABEL_7;
    case 3:
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v9 = v5;
LABEL_7:
      uint64_t v10 = 0;
      goto LABEL_9;
    case 4:
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = v5;
LABEL_9:
      uint64_t v5 = 0;
      goto LABEL_11;
    case 5:
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
LABEL_11:
      int v8 = +[PLQueryHandler _getTargetDateForTheLastDays:v6 weeks:v7 months:v9 years:v10 seconds:v5 targetDate:0];
      break;
    default:
      int v8 = 0;
      break;
  }
  return v8;
}

+ (id)_infoFromSingleQuery:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "key"));
  [v4 setValue:v5 forKey:*MEMORY[0x1E4F8CB40]];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "valueType"));
  [v4 setValue:v6 forKey:*MEMORY[0x1E4F8CB68]];

  uint64_t v7 = [v3 firstValue];
  [v4 setValue:v7 forKey:*MEMORY[0x1E4F8CB38]];

  if ([v3 hasSecondValue])
  {
    int v8 = [v3 secondValue];
    [v4 setValue:v8 forKey:*MEMORY[0x1E4F8CB58]];
  }
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "comparator"));
  [v4 setValue:v9 forKey:*MEMORY[0x1E4F8CB20]];

  if ([v3 hasUnit])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "unit"));
    [v4 setValue:v10 forKey:*MEMORY[0x1E4F8CB60]];
  }
  return v4;
}

+ (id)queryFromInfo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F8B9A0]);
  uint64_t v5 = (void *)MEMORY[0x1E4F8CB28];
  uint64_t v6 = [v3 objectForKey:*MEMORY[0x1E4F8CB28]];

  if (v6)
  {
    uint64_t v7 = [v3 objectForKey:*v5];
    objc_msgSend(v4, "setConjunction:", objc_msgSend(v7, "integerValue"));
  }
  int v8 = [v3 objectForKey:*MEMORY[0x1E4F8CB48]];
  uint64_t v9 = v8;
  if (v8)
  {
    id v38 = v3;
    uint64_t v39 = v4;
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v37 = v9;
    id obj = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v42;
      int v14 = (void *)MEMORY[0x1E4F8CB58];
      id v15 = (void *)MEMORY[0x1E4F8CB20];
      uint64_t v16 = (void *)MEMORY[0x1E4F8CB60];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v42 != v13) {
            objc_enumerationMutation(obj);
          }
          char v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v19 = objc_alloc_init(MEMORY[0x1E4F8B9E8]);
          unsigned int v20 = [v18 objectForKey:*MEMORY[0x1E4F8CB40]];
          objc_msgSend(v19, "setKey:", objc_msgSend(v20, "integerValue"));

          double v21 = [v18 objectForKey:*MEMORY[0x1E4F8CB38]];
          [v19 setFirstValue:v21];

          uint64_t v22 = [v18 objectForKey:*v14];

          if (v22)
          {
            double v23 = [v18 objectForKey:*v14];
            [v19 setSecondValue:v23];
          }
          uint64_t v24 = objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E4F8CB68], v37);
          objc_msgSend(v19, "setValueType:", objc_msgSend(v24, "integerValue"));

          int v25 = [v18 objectForKey:*v15];
          objc_msgSend(v19, "setComparator:", objc_msgSend(v25, "integerValue"));

          uint64_t v26 = [v18 objectForKey:*v16];

          if (v26)
          {
            id v27 = [v18 objectForKey:*v16];
            objc_msgSend(v19, "setUnit:", objc_msgSend(v27, "integerValue"));
          }
          [v10 addObject:v19];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v12);
    }

    id v4 = v39;
    [v39 setSingleQueries:v10];

    uint64_t v9 = v37;
    id v3 = v38;
  }
  double v28 = (void *)MEMORY[0x1E4F8CB30];
  uint64_t v29 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E4F8CB30], v37);

  if (v29)
  {
    uint64_t v30 = [v3 objectForKey:*v28];
    uint64_t v31 = +[PLQueryHandler queryFromInfo:v30];
    [v4 setFirst:v31];
  }
  int v32 = (void *)MEMORY[0x1E4F8CB50];
  uint64_t v33 = [v3 objectForKey:*MEMORY[0x1E4F8CB50]];

  if (v33)
  {
    id v34 = [v3 objectForKey:*v32];
    uint64_t v35 = +[PLQueryHandler queryFromInfo:v34];
    [v4 setSecond:v35];
  }
  return v4;
}

+ (id)infoFromQuery:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v3 hasConjunction])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "conjunction"));
    [v4 setValue:v5 forKey:*MEMORY[0x1E4F8CB28]];
  }
  if ([v3 singleQueriesCount])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "singleQueriesCount"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = objc_msgSend(v3, "singleQueries", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = +[PLQueryHandler _infoFromSingleQuery:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v4 setValue:v6 forKey:*MEMORY[0x1E4F8CB48]];
  }
  else
  {
    if ([v3 hasFirst])
    {
      uint64_t v13 = [v3 first];
      int v14 = +[PLQueryHandler infoFromQuery:v13];
      [v4 setValue:v14 forKey:*MEMORY[0x1E4F8CB30]];
    }
    if ([v3 hasSecond])
    {
      id v15 = [v3 second];
      uint64_t v16 = +[PLQueryHandler infoFromQuery:v15];
      [v4 setValue:v16 forKey:*MEMORY[0x1E4F8CB50]];
    }
  }

  return v4;
}

+ (id)dataFromQuery:(id)a3
{
  return (id)[a3 data];
}

@end