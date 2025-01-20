@interface GKAchievementDescriptionCacheObject
+ (BOOL)getIsPrereleaseFromServerRep:(id)a3;
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKAchievementDescriptionCacheObject

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
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementDescriptionCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKAchievementDescriptionCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 1764);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v26.receiver = self;
  v26.super_class = (Class)GKAchievementDescriptionCacheObject;
  [(GKCacheObject *)&v26 updateWithServerRepresentation:v4];
  v11 = [v4 objectForKey:@"achievement-id"];
  [(GKAchievementDescriptionCacheObject *)self setIdentifier:v11];

  v12 = [v4 objectForKey:@"group-achievement-id"];
  [(GKAchievementDescriptionCacheObject *)self setGroupIdentifier:v12];

  v13 = [v4 objectForKey:@"achievement-title"];
  [(GKAchievementDescriptionCacheObject *)self setTitle:v13];

  v14 = [v4 objectForKey:@"achievement-desc-after"];
  [(GKAchievementDescriptionCacheObject *)self setAchievedDescription:v14];

  v15 = [v4 objectForKey:@"achievement-desc-before"];
  [(GKAchievementDescriptionCacheObject *)self setUnachievedDescription:v15];

  v16 = [v4 objectForKey:@"achievement-max-value"];
  [(GKAchievementDescriptionCacheObject *)self setMaximumPoints:v16];

  v17 = [v4 objectForKey:@"achievement-display-unachieved"];
  -[GKAchievementDescriptionCacheObject setHidden:](self, "setHidden:", [v17 BOOLValue] ^ 1);

  v18 = [v4 objectForKey:@"is-recyclable"];
  -[GKAchievementDescriptionCacheObject setReplayable:](self, "setReplayable:", [v18 BOOLValue]);

  if (+[GKAchievementDescriptionCacheObject getIsPrereleaseFromServerRep:v4])
  {
    uint64_t v19 = 2;
  }
  else
  {
    uint64_t v19 = 1;
  }
  [(GKAchievementDescriptionCacheObject *)self setReleaseState:v19];
  v20 = [v4 objectForKey:@"percentage-players-earned"];
  v21 = v20;
  if (v20)
  {
    [v20 doubleValue];
    v23 = +[NSNumber numberWithDouble:v22 * 100.0];
    [(GKAchievementDescriptionCacheObject *)self setRarityPercent:v23];
  }
  v24 = [v4 objectForKey:@"achievement-image-urls"];
  if (v24) {
    id v25 = [(GKCacheObject *)self updateImagesWithImageURLs:v24];
  }
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKAchievementDescriptionCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKAchievementDescriptionCacheObject internalRepresentation]", [v7 UTF8String], 1789);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  id v9 = +[GKAchievementInternal internalRepresentation];
  v10 = [(GKAchievementDescriptionCacheObject *)self identifier];
  [v9 setIdentifier:v10];

  v11 = [(GKAchievementDescriptionCacheObject *)self title];
  [v9 setTitle:v11];

  v12 = [(GKAchievementDescriptionCacheObject *)self groupIdentifier];
  [v9 setGroupIdentifier:v12];

  v13 = [(GKAchievementDescriptionCacheObject *)self achievedDescription];
  [v9 setAchievedDescription:v13];

  v14 = [(GKAchievementDescriptionCacheObject *)self unachievedDescription];
  [v9 setUnachievedDescription:v14];

  v15 = [(GKAchievementDescriptionCacheObject *)self maximumPoints];
  [v9 setMaximumPoints:(unsigned __int16)[v15 unsignedIntegerValue]];

  [v9 setHidden:-[GKAchievementDescriptionCacheObject hidden](self, "hidden")];
  [v9 setReplayable:-[GKAchievementDescriptionCacheObject replayable](self, "replayable")];
  v16 = [(GKCacheObject *)self imageURLDictionary];
  [v9 setIcons:v16];

  v17 = [(GKAchievementDescriptionCacheObject *)self rarityPercent];
  [v9 setRarityPercent:v17];

  [v9 setReleaseState:-[GKAchievementDescriptionCacheObject releaseState](self, "releaseState")];

  return v9;
}

+ (id)entityName
{
  return @"AchievementDescription";
}

@end