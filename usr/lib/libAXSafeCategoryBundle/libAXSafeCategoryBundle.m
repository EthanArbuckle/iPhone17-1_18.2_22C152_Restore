void *AXSetValidationErrorLoggingFunction(void *result)
{
  _UIAXValidationLogger = result;
  return result;
}

void *AXSetUIAXReportSenderErrorLoggerFunction(void *result)
{
  _UIAXReportSenderErrorLogger = result;
  return result;
}

uint64_t _AXSafeCategoryLog(uint64_t a1, void *a2)
{
  uint64_t v2 = _AXSafeCategoryLog_onceToken;
  id v3 = a2;
  if (v2 != -1) {
    dispatch_once(&_AXSafeCategoryLog_onceToken, &__block_literal_global_77);
  }
  id v4 = v3;
  [v4 UTF8String];

  return os_log_with_args();
}

void UIAccessibilityInstallSafeCategory(void *a1)
{
  v5 = a1;
  Class v1 = NSClassFromString(v5);
  if (v1)
  {
    Class v2 = v1;
    id v3 = [(objc_class *)v1 safeCategoryTargetClassName];
    [(objc_class *)v2 _installSafeCategoryOnClassNamed:v3];
LABEL_7:

    goto LABEL_8;
  }
  if (_UIAXReportSenderErrorLogger) {
    _UIAXReportSenderErrorLogger(v5, v5);
  }
  id v4 = (void (*)(void))_UIAXValidationLogger;
  if (_UIAXValidationLogger)
  {
    id v3 = [NSString stringWithFormat:@"UIAccessibility Error installing safe category %@.", v5];
    v4();
    goto LABEL_7;
  }
LABEL_8:
}

void UIAccessibilityInstallSafeCategories(void *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    __base = (char *)malloc_type_malloc(40 * v2, 0xE0040956ACC96uLL);
    if (__base)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v27 = v1;
      id v3 = v1;
      uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        size_t v6 = 0;
        uint64_t v7 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v34 != v7) {
              objc_enumerationMutation(v3);
            }
            v9 = *(NSString **)(*((void *)&v33 + 1) + 8 * i);
            Class v10 = NSClassFromString(v9);
            if (v10)
            {
              Class v11 = v10;
              v12 = [(objc_class *)v10 safeCategoryTargetClassName];
              Class v13 = NSClassFromString(v12);
              if (v13)
              {
                Class v14 = v13;
                v15 = (Class *)&__base[40 * v6];
                Class *v15 = v11;
                v16 = v9;
                v15[1] = (Class)v16;
                v15[2] = (Class)_UIAccessibilityCopyClassPath(v11, v16);
                v15[3] = v14;
                v15[4] = (Class)_UIAccessibilityCopyClassPath(v14, v12);
                ++v6;
              }
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v5);
      }
      else
      {
        size_t v6 = 0;
      }

      v17 = objc_opt_new();
      v18 = objc_opt_new();
      v19 = objc_opt_new();
      __compar[0] = MEMORY[0x263EF8330];
      __compar[1] = 3221225472;
      __compar[2] = __UIAccessibilityInstallSafeCategories_block_invoke;
      __compar[3] = &unk_2641DB590;
      id v20 = v17;
      id v30 = v20;
      id v21 = v18;
      id v31 = v21;
      id v22 = v19;
      id v32 = v22;
      qsort_b(__base, v6, 0x28uLL, __compar);
      id v1 = v27;
      if (v6)
      {
        v23 = (id *)(__base + 16);
        do
        {
          id v24 = (id)[*(v23 - 2) _installSafeCategoryOnClass:v23[1] isManaged:0];
          v25 = *(v23 - 1);
          if (v25)
          {
            CFRelease(v25);
            *(v23 - 1) = 0;
          }
          if (*v23)
          {
            CFRelease(*v23);
            id *v23 = 0;
          }
          id v26 = v23[2];
          if (v26)
          {
            CFRelease(v26);
            v23[2] = 0;
          }
          v23 += 5;
          --v6;
        }
        while (v6);
      }
      free(__base);
    }
  }
}

void *_UIAccessibilityCopyClassPath(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v3];
  uint64_t v5 = [a1 superclass];
  if (v5)
  {
    size_t v6 = (objc_class *)v5;
    do
    {
      [v4 insertString:@"," atIndex:0];
      uint64_t v7 = NSStringFromClass(v6);
      [v4 insertString:v7 atIndex:0];

      size_t v6 = (objc_class *)[(objc_class *)v6 superclass];
    }
    while (v6);
  }

  return v4;
}

CFComparisonResult __UIAccessibilityInstallSafeCategories_block_invoke(void **a1, uint64_t a2, uint64_t a3)
{
  CFStringRef v4 = *(const __CFString **)(a2 + 32);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v7 = *(const __CFString **)(a3 + 32);
  if (v7)
  {
    CFComparisonResult result = CFStringCompare(v4, v7, 0);
    if (result) {
      return result;
    }
    if (_UIAccessibilitySafeCategoryDependsOnSafeCategory((void **)a2, a3, a1[4], a1[5], a1[6])) {
      return -1;
    }
    if ((_UIAccessibilitySafeCategoryDependsOnSafeCategory((void **)a3, a2, a1[4], a1[5], a1[6]) & 1) == 0)
    {
      CFStringRef v9 = *(const __CFString **)(a2 + 16);
      if (!v9) {
        return -1;
      }
      CFStringRef v10 = *(const __CFString **)(a3 + 16);
      if (v10) {
        return CFStringCompare(v9, v10, 0);
      }
    }
  }
  return 1;
}

uint64_t _UIAccessibilitySafeCategoryDependsOnSafeCategory(void **a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  _UIAccessibilitySafeCategoryAddDependenciesToArray(*a1, v9, v10, v11);
  char v12 = 0;
  while ([v9 count])
  {
    Class v13 = [v9 objectAtIndex:0];
    [v9 removeObjectAtIndex:0];
    [v11 addObject:v13];
    if ([(NSString *)v13 isEqualToString:*(void *)(a2 + 8)])
    {
      [v9 removeAllObjects];
      char v12 = 1;
    }
    else
    {
      Class v14 = NSClassFromString(v13);
      _UIAccessibilitySafeCategoryAddDependenciesToArray(v14, v9, v10, v11);
    }
  }
  [v11 removeAllObjects];

  return v12 & 1;
}

void _UIAccessibilitySafeCategoryAddDependenciesToArray(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [a1 safeCategoryAddDependenciesToCollection:v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v9, "containsObject:", v15, (void)v16) & 1) == 0
          && ([v7 containsObject:v15] & 1) == 0)
        {
          [v7 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [v10 removeAllObjects];
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t class_addMethodsBulk()
{
  return MEMORY[0x270F9A408]();
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x270F9A430](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

uint64_t class_replaceMethodsBulk()
{
  return MEMORY[0x270F9A4B0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x270F9A4F8](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x270F9AA40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDA9E0]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}