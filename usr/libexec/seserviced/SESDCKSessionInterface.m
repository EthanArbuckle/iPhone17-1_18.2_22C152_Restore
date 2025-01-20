@interface SESDCKSessionInterface
+ (id)interface;
@end

@implementation SESDCKSessionInterface

+ (id)interface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SESDCKSessionInterface];
}

@end