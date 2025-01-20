@interface ICTagNewTagItemIdentifier
+ (ICTagNewTagItemIdentifier)sharedItemIdentifier;
@end

@implementation ICTagNewTagItemIdentifier

+ (ICTagNewTagItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_0 != -1) {
    dispatch_once(&sharedItemIdentifier_onceToken_0, &__block_literal_global_41);
  }
  v2 = (void *)sharedItemIdentifier_itemIdentifier_0;
  return (ICTagNewTagItemIdentifier *)v2;
}

uint64_t __49__ICTagNewTagItemIdentifier_sharedItemIdentifier__block_invoke()
{
  sharedItemIdentifier_itemIdentifier_0 = objc_alloc_init(ICTagNewTagItemIdentifier);
  return MEMORY[0x1F41817F8]();
}

@end