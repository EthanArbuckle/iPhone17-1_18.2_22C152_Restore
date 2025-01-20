@interface TIKeyboardInputManager
@end

@implementation TIKeyboardInputManager

void __59__TIKeyboardInputManager_ug_keyboardConfigurationLayoutTag__block_invoke()
{
  id v2 = [MEMORY[0x263F08708] letterCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)-[TIKeyboardInputManager_ug keyboardConfigurationLayoutTag]::__nonLetterSet;
  -[TIKeyboardInputManager_ug keyboardConfigurationLayoutTag]::__nonLetterSet = v0;
}

@end