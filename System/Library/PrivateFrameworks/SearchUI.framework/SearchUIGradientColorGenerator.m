@interface SearchUIGradientColorGenerator
- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SearchUIGradientColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v15 = (void (**)(id, void *))a4;
  v6 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = [(SearchUIColorGenerator *)self sfColor];
  v8 = [v7 colors];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        if ([v13 isMemberOfClass:objc_opt_class()])
        {
          v14 = objc_msgSend(objc_alloc((Class)objc_msgSend(v13, "searchUI_colorGeneratorClass")), "initWithSFColor:", v13);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __75__SearchUIGradientColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
          v16[3] = &unk_1E6E728C0;
          id v17 = v6;
          [v14 generateUIColorsIsDark:v4 completionHandler:v16];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v15[2](v15, v6);
}

uint64_t __75__SearchUIGradientColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:a2];
}

@end