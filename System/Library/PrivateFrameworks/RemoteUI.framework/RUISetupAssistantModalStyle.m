@interface RUISetupAssistantModalStyle
- (void)applyToObjectModel:(id)a3;
@end

@implementation RUISetupAssistantModalStyle

- (void)applyToObjectModel:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RUISetupAssistantModalStyle;
  [(RUISetupAssistantStyle *)&v24 applyToObjectModel:v4];
  v5 = [v4 allPages];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v10 view];
        v12 = [v11 superview];

        if (v12)
        {
          v13 = [v10 view];
          v14 = [v13 traitCollection];
          uint64_t v15 = [v14 horizontalSizeClass];

          if (v15 == 1) {
            double v16 = 0.0;
          }
          else {
            double v16 = 6.0;
          }
          [v10 setCustomMargin:v16];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  v17 = [v4 defaultPages];
  v18 = [v17 firstObject];
  v19 = [v18 navigationController];
  [(RUIStyle *)self applyToNavigationController:v19];
}

@end