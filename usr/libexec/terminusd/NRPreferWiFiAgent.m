@interface NRPreferWiFiAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)assertAgentWithOptions:(id)a3;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)startAgentWithOptions:(id)a3;
- (NRPreferWiFiAgent)init;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (id)description;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setNetworkProvider:(BOOL)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation NRPreferWiFiAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_p2pClientUUIDSet, 0);
  objc_storeStrong((id *)&self->_clientUUIDToPathDictionary, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_registrationObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

- (void)setNetworkProvider:(BOOL)a3
{
  self->networkProvider = a3;
}

- (BOOL)isNetworkProvider
{
  return self->networkProvider;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setAgentDescription:(id)a3
{
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentUUID:(id)a3
{
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5) {
    queue = v5->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100065AB4;
  v8[3] = &unk_1001C8840;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_sync_exit(v5);
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5) {
    queue = v5->_queue;
  }
  else {
    queue = 0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006622C;
  v9[3] = &unk_1001C8840;
  v9[4] = v5;
  id v10 = v4;
  id v7 = v4;
  dispatch_async(queue, v9);

  objc_sync_exit(v5);
  return 1;
}

- (BOOL)startAgentWithOptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (qword_1001F4950 != -1) {
    dispatch_once(&qword_1001F4950, &stru_1001C69D8);
  }
  id v6 = (id)qword_1001F4948;
  char IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    if (qword_1001F4950 != -1) {
      dispatch_once(&qword_1001F4950, &stru_1001C69D8);
    }
    id v8 = (id)qword_1001F4948;
    _NRLogWithArgs();
  }
  objc_sync_exit(v5);

  return 0;
}

- (id)copyAgentData
{
  return 0;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v4 = [(NRPreferWiFiAgent *)self agentUUID];
  [v3 appendFormat:@"agent UUID: %@\n", v4];

  if (self)
  {
    [v3 appendFormat:@"registration handle: %@\n", self->_registrationObject];
    uint64_t assertCount = self->_assertCount;
  }
  else
  {
    [v3 appendFormat:@"registration handle: %@\n", 0];
    uint64_t assertCount = 0;
  }
  [v3 appendFormat: @"assert count: %d\n", assertCount];

  return v3;
}

- (void)dealloc
{
  if (qword_1001F4950 != -1) {
    dispatch_once(&qword_1001F4950, &stru_1001C69D8);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4950 != -1) {
      dispatch_once(&qword_1001F4950, &stru_1001C69D8);
    }
    uint64_t v5 = 55;
    id v6 = self;
    id v3 = "";
    id v4 = "-[NRPreferWiFiAgent dealloc]";
    _NRLogWithArgs();
  }
  if (self)
  {
    if (self->_isRegistered)
    {
      if (qword_1001F4950 != -1) {
        dispatch_once(&qword_1001F4950, &stru_1001C69D8);
      }
      if (_NRLogIsLevelEnabled())
      {
        if (qword_1001F4950 != -1) {
          dispatch_once(&qword_1001F4950, &stru_1001C69D8);
        }
        _NRLogWithArgs();
      }
    }
    self->_invalidated = 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)NRPreferWiFiAgent;
  [(NRPreferWiFiAgent *)&v7 dealloc];
}

- (NRPreferWiFiAgent)init
{
  v21.receiver = self;
  v21.super_class = (Class)NRPreferWiFiAgent;
  v2 = [(NRPreferWiFiAgent *)&v21 init];
  if (!v2)
  {
    id v17 = sub_100066BF8();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v19 = sub_100066BF8();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136446210;
    *(void *)(v20 + 4) = "-[NRPreferWiFiAgent init]";
    sub_100066BF8();
    _NRLogAbortWithPack();
  }
  id v3 = v2;
  [(NRPreferWiFiAgent *)v2 setActive:0];
  [(NRPreferWiFiAgent *)v3 setKernelActivated:1];
  [(NRPreferWiFiAgent *)v3 setUserActivated:1];
  [(NRPreferWiFiAgent *)v3 setVoluntary:1];
  [(NRPreferWiFiAgent *)v3 setNetworkProvider:1];
  [(NRPreferWiFiAgent *)v3 setSpecificUseOnly:1];
  id v4 = +[NSUUID UUID];
  [(NRPreferWiFiAgent *)v3 setAgentUUID:v4];

  id v5 = objc_alloc((Class)NSString);
  id v6 = [(NRPreferWiFiAgent *)v3 agentUUID];
  objc_super v7 = [v6 UUIDString];
  id v8 = (NSString *)[v5 initWithFormat:@"NRPreferWiFiAgent-%@", v7];
  policyIdentifier = v3->_policyIdentifier;
  v3->_policyIdentifier = v8;

  id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  clientUUIDToPathDictionary = v3->_clientUUIDToPathDictionary;
  v3->_clientUUIDToPathDictionary = v10;

  v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
  p2pClientUUIDSet = v3->_p2pClientUUIDSet;
  v3->_p2pClientUUIDSet = v12;

  v14 = [(NRPreferWiFiAgent *)v3 agentUUID];
  v15 = [v14 UUIDString];
  sub_10012F648(0, 15001, 0, v15);

  return v3;
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentType
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "PreferWiFi"];

  return v2;
}

+ (id)agentDomain
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "com.apple.networkrelay"];

  return v2;
}

@end