@interface NSXPCConnection(PGMenuItemWSupport)
- (uint64_t)PG_hasMenuItemProviderEntitlement;
@end

@implementation NSXPCConnection(PGMenuItemWSupport)

- (uint64_t)PG_hasMenuItemProviderEntitlement
{
  v1 = [a1 valueForEntitlement:@"com.apple.pegasus.menuitemprovider"];
  uint64_t v2 = [v1 isEqualToNumber:MEMORY[0x1E4F1CC38]];

  return v2;
}

@end