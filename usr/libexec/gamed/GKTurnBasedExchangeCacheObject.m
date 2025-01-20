@interface GKTurnBasedExchangeCacheObject
+ (id)entityName;
- (id)internalRepresentation;
- (void)updateWithServerRepresentation:(id)a3 participants:(id)a4;
@end

@implementation GKTurnBasedExchangeCacheObject

+ (id)entityName
{
  return @"TurnBasedExchange";
}

- (void)updateWithServerRepresentation:(id)a3 participants:(id)a4
{
  id v6 = a3;
  id v57 = a4;
  v7 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v7, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    v8 = +[NSThread callStackSymbols];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKTurnBasedExchangeCacheObject updateWithServerRepresentation:participants:]", v8);
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"];
    id v11 = [v10 lastPathComponent];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v9, "-[GKTurnBasedExchangeCacheObject updateWithServerRepresentation:participants:]", [v11 UTF8String], 4116);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  v66.receiver = self;
  v66.super_class = (Class)GKTurnBasedExchangeCacheObject;
  [(GKCacheObject *)&v66 updateWithServerRepresentation:v6];
  v13 = [v6 objectForKeyedSubscript:@"request-id"];
  v56 = v13;
  if ([v13 length]) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  [(GKTurnBasedExchangeCacheObject *)self setExchangeID:v14];
  v15 = [v6 objectForKeyedSubscript:@"status"];
  [(GKTurnBasedExchangeCacheObject *)self setStatusString:v15];

  v16 = [v6 objectForKeyedSubscript:@"data"];
  [(GKTurnBasedExchangeCacheObject *)self setData:v16];

  uint64_t v17 = [v6 objectForKeyedSubscript:@"message"];
  v55 = (void *)v17;
  if (v17)
  {
    v18 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:100 options:0 error:0];
    [(GKTurnBasedExchangeCacheObject *)self setLocalizableMessage:v18];
  }
  else
  {
    [(GKTurnBasedExchangeCacheObject *)self setLocalizableMessage:0];
  }
  uint64_t v19 = [v6 objectForKeyedSubscript:@"sent-at"];
  if (v19)
  {
    v20 = +[NSDate _gkDateFromServerTimestamp:v19];
    [(GKTurnBasedExchangeCacheObject *)self setSendDate:v20];
  }
  uint64_t v21 = [v6 objectForKeyedSubscript:@"timeout-at"];
  if (v21)
  {
    v22 = +[NSDate _gkDateFromServerTimestamp:v21];
    [(GKTurnBasedExchangeCacheObject *)self setTimeoutDate:v22];
  }
  uint64_t v23 = [v6 objectForKeyedSubscript:@"completed-at"];
  if (v23)
  {
    v24 = +[NSDate _gkDateFromServerTimestamp:v23];
    [(GKTurnBasedExchangeCacheObject *)self setCompletionDate:v24];
  }
  v52 = (void *)v23;
  v25 = [v6 objectForKeyedSubscript:@"from-slot"];
  v26 = v25;
  if (v25) {
    -[GKTurnBasedExchangeCacheObject setSenderIndex:](self, "setSenderIndex:", [v25 integerValue]);
  }
  v51 = v26;
  v53 = (void *)v21;
  v54 = (void *)v19;
  v27 = [v6 objectForKeyedSubscript:@"to-slots"];
  if (v27)
  {
    id v28 = [v57 count];
    v29 = +[NSMutableOrderedSet orderedSet];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v30 = v27;
    id v31 = v27;
    id v32 = [v31 countByEnumeratingWithState:&v62 objects:v68 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v63;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(void *)v63 != v34) {
            objc_enumerationMutation(v31);
          }
          int64_t v36 = (int64_t)[*(id *)(*((void *)&v62 + 1) + 8 * i) integerValue];
          if ((v36 & 0x8000000000000000) == 0 || v36 < (uint64_t)v28)
          {
            v37 = [v57 objectAtIndexedSubscript:v36];
            [v29 addObject:v37];
          }
        }
        id v33 = [v31 countByEnumeratingWithState:&v62 objects:v68 count:16];
      }
      while (v33);
    }

    [(GKTurnBasedExchangeCacheObject *)self setRecipients:v29];
    v27 = v30;
  }
  v38 = [(GKTurnBasedExchangeCacheObject *)self managedObjectContext];
  v39 = [(GKTurnBasedExchangeCacheObject *)self replies];
  [v38 _gkDeleteObjects:v39];

  v40 = [v6 objectForKeyedSubscript:@"replies"];
  if ([v40 count])
  {
    v49 = v27;
    id v50 = v6;
    id v41 = [objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:[v40 count]];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v42 = v40;
    id v43 = [v42 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v59;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(void *)v59 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v58 + 1) + 8 * (void)j);
          v48 = [(GKCacheObject *)[GKTurnBasedExchangeReplyCacheObject alloc] initWithManagedObjectContext:v38];
          [(GKTurnBasedExchangeReplyCacheObject *)v48 updateWithServerRepresentation:v47];
          [(GKTurnBasedExchangeReplyCacheObject *)v48 setExchange:self];
          [v41 addObject:v48];
        }
        id v44 = [v42 countByEnumeratingWithState:&v58 objects:v67 count:16];
      }
      while (v44);
    }

    [(GKTurnBasedExchangeCacheObject *)self setReplies:v41];
    v27 = v49;
    id v6 = v50;
  }
}

- (id)internalRepresentation
{
  return 0;
}

@end