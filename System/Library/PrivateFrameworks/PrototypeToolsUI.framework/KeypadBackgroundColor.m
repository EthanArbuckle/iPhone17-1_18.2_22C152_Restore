@interface KeypadBackgroundColor
@end

@implementation KeypadBackgroundColor

uint64_t ___KeypadBackgroundColor_block_invoke()
{
  _KeypadBackgroundColor___color = [MEMORY[0x263F1C550] colorWithWhite:0.95 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

@end