@interface ICTagDetailItemIdentifier
+ (ICTagDetailItemIdentifier)sharedItemIdentifier;
@end

@implementation ICTagDetailItemIdentifier

+ (ICTagDetailItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_3 != -1) {
    dispatch_once(&sharedItemIdentifier_onceToken_3, &__block_literal_global_90);
  }
  v2 = (void *)sharedItemIdentifier_itemIdentifier_3;
  return (ICTagDetailItemIdentifier *)v2;
}

uint64_t __49__ICTagDetailItemIdentifier_sharedItemIdentifier__block_invoke()
{
  v0 = objc_alloc_init(ICTagDetailItemIdentifier);
  sharedItemIdentifier_itemIdentifier_3 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

@end