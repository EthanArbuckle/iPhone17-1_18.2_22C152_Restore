@interface RMJSONUtilities
+ (BOOL)serializeJSONDictionary:(id)a3 fileURL:(id)a4 error:(id *)a5;
+ (id)deserializeJSONDictionaryAtFileURL:(id)a3 error:(id *)a4;
@end

@implementation RMJSONUtilities

+ (BOOL)serializeJSONDictionary:(id)a3 fileURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v19 = 0;
  v9 = [MEMORY[0x263F08900] dataWithJSONObject:v7 options:11 error:&v19];
  id v10 = v19;
  v11 = v10;
  if (v9)
  {
    id v18 = v10;
    char v12 = objc_msgSend(v9, "rm_atomicWriteToURL:error:", v8, &v18);
    id v13 = v18;

    if (v12)
    {
      BOOL v14 = 1;
      goto LABEL_13;
    }
    v16 = +[RMLog jsonUtilities];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[RMJSONUtilities serializeJSONDictionary:fileURL:error:]();
    }

    BOOL v14 = 0;
    if (a5) {
      goto LABEL_11;
    }
  }
  else
  {
    id v13 = v10;
    v15 = +[RMLog jsonUtilities];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[RMJSONUtilities serializeJSONDictionary:fileURL:error:]((uint64_t)v11, v15);
    }

    BOOL v14 = 0;
    v9 = 0;
    if (a5)
    {
LABEL_11:
      if (v13)
      {
        id v13 = v13;
        BOOL v14 = 0;
        *a5 = v13;
      }
    }
  }
LABEL_13:

  return v14;
}

+ (id)deserializeJSONDictionaryAtFileURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v22 = 0;
  v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7 isDirectory:&v22];

  if (v8)
  {
    id v21 = 0;
    v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5 options:0 error:&v21];
    id v10 = v21;
    if (v9)
    {
      id v20 = v10;
      v11 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v20];
      id v12 = v20;

      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v11;
        }
        else
        {
          v16 = +[RMLog jsonUtilities];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:](v16);
          }

          if (a4)
          {
            v17 = +[RMErrorUtilities createInternalError];
            id v18 = v17;
            if (v17) {
              *a4 = v17;
            }
          }
          id v13 = 0;
        }
      }
      else
      {
        v15 = +[RMLog jsonUtilities];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:]((uint64_t)v12, v15);
        }

        id v13 = 0;
        if (a4 && v12)
        {
          id v13 = 0;
          *a4 = v12;
        }
      }
    }
    else
    {
      BOOL v14 = +[RMLog jsonUtilities];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[RMJSONUtilities deserializeJSONDictionaryAtFileURL:error:]();
      }

      id v13 = 0;
      if (a4 && v10)
      {
        id v12 = v10;
        id v13 = 0;
        *a4 = v12;
      }
      else
      {
        id v12 = v10;
      }
    }
  }
  else
  {
    id v13 = (id)MEMORY[0x263EFFA78];
  }

  return v13;
}

+ (void)serializeJSONDictionary:(uint64_t)a1 fileURL:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224784000, a2, OS_LOG_TYPE_ERROR, "Could not serialize JSON object: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)serializeJSONDictionary:fileURL:error:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Could not write JSON data to disk %{public}@: %{public}@");
}

+ (void)deserializeJSONDictionaryAtFileURL:error:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_224784000, v0, v1, "Could not read JSON data file: %{public}@ %{public}@");
}

+ (void)deserializeJSONDictionaryAtFileURL:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224784000, a2, OS_LOG_TYPE_ERROR, "Could not deserialize JSON data: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)deserializeJSONDictionaryAtFileURL:(os_log_t)log error:.cold.3(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_224784000, log, OS_LOG_TYPE_ERROR, "Could not deserialize JSON data: invalid JSON object", v1, 2u);
}

@end