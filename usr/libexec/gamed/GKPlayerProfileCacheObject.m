@interface GKPlayerProfileCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)_familiarityLookup;
+ (id)entityName;
+ (id)filterPlayerIDs:(id)a3 familiarity:(int)a4 includeSelf:(BOOL)a5;
+ (id)localPlayerInManagedObjectContext:(id)a3;
+ (id)playerProfileWithPlayerID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)playerProfilesWithPlayerIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (id)playerProfilesWithPlayers:(id)a3 inManagedObjectContext:(id)a4;
+ (id)playersByFamiliarity:(id)a3;
+ (id)profileForPlayer:(id)a3 context:(id)a4;
+ selfPlayerID;
+ (id)uniqueAttributeName;
+ (int)familiarityForPlayerID:(id)a3;
+ (unsigned)piecesToLoadForFamiliarity:(int)a3;
+ (void)addFamiliarPlayerIDs:(id)a3 familiarity:(int)a4;
+ (void)buildFamiliarilyLookupForProfile:(id)a3;
+ (void)removeFamiliarPlayerIDs:(id)a3 familiarity:(int)a4;
+ (void)setFamiliarPlayerIDs:(id)a3 familiarity:(int)a4;
- (BOOL)isFindable;
- (BOOL)isLocalPlayer;
- (BOOL)isUnderage;
- (BOOL)isValid;
- (id)internalRepresentation;
- (id)internalRepresentationWithPieces:(unsigned __int8)a3;
- (id)updateImagesWithImageURLs:(id)a3;
- (int)familiarity;
- (void)clearImages;
- (void)deleteCachedAvatars;
- (void)deleteCachedImage:(id)a3;
- (void)expireRecentMatchesWithGame:(id)a3;
- (void)invalidate;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 pieces:(unsigned __int8)a5;
@end

@implementation GKPlayerProfileCacheObject

+ selfPlayerID
{
  void *v2;
  void *v3;
  uint64_t vars8;

  v2 = [a1 _familiarityLookup];
  v3 = [v2 objectForKeyedSubscript:&off_1002F21C8];

  return v3;
}

+ (id)_familiarityLookup
{
  v2 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v2, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v3 = +[NSThread callStackSymbols];
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) _familiarityLookup]", v3);
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v6 = [v5 lastPathComponent];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v4, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) _familiarityLookup]", [v6 UTF8String], 1091);

    +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  }

  v8 = dispatch_get_current_queue();
  dispatch_queue_get_specific(v8, @"com.apple.gamed.GKPlayerProfileCacheObject.familiarityLookup");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    dispatch_queue_set_specific(v8, @"com.apple.gamed.GKPlayerProfileCacheObject.familiarityLookup", v9, (dispatch_function_t)_GKLookupRelease);
  }

  return v9;
}

+ (id)playersByFamiliarity:(id)a3
{
  id v4 = a3;
  v31 = [a1 _familiarityLookup];
  v26 = [v31 objectForKeyedSubscript:&off_1002F21C8];
  v5 = [v31 objectForKeyedSubscript:&off_1002F21E0];
  id v6 = [v31 objectForKeyedSubscript:&off_1002F21F8];
  v7 = [v31 objectForKeyedSubscript:&off_1002F2210];
  id v8 = [v4 count];
  id v9 = +[NSMutableSet setWithCapacity:1];
  v10 = +[NSMutableSet setWithCapacity:v8];
  v11 = +[NSMutableSet setWithCapacity:v8];
  v12 = +[NSMutableSet setWithCapacity:v8];
  +[NSMutableSet setWithCapacity:v8];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000E6970;
  v32[3] = &unk_1002D9E38;
  id v33 = v26;
  id v34 = v9;
  id v35 = v5;
  id v36 = v10;
  id v37 = v6;
  id v38 = v11;
  id v39 = v7;
  id v40 = v12;
  id v41 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v41;
  id v25 = v12;
  id v30 = v7;
  id v14 = v11;
  id v29 = v6;
  id v15 = v10;
  id v28 = v5;
  id v16 = v9;
  id v27 = v26;
  [v4 enumerateObjectsUsingBlock:v32];

  v42[0] = &off_1002F21C8;
  v17 = [v16 allObjects];
  v43[0] = v17;
  v42[1] = &off_1002F21E0;
  v18 = [v15 allObjects];
  v43[1] = v18;
  v42[2] = &off_1002F21F8;
  v19 = [v14 allObjects];
  v43[2] = v19;
  v42[3] = &off_1002F2210;
  v20 = [v25 allObjects];
  v43[3] = v20;
  v42[4] = &off_1002F2228;
  v21 = v13;
  v22 = [v13 allObjects];
  v43[4] = v22;
  id v24 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];

  return v24;
}

+ (id)uniqueAttributeName
{
  return @"playerID";
}

+ (const)uniqueObjectIDLookupKey
{
  return @"GKPlayerProfileCacheObjectUniqueObjectIDLookupKey";
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)GKPlayerProfileCacheObject;
  if (![(GKExpiringCacheObject *)&v6 isValid]
    || ([(GKPlayerProfileCacheObject *)self availablePieces] & 1) == 0)
  {
    return 0;
  }
  id v4 = [(GKPlayerProfileCacheObject *)self alias];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)invalidate
{
  [(GKPlayerProfileCacheObject *)self setAvailablePieces:0];
  v3.receiver = self;
  v3.super_class = (Class)GKPlayerProfileCacheObject;
  [(GKExpiringCacheObject *)&v3 invalidate];
}

- (BOOL)isUnderage
{
  v5.receiver = self;
  v5.super_class = (Class)GKPlayerProfileCacheObject;
  v2 = [(GKPlayerProfileCacheObject *)&v5 primitiveValueForKey:@"underage"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isFindable
{
  v5.receiver = self;
  v5.super_class = (Class)GKPlayerProfileCacheObject;
  v2 = [(GKPlayerProfileCacheObject *)&v5 primitiveValueForKey:@"findable"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)clearImages
{
  unsigned __int8 v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    objc_super v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerProfileCacheObject clearImages]", v4);
    objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKPlayerProfileCacheObject clearImages]", [v7 UTF8String], 735);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  if (([(GKPlayerProfileCacheObject *)self conformsToProtocol:&OBJC_PROTOCOL___GKCacheObjectImageProtocol] & 1) == 0)
  {
    id v9 = +[NSString stringWithFormat:@"Assertion failed"];
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]", v9, "-[GKPlayerProfileCacheObject clearImages]", [v11 UTF8String], 736);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  id v13 = [(GKCacheObject *)self imageCacheKeyPathsByKey];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E4274;
  v14[3] = &unk_1002D9D98;
  v14[4] = self;
  [v13 enumerateKeysAndObjectsUsingBlock:v14];

  [(GKPlayerProfileCacheObject *)self deleteCachedAvatars];
}

- (void)deleteCachedAvatars
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB63C();
  }
  id v4 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    objc_super v5 = +[NSThread callStackSymbols];
    objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerProfileCacheObject deleteCachedAvatars]", v5);
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v6, "-[GKPlayerProfileCacheObject deleteCachedAvatars]", [v8 UTF8String], 753);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }

  v10 = [(GKPlayerProfileCacheObject *)self playerID];
  id v11 = GKAvatarSubdirectoryNameForPlayerID();

  [(GKPlayerProfileCacheObject *)self deleteCachedImage:v11];
}

- (void)deleteCachedImage:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB6D8();
  }
  objc_super v6 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = +[NSThread callStackSymbols];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerProfileCacheObject deleteCachedImage:]", v7);
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v10 = [v9 lastPathComponent];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v8, "-[GKPlayerProfileCacheObject deleteCachedImage:]", [v10 UTF8String], 764);

    +[NSException raise:@"GameKit Exception", @"%@", v11 format];
  }

  v12 = +[NSURL URLWithString:v4];
  if ([v12 isFileURL])
  {
    if (!os_log_GKGeneral) {
      id v13 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000FB670();
    }
    id v14 = +[NSFileManager defaultManager];
    unsigned int v15 = [v14 removeItemAtURL:v12 error:0];

    if (v15)
    {
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
        sub_1000FB400();
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GKPlayerProfileCacheObject;
    [(GKCacheObject *)&v17 deleteCachedImage:v4];
  }
}

+ (id)localPlayerInManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    objc_super v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]", v6);
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]", [v9 UTF8String], 782);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  id v11 = objc_getAssociatedObject(v4, @"GKLocalPlayerObjectIDKey");
  v12 = [v4 objectRegisteredForID:v11];
  if (!v12)
  {
    id v13 = [a1 selfPlayerID];
    if (v13)
    {
      id v14 = +[NSPredicate predicateWithFormat:@"playerID = %@", v13];
      v12 = +[GKCacheObject firstObjectMatchingPredicate:v14 context:v4];

      objc_setAssociatedObject(v4, @"GKLocalPlayerObjectIDKey", v11, (void *)1);
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

+ (id)playerProfileWithPlayerID:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]", v9);
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]", [v12 UTF8String], 797);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  if (v6
    && ([a1 selfPlayerID],
        id v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v6 isEqualToString:v14],
        v14,
        !v15))
  {
    id v20 = v6;
    objc_super v17 = +[NSArray arrayWithObjects:&v20 count:1];
    v18 = [a1 playerProfilesWithPlayerIDs:v17 inManagedObjectContext:v7];
    id v16 = [v18 lastObject];
  }
  else
  {
    id v16 = [a1 localPlayerInManagedObjectContext:v7];
  }

  return v16;
}

+ (id)profileForPlayer:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 playerID];

  if (v7)
  {
    id v8 = [v5 playerID];
    id v9 = +[GKPlayerProfileCacheObject playerProfileWithPlayerID:v8 inManagedObjectContext:v6];
  }
  else
  {
    id v9 = +[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:v6];
  }

  return v9;
}

+ (id)playerProfilesWithPlayers:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = [a3 _gkFilterWithBlock:&stru_1002D9DC0];
  id v8 = [a1 playerProfilesWithPlayerIDs:v7 inManagedObjectContext:v6];

  return v8;
}

+ (id)playerProfilesWithPlayerIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB70C();
  }
  id v9 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]", v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v11, "+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]", [v13 UTF8String], 826);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  unsigned int v15 = [a1 uniqueObjectIDLookupWithContext:v7];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000E4E28;
  v19[3] = &unk_1002D9DE8;
  id v20 = v7;
  id v21 = a1;
  id v16 = v7;
  objc_super v17 = [v15 uniqueObjectsForKeys:v6 context:v16 newObject:v19];

  return v17;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
}

- (id)updateImagesWithImageURLs:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB740();
  }
  id v6 = dispatch_get_current_queue();
  id v7 = &GKInfoPlistKeyFriendsAPIUsageDescription_ptr;
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]", v8);
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v9, "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]", [v11 UTF8String], 843);

    id v7 = &GKInfoPlistKeyFriendsAPIUsageDescription_ptr;
    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }
  if (([(GKPlayerProfileCacheObject *)self conformsToProtocol:&OBJC_PROTOCOL___GKCacheObjectImageProtocol] & 1) == 0)
  {
    id v13 = +[NSString stringWithFormat:@"Assertion failed"];
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v15 = [v14 lastPathComponent];
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]", v13, "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]", [v15 UTF8String], 844);

    [v7[401] raise:@"GameKit Exception", @"%@", v16 format];
  }
  objc_super v17 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  v18 = [v4 objectForKeyedSubscript:@"template"];
  v19 = [(GKPlayerProfileCacheObject *)self valueForKeyPath:@"imageTemplate"];
  id v20 = v19;
  if (v19 != v18 && ([v19 isEqualToString:v18] & 1) == 0)
  {
    [(GKPlayerProfileCacheObject *)self clearImages];
    [v17 addObject:@"template"];
    [(GKPlayerProfileCacheObject *)self setValue:v18 forKeyPath:@"imageTemplate"];
  }

  return v17;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 pieces:(unsigned __int8)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerProfileCacheObject updateWithServerRepresentation:expirationDate:pieces:]", v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v13 = [v12 lastPathComponent];
    id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v11, "-[GKPlayerProfileCacheObject updateWithServerRepresentation:expirationDate:pieces:]", [v13 UTF8String], 867);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  v71.receiver = self;
  v71.super_class = (Class)GKPlayerProfileCacheObject;
  [(GKExpiringCacheObject *)&v71 updateWithServerRepresentation:v7 expirationDate:v8];
  if (v7)
  {
    uint64_t v15 = [v7 objectForKey:GKPlayerIDKey];
    v67 = (void *)v15;
    if (v15)
    {
      [(GKPlayerProfileCacheObject *)self setPlayerID:v15];
    }
    else
    {
      if (!os_log_GKGeneral) {
        id v16 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
        sub_1000FB808();
      }
    }
    objc_super v17 = [v7 objectForKeyedSubscript:GKAliasKey];
    [(GKPlayerProfileCacheObject *)self setAlias:v17];

    v18 = [v7 objectForKeyedSubscript:GKPlayerStatusKey];
    [(GKPlayerProfileCacheObject *)self setStatus:v18];

    v19 = [v7 objectForKeyedSubscript:@"pb-account"];
    -[GKPlayerProfileCacheObject setPurpleBuddyAccount:](self, "setPurpleBuddyAccount:", [v19 BOOLValue]);

    id v20 = [v7 objectForKeyedSubscript:GKUnderageKey];
    id v21 = v20;
    if (v20) {
      -[GKPlayerProfileCacheObject setUnderage:](self, "setUnderage:", [v20 BOOLValue]);
    }
    v22 = [v7 objectForKeyedSubscript:GKFindableKey];

    if (v22) {
      -[GKPlayerProfileCacheObject setFindable:](self, "setFindable:", [v22 BOOLValue]);
    }
    if ([(GKPlayerProfileCacheObject *)self isLocalPlayer])
    {
      v23 = [(GKPlayerProfileCacheObject *)self photoPendingExpirationDate];
      [v23 timeIntervalSinceNow];
      double v25 = v24;

      if (v25 < 0.0)
      {
        v26 = [v7 objectForKey:GKPhotoPendingKey];
        -[GKPlayerProfileCacheObject setPhotoPending:](self, "setPhotoPending:", [v26 BOOLValue]);
      }
      if ([(GKPlayerProfileCacheObject *)self photoPending])
      {
        id v27 = [(GKCacheObject *)self imageURLDictionary];
        if ([v27 count])
        {
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_1000E5A90;
          v70[3] = &unk_1002D9E10;
          v70[4] = self;
          [v27 enumerateKeysAndObjectsUsingBlock:v70];
        }
        else
        {
          [(GKPlayerProfileCacheObject *)self setPhotoPending:0];
        }
      }
      +[GKContactsIntegrationUserSettings applySettingsToObject:self fromResults:v7];
    }
    id v28 = [v7 objectForKeyedSubscript:GKPrivacySettingsKey];
    id v29 = v28;
    if (v28)
    {
      id v30 = [v28 objectForKeyedSubscript:GKPrivacySettingsFriendsKey];
      [(GKPlayerProfileCacheObject *)self setFriendsVisibility:sub_1000E5B48((uint64_t)v30, v30)];

      v31 = [v29 objectForKeyedSubscript:GKPrivacySettingsAchievementsKey];
      [(GKPlayerProfileCacheObject *)self setAchievementsVisibility:sub_1000E5B48((uint64_t)v31, v31)];

      v32 = [v29 objectForKeyedSubscript:GKPrivacySettingsGamesPlayedKey];
      [(GKPlayerProfileCacheObject *)self setGamesPlayedVisibility:sub_1000E5B48((uint64_t)v32, v32)];
    }
    else
    {
      [(GKPlayerProfileCacheObject *)self setFriendsVisibility:2];
      [(GKPlayerProfileCacheObject *)self setAchievementsVisibility:2];
      [(GKPlayerProfileCacheObject *)self setGamesPlayedVisibility:2];
    }
    id v33 = [v7 objectForKeyedSubscript:GKGlobalFriendListAccessKey];
    [(GKPlayerProfileCacheObject *)self setGlobalFriendListAccess:sub_1000E5BBC((uint64_t)v33, v33)];

    id v34 = [v7 objectForKeyedSubscript:GKIsArcadeSubscriberKey];
    id v35 = v34;
    if (v34) {
      id v36 = [v34 BOOLValue];
    }
    else {
      id v36 = 0;
    }
    id v68 = v8;
    [(GKPlayerProfileCacheObject *)self setIsArcadeSubscriber:v36];
    id v37 = [v7 objectForKey:GKPhotoURLsKey];
    if (v37 && ([(GKPlayerProfileCacheObject *)self photoPending] & 1) == 0) {
      id v38 = [(GKPlayerProfileCacheObject *)self updateImagesWithImageURLs:v37];
    }
    id v39 = [v37 objectForKeyedSubscript:GKAvatarTypeKey];
    if (v39) {
      [(GKPlayerProfileCacheObject *)self setAvatarType:v39];
    }
    v66 = v22;
    id v40 = [v7 objectForKeyedSubscript:GKFriendBiDirectionalKey];
    id v41 = [v7 objectForKeyedSubscript:GKFriendPlayedWithKey];
    v42 = [v7 objectForKeyedSubscript:GKFriendPlayedNearbyKey];
    v65 = v41;
    if (v40)
    {
      v64 = v37;
      v43 = v39;
      v44 = v29;
      v45 = v35;
      v46 = v42;
      unint64_t v47 = (unint64_t)[v40 integerValue];
      uint64_t v48 = v47 | (2 * (void)[v41 integerValue]);
      v42 = v46;
      v49 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v48 | (4 * (void)[v46 integerValue]));
      [(GKPlayerProfileCacheObject *)self setFriendLevel:v49];

      v50 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v51 = (id)GKOSLoggers();
        v50 = os_log_GKGeneral;
      }
      id v35 = v45;
      id v29 = v44;
      id v39 = v43;
      id v37 = v64;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        sub_1000FB774(v50, self);
      }
    }
    else
    {
      v52 = [(GKPlayerProfileCacheObject *)self firstName];

      if (v52) {
        v53 = &off_1002F21B0;
      }
      else {
        v53 = &off_1002F2198;
      }
      [(GKPlayerProfileCacheObject *)self setFriendLevel:v53];
    }
    v54 = [v7 objectForKey:GKNumberOfFriendsKey];
    id v55 = [v54 integerValue];

    if (v55 != (id)(int)[(GKPlayerProfileCacheObject *)self numberOfFriends]) {
      [(GKPlayerProfileCacheObject *)self setNumberOfFriends:v55];
    }
    v56 = [v7 objectForKey:GKNumberOfGamesPlayedKey];
    -[GKPlayerProfileCacheObject setNumberOfGames:](self, "setNumberOfGames:", [v56 integerValue]);

    v57 = [v7 objectForKey:GKNumberOfAchievementsKey];
    -[GKPlayerProfileCacheObject setNumberOfAchievements:](self, "setNumberOfAchievements:", [v57 integerValue]);

    v58 = [v7 objectForKey:GKNumberOfAchievementPointsKey];
    -[GKPlayerProfileCacheObject setNumberOfAchievementPoints:](self, "setNumberOfAchievementPoints:", [v58 integerValue]);

    if ((a5 & 0x10) != 0)
    {
      v59 = [v7 objectForKey:GKNumberOfFriendsInCommonKey];
      -[GKPlayerProfileCacheObject setNumberOfFriendsInCommon:](self, "setNumberOfFriendsInCommon:", [v59 integerValue]);

      v60 = [v7 objectForKey:GKNumberOfGamesInCommonKey];
      -[GKPlayerProfileCacheObject setNumberOfGamesInCommon:](self, "setNumberOfGamesInCommon:", [v60 integerValue]);
    }
    v61 = [v7 objectForKeyedSubscript:@"allow-friend-invites-from-challenges"];
    -[GKPlayerProfileCacheObject setAllowChallengeFriendInvites:](self, "setAllowChallengeFriendInvites:", [v61 isEqualToString:@"allowed"]);

    v62 = [v7 objectForKeyedSubscript:@"allow-friend-invites-from-multiplayer-invites"];
    -[GKPlayerProfileCacheObject setAllowMultiplayerFriendInvites:](self, "setAllowMultiplayerFriendInvites:", [v62 isEqualToString:@"allowed"]);

    if ((a5 & 0x80) != 0)
    {
      v63 = [v7 objectForKeyedSubscript:@"check-friend-invitation-ability"];
      -[GKPlayerProfileCacheObject setAllowReceivingFriendInvites:](self, "setAllowReceivingFriendInvites:", [v63 BOOLValue]);
    }
    -[GKPlayerProfileCacheObject setAvailablePieces:](self, "setAvailablePieces:");

    id v8 = v68;
  }
}

- (id)internalRepresentationWithPieces:(unsigned __int8)a3
{
  id v4 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v4, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v5 = +[NSThread callStackSymbols];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerProfileCacheObject internalRepresentationWithPieces:]", v5);
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v6, "-[GKPlayerProfileCacheObject internalRepresentationWithPieces:]", [v8 UTF8String], 1030);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }

  unsigned int v10 = [(GKPlayerProfileCacheObject *)self familiarity] - 1;
  if (v10 > 3) {
    id v11 = (Class *)GKPlayerInternal_ptr;
  }
  else {
    id v11 = (Class *)off_1002DA3A8[v10];
  }
  id v12 = [objc_alloc(*v11) initWithCacheObject:self];

  return v12;
}

- (id)internalRepresentation
{
  id v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKPlayerProfileCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKPlayerProfileCacheObject internalRepresentation]", [v7 UTF8String], 1056);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  unint64_t v9 = (unint64_t)[(GKPlayerProfileCacheObject *)self availablePieces] & 0xDF;

  return [(GKPlayerProfileCacheObject *)self internalRepresentationWithPieces:v9];
}

+ (id)entityName
{
  return @"PlayerProfile";
}

- (void)expireRecentMatchesWithGame:(id)a3
{
  id v8 = a3;
  id v4 = [(GKPlayerProfileCacheObject *)self managedObjectContext];
  if (v8)
  {
    id v5 = +[NSPredicate predicateWithFormat:@"player = %@ AND game = %@", self, v8];
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:v5 context:v4];
  }
  id v6 = +[NSPredicate predicateWithFormat:@"player = %@ && game == nil", self];
  +[GKExpiringCacheObject expireObjectsMatchingPredicate:v6 context:v4];

  id v7 = +[NSPredicate predicateWithFormat:@"player = %@ OR otherPlayer = %@", self, self];
  +[GKExpiringCacheObject expireObjectsMatchingPredicate:v7 context:v4];
}

+ (void)buildFamiliarilyLookupForProfile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 playerID];

  if (v5)
  {
    v19[0] = &off_1002F21C8;
    objc_super v17 = [v4 playerID];
    id v18 = a1;
    v20[0] = v17;
    v19[1] = &off_1002F21E0;
    id v16 = [v4 friendList];
    id v6 = [v16 playerIDs];
    id v7 = +[NSSet setWithArray:v6];
    v20[1] = v7;
    v19[2] = &off_1002F21F8;
    id v8 = [v4 friendRequestList];
    unint64_t v9 = [v8 playerIDs];
    unsigned int v10 = +[NSSet setWithArray:v9];
    v20[2] = v10;
    v19[3] = &off_1002F2210;
    id v11 = [v4 friendRecommendationList];
    id v12 = [v11 playerIDs];
    id v13 = +[NSSet setWithArray:v12];
    v20[3] = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

    uint64_t v15 = [v18 _familiarityLookup];
    [v15 addEntriesFromDictionary:v14];
  }
}

+ (int)familiarityForPlayerID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = [a1 _familiarityLookup];
  id v6 = [v5 objectForKeyedSubscript:&off_1002F21C8];
  if ([v6 isEqualToString:v4])
  {

    int v7 = 1;
    goto LABEL_12;
  }
  id v8 = [v5 objectForKeyedSubscript:&off_1002F21E0];
  if ([v8 containsObject:v4])
  {
    int v7 = 2;
    unsigned int v9 = 1;
  }
  else
  {
    unsigned int v10 = [v5 objectForKeyedSubscript:&off_1002F21F8];
    if ([v10 containsObject:v4])
    {
      int v7 = 3;
      unsigned int v9 = 1;
    }
    else
    {
      id v11 = [v5 objectForKeyedSubscript:&off_1002F2210];
      unsigned int v9 = [v11 containsObject:v4];

      int v7 = 4;
    }
  }
  if (!v9) {
LABEL_11:
  }
    int v7 = 0;
LABEL_12:

  return v7;
}

- (int)familiarity
{
  v2 = [(GKPlayerProfileCacheObject *)self playerID];
  int v3 = +[GKPlayerProfileCacheObject familiarityForPlayerID:v2];

  return v3;
}

+ (void)addFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v14 = a3;
  if (v4 == 1)
  {
    id v6 = +[NSString stringWithFormat:@"Assertion failed"];
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v8 = [v7 lastPathComponent];
    unsigned int v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]", v6, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) addFamiliarPlayerIDs:familiarity:]", [v8 UTF8String], 1163);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  unsigned int v10 = [a1 _familiarityLookup];
  id v11 = +[NSNumber numberWithInt:v4];
  id v12 = [v10 objectForKeyedSubscript:v11];
  id v13 = [v12 mutableCopy];
  [v13 addObjectsFromArray:v14];
  [v10 setObject:v13 forKeyedSubscript:v11];
}

+ (void)removeFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 == 1)
  {
    int v7 = +[NSString stringWithFormat:@"Assertion failed"];
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    unsigned int v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]", v7, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) removeFamiliarPlayerIDs:familiarity:]", [v9 UTF8String], 1176);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }
  id v11 = [a1 _familiarityLookup];
  id v12 = +[NSNumber numberWithInt:v4];
  id v13 = [v11 objectForKeyedSubscript:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E66D4;
  v15[3] = &unk_1002D8CC8;
  id v16 = [v13 mutableCopy];
  id v14 = v16;
  [v6 enumerateObjectsUsingBlock:v15];
  [v11 setObject:v14 forKeyedSubscript:v12];
}

+ (void)setFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  if (v4 == 1)
  {
    id v6 = +[NSString stringWithFormat:@"Assertion failed"];
    int v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]", v6, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) setFamiliarPlayerIDs:familiarity:]", [v8 UTF8String], 1197);

    +[NSException raise:@"GameKit Exception", @"%@", v9 format];
  }
  unsigned int v10 = [a1 _familiarityLookup];
  id v11 = +[NSNumber numberWithInt:v4];
  id v12 = +[NSSet setWithArray:v13];
  [v10 setObject:v12 forKeyedSubscript:v11];
}

- (BOOL)isLocalPlayer
{
  v2 = [(GKPlayerProfileCacheObject *)self playerID];
  BOOL v3 = +[GKPlayerProfileCacheObject familiarityForPlayerID:v2] == 1;

  return v3;
}

+ (unsigned)piecesToLoadForFamiliarity:(int)a3
{
  unint64_t v3 = 0x8183032B01uLL >> (8 * a3);
  if (a3 >= 5) {
    LOBYTE(v3) = 1;
  }
  return v3;
}

+ (id)filterPlayerIDs:(id)a3 familiarity:(int)a4 includeSelf:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = [a1 playersByFamiliarity:v8];
  unsigned int v10 = +[NSNumber numberWithInt:v6];
  id v11 = [v9 objectForKeyedSubscript:v10];
  id v12 = +[NSSet setWithArray:v11];

  if (v5)
  {
    id v13 = [v9 objectForKeyedSubscript:&off_1002F21C8];
    uint64_t v14 = [v12 setByAddingObjectsFromArray:v13];

    id v12 = (void *)v14;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E6BC0;
  v18[3] = &unk_1002D7B70;
  id v19 = v12;
  id v15 = v12;
  id v16 = [v8 _gkFilterWithBlock:v18];

  return v16;
}

@end