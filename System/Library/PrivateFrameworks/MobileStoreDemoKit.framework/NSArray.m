@interface NSArray
@end

@implementation NSArray

uint64_t __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C3EAB0]();
  if (v6 == MEMORY[0x263EF86E0])
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    v14 = (void *)v10;
    [v9 addObject:v10];

    uint64_t v8 = 1;
    goto LABEL_23;
  }
  if (v6 == MEMORY[0x263EF8798])
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF8738])
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF87A0])
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF86F8])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF8710])
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF8708])
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [NSDictionary dictionaryWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF86D8])
  {
    v13 = *(void **)(a1 + 32);
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [v13 initWithXPCArray:v5];
    goto LABEL_22;
  }
  if (v6 == MEMORY[0x263EF8700])
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  v7 = defaultLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke_cold_1(a2, v7);
  }

  uint64_t v8 = 0;
LABEL_23:

  return v8;
}

void __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = xpc_string_create((const char *)[v6 UTF8String]);
LABEL_5:
    uint64_t v10 = v8;
    xpc_array_append_value(v7, v8);

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    id v9 = v6;
    uint64_t v8 = xpc_data_create((const void *)[v9 bytes], objc_msgSend(v9, "length"));
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    if (!strcmp((const char *)[v11 objCType], "i")
      || (id v12 = v11, !strcmp((const char *)[v12 objCType], "s"))
      || (id v13 = v12, !strcmp((const char *)[v13 objCType], "q"))
      || (id v14 = v13, !strcmp((const char *)[v14 objCType], "q")))
    {
      v20 = *(void **)(a1 + 32);
      xpc_object_t v21 = xpc_int64_create([v11 longLongValue]);
    }
    else
    {
      id v15 = v14;
      if (!strcmp((const char *)[v15 objCType], "f")
        || (id v16 = v15, !strcmp((const char *)[v16 objCType], "d")))
      {
        v20 = *(void **)(a1 + 32);
        [v15 doubleValue];
        xpc_object_t v21 = xpc_double_create(v25);
      }
      else
      {
        id v17 = v16;
        if (strcmp((const char *)[v17 objCType], "B"))
        {
          id v18 = v17;
          if (strcmp((const char *)[v18 objCType], "c"))
          {
            v19 = defaultLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_1(v18, v19);
            }

            *a4 = 1;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_23;
          }
        }
        v20 = *(void **)(a1 + 32);
        xpc_object_t v21 = xpc_BOOL_create([v17 BOOLValue]);
      }
    }
    v22 = v21;
    xpc_array_append_value(v20, v21);

LABEL_23:
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 xpcArrayFromArray];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 createXPCDictionary];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    [v6 timeIntervalSince1970];
    uint64_t v8 = xpc_date_create((uint64_t)v23);
    goto LABEL_5;
  }
  v24 = defaultLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_2(v24);
  }

  *a4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_6:
}

void __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "The value at index %lu in this xpcArray are of an unsupported type", (uint8_t *)&v2, 0xCu);
}

void __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = [a1 objCType];
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Unsupported NSNumber type: %s for xpc dictionary encoding", (uint8_t *)&v3, 0xCu);
}

void __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "The values in this NSArray are of an unsupported type", v1, 2u);
}

@end