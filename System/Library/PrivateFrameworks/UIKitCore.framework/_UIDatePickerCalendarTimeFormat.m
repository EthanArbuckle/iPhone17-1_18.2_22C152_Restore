@interface _UIDatePickerCalendarTimeFormat
+ (_UIDatePickerCalendarTimeFormat)formatWithCalendar:(id)a3 locale:(id)a4;
+ (_UIDatePickerCalendarTimeFormat)formatWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5;
- (BOOL)displaysTimeZone;
- (BOOL)forceDoubleDigitHours;
- (BOOL)hasLeadingLiteral;
- (BOOL)hasTrailingLiteral;
- (BOOL)wantsDoubleDigitHours;
- (NSDate)timeZoneReferenceDate;
- (NSLocale)locale;
- (NSNumberFormatter)hourFormatter;
- (NSNumberFormatter)minuteFormatter;
- (NSNumberFormatter)strictHourFormatter;
- (NSString)AMSymbol;
- (NSString)PMSymbol;
- (NSString)extendedHoursFormat;
- (NSString)hourFormat;
- (NSString)timeFormat;
- (NSTimeZone)timeZone;
- (_UIDatePickerCalendarTimeFormat)initWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 forceDoubleDigitHours:(BOOL)a6 displaysTimeZone:(BOOL)a7;
- (_UIDatePickerCalendarTimeFormat)initWithCalendar:(id)a3 locale:(id)a4 forceDoubleDigitHours:(BOOL)a5 displaysTimeZone:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedTimeStringWithHours:(unint64_t)a3 minutes:(unint64_t)a4 isPM:(BOOL)a5;
- (id)localizedTimeStringWithHours:(unint64_t)a3 minutes:(unint64_t)a4 isPM:(BOOL)a5 ranges:(id *)a6;
- (id)withDisplaysTimeZone:(BOOL)a3;
- (id)withForceDoubleDigitHours:(BOOL)a3;
- (id)withTimeZone:(id)a3;
- (int64_t)clock;
- (int64_t)clockLayout;
- (void)setTimeZoneReferenceDate:(id)a3;
@end

@implementation _UIDatePickerCalendarTimeFormat

+ (_UIDatePickerCalendarTimeFormat)formatWithCalendar:(id)a3 locale:(id)a4
{
  return (_UIDatePickerCalendarTimeFormat *)[a1 formatWithCalendar:a3 locale:a4 followsSystemHourCycle:0];
}

+ (_UIDatePickerCalendarTimeFormat)formatWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCalendar:v8 locale:v7 followsSystemHourCycle:v5 forceDoubleDigitHours:0 displaysTimeZone:0];

  return (_UIDatePickerCalendarTimeFormat *)v9;
}

- (_UIDatePickerCalendarTimeFormat)initWithCalendar:(id)a3 locale:(id)a4 forceDoubleDigitHours:(BOOL)a5 displaysTimeZone:(BOOL)a6
{
  return [(_UIDatePickerCalendarTimeFormat *)self initWithCalendar:a3 locale:a4 followsSystemHourCycle:0 forceDoubleDigitHours:a5 displaysTimeZone:a6];
}

- (_UIDatePickerCalendarTimeFormat)initWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 forceDoubleDigitHours:(BOOL)a6 displaysTimeZone:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v95 = a6;
  BOOL v8 = a5;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v114.receiver = self;
  v114.super_class = (Class)_UIDatePickerCalendarTimeFormat;
  v14 = [(_UIDatePickerCalendarTimeFormat *)&v114 init];
  if (!v14) {
    goto LABEL_73;
  }
  v15 = objc_opt_new();
  [v15 setCalendar:v12];
  [v15 setLocale:v13];
  v16 = [v12 timeZone];
  [v15 setTimeZone:v16];

  SEL v89 = a2;
  if (v7)
  {
    uint64_t v17 = [v12 timeZone];
    timeZone = v14->_timeZone;
    v14->_timeZone = (NSTimeZone *)v17;

    objc_storeStrong((id *)&v14->_locale, a4);
    v14->_timeZoneReferenceDate = (NSDate *)(id)[MEMORY[0x1E4F1C9C8] now];
    v19 = @"jm zzz";
  }
  else
  {
    v19 = @"jm";
  }
  int v91 = v8;
  v20 = _UIDatePickerDateFormatFromTemplate(v19, v13, v8);
  [v15 setDateFormat:v20];

  v14->_displaysTimeZone = v7;
  id v97 = v12;
  v21 = (void *)[v12 copy];
  id v96 = v13;
  [v21 setLocale:v13];
  uint64_t v22 = [v21 AMSymbol];
  AMSymbol = v14->_AMSymbol;
  v14->_AMSymbol = (NSString *)v22;

  v92 = v21;
  uint64_t v24 = [v21 PMSymbol];
  PMSymbol = v14->_PMSymbol;
  v94 = v14;
  v14->_PMSymbol = (NSString *)v24;

  v93 = v15;
  v98 = [v15 dateFormat];
  v26 = objc_msgSend(MEMORY[0x1E4F28C10], "_componentsFromFormatString:");
  v27 = objc_opt_new();
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v28 = v26;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v110 objects:v123 count:16];
  uint64_t v30 = *MEMORY[0x1E4F1C380];
  v102 = v28;
  if (!v29)
  {
    id obj = 0;
    uint64_t v104 = -1;
    unint64_t v105 = 0;
    uint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v101 = 0;
    uint64_t v103 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_42;
  }
  uint64_t v31 = v29;
  id obj = 0;
  unint64_t v101 = 0;
  unint64_t v105 = 0;
  uint64_t v32 = *(void *)v111;
  uint64_t v107 = *MEMORY[0x1E4F1C390];
  uint64_t v106 = *MEMORY[0x1E4F1C388];
  uint64_t v104 = -1;
  uint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v103 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v33 = 0;
    uint64_t v109 = v31;
    do
    {
      if (*(void *)v111 != v32) {
        objc_enumerationMutation(v28);
      }
      v34 = *(void **)(*((void *)&v110 + 1) + 8 * v33);
      v35 = objc_msgSend(v34, "objectForKeyedSubscript:", v30, v89);
      int v36 = [v35 BOOLValue];

      if (v36)
      {
        [v27 addObject:v34];
        goto LABEL_34;
      }
      v37 = v27;
      v38 = [v34 objectForKeyedSubscript:v107];
      v39 = [v34 objectForKeyedSubscript:v106];
      uint64_t v40 = [v39 rangeValue];
      unint64_t v42 = v41;

      int v43 = [v38 characterAtIndex:0];
      int v44 = v43;
      if (v43 <= 103)
      {
        switch(v43)
        {
          case 'H':
            id v47 = v38;

            [v37 addObject:v34];
            id obj = v47;
            v27 = v37;
            unint64_t v105 = v42;
            uint64_t v103 = v40;
            uint64_t v46 = 2;
LABEL_30:
            uint64_t v104 = v46;
            break;
          case 'K':
            id v50 = v38;

            [v37 addObject:v34];
            uint64_t v104 = 0;
            unint64_t v105 = v42;
            id obj = v50;
            v27 = v37;
            uint64_t v103 = v40;
            break;
          case 'a':
            v27 = v37;
            [v37 addObject:v34];
            unint64_t v99 = v40;
            break;
          default:
            goto LABEL_25;
        }
      }
      else
      {
        if (v43 <= 108)
        {
          if (v43 == 104)
          {
            id v49 = v38;

            [v37 addObject:v34];
            id obj = v49;
            id v28 = v102;
            v27 = v37;
            unint64_t v105 = v42;
            uint64_t v103 = v40;
            uint64_t v46 = 1;
          }
          else
          {
            if (v43 != 107) {
              goto LABEL_25;
            }
            id v45 = v38;

            [v37 addObject:v34];
            id obj = v45;
            v27 = v37;
            unint64_t v105 = v42;
            uint64_t v103 = v40;
            uint64_t v46 = 3;
          }
          goto LABEL_30;
        }
        if (v43 == 109)
        {
          v27 = v37;
          [v37 addObject:v34];
          uint64_t v100 = v40;
          unint64_t v101 = v42;
        }
        else
        {
          if (v43 != 122)
          {
LABEL_25:
            if (os_variant_has_internal_diagnostics())
            {
              v51 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 67109890;
                int v116 = v44;
                __int16 v117 = 2112;
                v118 = v98;
                __int16 v119 = 2112;
                id v120 = v97;
                __int16 v121 = 2112;
                id v122 = v96;
                _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "Internal UIKit inconsistency: found an unknown character (%C) in a date format. dateFormat: %@; calend"
                  "ar: %@; locale: %@",
                  buf,
                  0x26u);
              }
            }
            else
            {
              v48 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1060) + 8);
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                int v116 = v44;
                __int16 v117 = 2112;
                v118 = v98;
                __int16 v119 = 2112;
                id v120 = v97;
                __int16 v121 = 2112;
                id v122 = v96;
                _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_ERROR, "Internal UIKit inconsistency: found an unknown character (%C) in a date format. dateFormat: %@; calend"
                  "ar: %@; locale: %@",
                  buf,
                  0x26u);
              }
            }
            v27 = v37;
            goto LABEL_33;
          }
          v27 = v37;
          [v37 addObject:v34];
        }
      }
LABEL_33:
      uint64_t v31 = v109;

LABEL_34:
      ++v33;
    }
    while (v31 != v33);
    uint64_t v52 = [v28 countByEnumeratingWithState:&v110 objects:v123 count:16];
    uint64_t v31 = v52;
  }
  while (v52);
LABEL_42:

  v53 = [v27 firstObject];
  v54 = [v53 objectForKeyedSubscript:v30];
  int v55 = [v54 BOOLValue];

  if (v55)
  {
    v56 = [v27 firstObject];
    v57 = __121___UIDatePickerCalendarTimeFormat_initWithCalendar_locale_followsSystemHourCycle_forceDoubleDigitHours_displaysTimeZone___block_invoke(v56, 1);

    v14 = v94;
    if (v57)
    {
      [v27 replaceObjectAtIndex:0 withObject:v57];
      v94->_hasLeadingLiteral = 1;
    }
    else
    {
      [v27 removeObjectAtIndex:0];
    }
    id v13 = v96;
    id v12 = v97;
LABEL_50:
  }
  else
  {
    v58 = [v27 lastObject];
    v59 = [v58 objectForKeyedSubscript:v30];
    int v60 = [v59 BOOLValue];

    id v13 = v96;
    id v12 = v97;
    v14 = v94;
    if (v60)
    {
      v61 = [v27 lastObject];
      v57 = __121___UIDatePickerCalendarTimeFormat_initWithCalendar_locale_followsSystemHourCycle_forceDoubleDigitHours_displaysTimeZone___block_invoke(v61, 0);

      if (v57)
      {
        objc_msgSend(v27, "replaceObjectAtIndex:withObject:", objc_msgSend(v27, "count") - 1, v57);
        v94->_hasTrailingLiteral = 1;
      }
      else
      {
        [v27 removeLastObject];
      }
      goto LABEL_50;
    }
  }
  uint64_t v62 = objc_msgSend(MEMORY[0x1E4F28C10], "_formatStringFromComponents:", v27, v89);
  timeFormat = v14->_timeFormat;
  v14->_timeFormat = (NSString *)v62;

  objc_storeStrong((id *)&v14->_hourFormat, obj);
  v64 = _UIDatePickerDateFormatFromTemplate(obj, v13, v91);
  v65 = _UIDateFormatStripOtherFormatCharacters(v64, [obj characterAtIndex:0]);

  unint64_t v66 = [v65 length];
  if (v66 > [obj length])
  {
    v67 = v14->_timeFormat;
    id v68 = v65;
    v69 = [(NSString *)v67 stringByReplacingOccurrencesOfString:@"'" withString:&stru_1ED0E84C0];
    v70 = [v68 stringByReplacingOccurrencesOfString:@"'" withString:&stru_1ED0E84C0];

    uint64_t v71 = [v69 rangeOfString:v70];
    if (v71 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_storeStrong((id *)&v14->_extendedHoursFormat, v65);
    }
  }
  uint64_t v72 = v104;
  if (v104 == -1)
  {
    v83 = [MEMORY[0x1E4F28B00] currentHandler];
    [v83 handleFailureInMethod:v90 object:v14 file:@"_UIDatePickerCalendarTimeFormat.m" lineNumber:244 description:@"Internal UIKit inconsistency: unable to find the clock format."];

    uint64_t v72 = -1;
  }
  unint64_t v73 = v103;
  if (v103 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v84 = [MEMORY[0x1E4F28B00] currentHandler];
    [v84 handleFailureInMethod:v90 object:v14 file:@"_UIDatePickerCalendarTimeFormat.m" lineNumber:245 description:@"Internal UIKit inconsistency: unable to find an hour format."];

    unint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v72 = v104;
  }
  if (v100 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v85 = [MEMORY[0x1E4F28B00] currentHandler];
    [v85 handleFailureInMethod:v90 object:v14 file:@"_UIDatePickerCalendarTimeFormat.m" lineNumber:246 description:@"Internal UIKit inconsistency: unable to find a minute format."];

    unint64_t v73 = v103;
    uint64_t v72 = v104;
  }
  BOOL v74 = v95;
  if (v99 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14->_clockLayout = 0;
  }
  else
  {
    if (v99 >= v73) {
      uint64_t v75 = 1;
    }
    else {
      uint64_t v75 = 2;
    }
    v14->_clockLayout = v75;
  }
  v14->_wantsDoubleDigitHours = v105 > 1;
  v14->_forceDoubleDigitHours = v95;
  v14->_clock = v72;
  if (os_variant_has_internal_diagnostics())
  {
    if (v105 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v86 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109890;
        int v116 = v105;
        __int16 v117 = 2112;
        v118 = v98;
        __int16 v119 = 2112;
        id v120 = v97;
        __int16 v121 = 2112;
        id v122 = v96;
        _os_log_fault_impl(&dword_1853B0000, v86, OS_LOG_TYPE_FAULT, "Date format is reported with %d digits for the hour. We can't handle this. dateFormat: %@; calendar: %@; locale: %@",
          buf,
          0x26u);
      }

      id v13 = v96;
      id v12 = v97;
      v14 = v94;
      BOOL v74 = v95;
    }
  }
  else if (v105 - 3 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v87 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260900) + 8);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      int v116 = v105;
      __int16 v117 = 2112;
      v118 = v98;
      __int16 v119 = 2112;
      id v120 = v12;
      __int16 v121 = 2112;
      id v122 = v13;
      _os_log_impl(&dword_1853B0000, v87, OS_LOG_TYPE_ERROR, "Date format is reported with %d digits for the hour. We can't handle this. dateFormat: %@; calendar: %@; locale: %@",
        buf,
        0x26u);
    }
  }
  v76 = (NSNumberFormatter *)objc_opt_new();
  [(NSNumberFormatter *)v76 setLocale:v13];
  [(NSNumberFormatter *)v76 setMaximumFractionDigits:0];
  [(NSNumberFormatter *)v76 setMinimumIntegerDigits:v105];
  objc_storeStrong((id *)&v14->_strictHourFormatter, v76);
  if (v74 && [(NSNumberFormatter *)v76 minimumIntegerDigits] <= 1)
  {
    v77 = (NSNumberFormatter *)[(NSNumberFormatter *)v76 copy];

    [(NSNumberFormatter *)v77 setMinimumIntegerDigits:2];
    v76 = v77;
  }
  hourFormatter = v14->_hourFormatter;
  v14->_hourFormatter = v76;
  v79 = v76;

  v80 = (NSNumberFormatter *)objc_opt_new();
  [(NSNumberFormatter *)v80 setLocale:v13];
  [(NSNumberFormatter *)v80 setMinimumIntegerDigits:v101];
  [(NSNumberFormatter *)v80 setMaximumFractionDigits:0];
  minuteFormatter = v14->_minuteFormatter;
  v14->_minuteFormatter = v80;

LABEL_73:
  return v14;
}

- (id)localizedTimeStringWithHours:(unint64_t)a3 minutes:(unint64_t)a4 isPM:(BOOL)a5 ranges:(id *)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = 0x1E4F28000uLL;
  BOOL v8 = objc_opt_new();
  [MEMORY[0x1E4F28C10] _componentsFromFormatString:self->_timeFormat];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (!v9)
  {
    NSUInteger v72 = 0;
    NSUInteger v39 = 0;
    NSUInteger v67 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v68 = 0;
    NSUInteger v41 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_41;
  }
  uint64_t v10 = v9;
  uint64_t v78 = 0;
  NSUInteger v72 = 0;
  NSUInteger v68 = 0;
  uint64_t v11 = *(void *)v84;
  uint64_t v12 = *MEMORY[0x1E4F1C380];
  uint64_t v76 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = *MEMORY[0x1E4F1C390];
  uint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v67 = 0x7FFFFFFFFFFFFFFFLL;
  v80 = self;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v84 != v11) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v83 + 1) + 8 * v14);
      v16 = [v15 objectForKeyedSubscript:v12];
      int v17 = [v16 BOOLValue];

      v18 = [v15 objectForKeyedSubscript:v13];
      v19 = v18;
      if (v17)
      {
        [v8 appendString:v18];
        goto LABEL_21;
      }
      int v20 = [v18 characterAtIndex:0];
      unsigned int v21 = v20;
      if (v20 <= 103)
      {
        if (v20 == 72 || v20 == 75) {
          goto LABEL_18;
        }
        if (v20 != 97) {
          goto LABEL_31;
        }
        if (a5) {
          [(_UIDatePickerCalendarTimeFormat *)self PMSymbol];
        }
        else {
        v37 = [(_UIDatePickerCalendarTimeFormat *)self AMSymbol];
        }
        if (v37)
        {
          NSUInteger v67 = [v8 length];
          NSUInteger v68 = [v37 length];
          [v8 appendString:v37];
        }
      }
      else
      {
        if (v20 <= 108)
        {
          if (v20 == 104 || v20 == 107)
          {
LABEL_18:
            uint64_t v22 = [(_UIDatePickerCalendarTimeFormat *)self hourFormatter];
            v23 = [NSNumber numberWithUnsignedInteger:a3];
            uint64_t v24 = [v22 stringFromNumber:v23];

            uint64_t v76 = [v8 length];
            uint64_t v78 = [v24 length];
            [v8 appendString:v24];
          }
          else
          {
LABEL_31:
            uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v80, @"_UIDatePickerCalendarTimeFormat.m", 335, @"Internal UIKit inconsistency: unknown character in format string: %C; dateFormat: %@",
              v21,
              v80->_timeFormat);
          }

LABEL_20:
          self = v80;
          goto LABEL_21;
        }
        if (v20 == 109)
        {
          v34 = [(_UIDatePickerCalendarTimeFormat *)self minuteFormatter];
          v35 = [NSNumber numberWithUnsignedInteger:a4];
          int v36 = [v34 stringFromNumber:v35];

          self = v80;
          uint64_t v73 = [v8 length];
          NSUInteger v72 = [v36 length];
          [v8 appendString:v36];
        }
        else
        {
          if (v20 != 122) {
            goto LABEL_31;
          }
          if ([(_UIDatePickerCalendarTimeFormat *)self displaysTimeZone])
          {
            [(_UIDatePickerCalendarTimeFormat *)self timeZone];
            v26 = v25 = self;

            if (v26)
            {
              v27 = [(_UIDatePickerCalendarTimeFormat *)v25 timeZone];
              id v28 = [(_UIDatePickerCalendarTimeFormat *)v25 timeZoneReferenceDate];
              int v29 = [v27 isDaylightSavingTimeForDate:v28];
              uint64_t v30 = 3;
              if (!v29) {
                uint64_t v30 = 1;
              }
              uint64_t v66 = v30;

              uint64_t v31 = [(_UIDatePickerCalendarTimeFormat *)v25 timeZone];
              uint64_t v32 = [(_UIDatePickerCalendarTimeFormat *)v25 locale];
              uint64_t v33 = [v31 localizedName:v66 locale:v32];

              [v8 appendString:v33];
              goto LABEL_20;
            }
            self = v25;
          }
        }
      }
LABEL_21:

      ++v14;
    }
    while (v10 != v14);
    uint64_t v38 = [obj countByEnumeratingWithState:&v83 objects:v87 count:16];
    uint64_t v10 = v38;
  }
  while (v38);
  NSUInteger v40 = v76;
  NSUInteger v39 = v78;
  NSUInteger v41 = v73;
  unint64_t v7 = 0x1E4F28000;
  if (v76 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_41:
    unint64_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"_UIDatePickerCalendarTimeFormat.m" lineNumber:340 description:@"Internal UIKit inconsistency: unable to replace hour."];

    NSUInteger v40 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v41 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2 object:self file:@"_UIDatePickerCalendarTimeFormat.m" lineNumber:341 description:@"Internal UIKit inconsistency: unable to replace minutes."];
  }
  NSUInteger v43 = v40;
  NSUInteger v44 = v39;
  if (self->_extendedHoursFormat)
  {
    NSUInteger v74 = v41;
    NSUInteger v77 = v40;
    NSUInteger v79 = v39;
    id v45 = objc_msgSend(v8, "substringWithRange:", v40, v39);
    hourFormat = self->_hourFormat;
    id v47 = self->_extendedHoursFormat;
    v48 = hourFormat;
    id v49 = v45;
    uint64_t v50 = [(NSString *)v47 length];
    v81 = v49;
    uint64_t v51 = [v49 length];
    unint64_t v52 = v51 - [(NSString *)v48 length] + v50;
    v53 = [*(id *)(v7 + 3704) stringWithCapacity:v52];
    if (v52)
    {
      char v54 = 0;
      for (unint64_t i = 0; i < v52; ++i)
      {
        uint64_t v56 = [(NSString *)v47 characterAtIndex:i];
        if (v56 == 39)
        {
          v54 ^= 1u;
        }
        else
        {
          uint64_t v57 = v56;
          if ((v54 & 1) != 0
            || (-[NSString substringWithRange:](v47, "substringWithRange:", i, [(NSString *)v48 length]),
                v58 = objc_claimAutoreleasedReturnValue(),
                int v59 = [(NSString *)v48 isEqual:v58],
                v58,
                !v59))
          {
            objc_msgSend(v53, "appendFormat:", @"%C", v57);
          }
          else
          {
            [v53 appendString:v81];
            uint64_t v60 = [v81 length];
            char v54 = 0;
            unint64_t i = v60 + i - [(NSString *)v48 length];
          }
        }
      }
    }

    uint64_t v61 = [v8 rangeOfString:v53];
    NSUInteger v40 = v77;
    NSUInteger v39 = v79;
    if (v61 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v43 = v77;
    }
    else {
      NSUInteger v43 = v61;
    }
    if (v61 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v44 = v79;
    }
    else {
      NSUInteger v44 = v62;
    }

    NSUInteger v41 = v74;
  }
  if (a6)
  {
    a6->var0.location = v40;
    a6->var0.length = v39;
    a6->var1.location = v41;
    a6->var1.length = v72;
    a6->var2.location = v67;
    a6->var2.length = v68;
    a6->var3.location = v43;
    a6->var3.length = v44;
  }

  return v8;
}

- (id)localizedTimeStringWithHours:(unint64_t)a3 minutes:(unint64_t)a4 isPM:(BOOL)a5
{
  return [(_UIDatePickerCalendarTimeFormat *)self localizedTimeStringWithHours:a3 minutes:a4 isPM:a5 ranges:0];
}

- (id)withForceDoubleDigitHours:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIDatePickerCalendarTimeFormat *)self forceDoubleDigitHours] == a3)
  {
    BOOL v5 = self;
  }
  else
  {
    BOOL v5 = (_UIDatePickerCalendarTimeFormat *)[(_UIDatePickerCalendarTimeFormat *)self copy];
    v5->_forceDoubleDigitHours = v3;
    v6 = [(_UIDatePickerCalendarTimeFormat *)v5 strictHourFormatter];
    unint64_t v7 = [v6 minimumIntegerDigits];
    if (v3)
    {

      if (v7 > 1) {
        goto LABEL_8;
      }
      v6 = [(_UIDatePickerCalendarTimeFormat *)v5 hourFormatter];
      [v6 setMinimumIntegerDigits:2];
    }
    else
    {
      BOOL v8 = [(_UIDatePickerCalendarTimeFormat *)v5 hourFormatter];
      [v8 setMinimumIntegerDigits:v7];
    }
  }
LABEL_8:
  return v5;
}

- (id)withDisplaysTimeZone:(BOOL)a3
{
  if ([(_UIDatePickerCalendarTimeFormat *)self displaysTimeZone] == a3)
  {
    BOOL v5 = self;
  }
  else
  {
    BOOL v5 = (_UIDatePickerCalendarTimeFormat *)[(_UIDatePickerCalendarTimeFormat *)self copy];
    v5->_displaysTimeZone = a3;
  }
  return v5;
}

- (id)withTimeZone:(id)a3
{
  id v5 = a3;
  v6 = [(_UIDatePickerCalendarTimeFormat *)self timeZone];
  char v7 = [v6 isEqual:v5];

  if (v7)
  {
    BOOL v8 = self;
  }
  else
  {
    BOOL v8 = (_UIDatePickerCalendarTimeFormat *)[(_UIDatePickerCalendarTimeFormat *)self copy];
    objc_storeStrong((id *)&v8->_timeZone, a3);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(_UIDatePickerCalendarTimeFormat *)self timeFormat];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(_UIDatePickerCalendarTimeFormat *)self hourFormat];
  BOOL v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(_UIDatePickerCalendarTimeFormat *)self AMSymbol];
  uint64_t v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(_UIDatePickerCalendarTimeFormat *)self PMSymbol];
  uint64_t v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  *(unsigned char *)(v4 + 8) = [(_UIDatePickerCalendarTimeFormat *)self wantsDoubleDigitHours];
  *(unsigned char *)(v4 + 9) = [(_UIDatePickerCalendarTimeFormat *)self forceDoubleDigitHours];
  *(void *)(v4 + 48) = [(_UIDatePickerCalendarTimeFormat *)self clock];
  *(void *)(v4 + 56) = [(_UIDatePickerCalendarTimeFormat *)self clockLayout];
  *(unsigned char *)(v4 + 10) = [(_UIDatePickerCalendarTimeFormat *)self hasLeadingLiteral];
  *(unsigned char *)(v4 + 11) = [(_UIDatePickerCalendarTimeFormat *)self hasTrailingLiteral];
  uint64_t v13 = [(_UIDatePickerCalendarTimeFormat *)self hourFormatter];
  uint64_t v14 = [v13 copy];
  v15 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v14;

  v16 = [(_UIDatePickerCalendarTimeFormat *)self minuteFormatter];
  uint64_t v17 = [v16 copy];
  v18 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v17;

  v19 = [(_UIDatePickerCalendarTimeFormat *)self strictHourFormatter];
  uint64_t v20 = [v19 copy];
  unsigned int v21 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v20;

  uint64_t v22 = [(_UIDatePickerCalendarTimeFormat *)self timeZone];
  v23 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v22;

  uint64_t v24 = [(_UIDatePickerCalendarTimeFormat *)self locale];
  v25 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = v24;

  *(unsigned char *)(v4 + 12) = [(_UIDatePickerCalendarTimeFormat *)self displaysTimeZone];
  *(void *)(v4 + 96) = [(_UIDatePickerCalendarTimeFormat *)self timeZoneReferenceDate];
  uint64_t v26 = [(_UIDatePickerCalendarTimeFormat *)self extendedHoursFormat];
  v27 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v26;

  return (id)v4;
}

- (NSString)timeFormat
{
  return self->_timeFormat;
}

- (NSString)hourFormat
{
  return self->_hourFormat;
}

- (NSString)AMSymbol
{
  return self->_AMSymbol;
}

- (NSString)PMSymbol
{
  return self->_PMSymbol;
}

- (BOOL)wantsDoubleDigitHours
{
  return self->_wantsDoubleDigitHours;
}

- (BOOL)forceDoubleDigitHours
{
  return self->_forceDoubleDigitHours;
}

- (int64_t)clock
{
  return self->_clock;
}

- (int64_t)clockLayout
{
  return self->_clockLayout;
}

- (BOOL)hasLeadingLiteral
{
  return self->_hasLeadingLiteral;
}

- (BOOL)hasTrailingLiteral
{
  return self->_hasTrailingLiteral;
}

- (NSNumberFormatter)hourFormatter
{
  return self->_hourFormatter;
}

- (NSNumberFormatter)minuteFormatter
{
  return self->_minuteFormatter;
}

- (NSString)extendedHoursFormat
{
  return self->_extendedHoursFormat;
}

- (NSNumberFormatter)strictHourFormatter
{
  return self->_strictHourFormatter;
}

- (NSDate)timeZoneReferenceDate
{
  return self->_timeZoneReferenceDate;
}

- (void)setTimeZoneReferenceDate:(id)a3
{
  self->_timeZoneReferenceDate = (NSDate *)a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)displaysTimeZone
{
  return self->_displaysTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_strictHourFormatter, 0);
  objc_storeStrong((id *)&self->_extendedHoursFormat, 0);
  objc_storeStrong((id *)&self->_minuteFormatter, 0);
  objc_storeStrong((id *)&self->_hourFormatter, 0);
  objc_storeStrong((id *)&self->_PMSymbol, 0);
  objc_storeStrong((id *)&self->_AMSymbol, 0);
  objc_storeStrong((id *)&self->_hourFormat, 0);
  objc_storeStrong((id *)&self->_timeFormat, 0);
}

@end