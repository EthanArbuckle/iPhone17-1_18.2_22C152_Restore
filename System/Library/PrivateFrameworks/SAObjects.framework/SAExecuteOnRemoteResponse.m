@interface SAExecuteOnRemoteResponse
+ (id)executeOnRemoteResponse;
- (BOOL)requiresResponse;
- (BOOL)responseFromRemote;
- (SAAceCommand)result;
- (SARemoteDevice)remoteDevice;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRemoteDevice:(id)a3;
- (void)setResponseFromRemote:(BOOL)a3;
- (void)setResult:(id)a3;
@end

@implementation SAExecuteOnRemoteResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ExecuteOnRemoteResponse";
}

+ (id)executeOnRemoteResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SARemoteDevice)remoteDevice
{
  return (SARemoteDevice *)AceObjectAceObjectForProperty(self, @"remoteDevice");
}

- (void)setRemoteDevice:(id)a3
{
}

- (BOOL)responseFromRemote
{
  return AceObjectBoolForProperty(self, @"responseFromRemote");
}

- (void)setResponseFromRemote:(BOOL)a3
{
}

- (SAAceCommand)result
{
  return (SAAceCommand *)AceObjectAceObjectForProperty(self, @"result");
}

- (void)setResult:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end