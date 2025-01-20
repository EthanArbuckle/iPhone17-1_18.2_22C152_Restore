@interface TIKeyboardInputManagerSimplifiedWubixing
- (id)keyEventMap;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManagerSimplifiedWubixing

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9C0];
  uint64_t v3 = *MEMORY[0x263F7E9E0];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerSimplifiedWubixing;
  return [(TIKeyboardInputManagerChinese *)&v5 initImplementationWithMode:v2 andLanguage:v3];
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E598] sharedInstance];
}

@end