@interface PIDepthAdjustmentController(Analytics)
- (id)analyticsKeysBlocklist;
- (id)analyticsPayload;
@end

@implementation PIDepthAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v2 setMinimumFractionDigits:1];
  [v2 setMaximumFractionDigits:2];
  uint64_t v3 = [a1 adjustment];
  if (v3)
  {
    v4 = (void *)v3;
    id v39 = v2;
    int v5 = [a1 enabled];

    if (v5)
    {
      v6 = [a1 visualInputKeys];
      v41 = a1;
      v7 = [a1 analyticsKeysBlocklist];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
      id v2 = v39;
      if (!v9) {
        goto LABEL_19;
      }
      uint64_t v10 = v9;
      unint64_t v11 = 0x263F5D000uLL;
      uint64_t v12 = *(void *)v43;
      while (1)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (([v7 containsObject:v14] & 1) == 0)
          {
            v15 = [*(id *)(v11 + 1464) apertureKey];
            int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              v17 = NSNumber;
              [v41 aperture];
              v18 = objc_msgSend(v17, "numberWithDouble:");
              v19 = [v2 stringFromNumber:v18];
              [v40 setObject:v19 forKeyedSubscript:@"aperture"];
              goto LABEL_15;
            }
            v20 = [*(id *)(v11 + 1464) focusRectKey];
            int v21 = [v14 isEqualToString:v20];

            if (v21)
            {
              v22 = [v41 focusRect];
              v23 = [v22 objectForKeyedSubscript:@"x"];
              [v23 floatValue];
              double v25 = v24;

              v26 = [v41 focusRect];
              v27 = [v26 objectForKeyedSubscript:@"y"];
              [v27 floatValue];
              double v29 = v28;

              v30 = [NSNumber numberWithDouble:v25];
              v18 = [v2 stringFromNumber:v30];

              v31 = [NSNumber numberWithDouble:v29];
              v19 = [v2 stringFromNumber:v31];

              v32 = [NSString stringWithFormat:@"%@_%@", v18, v19];
              [v40 setObject:v32 forKeyedSubscript:@"focusRect"];

              goto LABEL_15;
            }
            v18 = [v41 valueForKey:v14];
            [v18 doubleValue];
            if (v33 != 0.0)
            {
              v34 = NSNumber;
              [v18 doubleValue];
              v19 = objc_msgSend(v34, "numberWithDouble:");
              v35 = [v2 stringFromNumber:v19];
              [v40 setObject:v35 forKeyedSubscript:v14];

              id v2 = v39;
LABEL_15:
            }
            unint64_t v11 = 0x263F5D000;
            continue;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (!v10)
        {
LABEL_19:
          v36 = v8;

          id v37 = v40;
          goto LABEL_22;
        }
      }
    }
    id v37 = (id)MEMORY[0x263EFFA78];
    id v2 = v39;
  }
  else
  {
    id v37 = (id)MEMORY[0x263EFFA78];
  }
LABEL_22:

  return v37;
}

- (id)analyticsKeysBlocklist
{
  v0 = (void *)MEMORY[0x263EFFA08];
  v1 = [MEMORY[0x263F5D5B8] depthInfoKey];
  id v2 = [MEMORY[0x263F5D5B8] glassesMatteAllowedKey];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, 0);

  return v3;
}

@end