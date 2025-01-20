@interface NSDictionary(xpcdictConv)
+ (NSObject)dictionaryFromJsonData:()xpcdictConv;
+ (id)dictionaryFromXPCDictionary:()xpcdictConv withDataFromKey:;
+ (id)dictionaryWithXPCDictionary:()xpcdictConv;
- (NSObject)convertToNSData;
- (id)createXPCDictionary;
- (id)initWithXPCDictionary:()xpcdictConv;
- (id)objectForKey:()xpcdictConv ofType:;
- (uint64_t)saveAsDataInXPCDictionary:()xpcdictConv forKey:;
- (void)convertToNSData;
- (void)createXPCDictionary;
@end

@implementation NSDictionary(xpcdictConv)

+ (id)dictionaryWithXPCDictionary:()xpcdictConv
{
  v3 = (objc_class *)NSDictionary;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithXPCDictionary:v4];

  return v5;
}

- (id)initWithXPCDictionary:()xpcdictConv
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__3;
  v16[3] = __Block_byref_object_dispose__3;
  id v17 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke;
  v12 = &unk_2644FCA48;
  v14 = &v15;
  id v5 = a1;
  id v13 = v5;
  if (xpc_dictionary_apply(v4, &v9))
  {
    v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NSDictionary(xpcdictConv) initWithXPCDictionary:]((uint64_t)v16, v6);
    }

    id v5 = (id)objc_msgSend(v5, "initWithDictionary:", *(void *)(v16[0] + 40), v9, v10, v11, v12);
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)createXPCDictionary
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v29;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v28 + 1) + 8 * v7);
        uint64_t v9 = objc_msgSend(v3, "objectForKey:", v8, (void)v28);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          xpc_dictionary_set_string(v2, (const char *)[v8 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v10 = (const char *)[v8 UTF8String];
            id v11 = v9;
            xpc_dictionary_set_data(v2, v10, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = v9;
              if (!strcmp((const char *)[v12 objCType], "i")
                || (id v13 = v12, !strcmp((const char *)[v13 objCType], "s"))
                || (id v14 = v13, !strcmp((const char *)[v14 objCType], "q"))
                || (id v15 = v14, !strcmp((const char *)[v15 objCType], "q")))
              {
                xpc_dictionary_set_int64(v2, (const char *)[v8 UTF8String], objc_msgSend(v12, "longLongValue"));
              }
              else
              {
                id v16 = v15;
                if (!strcmp((const char *)[v16 objCType], "f")
                  || (id v17 = v16, !strcmp((const char *)[v17 objCType], "d")))
                {
                  v22 = (const char *)[v8 UTF8String];
                  [v16 doubleValue];
                  xpc_dictionary_set_double(v2, v22, v23);
                }
                else
                {
                  id v18 = v17;
                  if (strcmp((const char *)[v18 objCType], "B"))
                  {
                    v19 = v18;
                    if (strcmp((const char *)[v19 objCType], "c"))
                    {
                      v27 = defaultLogHandle();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                        __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_1(v19, v27);
                      }

LABEL_31:
                      id v25 = 0;
                      goto LABEL_32;
                    }
                  }
                  xpc_dictionary_set_BOOL(v2, (const char *)[v8 UTF8String], objc_msgSend(v18, "BOOLValue"));
                }
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v19 = defaultLogHandle();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                  [(NSDictionary(xpcdictConv) *)(uint64_t)v8 createXPCDictionary];
                }
                goto LABEL_31;
              }
              v20 = (const char *)[v8 UTF8String];
              [v9 timeIntervalSince1970];
              xpc_dictionary_set_date(v2, v20, (uint64_t)v21);
            }
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v24 = [v3 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v5 = v24;
    }
    while (v24);
  }

  id v25 = v2;
LABEL_32:

  return v25;
}

+ (NSObject)dictionaryFromJsonData:()xpcdictConv
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v5 = defaultLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NSDictionary(xpcdictConv) dictionaryFromJsonData:](v5, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_13;
  }
  id v17 = 0;
  uint64_t v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:&v17];
  uint64_t v5 = v17;
  if (!v4)
  {
    id v15 = defaultLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[NSDictionary(xpcdictConv) dictionaryFromJsonData:](v5);
    }

LABEL_13:
    uint64_t v6 = 0;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v4;

    uint64_t v5 = v6;
  }
  else
  {
    id v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[NSDictionary(xpcdictConv) dictionaryFromJsonData:]();
    }

    uint64_t v6 = 0;
    uint64_t v5 = v4;
  }
LABEL_5:

  return v6;
}

+ (id)dictionaryFromXPCDictionary:()xpcdictConv withDataFromKey:
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4
    && (xpc_dictionary_get_value(v6, (const char *)a4), uint64_t v8 = objc_claimAutoreleasedReturnValue(), (a4 = (id)v8) != 0)
    && MEMORY[0x223C3EAB0](v8) == MEMORY[0x263EF86F8])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(a4);
    size_t length = xpc_data_get_length(a4);
    uint64_t v11 = dispatch_get_global_queue(9, 0);
    destructor[0] = MEMORY[0x263EF8330];
    destructor[1] = 3221225472;
    destructor[2] = __73__NSDictionary_xpcdictConv__dictionaryFromXPCDictionary_withDataFromKey___block_invoke;
    destructor[3] = &unk_2644FC938;
    a4 = a4;
    id v16 = a4;
    dispatch_data_t v12 = dispatch_data_create(bytes_ptr, length, v11, destructor);

    uint64_t v13 = [a1 dictionaryFromJsonData:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (uint64_t)saveAsDataInXPCDictionary:()xpcdictConv forKey:
{
  id v6 = a3;
  uint64_t v7 = 0;
  if (v6)
  {
    if (a4)
    {
      uint64_t v8 = [a1 convertToNSData];
      uint64_t v7 = (uint64_t)v8;
      if (v8)
      {
        uint64_t v9 = [v8 _createDispatchData];
        xpc_object_t v10 = xpc_data_create_with_dispatch_data(v9);

        xpc_dictionary_set_value(v6, a4, v10);
        uint64_t v7 = 1;
      }
    }
  }

  return v7;
}

- (NSObject)convertToNSData
{
  if ([MEMORY[0x263F08900] isValidJSONObject:a1])
  {
    id v7 = 0;
    xpc_object_t v2 = [MEMORY[0x263F08900] dataWithJSONObject:a1 options:0 error:&v7];
    id v3 = v7;
    if (v2)
    {
      uint64_t v4 = v2;

      id v3 = v4;
      goto LABEL_4;
    }
    id v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(xpcdictConv) convertToNSData](v3);
    }
  }
  else
  {
    id v3 = defaultLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(xpcdictConv) convertToNSData]();
    }
  }
  uint64_t v4 = 0;
LABEL_4:

  return v4;
}

- (id)objectForKey:()xpcdictConv ofType:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)initWithXPCDictionary:()xpcdictConv .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21EF08000, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSDictionary: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)createXPCDictionary
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_opt_class();
  int v7 = 138543618;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_1_1();
  id v6 = v5;
  _os_log_error_impl(&dword_21EF08000, a3, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has unsupported type %{public}@", (uint8_t *)&v7, 0x16u);
}

+ (void)dictionaryFromJsonData:()xpcdictConv .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)dictionaryFromJsonData:()xpcdictConv .cold.2(void *a1)
{
  uint64_t v2 = [a1 localizedDescription];
  [a1 code];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_1(&dword_21EF08000, v3, v4, "Failed to deserialize JSON object with error - %{public}@(0x%tx). Target: %{public}@", v5, v6, v7, v8, v9);
}

+ (void)dictionaryFromJsonData:()xpcdictConv .cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: format not correct: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)convertToNSData
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Not a valid JSON object: %{public}@", v2, v3, v4, v5, 2u);
}

@end