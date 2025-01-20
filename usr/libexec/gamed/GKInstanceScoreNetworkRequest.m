@interface GKInstanceScoreNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKInstanceScoreNetworkRequest)initWithInstanceScore:(id)a3 bundleID:(id)a4 challenges:(id)a5;
- (GKInstanceScoreNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)leaderboardID;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)requestIdentifier;
- (id)taskInfo;
- (int64_t)value;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setLeaderboardID:(id)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)setValue:(int64_t)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKInstanceScoreNetworkRequest

+ (id)bagKey
{
  return @"gk-submit-instance-score";
}

- (GKInstanceScoreNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKInstanceScoreNetworkRequest;
  v5 = [(GKInstanceScoreNetworkRequest *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GKInstanceScoreNetworkRequest *)v5 setNsurlTask:v4];
    v7 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    [(GKInstanceScoreNetworkRequest *)v6 updateWithTaskInfo:v7];
  }
  return v6;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"UUIDKey"];
  [(GKInstanceScoreNetworkRequest *)self setUuid:v5];

  v6 = [v4 objectForKeyedSubscript:@"PlayerIDKey"];
  [(GKInstanceScoreNetworkRequest *)self setPlayerID:v6];

  v7 = [v4 objectForKeyedSubscript:@"BundleIDKey"];
  [(GKInstanceScoreNetworkRequest *)self setBundleID:v7];

  v8 = [v4 objectForKeyedSubscript:@"RequestDataKey"];
  [(GKInstanceScoreNetworkRequest *)self setRequestData:v8];

  objc_super v9 = [v4 objectForKeyedSubscript:@"RequestValueKey"];
  -[GKInstanceScoreNetworkRequest setValue:](self, "setValue:", [v9 longValue]);

  id v10 = [v4 objectForKeyedSubscript:@"RequestLeaderboardIDKey"];

  [(GKInstanceScoreNetworkRequest *)self setLeaderboardID:v10];
}

- (GKInstanceScoreNetworkRequest)initWithInstanceScore:(id)a3 bundleID:(id)a4 challenges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GKInstanceScoreNetworkRequest;
  v11 = [(GKInstanceScoreNetworkRequest *)&v24 init];
  if (v11)
  {
    v12 = +[NSUUID UUID];
    v13 = [v12 UUIDString];
    [(GKInstanceScoreNetworkRequest *)v11 setUuid:v13];

    v14 = _localPlayerID();
    [(GKInstanceScoreNetworkRequest *)v11 setPlayerID:v14];

    [(GKInstanceScoreNetworkRequest *)v11 setBundleID:v9];
    v15 = [v8 serverRepresentation];
    id v16 = [v15 mutableCopy];
    [(GKInstanceScoreNetworkRequest *)v11 setRequestData:v16];

    v17 = [v8 leaderboardIdentifier];
    v18 = [(GKInstanceScoreNetworkRequest *)v11 requestData];
    [v18 setObject:v17 forKeyedSubscript:@"leaderboard-id"];

    v19 = [(GKInstanceScoreNetworkRequest *)v11 playerID];
    v20 = [(GKInstanceScoreNetworkRequest *)v11 requestData];
    [v20 setObject:v19 forKeyedSubscript:@"player-id"];

    if (v10)
    {
      v21 = [(GKInstanceScoreNetworkRequest *)v11 requestData];
      [v21 setObject:v10 forKeyedSubscript:@"challenges"];
    }
    -[GKInstanceScoreNetworkRequest setValue:](v11, "setValue:", [v8 value]);
    v22 = [v8 leaderboardIdentifier];
    [(GKInstanceScoreNetworkRequest *)v11 setLeaderboardID:v22];
  }
  return v11;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = [(GKInstanceScoreNetworkRequest *)self requestData];
  v6 = [v4 requestData];

  LOBYTE(v4) = [v5 isEqualToDictionary:v6];
  return (char)v4;
}

- (id)taskInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKInstanceScoreNetworkRequest *)self playerID];
  [v3 setObject:v4 forKeyedSubscript:@"PlayerIDKey"];

  v5 = [(GKInstanceScoreNetworkRequest *)self requestData];
  [v3 setObject:v5 forKeyedSubscript:@"RequestDataKey"];

  v6 = [(id)objc_opt_class() bagKey];
  [v3 setObject:v6 forKeyedSubscript:@"BagKeyKey"];

  v7 = [(GKInstanceScoreNetworkRequest *)self uuid];
  [v3 setObject:v7 forKeyedSubscript:@"UUIDKey"];

  id v8 = [(GKInstanceScoreNetworkRequest *)self bundleID];
  [v3 setObject:v8 forKeyedSubscript:@"BundleIDKey"];

  id v9 = +[NSNumber numberWithLongLong:[(GKInstanceScoreNetworkRequest *)self value]];
  [v3 setObject:v9 forKeyedSubscript:@"RequestValueKey"];

  id v10 = [(GKInstanceScoreNetworkRequest *)self leaderboardID];
  [v3 setObject:v10 forKeyedSubscript:@"RequestLeaderboardIDKey"];

  return v3;
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (id)requestIdentifier
{
  id v3 = networkRequestIdentifier(self);
  id v4 = [(GKInstanceScoreNetworkRequest *)self leaderboardID];
  v5 = +[NSNumber numberWithLongLong:[(GKInstanceScoreNetworkRequest *)self value]];
  v6 = +[NSString stringWithFormat:@"%@%@%@", v3, v4, v5];

  return v6;
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)leaderboardID
{
  return self->leaderboardID;
}

- (void)setLeaderboardID:(id)a3
{
}

- (int64_t)value
{
  return self->value;
}

- (void)setValue:(int64_t)a3
{
  self->value = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->leaderboardID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);

  objc_storeStrong((id *)&self->nsurlRequest, 0);
}

@end