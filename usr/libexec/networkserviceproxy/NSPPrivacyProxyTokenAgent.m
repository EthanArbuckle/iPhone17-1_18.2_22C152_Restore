@interface NSPPrivacyProxyTokenAgent
+ (id)agentDomain;
+ (id)agentFromData:(id)a3;
+ (id)agentType;
- (BOOL)isActive;
- (BOOL)isKernelActivated;
- (BOOL)isUserActivated;
- (BOOL)isVoluntary;
- (BOOL)reportError:(int)a3 withOptions:(id)a4;
- (NSString)agentDescription;
- (NSUUID)agentUUID;
- (id)copyAgentData;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
- (void)tokenLowWaterMarkReached;
@end

@implementation NSPPrivacyProxyTokenAgent

+ (id)agentDomain
{
  return @"NetworkServiceProxy";
}

+ (id)agentType
{
  return @"TokenAgent";
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (id)copyAgentData
{
  return 0;
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (void)tokenLowWaterMarkReached
{
  v2 = self;
  if (self) {
    self = (NSPPrivacyProxyTokenAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  v3 = self;
  [(NSPPrivacyProxyTokenAgent *)self tokenLowWaterMarkReachedForAgent:v2];
}

- (BOOL)reportError:(int)a3 withOptions:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else {
    id WeakRetained = 0;
  }
  [WeakRetained reportErrorForAgent:self error:v4 withOptions:v6];

  return 1;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (void)setAgentDescription:(id)a3
{
}

- (BOOL)isActive
{
  return self->active;
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end