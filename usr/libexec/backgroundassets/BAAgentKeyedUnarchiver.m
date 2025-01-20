@interface BAAgentKeyedUnarchiver
- (BAAgentCore)agentCore;
- (void)setAgentCore:(id)a3;
@end

@implementation BAAgentKeyedUnarchiver

- (BAAgentCore)agentCore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_agentCore);

  return (BAAgentCore *)WeakRetained;
}

- (void)setAgentCore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end