@interface WiFiUserInteractionMonitorNetworkAgent
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
- (NWNetworkAgentRegistration)registration;
- (WiFiUserInteractionMonitorClient)client;
- (WiFiUserInteractionMonitorNetworkAgent)initWithUUID:(id)a3 andDescription:(id)a4;
- (id)copyAgentData;
- (unint64_t)assertCount;
- (unint64_t)avcMinJB;
- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4;
- (void)setActive:(BOOL)a3;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setAssertCount:(unint64_t)a3;
- (void)setAvcMinJB:(unint64_t)a3;
- (void)setClient:(id)a3;
- (void)setKernelActivated:(BOOL)a3;
- (void)setNetworkProvider:(BOOL)a3;
- (void)setRegistration:(id)a3;
- (void)setSpecificUseOnly:(BOOL)a3;
- (void)setUserActivated:(BOOL)a3;
- (void)setVoluntary:(BOOL)a3;
- (void)unassertAgentWithOptions:(id)a3;
@end

@implementation WiFiUserInteractionMonitorNetworkAgent

- (BOOL)isActive
{
  return self->active;
}

+ (id)agentDomain
{
  return @"WiFiUserInteractionMonitor";
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

+ (id)agentType
{
  return @"WiFiTrafficAssertion";
}

- (id)copyAgentData
{
  return 0;
}

- (WiFiUserInteractionMonitorNetworkAgent)initWithUUID:(id)a3 andDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WiFiUserInteractionMonitorNetworkAgent;
  v8 = [(WiFiUserInteractionMonitorNetworkAgent *)&v16 init];
  if (!v8) {
    goto LABEL_5;
  }
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setAgentUUID:v9];

  v10 = [(WiFiUserInteractionMonitorNetworkAgent *)v8 agentUUID];

  if (!v10) {
    goto LABEL_5;
  }
  id v11 = [objc_alloc((Class)NWNetworkAgentRegistration) initWithNetworkAgentClass:objc_opt_class()];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setRegistration:v11];

  v12 = [(WiFiUserInteractionMonitorNetworkAgent *)v8 registration];

  if (!v12) {
    goto LABEL_5;
  }
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setAgentDescription:v7];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setActive:0];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setKernelActivated:1];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setUserActivated:1];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setVoluntary:1];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setSpecificUseOnly:1];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setNetworkProvider:0];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setAssertCount:0];
  [(WiFiUserInteractionMonitorNetworkAgent *)v8 setAvcMinJB:0];
  v13 = [(WiFiUserInteractionMonitorNetworkAgent *)v8 registration];
  unsigned __int8 v14 = [v13 registerNetworkAgent:v8];

  if ((v14 & 1) == 0)
  {
LABEL_5:

    v8 = 0;
  }

  return v8;
}

- (BOOL)assertAgentWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiUserInteractionMonitorNetworkAgent *)self avcMinJB];
  [(WiFiUserInteractionMonitorNetworkAgent *)self setAssertCount:(char *)[(WiFiUserInteractionMonitorNetworkAgent *)self assertCount] + 1];
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: received AVC assert, assertCount=%lu", "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]", -[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount"));
  }
  if (!v4)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null userInfo", "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]");
    }
    goto LABEL_18;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  if (!v7)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null clientUUID", @"-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]"];
    }
LABEL_18:
    goto LABEL_8;
  }
  v8 = (void *)v7;
  id v9 = +[NWPath pathForClientID:v7];
  if (v9)
  {
    v10 = v9;
    [v9 endpoint];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null clientPath", "-[WiFiUserInteractionMonitorNetworkAgent assertAgentWithOptions:]")
    }
  }

LABEL_8:
  if ([(WiFiUserInteractionMonitorNetworkAgent *)self assertCount]
    && ![(WiFiUserInteractionMonitorNetworkAgent *)self isActive]
    || v5 != (void *)[(WiFiUserInteractionMonitorNetworkAgent *)self avcMinJB])
  {
    [(WiFiUserInteractionMonitorNetworkAgent *)self setActive:1];
    id v11 = [(WiFiUserInteractionMonitorNetworkAgent *)self registration];
    [v11 updateNetworkAgent:self];

    v12 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];

    if (v12)
    {
      v13 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];
      unsigned __int8 v14 = [v13 callback];
      v15 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];
      ((void (**)(void, id, uint64_t))v14)[2](v14, [v15 context], 1);
    }
  }

  return 1;
}

- (void)unassertAgentWithOptions:(id)a3
{
  id v10 = a3;
  if ([(WiFiUserInteractionMonitorNetworkAgent *)self assertCount]) {
    [(WiFiUserInteractionMonitorNetworkAgent *)self setAssertCount:(char *)[(WiFiUserInteractionMonitorNetworkAgent *)self assertCount] - 1];
  }
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: received AVC unassert, assertCount=%lu", "-[WiFiUserInteractionMonitorNetworkAgent unassertAgentWithOptions:]", -[WiFiUserInteractionMonitorNetworkAgent assertCount](self, "assertCount"));
  }
  if (![(WiFiUserInteractionMonitorNetworkAgent *)self assertCount])
  {
    if ([(WiFiUserInteractionMonitorNetworkAgent *)self isActive])
    {
      [(WiFiUserInteractionMonitorNetworkAgent *)self setActive:0];
      [(WiFiUserInteractionMonitorNetworkAgent *)self setAvcMinJB:0];
      v5 = [(WiFiUserInteractionMonitorNetworkAgent *)self registration];
      [v5 updateNetworkAgent:self];

      id v6 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];

      if (v6)
      {
        uint64_t v7 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];
        v8 = [v7 callback];
        id v9 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];
        ((void (**)(void, id, uint64_t))v8)[2](v8, [v9 context], 1);
      }
    }
  }
}

- (void)registerStateChangeCallback:(id)a3 withCallbackContext:(void *)a4
{
  id v12 = a3;
  uint64_t v7 = (void *)qword_10027DD68;
  if (qword_10027DD68)
  {
    id v8 = objc_retainBlock(v12);
    [v7 WFLog:3, "%s: callback %@, context %@", "-[WiFiUserInteractionMonitorNetworkAgent registerStateChangeCallback:withCallbackContext:]", v8, a4 message];
  }
  id v9 = objc_alloc_init(WiFiUserInteractionMonitorClient);
  [(WiFiUserInteractionMonitorNetworkAgent *)self setClient:v9];

  id v10 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];
  [v10 setCallback:v12];

  id v11 = [(WiFiUserInteractionMonitorNetworkAgent *)self client];
  [v11 setContext:a4];
}

- (BOOL)isVoluntary
{
  return self->voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->voluntary = a3;
}

- (NSString)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
}

- (void)setActive:(BOOL)a3
{
  self->active = a3;
}

- (NSUUID)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isSpecificUseOnly
{
  return self->specificUseOnly;
}

- (void)setSpecificUseOnly:(BOOL)a3
{
  self->specificUseOnly = a3;
}

- (BOOL)isNetworkProvider
{
  return self->networkProvider;
}

- (void)setNetworkProvider:(BOOL)a3
{
  self->networkProvider = a3;
}

- (unint64_t)assertCount
{
  return self->_assertCount;
}

- (void)setAssertCount:(unint64_t)a3
{
  self->_assertCount = a3;
}

- (unint64_t)avcMinJB
{
  return self->_avcMinJB;
}

- (void)setAvcMinJB:(unint64_t)a3
{
  self->_avcMinJB = a3;
}

- (NWNetworkAgentRegistration)registration
{
  return self->_registration;
}

- (void)setRegistration:(id)a3
{
}

- (WiFiUserInteractionMonitorClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->agentUUID, 0);

  objc_storeStrong((id *)&self->agentDescription, 0);
}

@end