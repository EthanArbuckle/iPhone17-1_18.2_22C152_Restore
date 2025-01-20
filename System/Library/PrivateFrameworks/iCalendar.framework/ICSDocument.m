@interface ICSDocument
- (BOOL)validate:(id *)a3;
- (ICSDocument)initWithCalendar:(id)a3;
- (ICSDocument)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (ICSDocument)initWithData:(id)a3 encoding:(unint64_t)a4 options:(unint64_t)a5 delegate:(id)a6 error:(id *)a7;
- (ICSDocument)initWithData:(id)a3 encoding:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6;
- (ICSDocument)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (ICSDocument)initWithICSString:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)ICSCompressedDataWithOptions:(unint64_t)a3;
- (id)ICSDataWithOptions:(unint64_t)a3;
- (id)ICSStringWithOptions:(unint64_t)a3;
- (id)calendar;
- (void)validateParsedCalendar:(id)a3;
@end

@implementation ICSDocument

- (ICSDocument)initWithICSString:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = [a3 dataUsingEncoding:4];
  v9 = [(ICSDocument *)self initWithData:v8 options:a4 error:a5];

  return v9;
}

- (ICSDocument)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfURL:options:error:", a3, 0);
  if (v8)
  {
    v9 = [(ICSDocument *)self initWithData:v8 options:a4 error:a5];
    self = v9;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (ICSDocument)initWithData:(id)a3 encoding:(unint64_t)a4 options:(unint64_t)a5 error:(id *)a6
{
  return [(ICSDocument *)self initWithData:a3 encoding:a4 options:a5 delegate:0 error:a6];
}

- (ICSDocument)initWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return [(ICSDocument *)self initWithData:a3 encoding:4 options:a4 delegate:0 error:a5];
}

- (ICSDocument)initWithData:(id)a3 encoding:(unint64_t)a4 options:(unint64_t)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a6;
  if (a4 != 4)
  {
    v13 = (void *)[[NSString alloc] initWithData:v11 encoding:a4];
    uint64_t v14 = [v13 dataUsingEncoding:4 allowLossyConversion:1];

    id v11 = (id)v14;
  }
  v15 = +[ICSParser entitiesFromNSData:v11 options:a5];
  if ([v15 count])
  {
    v16 = [v15 objectAtIndex:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v18 = 0;
    if (isKindOfClass)
    {
      v18 = [v15 objectAtIndex:0];
    }
  }
  else
  {
    v18 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = [v12 documentParsedCalendar:v18];

    v18 = (void *)v19;
  }
  if ((a5 & 0x100) == 0) {
    [(ICSDocument *)self validateParsedCalendar:v18];
  }
  v20 = [(ICSDocument *)self initWithCalendar:v18];

  return v20;
}

- (void)validateParsedCalendar:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [v3 components];
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v22 = v3;
    uint64_t v6 = 0;
    id v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        id v28 = 0;
        char v12 = [v11 validate:&v28];
        id v13 = v28;
        if ((v12 & 1) == 0)
        {
          +[ICSLogger logAtLevel:3, 0, @"Invalid component, discarding: %@\n%@", v13, v11 forTokenizer message];
          if (!v8)
          {
            id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            uint64_t v14 = [v22 parsingErrors];
            uint64_t v15 = [v14 mutableCopy];

            id v7 = (id)v15;
          }
          [v8 addIndex:v6 + i];
          [v7 addObject:v13];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      v6 += i;
    }
    while (v5);

    if (!v8)
    {
      id v3 = v22;
      goto LABEL_27;
    }
    id v3 = v22;
    v16 = [v22 components];
    v17 = (void *)[v16 mutableCopy];

    [v17 removeObjectsAtIndexes:v8];
    obuint64_t j = v17;
    [v22 setComponents:v17];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v7;
    uint64_t v18 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v7);
          }
          [v22 addParsingError:*(void *)(*((void *)&v24 + 1) + 8 * j)];
        }
        uint64_t v19 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v8 = 0;
    id v7 = 0;
  }

LABEL_27:
}

- (ICSDocument)initWithCalendar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSDocument;
  uint64_t v6 = [(ICSDocument *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_calendar, a3);
  }

  return v7;
}

- (id)calendar
{
  return self->_calendar;
}

- (id)ICSDataWithOptions:(unint64_t)a3
{
  if (self->_calendar)
  {
    uint64_t v4 = [(ICSDocument *)self ICSStringWithOptions:a3];
    id v5 = [v4 dataUsingEncoding:4];
    if (!v5)
    {
      NSLog(&cfstr_Datawithcalend.isa, self->_calendar);
      id v5 = [v4 dataUsingEncoding:4 allowLossyConversion:1];
      if (!v5) {
        NSLog(&cfstr_Datawithcalend_0.isa);
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)ICSStringWithOptions:(unint64_t)a3
{
  if (self->_calendar)
  {
    id v5 = objc_alloc_init(ICSStringWriter);
    [(ICSComponent *)self->_calendar ICSStringWithOptions:a3 appendingToString:v5];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(ICSStringWriter *)v5 result];

  return v6;
}

- (id)ICSCompressedDataWithOptions:(unint64_t)a3
{
  if (self->_calendar)
  {
    id v5 = objc_alloc_init(ICSZStringWriter);
    [(ICSComponent *)self->_calendar ICSStringWithOptions:a3 appendingToString:v5];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(ICSZStringWriter *)v5 zResult];

  return v6;
}

- (BOOL)validate:(id *)a3
{
  return [(ICSComponent *)self->_calendar validate:a3];
}

- (void).cxx_destruct
{
}

@end