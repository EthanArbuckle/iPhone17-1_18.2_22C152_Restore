@interface OITSUDateFormatCategory
- (OITSUDateFormatCategory)initWithInitialPattern:(id)a3 locale:(id)a4;
- (id)entryForSeparator:(unsigned __int16)a3;
- (id)formatStringsDictionary;
- (id)initialPattern;
- (id)newDateFromString:(id)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(id *)a5 perfect:(BOOL *)a6;
- (void)addSeparator:(unsigned __int16)a3 format:(id)a4 locale:(id)a5;
- (void)dealloc;
@end

@implementation OITSUDateFormatCategory

- (OITSUDateFormatCategory)initWithInitialPattern:(id)a3 locale:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OITSUDateFormatCategory;
  v8 = [(OITSUDateFormatCategory *)&v13 init];
  if (v8)
  {
    ADateFormatter = p_createADateFormatter(v7);
    v8->_initialFormatter = ADateFormatter;
    CFDateFormatterSetFormat(ADateFormatter, v6);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    entries = v8->_entries;
    v8->_entries = v10;
  }
  return v8;
}

- (void)dealloc
{
  CFRelease(self->_initialFormatter);
  v3.receiver = self;
  v3.super_class = (Class)OITSUDateFormatCategory;
  [(OITSUDateFormatCategory *)&v3 dealloc];
}

- (id)initialPattern
{
  v2 = (void *)[(__CFString *)(id)CFDateFormatterGetFormat(self->_initialFormatter) copy];
  return v2;
}

- (id)formatStringsDictionary
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_entries;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        __int16 v15 = 0;
        __int16 v15 = [v10 separator];
        v11 = [NSString stringWithCharacters:&v15 length:1];
        [v3 addObject:v11];

        v12 = [v10 formatStrings];
        [v4 addObject:v12];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  v20[0] = @"keys";
  v20[1] = @"values";
  v21[0] = v3;
  v21[1] = v4;
  objc_super v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v13;
}

- (void)addSeparator:(unsigned __int16)a3 format:(id)a4 locale:(id)a5
{
  uint64_t v6 = a3;
  id v10 = a4;
  id v8 = a5;
  v9 = [(OITSUDateFormatCategory *)self entryForSeparator:v6];
  if (!v9)
  {
    v9 = [[OITSUDateFormatCategoryEntry alloc] initWithSeparator:v6];
    [(NSMutableArray *)self->_entries addObject:v9];
  }
  [(OITSUDateFormatCategoryEntry *)v9 addFormat:v10 locale:v8];
}

- (id)entryForSeparator:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_entries count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->_entries objectAtIndex:v7];
      if ([v8 separator] == v3) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    id v8 = 0;
  }
  return v8;
}

- (id)newDateFromString:(id)a3 forceAllowAMPM:(BOOL)a4 successfulFormatString:(id *)a5 perfect:(BOOL *)a6
{
  BOOL v8 = a4;
  id v10 = (__CFString *)a3;
  CFIndex v11 = [(__CFString *)v10 length];
  v19.location = 0;
  v19.length = v11;
  v12 = 0;
  if (CFDateFormatterGetAbsoluteTimeFromString(self->_initialFormatter, v10, &v19, 0)) {
    BOOL v13 = v19.location == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13 && v19.length >= 1)
  {
    if (v19.length >= v11) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = [(__CFString *)v10 characterAtIndex:v19.length];
    }
    long long v16 = [(OITSUDateFormatCategory *)self entryForSeparator:v15];
    long long v17 = v16;
    if (v16) {
      v12 = (void *)[v16 newDateFromString:v10 forceAllowAMPM:v8 successfulFormatString:a5 perfect:a6];
    }
    else {
      v12 = 0;
    }
  }
  return v12;
}

- (void).cxx_destruct
{
}

@end