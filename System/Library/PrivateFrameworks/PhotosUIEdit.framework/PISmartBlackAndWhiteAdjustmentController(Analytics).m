@interface PISmartBlackAndWhiteAdjustmentController(Analytics)
- (id)analyticsPayload;
- (uint64_t)analyticsKeysBlocklist;
@end

@implementation PISmartBlackAndWhiteAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v54 = +[PEAnalyticsUtility adjustmentValueBucketizerFormatter];
  uint64_t v3 = [a1 adjustment];
  if (v3)
  {
    v4 = (void *)v3;
    int v5 = [a1 enabled];

    if (v5)
    {
      v6 = [a1 visualInputKeys];
      v7 = [a1 analyticsKeysBlocklist];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id obj = v6;
      uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (!v8) {
        goto LABEL_39;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v58;
      unint64_t v11 = 0x263F5D000uLL;
      while (1)
      {
        uint64_t v12 = 0;
        uint64_t v55 = v9;
        do
        {
          if (*(void *)v58 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v57 + 1) + 8 * v12);
          if (([v7 containsObject:v13] & 1) == 0)
          {
            unint64_t v14 = v11;
            v15 = [*(id *)(v11 + 1624) autoKey];
            if ([v13 isEqualToString:v15])
            {
              int v16 = [a1 isAuto];

              if (v16)
              {
                [v2 setObject:@"1" forKeyedSubscript:@"sbw_auto"];
                unint64_t v11 = v14;
                goto LABEL_37;
              }
            }
            else
            {
            }
            uint64_t v17 = v10;
            v18 = [*(id *)(v14 + 1624) hueKey];
            int v19 = [v13 isEqualToString:v18];

            if (v19)
            {
              v20 = NSNumber;
              [a1 hue];
              v21 = objc_msgSend(v20, "numberWithDouble:");
              v22 = [v54 stringFromNumber:v21];
              [v2 setObject:v22 forKeyedSubscript:@"sbw_mega"];

              unint64_t v11 = v14;
LABEL_36:
              uint64_t v9 = v55;
              goto LABEL_37;
            }
            v23 = [*(id *)(v14 + 1624) grainKey];
            unint64_t v11 = v14;
            if ([v13 isEqualToString:v23])
            {
              [a1 grain];
              double v25 = v24;

              if (v25 != 0.0)
              {
                v26 = NSNumber;
                [a1 grain];
                v27 = objc_msgSend(v26, "numberWithDouble:");
                v28 = [v54 stringFromNumber:v27];
                [v2 setObject:v28 forKeyedSubscript:@"sbw_grain"];

                unint64_t v11 = v14;
                goto LABEL_36;
              }
            }
            else
            {
            }
            v29 = [*(id *)(v14 + 1624) neutralKey];
            if ([v13 isEqualToString:v29])
            {
              [a1 neutral];
              double v31 = v30;

              if (v31 != 0.0)
              {
                v32 = NSNumber;
                [a1 neutral];
                v33 = objc_msgSend(v32, "numberWithDouble:");
                v34 = [v54 stringFromNumber:v33];
                [v2 setObject:v34 forKeyedSubscript:@"sbw_neutral"];

                unint64_t v11 = v14;
                goto LABEL_36;
              }
            }
            else
            {
            }
            v35 = [*(id *)(v14 + 1624) toneKey];
            if ([v13 isEqualToString:v35])
            {
              [a1 tone];
              double v37 = v36;

              if (v37 != 0.0)
              {
                v38 = NSNumber;
                [a1 tone];
                v39 = objc_msgSend(v38, "numberWithDouble:");
                v40 = [v54 stringFromNumber:v39];
                v41 = v2;
                v42 = v40;
                v43 = @"sbw_tone";
                goto LABEL_30;
              }
            }
            else
            {
            }
            v44 = [*(id *)(v14 + 1624) strengthKey];
            if ([v13 isEqualToString:v44])
            {
              [a1 strength];
              double v46 = v45;

              if (v46 != 0.0)
              {
                v47 = NSNumber;
                [a1 strength];
                v39 = objc_msgSend(v47, "numberWithDouble:");
                v40 = [v54 stringFromNumber:v39];
                v41 = v2;
                v42 = v40;
                v43 = @"sbw_intensity";
LABEL_30:
                [v41 setObject:v42 forKeyedSubscript:v43];
LABEL_34:

                unint64_t v11 = v14;
                goto LABEL_35;
              }
            }
            else
            {
            }
            v39 = [a1 valueForKey:v13];
            [v39 doubleValue];
            if (v48 != 0.0)
            {
              v49 = NSNumber;
              [v39 doubleValue];
              v40 = objc_msgSend(v49, "numberWithDouble:");
              [v54 stringFromNumber:v40];
              v51 = v50 = v2;
              [v50 setObject:v51 forKeyedSubscript:v13];

              id v2 = v50;
              uint64_t v10 = v17;
              goto LABEL_34;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_37:
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
        if (!v9)
        {
LABEL_39:

          id v52 = v2;
          goto LABEL_41;
        }
      }
    }
  }
  id v52 = (id)MEMORY[0x263EFFA78];
LABEL_41:

  return v52;
}

- (uint64_t)analyticsKeysBlocklist
{
  return [MEMORY[0x263EFFA08] set];
}

@end