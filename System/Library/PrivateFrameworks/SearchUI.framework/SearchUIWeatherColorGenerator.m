@interface SearchUIWeatherColorGenerator
- (int)defaultTintStyle;
- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation SearchUIWeatherColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v7[3] = &unk_1E6E72C68;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  +[SearchUIUtilities dispatchAsyncIfNecessary:v7];
}

void __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sfColor];
  v3 = [v2 location];
  [v3 lat];
  uint64_t v17 = v4;

  id v5 = [v2 location];
  [v5 lng];
  uint64_t v18 = v6;

  v7 = [v2 date];
  if (v7)
  {
    id v8 = [v2 date];
    MEMORY[0x1E4E83BD0]();
  }
  else
  {
    CFAbsoluteTimeGetCurrent();
  }

  char isDayLightForLocation = geo_isDayLightForLocation();
  v10 = objc_opt_new();
  v11 = [*(id *)(a1 + 32) sfColor];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke_2;
  v13[3] = &unk_1E6E72F30;
  char v16 = isDayLightForLocation;
  id v14 = v2;
  id v15 = *(id *)(a1 + 40);
  id v12 = v2;
  [v10 generateHexColorsWithSfColor:v11 completionHandler:v13];
}

void __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[SearchUIBackgroundColorUtilities colorWithHexString:*(void *)(*((void *)&v30 + 1) + 8 * v9)];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)(a1 + 48))
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      v11 = [*(id *)(a1 + 32) condition];
      if ([v11 isEqualToString:@"haze"])
      {
        double v12 = 0.3;
      }
      else if ([v11 isEqualToString:@"cloudy"])
      {
        double v12 = 0.3;
      }
      else
      {
        double v12 = 0.2;
      }
    }
    else
    {
      double v12 = 0.1;
    }
  }
  else
  {
    double v12 = 0.0;
  }
  v13 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    double v18 = 1.0 - v12;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * v19);
        double v24 = 0.0;
        double v25 = 0.0;
        double v22 = 0.0;
        double v23 = 0.0;
        [v20 getRed:&v25 green:&v24 blue:&v23 alpha:&v22];
        v21 = [MEMORY[0x1E4FB1618] colorWithRed:v18 * v25 green:v18 * v24 blue:v18 * v23 alpha:v22];
        [v13 addObject:v21];

        ++v19;
      }
      while (v16 != v19);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int)defaultTintStyle
{
  return 1;
}

@end