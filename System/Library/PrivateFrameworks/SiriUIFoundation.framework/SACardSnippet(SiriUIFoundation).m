@interface SACardSnippet(SiriUIFoundation)
- (id)siriui_card;
- (id)siriui_card_compact;
- (id)siriui_eventInfo;
@end

@implementation SACardSnippet(SiriUIFoundation)

- (id)siriui_eventInfo
{
  v15[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F67B20]);
  v3 = objc_msgSend(a1, "siriui_card");
  v4 = (void *)[v2 initWithFacade:v3];

  v5 = [v4 cardSections];
  v6 = NSStringFromSelector(sel_type);
  v7 = [v5 valueForKeyPath:v6];

  v14[0] = @"numberOfSections";
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v7, "count"));
  v14[1] = @"cardSections";
  v15[0] = v8;
  uint64_t v9 = [v7 componentsJoinedByString:@","];
  v10 = (void *)v9;
  v11 = &stru_26D9AE000;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v15[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (id)siriui_card
{
  v1 = (void *)MEMORY[0x263F31690];
  id v2 = [a1 cardData];
  v3 = [v1 cardForData:v2 messageName:@"searchfoundation.Card"];

  return v3;
}

- (id)siriui_card_compact
{
  v1 = (void *)MEMORY[0x263F31690];
  id v2 = [a1 compactSizeCardData];
  v3 = [v1 cardForData:v2 messageName:@"searchfoundation.Card"];

  return v3;
}

@end