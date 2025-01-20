@interface GKPlayerGameSettingsNetworkRequest
+ (id)bagKey;
- (BOOL)currentlyRunning;
- (BOOL)isDuplicateRequest:(id)a3;
- (BOOL)issueRequests;
- (GKPlayerGameSettingsNetworkRequest)initWithBundleID:(id)a3 value:(id)a4;
- (GKPlayerGameSettingsNetworkRequest)initWithTask:(id)a3;
- (NSMutableDictionary)requestData;
- (NSMutableURLRequest)nsurlRequest;
- (NSString)bundleID;
- (NSString)playerID;
- (NSString)settingValue;
- (NSString)uuid;
- (NSURLSessionTask)nsurlTask;
- (id)postBody;
- (id)taskInfo;
- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5;
- (void)removeFromStore:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCurrentlyRunning:(BOOL)a3;
- (void)setIssueRequests:(BOOL)a3;
- (void)setNsurlRequest:(id)a3;
- (void)setNsurlTask:(id)a3;
- (void)setPlayerID:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setSettingValue:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateWithTaskInfo:(id)a3;
@end

@implementation GKPlayerGameSettingsNetworkRequest

+ (id)bagKey
{
  return @"gk-set-per-game-settings";
}

- (BOOL)isDuplicateRequest:(id)a3
{
  id v4 = a3;
  v5 = [(GKPlayerGameSettingsNetworkRequest *)self settingValue];
  v6 = [v4 settingValue];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (GKPlayerGameSettingsNetworkRequest)initWithBundleID:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GKPlayerGameSettingsNetworkRequest;
  v8 = [(GKPlayerGameSettingsNetworkRequest *)&v13 init];
  if (v8)
  {
    v9 = +[NSUUID UUID];
    v10 = [v9 UUIDString];
    [(GKPlayerGameSettingsNetworkRequest *)v8 setUuid:v10];

    v11 = _localPlayerID();
    [(GKPlayerGameSettingsNetworkRequest *)v8 setPlayerID:v11];

    [(GKPlayerGameSettingsNetworkRequest *)v8 setBundleID:v6];
    [(GKPlayerGameSettingsNetworkRequest *)v8 setSettingValue:v7];
  }

  return v8;
}

- (void)updateWithTaskInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"UUIDKey"];
  [(GKPlayerGameSettingsNetworkRequest *)self setUuid:v5];

  id v6 = [v4 objectForKeyedSubscript:@"BundleIDKey"];
  [(GKPlayerGameSettingsNetworkRequest *)self setBundleID:v6];

  id v7 = [v4 objectForKeyedSubscript:@"PlayerIDKey"];
  [(GKPlayerGameSettingsNetworkRequest *)self setPlayerID:v7];

  id v8 = [v4 objectForKeyedSubscript:@"playerGameSettingsKey"];

  [(GKPlayerGameSettingsNetworkRequest *)self setSettingValue:v8];
}

- (void)handleNetworkRequest:(id)a3 session:(id)a4 clientProxy:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = a3;
  v10 = [(GKPlayerGameSettingsNetworkRequest *)self nsurlRequest];
  v11 = [(GKPlayerGameSettingsNetworkRequest *)self bundleID];
  [v10 setValue:v11 forHTTPHeaderField:@"x-gk-bundle-id"];

  handleStandardRequest(self, v12, v9, v8);
}

- (GKPlayerGameSettingsNetworkRequest)initWithTask:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKPlayerGameSettingsNetworkRequest;
  v5 = [(GKPlayerGameSettingsNetworkRequest *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    [(GKPlayerGameSettingsNetworkRequest *)v5 setNsurlTask:v4];
    id v7 = +[GKNetworkRequestManager dictionaryFromTaskDescription:v4];
    [(GKPlayerGameSettingsNetworkRequest *)v6 updateWithTaskInfo:v7];
  }
  return v6;
}

- (id)postBody
{
  v7[0] = @"allow-friend-list-access";
  v3 = [(GKPlayerGameSettingsNetworkRequest *)self settingValue];
  v7[1] = @"for-bundle-id";
  v8[0] = v3;
  id v4 = [(GKPlayerGameSettingsNetworkRequest *)self bundleID];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)removeFromStore:(id)a3
{
  id v4 = a3;
  v5 = [(GKPlayerGameSettingsNetworkRequest *)self playerID];
  id v6 = [(GKPlayerGameSettingsNetworkRequest *)self bundleID];
  id v9 = [v5 stringByAppendingString:v6];

  id v7 = [v4 currentTasks];
  [v7 removeObjectForKey:v9];

  id v8 = [v4 pendingRequests];

  [v8 removeObjectForKey:v9];
}

- (id)taskInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(GKPlayerGameSettingsNetworkRequest *)self playerID];
  [v3 setObject:v4 forKeyedSubscript:@"PlayerIDKey"];

  v5 = [(GKPlayerGameSettingsNetworkRequest *)self bundleID];
  [v3 setObject:v5 forKeyedSubscript:@"BundleIDKey"];

  id v6 = [(id)objc_opt_class() bagKey];
  [v3 setObject:v6 forKeyedSubscript:@"BagKeyKey"];

  id v7 = [(GKPlayerGameSettingsNetworkRequest *)self uuid];
  [v3 setObject:v7 forKeyedSubscript:@"UUIDKey"];

  id v8 = [(GKPlayerGameSettingsNetworkRequest *)self settingValue];
  [v3 setObject:v8 forKeyedSubscript:@"playerGameSettingsKey"];

  return v3;
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

- (NSString)uuid
{
  return self->uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSMutableDictionary)requestData
{
  return self->requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NSString)settingValue
{
  return self->settingValue;
}

- (void)setSettingValue:(id)a3
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
  objc_storeStrong((id *)&self->settingValue, 0);
  objc_storeStrong((id *)&self->requestData, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->playerID, 0);
  objc_storeStrong((id *)&self->nsurlRequest, 0);

  objc_storeStrong((id *)&self->nsurlTask, 0);
}

@end