@interface _TVListMediaQueryEvaluator
- (BOOL)evaluteForMediaType:(id)a3 featureType:(id)a4 value:(id)a5 result:(BOOL *)a6;
@end

@implementation _TVListMediaQueryEvaluator

- (BOOL)evaluteForMediaType:(id)a3 featureType:(id)a4 value:(id)a5 result:(BOOL *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a4;
  if (IsTemplateMediaType(a3) && [v9 isEqualToString:@"-tv-header"])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v10 = [(TVMediaQueryEvaluator *)self templateElement];
    v11 = [v10 children];

    id v12 = (id)[v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v29;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v15, "tv_elementType") == 22)
          {
            id v12 = v15;
            goto LABEL_14;
          }
        }
        id v12 = (id)[v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v17 = objc_msgSend(v12, "children", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          if (objc_msgSend(v22, "tv_elementType") == 58 || objc_msgSend(v22, "tv_elementType") == 15)
          {
            *a6 = 1;
            goto LABEL_25;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_25:

    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

@end