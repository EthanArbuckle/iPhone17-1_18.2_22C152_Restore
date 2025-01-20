@interface ProxyAgent
+ (id)agentType;
- (NSString)internalAgentName;
- (ProxyAgent)initWithParameters:(id)a3;
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

@implementation ProxyAgent

+ (id)agentType
{
  return @"ProxyAgent";
}

- (ProxyAgent)initWithParameters:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ProxyAgent;
  v5 = [(ConfigAgent *)&v18 initWithParameters:v4];
  if (v5)
  {
    v6 = [v4 valueForKey:@"EntityName"];
    v7 = [v4 valueForKey:@"AgentSubType"];
    v8 = [(id)objc_opt_class() agentType];
    uint64_t v9 = +[NSString stringWithFormat:@"%@-%@", v8, v6];
    internalAgentName = v5->_internalAgentName;
    v5->_internalAgentName = (NSString *)v9;

    v5->_internalAgentSubType = (unint64_t)[v7 unsignedIntegerValue];
    v5->_internalAgentType = 1;
    objc_storeStrong((id *)&v5->agentDescription, v5->_internalAgentName);
    agentDescription = v5->agentDescription;
    v17.receiver = v5;
    v17.super_class = (Class)ProxyAgent;
    uint64_t v12 = [(ConfigAgent *)&v17 createUUIDForName:agentDescription];
    agentUUID = v5->agentUUID;
    v5->agentUUID = (NSUUID *)v12;

    if (!v5->agentUUID)
    {
      uint64_t v14 = +[NSUUID UUID];
      v15 = v5->agentUUID;
      v5->agentUUID = (NSUUID *)v14;
    }
  }

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