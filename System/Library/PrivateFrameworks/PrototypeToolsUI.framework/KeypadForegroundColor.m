@interface KeypadForegroundColor
@end

@implementation KeypadForegroundColor

uint64_t ___KeypadForegroundColor_block_invoke()
{
  _KeypadForegroundColor___color = [MEMORY[0x263F1C550] colorWithWhite:0.5 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

@end