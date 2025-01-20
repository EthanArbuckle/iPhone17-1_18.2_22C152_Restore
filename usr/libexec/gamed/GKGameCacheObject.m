@interface GKGameCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)_gamesForFullGameDescriptors:(id)a3 context:(id)a4;
+ (id)entityName;
+ (id)fetchSortDescriptors;
+ (id)gameForBundleID:(id)a3 context:(id)a4;
+ (id)gameForGameDescriptor:(id)a3 context:(id)a4;
+ (id)gamesForBundleIDs:(id)a3 context:(id)a4;
+ (id)gamesForGameDescriptors:(id)a3 context:(id)a4;
+ (id)uniqueAttributeName;
- (BOOL)isValid;
- (id)gameDescriptor;
- (id)internalRepresentation;
- (id)leaderboardSetWithIdentifier:(id)a3;
- (void)updateWithGameDescriptor:(id)a3;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKGameCacheObject

+ (id)uniqueAttributeName
{
  return @"bundleID";
}

+ (const)uniqueObjectIDLookupKey
{
  return @"GKGameCacheObjectUniqueObjectIDLookupKey";
}

+ (id)fetchSortDescriptors
{
  v2 = +[NSSortDescriptor sortDescriptorWithKey:@"bundleID" ascending:1];
  v6[0] = v2;
  v3 = +[NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:0];
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)gameForGameDescriptor:(id)a3 context:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v11 count:1];
  v8 = +[GKGameCacheObject gamesForGameDescriptors:context:](GKGameCacheObject, "gamesForGameDescriptors:context:", v7, v5, v11);

  v9 = [v8 firstObject];

  return v9;
}

+ (id)gameForBundleID:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v14 = v6;
    v8 = +[NSArray arrayWithObjects:&v14 count:1];
    v9 = [a1 gamesForBundleIDs:v8 context:v7];
    v10 = [v9 lastObject];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v11 = (id)GKOSLoggers();
    }
    v12 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_1000FB8A4(v12);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)gamesForBundleIDs:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB944();
  }
  v8 = +[GKApplicationWorkspace defaultWorkspace];
  v9 = [v8 gameDescriptorsWithInstalledBundleVersionsForBundleIDs:v5];

  v10 = +[GKGameCacheObject _gamesForFullGameDescriptors:v9 context:v6];

  return v10;
}

+ (id)gamesForGameDescriptors:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB978();
  }
  v8 = +[GKApplicationWorkspace defaultWorkspace];
  v9 = [v8 gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:v5];

  v10 = +[GKGameCacheObject _gamesForFullGameDescriptors:v9 context:v6];

  return v10;
}

+ (id)_gamesForFullGameDescriptors:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v7 count]);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000E7318;
  v25[3] = &unk_1002D9E60;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v8;
  [v7 enumerateObjectsUsingBlock:v25];
  v9 = [a1 uniqueObjectIDLookupWithContext:v6];
  v10 = [v8 allKeys];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E7388;
  v21[3] = &unk_1002D9E88;
  id v24 = a1;
  id v11 = v6;
  id v22 = v11;
  id v23 = v8;
  id v12 = v8;
  v13 = [v9 uniqueObjectsForKeys:v10 context:v11 newObject:v21];

  [v13 _gkMapDictionaryWithKeyPath:@"bundleID"];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E740C;
  v18[3] = &unk_1002D8B88;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v11;
  id v14 = v11;
  id v15 = v19;
  v16 = [v7 _gkMapWithBlock:v18];

  return v16;
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)GKGameCacheObject;
  if (![(GKExpiringCacheObject *)&v6 isValid]) {
    return 0;
  }
  v3 = [(GKGameCacheObject *)self name];
  if (v3) {
    BOOL v4 = [(GKCacheObject *)self hasImages];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)updateWithGameDescriptor:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB9AC();
  }
  objc_super v6 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v6, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v7 = +[NSThread callStackSymbols];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameCacheObject updateWithGameDescriptor:]", v7);
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v10 = [v9 lastPathComponent];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v8, "-[GKGameCacheObject updateWithGameDescriptor:]", [v10 UTF8String], 1402);

    +[NSException raise:@"GameKit Exception", @"%@", v11 format];
  }

  if (v4)
  {
    id v12 = [v4 objectForKey:@"bundle-id"];
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v13 = [v12 stringValue];

        id v12 = (void *)v13;
      }
    }
    id v14 = [v4 objectForKey:@"bundle-version"];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v15 = [v14 stringValue];

        id v14 = (void *)v15;
      }
    }
    v16 = [v4 objectForKey:@"short-bundle-version"];
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v17 = [v16 stringValue];

        v16 = (void *)v17;
      }
    }
    v18 = [v4 objectForKey:@"adam-id"];
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v19 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v18 longLongValue]);
        }
        else
        {
          uint64_t v19 = 0;
        }

        v18 = (void *)v19;
      }
    }
    id v20 = [v4 objectForKey:@"external-version"];
    if (v20)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v21 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v20 longLongValue]);
        }
        else
        {
          uint64_t v21 = 0;
        }

        id v20 = (void *)v21;
      }
    }
    id v22 = v20;
    if (v12) {
      [(GKGameCacheObject *)self setBundleID:v12];
    }
    v43 = v12;
    if (v18) {
      [(GKGameCacheObject *)self setAdamID:v18];
    }
    if (v14)
    {
      uint64_t v23 = [(GKGameCacheObject *)self bundleVersion];
      if (!v23
        || (id v24 = (void *)v23,
            [(GKGameCacheObject *)self bundleVersion],
            v25 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v26 = [v14 isEqualToString:v25],
            v25,
            v24,
            (v26 & 1) == 0))
      {
        [(GKGameCacheObject *)self setBundleVersion:v14];
      }
    }
    if (v16)
    {
      uint64_t v27 = [(GKGameCacheObject *)self shortBundleVersion];
      if (!v27
        || (v28 = (void *)v27,
            [(GKGameCacheObject *)self shortBundleVersion],
            v29 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v30 = [v16 isEqualToString:v29],
            v29,
            v28,
            (v30 & 1) == 0))
      {
        [(GKGameCacheObject *)self setShortBundleVersion:v16];
      }
    }
    if (v22)
    {
      uint64_t v31 = [(GKGameCacheObject *)self externalVersion];
      if (!v31
        || (v32 = (void *)v31,
            [(GKGameCacheObject *)self externalVersion],
            v33 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v34 = [v22 isEqualToNumber:v33],
            v33,
            v32,
            (v34 & 1) == 0))
      {
        [(GKGameCacheObject *)self setExternalVersion:v22];
      }
    }
    v42 = v14;
    v35 = [v4 objectForKey:@"platform"];
    v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:v35]);
    [(GKGameCacheObject *)self setPlatform:v36];
    v37 = [v4 objectForKeyedSubscript:@"is-arcade-game"];
    if (v37 && (objc_opt_respondsToSelector() & 1) != 0) {
      -[GKGameCacheObject setIsArcadeGame:](self, "setIsArcadeGame:", [v37 BOOLValue]);
    }
    v38 = [(GKGameCacheObject *)self managedObjectContext];
    v39 = +[GKCachingUtils constructCompatiblePlatforms:v4 moc:v38];
    [(GKGameCacheObject *)self setCompatiblePlatforms:v39];

    v40 = [(GKGameCacheObject *)self managedObjectContext];
    v41 = +[GKCachingUtils constructSupportedTransports:v4 moc:v40];
    [(GKGameCacheObject *)self setSupportedTransportVersions:v41];
  }
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB5D4();
  }
  v9 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v10 = +[NSThread callStackSymbols];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameCacheObject updateWithServerRepresentation:expirationDate:]", v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    [v12 lastPathComponent];
    id v13 = v7;
    id v14 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v11, "-[GKGameCacheObject updateWithServerRepresentation:expirationDate:]", [v14 UTF8String], 1484);

    id v7 = v13;
    +[NSException raise:@"GameKit Exception", @"%@", v15 format];
  }
  if (!v7)
  {
    id v7 = [(GKGameCacheObject *)self expirationDate];
  }
  v50.receiver = self;
  v50.super_class = (Class)GKGameCacheObject;
  [(GKExpiringCacheObject *)&v50 updateWithServerRepresentation:v6 expirationDate:v7];
  v16 = [v6 objectForKey:@"status"];
  id v17 = [v16 integerValue];

  if (v17)
  {
    if (!os_log_GKGeneral) {
      id v18 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
      sub_1000FB9E0();
    }
  }
  else
  {
    uint64_t v19 = [v6 objectForKey:@"game"];
    if (v19)
    {
      id v20 = (void *)v19;
      uint64_t v21 = +[GKApplicationWorkspace defaultWorkspace];
      v51 = v20;
      id v22 = +[NSArray arrayWithObjects:&v51 count:1];
      uint64_t v23 = [v21 gameDescriptorsWithInstalledBundleVersionsForGameDescriptors:v22];
      id v24 = [v23 firstObject];

      [(GKGameCacheObject *)self updateWithGameDescriptor:v24];
    }
    v25 = [v6 objectForKey:@"software-type"];
    [(GKGameCacheObject *)self setSoftwareType:v25];
    unsigned __int8 v26 = [v6 objectForKey:@"name"];

    [(GKGameCacheObject *)self setName:v26];
    uint64_t v27 = [v6 objectForKey:@"is-prerendered"];

    -[GKGameCacheObject setPrerendered:](self, "setPrerendered:", [v27 BOOLValue]);
    v28 = [v6 objectForKey:@"supports-leaderboards"];

    -[GKGameCacheObject setSupportsLeaderboards:](self, "setSupportsLeaderboards:", [v28 BOOLValue]);
    v29 = [v6 objectForKey:@"has-aggregate-leaderboard"];

    -[GKGameCacheObject setHasAggregateLeaderboard:](self, "setHasAggregateLeaderboard:", [v29 BOOLValue]);
    unsigned __int8 v30 = [v6 objectForKey:@"num-leaderboard-categories"];

    -[GKGameCacheObject setNumberOfCategories:](self, "setNumberOfCategories:", [v30 integerValue]);
    uint64_t v31 = [v6 objectForKey:@"num-leaderboard-sets"];

    -[GKGameCacheObject setNumberOfLeaderboardSets:](self, "setNumberOfLeaderboardSets:", [v31 integerValue]);
    [(GKGameCacheObject *)self setSupportsLeaderboardSets:[(GKGameCacheObject *)self numberOfLeaderboardSets] != 0];
    v32 = [v6 objectForKey:@"default-leaderboard-category"];

    [(GKGameCacheObject *)self setDefaultCategory:v32];
    v33 = [v6 objectForKey:@"supports-achievements"];

    -[GKGameCacheObject setSupportsAchievements:](self, "setSupportsAchievements:", [v33 BOOLValue]);
    unsigned __int8 v34 = [v6 objectForKey:@"max-achievements"];

    -[GKGameCacheObject setNumberOfAchievements:](self, "setNumberOfAchievements:", [v34 integerValue]);
    v35 = [v6 objectForKey:@"supports-multi-player"];

    -[GKGameCacheObject setSupportsMultiplayer:](self, "setSupportsMultiplayer:", [v35 BOOLValue]);
    v36 = [v6 objectForKey:@"supports-turn-based-multi-player"];

    -[GKGameCacheObject setSupportsTurnBasedMultiplayer:](self, "setSupportsTurnBasedMultiplayer:", [v36 BOOLValue]);
    v37 = [v6 objectForKey:@"max-achievements-score"];

    -[GKGameCacheObject setMaxAchievementPoints:](self, "setMaxAchievementPoints:", [v37 integerValue]);
    v38 = [v6 objectForKey:@"adam-id"];

    if (v38) {
      [(GKGameCacheObject *)self setAdamID:v38];
    }
    v39 = [v6 objectForKey:@"is-arcade-game"];

    -[GKGameCacheObject setIsArcadeGame:](self, "setIsArcadeGame:", [v39 BOOLValue]);
    v40 = [v6 objectForKey:@"allow-challenges"];

    if ([v40 BOOLValue])
    {
      [(GKGameCacheObject *)self setSupportsChallenges:1];
    }
    else
    {
      v41 = +[GKPreferences shared];
      -[GKGameCacheObject setSupportsChallenges:](self, "setSupportsChallenges:", [v41 supportsChallenges]);
    }
    v42 = [v6 objectForKey:@"allow-leaderboard-challenges"];

    if (v42)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[GKGameCacheObject setSupportsLeaderboardChallenges:](self, "setSupportsLeaderboardChallenges:", [v42 BOOLValue]);
      }
    }
    v43 = [v6 objectForKeyedSubscript:@"image-urls"];

    if (v43) {
      id v44 = [(GKCacheObject *)self updateImagesWithImageURLs:v43];
    }
    v45 = [(GKGameCacheObject *)self managedObjectContext];
    v46 = +[GKCachingUtils constructCompatiblePlatforms:v6 moc:v45];
    [(GKGameCacheObject *)self setCompatiblePlatforms:v46];

    v47 = [v6 objectForKey:@"supported-transports"];

    if (v47)
    {
      v48 = [(GKGameCacheObject *)self managedObjectContext];
      v49 = +[GKCachingUtils constructSupportedTransports:v6 moc:v48];
      [(GKGameCacheObject *)self setSupportedTransportVersions:v49];
    }
  }
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKGameCacheObject internalRepresentation]", [v7 UTF8String], 1585);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  return +[GKGameInternal internalRepresentationForCacheObject:self];
}

- (id)leaderboardSetWithIdentifier:(id)a3
{
  id v4 = +[NSPredicate predicateWithFormat:@"list.game = %@ && identifier = %@", self, a3];
  id v5 = [(GKGameCacheObject *)self managedObjectContext];
  id v6 = +[GKCacheObject firstObjectMatchingPredicate:v4 context:v5];

  return v6;
}

- (id)gameDescriptor
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameCacheObject gameDescriptor]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKGameCacheObject gameDescriptor]", [v7 UTF8String], 1596);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = +[NSMutableDictionary dictionaryWithCapacity:5];
  id v10 = [(GKGameCacheObject *)self bundleID];

  if (v10)
  {
    id v11 = [(GKGameCacheObject *)self bundleID];
    [v9 setObject:v11 forKey:@"bundle-id"];
  }
  id v12 = [(GKGameCacheObject *)self bundleVersion];

  if (v12)
  {
    id v13 = [(GKGameCacheObject *)self bundleVersion];
    [v9 setObject:v13 forKey:@"bundle-version"];
  }
  id v14 = [(GKGameCacheObject *)self shortBundleVersion];

  if (v14)
  {
    uint64_t v15 = [(GKGameCacheObject *)self shortBundleVersion];
    [v9 setObject:v15 forKey:@"short-bundle-version"];
  }
  v16 = [(GKGameCacheObject *)self adamID];

  if (v16)
  {
    id v17 = [(GKGameCacheObject *)self adamID];
    [v9 setObject:v17 forKey:@"adam-id"];
  }
  id v18 = [(GKGameCacheObject *)self externalVersion];

  if (v18)
  {
    uint64_t v19 = [(GKGameCacheObject *)self externalVersion];
    [v9 setObject:v19 forKey:@"external-version"];
  }
  id v20 = [(GKGameCacheObject *)self platform];
  uint64_t v21 = +[GKGameDescriptor stringForPlatform:](GKGameDescriptor, "stringForPlatform:", [v20 integerValue]);

  if (v21) {
    [v9 setObject:v21 forKey:@"platform"];
  }

  return v9;
}

+ (id)entityName
{
  return @"Game";
}

@end