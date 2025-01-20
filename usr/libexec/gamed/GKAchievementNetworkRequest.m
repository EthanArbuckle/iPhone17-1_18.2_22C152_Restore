@interface GKAchievementNetworkRequest
+ (id)bagKey;
+ (int64_t)coalescingDelay;
- (BOOL)coalescingAgent;
- (BOOL)currentlyRunning;
- (BOOL)issueRequests;
- (GKAchievementNetworkRequest)initWithAchievements:(id)a3 bundleID:(id)a4;
- (GKAchievementNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)description;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)taskInfo;
- (int64_t)numberOfRequests;
- (void)addInRequestData:(id *)a3 additional:(id)a4;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6;
- (void)removeFromStore:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCoalescingAgent:(BOOL)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKAchievementNetworkRequest

+ (id)bagKey
{
  return @"gk-submit-achievements";
}

+ (int64_t)coalescingDelay
{
  return 3;
}

- (GKAchievementNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKAchievementNetworkRequest;
  v5 = [(GKAchievementNetworkRequest *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GKAchievementNetworkRequest *)v5 setNsurlTask:v4];
    v7 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    [(GKAchievementNetworkRequest *)v6 updateWithTaskInfo:v7];
  }
  return v6;
}

- (GKAchievementNetworkRequest)initWithAchievements:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)GKAchievementNetworkRequest;
  v8 = [(GKAchievementNetworkRequest *)&v28 init];
  if (v8)
  {
    objc_super v9 = +[NSUUID UUID];
    v10 = [v9 UUIDString];
    [(GKAchievementNetworkRequest *)v8 setUuid:v10];

    v11 = _localPlayerID();
    [(GKAchievementNetworkRequest *)v8 setPlayerID:v11];

    [(GKAchievementNetworkRequest *)v8 setBundleID:v7];
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [(GKAchievementNetworkRequest *)v8 setRequestData:v12];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v6;
    id v14 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v19 = [v18 identifier:v24];

          if (v19)
          {
            v20 = [v18 serverRepresentation];
            v21 = [(GKAchievementNetworkRequest *)v8 requestData];
            v22 = [v18 identifier];
            [v21 setObject:v20 forKeyedSubscript:v22];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v15);
    }
  }
  return v8;
}

- (int64_t)numberOfRequests
{
  v2 = [(GKAchievementNetworkRequest *)self requestData];
  v3 = [v2 allKeys];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  [(GKAchievementNetworkRequest *)self setCoalescingAgent:0];
  [(GKAchievementNetworkRequest *)self setIssueRequests:0];
  v5 = [v4 objectForKeyedSubscript:@"UUIDKey"];
  [(GKAchievementNetworkRequest *)self setUuid:v5];

  id v6 = [v4 objectForKeyedSubscript:@"PlayerIDKey"];
  [(GKAchievementNetworkRequest *)self setPlayerID:v6];

  id v7 = [v4 objectForKeyedSubscript:@"BundleIDKey"];
  [(GKAchievementNetworkRequest *)self setBundleID:v7];

  v8 = [v4 objectForKeyedSubscript:@"RequestDataKey"];
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v16 = [v15 objectForKey:@"achievement-id" v17];
        if (v16) {
          [v9 setObject:v15 forKeyedSubscript:v16];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  [(GKAchievementNetworkRequest *)self setRequestData:v9];
}

- (void)addInRequestData:(id *)a3 additional:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = *a3;
    if (v6)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v24 = v5;
      id obj = [v5 allValues];
      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v28;
        CFStringRef v10 = @"achievement-id";
        do
        {
          id v11 = 0;
          id v25 = v8;
          do
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v11);
            uint64_t v13 = [v12 objectForKeyedSubscript:v10];
            if (v13)
            {
              id v14 = [v6 objectForKeyedSubscript:v13];

              if (v14)
              {
                uint64_t v15 = v9;
                CFStringRef v16 = v10;
                long long v17 = v6;
                long long v18 = [v6 objectForKeyedSubscript:v13];
                long long v19 = [v18 objectForKeyedSubscript:@"achievement-pct"];
                long long v20 = [v12 objectForKeyedSubscript:@"achievement-pct"];
                id v21 = [v20 longValue];
                if ((uint64_t)v21 > (uint64_t)[v19 longValue]) {
                  [v17 setObject:v12 forKeyedSubscript:v13];
                }

                CFStringRef v10 = v16;
                uint64_t v9 = v15;
                id v6 = v17;
                id v8 = v25;
              }
              else
              {
                [v6 setObject:v12 forKeyedSubscript:v13];
              }
            }

            id v11 = (char *)v11 + 1;
          }
          while (v8 != v11);
          id v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v8);
      }

      id v5 = v24;
    }
    else
    {
      *a3 = [v5 copy];
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers();
    }
    v23 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "GKScoreNetworkRequest no incoming data, skipping", buf, 2u);
    }
  }
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6
{
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (id)postBody
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKAchievementNetworkRequest *)self requestData];
  id v5 = [v4 allValues];
  [v3 setObject:v5 forKeyedSubscript:@"achievement-ids"];

  return v3;
}

- (void)removeFromStore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currentTasks];
  id v6 = [(GKAchievementNetworkRequest *)self bundleID];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7
    && ([v7 requestData],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(GKAchievementNetworkRequest *)self requestData],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v8 isEqualToDictionary:v9],
        v9,
        v8,
        v10))
  {
    id v11 = [v4 currentTasks];
    id v12 = [(GKAchievementNetworkRequest *)self bundleID];
    [v11 removeObjectForKey:v12];

    uint64_t v13 = [v4 pendingRequests];
    id v14 = [(GKAchievementNetworkRequest *)self bundleID];
    [v13 removeObjectForKey:v14];
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v15 = (id)GKOSLoggers();
    }
    CFStringRef v16 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "GKAchievementNetworkRequest task completed that was not the current active task, skipping clean up", v17, 2u);
    }
  }
}

- (id)taskInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKAchievementNetworkRequest *)self playerID];
  [v3 setObject:v4 forKeyedSubscript:@"PlayerIDKey"];

  id v5 = [(GKAchievementNetworkRequest *)self requestData];
  id v6 = [v5 allValues];
  [v3 setObject:v6 forKeyedSubscript:@"RequestDataKey"];

  id v7 = [(id)objc_opt_class() bagKey];
  [v3 setObject:v7 forKeyedSubscript:@"BagKeyKey"];

  id v8 = [(GKAchievementNetworkRequest *)self uuid];
  [v3 setObject:v8 forKeyedSubscript:@"UUIDKey"];

  uint64_t v9 = [(GKAchievementNetworkRequest *)self bundleID];
  [v3 setObject:v9 forKeyedSubscript:@"BundleIDKey"];

  return v3;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(GKAchievementNetworkRequest *)self playerID];
  id v5 = +[NSNumber numberWithInteger:[(GKAchievementNetworkRequest *)self numberOfRequests]];
  id v6 = +[NSString stringWithFormat:@"%@: PlayerID: %@ Achievement Count: %@", v3, v4, v5];

  return (NSString *)v6;
}

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSURLSessionTask)nsurlTask
{
  return self->nsurlTask;
}

- (void)setNsurlTask:(id)a3
{
}

- (NSMutableURLRequest)nsurlRequest
{
  return self->nsurlRequest;
}

- (void)setNsurlRequest:(id)a3
{
}

- (BOOL)currentlyRunning
{
  return self->currentlyRunning;
}

- (void)setCurrentlyRunning:(BOOL)a3
{
  self->currentlyRunning = a3;
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)coalescingAgent
{
  return self->coalescingAgent;
}

- (void)setCoalescingAgent:(BOOL)a3
{
  self->coalescingAgent = a3;
}

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);

  objc_storeStrong((id *)&self->playerID, 0);
}

@end