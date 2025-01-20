@interface VUIMediaTagsImageHelper
+ (id)imageWithName:(id)a3 flatten:(BOOL)a4 accessibilityDescription:(id)a5;
+ (void)initialize;
@end

@implementation VUIMediaTagsImageHelper

+ (void)initialize
{
  if (initialize_onceToken_4 != -1) {
    dispatch_once(&initialize_onceToken_4, &__block_literal_global_83);
  }
}

uint64_t __37__VUIMediaTagsImageHelper_initialize__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)imageCache;
  imageCache = v0;

  [(id)imageCache setCountLimit:20];
  v2 = (void *)imageCache;
  return [v2 setName:@"MediaTagsImageHelperCache"];
}

+ (id)imageWithName:(id)a3 flatten:(BOOL)a4 accessibilityDescription:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  v9 = [(id)imageCache objectForKey:v7];
  if (!v9)
  {
    v10 = [MEMORY[0x1E4FB3C70] imageForResource:v7 accessibilityDescription:v8];
    v9 = v10;
    if (v10)
    {
      if (v6)
      {
        uint64_t v11 = [v10 vuiTemplateImage];

        v9 = (void *)v11;
      }
      [(id)imageCache setObject:v9 forKey:v7];
    }
  }

  return v9;
}

@end