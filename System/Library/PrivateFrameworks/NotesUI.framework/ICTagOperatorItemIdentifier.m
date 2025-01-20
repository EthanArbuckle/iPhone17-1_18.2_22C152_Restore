@interface ICTagOperatorItemIdentifier
+ (ICTagOperatorItemIdentifier)sharedItemIdentifier;
@end

@implementation ICTagOperatorItemIdentifier

+ (ICTagOperatorItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken != -1) {
    dispatch_once(&sharedItemIdentifier_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)sharedItemIdentifier_itemIdentifier;
  return (ICTagOperatorItemIdentifier *)v2;
}

uint64_t __51__ICTagOperatorItemIdentifier_sharedItemIdentifier__block_invoke()
{
  sharedItemIdentifier_itemIdentifier = objc_alloc_init(ICTagOperatorItemIdentifier);
  return MEMORY[0x1F41817F8]();
}

@end