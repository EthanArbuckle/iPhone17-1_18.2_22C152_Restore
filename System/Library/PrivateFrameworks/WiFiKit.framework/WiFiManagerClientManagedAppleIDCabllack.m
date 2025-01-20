@interface WiFiManagerClientManagedAppleIDCabllack
@end

@implementation WiFiManagerClientManagedAppleIDCabllack

uint64_t ___WiFiManagerClientManagedAppleIDCabllack_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _managedAppleIDStateDidChange:*(unsigned char *)(a1 + 40) != 0];
}

@end