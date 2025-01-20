@interface ResetReportValidator
+ (id)ValidatorWithURL:(id)a3;
- (BOOL)validate;
- (BOOL)validate_keys:(id)a3 expected:(id)a4;
- (BOOL)validate_prologue:(id)a3;
- (NSURL)sourcePath;
- (id)withURL:(id)a3;
- (void)setSourcePath:(id)a3;
@end

@implementation ResetReportValidator

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
  v3 = [(ResetReportValidator *)self sourcePath];
  NSLog(@"validating reset report: %@", v3);

  v4 = [(ResetReportValidator *)self sourcePath];
  v5 = [v4 path];
  v6 = +[NSData dataWithContentsOfFile:v5];

  v7 = [@"\n" dataUsingEncoding:4];
  id v8 = [v6 rangeOfData:v7 options:0 range:[v6 length]];

  v9 = [v6 subdataWithRange:0, v8];
  id v15 = 0;
  v10 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:&v15];
  id v11 = v15;
  v12 = v11;
  if (v11 || !v10)
  {
    NSLog(@"unable to decode prologue: %@", v11);
    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = [(ResetReportValidator *)self validate_prologue:v10];
  }

  return v13;
}

- (BOOL)validate_prologue:(id)a3
{
  return [(ResetReportValidator *)self validate_keys:a3 expected:&off_100037CA0];
}

- (BOOL)validate_keys:(id)a3 expected:(id)a4
{
  id v5 = a4;
  v6 = [a3 allKeys];
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

    [(ResetReportValidator *)self setSourcePath:v5];
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
  id v4 = [ResetReportValidator alloc];
  id v5 = [(ResetReportValidator *)v4 withURL:v3];

  return v5;
}

@end