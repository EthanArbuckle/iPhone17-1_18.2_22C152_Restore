@interface TIKeyboardInputManagerSimplifiedWubi
+ (Class)wordSearchClass;
- (id)keyEventMap;
- (id)sortingMethods;
- (int)inputMethodType;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManagerSimplifiedWubi

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9F8];
  uint64_t v3 = *MEMORY[0x263F7E9E0];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerSimplifiedWubi;
  return [(TIKeyboardInputManagerChinese *)&v5 initImplementationWithMode:v2 andLanguage:v3];
}

- (int)inputMethodType
{
  return 7;
}

- (id)sortingMethods
{
  if ([(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates])
  {
    uint64_t v3 = &unk_26F5E8F48;
  }
  else
  {
    BOOL v4 = [(TIKeyboardInputManagerChinese *)self hasIdeographicCandidates];
    objc_super v5 = (void *)MEMORY[0x263EFF8C0];
    v6 = [NSNumber numberWithUnsignedInteger:1];
    if (v4)
    {
      v7 = [NSNumber numberWithUnsignedInteger:4];
      uint64_t v3 = objc_msgSend(v5, "arrayWithObjects:", v6, v7, 0);
    }
    else
    {
      uint64_t v3 = [v5 arrayWithObject:v6];
    }
  }
  return v3;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E590] sharedInstance];
}

@end