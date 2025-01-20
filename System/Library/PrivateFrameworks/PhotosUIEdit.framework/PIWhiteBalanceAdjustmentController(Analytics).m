@interface PIWhiteBalanceAdjustmentController(Analytics)
- (id)analyticsKeysBlocklist;
- (id)analyticsPayload;
@end

@implementation PIWhiteBalanceAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = +[PEAnalyticsUtility adjustmentValueBucketizerFormatter];
  uint64_t v4 = [a1 adjustment];
  if (v4)
  {
    v5 = (void *)v4;
    int v6 = [a1 enabled];

    if (v6)
    {
      uint64_t v43 = [a1 colorType];
      [a1 visualInputKeys];
      v7 = v42 = v3;
      v44 = a1;
      v8 = [a1 analyticsKeysBlocklist];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v9 = v7;
      v3 = v42;
      id obj = v9;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (!v10) {
        goto LABEL_39;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v47;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (([v8 containsObject:v14] & 1) == 0)
          {
            v15 = [MEMORY[0x263F5D688] colorTypeKey];
            int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              v17 = [MEMORY[0x263F5D688] stringForColorType:v43];
              [v2 setObject:v17 forKeyedSubscript:@"whiteBalanceType"];
LABEL_36:

              continue;
            }
            v18 = [MEMORY[0x263F5D688] warmTintKey];
            if ([v14 isEqualToString:v18])
            {
              [v44 warmTint];
              double v20 = v19;

              if (v20 != 0.0)
              {
                if (v43 != 3) {
                  continue;
                }
                v21 = NSNumber;
                [v44 warmTint];
                v17 = objc_msgSend(v21, "numberWithDouble:");
                v22 = [v3 stringFromNumber:v17];
                v23 = v2;
                v24 = v22;
                v25 = @"tint";
LABEL_31:
                [v23 setObject:v24 forKeyedSubscript:v25];
LABEL_35:

                goto LABEL_36;
              }
            }
            else
            {
            }
            v26 = [MEMORY[0x263F5D688] warmTempKey];
            if ([v14 isEqualToString:v26])
            {
              [v44 warmTemp];
              double v28 = v27;

              if (v28 != 0.0)
              {
                if (v43 != 3) {
                  continue;
                }
                v29 = NSNumber;
                [v44 warmTemp];
LABEL_30:
                v17 = objc_msgSend(v29, "numberWithDouble:");
                v22 = [v3 stringFromNumber:v17];
                v23 = v2;
                v24 = v22;
                v25 = @"temperature";
                goto LABEL_31;
              }
            }
            else
            {
            }
            v30 = [MEMORY[0x263F5D688] faceWarmthKey];
            if ([v14 isEqualToString:v30])
            {
              [v44 faceWarmth];
              double v32 = v31;

              if (v32 != 0.0)
              {
                if (v43 != 1) {
                  continue;
                }
                v29 = NSNumber;
                [v44 faceWarmth];
                goto LABEL_30;
              }
            }
            else
            {
            }
            v33 = [MEMORY[0x263F5D688] grayWarmthKey];
            if ([v14 isEqualToString:v33])
            {
              [v44 faceWarmth];
              double v35 = v34;

              if (v35 != 0.0)
              {
                if ((v43 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
                  continue;
                }
                v29 = NSNumber;
                [v44 grayWarmth];
                goto LABEL_30;
              }
            }
            else
            {
            }
            v17 = [v44 valueForKey:v14];
            [v17 doubleValue];
            if (v36 == 0.0) {
              goto LABEL_36;
            }
            v37 = NSNumber;
            [v17 doubleValue];
            v22 = objc_msgSend(v37, "numberWithDouble:");
            [v3 stringFromNumber:v22];
            v39 = v38 = v2;
            [v38 setObject:v39 forKeyedSubscript:v14];

            id v2 = v38;
            v3 = v42;
            goto LABEL_35;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (!v11)
        {
LABEL_39:

          id v40 = v2;
          goto LABEL_41;
        }
      }
    }
  }
  id v40 = (id)MEMORY[0x263EFFA78];
LABEL_41:

  return v40;
}

- (id)analyticsKeysBlocklist
{
  id v11 = (id)MEMORY[0x263EFFA08];
  v14 = [MEMORY[0x263F5D688] faceIKey];
  v13 = [MEMORY[0x263F5D688] temperatureKey];
  v0 = [MEMORY[0x263F5D688] grayIKey];
  uint64_t v10 = [MEMORY[0x263F5D688] grayYKey];
  v1 = [MEMORY[0x263F5D688] tintKey];
  id v2 = [MEMORY[0x263F5D688] warmFaceKey];
  v3 = [MEMORY[0x263F5D688] faceQKey];
  uint64_t v4 = [MEMORY[0x263F5D688] autoKey];
  v5 = [MEMORY[0x263F5D688] enabledKey];
  int v6 = [MEMORY[0x263F5D688] grayQKey];
  v7 = [MEMORY[0x263F5D688] faceStrengthKey];
  v8 = [MEMORY[0x263F5D688] grayStrengthKey];
  objc_msgSend(v11, "setWithObjects:", v14, v13, v0, v10, v1, v2, v3, v4, v5, v6, v7, v8, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end