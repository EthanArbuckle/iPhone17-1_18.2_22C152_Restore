@interface AFConversation(SiriUIFoundationAdditions)
- (id)sruif_itemsRelatedToIdentifier:()SiriUIFoundationAdditions;
@end

@implementation AFConversation(SiriUIFoundationAdditions)

- (id)sruif_itemsRelatedToIdentifier:()SiriUIFoundationAdditions
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = objc_alloc_init(MEMORY[0x263F088C8]);
  uint64_t v7 = [a1 numberOfChildrenForItemAtIndexPath:v6];

  v18 = v4;
  v8 = [a1 itemWithIdentifier:v4];
  v9 = [v8 aceObject];
  v10 = [v9 refId];

  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v12 = [MEMORY[0x263F088C8] indexPathWithIndex:i];
      v13 = [a1 itemAtIndexPath:v12];

      v14 = [v13 aceObject];
      v15 = [v14 refId];
      int v16 = [v15 isEqualToString:v10];

      if (v16) {
        [v5 addObject:v13];
      }
    }
  }

  return v5;
}

@end