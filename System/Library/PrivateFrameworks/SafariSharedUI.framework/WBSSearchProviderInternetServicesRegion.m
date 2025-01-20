@interface WBSSearchProviderInternetServicesRegion
@end

@implementation WBSSearchProviderInternetServicesRegion

void ___WBSSearchProviderInternetServicesRegion_block_invoke()
{
  id v3 = [MEMORY[0x1E4F1CA20] internetServicesRegion];
  uint64_t v0 = [v3 copy];
  v1 = (void *)v0;
  if (v0) {
    v2 = (__CFString *)v0;
  }
  else {
    v2 = &stru_1F031A860;
  }
  objc_storeStrong((id *)&_WBSSearchProviderInternetServicesRegion_region, v2);
}

@end