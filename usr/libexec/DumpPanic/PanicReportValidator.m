@interface PanicReportValidator
+ (id)ValidatorWithURL:(id)a3;
- (BOOL)validate;
- (BOOL)validate_ext_paniclog:(id)a3 key:(id)a4;
- (BOOL)validate_key_in_log:(id)a3 present:(BOOL)a4;
- (BOOL)validate_keys:(id)a3 expected:(id)a4;
- (BOOL)validate_paniclog:(id)a3;
- (BOOL)validate_prologue:(id)a3;
- (NSURL)sourcePath;
- (id)get_paniclog_json;
- (id)withURL:(id)a3;
- (void)setSourcePath:(id)a3;
@end

@implementation PanicReportValidator

- (void).cxx_destruct
{
}

- (void)setSourcePath:(id)a3
{
}

- (NSURL)sourcePath
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)validate
{
  v3 = [(PanicReportValidator *)self sourcePath];
  NSLog(@"validating panic report: %@", v3);

  v4 = [(PanicReportValidator *)self sourcePath];
  v5 = [v4 path];
  v6 = +[NSData dataWithContentsOfFile:v5];

  v7 = [@"\n" dataUsingEncoding:4];
  unint64_t v8 = (unint64_t)[v6 rangeOfData:v7 options:0 range:[v6 length]];

  v9 = [v6 subdataWithRange:0, v8];
  v10 = [v6 subdataWithRange:v8 + 1, (char *)[v6 length] + ~v8];
  id v19 = 0;
  v11 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:&v19];
  id v12 = v19;
  v13 = v12;
  if (!v12 && v11)
  {
    id v18 = 0;
    v14 = +[NSJSONSerialization JSONObjectWithData:v10 options:0 error:&v18];
    id v15 = v18;
    v13 = v15;
    if (v15 || !v14)
    {
      NSLog(@"unable to decode paniclog: %@", v15);
    }
    else if ([(PanicReportValidator *)self validate_prologue:v11])
    {
      BOOL v16 = [(PanicReportValidator *)self validate_paniclog:v14];
LABEL_10:

      goto LABEL_11;
    }
    BOOL v16 = 0;
    goto LABEL_10;
  }
  NSLog(@"unable to decode prologue: %@", v12);
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)validate_paniclog:(id)a3
{
  return [(PanicReportValidator *)self validate_keys:a3 expected:&off_100037C88];
}

- (BOOL)validate_prologue:(id)a3
{
  return [(PanicReportValidator *)self validate_keys:a3 expected:&off_100037C70];
}

- (BOOL)validate_ext_paniclog:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PanicReportValidator *)self get_paniclog_json];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 valueForKey:@"ExtensiblePaniclog"];
    v11 = v10;
    if (v7)
    {
      id v12 = [v10 valueForKey:v7];
      v13 = [v6 valueForKey:v7];
      id v14 = [v12 count];
      if (v14 == [v13 count])
      {
        if ([v12 count])
        {
          unint64_t v15 = 0;
          do
          {
            BOOL v16 = [v12 objectAtIndexedSubscript:v15];
            v17 = [v13 objectAtIndexedSubscript:v15];
            unsigned __int8 v18 = [v16 isEqualToDictionary:v17];

            if ((v18 & 1) == 0) {
              break;
            }
            ++v15;
          }
          while ((unint64_t)[v12 count] > v15);
        }
        else
        {
          unsigned __int8 v18 = 1;
        }
      }
      else
      {
        NSLog(@"Array count does not match");
        unsigned __int8 v18 = 0;
      }
    }
    else
    {
      unsigned __int8 v18 = [v10 isEqualToDictionary:v6];
    }
  }
  else
  {
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (BOOL)validate_key_in_log:(id)a3 present:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(PanicReportValidator *)self get_paniclog_json];
  unint64_t v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForKey:v6];
    BOOL v10 = v9 == 0;

    BOOL v11 = v10 ^ a4;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)get_paniclog_json
{
  v2 = [(PanicReportValidator *)self sourcePath];
  v3 = [v2 path];
  v4 = +[NSData dataWithContentsOfFile:v3];

  v5 = [@"\n" dataUsingEncoding:4];
  unint64_t v6 = (unint64_t)[v4 rangeOfData:v5 options:0 range:[v4 length]];

  id v7 = [v4 subdataWithRange:NSMakeRange(v6 + 1, [v4 length] + ~v6)];
  id v13 = 0;
  unint64_t v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v13];
  id v9 = v13;
  BOOL v10 = v9;
  if (v9 || !v8)
  {
    NSLog(@"unable to decode paniclog: %@", v9);
    id v11 = 0;
  }
  else
  {
    id v11 = v8;
  }

  return v11;
}

- (BOOL)validate_keys:(id)a3 expected:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [a3 allKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (([v6 containsObject:v12] & 1) == 0)
        {
          NSLog(@"missing key: %@", v12);
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)withURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;

    [(PanicReportValidator *)self setSourcePath:v5];
    return self;
  }
  else
  {
    _os_assert_log();
    id result = (id)_os_crash();
    __break(1u);
  }
  return result;
}

+ (id)ValidatorWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [PanicReportValidator alloc];
  id v5 = [(PanicReportValidator *)v4 withURL:v3];

  return v5;
}

@end