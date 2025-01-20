@interface SACardSnippet(SiriSharedUIFrameworkAdditions)
- (id)siriui_card;
- (id)siriui_card_compact;
@end

@implementation SACardSnippet(SiriSharedUIFrameworkAdditions)

- (id)siriui_card
{
  v1 = (void *)MEMORY[0x263F31690];
  v2 = [a1 cardData];
  v3 = [v1 cardForData:v2 messageName:@"searchfoundation.Card"];

  return v3;
}

- (id)siriui_card_compact
{
  v1 = (void *)MEMORY[0x263F31690];
  v2 = [a1 compactSizeCardData];
  v3 = [v1 cardForData:v2 messageName:@"searchfoundation.Card"];

  return v3;
}

@end