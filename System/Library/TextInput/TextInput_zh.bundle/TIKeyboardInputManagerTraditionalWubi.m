@interface TIKeyboardInputManagerTraditionalWubi
+ (Class)wordSearchClass;
- (id)keyEventMap;
- (int)inputMethodType;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManagerTraditionalWubi

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9F8];
  uint64_t v3 = *MEMORY[0x263F7E9F0];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerTraditionalWubi;
  return [(TIKeyboardInputManagerChinese *)&v5 initImplementationWithMode:v2 andLanguage:v3];
}

- (int)inputMethodType
{
  return 8;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5B0] sharedInstance];
}

@end