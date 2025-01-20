@interface UISTouchAuthenticationRecord
@end

@implementation UISTouchAuthenticationRecord

void __127___UISTouchAuthenticationRecord_initWithSecurityAnalysis_timestamp_hostBundleId_hostSDKVersion_hostIsInternal_serviceBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSecurityAnalysis:v3];
  [v4 setHostBundleId:*(void *)(a1 + 40)];
  [v4 setHostSDKVersion:*(void *)(a1 + 48)];
  [v4 setHostIsInternal:*(unsigned __int8 *)(a1 + 64)];
  [v4 setServiceBundleId:*(void *)(a1 + 56)];
}

@end