@interface GKAchievementChallengeCacheObject
+ (id)entityName;
- (BOOL)hasDetails;
- (Class)classForInternalRepresentation;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementChallengeCacheObject

+ (id)entityName
{
  return @"AchievementChallenge";
}

- (BOOL)hasDetails
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementChallengeCacheObject hasDetails]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKAchievementChallengeCacheObject hasDetails]", [v7 UTF8String], 4785);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v13.receiver = self;
  v13.super_class = (Class)GKAchievementChallengeCacheObject;
  if (![(GKChallengeCacheObject *)&v13 hasDetails]) {
    return 0;
  }
  v9 = [(GKAchievementChallengeCacheObject *)self identifier];
  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    v11 = [(GKAchievementChallengeCacheObject *)self groupIdentifier];
    BOOL v10 = v11 != 0;
  }
  return v10;
}

- (Class)classForInternalRepresentation
{
  return (Class)objc_opt_class();
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementChallengeCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKAchievementChallengeCacheObject internalRepresentation]", [v7 UTF8String], 4796);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKAchievementChallengeCacheObject *)self list];
  BOOL v10 = [v9 player];

  v22.receiver = self;
  v22.super_class = (Class)GKAchievementChallengeCacheObject;
  v11 = [(GKChallengeCacheObject *)&v22 internalRepresentation];
  v12 = +[GKAchievementInternal internalRepresentation];
  objc_super v13 = [(GKAchievementChallengeCacheObject *)self identifier];
  [v12 setIdentifier:v13];

  v14 = [(GKAchievementChallengeCacheObject *)self groupIdentifier];
  [v12 setGroupIdentifier:v14];

  v15 = [(GKAchievementChallengeCacheObject *)self date];
  [v12 setLastReportedDate:v15];

  [(GKAchievementChallengeCacheObject *)self percentComplete];
  [v12 setPercentComplete:v16];
  v17 = [v10 internalRepresentation];
  [v12 setPlayer:v17];

  v18 = [(GKAchievementChallengeCacheObject *)self title];
  [v12 setTitle:v18];

  v19 = [(GKAchievementChallengeCacheObject *)self maximumPoints];
  [v12 setMaximumPoints:(unsigned __int16)[v19 integerValue]];

  [v12 setHidden:-[GKAchievementChallengeCacheObject hidden](self, "hidden")];
  [v12 setReplayable:-[GKAchievementChallengeCacheObject replayable](self, "replayable")];
  v20 = [(GKCacheObject *)self imageURLDictionary];
  [v12 setIcons:v20];

  [v11 setAchievement:v12];

  return v11;
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementChallengeCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    BOOL v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKAchievementChallengeCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 4821);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v28.receiver = self;
  v28.super_class = (Class)GKAchievementChallengeCacheObject;
  [(GKChallengeCacheObject *)&v28 updateWithServerRepresentation:v4];
  v11 = [v4 objectForKey:@"achievement"];
  v12 = v11;
  if (v11)
  {
    objc_super v13 = [v11 objectForKey:@"achievement-id"];
    [(GKAchievementChallengeCacheObject *)self setIdentifier:v13];

    v14 = [v12 objectForKey:@"achievement-group-id"];
    [(GKAchievementChallengeCacheObject *)self setGroupIdentifier:v14];

    v15 = [v12 objectForKey:@"achievement-pct"];
    [v15 floatValue];
    -[GKAchievementChallengeCacheObject setPercentComplete:](self, "setPercentComplete:");

    float v16 = [v12 objectForKey:@"timestamp"];
    v17 = +[NSDate _gkDateFromServerTimestamp:v16];
    [(GKAchievementChallengeCacheObject *)self setDate:v17];
  }
  v18 = [v4 objectForKeyedSubscript:@"achievement-description"];
  v19 = v18;
  if (v18)
  {
    v20 = [v18 objectForKeyedSubscript:@"achievement-id"];
    [(GKAchievementChallengeCacheObject *)self setIdentifier:v20];

    v21 = [v12 objectForKey:@"group-achievement-id"];
    [(GKAchievementChallengeCacheObject *)self setGroupIdentifier:v21];

    objc_super v22 = [v19 objectForKeyedSubscript:@"achievement-image-urls"];
    if (v22) {
      id v23 = [(GKCacheObject *)self updateImagesWithImageURLs:v22];
    }
    v24 = [v19 objectForKeyedSubscript:@"achievement-title"];
    [(GKAchievementChallengeCacheObject *)self setTitle:v24];

    v25 = [v19 objectForKeyedSubscript:@"achievement-max-value"];
    [(GKAchievementChallengeCacheObject *)self setMaximumPoints:v25];

    v26 = [v19 objectForKeyedSubscript:@"achievement-display-unachieved"];
    -[GKAchievementChallengeCacheObject setHidden:](self, "setHidden:", [v26 BOOLValue] ^ 1);

    v27 = [v19 objectForKeyedSubscript:@"is-recyclable"];
    -[GKAchievementChallengeCacheObject setReplayable:](self, "setReplayable:", [v27 BOOLValue]);
  }
}

@end