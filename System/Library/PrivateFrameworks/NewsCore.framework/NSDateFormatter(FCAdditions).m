@interface NSDateFormatter(FCAdditions)
+ (id)dateFormatterWithFormat:()FCAdditions localeIdentifier:timezone:forReuse:;
+ (uint64_t)dateFormatterWithFormat:()FCAdditions forReuse:;
+ (uint64_t)dateFormatterWithFormat:()FCAdditions localeIdentifier:forReuse:;
+ (uint64_t)dateFormatterWithFormat:()FCAdditions timezone:forReuse:;
- (void)initWithFormat:()FCAdditions localeIdentifier:;
@end

@implementation NSDateFormatter(FCAdditions)

+ (uint64_t)dateFormatterWithFormat:()FCAdditions localeIdentifier:forReuse:
{
  return [a1 dateFormatterWithFormat:a3 localeIdentifier:a4 timezone:0 forReuse:a5];
}

+ (id)dateFormatterWithFormat:()FCAdditions localeIdentifier:timezone:forReuse:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "format != nil");
      *(_DWORD *)buf = 136315906;
      v25 = "+[NSDateFormatter(FCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]";
      __int16 v26 = 2080;
      v27 = "NSDateFormatter+FCAdditions.m";
      __int16 v28 = 1024;
      int v29 = 30;
      __int16 v30 = 2114;
      v31 = v21;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v10)
      {
LABEL_9:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "localeIdentifier != nil");
          *(_DWORD *)buf = 136315906;
          v25 = "+[NSDateFormatter(FCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]";
          __int16 v26 = 2080;
          v27 = "NSDateFormatter+FCAdditions.m";
          __int16 v28 = 1024;
          int v29 = 31;
          __int16 v30 = 2114;
          v31 = v22;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    v18 = 0;
    goto LABEL_12;
  }
  if (!v10) {
    goto LABEL_9;
  }
  v12 = [MEMORY[0x1E4F29060] currentThread];
  v13 = [v12 threadDictionary];
  v14 = [v13 objectForKey:@"NSDateFormatter_FCAdditions_CachedFormatters"];

  if (!v14)
  {
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v15 = [MEMORY[0x1E4F29060] currentThread];
    v16 = [v15 threadDictionary];
    [v16 setObject:v14 forKey:@"NSDateFormatter_FCAdditions_CachedFormatters"];
  }
  v17 = [NSString stringWithFormat:@"%@_%@", v9, v10];
  v18 = [v14 objectForKey:v17];
  if (!v18)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C10]) initWithFormat:v9 localeIdentifier:v10];
    v18 = v20;
    if (v11) {
      [v20 setTimeZone:v11];
    }
    if (v18)
    {
      if (a6) {
        [v14 setObject:v18 forKey:v17];
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "formatter");
        *(_DWORD *)buf = 136315906;
        v25 = "+[NSDateFormatter(FCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]";
        __int16 v26 = 2080;
        v27 = "NSDateFormatter+FCAdditions.m";
        __int16 v28 = 1024;
        int v29 = 57;
        __int16 v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      v18 = 0;
    }
  }

LABEL_12:
  return v18;
}

- (void)initWithFormat:()FCAdditions localeIdentifier:
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[a1 init];
  id v9 = v8;
  if (v8)
  {
    [v8 setDateFormat:v6];
    id v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v7];
    [v9 setLocale:v10];
  }
  return v9;
}

+ (uint64_t)dateFormatterWithFormat:()FCAdditions forReuse:
{
  return [a1 dateFormatterWithFormat:a3 localeIdentifier:@"en_US_POSIX" forReuse:a4];
}

+ (uint64_t)dateFormatterWithFormat:()FCAdditions timezone:forReuse:
{
  return [a1 dateFormatterWithFormat:a3 localeIdentifier:@"en_US_POSIX" timezone:a4 forReuse:a5];
}

@end