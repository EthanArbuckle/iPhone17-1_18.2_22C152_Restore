@interface CNContactStore(NanoPhone)
+ (id)nph_shared;
+ (id)nph_shared_with_nanophone_identity;
@end

@implementation CNContactStore(NanoPhone)

+ (id)nph_shared
{
  if (nph_shared_onceToken != -1) {
    dispatch_once(&nph_shared_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)nph_shared_sharedContactStore;
  return v0;
}

+ (id)nph_shared_with_nanophone_identity
{
  if (nph_shared_with_nanophone_identity_onceToken != -1) {
    dispatch_once(&nph_shared_with_nanophone_identity_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)nph_shared_with_nanophone_identity_sharedContactStore;
  return v0;
}

@end