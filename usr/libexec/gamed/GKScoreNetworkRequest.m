@interface GKScoreNetworkRequest
+ (id)bagKey;
+ (int64_t)coalescingDelay;
- (BOOL)coalescingAgent;
- (BOOL)currentlyRunning;
- (BOOL)issueRequests;
- (GKScoreNetworkRequest)initWithScores:(id)a3 bundleID:(id)a4 eligibleChallenges:(id)a5;
- (GKScoreNetworkRequest)initWithTask:(id)a3;
- (NSArray)challengeIDs;
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
- (void)setChallengeIDs:(id)a3;
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

@implementation GKScoreNetworkRequest

+ (id)bagKey
{
  return @"gk-submit-scores";
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (GKScoreNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKScoreNetworkRequest;
  v5 = [(GKScoreNetworkRequest *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GKScoreNetworkRequest *)v5 setNsurlTask:v4];
    v7 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    [(GKScoreNetworkRequest *)v6 updateWithTaskInfo:v7];
  }
  return v6;
}

- (GKScoreNetworkRequest)initWithScores:(id)a3 bundleID:(id)a4 eligibleChallenges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)GKScoreNetworkRequest;
  v11 = [(GKScoreNetworkRequest *)&v29 init];
  if (v11)
  {
    v12 = +[NSUUID UUID];
    v13 = [v12 UUIDString];
    [(GKScoreNetworkRequest *)v11 setUuid:v13];

    v14 = _localPlayerID();
    [(GKScoreNetworkRequest *)v11 setPlayerID:v14];

    [(GKScoreNetworkRequest *)v11 setBundleID:v9];
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    [(GKScoreNetworkRequest *)v11 setRequestData:v15];

    id v16 = objc_alloc_init((Class)NSMutableSet);
    v17 = [(GKScoreNetworkRequest *)v11 requestData];
    [v17 setObject:v16 forKeyedSubscript:@"RequestDataKey"];

    [(GKScoreNetworkRequest *)v11 setChallengeIDs:v10];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v22) serverRepresentation:(void)v25];
          [v16 addObject:v23];

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v20);
    }
  }
  return v11;
}

- (int64_t)numberOfRequests
{
  v2 = [(GKScoreNetworkRequest *)self requestData];
  v3 = [v2 objectForKeyedSubscript:@"RequestDataKey"];

  id v4 = [v3 count];
  return (int64_t)v4;
}

- (id)postBody
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKScoreNetworkRequest *)self requestData];
  v5 = [v4 objectForKeyedSubscript:@"RequestDataKey"];

  v6 = [v5 allObjects];
  [v3 setObject:v6 forKeyedSubscript:@"scores"];

  v7 = [(GKScoreNetworkRequest *)self challengeIDs];
  [v3 setObject:v7 forKeyedSubscript:@"eligible-challenges"];

  return v3;
}

- (void)removeFromStore:(id)a3
{
  id v4 = a3;
  v5 = [v4 currentTasks];
  v6 = [(GKScoreNetworkRequest *)self bundleID];
  [v5 removeObjectForKey:v6];

  id v8 = [v4 pendingRequests];

  v7 = [(GKScoreNetworkRequest *)self bundleID];
  [v8 removeObjectForKey:v7];
}

- (id)taskInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKScoreNetworkRequest *)self playerID];
  [v3 setObject:v4 forKeyedSubscript:@"PlayerIDKey"];

  v5 = [(GKScoreNetworkRequest *)self requestData];
  v6 = [v5 objectForKeyedSubscript:@"RequestDataKey"];

  v7 = [v6 allObjects];
  [v3 setObject:v7 forKeyedSubscript:@"RequestDataKey"];

  id v8 = [(id)objc_opt_class() bagKey];
  [v3 setObject:v8 forKeyedSubscript:@"BagKeyKey"];

  id v9 = [(GKScoreNetworkRequest *)self uuid];
  [v3 setObject:v9 forKeyedSubscript:@"UUIDKey"];

  id v10 = [(GKScoreNetworkRequest *)self bundleID];
  [v3 setObject:v10 forKeyedSubscript:@"BundleIDKey"];

  v11 = [(GKScoreNetworkRequest *)self challengeIDs];
  [v3 setObject:v11 forKeyedSubscript:@"challengesIDKey"];

  return v3;
}

- (void)addInRequestData:(id *)a3 additional:(id)a4
{
  id v6 = *a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"RequestDataKey"];

  if (v8)
  {
    id v12 = [v7 objectForKeyedSubscript:@"RequestDataKey"];

    id v9 = [v6 objectForKeyedSubscript:@"RequestDataKey"];

    [v9 unionSet:v12];
  }
  else
  {
    id v10 = [v7 copy];

    id v11 = v10;
    *a3 = v11;
  }
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5 previousKnownPendingAmount:(int64_t)a6
{
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  [(GKScoreNetworkRequest *)self setCoalescingAgent:0];
  [(GKScoreNetworkRequest *)self setIssueRequests:0];
  v5 = [v4 objectForKeyedSubscript:@"UUIDKey"];
  [(GKScoreNetworkRequest *)self setUuid:v5];

  id v6 = [v4 objectForKeyedSubscript:@"PlayerIDKey"];
  [(GKScoreNetworkRequest *)self setPlayerID:v6];

  id v7 = [v4 objectForKeyedSubscript:@"BundleIDKey"];
  [(GKScoreNetworkRequest *)self setBundleID:v7];

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [(GKScoreNetworkRequest *)self setRequestData:v8];

  id v9 = [v4 objectForKeyedSubscript:@"challengesIDKey"];
  [(GKScoreNetworkRequest *)self setChallengeIDs:v9];

  id v12 = [v4 objectForKeyedSubscript:@"RequestDataKey"];

  id v10 = +[NSMutableSet setWithArray:v12];
  id v11 = [(GKScoreNetworkRequest *)self requestData];
  [v11 setObject:v10 forKeyedSubscript:@"RequestDataKey"];
}

+ (int64_t)coalescingDelay
{
  return 3;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(GKScoreNetworkRequest *)self playerID];
  v5 = [(GKScoreNetworkRequest *)self requestData];
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  id v7 = [(GKScoreNetworkRequest *)self challengeIDs];
  id v8 = +[NSString stringWithFormat:@"%@: PlayerID: %@ Scores: %@ challengeIDs: %@", v3, v4, v6, v7];

  return (NSString *)v8;
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
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

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (NSMutableURLRequest)nsurlRequest
{
  return self->nsurlRequest;
}

- (void)setNsurlRequest:(id)a3
{
}

- (NSURLSessionTask)nsurlTask
{
  return self->nsurlTask;
}

- (void)setNsurlTask:(id)a3
{
}

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSArray)challengeIDs
{
  return self->challengeIDs;
}

- (void)setChallengeIDs:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->challengeIDs, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);

  objc_storeStrong((id *)&self->bundleID, 0);
}

@end