@interface NLPLearnerTaskWrapper
+ (id)privacyIdentifierForTask:(int64_t)a3;
+ (int64_t)taskFromRecipe:(id)a3;
+ (void)initialize;
@end

@implementation NLPLearnerTaskWrapper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_2 = (uint64_t)os_log_create("com.apple.NLP", "NLPLearnerTaskWrapper");
    MEMORY[0x270F9A758]();
  }
}

+ (int64_t)taskFromRecipe:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 isEqualToString:@"emoji"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"lm"])
    {
      int64_t v5 = 2;
    }
    else if ([v4 isEqualToString:@"char_lm"])
    {
      int64_t v5 = 3;
    }
    else if ([v4 isEqualToString:@"fragment_lm"])
    {
      int64_t v5 = 5;
    }
    else if ([v4 isEqualToString:@"act"])
    {
      int64_t v5 = 7;
    }
    else
    {
      v7 = sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        +[NLPLearnerTaskWrapper taskFromRecipe:]((uint64_t)v4, v7);
      }
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

+ (id)privacyIdentifierForTask:(int64_t)a3
{
  v4 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
    +[NLPLearnerTaskWrapper privacyIdentifierForTask:](a3, v4);
  }
  return &stru_26E74AEB0;
}

+ (void)taskFromRecipe:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "Unexpected recipe parameter '%@'", (uint8_t *)&v2, 0xCu);
}

+ (void)privacyIdentifierForTask:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "Task %ld doesn't have an associated privacy identifier", (uint8_t *)&v2, 0xCu);
}

@end