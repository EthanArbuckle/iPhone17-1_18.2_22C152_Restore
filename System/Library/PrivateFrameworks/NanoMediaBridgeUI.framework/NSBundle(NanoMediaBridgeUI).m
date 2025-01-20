@interface NSBundle(NanoMediaBridgeUI)
+ (id)nanoMediaBridgeUIBundle;
@end

@implementation NSBundle(NanoMediaBridgeUI)

+ (id)nanoMediaBridgeUIBundle
{
  if (nanoMediaBridgeUIBundle_onceToken != -1) {
    dispatch_once(&nanoMediaBridgeUIBundle_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)nanoMediaBridgeUIBundle___nanoMediaBridgeUIBundle;
  return v0;
}

@end