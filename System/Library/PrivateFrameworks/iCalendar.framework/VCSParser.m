@interface VCSParser
+ (id)parseVCSData:(id)a3;
+ (id)parseVCSFile:(id)a3;
+ (unint64_t)beginVCSEntity:(id)a3 withParseState:(id)a4;
+ (unint64_t)decodeVCSLine:(id)a3 withParseState:(id)a4;
+ (unint64_t)endVCSEntity:(id)a3 withParseState:(id)a4;
@end

@implementation VCSParser

+ (id)parseVCSFile:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithContentsOfFile:v5];

  [v6 increaseLengthBy:1];
  v7 = [a1 parseVCSData:v6];

  return v7;
}

+ (id)parseVCSData:(id)a3
{
  id v3 = a3;
  v4 = [[VCSParserInputStream alloc] initWithData:v3];
  if (!v4)
  {
    VCSLogHandle();
    v8 = (VCSParseState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR)) {
      +[VCSParser parseVCSData:]();
    }
    v23 = 0;
    goto LABEL_38;
  }
  id v25 = v3;
  size_t v5 = 100;
  v6 = malloc_type_malloc(0x64uLL, 0x401CF266uLL);
  v7 = malloc_type_malloc(0x64uLL, 0x877CCA7EuLL);
  v8 = objc_alloc_init(VCSParseState);
  v27 = objc_alloc_init(VCSParsedLine);
  v24 = v29;
  size_t v9 = 100;
  while (1)
  {
    size_t __size = v5;
    uint64_t v10 = -[VCSParserInputStream getLine:withSize:](v4, "getLine:withSize:", v6, &__size, v24);
    if (v10 == 3) {
      break;
    }
LABEL_6:
    uint64_t v12 = v10;
    if (v10)
    {
LABEL_7:
      if (!v12) {
        goto LABEL_27;
      }
      if (v12 == 4)
      {
        free(v6);
        free(v7);
        v22 = [(VCSParseState *)v8 calendars];
        v23 = (void *)[v22 copy];

        goto LABEL_34;
      }
    }
    else
    {
      if ([(VCSParserInputStream *)v4 isContinued])
      {
        while (1)
        {
          size_t __size = v9;
          uint64_t v13 = [(VCSParserInputStream *)v4 getLine:v7 withSize:&__size];
          if (v13 == 3)
          {
            size_t v9 = __size;
            v7 = malloc_type_realloc(v7, __size, 0xA2DC7BC8uLL);
            uint64_t v13 = [(VCSParserInputStream *)v4 getLine:v7 withSize:&__size];
          }
          uint64_t v12 = v13;
          if (!v13)
          {
            for (i = (const char *)v7; ; ++i)
            {
              int v15 = *(unsigned __int8 *)i;
              if (v15 != 32 && v15 != 9) {
                break;
              }
            }
            size_t v17 = strlen((const char *)v6);
            size_t v18 = v17 + strlen(i) + 2;
            if (v5 < v18)
            {
              v6 = reallocf(v6, v18);
              size_t v5 = v18;
            }
            if (!v6) {
              goto LABEL_33;
            }
            strlcat((char *)v6, "\n", v5);
            strlcat((char *)v6, i, v5);
          }
          if (![(VCSParserInputStream *)v4 isContinued]) {
            goto LABEL_7;
          }
        }
      }
LABEL_27:
      [(VCSParseState *)v8 setLineNumber:[(VCSParserInputStream *)v4 lineNum]];
      v19 = [(VCSParsedLine *)v27 loadFromCString:v6 withParseState:v8];
      if (v19 && [a1 decodeVCSLine:v19 withParseState:v8] == 2)
      {
        v20 = VCSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          +[VCSParser parseVCSData:v20];
        }
      }
    }
  }
  size_t v5 = __size;
  v11 = reallocf(v6, __size);
  if (v11)
  {
    v6 = v11;
    uint64_t v10 = [(VCSParserInputStream *)v4 getLine:v11 withSize:&__size];
    goto LABEL_6;
  }
LABEL_33:
  free(v7);

  v23 = 0;
LABEL_34:
  id v3 = v25;
LABEL_38:

  return v23;
}

+ (unint64_t)decodeVCSLine:(id)a3 withParseState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 type];
  if (v8 == 3)
  {
    v11 = [[VCSProperty alloc] initWithVCSLine:v6 parseState:v7];
    if (!v11)
    {
LABEL_15:
      uint64_t v10 = [v7 status];
      goto LABEL_16;
    }
    uint64_t v12 = v11;
    uint64_t v13 = [v7 currentEntity];
    [v13 setProperty:v12];

    v14 = v7;
    uint64_t v15 = 0;
LABEL_14:
    [v14 setStatus:v15];
    goto LABEL_15;
  }
  if (v8 != 1)
  {
    v16 = VCSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[VCSParser decodeVCSLine:withParseState:](v6, v16);
    }
    goto LABEL_13;
  }
  uint64_t v9 = [v6 tokenID];
  if (v9 == 2)
  {
    uint64_t v10 = [a1 endVCSEntity:v6 withParseState:v7];
    goto LABEL_16;
  }
  if (v9 != 1)
  {
    v16 = VCSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[VCSParser decodeVCSLine:withParseState:]();
    }
LABEL_13:

    v14 = v7;
    uint64_t v15 = 1;
    goto LABEL_14;
  }
  uint64_t v10 = [a1 beginVCSEntity:v6 withParseState:v7];
LABEL_16:
  unint64_t v17 = v10;

  return v17;
}

+ (unint64_t)beginVCSEntity:(id)a3 withParseState:(id)a4
{
  id v5 = a4;
  uint64_t v19 = 0;
  id v6 = a3;
  uint64_t v7 = [v5 context];
  id v8 = [NSString alloc];
  uint64_t v9 = [v6 content];

  uint64_t v10 = (void *)[v8 initWithData:v9 encoding:1];
  int64_t v11 = +[VCSParsedLine tokenizeNSStringKeyword:v10 withType:&v19];
  if (v19 != 2)
  {
    uint64_t v12 = VCSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[VCSParser beginVCSEntity:withParseState:].cold.4((uint64_t)v10, v5, v12);
    }
    goto LABEL_19;
  }
  if ((unint64_t)(v11 - 4) >= 2)
  {
    if (v11 == 3)
    {
      if (!v7)
      {
        unint64_t v17 = objc_opt_new();
        [v5 setCurrentCalendar:v17];

        size_t v18 = [v5 currentCalendar];
        [v5 setCurrentEntity:v18];

        [v5 setContext:1];
        goto LABEL_20;
      }
      uint64_t v13 = VCSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[VCSParser beginVCSEntity:withParseState:]();
      }
    }
    else
    {
      uint64_t v13 = VCSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[VCSParser beginVCSEntity:withParseState:]();
      }
    }
  }
  else
  {
    if (v7 == 1)
    {
      if (v11 == 4)
      {
        uint64_t v12 = objc_opt_new();
        [v5 setContext:2];
      }
      else
      {
        uint64_t v12 = 0;
      }
      [v5 setCurrentEntity:v12];
LABEL_19:

LABEL_20:
      uint64_t v14 = 0;
      goto LABEL_21;
    }
    uint64_t v13 = VCSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[VCSParser beginVCSEntity:withParseState:]();
    }
  }

  uint64_t v14 = 1;
LABEL_21:
  [v5 setStatus:v14];
  unint64_t v15 = [v5 status];

  return v15;
}

+ (unint64_t)endVCSEntity:(id)a3 withParseState:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v40 = 0;
  uint64_t v7 = [v6 context];
  id v8 = [NSString alloc];
  uint64_t v9 = [v5 content];
  uint64_t v10 = (void *)[v8 initWithData:v9 encoding:1];

  int64_t v11 = +[VCSParsedLine tokenizeNSStringKeyword:v10 withType:&v40];
  if (v40 != 2)
  {
    uint64_t v14 = VCSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[VCSParser endVCSEntity:withParseState:].cold.5();
    }
    goto LABEL_9;
  }
  if (v11 == 5)
  {
    if (v7 != 3)
    {
      v32 = VCSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        +[VCSParser endVCSEntity:withParseState:]();
      }
      goto LABEL_35;
    }
    v16 = [v6 currentEntity];
    goto LABEL_28;
  }
  if (v11 == 4)
  {
    if (v7 != 2)
    {
      v32 = VCSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        +[VCSParser endVCSEntity:withParseState:].cold.4();
      }
      goto LABEL_35;
    }
    v16 = [v6 currentEntity];
    [v16 ensureDurationAlarms];
    if ([v16 hasPropertyWithName:@"DTSTART"]
      && ([v16 hasPropertyWithName:@"DTEND"] & 1) == 0)
    {
      unint64_t v17 = [v16 startDate];
      size_t v18 = [v17 dateByAddingDays:1];
      [v16 setEndDate:v18];

      [v16 setFullDayEvent:1];
    }
    if ([v16 hasPropertyWithName:@"EXDATE"])
    {
      v34 = v10;
      id v35 = v5;
      uint64_t v19 = objc_opt_new();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v20 = [v16 propertyForName:@"EXDATE"];
      v21 = [v20 values];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "value", v34, v35);
            v27 = [v16 startDate];
            v28 = [v26 dateWithTimeComponentsFromDate:v27];

            [v19 addObject:v28];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v23);
      }

      if ([v19 count])
      {
        [v16 removePropertyForName:@"EXDATE"];
        v29 = [[VCSProperty alloc] initWithName:@"EXDATE" rawValues:v19 type:7];
        [v16 setProperty:v29];
      }
      uint64_t v10 = v34;
      id v5 = v35;
    }
LABEL_28:
    v30 = objc_msgSend(v6, "currentCalendar", v34, v35);
    [v30 addChildEntity:v16];

    v31 = [v6 currentCalendar];
    [v6 setCurrentEntity:v31];

    unint64_t v15 = 1;
    [v6 setContext:1];

    goto LABEL_36;
  }
  if (v11 != 3)
  {
    v32 = VCSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      +[VCSParser endVCSEntity:withParseState:]();
    }
LABEL_35:

    unint64_t v15 = 0;
    goto LABEL_36;
  }
  if (v7 != 1)
  {
    uint64_t v14 = VCSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[VCSParser endVCSEntity:withParseState:]();
    }
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v12 = [v6 calendars];
  uint64_t v13 = [v6 currentCalendar];
  [v12 addObject:v13];

  [v6 setCurrentCalendar:0];
  [v6 setCurrentEntity:0];
  [v6 setContext:0];
LABEL_10:
  unint64_t v15 = 1;
LABEL_36:

  return v15;
}

+ (void)parseVCSData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB9BF000, v0, v1, "Invalid NSData.", v2, v3, v4, v5, v6);
}

+ (void)parseVCSData:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DB9BF000, log, OS_LOG_TYPE_ERROR, "Fatal vCalendar parser error !", buf, 2u);
}

+ (void)decodeVCSLine:(void *)a1 withParseState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 keyword];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1DB9BF000, a2, OS_LOG_TYPE_ERROR, "Unexpeced token type: %@", v4, 0xCu);
}

+ (void)decodeVCSLine:withParseState:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB9BF000, v0, v1, "Wrong token as delimeter: %ld", v2, v3, v4, v5, v6);
}

+ (void)beginVCSEntity:withParseState:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB9BF000, v0, v1, "Unnknown entity name: %@", v2, v3, v4, v5, v6);
}

+ (void)beginVCSEntity:withParseState:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB9BF000, v0, v1, "Wrong context to begin a calendar.", v2, v3, v4, v5, v6);
}

+ (void)beginVCSEntity:withParseState:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB9BF000, v0, v1, "Wrong context to begin a todo or event.", v2, v3, v4, v5, v6);
}

+ (void)beginVCSEntity:(NSObject *)a3 withParseState:.cold.4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = [a2 lineNumber];
  _os_log_error_impl(&dword_1DB9BF000, a3, OS_LOG_TYPE_ERROR, "Unknown entity type: %@ at line %d.", (uint8_t *)&v4, 0x12u);
}

+ (void)endVCSEntity:withParseState:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB9BF000, v0, v1, "Unkown entity name: %ld", v2, v3, v4, v5, v6);
}

+ (void)endVCSEntity:withParseState:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB9BF000, v0, v1, "Wrong context to end a calendar.", v2, v3, v4, v5, v6);
}

+ (void)endVCSEntity:withParseState:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB9BF000, v0, v1, "Wrong context to end a todo.", v2, v3, v4, v5, v6);
}

+ (void)endVCSEntity:withParseState:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1DB9BF000, v0, v1, "Wrong context to end an event.", v2, v3, v4, v5, v6);
}

+ (void)endVCSEntity:withParseState:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DB9BF000, v0, v1, "Unknown entity type: %@.", v2, v3, v4, v5, v6);
}

@end