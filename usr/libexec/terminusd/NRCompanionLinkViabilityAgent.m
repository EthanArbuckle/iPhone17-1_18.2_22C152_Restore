@interface NRCompanionLinkViabilityAgent
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

@implementation NRCompanionLinkViabilityAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceStringForLogging, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_registrationObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);
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
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DDF4;
  block[3] = &unk_1001C8BA8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006DF2C;
  block[3] = &unk_1001C8BA8;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (id)copyAgentData
{
  return 0;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(NRCompanionLinkViabilityAgent *)self agentUUID];
  v5 = [v4 UUIDString];
  [v3 appendFormat:@"agent-uuid: %@", v5];

  v6 = "";
  if (self && self->_isRegistered) {
    v6 = ", R";
  }
  [v3 appendFormat:@"%s", v6];
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"[%@]", v3];

  return v7;
}

- (void)dealloc
{
  id v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0;
    }
    v6 = nrUUID;
    id v7 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v14 = 65;
    v15 = self;
    v12 = (NRCompanionLinkViabilityAgent *)"";
    v13 = "-[NRCompanionLinkViabilityAgent dealloc]";
    _NRLogWithArgs();
  }
  if (self)
  {
    if (self->_isRegistered)
    {
      v8 = (void *)_NRCopyLogObjectForNRUUID();
      int v9 = _NRLogIsLevelEnabled();

      if (v9)
      {
        v10 = self->_nrUUID;
        v11 = (void *)_NRCopyLogObjectForNRUUID();
        v12 = self;
        _NRLogWithArgs();
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)NRCompanionLinkViabilityAgent;
  [(NRCompanionLinkViabilityAgent *)&v16 dealloc];
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentDomain
{
  id v2 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", "com.apple.networkrelay"];

  return v2;
}

+ (id)agentType
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "CmpLnkViability"];

  return v2;
}

@end