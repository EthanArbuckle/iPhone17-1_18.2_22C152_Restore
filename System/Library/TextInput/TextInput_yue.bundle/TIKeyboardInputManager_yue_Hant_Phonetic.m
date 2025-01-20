@interface TIKeyboardInputManager_yue_Hant_Phonetic
- (id)keyEventMap;
- (id)locale;
- (id)phoneticSortingMethod;
- (int)mecabraInputMethodType;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManager_yue_Hant_Phonetic

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9E8];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_yue_Hant_Phonetic;
  return [(TIKeyboardInputManagerChinese *)&v4 initImplementationWithMode:@"Pinyin" andLanguage:v2];
}

- (int)mecabraInputMethodType
{
  return 13;
}

- (id)locale
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"yue-Hant"];

  return v2;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5A8] sharedInstance];
}

- (id)phoneticSortingMethod
{
  return &unk_26F5E61A8;
}

@end