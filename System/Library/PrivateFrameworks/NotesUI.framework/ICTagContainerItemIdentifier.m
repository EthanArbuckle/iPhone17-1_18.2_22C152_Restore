@interface ICTagContainerItemIdentifier
+ (ICTagContainerItemIdentifier)sharedItemIdentifier;
@end

@implementation ICTagContainerItemIdentifier

+ (ICTagContainerItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_1 != -1) {
    dispatch_once(&sharedItemIdentifier_onceToken_1, &__block_literal_global_85);
  }
  v2 = (void *)sharedItemIdentifier_itemIdentifier_1;
  return (ICTagContainerItemIdentifier *)v2;
}

uint64_t __52__ICTagContainerItemIdentifier_sharedItemIdentifier__block_invoke()
{
  v0 = objc_alloc_init(ICTagContainerItemIdentifier);
  sharedItemIdentifier_itemIdentifier_1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

@end