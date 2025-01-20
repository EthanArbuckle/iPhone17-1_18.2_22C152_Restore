@interface GKLeaderboardCacheObject
+ (BOOL)getIsPrereleaseFromServerRep:(id)a3;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKLeaderboardCacheObject

+ (BOOL)getIsPrereleaseFromServerRep:(id)a3
{
  return [a3 BOOLValueFromKey:@"is-prerelease" defaultValue:0];
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKLeaderboardCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKLeaderboardCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 3181);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v51.receiver = self;
  v51.super_class = (Class)GKLeaderboardCacheObject;
  [(GKCacheObject *)&v51 updateWithServerRepresentation:v4];
  id v11 = [v4 objectForKeyedSubscript:@"global-alltime-info"];
  if (!v11) {
    id v11 = v4;
  }
  v12 = [v11 objectForKeyedSubscript:@"leaderboard-id"];
  if (!v12)
  {
    v12 = [v11 objectForKeyedSubscript:@"category-name"];
  }
  if (+[GKLeaderboardCacheObject getIsPrereleaseFromServerRep:v11])
  {
    uint64_t v13 = 2;
  }
  else
  {
    uint64_t v13 = 1;
  }
  [(GKLeaderboardCacheObject *)self setReleaseState:v13];
  v14 = [(GKLeaderboardCacheObject *)self identifier];
  unsigned __int8 v15 = [v14 isEqualToString:v12];

  if ((v15 & 1) == 0)
  {
    [(GKLeaderboardCacheObject *)self setIdentifier:v12];
    v16 = [v4 objectForKeyedSubscript:@"title"];
    if (v16
      || ([v4 objectForKeyedSubscript:@"category-title"],
          (v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(GKLeaderboardCacheObject *)self setLocalizedTitle:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"score-type"];
    if (v17) {
      [(GKLeaderboardCacheObject *)self setScoreType:v17];
    }
    v18 = [v11 objectForKeyedSubscript:@"base-leaderboard-id"];

    if (v18)
    {
      [(GKLeaderboardCacheObject *)self setBaseLeaderboardID:v18];
      v19 = [(GKLeaderboardCacheObject *)self identifier];

      if (!v19) {
        [(GKLeaderboardCacheObject *)self setIdentifier:v18];
      }
    }
    else
    {
      v20 = [(GKLeaderboardCacheObject *)self identifier];
      [(GKLeaderboardCacheObject *)self setBaseLeaderboardID:v20];
    }
    v21 = [v11 objectForKeyedSubscript:@"group-id"];

    if (v21
      || ([v11 objectForKeyedSubscript:@"group-category-name"],
          (v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [(GKLeaderboardCacheObject *)self setGroupIdentifier:v21];
    }
    uint64_t v22 = [v11 objectForKeyedSubscript:@"type"];
    v23 = (void *)v22;
    if (v22) {
      CFStringRef v24 = (const __CFString *)v22;
    }
    else {
      CFStringRef v24 = @"classic";
    }
    [(GKLeaderboardCacheObject *)self setType:v24];
    v25 = [v11 objectForKeyedSubscript:@"start-date"];

    if (v25)
    {
      v26 = +[NSDate _gkDateFromServerTimestamp:v25];
      [(GKLeaderboardCacheObject *)self setStartDate:v26];
    }
    v27 = [v11 objectForKeyedSubscript:@"next-start-date"];

    if (v27)
    {
      v28 = +[NSDate _gkDateFromServerTimestamp:v27];
      [(GKLeaderboardCacheObject *)self setNextStartDate:v28];
    }
    v29 = [v11 objectForKeyedSubscript:@"duration"];

    if (v29) {
      [(GKLeaderboardCacheObject *)self setDuration:v29];
    }
    v30 = [v11 objectForKeyedSubscript:@"rank"];

    if (v30) {
      [(GKLeaderboardCacheObject *)self setRank:v30];
    }
    v31 = [v11 objectForKeyedSubscript:@"leaderboard-size"];

    if (v31) {
      [(GKLeaderboardCacheObject *)self setMaxRank:v31];
    }
    v32 = [v11 objectForKeyedSubscript:@"friend-rank"];

    if (v32) {
      [(GKLeaderboardCacheObject *)self setFriendRank:v32];
    }
    v33 = [v11 objectForKeyedSubscript:@"num-friends-ranked"];

    if (v33) {
      [(GKLeaderboardCacheObject *)self setMaxFriendRank:v33];
    }
    v34 = [v11 objectForKeyedSubscript:@"last-submitted"];

    if (v34)
    {
      v35 = +[NSDate _gkDateFromServerTimestamp:v34];
      [(GKLeaderboardCacheObject *)self setLastSubmittedDate:v35];
    }
    [(GKLeaderboardCacheObject *)self setIsPrimary:1];
    [(GKLeaderboardCacheObject *)self setPreviousInstanceLoaded:0];
    v36 = [(GKLeaderboardCacheObject *)self previousInstance];

    if (v36)
    {
      v37 = [(GKLeaderboardCacheObject *)self managedObjectContext];
      v38 = [(GKLeaderboardCacheObject *)self previousInstance];
      [v37 deleteObject:v38];
    }
    [(GKLeaderboardCacheObject *)self setPreviousInstance:0];
    v39 = +[NSUUID UUID];
    v40 = [v39 UUIDString];
    [(GKLeaderboardCacheObject *)self setRecordID:v40];

    v41 = [v11 objectForKeyedSubscript:@"image-urls"];
    if (v41
      || ([v11 objectForKeyedSubscript:@"category-image-urls"],
          (v41 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v42 = [(GKCacheObject *)self updateImagesWithImageURLs:v41];
    }
    -[GKLeaderboardCacheObject setSupportsChallenges:](self, "setSupportsChallenges:", [v11 BOOLValueFromKey:@"allow-challenges" defaultValue:0]);
    v43 = [v11 objectForKeyedSubscript:@"activity-type"];
    [(GKLeaderboardCacheObject *)self setActivityType:v43];

    v44 = [v11 objectForKeyedSubscript:@"description"];
    [(GKLeaderboardCacheObject *)self setLeaderboardDescription:v44];

    uint64_t v45 = [v11 objectForKeyedSubscript:@"user-info"];
    if (v45)
    {
      v46 = (void *)v45;
      v47 = [v11 objectForKeyedSubscript:@"user-info"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v49 = [v11 objectForKeyedSubscript:@"user-info"];
        v50 = +[NSDictionary dictionaryWithDictionary:v49];
        [(GKLeaderboardCacheObject *)self setUserInfo:v50];
      }
    }
  }
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKLeaderboardCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKLeaderboardCacheObject internalRepresentation]", [v7 UTF8String], 3297);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  id v9 = +[GKLeaderboardInternal internalRepresentation];
  v10 = [(GKLeaderboardCacheObject *)self recordID];
  [v9 setRecordID:v10];

  id v11 = [(GKLeaderboardCacheObject *)self baseLeaderboardID];
  [v9 setBaseLeaderboardID:v11];

  v12 = [(GKLeaderboardCacheObject *)self duration];
  [v12 doubleValue];
  [v9 setDuration:];

  uint64_t v13 = [(GKLeaderboardCacheObject *)self friendRank];
  [v9 setFriendRank:(unsigned __int16)[v13 unsignedIntegerValue]];

  v14 = [(GKLeaderboardCacheObject *)self maxFriendRank];
  [v9 setFriendRankCount:(unsigned __int16)[v14 unsignedIntegerValue]];

  unsigned __int8 v15 = [(GKLeaderboardCacheObject *)self groupIdentifier];
  [v9 setGroupIdentifier:v15];

  v16 = [(GKCacheObject *)self imageURLDictionary];
  [v9 setIcons:v16];

  v17 = [(GKLeaderboardCacheObject *)self identifier];
  [v9 setIdentifier:v17];

  v18 = [(GKLeaderboardCacheObject *)self localizedTitle];
  [v9 setLocalizedTitle:v18];

  v19 = [(GKLeaderboardCacheObject *)self nextStartDate];
  [v9 setNextStartDate:v19];

  v20 = [(GKLeaderboardCacheObject *)self rank];
  [v9 setOverallRank:[v20 unsignedIntegerValue]];

  v21 = [(GKLeaderboardCacheObject *)self maxRank];
  [v9 setOverallRankCount:[v21 unsignedIntegerValue]];

  uint64_t v22 = [(GKLeaderboardCacheObject *)self recordID];
  [v9 setRecordID:v22];

  [v9 setReleaseState:-[GKLeaderboardCacheObject releaseState](self, "releaseState")];
  v23 = [(GKLeaderboardCacheObject *)self startDate];
  [v9 setStartDate:v23];

  CFStringRef v24 = [(GKLeaderboardCacheObject *)self activityType];
  [v9 setActivityType:v24];

  v25 = [(GKLeaderboardCacheObject *)self leaderboardDescription];
  [v9 setLeaderboardDescription:v25];

  v26 = [(GKLeaderboardCacheObject *)self userInfo];
  if (v26)
  {
    v27 = [(GKLeaderboardCacheObject *)self userInfo];
    [v9 setUserInfo:v27];
  }
  else
  {
    [v9 setUserInfo:&__NSDictionary0__struct];
  }

  v28 = [(GKLeaderboardCacheObject *)self type];
  unsigned int v29 = [v28 isEqualToString:@"recurring"];

  [v9 setType:v29];
  [v9 setSupportsChallenges:-[GKLeaderboardCacheObject supportsChallenges](self, "supportsChallenges")];

  return v9;
}

+ (id)entityName
{
  return @"Leaderboard";
}

@end