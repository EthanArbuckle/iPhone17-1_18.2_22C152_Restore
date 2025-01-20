@interface PHAsset(PXSharingAdditions)
- (uint64_t)px_isSupportedApp:()PXSharingAdditions;
- (uint64_t)requiresConfidentiality;
@end

@implementation PHAsset(PXSharingAdditions)

- (uint64_t)requiresConfidentiality
{
  return 0;
}

- (uint64_t)px_isSupportedApp:()PXSharingAdditions
{
  id v3 = a3;
  if (px_isSupportedApp__onceToken != -1) {
    dispatch_once(&px_isSupportedApp__onceToken, &__block_literal_global_231505);
  }
  v4 = [v3 lowercaseString];
  if (v4) {
    uint64_t v5 = [(id)px_isSupportedApp__supportedOriginators containsObject:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

@end