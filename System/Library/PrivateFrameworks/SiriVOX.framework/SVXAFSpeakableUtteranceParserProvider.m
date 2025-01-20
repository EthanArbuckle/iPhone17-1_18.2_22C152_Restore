@interface SVXAFSpeakableUtteranceParserProvider
- (id)getWithLocale:(id)a3;
@end

@implementation SVXAFSpeakableUtteranceParserProvider

- (id)getWithLocale:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F28640];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithLocale:v4];

  return v5;
}

@end