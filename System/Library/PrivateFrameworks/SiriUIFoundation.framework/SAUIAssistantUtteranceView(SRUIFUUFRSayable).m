@interface SAUIAssistantUtteranceView(SRUIFUUFRSayable)
- (id)sruif__uufrSaid;
@end

@implementation SAUIAssistantUtteranceView(SRUIFUUFRSayable)

- (id)sruif__uufrSaid
{
  v8[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F6EEB8]);
  v3 = [a1 dialogIdentifier];
  [v2 setDialogIdentifier:v3];

  v4 = [a1 aceId];
  [v2 setAceViewID:v4];

  v5 = [a1 encodedClassName];
  [v2 setAceViewClass:v5];

  v8[0] = v2;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

@end