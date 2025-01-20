@interface UISTouchAuthenticationTelemetryShouldReportBundleID
@end

@implementation UISTouchAuthenticationTelemetryShouldReportBundleID

void ___UISTouchAuthenticationTelemetryShouldReportBundleID_block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [v1 deviceIdentifierForVendor];
  [v0 getUUIDBytes:&unk_1EB2888B8];
}

@end