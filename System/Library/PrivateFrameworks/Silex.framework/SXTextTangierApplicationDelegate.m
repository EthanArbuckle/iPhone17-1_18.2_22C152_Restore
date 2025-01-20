@interface SXTextTangierApplicationDelegate
+ (void)setup;
- (id)createCompatibilityDelegate;
@end

@implementation SXTextTangierApplicationDelegate

+ (void)setup
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SXTextTangierApplicationDelegate_setup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (setup_onceToken != -1) {
    dispatch_once(&setup_onceToken, block);
  }
}

void __41__SXTextTangierApplicationDelegate_setup__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)__applicationDelegate;
  __applicationDelegate = (uint64_t)v0;

  [MEMORY[0x263F7C700] setSurrogateDelegate:__applicationDelegate];
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  uint64_t v4 = *MEMORY[0x263F07F50];
  v5 = [v3 valueForKey:*MEMORY[0x263F07F50]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F08690]);
    v7 = [MEMORY[0x263F08B88] currentThread];
    v8 = [v7 threadDictionary];
    [v8 setValue:v9 forKey:v4];
  }
}

- (id)createCompatibilityDelegate
{
  return 0;
}

@end