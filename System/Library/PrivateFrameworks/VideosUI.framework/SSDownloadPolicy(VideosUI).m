@interface SSDownloadPolicy(VideosUI)
+ (id)vui_policyAllowingCellularDownloads:()VideosUI;
@end

@implementation SSDownloadPolicy(VideosUI)

+ (id)vui_policyAllowingCellularDownloads:()VideosUI
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FA81B0]);
  [v4 setCellularDataStates:0];
  if ((a3 & 1) == 0) {
    [v4 addNetworkType:1000];
  }
  id v5 = objc_alloc(MEMORY[0x1E4FA81A8]);
  v6 = (void *)[v5 initWithDownloadKind:*MEMORY[0x1E4FA8490] URLBagType:0];
  [v6 setPolicyRule:v4];

  return v6;
}

@end