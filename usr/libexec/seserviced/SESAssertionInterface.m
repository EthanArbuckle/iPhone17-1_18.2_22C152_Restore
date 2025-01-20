@interface SESAssertionInterface
+ (id)interface;
@end

@implementation SESAssertionInterface

+ (id)interface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SESAssertionInterface];
}

@end