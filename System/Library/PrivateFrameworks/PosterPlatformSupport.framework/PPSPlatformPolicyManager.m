@interface PPSPlatformPolicyManager
+ (BOOL)ambientPosterAutocreationSupported;
+ (BOOL)ambientPosterDateCreatedOrderingSupported;
+ (BOOL)platformSupportsDataMigrator;
+ (BOOL)proactiveGallerySupportedForRole:(id)a3;
+ (BOOL)snapshottingSupportedForRole:(id)a3;
@end

@implementation PPSPlatformPolicyManager

+ (BOOL)platformSupportsDataMigrator
{
  return 1;
}

+ (BOOL)snapshottingSupportedForRole:(id)a3
{
  return [a3 isEqual:*MEMORY[0x263F5F460]];
}

+ (BOOL)proactiveGallerySupportedForRole:(id)a3
{
  return [a3 isEqual:*MEMORY[0x263F5F460]];
}

+ (BOOL)ambientPosterAutocreationSupported
{
  return 1;
}

+ (BOOL)ambientPosterDateCreatedOrderingSupported
{
  return 1;
}

@end