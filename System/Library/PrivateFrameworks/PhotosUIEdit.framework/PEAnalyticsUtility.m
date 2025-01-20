@interface PEAnalyticsUtility
+ (id)adjustmentValueBucketizerFormatter;
+ (id)analyticPayloadForCompositionController:(id)a3;
+ (id)analyticPayloadForCopyEditsSettings:(id)a3;
+ (id)diffFromAdjustmentController:(id)a3 toAdjustmentController:(id)a4;
+ (id)diffKeysFromInitialComposition:(id)a3 toFinalComposition:(id)a4;
+ (id)semanticStyleCapturedCastForItem:(id)a3;
+ (id)semanticStylesIdentifierForItem:(id)a3;
+ (void)reportAnalyticsForChangeFrom:(id)a3 to:(id)a4 actionType:(unint64_t)a5;
@end

@implementation PEAnalyticsUtility

+ (id)analyticPayloadForCopyEditsSettings:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = +[PECopyEditsSetting allSettings];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        v11 = @"PECopyEditsSettingIdentifierCinematic";
        if ((unint64_t)(v10 - 1) <= 8) {
          v11 = off_2642BE4F0[v10 - 1];
        }
        v12 = v11;
        int v13 = PFExists();
        v14 = @"-1";
        if (v13)
        {
          if (objc_msgSend(v9, "enabled", @"-1")) {
            v14 = @"1";
          }
          else {
            v14 = @"0";
          }
        }
        [v4 setObject:v14 forKey:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

BOOL __58__PEAnalyticsUtility_analyticPayloadForCopyEditsSettings___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  uint64_t v5 = [v3 identifier];

  return v4 == v5;
}

+ (void)reportAnalyticsForChangeFrom:(id)a3 to:(id)a4 actionType:(unint64_t)a5
{
  if (a5 > 2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = off_2642BE488[a5];
  }
  id v7 = +[PEAnalyticsUtility diffKeysFromInitialComposition:a3 toFinalComposition:a4];
  if ([v7 count])
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    [v6 setObject:v5 forKeyedSubscript:@"actionType"];
    [v6 addEntriesFromDictionary:v7];
    [MEMORY[0x263F2FA10] sendEvent:@"com.apple.photos.CPAnalytics.edit.editAction" withPayload:v6];
  }
}

+ (id)semanticStyleCapturedCastForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 fetchSmartStyleExtendedProperties];
    uint64_t v5 = [v4 originalSmartStyleCast];
    __int16 v6 = [v5 intValue];

    if (v6)
    {
      id v7 = +[PEAdjustmentUtilities semanticStyleCastForPHAdjustmentStyleCast:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)semanticStylesIdentifierForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 fetchPropertySetsIfNeeded];
    uint64_t v5 = [v4 photosInfoPanelExtendedProperties];
    __int16 v6 = [v5 semanticStylePreset];

    if (v6)
    {
      uint64_t v7 = [v6 integerValue];
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"sem_style_%ld", v7);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)adjustmentValueBucketizerFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v2 setUsesSignificantDigits:0];
  [v2 setRoundingMode:1];
  [v2 setRoundingIncrement:&unk_26C829A38];
  [v2 setMultiplier:&unk_26C829A50];
  [v2 setZeroSymbol:@"zero"];
  return v2;
}

+ (id)diffFromAdjustmentController:(id)a3 toAdjustmentController:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v25 = v7;
    id v27 = v5;
    v8 = [v5 analyticsPayload];
    id v26 = v6;
    v9 = [v6 analyticsPayload];
    uint64_t v10 = [v8 allKeys];
    v11 = (void *)[v10 mutableCopy];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v28 = v9;
    v12 = [v9 allKeys];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          [v11 removeObject:v17];
          long long v18 = [v8 objectForKeyedSubscript:v17];

          long long v19 = v30;
          if (!v18) {
            goto LABEL_10;
          }
          long long v20 = [v8 objectForKeyedSubscript:v17];
          v21 = [v28 objectForKeyedSubscript:v17];
          char v22 = [v20 isEqualToString:v21];

          long long v19 = v29;
          if ((v22 & 1) == 0) {
LABEL_10:
          }
            [v19 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v14);
    }

    id v7 = v25;
    [v25 addObjectsFromArray:v11];
    v35[0] = kDiffAddedKey;
    v35[1] = kDiffModifiedKey;
    v36[0] = v30;
    v36[1] = v29;
    v35[2] = kDiffRemovedKey;
    v36[2] = v25;
    v23 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];

    id v6 = v26;
    id v5 = v27;
  }
  else
  {
    v23 = (void *)MEMORY[0x263EFFA78];
  }

  return v23;
}

+ (id)analyticPayloadForCompositionController:(id)a3
{
  v94[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 adjustmentValueBucketizerFormatter];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v7 = [v4 smartToneAdjustmentController];
  v8 = [v4 smartColorAdjustmentController];
  v92 = v8;
  if ([v7 isAuto] && objc_msgSend(v8, "isAuto"))
  {
    [v6 setObject:@"1" forKeyedSubscript:@"auto-enhance"];
    [v7 inputLight];
    double v10 = v9;
    [v7 inputLightDefault];
    if (vabdd_f64(v10, v11) <= 0.001)
    {
      [v6 addEntriesFromDictionary:&unk_26C8299E8];
      goto LABEL_7;
    }
    v93 = @"auto-enhance_intensity";
    v12 = NSNumber;
    [v7 inputLight];
    uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
    uint64_t v14 = [v5 stringFromNumber:v13];
    v94[0] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v94 forKeys:&v93 count:1];
    [v6 addEntriesFromDictionary:v15];
  }
  else
  {
    uint64_t v13 = [v7 analyticsPayload];
    uint64_t v14 = [v8 analyticsPayload];
    [v6 addEntriesFromDictionary:v13];
    [v6 addEntriesFromDictionary:v14];
  }

LABEL_7:
  v16 = [v4 smartBWAdjustmentController];
  uint64_t v17 = [v16 analyticsPayload];

  long long v18 = [v4 whiteBalanceAdjustmentController];
  uint64_t v19 = [v18 analyticsPayload];

  long long v20 = [v4 cropAdjustmentController];
  uint64_t v21 = [v20 analyticsPayload];

  v91 = (void *)v17;
  [v6 addEntriesFromDictionary:v17];
  v90 = (void *)v19;
  [v6 addEntriesFromDictionary:v19];
  v89 = (void *)v21;
  [v6 addEntriesFromDictionary:v21];
  char v22 = [v4 inpaintAdjustmentController];
  uint64_t v23 = [v22 analyticsPayload];

  v88 = (void *)v23;
  [v6 addEntriesFromDictionary:v23];
  v24 = [v4 semanticStyleAdjustmentController];
  v25 = [v24 analyticsPayload];

  [v6 addEntriesFromDictionary:v25];
  id v26 = [v4 sharpenAdjustmentController];
  LODWORD(v23) = [v26 enabled];

  if (v23)
  {
    id v27 = [v4 sharpenAdjustmentController];
    v28 = [MEMORY[0x263F5D650] intensityKey];
    id v29 = [v27 valueForUndefinedKey:v28];
    [v29 doubleValue];
    double v31 = v30;

    if (v31 != 0.0)
    {
      long long v32 = [NSNumber numberWithDouble:v31];
      long long v33 = [v5 stringFromNumber:v32];
      [v6 setObject:v33 forKeyedSubscript:@"sharpness"];
    }
  }
  long long v34 = [v4 definitionAdjustmentController];
  int v35 = [v34 enabled];

  if (v35)
  {
    v36 = [v4 definitionAdjustmentController];
    v37 = [MEMORY[0x263F5D5B0] intensityKey];
    uint64_t v38 = [v36 valueForUndefinedKey:v37];
    [v38 doubleValue];
    double v40 = v39;

    if (v40 != 0.0)
    {
      v41 = [NSNumber numberWithDouble:v40];
      v42 = [v5 stringFromNumber:v41];
      [v6 setObject:v42 forKeyedSubscript:@"definition"];
    }
  }
  v43 = [v4 noiseReductionAdjustmentController];
  int v44 = [v43 enabled];

  if (v44)
  {
    v45 = [v4 noiseReductionAdjustmentController];
    v46 = [MEMORY[0x263F5D5F0] amountKey];
    v47 = [v45 valueForUndefinedKey:v46];
    [v47 doubleValue];
    double v49 = v48;

    if (v49 != 0.0)
    {
      v50 = [NSNumber numberWithDouble:v49];
      v51 = [v5 stringFromNumber:v50];
      [v6 setObject:v51 forKeyedSubscript:@"noise_reduction"];
    }
  }
  v52 = [v4 vignetteAdjustmentController];
  int v53 = [v52 enabled];

  if (v53)
  {
    v54 = [v4 vignetteAdjustmentController];
    [v54 intensity];
    double v56 = v55;

    if (v56 != 0.0)
    {
      v57 = [NSNumber numberWithDouble:v56];
      v58 = [v5 stringFromNumber:v57];
      [v6 setObject:v58 forKeyedSubscript:@"vignette"];
    }
  }
  v59 = v5;
  v60 = [v4 slomoAdjustmentController];

  if (v60)
  {
    v61 = [v4 slomoAdjustmentController];
    [v61 rate];
    double v63 = v62;

    v64 = [NSNumber numberWithDouble:v63];
    [v6 setObject:v64 forKeyedSubscript:@"slomo"];
  }
  v65 = [v4 cinematicAudioAdjustmentController];
  v66 = [v65 analyticsPayload];

  [v6 addEntriesFromDictionary:v66];
  v67 = [v4 semanticStyleAdjustmentController];
  v68 = [v67 analyticsPayload];

  [v6 addEntriesFromDictionary:v68];
  v69 = [v4 effect3DAdjustmentController];
  int v70 = [v69 enabled];

  if (v70)
  {
    v71 = [v4 effect3DAdjustmentController];
    v72 = [v71 kind];

    if (v72 && ([v72 isEqualToString:&stru_26C820838] & 1) == 0) {
      [v6 setObject:v72 forKeyedSubscript:@"filter"];
    }
    v73 = [v4 effect3DAdjustmentController];
  }
  else
  {
    v74 = [v4 effectAdjustmentController];
    int v75 = [v74 enabled];

    if (!v75) {
      goto LABEL_34;
    }
    v76 = [v4 effectAdjustmentController];
    v72 = [v76 kind];

    if (v72 && ([v72 isEqualToString:&stru_26C820838] & 1) == 0) {
      [v6 setObject:v72 forKeyedSubscript:@"filter"];
    }
    v73 = [v4 effectAdjustmentController];
  }
  v77 = v73;
  [v73 intensity];
  double v79 = v78;

  if (v79 != 0.0)
  {
    v80 = [NSNumber numberWithDouble:v79];
    v81 = [v59 stringFromNumber:v80];
    [v6 setObject:v81 forKeyedSubscript:@"filter_intensity"];
  }
LABEL_34:
  v82 = [v4 portraitAdjustmentController];
  int v83 = [v82 enabled];

  if (v83)
  {
    v84 = [v4 portraitAdjustmentController];
    v85 = [v84 kind];

    if (v85 && ([v85 isEqualToString:&stru_26C820838] & 1) == 0) {
      [v6 setObject:v85 forKeyedSubscript:@"portrait_effect"];
    }
  }
  [v4 userOrientation];
  v86 = NUOrientationName();
  [v6 setObject:v86 forKeyedSubscript:@"user_orientation"];

  return v6;
}

+ (id)diffKeysFromInitialComposition:(id)a3 toFinalComposition:(id)a4
{
  v128[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x263F5D560]);
  v8 = (void *)[v6 copy];
  v101 = (void *)[v7 initWithComposition:v8];

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v108 = objc_alloc_init(MEMORY[0x263EFF980]);
  v12 = (void *)[objc_alloc(MEMORY[0x263F5D560]) initWithComposition:v5];
  uint64_t v13 = [v12 semanticStyleAdjustmentController];

  v100 = v12;
  if (v13)
  {
    uint64_t v14 = (void *)MEMORY[0x263F5D8D0];
    uint64_t v15 = *MEMORY[0x263F5D7C0];
    v128[0] = *MEMORY[0x263F5D7C0];
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:1];
    LODWORD(v14) = [v14 isIdentityCompositionController:v12 forKeys:v16];

    if (v14)
    {
      [v12 removeAdjustmentWithKey:v15];
      uint64_t v17 = [v12 composition];

      id v5 = (id)v17;
    }
  }
  v109 = [v101 composition];
  BOOL v102 = +[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:v101];
  [v101 differingAdjustmentsWithComposition:v5];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v113 = [obj countByEnumeratingWithState:&v121 objects:v127 count:16];
  if (v113)
  {
    v106 = v10;
    v107 = v11;
    id v97 = v9;
    id v98 = v6;
    char v99 = 0;
    char v110 = 0;
    uint64_t v111 = *(void *)v122;
    uint64_t v18 = *MEMORY[0x263F5D860];
    uint64_t v116 = *MEMORY[0x263F5D868];
    uint64_t v19 = *MEMORY[0x263F5D890];
    uint64_t v115 = *MEMORY[0x263F5D6E0];
    uint64_t v114 = *MEMORY[0x263F5D6F8];
    uint64_t v112 = *MEMORY[0x263F5D740];
    uint64_t v103 = *MEMORY[0x263F5D858];
    long long v20 = v101;
    uint64_t v21 = v108;
    unint64_t v22 = 0x263EFF000uLL;
    while (1)
    {
      for (uint64_t i = 0; i != v113; ++i)
      {
        if (*(void *)v122 != v111) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v121 + 1) + 8 * i);
        v126[0] = v18;
        v126[1] = v116;
        v126[2] = v19;
        v126[3] = v115;
        v126[4] = v114;
        v126[5] = v112;
        v25 = objc_msgSend(*(id *)(v22 + 2240), "arrayWithObjects:count:", v126, 6, v97, v98);
        int v26 = [v25 containsObject:v24];

        if (v26)
        {
          id v27 = [v20 adjustmentControllerForKey:v24];
          if (!v27)
          {
            [v20 addAdjustmentWithKey:v24];
            id v27 = [v20 adjustmentControllerForKey:v24];
          }
          if ([v24 isEqualToString:v18])
          {
            v28 = (objc_class *)MEMORY[0x263F5D660];
            goto LABEL_25;
          }
          if ([v24 isEqualToString:v116])
          {
            v28 = (objc_class *)MEMORY[0x263F5D678];
LABEL_25:
            id v41 = [v28 alloc];
            v42 = [v5 objectForKeyedSubscript:v24];
            v43 = (void *)[v41 initWithAdjustment:v42];
          }
          else
          {
            v43 = 0;
          }
          if ([v24 isEqualToString:v103])
          {
            int v44 = (objc_class *)MEMORY[0x263F5D658];
            goto LABEL_55;
          }
          if ([v24 isEqualToString:v19])
          {
            int v44 = (objc_class *)MEMORY[0x263F5D688];
            goto LABEL_55;
          }
          if ([v24 isEqualToString:v115])
          {
            int v44 = (objc_class *)MEMORY[0x263F5D5A0];
            goto LABEL_55;
          }
          if ([v24 isEqualToString:v114])
          {
            int v44 = (objc_class *)MEMORY[0x263F5D5B8];
            goto LABEL_55;
          }
          if ([v24 isEqualToString:v112])
          {
            int v44 = (objc_class *)MEMORY[0x263F5D5D8];
LABEL_55:
            id v67 = [v44 alloc];
            v68 = [v5 objectForKeyedSubscript:v24];
            uint64_t v69 = [v67 initWithAdjustment:v68];

            v43 = (void *)v69;
          }
          int v70 = [a1 diffFromAdjustmentController:v43 toAdjustmentController:v27];
          v71 = [v70 objectForKeyedSubscript:kDiffAddedKey];
          [v107 addObjectsFromArray:v71];

          v72 = [v70 objectForKeyedSubscript:kDiffModifiedKey];
          [v106 addObjectsFromArray:v72];

          v73 = [v70 objectForKeyedSubscript:kDiffRemovedKey];
          [v21 addObjectsFromArray:v73];

          if ((v110 & 1) == 0)
          {
            if (v102)
            {
              char v99 = 1;
              v74 = v107;
              goto LABEL_60;
            }
            BOOL v75 = +[PEAutoAdjustmentController isAutoEnhanceEnabledForCompositionController:v100];
            v74 = v21;
            if (v75) {
LABEL_60:
            }
              [v74 addObject:@"auto-enhance"];
          }

          char v110 = 1;
LABEL_69:
          unint64_t v22 = 0x263EFF000;
          continue;
        }
        uint64_t v29 = [v5 objectForKeyedSubscript:v24];
        if (v29)
        {
          double v30 = (void *)v29;
          double v31 = [v109 objectForKeyedSubscript:v24];

          if (v31)
          {
            long long v32 = [v5 objectForKeyedSubscript:v24];
            long long v33 = [v32 valueForKey:@"enabled"];
            if ([v33 BOOLValue])
            {
              long long v34 = [v109 objectForKeyedSubscript:v24];
              int v35 = [v34 valueForKey:@"enabled"];
              int v36 = [v35 BOOLValue];

              long long v20 = v101;
              if (v36) {
                goto LABEL_66;
              }
            }
            else
            {
            }
            v45 = [v5 objectForKeyedSubscript:v24];
            v46 = [v45 valueForKey:@"enabled"];
            if ([v46 BOOLValue])
            {
              v47 = [v109 objectForKeyedSubscript:v24];
              double v48 = [v47 valueForKey:@"enabled"];
              char v49 = [v48 BOOLValue];

              if ((v49 & 1) == 0)
              {
                uint64_t v21 = v108;
                [v108 addObject:v24];
                long long v20 = v101;
                goto LABEL_69;
              }
            }
            else
            {
            }
            v51 = [v5 objectForKeyedSubscript:v24];
            v52 = [v51 valueForKey:@"enabled"];
            if ([v52 BOOLValue])
            {

              goto LABEL_48;
            }
            int v53 = [v109 objectForKeyedSubscript:v24];
            v54 = [v53 valueForKey:@"enabled"];
            int v55 = [v54 BOOLValue];

            if (v55)
            {
              [v107 addObject:v24];
              long long v20 = v101;
              goto LABEL_68;
            }
LABEL_48:
            double v56 = [v5 objectForKeyedSubscript:v24];
            uint64_t v57 = [v56 valueForKey:@"value"];
            if (v57)
            {
              v58 = (void *)v57;
              v59 = [v109 objectForKeyedSubscript:v24];
              v60 = [v59 valueForKey:@"value"];

              if (v60)
              {
                v61 = [v5 objectForKeyedSubscript:v24];
                double v62 = [v61 valueForKey:@"value"];
                double v63 = [v62 stringValue];

                v64 = [v109 objectForKeyedSubscript:v24];
                v65 = [v64 valueForKey:@"value"];
                v66 = [v65 stringValue];

                long long v20 = v101;
                if (([v63 isEqualToString:v66] & 1) == 0) {
                  [v106 addObject:v24];
                }

                goto LABEL_67;
              }
            }
            else
            {
            }
            double v63 = [v5 objectForKeyedSubscript:v24];
            uint64_t v76 = [v63 valueForKey:@"rate"];
            long long v20 = v101;
            if (v76)
            {
              v77 = (void *)v76;
              double v78 = [v109 objectForKeyedSubscript:v24];
              double v79 = [v78 valueForKey:@"rate"];

              if (v79)
              {
                v80 = [v5 objectForKeyedSubscript:v24];
                v81 = [v80 valueForKey:@"rate"];
                [v81 floatValue];
                float v83 = v82;

                v84 = [v109 objectForKeyedSubscript:v24];
                v85 = [v84 valueForKey:@"rate"];
                [v85 floatValue];
                float v87 = v86;

                if (v83 != v87) {
LABEL_66:
                }
                  [v106 addObject:v24];
              }
LABEL_68:
              uint64_t v21 = v108;
              goto LABEL_69;
            }
LABEL_67:

            goto LABEL_68;
          }
        }
        uint64_t v37 = [v5 objectForKeyedSubscript:v24];
        if (v37
          && (uint64_t v38 = (void *)v37,
              [v109 objectForKeyedSubscript:v24],
              double v39 = objc_claimAutoreleasedReturnValue(),
              v39,
              v38,
              !v39))
        {
          uint64_t v21 = v108;
          [v108 addObject:v24];
        }
        else
        {
          double v40 = [v5 objectForKeyedSubscript:v24];
          if (v40)
          {
          }
          else
          {
            v50 = [v109 objectForKeyedSubscript:v24];

            if (v50) {
              [v107 addObject:v24];
            }
          }
          uint64_t v21 = v108;
        }
      }
      uint64_t v113 = [obj countByEnumeratingWithState:&v121 objects:v127 count:16];
      if (!v113)
      {
        id v9 = v97;
        id v6 = v98;
        id v10 = v106;
        id v11 = v107;
        if (v99)
        {
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          uint64_t v88 = [&unk_26C8299B8 countByEnumeratingWithState:&v117 objects:v125 count:16];
          if (v88)
          {
            uint64_t v89 = v88;
            uint64_t v90 = *(void *)v118;
            do
            {
              for (uint64_t j = 0; j != v89; ++j)
              {
                if (*(void *)v118 != v90) {
                  objc_enumerationMutation(&unk_26C8299B8);
                }
                uint64_t v92 = *(void *)(*((void *)&v117 + 1) + 8 * j);
                [v107 removeObject:v92];
                [v106 removeObject:v92];
                [v108 removeObject:v92];
              }
              uint64_t v89 = [&unk_26C8299B8 countByEnumeratingWithState:&v117 objects:v125 count:16];
            }
            while (v89);
          }
        }
        break;
      }
    }
  }
  if ([v108 count])
  {
    v93 = [v108 componentsJoinedByString:@","];
    [v9 setObject:v93 forKeyedSubscript:@"adjustments_removed"];
  }
  if ([v11 count])
  {
    v94 = [v11 componentsJoinedByString:@","];
    [v9 setObject:v94 forKeyedSubscript:@"adjustments_added"];
  }
  if ([v10 count])
  {
    v95 = [v10 componentsJoinedByString:@","];
    [v9 setObject:v95 forKeyedSubscript:@"adjustments_modified"];
  }
  return v9;
}

@end