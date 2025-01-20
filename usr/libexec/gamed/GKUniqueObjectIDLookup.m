@interface GKUniqueObjectIDLookup
- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4;
- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4 predicate:(id)a5;
- (id)insertObjectsForServerRepresentations:(id)a3 context:(id)a4 newObject:(id)a5;
- (id)uniqueObjectsForKeys:(id)a3 context:(id)a4 newObject:(id)a5;
- (void)_populateWithContext:(id)a3;
- (void)dealloc;
@end

@implementation GKUniqueObjectIDLookup

- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4
{
  id v6 = a4;
  v7 = +[NSPredicate predicateWithValue:1];
  v8 = [(GKUniqueObjectIDLookup *)self initWithObjectClass:a3 context:v6 predicate:v7];

  return v8;
}

- (GKUniqueObjectIDLookup)initWithObjectClass:(Class)a3 context:(id)a4 predicate:(id)a5
{
  id v7 = a5;
  v8 = [(objc_class *)a3 uniqueAttributeName];
  if (v8)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = +[NSString stringWithFormat:@"Class %@ must define a attribute for uniquing.", a3];
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v18 = [v17 lastPathComponent];
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (uniqueKey != nil)\n[%s (%s:%d)]", v16, "-[GKUniqueObjectIDLookup initWithObjectClass:context:predicate:]", [v18 UTF8String], 57);

    +[NSException raise:@"GameKit Exception", @"%@", v19 format];
    if (v7) {
      goto LABEL_3;
    }
  }
  id v7 = +[NSPredicate predicateWithValue:1];
LABEL_3:
  v20.receiver = self;
  v20.super_class = (Class)GKUniqueObjectIDLookup;
  v9 = [(GKUniqueObjectIDLookup *)&v20 init];
  if (v9)
  {
    v10 = +[NSString stringWithFormat:@"%s.%@", class_getName(a3), v8];
    v11 = (GKThreadsafeDictionary *)[objc_alloc((Class)GKThreadsafeDictionary) initWithName:v10];
    lookup = v9->_lookup;
    v9->_lookup = v11;

    objc_storeStrong((id *)&v9->_predicate, v7);
    v9->_objectClass = a3;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(1);
    semaphore = v9->_semaphore;
    v9->_semaphore = (OS_dispatch_semaphore *)v13;
  }
  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKUniqueObjectIDLookup;
  [(GKUniqueObjectIDLookup *)&v4 dealloc];
}

- (void)_populateWithContext:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKUniqueObjectIDLookup _populateWithContext:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKUniqueObjectIDLookup _populateWithContext:]", [v9 UTF8String], 80);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v11 = [(objc_class *)self->_objectClass uniqueAttributeName];
  v12 = [(objc_class *)self->_objectClass fetchRequestForContext:v4];
  [v12 setPredicate:self->_predicate];
  [v12 setResultType:2];
  id v13 = objc_alloc_init((Class)NSExpressionDescription);
  [v13 setName:@"objectID"];
  v14 = +[NSExpression expressionForEvaluatedObject];
  [v13 setExpression:v14];

  [v13 setExpressionResultType:2000];
  v44[0] = v11;
  v44[1] = v13;
  v15 = +[NSArray arrayWithObjects:v44 count:2];
  [v12 setPropertiesToFetch:v15];

  [v12 setReturnsDistinctResults:1];
  id v42 = 0;
  v16 = [v4 executeFetchRequest:v12 error:&v42];
  id v17 = v42;
  if (v17)
  {
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000FB070();
    }
  }
  v33 = v17;
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKCacheObject.m", 100, "-[GKUniqueObjectIDLookup _populateWithContext:]");
  objc_super v20 = +[GKDispatchGroup dispatchGroupWithName:v19];

  id v21 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v16 count]];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000DFC74;
  v38[3] = &unk_1002D48B0;
  v38[4] = self;
  id v22 = v16;
  id v39 = v22;
  id v23 = v11;
  id v40 = v23;
  id v24 = v21;
  id v41 = v24;
  [v20 perform:v38];
  [v20 wait];
  if ([v24 count])
  {
    id v31 = v22;
    id v32 = v23;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v24;
    id v26 = [v25 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        v29 = 0;
        do
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [v4 objectWithID:*(void *)(*((void *)&v34 + 1) + 8 * (void)v29)];
          if (v30) {
            [v4 deleteObject:v30];
          }

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v27);
    }

    id v22 = v31;
    id v23 = v32;
  }
}

- (id)uniqueObjectsForKeys:(id)a3 context:(id)a4 newObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v49 = a5;
  if (!os_log_GKGeneral) {
    id v10 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB140();
  }
  v11 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v12 = +[NSThread callStackSymbols];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKUniqueObjectIDLookup uniqueObjectsForKeys:context:newObject:]", v12);
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v15 = [v14 lastPathComponent];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v13, "-[GKUniqueObjectIDLookup uniqueObjectsForKeys:context:newObject:]", [v15 UTF8String], 145);

    +[NSException raise:@"GameKit Exception", @"%@", v16 format];
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (GKAtomicCompareAndSwap32Barrier()) {
    [(GKUniqueObjectIDLookup *)self _populateWithContext:v9];
  }
  id v17 = [v8 count];
  v51 = [(objc_class *)self->_objectClass uniqueAttributeName];
  id v47 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v17];
  id v18 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v17];
  group = dispatch_group_create();
  lookup = self->_lookup;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000E0770;
  v68[3] = &unk_1002D9C10;
  id v20 = v8;
  id v69 = v20;
  id v21 = v18;
  id v70 = v21;
  [(GKThreadsafeDictionary *)lookup readFromDictionary:v68];
  id v22 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v17];
  id v23 = +[NSMutableDictionary dictionaryWithCapacity:v17];
  id v24 = [v21 allValues];
  id v25 = +[NSMutableSet setWithArray:v24];

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1000E08A4;
  v64[3] = &unk_1002D9C38;
  id v26 = v9;
  id v65 = v26;
  id v27 = v23;
  id v66 = v27;
  id v28 = v25;
  id v67 = v28;
  [v21 enumerateKeysAndObjectsUsingBlock:v64];
  if ([v28 count])
  {
    if (!os_log_GKGeneral) {
      id v29 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000FB0D8();
    }
    id v30 = objc_alloc((Class)NSFetchRequest);
    id v31 = [(objc_class *)self->_objectClass entityName];
    id v32 = [v30 initWithEntityName:v31];

    v33 = +[NSPredicate predicateWithFormat:@"self IN %@", v28];
    [v32 setPredicate:v33];

    long long v34 = [(objc_class *)self->_objectClass relationshipKeyPathsForPrefetch];
    [v32 setRelationshipKeyPathsForPrefetching:v34];

    [v32 setReturnsObjectsAsFaults:0];
    long long v35 = [v26 executeFetchRequest:v32 error:0];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000E0938;
    v61[3] = &unk_1002D9C60;
    id v62 = v51;
    id v63 = v27;
    [v35 enumerateObjectsUsingBlock:v61];
  }
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000E09A4;
  v56[3] = &unk_1002D9C88;
  id v36 = v27;
  id v57 = v36;
  id v37 = v49;
  id v60 = v37;
  id v38 = v22;
  id v58 = v38;
  id v39 = v47;
  id v59 = v39;
  [v20 enumerateObjectsUsingBlock:v56];
  if ([v38 count])
  {
    if ([v26 obtainPermanentIDsForObjects:v38 error:0])
    {
      uint64_t v40 = [v38 _gkMapDictionaryWithKeyPath:v51 valueKeyPath:@"objectID"];
      if (v40)
      {
        id v41 = (void *)v40;
        dispatch_group_enter(group);
        v48 = self->_lookup;
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_1000E0A40;
        v53[3] = &unk_1002D9CB0;
        id v54 = v41;
        v55 = group;
        id v42 = v41;
        [(GKThreadsafeDictionary *)v48 writeToDictionary:v53];
      }
    }
  }
  id v43 = v39;
  v44 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E0A80;
  block[3] = &unk_1002D40E0;
  block[4] = self;
  dispatch_group_notify(group, v44, block);

  id v45 = v43;
  return v45;
}

- (id)insertObjectsForServerRepresentations:(id)a3 context:(id)a4 newObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v11, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v12 = +[NSThread callStackSymbols];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKUniqueObjectIDLookup insertObjectsForServerRepresentations:context:newObject:]", v12);
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v15 = [v14 lastPathComponent];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v13, "-[GKUniqueObjectIDLookup insertObjectsForServerRepresentations:context:newObject:]", [v15 UTF8String], 243);

    +[NSException raise:@"GameKit Exception", @"%@", v16 format];
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000E0D8C;
  v28[3] = &unk_1002D9CD8;
  id v17 = v10;
  id v29 = v17;
  id v18 = [v8 _gkMapWithBlock:v28];
  if ([v18 count])
  {
    v19 = [(objc_class *)self->_objectClass uniqueAttributeName];
    if ([v9 obtainPermanentIDsForObjects:v18 error:0])
    {
      uint64_t v20 = [v18 _gkMapDictionaryWithKeyPath:v19 valueKeyPath:@"objectID"];
      if (v20)
      {
        id v21 = (void *)v20;
        if (!os_log_GKGeneral) {
          id v22 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
          sub_1000FB174();
        }
        lookup = self->_lookup;
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_1000E0D9C;
        v26[3] = &unk_1002D9D00;
        id v27 = v21;
        id v24 = v21;
        [(GKThreadsafeDictionary *)lookup writeToDictionary:v26];
      }
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_lookup, 0);
}

@end