@interface NTKNumeralEditOption
+ (BOOL)isPartiallySupported:(unint64_t)a3;
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)defaultOptionForDevice:(id)a3;
+ (id)partiallySupportedEditOptionsForDevice:(id)a3;
+ (id)partiallySupportedOptions;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)styleForSwatchTimeLabelWithFont:(id)a3 device:(id)a4 baseline:(double)a5 faceBounds:(CGRect)a6;
- (id)swatchImageWithFont:(id)a3 device:(id)a4 baseline:(double)a5;
- (int64_t)swatchStyle;
@end

@implementation NTKNumeralEditOption

+ (id)defaultOptionForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CLKLocaleCurrentNumberSystem();
  v5 = +[NTKNumeralEditOption optionWithNumeral:NTKNumeralOptionFromCLKLocaleNumberSystem(v4) forDevice:v3];

  return v5;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion = [v3 version];

    __48__NTKNumeralEditOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock);
  id v11 = (id)_orderedValuesForDevice____orderedOptions;

  return v11;
}

void __48__NTKNumeralEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = _EnumValueRange(0, 2uLL);
  v5 = _EnumValueRange(3uLL, 0xEuLL);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v11 = +[NTKNumeralEditOption _localizedNameForValue:forDevice:](NTKNumeralEditOption, "_localizedNameForValue:forDevice:", [v10 unsignedIntegerValue], v2);
        [v3 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v7);
  }
  v12 = [v3 allKeys];
  v13 = [v12 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        [v14 addObject:*(void *)(*((void *)&v32 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = v13;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * k), (void)v28);
        if (v25) {
          [v14 addObject:v25];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v22);
  }

  uint64_t v26 = [v14 copy];
  v27 = (void *)_orderedValuesForDevice____orderedOptions;
  _orderedValuesForDevice____orderedOptions = v26;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_0 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_0, &__block_literal_global_5_0);
  }
  id v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_0;

  return v2;
}

void __52__NTKNumeralEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[15] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E1578;
  v2[1] = &unk_1F16E1590;
  v3[0] = @"style 1";
  v3[1] = @"style 2";
  v2[2] = &unk_1F16E15A8;
  v2[3] = &unk_1F16E15C0;
  v3[2] = @"style 3";
  v3[3] = @"style 4";
  v2[4] = &unk_1F16E15D8;
  v2[5] = &unk_1F16E15F0;
  v3[4] = @"style 5";
  v3[5] = @"style 6";
  v2[6] = &unk_1F16E1608;
  v2[7] = &unk_1F16E1620;
  v3[6] = @"style 7";
  v3[7] = @"style 8";
  v2[8] = &unk_1F16E1638;
  v2[9] = &unk_1F16E1650;
  v3[8] = @"style 9";
  v3[9] = @"style 10";
  v2[10] = &unk_1F16E1668;
  v2[11] = &unk_1F16E1680;
  v3[10] = @"style 11";
  v3[11] = @"style 12";
  v2[12] = &unk_1F16E1698;
  v2[13] = &unk_1F16E16B0;
  v3[12] = @"style 13";
  v3[13] = @"style 14";
  v2[14] = &unk_1F16E16C8;
  v3[14] = @"style 15";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:15];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_0;
  _valueToFaceBundleStringDict_valueToFaceBundleString_0 = v0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v4 = CLKLocaleNumberSystemFromNumeralOption(a3);

  return (id)MEMORY[0x1F40D5F08](v4);
}

- (id)localizedName
{
  unint64_t v3 = [(NTKNumeralEditOption *)self numeralOption];
  uint64_t v4 = [(NTKEditOption *)self device];
  v5 = +[NTKNumeralEditOption _localizedNameForValue:v3 forDevice:v4];

  return v5;
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"10262875-CE7F-4736-BEE0-2233E4EAA468"];
    int v7 = [v5 supportsCapability:v6];
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_DEVANAGARI";
  switch(a3)
  {
    case 0uLL:
      id v9 = @"EDIT_OPTION_LABEL_NUMERAL_LATIN_COMPATIBILITY";
      uint64_t v10 = @"EDIT_OPTION_LABEL_NUMERAL_LATIN";
      goto LABEL_8;
    case 1uLL:
      id v9 = @"EDIT_OPTION_LABEL_NUMERAL_ARABIC_INDIC_COMPATIBILITY";
      uint64_t v10 = @"EDIT_OPTION_LABEL_NUMERAL_ARABIC_INDIC";
LABEL_8:
      if (v7) {
        uint64_t v8 = v10;
      }
      else {
        uint64_t v8 = v9;
      }
      goto LABEL_23;
    case 2uLL:
      goto LABEL_23;
    case 3uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_BENGALI";
      goto LABEL_23;
    case 4uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_GURMUKHI";
      goto LABEL_23;
    case 5uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_GUJARATI";
      goto LABEL_23;
    case 6uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_TELUGU";
      goto LABEL_23;
    case 7uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_MALAYALAM";
      goto LABEL_23;
    case 8uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_KANNADA";
      goto LABEL_23;
    case 9uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_ODIA";
      goto LABEL_23;
    case 0xAuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_Ol_CHIKI";
      goto LABEL_23;
    case 0xBuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_URDU";
      goto LABEL_23;
    case 0xCuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_MEITEI";
      goto LABEL_23;
    case 0xDuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_BURMESE";
      goto LABEL_23;
    case 0xEuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_NUMERAL_KHMER";
LABEL_23:
      v12 = [(__CFString *)v8 stringByAppendingString:@"_COMPANION"];
      NTKCompanionClockFaceLocalizedString(v12, @"Numerals");
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      id v11 = &stru_1F1635E90;
      break;
  }

  return v11;
}

- (int64_t)swatchStyle
{
  return 2;
}

- (id)swatchImageWithFont:(id)a3 device:(id)a4 baseline:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  +[NTKEditOption sizeForSwatchStyle:[(NTKNumeralEditOption *)self swatchStyle]];
  double v11 = v10;
  double v13 = v12;
  id v14 = [v9 fontWithSize:22.0];

  id v15 = [(NTKEditOption *)self device];
  uint64_t v16 = +[CLKUITimeLabel labelWithOptions:1 forDevice:v15];

  uint64_t v17 = CLKLocaleNumberSystemFromNumeralOption([(NTKNumeralEditOption *)self numeralOption]);
  [v16 setUsesLegibility:1];
  uint64_t v18 = [MEMORY[0x1E4FB1618] whiteColor];
  [v16 setTextColor:v18];

  v19 = +[NTKTimeOffsetManager sharedManager];
  [v19 timeOffset];
  objc_msgSend(v16, "setTimeOffset:");

  id v20 = NTKIdealizedDate();
  [v16 setOverrideDate:v20 duration:0.0];

  [v16 setForcedNumberSystem:v17];
  uint64_t v21 = -[NTKNumeralEditOption styleForSwatchTimeLabelWithFont:device:baseline:faceBounds:](self, "styleForSwatchTimeLabelWithFont:device:baseline:faceBounds:", v14, v8, a5, 0.0, 0.0, v11, v13);

  [v16 setStyle:v21];
  [v16 sizeToFit];
  id v22 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  uint64_t v23 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v11, v13);
  [v23 addSubview:v16];
  [v23 bounds];
  double MidX = CGRectGetMidX(v32);
  [v23 bounds];
  objc_msgSend(v16, "setCenter:", MidX, CGRectGetMidY(v33));
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:", 0.0, 0.0, v11, v13);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__NTKNumeralEditOption_swatchImageWithFont_device_baseline___block_invoke;
  v29[3] = &unk_1E62C42D8;
  id v30 = v23;
  id v26 = v23;
  v27 = [v25 imageWithActions:v29];

  return v27;
}

void __60__NTKNumeralEditOption_swatchImageWithFont_device_baseline___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

- (id)styleForSwatchTimeLabelWithFont:(id)a3 device:(id)a4 baseline:(double)a5 faceBounds:(CGRect)a6
{
  double width = a6.size.width;
  int v7 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:withBaselineY:withFont:forDevice:", 0, a3, a4, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 0.0, round(a6.size.height * a5));
  id v8 = [v7 layoutRule];
  [v8 referenceFrame];
  double v10 = v9;
  double v12 = v11;

  double v13 = [v7 layoutRule];
  objc_msgSend(v13, "setReferenceFrame:", 0.0, v10, width, v12);

  id v14 = [v7 layoutRule];
  [v14 setHorizontalLayout:1];

  return v7;
}

+ (id)partiallySupportedEditOptionsForDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = _EnumValueRange(3uLL, 0xEuLL);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend((id)objc_opt_class(), "optionWithNumeral:forDevice:", (int)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "intValue", (void)v12), v3);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)partiallySupportedOptions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = _EnumValueRange(3uLL, 0xEuLL);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "intValue", (void)v11);
        double v9 = [NSNumber numberWithUnsignedInteger:v8];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (BOOL)isPartiallySupported:(unint64_t)a3
{
  uint64_t v4 = +[NTKNumeralEditOption partiallySupportedOptions];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

@end