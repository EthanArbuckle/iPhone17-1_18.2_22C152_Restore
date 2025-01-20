@interface OITSUDateFormatCategoryEntry
- (OITSUDateFormatCategoryEntry)initWithSeparator:(unsigned __int16)a3;
- (id)formatStrings;
- (id)newDateFromString:(id)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(id *)a5 perfect:(BOOL *)a6;
- (unsigned)separator;
- (void)addFormat:(id)a3 locale:(id)a4;
@end

@implementation OITSUDateFormatCategoryEntry

- (OITSUDateFormatCategoryEntry)initWithSeparator:(unsigned __int16)a3
{
  v11.receiver = self;
  v11.super_class = (Class)OITSUDateFormatCategoryEntry;
  v4 = [(OITSUDateFormatCategoryEntry *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_separator = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    formatters = v5->_formatters;
    v5->_formatters = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    formatStrings = v5->_formatStrings;
    v5->_formatStrings = v8;
  }
  return v5;
}

- (unsigned)separator
{
  return self->_separator;
}

- (id)formatStrings
{
  v3 = [MEMORY[0x263EFF980] array];
  if ([(NSMutableArray *)self->_formatters count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = CFDateFormatterGetFormat((CFDateFormatterRef)[(NSMutableArray *)self->_formatters objectAtIndex:v4]);
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_formatters count]);
  }
  return v3;
}

- (void)addFormat:(id)a3 locale:(id)a4
{
  formatString = (__CFString *)a3;
  id v6 = a4;
  if (([(NSMutableSet *)self->_formatStrings containsObject:formatString] & 1) == 0)
  {
    [(NSMutableSet *)self->_formatStrings addObject:formatString];
    ADateFormatter = p_createADateFormatter(v6);
    CFDateFormatterSetFormat(ADateFormatter, formatString);
    [(NSMutableArray *)self->_formatters addObject:ADateFormatter];
  }
}

- (id)newDateFromString:(id)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(id *)a5 perfect:(BOOL *)a6
{
  BOOL v36 = a4;
  v9 = (__CFString *)a3;
  CFIndex v10 = [(__CFString *)v9 length];
  v35 = self;
  uint64_t v11 = [(NSMutableArray *)self->_formatters count];
  v32 = a6;
  *a6 = 0;
  unint64_t v34 = v11;
  if (!v11)
  {
    CFDateRef v27 = 0;
    id v26 = 0;
    CFDateRef v16 = 0;
    goto LABEL_34;
  }
  CFDateRef v33 = 0;
  v31 = 0;
  CFStringRef v12 = (const __CFString *)*MEMORY[0x263EFFB88];
  CFStringRef v13 = (const __CFString *)*MEMORY[0x263EFFBB8];
  unint64_t v14 = 1;
  do
  {
    v15 = (__CFDateFormatter *)-[NSMutableArray objectAtIndex:](v35->_formatters, "objectAtIndex:", v14 - 1, v31);
    rangep.location = 0;
    rangep.length = v10;
    CFDateRef v16 = CFDateFormatterCreateDateFromString(0, v15, v9, &rangep);
    if (v16) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = !v36;
    }
    if (!v17)
    {
      v18 = (void *)CFDateFormatterCopyProperty(v15, v12);
      v19 = (void *)CFDateFormatterCopyProperty(v15, v13);
      CFDateFormatterSetProperty(v15, v12, @"AM");
      CFDateFormatterSetProperty(v15, v13, @"PM");
      rangep.location = 0;
      rangep.length = v10;
      CFDateRef v16 = CFDateFormatterCreateDateFromString(0, v15, v9, &rangep);
      CFDateFormatterSetProperty(v15, v12, v18);
      CFDateFormatterSetProperty(v15, v13, v19);
    }
    if (v16)
    {
      v20 = CFDateFormatterGetFormat(v15);
      CFDateRef v21 = (const __CFDate *)(id)TSUCreateDateWithGregorianUnitsSetToDefaultValue(v16, v20);

      if (a5) {
        *a5 = v20;
      }
      StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v15, v21);
      if (![(__CFString *)v9 compare:StringWithDate options:1])
      {
        BOOL *v32 = 1;
        CFDateRef v16 = v21;
LABEL_23:

        goto LABEL_24;
      }
      CFDateRef v23 = v33;
      if (!v33 && !rangep.location)
      {
        if (rangep.length == v10)
        {
          if (!a5)
          {
            CFDateRef v16 = 0;
            CFDateRef v33 = v21;
            goto LABEL_23;
          }
          id v24 = *a5;

          CFDateRef v33 = v21;
          v31 = v24;
LABEL_20:
          CFDateRef v16 = 0;
          *a5 = 0;
          goto LABEL_23;
        }
        CFDateRef v23 = 0;
      }
      CFDateRef v33 = v23;

      if (!a5)
      {
        CFDateRef v16 = 0;
        goto LABEL_23;
      }
      goto LABEL_20;
    }
LABEL_24:
    if (v16) {
      break;
    }
  }
  while (v14++ < v34);
  if (v16)
  {
    id v26 = v31;
    CFDateRef v27 = v33;
  }
  else
  {
    id v26 = v31;
    CFDateRef v27 = v33;
    if (v33)
    {
      CFDateRef v28 = v33;
      if (a5)
      {
        CFDateRef v27 = v28;
        id v26 = v31;
        *a5 = v26;
        CFDateRef v16 = v27;
      }
      else
      {
        CFDateRef v16 = v28;
        CFDateRef v27 = v28;
      }
    }
  }
LABEL_34:
  CFDateRef v29 = v16;

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStrings, 0);
  objc_storeStrong((id *)&self->_formatters, 0);
}

@end