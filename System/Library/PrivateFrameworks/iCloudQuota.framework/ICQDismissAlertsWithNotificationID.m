@interface ICQDismissAlertsWithNotificationID
@end

@implementation ICQDismissAlertsWithNotificationID

uint64_t ___ICQDismissAlertsWithNotificationID_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAlert];
}

@end