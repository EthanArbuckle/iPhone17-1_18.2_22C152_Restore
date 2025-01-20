@interface PICropAdjustmentController(Analytics)
- (id)analyticsKeysBlocklist;
- (id)analyticsPayload;
@end

@implementation PICropAdjustmentController(Analytics)

- (id)analyticsPayload
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v68 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v2 setMinimumFractionDigits:1];
  [v2 setMaximumFractionDigits:2];
  uint64_t v3 = [a1 adjustment];
  if (v3)
  {
    v4 = (void *)v3;
    int v5 = [a1 enabled];

    if (v5)
    {
      v6 = [a1 visualInputKeys];
      v7 = [a1 analyticsKeysBlocklist];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v73 count:16];
      if (!v9) {
        goto LABEL_44;
      }
      uint64_t v10 = v9;
      char v64 = 0;
      char v67 = 0;
      unint64_t v11 = 0x263F5D000uLL;
      uint64_t v12 = *(void *)v70;
      id v66 = v8;
      while (1)
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v70 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v69 + 1) + 8 * v13);
          if (([v7 containsObject:v14] & 1) == 0)
          {
            v15 = [*(id *)(v11 + 1440) angleKey];
            if ([v14 isEqualToString:v15])
            {
              [a1 angle];
              double v17 = v16;

              if (v17 != 0.0)
              {
                v18 = NSNumber;
                [a1 angle];
                v19 = objc_msgSend(v18, "numberWithDouble:");
                v20 = [v2 stringFromNumber:v19];
                v21 = v68;
                v22 = v20;
                v23 = @"straighten";
LABEL_20:
                [v21 setObject:v22 forKeyedSubscript:v23];
                goto LABEL_21;
              }
            }
            else
            {
            }
            v24 = [*(id *)(v11 + 1440) yawKey];
            if ([v14 isEqualToString:v24])
            {
              [a1 yaw];
              double v26 = v25;

              if (v26 != 0.0)
              {
                v27 = NSNumber;
                [a1 yaw];
                v19 = objc_msgSend(v27, "numberWithDouble:");
                v20 = [v2 stringFromNumber:v19];
                v21 = v68;
                v22 = v20;
                v23 = @"horizontal";
                goto LABEL_20;
              }
            }
            else
            {
            }
            v28 = [*(id *)(v11 + 1440) pitchKey];
            if ([v14 isEqualToString:v28])
            {
              [a1 pitch];
              double v30 = v29;

              if (v30 != 0.0)
              {
                v31 = NSNumber;
                [a1 pitch];
                v19 = objc_msgSend(v31, "numberWithDouble:");
                v20 = [v2 stringFromNumber:v19];
                v21 = v68;
                v22 = v20;
                v23 = @"vertical";
                goto LABEL_20;
              }
            }
            else
            {
            }
            v32 = v2;
            v33 = [*(id *)(v11 + 1440) widthKey];
            if ([v14 isEqualToString:v33])
            {
            }
            else
            {
              v34 = [*(id *)(v11 + 1440) heightKey];
              int v35 = [v14 isEqualToString:v34];

              unint64_t v11 = 0x263F5D000uLL;
              if (!v35)
              {
                v45 = [MEMORY[0x263F5D5A0] xOriginKey];
                if ([v14 isEqualToString:v45])
                {

                  id v2 = v32;
                  goto LABEL_36;
                }
                v46 = [MEMORY[0x263F5D5A0] yOriginKey];
                int v47 = [v14 isEqualToString:v46];

                id v2 = v32;
                if (v47)
                {
LABEL_36:
                  if (v64)
                  {
                    char v64 = 1;
                    id v8 = v66;
                    goto LABEL_23;
                  }
                  v48 = NSNumber;
                  v49 = [MEMORY[0x263F5D5A0] xOriginKey];
                  v50 = [a1 valueForKey:v49];
                  [v50 doubleValue];
                  v51 = objc_msgSend(v48, "numberWithDouble:");
                  v19 = [v32 stringFromNumber:v51];

                  v52 = NSNumber;
                  v65 = [MEMORY[0x263F5D5A0] yOriginKey];
                  v53 = [a1 valueForKey:v65];
                  [v53 doubleValue];
                  v54 = objc_msgSend(v52, "numberWithDouble:");
                  v20 = [v32 stringFromNumber:v54];

                  id v2 = v32;
                  v55 = [NSString stringWithFormat:@"%@;%@", v19, v20];
                  [v68 setObject:v55 forKeyedSubscript:@"crop_rect_origin"];

                  char v64 = 1;
LABEL_41:
                  id v8 = v66;
LABEL_21:
                }
                else
                {
                  v19 = [a1 valueForKey:v14];
                  [v19 doubleValue];
                  if (v56 != 0.0)
                  {
                    v57 = NSNumber;
                    [v19 doubleValue];
                    v20 = objc_msgSend(v57, "numberWithDouble:");
                    v58 = [v2 stringFromNumber:v20];
                    [v68 setObject:v58 forKeyedSubscript:v14];

                    goto LABEL_41;
                  }
                  id v8 = v66;
                }

LABEL_23:
                unint64_t v11 = 0x263F5D000;
                goto LABEL_24;
              }
            }
            if ((v67 & 1) == 0)
            {
              v36 = [*(id *)(v11 + 1440) widthKey];
              v37 = [a1 valueForKey:v36];
              [v37 floatValue];
              float v39 = v38;

              v40 = [*(id *)(v11 + 1440) heightKey];
              v41 = [a1 valueForKey:v40];
              [v41 floatValue];
              float v43 = v42;

              *(float *)&double v44 = v39 / v43;
              v19 = [NSNumber numberWithFloat:v44];
              id v2 = v32;
              v20 = [v32 stringFromNumber:v19];
              [v68 setObject:v20 forKeyedSubscript:@"crop_ratio"];
              char v67 = 1;
              goto LABEL_41;
            }
            char v67 = 1;
            id v2 = v32;
            id v8 = v66;
          }
LABEL_24:
          ++v13;
        }
        while (v10 != v13);
        uint64_t v59 = [v8 countByEnumeratingWithState:&v69 objects:v73 count:16];
        uint64_t v10 = v59;
        if (!v59)
        {
LABEL_44:

          v60 = v8;
          v61 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(a1, "isAuto"));
          [v68 setObject:v61 forKeyedSubscript:@"crop_auto"];

          id v62 = v68;
          goto LABEL_46;
        }
      }
    }
  }
  id v62 = (id)MEMORY[0x263EFFA78];
LABEL_46:

  return v62;
}

- (id)analyticsKeysBlocklist
{
  v0 = (void *)MEMORY[0x263EFFA08];
  v1 = [MEMORY[0x263F5D5A0] constraintWidthKey];
  id v2 = [MEMORY[0x263F5D5A0] constraintHeightKey];
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, 0);

  return v3;
}

@end