@interface PKExtensionPointProxy
+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4;
- (NSDictionary)sdkEntry;
- (NSNumber)platform;
@end

@implementation PKExtensionPointProxy

+ (id)extensionPointForIdentifier:(id)a3 platform:(id)a4
{
  v4 = [MEMORY[0x1E4F22440] extensionPointForIdentifier:a3 platform:a4];
  return v4;
}

- (NSNumber)platform
{
  return 0;
}

- (NSDictionary)sdkEntry
{
  return 0;
}

@end