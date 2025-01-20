@interface SCRCWebDateTimeParser
+ (SCRCWebDateTimeParser)sharedInstance;
- (SCRCWebDateTimeParser)init;
- (id)_cachedDateFormatterForFormat:(id)a3;
- (id)_expressionForRule:(id)a3;
- (id)_handleDatesAndTimes:(id)a3;
- (id)_handleDuration:(id)a3;
- (id)_handleTimes:(id)a3;
- (id)spokenStringForDateTimeAttribute:(id)a3;
@end

@implementation SCRCWebDateTimeParser

+ (SCRCWebDateTimeParser)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_Parser;
  return (SCRCWebDateTimeParser *)v2;
}

uint64_t __39__SCRCWebDateTimeParser_sharedInstance__block_invoke()
{
  sharedInstance_Parser = objc_alloc_init(SCRCWebDateTimeParser);
  return MEMORY[0x270F9A758]();
}

- (SCRCWebDateTimeParser)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCRCWebDateTimeParser;
  v2 = [(SCRCWebDateTimeParser *)&v8 init];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  expressions = v2->_expressions;
  v2->_expressions = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  dateFormats = v2->_dateFormats;
  v2->_dateFormats = v5;

  return v2;
}

- (id)_cachedDateFormatterForFormat:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_dateFormats objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08790]);
    v6 = (void *)MEMORY[0x263F08790];
    v7 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    objc_super v8 = [v6 dateFormatFromTemplate:v4 options:0 locale:v7];

    [v5 setDateFormat:v8];
    [(NSMutableDictionary *)self->_dateFormats setObject:v5 forKeyedSubscript:v4];
  }
  return v5;
}

- (id)_expressionForRule:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_expressions objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v13 = 0;
    id v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v4 options:1 error:&v13];
    id v7 = v13;
    if (v7)
    {
      objc_super v8 = SCRParserLog;
      if (!SCRParserLog)
      {
        os_log_t v9 = os_log_create("com.apple.Accessibility", "SCRCParser");
        v10 = (void *)SCRParserLog;
        SCRParserLog = (uint64_t)v9;

        objc_super v8 = SCRParserLog;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_21C00A000, v8, OS_LOG_TYPE_INFO, "Could not create rule: %@ %@", buf, 0x16u);
      }
    }
    if (v6)
    {
      [(NSMutableDictionary *)self->_expressions setObject:v6 forKeyedSubscript:v4];
      id v11 = v6;
    }
  }
  return v6;
}

- (id)_handleDuration:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 hasPrefix:@"P"])
  {
    id v5 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"([\\d]+[DHMS])"];
    id v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    if ([v6 count])
    {
      v24 = v6;
      v25 = v5;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        double v11 = 0.0;
        while (1)
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v12), "range", v24, v25, (void)v26);
            id v15 = objc_msgSend(v4, "substringWithRange:", v13, v14);
            if ([v15 hasSuffix:@"S"])
            {
              __int16 v16 = [v15 stringByReplacingOccurrencesOfString:@"S" withString:&stru_26CC25790];
              uint64_t v17 = [v16 integerValue];
LABEL_17:
              double v11 = v11 + (double)v17;

              goto LABEL_18;
            }
            if ([v15 hasSuffix:@"M"])
            {
              __int16 v16 = [v15 stringByReplacingOccurrencesOfString:@"H" withString:&stru_26CC25790];
              uint64_t v17 = 60 * [v16 integerValue];
              goto LABEL_17;
            }
            if ([v15 hasSuffix:@"H"])
            {
              __int16 v16 = [v15 stringByReplacingOccurrencesOfString:@"H" withString:&stru_26CC25790];
              uint64_t v18 = [v16 integerValue];
              uint64_t v19 = 3600;
LABEL_16:
              uint64_t v17 = v18 * v19;
              goto LABEL_17;
            }
            if ([v15 hasSuffix:@"D"])
            {
              __int16 v16 = [v15 stringByReplacingOccurrencesOfString:@"D" withString:&stru_26CC25790];
              uint64_t v18 = [v16 integerValue];
              uint64_t v19 = 86400;
              goto LABEL_16;
            }
LABEL_18:

            ++v12;
          }
          while (v9 != v12);
          uint64_t v20 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
          uint64_t v9 = v20;
          if (!v20) {
            goto LABEL_26;
          }
        }
      }
      double v11 = 0.0;
LABEL_26:

      if ((*(void *)&v11 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        v21 = 0;
      }
      else
      {
        v22 = objc_opt_new();
        [v22 setZeroFormattingBehavior:1];
        [v22 setUnitsStyle:4];
        [v22 setAllowedUnits:240];
        v21 = [v22 stringFromTimeInterval:v11];
      }
      id v6 = v24;
      id v5 = v25;
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_handleTimes:(id)a3
{
  id v4 = a3;
  id v5 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{2}:[\\d]{2})$"];
  id v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  if ([v6 count] == 1) {
    goto LABEL_3;
  }
  id v7 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{2}:[\\d]{2})([+-])([\\d]{2}:[\\d]{2})$"];

  uint64_t v8 = objc_msgSend(v7, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  uint64_t v9 = [v8 count];
  uint64_t v10 = 0;
  id v6 = v8;
  id v5 = v7;
  if (v9 == 1)
  {
LABEL_3:
    double v11 = [v6 firstObject];
    uint64_t v12 = [v11 rangeAtIndex:1];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v43 = 0;
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v14 = objc_msgSend(v4, "substringWithRange:", v12, v13);
      id v15 = [v14 componentsSeparatedByString:@":"];
      __int16 v16 = [v15 firstObject];
      uint64_t v44 = [v16 integerValue];

      uint64_t v17 = [v14 componentsSeparatedByString:@":"];
      uint64_t v18 = [v17 lastObject];
      uint64_t v43 = [v18 integerValue];
    }
    if ((unint64_t)[v11 numberOfRanges] < 3
      || [v11 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v20 = [v11 rangeAtIndex:2];
      uint64_t v19 = objc_msgSend(v4, "substringWithRange:", v20, v21);
    }
    v45 = v5;
    if ((unint64_t)[v11 numberOfRanges] < 4
      || [v11 rangeAtIndex:3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
    }
    else
    {
      if ([v19 isEqualToString:@"-"]) {
        uint64_t v25 = -1;
      }
      else {
        uint64_t v25 = 1;
      }
      uint64_t v26 = [v11 rangeAtIndex:3];
      long long v28 = objc_msgSend(v4, "substringWithRange:", v26, v27);
      long long v29 = [v28 componentsSeparatedByString:@":"];
      v30 = [v29 firstObject];
      uint64_t v42 = [v30 integerValue];

      uint64_t v31 = [v28 componentsSeparatedByString:@":"];
      v32 = [v31 lastObject];
      uint64_t v33 = [v32 integerValue];

      uint64_t v23 = 3600 * v25 * v42;
      uint64_t v24 = 60 * v25 * v33;

      BOOL v22 = v28 != 0;
    }
    v34 = objc_msgSend(MEMORY[0x263EFF8F0], "currentCalendar", v42);
    if (v19 && v22)
    {
      id v35 = objc_alloc(MEMORY[0x263EFF8F0]);
      uint64_t v36 = [v35 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];

      v37 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:@"jjmmazzz"];
      v38 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:v24 + v23];
      [v37 setTimeZone:v38];
      v34 = (void *)v36;
    }
    else
    {
      v37 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:@"jjmma"];
      v38 = 0;
    }
    v39 = objc_opt_new();
    [v39 setHour:v44];
    [v39 setTimeZone:v38];
    [v39 setMinute:v43];
    v40 = [v34 dateFromComponents:v39];
    uint64_t v10 = [v37 stringFromDate:v40];

    id v5 = v45;
  }

  return v10;
}

- (id)_handleDatesAndTimes:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{4})$"];
  id v7 = objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  if ([v7 count] == 1)
  {
    uint64_t v8 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:@"yyyy"];
    objc_msgSend(v5, "setYear:", objc_msgSend(v4, "integerValue"));
LABEL_3:
    uint64_t v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v10 = [v9 dateFromComponents:v5];
    double v11 = [v8 stringFromDate:v10];
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v12 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{4})[-]([\\d]{2})$"];

  uint64_t v13 = objc_msgSend(v12, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  if ([v13 count] == 1)
  {
    uint64_t v14 = [v13 firstObject];
    uint64_t v15 = [v14 numberOfRanges];

    if (v15 == 3)
    {
      uint64_t v8 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:@"MMMMyyyy"];
      __int16 v16 = [v13 objectAtIndexedSubscript:0];
      uint64_t v17 = [v16 rangeAtIndex:1];
      uint64_t v19 = objc_msgSend(v4, "substringWithRange:", v17, v18);
      objc_msgSend(v5, "setYear:", objc_msgSend(v19, "integerValue"));

      uint64_t v20 = [v13 objectAtIndexedSubscript:0];
      uint64_t v21 = [v20 rangeAtIndex:2];
      uint64_t v23 = objc_msgSend(v4, "substringWithRange:", v21, v22);
      objc_msgSend(v5, "setMonth:", objc_msgSend(v23, "integerValue"));

LABEL_16:
      uint64_t v9 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v10 = [v9 dateFromComponents:v5];
      double v11 = [v8 stringFromDate:v10];
      id v7 = v13;
      id v6 = v12;
      goto LABEL_17;
    }
  }
  id v6 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{4})[-]([\\d]{2})[-]([\\d]{2})$"];

  id v7 = objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  if ([v7 count] == 1)
  {
    uint64_t v24 = [v7 firstObject];
    uint64_t v25 = [v24 numberOfRanges];

    if (v25 == 4)
    {
      uint64_t v8 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:@"MMMMdyyyy"];
      uint64_t v26 = [v7 objectAtIndexedSubscript:0];
      uint64_t v27 = [v26 rangeAtIndex:1];
      long long v29 = objc_msgSend(v4, "substringWithRange:", v27, v28);
      objc_msgSend(v5, "setYear:", objc_msgSend(v29, "integerValue"));

      v30 = [v7 objectAtIndexedSubscript:0];
      uint64_t v31 = [v30 rangeAtIndex:2];
      uint64_t v33 = objc_msgSend(v4, "substringWithRange:", v31, v32);
      objc_msgSend(v5, "setMonth:", objc_msgSend(v33, "integerValue"));

      v34 = [v7 objectAtIndexedSubscript:0];
      uint64_t v35 = [v34 rangeAtIndex:3];
      v37 = objc_msgSend(v4, "substringWithRange:", v35, v36);
      objc_msgSend(v5, "setDay:", objc_msgSend(v37, "integerValue"));

      goto LABEL_3;
    }
  }
  v38 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{2})[-]([\\d]{2})$"];

  v39 = objc_msgSend(v38, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  if ([v39 count] == 1)
  {
    v40 = [v39 firstObject];
    uint64_t v41 = [v40 numberOfRanges];

    if (v41 == 3)
    {
      uint64_t v8 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:@"MMMMd"];
      uint64_t v42 = [v39 objectAtIndexedSubscript:0];
      uint64_t v43 = [v42 rangeAtIndex:1];
      v45 = objc_msgSend(v4, "substringWithRange:", v43, v44);
      objc_msgSend(v5, "setMonth:", objc_msgSend(v45, "integerValue"));

      v46 = [v39 objectAtIndexedSubscript:0];
      uint64_t v47 = [v46 rangeAtIndex:2];
      v49 = objc_msgSend(v4, "substringWithRange:", v47, v48);
      objc_msgSend(v5, "setDay:", objc_msgSend(v49, "integerValue"));

      uint64_t v9 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v10 = [v9 dateFromComponents:v5];
      double v11 = [v8 stringFromDate:v10];
      id v7 = v39;
      id v6 = v38;
      goto LABEL_17;
    }
  }
  uint64_t v12 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{4})[-][W]([\\d]{2})$"];

  uint64_t v13 = objc_msgSend(v12, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  if ([v13 count] == 1)
  {
    v50 = [v13 firstObject];
    uint64_t v51 = [v50 numberOfRanges];

    if (v51 == 3)
    {
      uint64_t v8 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:@"MMMMdyyyy"];
      v52 = [v13 objectAtIndexedSubscript:0];
      uint64_t v53 = [v52 rangeAtIndex:1];
      v55 = objc_msgSend(v4, "substringWithRange:", v53, v54);
      objc_msgSend(v5, "setYear:", objc_msgSend(v55, "integerValue"));

      v56 = [v13 objectAtIndexedSubscript:0];
      uint64_t v57 = [v56 rangeAtIndex:2];
      v59 = objc_msgSend(v4, "substringWithRange:", v57, v58);
      objc_msgSend(v5, "setWeekOfYear:", objc_msgSend(v59, "integerValue"));

      [v5 setWeekday:1];
      goto LABEL_16;
    }
  }
  id v6 = [(SCRCWebDateTimeParser *)self _expressionForRule:@"^([\\d]{4})[-]([\\d]{2})[-]([\\d]{2})([T]|\\s{1})([\\d]{2}):([\\d]{2})(:([\\d]{2})(\\.[\\d]+)?)?$"];

  id v7 = objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  if ([v7 count] == 1)
  {
    v61 = [v7 firstObject];
    uint64_t v62 = [v61 numberOfRanges];

    if (v62 == 10)
    {
      uint64_t v9 = [v7 firstObject];
      if ([v9 rangeAtIndex:7] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v63 = @"MMMMdyyyyjjmm";
      }
      else if ([v9 rangeAtIndex:9] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v63 = @"MMMMdyyyyjjmmss";
      }
      else
      {
        v63 = @"MMMMdyyyyjjmmssSSS";
      }
      uint64_t v8 = [(SCRCWebDateTimeParser *)self _cachedDateFormatterForFormat:v63];
      v64 = [v7 objectAtIndexedSubscript:0];
      uint64_t v65 = [v64 rangeAtIndex:1];
      v67 = objc_msgSend(v4, "substringWithRange:", v65, v66);
      objc_msgSend(v5, "setYear:", objc_msgSend(v67, "integerValue"));

      v68 = [v7 objectAtIndexedSubscript:0];
      uint64_t v69 = [v68 rangeAtIndex:2];
      v71 = objc_msgSend(v4, "substringWithRange:", v69, v70);
      objc_msgSend(v5, "setMonth:", objc_msgSend(v71, "integerValue"));

      v72 = [v7 objectAtIndexedSubscript:0];
      uint64_t v73 = [v72 rangeAtIndex:3];
      v75 = objc_msgSend(v4, "substringWithRange:", v73, v74);
      objc_msgSend(v5, "setDay:", objc_msgSend(v75, "integerValue"));

      v76 = [v7 objectAtIndexedSubscript:0];
      uint64_t v77 = [v76 rangeAtIndex:5];
      v79 = objc_msgSend(v4, "substringWithRange:", v77, v78);
      objc_msgSend(v5, "setHour:", objc_msgSend(v79, "integerValue"));

      v80 = [v7 objectAtIndexedSubscript:0];
      uint64_t v81 = [v80 rangeAtIndex:6];
      v83 = objc_msgSend(v4, "substringWithRange:", v81, v82);
      objc_msgSend(v5, "setMinute:", objc_msgSend(v83, "integerValue"));

      if ([v9 rangeAtIndex:7] != 0x7FFFFFFFFFFFFFFFLL)
      {
        v84 = [v7 objectAtIndexedSubscript:0];
        uint64_t v85 = [v84 rangeAtIndex:8];
        v87 = objc_msgSend(v4, "substringWithRange:", v85, v86);
        objc_msgSend(v5, "setSecond:", objc_msgSend(v87, "integerValue"));

        if ([v9 rangeAtIndex:9] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v88 = [v7 objectAtIndexedSubscript:0];
          uint64_t v89 = [v88 rangeAtIndex:9];
          v91 = objc_msgSend(v4, "substringWithRange:", v89, v90);

          v92 = [v91 stringByReplacingOccurrencesOfString:@"." withString:&stru_26CC25790];

          v93 = [v7 objectAtIndexedSubscript:0];
          [v93 rangeAtIndex:9];
          objc_msgSend(v5, "setNanosecond:", (uint64_t)(1000000000.0/ __exp10((double)(unint64_t)(v94 - 1))* (double)objc_msgSend(v92, "integerValue")));
        }
      }
      uint64_t v10 = [MEMORY[0x263EFF8F0] currentCalendar];
      v95 = [v10 dateFromComponents:v5];
      double v11 = [v8 stringFromDate:v95];

      goto LABEL_17;
    }
  }
  double v11 = 0;
LABEL_18:

  return v11;
}

- (id)spokenStringForDateTimeAttribute:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SCRCWebDateTimeParser *)self _handleDuration:v4];
    if (![v5 length])
    {
      uint64_t v6 = [(SCRCWebDateTimeParser *)self _handleTimes:v4];

      id v5 = (void *)v6;
    }
    if (![v5 length])
    {
      uint64_t v7 = [(SCRCWebDateTimeParser *)self _handleDatesAndTimes:v4];

      id v5 = (void *)v7;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormats, 0);
  objc_storeStrong((id *)&self->_expressions, 0);
}

@end