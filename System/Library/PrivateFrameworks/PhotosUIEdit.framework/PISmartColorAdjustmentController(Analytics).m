@interface PISmartColorAdjustmentController(Analytics)
- (id)analyticsKeysBlocklist;
- (id)analyticsPayload;
@end

@implementation PISmartColorAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = +[PEAnalyticsUtility adjustmentValueBucketizerFormatter];
  uint64_t v4 = [a1 adjustment];
  if (v4)
  {
    v5 = (void *)v4;
    int v6 = [a1 enabled];

    if (v6)
    {
      v7 = [a1 visualInputKeys];
      v8 = [a1 analyticsKeysBlocklist];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (!v10) {
        goto LABEL_32;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v49;
      uint64_t v47 = *(void *)v49;
      while (1)
      {
        uint64_t v13 = 0;
        uint64_t v46 = v11;
        do
        {
          if (*(void *)v49 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
          if ((objc_msgSend(v8, "containsObject:", v14, v46) & 1) == 0)
          {
            v15 = [MEMORY[0x263F5D660] autoKey];
            if ([v14 isEqualToString:v15])
            {
              int v16 = [a1 isAuto];

              if (v16)
              {
                [v2 setObject:@"1" forKeyedSubscript:@"sc_auto"];
LABEL_29:
                uint64_t v12 = v47;
                goto LABEL_30;
              }
            }
            else
            {
            }
            v17 = [MEMORY[0x263F5D660] offsetSaturationKey];
            if ([v14 isEqualToString:v17])
            {
              [a1 offsetSaturation];
              double v19 = v18;

              if (v19 != 0.0)
              {
                v20 = NSNumber;
                [a1 inputSaturation];
                v21 = objc_msgSend(v20, "numberWithDouble:");
                v22 = [v3 stringFromNumber:v21];
                v23 = v2;
                v24 = v22;
                v25 = @"saturation";
LABEL_24:
                [v23 setObject:v24 forKeyedSubscript:v25];

                goto LABEL_29;
              }
            }
            else
            {
            }
            v26 = [MEMORY[0x263F5D660] offsetContrastKey];
            if ([v14 isEqualToString:v26])
            {
              [a1 offsetContrast];
              double v28 = v27;

              if (v28 != 0.0)
              {
                v29 = NSNumber;
                [a1 inputContrast];
                v21 = objc_msgSend(v29, "numberWithDouble:");
                v22 = [v3 stringFromNumber:v21];
                v23 = v2;
                v24 = v22;
                v25 = @"vibrance";
                goto LABEL_24;
              }
            }
            else
            {
            }
            v30 = [MEMORY[0x263F5D660] inputColorKey];
            if ([v14 isEqualToString:v30])
            {
              [a1 inputColor];
              double v32 = v31;

              if (v32 != 0.0)
              {
                v33 = NSNumber;
                [a1 inputColor];
                v21 = objc_msgSend(v33, "numberWithDouble:");
                v22 = [v3 stringFromNumber:v21];
                v23 = v2;
                v24 = v22;
                v25 = @"sc_mega";
                goto LABEL_24;
              }
            }
            else
            {
            }
            v34 = [a1 valueForKey:v14];
            [v34 doubleValue];
            if (v35 != 0.0)
            {
              v36 = NSNumber;
              [v34 doubleValue];
              v37 = objc_msgSend(v36, "numberWithDouble:");
              [v3 stringFromNumber:v37];
              id v38 = v9;
              v39 = v8;
              v40 = a1;
              v41 = v3;
              v43 = v42 = v2;
              [v42 setObject:v43 forKeyedSubscript:v14];

              id v2 = v42;
              v3 = v41;
              a1 = v40;
              v8 = v39;
              id v9 = v38;
              uint64_t v11 = v46;
            }
            goto LABEL_29;
          }
LABEL_30:
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (!v11)
        {
LABEL_32:

          id v44 = v2;
          goto LABEL_34;
        }
      }
    }
  }
  id v44 = (id)MEMORY[0x263EFFA78];
LABEL_34:

  return v44;
}

- (id)analyticsKeysBlocklist
{
  v0 = (void *)MEMORY[0x263EFFA08];
  v1 = [MEMORY[0x263F5D660] statisticsKey];
  id v2 = [MEMORY[0x263F5D660] enabledKey];
  v3 = [MEMORY[0x263F5D660] inputSaturationKey];
  uint64_t v4 = [MEMORY[0x263F5D660] inputCastKey];
  v5 = [MEMORY[0x263F5D660] inputContrastKey];
  int v6 = [MEMORY[0x263F5D660] offsetCastKey];
  v7 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, 0);

  return v7;
}

@end