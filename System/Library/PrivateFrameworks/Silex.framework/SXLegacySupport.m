@interface SXLegacySupport
+ (id)deprecatedComponentForType:(void *)a3 andVersion:;
+ (id)deprecatedComponents;
+ (id)deprecatedComponentsForVersion:(uint64_t)a1;
@end

@implementation SXLegacySupport

void __50__SXLegacySupport_deprecatedComponentsForVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 compare:*(void *)(a1 + 32) options:64] == 1) {
    [*(id *)(a1 + 40) addObjectsFromArray:v5];
  }
}

+ (id)deprecatedComponents
{
  self;
  if (deprecatedComponents_onceToken != -1) {
    dispatch_once(&deprecatedComponents_onceToken, &__block_literal_global_72);
  }
  v0 = (void *)deprecatedComponents_deprecatedComponents;
  return v0;
}

+ (id)deprecatedComponentsForVersion:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [MEMORY[0x263EFF980] array];
  v4 = +[SXLegacySupport deprecatedComponents]();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SXLegacySupport_deprecatedComponentsForVersion___block_invoke;
  v10[3] = &unk_2646537C0;
  id v11 = v2;
  id v5 = v3;
  id v12 = v5;
  id v6 = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  v7 = v12;
  id v8 = v5;

  return v8;
}

+ (id)deprecatedComponentForType:(void *)a3 andVersion:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  +[SXLegacySupport deprecatedComponentsForVersion:](v6, v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = -[SXFullscreenCaption text]((uint64_t)v11);
        int v13 = objc_msgSend(v12, "isEqualToString:", v4, (void)v15);

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

void __39__SXLegacySupport_deprecatedComponents__block_invoke()
{
  v13[2] = *MEMORY[0x263EF8340];
  v12[0] = @"1.2";
  uint64_t v0 = objc_opt_class();
  v1 = +[SXDeprecatedComponent deprecatedComponentWithType:withReplacementClassificationClass:]((uint64_t)SXDeprecatedComponent, @"twitter_embed", v0);
  v11[0] = v1;
  uint64_t v2 = objc_opt_class();
  v3 = +[SXDeprecatedComponent deprecatedComponentWithType:withReplacementClassificationClass:]((uint64_t)SXDeprecatedComponent, @"instagram_embed", v2);
  v11[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v12[1] = @"1.11";
  v13[0] = v4;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = +[SXDeprecatedComponent deprecatedComponentWithType:withReplacementClassificationClass:]((uint64_t)SXDeprecatedComponent, @"subscription_button", v5);
  v10 = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
  v13[1] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v9 = (void *)deprecatedComponents_deprecatedComponents;
  deprecatedComponents_deprecatedComponents = v8;
}

@end