@interface STScreenTimeAgentPrivateConnection
+ (id)newConnection;
+ (id)newContactsServiceConnection;
+ (id)newContactsServiceInterface;
+ (id)newInterface;
@end

@implementation STScreenTimeAgentPrivateConnection

+ (id)newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.private" options:4096];
  v4 = (void *)[a1 newInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)newContactsServiceConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.Contacts" options:4096];
  v4 = (void *)[a1 newContactsServiceInterface];
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

+ (id)newContactsServiceInterface
{
  return (id)objc_claimAutoreleasedReturnValue();
}

@end