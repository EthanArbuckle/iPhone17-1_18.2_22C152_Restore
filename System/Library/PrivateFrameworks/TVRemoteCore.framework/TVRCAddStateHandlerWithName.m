@interface TVRCAddStateHandlerWithName
@end

@implementation TVRCAddStateHandlerWithName

_DWORD *___TVRCAddStateHandlerWithName_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v10 = 0;
  v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:100 options:0 error:&v10];
  id v4 = v10;
  if (v4)
  {
    v5 = _TVRCGeneralLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Error serializing state data for \"%s\": %@", buf, 0x16u);
    }

    v7 = 0;
  }
  else
  {
    v7 = malloc_type_calloc(1uLL, [v3 length] + 200, 0xFE35CA7BuLL);
    if (v7)
    {
      __strlcpy_chk();
      _DWORD *v7 = 1;
      v7[1] = [v3 length];
      id v8 = v3;
      memcpy(v7 + 50, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
    }
  }

  return v7;
}

@end