@interface UISUIAirDropSecurityScopedResource
+ (BOOL)supportsSecureCoding;
+ (id)readonlySandboxExtensionClassString;
@end

@implementation UISUIAirDropSecurityScopedResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)readonlySandboxExtensionClassString
{
  return @"com.apple.sharing.airdrop.readonly";
}

@end