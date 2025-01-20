@interface AXTTYSimulatorSubscriptionContext
- (AXTTYSimulatorSubscriptionContext)init;
- (NSUUID)testUuid;
- (void)setTestUuid:(id)a3;
@end

@implementation AXTTYSimulatorSubscriptionContext

- (AXTTYSimulatorSubscriptionContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXTTYSimulatorSubscriptionContext;
  v2 = [(AXTTYSimulatorSubscriptionContext *)&v5 init];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000001"];
  [(AXTTYSimulatorSubscriptionContext *)v2 setTestUuid:v3];

  return v2;
}

- (NSUUID)testUuid
{
  return self->_testUuid;
}

- (void)setTestUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end