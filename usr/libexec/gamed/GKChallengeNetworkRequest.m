@interface GKChallengeNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKChallengeNetworkRequest)initWithChallenges:(id)a3 bundleID:(id)a4;
- (GKChallengeNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableSet)challenges;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)description;
- (NSString)playerID;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)taskInfo;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)mergeRequestData:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setChallenges:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKChallengeNetworkRequest

+ (id)bagKey
{
  return @"gk-issue-challenges";
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
}

- (GKChallengeNetworkRequest)initWithChallenges:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKChallengeNetworkRequest;
  v8 = [(GKChallengeNetworkRequest *)&v13 init];
  if (v8)
  {
    v9 = +[NSUUID UUID];
    v10 = [v9 UUIDString];
    [(GKChallengeNetworkRequest *)v8 setUuid:v10];

    v11 = _localPlayerID();
    [(GKChallengeNetworkRequest *)v8 setPlayerID:v11];

    [(GKChallengeNetworkRequest *)v8 setChallenges:v6];
    [(GKChallengeNetworkRequest *)v8 setBundleID:v7];
  }

  return v8;
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = [(GKChallengeNetworkRequest *)self challenges];
  id v6 = [v4 challenges];

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (void)mergeRequestData:(id)a3
{
  id v4 = a3;
  id v6 = [(GKChallengeNetworkRequest *)self challenges];
  v5 = [v4 challenges];

  [v6 unionSet:v5];
}

- (GKChallengeNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKChallengeNetworkRequest;
  v5 = [(GKChallengeNetworkRequest *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    [(GKChallengeNetworkRequest *)v5 setNsurlTask:v4];
    id v7 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    [(GKChallengeNetworkRequest *)v6 updateWithTaskInfo:v7];
  }
  return v6;
}

- (id)postBody
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKChallengeNetworkRequest *)self challenges];
  v5 = [v4 allObjects];
  [v3 setObject:v5 forKeyedSubscript:@"challenges"];

  return v3;
}

- (id)taskInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKChallengeNetworkRequest *)self playerID];
  [v3 setObject:v4 forKeyedSubscript:@"PlayerIDKey"];

  v5 = [(GKChallengeNetworkRequest *)self challenges];
  id v6 = [v5 allObjects];
  [v3 setObject:v6 forKeyedSubscript:@"ChallengesTaskKey"];

  id v7 = [(id)objc_opt_class() bagKey];
  [v3 setObject:v7 forKeyedSubscript:@"BagKeyKey"];

  v8 = [(GKChallengeNetworkRequest *)self uuid];
  [v3 setObject:v8 forKeyedSubscript:@"UUIDKey"];

  objc_super v9 = [(GKChallengeNetworkRequest *)self bundleID];
  [v3 setObject:v9 forKeyedSubscript:@"BundleIDKey"];

  return v3;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"UUIDKey"];
  [(GKChallengeNetworkRequest *)self setUuid:v5];

  id v6 = [v4 objectForKeyedSubscript:@"PlayerIDKey"];
  [(GKChallengeNetworkRequest *)self setPlayerID:v6];

  id v7 = [v4 objectForKeyedSubscript:@"ChallengesTaskKey"];
  v8 = +[NSSet setWithArray:v7];
  id v9 = [v8 mutableCopy];
  [(GKChallengeNetworkRequest *)self setChallenges:v9];

  id v10 = [v4 objectForKeyedSubscript:@"BundleIDKey"];

  [(GKChallengeNetworkRequest *)self setBundleID:v10];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(GKChallengeNetworkRequest *)self playerID];
  v5 = [(GKChallengeNetworkRequest *)self challenges];
  id v6 = +[NSString stringWithFormat:@"%@: PlayerID: %@ Challenges: %@", v3, v4, v5];

  return (NSString *)v6;
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

- (NSMutableSet)challenges
{
  return self->challenges;
}

- (void)setChallenges:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->challenges, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);

  objc_storeStrong((id *)&self->nsurlTask, 0);
}

@end