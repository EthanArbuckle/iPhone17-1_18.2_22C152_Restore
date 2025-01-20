@interface UIFocusUpdateReportFormatter
@end

@implementation UIFocusUpdateReportFormatter

uint64_t __48___UIFocusUpdateReportFormatter__bodyForReport___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) appendString:@"\n"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v3 + 24))
  {
    uint64_t result = [*(id *)(a1 + 32) appendString:@"\n"];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v3 + 24) = 0;
  return result;
}

@end