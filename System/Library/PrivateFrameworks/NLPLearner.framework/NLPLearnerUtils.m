@interface NLPLearnerUtils
+ (BOOL)checkVietnameseCharactersInText:(id)a3;
+ (BOOL)isInternalInstall;
+ (id)getAttachmentURLByName:(id)a3 attachments:(id)a4 error:(id *)a5;
+ (id)getAttachmentURLByName:(id)a3 inDirectory:(id)a4 error:(id *)a5;
+ (id)languageForText:(id)a3;
+ (id)languageForText:(id)a3 checkVietnamese:(BOOL)a4;
+ (id)messageContentForEvent:(id)a3;
+ (id)messageContentForEvent:(id)a3 andLanguage:(id)a4;
+ (unint64_t)sourceForEvent:(id)a3;
+ (void)initialize;
+ (void)removeTemporaryFile:(id)a3;
@end

@implementation NLPLearnerUtils

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_0 = (uint64_t)os_log_create("com.apple.NLPLearner", "NLPLearnerUtils");
    MEMORY[0x270F9A758]();
  }
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global);
  }
  return isInternalInstall_sIsInternalInstall;
}

uint64_t __36__NLPLearnerUtils_isInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalInstall_sIsInternalInstall = result;
  return result;
}

+ (id)getAttachmentURLByName:(id)a3 inDirectory:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x263F08850];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 defaultManager];
  v11 = [v10 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:0 options:0 error:a5];

  v12 = +[NLPLearnerUtils getAttachmentURLByName:v9 attachments:v11 error:a5];

  return v12;
}

+ (id)getAttachmentURLByName:(id)a3 attachments:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F08850] defaultManager];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v16 = [v15 lastPathComponent];
        int v17 = [v16 hasSuffix:v7];

        if (v17)
        {
          v21 = [v15 path];
          char v22 = [v9 fileExistsAtPath:v21 isDirectory:0];

          if (v22)
          {
            a5 = v15;
          }
          else if (a5)
          {
            v23 = (void *)MEMORY[0x263F087E8];
            uint64_t v33 = *MEMORY[0x263F08320];
            v24 = [NSString stringWithFormat:@"%@ resource not downloaded", v7];
            v34 = v24;
            v25 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            *a5 = [v23 errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:5 userInfo:v25];

            a5 = 0;
          }
          v19 = v10;
          goto LABEL_16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (a5)
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v19 = [NSString stringWithFormat:@"missing %@ resource for PFL", v7];
    v32 = v19;
    v20 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    *a5 = [v18 errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:5 userInfo:v20];

    a5 = 0;
LABEL_16:
  }
  return a5;
}

+ (void)removeTemporaryFile:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08850]);
  id v7 = 0;
  int v5 = [v4 removeItemAtPath:v3 error:&v7];
  id v6 = v7;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG)) {
      +[NLPLearnerUtils removeTemporaryFile:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR))
  {
    +[NLPLearnerUtils removeTemporaryFile:]();
  }
}

+ (id)messageContentForEvent:(id)a3
{
  id v3 = [a3 interaction];
  id v4 = INTypedInteractionWithInteraction();

  int v5 = [v4 intent];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 content];
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG)) {
      +[NLPLearnerUtils messageContentForEvent:]();
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v5 _nonNilParameters],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 containsObject:@"userTypedContent"],
          v7,
          v8))
    {
      id v6 = [v5 userTypedContent];
      if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG)) {
        +[NLPLearnerUtils messageContentForEvent:]();
      }
    }
    else
    {
      id v9 = sLog_0;
      if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR)) {
        +[NLPLearnerUtils messageContentForEvent:](v9);
      }
      id v6 = 0;
    }
  }

  return v6;
}

+ (id)messageContentForEvent:(id)a3 andLanguage:(id)a4
{
  id v5 = a4;
  id v6 = +[NLPLearnerUtils messageContentForEvent:a3];
  if (v6
    && (+[NLPLearnerUtils languageForText:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:v5],
        v7,
        (v8 & 1) != 0))
  {
    if ((unint64_t)[v6 length] > 0x1D
      || ([v5 isEqualToString:*MEMORY[0x263F13E68]] & 1) != 0)
    {
      id v9 = v6;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG)) {
      +[NLPLearnerUtils messageContentForEvent:andLanguage:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_DEBUG))
  {
    +[NLPLearnerUtils messageContentForEvent:andLanguage:]();
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

+ (unint64_t)sourceForEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 source];
  id v5 = [v4 bundleID];
  char v6 = [v5 containsString:@"MobileSMS"];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else
  {
    char v8 = [v3 source];
    id v9 = [v8 bundleID];
    char v10 = [v9 containsString:@"mobilemail"];

    if (v10)
    {
      unint64_t v7 = 2;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_0, OS_LOG_TYPE_ERROR)) {
        +[NLPLearnerUtils sourceForEvent:]();
      }
      unint64_t v7 = 0;
    }
  }

  return v7;
}

+ (id)languageForText:(id)a3
{
  return +[NLPLearnerUtils languageForText:a3 checkVietnamese:1];
}

+ (id)languageForText:(id)a3 checkVietnamese:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (v4 && ([(id)objc_opt_class() checkVietnameseCharactersInText:v5] & 1) != 0) {
    char v6 = (Class *)0x263F13FE8;
  }
  else {
    char v6 = (Class *)0x263F14018;
  }
  id v7 = objc_alloc_init(*v6);
  [v7 processString:v5];
  char v8 = [v7 dominantLanguage];

  return v8;
}

+ (BOOL)checkVietnameseCharactersInText:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 vietnameseCharacterSet];
  uint64_t v6 = [v4 rangeOfCharacterFromSet:v5];

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)removeTemporaryFile:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234530000, v0, v1, "Removed temporary file %@", v2, v3, v4, v5, v6);
}

+ (void)removeTemporaryFile:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_234530000, v0, OS_LOG_TYPE_ERROR, "Failed to remove temporary file %@: %@", v1, 0x16u);
}

+ (void)messageContentForEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234530000, v0, v1, "Processing sent message from CoreDuet: '%{sensitive}@'", v2, v3, v4, v5, v6);
}

+ (void)messageContentForEvent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234530000, v0, v1, "Processing sent email from CoreDuet:\n'%{sensitive}@'", v2, v3, v4, v5, v6);
}

+ (void)messageContentForEvent:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_234530000, log, OS_LOG_TYPE_ERROR, "Failed to extract message for CoreDuet event's intent", v1, 2u);
}

+ (void)messageContentForEvent:andLanguage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_234530000, v0, OS_LOG_TYPE_DEBUG, "'%{sensitive}@' discarded (detected language not matching %@)", v1, 0x16u);
}

+ (void)messageContentForEvent:andLanguage:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234530000, v0, v1, "'%{sensitive}@' discarded (too short)", v2, v3, v4, v5, v6);
}

+ (void)sourceForEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234530000, v0, OS_LOG_TYPE_ERROR, "Telemtry not supported for CoreDuet event %@", v1, 0xCu);
}

@end