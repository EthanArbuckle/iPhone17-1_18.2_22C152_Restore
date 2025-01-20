@interface QPDataDetectorsParser
- (QPDataDetectorsParser)init;
- (void)_addressFromResult:(id)a3 attributes:(id)a4;
- (void)_currencyFromResult:(id)a3 attributes:(id)a4;
- (void)_emailAddressFromResult:(id)a3 attributes:(id)a4;
- (void)_flightFromResult:(id)a3 attributes:(id)a4;
- (void)_linkFromResult:(id)a3 attributes:(id)a4;
- (void)_phoneNumberDigitsFromResult:(id)a3 attributes:(id)a4;
- (void)_trackingNumberFromResult:(id)a3 attributes:(id)a4;
- (void)enumerateDatesInString:(id)a3 options:(id)a4 withBlock:(id)a5;
- (void)enumerateEntitiesInString:(id)a3 options:(id)a4 withBlock:(id)a5;
@end

@implementation QPDataDetectorsParser

- (QPDataDetectorsParser)init
{
  v8.receiver = self;
  v8.super_class = (Class)QPDataDetectorsParser;
  v2 = [(QPDataDetectorsParser *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F394B8]) initWithScannerType:0 passiveIntent:1];
    config = v2->_config;
    v2->_config = (DDScannerServiceConfiguration *)v3;

    uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-()[]"];
    punctuation = v2->_punctuation;
    v2->_punctuation = (NSCharacterSet *)v5;
  }
  return v2;
}

- (void)_addressFromResult:(id)a3 attributes:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [a3 subResults];
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 type];
        int v12 = [v11 isEqualToString:@"Street"];

        if (v12)
        {
          v13 = [v10 value];
          [v6 setObject:v13 forKey:@"Value"];
        }
        else
        {
          v14 = [v10 type];
          int v15 = [v14 isEqualToString:@"ZipCode"];

          if (!v15) {
            goto LABEL_11;
          }
          v13 = [v10 value];
          [v6 setObject:v13 forKey:@"ZipCode"];
        }

LABEL_11:
        [(QPDataDetectorsParser *)self _addressFromResult:v10 attributes:v6];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)_emailAddressFromResult:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v12 = 0;
  id v13 = 0;
  int v7 = [v5 getMailValue:&v13 label:&v12];
  id v8 = v13;
  id v9 = v12;
  if (v7)
  {
    [v6 setObject:v8 forKey:@"Value"];
    v10 = [v8 componentsSeparatedByString:@"@"];
    v11 = [v10 lastObject];

    if (v11) {
      [v6 setObject:v11 forKey:@"Domain"];
    }
  }
}

- (void)_phoneNumberDigitsFromResult:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  id v23 = 0;
  id v24 = 0;
  int v7 = [a3 getPhoneValue:&v24 label:&v23];
  id v8 = v24;
  id v9 = v23;
  if (v7)
  {
    v10 = [MEMORY[0x263EFEB28] phoneNumberWithStringValue:v8];
    v11 = v10;
    if (v10)
    {
      id v12 = [v10 countryCode];
      if (v12)
      {
        id v13 = (void *)MEMORY[0x263EFEB28];
        v14 = [v11 countryCode];
        int v15 = [v13 dialingCodeForISOCountryCode:v14];
      }
      else
      {
        int v15 = 0;
      }

      v16 = [v11 unformattedInternationalStringValue];
      long long v17 = [v16 stringByRemovingCharactersFromSet:self->_punctuation];

      long long v18 = [v17 stringByRemovingWhitespace];

      uint64_t v19 = 0;
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (v15 && v18) {
        uint64_t v20 = [v18 rangeOfString:v15];
      }
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v21 = v18;
      }
      else
      {
        objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:options:range:", v15, &stru_26D832058, 8, v20, v19);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v22 = v21;
      if (v18) {
        [v6 setObject:v18 forKey:@"Value"];
      }
      if (v22) {
        [v6 setObject:v22 forKey:@"PhoneNumber"];
      }
    }
  }
}

- (void)_flightFromResult:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v12 = 0;
  id v13 = 0;
  int v7 = [v5 getFlightNumber:&v13 airline:&v12];
  id v8 = v13;
  id v9 = v12;
  if (v7)
  {
    v10 = [v5 value];
    [v6 setObject:v10 forKey:@"Value"];

    if (v8)
    {
      if (v9)
      {
        v11 = [NSString stringWithFormat:@"%@%@", v9, v8];
        [v6 setObject:v11 forKey:@"FlightNumber"];
      }
    }
  }
}

- (void)_linkFromResult:(id)a3 attributes:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  id v6 = [v18 type];
  int v7 = [&unk_26D83EB90 containsObject:v6];

  if (v7)
  {
    id v8 = NSURL;
    id v9 = [v18 value];
    v10 = [v8 URLWithString:v9];

    v11 = [v10 host];
    if (v11)
    {
      id v12 = [v10 host];
      int v13 = [v12 containsString:@"."];

      if (v13)
      {
        v14 = [v18 value];

        if (v14)
        {
          int v15 = [v18 value];
          [v5 setObject:v15 forKey:@"Value"];
        }
        v16 = [v10 host];

        if (v16)
        {
          long long v17 = [v10 host];
          [v5 setObject:v17 forKey:@"Domain"];
        }
      }
    }
  }
}

- (void)_trackingNumberFromResult:(id)a3 attributes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v11 = 0;
  id v12 = 0;
  int v7 = [v5 getTrackingNumber:&v12 carrier:&v11];
  id v8 = v12;
  id v9 = v11;
  v10 = v9;
  if (v7 && v8 && v9)
  {
    [v6 setObject:v8 forKey:@"Value"];
    [v6 setObject:v10 forKey:@"Carrier"];
  }
}

- (void)_currencyFromResult:(id)a3 attributes:(id)a4
{
  id v5 = a4;
  id v14 = 0;
  double v15 = 0.0;
  int v6 = [a3 getMoneyAmount:&v15 currency:&v14];
  id v7 = v14;
  if (v7) {
    int v8 = v6;
  }
  else {
    int v8 = 0;
  }
  if (v8 == 1)
  {
    uint64_t CurrencyCode = SICurrenciesGetCurrencyCode();
    if (CurrencyCode)
    {
      v10 = [NSNumber numberWithDouble:v15];
      id v11 = [v10 stringValue];
      [v5 setObject:v11 forKey:@"DECIMAL"];

      id v12 = [NSNumber numberWithLong:CurrencyCode];
      int v13 = [v12 stringValue];
      [v5 setObject:v13 forKey:@"CurrencyUnit"];
    }
  }
}

- (void)enumerateEntitiesInString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v25 = (void (**)(id, void *, uint64_t, uint64_t, id, unsigned char *))a5;
  context = (void *)MEMORY[0x22A624280]();
  id v23 = v7;
  objc_msgSend(MEMORY[0x263F394B0], "scanString:range:configuration:", v7, 0, objc_msgSend(v7, "length"), self->_config);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        uint64_t v12 = [v11 range];
        uint64_t v14 = v13;
        if ([v11 category] == 1)
        {
          id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v16 = [v11 type];
          int v17 = [v16 containsString:@"Email"];

          if (v17)
          {
            id v18 = v15;
            [(QPDataDetectorsParser *)self _emailAddressFromResult:v11 attributes:v15];
          }
          else
          {
            id v18 = v15;
            [(QPDataDetectorsParser *)self _linkFromResult:v11 attributes:v15];
          }
        }
        else if ([v11 category] == 3)
        {
          id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [(QPDataDetectorsParser *)self _addressFromResult:v11 attributes:v18];
        }
        else if ([v11 category] == 2)
        {
          id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          [(QPDataDetectorsParser *)self _phoneNumberDigitsFromResult:v11 attributes:v18];
        }
        else
        {
          [v11 coreResult];
          if ((DDResultHasType() & 1) != 0 || ([v11 coreResult], DDResultHasType()))
          {
            id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            [(QPDataDetectorsParser *)self _flightFromResult:v11 attributes:v18];
          }
          else if ([v11 category] == 6)
          {
            id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            [(QPDataDetectorsParser *)self _currencyFromResult:v11 attributes:v18];
          }
          else if ([v11 category] == 5)
          {
            uint64_t v14 = [v23 length];
            id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            [(QPDataDetectorsParser *)self _trackingNumberFromResult:v11 attributes:v20];
            uint64_t v12 = 0;
            id v18 = v20;
          }
          else
          {
            id v18 = 0;
          }
        }
        if ([v18 count])
        {
          char v26 = 0;
          uint64_t v19 = [v11 type];
          v25[2](v25, v19, v12, v14, v18, &v26);

          if (v26)
          {

            goto LABEL_29;
          }
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v21 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v8 = v21;
    }
    while (v21);
  }
LABEL_29:
}

- (void)enumerateDatesInString:(id)a3 options:(id)a4 withBlock:(id)a5
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v7 = a4;
  v79 = (void (**)(id, void *, uint64_t, uint64_t, char *))a5;
  v78 = v7;
  uint64_t v8 = [v7 objectForKeyedSubscript:kQPQueryParserOptionReferenceCalendarKey];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = v8;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  }
  id v11 = v10;

  uint64_t v12 = [v7 objectForKeyedSubscript:kQPQueryParserOptionLocaleKey];
  uint64_t v13 = v12;
  if (v12)
  {
    id v76 = v12;
  }
  else
  {
    id v76 = [MEMORY[0x263EFF960] currentLocale];
  }

  uint64_t v14 = [v7 objectForKeyedSubscript:kQPQueryParserOptionReferenceDateKey];
  id v15 = v14;
  if (v14)
  {
    id v87 = v14;
  }
  else
  {
    id v87 = [MEMORY[0x263EFF910] now];
  }

  uint64_t v16 = [v7 objectForKeyedSubscript:kQPQueryParserOptionIgnoreFutureDatesKey];
  int v17 = (void *)v16;
  id v18 = (void *)MEMORY[0x263EFFA80];
  if (v16) {
    uint64_t v19 = (void *)v16;
  }
  else {
    uint64_t v19 = (void *)MEMORY[0x263EFFA80];
  }
  id v83 = v19;

  uint64_t v20 = [v78 objectForKeyedSubscript:kQPQueryParserOptionIgnorePastDatesKey];
  uint64_t v21 = (void *)v20;
  if (v20) {
    uint64_t v22 = (void *)v20;
  }
  else {
    uint64_t v22 = v18;
  }
  id v74 = v22;

  uint64_t v23 = [v78 objectForKeyedSubscript:kQPQueryParserOptionResolveDatesInFutureKey];
  id v24 = (void *)v23;
  if (v23) {
    v25 = (void *)v23;
  }
  else {
    v25 = v18;
  }
  id v80 = v25;

  uint64_t v26 = [v78 objectForKeyedSubscript:kQPQueryParserOptionResolveDatesInPastKey];
  long long v27 = (void *)v26;
  if (v26) {
    long long v28 = (void *)v26;
  }
  else {
    long long v28 = v18;
  }
  id v81 = v28;

  id v29 = objc_alloc_init(MEMORY[0x263F08790]);
  [v29 setCalendar:v11];
  [v29 setLocale:v76];
  int v113 = -1;
  int v112 = -1;
  int v111 = -1;
  int v110 = -1;
  int v109 = -1;
  double v30 = MEMORY[0x22A623240](v87);
  CFCalendarDecomposeAbsoluteTime(v11, v30, "dMyEw", &v113, &v112, &v111, &v110, &v109);
  char v108 = 0;
  v82 = v29;
  v75 = [MEMORY[0x263F394B0] scanString:v77];
  if ([v75 count])
  {
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id obj = v75;
    uint64_t v31 = [obj countByEnumeratingWithState:&v104 objects:v121 count:16];
    if (!v31) {
      goto LABEL_99;
    }
    uint64_t v86 = v31;
    uint64_t v85 = *(void *)v105;
    while (1)
    {
      for (uint64_t i = 0; i != v86; ++i)
      {
        if (*(void *)v105 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        char v103 = 0;
        v33 = [MEMORY[0x263EFFA18] localTimeZone];
        id v102 = 0;
        v90 = v32;
        v91 = [v32 dateFromReferenceDate:v87 referenceTimezone:v33 timezoneRef:&v102 allDayRef:&v103];
        id v88 = v102;

        if (v91)
        {
          [v32 coreResult];
          int HasType = DDResultHasType();
          [v32 coreResult];
          if ((DDResultHasType() & 1) == 0)
          {
            [v32 coreResult];
            if ((HasType | DDResultHasType()) != 1) {
              goto LABEL_48;
            }
          }
          unsigned int v101 = -1;
          unsigned int v100 = -1;
          unsigned int v99 = -1;
          unsigned int v98 = -1;
          unsigned int v97 = -1;
          CFAbsoluteTime at = 0.0;
          CFAbsoluteTime at = MEMORY[0x22A623240](v91);
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          v35 = [v32 subResults];
          uint64_t v36 = [v35 countByEnumeratingWithState:&v92 objects:v120 count:16];
          if (!v36) {
            goto LABEL_44;
          }
          uint64_t v37 = *(void *)v93;
          while (1)
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v93 != v37) {
                objc_enumerationMutation(v35);
              }
              v39 = *(void **)(*((void *)&v92 + 1) + 8 * j);
              v40 = [v39 type];
              int v41 = [v40 isEqualToString:@"RelativeDayOfWeek"];

              if (v41)
              {
                CFCalendarDecomposeAbsoluteTime(v11, at, "E", &v98);
                continue;
              }
              v42 = [v39 type];
              if ([v42 isEqualToString:@"RelativeDay"])
              {
              }
              else
              {
                v43 = [v39 type];
                int v44 = [v43 isEqualToString:@"AbsoluteDate"];

                if (!v44) {
                  continue;
                }
              }
              CFCalendarDecomposeAbsoluteTime(v11, at, "dMy", &v101, &v100, &v99);
            }
            uint64_t v36 = [v35 countByEnumeratingWithState:&v92 objects:v120 count:16];
            if (!v36)
            {
LABEL_44:

              int v45 = [v83 BOOLValue];
              if (at > v30) {
                int v46 = v45;
              }
              else {
                int v46 = 0;
              }
              if (v46 == 1)
              {
LABEL_48:
                v47 = v91;
                goto LABEL_85;
              }
              if (objc_msgSend(v81, "BOOLValue", at) && (double v48 = at, at > v30))
              {
                if (v98 != -1)
                {
                  if (v97 != -1)
                  {
                    uint64_t v49 = 0xFFFFFFFFLL;
                    goto LABEL_60;
                  }
                  CFCalendarDecomposeAbsoluteTime(v11, at, "wY", &v97, &v99);
                  CFCalendarComposeAbsoluteTime(v11, &at, "wY", v97 - 1, v99);
LABEL_65:
                  CFCalendarAddComponents(v11, &at, 0, "E", v50, v98 - 1);
                  goto LABEL_66;
                }
                if (v99 != -1)
                {
                  CFCalendarAddComponents(v11, &at, 0, "y", at, 0xFFFFFFFFLL);
                  CFCalendarDecomposeAbsoluteTime(v11, at, "Y", &v99);
                }
              }
              else if (objc_msgSend(v80, "BOOLValue", v48))
              {
                double v48 = at;
                if (at < v30 && v98 != -1)
                {
                  if (v97 == -1)
                  {
                    CFCalendarDecomposeAbsoluteTime(v11, at, "wY", &v97, &v99);
                    CFCalendarComposeAbsoluteTime(v11, &at, "wY", v97 + 1, v99);
                    goto LABEL_65;
                  }
                  uint64_t v49 = 1;
LABEL_60:
                  CFCalendarAddComponents(v11, &at, 0, "d", v48, v49);
LABEL_66:
                  CFCalendarDecomposeAbsoluteTime(v11, at, "wEY", &v97, &v98, &v99);
                }
              }
              id v51 = objc_alloc_init(MEMORY[0x263EFF918]);
              id v52 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              if (v97 == -1)
              {
                if (v101 != -1)
                {
                  objc_msgSend(v51, "setDay:");
                  v56 = [NSNumber numberWithInt:v101];
                  [v52 setObject:v56 forKey:@"d"];
                }
                if (v100 != -1)
                {
                  objc_msgSend(v51, "setMonth:");
                  v57 = [NSNumber numberWithInt:v100];
                  [v52 setObject:v57 forKey:@"M"];
                }
                if (v99 != -1)
                {
                  objc_msgSend(v51, "setYear:");
                  v55 = [NSNumber numberWithInt:v99];
                  [v52 setObject:v55 forKey:@"y"];
LABEL_76:
                }
              }
              else
              {
                objc_msgSend(v51, "setWeekOfYear:");
                v53 = [NSNumber numberWithInt:v97];
                [v52 setObject:v53 forKey:@"w"];

                [v51 setYearForWeekOfYear:(int)v99];
                v54 = [NSNumber numberWithInt:v99];
                [v52 setObject:v54 forKey:@"Y"];

                if (v98 != -1)
                {
                  objc_msgSend(v51, "setWeekday:");
                  v55 = [NSNumber numberWithInt:v98];
                  [v52 setObject:v55 forKey:@"E"];
                  goto LABEL_76;
                }
              }
              if (![v52 count])
              {
                v47 = v91;
LABEL_84:

                goto LABEL_85;
              }
              v47 = [(__CFCalendar *)v11 dateFromComponents:v51];

              [v82 setDateStyle:4];
              [v82 setTimeStyle:0];
              uint64_t v58 = [v82 stringFromDate:v47];
              v59 = (void *)v58;
              if (!v58) {
                goto LABEL_82;
              }
              v118[0] = kQPParseAttributeValueDateDisplayKey;
              v118[1] = kQPParseAttributeValueDateComponentsKey;
              v119[0] = v58;
              v119[1] = v52;
              v118[2] = kQPParseAttributeValueDateTypeKey;
              v118[3] = kQPParseAttributeValueDateTemporalModifierKey;
              v119[2] = &unk_26D83EE30;
              v119[3] = &unk_26D83EE48;
              v60 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:4];
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
                -[QPDataDetectorsParser enumerateDatesInString:options:withBlock:](buf, [obj count], &v117);
              }
              uint64_t v61 = [v90 range];
              v79[2](v79, v60, v61, v62, &v108);
              BOOL v63 = v108 == 0;

              if (v63)
              {
LABEL_82:

                goto LABEL_84;
              }

LABEL_99:
              goto LABEL_100;
            }
          }
        }
        v47 = 0;
LABEL_85:
      }
      uint64_t v86 = [obj countByEnumeratingWithState:&v104 objects:v121 count:16];
      if (!v86) {
        goto LABEL_99;
      }
    }
  }
  if ([v77 length] == 4)
  {
    v64 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    v65 = [v77 stringByTrimmingCharactersInSet:v64];
    BOOL v66 = [v65 length] == 0;

    if (v66)
    {
      uint64_t v67 = [v77 integerValue];
      if (v67 >= 1971)
      {
        id obj = objc_alloc_init(MEMORY[0x263EFF918]);
        [obj setYear:v67];
        id v68 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v69 = [NSNumber numberWithInteger:v67];
        [v68 setObject:v69 forKey:@"y"];

        if ([v68 count])
        {
          v70 = [(__CFCalendar *)v11 dateFromComponents:obj];
          [v82 setDateStyle:4];
          [v82 setTimeStyle:0];
          uint64_t v71 = [v82 stringFromDate:v70];
          v72 = (void *)v71;
          if (v71)
          {
            v114[0] = kQPParseAttributeValueDateDisplayKey;
            v114[1] = kQPParseAttributeValueDateComponentsKey;
            v115[0] = v71;
            v115[1] = v68;
            v114[2] = kQPParseAttributeValueDateTypeKey;
            v114[3] = kQPParseAttributeValueDateTemporalModifierKey;
            v115[2] = &unk_26D83EE30;
            v115[3] = &unk_26D83EE48;
            v73 = [NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:4];
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
              -[QPDataDetectorsParser enumerateDatesInString:options:withBlock:](buf, [v75 count]);
            }
            v79[2](v79, v73, 0, [v77 length], &v108);
          }
        }

        goto LABEL_99;
      }
    }
  }
LABEL_100:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punctuation, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)enumerateDatesInString:(uint8_t *)buf options:(uint64_t)a2 withBlock:.cold.1(uint8_t *buf, uint64_t a2)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_224D85000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "QueryParserManager: fallback date found: %lu", buf, 0xCu);
}

- (void)enumerateDatesInString:(uint8_t *)buf options:(uint64_t)a2 withBlock:(void *)a3 .cold.2(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 134217984;
  *a3 = a2;
  _os_log_debug_impl(&dword_224D85000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "QueryParserManager: fallback date found: %lu", buf, 0xCu);
}

@end