@interface NRDirectToCloudAgent
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
- (BOOL)requiresAssert;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
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

@implementation NRDirectToCloudAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directToCloudClientNames, 0);
  objc_storeStrong((id *)&self->_directToCloudClients, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceName, 0);
  objc_storeStrong((id *)&self->_registrationObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

- (void)setAgentDescription:(id)a3
{
}

- (NSString)agentDescription
{
  return self->agentDescription;
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
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006EB44;
  v7[3] = &unk_1001C8840;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006F1C8;
  v8[3] = &unk_1001C8840;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(queue, v8);

  return 1;
}

- (id)copyAgentData
{
  return 0;
}

- (BOOL)requiresAssert
{
  return 1;
}

- (void)dealloc
{
  if (qword_1001F49C0 != -1) {
    dispatch_once(&qword_1001F49C0, &stru_1001C6B40);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F49C0 != -1) {
      dispatch_once(&qword_1001F49C0, &stru_1001C6B40);
    }
    id v3 = (id)qword_1001F49B8;
    id v4 = [(NRDirectToCloudAgent *)self agentDescription];
    _NRLogWithArgs();
  }
  sub_10006FA08((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)NRDirectToCloudAgent;
  [(NRDirectToCloudAgent *)&v5 dealloc];
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentType
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "DirectToCloud"];

  return v2;
}

+ (id)agentDomain
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "com.apple.networkrelay"];

  return v2;
}

@end