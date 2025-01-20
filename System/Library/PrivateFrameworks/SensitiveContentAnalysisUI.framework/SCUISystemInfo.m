@interface SCUISystemInfo
+ (BOOL)isInternal;
@end

@implementation SCUISystemInfo

+ (BOOL)isInternal
{
  if (isInternal_onceToken[0] != -1) {
    dispatch_once(isInternal_onceToken, &__block_literal_global_1);
  }
  return isInternal_sHasInternalContent;
}

uint64_t __28__SCUISystemInfo_isInternal__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  isInternal_sHasInternalContent = result;
  return result;
}

@end