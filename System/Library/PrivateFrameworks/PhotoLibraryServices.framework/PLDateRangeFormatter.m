@interface PLDateRangeFormatter
+ (id)autoupdatingFormatterWithPreset:(int64_t)a3;
- (BOOL)allowUseRelativeDayFormatting;
- (BOOL)allowUseTime;
- (BOOL)useLocalDates;
- (NSLocale)locale;
- (PLDateRangeFormatter)init;
- (PLDateRangeFormatter)initWithPreset:(int64_t)a3;
- (UDateIntervalFormat)_dayOfTheWeekIntervalFormat;
- (UDateIntervalFormat)_differentMonthDayIntervalFormat;
- (UDateIntervalFormat)_differentMonthDayNoYearIntervalFormat;
- (UDateIntervalFormat)_monthDayIntervalFormat;
- (UDateIntervalFormat)_monthDayNoYearIntervalFormat;
- (UDateIntervalFormat)_monthIntervalFormat;
- (UDateIntervalFormat)_monthYearIntervalFormat;
- (UDateIntervalFormat)_timeIntervalFormat;
- (UDateIntervalFormat)_yearIntervalFormat;
- (id)_dayDifferentMonthsTemplate;
- (id)_dayOfTheWeekDateFormatter;
- (id)_dayTemplate;
- (id)_monthDateFormatter;
- (id)_monthYearDateFormatter;
- (id)_relativeDateFormatter;
- (id)_sameDayDateFormatter;
- (id)_sameDayNoYearDateFormatter;
- (id)_sameMonthTemplate;
- (id)_stringFromDate:(id)a3 toDate:(id)a4 currentDate:(id)a5;
- (id)_yearDateFormatter;
- (id)localTimeZone;
- (id)stringFromDate:(id)a3;
- (id)stringFromDate:(id)a3 toDate:(id)a4;
- (id)stringFromDate:(id)a3 toDate:(id)a4 currentDate:(id)a5;
- (int64_t)preset;
- (void)_currentLocaleDidChange:(id)a3;
- (void)_handlePresetDidChange;
- (void)_handleUseLocalDatesDidChange;
- (void)_resetFormatters;
- (void)_significantTimeChange:(id)a3;
- (void)_systemTimeZoneDidChange:(id)a3;
- (void)dealloc;
- (void)setAllowUseRelativeDayFormatting:(BOOL)a3;
- (void)setAllowUseTime:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPreset:(int64_t)a3;
- (void)setUseLocalDates:(BOOL)a3;
@end

@implementation PLDateRangeFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthYearDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthDateFormatter, 0);
  objc_storeStrong((id *)&self->_yearDateFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfTheWeekDateFormatter, 0);
  objc_storeStrong((id *)&self->_sameDayNoYearDateFormatter, 0);
  objc_storeStrong((id *)&self->_sameDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (id)stringFromDate:(id)a3
{
  return [(PLDateRangeFormatter *)self stringFromDate:a3 toDate:0];
}

- (id)stringFromDate:(id)a3 toDate:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 date];
  v10 = [(PLDateRangeFormatter *)self stringFromDate:v8 toDate:v7 currentDate:v9];

  return v10;
}

- (id)stringFromDate:(id)a3 toDate:(id)a4 currentDate:(id)a5
{
  v5 = &stru_1EEB2EB80;
  if (a3 && a5)
  {
    p_lock = &self->_lock;
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    os_unfair_lock_lock(p_lock);
    v5 = [(PLDateRangeFormatter *)self _stringFromDate:v12 toDate:v11 currentDate:v10];

    os_unfair_lock_unlock(p_lock);
  }
  return v5;
}

- (void)setUseLocalDates:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_useLocalDates != v3)
  {
    self->_useLocalDates = v3;
    [(PLDateRangeFormatter *)self _handleUseLocalDatesDidChange];
    [(PLDateRangeFormatter *)self _resetFormatters];
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)useLocalDates
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_useLocalDates;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLocale:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLDateRangeFormatter.m", 1092, @"Invalid parameter not satisfying: %@", @"locale" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  if (([(NSLocale *)self->_locale isEqual:v7] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locale, a3);
    [(PLDateRangeFormatter *)self _resetFormatters];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSLocale)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_locale;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAllowUseRelativeDayFormatting:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowUseRelativeDayFormatting = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowUseRelativeDayFormatting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_allowUseRelativeDayFormatting;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowUseTime:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowUseTime = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowUseTime
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_allowUseTime;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPreset:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_preset != a3)
  {
    self->_preset = a3;
    [(PLDateRangeFormatter *)self _handlePresetDidChange];
    [(PLDateRangeFormatter *)self _resetFormatters];
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)preset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t preset = self->_preset;
  os_unfair_lock_unlock(p_lock);
  return preset;
}

- (id)_stringFromDate:(id)a3 toDate:(id)a4 currentDate:(id)a5
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  v108 = [(PLDateRangeFormatter *)self localTimeZone];
  uint64_t v11 = [v108 secondsFromGMT];
  uint64_t v12 = v11;
  if (self->_useLocalDates)
  {
    uint64_t v13 = [v10 dateByAddingTimeInterval:(double)v11];

    id v10 = (id)v13;
  }
  v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v15 = self->_timeZone;
  [v14 setTimeZone:v15];
  v107 = [v14 components:124 fromDate:v8];
  if (self->_omitYear)
  {
    v105 = 0;
    BOOL v16 = 1;
  }
  else if (self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting)
  {
    v105 = [v14 components:124 fromDate:v10];
    uint64_t v17 = [v105 year];
    BOOL v16 = v17 == [v107 year];
  }
  else
  {
    BOOL v16 = 0;
    v105 = 0;
  }
  uint64_t v18 = [v8 dateByAddingTimeInterval:(double)-v12];
  v19 = (void *)v18;
  if (self->_useLocalDates) {
    v20 = (void *)v18;
  }
  else {
    v20 = v8;
  }
  id v104 = v20;
  if (!v9)
  {
    v106 = 0;
    goto LABEL_44;
  }
  v106 = [v14 components:124 fromDate:v9];
  uint64_t v21 = [v9 dateByAddingTimeInterval:(double)-v12];
  v22 = (void *)v21;
  if (self->_useLocalDates) {
    v23 = (void *)v21;
  }
  else {
    v23 = v9;
  }
  id v102 = v23;
  if (self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting)
  {
    uint64_t v24 = [v107 day];
    if (v24 != [v106 day]
      && _DateIsInThePastNumberOfDays(v8, 6, v15, v108, self->_useLocalDates)
      && _DateIsInThePastNumberOfDays(v9, 6, v15, v108, self->_useLocalDates))
    {
      _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _dayOfTheWeekIntervalFormat], v8, v9);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (!v25) {
        goto LABEL_89;
      }
      char v27 = [v25 isEqualToString:&stru_1EEB2EB80];

      if ((v27 & 1) != 0 || !_DateIsInThePastNumberOfDays(v9, 1, v15, v108, self->_useLocalDates)) {
        goto LABEL_89;
      }
      v28 = [(PLDateRangeFormatter *)self _relativeDateFormatter];
      v100 = [v28 stringFromDate:v102];

      if (self->_useShortDaysInRanges && (unint64_t)[v100 length] > 0xF) {
        goto LABEL_119;
      }
      *(void *)buf = 0;
      v118 = buf;
      uint64_t v119 = 0x3032000000;
      v120 = __Block_byref_object_copy__101169;
      v121 = __Block_byref_object_dispose__101170;
      id v122 = 0;
      v114[0] = MEMORY[0x1E4F143A8];
      v114[1] = 3221225472;
      v114[2] = __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke;
      v114[3] = &unk_1E5872558;
      id v97 = v26;
      id v115 = v97;
      v116 = buf;
      [&unk_1EEBF2330 enumerateObjectsUsingBlock:v114];
      if ([*((id *)v118 + 5) count] != 2)
      {
        v26 = v97;
LABEL_118:

        _Block_object_dispose(buf, 8);
LABEL_119:

        goto LABEL_89;
      }
      v29 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _dayOfTheWeekIntervalFormat], v9, v9);
      v95 = [v29 lowercaseStringWithLocale:self->_locale];

      uint64_t v86 = [v95 length];
      v91 = [*((id *)v118 + 5) objectAtIndexedSubscript:1];
      v30 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v31 = [v91 stringByTrimmingCharactersInSet:v30];

      v92 = [v31 lowercaseStringWithLocale:self->_locale];

      v89 = [v97 lowercaseStringWithLocale:self->_locale];
      int v84 = [v92 isEqualToString:v95];
      if (v84)
      {
        uint64_t v33 = objc_msgSend(v89, "rangeOfString:options:range:", v95, 8, objc_msgSend(v89, "length") - v86);
        uint64_t v34 = 0;
      }
      else
      {
        v82 = [*((id *)v118 + 5) objectAtIndexedSubscript:0];
        v71 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v81 = [v82 stringByTrimmingCharactersInSet:v71];

        if ([v81 isEqualToString:v95])
        {
          uint64_t v33 = objc_msgSend(v89, "rangeOfString:options:range:", v95, 8, 0, v86);
        }
        else
        {
          uint64_t v32 = 0;
          uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v34 = 1;
        v92 = v81;
      }
      if (v33 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v88 = v92;
        v26 = v97;
LABEL_117:

        goto LABEL_118;
      }
      v26 = objc_msgSend(v97, "stringByReplacingCharactersInRange:withString:", v33, v32, v100);

      if (!_DateIsInThePastNumberOfDays(v8, 1, v15, v108, self->_useLocalDates))
      {
        v88 = v92;
        goto LABEL_117;
      }
      v99 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _dayOfTheWeekIntervalFormat], v8, v8);
      v83 = [*((id *)v118 + 5) objectAtIndexedSubscript:v34];
      v72 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v88 = [v83 stringByTrimmingCharactersInSet:v72];

      if ([v88 isEqualToString:v99])
      {
        v73 = v99;
        uint64_t v74 = [v99 length];
        if (v84) {
          uint64_t v75 = 12;
        }
        else {
          uint64_t v75 = 8;
        }
        uint64_t v76 = objc_msgSend(v26, "rangeOfString:options:range:", v99, v75, 0, v74, v81);
        uint64_t v94 = v77;
        uint64_t v85 = v76;
        if (v76 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_115;
        }
        v78 = [(PLDateRangeFormatter *)self _relativeDateFormatter];
        v79 = [v78 stringFromDate:v104];

        uint64_t v80 = objc_msgSend(v26, "stringByReplacingCharactersInRange:withString:", v85, v94, v79);

        v26 = (void *)v80;
      }
      v73 = v99;
LABEL_115:

      goto LABEL_117;
    }
  }
  if (self->_yearOnly)
  {
    uint64_t v35 = [v107 year];
    if (v35 != [v106 year])
    {
      uint64_t v36 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _yearIntervalFormat], v8, v9);
LABEL_88:
      v26 = (void *)v36;
LABEL_89:

      goto LABEL_90;
    }
    goto LABEL_43;
  }
  if (self->_monthOnly)
  {
    uint64_t v37 = [v107 month];
    if (v37 != [v106 month])
    {
      uint64_t v36 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _monthIntervalFormat], v8, v9);
      goto LABEL_88;
    }
    goto LABEL_43;
  }
  if (self->_monthWithDelimiterAndYear)
  {
    uint64_t v38 = [v107 month];
    if (v38 != [v106 month])
    {
      v39 = PLBackendGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_ERROR, "[PLDateRangeFormatter] From and to date months are not equal, which should not happen for month highlight. Cannot get attributed string with UDateIntervalFormat formatter", buf, 2u);
      }

      uint64_t v36 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _monthYearIntervalFormat], v8, v9);
      goto LABEL_88;
    }
    goto LABEL_43;
  }
  if (self->_monthWithYear)
  {
    uint64_t v40 = [v107 month];
    if (v40 != [v106 month])
    {
      uint64_t v36 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _monthYearIntervalFormat], v8, v9);
      goto LABEL_88;
    }
    goto LABEL_43;
  }
  uint64_t v64 = [v107 year];
  if (v64 != [v106 year] || (uint64_t v65 = objc_msgSend(v107, "month"), v65 != objc_msgSend(v106, "month")))
  {
    if (v16) {
      v67 = [(PLDateRangeFormatter *)self _differentMonthDayNoYearIntervalFormat];
    }
    else {
      v67 = [(PLDateRangeFormatter *)self _differentMonthDayIntervalFormat];
    }
    goto LABEL_87;
  }
  uint64_t v66 = [v107 day];
  if (v66 != [v106 day])
  {
    if (v16) {
      v67 = [(PLDateRangeFormatter *)self _monthDayNoYearIntervalFormat];
    }
    else {
      v67 = [(PLDateRangeFormatter *)self _monthDayIntervalFormat];
    }
LABEL_87:
    uint64_t v36 = _FormattedDateWithUDateFormatter((uint64_t)v67, v8, v9);
    goto LABEL_88;
  }
LABEL_43:

LABEL_44:
  if (self->_yearOnly)
  {
    v41 = [(PLDateRangeFormatter *)self _yearDateFormatter];
    uint64_t v42 = [v41 stringFromDate:v8];
LABEL_48:
    v26 = (void *)v42;

    goto LABEL_90;
  }
  if (self->_monthOnly)
  {
    v41 = [(PLDateRangeFormatter *)self _monthDateFormatter];
    uint64_t v42 = [v41 stringFromDate:v8];
    goto LABEL_48;
  }
  if (!self->_monthWithDelimiterAndYear)
  {
    if (self->_monthWithYear)
    {
      v41 = [(PLDateRangeFormatter *)self _monthYearDateFormatter];
      uint64_t v42 = [v41 stringFromDate:v8];
      goto LABEL_48;
    }
    if (self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting)
    {
      if (self->_allowUseTime && self->_useTime)
      {
        uint64_t v59 = [v105 year];
        if (v59 == [v107 year])
        {
          uint64_t v60 = [v105 month];
          if (v60 == [v107 month])
          {
            uint64_t v61 = [v105 day];
            if (v61 == [v107 day])
            {
              if (v9)
              {
                [v9 timeIntervalSinceDate:v8];
                if (fabs(v62) > 900.0)
                {
LABEL_71:
                  uint64_t v63 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _timeIntervalFormat], v8, v9);
LABEL_92:
                  v26 = (void *)v63;
                  goto LABEL_90;
                }
              }
LABEL_91:
              uint64_t v63 = _FormattedDateWithUDateFormatter((uint64_t)[(PLDateRangeFormatter *)self _timeIntervalFormat], v8, v8);
              goto LABEL_92;
            }
          }
        }
      }
      if (_DateIsInThePastNumberOfDays(v8, 1, v15, v108, self->_useLocalDates))
      {
        v41 = [(PLDateRangeFormatter *)self _relativeDateFormatter];
        uint64_t v42 = [v41 stringFromDate:v104];
        goto LABEL_48;
      }
      if (_DateIsInThePastNumberOfDays(v8, 6, v15, v108, self->_useLocalDates))
      {
        v41 = [(PLDateRangeFormatter *)self _dayOfTheWeekDateFormatter];
        uint64_t v42 = [v41 stringFromDate:v8];
        goto LABEL_48;
      }
    }
    else if (self->_timeOnly)
    {
      if (v9)
      {
        [v9 timeIntervalSinceDate:v8];
        if (fabs(v68) > 900.0) {
          goto LABEL_71;
        }
      }
      goto LABEL_91;
    }
    if (v16) {
      [(PLDateRangeFormatter *)self _sameDayNoYearDateFormatter];
    }
    else {
    v41 = [(PLDateRangeFormatter *)self _sameDayDateFormatter];
    }
    uint64_t v42 = [v41 stringFromDate:v8];
    goto LABEL_48;
  }
  v43 = [(PLDateRangeFormatter *)self _monthYearDateFormatter];
  v103 = [v43 _attributedStringWithFieldsFromDate:v8];

  v98 = [v103 string];
  v44 = [(PLDateRangeFormatter *)self _monthDateFormatter];
  v93 = [v44 stringFromDate:v8];

  uint64_t v45 = [v98 localizedStandardRangeOfString:v93];
  uint64_t v47 = v46;
  v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
  uint64_t v49 = *MEMORY[0x1E4F1C378];
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_74;
  v112[3] = &unk_1E5872580;
  id v96 = v48;
  id v113 = v96;
  uint64_t v87 = v47;
  uint64_t v90 = v45;
  objc_msgSend(v103, "enumerateAttribute:inRange:options:usingBlock:", v49, v45, v47, 0, v112);
  v101 = (void *)[v98 mutableCopy];
  *(void *)buf = 0;
  v118 = buf;
  uint64_t v119 = 0x2020000000;
  v120 = 0;
  if ([v96 count] == 1
    && ([v96 anyObject],
        v50 = objc_claimAutoreleasedReturnValue(),
        int v51 = [v50 isEqualToString:@"M"],
        v50,
        v51))
  {
    [v101 insertString:@"" atIndex:v90 + v87];
    [v101 insertString:@"" atIndex:v90];
    *((void *)v118 + 3) += 2;
  }
  else
  {
    uint64_t v52 = [v103 length];
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_2;
    v109[3] = &unk_1E58725A8;
    id v110 = v101;
    v111 = buf;
    objc_msgSend(v103, "enumerateAttribute:inRange:options:usingBlock:", v49, 0, v52, 2, v109);
  }
  v53 = [v101 componentsSeparatedByString:@""];
  uint64_t v54 = [v53 count];
  BOOL v55 = v54 == *((void *)v118 + 3) + 1;

  if (v55)
  {
    id v56 = (id)[v101 copy];
  }
  else
  {
    v57 = PLBackendGetLog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
    {
      v58 = [(NSLocale *)self->_locale localeIdentifier];
      *(_DWORD *)v123 = 138543874;
      v124 = v98;
      __int16 v125 = 2114;
      v126 = v58;
      __int16 v127 = 2114;
      v128 = v101;
      _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_FAULT, "-[PLDateRangeFormatter _stringFromDate:toDate:currentDate:] Failed to retrieve back one or more delimiters we inserted in montYearString \"%{public}@\" using locale: %{public}@. Resulting in \"%{public}@\".", v123, 0x20u);
    }
    id v56 = v98;
  }
  v26 = v56;
  _Block_object_dispose(buf, 8);

LABEL_90:
  id v69 = v26;

  return v69;
}

void __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id obj = [*(id *)(a1 + 32) componentsSeparatedByString:a2];
  if ([obj count] == 2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }
}

uint64_t __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_74(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t __59__PLDateRangeFormatter__stringFromDate_toDate_currentDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [a2 isEqualToString:@"M"];
  if (result)
  {
    [*(id *)(a1 + 32) insertString:@"" atIndex:a3 + a4];
    uint64_t result = [*(id *)(a1 + 32) insertString:@"" atIndex:a3];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += 2;
  }
  return result;
}

- (UDateIntervalFormat)_yearIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_yearIntervalFormat;
  if (!result)
  {
    uint64_t result = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, @"y");
    self->_yearIntervalFormat = result;
  }
  return result;
}

- (UDateIntervalFormat)_monthYearIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_monthYearIntervalFormat;
  if (!result)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    v5 = [NSString stringWithFormat:@"%@ y", v4];
    self->_monthYearIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v5);

    return self->_monthYearIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_monthIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_monthIntervalFormat;
  if (!result)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    self->_monthIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v4);

    return self->_monthIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_timeIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_timeIntervalFormat;
  if (!result)
  {
    v4 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"jm" options:0 locale:self->_locale];
    self->_timeIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v4);

    return self->_timeIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_dayOfTheWeekIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_dayOfTheWeekIntervalFormat;
  if (!result)
  {
    if (self->_useShortDaysInRanges) {
      v4 = @"EEE";
    }
    else {
      v4 = @"EEEE";
    }
    uint64_t result = (UDateIntervalFormat *)_CreateUDateFormatter(self->_locale, self->_timeZone, v4);
    self->_dayOfTheWeekIntervalFormat = result;
  }
  return result;
}

- (UDateIntervalFormat)_differentMonthDayNoYearIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_differentMonthDayNoYearIntervalFormat;
  if (!result)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    v5 = [(PLDateRangeFormatter *)self _dayDifferentMonthsTemplate];
    locale = self->_locale;
    timeZone = self->_timeZone;
    id v8 = [NSString stringWithFormat:@"%@%@", v4, v5];
    self->_differentMonthDayNoYearIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_differentMonthDayNoYearIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_differentMonthDayIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_differentMonthDayIntervalFormat;
  if (!result)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    v5 = [(PLDateRangeFormatter *)self _dayDifferentMonthsTemplate];
    locale = self->_locale;
    timeZone = self->_timeZone;
    id v8 = [NSString stringWithFormat:@"%@%@y", v4, v5];
    self->_differentMonthDayIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_differentMonthDayIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_monthDayNoYearIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_monthDayNoYearIntervalFormat;
  if (!result)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    v5 = [(PLDateRangeFormatter *)self _dayTemplate];
    locale = self->_locale;
    timeZone = self->_timeZone;
    id v8 = [NSString stringWithFormat:@"%@%@", v4, v5];
    self->_monthDayNoYearIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_monthDayNoYearIntervalFormat;
  }
  return result;
}

- (UDateIntervalFormat)_monthDayIntervalFormat
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t result = self->_monthDayIntervalFormat;
  if (!result)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    v5 = [(PLDateRangeFormatter *)self _dayTemplate];
    locale = self->_locale;
    timeZone = self->_timeZone;
    id v8 = [NSString stringWithFormat:@"%@%@y", v4, v5];
    self->_monthDayIntervalFormat = (UDateIntervalFormat *)_CreateUDateFormatter(locale, timeZone, v8);

    return self->_monthDayIntervalFormat;
  }
  return result;
}

- (id)_relativeDateFormatter
{
  os_unfair_lock_assert_owner(&self->_lock);
  relativeDateFormatter = self->_relativeDateFormatter;
  if (!relativeDateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v4 setDateStyle:2];
    [(NSDateFormatter *)v4 setTimeStyle:0];
    BOOL v5 = self->_allowUseRelativeDayFormatting && self->_useRelativeDayFormatting;
    [(NSDateFormatter *)v4 setDoesRelativeDateFormatting:v5];
    [(NSDateFormatter *)v4 setLocale:self->_locale];
    [(NSDateFormatter *)v4 setFormattingContext:4];
    v6 = self->_relativeDateFormatter;
    self->_relativeDateFormatter = v4;

    relativeDateFormatter = self->_relativeDateFormatter;
  }
  return relativeDateFormatter;
}

- (id)_monthYearDateFormatter
{
  os_unfair_lock_assert_owner(&self->_lock);
  monthYearDateFormatter = self->_monthYearDateFormatter;
  if (!monthYearDateFormatter)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    BOOL v5 = [NSString stringWithFormat:@"%@ y", v4];
    v6 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v5 options:0 locale:self->_locale];
    id v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v7 setTimeStyle:0];
    [(NSDateFormatter *)v7 setDateFormat:v6];
    [(NSDateFormatter *)v7 setLocale:self->_locale];
    [(NSDateFormatter *)v7 setTimeZone:self->_timeZone];
    [(NSDateFormatter *)v7 setFormattingContext:4];
    id v8 = self->_monthYearDateFormatter;
    self->_monthYearDateFormatter = v7;

    monthYearDateFormatter = self->_monthYearDateFormatter;
  }
  return monthYearDateFormatter;
}

- (id)_monthDateFormatter
{
  os_unfair_lock_assert_owner(&self->_lock);
  monthDateFormatter = self->_monthDateFormatter;
  if (!monthDateFormatter)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    BOOL v5 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v4 options:0 locale:self->_locale];
    v6 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v6 setTimeStyle:0];
    [(NSDateFormatter *)v6 setDateFormat:v5];
    [(NSDateFormatter *)v6 setLocale:self->_locale];
    [(NSDateFormatter *)v6 setTimeZone:self->_timeZone];
    [(NSDateFormatter *)v6 setFormattingContext:4];
    id v7 = self->_monthDateFormatter;
    self->_monthDateFormatter = v6;

    monthDateFormatter = self->_monthDateFormatter;
  }
  return monthDateFormatter;
}

- (id)_yearDateFormatter
{
  os_unfair_lock_assert_owner(&self->_lock);
  yearDateFormatter = self->_yearDateFormatter;
  if (!yearDateFormatter)
  {
    v4 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"y" options:0 locale:self->_locale];
    BOOL v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v5 setTimeStyle:0];
    [(NSDateFormatter *)v5 setDateFormat:v4];
    [(NSDateFormatter *)v5 setLocale:self->_locale];
    [(NSDateFormatter *)v5 setTimeZone:self->_timeZone];
    [(NSDateFormatter *)v5 setFormattingContext:4];
    v6 = self->_yearDateFormatter;
    self->_yearDateFormatter = v5;

    yearDateFormatter = self->_yearDateFormatter;
  }
  return yearDateFormatter;
}

- (id)_dayOfTheWeekDateFormatter
{
  os_unfair_lock_assert_owner(&self->_lock);
  dayOfTheWeekDateFormatter = self->_dayOfTheWeekDateFormatter;
  if (!dayOfTheWeekDateFormatter)
  {
    v4 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEE" options:0 locale:self->_locale];
    BOOL v5 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v5 setDateStyle:0];
    [(NSDateFormatter *)v5 setTimeStyle:0];
    [(NSDateFormatter *)v5 setDateFormat:v4];
    [(NSDateFormatter *)v5 setLocale:self->_locale];
    [(NSDateFormatter *)v5 setTimeZone:self->_timeZone];
    [(NSDateFormatter *)v5 setFormattingContext:4];
    v6 = self->_dayOfTheWeekDateFormatter;
    self->_dayOfTheWeekDateFormatter = v5;

    dayOfTheWeekDateFormatter = self->_dayOfTheWeekDateFormatter;
  }
  return dayOfTheWeekDateFormatter;
}

- (id)_sameDayNoYearDateFormatter
{
  os_unfair_lock_assert_owner(&self->_lock);
  sameDayNoYearDateFormatter = self->_sameDayNoYearDateFormatter;
  if (!sameDayNoYearDateFormatter)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    BOOL v5 = [(PLDateRangeFormatter *)self _dayTemplate];
    v6 = (void *)MEMORY[0x1E4F28C10];
    id v7 = [NSString stringWithFormat:@"%@%@", v4, v5];
    id v8 = [v6 dateFormatFromTemplate:v7 options:0 locale:self->_locale];

    id v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v9 setTimeStyle:0];
    [(NSDateFormatter *)v9 setDateFormat:v8];
    [(NSDateFormatter *)v9 setLocale:self->_locale];
    [(NSDateFormatter *)v9 setTimeZone:self->_timeZone];
    [(NSDateFormatter *)v9 setFormattingContext:4];
    id v10 = self->_sameDayNoYearDateFormatter;
    self->_sameDayNoYearDateFormatter = v9;

    sameDayNoYearDateFormatter = self->_sameDayNoYearDateFormatter;
  }
  return sameDayNoYearDateFormatter;
}

- (id)_sameDayDateFormatter
{
  os_unfair_lock_assert_owner(&self->_lock);
  sameDayDateFormatter = self->_sameDayDateFormatter;
  if (!sameDayDateFormatter)
  {
    v4 = [(PLDateRangeFormatter *)self _sameMonthTemplate];
    BOOL v5 = [(PLDateRangeFormatter *)self _dayTemplate];
    v6 = (void *)MEMORY[0x1E4F28C10];
    id v7 = [NSString stringWithFormat:@"%@%@y", v4, v5];
    id v8 = [v6 dateFormatFromTemplate:v7 options:0 locale:self->_locale];

    id v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    [(NSDateFormatter *)v9 setTimeStyle:0];
    [(NSDateFormatter *)v9 setDateFormat:v8];
    [(NSDateFormatter *)v9 setLocale:self->_locale];
    [(NSDateFormatter *)v9 setTimeZone:self->_timeZone];
    [(NSDateFormatter *)v9 setFormattingContext:4];
    id v10 = self->_sameDayDateFormatter;
    self->_sameDayDateFormatter = v9;

    sameDayDateFormatter = self->_sameDayDateFormatter;
  }
  return sameDayDateFormatter;
}

- (id)_dayDifferentMonthsTemplate
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v3 = &stru_1EEB2EB80;
  if (self->_includeDayNumbers && self->_includeDayNumbersWhenMonthsDiffer) {
    BOOL v3 = @"d";
  }
  return v3;
}

- (id)_dayTemplate
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_includeDayNumbers) {
    BOOL v3 = @"d";
  }
  else {
    BOOL v3 = &stru_1EEB2EB80;
  }
  return v3;
}

- (id)_sameMonthTemplate
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_useShortMonths) {
    BOOL v3 = @"MMM";
  }
  else {
    BOOL v3 = @"MMMM";
  }
  return v3;
}

- (void)_resetFormatters
{
  sameDayDateFormatter = self->_sameDayDateFormatter;
  self->_sameDayDateFormatter = 0;

  sameDayNoYearDateFormatter = self->_sameDayNoYearDateFormatter;
  self->_sameDayNoYearDateFormatter = 0;

  dayOfTheWeekDateFormatter = self->_dayOfTheWeekDateFormatter;
  self->_dayOfTheWeekDateFormatter = 0;

  yearDateFormatter = self->_yearDateFormatter;
  self->_yearDateFormatter = 0;

  monthDateFormatter = self->_monthDateFormatter;
  self->_monthDateFormatter = 0;

  monthYearDateFormatter = self->_monthYearDateFormatter;
  self->_monthYearDateFormatter = 0;

  relativeDateFormatter = self->_relativeDateFormatter;
  self->_relativeDateFormatter = 0;

  if (self->_monthDayIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthDayIntervalFormat = 0;
  }
  if (self->_monthDayNoYearIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthDayNoYearIntervalFormat = 0;
  }
  if (self->_differentMonthDayIntervalFormat)
  {
    udtitvfmt_close();
    self->_differentMonthDayIntervalFormat = 0;
  }
  if (self->_differentMonthDayNoYearIntervalFormat)
  {
    udtitvfmt_close();
    self->_differentMonthDayNoYearIntervalFormat = 0;
  }
  if (self->_dayOfTheWeekIntervalFormat)
  {
    udtitvfmt_close();
    self->_dayOfTheWeekIntervalFormat = 0;
  }
  if (self->_timeIntervalFormat)
  {
    udtitvfmt_close();
    self->_timeIntervalFormat = 0;
  }
  if (self->_monthIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthIntervalFormat = 0;
  }
  if (self->_monthYearIntervalFormat)
  {
    udtitvfmt_close();
    self->_monthYearIntervalFormat = 0;
  }
  if (self->_yearIntervalFormat)
  {
    udtitvfmt_close();
    self->_yearIntervalFormat = 0;
  }
}

- (id)localTimeZone
{
  return (id)[MEMORY[0x1E4F1CAF0] localTimeZone];
}

- (void)_handleUseLocalDatesDidChange
{
  if (self->_useLocalDates) {
    [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  }
  else {
  BOOL v3 = [(PLDateRangeFormatter *)self localTimeZone];
  }
  timeZone = self->_timeZone;
  self->_timeZone = v3;
}

- (void)_handlePresetDidChange
{
  switch(self->_preset)
  {
    case 0:
      *(_WORD *)&self->_useShortDaysInRanges = 257;
      *(_DWORD *)&self->_includeDayNumbers = 16843009;
      *(_DWORD *)&self->_yearOnly = 0;
      goto LABEL_6;
    case 1:
      *(_WORD *)&self->_useShortDaysInRanges = 257;
      *(_DWORD *)&self->_includeDayNumbers = 16843009;
      *(_DWORD *)&self->_yearOnly = 0x1000000;
      goto LABEL_6;
    case 2:
      *(_WORD *)&self->_includeDayNumbers = 257;
      self->_useRelativeDayFormatting = 1;
      *(void *)&self->_useShortMonths = 0;
      goto LABEL_8;
    case 3:
      *(_WORD *)&self->_includeDayNumbers = 257;
      *(void *)&self->_useRelativeDayFormatting = 0;
LABEL_6:
      *(_WORD *)&self->_monthWithDelimiterAndYear = 0;
      return;
    case 4:
      *(_WORD *)&self->_useShortDaysInRanges = 0;
      *(_DWORD *)&self->_includeDayNumbers = 0;
      self->_yearOnly = 1;
      *(_DWORD *)&self->_monthOnly = 0;
LABEL_8:
      self->_monthWithYear = 0;
      return;
    case 5:
      *(_DWORD *)&self->_useShortMonths = 0;
      *(_DWORD *)&self->_includeDayNumbers = 0;
      self->_monthOnly = 1;
      goto LABEL_11;
    case 6:
      *(void *)&self->_includeDayNumbers = 0x100000001000000;
LABEL_11:
      *(_DWORD *)&self->_timeOnly = 0;
      break;
    case 7:
      *(void *)&self->_includeDayNumbers = 0;
      *(_DWORD *)&self->_timeOnly = 1;
      break;
    case 8:
      *(void *)&self->_includeDayNumbers = 0;
      *(_DWORD *)&self->_timeOnly = 0x10000;
      break;
    case 9:
      *(_DWORD *)&self->_includeDayNumbers = 0x1000000;
      *(void *)&self->_useShortDaysInRanges = 0x1000000000000;
      break;
    case 0xALL:
      *(_DWORD *)&self->_includeDayNumbers = 0x1000000;
      *(_DWORD *)&self->_useShortDaysInRanges = 0;
      *(_DWORD *)&self->_monthOnly = 0;
      self->_monthWithYear = 1;
      break;
    default:
      return;
  }
}

- (void)_significantTimeChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"PLDateRangeFormatterChangedNotification" object:self];
}

- (void)_systemTimeZoneDidChange:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(PLDateRangeFormatter *)self _resetFormatters];
  os_unfair_lock_unlock(p_lock);
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PLDateRangeFormatterChangedNotification" object:self];
}

- (void)_currentLocaleDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale", a3);
  [(PLDateRangeFormatter *)self setLocale:v4];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"PLDateRangeFormatterChangedNotification" object:self];
}

- (void)dealloc
{
  [(PLDateRangeFormatter *)self _resetFormatters];
  v3.receiver = self;
  v3.super_class = (Class)PLDateRangeFormatter;
  [(PLDateRangeFormatter *)&v3 dealloc];
}

- (PLDateRangeFormatter)init
{
  return [(PLDateRangeFormatter *)self initWithPreset:0];
}

- (PLDateRangeFormatter)initWithPreset:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLDateRangeFormatter;
  id v4 = [(PLDateRangeFormatter *)&v9 init];
  id v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_int64_t preset = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    *(_WORD *)&v5->_allowUseTime = 257;
    [(PLDateRangeFormatter *)v5 _handlePresetDidChange];
    [(PLDateRangeFormatter *)v5 _handleUseLocalDatesDidChange];
  }
  return v5;
}

+ (id)autoupdatingFormatterWithPreset:(int64_t)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithPreset:a3];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:v3 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x1E4F1C370] object:0];
  [v4 addObserver:v3 selector:sel__systemTimeZoneDidChange_ name:*MEMORY[0x1E4F1C4F8] object:0];
  [v4 addObserver:v3 selector:sel__significantTimeChange_ name:@"UIApplicationSignificantTimeChangeNotification" object:0];

  return v3;
}

@end