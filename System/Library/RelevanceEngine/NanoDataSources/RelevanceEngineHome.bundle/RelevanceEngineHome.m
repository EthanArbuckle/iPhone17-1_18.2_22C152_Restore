id REHomeBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_268B996F0 != -1) {
    dispatch_once(&qword_268B996F0, &unk_26EFE0268);
  }
  v0 = (void *)qword_268B996E8;

  return v0;
}

uint64_t sub_23C22ED8C()
{
  qword_268B996E8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

BOOL REHomeAlwaysShow()
{
  if (qword_268B996F8 != -1) {
    dispatch_once(&qword_268B996F8, &unk_26EFE0288);
  }
  if (!byte_268B99700) {
    return 0;
  }
  if (qword_268B99708 != -1) {
    dispatch_once(&qword_268B99708, &unk_26EFE02A8);
  }
  return byte_268B99701 != 0;
}

id REHomeContent(void *a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F62D40];
  id v4 = a2;
  id v5 = a1;
  id v6 = objc_alloc_init(v3);
  v7 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
  [v6 setTintColor:v7];

  v8 = REHomeImageNamed(@"SG_Home");
  [v6 setOverrideBodyImage:v8];
  v9 = NSString;
  v10 = REHomeLocalizedString(@"UP_NEXT_HOME_SCENE");
  v11 = objc_msgSend(v9, "stringWithFormat:", v10, v4);

  v12 = [MEMORY[0x263EFD208] textProviderWithText:v5];

  [v6 setHeaderTextProvider:v12];
  v13 = [MEMORY[0x263EFD208] textProviderWithText:v11];
  [v6 setDescription1TextProvider:v13];

  [v6 setDescription1FontStyle:3];

  return v6;
}

id REHomeImageNamed(void *a1)
{
  id v1 = a1;
  v2 = REHomeBundle();
  v3 = REImageNamedFromBundle();

  return v3;
}

id REHomeLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = REHomeBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_26EFE0328 table:@"HomeDataSource"];

  return v3;
}

uint64_t sub_23C22F0B0()
{
  uint64_t result = _REGetIsInternalBuild();
  byte_268B99700 = result;
  return result;
}

void sub_23C22F0D0()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v9 = 0;
  if (sub_23C22F2C0())
  {
    id v0 = (id)sub_23C22F2C0();
    if (v0)
    {
      uint64_t v10 = 0;
      v11 = &v10;
      uint64_t v12 = 0x2050000000;
      id v1 = (void *)qword_268B99718;
      uint64_t v13 = qword_268B99718;
      if (!qword_268B99718)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        v15 = sub_23C22F404;
        v16 = &unk_264E38768;
        v17 = &v10;
        sub_23C22F404((uint64_t)&buf);
        id v1 = (void *)v11[3];
      }
      id v2 = v1;
      _Block_object_dispose(&v10, 8);
      id v0 = v2;
    }
    v3 = [v0 globalDefaults];
  }
  else
  {
    v3 = 0;
  }
  unsigned int v4 = [v3 _BOOLValueForKey:@"HomeAlwaysShow" set:&v9];
  if (v9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = RELogForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [NSNumber numberWithBool:v5];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_23C22D000, v6, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key HomeAlwaysShow: %@", (uint8_t *)&buf, 0xCu);
  }
  if (v9) {
    char v8 = v5;
  }
  else {
    char v8 = 0;
  }
  byte_268B99701 = v8;
}

void sub_23C22F2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23C22F2C0()
{
  if (!qword_268B99710) {
    qword_268B99710 = _sl_dlopen();
  }
  return qword_268B99710;
}

uint64_t sub_23C22F390()
{
  uint64_t result = _sl_dlopen();
  qword_268B99710 = result;
  return result;
}

Class sub_23C22F404(uint64_t a1)
{
  if (!sub_23C22F2C0())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("_REEngineDefaults");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_23C22F680();
  }
  qword_268B99718 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23C22F680()
{
}

uint64_t REImageNamedFromBundle()
{
  return MEMORY[0x270F59AB8]();
}

uint64_t RELogForDomain()
{
  return MEMORY[0x270F59A88]();
}

uint64_t REUISampleRelevanceProviderForSamplePosition()
{
  return MEMORY[0x270F59AC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _REGetIsInternalBuild()
{
  return MEMORY[0x270F59AB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}