@interface TVSearchTemplateController
@end

@implementation TVSearchTemplateController

uint64_t __43___TVSearchTemplateController__isAtWordEnd__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" -"];
  uint64_t v1 = _isAtWordEnd_wordDelimiters;
  _isAtWordEnd_wordDelimiters = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end