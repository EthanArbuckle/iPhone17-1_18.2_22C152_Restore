@interface GKListCacheObject
+ (Class)entryClass;
+ (id)relationshipKeyPathsForPrefetch;
- (id)entriesPassingTest:(id)a3;
- (id)entryPassingTest:(id)a3;
- (id)findEntry:(id)a3;
- (id)internalRepresentation;
- (void)removeEntriesMatchingPredicate:(id)a3;
- (void)reorderEntry:(id)a3 toIndex:(int64_t)a4;
- (void)updateEntriesWithRepresentations:(id)a3 entryForRepresentation:(id)a4 reuseEntriesByIndex:(BOOL)a5;
- (void)updateSeed;
@end

@implementation GKListCacheObject

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

+ (id)relationshipKeyPathsForPrefetch
{
  return +[NSArray arrayWithObjects:@"entries", 0];
}

- (void)updateSeed
{
  id v4 = +[NSUUID UUID];
  v3 = [v4 UUIDString];
  [(GKListCacheObject *)self setSeed:v3];
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKListCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKListCacheObject internalRepresentation]", [v7 UTF8String], 2273);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKListCacheObject *)self entries];
  v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(GKListCacheObject *)self entries];
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) internalRepresentation];
        if (v16) {
          [v10 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (void)reorderEntry:(id)a3 toIndex:(int64_t)a4
{
  id v14 = a3;
  v6 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = +[NSThread callStackSymbols];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKListCacheObject reorderEntry:toIndex:]", v7);
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v10 = [v9 lastPathComponent];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v8, "-[GKListCacheObject reorderEntry:toIndex:]", [v10 UTF8String], 2286);

    +[NSException raise:@"GameKit Exception", @"%@", v11 format];
  }

  id v12 = [v14 list];

  if (v12 == self)
  {
    id v13 = [(GKListCacheObject *)self mutableOrderedSetValueForKey:@"entries"];
    [v13 insertObject:v14 atIndex:a4];
    [(GKListCacheObject *)self updateSeed];
  }
}

- (void)removeEntriesMatchingPredicate:(id)a3
{
  id v14 = a3;
  id v4 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v5 = +[NSThread callStackSymbols];
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKListCacheObject removeEntriesMatchingPredicate:]", v5);
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v8 = [v7 lastPathComponent];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v6, "-[GKListCacheObject removeEntriesMatchingPredicate:]", [v8 UTF8String], 2297);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }

  id v10 = [(GKListCacheObject *)self entries];
  v11 = [v10 array];
  id v12 = [v11 filteredArrayUsingPredicate:v14];

  if ([v12 count])
  {
    id v13 = [(GKListCacheObject *)self managedObjectContext];
    [v13 _gkDeleteObjects:v12];

    [(GKListCacheObject *)self updateSeed];
  }
}

- (void)updateEntriesWithRepresentations:(id)a3 entryForRepresentation:(id)a4 reuseEntriesByIndex:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void (**)(id, void, void *))a4;
  id v10 = dispatch_get_current_queue();
  v44 = v8;
  v45 = self;
  if (dispatch_queue_get_specific(v10, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v11 = +[NSThread callStackSymbols];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]", v11);
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v14 = [v13 lastPathComponent];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v12, "-[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]", [v14 UTF8String], 2310);

    self = v45;
    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }
  v16 = [(GKListCacheObject *)self managedObjectContext];
  v48 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v8 count]);
  v17 = +[NSMapTable weakToWeakObjectsMapTable];
  if (v5)
  {
    long long v18 = [(GKListCacheObject *)self entries];
    long long v19 = (char *)[v18 count];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v8;
    id v20 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (!v20) {
      goto LABEL_26;
    }
    id v21 = v20;
    uint64_t v22 = 0;
    uint64_t v23 = *(void *)v58;
    v46 = v16;
    while (1)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v58 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        if ((char *)i + v22 >= v19)
        {
          v27 = v9[2](v9, *(void *)(*((void *)&v57 + 1) + 8 * i), v46);
          if (!v27) {
            goto LABEL_14;
          }
LABEL_13:
          [v48 addObject:v27];
          [v17 setObject:v25 forKey:v27];
          goto LABEL_14;
        }
        v26 = [(GKListCacheObject *)v45 entries];
        v27 = [v26 objectAtIndex:(char *)i + v22];

        if (v27) {
          goto LABEL_13;
        }
LABEL_14:
      }
      id v21 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      v22 += (uint64_t)i;
      v16 = v46;
      if (!v21) {
        goto LABEL_26;
      }
    }
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v28 = v8;
  id v29 = [v28 countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v54;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v54 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
        v34 = v9[2](v9, v33, v16);
        if (v34)
        {
          [v48 addObject:v34];
          [v17 setObject:v33 forKey:v34];
        }
      }
      id v30 = [v28 countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v30);
  }
LABEL_26:

  v35 = [(GKListCacheObject *)v45 entries];
  v36 = +[NSMutableOrderedSet orderedSetWithOrderedSet:v35];

  [v36 minusOrderedSet:v48];
  [(GKListCacheObject *)v45 setEntries:v48];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v37 = v48;
  id v38 = [v37 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v50;
    do
    {
      for (k = 0; k != v39; k = (char *)k + 1)
      {
        if (*(void *)v50 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v49 + 1) + 8 * (void)k);
        v43 = [v17 objectForKey:v42];
        [v42 updateWithServerRepresentation:v43];
      }
      id v39 = [v37 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v39);
  }

  if ([v36 count]) {
    [v16 _gkDeleteObjects:v36];
  }
  [(GKListCacheObject *)v45 updateSeed];
}

- (id)findEntry:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKListCacheObject findEntry:]", v6);
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKListCacheObject findEntry:]", [v9 UTF8String], 2366);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v11 = [(GKListCacheObject *)self entries];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000ECD00;
  v17[3] = &unk_1002DA080;
  id v12 = v4;
  id v18 = v12;
  id v13 = [v11 indexOfObjectPassingTest:v17];

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = 0;
  }
  else
  {
    v15 = [(GKListCacheObject *)self entries];
    id v14 = [v15 objectAtIndex:v13];
  }

  return v14;
}

- (id)entryPassingTest:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKListCacheObject entryPassingTest:]", v6);
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKListCacheObject entryPassingTest:]", [v9 UTF8String], 2384);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v11 = [(GKListCacheObject *)self entries];
  id v12 = [v11 indexOfObjectPassingTest:v4];

  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = 0;
  }
  else
  {
    id v14 = [(GKListCacheObject *)self entries];
    id v13 = [v14 objectAtIndex:v12];
  }

  return v13;
}

- (id)entriesPassingTest:(id)a3
{
  id v4 = a3;
  BOOL v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKListCacheObject entriesPassingTest:]", v6);
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKListCacheObject entriesPassingTest:]", [v9 UTF8String], 2395);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v11 = [(GKListCacheObject *)self entries];
  id v12 = [v11 indexesOfObjectsPassingTest:v4];

  if ([v12 count])
  {
    id v13 = [(GKListCacheObject *)self entries];
    id v14 = [v13 objectsAtIndexes:v12];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end