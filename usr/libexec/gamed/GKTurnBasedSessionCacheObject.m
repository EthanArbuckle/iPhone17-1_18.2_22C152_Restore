@interface GKTurnBasedSessionCacheObject
+ (const)uniqueObjectIDLookupKey;
+ (id)entityName;
+ (id)relationshipKeyPathsForPrefetch;
+ (id)sessionWithID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)sessionsWithSessionIDs:(id)a3 inContext:(id)a4;
+ (id)uniqueAttributeName;
- (BOOL)isActive;
- (id)gameData;
- (id)internalRepresentation;
- (id)participantAtIndex:(int64_t)a3;
- (id)participantWithPlayerID:(id)a3;
- (void)deleteGameData;
- (void)expire;
- (void)expireGameData;
- (void)prepareForDeletion;
- (void)saveGameData:(id)a3 expirationDate:(id)a4;
- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4;
@end

@implementation GKTurnBasedSessionCacheObject

+ (id)entityName
{
  return @"TurnBasedSession";
}

+ (id)relationshipKeyPathsForPrefetch
{
  return +[NSArray arrayWithObjects:@"exchanges", @"participants", 0];
}

- (BOOL)isActive
{
  v3 = [(GKTurnBasedSessionCacheObject *)self status];
  if ([v3 isEqualToString:@"Active"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    v5 = [(GKTurnBasedSessionCacheObject *)self status];
    unsigned __int8 v4 = [v5 isEqualToString:@"Invited"];
  }
  return v4;
}

- (void)prepareForDeletion
{
  [(GKTurnBasedSessionCacheObject *)self deleteGameData];
  v3.receiver = self;
  v3.super_class = (Class)GKTurnBasedSessionCacheObject;
  [(GKTurnBasedSessionCacheObject *)&v3 prepareForDeletion];
}

- (id)gameData
{
  objc_super v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    unsigned __int8 v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject gameData]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKTurnBasedSessionCacheObject gameData]", [v7 UTF8String], 3770);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKTurnBasedSessionCacheObject *)self sessionID];
  v10 = GKTurnBasedGameDataCacheRoot();

  if (v10)
  {
    v11 = +[NSData dataWithContentsOfFile:v10];
    if (!v11) {
      [(GKTurnBasedSessionCacheObject *)self setDataExpirationDate:0];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)deleteGameData
{
  objc_super v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    unsigned __int8 v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject deleteGameData]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKTurnBasedSessionCacheObject deleteGameData]", [v7 UTF8String], 3784);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  v9 = [(GKTurnBasedSessionCacheObject *)self sessionID];
  v10 = GKTurnBasedGameDataCacheRoot();

  if (v10)
  {
    v11 = +[NSFileManager defaultManager];
    unsigned int v12 = [v11 removeItemAtPath:v10 error:0];

    if (v12)
    {
      if (!os_log_GKGeneral) {
        id v13 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
        sub_1000FBD24();
      }
    }
  }
  [(GKTurnBasedSessionCacheObject *)self setDataExpirationDate:0];
}

- (void)expireGameData
{
  objc_super v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    unsigned __int8 v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject expireGameData]", v4);
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKTurnBasedSessionCacheObject expireGameData]", [v7 UTF8String], 3797);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  id v9 = +[NSDate date];
  [(GKTurnBasedSessionCacheObject *)self setDataExpirationDate:v9];
}

- (void)saveGameData:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject saveGameData:expirationDate:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v12 = [v11 lastPathComponent];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKTurnBasedSessionCacheObject saveGameData:expirationDate:]", [v12 UTF8String], 3803);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  if (v6)
  {
    v14 = [(GKTurnBasedSessionCacheObject *)self sessionID];
    v15 = GKTurnBasedGameDataCacheRoot();

    if (!v15)
    {
LABEL_15:

      goto LABEL_16;
    }
    id v25 = 0;
    unsigned __int8 v16 = [v6 writeToFile:v15 options:1 error:&v25];
    id v17 = v25;
    v18 = v17;
    if (v16)
    {
LABEL_6:
      id v19 = v7;
LABEL_14:
      [(GKTurnBasedSessionCacheObject *)self setDataExpirationDate:v19];

      goto LABEL_15;
    }
    if ([v17 code] == (id)4)
    {
      v20 = [v15 stringByDeletingLastPathComponent];
      id v21 = objc_alloc_init((Class)NSFileManager);
      if ([v21 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:0])
      {
        id v24 = v18;
        unsigned int v22 = [v6 writeToFile:v15 options:1 error:&v24];
        id v23 = v24;

        if (!v22)
        {
          id v19 = 0;
          v18 = v23;
          goto LABEL_14;
        }
        v18 = v23;
        goto LABEL_6;
      }
    }
    id v19 = 0;
    goto LABEL_14;
  }
  [(GKTurnBasedSessionCacheObject *)self deleteGameData];
LABEL_16:
}

- (id)participantWithPlayerID:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject participantWithPlayerID:]", v6);
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKTurnBasedSessionCacheObject participantWithPlayerID:]", [v9 UTF8String], 3832);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  if (v4)
  {
    v11 = [(GKTurnBasedSessionCacheObject *)self participants];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000F540C;
    v16[3] = &unk_1002D7C38;
    id v17 = v4;
    id v12 = [v11 indexOfObjectPassingTest:v16];

    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v13 = 0;
    }
    else
    {
      v14 = [(GKTurnBasedSessionCacheObject *)self participants];
      id v13 = [v14 objectAtIndex:v12];
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
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
  id v9 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = +[NSThread callStackSymbols];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject updateWithServerRepresentation:expirationDate:]", v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v13 = [v12 lastPathComponent];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v11, "-[GKTurnBasedSessionCacheObject updateWithServerRepresentation:expirationDate:]", [v13 UTF8String], 3853);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  v81.receiver = self;
  v81.super_class = (Class)GKTurnBasedSessionCacheObject;
  [(GKExpiringCacheObject *)&v81 updateWithServerRepresentation:v6 expirationDate:0];
  v15 = [v6 objectForKeyedSubscript:@"session-id"];
  if (v15) {
    [(GKTurnBasedSessionCacheObject *)self setSessionID:v15];
  }
  unsigned __int8 v16 = [v6 objectForKeyedSubscript:@"created-at"];

  if (v16)
  {
    id v17 = +[NSDate _gkDateFromServerTimestamp:v16];
    [(GKTurnBasedSessionCacheObject *)self setCreationDate:v17];
  }
  v18 = [v6 objectForKeyedSubscript:@"session-status"];

  if (v18) {
    [(GKTurnBasedSessionCacheObject *)self setStatus:v18];
  }
  id v19 = [v6 objectForKeyedSubscript:@"current-player-id"];

  if (v19)
  {
    if ([v19 length]) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    [(GKTurnBasedSessionCacheObject *)self setCurrentPlayerID:v20];
  }
  id v21 = [v6 objectForKeyedSubscript:@"current-guest-id"];

  if (v21)
  {
    if ([v21 length]) {
      unsigned int v22 = v21;
    }
    else {
      unsigned int v22 = 0;
    }
    [(GKTurnBasedSessionCacheObject *)self setCurrentGuestID:v22];
  }
  id v23 = [v6 objectForKeyedSubscript:@"last-turn-at"];

  if (v23)
  {
    id v24 = +[NSDate _gkDateFromServerTimestamp:v23];
    [(GKTurnBasedSessionCacheObject *)self setLastTurnDate:v24];
  }
  id v25 = [v6 objectForKeyedSubscript:@"bundle-id"];

  if (v25) {
    [(GKTurnBasedSessionCacheObject *)self setBundleID:v25];
  }
  v26 = [v6 objectForKeyedSubscript:@"bundle-version"];

  if (v26) {
    [(GKTurnBasedSessionCacheObject *)self setBundleVersion:v26];
  }
  v27 = [v6 objectForKeyedSubscript:@"short-bundle-version"];

  if (v27) {
    [(GKTurnBasedSessionCacheObject *)self setShortBundleVersion:v27];
  }
  v28 = [v6 objectForKeyedSubscript:@"platform"];

  if (v28)
  {
    v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:v28]);
    [(GKTurnBasedSessionCacheObject *)self setPlatform:v29];
  }
  v30 = [v6 objectForKeyedSubscript:@"slots"];
  if (v30)
  {
    [(GKTurnBasedSessionCacheObject *)self setExpirationDate:v7];
    v31 = [v6 objectForKeyedSubscript:@"match-id"];

    if (v31) {
      [(GKTurnBasedSessionCacheObject *)self setUnusedID:v31];
    }
    v32 = [v6 objectForKeyedSubscript:@"taken-at"];

    if (v32)
    {
      v33 = +[NSDate _gkDateFromServerTimestamp:v32];
      [(GKTurnBasedSessionCacheObject *)self setLastTurnDate:v33];
    }
    id v69 = v7;
    v34 = [v6 objectForKeyedSubscript:@"delete-at"];

    if (v34)
    {
      v35 = +[NSDate _gkDateFromServerTimestamp:v34];
      [(GKTurnBasedSessionCacheObject *)self setDeletionDate:v35];
    }
    v36 = [v6 objectForKeyedSubscript:@"message"];

    if (v36) {
      [(GKTurnBasedSessionCacheObject *)self setMessage:v36];
    }
    v37 = [v6 objectForKeyedSubscript:@"localized-message"];

    if (v37)
    {
      v38 = +[NSPropertyListSerialization dataWithPropertyList:v37 format:100 options:0 error:0];
      [(GKTurnBasedSessionCacheObject *)self setLocalizableMessage:v38];
    }
    v39 = [v6 objectForKeyedSubscript:@"reason"];

    if (v39) {
      [(GKTurnBasedSessionCacheObject *)self setReason:v39];
    }
    v40 = [v6 objectForKeyedSubscript:@"min-players"];

    if (v40) {
      -[GKTurnBasedSessionCacheObject setMinPlayers:](self, "setMinPlayers:", [v40 integerValue]);
    }
    v41 = [v6 objectForKeyedSubscript:@"max-players"];

    if (v41) {
      -[GKTurnBasedSessionCacheObject setMaxPlayers:](self, "setMaxPlayers:", [v41 integerValue]);
    }
    v42 = [v6 objectForKeyedSubscript:@"whose-turn"];

    if (v42)
    {
      if ([v42 length]) {
        v43 = v42;
      }
      else {
        v43 = 0;
      }
      [(GKTurnBasedSessionCacheObject *)self setCurrentPlayerID:v43];
    }
    v44 = [v6 objectForKeyedSubscript:@"turn-on-slot"];

    if (v44) {
      -[GKTurnBasedSessionCacheObject setCurrentParticipant:](self, "setCurrentParticipant:", [v44 integerValue]);
    }
    v45 = [v6 objectForKeyedSubscript:@"turn-number"];

    if (v45)
    {
      id v46 = [v45 integerValue];
      if (v46 != (id)(int)[(GKTurnBasedSessionCacheObject *)self turnNumber])
      {
        [(GKTurnBasedSessionCacheObject *)self setDataExpirationDate:0];
        [(GKTurnBasedSessionCacheObject *)self setTurnNumber:v46];
      }
    }
    v28 = [v6 objectForKeyedSubscript:@"submitted-by"];

    if (v28)
    {
      if ([v28 length]) {
        v47 = v28;
      }
      else {
        v47 = 0;
      }
      [(GKTurnBasedSessionCacheObject *)self setLastTurnPlayerID:v47];
    }
    v49 = [(GKTurnBasedSessionCacheObject *)self managedObjectContext];
    v50 = [(GKTurnBasedSessionCacheObject *)self mutableOrderedSetValueForKey:@"participants"];
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v50 count]);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000F5E54;
    v79[3] = &unk_1002D8CC8;
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    id v80 = v51;
    [v50 enumerateObjectsUsingBlock:v79];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1000F5ED4;
    v75[3] = &unk_1002D6678;
    id v52 = v51;
    id v76 = v52;
    id v53 = v49;
    id v77 = v53;
    id v54 = v50;
    id v78 = v54;
    [v30 enumerateObjectsUsingBlock:v75];
    v55 = [v52 allValues];
    [v53 _gkDeleteObjects:v55];

    v56 = [v6 objectForKeyedSubscript:@"exchanges"];
    if (v56)
    {
      [(GKTurnBasedSessionCacheObject *)self exchanges];
      v57 = v67 = v48;
      v58 = [v57 _gkMapDictionaryWithKeyPath:@"exchangeID"];
      v68 = v30;
      id v59 = [v58 mutableCopy];

      v60 = [(GKTurnBasedSessionCacheObject *)self mutableOrderedSetValueForKey:@"exchanges"];
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_1000F5FA4;
      v70[3] = &unk_1002D6538;
      id v71 = v59;
      id v61 = v53;
      id v72 = v61;
      id v73 = v54;
      id v74 = v60;
      id v66 = v60;
      id v62 = v59;
      [v56 enumerateObjectsUsingBlock:v70];
      v63 = [v62 allValues];
      [v61 _gkDeleteObjects:v63];

      v48 = v67;
      v30 = v68;
    }

    id v7 = v69;
  }
  v64 = [v6 objectForKeyedSubscript:@"game-state"];

  if (v64) {
    [(GKTurnBasedSessionCacheObject *)self saveGameData:v64 expirationDate:v7];
  }
  v65 = [v6 objectForKeyedSubscript:@"game-state-version"];

  if (v65) {
    [(GKTurnBasedSessionCacheObject *)self setMatchDataVersion:v65];
  }
}

+ (id)sessionWithID:(id)a3 inManagedObjectContext:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];

  id v9 = [a1 sessionsWithSessionIDs:v8 inContext:v6];

  v10 = [v9 lastObject];

  return v10;
}

+ (id)uniqueAttributeName
{
  return @"sessionID";
}

+ (const)uniqueObjectIDLookupKey
{
  return @"GKTurnBasedSessionCacheObjectUniqueObjectIDLookupKey";
}

+ (id)sessionsWithSessionIDs:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FBD8C();
  }
  id v9 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v9, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v10 = +[NSThread callStackSymbols];
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]", v10);
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v13 = [v12 lastPathComponent];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v11, "+[GKTurnBasedSessionCacheObject sessionsWithSessionIDs:inContext:]", [v13 UTF8String], 4035);

    +[NSException raise:@"GameKit Exception", @"%@", v14 format];
  }

  v15 = [a1 uniqueObjectIDLookupWithContext:v7];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000F639C;
  v19[3] = &unk_1002DA2B8;
  id v20 = v7;
  id v21 = a1;
  id v16 = v7;
  id v17 = [v15 uniqueObjectsForKeys:v6 context:v16 newObject:v19];

  return v17;
}

- (void)expire
{
  v4.receiver = self;
  v4.super_class = (Class)GKTurnBasedSessionCacheObject;
  [(GKExpiringCacheObject *)&v4 expire];
  objc_super v3 = [(GKTurnBasedSessionCacheObject *)self expirationDate];
  [(GKTurnBasedSessionCacheObject *)self setDataExpirationDate:v3];
}

- (id)participantAtIndex:(int64_t)a3
{
  v5 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v5, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    id v6 = +[NSThread callStackSymbols];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject participantAtIndex:]", v6);
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v9 = [v8 lastPathComponent];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v7, "-[GKTurnBasedSessionCacheObject participantAtIndex:]", [v9 UTF8String], 4051);

    +[NSException raise:@"GameKit Exception", @"%@", v10 format];
  }

  v11 = [(GKTurnBasedSessionCacheObject *)self participants];
  id v12 = [v11 count];

  if ((unint64_t)v12 <= a3)
  {
    v14 = 0;
  }
  else
  {
    id v13 = [(GKTurnBasedSessionCacheObject *)self participants];
    v14 = [v13 objectAtIndex:a3];
  }

  return v14;
}

- (id)internalRepresentation
{
  objc_super v3 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v3, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    objc_super v4 = +[NSThread callStackSymbols];
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedSessionCacheObject internalRepresentation]", v4);
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v7 = [v6 lastPathComponent];
    id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v5, "-[GKTurnBasedSessionCacheObject internalRepresentation]", [v7 UTF8String], 4061);

    +[NSException raise:@"GameKit Exception", @"%@", v8 format];
  }

  return +[GKTurnBasedMatchInternal internalRepresentationForCacheObject:self];
}

@end