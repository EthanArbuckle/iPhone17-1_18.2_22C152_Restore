@interface ReportableActionOnDismissPressedForMessageWithAction
@end

@implementation ReportableActionOnDismissPressedForMessageWithAction

void ___ReportableActionOnDismissPressedForMessageWithAction_block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x1E4F143B8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *MEMORY[0x1E4F86750];
  uint64_t v3 = *MEMORY[0x1E4F86308];
  v6[0] = *MEMORY[0x1E4F86730];
  v6[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F86380];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E4F86120];
  v7[2] = *MEMORY[0x1E4F86228];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  _ReportAnalyticsEventForMessage(v5, *(void **)(a1 + 32));
}

@end