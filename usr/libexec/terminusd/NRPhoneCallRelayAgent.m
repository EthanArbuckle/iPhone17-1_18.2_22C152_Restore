@interface NRPhoneCallRelayAgent
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

@implementation NRPhoneCallRelayAgent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
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
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015D208;
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
  block[2] = sub_10015D4CC;
  block[3] = &unk_1001C8BA8;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

- (BOOL)requiresAssert
{
  return 1;
}

- (id)copyAgentData
{
  return 0;
}

- (void)dealloc
{
  sub_10015D694((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NRPhoneCallRelayAgent;
  [(NRPhoneCallRelayAgent *)&v3 dealloc];
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentDomain
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "com.apple.networkrelay"];

  return v2;
}

+ (id)agentType
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%s", "PhoneCallRelayAgent"];

  return v2;
}

@end