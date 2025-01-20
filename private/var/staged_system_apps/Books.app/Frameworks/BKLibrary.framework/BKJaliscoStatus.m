@interface BKJaliscoStatus
+ (BOOL)addHidden:(id)a3 inMOC:(id)a4;
+ (BOOL)addLocal:(id)a3 inMOC:(id)a4;
+ (BOOL)addStatus:(id)a3 forStoreIds:(id)a4 inMOC:(id)a5;
+ (BOOL)hasStatusValues:(id)a3;
+ (BOOL)mergeLocalAssets:(id)a3 inMOC:(id)a4;
+ (BOOL)mergeSerializedHidden:(id)a3 inMOC:(id)a4;
+ (BOOL)mergeSerializedLocal:(id)a3 inMOC:(id)a4;
+ (BOOL)mergedSerializedStatus:(id)a3 summaries:(id)a4 inMOC:(id)a5;
+ (id)allHiddenStoreIds:(id)a3;
+ (id)allLocalStoreIds:(id)a3;
+ (id)allStoreIdsForStatus:(id)a3 inMOC:(id)a4;
+ (id)serializeAllHidden:(id)a3;
+ (id)serializeAllLocal:(id)a3;
+ (id)serializeAllStatus:(id)a3 inMOC:(id)a4;
+ (id)statusValueHidden;
+ (id)statusValueLocal;
+ (void)dsidChangeCleanup:(id)a3;
@end

@implementation BKJaliscoStatus

+ (id)statusValueHidden
{
  return @"hidden";
}

+ (id)statusValueLocal
{
  return @"local";
}

+ (id)allStoreIdsForStatus:(id)a3 inMOC:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v23 = 0;
    goto LABEL_27;
  }
  v7 = +[NSPredicate predicateWithValue:1];
  v8 = +[NSEntityDescription entityForName:@"BKJaliscoStatus" inManagedObjectContext:v6];
  id v9 = objc_alloc_init((Class)NSFetchRequest);
  [v9 setEntity:v8];
  [v9 setPredicate:v7];
  [v9 setReturnsObjectsAsFaults:0];
  id v34 = 0;
  v10 = [v6 executeFetchRequest:v9 error:&v34];
  v11 = (char *)v34;
  if ([v10 count])
  {
    v26 = v11;
    v28 = v8;
    v29 = v7;
    v12 = +[NSMutableSet set];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v27 = v10;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v19 = [v18 status];
          uint64_t v20 = [v18 storeId];
          v21 = (void *)v20;
          if (v19) {
            BOOL v22 = v20 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (!v22)
          {
            if ([v19 isEqualToString:v5]) {
              [v12 addObject:v21];
            }
            else {
              [v12 removeObject:v21];
            }
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }
      while (v15);
    }

    id v23 = [v12 copy];
    v8 = v28;
    v7 = v29;
    v11 = v26;
    v10 = v27;
  }
  else
  {
    if (!v11)
    {
      id v23 = 0;
      goto LABEL_26;
    }
    v24 = BCIMLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "+[BKJaliscoStatus allStoreIdsForStatus:inMOC:]";
      __int16 v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
      __int16 v39 = 1024;
      int v40 = 75;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v12 = BCIMLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "@\"Fetch Error: %@\"", buf, 0xCu);
    }
    id v23 = 0;
  }

LABEL_26:
LABEL_27:

  return v23;
}

+ (id)allHiddenStoreIds:(id)a3
{
  id v3 = a3;
  v4 = +[BKJaliscoStatus statusValueHidden];
  id v5 = +[BKJaliscoStatus allStoreIdsForStatus:v4 inMOC:v3];

  return v5;
}

+ (id)allLocalStoreIds:(id)a3
{
  id v3 = a3;
  v4 = +[BKJaliscoStatus statusValueLocal];
  id v5 = +[BKJaliscoStatus allStoreIdsForStatus:v4 inMOC:v3];

  return v5;
}

+ (id)serializeAllStatus:(id)a3 inMOC:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = +[NSPredicate predicateWithFormat:@"%K == %@", @"status", a3];
    v7 = +[NSEntityDescription entityForName:@"BKJaliscoStatus" inManagedObjectContext:v5];
    id v8 = objc_alloc_init((Class)NSFetchRequest);
    [v8 setEntity:v7];
    id v9 = +[NSArray arrayWithObjects:@"storeId", @"timeIntervalSinceReferenceDate", 0];
    [v8 setPropertiesToFetch:v9];

    [v8 setResultType:2];
    [v8 setPredicate:v6];
    id v16 = 0;
    v10 = [v5 executeFetchRequest:v8 error:&v16];

    v11 = (char *)v16;
    v12 = v11;
    if (!v10 && v11)
    {
      id v13 = BCIMLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "+[BKJaliscoStatus serializeAllStatus:inMOC:]";
        __int16 v19 = 2080;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
        __int16 v21 = 1024;
        int v22 = 110;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      id v14 = BCIMLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "@\"Fetch Error: %@\"", buf, 0xCu);
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)serializeAllHidden:(id)a3
{
  id v3 = a3;
  v4 = +[BKJaliscoStatus statusValueHidden];
  id v5 = +[BKJaliscoStatus serializeAllStatus:v4 inMOC:v3];

  return v5;
}

+ (id)serializeAllLocal:(id)a3
{
  id v3 = a3;
  v4 = +[BKJaliscoStatus statusValueLocal];
  id v5 = +[BKJaliscoStatus serializeAllStatus:v4 inMOC:v3];

  return v5;
}

+ (BOOL)addStatus:(id)a3 forStoreIds:(id)a4 inMOC:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && [v7 length] && objc_msgSend(v8, "count"))
  {
    v51 = +[NSDate date];
    [v51 timeIntervalSinceReferenceDate];
    v55 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v11];
    v12 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"storeId", v8];
    id v13 = +[NSEntityDescription entityForName:@"BKJaliscoStatus" inManagedObjectContext:v9];
    id v14 = objc_alloc_init((Class)NSFetchRequest);
    [v14 setEntity:v13];
    [v14 setPredicate:v12];
    [v14 setReturnsObjectsAsFaults:0];
    id v65 = 0;
    id v15 = [v9 executeFetchRequest:v14 error:&v65];
    id v16 = v65;
    v50 = v14;
    if (v15)
    {
      v48 = v13;
      v49 = v16;
      v52 = [v15 valueForKey:@"storeId"];
      id v17 = [v52 count];
      id v54 = v9;
      v46 = v10;
      if (v17 <= [v8 count])
      {
        char v25 = 0;
        uint64_t v24 = (uint64_t)v52;
      }
      else
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v18 = v15;
        id v19 = [v18 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v62;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v62 != v21) {
                objc_enumerationMutation(v18);
              }
              [v9 deleteObject:*(void *)(*((void *)&v61 + 1) + 8 * i)];
            }
            id v20 = [v18 countByEnumeratingWithState:&v61 objects:v73 count:16];
          }
          while (v20);
        }

        id v60 = v49;
        id v15 = [v9 executeFetchRequest:v14 error:&v60];
        id v23 = v60;

        uint64_t v24 = [v15 valueForKey:@"storeId"];

        char v25 = 1;
        v49 = v23;
      }
      v45 = v12;
      v44 = v15;
      v53 = (void *)v24;
      id v31 = [objc_alloc((Class)NSDictionary) initWithObjects:v15 forKeys:v24];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v47 = v8;
      id v32 = v8;
      id v33 = [v32 countByEnumeratingWithState:&v56 objects:v72 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v57;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v57 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v56 + 1) + 8 * (void)j);
            v38 = [v31 objectForKey:v37];
            __int16 v39 = v38;
            if (v38)
            {
              int v40 = [v38 status];
              unsigned __int8 v41 = [v40 isEqualToString:v7];

              if (v41) {
                goto LABEL_32;
              }
              [v39 setStatus:v7];
              [v39 setTimeIntervalSinceReferenceDate:v55];
            }
            else
            {
              v42 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKJaliscoStatus" inManagedObjectContext:v54];
              [v42 setStoreId:v37];
              [v42 setStatus:v7];
              [v42 setTimeIntervalSinceReferenceDate:v55];
            }
            char v25 = 1;
LABEL_32:
          }
          id v34 = [v32 countByEnumeratingWithState:&v56 objects:v72 count:16];
        }
        while (v34);
      }

      v10 = v46;
      id v8 = v47;
      id v9 = v54;
      v29 = v51;
      long long v30 = v44;
      v12 = v45;
      id v13 = v48;
      v27 = (char *)v49;
    }
    else
    {
      if (!v16)
      {
        char v25 = 0;
        v29 = v51;
        goto LABEL_36;
      }
      v27 = (char *)v16;
      v28 = BCIMLog();
      v29 = v51;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v67 = "+[BKJaliscoStatus addStatus:forStoreIds:inMOC:]";
        __int16 v68 = 2080;
        v69 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
        __int16 v70 = 1024;
        int v71 = 188;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      long long v30 = BCIMLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v27;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "@\"Fetch Error: %@\"", buf, 0xCu);
      }
      char v25 = 0;
    }

LABEL_36:
    BOOL v26 = v25 & 1;
    goto LABEL_37;
  }
  BOOL v26 = 0;
LABEL_37:

  return v26;
}

+ (BOOL)addLocal:(id)a3 inMOC:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKJaliscoStatus statusValueLocal];
  BOOL v8 = +[BKJaliscoStatus addStatus:v7 forStoreIds:v6 inMOC:v5];

  return v8;
}

+ (BOOL)addHidden:(id)a3 inMOC:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKJaliscoStatus statusValueHidden];
  BOOL v8 = +[BKJaliscoStatus addStatus:v7 forStoreIds:v6 inMOC:v5];

  return v8;
}

+ (BOOL)mergedSerializedStatus:(id)a3 summaries:(id)a4 inMOC:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v47 = a5;
  if (v47 && [v7 length] && objc_msgSend(v8, "count"))
  {
    v10 = [v8 valueForKey:@"storeId"];
    double v11 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"storeId", v10];
    v12 = +[NSEntityDescription entityForName:@"BKJaliscoStatus" inManagedObjectContext:v47];
    id v13 = objc_alloc_init((Class)NSFetchRequest);
    [v13 setEntity:v12];
    [v13 setPredicate:v11];
    [v13 setReturnsObjectsAsFaults:0];
    id v55 = 0;
    id v14 = [v47 executeFetchRequest:v13 error:&v55];
    id v15 = v55;
    id v16 = v15;
    if (v14)
    {
      id v39 = v15;
      id v41 = v13;
      v42 = v12;
      v43 = v11;
      v44 = v10;
      v45 = v9;
      [v14 valueForKey:@"storeId"];
      v38 = int v40 = v14;
      id v17 = [objc_alloc((Class)NSDictionary) initWithObjects:v14 forKeys:v38];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v46 = v8;
      id obj = v8;
      id v50 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      uint64_t v18 = 0;
      if (!v50) {
        goto LABEL_18;
      }
      uint64_t v19 = *(void *)v52;
      while (1)
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v52 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          int v22 = [v21 objectForKey:@"storeId"];
          id v23 = [v21 objectForKey:@"timeIntervalSinceReferenceDate"];
          uint64_t v24 = [v17 objectForKey:v22];
          char v25 = v24;
          if (!v24)
          {
            uint64_t v35 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKJaliscoStatus" inManagedObjectContext:v47];
            [v35 setStoreId:v22];
            [v35 setStatus:v7];
            [v35 setTimeIntervalSinceReferenceDate:v23];

            goto LABEL_15;
          }
          BOOL v26 = [v24 status];
          unsigned __int8 v27 = [v26 isEqualToString:v7];

          if ((v27 & 1) == 0)
          {
            v28 = [v25 timeIntervalSinceReferenceDate];
            id v49 = [v28 unsignedLongValue];
            uint64_t v29 = v19;
            uint64_t v30 = v18;
            id v31 = v17;
            id v32 = v7;
            id v33 = [v23 unsignedLongValue];

            BOOL v34 = v49 >= v33;
            id v7 = v32;
            id v17 = v31;
            uint64_t v18 = v30;
            uint64_t v19 = v29;
            if (!v34)
            {
              [v25 setStatus:v7];
              [v25 setTimeIntervalSinceReferenceDate:v23];
LABEL_15:
              uint64_t v18 = 1;
            }
          }
        }
        id v50 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (!v50)
        {
LABEL_18:

          id v9 = v45;
          id v8 = v46;
          double v11 = v43;
          v10 = v44;
          id v13 = v41;
          v12 = v42;
          id v16 = v39;
          id v14 = v40;
          goto LABEL_23;
        }
      }
    }
    if (v15) {
      NSLog(@"Fetch Error: %@", v15);
    }
    LOBYTE(v18) = 0;
LABEL_23:

    BOOL v36 = v18 & 1;
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

+ (BOOL)mergeSerializedLocal:(id)a3 inMOC:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKJaliscoStatus statusValueLocal];
  BOOL v8 = +[BKJaliscoStatus mergedSerializedStatus:v7 summaries:v6 inMOC:v5];

  return v8;
}

+ (BOOL)mergeSerializedHidden:(id)a3 inMOC:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BKJaliscoStatus statusValueHidden];
  BOOL v8 = +[BKJaliscoStatus mergedSerializedStatus:v7 summaries:v6 inMOC:v5];

  return v8;
}

+ (BOOL)hasStatusValues:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = +[NSEntityDescription entityForName:@"BKJaliscoStatus" inManagedObjectContext:v3];
    id v5 = objc_alloc_init((Class)NSFetchRequest);
    [v5 setEntity:v4];
    id v6 = +[NSPredicate predicateWithValue:1];
    [v5 setPredicate:v6];

    id v11 = 0;
    id v7 = [v3 countForFetchRequest:v5 error:&v11];

    id v8 = v11;
    id v9 = v8;
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v8) {
        NSLog(@"Fetch Error: %@", v8);
      }
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7 != 0;
}

+ (void)dsidChangeCleanup:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = +[NSPredicate predicateWithValue:1];
    id v6 = +[NSEntityDescription entityForName:@"BKJaliscoStatus" inManagedObjectContext:v3];
    id v7 = objc_alloc_init((Class)NSFetchRequest);
    [v7 setEntity:v6];
    [v7 setPredicate:v5];
    id v20 = 0;
    id v8 = [v3 executeFetchRequest:v7 error:&v20];
    id v9 = v20;
    if ([v8 count])
    {
      id v15 = v4;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = v8;
      id v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v17;
        do
        {
          id v14 = 0;
          do
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v10);
            }
            [v3 deleteObject:*(void *)(*((void *)&v16 + 1) + 8 * (void)v14)];
            id v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v12);
      }

      v4 = v15;
    }
  }
}

+ (BOOL)mergeLocalAssets:(id)a3 inMOC:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v55 = +[BKJaliscoStatus allLocalStoreIds:v6];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v66;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v66 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v15 = [v14 storeID];
        if ((uint64_t)[v15 longLongValue] >= 1
          && ([v55 containsObject:v15] & 1) == 0)
        {
          [v7 addObject:v15];
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    id v16 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKJaliscoStatus"];
    long long v17 = [a1 statusValueLocal];
    long long v18 = +[NSPredicate predicateWithFormat:@"%K != %@ AND %K IN %@", @"status", v17, @"storeId", v7];
    [v16 setPredicate:v18];

    [v16 setReturnsObjectsAsFaults:0];
    id v64 = 0;
    long long v19 = [v6 executeFetchRequest:v16 error:&v64];
    id v20 = (char *)v64;
    uint64_t v21 = v20;
    id v52 = v9;
    if (v19)
    {
      id v46 = v20;
      id v48 = v16;
      id v50 = v6;
      long long v51 = v8;
      int v22 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v19 count]];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v47 = v19;
      id v23 = v19;
      id v24 = [v23 countByEnumeratingWithState:&v60 objects:v76 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v61;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v61 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
            uint64_t v29 = [v28 storeId];
            if ([v29 length]) {
              [v22 setObject:v28 forKeyedSubscript:v29];
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v60 objects:v76 count:16];
        }
        while (v25);
      }
      id v49 = v7;

      id v30 = objc_alloc_init((Class)NSMutableArray);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obj = v51;
      id v31 = [obj countByEnumeratingWithState:&v56 objects:v75 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v57;
        do
        {
          for (k = 0; k != v32; k = (char *)k + 1)
          {
            if (*(void *)v57 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v35 = *(void **)(*((void *)&v56 + 1) + 8 * (void)k);
            BOOL v36 = [v35 storeID];
            uint64_t v37 = [v22 objectForKeyedSubscript:v36];
            v38 = v37;
            if (v37)
            {
              id v39 = [v37 timeIntervalSinceReferenceDate];
              int v40 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", (double)(uint64_t)[v39 longLongValue]);

              id v41 = [v35 dataSourceInsertionDate];
              v42 = v41;
              if (!v41 || [v41 compare:v40] == (char *)&dword_0 + 1) {
                [v30 addObject:v36];
              }
            }
            else
            {
              [v30 addObject:v36];
            }
          }
          id v32 = [obj countByEnumeratingWithState:&v56 objects:v75 count:16];
        }
        while (v32);
      }

      if ([v30 count])
      {
        id v6 = v50;
        unsigned __int8 v43 = [(id)objc_opt_class() addLocal:v30 inMOC:v50];
      }
      else
      {
        unsigned __int8 v43 = 0;
        id v6 = v50;
      }
      id v16 = v48;
      id v7 = v49;
      uint64_t v21 = v46;
      long long v19 = v47;

      id v8 = v51;
    }
    else
    {
      v44 = BCIMLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v70 = "+[BKJaliscoStatus mergeLocalAssets:inMOC:]";
        __int16 v71 = 2080;
        v72 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKJaliscoStatus.m";
        __int16 v73 = 1024;
        int v74 = 392;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      int v22 = BCIMLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v70 = v21;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "@\"Failed to get jalico statuses {%@}\"", buf, 0xCu);
      }
      unsigned __int8 v43 = 0;
    }

    id v9 = v52;
  }
  else
  {
    unsigned __int8 v43 = 0;
  }

  return v43;
}

@end