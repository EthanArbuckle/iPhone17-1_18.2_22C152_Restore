@interface TIKeyboardInputManagerCangjie_zh
- (id)keyEventMap;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManagerCangjie_zh

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9C8];
  uint64_t v3 = *MEMORY[0x263F7E9F0];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerCangjie_zh;
  return [(TIKeyboardInputManagerChinese *)&v5 initImplementationWithMode:v2 andLanguage:v3];
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5A0] sharedInstance];
}

@end