@interface NFRemoteAdminState
+ (BOOL)supportsSecureCoding;
- (BOOL)pendingImmediateRetry;
- (NFRemoteAdminState)initWithCoder:(id)a3;
- (NFRemoteAdminState)initWithIdentifier:(id)a3 sourceURL:(id)a4 retryDate:(id)a5;
- (NFRemoteAdminStateRetryInterval)retryInterval;
- (NSDictionary)APNConnectionRequesterFirst;
- (NSDictionary)APNConnectionRequesterLatest;
- (NSDictionary)httpHeaderInfo;
- (NSDictionary)initialClientRequestInfo;
- (NSDictionary)unsentScriptResponse;
- (NSString)serverIdentifier;
- (NSString)sourceUrl;
- (id)description;
- (void)clearRetryInterval;
- (void)encodeWithCoder:(id)a3;
- (void)refreshRetryInterval;
- (void)save;
- (void)setAPNConnectionRequesterFirst:(id)a3;
- (void)setAPNConnectionRequesterLatest:(id)a3;
- (void)setHttpHeaderInfo:(id)a3;
- (void)setInitialClientRequestInfo:(id)a3;
- (void)setPendingImmediateRetry:(BOOL)a3;
- (void)setSourceUrl:(id)a3;
- (void)setUnsentScriptResponse:(id)a3;
- (void)updateNextRetryInterval:(id)a3;
@end

@implementation NFRemoteAdminState

- (NFRemoteAdminState)initWithIdentifier:(id)a3 sourceURL:(id)a4 retryDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NFRemoteAdminState;
  v11 = [(NFRemoteAdminState *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    serverIdentifier = v11->_serverIdentifier;
    v11->_serverIdentifier = v12;

    objc_storeStrong((id *)&v11->_sourceUrl, a4);
    v14 = (NSDate *)[v10 copy];
    retryAfter = v11->_retryAfter;
    v11->_retryAfter = v14;

    v11->_retryCount = 0;
  }

  return v11;
}

- (void)save
{
  sub_100037740();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  sub_100039BDC(v2);
}

- (void)updateNextRetryInterval:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v9)
  {
    v4->_retryCount = v9[1];
    v5 = (void *)v9[2];
  }
  else
  {
    v5 = 0;
    v4->_retryCount = 0;
  }
  id v6 = v5;
  v7 = (NSDate *)[v6 copy];
  retryAfter = v4->_retryAfter;
  v4->_retryAfter = v7;

  objc_sync_exit(v4);
}

- (void)refreshRetryInterval
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_hasPendingConnection)
  {
    obj->_retryCount = 0;
    uint64_t v2 = +[NSDate date];
    retryAfter = obj->_retryAfter;
    obj->_retryAfter = (NSDate *)v2;

    obj->_hasPendingConnection = 0;
    [(NFRemoteAdminState *)obj save];
  }
  objc_sync_exit(obj);
}

- (void)setPendingImmediateRetry:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_hasPendingConnection = a3;
  objc_sync_exit(obj);
}

- (BOOL)pendingImmediateRetry
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL hasPendingConnection = v2->_hasPendingConnection;
  objc_sync_exit(v2);

  return hasPendingConnection;
}

- (void)clearRetryInterval
{
  obj = self;
  objc_sync_enter(obj);
  retryAfter = obj->_retryAfter;
  obj->_retryCount = 0;
  obj->_retryAfter = 0;

  objc_sync_exit(obj);
}

- (NFRemoteAdminStateRetryInterval)retryInterval
{
  v3 = objc_alloc_init(NFRemoteAdminStateRetryInterval);
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    v3->_delayValueIndex = v4->_retryCount;
    objc_setProperty_nonatomic_copy(v3, v5, v4->_retryAfter, 16);
  }
  objc_sync_exit(v4);

  return v3;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(NFRemoteAdminState *)self serverIdentifier];
  uint64_t v5 = [(NFRemoteAdminState *)self retryInterval];
  id v6 = (void *)v5;
  if (v5) {
    v7 = *(void **)(v5 + 16);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  id v9 = "N";
  if ([(NFRemoteAdminState *)self pendingImmediateRetry]) {
    id v10 = "Y";
  }
  else {
    id v10 = "N";
  }
  v11 = [(NFRemoteAdminState *)self unsentScriptResponse];
  if ([v11 count]) {
    id v9 = "Y";
  }
  v12 = [(NFRemoteAdminState *)self sourceUrl];
  id v13 = [v3 initWithFormat:@"{ServerId: %@, retryInterval: %@, immediate: %s, unsent: %s, sourceURL: %@", v4, v8, v10, v9, v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminState)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NFRemoteAdminState;
  uint64_t v5 = [(NFRemoteAdminState *)&v38 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)NSSet);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v37 = [v6 initWithObjects:v7, v8, v9, v10, objc_opt_class(), 0];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverIdentifier"];
    serverIdentifier = v5->_serverIdentifier;
    v5->_serverIdentifier = (NSString *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasPendingConnection"];
    v5->_BOOL hasPendingConnection = [v13 BOOLValue];
    uint64_t v14 = [v4 decodeObjectOfClasses:v37 forKey:@"unsentScriptResponse"];
    unsentScriptResponse = v5->_unsentScriptResponse;
    v5->_unsentScriptResponse = (NSDictionary *)v14;

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retryCount"];

    v5->_retryCount = (unint64_t)[v36 unsignedIntegerValue];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retryAfter"];
    retryAfter = v5->_retryAfter;
    v5->_retryAfter = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceUrl"];
    sourceUrl = v5->_sourceUrl;
    v5->_sourceUrl = (NSString *)v18;

    uint64_t v20 = +[NFNSCheckedDecoder coder:v4 decodeDictOfClass:objc_opt_class() forKey:@"httpHeaderInfo"];
    httpHeaderInfo = v5->_httpHeaderInfo;
    v5->_httpHeaderInfo = (NSDictionary *)v20;

    id v22 = objc_alloc((Class)NSSet);
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    id v30 = [v22 initWithObjects:v23, v24, v25, v26, v27, v28, v29, objc_opt_class(), 0];
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"APNFirstRequester"];
    APNConnectionRequesterFirst = v5->_APNConnectionRequesterFirst;
    v5->_APNConnectionRequesterFirst = (NSDictionary *)v31;

    uint64_t v33 = [v4 decodeObjectOfClasses:v30 forKey:@"APNLastRequester"];
    APNConnectionRequesterLatest = v5->_APNConnectionRequesterLatest;
    v5->_APNConnectionRequesterLatest = (NSDictionary *)v33;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serverIdentifier = self->_serverIdentifier;
  id v7 = a3;
  [v7 encodeObject:serverIdentifier forKey:@"serverIdentifier"];
  uint64_t v5 = +[NSNumber numberWithBool:self->_hasPendingConnection];
  [v7 encodeObject:v5 forKey:@"hasPendingConnection"];

  [v7 encodeObject:self->_unsentScriptResponse forKey:@"unsentScriptResponse"];
  id v6 = +[NSNumber numberWithUnsignedInteger:self->_retryCount];
  [v7 encodeObject:v6 forKey:@"retryCount"];

  [v7 encodeObject:self->_retryAfter forKey:@"retryAfter"];
  [v7 encodeObject:self->_sourceUrl forKey:@"sourceUrl"];
  [v7 encodeObject:self->_httpHeaderInfo forKey:@"httpHeaderInfo"];
  [v7 encodeObject:self->_APNConnectionRequesterFirst forKey:@"APNFirstRequester"];
  [v7 encodeObject:self->_APNConnectionRequesterLatest forKey:@"APNLastRequester"];
}

- (NSString)serverIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)unsentScriptResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnsentScriptResponse:(id)a3
{
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setSourceUrl:(id)a3
{
}

- (NSDictionary)httpHeaderInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHttpHeaderInfo:(id)a3
{
}

- (NSDictionary)APNConnectionRequesterFirst
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAPNConnectionRequesterFirst:(id)a3
{
}

- (NSDictionary)APNConnectionRequesterLatest
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAPNConnectionRequesterLatest:(id)a3
{
}

- (NSDictionary)initialClientRequestInfo
{
  return self->_initialClientRequestInfo;
}

- (void)setInitialClientRequestInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialClientRequestInfo, 0);
  objc_storeStrong((id *)&self->_APNConnectionRequesterLatest, 0);
  objc_storeStrong((id *)&self->_APNConnectionRequesterFirst, 0);
  objc_storeStrong((id *)&self->_httpHeaderInfo, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_unsentScriptResponse, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);

  objc_storeStrong((id *)&self->_retryAfter, 0);
}

@end