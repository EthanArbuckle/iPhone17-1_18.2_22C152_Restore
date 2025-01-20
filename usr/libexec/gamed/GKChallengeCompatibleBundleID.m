@interface GKChallengeCompatibleBundleID
+ (id)entityName;
- (id)internalRepresentation;
@end

@implementation GKChallengeCompatibleBundleID

+ (id)entityName
{
  return @"ChallengeCompatibleBundleID";
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKChallengeCompatibleBundleID internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKChallengeCompatibleBundleID internalRepresentation]", [v7 UTF8String], 4676);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  return [(GKChallengeCompatibleBundleID *)self bundleID];
}

@end