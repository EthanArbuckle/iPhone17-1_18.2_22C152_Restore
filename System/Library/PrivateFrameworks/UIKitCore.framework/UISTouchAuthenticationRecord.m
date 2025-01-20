@interface UISTouchAuthenticationRecord
@end

@implementation UISTouchAuthenticationRecord

void __69___UISTouchAuthenticationRecord_UIKit__authenticationRecordForTouch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  if (v3) {
    v5 = *(void **)(v3 + 392);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  [v4 setSecurityAnalysis:v6];

  v7 = *(void **)(a1 + 40);
  if (v7) {
    v7 = (void *)v7[118];
  }
  v8 = v7;
  [v4 setHostBundleId:v8];

  v9 = *(void **)(a1 + 40);
  if (v9) {
    v9 = (void *)v9[116];
  }
  v10 = v9;
  [v4 setHostSDKVersion:v10];

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    BOOL v12 = *(unsigned __int8 *)(v11 + 898) != 0;
  }
  else {
    BOOL v12 = 0;
  }
  [v4 setHostIsInternal:v12];
  _UIMainBundleIdentifier();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setServiceBundleId:v13];
}

@end