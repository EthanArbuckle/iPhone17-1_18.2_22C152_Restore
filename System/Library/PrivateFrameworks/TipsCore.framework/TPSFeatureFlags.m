@interface TPSFeatureFlags
+ (BOOL)allowsDE;
+ (BOOL)allowsPersistentSiri;
+ (BOOL)allowsTipsSharing;
@end

@implementation TPSFeatureFlags

+ (BOOL)allowsTipsSharing
{
  if (allowsTipsSharing_predicate != -1) {
    dispatch_once(&allowsTipsSharing_predicate, &__block_literal_global_14);
  }
  return allowsTipsSharing_allowFeature;
}

uint64_t __36__TPSFeatureFlags_allowsTipsSharing__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  allowsTipsSharing_allowFeature = result;
  return result;
}

+ (BOOL)allowsDE
{
  if (allowsDE_predicate != -1) {
    dispatch_once(&allowsDE_predicate, &__block_literal_global_4_0);
  }
  return allowsDE_allowFeature;
}

uint64_t __27__TPSFeatureFlags_allowsDE__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  allowsDE_allowFeature = result;
  return result;
}

+ (BOOL)allowsPersistentSiri
{
  if (allowsPersistentSiri_predicate != -1) {
    dispatch_once(&allowsPersistentSiri_predicate, &__block_literal_global_7_0);
  }
  return allowsPersistentSiri_allowFeature;
}

uint64_t __39__TPSFeatureFlags_allowsPersistentSiri__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  allowsPersistentSiri_allowFeature = result;
  return result;
}

@end