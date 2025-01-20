@interface BSXPCDecodeObject
@end

@implementation BSXPCDecodeObject

BOOL ___BSXPCDecodeObject_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = _BSXPCDecodeObjectFromContext(*(void *)(a1 + 32), v5, 0, *(void *)(a1 + 48), 0);
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
  }
  else
  {
    v7 = rbs_coder_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___BSXPCDecodeObject_block_invoke_cold_1((uint64_t)v5, a2, v7);
    }
  }
  return v6 != 0;
}

BOOL ___BSXPCDecodeObject_block_invoke_202(uint64_t a1, uint64_t a2)
{
  v3 = [NSString stringWithUTF8String:a2];
  v4 = _BSXPCDecodeObjectForKey(*(void *)(a1 + 32), v3, *(void *)(a1 + 56), 0);
  if (v4) {
    [*(id *)(a1 + 40) setObject:v4 forKey:v3];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
  }

  return v4 != 0;
}

void ___BSXPCDecodeObject_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "Array element %zu failed to decode: %@", (uint8_t *)&v3, 0x16u);
}

@end