@interface KeypadFlashColor
@end

@implementation KeypadFlashColor

uint64_t ___KeypadFlashColor_block_invoke()
{
  _KeypadFlashColor___color = [MEMORY[0x263F1C550] colorWithWhite:0.75 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

@end