@interface ICSParser
+ (id)entitiesFromNSData:(id)a3 options:(unint64_t)a4;
- (BOOL)_parseComponent:(id)a3;
- (BOOL)createPropertyType:(int)a3 component:(id)a4 withName:(id)a5 fatalError:(BOOL *)a6;
- (BOOL)parseParameter:(id)a3 fatalError:(BOOL *)a4;
- (BOOL)parseProperty:(id)a3 fatalError:(BOOL *)a4;
- (ICSParser)initWithData:(id)a3 options:(unint64_t)a4;
- (ICSTokenizer)lexer;
- (id)makeComponent:(const char *)a3;
- (id)parseData;
- (void)_parseComponent:(id)a3 depth:(unint64_t)a4 fatalError:(BOOL *)a5;
@end

@implementation ICSParser

- (ICSParser)initWithData:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSParser;
  v7 = [(ICSParser *)&v15 init];
  if ((unint64_t)[v6 length] < 0x1400001)
  {
    v7->_options = a4;
    v9 = [ICSTokenizer alloc];
    if ((a4 & 0x80) != 0) {
      uint64_t v10 = [(ICSTokenizer *)v9 initWithCompressedData:v6];
    }
    else {
      uint64_t v10 = [(ICSTokenizer *)v9 initWithData:v6];
    }
    lexer = v7->_lexer;
    v7->_lexer = (ICSTokenizer *)v10;

    v12 = [[ICSLazyDigestUIDGenerator alloc] initWithData:v6];
    uidGenerator = v7->_uidGenerator;
    v7->_uidGenerator = (ICSUIDGenerator *)v12;

    v8 = v7;
  }
  else
  {
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, @"ICS file exceeds maximum supported size: %lu", [v6 length]);
    v8 = 0;
  }

  return v8;
}

- (id)makeComponent:(const char *)a3
{
  if (!strcmp(a3, "VEVENT"))
  {
    id v6 = ICSEvent;
LABEL_24:
    v7 = (ICSComponent *)objc_alloc_init(v6);
    goto LABEL_25;
  }
  if (!strcmp(a3, "VTODO"))
  {
    id v6 = ICSTodo;
    goto LABEL_24;
  }
  if (strcmp(a3, "VCALENDAR"))
  {
    if (!strcmp(a3, "VJOURNAL"))
    {
      id v6 = ICSJournal;
    }
    else if (!strcmp(a3, "VALARM"))
    {
      id v6 = ICSAlarm;
    }
    else if (!strcmp(a3, "VTIMEZONE"))
    {
      id v6 = ICSTimeZone;
    }
    else if (!strcmp(a3, "DAYLIGHT"))
    {
      id v6 = ICSTimeZoneDaylightBlock;
    }
    else if (!strcmp(a3, "STANDARD"))
    {
      id v6 = ICSTimeZoneStandardBlock;
    }
    else if (!strcmp(a3, "VAVAILABILITY"))
    {
      id v6 = ICSAvailability;
    }
    else if (!strcmp(a3, "AVAILABLE"))
    {
      id v6 = ICSAvailable;
    }
    else
    {
      if (strcmp(a3, "VFREEBUSY"))
      {
        v4 = objc_alloc_init(ICSComponent);
        v5 = [NSString stringWithUTF8String:a3];
        [(ICSComponent *)v4 setUnrecognizedComponentName:v5];

        goto LABEL_26;
      }
      id v6 = ICSFreeBusy;
    }
    goto LABEL_24;
  }
  v7 = [[ICSCalendar alloc] _init];
LABEL_25:
  v4 = v7;
LABEL_26:
  return v4;
}

- (BOOL)parseParameter:(id)a3 fatalError:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(ICSTokenizer *)self->_lexer currentToken];
  if ((unint64_t)[v7 length] <= 0x80000)
  {
    v9 = [(ICSTokenizer *)self->_lexer nextToken];
    if ((unint64_t)[v9 length] <= 0x80000)
    {
      if (v9)
      {
        [v6 addParameter:v7 withRawValue:v9 options:self->_options];
        BOOL v8 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, @"ICS parameter value exceeds maximum supported length: %lu", [v9 length]);
      if (a4)
      {
        BOOL v8 = 0;
        *a4 = 1;
LABEL_10:

        goto LABEL_11;
      }
    }
    BOOL v8 = 0;
    goto LABEL_10;
  }
  +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, @"ICS parameter name exceeds maximum supported length: %lu", [v7 length]);
  BOOL v8 = 0;
  if (a4) {
    *a4 = 1;
  }
LABEL_11:

  return v8;
}

- (BOOL)createPropertyType:(int)a3 component:(id)a4 withName:(id)a5 fatalError:(BOOL *)a6
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v86 = (__CFString *)a5;
  v11 = off_1E6C24E80;
  switch(a3)
  {
    case 0:
    case 1:
    case 6:
    case 7:
    case 10:
    case 11:
    case 14:
      v11 = off_1E6C24DC0;
      goto LABEL_16;
    case 2:
      goto LABEL_16;
    case 3:
      v11 = off_1E6C24CB0;
      goto LABEL_16;
    case 4:
    case 5:
      if (@"TRIGGER" == v86) {
        v11 = off_1E6C24E70;
      }
      else {
        v11 = off_1E6C24D18;
      }
      goto LABEL_16;
    case 8:
      v11 = off_1E6C24E10;
      goto LABEL_16;
    case 9:
      v11 = off_1E6C24D10;
      goto LABEL_16;
    case 12:
      v11 = off_1E6C24E68;
      goto LABEL_16;
    case 13:
      v11 = off_1E6C24E60;
      goto LABEL_16;
    case 15:
      if ([(__CFString *)v86 isEqualToString:@"TRIGGER"])
      {
        v11 = off_1E6C24E70;
      }
      else
      {
        int v13 = [(__CFString *)v86 isEqualToString:@"ATTACH"];
        v11 = off_1E6C24D98;
        if (v13) {
          v11 = off_1E6C24CA8;
        }
      }
LABEL_16:
      id v12 = objc_alloc_init(*v11);
      break;
    default:
      id v12 = 0;
      break;
  }
  uint64_t v14 = [(ICSTokenizer *)self->_lexer nextToken];
  if (!v14)
  {
    LOBYTE(v16) = 0;
LABEL_25:
    v17 = v86;
    goto LABEL_135;
  }
  objc_super v15 = (void *)v14;
  while (1)
  {
    if (![v15 length] || -[ICSTokenizer tokenType](self->_lexer, "tokenType") != 2)
    {
      v98[0] = @"ATTACH";
      v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:1];
      if (([v78 containsObject:v86] & 1) == 0
        && (unint64_t)[v15 length] > 0x80000)
      {
        v17 = v86;
        +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, 0, @"ICS property value exceeds maximum supported size (%@): %lu", v86, [v15 length]);
        LOBYTE(v16) = 0;
        *a6 = 1;
LABEL_133:

        goto LABEL_134;
      }
      v17 = v86;
      v85 = v12;
      switch((int)v86)
      {
        case 0:
          unsigned int v95 = 0;
          id v18 = v15;
          if (sscanf((const char *)[v18 UTF8String], "%d", &v95) != 1) {
            goto LABEL_107;
          }
          id v16 = [NSNumber numberWithInt:v95];
          v19 = v12;
          id v20 = v16;
          uint64_t v21 = 5008;
          goto LABEL_130;
        case 1:
          goto LABEL_106;
        case 2:
          id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v15 encodingInvalidCharacters:0];
          if (v16)
          {
            [v12 setValue:v16 type:5021];
            v22 = @"VALUE";
            v23 = v12;
            goto LABEL_43;
          }
          +[ICSLogger logAtLevel:3, self->_lexer, @"Invalid address property:%@", v15 forTokenizer message];
          goto LABEL_133;
        case 3:
          id v16 = v15;
          if (![v16 length]) {
            goto LABEL_126;
          }
          id v24 = v16;
          id v16 = v24;
          goto LABEL_118;
        case 4:
          v25 = +[ICSDateValue dateFromICSString:v15];
          id v16 = v25;
          if (v25)
          {
            objc_msgSend(v12, "setValue:type:", v25, (int)objc_msgSend(v25, "dateType"));
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v26 = [v12 parameterValueForName:@"TZID"];

              if (v26)
              {
                v23 = v12;
                v22 = @"TZID";
LABEL_43:
                [v23 removeParameterValueForName:v22];
              }
            }
          }
          else
          {
            if (@"TRIGGER" != v86 && @"X-WR-OCCTRIGGER" != v86)
            {
              +[ICSLogger logAtLevel:3, self->_lexer, @"Date validation error:%@ = '%@'", v86, v15 forTokenizer message];
              goto LABEL_127;
            }
            id v24 = v15;
LABEL_118:
            objc_msgSend(v12, "setValueAsProperty:withRawValue:options:", v86, objc_msgSend(v24, "UTF8String"), self->_options);
          }
          goto LABEL_131;
        case 5:
          v27 = v10;
          id v28 = v15;
          [v28 componentsSeparatedByString:@","];
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            id v81 = v28;
            uint64_t v31 = *(void *)v92;
            while (1)
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v92 != v31) {
                  objc_enumerationMutation(obj);
                }
                v33 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                v34 = objc_alloc_init(ICSDate);
                v35 = [v85 parameters];
                [(ICSProperty *)v34 setParameters:v35];

                v36 = +[ICSDateValue dateFromICSUTF8String:](ICSDateValue, "dateFromICSUTF8String:", [v33 UTF8String]);
                id v16 = v36;
                if (!v36)
                {
                  id v28 = v81;
                  +[ICSLogger logAtLevel:3, self->_lexer, @"Date validation error:%@ = '%@'", v86, v81 forTokenizer message];

                  id v12 = v85;
                  goto LABEL_120;
                }
                -[ICSProperty setValue:type:](v34, "setValue:type:", v36, (int)[v36 dateType]);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v37 = [(ICSProperty *)v34 parameterValueForName:@"TZID"];

                  if (v37) {
                    [(ICSProperty *)v34 removeParameterValueForName:@"TZID"];
                  }
                }
                [v27 addProperty:v86 withValue:v34];
              }
              uint64_t v30 = [obj countByEnumeratingWithState:&v91 objects:v97 count:16];
              if (!v30)
              {
                LOBYTE(v16) = 1;
                id v12 = v85;
                id v28 = v81;
                goto LABEL_120;
              }
            }
          }
          LOBYTE(v16) = 1;
LABEL_120:

          id v10 = v27;
          v17 = v86;
          goto LABEL_133;
        case 6:
          id v38 = v15;
          uint64_t v39 = [v38 length];
          LOBYTE(v16) = v39 != 0;
          if (v39)
          {
            v80 = v10;
            id v77 = v38;
            [v38 componentsSeparatedByString:@","];
            long long v87 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            id obja = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v40 = [obja countByEnumeratingWithState:&v87 objects:v96 count:16];
            if (v40)
            {
              uint64_t v41 = v40;
              uint64_t v42 = *(void *)v88;
              v79 = v15;
              do
              {
                uint64_t v43 = 0;
                uint64_t v82 = v41;
                do
                {
                  if (*(void *)v88 != v42) {
                    objc_enumerationMutation(obja);
                  }
                  v44 = [*(id *)(*((void *)&v87 + 1) + 8 * v43) componentsSeparatedByString:@"/"];
                  if ([v44 count] == 2)
                  {
                    v45 = [v44 objectAtIndex:0];
                    v46 = +[ICSDateValue dateFromICSString:v45];

                    v47 = [v44 objectAtIndex:1];
                    v48 = +[ICSDateValue dateFromICSString:v47];

                    v49 = [ICSPeriod alloc];
                    v50 = v49;
                    if (v48)
                    {
                      v51 = [(ICSPeriod *)v49 initWithStart:v46 end:v48];
                    }
                    else
                    {
                      v52 = [v44 objectAtIndex:1];
                      v53 = +[ICSDuration durationFromICSString:v52];
                      v51 = [(ICSPeriod *)v50 initWithStart:v46 duration:v53];
                    }
                    v54 = [[ICSFreeBusyTime alloc] initWithPeriod:v51];
                    v55 = [v85 parameters];
                    [(ICSProperty *)v54 setParameters:v55];

                    [v80 addProperty:v86 withValue:v54];
                    id v12 = v85;

                    objc_super v15 = v79;
                    uint64_t v41 = v82;
                  }

                  ++v43;
                }
                while (v41 != v43);
                uint64_t v41 = [obja countByEnumeratingWithState:&v87 objects:v96 count:16];
              }
              while (v41);
            }

            id v10 = v80;
            v17 = v86;
            LOBYTE(v16) = 1;
            id v38 = v77;
          }

          goto LABEL_133;
        case 7:
          unsigned int v95 = 0;
          id v18 = v15;
          if (sscanf((const char *)[v18 UTF8String], "%d", &v95) == 1)
          {
            if ((int)v95 >= 1) {
              unsigned int v56 = v95 % 0x64 + 60 * (v95 / 0x64);
            }
            else {
              unsigned int v56 = v95 + 100 * (-v95 / 0x64) - 60 * (-v95 / 0x64);
            }
            unsigned int v95 = v56;
            id v16 = [NSNumber numberWithInt:60 * v56];
            v19 = v12;
            id v20 = v16;
            uint64_t v21 = 5018;
            goto LABEL_130;
          }
LABEL_107:
          v68 = v12;
          id v69 = v18;
LABEL_108:
          uint64_t v70 = 5007;
LABEL_109:
          [v68 setValue:v69 type:v70];
          goto LABEL_132;
        case 8:
          id v57 = v15;
          if ((unint64_t)[v57 length] >= 2
            && [v57 characterAtIndex:0] == 34
            && objc_msgSend(v57, "characterAtIndex:", objc_msgSend(v57, "length") - 1) == 34)
          {
            uint64_t v58 = objc_msgSend(v57, "substringWithRange:", 1, objc_msgSend(v57, "length") - 2);

            id v57 = (id)v58;
          }
          id v59 = [v57 stringByReplacingOccurrencesOfString:@"\\"" withString:&stru_1F3601330];

          id v16 = [MEMORY[0x1E4F1CB10] URLWithString:v59 encodingInvalidCharacters:0];
          if (v16) {
            goto LABEL_87;
          }
          +[ICSLogger logAtLevel:3, self->_lexer, @"Invalid location property:%@", v59 forTokenizer message];
          goto LABEL_122;
        case 9:
          id v59 = v15;
          if ((unint64_t)[v59 length] >= 2
            && [v59 characterAtIndex:0] == 34
            && objc_msgSend(v59, "characterAtIndex:", objc_msgSend(v59, "length") - 1) == 34)
          {
            uint64_t v60 = objc_msgSend(v59, "substringWithRange:", 1, objc_msgSend(v59, "length") - 2);

            id v59 = (id)v60;
          }
          objc_msgSend(MEMORY[0x1E4F1CB10], "_lp_URLWithUserTypedString:relativeToURL:", v59, 0);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
LABEL_87:
            [v12 setValue:v16 type:5013];
            [v12 removeParameterValueForName:@"VALUE"];

            goto LABEL_132;
          }
          +[ICSLogger logAtLevel:3, self->_lexer, @"Invalid conference property:%@", v59 forTokenizer message];
LABEL_122:

          goto LABEL_133;
        case 10:
          id v16 = v15;
          uint64_t v61 = [MEMORY[0x1E4F1CB10] URLWithString:v16 encodingInvalidCharacters:0];
          if (v61)
          {
            v62 = (void *)v61;
            v63 = v12;
            v64 = v62;
            uint64_t v65 = 5013;
            goto LABEL_92;
          }
          +[ICSLogger logAtLevel:3, self->_lexer, @"Invalid activity property:%@", v16 forTokenizer message];
          goto LABEL_126;
        case 11:
          id v16 = v15;
          uint64_t v66 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:1];
          if (!v66)
          {
            +[ICSLogger logAtLevel:3, self->_lexer, @"Invalid app link data property:%@", v16 forTokenizer message];
            goto LABEL_126;
          }
          v62 = (void *)v66;
          v63 = v12;
          v64 = v62;
          uint64_t v65 = 5026;
LABEL_92:
          [v63 setValue:v64 type:v65];
          [v12 removeParameterValueForName:@"VALUE"];
          goto LABEL_95;
        case 12:
          id v16 = v15;
          uint64_t v67 = +[ICSDuration durationFromICSString:v16];
          if (!v67)
          {
            +[ICSLogger logAtLevel:3, self->_lexer, @"Invalid travel duration property:%@", v16 forTokenizer message];
            goto LABEL_126;
          }
          v62 = (void *)v67;
          [v12 removeParameterValueForName:@"VALUE"];
          [v12 setValue:v62 type:5011];
LABEL_95:

          goto LABEL_131;
        case 13:
          v68 = v12;
          id v69 = v15;
          goto LABEL_108;
        case 14:
          v68 = v12;
          id v69 = v15;
          uint64_t v70 = 5015;
          goto LABEL_109;
        case 15:
          if (([(__CFString *)v86 isEqualToString:@"RRULE"] & 1) != 0
            || [(__CFString *)v86 isEqualToString:@"EXRULE"])
          {
            id v71 = v15;
            +[ICSRecurrenceRule recurrenceRuleFromICSCString:withTokenizer:](ICSRecurrenceRule, "recurrenceRuleFromICSCString:withTokenizer:", [v71 UTF8String], self->_lexer);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            if ([v16 freq])
            {
              if ([v16 freq] == 5) {
                [v16 setBymonthday:0];
              }
              v72 = [v10 dtstart];

              if (v72)
              {
                v73 = [v10 dtstart];
                v74 = [v73 value];
                [v16 cleanUpForStartDate:v74];

                id v12 = v85;
              }
              v19 = v12;
              id v20 = v16;
              uint64_t v21 = 5029;
            }
            else
            {
              if ((self->_options & 1) == 0)
              {
LABEL_126:

LABEL_127:
                LOBYTE(v16) = 0;
                goto LABEL_133;
              }
              v19 = v12;
              id v20 = v71;
              uint64_t v21 = 5007;
            }
LABEL_130:
            [v19 setValue:v20 type:v21];
LABEL_131:
          }
          else
          {
LABEL_106:
            objc_msgSend(v12, "setValueAsProperty:withRawValue:options:", v86, objc_msgSend(v15, "UTF8String"), self->_options);
          }
LABEL_132:
          [v10 addProperty:v86 withValue:v12];
          LOBYTE(v16) = 1;
          goto LABEL_133;
        default:
          goto LABEL_132;
      }
    }
    LOBYTE(v95) = 0;
    [(ICSParser *)self parseParameter:v12 fatalError:&v95];
    if ((_BYTE)v95) {
      break;
    }
    id v16 = [(ICSTokenizer *)self->_lexer nextToken];

    objc_super v15 = v16;
    if (!v16) {
      goto LABEL_25;
    }
  }
  if (a6) {
    *a6 = 1;
  }
  LOBYTE(v16) = 0;
  v17 = v86;
LABEL_134:

LABEL_135:
  return (char)v16;
}

- (BOOL)parseProperty:(id)a3 fatalError:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(ICSTokenizer *)self->_lexer currentToken];
  BOOL v8 = (const char *)[(__CFString *)v7 UTF8String];
  if (!strcmp(v8, "SEQUENCE"))
  {
    uint64_t v14 = kICSSTR_sequence_prop;
LABEL_52:
    int v13 = *v14;
    id v10 = self;
    uint64_t v11 = 0;
LABEL_53:
    id v12 = v6;
    goto LABEL_54;
  }
  if (!strcmp(v8, "PRIORITY"))
  {
    uint64_t v14 = kICSSTR_priority_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "X-APPLE-SORT-ORDER"))
  {
    uint64_t v14 = kICSSTR_XAPPLE_sort_order_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "PERCENT-COMPLETE"))
  {
    uint64_t v14 = kICSSTR_percentcomplete_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "DESCRIPTION"))
  {
    v17 = kICSSTR_description_prop;
LABEL_65:
    int v13 = *v17;
    id v10 = self;
    uint64_t v11 = 1;
    goto LABEL_53;
  }
  if (!strcmp(v8, "SUMMARY"))
  {
    v17 = kICSSTR_summary_prop;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-CONTACT-IDENTIFIERS"))
  {
    v17 = kICSSTR_XAPPLE_contact_identifiers;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-EXTERNAL-REFERENCE-ID"))
  {
    v17 = kICSSTR_external_reference_id;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-UNIVERSAL-ID"))
  {
    v17 = kICSSTR_XAPPLE_universal_id;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-SPECIAL-DAY"))
  {
    v17 = kICSSTR_XAPPLE_special_day_prop;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-CREATOR-IDENTITY"))
  {
    v17 = kICSSTR_XAPPLE_creator_identity_prop;
    goto LABEL_65;
  }
  if (!strcmp(v8, "X-APPLE-CREATOR-TEAM-IDENTITY"))
  {
    v17 = kICSSTR_XAPPLE_creator_team_identity_prop;
    goto LABEL_65;
  }
  v9 = @"X-APPLE-LANGUAGE";
  if (!strcmp(v8, (const char *)[@"X-APPLE-LANGUAGE" UTF8String])
    || (v9 = @"X-APPLE-REGION", !strcmp(v8, (const char *)[@"X-APPLE-REGION" UTF8String])))
  {
    id v10 = self;
    uint64_t v11 = 1;
LABEL_63:
    id v12 = v6;
    int v13 = v9;
    goto LABEL_54;
  }
  if (!strcmp(v8, "DTSTART"))
  {
    id v18 = kICSSTR_dtstart_prop;
LABEL_77:
    int v13 = *v18;
    id v10 = self;
    uint64_t v11 = 4;
    goto LABEL_53;
  }
  if (!strcmp(v8, "DTEND"))
  {
    id v18 = kICSSTR_dtend_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "DTSTAMP"))
  {
    id v18 = kICSSTR_dtstamp_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "CREATED"))
  {
    id v18 = kICSSTR_created_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "LAST-MODIFIED"))
  {
    id v18 = kICSSTR_lastmodified_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "COMPLETED"))
  {
    id v18 = kICSSTR_completed_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "DUE"))
  {
    id v18 = kICSSTR_due_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "RDATE"))
  {
    id v18 = kICSSTR_rdate_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "RECURRENCE-ID"))
  {
    id v18 = kICSSTR_recurrenceid_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "ACKNOWLEDGED"))
  {
    id v18 = kICSSTR_acknowledged_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "TRIGGER"))
  {
    id v18 = kICSSTR_trigger_prop;
    goto LABEL_77;
  }
  v9 = @"X-APPLE-ALTERNATIVE-DUE-DATE-FOR-CALENDAR";
  if (!strcmp(v8, (const char *)[@"X-APPLE-ALTERNATIVE-DUE-DATE-FOR-CALENDAR" UTF8String]))
  {
    id v10 = self;
    uint64_t v11 = 4;
    goto LABEL_63;
  }
  if (!strcmp(v8, "EXDATE"))
  {
    int v13 = @"EXDATE";
    id v10 = self;
    uint64_t v11 = 5;
    goto LABEL_53;
  }
  if (!strcmp(v8, "ORGANIZER"))
  {
    v19 = kICSSTR_organizer_prop;
LABEL_83:
    int v13 = *v19;
    id v10 = self;
    uint64_t v11 = 2;
    goto LABEL_53;
  }
  if (!strcmp(v8, "ATTENDEE"))
  {
    v19 = kICSSTR_attendee_prop;
    goto LABEL_83;
  }
  if (!strcmp(v8, "X-WR-ATTENDEE"))
  {
    v19 = kICSSTR_XWR_attendee_prop;
    goto LABEL_83;
  }
  if (!strcmp(v8, "TZOFFSETFROM"))
  {
    id v20 = kICSSTR_tzoffsetfrom_prop;
LABEL_86:
    int v13 = *v20;
    id v10 = self;
    uint64_t v11 = 7;
    goto LABEL_53;
  }
  if (!strcmp(v8, "TZOFFSETTO"))
  {
    id v20 = kICSSTR_tzoffsetto_prop;
    goto LABEL_86;
  }
  if (!strcmp(v8, "X-APPLE-STRUCTURED-LOCATION"))
  {
    uint64_t v21 = kICSSTR_XAPPLE_structured_location_prop;
LABEL_90:
    int v13 = *v21;
    id v10 = self;
    uint64_t v11 = 8;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-TRAVEL-START"))
  {
    uint64_t v21 = kICSSTR_XAPPLE_travel_start;
    goto LABEL_90;
  }
  if (!strcmp(v8, "X-APPLE-END-LOCATION"))
  {
    uint64_t v21 = kICSSTR_XAPPLE_end_location;
    goto LABEL_90;
  }
  if (!strcmp(v8, "X-APPLE-SUGGESTION-INFO-CHANGED-FIELDS"))
  {
    uint64_t v14 = kICSSTR_XAPPLE_suggestion_info_changed_fields_prop;
    goto LABEL_52;
  }
  if (!strcmp(v8, "X-APPLE-SUGGESTION-INFO-TIMESTAMP"))
  {
    id v18 = kICSSTR_XAPPLE_suggestion_info_timestamp_prop;
    goto LABEL_77;
  }
  if (!strcmp(v8, "X-CALENDARSERVER-ATTENDEE-COMMENT"))
  {
    int v13 = @"X-CALENDARSERVER-ATTENDEE-COMMENT";
    id v10 = self;
    uint64_t v11 = 3;
    goto LABEL_53;
  }
  if (!strcmp(v8, "FREEBUSY"))
  {
    int v13 = @"FREEBUSY";
    id v10 = self;
    uint64_t v11 = 6;
    goto LABEL_53;
  }
  if (!strcmp(v8, "CONFERENCE"))
  {
    int v13 = @"CONFERENCE";
    id v10 = self;
    uint64_t v11 = 9;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-ACTIVITY"))
  {
    int v13 = @"X-APPLE-ACTIVITY";
    id v10 = self;
    uint64_t v11 = 10;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-APP-LINK-DATA"))
  {
    v22 = kICSSTR_XAPPLE_app_link_data_prop;
LABEL_98:
    int v13 = *v22;
    id v10 = self;
    uint64_t v11 = 11;
    goto LABEL_53;
  }
  if (!strcmp(v8, "GEO"))
  {
    int v13 = @"GEO";
    id v10 = self;
    uint64_t v11 = 14;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-TRAVEL-DURATION"))
  {
    int v13 = @"X-APPLE-TRAVEL-DURATION";
    id v10 = self;
    uint64_t v11 = 12;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-TRAVEL-ADVISORY-BEHAVIOR"))
  {
    int v13 = @"X-APPLE-TRAVEL-ADVISORY-BEHAVIOR";
    id v10 = self;
    uint64_t v11 = 13;
    goto LABEL_53;
  }
  if (!strcmp(v8, "X-APPLE-STRUCTURED-DATA"))
  {
    v22 = kICSSTR_XAPPLE_structured_data_prop;
    goto LABEL_98;
  }
  id v10 = self;
  uint64_t v11 = 15;
  id v12 = v6;
  int v13 = v7;
LABEL_54:
  BOOL v15 = [(ICSParser *)v10 createPropertyType:v11 component:v12 withName:v13 fatalError:a4];

  return v15;
}

- (BOOL)_parseComponent:(id)a3
{
  char v4 = 0;
  [(ICSParser *)self _parseComponent:a3 depth:0 fatalError:&v4];
  return v4 == 0;
}

- (void)_parseComponent:(id)a3 depth:(unint64_t)a4 fatalError:(BOOL *)a5
{
  id v8 = a3;
  if (a4 >= 0x65)
  {
    +[ICSLogger logAtLevel:3 forTokenizer:self->_lexer message:@"Reached maximum component depth. Aborting parser."];
    *a5 = 1;
    goto LABEL_32;
  }
  v9 = [(ICSTokenizer *)self->_lexer nextToken];
  if (!v9)
  {
    +[ICSLogger logAtLevel:3 forTokenizer:self->_lexer message:@"Expected component name but got NULL"];
    goto LABEL_32;
  }
  id v22 = v9;
  id v10 = -[ICSParser makeComponent:](self, "makeComponent:", [v22 UTF8String]);
  uint64_t v11 = [(ICSTokenizer *)self->_lexer nextToken];
  unint64_t v21 = a4 + 1;
  do
  {
    if (!v11) {
      goto LABEL_25;
    }
    id v12 = (void *)MEMORY[0x1E01964E0]();
    if (-[ICSTokenizer tokenType](self->_lexer, "tokenType") || ![v11 length])
    {
      +[ICSLogger logAtLevel:3, self->_lexer, @"Unexpected token %@ for PropertyName.", v11 forTokenizer message];
LABEL_8:
      [(ICSTokenizer *)self->_lexer nextToken];
      int v13 = 0;
      v11 = uint64_t v14 = v11;
      goto LABEL_9;
    }
    if ([v11 isEqualToString:@"BEGIN"])
    {
      [(ICSParser *)self _parseComponent:v10 depth:v21 fatalError:a5];
      if (*a5) {
        goto LABEL_29;
      }
      goto LABEL_8;
    }
    if (![v11 isEqualToString:@"END"])
    {
      char v23 = 0;
      [(ICSParser *)self parseProperty:v10 fatalError:&v23];
      if (v23)
      {
        if (a5) {
          *a5 = 1;
        }
LABEL_29:
        goto LABEL_30;
      }
      goto LABEL_8;
    }
    BOOL v15 = [(ICSTokenizer *)self->_lexer nextToken];
    uint64_t v14 = v15;
    if (v15)
    {
      if ([v15 isEqualToString:v22])
      {
        int v13 = 3;
        goto LABEL_9;
      }
      lexer = self->_lexer;
      id v19 = v22;
      id v20 = v14;
      v17 = @"BEGIN (%@) END (%@) mismatch!";
    }
    else
    {
      lexer = self->_lexer;
      v17 = @"No END value!";
    }
    +[ICSLogger logAtLevel:forTokenizer:message:](ICSLogger, "logAtLevel:forTokenizer:message:", 3, lexer, v17, v19, v20);
    int v13 = 1;
LABEL_9:
  }
  while (!v13);
  if (v13 == 3)
  {
LABEL_25:
    id v18 = v22;
    [v8 addComponent:v10 withUIDGenerator:self->_uidGenerator];
    goto LABEL_31;
  }
LABEL_30:
  id v18 = v22;
LABEL_31:

LABEL_32:
}

- (id)parseData
{
  v3 = objc_alloc_init(ICSComponent);
  uint64_t v4 = [(ICSTokenizer *)self->_lexer nextToken];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      id v6 = (void *)MEMORY[0x1E01964E0]();
      if ([v5 isEqualToString:@"BEGIN"])
      {
        if (![(ICSParser *)self _parseComponent:v3])
        {

          id v8 = 0;
          goto LABEL_9;
        }
      }
      else
      {
        +[ICSLogger logAtLevel:3 forTokenizer:self->_lexer message:@"Invalid ICS format, no VCALENDAR"];
      }
      uint64_t v7 = [(ICSTokenizer *)self->_lexer nextToken];

      v5 = (void *)v7;
    }
    while (v7);
  }
  id v8 = v3;
LABEL_9:

  return v8;
}

+ (id)entitiesFromNSData:(id)a3 options:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [[ICSParser alloc] initWithData:v5 options:a4];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [(ICSParser *)v6 parseData];
    v9 = [v8 components];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      id v32 = v5;
      id v33 = [MEMORY[0x1E4F1CA48] array];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v31 = v8;
      uint64_t v11 = [v8 components];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v12) {
        goto LABEL_20;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      while (1)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v18 = [(ICSParser *)v7 lexer];
            +[ICSLogger logAtLevel:3, v18, @"ICS: Cal not a ICSCalendar %@", v16 forTokenizer message];
            goto LABEL_16;
          }
          id v17 = v16;
          id v18 = v17;
          if (a4)
          {
            [v17 fixPropertiesInheritance];
            goto LABEL_15;
          }
          id v19 = v11;
          id v20 = v7;
          unint64_t v21 = a4;
          id v22 = [v17 version];

          if (!v22
            || ([v18 version],
                char v23 = objc_claimAutoreleasedReturnValue(),
                char v24 = [v23 isEqualToString:@"2.0"],
                v23,
                (v24 & 1) != 0))
          {
            [v18 fixPropertiesInheritance];
            [v18 fixEntities];
            a4 = v21;
            uint64_t v7 = v20;
            uint64_t v11 = v19;
LABEL_15:
            [v33 addObject:v18];
            goto LABEL_16;
          }
          v25 = [(ICSParser *)v20 lexer];
          v26 = [v18 version];
          +[ICSLogger logAtLevel:3, v25, @"Bad version of iCalendar %@", v26 forTokenizer message];

          a4 = v21;
          uint64_t v7 = v20;
          uint64_t v11 = v19;
LABEL_16:

          ++v15;
        }
        while (v13 != v15);
        uint64_t v27 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
        uint64_t v13 = v27;
        if (!v27)
        {
LABEL_20:

          id v8 = v31;
          id v5 = v32;
          goto LABEL_23;
        }
      }
    }
    uint64_t v29 = [(ICSParser *)v7 lexer];
    +[ICSLogger logAtLevel:3 forTokenizer:v29 message:@"No components found"];

    id v33 = 0;
LABEL_23:
  }
  else
  {
    id v28 = [0 lexer];
    +[ICSLogger logAtLevel:3 forTokenizer:v28 message:@"Failed to create ICSParser"];

    id v33 = 0;
  }

  return v33;
}

- (ICSTokenizer)lexer
{
  return self->_lexer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uidGenerator, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_lexer, 0);
}

@end