BOOL PFSizeLargerThanSize(double a1, double a2, double a3, double a4)
{
  return a2 > a4 || a1 > a3;
}

double PFSizeWithAspectRatioFillingSize(double a1, double a2, double a3)
{
  if (a2 == 0.0 || a3 == 0.0) {
    return 0.0;
  }
  BOOL v3 = a2 == INFINITY && a3 == INFINITY;
  double v4 = 0.0;
  if (!v3)
  {
    if (fabs(a2 / a3) >= a1) {
      return a2;
    }
    else {
      return a3 * a1;
    }
  }
  return v4;
}

BOOL PFObjc_implementsInstanceMethod(objc_class *a1, const char *a2)
{
  unsigned int outCount = 0;
  BOOL v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    uint64_t v4 = 0;
    while (1)
    {
      SEL Name = method_getName(v3[v4]);
      BOOL v6 = Name == a2;
      if (Name == a2) {
        break;
      }
      if (++v4 >= (unint64_t)outCount) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    BOOL v6 = 0;
  }
  free(v3);
  return v6;
}

uint64_t PFOSVariantHasInternalUI()
{
  if (PFOSVariantHasInternalUI_onceToken != -1) {
    dispatch_once(&PFOSVariantHasInternalUI_onceToken, &__block_literal_global_220);
  }
  return PFOSVariantHasInternalUI_isAppleInternal;
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  if (PFProcessIsLaunchedToExecuteTests_predicate != -1) {
    dispatch_once(&PFProcessIsLaunchedToExecuteTests_predicate, &__block_literal_global_21);
  }
  return PFProcessIsLaunchedToExecuteTests_isLaunchedToExecuteTests;
}

void __PFProcessIsLaunchedToExecuteTests_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 environment];
  v2 = [v1 objectForKeyedSubscript:@"PHOTOS_EXECUTING_TEST_PLAN"];
  uint64_t v3 = [v2 integerValue];

  if (v3)
  {
    uint64_t v4 = PFBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      v5 = "PFProcessIsLaunchedToExecuteTests: YES (PHOTOS_EXECUTING_TEST_PLAN)";
      BOOL v6 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_1BC3A8000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v7 = [v0 environment];
  v8 = [v7 objectForKeyedSubscript:@"isRunningPBAT"];
  uint64_t v9 = [v8 integerValue];

  if (v9)
  {
    uint64_t v4 = PFBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "PFProcessIsLaunchedToExecuteTests: YES (isRunningPBAT)";
      BOOL v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    PFProcessIsLaunchedToExecuteTests_isLaunchedToExecuteTests = 1;
    goto LABEL_9;
  }
  if (PFOSVariantHasInternalDiagnostics_onceToken != -1) {
    dispatch_once(&PFOSVariantHasInternalDiagnostics_onceToken, &__block_literal_global_3_225);
  }
  if (PFOSVariantHasInternalDiagnostics_hasInternalDiagnostics)
  {
    v10 = PFBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1BC3A8000, v10, OS_LOG_TYPE_DEFAULT, "PFProcessIsLaunchedToExecuteTests: NO", v11, 2u);
    }
  }
LABEL_9:
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  if (PFOSVariantHasInternalDiagnostics_onceToken != -1) {
    dispatch_once(&PFOSVariantHasInternalDiagnostics_onceToken, &__block_literal_global_3_225);
  }
  return PFOSVariantHasInternalDiagnostics_hasInternalDiagnostics;
}

void sub_1BC3AA84C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PFStateCaptureGetLog()
{
  if (PFStateCaptureGetLog_predicate != -1) {
    dispatch_once(&PFStateCaptureGetLog_predicate, &__block_literal_global_3);
  }
  v0 = (void *)PFStateCaptureGetLog_log;
  return v0;
}

id PFBackendGetLog()
{
  if (PFBackendGetLog_predicate != -1) {
    dispatch_once(&PFBackendGetLog_predicate, &__block_literal_global_14);
  }
  v0 = (void *)PFBackendGetLog_log;
  return v0;
}

double PFSizeWithAspectRatioFittingSize(double a1, double a2, double a3)
{
  if (a2 == 0.0 || a3 == 0.0) {
    return 0.0;
  }
  BOOL v3 = a2 == INFINITY && a3 == INFINITY;
  double v4 = 0.0;
  if (!v3)
  {
    if (fabs(a2 / a3) <= a1) {
      return a2;
    }
    else {
      return a3 * a1;
    }
  }
  return v4;
}

uint64_t __PFOSVariantHasInternalUI_block_invoke()
{
  uint64_t result = os_variant_has_internal_ui();
  PFOSVariantHasInternalUI_isAppleInternal = result;
  return result;
}

uint64_t __PFOSVariantHasInternalDiagnostics_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  PFOSVariantHasInternalDiagnostics_hasInternalDiagnostics = result;
  return result;
}

uint64_t __PFStateCaptureGetLog_block_invoke()
{
  PFStateCaptureGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend", "StateCapture");
  return MEMORY[0x1F41817F8]();
}

BOOL PFObjc_implementsClassMethod(void *a1, const char *a2)
{
  Class = object_getClass(a1);
  return PFObjc_implementsInstanceMethod(Class, a2);
}

uint64_t __PFBackendGetLog_block_invoke()
{
  PFBackendGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend", "Backend");
  return MEMORY[0x1F41817F8]();
}

id PFStringWithValidatedFormatAndLocale(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = (objc_class *)NSString;
  id v10 = a3;
  id v32 = 0;
  v11 = (void *)[[v9 alloc] initWithValidatedFormat:v7 validFormatSpecifiers:v8 locale:v10 arguments:a4 error:&v32];

  id v12 = v32;
  if (!v11)
  {
    if (PFStringWithValidatedFormatAndLocale_predicate != -1) {
      dispatch_once(&PFStringWithValidatedFormatAndLocale_predicate, &__block_literal_global);
    }
    id v13 = v7;
    if (objc_opt_respondsToSelector())
    {
      v14 = [v13 formatConfiguration];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [v14 objectForKeyedSubscript:@"format"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [v15 objectForKeyedSubscript:@"one"];
          v17 = v16;
          if (v16)
          {
            id v18 = v16;
          }
          else
          {
            v20 = [v15 objectForKeyedSubscript:@"two"];
            v21 = v20;
            if (v20)
            {
              id v18 = v20;
            }
            else
            {
              v22 = [v15 objectForKeyedSubscript:@"few"];
              if (v22)
              {
                v23 = v22;
                id v18 = v22;
              }
              else
              {
                v24 = [v15 objectForKeyedSubscript:@"many"];
                if (v24)
                {
                  v25 = v24;
                  id v18 = v24;
                }
                else
                {
                  v26 = [v15 objectForKeyedSubscript:@"zero"];
                  v31 = v26;
                  if (v26)
                  {
                    id v27 = v26;
                  }
                  else
                  {
                    id v27 = [v15 objectForKeyedSubscript:@"other"];
                  }
                  id v18 = v27;

                  v25 = 0;
                }

                v23 = 0;
              }

              v21 = 0;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v28 = v18;
          }
          else {
            v28 = v13;
          }
          id v19 = v28;
        }
        else
        {
          id v19 = v13;
        }
      }
      else
      {
        id v19 = v13;
      }
    }
    else
    {
      id v19 = v13;
    }

    if (PFStringWithValidatedFormatAndLocale_doubleLocalizedStrings)
    {
      v29 = @"*NSDoubleLocalizedStrings: FORMAT_VALIDATION_FAIL ('%@')*";
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = v19;
        __int16 v35 = 2112;
        id v36 = v8;
        __int16 v37 = 2112;
        id v38 = v12;
        _os_log_fault_impl(&dword_1BC3A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed to make string with validated format for '%@' with specifiers '%@': %@", buf, 0x20u);
      }
      v29 = @"*FORMAT_VALIDATION_FAIL ('%@')*";
    }
    v11 = objc_msgSend(NSString, "stringWithFormat:", v29, v19);
  }
  return v11;
}

id PFPhotoFoundationBinaryImageUUID()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  int image_uuid = _dyld_get_image_uuid();
  v1 = 0;
  if (image_uuid) {
    v1 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v3];
  }
  return v1;
}

__CFString *PFStringVersionOfRunTimeLibrary(void *a1)
{
  int32_t v1 = NSVersionOfRunTimeLibrary((const char *)[a1 UTF8String]);
  return _PFLibraryVersionToString(v1);
}

__CFString *_PFLibraryVersionToString(int a1)
{
  if (a1 == -1)
  {
    BOOL v3 = @"0.0.0";
  }
  else
  {
    uint64_t v2 = (a1 >> 16);
    if ((_BYTE)a1)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%d.%d.%d", v2, BYTE1(a1), a1);
    }
    else if (BYTE1(a1))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%d.%d", v2, BYTE1(a1), v6);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%d", v2, v5, v6);
    }
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

__CFString *PFStringVersionOfLinkTimeLibrary(void *a1)
{
  int32_t v1 = NSVersionOfLinkTimeLibrary((const char *)[a1 UTF8String]);
  return _PFLibraryVersionToString(v1);
}

void __PFStringWithValidatedFormatAndLocale_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  PFStringWithValidatedFormatAndLocale_doubleLocalizedStrings = [v0 BOOLForKey:@"NSDoubleLocalizedStrings"];

  if (PFStringWithValidatedFormatAndLocale_doubleLocalizedStrings)
  {
    int32_t v1 = PFBackendGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl(&dword_1BC3A8000, v1, OS_LOG_TYPE_DEFAULT, "Photos string format validation suppressed because of: NSDoubleLocalizedStrings", v2, 2u);
    }
  }
}

id PFStringWithValidatedFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = PFStringWithValidatedFormatAndLocale(a1, a2, 0, (uint64_t)&a9);
  return v9;
}

id PFLocalizedStringWithValidatedFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = (void *)MEMORY[0x1E4F1CA20];
  id v11 = a2;
  id v12 = a1;
  id v13 = [v10 currentLocale];
  v14 = PFStringWithValidatedFormatAndLocale(v12, v11, v13, (uint64_t)&a9);

  return v14;
}

id PFUIGetLog()
{
  if (PFUIGetLog_predicate != -1) {
    dispatch_once(&PFUIGetLog_predicate, &__block_literal_global_6);
  }
  v0 = (void *)PFUIGetLog_log;
  return v0;
}

uint64_t __PFUIGetLog_block_invoke()
{
  PFUIGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui", "UI");
  return MEMORY[0x1F41817F8]();
}

void sub_1BC3AC4F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BC3ACA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void _PFAssertFailHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a4;
  id v13 = +[PFAssertionHandler currentHandler];
  v14 = [NSString stringWithUTF8String:a1];
  v15 = [NSString stringWithUTF8String:a2];
  [v13 handleFailureInFunction:v14 file:v15 lineNumber:a3 description:v12 arguments:&a9];

  abort();
}

void sub_1BC3ACBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void _PFAssertContinueHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a4;
  id v13 = +[PFAssertionHandler currentHandler];
  v14 = [NSString stringWithUTF8String:a1];
  v15 = [NSString stringWithUTF8String:a2];
  [v13 continueAfterAssertInFunction:v14 file:v15 lineNumber:a3 description:v12 arguments:&a9];
}

id PFMethodNotImplementedException(void *a1, const char *a2)
{
  id v3 = a1;
  double v4 = PFFullMethodName(v3, a2);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  id v7 = [NSString stringWithFormat:@"%@: method not implemented sent to %p", v4, v3];

  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

id PFFullMethodName(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();

  uint64_t v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = 45;
  if ((id)v4 == v3) {
    uint64_t v7 = 43;
  }
  id v8 = [v5 stringWithFormat:@"%c[%@ %@]", v7, v4, v6];

  return v8;
}

id PFAbstractMethodException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = PFFullMethodName(v3, a2);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@: must override selector sent to %p", v4, v3];

  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

double PFFloatNan()
{
  if (PFFloatNan_onceToken != -1) {
    dispatch_once(&PFFloatNan_onceToken, &__block_literal_global_44);
  }
  return *(double *)&PFFloatNan_result;
}

void __PFFloatNan_block_invoke()
{
  PFFloatNan_uint64_t result = nan(0);
}

id PFMap(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (uint64_t v5 = [v3 performSelector:sel_count]) != 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    }
    uint64_t v7 = (void *)v6;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i));
          if (v13) {
            objc_msgSend(v7, "addObject:", v13, (void)v15);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id PFMapDictionary(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = v3;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          id v12 = [v6 objectForKeyedSubscript:v11];
          id v13 = v4[2](v4, v11, v12);
          if (v13) {
            [v5 setObject:v13 forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v3 = v15;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id PFMapIndexes(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v6 = [v3 firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v3 indexGreaterThanIndex:i])
    {
      uint64_t v8 = v4[2](v4, i);
      if (v8) {
        [v5 addObject:v8];
      }
    }
  }

  return v5;
}

id PFFilter(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (v4[2](v4, v11)) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t PFCount(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        v7 += v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * i));
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id PFFind(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t PFExists(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

id PFReduce(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = a3;
  id v8 = v6;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  long long v10 = v8;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v17;
    long long v10 = v8;
    do
    {
      uint64_t v13 = 0;
      long long v14 = v10;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v5);
        }
        long long v10 = v7[2](v7, *(void *)(*((void *)&v16 + 1) + 8 * v13), v14);

        ++v13;
        long long v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v10;
}

double PFReduceF(void *a1, void *a2, double a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        a3 = v6[2](v6, *(void *)(*((void *)&v12 + 1) + 8 * v10++), a3);
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return a3;
}

BOOL PFObjc_classIsSubclassOfClass(objc_class *Superclass, objc_class *a2)
{
  do
    Superclass = class_getSuperclass(Superclass);
  while (Superclass && Superclass != a2);
  return Superclass == a2;
}

void PFObjc_enumerateClassNamesForImageHeader(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_copyClassNamesForImageHeader();
  free(v3);
}

void PFObjc_enumerateSubclassesForHeader(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __PFObjc_enumerateSubclassesForHeader_block_invoke;
  v9[3] = &unk_1E62ABF40;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  id v10 = v7;
  id v8 = v7;
  PFObjc_enumerateClassNamesForImageHeader(a1, v9);
}

objc_class *PFObjc_implementingClassForInstanceMethod(objc_class *a1, const char *a2)
{
  do
  {
    if (PFObjc_implementsInstanceMethod(a1, a2)) {
      break;
    }
    a1 = (objc_class *)[(objc_class *)a1 superclass];
  }
  while (a1);
  return a1;
}

double PFScaleFactorForMaximumPixelCount(unint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 0.0 || a3 == 0.0) {
    _PFAssertFailHandler((uint64_t)"CGFloat PFScaleFactorForMaximumPixelCount(CGSize, NSUInteger)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFGeometryUtilities.m", 50, @"non-zero inputSize required", a7, a8, a9, a10, vars0);
  }
  if (!a1) {
    _PFAssertFailHandler((uint64_t)"CGFloat PFScaleFactorForMaximumPixelCount(CGSize, NSUInteger)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFGeometryUtilities.m", 51, @"maximumPixelCount > 0 required", a7, a8, a9, a10, vars0);
  }
  double result = sqrt((double)a1 / (a2 * a3));
  if (a2 >= a3) {
    double v12 = a2;
  }
  else {
    double v12 = a3;
  }
  double v13 = round(v12 * result);
  if (a2 < a3) {
    a3 = a2;
  }
  if (v13 * round(a3 * result) > (double)a1) {
    return result * ((v13 + -1.0) / v13);
  }
  return result;
}

BOOL PFRectIsNull(double a1, double a2)
{
  return a2 == INFINITY || a1 == INFINITY;
}

double PFRectByFlippingHorizontallyInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + a5 + a7 - a1 - a3;
}

double PFLargestSalientAspectFilledCropRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15)
{
  if (a3 == 0.0)
  {
    double v20 = 0.0;
  }
  else
  {
    double v20 = 0.0;
    if (a4 != 0.0)
    {
      BOOL v21 = fabs(a3 / a4) <= a5;
      double v22 = a4 * a5;
      if (v21) {
        double v22 = a3;
      }
      if (a3 != INFINITY || a4 != INFINITY) {
        double v20 = v22;
      }
    }
  }
  double v24 = a1 + a9 * a3;
  double v25 = a3 * a11;
  double v26 = a1 + a13 * a3 + a3 * a15 * 0.5 + v20 * -0.5;
  double v27 = v24 + a3 * a11 * 0.5;
  if (v26 >= v24)
  {
    double v28 = v24 + v25;
    if (v20 + v26 > v28)
    {
      double v26 = v28 - v20;
      double v29 = v27 + v20 * -0.5;
      if (v25 < v20) {
        double v26 = v29;
      }
    }
  }
  else
  {
    double v26 = v27 + v20 * -0.5;
    if (v25 >= v20) {
      double v26 = v24;
    }
  }
  return fmax(fmin(v26, a3 - v20), 0.0);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BC3AFADC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BC3B0088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1F40C99B0](libraryName);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1F40C99B8](libraryName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1F40C9E20]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1F4181628](m, imp);
}

double nan(const char *a1)
{
  MEMORY[0x1F40CCE90](a1);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

uint64_t objc_copyClassNamesForImageHeader()
{
  return MEMORY[0x1F41816A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1F4181788](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}