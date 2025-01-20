@interface NSItemProvider
@end

@implementation NSItemProvider

void __80__NSItemProvider_SHSheetGroupActivity__loadGroupActivityMetadataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v3 = (void *)[objc_alloc(getLPLinkMetadataClass_2()) _initWithConversationActivity:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end