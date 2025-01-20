@interface GKTurnBasedParticipantCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3;
@end

@implementation GKTurnBasedParticipantCacheObject

+ (id)entityName
{
  return @"TurnBasedParticipant";
}

- (void)updateWithServerRepresentation:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v6 = +[NSThread callStackSymbols];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedParticipantCacheObject updateWithServerRepresentation:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKTurnBasedParticipantCacheObject updateWithServerRepresentation:]", [v9 UTF8String], 4078);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v23.receiver = self;
  v23.super_class = (Class)GKTurnBasedParticipantCacheObject;
  [(GKCacheObject *)&v23 updateWithServerRepresentation:v4];
  v11 = [v4 objectForKey:@"player-id"];
  if ([v11 length]) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  [(GKTurnBasedParticipantCacheObject *)self setPlayerID:v12];
  v13 = [v4 objectForKey:@"invited-by"];

  if ([v13 length]) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  [(GKTurnBasedParticipantCacheObject *)self setInvitedBy:v14];
  v15 = [v4 objectForKey:@"invite-message"];
  [(GKTurnBasedParticipantCacheObject *)self setInviteMessage:v15];

  v16 = [v4 objectForKey:@"player-status-code"];
  -[GKTurnBasedParticipantCacheObject setOutcome:](self, "setOutcome:", [v16 integerValue]);

  v17 = [v4 objectForKey:@"player-status"];
  [(GKTurnBasedParticipantCacheObject *)self setStatus:v17];

  v18 = [v4 objectForKey:@"guest-id"];
  [(GKTurnBasedParticipantCacheObject *)self setGuestID:v18];

  v19 = [v4 objectForKey:@"player-last-turn-at"];
  if (v19)
  {
    v20 = +[NSDate _gkDateFromServerTimestamp:v19];
    [(GKTurnBasedParticipantCacheObject *)self setLastTurnDate:v20];
  }
  v21 = [v4 objectForKey:@"player-timeout-at"];
  if (v21)
  {
    v22 = +[NSDate _gkDateFromServerTimestamp:v21];
    [(GKTurnBasedParticipantCacheObject *)self setTimeoutDate:v22];
  }
}

- (id)internalRepresentation
{
  return 0;
}

@end