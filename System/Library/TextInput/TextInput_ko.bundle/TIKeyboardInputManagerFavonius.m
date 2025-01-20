@interface TIKeyboardInputManagerFavonius
@end

@implementation TIKeyboardInputManagerFavonius

uint64_t __54__TIKeyboardInputManagerFavonius_ko_acceptsCharacter___block_invoke()
{
  uint64_t result = [NSString _characterSetWithPattern:@"[:Script=Hangul:]"];
  -[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::hangul_set = result;
  return result;
}

@end