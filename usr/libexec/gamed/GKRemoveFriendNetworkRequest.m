@interface GKRemoveFriendNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKRemoveFriendNetworkRequest)initWithFriendPlayerID:(id)a3;
- (GKRemoveFriendNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)description;
- (NSString)friendID;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)requestIdentifier;
- (id)taskInfo;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setFriendID:(id)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKRemoveFriendNetworkRequest

+ (id)bagKey
{
  return @"gk-remove-friend";
}

- (id)postBody
{
  CFStringRef v5 = @"player-id";
  v2 = [(GKRemoveFriendNetworkRequest *)self friendID];
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (GKRemoveFriendNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKRemoveFriendNetworkRequest;
  CFStringRef v5 = [(GKRemoveFriendNetworkRequest *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GKRemoveFriendNetworkRequest *)v5 setNsurlTask:v4];
    v7 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    [(GKRemoveFriendNetworkRequest *)v6 updateWithTaskInfo:v7];
  }
  return v6;
}

- (GKRemoveFriendNetworkRequest)initWithFriendPlayerID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKRemoveFriendNetworkRequest;
  CFStringRef v5 = [(GKRemoveFriendNetworkRequest *)&v10 init];
  if (v5)
  {
    v6 = +[NSUUID UUID];
    v7 = [v6 UUIDString];
    [(GKRemoveFriendNetworkRequest *)v5 setUuid:v7];

    v8 = _localPlayerID();
    [(GKRemoveFriendNetworkRequest *)v5 setPlayerID:v8];

    [(GKRemoveFriendNetworkRequest *)v5 setFriendID:v4];
  }

  return v5;
}

- (id)taskInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKRemoveFriendNetworkRequest *)self playerID];
  [v3 setObject:v4 forKeyedSubscript:@"PlayerIDKey"];

  CFStringRef v5 = [(GKRemoveFriendNetworkRequest *)self friendID];
  [v3 setObject:v5 forKeyedSubscript:@"FriendPlayerIDKey"];

  v6 = [(id)objc_opt_class() bagKey];
  [v3 setObject:v6 forKeyedSubscript:@"BagKeyKey"];

  v7 = [(GKRemoveFriendNetworkRequest *)self uuid];
  [v3 setObject:v7 forKeyedSubscript:@"UUIDKey"];

  return v3;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [v4 objectForKeyedSubscript:@"UUIDKey"];
  [(GKRemoveFriendNetworkRequest *)self setUuid:v5];

  v6 = [v4 objectForKeyedSubscript:@"FriendPlayerIDKey"];
  [(GKRemoveFriendNetworkRequest *)self setFriendID:v6];

  id v7 = [v4 objectForKeyedSubscript:@"PlayerIDKey"];

  [(GKRemoveFriendNetworkRequest *)self setPlayerID:v7];
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (id)requestIdentifier
{
  id v3 = [(GKRemoveFriendNetworkRequest *)self friendID];
  id v4 = [(GKRemoveFriendNetworkRequest *)self playerID];
  CFStringRef v5 = [(id)objc_opt_class() bagKey];
  v6 = +[NSString stringWithFormat:@"%@+%@+%@", v3, v4, v5];

  return v6;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(GKRemoveFriendNetworkRequest *)self playerID];
  CFStringRef v5 = [(GKRemoveFriendNetworkRequest *)self friendID];
  v6 = +[NSString stringWithFormat:@"%@: PlayerID: %@ FriendPlayerID: %@", v3, v4, v5];

  return (NSString *)v6;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(GKRemoveFriendNetworkRequest *)self friendID];
  v6 = [v4 friendID];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (NSString)friendID
{
  return self->friendID;
}

- (void)setFriendID:(id)a3
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

- (NSString)playerID
{
  return self->playerID;
}

- (void)setPlayerID:(id)a3
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
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

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);
  objc_storeStrong((id *)&self->nsurlTask, 0);

  objc_storeStrong((id *)&self->friendID, 0);
}

@end