@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [NSString stringWithCString:a2 encoding:4];
  uint64_t v7 = MEMORY[0x223C3EAB0](v5);
  if (v7 == MEMORY[0x263EF86E0])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    v15 = (void *)v11;
    [v10 setObject:v11 forKey:v6];

    uint64_t v9 = 1;
    goto LABEL_23;
  }
  if (v7 == MEMORY[0x263EF8798])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x263EF8738])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x263EF87A0])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x263EF8708])
  {
    v12 = *(void **)(a1 + 32);
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [v12 initWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x263EF86F8])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x263EF86D8])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithXPCArray:v5];
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x263EF8710])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (v7 == MEMORY[0x263EF8700])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke_cold_1((uint64_t)v6, v8);
  }

  uint64_t v9 = 0;
LABEL_23:

  return v9;
}

void __51__NSDictionary_xpcdictConv__initWithXPCDictionary___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has a type that is not supported yet", (uint8_t *)&v2, 0xCu);
}

@end