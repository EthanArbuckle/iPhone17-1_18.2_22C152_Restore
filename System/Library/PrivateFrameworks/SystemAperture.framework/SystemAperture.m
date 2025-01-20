uint64_t SAElementIdentityEqualToIdentity(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  if (v3 == v4)
  {
    v9 = 1;
  }
  else
  {
    v5 = [v3 clientIdentifier];
    v6 = [v4 clientIdentifier];
    if (BSEqualObjects())
    {
      v7 = [v3 elementIdentifier];
      v8 = [v4 elementIdentifier];
      v9 = BSEqualObjects();
    }
    else
    {
      v9 = 0;
    }
  }
  return v9;
}

id SAEffectiveElementIdentityDescription(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    [v1 elementDescription];
  }
  else {
  v2 = SAElementIdentityDescription(v1, 0);
  }

  return v2;
}

id SAElementIdentityDescription(void *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    v5 = (void *)MEMORY[0x263F089D8];
    uint64_t v6 = objc_opt_class();
    v7 = [v3 elementIdentifier];
    v8 = [v3 clientIdentifier];
    v9 = [v5 stringWithFormat:@"<%@: %p; elementIdentifier: %@; clientIdentifier: %@", v6, v3, v7, v8];

    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v10 = [v3 uniqueElementIdentifier];
      [v9 appendFormat:@"; uniqueElementIdentifier: %@", v10];
    }
    if ([v4 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v4;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v17 = [v11 objectForKeyedSubscript:v16];
            [v9 appendFormat:@"; %@: %@", v16, v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v13);
      }
    }
    [v9 appendString:@">"];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t SAHasIndicatorBehavior(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 hasIndicatorBehavior];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_25E6DE400(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SARegisterSystemApertureLogging()
{
  if (SARegisterSystemApertureLogging_onceToken != -1) {
    dispatch_once(&SARegisterSystemApertureLogging_onceToken, &__block_literal_global);
  }
}

uint64_t __SARegisterSystemApertureLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)SALogSubsystem, "Element");
  id v1 = (void *)SALogElement;
  SALogElement = (uint64_t)v0;

  SALogSystem = (uint64_t)os_log_create((const char *)SALogSubsystem, "System");

  return MEMORY[0x270F9A758]();
}

void sub_25E6DE9CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25E6DEE4C(_Unwind_Exception *exception_object)
{
}

void sub_25E6DF028(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25E6DF1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_25E6DF37C(_Unwind_Exception *exception_object)
{
}

uint64_t SAElementIdentitiesEqualToIdentities(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 count];
  if (v5 == [v4 count])
  {
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5 - 1;
      do
      {
        v8 = [v3 objectAtIndexedSubscript:v6];
        v9 = [v4 objectAtIndexedSubscript:v6];
        uint64_t v10 = SAElementIdentityEqualToIdentity(v8, v9);

        if (!v10) {
          break;
        }
      }
      while (v7 != v6++);
    }
    else
    {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t SAElementEqualToElement(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 == v4)
  {
    uint64_t v7 = 1;
  }
  else if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v3 uniqueElementIdentifier];
    uint64_t v6 = [v4 uniqueElementIdentifier];
    uint64_t v7 = BSEqualObjects();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t SAHasActivityBehavior(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 hasActivityBehavior];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SAHasAlertBehavior(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 hasAlertBehavior];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

id SATargetElementFromBehaviorOverrider(void *a1)
{
  id v1 = [a1 behaviorOverridingTarget];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [v1 element];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}