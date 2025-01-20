@interface LSApplicationRecord
@end

@implementation LSApplicationRecord

uint64_t __86__LSApplicationRecord_UserNotificationsKit___unkit_enumerateRecordsWithOptions_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unkit_isEligibleToDeliverNotifications");
}

@end