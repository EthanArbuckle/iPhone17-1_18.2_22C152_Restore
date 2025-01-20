void sub_218FF62F0(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = sub_218FF6474(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_218FF6688((uint64_t)v2, v3);
  }
}

void sub_218FF6348(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = sub_218FF6474(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_218FF5000, v6, OS_LOG_TYPE_DEFAULT, "success %d", (uint8_t *)&v8, 8u);
  }

  v7 = sub_218FF6474(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_218FF5000, v7, OS_LOG_TYPE_DEFAULT, "error %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

id sub_218FF6474(unint64_t a1)
{
  if (qword_26AA93DB0 != -1) {
    dispatch_once(&qword_26AA93DB0, &unk_26CA7EF50);
  }
  id v2 = (id)MEMORY[0x263EF8440];
  id v3 = MEMORY[0x263EF8440];
  if (a1 <= 1)
  {
    id v2 = (id)qword_26AA93DB8[a1];
  }

  return v2;
}

uint64_t sub_218FF6504()
{
  os_log_t v0 = os_log_create("com.apple.corerepair", "device");
  v1 = (void *)qword_26AA93DB8[0];
  qword_26AA93DB8[0] = (uint64_t)v0;

  qword_26AA93DC0 = (uint64_t)os_log_create("com.apple.corerepair", "device-error");

  return MEMORY[0x270F9A758]();
}

void sub_218FF6688(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218FF5000, a2, OS_LOG_TYPE_ERROR, "Error:%@", (uint8_t *)&v2, 0xCu);
}

uint64_t AMFDRSealingMapGetEntry()
{
  return MEMORY[0x270F91FE0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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