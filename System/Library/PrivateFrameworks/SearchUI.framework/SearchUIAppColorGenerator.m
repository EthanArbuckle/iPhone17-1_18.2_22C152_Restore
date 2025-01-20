@interface SearchUIAppColorGenerator
- (int)defaultTintStyle;
- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SearchUIAppColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SearchUIAppColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v7[3] = &unk_1E6E72C68;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v7];
}

void __70__SearchUIAppColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sfColor];
  v3 = [v2 applicationBundleIdentifier];

  v4 = objc_opt_new();
  id v20 = 0;
  id v5 = [v4 colorsForBundleIdentifier:v3 error:&v20];
  id v18 = v20;

  id v6 = [v5 backgroundGradient];
  v7 = objc_opt_new();
  id v8 = [v6 startColor];
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "platformColor", v18);
    [v7 addObject:v10];
  }
  v11 = objc_msgSend(v6, "endColor", v18);
  v12 = v11;
  if (v11) {
    BOOL v13 = v11 == v9;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    v14 = [v11 platformColor];
    [v7 addObject:v14];
  }
  v15 = [v7 firstObject];
  v16 = [MEMORY[0x1E4FB1618] labelColor];
  int v17 = [v15 isEqual:v16];

  if (v17)
  {

    v7 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int)defaultTintStyle
{
  return 1;
}

@end