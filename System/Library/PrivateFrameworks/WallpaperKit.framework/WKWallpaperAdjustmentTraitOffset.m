@interface WKWallpaperAdjustmentTraitOffset
- (BOOL)isEqual:(id)a3;
- (CGPoint)moreSpaceModeOffsetLandscape;
- (CGPoint)moreSpaceModeOffsetPortrait;
- (CGPoint)offsetForCurrentScreenScaleModeWithInterfaceOrientation:(int64_t)a3;
- (CGPoint)zoomedModeOffsetLandscape;
- (CGPoint)zoomedModeOffsetPortrait;
- (NSString)description;
- (NSString)overrideScreenScaleMode;
- (WKWallpaperAdjustmentTraitOffset)initWithAttributeDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (id)propertyListRepresentation;
- (id)wk_descriptionBuilder;
- (unint64_t)hash;
- (void)setMoreSpaceModeOffsetLandscape:(CGPoint)a3;
- (void)setMoreSpaceModeOffsetPortrait:(CGPoint)a3;
- (void)setOverrideScreenScaleMode:(id)a3;
- (void)setZoomedModeOffsetLandscape:(CGPoint)a3;
- (void)setZoomedModeOffsetPortrait:(CGPoint)a3;
@end

@implementation WKWallpaperAdjustmentTraitOffset

- (WKWallpaperAdjustmentTraitOffset)initWithAttributeDictionary:(id)a3
{
  id v4 = a3;
  v105.receiver = self;
  v105.super_class = (Class)WKWallpaperAdjustmentTraitOffset;
  v5 = [(WKWallpaperAdjustmentTraitOffset *)&v105 init];
  if (v5)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_opt_class();
    v8 = [v4 objectForKeyedSubscript:@"screenScaleModeZoomed"];
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;

    double v11 = v7;
    double v12 = v6;
    double v13 = v7;
    double v14 = v6;
    if (v10)
    {
      objc_opt_class();
      v15 = [v10 objectForKeyedSubscript:@"interfaceOrientationAny"];
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }

      if (v16)
      {
        objc_opt_class();
        v17 = [v10 objectForKeyedSubscript:@"interfaceOrientationAny"];
        v18 = [v17 objectForKeyedSubscript:@"x"];
        if (objc_opt_isKindOfClass()) {
          v19 = v18;
        }
        else {
          v19 = 0;
        }
        id v20 = v19;

        objc_opt_class();
        v21 = [v10 objectForKeyedSubscript:@"interfaceOrientationAny"];
        v22 = [v21 objectForKeyedSubscript:@"y"];
        if (objc_opt_isKindOfClass()) {
          v23 = v22;
        }
        else {
          v23 = 0;
        }
        id v24 = v23;

        [v20 floatValue];
        double v14 = v25;
        [v24 floatValue];
        double v13 = v26;
        [v20 floatValue];
        float v28 = v27;

        double v12 = v28;
        [v24 floatValue];
        float v30 = v29;

        double v11 = v30;
      }
      else
      {
        objc_opt_class();
        v31 = [v10 objectForKeyedSubscript:@"interfaceOrientationLandscape"];
        if (objc_opt_isKindOfClass()) {
          v32 = v31;
        }
        else {
          v32 = 0;
        }
        id v33 = v32;

        double v13 = v7;
        double v14 = v6;
        if (v33)
        {
          objc_opt_class();
          v34 = [v33 objectForKeyedSubscript:@"x"];
          if (objc_opt_isKindOfClass()) {
            v35 = v34;
          }
          else {
            v35 = 0;
          }
          id v36 = v35;

          objc_opt_class();
          v37 = [v33 objectForKeyedSubscript:@"y"];
          if (objc_opt_isKindOfClass()) {
            v38 = v37;
          }
          else {
            v38 = 0;
          }
          id v39 = v38;

          [v36 floatValue];
          float v41 = v40;

          double v14 = v41;
          [v39 floatValue];
          float v43 = v42;

          double v13 = v43;
        }
        objc_opt_class();
        v44 = [v10 objectForKeyedSubscript:@"interfaceOrientationPortrait"];
        if (objc_opt_isKindOfClass()) {
          v45 = v44;
        }
        else {
          v45 = 0;
        }
        id v46 = v45;

        double v11 = v7;
        double v12 = v6;
        if (v46)
        {
          objc_opt_class();
          v47 = [v46 objectForKeyedSubscript:@"x"];
          if (objc_opt_isKindOfClass()) {
            v48 = v47;
          }
          else {
            v48 = 0;
          }
          id v49 = v48;

          objc_opt_class();
          v50 = [v46 objectForKeyedSubscript:@"y"];
          if (objc_opt_isKindOfClass()) {
            v51 = v50;
          }
          else {
            v51 = 0;
          }
          id v52 = v51;

          [v49 floatValue];
          float v54 = v53;

          double v12 = v54;
          [v52 floatValue];
          float v56 = v55;

          double v11 = v56;
        }
      }
    }
    v57 = [v4 objectForKeyedSubscript:@"screenScaleModeMoreSpace"];
    double v104 = v13;
    if (v57)
    {
      objc_opt_class();
      v58 = [v57 objectForKeyedSubscript:@"interfaceOrientationAny"];
      if (objc_opt_isKindOfClass()) {
        v59 = v58;
      }
      else {
        v59 = 0;
      }

      double v60 = v14;
      if (v59)
      {
        objc_opt_class();
        v61 = [v57 objectForKeyedSubscript:@"interfaceOrientationAny"];
        v62 = [v61 objectForKeyedSubscript:@"x"];
        if (objc_opt_isKindOfClass()) {
          v63 = v62;
        }
        else {
          v63 = 0;
        }
        id v64 = v63;

        objc_opt_class();
        v65 = [v57 objectForKeyedSubscript:@"interfaceOrientationAny"];
        v66 = [v65 objectForKeyedSubscript:@"y"];
        if (objc_opt_isKindOfClass()) {
          v67 = v66;
        }
        else {
          v67 = 0;
        }
        id v68 = v67;

        [v64 floatValue];
        double v70 = v69;
        [v68 floatValue];
        double v72 = v71;
        [v64 floatValue];
        float v74 = v73;

        double v6 = v74;
        [v68 floatValue];
        float v76 = v75;

        double v7 = v76;
      }
      else
      {
        objc_opt_class();
        v77 = [v57 objectForKeyedSubscript:@"interfaceOrientationLandscape"];
        if (objc_opt_isKindOfClass()) {
          v78 = v77;
        }
        else {
          v78 = 0;
        }
        id v79 = v78;

        double v72 = v7;
        double v70 = v6;
        if (v79)
        {
          objc_opt_class();
          v80 = [v79 objectForKeyedSubscript:@"x"];
          if (objc_opt_isKindOfClass()) {
            v81 = v80;
          }
          else {
            v81 = 0;
          }
          id v82 = v81;

          objc_opt_class();
          v83 = [v79 objectForKeyedSubscript:@"y"];
          if (objc_opt_isKindOfClass()) {
            v84 = v83;
          }
          else {
            v84 = 0;
          }
          id v85 = v84;

          [v82 floatValue];
          float v87 = v86;

          double v70 = v87;
          [v85 floatValue];
          float v89 = v88;

          double v72 = v89;
        }
        objc_opt_class();
        v90 = [v57 objectForKeyedSubscript:@"interfaceOrientationPortrait"];
        if (objc_opt_isKindOfClass()) {
          v91 = v90;
        }
        else {
          v91 = 0;
        }
        id v92 = v91;

        if (v92)
        {
          objc_opt_class();
          v93 = [v92 objectForKeyedSubscript:@"x"];
          if (objc_opt_isKindOfClass()) {
            v94 = v93;
          }
          else {
            v94 = 0;
          }
          id v95 = v94;

          objc_opt_class();
          v96 = [v92 objectForKeyedSubscript:@"y"];
          if (objc_opt_isKindOfClass()) {
            v97 = v96;
          }
          else {
            v97 = 0;
          }
          id v98 = v97;

          [v95 floatValue];
          float v100 = v99;

          double v6 = v100;
          [v98 floatValue];
          float v102 = v101;

          double v7 = v102;
        }
      }
    }
    else
    {
      double v60 = v14;
      double v72 = v7;
      double v70 = v6;
    }
    v5->_zoomedModeOffsetLandscape.x = v60;
    v5->_zoomedModeOffsetLandscape.y = v104;
    v5->_zoomedModeOffsetPortrait.x = v12;
    v5->_zoomedModeOffsetPortrait.y = v11;
    v5->_moreSpaceModeOffsetLandscape.x = v70;
    v5->_moreSpaceModeOffsetLandscape.y = v72;
    v5->_moreSpaceModeOffsetPortrait.x = v6;
    v5->_moreSpaceModeOffsetPortrait.y = v7;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKWallpaperAdjustmentTraitOffset *)self propertyListRepresentation];
  double v6 = (void *)[v4 initWithAttributeDictionary:v5];

  return v6;
}

- (CGPoint)offsetForCurrentScreenScaleModeWithInterfaceOrientation:(int64_t)a3
{
  v5 = [(WKWallpaperAdjustmentTraitOffset *)self overrideScreenScaleMode];

  if (v5) {
    [(WKWallpaperAdjustmentTraitOffset *)self overrideScreenScaleMode];
  }
  else {
  double v6 = WKCurrentScreenScaleMode();
  }
  if ([v6 isEqualToString:@"screenScaleModeZoomed"])
  {
    if ((unint64_t)(a3 - 1) > 1) {
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetLandscape];
    }
    else {
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
    }
LABEL_13:
    double v9 = v7;
    double v10 = v8;
    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"screenScaleModeMoreSpace"])
  {
    if ((unint64_t)(a3 - 1) > 1) {
      [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetLandscape];
    }
    else {
      [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
    }
    goto LABEL_13;
  }
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_14:

  double v11 = v9;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)propertyListRepresentation
{
  v105[1] = *MEMORY[0x1E4F143B8];
  [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetLandscape];
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  BOOL v7 = *MEMORY[0x1E4F1DAD8] == v6 && v4 == v3;
  if (!v7
    || (([(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait], v5 == v9)
      ? (BOOL v10 = v4 == v8)
      : (BOOL v10 = 0),
        !v10
     || (([(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetLandscape],
          v5 == v12)
       ? (BOOL v13 = v4 == v11)
       : (BOOL v13 = 0),
         !v13
      || (([(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait],
           v5 == v15)
        ? (BOOL v16 = v4 == v14)
        : (BOOL v16 = 0),
          !v16))))
  {
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetLandscape];
    if (v5 == v19 && v4 == v18)
    {
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
      if (v5 == v22 && v4 == v21)
      {
LABEL_44:
        [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetLandscape];
        if (v5 == v55 && v4 == v54)
        {
          [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
          if (v5 == v58 && v4 == v57) {
            goto LABEL_66;
          }
        }
        [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
        double v61 = v60;
        double v63 = v62;
        [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetLandscape];
        if (v61 == v65 && v63 == v64)
        {
          v96 = @"interfaceOrientationAny";
          v94[0] = @"x";
          v66 = NSNumber;
          [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
          v67 = objc_msgSend(v66, "numberWithDouble:");
          v94[1] = @"y";
          v95[0] = v67;
          id v68 = NSNumber;
          [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
          double v70 = [v68 numberWithDouble:v69];
          v95[1] = v70;
          float v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
          v97 = v71;
          double v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        }
        else
        {
          double v72 = [MEMORY[0x1E4F1CA60] dictionary];
          [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetLandscape];
          if (v5 != v74 || v4 != v73)
          {
            v92[0] = @"x";
            float v76 = NSNumber;
            [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetLandscape];
            v77 = objc_msgSend(v76, "numberWithDouble:");
            v92[1] = @"y";
            v93[0] = v77;
            v78 = NSNumber;
            [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetLandscape];
            v80 = [v78 numberWithDouble:v79];
            v93[1] = v80;
            v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];

            objc_msgSend(v72, "na_safeSetObject:forKey:", v81, @"interfaceOrientationLandscape");
          }
          [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
          if (v5 == v83 && v4 == v82) {
            goto LABEL_65;
          }
          v84 = NSNumber;
          [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
          id v85 = objc_msgSend(v84, "numberWithDouble:");
          v90[1] = @"y";
          v91[0] = v85;
          float v86 = NSNumber;
          [(WKWallpaperAdjustmentTraitOffset *)self moreSpaceModeOffsetPortrait];
          float v88 = [v86 numberWithDouble:v87];
          v91[1] = v88;
          v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];

          objc_msgSend(v72, "na_safeSetObject:forKey:", v67, @"interfaceOrientationPortrait");
        }

LABEL_65:
        objc_msgSend(v17, "na_safeSetObject:forKey:", v72, @"screenScaleModeMoreSpace");

        goto LABEL_66;
      }
    }
    [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
    double v25 = v24;
    double v27 = v26;
    [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetLandscape];
    if (v25 == v29 && v27 == v28)
    {
      double v104 = @"interfaceOrientationAny";
      v102[0] = @"x";
      float v30 = NSNumber;
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
      v31 = objc_msgSend(v30, "numberWithDouble:");
      v103[0] = v31;
      v102[1] = @"y";
      v32 = NSNumber;
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
      v34 = [v32 numberWithDouble:v33];
      v103[1] = v34;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v103 forKeys:v102 count:2];
      v105[0] = v35;
      id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:&v104 count:1];
    }
    else
    {
      id v36 = [MEMORY[0x1E4F1CA60] dictionary];
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetLandscape];
      if (v5 != v38 || v4 != v37)
      {
        v100[0] = @"x";
        float v40 = NSNumber;
        [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetLandscape];
        float v41 = objc_msgSend(v40, "numberWithDouble:");
        v100[1] = @"y";
        v101[0] = v41;
        float v42 = NSNumber;
        [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetLandscape];
        v44 = [v42 numberWithDouble:v43];
        v101[1] = v44;
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:2];

        objc_msgSend(v36, "na_safeSetObject:forKey:", v45, @"interfaceOrientationLandscape");
      }
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
      if (v5 == v47 && v4 == v46) {
        goto LABEL_43;
      }
      v98[0] = @"x";
      id v49 = NSNumber;
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
      v50 = objc_msgSend(v49, "numberWithDouble:");
      v98[1] = @"y";
      v99[0] = v50;
      v51 = NSNumber;
      [(WKWallpaperAdjustmentTraitOffset *)self zoomedModeOffsetPortrait];
      float v53 = [v51 numberWithDouble:v52];
      v99[1] = v53;
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];

      objc_msgSend(v36, "na_safeSetObject:forKey:", v31, @"interfaceOrientationPortrait");
    }

LABEL_43:
    objc_msgSend(v17, "na_safeSetObject:forKey:", v36, @"screenScaleModeZoomed");

    goto LABEL_44;
  }
  v17 = 0;
LABEL_66:
  return v17;
}

id __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke()
{
  if (WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_token_0, &__block_literal_global_9_0);
  }
  v0 = (void *)WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_object_0;
  return v0;
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_2()
{
  WKWallpaperAdjustmentTraitOffsetValueYKey_block_invoke_na_once_object_0 = __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_16_0];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_19];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_21];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_23];
  double v5 = [v0 build];

  return v5;
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29238];
  [a2 zoomedModeOffsetPortrait];
  return objc_msgSend(v2, "valueWithCGPoint:");
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29238];
  [a2 zoomedModeOffsetLandscape];
  return objc_msgSend(v2, "valueWithCGPoint:");
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29238];
  [a2 moreSpaceModeOffsetPortrait];
  return objc_msgSend(v2, "valueWithCGPoint:");
}

uint64_t __47__WKWallpaperAdjustmentTraitOffset_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29238];
  [a2 moreSpaceModeOffsetLandscape];
  return objc_msgSend(v2, "valueWithCGPoint:");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)wk_descriptionBuilder
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__WKWallpaperAdjustmentTraitOffset_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __57__WKWallpaperAdjustmentTraitOffset_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (NSString)description
{
  id v2 = [(WKWallpaperAdjustmentTraitOffset *)self wk_descriptionBuilder];
  id v3 = [v2 build];

  return (NSString *)v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__WKWallpaperAdjustmentTraitOffset_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  id v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __59__WKWallpaperAdjustmentTraitOffset_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained zoomedModeOffsetPortrait];
  unint64_t v4 = NSStringFromCGPoint(v10);
  [v3 appendString:v4 withName:@"zoomedModeOffsetPortrait"];

  [WeakRetained zoomedModeOffsetLandscape];
  id v5 = NSStringFromCGPoint(v11);
  [v3 appendString:v5 withName:@"zoomedModeOffsetLandscape"];

  [WeakRetained moreSpaceModeOffsetPortrait];
  double v6 = NSStringFromCGPoint(v12);
  [v3 appendString:v6 withName:@"moreSpaceModeOffsetPortrait"];

  [WeakRetained moreSpaceModeOffsetLandscape];
  BOOL v7 = NSStringFromCGPoint(v13);
  [v3 appendString:v7 withName:@"moreSpaceModeOffsetLandscape"];
}

- (CGPoint)zoomedModeOffsetLandscape
{
  double x = self->_zoomedModeOffsetLandscape.x;
  double y = self->_zoomedModeOffsetLandscape.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomedModeOffsetLandscape:(CGPoint)a3
{
  self->_zoomedModeOffsetLandscape = a3;
}

- (CGPoint)zoomedModeOffsetPortrait
{
  double x = self->_zoomedModeOffsetPortrait.x;
  double y = self->_zoomedModeOffsetPortrait.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomedModeOffsetPortrait:(CGPoint)a3
{
  self->_zoomedModeOffsetPortrait = a3;
}

- (CGPoint)moreSpaceModeOffsetLandscape
{
  double x = self->_moreSpaceModeOffsetLandscape.x;
  double y = self->_moreSpaceModeOffsetLandscape.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMoreSpaceModeOffsetLandscape:(CGPoint)a3
{
  self->_moreSpaceModeOffsetLandscape = a3;
}

- (CGPoint)moreSpaceModeOffsetPortrait
{
  double x = self->_moreSpaceModeOffsetPortrait.x;
  double y = self->_moreSpaceModeOffsetPortrait.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMoreSpaceModeOffsetPortrait:(CGPoint)a3
{
  self->_moreSpaceModeOffsetPortrait = a3;
}

- (NSString)overrideScreenScaleMode
{
  return self->_overrideScreenScaleMode;
}

- (void)setOverrideScreenScaleMode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end