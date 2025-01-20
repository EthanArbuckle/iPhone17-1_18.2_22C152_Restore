@interface BKUserSortOrderManager
+ (BOOL)resortAscendingSortKeyedObjects:(id)a3;
+ (BOOL)resortDescendingSortKeyedObjects:(id)a3;
+ (id)nextSortKeyForCollection:(id)a3;
+ (void)resetDescendingSortKeyedObjects:(id)a3;
+ (void)saveSortedBooksArray:(id)a3 inCollection:(id)a4 inLibrary:(id)a5;
+ (void)saveSortedCollectionsArray:(id)a3 inLibraryManager:(id)a4;
@end

@implementation BKUserSortOrderManager

+ (id)nextSortKeyForCollection:(id)a3
{
  v3 = [a3 maxSortKey];
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:((char *)[v3 longLongValue]) + 10000];

  return v4;
}

+ (void)saveSortedBooksArray:(id)a3 inCollection:(id)a4 inLibrary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage();
  }
  v24 = v8;
  v10 = +[NSPredicate predicateWithFormat:@"collection == %@", v8];
  v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v16) collectionMembers];
        v18 = [v17 filteredSetUsingPredicate:v10];
        v19 = [v18 anyObject];

        if (v19) {
          [v11 addObject:v19];
        }

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  if (+[BKUserSortOrderManager resortDescendingSortKeyedObjects:v11])
  {
    v20 = [v9 uiChildContext];
    unsigned int v21 = [v20 hasChanges];

    if (v21)
    {
      v22 = [v9 uiChildContext];
      [v22 setSaveContext:2];

      v23 = [v9 uiChildContext];
      [v23 save:0];
    }
  }
}

+ (void)saveSortedCollectionsArray:(id)a3 inLibraryManager:(id)a4
{
  id v5 = a4;
  [a3 valueForKey:@"collectionID"];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_51938;
  v8[3] = &unk_D18D8;
  id v9 = v5;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  id v7 = v5;
  [v7 performNamed:@"saveSortedCollectionsArray" workerQueueBlock:v8];
}

+ (BOOL)resortAscendingSortKeyedObjects:(id)a3
{
  v3 = [a3 reverseObjectEnumerator];
  id v4 = [v3 allObjects];

  LOBYTE(v3) = +[BKUserSortOrderManager resortDescendingSortKeyedObjects:v4];
  return (char)v3;
}

+ (void)resetDescendingSortKeyedObjects:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 10000 * (void)v4;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        id v12 = objc_alloc((Class)NSNumber);
        id v13 = [v12 initWithLongLong:v8, v14];
        [v11 setValue:v13 forKey:@"sortKey"];
        v8 -= 10000;

        id v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

+ (BOOL)resortDescendingSortKeyedObjects:(id)a3
{
  id v3 = a3;
  v40 = (char *)[v3 count];
  v37 = v40 - 1;
  if ((uint64_t)v40 >= 1)
  {
    char v38 = 0;
    id v4 = 0;
    id v5 = 0;
    id v6 = 0;
    id v7 = 0;
    BOOL v8 = 1;
    id v39 = v3;
    while (1)
    {
      uint64_t v9 = v7;
      id v7 = v6;

      id v6 = v5;
      id v5 = [v3 objectAtIndex:v4];

      if (v6)
      {
        if (!v7 || !v5)
        {
          if (!v5) {
            goto LABEL_24;
          }
          long long v14 = [v6 valueForKey:@"sortKey"];
          id v15 = [v14 longLongValue];
          long long v16 = [v5 valueForKey:@"sortKey"];
          id v17 = [v16 longLongValue];

          BOOL v18 = (uint64_t)v15 <= (uint64_t)v17;
          id v3 = v39;
          if (!v18) {
            goto LABEL_24;
          }
          v19 = [v5 valueForKey:@"sortKey"];
          v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v19 longLongValue] + 5000);
          unsigned int v21 = v6;
LABEL_22:
          [v21 setValue:v20 forKey:@"sortKey" v37];

          goto LABEL_23;
        }
        id v10 = [v6 valueForKey:@"sortKey"];
        id v11 = [v10 longLongValue];
        id v12 = [v5 valueForKey:@"sortKey"];
        id v13 = [v12 longLongValue];

        if ((uint64_t)v11 <= (uint64_t)v13)
        {
          v22 = [v7 valueForKey:@"sortKey"];
          v23 = [v22 longLongValue];
          v24 = [v5 valueForKey:@"sortKey"];
          long long v25 = [v24 longLongValue];
          uint64_t v26 = v23 - v25;

          if (v23 - v25 < 2)
          {
            id v3 = v39;
            if (v23 == v25 || v26 == 1)
            {
LABEL_25:

              char v34 = v38;
              goto LABEL_27;
            }
            if (v37 != v4)
            {
              if (v26 > -2) {
                goto LABEL_25;
              }
              v30 = [v7 valueForKey:@"sortKey"];
              uint64_t v31 = (uint64_t)[v30 longLongValue];

              if (v31 <= -v26) {
                goto LABEL_25;
              }
              v32 = [v7 valueForKey:@"sortKey"];
              v33 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v32 longLongValue] - ((unint64_t)-v26 >> 1));
              [v6 setValue:v33 forKey:@"sortKey"];

              v19 = [v7 valueForKey:@"sortKey"];
              v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v19 longLongValue] + v26);
              unsigned int v21 = v5;
              goto LABEL_22;
            }
            long long v28 = [v6 valueForKey:@"sortKey"];
            uint64_t v29 = (uint64_t)[v28 longLongValue];

            if (v29 < 2) {
              goto LABEL_25;
            }
            v19 = +[NSNumber numberWithLongLong:(unint64_t)v29 >> 1];
            [v5 setValue:v19 forKey:@"sortKey"];
          }
          else
          {
            v19 = [v5 valueForKey:@"sortKey"];
            long long v27 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v19 longLongValue] + ((unint64_t)v26 >> 1));
            [v6 setValue:v27 forKey:@"sortKey"];

            id v3 = v39;
          }
LABEL_23:

          char v38 = 1;
          goto LABEL_24;
        }
        id v3 = v39;
      }
LABEL_24:
      BOOL v8 = (uint64_t)++v4 < (uint64_t)v40;
      if (v40 == v4) {
        goto LABEL_25;
      }
    }
  }
  char v34 = 0;
  BOOL v8 = 0;
LABEL_27:
  v35 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v42 = v34 & 1;
    __int16 v43 = 1024;
    int v44 = v8;
    _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "SortOrderManager - changes: %{BOOL}d, collision: %{BOOL}d", buf, 0xEu);
  }

  if (v8)
  {
    +[BKUserSortOrderManager resetDescendingSortKeyedObjects:v3];
    char v34 = 1;
  }

  return v34 & 1;
}

@end