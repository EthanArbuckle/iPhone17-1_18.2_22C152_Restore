@interface KmlKeyManagementInterface
+ (id)interface;
@end

@implementation KmlKeyManagementInterface

+ (id)interface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KmlKeyManagementProtocol];
}

@end