@interface SESACWGSessionInterface
+ (id)interface;
@end

@implementation SESACWGSessionInterface

+ (id)interface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SESACWGSessionInterface];
}

@end