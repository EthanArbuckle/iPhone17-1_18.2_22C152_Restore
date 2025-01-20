@interface GKMultiplayerGroupRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKMultiplayerGroupRequest)initWithGroupID:(id)a3;
- (GKMultiplayerGroupRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSSet)participants;
- (NSString)bundleID;
- (NSString)playerGroupID;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)requestIdentifier;
- (id)taskInfo;
- (int64_t)playedAt;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPlayedAt:(int64_t)a3;
- (void)setPlayerGroupID:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKMultiplayerGroupRequest

+ (id)bagKey
{
  return @"gk-put-player-group";
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = [(GKMultiplayerGroupRequest *)self playerGroupID];
  v6 = [v4 playerGroupID];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(GKMultiplayerGroupRequest *)self participants];
    v8 = [v4 participants];
    unsigned __int8 v9 = [v7 isEqualToSet:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (GKMultiplayerGroupRequest)initWithGroupID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKMultiplayerGroupRequest;
  v5 = [(GKMultiplayerGroupRequest *)&v10 init];
  if (v5)
  {
    v6 = +[NSUUID UUID];
    v7 = [v6 UUIDString];
    [(GKMultiplayerGroupRequest *)v5 setUuid:v7];

    [(GKMultiplayerGroupRequest *)v5 setPlayerGroupID:v4];
    v8 = _localPlayerID();
    [(GKMultiplayerGroupRequest *)v5 setPlayerID:v8];
  }
  return v5;
}

- (GKMultiplayerGroupRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKMultiplayerGroupRequest;
  v5 = [(GKMultiplayerGroupRequest *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GKMultiplayerGroupRequest *)v5 setNsurlTask:v4];
    v7 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    [(GKMultiplayerGroupRequest *)v6 updateWithTaskInfo:v7];
  }
  return v6;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"UUIDKey"];
  [(GKMultiplayerGroupRequest *)self setUuid:v5];

  v6 = [v4 objectForKeyedSubscript:@"BundleIDKey"];
  [(GKMultiplayerGroupRequest *)self setBundleID:v6];

  v7 = [v4 objectForKeyedSubscript:@"RequestDataKey"];
  [(GKMultiplayerGroupRequest *)self setRequestData:v7];

  v8 = [v4 objectForKeyedSubscript:@"RequestParticipantsKey"];
  objc_super v9 = +[NSSet setWithArray:v8];
  [(GKMultiplayerGroupRequest *)self setParticipants:v9];

  objc_super v10 = [v4 objectForKeyedSubscript:@"RequestPlayerGroupIDKey"];
  [(GKMultiplayerGroupRequest *)self setPlayerGroupID:v10];

  v11 = [v4 objectForKeyedSubscript:@"RequestPlayedAtKey"];
  -[GKMultiplayerGroupRequest setPlayedAt:](self, "setPlayedAt:", [v11 longValue]);

  id v12 = [v4 objectForKeyedSubscript:@"PlayerIDKey"];

  [(GKMultiplayerGroupRequest *)self setPlayerID:v12];
}

- (id)taskInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKMultiplayerGroupRequest *)self uuid];
  [v3 setObject:v4 forKeyedSubscript:@"UUIDKey"];

  v5 = [(GKMultiplayerGroupRequest *)self bundleID];
  [v3 setObject:v5 forKeyedSubscript:@"BundleIDKey"];

  v6 = [(GKMultiplayerGroupRequest *)self requestData];
  [v3 setObject:v6 forKeyedSubscript:@"RequestDataKey"];

  v7 = [(GKMultiplayerGroupRequest *)self participants];
  v8 = [v7 allObjects];
  [v3 setObject:v8 forKeyedSubscript:@"RequestParticipantsKey"];

  objc_super v9 = [(GKMultiplayerGroupRequest *)self playerGroupID];
  [v3 setObject:v9 forKeyedSubscript:@"RequestPlayerGroupIDKey"];

  objc_super v10 = +[NSNumber numberWithInteger:[(GKMultiplayerGroupRequest *)self playedAt]];
  [v3 setObject:v10 forKeyedSubscript:@"RequestPlayedAtKey"];

  v11 = [(GKMultiplayerGroupRequest *)self playerID];
  [v3 setObject:v11 forKeyedSubscript:@"PlayerIDKey"];

  id v12 = [(id)objc_opt_class() bagKey];
  [v3 setObject:v12 forKeyedSubscript:@"BagKeyKey"];

  return v3;
}

- (id)postBody
{
  v14[0] = @"player-group-id";
  id v3 = [(GKMultiplayerGroupRequest *)self playerGroupID];
  v15[0] = v3;
  v14[1] = @"participants";
  id v4 = [(GKMultiplayerGroupRequest *)self participants];
  v5 = [v4 allObjects];
  v15[1] = v5;
  v14[2] = @"game";
  bundleID = self->bundleID;
  CFStringRef v12 = @"bundle-id";
  v13 = bundleID;
  v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[2] = v7;
  v14[3] = @"played-at";
  v8 = +[NSNumber numberWithInteger:[(GKMultiplayerGroupRequest *)self playedAt]];
  v15[3] = v8;
  v14[4] = @"properties";
  objc_super v9 = [(GKMultiplayerGroupRequest *)self requestData];
  v15[4] = v9;
  objc_super v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v10;
}

- (id)requestIdentifier
{
  id v3 = [(GKMultiplayerGroupRequest *)self playerGroupID];
  id v4 = [(GKMultiplayerGroupRequest *)self playerID];
  v5 = [(id)objc_opt_class() bagKey];
  v6 = +[NSString stringWithFormat:@"%@+%@+%@", v3, v4, v5];

  return v6;
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

- (BOOL)issueRequests
{
  return self->issueRequests;
}

- (void)setIssueRequests:(BOOL)a3
{
  self->issueRequests = a3;
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
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

- (NSString)playerGroupID
{
  return self->playerGroupID;
}

- (void)setPlayerGroupID:(id)a3
{
}

- (NSSet)participants
{
  return self->participants;
}

- (void)setParticipants:(id)a3
{
}

- (int64_t)playedAt
{
  return self->_playedAt;
}

- (void)setPlayedAt:(int64_t)a3
{
  self->_playedAt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->participants, 0);
  objc_storeStrong((id *)&self->playerGroupID, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);

  objc_storeStrong((id *)&self->bundleID, 0);
}

@end