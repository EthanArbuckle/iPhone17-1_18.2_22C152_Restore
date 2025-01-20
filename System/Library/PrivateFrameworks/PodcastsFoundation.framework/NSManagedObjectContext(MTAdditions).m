@interface NSManagedObjectContext(MTAdditions)
- (BOOL)hasAnyObjectsInEntity:()MTAdditions satisfyingPredicate:;
- (id)_objectsInEntity:()MTAdditions predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:propertiesToFetch:batchSize:;
- (id)executeFetchRequest:()MTAdditions;
- (id)objectDictionariesInEntity:()MTAdditions predicate:sortDescriptors:propertiesToFetch:includeObjectId:limit:distinct:groupBy:;
- (id)objectDictionaryForUuid:()MTAdditions entityName:byAddingComputedProperties:toFetchedObjectDictionary:;
- (id)objectDictionaryForUuid:()MTAdditions propertiesToFetch:entityName:;
- (id)objectForUuid:()MTAdditions entityName:returnsObjectAsFault:;
- (id)objectInEntity:()MTAdditions predicate:;
- (id)titlesOfObjectsInEntity:()MTAdditions predicate:;
- (id)valueForProperty:()MTAdditions objectUuid:entityName:;
- (uint64_t)_objectsInEntity:()MTAdditions predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:;
- (uint64_t)_predicateForUuid:()MTAdditions;
- (uint64_t)countOfObjectsInEntity:()MTAdditions predicate:;
- (uint64_t)objectDictionariesInEntity:()MTAdditions predicate:sortDescriptors:propertiesToFetch:includeObjectId:;
- (uint64_t)objectDictionaryForUuid:()MTAdditions entityName:;
- (uint64_t)objectForUuid:()MTAdditions entityName:;
- (uint64_t)objectsInEntity:()MTAdditions predicate:propertiesToFetch:batchSize:;
- (uint64_t)objectsInEntity:()MTAdditions predicate:propertiesToFetch:limit:;
- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:;
- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:returnsObjectsAsFaults:;
- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:returnsObjectsAsFaults:limit:;
- (uint64_t)saveInCurrentBlock;
- (void)batchDeleteObjectsInEntity:()MTAdditions predicate:;
- (void)performBlockAndWaitWithSave:()MTAdditions;
@end

@implementation NSManagedObjectContext(MTAdditions)

- (uint64_t)objectForUuid:()MTAdditions entityName:
{
  return [a1 objectForUuid:a3 entityName:a4 returnsObjectAsFault:0];
}

- (void)performBlockAndWaitWithSave:()MTAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__NSManagedObjectContext_MTAdditions__performBlockAndWaitWithSave___block_invoke;
  v6[3] = &unk_1E5E61518;
  v6[4] = a1;
  id v7 = v4;
  id v5 = v4;
  [a1 performBlockAndWait:v6];
}

- (id)_objectsInEntity:()MTAdditions predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:propertiesToFetch:batchSize:
{
  id v15 = a5;
  id v16 = a9;
  v17 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[[v17 alloc] initWithEntityName:v19];

  [v20 setPredicate:v18];
  [v20 setResultType:a6];
  if (v15)
  {
    [v20 setSortDescriptors:v15];
  }
  else
  {
    v21 = [MEMORY[0x1E4F1C978] array];
    [v20 setSortDescriptors:v21];
  }
  [v20 setFetchLimit:a8];
  [v20 setFetchBatchSize:a10];
  if ([v16 count]) {
    [v20 setPropertiesToFetch:v16];
  }
  if (!a6) {
    [v20 setReturnsObjectsAsFaults:a7];
  }
  id v27 = 0;
  v22 = [a1 executeFetchRequest:v20 error:&v27];
  id v23 = v27;
  v24 = v23;
  if (!v22) {
    [v23 logAndThrow:1];
  }

  return v22;
}

- (id)objectForUuid:()MTAdditions entityName:returnsObjectAsFault:
{
  v8 = (void *)MEMORY[0x1E4F1C0D0];
  id v9 = a3;
  v10 = [v8 fetchRequestWithEntityName:a4];
  v11 = [a1 _predicateForUuid:v9];

  [v10 setPredicate:v11];
  [v10 setReturnsObjectsAsFaults:a5];
  [v10 setFetchLimit:1];
  id v16 = 0;
  v12 = [a1 executeFetchRequest:v10 error:&v16];
  id v13 = v16;
  v14 = [v12 firstObject];

  [v13 logAndThrow:0];
  return v14;
}

- (uint64_t)_predicateForUuid:()MTAdditions
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid = %@", a3];
}

- (uint64_t)objectDictionariesInEntity:()MTAdditions predicate:sortDescriptors:propertiesToFetch:includeObjectId:
{
  LOBYTE(v8) = 0;
  return [a1 objectDictionariesInEntity:a3 predicate:a4 sortDescriptors:a5 propertiesToFetch:a6 includeObjectId:a7 limit:0 distinct:v8 groupBy:0];
}

- (id)objectDictionariesInEntity:()MTAdditions predicate:sortDescriptors:propertiesToFetch:includeObjectId:limit:distinct:groupBy:
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a10;
  if (a7)
  {
    v21 = objc_opt_new();
    [v21 setName:@"objectID"];
    v22 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    [v21 setExpression:v22];

    [v21 setExpressionResultType:2000];
    uint64_t v23 = [v19 arrayByAddingObject:v21];

    id v19 = (id)v23;
  }
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:v16];
  [v24 setPredicate:v17];
  if (v18) {
    id v25 = v18;
  }
  else {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
  }
  [v24 setSortDescriptors:v25];
  [v24 setPropertiesToFetch:v19];
  [v24 setFetchLimit:a8];
  [v24 setResultType:2];
  [v24 setReturnsDistinctResults:a9];
  if (v20) {
    [v24 setPropertiesToGroupBy:v20];
  }
  id v30 = 0;
  v26 = [a1 executeFetchRequest:v24 error:&v30];
  id v27 = v30;
  v28 = v27;
  if (!v26) {
    [v27 logAndThrow:1];
  }

  return v26;
}

- (uint64_t)_objectsInEntity:()MTAdditions predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:
{
  return objc_msgSend(a1, "_objectsInEntity:predicate:sortDescriptors:resultType:returnsObjectsAsFaults:limit:propertiesToFetch:batchSize:", 0, 0);
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:
{
  return [a1 _objectsInEntity:a3 predicate:a4 sortDescriptors:a5 resultType:0 returnsObjectsAsFaults:0 limit:0];
}

- (uint64_t)saveInCurrentBlock
{
  if (![a1 hasChanges])
  {
    id v4 = 0;
    goto LABEL_5;
  }
  id v7 = 0;
  char v2 = [a1 save:&v7];
  id v3 = v7;
  id v4 = v3;
  if (v2)
  {
LABEL_5:
    uint64_t v5 = 1;
    goto LABEL_6;
  }
  [v3 logAndThrow:1 printStackTrace:1];
  uint64_t v5 = 0;
LABEL_6:

  return v5;
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:returnsObjectsAsFaults:limit:
{
  return [a1 _objectsInEntity:a3 predicate:a4 sortDescriptors:a5 resultType:0 returnsObjectsAsFaults:a6 limit:a7];
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:sortDescriptors:returnsObjectsAsFaults:
{
  return [a1 _objectsInEntity:a3 predicate:a4 sortDescriptors:a5 resultType:0 returnsObjectsAsFaults:a6 limit:0];
}

- (id)executeFetchRequest:()MTAdditions
{
  id v7 = 0;
  id v3 = [a1 executeFetchRequest:a3 error:&v7];
  id v4 = v7;
  uint64_t v5 = v4;
  if (v4) {
    [v4 logAndThrow:1];
  }

  return v3;
}

- (id)objectInEntity:()MTAdditions predicate:
{
  id v4 = [a1 _objectsInEntity:a3 predicate:a4 sortDescriptors:MEMORY[0x1E4F1CBF0] resultType:0 returnsObjectsAsFaults:0 limit:1];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:propertiesToFetch:batchSize:
{
  return [a1 _objectsInEntity:a3 predicate:a4 sortDescriptors:MEMORY[0x1E4F1CBF0] resultType:0 returnsObjectsAsFaults:1 limit:0 propertiesToFetch:a5 batchSize:a6];
}

- (uint64_t)objectsInEntity:()MTAdditions predicate:propertiesToFetch:limit:
{
  return [a1 _objectsInEntity:a3 predicate:a4 sortDescriptors:MEMORY[0x1E4F1CBF0] resultType:0 returnsObjectsAsFaults:1 limit:a6 propertiesToFetch:a5 batchSize:0];
}

- (uint64_t)objectDictionaryForUuid:()MTAdditions entityName:
{
  return [a1 objectDictionaryForUuid:a3 propertiesToFetch:0 entityName:a4];
}

- (id)objectDictionaryForUuid:()MTAdditions propertiesToFetch:entityName:
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 _predicateForUuid:a3];
  v11 = [a1 objectDictionariesInEntity:v8 predicate:v10 sortDescriptors:0 propertiesToFetch:v9 includeObjectId:0];

  v12 = [v11 lastObject];

  return v12;
}

- (id)valueForProperty:()MTAdditions objectUuid:entityName:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    v15[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12 = [a1 objectDictionaryForUuid:v9 propertiesToFetch:v11 entityName:v10];

    id v13 = [v12 objectForKeyedSubscript:v8];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)objectDictionaryForUuid:()MTAdditions entityName:byAddingComputedProperties:toFetchedObjectDictionary:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v24 = a4;
  id v11 = a5;
  id v26 = a6;
  if (![v10 length])
  {
    v12 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC9D5000, v12, OS_LOG_TYPE_ERROR, "Episode Uuid expected but is missing", buf, 2u);
    }
  }
  if (objc_msgSend(v10, "length", v24) && objc_msgSend(v11, "count"))
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v14 = [a1 objectForUuid:v10 entityName:v25];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v20 = [v14 valueForKeyPath:v19];
          if (v20) {
            [v13 setObject:v20 forKey:v19];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }

    if ([v13 count])
    {
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count") + objc_msgSend(v26, "count"));
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      [v21 addEntriesFromDictionary:v26];
      [v21 addEntriesFromDictionary:v13];
    }
    else
    {
      id v21 = v26;
    }

    v22 = v26;
  }
  else
  {
    v22 = v26;
    id v21 = v26;
  }

  return v21;
}

- (uint64_t)countOfObjectsInEntity:()MTAdditions predicate:
{
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = [v6 fetchRequestWithEntityName:a3];
  [v8 setPredicate:v7];

  [v8 setReturnsDistinctResults:1];
  [v8 setPropertiesToFetch:&unk_1F03D88E0];
  id v12 = 0;
  uint64_t v9 = [a1 countForFetchRequest:v8 error:&v12];
  id v10 = v12;
  [v10 logAndThrow:1];

  return v9;
}

- (BOOL)hasAnyObjectsInEntity:()MTAdditions satisfyingPredicate:
{
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = [v6 fetchRequestWithEntityName:a3];
  [v8 setIncludesPropertyValues:0];
  [v8 setIncludesSubentities:0];
  [v8 setFetchLimit:1];
  [v8 setPredicate:v7];

  id v12 = 0;
  uint64_t v9 = [a1 countForFetchRequest:v8 error:&v12];
  id v10 = v12;
  [v10 logAndThrow:1];

  return v9 != 0;
}

- (id)titlesOfObjectsInEntity:()MTAdditions predicate:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v6];
  [v8 setPredicate:v7];
  uint64_t v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:0];
  v23[0] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  [v8 setSortDescriptors:v10];

  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__1;
  id v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__NSManagedObjectContext_MTAdditions__titlesOfObjectsInEntity_predicate___block_invoke;
  v14[3] = &unk_1E5E61540;
  uint64_t v16 = &v17;
  v14[4] = a1;
  id v11 = v8;
  id v15 = v11;
  [a1 performBlockAndWait:v14];
  id v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

- (void)batchDeleteObjectsInEntity:()MTAdditions predicate:
{
  id v6 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = a3;
  id v11 = (id)[[v6 alloc] initWithEntityName:v8];

  [v11 setPredicate:v7];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v11];
  id v10 = (id)[a1 executeRequest:v9 error:0];
}

@end