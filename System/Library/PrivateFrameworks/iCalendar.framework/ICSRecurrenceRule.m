@interface ICSRecurrenceRule
+ (BOOL)supportsSecureCoding;
+ (id)recurrenceRuleFromICSCString:(const char *)a3 withTokenizer:(id)a4;
+ (id)recurrenceRuleFromICSString:(id)a3;
- (BOOL)shouldObscureParameter:(id)a3;
- (BOOL)shouldObscureValue;
- (ICSDateValue)until;
- (ICSRecurrenceRule)initWithCoder:(id)a3;
- (ICSRecurrenceRule)initWithFrequency:(unint64_t)a3;
- (NSArray)byday;
- (NSArray)byhour;
- (NSArray)byminute;
- (NSArray)bymonth;
- (NSArray)bymonthday;
- (NSArray)bysecond;
- (NSArray)bysetpos;
- (NSArray)byweekno;
- (NSArray)byyearday;
- (NSNumber)count;
- (NSNumber)interval;
- (NSNumber)wkst;
- (NSSet)propertiesToExcludeForChecksum;
- (id)occurrencesForStartDate:(id)a3 fromDate:(id)a4 toDate:(id)a5 inTimeZone:(id)a6;
- (id)parameterValueForName:(id)a3;
- (id)propertiesToHide;
- (id)propertiesToObscure;
- (unint64_t)freq;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)cleanUpForStartDate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeParameterValueForName:(id)a3;
- (void)setByday:(id)a3;
- (void)setByhour:(id)a3;
- (void)setByminute:(id)a3;
- (void)setBymonth:(id)a3;
- (void)setBymonthday:(id)a3;
- (void)setBysecond:(id)a3;
- (void)setBysetpos:(id)a3;
- (void)setByweekno:(id)a3;
- (void)setByyearday:(id)a3;
- (void)setCount:(id)a3;
- (void)setFreq:(unint64_t)a3;
- (void)setInterval:(id)a3;
- (void)setParameterValue:(id)a3 forName:(id)a4;
- (void)setUntil:(id)a3;
- (void)setWkst:(id)a3;
@end

@implementation ICSRecurrenceRule

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v64 = a4;
  v6 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v7 = [(ICSRecurrenceRule *)self freq] - 1;
  if (v7 <= 6) {
    [v6 addObject:off_1E6C25900[v7]];
  }
  v8 = [(ICSRecurrenceRule *)self interval];

  if (v8)
  {
    v9 = NSString;
    v10 = [(ICSRecurrenceRule *)self interval];
    v11 = objc_msgSend(v9, "stringWithFormat:", @"INTERVAL=%ld", objc_msgSend(v10, "integerValue"));
    [v6 addObject:v11];
  }
  v12 = [(ICSRecurrenceRule *)self count];

  if (v12)
  {
    v13 = NSString;
    v14 = [(ICSRecurrenceRule *)self count];
    v15 = objc_msgSend(v13, "stringWithFormat:", @"COUNT=%ld", objc_msgSend(v14, "integerValue"));
    [v6 addObject:v15];
  }
  v16 = [(ICSRecurrenceRule *)self until];

  if (v16)
  {
    v17 = [[ICSStringWriter alloc] initWithString:@"UNTIL="];
    v18 = [(ICSRecurrenceRule *)self until];
    [v18 _ICSStringWithOptions:a3 appendingToString:v17];

    v19 = [(ICSStringWriter *)v17 result];
    [v6 addObject:v19];
  }
  v20 = [(ICSRecurrenceRule *)self bymonth];

  if (v20)
  {
    v21 = [[ICSStringWriter alloc] initWithString:@"BYMONTH="];
    v22 = [(ICSRecurrenceRule *)self bymonth];
    [v22 _ICSStringWithOptions:a3 appendingToString:v21];

    v23 = [(ICSStringWriter *)v21 result];
    [v6 addObject:v23];
  }
  v24 = [(ICSRecurrenceRule *)self byweekno];

  if (v24)
  {
    v25 = [[ICSStringWriter alloc] initWithString:@"BYWEEKNO="];
    v26 = [(ICSRecurrenceRule *)self byweekno];
    [v26 _ICSStringWithOptions:a3 appendingToString:v25];

    v27 = [(ICSStringWriter *)v25 result];
    [v6 addObject:v27];
  }
  v28 = [(ICSRecurrenceRule *)self bysetpos];

  if (v28)
  {
    v29 = [[ICSStringWriter alloc] initWithString:@"BYSETPOS="];
    v30 = [(ICSRecurrenceRule *)self bysetpos];
    [v30 _ICSStringWithOptions:a3 appendingToString:v29];

    v31 = [(ICSStringWriter *)v29 result];
    [v6 addObject:v31];
  }
  v32 = [(ICSRecurrenceRule *)self byyearday];

  if (v32)
  {
    v33 = [[ICSStringWriter alloc] initWithString:@"BYYEARDAY="];
    v34 = [(ICSRecurrenceRule *)self byyearday];
    [v34 _ICSStringWithOptions:a3 appendingToString:v33];

    v35 = [(ICSStringWriter *)v33 result];
    [v6 addObject:v35];
  }
  v36 = [(ICSRecurrenceRule *)self bymonthday];

  if (v36)
  {
    v37 = [[ICSStringWriter alloc] initWithString:@"BYMONTHDAY="];
    v38 = [(ICSRecurrenceRule *)self bymonthday];
    [v38 _ICSStringWithOptions:a3 appendingToString:v37];

    v39 = [(ICSStringWriter *)v37 result];
    [v6 addObject:v39];
  }
  v40 = [(ICSRecurrenceRule *)self byday];

  if (v40)
  {
    v41 = [[ICSStringWriter alloc] initWithString:@"BYDAY="];
    v42 = [(ICSRecurrenceRule *)self byday];
    [v42 _ICSStringWithOptions:a3 appendingToString:v41];

    v43 = [(ICSStringWriter *)v41 result];
    [v6 addObject:v43];
  }
  v44 = [(ICSRecurrenceRule *)self byhour];

  if (v44)
  {
    v45 = [[ICSStringWriter alloc] initWithString:@"BYHOUR="];
    v46 = [(ICSRecurrenceRule *)self byhour];
    [v46 _ICSStringWithOptions:a3 appendingToString:v45];

    v47 = [(ICSStringWriter *)v45 result];
    [v6 addObject:v47];
  }
  v48 = [(ICSRecurrenceRule *)self byminute];

  if (v48)
  {
    v49 = [[ICSStringWriter alloc] initWithString:@"BYMINUTE="];
    v50 = [(ICSRecurrenceRule *)self byminute];
    [v50 _ICSStringWithOptions:a3 appendingToString:v49];

    v51 = [(ICSStringWriter *)v49 result];
    [v6 addObject:v51];
  }
  v52 = [(ICSRecurrenceRule *)self bysecond];

  if (v52)
  {
    v53 = [[ICSStringWriter alloc] initWithString:@"BYSECOND="];
    v54 = [(ICSRecurrenceRule *)self bysecond];
    [v54 _ICSStringWithOptions:a3 appendingToString:v53];

    v55 = [(ICSStringWriter *)v53 result];
    [v6 addObject:v55];
  }
  v56 = [(ICSRecurrenceRule *)self wkst];

  if (v56)
  {
    v57 = [[ICSStringWriter alloc] initWithString:@"WKST="];
    v58 = [(ICSRecurrenceRule *)self wkst];
    unint64_t v59 = [v58 integerValue] - 1;
    if (v59 > 6) {
      v60 = @"ERROR";
    }
    else {
      v60 = off_1E6C25938[v59];
    }
    [(ICSStringWriter *)v57 appendString:v60];

    v61 = [(ICSStringWriter *)v57 result];
    [v6 addObject:v61];
  }
  if ((a3 & 8) != 0)
  {
    v62 = [v6 sortedArrayUsingSelector:sel_compare_];
    v63 = [v62 componentsJoinedByString:@";"];
    [v64 appendString:v63];
  }
  else
  {
    v62 = [v6 componentsJoinedByString:@";"];
    [v64 appendString:v62];
  }
}

- (NSSet)propertiesToExcludeForChecksum
{
  return 0;
}

+ (id)recurrenceRuleFromICSString:(id)a3
{
  uint64_t v3 = [a3 UTF8String];
  return +[ICSRecurrenceRule recurrenceRuleFromICSCString:v3 withTokenizer:0];
}

- (ICSRecurrenceRule)initWithFrequency:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSRecurrenceRule;
  v4 = [(ICSRecurrenceRule *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ICSRecurrenceRule *)v4 setFreq:a3];
  }
  return v5;
}

- (id)parameterValueForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_parameters objectForKey:a3];
}

- (void)setParameterValue:(id)a3 forName:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = v12;
  id v8 = v6;
  parameters = self->_parameters;
  if (v12)
  {
    if (!parameters)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_parameters;
      self->_parameters = v10;

      id v7 = v12;
      parameters = self->_parameters;
    }
    [(NSMutableDictionary *)parameters setObject:v7 forKey:v8];
  }
  else
  {
    [(NSMutableDictionary *)parameters removeObjectForKey:v8];
  }
}

- (void)removeParameterValueForName:(id)a3
{
}

- (unint64_t)freq
{
  return self->_freq;
}

- (void)setFreq:(unint64_t)a3
{
  self->_freq = a3;
}

- (ICSDateValue)until
{
  return (ICSDateValue *)[(ICSRecurrenceRule *)self parameterValueForName:@"UNTIL"];
}

- (void)setUntil:(id)a3
{
}

- (NSNumber)count
{
  return (NSNumber *)[(ICSRecurrenceRule *)self parameterValueForName:@"COUNT"];
}

- (void)setCount:(id)a3
{
}

- (NSNumber)interval
{
  return (NSNumber *)[(ICSRecurrenceRule *)self parameterValueForName:@"INTERVAL"];
}

- (void)setInterval:(id)a3
{
}

- (NSArray)bysecond
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYSECOND"];
}

- (void)setBysecond:(id)a3
{
}

- (NSArray)byminute
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYMINUTE"];
}

- (void)setByminute:(id)a3
{
}

- (NSArray)byhour
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYHOUR"];
}

- (void)setByhour:(id)a3
{
}

- (NSArray)byday
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYDAY"];
}

- (void)setByday:(id)a3
{
}

- (NSArray)bymonthday
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYMONTHDAY"];
}

- (void)setBymonthday:(id)a3
{
}

- (NSArray)byyearday
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYYEARDAY"];
}

- (void)setByyearday:(id)a3
{
}

- (NSArray)byweekno
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYWEEKNO"];
}

- (void)setByweekno:(id)a3
{
}

- (NSArray)bymonth
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYMONTH"];
}

- (void)setBymonth:(id)a3
{
}

- (NSArray)bysetpos
{
  return (NSArray *)[(ICSRecurrenceRule *)self parameterValueForName:@"BYSETPOS"];
}

- (void)setBysetpos:(id)a3
{
}

- (NSNumber)wkst
{
  return (NSNumber *)[(ICSRecurrenceRule *)self parameterValueForName:@"WKST"];
}

- (void)setWkst:(id)a3
{
}

- (id)propertiesToObscure
{
  return 0;
}

- (id)propertiesToHide
{
  return 0;
}

- (BOOL)shouldObscureParameter:(id)a3
{
  return 0;
}

- (BOOL)shouldObscureValue
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t freq_low = LODWORD(self->_freq);
  id v5 = a3;
  [v5 encodeInt:freq_low forKey:@"Frequency"];
  [v5 encodeObject:self->_parameters forKey:@"Parameters"];
}

- (ICSRecurrenceRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSRecurrenceRule;
  id v5 = [(ICSRecurrenceRule *)&v9 init];
  if (v5)
  {
    if (initWithCoder__onceToken != -1) {
      dispatch_once(&initWithCoder__onceToken, &__block_literal_global_13);
    }
    v5->_freq = (int)[v4 decodeIntForKey:@"Frequency"];
    uint64_t v6 = [v4 decodeObjectOfClasses:initWithCoder__parametersPermittedList forKey:@"Parameters"];
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v6;
  }
  return v5;
}

void __35__ICSRecurrenceRule_initWithCoder___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)initWithCoder__parametersPermittedList;
  initWithCoder__parametersPermittedList = v2;
}

- (void).cxx_destruct
{
}

- (id)occurrencesForStartDate:(id)a3 fromDate:(id)a4 toDate:(id)a5 inTimeZone:(id)a6
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  uint64_t v15 = *MEMORY[0x1E4F1C318];
  v16 = (void *)[v14 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v90 = v13;
  [v16 setTimeZone:v13];
  v17 = [v10 components];
  v18 = [v16 dateFromComponents:v17];

  v19 = [v11 components];
  v20 = [v16 dateFromComponents:v19];
  v92 = v18;
  v21 = [v18 laterDate:v20];

  v91 = v12;
  v22 = [v12 components];
  v23 = [v16 dateFromComponents:v22];

  v24 = [(ICSRecurrenceRule *)self until];

  v95 = self;
  if (v24)
  {
    v25 = [(ICSRecurrenceRule *)self until];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v15];
      v28 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
      [v27 setTimeZone:v28];

      v29 = [(ICSRecurrenceRule *)self until];
      v30 = [v29 components];
      [v27 dateFromComponents:v30];
      v23 = v31 = v23;
      uint64_t v32 = [v31 earlierDate:v23];
    }
    else
    {
      v27 = [(ICSRecurrenceRule *)self until];
      v29 = [v27 components];
      v30 = [v16 dateFromComponents:v29];
      uint64_t v32 = [v23 earlierDate:v30];
    }

    v23 = (void *)v32;
  }
  v33 = v95;
  v34 = [(ICSRecurrenceRule *)v95 interval];
  if (v34)
  {
    v35 = [(ICSRecurrenceRule *)v95 interval];
    uint64_t v93 = [v35 integerValue];

    v33 = v95;
  }
  else
  {
    uint64_t v93 = 1;
  }
  v97 = v23;

  v36 = [(ICSRecurrenceRule *)v33 count];
  if (v36)
  {
    v37 = [(ICSRecurrenceRule *)v33 count];
    unint64_t v99 = [v37 unsignedIntegerValue];
  }
  else
  {
    unint64_t v99 = -1;
  }

  id v100 = [MEMORY[0x1E4F1CA48] array];
  if ([(ICSRecurrenceRule *)v33 freq] == 7)
  {
    v38 = [(ICSRecurrenceRule *)v33 bymonth];
    uint64_t v39 = [v38 count];

    if (v39 == 1)
    {
      v40 = [(ICSRecurrenceRule *)v33 bymonthday];
      uint64_t v41 = [v40 count];

      if (v41)
      {
        v42 = [v16 components:228 fromDate:v92];
        v43 = [(ICSRecurrenceRule *)v33 bymonth];
        v44 = [v43 objectAtIndex:0];
        objc_msgSend(v42, "setMonth:", objc_msgSend(v44, "integerValue"));

        id v45 = v92;
        uint64_t v46 = [v42 year];
        if ([v100 count] < v99)
        {
          uint64_t v94 = v46;
          id v88 = v11;
          id v89 = v10;
          v47 = v95;
          v96 = v16;
          while (1)
          {
            if ([v45 compare:v23] == 1) {
              goto LABEL_53;
            }
            v48 = [(ICSRecurrenceRule *)v47 byday];
            uint64_t v49 = [v48 count];

            if (!v49) {
              break;
            }
            v50 = [(ICSRecurrenceRule *)v47 byday];
            if ([v50 count] != 1) {
              goto LABEL_34;
            }
            v51 = [(ICSRecurrenceRule *)v47 byday];
            v52 = [v51 objectAtIndex:0];
            v53 = [v52 number];

            v23 = v97;
            if (!v53)
            {
              v60 = [(ICSRecurrenceRule *)v47 byday];
              v50 = [v60 objectAtIndex:0];

              long long v103 = 0u;
              long long v104 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              obuint64_t j = [(ICSRecurrenceRule *)v47 bymonthday];
              uint64_t v61 = [obj countByEnumeratingWithState:&v101 objects:v109 count:16];
              v16 = v96;
              if (v61)
              {
                uint64_t v62 = v61;
                uint64_t v63 = *(void *)v102;
                do
                {
                  for (uint64_t i = 0; i != v62; ++i)
                  {
                    v65 = v45;
                    if (*(void *)v102 != v63) {
                      objc_enumerationMutation(obj);
                    }
                    objc_msgSend(v42, "setDay:", objc_msgSend(*(id *)(*((void *)&v101 + 1) + 8 * i), "integerValue"));
                    id v45 = [v16 dateFromComponents:v42];

                    if ([v100 count] < v99
                      && [v45 compare:v21] != -1
                      && [v45 compare:v23] != 1)
                    {
                      v66 = v21;
                      uint64_t v67 = [v50 weekday];
                      v68 = [v16 components:512 fromDate:v45];
                      uint64_t v69 = [v68 weekday];

                      BOOL v70 = v67 == v69;
                      v21 = v66;
                      v16 = v96;
                      v23 = v97;
                      if (v70) {
                        [v100 addObject:v45];
                      }
                    }
                  }
                  uint64_t v62 = [obj countByEnumeratingWithState:&v101 objects:v109 count:16];
                }
                while (v62);
              }

              goto LABEL_49;
            }
            v16 = v96;
            uint64_t v54 = v94;
LABEL_51:
            [v42 setDay:1];
            uint64_t v94 = v54 + v93;
            [v42 setYear:v54 + v93];
            v71 = [v16 dateFromComponents:v42];

            id v45 = v71;
            if ([v100 count] >= v99) {
              goto LABEL_54;
            }
          }
          long long v107 = 0u;
          long long v108 = 0u;
          long long v105 = 0u;
          long long v106 = 0u;
          v50 = [(ICSRecurrenceRule *)v47 bymonthday];
          uint64_t v55 = [v50 countByEnumeratingWithState:&v105 objects:v110 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v106;
            v23 = v97;
            do
            {
              for (uint64_t j = 0; j != v56; ++j)
              {
                unint64_t v59 = v45;
                if (*(void *)v106 != v57) {
                  objc_enumerationMutation(v50);
                }
                objc_msgSend(v42, "setDay:", objc_msgSend(*(id *)(*((void *)&v105 + 1) + 8 * j), "integerValue"));
                id v45 = [v16 dateFromComponents:v42];

                if ([v100 count] < v99
                  && [v45 compare:v21] != -1
                  && [v45 compare:v97] != 1)
                {
                  [v100 addObject:v45];
                }
              }
              uint64_t v56 = [v50 countByEnumeratingWithState:&v105 objects:v110 count:16];
            }
            while (v56);
LABEL_49:
            id v11 = v88;
            id v10 = v89;
            v47 = v95;
          }
          else
          {
LABEL_34:
            v23 = v97;
          }
          uint64_t v54 = v94;

          goto LABEL_51;
        }
LABEL_53:
        v71 = v45;
LABEL_54:
      }
      else
      {
        v72 = [(ICSRecurrenceRule *)v33 byday];
        if ([v72 count] == 1)
        {
          v73 = [(ICSRecurrenceRule *)v33 byday];
          v74 = [v73 objectAtIndex:0];
          v75 = [v74 number];

          if (!v75) {
            goto LABEL_67;
          }
          v72 = [v16 components:228 fromDate:v92];
          v76 = [(ICSRecurrenceRule *)v33 bymonth];
          v77 = [v76 objectAtIndex:0];
          objc_msgSend(v72, "setMonth:", objc_msgSend(v77, "integerValue"));

          v78 = [(ICSRecurrenceRule *)v33 byday];
          v79 = [v78 objectAtIndex:0];
          objc_msgSend(v72, "setWeekday:", objc_msgSend(v79, "weekday"));

          v80 = [(ICSRecurrenceRule *)v33 byday];
          v81 = [v80 objectAtIndex:0];
          v82 = [v81 number];
          objc_msgSend(v72, "setWeekdayOrdinal:", objc_msgSend(v82, "integerValue"));

          v83 = [v16 dateFromComponents:v72];
          uint64_t v84 = [v72 year];
          if ([v100 count] < v99)
          {
            uint64_t v85 = v84 + v93;
            while ([v83 compare:v97] != 1)
            {
              if ([v83 compare:v21] != -1) {
                [v100 addObject:v83];
              }
              [v72 setYear:v85];
              v86 = [v16 dateFromComponents:v72];

              v85 += v93;
              v83 = v86;
              if ([v100 count] >= v99) {
                goto LABEL_65;
              }
            }
          }
          v86 = v83;
LABEL_65:
        }
      }
    }
  }
LABEL_67:

  return v100;
}

+ (id)recurrenceRuleFromICSCString:(const char *)a3 withTokenizer:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_alloc_init(ICSRecurrenceRule);
  if (a3)
  {
    unint64_t v7 = 0x1E6C24000uLL;
    if (strncmp_s(a3, "FREQ=", 5uLL) || strlen(a3) <= 5)
    {
      +[ICSLogger logAtLevel:3, v5, @"Invalid RRULE %s", a3 forTokenizer message];
      a3 = 0;
      goto LABEL_5;
    }
    objc_super v9 = strdup(a3);
    uint64_t i = v9 + 5;
    if (strncmp_s("YEARLY", v9 + 5, 6uLL))
    {
      if (!strncmp_s("MONTHLY", i, 7uLL))
      {
        [(ICSRecurrenceRule *)v6 setFreq:6];
        uint64_t i = v9 + 12;
        goto LABEL_22;
      }
      if (strncmp_s("WEEKLY", i, 6uLL))
      {
        if (!strncmp_s("DAILY", i, 5uLL))
        {
          [(ICSRecurrenceRule *)v6 setFreq:4];
          uint64_t i = v9 + 10;
          goto LABEL_22;
        }
        if (strncmp_s("HOURLY", i, 6uLL))
        {
          if (strncmp_s("MINUTELY", i, 8uLL))
          {
            if (strncmp_s("SECONDLY", i, 8uLL))
            {
              +[ICSLogger logAtLevel:3, v5, @"RRULE %s Unrecognized frequency %s", a3, i forTokenizer message];
              goto LABEL_22;
            }
            v87 = v6;
            uint64_t v88 = 1;
          }
          else
          {
            v87 = v6;
            uint64_t v88 = 2;
          }
          [(ICSRecurrenceRule *)v87 setFreq:v88];
          uint64_t i = v9 + 13;
LABEL_22:
          if (*i) {
            ++i;
          }
          while (1)
          {
            while (1)
            {
              while (1)
              {
                while (1)
                {
                  int v13 = *(unsigned __int8 *)i;
                  if ((v13 - 9) >= 2 && v13 != 13) {
                    break;
                  }
                  ++i;
                }
                if (!*i)
                {
LABEL_257:
                  free(v9);
                  uint64_t v6 = v6;
                  a3 = (const char *)v6;
                  goto LABEL_5;
                }
                if (strncmp_s("COUNT=", i, 6uLL)) {
                  break;
                }
                v20 = i + 6;
                for (i += 6; *i; ++i)
                {
                  if (*i == 59)
                  {
                    *i++ = 0;
                    break;
                  }
                }
                uint64_t v21 = atoi(v20);
                if ((int)v21 >= 1)
                {
                  v22 = [NSNumber numberWithInt:v21];
                  [(ICSRecurrenceRule *)v6 setCount:v22];
                  goto LABEL_94;
                }
                objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"Invalid COUNT value in recurrence:%s", a3);
              }
              if (strncmp_s("UNTIL=", i, 6uLL)) {
                break;
              }
              for (i += 6; *i; ++i)
              {
                if (*i == 59)
                {
                  *i++ = 0;
                  break;
                }
              }
              v22 = +[ICSDateValue dateFromICSUTF8String:](ICSDateValue, "dateFromICSUTF8String:");
              if (v22) {
                [(ICSRecurrenceRule *)v6 setUntil:v22];
              }
LABEL_94:
            }
            if (strncmp_s("INTERVAL=", i, 9uLL))
            {
              if (strncmp_s("WKST=", i, 5uLL))
              {
                if (!strncmp_s("BYMONTH=", i, 8uLL))
                {
                  v25 = i + 8;
                  v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_81:
                  for (uint64_t i = v25; ; ++i)
                  {
                    int v26 = *(unsigned __int8 *)i;
                    if (!*i) {
                      break;
                    }
                    if (v26 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v26 == 44)
                    {
                      *uint64_t i = 0;
                      uint64_t v27 = atoi(v25);
                      if ((v27 - 1) > 0xB)
                      {
                        objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYMONTH %d", a3, v27);
                      }
                      else
                      {
                        v28 = [NSNumber numberWithInt:v27];
                        [v16 addObject:v28];
                      }
                      v25 = i + 1;
                      goto LABEL_81;
                    }
                  }
                  uint64_t v36 = atoi(v25);
                  if ((v36 - 1) > 0xB)
                  {
                    objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYMONTH %d", a3, v36);
                  }
                  else
                  {
                    v37 = [NSNumber numberWithInt:v36];
                    [v16 addObject:v37];
                  }
                  if ([v16 count]) {
                    [(ICSRecurrenceRule *)v6 setBymonth:v16];
                  }
                  goto LABEL_252;
                }
                if (!strncmp_s("BYYEARDAY=", i, 0xAuLL))
                {
                  v31 = i + 10;
                  v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_96:
                  for (uint64_t i = v31; ; ++i)
                  {
                    int v32 = *(unsigned __int8 *)i;
                    if (!*i) {
                      break;
                    }
                    if (v32 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v32 == 44)
                    {
                      *uint64_t i = 0;
                      uint64_t v33 = atoi(v31);
                      if ((int)v33 >= 0) {
                        unsigned int v34 = v33;
                      }
                      else {
                        unsigned int v34 = -(int)v33;
                      }
                      if (v33 && v34 <= 0x16E)
                      {
                        v35 = [NSNumber numberWithInt:v33];
                        [v16 addObject:v35];
                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYYEARDAY %d", a3, v33);
                      }
                      v31 = i + 1;
                      goto LABEL_96;
                    }
                  }
                  uint64_t v43 = atoi(v31);
                  if ((int)v43 >= 0) {
                    unsigned int v44 = v43;
                  }
                  else {
                    unsigned int v44 = -(int)v43;
                  }
                  if (v43 && v44 <= 0x16E)
                  {
                    id v45 = [NSNumber numberWithInt:v43];
                    [v16 addObject:v45];
                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYYEARDAY %d", a3, v43);
                  }
                  if ([v16 count]) {
                    [(ICSRecurrenceRule *)v6 setByyearday:v16];
                  }
                  goto LABEL_252;
                }
                if (!strncmp_s("BYSETPOS=", i, 9uLL))
                {
                  v38 = i + 9;
                  v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_116:
                  for (uint64_t i = v38; ; ++i)
                  {
                    int v39 = *(unsigned __int8 *)i;
                    if (!*i) {
                      break;
                    }
                    if (v39 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v39 == 44)
                    {
                      *uint64_t i = 0;
                      uint64_t v40 = atoi(v38);
                      if ((int)v40 >= 0) {
                        unsigned int v41 = v40;
                      }
                      else {
                        unsigned int v41 = -(int)v40;
                      }
                      if (v40 && v41 <= 0x16E)
                      {
                        v42 = [NSNumber numberWithInt:v40];
                        [v16 addObject:v42];
                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYSETPOS %d", a3, v40);
                      }
                      v38 = i + 1;
                      goto LABEL_116;
                    }
                  }
                  uint64_t v51 = atoi(v38);
                  if ((int)v51 >= 0) {
                    unsigned int v52 = v51;
                  }
                  else {
                    unsigned int v52 = -(int)v51;
                  }
                  if (v51 && v52 <= 0x16E)
                  {
                    v53 = [NSNumber numberWithInt:v51];
                    [v16 addObject:v53];
                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYSETPOS %d", a3, v51);
                  }
                  if ([v16 count]) {
                    [(ICSRecurrenceRule *)v6 setBysetpos:v16];
                  }
                  goto LABEL_252;
                }
                if (!strncmp_s("BYMONTHDAY=", i, 0xBuLL))
                {
                  uint64_t v46 = i + 11;
                  v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_140:
                  for (uint64_t i = v46; ; ++i)
                  {
                    int v47 = *(unsigned __int8 *)i;
                    if (!*i) {
                      break;
                    }
                    if (v47 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v47 == 44)
                    {
                      *uint64_t i = 0;
                      uint64_t v48 = atoi(v46);
                      if ((int)v48 >= 0) {
                        unsigned int v49 = v48;
                      }
                      else {
                        unsigned int v49 = -(int)v48;
                      }
                      if (v48 && v49 <= 0x1F)
                      {
                        v50 = [NSNumber numberWithInt:v48];
                        [v16 addObject:v50];
                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYMONTHDAY %d", a3, v48);
                      }
                      uint64_t v46 = i + 1;
                      goto LABEL_140;
                    }
                  }
                  uint64_t v59 = atoi(v46);
                  if ((int)v59 >= 0) {
                    unsigned int v60 = v59;
                  }
                  else {
                    unsigned int v60 = -(int)v59;
                  }
                  if (v59 && v60 <= 0x1F)
                  {
                    uint64_t v61 = [NSNumber numberWithInt:v59];
                    [v16 addObject:v61];
                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYMONTHDAY %d", a3, v59);
                  }
                  if ([v16 count]) {
                    [(ICSRecurrenceRule *)v6 setBymonthday:v16];
                  }
                  goto LABEL_252;
                }
                if (!strncmp_s("BYWEEKNO=", i, 9uLL))
                {
                  uint64_t v54 = i + 9;
                  v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_164:
                  for (uint64_t i = v54; ; ++i)
                  {
                    int v55 = *(unsigned __int8 *)i;
                    if (!*i) {
                      break;
                    }
                    if (v55 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v55 == 44)
                    {
                      *uint64_t i = 0;
                      uint64_t v56 = atoi(v54);
                      if ((int)v56 >= 0) {
                        unsigned int v57 = v56;
                      }
                      else {
                        unsigned int v57 = -(int)v56;
                      }
                      if (v56 && v57 <= 0x35)
                      {
                        v58 = [NSNumber numberWithInt:v56];
                        [v16 addObject:v58];
                      }
                      else
                      {
                        objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYWEEKNO %d", a3, v56);
                      }
                      uint64_t v54 = i + 1;
                      goto LABEL_164;
                    }
                  }
                  uint64_t v67 = atoi(v54);
                  if ((int)v67 >= 0) {
                    unsigned int v68 = v67;
                  }
                  else {
                    unsigned int v68 = -(int)v67;
                  }
                  if (v67 && v68 <= 0x35)
                  {
                    uint64_t v69 = [NSNumber numberWithInt:v67];
                    [v16 addObject:v69];
                  }
                  else
                  {
                    objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYWEEKNO %d", a3, v67);
                  }
                  if ([v16 count]) {
                    [(ICSRecurrenceRule *)v6 setByweekno:v16];
                  }
                  goto LABEL_252;
                }
                if (strncmp_s("BYDAY=", i, 6uLL))
                {
                  if (strncmp_s("BYMINUTE=", i, 9uLL))
                  {
                    if (strncmp_s("BYSECOND=", i, 9uLL))
                    {
                      if (strncmp_s("BYHOUR=", i, 7uLL))
                      {
                        [*(id *)(v7 + 3464) logAtLevel:3, v5, @"Unrecognized value in RRULE %s, (%s)", a3, i forTokenizer message];

                        uint64_t v6 = 0;
                        goto LABEL_257;
                      }
                      uint64_t v15 = i + 7;
                      v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_45:
                      for (uint64_t i = v15; ; ++i)
                      {
                        int v17 = *(unsigned __int8 *)i;
                        if (!*i) {
                          break;
                        }
                        if (v17 == 59)
                        {
                          *i++ = 0;
                          break;
                        }
                        if (v17 == 44)
                        {
                          *uint64_t i = 0;
                          uint64_t v18 = atoi(v15);
                          if (v18 > 0x17)
                          {
                            objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYHOUR %d", a3, v18);
                          }
                          else
                          {
                            v19 = [NSNumber numberWithInt:v18];
                            [v16 addObject:v19];
                          }
                          uint64_t v15 = i + 1;
                          goto LABEL_45;
                        }
                      }
                      uint64_t v81 = atoi(v15);
                      if (v81 > 0x17)
                      {
                        objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYHOUR %d", a3, v81);
                      }
                      else
                      {
                        v82 = [NSNumber numberWithInt:v81];
                        [v16 addObject:v82];
                      }
                      if ([v16 count]) {
                        [(ICSRecurrenceRule *)v6 setByhour:v16];
                      }
                    }
                    else
                    {
                      v77 = i + 9;
                      v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_221:
                      for (uint64_t i = v77; ; ++i)
                      {
                        int v78 = *(unsigned __int8 *)i;
                        if (!*i) {
                          break;
                        }
                        if (v78 == 59)
                        {
                          *i++ = 0;
                          break;
                        }
                        if (v78 == 44)
                        {
                          *uint64_t i = 0;
                          uint64_t v79 = atoi(v77);
                          if (v79 > 0x3B)
                          {
                            objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYSECOND %d", a3, v79);
                          }
                          else
                          {
                            v80 = [NSNumber numberWithInt:v79];
                            [v16 addObject:v80];
                          }
                          v77 = i + 1;
                          goto LABEL_221;
                        }
                      }
                      uint64_t v85 = atoi(v77);
                      if (v85 > 0x3B)
                      {
                        objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYSECOND %d", a3, v85);
                      }
                      else
                      {
                        v86 = [NSNumber numberWithInt:v85];
                        [v16 addObject:v86];
                      }
                      if ([v16 count]) {
                        [(ICSRecurrenceRule *)v6 setBysecond:v16];
                      }
                    }
                  }
                  else
                  {
                    BOOL v70 = i + 9;
                    v16 = [MEMORY[0x1E4F1CA48] array];
LABEL_208:
                    for (uint64_t i = v70; ; ++i)
                    {
                      int v71 = *(unsigned __int8 *)i;
                      if (!*i) {
                        break;
                      }
                      if (v71 == 59)
                      {
                        *i++ = 0;
                        break;
                      }
                      if (v71 == 44)
                      {
                        *uint64_t i = 0;
                        uint64_t v72 = atoi(v70);
                        if (v72 > 0x3B)
                        {
                          objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYMINUTE %d", a3, v72);
                        }
                        else
                        {
                          v73 = [NSNumber numberWithInt:v72];
                          [v16 addObject:v73];
                        }
                        BOOL v70 = i + 1;
                        goto LABEL_208;
                      }
                    }
                    uint64_t v83 = atoi(v70);
                    if (v83 > 0x3B)
                    {
                      objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYMINUTE %d", a3, v83);
                    }
                    else
                    {
                      uint64_t v84 = [NSNumber numberWithInt:v83];
                      [v16 addObject:v84];
                    }
                    if ([v16 count]) {
                      [(ICSRecurrenceRule *)v6 setByminute:v16];
                    }
                  }
LABEL_252:
                }
                else
                {
                  uint64_t v62 = i + 6;
                  [MEMORY[0x1E4F1CA48] array];
                  v90 = id v89 = v9;
LABEL_188:
                  for (uint64_t i = v62; ; ++i)
                  {
                    int v63 = *(unsigned __int8 *)i;
                    if (!*i) {
                      break;
                    }
                    if (v63 == 59)
                    {
                      *i++ = 0;
                      break;
                    }
                    if (v63 == 44)
                    {
                      unint64_t v64 = v7;
                      *uint64_t i = 0;
                      v65 = [NSString stringWithUTF8String:v62];
                      v66 = +[ICSByDayValue byDayValueFromICSString:v65];

                      if (v66) {
                        [v90 addObject:v66];
                      }
                      else {
                        objc_msgSend(*(id *)(v64 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Bad value in BYDAY  %s", a3, v62);
                      }
                      uint64_t v62 = i + 1;

                      unint64_t v7 = v64;
                      goto LABEL_188;
                    }
                  }
                  v74 = [NSString stringWithUTF8String:v62];
                  v75 = +[ICSByDayValue byDayValueFromICSString:v74];

                  if (v75)
                  {
                    v76 = v90;
                    [v90 addObject:v75];
                    objc_super v9 = v89;
                  }
                  else
                  {
                    +[ICSLogger logAtLevel:3, v5, @"RRULE %s Bad value in BYDAY %s", a3, v62 forTokenizer message];
                    objc_super v9 = v89;
                    v76 = v90;
                  }
                  if ([v76 count]) {
                    [(ICSRecurrenceRule *)v6 setByday:v76];
                  }

                  unint64_t v7 = 0x1E6C24000;
                }
              }
              else
              {
                for (i += 5; *i; ++i)
                {
                  if (*i == 59)
                  {
                    *i++ = 0;
                    break;
                  }
                }
                v29 = objc_msgSend(NSString, "stringWithUTF8String:");
                int64_t v30 = +[ICSByDayValue weekdayFromICSString:v29];

                if (v30 != -1)
                {
                  v22 = [NSNumber numberWithInteger:v30];
                  [(ICSRecurrenceRule *)v6 setWkst:v22];
                  goto LABEL_94;
                }
              }
            }
            else
            {
              v23 = i + 9;
              for (i += 9; *i; ++i)
              {
                if (*i == 59)
                {
                  *i++ = 0;
                  break;
                }
              }
              uint64_t v24 = atoi(v23);
              if ((int)v24 >= 1)
              {
                v22 = [NSNumber numberWithInt:v24];
                [(ICSRecurrenceRule *)v6 setInterval:v22];
                goto LABEL_94;
              }
              objc_msgSend(*(id *)(v7 + 3464), "logAtLevel:forTokenizer:message:", 3, v5, @"RRULE %s Invalid INTERVAL value in recurrence:%s", a3, v23);
            }
          }
        }
        id v11 = v6;
        uint64_t v12 = 3;
      }
      else
      {
        id v11 = v6;
        uint64_t v12 = 5;
      }
    }
    else
    {
      id v11 = v6;
      uint64_t v12 = 7;
    }
    [(ICSRecurrenceRule *)v11 setFreq:v12];
    uint64_t i = v9 + 11;
    goto LABEL_22;
  }
LABEL_5:

  return (id)(id)a3;
}

- (void)cleanUpForStartDate:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v4 = [(ICSRecurrenceRule *)self until];
      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = -[ICSDateValue initWithYear:month:day:]([ICSDateValue alloc], "initWithYear:month:day:", [v4 year], objc_msgSend(v4, "month"), objc_msgSend(v4, "day"));
          [(ICSRecurrenceRule *)self setUntil:v5];
        }
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

@end