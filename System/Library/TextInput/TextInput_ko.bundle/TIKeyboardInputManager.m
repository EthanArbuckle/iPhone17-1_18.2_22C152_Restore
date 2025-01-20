@interface TIKeyboardInputManager
@end

@implementation TIKeyboardInputManager

uint64_t __48__TIKeyboardInputManager_ko_setInput_withIndex___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = MEMORY[0x24563CC90](*(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __55__TIKeyboardInputManager_ko_validUSetForAutocorrection__block_invoke()
{
  uint64_t result = [NSString _characterSetWithPattern:@"[:Script=Hangul:]"];
  -[TIKeyboardInputManager_ko validUSetForAutocorrection]::hangul_set = result;
  return result;
}

void __64__TIKeyboardInputManager_ko_validUSetForAutocorrectionSecondary__block_invoke()
{
  v0 = (void *)MEMORY[0x263F7EAA0];
  id v1 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
  -[TIKeyboardInputManager_ko validUSetForAutocorrectionSecondary]::english_set = [v0 createAcceptableCharacterSetForKeyboardLocale:v1];
}

@end