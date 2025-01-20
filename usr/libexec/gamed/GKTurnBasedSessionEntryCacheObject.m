@interface GKTurnBasedSessionEntryCacheObject
+ (id)entityName;
- (id)internalRepresentation;
@end

@implementation GKTurnBasedSessionEntryCacheObject

+ (id)entityName
{
  return @"TurnBasedSessionEntry";
}

- (id)internalRepresentation
{
  v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionEntryCacheObject internalRepresentation]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKTurnBasedSessionEntryCacheObject internalRepresentation]", [v7 UTF8String], 4312);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKTurnBasedSessionEntryCacheObject *)self sessionID];
  v10 = [(GKTurnBasedSessionEntryCacheObject *)self managedObjectContext];
  v11 = +[GKTurnBasedSessionCacheObject sessionWithID:v9 inManagedObjectContext:v10];

  v12 = [v11 internalRepresentation];

  return v12;
}

@end