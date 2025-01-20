@interface LSApplicationRecord
@end

@implementation LSApplicationRecord

uint64_t __85__LSApplicationRecord_UserNotificationsCore___uns_enumerateRecordsWithOptions_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unc_isEligibleToDeliverNotifications");
}

@end