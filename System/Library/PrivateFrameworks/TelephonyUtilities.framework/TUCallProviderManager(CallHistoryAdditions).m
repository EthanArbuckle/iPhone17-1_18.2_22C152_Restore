@interface TUCallProviderManager(CallHistoryAdditions)
@end

@implementation TUCallProviderManager(CallHistoryAdditions)

- (void)dialRequestForRecentCall:()CallHistoryAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Could not retrieve a call provider for the specified recent call %@.", (uint8_t *)&v2, 0xCu);
}

@end