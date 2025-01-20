@interface PISemanticStyleAdjustmentController(Analytics)
- (id)analyticsKeysBlocklist;
- (id)analyticsPayload;
@end

@implementation PISemanticStyleAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v2 setMinimumFractionDigits:1];
  v35 = v2;
  [v2 setMaximumFractionDigits:2];
  uint64_t v3 = [a1 adjustment];
  if (v3 && (v4 = (void *)v3, int v5 = [a1 enabled], v4, v5))
  {
    v6 = [a1 visualInputKeys];
    v7 = [a1 analyticsKeysBlocklist];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v41;
      v37 = v7;
      do
      {
        uint64_t v11 = 0;
        uint64_t v38 = v9;
        do
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
          if (([v7 containsObject:v12] & 1) == 0)
          {
            v13 = a1;
            v14 = [MEMORY[0x263F5D640] toneKey];
            v44[0] = v14;
            v15 = [MEMORY[0x263F5D640] colorKey];
            v44[1] = v15;
            v16 = [MEMORY[0x263F5D640] intensityKey];
            v44[2] = v16;
            v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
            int v18 = [v17 containsObject:v12];

            if (v18)
            {
              v19 = NSNumber;
              a1 = v13;
              v20 = [v13 valueForKey:v12];
              [v20 doubleValue];
              v21 = objc_msgSend(v19, "numberWithDouble:");
              v22 = [v35 stringFromNumber:v21];
              v23 = [NSString stringWithFormat:@"styles_%@", v12];
              [v36 setObject:v22 forKeyedSubscript:v23];

              goto LABEL_13;
            }
            v24 = [MEMORY[0x263F5D640] castKey];
            int v25 = [v12 isEqualToString:v24];

            a1 = v13;
            if (v25)
            {
              v20 = [v13 cast];
              [v36 setObject:v20 forKeyedSubscript:@"styles_cast"];
LABEL_13:
              uint64_t v9 = v38;
            }
            else
            {
              v20 = [v13 valueForKey:v12];
              [v20 doubleValue];
              uint64_t v9 = v38;
              if (v26 != 0.0)
              {
                v27 = NSNumber;
                [v20 doubleValue];
                v28 = objc_msgSend(v27, "numberWithDouble:");
                v29 = [v35 stringFromNumber:v28];
                v30 = [NSString stringWithFormat:@"styles_%@", v12];
                [v36 setObject:v29 forKeyedSubscript:v30];
              }
            }

            v7 = v37;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        uint64_t v9 = v31;
      }
      while (v31);
    }

    if ([a1 hasDefaultStyleParameters]) {
      v32 = @"1";
    }
    else {
      v32 = @"0";
    }
    [v36 setObject:v32 forKeyedSubscript:@"styles_is_default"];
    id v33 = v36;
  }
  else
  {
    id v33 = (id)MEMORY[0x263EFFA78];
  }

  return v33;
}

- (id)analyticsKeysBlocklist
{
  v0 = (void *)MEMORY[0x263EFFA08];
  v1 = [MEMORY[0x263F5D640] useStyleEngineKey];
  id v2 = [MEMORY[0x263F5D640] statisticsKey];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, 0);

  return v3;
}

@end