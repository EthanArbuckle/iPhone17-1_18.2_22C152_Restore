@interface NEUserEventAgentFileHandleMaintainer
- (NEUserEventAgentFileHandleMaintainer)init;
@end

@implementation NEUserEventAgentFileHandleMaintainer

- (void).cxx_destruct
{
}

- (NEUserEventAgentFileHandleMaintainer)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEUserEventAgentFileHandleMaintainer;
  result = [(NEUserEventAgentFileHandleMaintainer *)&v3 init];
  if (result) {
    result->_nesmPIDToken = -1;
  }
  return result;
}

@end