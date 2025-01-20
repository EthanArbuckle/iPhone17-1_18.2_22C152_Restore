void preOrder(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  unsigned char v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x263EF8340];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = v9;
  if (v7) {
    [v9 addObject:v7];
  }
  v11 = [MEMORY[0x263EFF980] arrayWithArray:v8];
  v12 = v11;
  if (a4 == 1) {
    [v11 sortUsingComparator:&__block_literal_global_251];
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v12;
  v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    v15 = v14;
    v16 = *(void *)v21;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "children", (void)v20);
        preOrder(v18, v19, v10, a4);
      }
      v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }
}

uint64_t __preOrder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 children];
  unint64_t v7 = [v6 count];
  v8 = [v5 children];
  unint64_t v9 = [v8 count];

  if (v7 <= v9)
  {
    v11 = [v4 children];
    unint64_t v12 = [v11 count];
    v13 = [v5 children];
    unint64_t v14 = [v13 count];

    if (v12 >= v14) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

id TRALogCommon()
{
  if (TRALogCommon_onceToken != -1) {
    dispatch_once(&TRALogCommon_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)TRALogCommon___logObj;
  return v0;
}

__CFString *TRAStringFromTraitsPreferencesType(unint64_t a1)
{
  if (a1 >= 4) {
    TRAStringFromTraitsPreferencesType_cold_1();
  }
  return off_265543D40[a1];
}

void sub_2600BEE54(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2600C0764(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2600C0EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void appendDescription(void *a1, void *a2, void *a3, int a4, uint64_t a5, uint64_t a6)
{
  v59[1] = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  unint64_t v14 = v13;
  v53 = v11;
  if (v11 && [v13 length]) {
    [v14 appendString:@"\n"];
  }
  if (a4 >= 1)
  {
    int v15 = a4;
    do
    {
      [v14 appendString:@"\t"];
      if (v15 == 1) {
        [v14 appendString:@"⎿ "];
      }
      --v15;
    }
    while (v15);
  }
  if (v53)
  {
    int v52 = a4;
    v16 = [v53 participant];
    v17 = [v16 currentSettings];
    v18 = [v17 zOrderLevelSettings];
    uint64_t v19 = [v18 description];

    v20 = [v53 participant];
    v21 = [v20 currentSettings];
    v22 = [v21 orientationSettings];
    uint64_t v23 = [v22 description];

    v50 = (void *)v23;
    v51 = (void *)v19;
    v49 = [NSString stringWithFormat:@"%@, %@", v19, v23];
    v24 = NSString;
    v25 = [v53 participant];
    v26 = [v25 orientationPreferences];
    v27 = TRAStringForBSInterfaceOrientationMask([v26 supportedOrientations]);
    v28 = [v24 stringWithFormat:@"supported: %@", v27];

    if ([v53 debugLastSettingsWereValidated])
    {
      v29 = &stru_270BF7BE8;
      unint64_t v30 = 0x263F08000;
    }
    else
    {
      v31 = NSString;
      v32 = [v53 debugLastOrientationSettingsValidationFailureReason];
      v29 = [v31 stringWithFormat:@", last validation failed: %@", v32];

      unint64_t v30 = 0x263F08000uLL;
    }
    v33 = *(void **)(v30 + 2880);
    v34 = [v53 participant];
    v35 = [v34 uniqueIdentifier];
    v36 = [v33 stringWithFormat:@"%@, %@, %@%@", v35, v49, v28, v29];
    [v14 appendString:v36];

    a4 = v52;
  }
  if (v12 && a6)
  {
    uint64_t v37 = [v12 sortedArrayUsingComparator:&__block_literal_global_244];

    id v12 = (id)v37;
  }
  else if (a5 == 1)
  {
    v38 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"children.@count" ascending:1];
    v59[0] = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
    uint64_t v40 = [v12 sortedArrayUsingDescriptors:v39];

    id v12 = (id)v40;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v41 = v12;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v55;
    uint64_t v45 = (a4 + 1);
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(v41);
        }
        v47 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v48 = [v47 children];
        appendDescription(v47, v48, v14, v45, a5, a6);
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v43);
  }
}

uint64_t __appendDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 currentZOrderLevel];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  unint64_t v7 = NSNumber;
  [v5 currentZOrderLevel];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t TRABSInterfaceOrientationMaskForBSInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

__CFString *TRAStringForBSDeviceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_265543E00[a1 - 1];
  }
}

__CFString *TRAStringForBSInterfaceOrientation(uint64_t a1)
{
  if (a1)
  {
    TRAStringForBSInterfaceOrientationMask((1 << a1) & 0x1E);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"unknown";
  }
  return v2;
}

__CFString *TRAStringForBSInterfaceOrientationMask(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v2 = @"none";
    goto LABEL_11;
  }
  char v1 = a1;
  if (a1 == 30)
  {
    uint64_t v2 = @"All";
    goto LABEL_11;
  }
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = v3;
  if ((v1 & 2) != 0)
  {
    [v3 addObject:@"Pu"];
    if ((v1 & 0x10) == 0)
    {
LABEL_7:
      if ((v1 & 8) == 0) {
        goto LABEL_8;
      }
LABEL_16:
      [v4 addObject:@"Lr"];
      if ((v1 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((v1 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  [v4 addObject:@"Ll"];
  if ((v1 & 8) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v1 & 4) != 0) {
LABEL_9:
  }
    [v4 addObject:@"Pd"];
LABEL_10:
  uint64_t v2 = [v4 componentsJoinedByString:@","];

LABEL_11:
  return v2;
}

void sub_2600C5B9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t __TRALogCommon_block_invoke()
{
  TRALogCommon___logObj = (uint64_t)os_log_create((const char *)TRALoggingSubsystem, "Common");
  return MEMORY[0x270F9A758]();
}

void TRAStringFromTraitsPreferencesType_cold_1()
{
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F107E8]();
}

uint64_t BSInterfaceOrientationMaskDescription()
{
  return MEMORY[0x270F10848]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x270F10870]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x270F10940]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}