@interface SXGradientFillToBackgroundColorModifier
- (id)convertGradientFillToBackgroundColorForComponentStyle:(id)a3;
- (void)modifyDOM:(id)a3 context:(id)a4;
@end

@implementation SXGradientFillToBackgroundColorModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v5 = a3;
  v6 = [v5 componentStyles];
  v7 = (void *)[v6 copy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__SXGradientFillToBackgroundColorModifier_modifyDOM_context___block_invoke;
  v9[3] = &unk_264651CF0;
  id v10 = v5;
  v11 = self;
  id v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __61__SXGradientFillToBackgroundColorModifier_modifyDOM_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 backgroundColor];

  if (!v7)
  {
    uint64_t v8 = [v6 fill];
    if (v8)
    {
      v9 = (void *)v8;
      id v10 = [v6 fill];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v28 = a1;
        id v29 = v6;
        id v30 = v5;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v12 = [v6 fill];
        v13 = [v12 colorStops];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          id v16 = 0;
          uint64_t v17 = *(void *)v33;
          id obj = v13;
          while (2)
          {
            uint64_t v18 = 0;
            v19 = v16;
            do
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(obj);
              }
              v20 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
              if (v19)
              {
                v21 = [v19 color];
                v22 = [v21 hex];
                v23 = [v20 color];
                v24 = [v23 hex];
                int v25 = [v22 isEqualToString:v24];

                if (!v25)
                {
                  id v6 = v29;
                  v26 = obj;
                  goto LABEL_18;
                }
              }
              id v16 = v20;

              ++v18;
              v19 = v16;
            }
            while (v15 != v18);
            v13 = obj;
            uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v16 = 0;
        }

        id v6 = v29;
        v26 = [*(id *)(v28 + 40) convertGradientFillToBackgroundColorForComponentStyle:v29];
        v27 = [*(id *)(v28 + 32) componentStyles];
        [v27 setObject:v26 forKeyedSubscript:v30];

        v19 = v16;
LABEL_18:

        id v5 = v30;
      }
    }
  }
}

- (id)convertGradientFillToBackgroundColorForComponentStyle:(id)a3
{
  id v3 = a3;
  v4 = [v3 JSONRepresentation];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [v3 fill];
  v7 = [v6 colorStops];
  uint64_t v8 = [v7 firstObject];

  v9 = [v8 color];

  if (v9)
  {
    id v10 = [v8 color];
    v11 = [v10 hex];
    [v5 setObject:v11 forKeyedSubscript:@"backgroundColor"];

    [v5 setObject:0 forKeyedSubscript:@"fill"];
  }
  v12 = [SXComponentStyle alloc];
  v13 = [v3 specificationVersion];
  uint64_t v14 = [(SXJSONObject *)v12 initWithJSONObject:v5 andVersion:v13];

  return v14;
}

@end