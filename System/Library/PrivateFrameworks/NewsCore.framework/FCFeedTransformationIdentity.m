@interface FCFeedTransformationIdentity
+ (id)sharedInstance;
- (id)transformFeedItems:(id)a3;
@end

@implementation FCFeedTransformationIdentity

+ (id)sharedInstance
{
  if (qword_1EB5D17C0 != -1) {
    dispatch_once(&qword_1EB5D17C0, &__block_literal_global_109);
  }
  v2 = (void *)_MergedGlobals_188;
  return v2;
}

uint64_t __46__FCFeedTransformationIdentity_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _MergedGlobals_188;
  _MergedGlobals_188 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)transformFeedItems:(id)a3
{
  v3 = (void *)[a3 copy];
  return v3;
}

@end