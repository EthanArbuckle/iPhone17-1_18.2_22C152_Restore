@interface NFCFieldDetectSessionCallbacksInterface
+ (id)interface;
@end

@implementation NFCFieldDetectSessionCallbacksInterface

+ (id)interface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFCFieldDetectSessionCallbacks];
}

@end