@interface PGInternalChecker
+ (BOOL)isAppleInternal;
@end

@implementation PGInternalChecker

+ (BOOL)isAppleInternal
{
  if (isAppleInternal_onceToken != -1) {
    dispatch_once(&isAppleInternal_onceToken, &__block_literal_global_10407);
  }
  return isAppleInternal_isAppleInternal;
}

uint64_t __36__PGInternalChecker_isAppleInternal__block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  isAppleInternal_isAppleInternal = result;
  return result;
}

@end