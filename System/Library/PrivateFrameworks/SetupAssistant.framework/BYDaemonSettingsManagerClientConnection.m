@interface BYDaemonSettingsManagerClientConnection
+ (id)daemonProtocolInterface;
- (void)hasStashedValuesOnDisk:(id)a3;
@end

@implementation BYDaemonSettingsManagerClientConnection

+ (id)daemonProtocolInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BYDaemonSettingsManagerProtocol];
}

- (void)hasStashedValuesOnDisk:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    (*((void (**)(id, id))a3 + 2))(v4, +[BFFSettingsManager hasStashedValuesOnDisk]);
  }
}

@end