@interface DNSAgent
+ (id)agentType;
- (DNSAgent)initWithParameters:(id)a3;
- (NSString)internalAgentName;
- (id)agentDescription;
- (id)agentUUID;
- (id)getAgentName;
- (id)getAgentUUID;
- (unint64_t)getAgentSubType;
- (unint64_t)getAgentType;
- (unint64_t)internalAgentSubType;
- (unint64_t)internalAgentType;
- (void)setAgentDescription:(id)a3;
- (void)setAgentUUID:(id)a3;
- (void)setInternalAgentName:(id)a3;
- (void)setInternalAgentSubType:(unint64_t)a3;
- (void)setInternalAgentType:(unint64_t)a3;
@end

@implementation DNSAgent

+ (id)agentType
{
  return @"DNSAgent";
}

- (DNSAgent)initWithParameters:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DNSAgent;
  v5 = [(ConfigAgent *)&v19 initWithParameters:v4];
  if (!v5) {
    goto LABEL_10;
  }
  v6 = [v4 valueForKey:@"EntityName"];
  v7 = [v4 valueForKey:@"AgentSubType"];
  v8 = [(id)objc_opt_class() agentType];
  if ([v7 unsignedIntegerValue] == (id)4)
  {
    CFStringRef v9 = @"DNSAgent(m)";
LABEL_6:

    v8 = (void *)v9;
    goto LABEL_7;
  }
  if ([v7 unsignedIntegerValue] == (id)5)
  {
    CFStringRef v9 = @"DNSAgent(p)";
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v10 = +[NSString stringWithFormat:@"%@-%@", v8, v6];
  internalAgentName = v5->_internalAgentName;
  v5->_internalAgentName = (NSString *)v10;

  v5->_internalAgentSubType = (unint64_t)[v7 unsignedIntegerValue];
  v5->_internalAgentType = 2;
  objc_storeStrong((id *)&v5->agentDescription, v5->_internalAgentName);
  agentDescription = v5->agentDescription;
  v18.receiver = v5;
  v18.super_class = (Class)DNSAgent;
  uint64_t v13 = [(ConfigAgent *)&v18 createUUIDForName:agentDescription];
  agentUUID = v5->agentUUID;
  v5->agentUUID = (NSUUID *)v13;

  if (!v5->agentUUID)
  {
    uint64_t v15 = +[NSUUID UUID];
    v16 = v5->agentUUID;
    v5->agentUUID = (NSUUID *)v15;
  }
LABEL_10:

  return v5;
}

- (unint64_t)getAgentType
{
  return self->_internalAgentType;
}

- (id)getAgentName
{
  internalAgentName = self->_internalAgentName;

  return internalAgentName;
}

- (unint64_t)getAgentSubType
{
  return self->_internalAgentSubType;
}

- (id)getAgentUUID
{
  agentUUID = self->agentUUID;

  return agentUUID;
}

- (id)agentUUID
{
  return self->agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)agentDescription
{
  return self->agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)internalAgentType
{
  return self->_internalAgentType;
}

- (void)setInternalAgentType:(unint64_t)a3
{
  self->_internalAgentType = a3;
}

- (NSString)internalAgentName
{
  return self->_internalAgentName;
}

- (void)setInternalAgentName:(id)a3
{
  p_internalAgentName = &self->_internalAgentName;

  objc_storeStrong((id *)p_internalAgentName, a3);
}

- (unint64_t)internalAgentSubType
{
  return self->_internalAgentSubType;
}

- (void)setInternalAgentSubType:(unint64_t)a3
{
  self->_internalAgentSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAgentName, 0);
  objc_storeStrong((id *)&self->agentDescription, 0);

  objc_storeStrong((id *)&self->agentUUID, 0);
}

@end