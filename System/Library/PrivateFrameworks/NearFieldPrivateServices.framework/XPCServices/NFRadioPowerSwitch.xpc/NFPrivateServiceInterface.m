@interface NFPrivateServiceInterface
+ (id)interface;
@end

@implementation NFPrivateServiceInterface

+ (id)interface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFPrivateServiceInterface];
}

@end