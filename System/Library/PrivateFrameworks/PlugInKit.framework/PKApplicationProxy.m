@interface PKApplicationProxy
+ (id)applicationProxyForBundleURL:(id)a3;
- (BOOL)isPlaceholder;
- (NSArray)plugInKitPlugins;
@end

@implementation PKApplicationProxy

+ (id)applicationProxyForBundleURL:(id)a3
{
  v3 = [MEMORY[0x1E4F223B8] applicationProxyForBundleURL:a3];
  return v3;
}

- (NSArray)plugInKitPlugins
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 0;
}

@end