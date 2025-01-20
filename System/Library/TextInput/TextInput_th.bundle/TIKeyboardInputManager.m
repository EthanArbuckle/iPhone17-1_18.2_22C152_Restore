@interface TIKeyboardInputManager
@end

@implementation TIKeyboardInputManager

uint64_t __55__TIKeyboardInputManager_th_validUSetForAutocorrection__block_invoke()
{
  uint64_t result = [NSString _characterSetWithPattern:@"[:Script=Thai:]"];
  -[TIKeyboardInputManager_th validUSetForAutocorrection]::thai_alphabet_set = result;
  return result;
}

@end