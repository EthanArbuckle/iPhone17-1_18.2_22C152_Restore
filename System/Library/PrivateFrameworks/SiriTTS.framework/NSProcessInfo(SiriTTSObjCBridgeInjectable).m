@interface NSProcessInfo(SiriTTSObjCBridgeInjectable)
+ (id)injectedProcessInfo;
+ (void)injectProcessInfo:()SiriTTSObjCBridgeInjectable;
@end

@implementation NSProcessInfo(SiriTTSObjCBridgeInjectable)

+ (id)injectedProcessInfo
{
  return (id)NSProcessInfoObjCBridge::injectedProcessInfo;
}

+ (void)injectProcessInfo:()SiriTTSObjCBridgeInjectable
{
}

@end