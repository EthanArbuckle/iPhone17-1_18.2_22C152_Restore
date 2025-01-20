@interface NSBundle(PFAdditions)
+ (id)podcastsFoundationBundle;
@end

@implementation NSBundle(PFAdditions)

+ (id)podcastsFoundationBundle
{
  if (podcastsFoundationBundle_onceToken[0] != -1) {
    dispatch_once(podcastsFoundationBundle_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)podcastsFoundationBundle_bundle;
  return v0;
}

@end