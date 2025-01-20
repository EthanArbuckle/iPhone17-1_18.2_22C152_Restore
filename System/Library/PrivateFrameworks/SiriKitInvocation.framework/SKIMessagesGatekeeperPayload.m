@interface SKIMessagesGatekeeperPayload
+ (BOOL)supports:(id)a3;
- (NSString)appBundleId;
- (SKIDirectInvocationPayload)invocationPayload;
- (SKIMessagesGatekeeperPayload)initWithAppBundleId:(id)a3;
- (SKIMessagesGatekeeperPayload)initWithDictionary:(id)a3;
- (void)setAppBundleId:(id)a3;
@end

@implementation SKIMessagesGatekeeperPayload

- (SKIMessagesGatekeeperPayload)initWithAppBundleId:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKIMessagesGatekeeperPayload;
  v6 = [(SKIMessagesGatekeeperPayload *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appBundleId, a3);
  }

  return v7;
}

- (SKIMessagesGatekeeperPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKIMessagesGatekeeperPayload;
  id v5 = [(SKIMessagesGatekeeperPayload *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"appBundleId"];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v6;
  }
  return v5;
}

- (SKIDirectInvocationPayload)invocationPayload
{
  v3 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.DirectInvocation.Messages.TriggerGatekeeper"];
  id v4 = v3;
  if (self->_appBundleId)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    [v5 setObject:self->_appBundleId forKey:@"appBundleId"];
    [(SKIDirectInvocationPayload *)v4 setUserData:v5];
  }
  else
  {
    [(SKIDirectInvocationPayload *)v3 setUserData:MEMORY[0x263EFFA78]];
  }

  return v4;
}

+ (BOOL)supports:(id)a3
{
  return [a3 isEqualToString:@"com.apple.siri.DirectInvocation.Messages.TriggerGatekeeper"];
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppBundleId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end