@interface REMStore(iMessageInteractionSPI)
+ (void)_shouldNotifyReminddOfInteractionWithPeople;
@end

@implementation REMStore(iMessageInteractionSPI)

+ (void)_shouldNotifyReminddOfInteractionWithPeople
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Failed to register shouldNotifyOfInteractionWithPeople with notifyd {status: %d}", (uint8_t *)v2, 8u);
}

@end