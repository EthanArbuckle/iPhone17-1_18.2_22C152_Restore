@interface TIKeyboardInputManager_zh_hant_Pinyin
- (BOOL)usesComposingInput;
- (id)keyEventMap;
- (id)locale;
- (id)phoneticSortingMethod;
- (int)inputMethodType;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManager_zh_hant_Pinyin

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9F0];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_hant_Pinyin;
  return [(TIKeyboardInputManagerChinese *)&v4 initImplementationWithMode:@"Pinyin" andLanguage:v2];
}

- (int)inputMethodType
{
  return 4;
}

- (id)locale
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"zh-Hant"];
  return v2;
}

- (id)phoneticSortingMethod
{
  return &unk_26F5E8FA0;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5A8] sharedInstance];
}

- (BOOL)usesComposingInput
{
  uint64_t v2 = [(TIKeyboardInputManagerBase *)self currentInputModeIdentifier];
  v3 = TIInputModeGetComponentsFromIdentifier();
  objc_super v4 = [v3 objectForKey:@"sw"];

  LOBYTE(v2) = [v4 isEqualToString:@"Pinyin-Traditional"];
  return (char)v2;
}

@end