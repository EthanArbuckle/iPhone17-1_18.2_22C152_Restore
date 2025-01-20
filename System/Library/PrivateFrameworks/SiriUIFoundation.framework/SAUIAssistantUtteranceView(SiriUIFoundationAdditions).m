@interface SAUIAssistantUtteranceView(SiriUIFoundationAdditions)
- (id)sruif_insertionContext;
- (uint64_t)sruif_isUtterance;
@end

@implementation SAUIAssistantUtteranceView(SiriUIFoundationAdditions)

- (uint64_t)sruif_isUtterance
{
  return 1;
}

- (id)sruif_insertionContext
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [a1 encodedClassName];
  if (v3) {
    [v2 setObject:v3 forKey:*MEMORY[0x263F65D38]];
  }
  v4 = [a1 dialogIdentifier];
  if (v4) {
    [v2 setObject:v4 forKey:*MEMORY[0x263F65D40]];
  }

  return v2;
}

@end