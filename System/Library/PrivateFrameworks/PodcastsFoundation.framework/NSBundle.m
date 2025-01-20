@interface NSBundle
@end

@implementation NSBundle

uint64_t __49__NSBundle_PFAdditions__podcastsFoundationBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = podcastsFoundationBundle_bundle;
  podcastsFoundationBundle_bundle = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end