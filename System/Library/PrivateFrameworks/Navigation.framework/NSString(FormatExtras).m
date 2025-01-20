@interface NSString(FormatExtras)
+ (BOOL)_componentsWillUseShortFormat:()FormatExtras;
+ (_TempToken)_navigation_overridenTokenForToken:()FormatExtras overrideVariables:;
+ (__CFString)_frequencyStringForComponents:()FormatExtras forRange:forceShort:;
+ (__CFString)_navigation_replacementForFormatToken:()FormatExtras options:overrideVariables:useMetric:;
+ (id)_frequencyDateComponents:()FormatExtras;
+ (id)_navigation_commaListDelimiter;
+ (id)_navigation_descriptionForFrequencyMinuteValue:()FormatExtras;
+ (id)_navigation_descriptionForFrequencyRangeWithMinFrequency:()FormatExtras maxFrequency:estimate:recurring:;
+ (id)_navigation_formatFloatForPrintedDistance:()FormatExtras;
+ (id)_navigation_formattedDescriptionForFrequency:()FormatExtras;
+ (id)_navigation_formattedDescriptionForLiveStatus:()FormatExtras updatedDepartureTimeString:;
+ (id)_navigation_formattedStringForFloat:()FormatExtras useIncreasedPrecision:;
+ (id)_navigation_formattedStringForHourRanges:()FormatExtras timeZone:;
+ (id)_navigation_formattedStringForHourRanges:()FormatExtras timeZone:delimeter:;
+ (id)_navigation_formattedStringForInteger:()FormatExtras;
+ (id)_navigation_formattedStringForOperatingHours:()FormatExtras timeZone:;
+ (id)_navigation_formattedStringForPriceValue:()FormatExtras currencyCode:;
+ (id)_navigation_formattedStringForPriceValueWithAmount:()FormatExtras currencyCode:showsCurrencySymbol:;
+ (id)_navigation_formatterForOptions:()FormatExtras;
+ (id)_navigation_frequencyRangeLocalizedInHoursWithMinHours:()FormatExtras maxHours:estimate:recurring:;
+ (id)_navigation_frequencyRangeLocalizedInMinutesWithMinMinutes:()FormatExtras maxMinutes:estimate:recurring:;
+ (id)_navigation_frequencyRangeLocalizedInMixedUnitsWithMinString:()FormatExtras maxString:estimate:recurring:;
+ (id)_navigation_languageDirectionStringWithFormat:()FormatExtras;
+ (id)_navigation_localizedStringForDistance:()FormatExtras detail:unitFormat:locale:useMetric:useYards:shouldScale:;
+ (id)_navigation_replacementForFormatToken:()FormatExtras abbreviatedUnits:overrideVariables:detail:spoken:;
+ (id)_navigation_replacementForFormatToken:()FormatExtras options:overrideVariables:;
+ (id)_navigation_selectInstructionWithServerString:()FormatExtras isSpoken:clientBlock:;
+ (id)_navigation_selectInstructionWithServerStringArray:()FormatExtras isSpoken:clientBlock:;
+ (id)_navigation_spokenStringWithMinutes:()FormatExtras andAbbreviationType:;
+ (id)_navigation_stringForDistance:()FormatExtras formatter:locale:shouldScale:;
+ (id)_navigation_stringForExpectedTravelTime:()FormatExtras dateUnitStyle:;
+ (id)_navigation_stringForPower:()FormatExtras unit:;
+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:overrideVariables:;
+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:overrideVariables:allTokensExpanded:;
+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:;
+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:overrideVariables:;
+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:overrideVariables:allTokensExpanded:;
+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:wrappedOverrideVariables:;
+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:wrappedOverrideVariables:allTokensExpanded:;
+ (id)_navigation_stringWithCountdownValue:()FormatExtras inToken:options:;
+ (id)_navigation_stringWithMinutes:()FormatExtras andAbbreviationType:;
+ (id)_navigation_stringWithTimeStampValues:()FormatExtras options:;
+ (uint64_t)_navigation_abbreviatedFromatterUnitsStyleForLocale:()FormatExtras;
+ (uint64_t)_navigation_formattedStringForFloat:()FormatExtras;
+ (uint64_t)_navigation_formattedStringForPriceValueWithAmount:()FormatExtras currencyCode:;
+ (uint64_t)_navigation_localizedStringForDistance:()FormatExtras context:extraDetail:;
+ (uint64_t)_navigation_localizedStringForDistance:()FormatExtras detail:unitFormat:locale:useMetric:useYards:;
+ (uint64_t)_navigation_logIfContainsVariables:()FormatExtras;
+ (uint64_t)_navigation_spokenStringWithSeconds:()FormatExtras abbreviated:;
+ (uint64_t)_navigation_spokenStringWithSeconds:()FormatExtras andAbbreviationType:;
+ (uint64_t)_navigation_stringForServerFormattedString:()FormatExtras;
+ (uint64_t)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:wrappedOverrideVariables:;
+ (uint64_t)_navigation_stringWithSeconds:()FormatExtras abbreviated:;
+ (uint64_t)_navigation_stringWithSeconds:()FormatExtras andAbbreviationType:;
+ (uint64_t)_replaceToken:()FormatExtras composedString:options:overrideVariables:;
+ (uint64_t)_replaceToken:()FormatExtras composedString:replacement:;
+ (void)_navigation_logMismatchBetweenServerInstruction:()FormatExtras clientInstruction:;
- (BOOL)_navigation_containsVariables;
- (__CFString)_navigation_stringByMakingPhonetic;
- (__CFString)_navigation_stringByMarkingAsAddress;
- (__CFString)_navigation_stringByMarkingAsNavigationText;
- (__CFString)_navigation_stringByMarkingAsNormalText;
- (id)_navigation_stringByStrippingPrivateTag;
- (id)_navigation_stripTagsFromSpokenString;
- (id)_navigation_stripVariablesFromString;
- (uint64_t)_navigation_distanceLevenshtein:()FormatExtras;
- (uint64_t)_navigation_isCJK;
- (uint64_t)_navigation_isPrivate;
- (uint64_t)_navigation_stringByMarkingAsPrivateText;
@end

@implementation NSString(FormatExtras)

+ (id)_navigation_localizedStringForDistance:()FormatExtras detail:unitFormat:locale:useMetric:useYards:shouldScale:
{
  id v15 = a6;
  if (!v15)
  {
    id v15 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  v16 = objc_alloc_init(_MNDistanceFormatOptions);
  if (a7 == 2)
  {
    uint64_t v17 = 1;
  }
  else if (a7 == 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    if (a7) {
      goto LABEL_10;
    }
    uint64_t v17 = objc_msgSend(v15, "_navigation_distanceUsesMetricSystem");
  }
  [(_MNDistanceFormatOptions *)v16 setMetric:v17];
LABEL_10:
  if (a8 == 2)
  {
    uint64_t v18 = 1;
  }
  else if (a8 == 1)
  {
    uint64_t v18 = 0;
  }
  else
  {
    if (a8) {
      goto LABEL_17;
    }
    uint64_t v18 = objc_msgSend(v15, "_navigation_useYardsForShortDistances");
  }
  [(_MNDistanceFormatOptions *)v16 setYards:v18];
LABEL_17:
  [(_MNDistanceFormatOptions *)v16 setMinimumFractionDigits:1];
  [(_MNDistanceFormatOptions *)v16 setAbbreviateUnits:a5 == 1];
  [(_MNDistanceFormatOptions *)v16 setSpoken:a5 == 2];
  [(_MNDistanceFormatOptions *)v16 setRounding:a4];
  if (a4 <= 3) {
    [(_MNDistanceFormatOptions *)v16 setMaximumFractionDigits:qword_1B55429A8[a4]];
  }
  if ([(_MNDistanceFormatOptions *)v16 spoken])
  {
    [(_MNDistanceFormatOptions *)v16 setAbbreviateUnits:0];
    [(_MNDistanceFormatOptions *)v16 setMaximumFractionDigits:[(_MNDistanceFormatOptions *)v16 maximumFractionDigits] != 0];
    v19 = [MEMORY[0x1E4F28F80] processInfo];
    int v20 = objc_msgSend(v19, "_navigation_isNavd");

    v21 = (void *)MEMORY[0x1E4F1CA20];
    if (v20) {
      +[MNUserOptionsEngine sharedInstance];
    }
    else {
    v22 = +[MNNavigationService sharedService];
    }
    v23 = [v22 currentVoiceLanguage];
    uint64_t v24 = [v21 localeWithLocaleIdentifier:v23];

    id v15 = (id)v24;
  }
  v25 = objc_msgSend(NSString, "_navigation_stringForDistance:formatter:locale:shouldScale:", v16, v15, a9, a1);

  return v25;
}

+ (uint64_t)_navigation_localizedStringForDistance:()FormatExtras context:extraDetail:
{
  v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v9 = objc_msgSend(v8, "_navigation_distanceUsesMetricSystem");

  v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v11 = objc_msgSend(v10, "_navigation_useYardsForShortDistances");

  if (a5) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 0;
  }
  if (a4)
  {
    if (a4 == 5)
    {
      uint64_t v12 = 3;
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = a4 != 4;
    }
  }
  else
  {
    uint64_t v16 = MNInstructionsCalculateScaledDistanceUnits(v9, v11, 0, 1, a1);
    BOOL v21 = v16 != 4 && v16 != 1 || *(float *)&v17 <= 1.0 || *(float *)&v17 >= 10.0 || (v17 & 0x100000000) == 0;
    double v22 = floor(*(float *)&v17);
    BOOL v23 = v21 || v22 == *(float *)&v17;
    uint64_t v13 = 2;
    if (v23) {
      uint64_t v12 = 1;
    }
  }
  v14 = NSString;
  return objc_msgSend(v14, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:", v12, v13, 0, 0, 0, a1);
}

+ (id)_navigation_formatterForOptions:()FormatExtras
{
  id v3 = a3;
  if (qword_1EB59C058 != -1) {
    dispatch_once(&qword_1EB59C058, &__block_literal_global_695);
  }
  id v4 = [(id)qword_1EB59C050 objectForKey:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E30]);
    [v4 setUnitOptions:1];
    if ([v3 abbreviateUnits]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 3;
    }
    [v4 setUnitStyle:v5];
    uint64_t v6 = [v3 minimumFractionDigits];
    v7 = [v4 numberFormatter];
    [v7 setMinimumFractionDigits:v6];

    uint64_t v8 = [v3 maximumFractionDigits];
    int v9 = [v4 numberFormatter];
    [v9 setMaximumFractionDigits:v8];

    v10 = [v3 locale];
    [v4 setLocale:v10];

    [(id)qword_1EB59C050 setObject:v4 forKey:v3];
  }

  return v4;
}

+ (id)_navigation_stringForDistance:()FormatExtras formatter:locale:shouldScale:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  [v9 setLocale:a5];
  int v10 = [v9 spoken];
  uint64_t v11 = MNInstructionsCalculateScaledDistanceUnits([v9 metric], objc_msgSend(v9, "yards"), objc_msgSend(v9, "rounding"), a6, a1);
  unint64_t v13 = v12;
  float v14 = *(float *)&v12;
  uint64_t v15 = [v9 rounding];
  uint64_t v16 = HIDWORD(v13) & 1;
  if (v15 != 1) {
    LODWORD(v16) = 0;
  }
  if (v10)
  {
    if (v16)
    {
      v42 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        int v46 = 136315906;
        v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
        __int16 v48 = 2080;
        v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
        __int16 v50 = 1024;
        int v51 = 1533;
        __int16 v52 = 2080;
        v53 = "formatOptions.rounding != MNInstructionsDistanceDetailLevelWholeNumbers || !distanceUnits.hasDecimalComponent";
        _os_log_impl(&dword_1B542B000, v42, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
      }
    }
    uint64_t v17 = [v9 rounding];
    float v18 = floorf(v14);
    if (v17 == 1) {
      float v19 = v18;
    }
    else {
      float v19 = v14;
    }
    switch(v11)
    {
      case 0:
        goto LABEL_26;
      case 1:
        goto LABEL_32;
      case 2:
        goto LABEL_27;
      case 3:
        goto LABEL_28;
      case 4:
        goto LABEL_34;
      case 5:
        int v20 = (int)v19;
        if (((int)v19 - 4) <= 0xFFFFFFFC)
        {
          v44 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            int v46 = 136315906;
            v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
            __int16 v48 = 2080;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
            __int16 v50 = 1024;
            int v51 = 1566;
            __int16 v52 = 2080;
            v53 = "integralDistance > 0 && integralDistance < 4";
            _os_log_impl(&dword_1B542B000, v44, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
          }
        }
        if (v20 == 2)
        {
          BOOL v21 = @"half a mile [SPOKEN]";
        }
        else if (v20 == 3)
        {
          BOOL v21 = @"three quarters of a mile [SPOKEN]";
        }
        else
        {
          BOOL v21 = @"a quarter mile [SPOKEN]";
        }
        uint64_t v41 = _MNStringFromSpokenLocalization(v21);
        goto LABEL_51;
      default:
        v32 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          int v46 = 136315650;
          v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
          __int16 v48 = 2080;
          v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
          __int16 v50 = 1024;
          int v51 = 1577;
          _os_log_impl(&dword_1B542B000, v32, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v46, 0x1Cu);
        }
        goto LABEL_36;
    }
  }
  if (v16)
  {
    v43 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      int v46 = 136315906;
      v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
      __int16 v48 = 2080;
      v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      __int16 v50 = 1024;
      int v51 = 1583;
      __int16 v52 = 2080;
      v53 = "formatOptions.rounding != MNInstructionsDistanceDetailLevelWholeNumbers || !distanceUnits.hasDecimalComponent";
      _os_log_impl(&dword_1B542B000, v43, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
    }
  }
  uint64_t v22 = [v9 rounding];
  float v23 = floorf(v14);
  if (v22 == 1) {
    float v19 = v23;
  }
  else {
    float v19 = v14;
  }
  if ((v13 & 0x100000000) != 0)
  {
    unint64_t v24 = [v9 minimumFractionDigits];
    double v25 = __exp10((double)(unint64_t)[v9 maximumFractionDigits]);
    unint64_t v26 = [v9 minimumFractionDigits];
    if (v26 < [v9 maximumFractionDigits])
    {
      double v27 = round(v25 * v19) / v25;
      double v28 = __exp10((double)v26);
      if (round(v28 * v19) / v28 != v27)
      {
        unint64_t v29 = v26 + 1;
        do
        {
          unint64_t v24 = v29;
          if (v29 >= [v9 maximumFractionDigits]) {
            break;
          }
          double v30 = __exp10((double)v24);
          unint64_t v29 = v24 + 1;
        }
        while (round(v30 * v19) / v30 != v27);
      }
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  switch(v11)
  {
    case 0:
LABEL_26:
      [v9 setMinimumFractionDigits:0];
      [v9 setMaximumFractionDigits:0];
      uint64_t v31 = [MEMORY[0x1E4F291E0] meters];
      goto LABEL_35;
    case 1:
      [v9 setMinimumFractionDigits:v24];
      [v9 setMaximumFractionDigits:v24];
LABEL_32:
      uint64_t v31 = [MEMORY[0x1E4F291E0] kilometers];
      goto LABEL_35;
    case 2:
LABEL_27:
      [v9 setMinimumFractionDigits:0];
      [v9 setMaximumFractionDigits:0];
      uint64_t v31 = [MEMORY[0x1E4F291E0] yards];
      goto LABEL_35;
    case 3:
LABEL_28:
      [v9 setMinimumFractionDigits:0];
      [v9 setMaximumFractionDigits:0];
      uint64_t v31 = [MEMORY[0x1E4F291E0] feet];
      goto LABEL_35;
    case 4:
      [v9 setMinimumFractionDigits:v24];
      [v9 setMaximumFractionDigits:v24];
LABEL_34:
      uint64_t v31 = [MEMORY[0x1E4F291E0] miles];
LABEL_35:
      v32 = v31;
      [v9 setUnitLength:v31];
LABEL_36:

      goto LABEL_37;
    case 5:
      int v39 = (int)v19;
      if (((int)v19 - 4) <= 0xFFFFFFFC)
      {
        v45 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          int v46 = 136315906;
          v47 = "+[NSString(FormatExtras) _navigation_stringForDistance:formatter:locale:shouldScale:]";
          __int16 v48 = 2080;
          v49 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
          __int16 v50 = 1024;
          int v51 = 1636;
          __int16 v52 = 2080;
          v53 = "integralDistance > 0 && integralDistance < 4";
          _os_log_impl(&dword_1B542B000, v45, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v46, 0x26u);
        }
      }
      if (v39 == 2)
      {
        v40 = @"1/2 mile";
      }
      else if (v39 == 3)
      {
        v40 = @"3/4 mile";
      }
      else
      {
        v40 = @"1/4 mile";
      }
      uint64_t v41 = _MNLocalizedStringFromThisBundle(v40);
LABEL_51:
      v37 = (void *)v41;
      if (!v41) {
        goto LABEL_37;
      }
      goto LABEL_38;
    default:
LABEL_37:
      v33 = objc_msgSend((id)objc_opt_class(), "_navigation_formatterForOptions:", v9);
      id v34 = objc_alloc(MEMORY[0x1E4F28E28]);
      v35 = [v9 unitLength];
      v36 = (void *)[v34 initWithDoubleValue:v35 unit:v19];
      v37 = [v33 stringFromMeasurement:v36];

LABEL_38:
      return v37;
  }
}

+ (uint64_t)_navigation_localizedStringForDistance:()FormatExtras detail:unitFormat:locale:useMetric:useYards:
{
  return objc_msgSend(a1, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:shouldScale:", a3, a4, a5, a6, a7, 1);
}

+ (id)_navigation_formattedStringForInteger:()FormatExtras
{
  if (qword_1EB59C038 != -1) {
    dispatch_once(&qword_1EB59C038, &__block_literal_global_7);
  }
  id v4 = (void *)_MergedGlobals_21;
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 stringFromNumber:v5];

  return v6;
}

+ (uint64_t)_navigation_formattedStringForFloat:()FormatExtras
{
  return objc_msgSend(a1, "_navigation_formattedStringForFloat:useIncreasedPrecision:", 0);
}

+ (id)_navigation_formattedStringForFloat:()FormatExtras useIncreasedPrecision:
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v6 setLocale:v7];

  [v6 setNumberStyle:1];
  [v6 setRoundingMode:6];
  if (a1 >= 100.0)
  {
    [v6 setUsesSignificantDigits:1];
    [v6 setMaximumSignificantDigits:3];
    uint64_t v8 = 0;
  }
  else
  {
    if (a4) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 1;
    }
    [v6 setUsesSignificantDigits:0];
  }
  [v6 setMaximumFractionDigits:v8];
  id v9 = [NSNumber numberWithDouble:a1];
  int v10 = [v6 stringFromNumber:v9];

  return v10;
}

+ (id)_navigation_formatFloatForPrintedDistance:()FormatExtras
{
  BOOL v2 = a1 < 10.0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  id v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  [v3 setNumberStyle:1];
  [v3 setRoundingMode:6];
  [v3 setMaximumFractionDigits:2 * v2];
  uint64_t v5 = [NSNumber numberWithDouble:a1];
  id v6 = [v3 stringFromNumber:v5];

  return v6;
}

+ (id)_navigation_formattedStringForOperatingHours:()FormatExtras timeZone:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        float v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v14, "startTime", (void)v23);
        double v16 = v15;
        [v14 duration];
        if (v17 > 0.0)
        {
          double v18 = v17;
          float v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v16];
          int v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v19 sinceDate:v18];
          [v8 addObject:v19];
          [v8 addObject:v20];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  BOOL v21 = objc_msgSend(a1, "_navigation_formattedStringForHourRanges:timeZone:", v8, v7);

  return v21;
}

+ (id)_navigation_formattedStringForHourRanges:()FormatExtras timeZone:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _MNLocalizedStringFromThisBundle(@"Operating Hours Separator");
  id v9 = objc_msgSend(a1, "_navigation_formattedStringForHourRanges:timeZone:delimeter:", v7, v6, v8);

  return v9;
}

+ (id)_navigation_formattedStringForHourRanges:()FormatExtras timeZone:delimeter:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    int v51 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v63 = "+[NSString(FormatExtras) _navigation_formattedStringForHourRanges:timeZone:delimeter:]";
      __int16 v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      __int16 v66 = 1024;
      int v67 = 465;
      __int16 v68 = 2080;
      v69 = "([startEndDates count] % 2) == 0";
      _os_log_impl(&dword_1B542B000, v51, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

    if (v8)
    {
LABEL_3:
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_49;
    }
  }
  else if (v8)
  {
    goto LABEL_3;
  }
  __int16 v52 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v63 = "+[NSString(FormatExtras) _navigation_formattedStringForHourRanges:timeZone:delimeter:]";
    __int16 v64 = 2080;
    v65 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
    __int16 v66 = 1024;
    int v67 = 466;
    __int16 v68 = 2080;
    v69 = "timeZone != nil";
    _os_log_impl(&dword_1B542B000, v52, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
  }

  if (!v9)
  {
LABEL_49:
    v53 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v63 = "+[NSString(FormatExtras) _navigation_formattedStringForHourRanges:timeZone:delimeter:]";
      __int16 v64 = 2080;
      v65 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      __int16 v66 = 1024;
      int v67 = 467;
      __int16 v68 = 2080;
      v69 = "delimeter != nil";
      _os_log_impl(&dword_1B542B000, v53, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }
  }
LABEL_4:
  uint64_t v54 = v9;
  if (!v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v8 = [v10 timeZone];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v11 setDateStyle:0];
  v61 = v11;
  [v11 setTimeStyle:1];
  id v58 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v55 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v56 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  uint64_t v12 = (void *)_navigation_formattedStringForHourRanges_timeZone_delimeter__locale;
  if (!_navigation_formattedStringForHourRanges_timeZone_delimeter__locale) {
    goto LABEL_11;
  }
  unint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) != 0
    || (double v15 = (void *)_navigation_formattedStringForHourRanges_timeZone_delimeter__locale) != 0
    && ([MEMORY[0x1E4F1CA20] currentLocale],
        double v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v15 isEqual:v16],
        v16,
        (v17 & 1) != 0))
  {
    int v60 = 0;
    double v18 = v61;
  }
  else
  {
LABEL_11:
    uint64_t v19 = [MEMORY[0x1E4F1CA20] currentLocale];
    int v20 = (void *)_navigation_formattedStringForHourRanges_timeZone_delimeter__locale;
    _navigation_formattedStringForHourRanges_timeZone_delimeter__locale = v19;

    BOOL v21 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"j" options:0 locale:_navigation_formattedStringForHourRanges_timeZone_delimeter__locale];
    int v60 = [v21 isEqualToString:@"h a"];
    if (v60)
    {
      [v58 setDateFormat:v21];
      [v55 setDateFormat:@"h"];
      double v18 = v61;
      uint64_t v22 = [v61 dateFormat];
      if ([v22 containsString:@"a"])
      {
        long long v23 = [v22 stringByReplacingOccurrencesOfString:@"a" withString:&stru_1F0E08010];
        long long v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        uint64_t v25 = [v23 stringByTrimmingCharactersInSet:v24];

        [v56 setDateFormat:v25];
        uint64_t v22 = (void *)v25;
      }
      else
      {
        id v26 = v61;

        id v56 = v26;
      }
    }
    else
    {
      double v18 = v61;
    }
  }
  [v58 setTimeZone:v8];
  [v55 setTimeZone:v8];
  [v18 setTimeZone:v8];
  v57 = v8;
  [v56 setTimeZone:v8];
  double v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", (unint64_t)objc_msgSend(v7, "count") >> 1);
  if ((unint64_t)[v7 count] >= 2)
  {
    unint64_t v28 = 1;
    v59 = v7;
    do
    {
      unint64_t v29 = [v7 objectAtIndex:v28 - 1];
      double v30 = [v7 objectAtIndex:v28];
      if (v60)
      {
        uint64_t v31 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v32 = (void *)[v31 copy];

        [v32 setTimeZone:v57];
        uint64_t v33 = [v32 component:32 fromDate:v29];
        uint64_t v34 = [v32 component:32 fromDate:v30];
        BOOL v35 = v33 <= 11 && v34 < 12;
        if (!v35 && (v33 >= 12 ? (BOOL v36 = v34 < 12) : (BOOL v36 = 1), v36))
        {
          int v37 = [v29 isWholeHour];
          v38 = v58;
          if (!v37) {
            v38 = v18;
          }
        }
        else
        {
          int v41 = [v29 isWholeHour];
          v38 = v55;
          if (!v41) {
            v38 = v56;
          }
        }
        id v39 = v38;
        int v42 = [v30 isWholeHour];
        v43 = v58;
        if (!v42) {
          v43 = v18;
        }
        id v40 = v43;
      }
      else
      {
        id v39 = v18;
        id v40 = v39;
      }
      v44 = [v39 stringFromDate:v29];
      v45 = [v40 stringFromDate:v30];
      int v46 = NSString;
      v47 = _MNLocalizedStringFromThisBundle(@"Operating Hours Range");
      __int16 v48 = objc_msgSend(v46, "stringWithFormat:", v47, v44, v45);

      [v27 addObject:v48];
      id v7 = v59;
      v28 += 2;
      double v18 = v61;
    }
    while (v28 < [v59 count]);
  }
  v49 = [v27 componentsJoinedByString:v54];

  return v49;
}

+ (id)_navigation_stringForExpectedTravelTime:()FormatExtras dateUnitStyle:
{
  int v6 = (int)(a2 / 3600.0);
  int v7 = vcvtpd_s64_f64((a2 - (double)(3600 * v6)) / 60.0);
  if (v7 >= 59) {
    int v8 = 59;
  }
  else {
    int v8 = v7;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v9 setHour:v6];
  [v9 setMinute:v8];
  if (a4 == 1)
  {
    uint64_t v10 = [v9 calendar];
    id v11 = [v10 locale];
    a4 = objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v11);
  }
  uint64_t v12 = [MEMORY[0x1E4F28C00] localizedStringFromDateComponents:v9 unitsStyle:a4];

  return v12;
}

+ (BOOL)_componentsWillUseShortFormat:()FormatExtras
{
  id v3 = a3;
  BOOL v4 = [v3 hour] >= 1 && objc_msgSend(v3, "minute") > 0;

  return v4;
}

+ (__CFString)_frequencyStringForComponents:()FormatExtras forRange:forceShort:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_opt_new();
  [v9 setFormattingContext:2];
  uint64_t v10 = [v8 hour];
  uint64_t v11 = [v8 minute];
  if (v10 >= 1)
  {
    if (v11 >= 1)
    {
      if ([v8 minute] >= 60)
      {
        long long v24 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          int v25 = 136315906;
          id v26 = "+[NSString(FormatExtras) _frequencyStringForComponents:forRange:forceShort:]";
          __int16 v27 = 2080;
          unint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
          __int16 v29 = 1024;
          int v30 = 575;
          __int16 v31 = 2080;
          v32 = "components.minute < 60";
          _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v25, 0x26u);
        }
      }
      uint64_t v12 = [v9 calendar];
      unint64_t v13 = [v12 locale];
      objc_msgSend(v9, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v13));

      [v9 setAllowedUnits:96];
      [v9 setMaximumUnitCount:2];
      uint64_t v14 = [v8 hour];
      uint64_t v15 = 60 * ([v8 minute] + 60 * v14);
      goto LABEL_22;
    }
    if ((a4 & 1) == 0 && [v8 hour] == 1)
    {
      double v16 = @"TransitDepartureFrequency_component_singleHour";
      goto LABEL_12;
    }
    [v9 setAllowedUnits:32];
    [v9 setMaximumUnitCount:1];
    if (a5)
    {
      int v20 = [v9 calendar];
      BOOL v21 = [v20 locale];
      objc_msgSend(v9, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v21));
    }
    else
    {
      [v9 setUnitsStyle:2];
    }
    uint64_t v15 = 3600 * [v8 hour];
LABEL_22:
    uint64_t v17 = [v9 stringFromTimeInterval:(double)v15];
    goto LABEL_23;
  }
  if (v11 < 1)
  {
    uint64_t v22 = &stru_1F0E08010;
    goto LABEL_24;
  }
  if ((a4 & 1) != 0 || [v8 minute] != 1)
  {
    [v9 setAllowedUnits:64];
    [v9 setMaximumUnitCount:1];
    if (a5)
    {
      double v18 = [v9 calendar];
      uint64_t v19 = [v18 locale];
      objc_msgSend(v9, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v19));
    }
    else
    {
      [v9 setUnitsStyle:2];
    }
    uint64_t v15 = 60 * [v8 minute];
    goto LABEL_22;
  }
  double v16 = @"TransitDepartureFrequency_component_singleMinute";
LABEL_12:
  uint64_t v17 = _MNLocalizedStringFromThisBundle(v16);
LABEL_23:
  uint64_t v22 = (__CFString *)v17;
LABEL_24:

  return v22;
}

+ (id)_navigation_formattedDescriptionForFrequency:()FormatExtras
{
  id v4 = a3;
  uint64_t v5 = [v4 frequencyType];
  if (v5 == 2)
  {
    int v7 = objc_msgSend(a1, "_frequencyDateComponents:", objc_msgSend(v4, "displayFrequency"));
    if ([v7 minute] || objc_msgSend(v7, "hour") != 1)
    {
      if ([v7 minute] != 1 || objc_msgSend(v7, "hour"))
      {
        uint64_t v9 = [v7 hour];
        int v10 = [v4 isEstimate];
        if (v9)
        {
          if (v10) {
            uint64_t v11 = @"TransitDepartureFrequency_estimated_hours_format";
          }
          else {
            uint64_t v11 = @"TransitDepartureFrequency_hours_format";
          }
          uint64_t v12 = _MNLocalizedStringFromThisBundle(v11);
          unint64_t v13 = [a1 _frequencyStringForComponents:v7 forRange:0 forceShort:0];
          uint64_t v17 = 0;
          [NSString localizedStringWithValidatedFormat:v12, @"%d %@", &v17, objc_msgSend(v7, "hour"), v13 validFormatSpecifiers error];
        }
        else
        {
          if (v10) {
            uint64_t v14 = @"TransitDepartureFrequency_estimated_minutes_format";
          }
          else {
            uint64_t v14 = @"TransitDepartureFrequency_minutes_format";
          }
          uint64_t v12 = _MNLocalizedStringFromThisBundle(v14);
          unint64_t v13 = [a1 _frequencyStringForComponents:v7 forRange:0 forceShort:0];
          uint64_t v16 = 0;
          [NSString localizedStringWithValidatedFormat:v12, @"%d %@", &v16, objc_msgSend(v7, "minute"), v13 validFormatSpecifiers error];
        int v6 = };

        goto LABEL_22;
      }
      id v8 = @"TransitDepartureFrequency_format_singleMinute";
    }
    else
    {
      id v8 = @"TransitDepartureFrequency_format_singleHour";
    }
    int v6 = _MNLocalizedStringFromThisBundle(v8);
LABEL_22:

    goto LABEL_23;
  }
  if (v5 == 1)
  {
    int v6 = objc_msgSend(a1, "_navigation_descriptionForFrequencyRangeWithMinFrequency:maxFrequency:estimate:recurring:", objc_msgSend(v4, "minFrequency"), objc_msgSend(v4, "maxFrequency"), objc_msgSend(v4, "isEstimate"), 1);
  }
  else
  {
    int v6 = 0;
  }
LABEL_23:

  return v6;
}

+ (id)_navigation_formattedDescriptionForLiveStatus:()FormatExtras updatedDepartureTimeString:
{
  id v5 = a4;
  int v6 = v5;
  switch((unint64_t)a3)
  {
    case 0uLL:
      int v7 = @"TransitDepartureLiveStatus_description_unknown";
      goto LABEL_12;
    case 1uLL:
    case 2uLL:
      int v7 = @"TransitDepartureLiveStatus_description_ontime";
      goto LABEL_12;
    case 3uLL:
      if (v5)
      {
        id v8 = @"TransitDepartureLiveStatus_description_early_format";
        goto LABEL_8;
      }
      int v7 = @"TransitDepartureLiveStatus_description_early";
      goto LABEL_12;
    case 4uLL:
      if (v5)
      {
        id v8 = @"TransitDepartureLiveStatus_description_delayed_format";
LABEL_8:
        uint64_t v9 = _MNLocalizedStringFromThisBundle(v8);
        a3 = objc_msgSend(NSString, "stringWithFormat:", v9, v6);
      }
      else
      {
        int v7 = @"TransitDepartureLiveStatus_description_delayed";
LABEL_12:
        a3 = _MNLocalizedStringFromThisBundle(v7);
      }
LABEL_13:

      return a3;
    case 5uLL:
      int v7 = @"TransitDepartureLiveStatus_description_canceled";
      goto LABEL_12;
    default:
      goto LABEL_13;
  }
}

+ (id)_frequencyDateComponents:()FormatExtras
{
  if ((unint64_t)(a3 - 61) >= 0x1D) {
    uint64_t v3 = a3 / 60;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = a3 - 60 * v3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setMinute:v4];
  [v5 setHour:v3];
  return v5;
}

+ (id)_navigation_descriptionForFrequencyMinuteValue:()FormatExtras
{
  BOOL v2 = objc_msgSend(a1, "_frequencyDateComponents:");
  uint64_t v3 = [a1 _frequencyStringForComponents:v2 forRange:0 forceShort:0];

  return v3;
}

+ (id)_navigation_descriptionForFrequencyRangeWithMinFrequency:()FormatExtras maxFrequency:estimate:recurring:
{
  BOOL v9 = a3 < 90;
  BOOL v10 = a4 < 90;
  if (v9 && v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = a4 / 60;
  }
  if (v9 && v10) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = a3 / 60;
  }
  uint64_t v13 = a3 - 60 * v12;
  uint64_t v14 = a4 - 60 * v11;
  if (v12 >= 1 && v11 >= 1 && (v13 | v14) == 0)
  {
    uint64_t v20 = objc_msgSend(a1, "_navigation_frequencyRangeLocalizedInHoursWithMinHours:maxHours:estimate:recurring:", v12, v11, a5, a6);
  }
  else
  {
    if (v12 | v11)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v17 setMinute:v13];
      [v17 setHour:v12];
      id v18 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v18 setMinute:v14];
      [v18 setHour:v11];
      if ([a1 _componentsWillUseShortFormat:v17]) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = [a1 _componentsWillUseShortFormat:v18];
      }
      uint64_t v22 = [a1 _frequencyStringForComponents:v18 forRange:1 forceShort:v19];
      long long v23 = [a1 _frequencyStringForComponents:v17 forRange:1 forceShort:v19];
      BOOL v21 = objc_msgSend(a1, "_navigation_frequencyRangeLocalizedInMixedUnitsWithMinString:maxString:estimate:recurring:", v23, v22, a5, a6);

      goto LABEL_22;
    }
    uint64_t v20 = objc_msgSend(a1, "_navigation_frequencyRangeLocalizedInMinutesWithMinMinutes:maxMinutes:estimate:recurring:", a3 - 60 * v12, a4 - 60 * v11, a5, a6);
  }
  BOOL v21 = (void *)v20;
LABEL_22:
  return v21;
}

+ (id)_navigation_frequencyRangeLocalizedInMinutesWithMinMinutes:()FormatExtras maxMinutes:estimate:recurring:
{
  if (a6)
  {
    if (a5)
    {
      id v8 = _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_estimated_range_min_format");
      uint64_t v16 = a3;
      BOOL v9 = (id *)&v19;
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, @"%d %d", &v19, a4, v16, v18, 0);
    }
    else
    {
      id v8 = _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_range_min_format");
      uint64_t v17 = a3;
      BOOL v9 = (id *)&v18;
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, @"%d %d", &v18, a4, v17, 0, v19);
    uint64_t v13 = };
    id v14 = *v9;
  }
  else
  {
    BOOL v10 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", a3);
    uint64_t v11 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", a4);
    uint64_t v12 = _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_description_minutes_range");
    uint64_t v13 = objc_msgSend(NSString, "localizedStringWithFormat:", v12, v10, v11);
  }
  return v13;
}

+ (id)_navigation_frequencyRangeLocalizedInHoursWithMinHours:()FormatExtras maxHours:estimate:recurring:
{
  if (a6)
  {
    if (a5)
    {
      id v8 = _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_estimated_range_hr_format");
      uint64_t v16 = a3;
      BOOL v9 = (id *)&v19;
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, @"%d %d", &v19, a4, v16, v18, 0);
    }
    else
    {
      id v8 = _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_range_hr_format");
      uint64_t v17 = a3;
      BOOL v9 = (id *)&v18;
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v8, @"%d %d", &v18, a4, v17, 0, v19);
    uint64_t v13 = };
    id v14 = *v9;
  }
  else
  {
    BOOL v10 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", a3);
    uint64_t v11 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", a4);
    uint64_t v12 = _MNLocalizedStringFromThisBundle(@"TransitDepartureFrequency_description_hour_range");
    uint64_t v13 = objc_msgSend(NSString, "localizedStringWithFormat:", v12, v10, v11);
  }
  return v13;
}

+ (id)_navigation_frequencyRangeLocalizedInMixedUnitsWithMinString:()FormatExtras maxString:estimate:recurring:
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = @"TransitDepartureFrequency_description_mixes_range_recurring";
  if (a5) {
    uint64_t v11 = @"TransitDepartureFrequency_description_mixes_range_estimated_recurring";
  }
  if (a6) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = @"TransitDepartureFrequency_description_mixes_range";
  }
  uint64_t v13 = _MNLocalizedStringFromThisBundle(v12);
  id v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v9, v10);

  return v14;
}

+ (uint64_t)_navigation_stringForServerFormattedString:()FormatExtras
{
  return objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:overrideVariables:", a3, 1, 0, 0, 0);
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:overrideVariables:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    uint64_t v15 = @"{currentDestination}";
    v16[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    id v10 = 0;
  }
  long long v11 = a4[1];
  v14[0] = *a4;
  v14[1] = v11;
  uint64_t v12 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v7, v14, v10);

  return v12;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:overrideVariables:allTokensExpanded:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v11 = v10;
  if (v10)
  {
    uint64_t v17 = @"{currentDestination}";
    v18[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v13 = a4[1];
  v16[0] = *a4;
  v16[1] = v13;
  id v14 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:allTokensExpanded:", v9, v16, v12, a6);

  return v14;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:overrideVariables:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  long long v13 = v12;
  if (v12)
  {
    uint64_t v17 = @"{currentDestination}";
    v18[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:", v11, a4, a5, a6, v14);

  return v15;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:overrideVariables:allTokensExpanded:
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  long long v13 = v12;
  if (v12)
  {
    uint64_t v17 = @"{currentDestination}";
    v18[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:", v11, a4, a5, a6, v14, 0);

  return v15;
}

+ (id)_navigation_replacementForFormatToken:()FormatExtras options:overrideVariables:
{
  long long v5 = a4[1];
  v8[0] = *a4;
  v8[1] = v5;
  int v6 = objc_msgSend(a1, "_navigation_replacementForFormatToken:options:overrideVariables:useMetric:", a3, v8, a5, 0);
  return v6;
}

+ (__CFString)_navigation_replacementForFormatToken:()FormatExtras options:overrideVariables:useMetric:
{
  id v9 = objc_msgSend(a1, "_navigation_overridenTokenForToken:overrideVariables:", a3, a5);
  id v10 = 0;
  switch([v9 type])
  {
    case 0:
      uint64_t v11 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", objc_msgSend(v9, "value1"));
      goto LABEL_45;
    case 2:
      double v15 = (double)[v9 value1];
      if (a4[16]) {
        objc_msgSend(NSString, "_navigation_localizedStringForDistance:context:extraDetail:", 0, 0, v15);
      }
      else {
      uint64_t v11 = objc_msgSend(NSString, "_navigation_localizedStringForDistance:detail:unitFormat:locale:useMetric:useYards:shouldScale:", *((void *)a4 + 1), *a4, 0, a6, 0, objc_msgSend(v9, "shouldScaleUnits"), v15);
      }
      goto LABEL_45;
    case 3:
    case 9:
      id v12 = [v9 timeStampValues];
      if ([v12 count])
      {
        long long v13 = *((_OWORD *)a4 + 1);
        long long v50 = *(_OWORD *)a4;
        long long v51 = v13;
        uint64_t v14 = objc_msgSend(a1, "_navigation_stringWithTimeStampValues:options:", v12, &v50);
LABEL_29:
        id v10 = (__CFString *)v14;
      }
      else
      {
        id v10 = 0;
      }

      goto LABEL_46;
    case 4:
      int v16 = a4[16];
      uint64_t v17 = NSString;
      uint64_t v18 = [v9 value1];
      uint64_t v19 = v17;
      uint64_t v20 = 1;
      if (!v16) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 5:
      int v21 = a4[16];
      uint64_t v22 = NSString;
      uint64_t v18 = [v9 value1];
      uint64_t v19 = v22;
      uint64_t v20 = 0;
      if (v21)
      {
LABEL_12:
        uint64_t v11 = objc_msgSend(v19, "_navigation_spokenStringWithSeconds:abbreviated:", v18, v20);
      }
      else
      {
LABEL_10:
        uint64_t v11 = objc_msgSend(v19, "_navigation_stringWithSeconds:abbreviated:", v18, v20);
      }
      goto LABEL_45;
    case 6:
      uint64_t v23 = llroundf((float)[v9 value1] / 60.0);
      if (v23 <= 1) {
        uint64_t v24 = 1;
      }
      else {
        uint64_t v24 = v23;
      }
      uint64_t v11 = objc_msgSend(NSString, "_navigation_descriptionForFrequencyMinuteValue:", v24);
      goto LABEL_45;
    case 7:
      uint64_t v25 = llroundf((float)[v9 value1] / 60.0);
      uint64_t v26 = llroundf((float)[v9 value2] / 60.0);
      if (v25 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = v25;
      }
      if (v26 <= 1) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = v26;
      }
      uint64_t v11 = objc_msgSend(NSString, "_navigation_descriptionForFrequencyRangeWithMinFrequency:maxFrequency:estimate:recurring:", v27, v28, 0, 0);
      goto LABEL_45;
    case 8:
      __int16 v29 = [v9 priceValue];
      int v30 = v29;
      if (v29)
      {
        [v29 value];
        double v32 = v31;
        uint64_t v33 = [v30 currencyCode];
        uint64_t v34 = objc_msgSend(a1, "_navigation_formattedStringForPriceValue:currencyCode:", v33, v32);
LABEL_41:
        id v10 = (__CFString *)v34;
      }
      else
      {
        id v10 = 0;
      }

LABEL_46:
      return v10;
    case 10:
    case 17:
    case 18:
      goto LABEL_2;
    case 11:
      BOOL v35 = [v9 artworkValue];
      BOOL v36 = [v35 shieldDataSource];
      int v37 = [v36 shieldText];

      if ([v37 length])
      {
        v38 = v37;
LABEL_34:
        id v10 = v38;
      }
      else
      {
        v49 = [v9 stringValue];
        if ([v49 length])
        {
          id v10 = [v9 stringValue];
        }
        else
        {
          id v10 = 0;
        }
      }
      goto LABEL_35;
    case 12:
      id v12 = [v9 countdownValue];
      long long v39 = *((_OWORD *)a4 + 1);
      long long v50 = *(_OWORD *)a4;
      long long v51 = v39;
      uint64_t v14 = objc_msgSend(a1, "_navigation_stringWithCountdownValue:inToken:options:", v12, v9, &v50);
      goto LABEL_29;
    case 13:
      if (qword_1EB59C048 != -1) {
        dispatch_once(&qword_1EB59C048, &__block_literal_global_682);
      }
      id v40 = (void *)qword_1EB59C040;
      int v41 = NSNumber;
      [v9 percentageValue];
      *(float *)&double v43 = v42 * 0.01;
      int v37 = [v41 numberWithFloat:v43];
      v38 = [v40 stringFromNumber:v37];
      goto LABEL_34;
    case 14:
      int v37 = [v9 urlValue];
      v38 = [v37 displayTitle];
      goto LABEL_34;
    case 15:
      v44 = [v9 stringValue];

      if (v44)
      {
LABEL_2:
        uint64_t v11 = [v9 stringValue];
LABEL_45:
        id v10 = (__CFString *)v11;
      }
      else
      {
        int v37 = [v9 maneuverValue];
        uint64_t v45 = [v37 maneuverType];
        id v10 = @"NO_TURN";
        switch((int)v45)
        {
          case 0:
            break;
          case 1:
            id v10 = @"LEFT_TURN";
            break;
          case 2:
            id v10 = @"RIGHT_TURN";
            break;
          case 3:
            id v10 = @"STRAIGHT_AHEAD";
            break;
          case 4:
            id v10 = @"U_TURN";
            break;
          case 5:
            id v10 = @"FOLLOW_ROAD";
            break;
          case 6:
            id v10 = @"ENTER_ROUNDABOUT";
            break;
          case 7:
            id v10 = @"EXIT_ROUNDABOUT";
            break;
          case 11:
            id v10 = @"OFF_RAMP";
            break;
          case 12:
            id v10 = @"ON_RAMP";
            break;
          case 16:
            id v10 = @"ARRIVE_END_OF_NAVIGATION";
            break;
          case 17:
            id v10 = @"START_ROUTE";
            break;
          case 18:
            id v10 = @"ARRIVE_AT_DESTINATION";
            break;
          case 20:
            id v10 = @"KEEP_LEFT";
            break;
          case 21:
            id v10 = @"KEEP_RIGHT";
            break;
          case 22:
            id v10 = @"ENTER_FERRY";
            break;
          case 23:
            id v10 = @"EXIT_FERRY";
            break;
          case 24:
            id v10 = @"CHANGE_FERRY";
            break;
          case 25:
            id v10 = @"START_ROUTE_WITH_U_TURN";
            break;
          case 26:
            id v10 = @"U_TURN_AT_ROUNDABOUT";
            break;
          case 27:
            id v10 = @"LEFT_TURN_AT_END";
            break;
          case 28:
            id v10 = @"RIGHT_TURN_AT_END";
            break;
          case 29:
            id v10 = @"HIGHWAY_OFF_RAMP_LEFT";
            break;
          case 30:
            id v10 = @"HIGHWAY_OFF_RAMP_RIGHT";
            break;
          case 33:
            id v10 = @"ARRIVE_AT_DESTINATION_LEFT";
            break;
          case 34:
            id v10 = @"ARRIVE_AT_DESTINATION_RIGHT";
            break;
          case 35:
            id v10 = @"U_TURN_WHEN_POSSIBLE";
            break;
          case 39:
            id v10 = @"ARRIVE_END_OF_DIRECTIONS";
            break;
          case 41:
            id v10 = @"ROUNDABOUT_EXIT_1";
            break;
          case 42:
            id v10 = @"ROUNDABOUT_EXIT_2";
            break;
          case 43:
            id v10 = @"ROUNDABOUT_EXIT_3";
            break;
          case 44:
            id v10 = @"ROUNDABOUT_EXIT_4";
            break;
          case 45:
            id v10 = @"ROUNDABOUT_EXIT_5";
            break;
          case 46:
            id v10 = @"ROUNDABOUT_EXIT_6";
            break;
          case 47:
            id v10 = @"ROUNDABOUT_EXIT_7";
            break;
          case 48:
            id v10 = @"ROUNDABOUT_EXIT_8";
            break;
          case 49:
            id v10 = @"ROUNDABOUT_EXIT_9";
            break;
          case 50:
            id v10 = @"ROUNDABOUT_EXIT_10";
            break;
          case 51:
            id v10 = @"ROUNDABOUT_EXIT_11";
            break;
          case 52:
            id v10 = @"ROUNDABOUT_EXIT_12";
            break;
          case 53:
            id v10 = @"ROUNDABOUT_EXIT_13";
            break;
          case 54:
            id v10 = @"ROUNDABOUT_EXIT_14";
            break;
          case 55:
            id v10 = @"ROUNDABOUT_EXIT_15";
            break;
          case 56:
            id v10 = @"ROUNDABOUT_EXIT_16";
            break;
          case 57:
            id v10 = @"ROUNDABOUT_EXIT_17";
            break;
          case 58:
            id v10 = @"ROUNDABOUT_EXIT_18";
            break;
          case 59:
            id v10 = @"ROUNDABOUT_EXIT_19";
            break;
          case 60:
            id v10 = @"SHARP_LEFT_TURN";
            break;
          case 61:
            id v10 = @"SHARP_RIGHT_TURN";
            break;
          case 62:
            id v10 = @"SLIGHT_LEFT_TURN";
            break;
          case 63:
            id v10 = @"SLIGHT_RIGHT_TURN";
            break;
          case 64:
            id v10 = @"CHANGE_HIGHWAY";
            break;
          case 65:
            id v10 = @"CHANGE_HIGHWAY_LEFT";
            break;
          case 66:
            id v10 = @"CHANGE_HIGHWAY_RIGHT";
            break;
          case 80:
            id v10 = @"TOLL_STATION";
            break;
          case 81:
            id v10 = @"ENTER_TUNNEL";
            break;
          case 82:
            id v10 = @"WAYPOINT_STOP";
            break;
          case 83:
            id v10 = @"WAYPOINT_STOP_LEFT";
            break;
          case 84:
            id v10 = @"WAYPOINT_STOP_RIGHT";
            break;
          case 85:
            id v10 = @"RESUME_ROUTE";
            break;
          case 86:
            id v10 = @"RESUME_ROUTE_WITH_U_TURN";
            break;
          case 87:
            id v10 = @"CUSTOM";
            break;
          case 88:
            id v10 = @"TURN_AROUND";
            break;
          default:
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v45);
            v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
        }
LABEL_35:
      }
      goto LABEL_46;
    case 16:
      id v10 = [v9 numberData];

      if (!v10) {
        goto LABEL_46;
      }
      int v30 = [v9 numberData];
      [v30 value];
      double v47 = v46;
      uint64_t v33 = [MEMORY[0x1E4F291F0] kilowatts];
      uint64_t v34 = objc_msgSend(a1, "_navigation_stringForPower:unit:", v33, v47);
      goto LABEL_41;
    default:
      goto LABEL_46;
  }
}

+ (_TempToken)_navigation_overridenTokenForToken:()FormatExtras overrideVariables:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 token];
  id v8 = [v6 valueForKey:v7];

  if (v8)
  {
    id v9 = [[_TempToken alloc] initWithToken:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      if ([v10 count])
      {
        uint64_t v11 = [v10 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v13 = [v10 objectAtIndexedSubscript:0];
          uint64_t v14 = v13;
          if (v13) {
            -[_TempToken setValue1:](v9, "setValue1:", [v13 unsignedIntegerValue]);
          }
        }
      }
      if ((unint64_t)[v10 count] >= 2)
      {
        double v15 = [v10 objectAtIndexedSubscript:1];
        objc_opt_class();
        char v16 = objc_opt_isKindOfClass();

        if (v16)
        {
          uint64_t v17 = [v10 objectAtIndexedSubscript:1];
          uint64_t v18 = v17;
          if (v17) {
            -[_TempToken setValue2:](v9, "setValue2:", [v17 unsignedIntegerValue]);
          }
        }
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v8;
        -[_TempToken setValue1:](v9, "setValue1:", [v19 unsignedIntegerValue]);
        [v19 floatValue];
        -[_TempToken setPercentageValue:](v9, "setPercentageValue:");
        id v20 = objc_alloc_init(MEMORY[0x1E4F647A8]);
        [v19 floatValue];
        int v22 = v21;

        LODWORD(v23) = v22;
        [v20 setValue:v23];
        [(_TempToken *)v9 setNumberData:v20];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(_TempToken *)v9 setStringValue:v8];
        }
      }
    }
  }
  else
  {
    id v9 = (_TempToken *)v5;
  }

  return v9;
}

+ (id)_navigation_replacementForFormatToken:()FormatExtras abbreviatedUnits:overrideVariables:detail:spoken:
{
  v9[0] = a4;
  memset(&v9[1], 0, 7);
  uint64_t v10 = a6;
  char v11 = a7;
  memset(v12, 0, sizeof(v12));
  id v7 = objc_msgSend(a1, "_navigation_replacementForFormatToken:options:overrideVariables:", a3, v9);
  return v7;
}

+ (uint64_t)_replaceToken:()FormatExtras composedString:replacement:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    char v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315906;
      uint64_t v18 = "+[NSString(FormatExtras) _replaceToken:composedString:replacement:]";
      __int16 v19 = 2080;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      __int16 v21 = 1024;
      int v22 = 1141;
      __int16 v23 = 2080;
      uint64_t v24 = "tokenString != nil";
      _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v17, 0x26u);
    }
  }
  uint64_t v10 = [v8 rangeOfString:v7];
  char v12 = 1;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v11)
  {
    uint64_t v13 = v10;
    do
    {
      if (v9)
      {
        objc_msgSend(v8, "replaceCharactersInRange:withString:", v13, v11, v9);
      }
      else
      {
        objc_msgSend(v8, "deleteCharactersInRange:", v13, v11);
        char v12 = 0;
      }
      uint64_t v14 = [v8 rangeOfString:v7];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v13 = v14;
    }
    while (v11);
  }

  return v12 & 1;
}

+ (uint64_t)_replaceToken:()FormatExtras composedString:options:overrideVariables:
{
  id v10 = a6;
  id v11 = a4;
  char v12 = objc_msgSend(a1, "_navigation_overridenTokenForToken:overrideVariables:", a3, v10);
  long long v13 = a5[1];
  v19[0] = *a5;
  v19[1] = v13;
  uint64_t v14 = objc_msgSend(NSString, "_navigation_replacementForFormatToken:options:overrideVariables:", v12, v19, v10);

  double v15 = NSString;
  char v16 = [v12 token];
  uint64_t v17 = [v15 _replaceToken:v16 composedString:v11 replacement:v14];

  return v17;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:wrappedOverrideVariables:
{
  long long v5 = a4[1];
  v8[0] = *a4;
  v8[1] = v5;
  id v6 = objc_msgSend(NSString, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:allTokensExpanded:", a3, v8, a5, 0);
  return v6;
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras options:wrappedOverrideVariables:allTokensExpanded:
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v95 = a5;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v9 = [v7 formatStrings];
  v89 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v91 = v7;
  id obj = [v7 formatStrings];
  uint64_t v86 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
  if (v86)
  {
    uint64_t v87 = *(void *)v124;
    int v96 = 1;
    do
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v124 != v87) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v123 + 1) + 8 * i);
        if (objc_msgSend(v11, "length", v84))
        {
          uint64_t v84 = i;
          char v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v11];
          long long v119 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v122 = 0u;
          id v90 = [v91 formatTokens];
          uint64_t v93 = [v90 countByEnumeratingWithState:&v119 objects:v130 count:16];
          if (!v93) {
            goto LABEL_61;
          }
          uint64_t v92 = *(void *)v120;
          v99 = v12;
          while (1)
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v120 != v92) {
                objc_enumerationMutation(v90);
              }
              uint64_t v97 = v13;
              uint64_t v14 = *(void **)(*((void *)&v119 + 1) + 8 * v13);
              v105 = objc_msgSend(v14, "genericCombinations", v84);
              if (!v105)
              {
                __int16 v19 = NSString;
                id v20 = [v95 objectForKeyedSubscript:@"{currentDestination}"];
                long long v21 = a4[1];
                *(_OWORD *)buf = *a4;
                *(_OWORD *)&buf[16] = v21;
                int v22 = [v19 _replaceToken:v14 composedString:v12 options:buf overrideVariables:v20];

                if (v22)
                {
                  int v23 = v96 & v22;
                  goto LABEL_52;
                }
LABEL_53:
                v65 = MNGetMNStringExtrasLog();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  __int16 v66 = [v14 token];
                  *(_DWORD *)buf = 138412802;
                  *(void *)&uint8_t buf[4] = v66;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v91;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)&buf[24] = v95;
                  _os_log_impl(&dword_1B542B000, v65, OS_LOG_TYPE_ERROR, "Error replacing token %@ for string: %@. Overrides: %@", buf, 0x20u);
                }
                int v67 = [v91 alternativeString];
                __int16 v68 = v67;
                if (!v67) {
                  goto LABEL_58;
                }
                v69 = [v67 condition];
                uint64_t v70 = [v69 conditionType];

                if (v70 != 5) {
                  goto LABEL_58;
                }
                v71 = NSString;
                v72 = [v68 formattedString];
                long long v73 = a4[1];
                *(_OWORD *)buf = *a4;
                *(_OWORD *)&buf[16] = v73;
                objc_msgSend(v71, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:", v72, buf, v95);
                id v74 = (id)objc_claimAutoreleasedReturnValue();

                if (!v74)
                {
LABEL_58:

                  int v96 = 0;
                  goto LABEL_59;
                }
                v75 = MNGetMNStringExtrasLog();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v74;
                  _os_log_impl(&dword_1B542B000, v75, OS_LOG_TYPE_DEFAULT, "Replacing string with alternative: \"%@\"", buf, 0xCu);
                }

                if (a6) {
                  *a6 = 0;
                }

LABEL_72:
                goto LABEL_73;
              }
              double v15 = [v14 token];
              char v16 = [v95 objectForKeyedSubscript:v15];

              v94 = [v16 objectForKeyedSubscript:@"{WaypointCategory}"];
              unsigned int v17 = [v94 intValue];
              if (v17 > 0xB)
              {
                uint64_t v18 = 0;
              }
              else
              {
                uint64_t v18 = [MEMORY[0x1E4F1CAD0] setWithArray:*(&off_1E60F69C0 + (int)v17)];
              }
              long long v117 = 0u;
              long long v118 = 0u;
              long long v115 = 0u;
              long long v116 = 0u;
              id v101 = v18;
              uint64_t v104 = [v101 countByEnumeratingWithState:&v115 objects:v129 count:16];
              if (!v104)
              {
                int v25 = 0;
                goto LABEL_50;
              }
              char v24 = 0;
              int v25 = 0;
              v102 = v14;
              uint64_t v103 = *(void *)v116;
LABEL_20:
              uint64_t v26 = 0;
LABEL_21:
              if (*(void *)v116 != v103) {
                objc_enumerationMutation(v101);
              }
              if ((v24 & 1) == 0)
              {
                uint64_t v27 = *(void **)(*((void *)&v115 + 1) + 8 * v26);
                long long v113 = 0u;
                long long v114 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                id v109 = [v105 substitutes];
                uint64_t v28 = [v109 countByEnumeratingWithState:&v111 objects:v128 count:16];
                if (!v28)
                {
                  char v24 = 0;
                  goto LABEL_46;
                }
                uint64_t v29 = v28;
                int v100 = v25;
                uint64_t v106 = v26;
                uint64_t v30 = *(void *)v112;
LABEL_26:
                uint64_t v31 = 0;
                while (1)
                {
                  if (*(void *)v112 != v30) {
                    objc_enumerationMutation(v109);
                  }
                  double v32 = *(void **)(*((void *)&v111 + 1) + 8 * v31);
                  int v33 = [v32 waypointCategory];
                  if (v33 == [v27 intValue])
                  {
                    uint64_t v34 = [v32 substitute];
                    BOOL v35 = [v34 formatArguments];
                    BOOL v36 = [v35 firstObject];

                    if (!v36)
                    {
                      id v47 = objc_alloc(MEMORY[0x1E4F28E78]);
                      __int16 v48 = [v32 substitute];
                      v49 = [v48 formatStrings];
                      long long v50 = [v49 firstObject];
                      long long v51 = (void *)[v47 initWithString:v50];

                      __int16 v52 = NSString;
                      uint64_t v14 = v102;
                      v53 = [v102 token];
                      uint64_t v54 = v52;
                      goto LABEL_45;
                    }
                    int v37 = [v36 stringSubstituteData];
                    int v110 = [v37 stringSubstituteType];
                    if (v16)
                    {
                      v108 = v32;
                      v38 = v16;
                      id v39 = v16;
                      id v40 = [v39 objectForKeyedSubscript:@"{Name}_source"];
                      int v41 = [v39 objectForKeyedSubscript:@"{Address}_source"];
                      id v107 = v39;

                      if ([v40 intValue] == v110)
                      {

                        char v16 = v38;
LABEL_44:
                        id v55 = objc_alloc(MEMORY[0x1E4F28E78]);
                        id v56 = [v108 substitute];
                        v57 = [v56 formatStrings];
                        id v58 = [v57 firstObject];
                        long long v51 = (void *)[v55 initWithString:v58];

                        v59 = NSString;
                        int v60 = [v108 substitute];
                        v61 = [v60 formatArguments];
                        v62 = [v61 firstObject];
                        long long v63 = a4[1];
                        *(_OWORD *)buf = *a4;
                        *(_OWORD *)&buf[16] = v63;
                        [v59 _replaceToken:v62 composedString:v51 options:buf overrideVariables:v107];

                        __int16 v64 = NSString;
                        uint64_t v14 = v102;
                        v53 = [v102 token];
                        uint64_t v54 = v64;
LABEL_45:
                        char v12 = v99;
                        int v25 = [v54 _replaceToken:v53 composedString:v99 replacement:v51];

                        char v24 = 1;
                        uint64_t v26 = v106;
                        goto LABEL_46;
                      }
                      uint64_t v42 = v30;
                      double v43 = v36;
                      v44 = v27;
                      int v45 = [v41 intValue];

                      BOOL v46 = v45 == v110;
                      uint64_t v27 = v44;
                      BOOL v36 = v43;
                      uint64_t v30 = v42;
                      char v16 = v38;
                      if (v46) {
                        goto LABEL_44;
                      }
                    }
                    else
                    {
                    }
                  }
                  if (v29 == ++v31)
                  {
                    uint64_t v29 = [v109 countByEnumeratingWithState:&v111 objects:v128 count:16];
                    if (v29) {
                      goto LABEL_26;
                    }
                    char v24 = 0;
                    char v12 = v99;
                    uint64_t v14 = v102;
                    uint64_t v26 = v106;
                    int v25 = v100;
LABEL_46:

                    if (++v26 == v104)
                    {
                      uint64_t v104 = [v101 countByEnumeratingWithState:&v115 objects:v129 count:16];
                      if (!v104) {
                        break;
                      }
                      goto LABEL_20;
                    }
                    goto LABEL_21;
                  }
                }
              }
LABEL_50:

              if ((v25 & 1) == 0) {
                goto LABEL_53;
              }
              int v23 = v96 & v25;
LABEL_52:
              int v96 = v23;
LABEL_59:

              uint64_t v13 = v97 + 1;
            }
            while (v97 + 1 != v93);
            uint64_t v93 = [v90 countByEnumeratingWithState:&v119 objects:v130 count:16];
            if (!v93)
            {
LABEL_61:

              if ([v12 length]) {
                [v89 addObject:v12];
              }

              uint64_t i = v84;
              break;
            }
          }
        }
      }
      uint64_t v86 = [obj countByEnumeratingWithState:&v123 objects:v131 count:16];
    }
    while (v86);
  }
  else
  {
    LOBYTE(v96) = 1;
  }

  id v74 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v77 = v89;
  if ([v89 count])
  {
    unint64_t v78 = 0;
    do
    {
      v79 = objc_msgSend(v77, "objectAtIndexedSubscript:", v78, v84);
      [v74 appendString:v79];
      if (v78 < [v77 count] - 1)
      {
        v80 = [v91 separators];
        v81 = &stru_1F0E08010;
        if (v78 < [v80 count])
        {
          v82 = [v91 separators];
          v81 = [v82 objectAtIndexedSubscript:v78];
        }
        [v74 appendString:v81];
      }
      ++v78;
      v77 = v89;
    }
    while (v78 < [v89 count]);
  }
  if (a6) {
    *a6 = v96 & 1;
  }
  if ((v96 & 1) == 0)
  {
    v83 = MNGetMNStringExtrasLog();
    id obj = v83;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v74;
      _os_log_impl(&dword_1B542B000, v83, OS_LOG_TYPE_ERROR, "Error replacing all tokens. Resulting string is \"%@\".", buf, 0xCu);
    }
    goto LABEL_72;
  }
LABEL_73:

  return v74;
}

+ (uint64_t)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:wrappedOverrideVariables:
{
  return objc_msgSend(NSString, "_navigation_stringForServerFormattedString:abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:", a3, a4, a5, a6, a7, 0);
}

+ (id)_navigation_stringForServerFormattedString:()FormatExtras abbreviatedUnits:detail:spoken:wrappedOverrideVariables:allTokensExpanded:
{
  v10[0] = a4;
  memset(&v10[1], 0, 7);
  uint64_t v11 = a5;
  char v12 = a6;
  memset(v13, 0, sizeof(v13));
  id v8 = objc_msgSend(a1, "_navigation_stringForServerFormattedString:options:wrappedOverrideVariables:allTokensExpanded:", a3, v10, a7, a8);
  return v8;
}

+ (uint64_t)_navigation_stringWithSeconds:()FormatExtras abbreviated:
{
  return objc_msgSend(a1, "_navigation_stringWithSeconds:andAbbreviationType:", a3, a4);
}

+ (uint64_t)_navigation_stringWithSeconds:()FormatExtras andAbbreviationType:
{
  unint64_t v3 = 60 * (a3 / 0x3C);
  BOOL v4 = a3 == v3;
  unint64_t v5 = v3 + 60;
  if (v4) {
    unint64_t v5 = a3;
  }
  return objc_msgSend(a1, "_navigation_stringWithMinutes:andAbbreviationType:", v5 / 0x3C);
}

+ (id)_navigation_stringWithMinutes:()FormatExtras andAbbreviationType:
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  [v7 setZeroFormattingBehavior:14];
  [v7 setAllowedUnits:112];
  [v7 setMaximumUnitCount:2];
  if (a4 == 2)
  {
    id v10 = [v7 calendar];
    uint64_t v11 = [v10 locale];
    objc_msgSend(v7, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v11));
  }
  else
  {
    if (a4 == 1)
    {
      id v8 = v7;
      uint64_t v9 = 2;
    }
    else
    {
      if (a4) {
        goto LABEL_8;
      }
      id v8 = v7;
      uint64_t v9 = 3;
    }
    [v8 setUnitsStyle:v9];
  }
LABEL_8:
  char v12 = [v7 stringFromTimeInterval:(double)(unint64_t)(60 * a3)];
  if ([v12 length])
  {
    uint64_t v13 = [v12 stringByReplacingOccurrencesOfString:@"," withString:&stru_1F0E08010];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (uint64_t)_navigation_spokenStringWithSeconds:()FormatExtras abbreviated:
{
  return objc_msgSend(a1, "_navigation_spokenStringWithSeconds:andAbbreviationType:", a3, a4);
}

+ (uint64_t)_navigation_spokenStringWithSeconds:()FormatExtras andAbbreviationType:
{
  unint64_t v3 = 60 * (a3 / 0x3C);
  BOOL v4 = a3 == v3;
  unint64_t v5 = v3 + 60;
  if (v4) {
    unint64_t v5 = a3;
  }
  return objc_msgSend(a1, "_navigation_spokenStringWithMinutes:andAbbreviationType:", v5 / 0x3C);
}

+ (id)_navigation_spokenStringWithMinutes:()FormatExtras andAbbreviationType:
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  [v7 setZeroFormattingBehavior:14];
  [v7 setAllowedUnits:112];
  [v7 setMaximumUnitCount:2];
  id v8 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
  uint64_t v9 = [MEMORY[0x1E4F28F80] processInfo];
  int v10 = objc_msgSend(v9, "_navigation_isNavd");

  uint64_t v11 = (void *)MEMORY[0x1E4F1CA20];
  if (v10) {
    +[MNUserOptionsEngine sharedInstance];
  }
  else {
  char v12 = +[MNNavigationService sharedService];
  }
  uint64_t v13 = [v12 currentVoiceLanguage];
  uint64_t v14 = [v11 localeWithLocaleIdentifier:v13];
  [v8 setLocale:v14];

  [v7 setCalendar:v8];
  if (a4 == 2)
  {
    unsigned int v17 = [v7 calendar];
    uint64_t v18 = [v17 locale];
    objc_msgSend(v7, "setUnitsStyle:", objc_msgSend(a1, "_navigation_abbreviatedFromatterUnitsStyleForLocale:", v18));
  }
  else
  {
    if (a4 == 1)
    {
      double v15 = v7;
      uint64_t v16 = 2;
    }
    else
    {
      if (a4) {
        goto LABEL_11;
      }
      double v15 = v7;
      uint64_t v16 = 3;
    }
    [v15 setUnitsStyle:v16];
  }
LABEL_11:
  __int16 v19 = [v7 stringFromTimeInterval:(double)(unint64_t)(60 * a3)];
  if ([v19 length])
  {
    id v20 = [v19 stringByReplacingOccurrencesOfString:@"," withString:&stru_1F0E08010];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

+ (id)_navigation_stringWithTimeStampValues:()FormatExtras options:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v7 = [v5 count];
  if (v7 <= 3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = v7;
  }
  int v60 = [v6 arrayWithCapacity:v8];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  int v10 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v9 setLocale:v10];

  uint64_t v11 = [v9 AMSymbol];
  uint64_t v57 = [v9 PMSymbol];
  if (v11 | v57)
  {
    if (*(unsigned char *)(a4 + 17)) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = (unint64_t)[v5 count] > 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  if (*(unsigned char *)(a4 + 17))
  {
    uint64_t v54 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  }
  else
  {
    uint64_t v54 = 0;
  }
  uint64_t v55 = a4;
  id v56 = (void *)v11;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v5;
  uint64_t v13 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (!v13)
  {
    char v61 = 0;
    uint64_t v58 = 0;
    goto LABEL_47;
  }
  uint64_t v14 = v13;
  char v61 = 0;
  uint64_t v58 = 0;
  uint64_t v15 = *(void *)v64;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v64 != v15) {
        objc_enumerationMutation(obj);
      }
      unsigned int v17 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      uint64_t v18 = [v17 formatPattern];
      uint64_t v19 = [v18 length];

      if (!v19) {
        continue;
      }
      id v20 = [v17 timeZone];
      long long v21 = [v17 formatPattern];
      [v9 setLocalizedDateFormatFromTemplate:v21];

      [v9 setTimeZone:v20];
      int v22 = (void *)MEMORY[0x1E4F1C9C8];
      [v17 timeStamp];
      int v23 = objc_msgSend(v22, "dateWithTimeIntervalSinceReferenceDate:");
      char v24 = [v9 stringFromDate:v23];

      if (!v12)
      {
        BOOL v12 = 0;
        goto LABEL_42;
      }
      if (!v56 || (uint64_t v25 = [v24 rangeOfString:v56], v25 == 0x7FFFFFFFFFFFFFFFLL))
      {
        uint64_t v27 = 0;
LABEL_25:
        unint64_t v31 = v58;
        goto LABEL_26;
      }
      uint64_t v28 = v25;
      if (*(unsigned char *)(v55 + 17))
      {
        uint64_t v29 = objc_msgSend(v24, "stringByReplacingCharactersInRange:withString:", v25, v26, &stru_1F0E08010);
        uint64_t v30 = [v29 stringByTrimmingCharactersInSet:v54];

        uint64_t v27 = 0;
        char v24 = (void *)v30;
        goto LABEL_25;
      }
      uint64_t v27 = (void *)[v56 copy];
      unint64_t v31 = v58;
      v61 |= (v58 | v28) == 0;
      if (v27) {
        goto LABEL_28;
      }
LABEL_26:
      if (!v57 || (uint64_t v32 = [v24 rangeOfString:v57], v32 == 0x7FFFFFFFFFFFFFFFLL))
      {
LABEL_28:
        if (v61) {
          goto LABEL_29;
        }
LABEL_40:
        BOOL v12 = 0;
        uint64_t v34 = v24;
        goto LABEL_41;
      }
      uint64_t v37 = v32;
      if (!*(unsigned char *)(v55 + 17))
      {
        uint64_t v27 = (void *)[(id)v57 copy];
        if (((v31 | v37) == 0) | v61 & 1)
        {
LABEL_29:
          uint64_t v34 = v24;
LABEL_30:
          if (v31 && [v27 isEqualToString:v31])
          {
            uint64_t v35 = [v34 stringByReplacingOccurrencesOfString:v27 withString:&stru_1F0E08010];

            uint64_t v34 = (void *)v35;
          }
          uint64_t v36 = [v27 copy];

          BOOL v12 = 1;
          uint64_t v58 = v36;
          goto LABEL_41;
        }
        goto LABEL_40;
      }
      v38 = objc_msgSend(v24, "stringByReplacingCharactersInRange:withString:", v32, v33, &stru_1F0E08010);
      uint64_t v34 = [v38 stringByTrimmingCharactersInSet:v54];

      uint64_t v27 = 0;
      if (v61) {
        goto LABEL_30;
      }
      BOOL v12 = 0;
LABEL_41:

      char v24 = v34;
      char v61 = v12;
LABEL_42:
      [v60 addObject:v24];
      uint64_t v39 = [v60 count];

      if (v39 == 3) {
        goto LABEL_47;
      }
    }
    uint64_t v14 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
  }
  while (v14);
LABEL_47:

  id v40 = v56;
  if ((unint64_t)[v60 count] <= 1)
  {
    id v41 = [v60 firstObject];
    goto LABEL_53;
  }
  uint64_t v42 = _MNLocalizedStringFromThisBundle(@"timestamp list delimiter");
  double v43 = [v60 componentsJoinedByString:v42];

  if ((v61 & 1) == 0 && !*(unsigned char *)(v55 + 17))
  {
    if ([v56 length] && objc_msgSend((id)v57, "length"))
    {
      [NSString stringWithFormat:@"((\\s*%@)(?=(?:.(?!%@))+(?:(?=%@))))|((\\s*%@)(?=(?:.(?!%@))+(?:(?=%@))))", v56, v57, v56, v57, v56, v57];
    }
    else
    {
      if (![v56 length] && !objc_msgSend((id)v57, "length"))
      {
        id v47 = 0;
        goto LABEL_65;
      }
      uint64_t v45 = [v56 length];
      BOOL v46 = (void *)v57;
      if (v45) {
        BOOL v46 = v56;
      }
      [NSString stringWithFormat:@"(\\s*%@)(?=.*%@)", v46, v46, v50, v51, v52, v53];
    id v47 = };
LABEL_65:
    if ([v47 length])
    {
      uint64_t v62 = 0;
      __int16 v48 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v47 options:0 error:&v62];
      if (!v62)
      {
        uint64_t v49 = objc_msgSend(v48, "stringByReplacingMatchesInString:options:range:withTemplate:", v43, 0, 0, objc_msgSend(v43, "length"), &stru_1F0E08010);

        double v43 = (void *)v49;
      }

      id v40 = v56;
    }
    id v41 = v43;

    goto LABEL_52;
  }
  id v41 = v43;
LABEL_52:

LABEL_53:
  return v41;
}

+ (id)_navigation_stringWithCountdownValue:()FormatExtras inToken:options:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  int v10 = [v7 timestamps];
  uint64_t v50 = a5;
  if (*(double *)(a5 + 24) <= 0.0) {
    [MEMORY[0x1E4F1C9C8] date];
  }
  else {
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  uint64_t v51 = v8;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v61 count:16];
  id v52 = v12;
  if (v13)
  {
    uint64_t v14 = v13;
    char v15 = 0;
    uint64_t v16 = *(void *)v54;
    uint64_t v17 = 2;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = (void *)MEMORY[0x1E4F1C9C8];
        [*(id *)(*((void *)&v53 + 1) + 8 * i) doubleValue];
        id v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        [v20 timeIntervalSinceDate:v11];
        double v22 = v21;
        int IsImminentDepartureTimeInterval = GEOTransitDepartureIsImminentDepartureTimeInterval();
        if (v22 >= 0.0 || IsImminentDepartureTimeInterval != 0)
        {
          if (IsImminentDepartureTimeInterval)
          {
            v17 -= (v15 & 1) == 0;
            char v15 = 1;
          }
          else
          {
            uint64_t v25 = (uint64_t)v22 / 60 <= 1 ? 1 : (uint64_t)v22 / 60;
            uint64_t v26 = objc_msgSend(NSString, "_navigation_formattedStringForInteger:", v25);
            [v9 addObject:v26];

            id v12 = v52;
          }
          if ([v9 count] == v17)
          {

            goto LABEL_25;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v15 = 0;
  }
LABEL_25:

  if (*(unsigned char *)(v50 + 18))
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v28 = [v9 reverseObjectEnumerator];
    uint64_t v29 = [v28 allObjects];
    uint64_t v30 = [v27 arrayWithArray:v29];

    id v12 = v52;
    id v9 = (void *)v30;
  }
  if ((v15 & 1) != 0 && [v9 count])
  {
    uint64_t v31 = 2;
  }
  else
  {
    uint64_t v32 = [v9 count];
    if (v32) {
      uint64_t v31 = 3;
    }
    else {
      uint64_t v31 = 1;
    }
    if (!((v32 != 0) | v15 & 1))
    {
      uint64_t v35 = objc_alloc_init(_TempTokenTimestampValue);
      uint64_t v37 = [v12 lastObject];
      [v37 doubleValue];
      -[_TempTokenTimestampValue setTimeStamp:](v35, "setTimeStamp:");

      [(_TempTokenTimestampValue *)v35 setFormatPattern:@"jjmm"];
      int v60 = v35;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      long long v39 = *(_OWORD *)(v50 + 16);
      *(_OWORD *)buf = *(_OWORD *)v50;
      *(_OWORD *)&buf[16] = v39;
      id v40 = objc_msgSend(a1, "_navigation_stringWithTimeStampValues:options:", v38, buf);
LABEL_42:

      goto LABEL_43;
    }
  }
  uint64_t v33 = [v7 alternativeFormatStringsByType];
  uint64_t v34 = [NSNumber numberWithInteger:v31];
  uint64_t v35 = [v33 objectForKeyedSubscript:v34];

  if (!v35 && [v7 countdownType] != v31)
  {
    id v47 = [NSString stringWithFormat:@"Server did not provide a format string for us to use"];
    __int16 v48 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "+[NSString(FormatExtras) _navigation_stringWithCountdownValue:inToken:options:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/NSString+MNExtras.m";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1959;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = "formatString || value.countdownType == preferredType";
      __int16 v58 = 2112;
      v59 = v47;
      _os_log_impl(&dword_1B542B000, v48, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
  uint64_t v36 = [v7 separator];
  if ([v36 length]) {
    [v7 separator];
  }
  else {
  id v41 = objc_msgSend(a1, "_navigation_commaListDelimiter");
  }
  id v12 = v52;
  uint64_t v42 = [v9 componentsJoinedByString:v41];

  double v43 = NSString;
  v44 = _MNLocalizedStringFromThisBundle(@"FormattedString_Countdownlist_Min_Format");
  id v40 = objc_msgSend(v43, "stringWithFormat:", v44, v42);

  if (v35)
  {
    v38 = [v51 token];
    uint64_t v45 = [(_TempTokenTimestampValue *)v35 stringByReplacingOccurrencesOfString:v38 withString:v40];

    id v40 = (void *)v45;
    goto LABEL_42;
  }
LABEL_43:

  return v40;
}

+ (id)_navigation_commaListDelimiter
{
  return _MNLocalizedStringFromThisBundle(@", ");
}

+ (id)_navigation_formattedStringForPriceValue:()FormatExtras currencyCode:
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a2];
  id v9 = objc_msgSend(a1, "_navigation_formattedStringForPriceValueWithAmount:currencyCode:", v8, v7);

  return v9;
}

+ (uint64_t)_navigation_formattedStringForPriceValueWithAmount:()FormatExtras currencyCode:
{
  return objc_msgSend(a1, "_navigation_formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", a3, a4, 1);
}

+ (id)_navigation_formattedStringForPriceValueWithAmount:()FormatExtras currencyCode:showsCurrencySymbol:
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [v7 isEqualToString:@"CNY"];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v11 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v10 setLocale:v11];

  [v10 setNumberStyle:2];
  if (v9)
  {
    [v10 setMinimumFractionDigits:0];
    [v10 setCurrencyCode:@"CNY"];
    if (a5) {
      id v12 = 0;
    }
    else {
      id v12 = &stru_1F0E08010;
    }
    [v10 setCurrencySymbol:v12];
    uint64_t v13 = [v10 stringFromNumber:v8];

    if (!a5) {
      goto LABEL_13;
    }
    uint64_t v17 = 0;
    id v8 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([￥¥])(\\s*)" options:0 error:&v17];
    if (!v17)
    {
      uint64_t v14 = objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, objc_msgSend(v13, "length"), @"⁠¥");

      uint64_t v13 = (void *)v14;
    }
  }
  else
  {
    [v10 setCurrencyCode:v7];
    if (a5) {
      char v15 = 0;
    }
    else {
      char v15 = &stru_1F0E08010;
    }
    [v10 setCurrencySymbol:v15];
    uint64_t v13 = [v10 stringFromNumber:v8];
  }

LABEL_13:
  return v13;
}

- (__CFString)_navigation_stringByMakingPhonetic
{
  if ([a1 length])
  {
    [NSString stringWithFormat:@"%@%@%@", @"\x1B\\toi=lhp\\", a1, @"\x1B\\toi=orth\\"];
    BOOL v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v2 = &stru_1F0E08010;
  }
  return v2;
}

- (__CFString)_navigation_stringByMarkingAsAddress
{
  if ([a1 length])
  {
    [NSString stringWithFormat:@"%@%@%@", @"\x1B\\tn=address\\", a1, @"\x1B\\tn=nav\\"];
    BOOL v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v2 = &stru_1F0E08010;
  }
  return v2;
}

- (__CFString)_navigation_stringByMarkingAsNavigationText
{
  BOOL v2 = &stru_1F0E08010;
  if ([a1 length])
  {
    int v3 = objc_msgSend(a1, "_navigation_isPrivate");
    id v4 = a1;
    id v5 = v4;
    if (v3)
    {
      id v5 = [v4 substringFromIndex:objc_msgSend(@"[private] ", "length")];
    }
    unint64_t v6 = [v5 length];
    uint64_t v7 = [@"\x1B\\tn=nav\\"" length];
    if (v6 >= [@"\x1B\\tn=normal\\"" length] + v7)
    {
      id v8 = [v5 substringToIndex:objc_msgSend(@"\x1B\\tn=nav\\", "length"")];
      if ([v8 isEqualToString:@"\x1B\\tn=nav\\""])
      {
        int v9 = [v5 substringFromIndex:objc_msgSend(v5, "length") - objc_msgSend(@"\x1B\\tn=normal\\", "length"")];
        int v10 = [v9 isEqualToString:@"\x1B\\tn=normal\\""];

        if (v10)
        {
          uint64_t v11 = (__CFString *)v4;
LABEL_12:
          BOOL v2 = v11;

          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    id v12 = @"[private] ";
    if (!v3) {
      id v12 = &stru_1F0E08010;
    }
    [NSString stringWithFormat:@"%@%@%@%@", v12, @"\x1B\\tn=nav\\", v5, @"\x1B\\tn=normal\\"];
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
LABEL_13:
  return v2;
}

- (__CFString)_navigation_stringByMarkingAsNormalText
{
  if ([a1 length])
  {
    [NSString stringWithFormat:@"%@%@%@", @"\x1B\\tn=normal\\", a1, @"\x1B\\tn=nav\\"];
    BOOL v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v2 = &stru_1F0E08010;
  }
  return v2;
}

- (uint64_t)_navigation_isCJK
{
  uint64_t result = [a1 length];
  if (result)
  {
    if (qword_1EB59C068 != -1) {
      dispatch_once(&qword_1EB59C068, &__block_literal_global_775);
    }
    return [a1 rangeOfCharacterFromSet:qword_1EB59C060] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (id)_navigation_languageDirectionStringWithFormat:()FormatExtras
{
  int v9 = (objc_class *)NSString;
  int v10 = a3;
  uint64_t v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];
  v17.length = [(__CFString *)v10 length];
  v17.location = 0;
  id v12 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v10, v17);

  if ([MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v12] == 2) {
    uint64_t v13 = @"\u200F";
  }
  else {
    uint64_t v13 = @"\u200E";
  }
  uint64_t v14 = [(__CFString *)v13 stringByAppendingString:v11];

  return v14;
}

- (id)_navigation_stripTagsFromSpokenString
{
  uint64_t v5 = 0;
  BOOL v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@".\\\\\\w+=[^\\\\]+\\\\"" options:0 error:&v5];
  int v3 = objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1F0E08010);

  return v3;
}

- (uint64_t)_navigation_stringByMarkingAsPrivateText
{
  return [NSString stringWithFormat:@"%@%@", @"[private] ", a1];
}

- (id)_navigation_stringByStrippingPrivateTag
{
  if (objc_msgSend(a1, "_navigation_isPrivate"))
  {
    id v2 = [a1 stringByReplacingOccurrencesOfString:@"[private] " withString:&stru_1F0E08010];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (uint64_t)_navigation_isPrivate
{
  return [a1 hasPrefix:@"[private] "];
}

- (id)_navigation_stripVariablesFromString
{
  id v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\{\\w+\\}" options:0 error:0];
  int v3 = objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, objc_msgSend(a1, "length"), &stru_1F0E08010);

  return v3;
}

+ (void)_navigation_logMismatchBetweenServerInstruction:()FormatExtras clientInstruction:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = MNGetMNStringExtrasLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138478083;
    id v9 = v5;
    __int16 v10 = 2113;
    id v11 = v6;
    _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Routing service string doesn't match client's expectation:\n  server instruction: '%{private}@'\n  client instruction: '%{private}@'", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)_navigation_containsVariables
{
  id v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\{\\w+\\}" options:0 error:0];
  BOOL v3 = objc_msgSend(v2, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) != 0;

  return v3;
}

+ (uint64_t)_navigation_logIfContainsVariables:()FormatExtras
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v15;
    *(void *)&long long v5 = 138543362;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v3);
        }
        __int16 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "_navigation_containsVariables", v13))
        {
          id v11 = MNGetMNStringExtrasLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v10;
            _os_log_impl(&dword_1B542B000, v11, OS_LOG_TYPE_ERROR, "Instruction contains variables: '%{public}@'", buf, 0xCu);
          }

          char v7 = 1;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

+ (id)_navigation_selectInstructionWithServerString:()FormatExtras isSpoken:clientBlock:
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = NSString;
  v7[0] = v3;
  long long v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  objc_msgSend(v4, "_navigation_logIfContainsVariables:", v5);

  return v3;
}

+ (id)_navigation_selectInstructionWithServerStringArray:()FormatExtras isSpoken:clientBlock:
{
  id v3 = a3;
  objc_msgSend(NSString, "_navigation_logIfContainsVariables:", v3);
  return v3;
}

- (uint64_t)_navigation_distanceLevenshtein:()FormatExtras
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [a1 length];
  unint64_t v6 = [v4 length];
  char v24 = &v23;
  unint64_t v23 = v6 + 1;
  char v7 = (char *)&v23 - ((8 * (v6 + 1 + (v6 + 1) * v5) + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = 0;
  uint64_t v9 = v6;
  uint64_t v25 = v7;
  do
  {
    unint64_t v10 = 0;
    id v11 = (unint64_t *)v7;
    do
    {
      if (v8) {
        unint64_t v12 = 0;
      }
      else {
        unint64_t v12 = v10;
      }
      if (!v10) {
        unint64_t v12 = v8;
      }
      *id v11 = v12;
      ++v10;
      v11 += v6 + 1;
    }
    while (v10 <= v5);
    ++v8;
    v7 += 8;
  }
  while (v8 <= v6);
  if (v6)
  {
    unint64_t v26 = v6;
    uint64_t v27 = v25 + 8;
    for (unint64_t i = 1; i <= v26; ++i)
    {
      if (v5)
      {
        long long v14 = v27;
        for (unint64_t j = 1; j <= v5; ++j)
        {
          int v16 = objc_msgSend(a1, "characterAtIndex:", j - 1, v23, v24);
          int v17 = [v4 characterAtIndex:i - 1];
          unint64_t v18 = *(v14 - 1);
          if (v16 != v17) {
            ++v18;
          }
          unint64_t v19 = *v14 + 1;
          uint64_t v20 = v14[v9];
          if (v19 >= v20 + 1) {
            unint64_t v19 = v20 + 1;
          }
          if (v18 >= v19) {
            unint64_t v18 = v19;
          }
          v14[v9 + 1] = v18;
          long long v14 = (void *)((char *)v14 + v9 * 8 + 8);
        }
      }
      unint64_t v6 = v26;
      ++v27;
    }
  }
  uint64_t v21 = *(void *)&v25[8 * v23 * v5 + 8 * v6];

  return v21;
}

+ (uint64_t)_navigation_abbreviatedFromatterUnitsStyleForLocale:()FormatExtras
{
  id v3 = [a3 languageCode];
  int v4 = [v3 isEqualToString:@"ja"];

  if (v4) {
    return 5;
  }
  else {
    return 1;
  }
}

+ (id)_navigation_stringForPower:()FormatExtras unit:
{
  uint64_t v5 = qword_1EB59C078;
  id v6 = a4;
  if (v5 != -1) {
    dispatch_once(&qword_1EB59C078, &__block_literal_global_793);
  }
  char v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E28]) initWithDoubleValue:v6 unit:a1];

  unint64_t v8 = [(id)qword_1EB59C070 stringFromMeasurement:v7];

  return v8;
}

@end