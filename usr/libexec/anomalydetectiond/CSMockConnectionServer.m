@interface CSMockConnectionServer
- (CSMockConnectionServer)initWithDispatchSilo:(id)a3 andDelegate:(id)a4;
- (id)serviceName;
@end

@implementation CSMockConnectionServer

- (CSMockConnectionServer)initWithDispatchSilo:(id)a3 andDelegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CSMockConnectionServer;
  return [(CSMockConnectionServer *)&v5 init];
}

- (id)serviceName
{
  return @"CSMockConnectionServer";
}

@end