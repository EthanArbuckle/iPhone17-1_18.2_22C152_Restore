@interface ICTagAllTagsItemIdentifier
+ (ICTagAllTagsItemIdentifier)sharedItemIdentifier;
+ (NSString)archiveIdentifier;
+ (NSString)displayText;
@end

@implementation ICTagAllTagsItemIdentifier

+ (ICTagAllTagsItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_2 != -1) {
    dispatch_once(&sharedItemIdentifier_onceToken_2, &__block_literal_global_88);
  }
  v2 = (void *)sharedItemIdentifier_itemIdentifier_2;
  return (ICTagAllTagsItemIdentifier *)v2;
}

uint64_t __50__ICTagAllTagsItemIdentifier_sharedItemIdentifier__block_invoke()
{
  v0 = objc_alloc_init(ICTagAllTagsItemIdentifier);
  sharedItemIdentifier_itemIdentifier_2 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0);
}

+ (NSString)archiveIdentifier
{
  return (NSString *)@"AllTags";
}

+ (NSString)displayText
{
  return (NSString *)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"All Tags" value:@"All Tags" table:0 allowSiri:1];
}

@end