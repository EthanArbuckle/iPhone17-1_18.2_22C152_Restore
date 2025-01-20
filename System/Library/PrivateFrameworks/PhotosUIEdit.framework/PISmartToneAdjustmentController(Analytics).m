@interface PISmartToneAdjustmentController(Analytics)
- (id)analyticsKeysBlocklist;
- (id)analyticsPayload;
@end

@implementation PISmartToneAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v61 = +[PEAnalyticsUtility adjustmentValueBucketizerFormatter];
  uint64_t v3 = [a1 adjustment];
  if (v3)
  {
    v4 = (void *)v3;
    int v5 = [a1 enabled];

    if (v5)
    {
      v6 = [a1 visualInputKeys];
      v7 = [a1 analyticsKeysBlocklist];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id obj = v6;
      uint64_t v8 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (!v8) {
        goto LABEL_52;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v64;
      while (1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v64 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v63 + 1) + 8 * v11);
          if (([v7 containsObject:v12] & 1) == 0)
          {
            v13 = [MEMORY[0x263F5D678] autoKey];
            if ([v12 isEqualToString:v13])
            {
              int v14 = [a1 isAuto];

              if (v14)
              {
                [v2 setObject:@"1" forKeyedSubscript:@"st_auto"];
                goto LABEL_45;
              }
            }
            else
            {
            }
            v15 = [MEMORY[0x263F5D678] offsetExposureKey];
            if ([v12 isEqualToString:v15])
            {
              [a1 offsetExposure];
              double v17 = v16;

              if (v17 != 0.0)
              {
                v18 = NSNumber;
                [a1 inputExposure];
                v19 = objc_msgSend(v18, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"exposure";
LABEL_44:
                [v21 setObject:v22 forKeyedSubscript:v23];

                goto LABEL_45;
              }
            }
            else
            {
            }
            v24 = [MEMORY[0x263F5D678] offsetLocalLightKey];
            if ([v12 isEqualToString:v24])
            {
              [a1 offsetLocalLight];
              double v26 = v25;

              if (v26 != 0.0)
              {
                v27 = NSNumber;
                [a1 inputLocalLight];
                v19 = objc_msgSend(v27, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"brilliance";
                goto LABEL_44;
              }
            }
            else
            {
            }
            v28 = [MEMORY[0x263F5D678] offsetHighlightsKey];
            if ([v12 isEqualToString:v28])
            {
              [a1 offsetHighlights];
              double v30 = v29;

              if (v30 != 0.0)
              {
                v31 = NSNumber;
                [a1 inputHighlights];
                v19 = objc_msgSend(v31, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"highlights";
                goto LABEL_44;
              }
            }
            else
            {
            }
            v32 = [MEMORY[0x263F5D678] offsetShadowsKey];
            if ([v12 isEqualToString:v32])
            {
              [a1 offsetShadows];
              double v34 = v33;

              if (v34 != 0.0)
              {
                v35 = NSNumber;
                [a1 inputShadows];
                v19 = objc_msgSend(v35, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"shadows";
                goto LABEL_44;
              }
            }
            else
            {
            }
            v36 = [MEMORY[0x263F5D678] offsetContrastKey];
            if ([v12 isEqualToString:v36])
            {
              [a1 offsetContrast];
              double v38 = v37;

              if (v38 != 0.0)
              {
                v39 = NSNumber;
                [a1 inputContrast];
                v19 = objc_msgSend(v39, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"contrast";
                goto LABEL_44;
              }
            }
            else
            {
            }
            v40 = [MEMORY[0x263F5D678] offsetBrightnessKey];
            if ([v12 isEqualToString:v40])
            {
              [a1 offsetBrightness];
              double v42 = v41;

              if (v42 != 0.0)
              {
                v43 = NSNumber;
                [a1 inputBrightness];
                v19 = objc_msgSend(v43, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"brightness";
                goto LABEL_44;
              }
            }
            else
            {
            }
            v44 = [MEMORY[0x263F5D678] offsetBlackKey];
            if ([v12 isEqualToString:v44])
            {
              [a1 offsetBlack];
              double v46 = v45;

              if (v46 != 0.0)
              {
                v47 = NSNumber;
                [a1 inputBlack];
                v19 = objc_msgSend(v47, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"black_point";
                goto LABEL_44;
              }
            }
            else
            {
            }
            v48 = [MEMORY[0x263F5D678] inputLightKey];
            if ([v12 isEqualToString:v48])
            {
              [a1 inputLight];
              double v50 = v49;

              if (v50 != 0.0)
              {
                v51 = NSNumber;
                [a1 inputLight];
                v19 = objc_msgSend(v51, "numberWithDouble:");
                v20 = [v61 stringFromNumber:v19];
                v21 = v2;
                v22 = v20;
                v23 = @"st_mega";
                goto LABEL_44;
              }
            }
            else
            {
            }
            v52 = [a1 valueForKey:v12];
            [v52 doubleValue];
            if (v53 != 0.0)
            {
              v54 = NSNumber;
              [v52 doubleValue];
              v60 = objc_msgSend(v54, "numberWithDouble:");
              [v61 stringFromNumber:v60];
              v56 = v55 = v2;
              [v55 setObject:v56 forKeyedSubscript:v12];

              id v2 = v55;
            }
          }
LABEL_45:
          ++v11;
        }
        while (v9 != v11);
        uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
        uint64_t v9 = v57;
        if (!v57)
        {
LABEL_52:

          id v58 = v2;
          goto LABEL_54;
        }
      }
    }
  }
  id v58 = (id)MEMORY[0x263EFFA78];
LABEL_54:

  return v58;
}

- (id)analyticsKeysBlocklist
{
  id v11 = (id)MEMORY[0x263EFFA08];
  uint64_t v10 = [MEMORY[0x263F5D678] inputRawHighlightsKey];
  v0 = [MEMORY[0x263F5D678] inputExposureKey];
  v1 = [MEMORY[0x263F5D678] inputHighlightsKey];
  id v2 = [MEMORY[0x263F5D678] inputContrastKey];
  uint64_t v3 = [MEMORY[0x263F5D678] inputBlackKey];
  v4 = [MEMORY[0x263F5D678] enabledKey];
  int v5 = [MEMORY[0x263F5D678] inputBrightnessKey];
  v6 = [MEMORY[0x263F5D678] inputShadowsKey];
  v7 = [MEMORY[0x263F5D678] inputLocalLightKey];
  uint64_t v8 = [MEMORY[0x263F5D678] statisticsKey];
  objc_msgSend(v11, "setWithObjects:", v10, v0, v1, v2, v3, v4, v5, v6, v7, v8, 0);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end