@interface GKGameInternal
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKGameInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKGameInternal(Cache) updateWithCacheObject:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKGameInternal(Cache) updateWithCacheObject:]", [v9 UTF8String], 73);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v11 = [v4 bundleID];
  [(GKGameInternal *)self setBundleIdentifier:v11];

  v12 = [v4 bundleVersion];
  [(GKGameInternal *)self setBundleVersion:v12];

  v13 = [v4 shortBundleVersion];
  [(GKGameInternal *)self setShortBundleVersion:v13];

  v14 = [v4 adamID];
  [(GKGameInternal *)self setAdamID:v14];

  v15 = [v4 externalVersion];
  [(GKGameInternal *)self setExternalVersion:v15];

  v16 = [v4 platform];
  -[GKGameInternal setPlatform:](self, "setPlatform:", [v16 integerValue]);

  id v47 = objc_alloc_init((Class)NSMutableSet);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v17 = [v4 compatiblePlatforms];
  id v18 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v55;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v55 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v23 = [v22 name];
        id v24 = [v23 length];

        if (v24)
        {
          v25 = [v22 name];
          [v47 addObject:v25];
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v19);
  }

  v44 = self;
  [(GKGameInternal *)self setCompatiblePlatforms:v47];
  v26 = [v4 supportedTransportVersions];
  v46 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v26 count]);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v45 = v4;
  v27 = [v4 supportedTransportVersions];
  id v28 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v51;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) version];
        if ([v32 isEqualToNumber:&off_1002F2270]
          && (+[GKPreferences shared],
              v33 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v34 = [v33 fastSyncTransportEnabled],
              v33,
              (v34 & 1) == 0))
        {
          if (!os_log_GKGeneral) {
            id v36 = (id)GKOSLoggers();
          }
          v37 = os_log_GKError;
          if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
            sub_10011E878(&buf, v49, v37);
          }
        }
        else if (v32)
        {
          id v35 = [objc_alloc((Class)GKSupportedTransport) initWithVersionNumber:v32];
          [v46 addObject:v35];
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v29);
  }

  [(GKGameInternal *)v44 setSupportedTransports:v46];
  -[GKGameInternal setIsArcadeGame:](v44, "setIsArcadeGame:", [v45 isArcadeGame]);
  -[GKGameInternal setSupportsChallenges:](v44, "setSupportsChallenges:", [v45 supportsChallenges]);
  -[GKGameInternal setSupportsLeaderboardChallenges:](v44, "setSupportsLeaderboardChallenges:", [v45 supportsLeaderboardChallenges]);
  v38 = [v45 name];
  [(GKGameInternal *)v44 setName:v38];

  -[GKGameInternal setPrerendered:](v44, "setPrerendered:", [v45 prerendered]);
  if ([v45 supportsLeaderboards])
  {
    [(GKGameInternal *)v44 setSupportsLeaderboards:1];
    -[GKGameInternal setHasAggregateLeaderboard:](v44, "setHasAggregateLeaderboard:", [v45 hasAggregateLeaderboard]);
    -[GKGameInternal setNumberOfLeaderboards:](v44, "setNumberOfLeaderboards:", (unsigned __int16)[v45 numberOfCategories]);
    v39 = [v45 defaultCategory];
    [(GKGameInternal *)v44 setDefaultLeaderboardIdentifier:v39];
  }
  if ([v45 supportsLeaderboardSets])
  {
    [(GKGameInternal *)v44 setSupportsLeaderboardSets:1];
    -[GKGameInternal setNumberOfLeaderboardSets:](v44, "setNumberOfLeaderboardSets:", (unsigned __int16)[v45 numberOfLeaderboardSets]);
  }
  if ([v45 supportsAchievements])
  {
    [(GKGameInternal *)v44 setSupportsAchievements:1];
    -[GKGameInternal setNumberOfAchievements:](v44, "setNumberOfAchievements:", (unsigned __int16)[v45 numberOfAchievements]);
    -[GKGameInternal setMaxAchievementPoints:](v44, "setMaxAchievementPoints:", (unsigned __int16)[v45 maxAchievementPoints]);
  }
  -[GKGameInternal setSupportsMultiplayer:](v44, "setSupportsMultiplayer:", [v45 supportsMultiplayer]);
  -[GKGameInternal setSupportsTurnBasedMultiplayer:](v44, "setSupportsTurnBasedMultiplayer:", [v45 supportsTurnBasedMultiplayer]);
  v40 = [v45 imageURLDictionary];
  [(GKGameInternal *)v44 setIcons:v40];

  v41 = [v45 expirationDate];
  v42 = +[NSDate distantPast];
  [v41 timeIntervalSinceDate:v42];
  [(GKGameInternal *)v44 setValid:v43 > 0.0];
}

@end