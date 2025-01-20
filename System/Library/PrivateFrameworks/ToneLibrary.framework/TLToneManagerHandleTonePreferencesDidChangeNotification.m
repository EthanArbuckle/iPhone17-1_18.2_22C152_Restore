@interface TLToneManagerHandleTonePreferencesDidChangeNotification
@end

@implementation TLToneManagerHandleTonePreferencesDidChangeNotification

uint64_t ___TLToneManagerHandleTonePreferencesDidChangeNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleTonePreferencesChangedNotificationForPreferencesKinds:3];
}

@end