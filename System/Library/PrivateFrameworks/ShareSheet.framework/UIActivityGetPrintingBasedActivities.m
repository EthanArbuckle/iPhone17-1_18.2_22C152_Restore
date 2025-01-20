@interface UIActivityGetPrintingBasedActivities
@end

@implementation UIActivityGetPrintingBasedActivities

void ___UIActivityGetPrintingBasedActivities_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(UIOpenInIBooksActivity);
  v4[0] = v0;
  v1 = objc_alloc_init(UICreatePDFActivity);
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  v3 = (void *)_UIActivityGetPrintingBasedActivities___printingBasedActivities;
  _UIActivityGetPrintingBasedActivities___printingBasedActivities = v2;
}

@end