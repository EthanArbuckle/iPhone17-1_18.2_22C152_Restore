@interface TIKeyboardInputManagerWubi_yue
+ (Class)wordSearchClass;
- (id)keyEventMap;
- (int)inputMethodType;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManagerWubi_yue

+ (Class)wordSearchClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F7E9A8], a2);
}

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9F8];
  uint64_t v3 = *MEMORY[0x263F7E9E8];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerWubi_yue;
  return [(TIKeyboardInputManagerChinese *)&v5 initImplementationWithMode:v2 andLanguage:v3];
}

- (int)inputMethodType
{
  return 15;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5B0] sharedInstance];
}

@end