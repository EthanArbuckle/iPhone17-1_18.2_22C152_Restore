@interface NSDateFormatter(RCAdditions)
+ (id)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:;
+ (uint64_t)dateFormatterWithFormat:()RCAdditions forReuse:;
+ (uint64_t)dateFormatterWithFormat:()RCAdditions localeIdentifier:forReuse:;
+ (uint64_t)dateFormatterWithFormat:()RCAdditions timezone:forReuse:;
- (void)initWithFormat:()RCAdditions localeIdentifier:;
@end

@implementation NSDateFormatter(RCAdditions)

+ (uint64_t)dateFormatterWithFormat:()RCAdditions forReuse:
{
  return [a1 dateFormatterWithFormat:a3 localeIdentifier:@"en_US_POSIX" forReuse:a4];
}

+ (uint64_t)dateFormatterWithFormat:()RCAdditions localeIdentifier:forReuse:
{
  return [a1 dateFormatterWithFormat:a3 localeIdentifier:a4 timezone:0 forReuse:a5];
}

+ (uint64_t)dateFormatterWithFormat:()RCAdditions timezone:forReuse:
{
  return [a1 dateFormatterWithFormat:a3 localeIdentifier:@"en_US_POSIX" timezone:a4 forReuse:a5];
}

+ (id)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      +[NSDateFormatter(RCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]();
      if (!v10)
      {
LABEL_9:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          +[NSDateFormatter(RCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]();
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
  v14 = [v13 objectForKey:@"NSDateFormatter_RCAdditions_CachedFormatters"];

  if (!v14)
  {
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    v15 = [MEMORY[0x1E4F29060] currentThread];
    v16 = [v15 threadDictionary];
    [v16 setObject:v14 forKey:@"NSDateFormatter_RCAdditions_CachedFormatters"];
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
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[NSDateFormatter(RCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]();
      }
      v18 = 0;
    }
  }

LABEL_12:

  return v18;
}

- (void)initWithFormat:()RCAdditions localeIdentifier:
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

+ (void)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"localeIdentifier != nil", v6, 2u);
}

+ (void)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"format != nil", v6, 2u);
}

+ (void)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"invalid nil value for '%s'"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"formatter", v6, 2u);
}

@end