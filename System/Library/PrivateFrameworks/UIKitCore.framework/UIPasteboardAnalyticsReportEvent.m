@interface UIPasteboardAnalyticsReportEvent
@end

@implementation UIPasteboardAnalyticsReportEvent

id ___UIPasteboardAnalyticsReportEvent_block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"timeToTap";
  v6[0] = v1;
  v5[0] = @"buttonType";
  v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  v6[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

@end