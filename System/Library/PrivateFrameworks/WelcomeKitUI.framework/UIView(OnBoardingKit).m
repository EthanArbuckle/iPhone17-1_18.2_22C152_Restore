@interface UIView(OnBoardingKit)
- (id)wl_progressLabel;
@end

@implementation UIView(OnBoardingKit)

- (id)wl_progressLabel
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v1 = [a1 subviews];
  id v2 = (id)[v1 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v44;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v44 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v6 = [v2 subviews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    while (2)
    {
      for (uint64_t j = 0; j != v8; ++j)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        if ([v11 isMemberOfClass:objc_opt_class()])
        {
          id v12 = v11;

          id v2 = v12;
          goto LABEL_21;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v13 = [v2 subviews];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    while (2)
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v35 + 1) + 8 * k);
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        int v21 = [v20 isEqualToString:@"OBContentView"];

        if (v21)
        {
          id v22 = v18;

          id v2 = v22;
          goto LABEL_31;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v48 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_31:

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v23 = objc_msgSend(v2, "subviews", 0);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    while (2)
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v31 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = v28;

          id v2 = v29;
          goto LABEL_41;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v47 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
LABEL_41:

  return v2;
}

@end