void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  uint64_t v5;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id NMLogForCategory(uint64_t a1)
{
  if (NMLogForCategory_onceToken != -1) {
    dispatch_once(&NMLogForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)NMLogForCategory_logObjects[a1];

  return v2;
}

uint64_t __NMLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.nanomusic", "NanoMusicCore");
  v1 = (void *)NMLogForCategory_logObjects;
  NMLogForCategory_logObjects = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.nanomusic", "NanoMusicCore-Oversize");
  v3 = (void *)qword_26AD5AE58;
  qword_26AD5AE58 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.nanomusic", "NanoMediaRemote");
  v5 = (void *)qword_26AD5AE60;
  qword_26AD5AE60 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.nanomusic", "NanoMediaRemote-Oversize");
  v7 = (void *)qword_26AD5AE68;
  qword_26AD5AE68 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.nanomusic", "NanoAudioControl");
  uint64_t v9 = (void *)qword_26AD5AE70;
  qword_26AD5AE70 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.nanomusic", "NanoMusicSync");
  v11 = (void *)qword_26AD5AE78;
  qword_26AD5AE78 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.nanomusic", "NanoMusicSync-Oversize");
  v13 = (void *)qword_26AD5AE80;
  qword_26AD5AE80 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.nanomusic", "NanoMediaUI");
  v15 = (void *)qword_26AD5AE88;
  qword_26AD5AE88 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.nanomusic", "NanoMediaUI-Oversize");
  v17 = (void *)qword_26AD5AE90;
  qword_26AD5AE90 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.nanomusic", "NanoMediaAPI");
  v19 = (void *)qword_26AD5AE98;
  qword_26AD5AE98 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.nanomusic", "NanoMediaAPI-Oversize");
  v21 = (void *)qword_26AD5AEA0;
  qword_26AD5AEA0 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.nanomusic", "NanoMediaTool");
  v23 = (void *)qword_26AD5AEA8;
  qword_26AD5AEA8 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI");
  v25 = (void *)qword_26AD5AEB8;
  qword_26AD5AEB8 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.nanomusic", "NanoMediaBridgeUI-Oversize");
  v27 = (void *)qword_26AD5AEC0;
  qword_26AD5AEC0 = (uint64_t)v26;

  qword_26AD5AEB0 = (uint64_t)os_log_create("com.apple.nanomusic", "NanoMediaAppActivity");

  return MEMORY[0x270F9A758]();
}

id NMAPIDictionaryWithObject(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (_NSIsNSDictionary())
  {
    v7 = NMLogForCategory(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      NMAPIDictionaryWithObject_cold_1();
    }

    id v8 = v5;
  }
  else
  {
    uint64_t v9 = NMLogForCategory(9);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      NMAPIDictionaryWithObject_cold_2();
    }

    if (a3)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

id NMAPIArrayWithObject(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (_NSIsNSArray())
  {
    v7 = NMLogForCategory(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      NMAPIDictionaryWithObject_cold_1();
    }

    id v8 = v5;
  }
  else
  {
    uint64_t v9 = NMLogForCategory(9);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      NMAPIArrayWithObject_cold_2();
    }

    if (a3)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

id NMAPIStringWithObject(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (_NSIsNSString())
  {
    v7 = NMLogForCategory(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      NMAPIDictionaryWithObject_cold_1();
    }

    id v8 = v5;
  }
  else
  {
    uint64_t v9 = NMLogForCategory(9);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      NMAPIStringWithObject_cold_2();
    }

    if (a3)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
      id v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

id NMAPIDictionaryInSingleObjectArray(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v5 count] == 1)
  {
    v7 = NMLogForCategory(10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      NMAPIDictionaryWithObject_cold_1();
    }

    id v8 = [v5 firstObject];
    uint64_t v9 = NMAPIDictionaryWithObject(v8, v6, a3);
  }
  else
  {
    os_log_t v10 = NMLogForCategory(9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      NMAPIDictionaryInSingleObjectArray_cold_2((uint64_t)v6, v5, v10);
    }

    if (a3)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F88F00] code:-7102 userInfo:0];
      uint64_t v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

id NMAPIOptionalDictionaryWithObject(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    a1 = NMAPIDictionaryWithObject(a1, a2, a3);
    uint64_t v3 = vars8;
  }
  return a1;
}

id NMAPIOptionalArrayWithObject(void *a1, void *a2, void *a3)
{
  if (a1)
  {
    a1 = NMAPIArrayWithObject(a1, a2, a3);
    uint64_t v3 = vars8;
  }
  return a1;
}

id MusicURLComponentsWithURLBag(void *a1, int a2)
{
  uint64_t v3 = [a1 dictionaryForBagKey:*MEMORY[0x263F89050]];
  if (_NSIsNSDictionary())
  {
    os_log_t v4 = [v3 objectForKey:@"ampMusicAPIDomains"];
    if (_NSIsNSDictionary())
    {
      id v5 = @"default";
      if (a2) {
        id v5 = @"listenNow";
      }
      id v6 = v5;
      v7 = [v4 objectForKey:v6];
      if (_NSIsNSString())
      {
        id v8 = objc_opt_new();
        [v8 setScheme:@"https"];
        [v8 setHost:v7];
      }
      else
      {
        os_log_t v16 = NMLogForCategory(9);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          MusicURLComponentsWithURLBag_cold_1((uint64_t)v6, (uint64_t)v4, v16);
        }

        id v8 = 0;
      }
    }
    else
    {
      v7 = NMLogForCategory(9);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        MusicURLComponentsWithURLBag_cold_2((uint64_t)v3, v7);
      }
      id v8 = 0;
    }
  }
  else
  {
    os_log_t v4 = NMLogForCategory(9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      MusicURLComponentsWithURLBag_cold_3(v4, v9, v10, v11, v12, v13, v14, v15);
    }
    id v8 = 0;
  }

  return v8;
}

id MusicURLPathStorefrontWithURLBag(void *a1)
{
  v1 = [a1 stringForBagKey:@"countryCode"];
  if (_NSIsNSString())
  {
    id v2 = v1;
  }
  else
  {
    uint64_t v3 = NMLogForCategory(9);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      MusicURLPathStorefrontWithURLBag_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v2 = 0;
  }

  return v2;
}

id MusicURLQueryItemLanguageWithURLBag(void *a1)
{
  v1 = [a1 stringForBagKey:@"language"];
  if (_NSIsNSString() && [v1 length])
  {
    id v2 = [MEMORY[0x263F08BD0] queryItemWithName:@"l" value:v1];
  }
  else
  {
    uint64_t v3 = NMLogForCategory(9);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      MusicURLQueryItemLanguageWithURLBag_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    id v2 = 0;
  }

  return v2;
}

void NMAPIDictionaryWithObject_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2269EF000, v0, v1, "[NMAPIResponseParser] %@: %@");
}

void NMAPIDictionaryWithObject_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2269EF000, v0, v1, "[NMAPIResponseParser] Expected a dictionary for %@ object: %@");
}

void NMAPIArrayWithObject_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2269EF000, v0, v1, "[NMAPIResponseParser] Expected an array for %@ object: %@");
}

void NMAPIStringWithObject_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2269EF000, v0, v1, "[NMAPIResponseParser] Expected a string for %@ object: %@");
}

void NMAPIDictionaryInSingleObjectArray_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 count];
  _os_log_error_impl(&dword_2269EF000, a3, OS_LOG_TYPE_ERROR, "[NMAPIResponseParser] Invalid response due to %@ object count: %lu", (uint8_t *)&v4, 0x16u);
}

void MusicURLComponentsWithURLBag_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_2269EF000, log, OS_LOG_TYPE_ERROR, "No host found for API domain requested (%{public}@): %{public}@", (uint8_t *)&v3, 0x16u);
}

void MusicURLComponentsWithURLBag_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2269EF000, a2, OS_LOG_TYPE_ERROR, "No domains in music common dictionary of bag, can't generate URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

void MusicURLComponentsWithURLBag_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MusicURLPathStorefrontWithURLBag_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MusicURLQueryItemLanguageWithURLBag_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x270EE57B0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x270EE57C8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x270EE57D8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}