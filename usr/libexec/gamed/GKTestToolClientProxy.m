@interface GKTestToolClientProxy
- (BOOL)isPosingAsGameCenter;
- (GKGameInternal)testGame;
- (NSString)testProtocolVersion;
- (id)adamID;
- (id)bundleIdentifier;
- (id)bundleShortVersion;
- (id)bundleVersion;
- (id)externalVersion;
- (id)protocolVersion;
- (id)transportWithCredential:(id)a3;
- (void)setTestGame:(id)a3;
- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5;
- (void)setTestProtocolVersion:(id)a3;
@end

@implementation GKTestToolClientProxy

- (void)setTestGame:(id)a3 protocolVersion:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 bundleIdentifier];
  v13 = v12;
  if (!v12
    || ([v12 isEqualToString:GKGameKitTesterIdentifier] & 1) != 0
    || ([v13 isEqualToString:GKGKTester2Identifier] & 1) != 0
    || ([v13 isEqualToString:GKGKTester2OldIdentifier] & 1) != 0
    || ([v13 containsString:@"com.apple.sample"] & 1) != 0
    || ([v13 containsString:@"com.apple.onword"] & 1) != 0
    || ([v13 containsString:@"com.apple.Chess"] & 1) != 0
    || ([v13 containsString:@"com.apple.LameGame"] & 1) != 0
    || ([v13 containsString:@"com.apple.TheCoast"] & 1) != 0
    || [v13 containsString:@"com.apple.Boxes"])
  {
    if (v9)
    {
      v14 = [v9 name];
      v15 = [v9 bundleVersion];
      v16 = +[NSString stringWithFormat:@"%@ (%@, %@)", v14, v13, v15];
    }
    else
    {
      v16 = @"Game Center (default)";
    }
    if (!os_log_GKGeneral) {
      id v17 = (id)GKOSLoggers();
    }
    v18 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "setTestGame: %@ protocolVersion: %@", buf, 0x16u);
    }
    [(GKTestToolClientProxy *)self setTestGame:v9];
    [(GKTestToolClientProxy *)self setTestProtocolVersion:v10];
    v19 = 0;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v21 = (id)GKOSLoggers();
    }
    v22 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10010FF9C((uint64_t)v13, v22);
    }
    NSStringFromSelector(a2);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = +[NSError userErrorForCode:32 description:v16];
  }

  if (v11)
  {
    v20 = [(GKClientProxy *)self replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010F938;
    block[3] = &unk_1002D3930;
    id v25 = v11;
    id v24 = v19;
    dispatch_async(v20, block);
  }
}

- (BOOL)isPosingAsGameCenter
{
  v3 = [(GKTestToolClientProxy *)self testGame];
  if (v3)
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)GKTestToolClientProxy;
    v5 = [(GKClientProxy *)&v7 bundleIdentifier];
    unsigned __int8 v4 = [v5 isEqualToString:GKGameCenterToolIdentifier];
  }
  return v4;
}

- (id)transportWithCredential:(id)a3
{
  id v4 = a3;
  if ([(GKTestToolClientProxy *)self isPosingAsGameCenter])
  {
    v5 = +[GKClientProxy gameCenterClient];
    v6 = [v5 transportWithCredential:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    v6 = [(GKClientProxy *)&v8 transportWithCredential:v4];
  }

  return v6;
}

- (id)bundleIdentifier
{
  if ([(GKTestToolClientProxy *)self isPosingAsGameCenter])
  {
    v3 = +[GKClientProxy gameCenterClient];
    uint64_t v4 = [v3 bundleIdentifier];
  }
  else
  {
    v3 = [(GKTestToolClientProxy *)self testGame];
    if (v3)
    {
      v5 = [(GKTestToolClientProxy *)self testGame];
      v6 = [v5 bundleIdentifier];

      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    uint64_t v4 = [(GKClientProxy *)&v8 bundleIdentifier];
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (id)bundleVersion
{
  if ([(GKTestToolClientProxy *)self isPosingAsGameCenter])
  {
    v3 = +[GKClientProxy gameCenterClient];
    uint64_t v4 = [v3 bundleVersion];
  }
  else
  {
    v3 = [(GKTestToolClientProxy *)self testGame];
    if (v3)
    {
      v5 = [(GKTestToolClientProxy *)self testGame];
      v6 = [v5 bundleVersion];

      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    uint64_t v4 = [(GKClientProxy *)&v8 bundleVersion];
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (id)bundleShortVersion
{
  if ([(GKTestToolClientProxy *)self isPosingAsGameCenter])
  {
    v3 = +[GKClientProxy gameCenterClient];
    uint64_t v4 = [v3 bundleShortVersion];
  }
  else
  {
    v3 = [(GKTestToolClientProxy *)self testGame];
    if (v3)
    {
      v5 = [(GKTestToolClientProxy *)self testGame];
      v6 = [v5 shortBundleVersion];

      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    uint64_t v4 = [(GKClientProxy *)&v8 bundleShortVersion];
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (id)adamID
{
  if ([(GKTestToolClientProxy *)self isPosingAsGameCenter])
  {
    v3 = +[GKClientProxy gameCenterClient];
    uint64_t v4 = [v3 adamID];
  }
  else
  {
    v3 = [(GKTestToolClientProxy *)self testGame];
    if (v3)
    {
      v5 = [(GKTestToolClientProxy *)self testGame];
      v6 = [v5 adamID];

      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    uint64_t v4 = [(GKClientProxy *)&v8 adamID];
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (id)externalVersion
{
  if ([(GKTestToolClientProxy *)self isPosingAsGameCenter])
  {
    v3 = +[GKClientProxy gameCenterClient];
    uint64_t v4 = [v3 externalVersion];
  }
  else
  {
    v3 = [(GKTestToolClientProxy *)self testGame];
    if (v3)
    {
      v5 = [(GKTestToolClientProxy *)self testGame];
      v6 = [v5 externalVersion];

      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    uint64_t v4 = [(GKClientProxy *)&v8 externalVersion];
  }
  v6 = (void *)v4;
LABEL_7:

  return v6;
}

- (id)protocolVersion
{
  v3 = [(GKTestToolClientProxy *)self testProtocolVersion];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GKTestToolClientProxy;
    id v5 = [(GKClientProxy *)&v8 protocolVersion];
  }
  v6 = v5;

  return v6;
}

- (GKGameInternal)testGame
{
  return self->_testGame;
}

- (void)setTestGame:(id)a3
{
}

- (NSString)testProtocolVersion
{
  return self->_testProtocolVersion;
}

- (void)setTestProtocolVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testProtocolVersion, 0);

  objc_storeStrong((id *)&self->_testGame, 0);
}

@end