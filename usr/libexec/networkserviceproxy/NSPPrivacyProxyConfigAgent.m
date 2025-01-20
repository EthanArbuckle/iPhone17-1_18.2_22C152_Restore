@interface NSPPrivacyProxyConfigAgent
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

@implementation NSPPrivacyProxyConfigAgent

+ (id)agentDomain
{
  if (qword_1001231C8 != -1) {
    dispatch_once(&qword_1001231C8, &stru_100105D70);
  }
  v2 = (void *)qword_1001231C0;

  return v2;
}

+ (id)agentType
{
  if (qword_1001231D8 != -1) {
    dispatch_once(&qword_1001231D8, &stru_100105D90);
  }
  v2 = (void *)qword_1001231D0;

  return v2;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (id)copyAgentData
{
  if (self
    && (v2 = self,
        id v3 = objc_getProperty(self, a2, 40, 1),
        self = (NSPPrivacyProxyConfigAgent *)objc_getProperty(v2, v4, 32, 1),
        v3))
  {
    v5 = (NSPPrivacyProxyConfigAgent *)[(NSPPrivacyProxyConfigAgent *)self mutableCopy];
    char v9 = 100;
    unsigned int v8 = [v3 length];
    [(NSPPrivacyProxyConfigAgent *)v5 appendBytes:&v9 length:1];
    [(NSPPrivacyProxyConfigAgent *)v5 appendBytes:&v8 length:4];
    id v6 = [v3 bytes];
    [(NSPPrivacyProxyConfigAgent *)v5 appendBytes:v6 length:v8];
  }
  else
  {
    v5 = self;
    id v3 = 0;
  }

  return v5;
}

+ (id)agentFromData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    SEL v4 = objc_alloc_init(NSPPrivacyProxyConfigAgent);
    id v6 = v4;
    if (v4) {
      objc_setProperty_atomic(v4, v5, v3, 32);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)tokenLowWaterMarkReached
{
  v2 = self;
  if (self) {
    self = (NSPPrivacyProxyConfigAgent *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  id v3 = self;
  [(NSPPrivacyProxyConfigAgent *)self tokenLowWaterMarkReachedForAgent:v2];
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
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configurationHash, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end