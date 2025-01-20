@interface GKCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)allObjectsInContext:(id)a3;
+ (id)attributesDescriptionsForAttributesWithKeys:(id)a3;
+ (id)entityInManagedObjectContext:(id)a3;
+ (id)entityName;
+ (id)fetchRequestForContext:(id)a3;
+ (id)fetchSortDescriptors;
+ (id)firstObjectMatchingPredicate:(id)a3 context:(id)a4;
+ (id)objectsMatchingPredicate:(id)a3 context:(id)a4;
+ (id)relationshipKeyPathsForPrefetch;
+ (id)uniqueAttributeName;
+ (id)uniqueObjectIDLookupWithContext:(id)a3;
+ (unint64_t)countObjectsMatchingPredicate:(id)a3 context:(id)a4;
+ (void)deleteObjectsMatchingPredicate:(id)a3 context:(id)a4;
- (BOOL)hasImages;
- (BOOL)isValid;
- (GKCacheObject)initWithManagedObjectContext:(id)a3;
- (id)imageCacheKeyPathsByKey;
- (id)imageURLDictionary;
- (id)internalRepresentation;
- (id)updateImagesWithImageURLs:(id)a3;
- (void)clearImages;
- (void)deleteCachedImage:(id)a3;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v3 = +[NSThread callStackSymbols];
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCacheObject updateWithServerRepresentation:]", v3);
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v6 = [v5 lastPathComponent];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v4, "-[GKCacheObject updateWithServerRepresentation:]", [v6 UTF8String], 279);

    +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  }
}

- (id)internalRepresentation
{
  return 0;
}

+ (id)entityName
{
  v2 = +[NSString stringWithFormat:@"Subclasses must provide a valid entityName"];
  v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
  id v4 = [v3 lastPathComponent];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v2, "+[GKCacheObject entityName]", [v4 UTF8String], 291);

  +[NSException raise:@"GameKit Exception", @"%@", v5 format];
  return 0;
}

+ (id)entityInManagedObjectContext:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
  {
    sub_1000FB210();
    if (v4) {
      goto LABEL_5;
    }
  }
  else if (v4)
  {
LABEL_5:
    id v6 = [a1 entityName];
    if (!v6)
    {
      v7 = +[NSString stringWithFormat:@"Subclasses must provide a valid entityName"];
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
      id v9 = [v8 lastPathComponent];
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (entityName != nil)\n[%s (%s:%d)]", v7, "+[GKCacheObject entityInManagedObjectContext:]", [v9 UTF8String], 304);

      +[NSException raise:@"GameKit Exception", @"%@", v10 format];
    }
    v11 = +[NSEntityDescription entityForName:v6 inManagedObjectContext:v4];

    goto LABEL_14;
  }
  if (!os_log_GKGeneral) {
    id v12 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB1DC();
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (GKCacheObject)initWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB244();
  }
  id v6 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v7 = +[NSThread callStackSymbols];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCacheObject initWithManagedObjectContext:]", v7);
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v10 = [v9 lastPathComponent];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v8, "-[GKCacheObject initWithManagedObjectContext:]", [v10 UTF8String], 313);

    +[NSException raise:@"GameKit Exception", @"%@", v11 format];
  }

  id v12 = [(id)objc_opt_class() entityInManagedObjectContext:v4];
  if (v12)
  {
    v15.receiver = self;
    v15.super_class = (Class)GKCacheObject;
    self = [(GKCacheObject *)&v15 initWithEntity:v12 insertIntoManagedObjectContext:v4];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)fetchRequestForContext:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB278();
  }
  id v6 = [a1 entityName];
  v7 = +[NSFetchRequest fetchRequestWithEntityName:v6];

  [v7 setIncludesSubentities:1];
  [v7 setIncludesPropertyValues:1];
  [v7 setIncludesPendingChanges:1];
  v8 = [a1 fetchSortDescriptors];
  [v7 setSortDescriptors:v8];

  id v9 = [a1 relationshipKeyPathsForPrefetch];
  [v7 setRelationshipKeyPathsForPrefetching:v9];

  [v7 setReturnsObjectsAsFaults:0];

  return v7;
}

+ (id)relationshipKeyPathsForPrefetch
{
  return 0;
}

+ (id)fetchSortDescriptors
{
  return 0;
}

+ (id)allObjectsInContext:(id)a3
{
  return [a1 objectsMatchingPredicate:0 context:a3];
}

+ (id)objectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKCacheObject objectsMatchingPredicate:context:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "+[GKCacheObject objectsMatchingPredicate:context:]", [v12 UTF8String], 357);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [a1 fetchRequestForContext:v7];
  if (!v6)
  {
    id v6 = +[NSPredicate predicateWithValue:1];
  }
  [v14 setPredicate:v6];
  objc_super v15 = [a1 _gkObjectsFromFetchRequest:v14 withContext:v7];

  return v15;
}

+ (unint64_t)countObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKCacheObject countObjectsMatchingPredicate:context:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "+[GKCacheObject countObjectsMatchingPredicate:context:]", [v12 UTF8String], 370);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [a1 fetchRequestForContext:v7];
  if (!v6)
  {
    id v6 = +[NSPredicate predicateWithValue:1];
  }
  [v14 setPredicate:v6];
  id v15 = [v7 _gkCountObjectsFromRequest:v14];

  return (unint64_t)v15;
}

+ (id)firstObjectMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKCacheObject firstObjectMatchingPredicate:context:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "+[GKCacheObject firstObjectMatchingPredicate:context:]", [v12 UTF8String], 383);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [a1 fetchRequestForContext:v7];
  [v14 setFetchLimit:1];
  if (!v6)
  {
    id v6 = +[NSPredicate predicateWithValue:1];
  }
  [v14 setPredicate:v6];
  id v20 = 0;
  id v15 = [v7 executeFetchRequest:v14 error:&v20];
  id v16 = v20;
  if ([v15 count])
  {
    v17 = [v15 objectAtIndex:0];
  }
  else
  {
    v17 = 0;
    if (!v15 && v16)
    {
      if (!os_log_GKGeneral) {
        id v18 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000FB070();
      }
      v17 = 0;
    }
  }

  return v17;
}

+ (void)deleteObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKCacheObject deleteObjectsMatchingPredicate:context:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "+[GKCacheObject deleteObjectsMatchingPredicate:context:]", [v12 UTF8String], 405);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [a1 objectsMatchingPredicate:v6 context:v7];
  if (!os_log_GKGeneral) {
    id v15 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB2AC();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        [v7 deleteObject:*(void *)(*((void *)&v21 + 1) + 8 * (void)v20)];
        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
}

- (BOOL)isValid
{
  return 1;
}

+ (id)uniqueAttributeName
{
  v2 = +[NSString stringWithFormat:@"Subclass %@ must override uniqueAttributeName", objc_opt_class()];
  v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
  id v4 = [v3 lastPathComponent];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v2, "+[GKCacheObject uniqueAttributeName]", [v4 UTF8String], 426);

  +[NSException raise:@"GameKit Exception", @"%@", v5 format];
  return 0;
}

+ (const)uniqueObjectIDLookupKey
{
  v2 = +[NSString stringWithFormat:@"Subclass %@ must override uniqueObjectIDLookupKey", objc_opt_class()];
  v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
  id v4 = [v3 lastPathComponent];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v2, "+[GKCacheObject uniqueObjectIDLookupKey]", [v4 UTF8String], 433);

  +[NSException raise:@"GameKit Exception", @"%@", v5 format];
  return 0;
}

+ (id)uniqueObjectIDLookupWithContext:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB314();
  }
  id v6 = [a1 uniqueObjectIDLookupKey];
  objc_getAssociatedObject(v4, v6);
  id v7 = (GKUniqueObjectIDLookup *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    id v7 = [[GKUniqueObjectIDLookup alloc] initWithObjectClass:a1 context:v4];
    objc_setAssociatedObject(v4, v6, v7, (void *)1);
  }

  return v7;
}

+ (id)attributesDescriptionsForAttributesWithKeys:(id)a3
{
  id v4 = a3;
  id v5 = [a1 entityName];
  id v6 = +[GKClientProxy managedObjectModel];
  id v7 = [v6 entitiesByName];
  v8 = [v7 objectForKeyedSubscript:v5];

  [v8 attributesByName];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E20E0;
  v12[3] = &unk_1002D6480;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v13;
  id v10 = [v4 _gkMapWithBlock:v12];

  return v10;
}

- (id)imageCacheKeyPathsByKey
{
  v2 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v2, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v3 = +[NSThread callStackSymbols];
    id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCacheObject(GKCacheObjectImageProtocol) imageCacheKeyPathsByKey]", v3);
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v6 = [v5 lastPathComponent];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v4, "-[GKCacheObject(GKCacheObjectImageProtocol) imageCacheKeyPathsByKey]", [v6 UTF8String], 468);

    +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  }

  if (qword_100329778 != -1) {
    dispatch_once(&qword_100329778, &stru_1002D9D20);
  }
  v8 = (void *)qword_100329770;

  return v8;
}

- (id)updateImagesWithImageURLs:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB348();
  }
  id v6 = dispatch_get_current_queue();
  id v7 = &GKInfoPlistKeyFriendsAPIUsageDescription_ptr;
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]", v8);
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v9, "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]", [v11 UTF8String], 485);

    id v7 = &GKInfoPlistKeyFriendsAPIUsageDescription_ptr;
    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  if (([(GKCacheObject *)self conformsToProtocol:&OBJC_PROTOCOL___GKCacheObjectImageProtocol] & 1) == 0)
  {
    id v13 = +[NSString stringWithFormat:@"Assertion failed"];
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v15 = [v14 lastPathComponent];
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]", v13, "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]", [v15 UTF8String], 486);

    [v7[401] raise:@"GameKit Exception", @"%@", v16 format];
  }
  id v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  id v18 = [(GKCacheObject *)self imageCacheKeyPathsByKey];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000E2564;
  v24[3] = &unk_1002D9D48;
  id v25 = v4;
  v26 = self;
  id v19 = v17;
  id v27 = v19;
  id v20 = v4;
  [v18 enumerateKeysAndObjectsUsingBlock:v24];

  long long v21 = v27;
  id v22 = v19;

  return v22;
}

- (id)imageURLDictionary
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]", [v7 UTF8String], 504);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  if (([(GKCacheObject *)self conformsToProtocol:&OBJC_PROTOCOL___GKCacheObjectImageProtocol] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Assertion failed"];
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]", v9, "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]", [v11 UTF8String], 505);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_1000E2900;
  long long v21 = sub_1000E2910;
  id v22 = 0;
  id v13 = [(GKCacheObject *)self imageCacheKeyPathsByKey];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E2918;
  v16[3] = &unk_1002D9D70;
  v16[4] = self;
  v16[5] = &v17;
  [v13 enumerateKeysAndObjectsUsingBlock:v16];

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (void)deleteCachedImage:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
  {
    sub_1000FB4D0();
    if (!v3) {
      goto LABEL_21;
    }
LABEL_5:
    id v5 = GKImageCacheRoot();
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    {
      sub_1000FB468();
      if (!v5) {
        goto LABEL_20;
      }
    }
    else if (!v5)
    {
      goto LABEL_20;
    }
    id v7 = +[NSFileManager defaultManager];
    unsigned int v8 = [v7 fileExistsAtPath:v5];

    if (v8)
    {
      id v9 = +[NSFileManager defaultManager];
      id v14 = 0;
      unsigned int v10 = [v9 removeItemAtPath:v5 error:&v14];
      id v11 = v14;

      if (!v10) {
        goto LABEL_14;
      }
      if (!os_log_GKGeneral) {
        id v12 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
      {
        sub_1000FB400();
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
LABEL_14:
        if (v11)
        {
LABEL_15:
          if (!os_log_GKGeneral) {
            id v13 = (id)GKOSLoggers();
          }
          if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
            sub_1000FB37C();
          }
        }
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v3) {
    goto LABEL_5;
  }
LABEL_21:
}

- (void)clearImages
{
  id v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]", [v7 UTF8String], 547);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  if (([(GKCacheObject *)self conformsToProtocol:&OBJC_PROTOCOL___GKCacheObjectImageProtocol] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Assertion failed"];
    unsigned int v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]", v9, "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]", [v11 UTF8String], 548);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  id v13 = [(GKCacheObject *)self imageCacheKeyPathsByKey];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E2DE0;
  v14[3] = &unk_1002D9D98;
  v14[4] = self;
  [v13 enumerateKeysAndObjectsUsingBlock:v14];
}

- (BOOL)hasImages
{
  id v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    unsigned int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]", [v7 UTF8String], 559);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  if (([(GKCacheObject *)self conformsToProtocol:&OBJC_PROTOCOL___GKCacheObjectImageProtocol] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Assertion failed"];
    unsigned int v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]", v9, "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]", [v11 UTF8String], 560);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v13 = [(GKCacheObject *)self imageCacheKeyPathsByKey];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000E30F0;
  v16[3] = &unk_1002D9D70;
  v16[4] = self;
  v16[5] = &v17;
  [v13 enumerateKeysAndObjectsUsingBlock:v16];

  char v14 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v14;
}

@end