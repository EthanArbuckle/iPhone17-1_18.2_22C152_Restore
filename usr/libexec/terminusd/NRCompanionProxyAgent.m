@interface NRCompanionProxyAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isNetworkProvider;
- (BOOL)isSpecificUseOnly;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
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
@end

@implementation NRCompanionProxyAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_fallbackPathRegistrationObject, 0);
  objc_storeStrong((id *)&self->_fallbackPathControllerAgent, 0);
  objc_storeStrong((id *)&self->_interface, 0);
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

- (id)copyAgentData
{
  if (self) {
    unint64_t generation = self->_generation;
  }
  else {
    unint64_t generation = 0;
  }
  unint64_t v4 = generation;
  return [objc_alloc((Class)NSData) initWithBytes:&v4 length:8];
}

- (void)dealloc
{
  v3 = (void *)_NRCopyLogObjectForNRUUID();
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
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    v8 = [(NRCompanionProxyAgent *)self agentDescription];

    _NRLogWithArgs();
  }
  if (self)
  {
    if (self->_isRegistered)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      int v10 = _NRLogIsLevelEnabled();

      if (v10)
      {
        v11 = (void *)_NRCopyLogObjectForNRUUID();
        _NRLogWithArgs();
      }
    }
  }
  sub_1000638F4((uint64_t)self);
  v12.receiver = self;
  v12.super_class = (Class)NRCompanionProxyAgent;
  [(NRCompanionProxyAgent *)&v12 dealloc];
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentType
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "CompanionProxy"];

  return v2;
}

+ (id)agentDomain
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "com.apple.networkrelay"];

  return v2;
}

@end