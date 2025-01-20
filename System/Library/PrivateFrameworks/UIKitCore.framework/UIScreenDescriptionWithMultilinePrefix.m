@interface UIScreenDescriptionWithMultilinePrefix
@end

@implementation UIScreenDescriptionWithMultilinePrefix

id ___UIScreenDescriptionWithMultilinePrefix_block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) displayIdentity];
  id v4 = (id)[v2 appendObject:v3 withName:@"displayIdentity"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendUserInterfaceIdiom:withName:", objc_msgSend(*(id *)(a1 + 40), "_userInterfaceIdiom"), @"idiom");
}

@end