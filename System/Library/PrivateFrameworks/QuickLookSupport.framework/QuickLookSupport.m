void sub_217F325F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id QLPreviewCopyEmbeddedIWorkData(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v7 = a1;
  id v40 = a2;
  id v44 = a3;
  id v42 = a4;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy_;
  v62 = __Block_byref_object_dispose_;
  id v63 = 0;
  v39 = [(__CFString *)v7 path];
  id v57 = 0;
  uint64_t v8 = *MEMORY[0x263EFF6A8];
  id v56 = 0;
  LOBYTE(a4) = [(__CFString *)v7 getResourceValue:&v57 forKey:v8 error:&v56];
  id v43 = v57;
  id v41 = v56;
  if ((a4 & 1) == 0)
  {
    v23 = generationLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      QLPreviewCopyEmbeddedIWorkData_cold_2();
    }

    BOOL v22 = v7 == 0;
    goto LABEL_25;
  }
  if (!v7)
  {
    BOOL v22 = 1;
    goto LABEL_25;
  }
  if (![v43 BOOLValue]) {
    goto LABEL_20;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v42;
  uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v69 count:16];
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v11 = *(void *)v53;
  uint64_t v12 = *MEMORY[0x263F07F70];
  *(void *)&long long v10 = 138412290;
  long long v37 = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v53 != v11) {
        objc_enumerationMutation(obj);
      }
      v14 = -[__CFString URLByAppendingPathComponent:](v7, "URLByAppendingPathComponent:", *(void *)(*((void *)&v52 + 1) + 8 * i), v37);
      id v15 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v51 = 0;
      uint64_t v16 = [v15 initWithContentsOfURL:v14 options:1 error:&v51];
      v17 = (__CFString *)v51;
      v18 = (void *)v59[5];
      v59[5] = v16;

      if (v59[5])
      {
        v33 = generationLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217F31000, v33, OS_LOG_TYPE_INFO, "Returning thumbnail or preview found inside iWork bundle", buf, 2u);
        }

        BOOL v22 = 0;
        int v24 = 0;
        goto LABEL_26;
      }
      v19 = [(__CFString *)v17 domain];
      if ([v19 isEqualToString:v12])
      {
        BOOL v20 = [(__CFString *)v17 code] == 4;

        if (v20) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      v21 = generationLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v37;
        v65 = v17;
        _os_log_error_impl(&dword_217F31000, v21, OS_LOG_TYPE_ERROR, "Couldn't read thumbnail or preview inside iWork bundle: %@", buf, 0xCu);
      }

LABEL_17:
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v69 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_19:

LABEL_20:
  BOOL v22 = 0;
LABEL_25:
  int v24 = 1;
LABEL_26:
  if (!v59[5])
  {
    v25 = generationLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F31000, v25, OS_LOG_TYPE_INFO, "No iWork thumbnail or preview found inside bundle", buf, 2u);
    }
  }
  if (!v24)
  {
LABEL_40:
    id v32 = (id)v59[5];
    goto LABEL_48;
  }
  if (!+[QLUTIManager contentTypeIsIWorkType:v44]) {
    goto LABEL_47;
  }
  if (!v22)
  {
    v28 = generationLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = [v39 lastPathComponent];
      QLPreviewCopyEmbeddedIWorkData_cold_1(v29, v68, v28);
    }

    uint64_t v50 = 0;
    v26 = (id *)&v50;
    v27 = [[QLZipArchive alloc] initWithURL:v7 error:&v50];
LABEL_38:
    v30 = v27;
    id v31 = *v26;
    if (!v30) {
      goto LABEL_45;
    }
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __QLPreviewCopyEmbeddedIWorkData_block_invoke;
    v45[3] = &unk_2642F21A0;
    id v46 = v42;
    v48 = &v58;
    v47 = v7;
    [(QLZipArchive *)v30 enumerateEntriesWithHandler:v45];

    goto LABEL_40;
  }
  if (v40)
  {
    uint64_t v49 = 0;
    v26 = (id *)&v49;
    v27 = [[QLZipArchive alloc] initWithData:v40 error:&v49];
    goto LABEL_38;
  }
  id v31 = 0;
LABEL_45:
  v34 = generationLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v36 = @"archive data";
    if (!v22) {
      v36 = v7;
    }
    *(_DWORD *)buf = 138412546;
    v65 = v36;
    __int16 v66 = 2112;
    id v67 = v31;
    _os_log_error_impl(&dword_217F31000, v34, OS_LOG_TYPE_ERROR, "Hit error trying to read %@: %@", buf, 0x16u);
  }

LABEL_47:
  id v32 = 0;
LABEL_48:

  _Block_object_dispose(&v58, 8);
  return v32;
}

void sub_217F32DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
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

id generationLog()
{
  uint64_t v0 = MEMORY[0x263F16100];
  v1 = *(void **)(MEMORY[0x263F16100] + 112);
  if (!v1)
  {
    QLTInitLogging();
    v1 = *(void **)(v0 + 112);
  }
  return v1;
}

void __QLPreviewCopyEmbeddedIWorkData_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x21D45D430]();
  if (v7)
  {
    long long v10 = [v7 url];
    uint64_t v11 = [v10 relativePath];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      int v24 = v9;
      v25 = v7;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [v11 rangeOfString:*(void *)(*((void *)&v27 + 1) + 8 * i) options:12];
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v18 = v17;
            if (!v17
              || [v11 characterAtIndex:v17 - 1] == 47
              && (v18 == 1
               || [v11 rangeOfString:@"/", 0, 0, v18 - 1 options range] == 0x7FFFFFFFFFFFFFFFLL))
            {
              id v26 = v8;
              id v7 = v25;
              uint64_t v20 = [v25 readDataWithError:&v26];
              id v19 = v26;

              uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
              BOOL v22 = *(void **)(v21 + 40);
              *(void *)(v21 + 40) = v20;

              uint64_t v9 = v24;
              if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
              {
                v23 = generationLog();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_2(a1, (uint64_t)v19, v23);
                }
              }
              *a4 = 1;
              goto LABEL_23;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      id v19 = v8;
      uint64_t v9 = v24;
      id v7 = v25;
    }
    else
    {
      id v19 = v8;
    }
LABEL_23:

    id v8 = v19;
  }
  else
  {
    uint64_t v11 = generationLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_1((uint64_t)v8, v11);
    }
  }
}

id QLPreviewCopyEmbeddedIWorkThumbnailDataInFile(void *a1, void *a2)
{
  return QLPreviewCopyEmbeddedIWorkData(a1, 0, a2, &unk_26C8F4188);
}

id QLPreviewCopyEmbeddedIWorkThumbnailDataInData(void *a1, void *a2)
{
  return QLPreviewCopyEmbeddedIWorkData(0, a1, a2, &unk_26C8F41A0);
}

id QLPreviewCopyEmbeddedPDF(void *a1, void *a2)
{
  return QLPreviewCopyEmbeddedIWorkData(a1, 0, a2, &unk_26C8F41B8);
}

id QLFrameworkBundle()
{
  if (QLFrameworkBundle_onceToken != -1) {
    dispatch_once(&QLFrameworkBundle_onceToken, &__block_literal_global);
  }
  uint64_t v0 = (void *)QLFrameworkBundle_QLBundle;
  return v0;
}

void __QLFrameworkBundle_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263F086E0];
  id v4 = [NSURL fileURLWithPath:@"/" isDirectory:1];
  v1 = [v4 URLByAppendingPathComponent:@"System/Library/Frameworks/QuickLook.framework" isDirectory:1];
  uint64_t v2 = [v0 bundleWithURL:v1];
  v3 = (void *)QLFrameworkBundle_QLBundle;
  QLFrameworkBundle_QLBundle = v2;
}

uint64_t QLGuessEncodingForTextFileFromData(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] <= 0x400)
  {
    id v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "subdataWithRange:", 0, 1024);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  uint64_t v4 = 134217984;
  ucsdet_open();
  id v5 = v3;
  [v5 bytes];
  [v5 length];
  ucsdet_setText();
  if (ucsdet_detect()
    && (Name = (const char *)ucsdet_getName()) != 0
    && (CFStringRef v8 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], Name, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28])) != 0)
  {
    CFStringRef v9 = v8;
    CFStringEncoding v10 = CFStringConvertIANACharSetNameToEncoding(v8);
    CFRelease(v9);
    ucsdet_close();
    if (v10 == 2561) {
      unsigned int v11 = 1056;
    }
    else {
      unsigned int v11 = v10;
    }
    if (v10 == -1) {
      uint64_t v4 = 134217984;
    }
    else {
      uint64_t v4 = v11;
    }
  }
  else
  {
    ucsdet_close();
  }

  return v4;
}

uint64_t QLGuessEncodingForTextFileAtURL(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = [MEMORY[0x263F08850] defaultManager];
    v3 = [v1 path];
    id v20 = 0;
    uint64_t v4 = [v2 attributesOfItemAtPath:v3 error:&v20];
    id v5 = v20;
    v6 = (void *)[v4 mutableCopy];

    if (v6)
    {
      uint64_t v7 = [v6 objectForKey:@"NSFileExtendedAttributes"];
      if (v7)
      {
        CFStringRef v8 = v7;
        id v9 = [NSString alloc];
        CFStringEncoding v10 = [v8 objectForKey:@"com.apple.TextEncoding"];
        unsigned int v11 = (void *)[v9 initWithData:v10 encoding:4];

        uint64_t v12 = [v11 rangeOfString:@";" options:4];
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        {

LABEL_9:
          goto LABEL_10;
        }
        uint64_t v18 = [v11 substringFromIndex:v12 + 1];
        uint64_t v13 = [v18 integerValue];

        if (v13 != -1)
        {
          id v15 = v5;
LABEL_15:

          goto LABEL_16;
        }
      }
LABEL_10:
      id v19 = v5;
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v1 options:1 maxLength:1024 error:&v19];
      id v15 = v19;

      if (!v14)
      {
        uint64_t v16 = generationLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          QLGuessEncodingForTextFileAtURL_cold_1();
        }
      }
      uint64_t v13 = QLGuessEncodingForTextFileFromData(v14);

      goto LABEL_15;
    }
    CFStringRef v8 = generationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      QLGuessEncodingForTextFileAtURL_cold_2();
    }
    goto LABEL_9;
  }
  uint64_t v13 = 134217984;
LABEL_16:

  return v13;
}

uint64_t QLCheckIsPlatformWithExtensionAuditToken(_OWORD *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v1 = a1[1];
  *(_OWORD *)v11.val = *a1;
  *(_OWORD *)&v11.val[4] = v1;
  id v2 = SecTaskCreateWithAuditToken(0, &v11);
  if (!v2) {
    return 0;
  }
  v3 = v2;
  uint32_t CodeSignStatus = SecTaskGetCodeSignStatus(v2);
  if ((CodeSignStatus & 0x2010) != 0) {
    uint64_t v5 = ((CodeSignStatus & 0x10000001) != 0) & (CodeSignStatus >> 26);
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = generationLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11.val[0] = 67109376;
    v11.val[1] = v5;
    LOWORD(v11.val[2]) = 1024;
    *(unsigned int *)((char *)&v11.val[2] + 2) = CodeSignStatus;
    _os_log_impl(&dword_217F31000, v6, OS_LOG_TYPE_INFO, "Code signature is first party: %d (flags : %x)", (uint8_t *)&v11, 0xEu);
  }

  CFStringRef v7 = SecTaskCopySigningIdentifier(v3, 0);
  if (v7)
  {
    CFStringRef v8 = v7;
    id v9 = generationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11.val[0] = 138412290;
      *(void *)&v11.val[1] = v8;
      _os_log_impl(&dword_217F31000, v9, OS_LOG_TYPE_INFO, "Code signature identifier %@", (uint8_t *)&v11, 0xCu);
    }

    CFRelease(v8);
  }
  CFRelease(v3);
  return v5;
}

const void *_QLDictionaryValueForKey(const __CFDictionary *a1, const void *a2, CFTypeID a3, uint64_t a4)
{
  if (!a1) {
    return (const void *)a4;
  }
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return (const void *)a4;
  }
  CFStringRef v7 = Value;
  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 != a3)
  {
    CFStringRef v9 = CFCopyTypeIDDescription(v8);
    CFStringRef v10 = CFCopyTypeIDDescription(a3);
    if (v9) {
      CFRelease(v9);
    }
    if (v10) {
      CFRelease(v10);
    }
    return (const void *)a4;
  }
  return v7;
}

uint64_t _QLSDictionaryBooleanValueForKey(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (!a1) {
    return a3;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return a3;
  }
  CFBooleanRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFBooleanGetTypeID()) {
    return a3;
  }
  return CFBooleanGetValue(v5);
}

void _QLSDictionarySetBooleanValueForKey(__CFDictionary *a1, const void *a2, int a3)
{
  v3 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    v3 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(a1, a2, *v3);
}

uint64_t _QLDictionaryIntValueForKey(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int valuePtr = a3;
  if (a1)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      CFNumberRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetIntValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, int a4)
{
  int valuePtr = a4;
  CFNumberRef v6 = CFNumberCreate(a1, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

double _QLDictionaryCGFloatValueForKey(const __CFDictionary *a1, const void *a2, double a3)
{
  double v3 = a3;
  double valuePtr = a3;
  if (a1)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      CFNumberRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberCGFloatType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetCGFloatValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, double a4)
{
  double valuePtr = a4;
  CFNumberRef v6 = CFNumberCreate(a1, kCFNumberCGFloatType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

float _QLDictionaryFloatValueForKey(const __CFDictionary *a1, const void *a2, float a3)
{
  float v3 = a3;
  float valuePtr = a3;
  if (a1)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      CFNumberRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberFloatType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetFloatValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, float a4)
{
  float valuePtr = a4;
  CFNumberRef v6 = CFNumberCreate(a1, kCFNumberFloatType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

uint64_t _QLDictionarySInt32ValueForKey(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int valuePtr = a3;
  if (a1)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      CFNumberRef v5 = Value;
      CFTypeID v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

void _QLDictionarySetSInt32ValueForKey(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, int a4)
{
  int valuePtr = a4;
  CFNumberRef v6 = CFNumberCreate(a1, kCFNumberSInt32Type, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionarySetValue(a2, a3, v6);
    CFRelease(v7);
  }
}

CFDictionaryRef _QLSDictionaryGetPointValueForKey(const __CFDictionary *result, const void *a2, CGPoint *a3)
{
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v4 = result;
      CFTypeID v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID()) {
        return (const __CFDictionary *)CGPointMakeWithDictionaryRepresentation(v4, a3);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

void _QLSDictionarySetPointValueForKey(__CFDictionary *a1, const void *a2, double a3, double a4)
{
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(*(CGPoint *)&a3);
  if (DictionaryRepresentation)
  {
    CFDictionaryRef v7 = DictionaryRepresentation;
    CFDictionarySetValue(a1, a2, DictionaryRepresentation);
    CFRelease(v7);
  }
}

CFDictionaryRef _QLSDictionaryGetSizeValueForKey(const __CFDictionary *result, const void *a2, CGSize *a3)
{
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v4 = result;
      CFTypeID v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID()) {
        return (const __CFDictionary *)CGSizeMakeWithDictionaryRepresentation(v4, a3);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

void _QLSDictionarySetSizeValueForKey(__CFDictionary *a1, const void *a2, double a3, double a4)
{
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&a3);
  if (DictionaryRepresentation)
  {
    CFDictionaryRef v7 = DictionaryRepresentation;
    CFDictionarySetValue(a1, a2, DictionaryRepresentation);
    CFRelease(v7);
  }
}

CFDictionaryRef _QLSDictionaryGetRectValueForKey(const __CFDictionary *result, const void *a2, CGRect *a3)
{
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a2);
    if (result)
    {
      CFDictionaryRef v4 = result;
      CFTypeID v5 = CFGetTypeID(result);
      if (v5 == CFDictionaryGetTypeID()) {
        return (const __CFDictionary *)CGRectMakeWithDictionaryRepresentation(v4, a3);
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

void _QLSDictionarySetRectValueForKey(__CFDictionary *a1, const void *a2, double a3, double a4, double a5, double a6)
{
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&a3);
  if (DictionaryRepresentation)
  {
    CFDictionaryRef v9 = DictionaryRepresentation;
    CFDictionarySetValue(a1, a2, DictionaryRepresentation);
    CFRelease(v9);
  }
}

void _QLDictionarySetValueForKeyIfExists(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  if (value) {
    CFDictionarySetValue(theDict, key, value);
  }
}

uint64_t _QLSAppPreferencesBooleanValueForKey(const __CFString *a1, unsigned int a2)
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE60];
  uint64_t result = CFPreferencesGetAppBooleanValue(a1, (CFStringRef)*MEMORY[0x263EFFE60], &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
  {
    BOOL v6 = CFPreferencesGetAppIntegerValue(a1, v4, &keyExistsAndHasValidFormat) != 0;
    if (keyExistsAndHasValidFormat) {
      return v6;
    }
    else {
      return a2;
    }
  }
  return result;
}

uint64_t _QLSAppPreferencesIntValueForKey(const __CFString *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unsigned int valuePtr = a2;
  CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyAppValue(a1, (CFStringRef)*MEMORY[0x263EFFE60]);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID()) {
        unsigned int valuePtr = CFStringGetIntValue((CFStringRef)v4);
      }
    }
    CFRelease(v4);
    return valuePtr;
  }
  return v2;
}

uint64_t _QLSAppPreferencesCFIndexValueForKey(const __CFString *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t valuePtr = a2;
  CFNumberRef v3 = (const __CFNumber *)CFPreferencesCopyAppValue(a1, (CFStringRef)*MEMORY[0x263EFFE60]);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberCFIndexType, &valuePtr);
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID()) {
        uint64_t valuePtr = CFStringGetIntValue((CFStringRef)v4);
      }
    }
    CFRelease(v4);
    return valuePtr;
  }
  return v2;
}

uint64_t _QLSGlobalQuickLookPreferencesBooleanValueForKey(const __CFString *a1, uint64_t Value)
{
  CFBooleanRef v3 = (const __CFBoolean *)CFPreferencesCopyValue(a1, @"com.apple.quicklook", (CFStringRef)*MEMORY[0x263EFFE58], (CFStringRef)*MEMORY[0x263EFFE68]);
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFBooleanGetTypeID()) {
      CFNumberRef Value = CFBooleanGetValue(v4);
    }
    CFRelease(v4);
  }
  return Value;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id extensionLog()
{
  uint64_t v0 = MEMORY[0x263F16100];
  long long v1 = *(void **)(MEMORY[0x263F16100] + 136);
  if (!v1)
  {
    QLTInitLogging();
    long long v1 = *(void **)(v0 + 136);
  }
  return v1;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_217F34C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F3547C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id _log()
{
  uint64_t v0 = MEMORY[0x263F16100];
  uint64_t v1 = *(void **)(MEMORY[0x263F16100] + 128);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 128);
  }
  return v1;
}

CGColorSpaceRef QLDrawGrayLinearGradient(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  CGColorSpaceRef result = CGColorSpaceCreateDeviceGray();
  if (result)
  {
    long long v30 = result;
    components[0] = a8;
    components[1] = a9;
    components[2] = a12;
    components[3] = a13;
    id v31 = CGGradientCreateWithColorComponents(result, components, 0, 2uLL);
    CFRelease(v30);
    if (v31)
    {
      CGContextSaveGState(a1);
      v35.origin.x = a2;
      v35.origin.y = a3;
      v35.size.width = a4;
      v35.size.height = a5;
      CGContextClipToRect(a1, v35);
      v33.x = a6;
      v33.y = a7;
      v34.x = a10;
      v34.y = a11;
      CGContextDrawLinearGradient(a1, v31, v33, v34, 0);
      CGContextRestoreGState(a1);
      CFRelease(v31);
      return (CGColorSpaceRef)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t QLDrawLinearGradient(CGColor *a1, void *a2, CGContext *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  ColorSpace = CGColorGetColorSpace(a1);
  values[0] = a1;
  values[1] = a2;
  CFArrayRef v23 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x263EFFF70]);
  int v24 = CGGradientCreateWithColors(ColorSpace, v23, 0);
  CFRelease(v23);
  if (!v24) {
    return 0;
  }
  CGContextSaveGState(a3);
  v29.origin.x = a4;
  v29.origin.y = a5;
  v29.size.width = a6;
  v29.size.height = a7;
  CGContextClipToRect(a3, v29);
  v27.x = a8;
  v27.y = a9;
  v28.x = a10;
  v28.y = a11;
  CGContextDrawLinearGradient(a3, v24, v27, v28, 0);
  CGContextRestoreGState(a3);
  CFRelease(v24);
  return 1;
}

double QLFillOrExceedAtLeastOneDimensionOfSizeInSize(int a1, double result, double a3, double a4, double a5)
{
  if (a3 != 0.0)
  {
    double v5 = result;
    if (result != 0.0 && a5 != 0.0 && a4 != 0.0)
    {
      if (a5 >= a3)
      {
        return a4;
      }
      else
      {
        CGColorSpaceRef result = a4;
        if (a4 < v5)
        {
          double v6 = a3 / a5;
          if (a3 / a5 > v5 / a4) {
            double v6 = v5 / a4;
          }
          double v7 = round(a4 * v6 * 1000000.0) / 1000000.0;
          double v8 = ceil(v7);
          if (a1) {
            CGColorSpaceRef result = v8;
          }
          else {
            CGColorSpaceRef result = v7;
          }
          if (result < 1.0) {
            return 1.0;
          }
        }
      }
    }
  }
  return result;
}

double CGCeiling(double a1)
{
  return ceil(a1);
}

double QLAdaptSizeInSizeWithRounding(int a1, double (*a2)(double), double a3, double a4, double a5, double a6)
{
  double v6 = a3;
  if (a4 != 0.0 && a3 != 0.0 && a6 != 0.0 && a5 != 0.0)
  {
    if (a1 || a6 > a4 || a5 > a3)
    {
      if (a4 / a6 <= a3 / a5)
      {
        double v8 = round(a5 * (a4 / a6) * 1000000.0);
        double v6 = v8 / 1000000.0;
        if (a2) {
          double v6 = a2(v8 / 1000000.0);
        }
      }
      else
      {
        double v7 = round(a6 * (a3 / a5) * 1000000.0);
        if (a2) {
          a2(v7 / 1000000.0);
        }
      }
      if (v6 < 1.0) {
        return 1.0;
      }
    }
    else
    {
      return a5;
    }
  }
  return v6;
}

double QLAdaptSizeInSize(int a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2) {
    double v6 = CGFloor;
  }
  else {
    double v6 = 0;
  }
  return QLAdaptSizeInSizeWithRounding(a1, v6, a3, a4, a5, a6);
}

double CGFloor(double a1)
{
  return floor(a1);
}

double QLAdaptSizeOutSizeWithRounding(int a1, double (*a2)(double), double a3, double a4, double a5, double a6)
{
  double v6 = a3;
  if (a4 != 0.0 && a3 != 0.0 && a6 != 0.0 && a5 != 0.0)
  {
    if (a1 || a6 < a4 || a5 < a3)
    {
      if (a4 / a6 >= a3 / a5)
      {
        double v8 = round(a5 * (a4 / a6) * 1000000.0);
        double v6 = v8 / 1000000.0;
        if (a2) {
          double v6 = a2(v8 / 1000000.0);
        }
      }
      else
      {
        double v7 = round(a6 * (a3 / a5) * 1000000.0);
        if (a2) {
          a2(v7 / 1000000.0);
        }
      }
      if (v6 < 1.0) {
        return 1.0;
      }
    }
    else
    {
      return a5;
    }
  }
  return v6;
}

double QLAdaptSizeOutSize(int a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2) {
    double v6 = CGFloor;
  }
  else {
    double v6 = 0;
  }
  return QLAdaptSizeOutSizeWithRounding(a1, v6, a3, a4, a5, a6);
}

CGFloat QLAdaptSizeToRectWithRounding2(int a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8, double a9)
{
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __QLAdaptSizeToRectWithRounding2_block_invoke;
  v33[3] = &__block_descriptor_40_e8_d16__0d8l;
  v33[4] = a3;
  uint64_t v17 = (double (**)(void, double, __n128))MEMORY[0x21D45D660](v33);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __QLAdaptSizeToRectWithRounding2_block_invoke_2;
  v32[3] = &__block_descriptor_40_e8_d16__0d8l;
  v32[4] = a2;
  uint64_t v18 = (double (**)(void, double))MEMORY[0x21D45D660](v32);
  if (a8 <= 0.0 || a9 <= 0.0)
  {
    v38.origin.x = a4;
    v38.origin.y = a5;
    v38.size.width = a6;
    v38.size.height = a7;
    CGFloat Width = CGRectGetWidth(v38);
    double v28 = v18[2](v18, Width * 0.5);
    v39.origin.x = a4;
    v39.origin.y = a5;
    v39.size.width = a6;
    v39.size.height = a7;
    double Height = CGRectGetHeight(v39);
  }
  else
  {
    v34.origin.x = a4;
    v34.origin.y = a5;
    v34.size.width = a6;
    v34.size.height = a7;
    double v19 = CGRectGetWidth(v34) / a8;
    v35.origin.x = a4;
    v35.origin.y = a5;
    v35.size.width = a6;
    v35.size.height = a7;
    double v20 = CGRectGetHeight(v35) / a9;
    if (v19 >= v20) {
      v21.n128_f64[0] = v20;
    }
    else {
      v21.n128_f64[0] = v19;
    }
    if (v19 >= v20) {
      double v20 = v19;
    }
    if (a1) {
      double v22 = v21.n128_f64[0];
    }
    else {
      double v22 = v20;
    }
    double v23 = v17[2](v17, a8 * v22, v21);
    if (v23 >= 1.0) {
      double v24 = v23;
    }
    else {
      double v24 = 1.0;
    }
    double v25 = ((double (*)(double (**)(void, double, __n128), double))v17[2])(v17, a9 * v22);
    if (v25 >= 1.0) {
      double v26 = v25;
    }
    else {
      double v26 = 1.0;
    }
    v36.origin.x = a4;
    v36.origin.y = a5;
    v36.size.width = a6;
    v36.size.height = a7;
    CGFloat v27 = CGRectGetWidth(v36);
    double v28 = v18[2](v18, (v27 - v24) * 0.5);
    v37.origin.x = a4;
    v37.origin.y = a5;
    v37.size.width = a6;
    v37.size.height = a7;
    double Height = CGRectGetHeight(v37) - v26;
  }
  v18[2](v18, Height * 0.5);

  return a4 + v28;
}

CGFloat QLAdaptSizeToRectWithRounding(int a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, double a8)
{
  return QLAdaptSizeToRectWithRounding2(a1, a2, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat QLAdaptSizeToRect(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7)
{
  return QLAdaptSizeToRectWithRounding2(a1, (uint64_t)CGFloor, (uint64_t)CGFloor, a2, a3, a4, a5, a6, a7);
}

double QLScaleRect(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

CGFloat QLAdjustRectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  CGFloat rect = a5;
  v27.origin.x = a5;
  CGFloat v16 = a8;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  if (Width > CGRectGetWidth(v27)) {
    return a1;
  }
  double v17 = a1;
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  double Height = CGRectGetHeight(v28);
  v29.origin.x = rect;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = v16;
  if (Height <= CGRectGetHeight(v29))
  {
    v30.origin.x = rect;
    v30.origin.y = a6;
    v30.size.width = a7;
    v30.size.height = v16;
    v45.origin.x = a1;
    v45.origin.y = a2;
    v45.size.width = a3;
    v45.size.height = a4;
    if (!CGRectContainsRect(v30, v45))
    {
      v31.origin.x = a1;
      v31.origin.y = a2;
      v31.size.width = a3;
      v31.size.height = a4;
      double MinX = CGRectGetMinX(v31);
      v32.origin.x = rect;
      v32.origin.y = a6;
      v32.size.width = a7;
      v32.size.height = v16;
      if (MinX < CGRectGetMinX(v32))
      {
        v33.origin.x = rect;
        v33.origin.y = a6;
        v33.size.width = a7;
        v33.size.height = v16;
        double v17 = CGRectGetMinX(v33);
      }
      v34.origin.x = v17;
      v34.origin.y = a2;
      v34.size.width = a3;
      v34.size.height = a4;
      double MinY = CGRectGetMinY(v34);
      v35.origin.x = rect;
      v35.origin.y = a6;
      v35.size.width = a7;
      v35.size.height = v16;
      if (MinY < CGRectGetMinY(v35))
      {
        v36.origin.x = rect;
        v36.origin.y = a6;
        v36.size.width = a7;
        v36.size.height = v16;
        a2 = CGRectGetMinY(v36);
      }
      v37.origin.x = v17;
      v37.origin.y = a2;
      v37.size.width = a3;
      v37.size.height = a4;
      double MaxX = CGRectGetMaxX(v37);
      v38.origin.x = rect;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = v16;
      if (MaxX > CGRectGetMaxX(v38))
      {
        v39.origin.x = rect;
        v39.origin.y = a6;
        v39.size.width = a7;
        v39.size.height = v16;
        double v21 = CGRectGetMaxX(v39);
        v40.origin.x = v17;
        v40.origin.y = a2;
        v40.size.width = a3;
        v40.size.height = a4;
        double v17 = v21 - CGRectGetWidth(v40);
      }
      v41.origin.x = v17;
      v41.origin.y = a2;
      v41.size.width = a3;
      v41.size.height = a4;
      double MaxY = CGRectGetMaxY(v41);
      v42.origin.x = rect;
      v42.origin.y = a6;
      v42.size.width = a7;
      v42.size.height = v16;
      if (MaxY > CGRectGetMaxY(v42))
      {
        v43.origin.x = rect;
        v43.origin.y = a6;
        v43.size.width = a7;
        v43.size.height = v16;
        CGRectGetMaxY(v43);
        v44.origin.x = v17;
        v44.origin.y = a2;
        v44.size.width = a3;
        v44.size.height = a4;
        CGRectGetHeight(v44);
      }
    }
  }
  return v17;
}

void QLDrawDebugRect(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CGContextSaveGState(a1);
  QLContextSetRGBStrokeColor(a1, a6, a7, a8, 1.0);
  CGContextSetLineWidth(a1, 2.0);
  v24.origin.x = a2;
  v24.origin.y = a3;
  v24.size.width = a4;
  v24.size.height = a5;
  CGContextStrokeRect(a1, v24);
  points.x = a2;
  points.y = a3;
  double v17 = a2 + a4;
  double v18 = a3 + a5;
  CGFloat v19 = a2;
  double v20 = a3 + a5;
  double v21 = a2 + a4;
  CGFloat v22 = a3;
  CGContextStrokeLineSegments(a1, &points, 4uLL);
  CGContextRestoreGState(a1);
}

void QLDrawLockIcon(CGContext *a1, CGFloat a2, CGFloat a3, double a4, double a5, double a6, double a7)
{
  CGFloat v12 = a4 * a7;
  CGFloat v13 = a5 * a7;
  GenericGray = CGColorCreateGenericGray(0.98, 1.0);
  CGContextSetFillColorWithColor(a1, GenericGray);
  v26.origin.x = a2;
  v26.origin.y = a3;
  v26.size.width = v12;
  v26.size.height = v13;
  CGContextFillRect(a1, v26);
  CFRelease(GenericGray);
  id v24 = (id)objc_opt_new();
  [v24 setPointSize:a6];
  [v24 setSymbolWeight:6];
  [v24 setScale:a7];
  id v15 = (void *)[objc_alloc(MEMORY[0x263F4B508]) initWithSymbolName:@"lock.fill" bundleURL:0];
  CGFloat v16 = [v15 imageForDescriptor:v24];
  double v17 = (CGImage *)[v16 CGImage];

  CGImageGetSizeAfterOrientation();
  double v19 = v18;
  double v21 = v20;
  v27.origin.x = a2;
  v27.origin.y = a3;
  v27.size.width = v12;
  v27.size.height = v13;
  CGFloat v22 = CGRectGetMidX(v27) - v19 * 0.5;
  v28.origin.x = a2;
  v28.origin.y = a3;
  v28.size.width = v12;
  v28.size.height = v13;
  CGFloat v23 = CGRectGetMidY(v28) - v21 * 0.5;
  CGContextSetAlpha(a1, 0.36);
  v29.origin.x = v22;
  v29.origin.y = v23;
  v29.size.width = v19;
  v29.size.height = v21;
  CGContextDrawImage(a1, v29, v17);
}

CGPDFPage *QLGetCGPDFPageRect(CGPDFPage *result, CGPDFBox a2)
{
  if (result)
  {
    uint64_t v2 = result;
    CGRect BoxRect = CGPDFPageGetBoxRect(result, a2);
    CGFloat x = BoxRect.origin.x;
    CGFloat y = BoxRect.origin.y;
    CGFloat width = BoxRect.size.width;
    CGFloat height = BoxRect.size.height;
    CGRect v9 = CGPDFPageGetBoxRect(v2, kCGPDFMediaBox);
    v8.origin.CGFloat x = x;
    v8.origin.CGFloat y = y;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    CGRectIntersection(v8, v9);
    return (CGPDFPage *)CGPDFPageGetRotationAngle(v2);
  }
  return result;
}

double QLGetCGPDFPageProxyRect(void *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  double v6 = v5;
  if (v5)
  {
    [v5 rectForBox:a2];
    double v8 = v7;
    [v6 rotation];
    if (a3) {
      double v8 = *MEMORY[0x263F00148];
    }
  }
  else
  {
    double v8 = *MEMORY[0x263F001A8];
  }

  return v8;
}

CGFloat QLDrawPDFPage(CGContext *a1, void *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat v13 = (CGPDFPage *)[a2 pageRef];
  return QLDrawCGPDFPage(a1, v13, a3, a4, a5, a6, a7);
}

CGFloat QLDrawCGPDFPage(CGContext *a1, CGPDFPage *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  QLContextSetGrayFillColor(a1, 1.0, 1.0);
  v19.origin.CGFloat x = a4;
  v19.origin.CGFloat y = a5;
  v19.size.CGFloat width = a6;
  v19.size.CGFloat height = a7;
  CGContextFillRect(a1, v19);
  QLGetCGPDFDrawRect(a2, a3, a4, a5, a6, a7);
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (CGRectIsEmpty(v20)) {
    return *MEMORY[0x263F001A8];
  }
  QLDrawCGPDFPageInRect(a1, (CGAffineTransform *)a2, a3, x, y, width, height);
  return x;
}

CGPDFPage *QLGetPDFPageRect(void *a1, CGPDFBox a2)
{
  CFBooleanRef v3 = (CGPDFPage *)[a1 pageRef];
  return QLGetCGPDFPageRect(v3, a2);
}

void QLGetCGPDFDrawRect(CGPDFPage *a1, CGPDFBox a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  QLGetCGPDFPageRect(a1, a2);
  if (v10 > 0.0) {
    QLAdaptSizeToRectWithRounding2(1, (uint64_t)CGFloor, (uint64_t)CGCeiling, a3, a4, a5, a6, v10, v11);
  }
}

double QLGetThumbnailSizeSatisfyingParameters(int a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v7 = a3;
  double v8 = a2;
  double v9 = a6 * a7;
  if (a2 <= a6 * a7 || a3 <= v9)
  {
    if (a2 >= a3) {
      a2 = a3;
    }
    double v11 = floor(v9 / a2);
    double v8 = ceil(v8 * v11);
    double v7 = ceil(a3 * v11);
  }
  else
  {
    double v12 = a5 * a7;
    if (a2 >= a4 * a7 || v7 >= v12)
    {
      double v14 = QLAdaptSizeInSizeWithRounding(0, 0, a4 * a7, v12, a2, v7);
      if (v14 < v9 || v15 < v9) {
        return floor(QLAdaptSizeOutSizeWithRounding(1, 0, v9, v9, v14, v15));
      }
      else {
        return ceil(v14);
      }
    }
  }
  if (a1) {
    return QLFillOrExceedAtLeastOneDimensionOfSizeInSize(1, a4, a5, v8, v7);
  }
  return v8;
}

CGFloat QLGetPDFDrawingTransformWithThumbnailSize@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D4>, double a5@<D5>, CGFloat a6, CGFloat a7, double a8, double a9)
{
  if (a5 <= a9) {
    double v10 = 0.0;
  }
  else {
    double v10 = a5 - a9;
  }
  if (a4 <= a8) {
    double v11 = 0.0;
  }
  else {
    double v11 = (a4 - a8) * 0.5;
  }
  double v12 = a4 / a2;
  double v13 = a5 / a3;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  if (v12 >= v13) {
    CGFloat v14 = v12;
  }
  else {
    CGFloat v14 = v13;
  }
  *(_OWORD *)a1 = 0uLL;
  v22.origin.CGFloat x = a6;
  v22.origin.CGFloat y = a7;
  v22.size.CGFloat width = a8;
  v22.size.CGFloat height = a9;
  CGFloat v15 = CGRectGetMinX(v22) - v11;
  v23.origin.CGFloat x = a6;
  v23.origin.CGFloat y = a7;
  v23.size.CGFloat width = a8;
  v23.size.CGFloat height = a9;
  CGFloat MinY = CGRectGetMinY(v23);
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, v15, MinY - v10);
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, v14, v14);
  long long v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  CGFloat result = v21.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  return result;
}

BOOL QLGetDrawRectAndTransformWithMinimumDimension(uint64_t a1, _OWORD *a2, double a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11)
{
  if (a5 <= 0.0)
  {
    if (a1)
    {
      long long v37 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
      *(_OWORD *)a1 = *MEMORY[0x263F001A8];
      *(_OWORD *)(a1 + 16) = v37;
    }
    if (a2)
    {
      uint64_t v38 = MEMORY[0x263F000D0];
      long long v39 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *a2 = *MEMORY[0x263F000D0];
      a2[1] = v39;
      long long v36 = *(_OWORD *)(v38 + 32);
      goto LABEL_16;
    }
  }
  else
  {
    double v25 = QLGetThumbnailSizeSatisfyingParameters(1, a5, a6, a9, a10, a11, 1.0);
    double v27 = v25;
    double v28 = v26;
    if (v25 >= a9) {
      double v29 = a9;
    }
    else {
      double v29 = v25;
    }
    if (v26 >= a10) {
      double v30 = a10;
    }
    else {
      double v30 = v26;
    }
    double v31 = QLAdaptSizeToRectWithRounding2(1, (uint64_t)CGFloor, (uint64_t)CGCeiling, a7, a8, a9, a10, v29, v30);
    if (a1)
    {
      *(double *)a1 = v31;
      *(CGFloat *)(a1 + 8) = v32;
      *(double *)(a1 + 16) = v33;
      *(double *)(a1 + 24) = v34;
    }
    if (a2)
    {
      QLGetPDFDrawingTransformWithThumbnailSize((uint64_t)v41, a5, a6, v27, v28, v31, v32, v33, v34);
      long long v35 = v41[1];
      *a2 = v41[0];
      a2[1] = v35;
      long long v36 = v41[2];
LABEL_16:
      a2[2] = v36;
    }
  }
  return a5 > 0.0;
}

BOOL QLGetPDFDrawRectAndTransformWithMinimumDimension(CGPDFPage *a1, CGPDFBox a2, uint64_t a3, _OWORD *a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9)
{
  QLGetCGPDFPageRect(a1, a2);
  return QLGetDrawRectAndTransformWithMinimumDimension(a3, a4, v16, v17, v18, v19, a5, a6, a7, a8, a9);
}

double QLGetDrawRectFromPageRectWithMinimumDimension(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9)
{
  long long v17 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  v19[0] = *MEMORY[0x263F001A8];
  v19[1] = v17;
  QLGetDrawRectAndTransformWithMinimumDimension((uint64_t)v19, 0, a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return *(double *)v19;
}

double QLGetPDFDrawRectWithMinimumDimension(CGPDFPage *a1, CGPDFBox a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  long long v12 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  v18[0] = *MEMORY[0x263F001A8];
  v18[1] = v12;
  QLGetCGPDFPageRect(a1, a2);
  QLGetDrawRectAndTransformWithMinimumDimension((uint64_t)v18, 0, v13, v14, v15, v16, a3, a4, a5, a6, a7);
  return *(double *)v18;
}

double QLGetPDFDrawRect(CGPDFPage *a1, CGPDFBox a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  return QLGetPDFDrawRectWithMinimumDimension(a1, a2, a3, a4, a5, a6, 0.0);
}

void QLGetDrawingTransformForCGPDFPage(CGPDFPage *a1@<X0>, CGPDFBox a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = MEMORY[0x263F000D0];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v7;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v6 + 32);
  CGRect BoxRect = CGPDFPageGetBoxRect(a1, a2);
  CGFloat x = BoxRect.origin.x;
  CGFloat y = BoxRect.origin.y;
  CGFloat width = BoxRect.size.width;
  CGFloat height = BoxRect.size.height;
  uint64_t RotationAngle = CGPDFPageGetRotationAngle(a1);
  if (a2)
  {
    CGRect v30 = CGPDFPageGetBoxRect(a1, kCGPDFMediaBox);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectIntersection(v20, v30);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  if (RotationAngle > 89)
  {
    if (RotationAngle == 270)
    {
LABEL_12:
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.CGFloat width = width;
      v24.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v24);
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      CGFloat MinX = CGRectGetMinX(v25);
      long long v15 = xmmword_217F4A380;
      long long v16 = xmmword_217F4A390;
      double MaxX = -MinX;
      goto LABEL_13;
    }
    if (RotationAngle == 180)
    {
LABEL_14:
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      double MaxY = CGRectGetMaxX(v26);
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      double MaxX = CGRectGetMaxY(v27);
      unint64_t v18 = 0xBFF0000000000000;
LABEL_16:
      *(void *)a3 = v18;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = v18;
      goto LABEL_17;
    }
    if (RotationAngle != 90)
    {
LABEL_15:
      v28.origin.CGFloat x = x;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      double MaxY = -CGRectGetMinX(v28);
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      double MaxX = -CGRectGetMinY(v29);
      unint64_t v18 = 0x3FF0000000000000;
      goto LABEL_16;
    }
  }
  else if (RotationAngle != -270)
  {
    if (RotationAngle != -180)
    {
      if (RotationAngle != -90) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MaxY = -CGRectGetMinY(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v23);
  long long v15 = xmmword_217F4A3A0;
  long long v16 = xmmword_217F4A3B0;
LABEL_13:
  *(_OWORD *)a3 = v15;
  *(_OWORD *)(a3 + 16) = v16;
LABEL_17:
  *(double *)(a3 + 32) = MaxY;
  *(double *)(a3 + 40) = MaxX;
}

CGAffineTransform *QLGetCGPDFDrawingTransform@<X0>(CGAffineTransform *result@<X0>, CGPDFBox a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  if (result)
  {
    long long v12 = (CGPDFPage *)result;
    QLGetCGPDFPageRect((CGPDFPage *)result, a2);
    CGFloat x = v51.origin.x;
    CGFloat y = v51.origin.y;
    CGFloat width = v51.size.width;
    CGFloat height = v51.size.height;
    double v17 = CGRectGetWidth(v51);
    CGFloat v45 = y;
    CGFloat v46 = x;
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    CGFloat v44 = width;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    double v18 = CGRectGetHeight(v52);
    double v19 = 0.0;
    if (v17 == 0.0)
    {
      CGFloat v21 = a7;
    }
    else
    {
      double v20 = v18;
      CGFloat v21 = a7;
      if (v18 != 0.0)
      {
        v53.origin.CGFloat x = a4;
        v53.origin.CGFloat y = a5;
        v53.size.CGFloat width = a6;
        v53.size.CGFloat height = a7;
        double v22 = CGRectGetWidth(v53) / v17;
        v54.origin.CGFloat x = a4;
        v54.origin.CGFloat y = a5;
        v54.size.CGFloat width = a6;
        v54.size.CGFloat height = a7;
        double v23 = CGRectGetHeight(v54) / v20;
        if (v22 >= v23) {
          double v19 = ceil(v17 * v23) / v17;
        }
        else {
          double v19 = ceil(v20 * v22) / v20;
        }
      }
    }
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    v55.origin.CGFloat x = a4;
    v55.origin.CGFloat y = a5;
    v55.size.CGFloat width = a6;
    v55.size.CGFloat height = v21;
    CGFloat MinX = CGRectGetMinX(v55);
    v56.origin.CGFloat x = a4;
    v56.origin.CGFloat y = a5;
    v56.size.CGFloat width = a6;
    v56.size.CGFloat height = v21;
    CGFloat MinY = CGRectGetMinY(v56);
    CGAffineTransformMakeTranslation((CGAffineTransform *)a3, MinX, MinY);
    long long v29 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v49.a = *(_OWORD *)a3;
    *(_OWORD *)&v49.c = v29;
    *(_OWORD *)&v49.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGAffineTransformScale(&v50, &v49, v19, v19);
    long long v30 = *(_OWORD *)&v50.c;
    *(_OWORD *)a3 = *(_OWORD *)&v50.a;
    *(_OWORD *)(a3 + 16) = v30;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v50.tx;
    CGFloat v31 = v46;
    *(CGFloat *)&long long v30 = v45;
    CGFloat v32 = v44;
    CGFloat v33 = height;
    CGFloat v34 = -CGRectGetMinX(*(CGRect *)((char *)&v30 - 8));
    v57.origin.CGFloat x = v46;
    v57.origin.CGFloat y = v45;
    v57.size.CGFloat width = v44;
    v57.size.CGFloat height = height;
    CGFloat v35 = CGRectGetMinY(v57);
    long long v36 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v49.a = *(_OWORD *)a3;
    *(_OWORD *)&v49.c = v36;
    *(_OWORD *)&v49.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGAffineTransformTranslate(&v50, &v49, v34, -v35);
    long long v37 = *(_OWORD *)&v50.c;
    *(_OWORD *)a3 = *(_OWORD *)&v50.a;
    *(_OWORD *)(a3 + 16) = v37;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v50.tx;
    memset(&v50, 0, sizeof(v50));
    CGFloat v38 = v46;
    *(CGFloat *)&long long v37 = v45;
    CGFloat v39 = v44;
    CGFloat v40 = height;
    CGPDFPageGetDrawingTransform(&v50, v12, a2, *(CGRect *)((char *)&v37 - 8), 0, 1);
    CGAffineTransform t1 = v50;
    long long v41 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&t2.a = *(_OWORD *)a3;
    *(_OWORD *)&t2.c = v41;
    *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGFloat result = CGAffineTransformConcat(&v49, &t1, &t2);
    long long v42 = *(_OWORD *)&v49.c;
    *(_OWORD *)a3 = *(_OWORD *)&v49.a;
    *(_OWORD *)(a3 + 16) = v42;
    long long v26 = *(_OWORD *)&v49.tx;
  }
  else
  {
    uint64_t v24 = MEMORY[0x263F000D0];
    long long v25 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)a3 = *MEMORY[0x263F000D0];
    *(_OWORD *)(a3 + 16) = v25;
    long long v26 = *(_OWORD *)(v24 + 32);
  }
  *(_OWORD *)(a3 + 32) = v26;
  return result;
}

CGAffineTransform *QLGetPDFDrawingTransform@<X0>(CGAffineTransform *result@<X0>, CGPDFBox a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  if (result)
  {
    QLGetCGPDFPageRect((CGPDFPage *)[(CGAffineTransform *)result pageRef], a2);
    CGFloat x = v42.origin.x;
    CGFloat y = v42.origin.y;
    CGFloat width = v42.size.width;
    CGFloat height = v42.size.height;
    double v15 = CGRectGetWidth(v42);
    CGFloat v38 = y;
    CGFloat v39 = x;
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    CGFloat v37 = width;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double v16 = CGRectGetHeight(v43);
    double v17 = 0.0;
    if (v15 == 0.0)
    {
      CGFloat v19 = a7;
    }
    else
    {
      double v18 = v16;
      CGFloat v19 = a7;
      if (v16 != 0.0)
      {
        v44.origin.CGFloat x = a4;
        v44.origin.CGFloat y = a5;
        v44.size.CGFloat width = a6;
        v44.size.CGFloat height = a7;
        double v20 = CGRectGetWidth(v44) / v15;
        v45.origin.CGFloat x = a4;
        v45.origin.CGFloat y = a5;
        v45.size.CGFloat width = a6;
        v45.size.CGFloat height = a7;
        double v21 = CGRectGetHeight(v45) / v18;
        if (v20 >= v21) {
          double v17 = ceil(v15 * v21) / v15;
        }
        else {
          double v17 = ceil(v18 * v20) / v18;
        }
      }
    }
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    v46.origin.CGFloat x = a4;
    v46.origin.CGFloat y = a5;
    v46.size.CGFloat width = a6;
    v46.size.CGFloat height = v19;
    CGFloat MinX = CGRectGetMinX(v46);
    v47.origin.CGFloat x = a4;
    v47.origin.CGFloat y = a5;
    v47.size.CGFloat width = a6;
    v47.size.CGFloat height = v19;
    CGFloat MinY = CGRectGetMinY(v47);
    CGAffineTransformMakeTranslation((CGAffineTransform *)a3, MinX, MinY);
    long long v27 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v40.a = *(_OWORD *)a3;
    *(_OWORD *)&v40.c = v27;
    *(_OWORD *)&v40.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGAffineTransformScale(&v41, &v40, v17, v17);
    long long v28 = *(_OWORD *)&v41.c;
    *(_OWORD *)a3 = *(_OWORD *)&v41.a;
    *(_OWORD *)(a3 + 16) = v28;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v41.tx;
    CGFloat v29 = v39;
    *(CGFloat *)&long long v28 = v38;
    CGFloat v30 = v37;
    CGFloat v31 = height;
    CGFloat v32 = -CGRectGetMinX(*(CGRect *)((char *)&v28 - 8));
    v48.origin.CGFloat x = v39;
    v48.origin.CGFloat y = v38;
    v48.size.CGFloat width = v37;
    v48.size.CGFloat height = height;
    CGFloat v33 = CGRectGetMinY(v48);
    long long v34 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v40.a = *(_OWORD *)a3;
    *(_OWORD *)&v40.c = v34;
    *(_OWORD *)&v40.tCGFloat x = *(_OWORD *)(a3 + 32);
    CGFloat result = CGAffineTransformTranslate(&v41, &v40, v32, -v33);
    long long v35 = *(_OWORD *)&v41.c;
    *(_OWORD *)a3 = *(_OWORD *)&v41.a;
    *(_OWORD *)(a3 + 16) = v35;
    long long v24 = *(_OWORD *)&v41.tx;
  }
  else
  {
    uint64_t v22 = MEMORY[0x263F000D0];
    long long v23 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)a3 = *MEMORY[0x263F000D0];
    *(_OWORD *)(a3 + 16) = v23;
    long long v24 = *(_OWORD *)(v22 + 32);
  }
  *(_OWORD *)(a3 + 32) = v24;
  return result;
}

void QLDrawCGPDFPageInRect(CGContext *a1, CGAffineTransform *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGContextSaveGState(a1);
  v16.origin.CGFloat x = a4;
  v16.origin.CGFloat y = a5;
  v16.size.CGFloat width = a6;
  v16.size.CGFloat height = a7;
  CGContextClipToRect(a1, v16);
  memset(&v15, 0, sizeof(v15));
  QLGetCGPDFDrawingTransform(a2, a3, (uint64_t)&v15, a4, a5, a6, a7);
  CGAffineTransform v14 = v15;
  CGContextConcatCTM(a1, &v14);
  CGContextDrawPDFPageWithAnnotations();
  CGContextRestoreGState(a1);
}

void QLDrawPDFPageInRectWithTransform(CGContext *a1, CGPDFPage *a2, CGPDFBox a3, _OWORD *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGContextSaveGState(a1);
  v19.origin.CGFloat x = a5;
  v19.origin.CGFloat y = a6;
  v19.size.CGFloat width = a7;
  v19.size.CGFloat height = a8;
  CGContextClipToRect(a1, v19);
  long long v16 = a4[1];
  *(_OWORD *)&transform.a = *a4;
  *(_OWORD *)&transform.c = v16;
  *(_OWORD *)&transform.tCGFloat x = a4[2];
  CGContextConcatCTM(a1, &transform);
  QLGetDrawingTransformForCGPDFPage(a2, a3, (uint64_t)&v17);
  CGContextConcatCTM(a1, &v17);
  CGContextSetAllowsAntialiasing(a1, 1);
  CGContextSetShouldAntialias(a1, 1);
  CGContextSetTextGreekingThreshold();
  CGContextSetLineWidthThreshold();
  CGContextSetInterpolationQuality(a1, kCGInterpolationHigh);
  CGContextDrawPDFPageWithAnnotations();
  CGContextRestoreGState(a1);
}

void QLDrawPDFPageInRect(CGContext *a1, CGAffineTransform *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  QLGetCGPDFDrawingTransform(a2, a3, (uint64_t)&v15, a4, a5, a6, a7);
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  QLDrawPDFPageInRectWithTransform(a1, (CGPDFPage *)a2, a3, v14, a4, a5, a6, a7);
}

CGFloat QLDrawPDFPageWithMinimumDimension(CGContext *a1, CGPDFPage *a2, CGPDFBox a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8)
{
  QLContextSetGrayFillColor(a1, 1.0, 1.0);
  v29.origin.CGFloat x = a4;
  v29.origin.CGFloat y = a5;
  v29.size.CGFloat width = a6;
  v29.size.CGFloat height = a7;
  CGContextFillRect(a1, v29);
  long long v16 = (CGRect *)MEMORY[0x263F001A8];
  CGSize v17 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v28.origin = (CGPoint)*MEMORY[0x263F001A8];
  v28.size = v17;
  long long v18 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v25 = *MEMORY[0x263F000D0];
  long long v26 = v18;
  long long v27 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  QLGetCGPDFPageRect(a2, a3);
  QLGetDrawRectAndTransformWithMinimumDimension((uint64_t)&v28, &v25, v19, v20, v21, v22, a4, a5, a6, a7, a8);
  if (!CGRectIsEmpty(v28))
  {
    v24[0] = v25;
    v24[1] = v26;
    v24[2] = v27;
    QLDrawPDFPageInRectWithTransform(a1, a2, a3, v24, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    long long v16 = &v28;
  }
  return v16->origin.x;
}

id QLPlistDataForFile(void *a1, uint64_t a2, unsigned char *a3, char a4)
{
  id v7 = a1;
  double v8 = [MEMORY[0x263F1D920] typeWithIdentifier:a2];
  uint64_t v9 = *MEMORY[0x263F1DC40];
  if (![v8 conformsToType:*MEMORY[0x263F1DC40]])
  {
    CGAffineTransform v14 = 0;
    *a3 = 0;
    goto LABEL_21;
  }
  if (a3) {
    *a3 = 1;
  }
  if ((a4 & 1) == 0 && ![v8 isEqual:v9])
  {
    CGAffineTransform v14 = 0;
    goto LABEL_21;
  }
  id v21 = 0;
  uint64_t v10 = *MEMORY[0x263EFF688];
  id v20 = 0;
  char v11 = [v7 getResourceValue:&v21 forKey:v10 error:&v20];
  id v12 = v21;
  id v13 = v20;
  if ((v11 & 1) == 0)
  {
    long long v15 = generationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      QLPlistDataForFile_cold_2();
    }
    CGAffineTransform v14 = 0;
    id v16 = v13;
    goto LABEL_19;
  }
  if ((unint64_t)[v12 unsignedLongLongValue] <= 0x500000)
  {
    id v19 = v13;
    long long v15 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v7 options:0 error:&v19];
    id v16 = v19;

    if (v15)
    {
      CGAffineTransform v14 = QLPlistDataForData(v15, v8, a3, a4);
    }
    else
    {
      CGSize v17 = generationLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        QLPlistDataForFile_cold_1();
      }

      CGAffineTransform v14 = 0;
    }
LABEL_19:

    id v13 = v16;
    goto LABEL_20;
  }
  CGAffineTransform v14 = 0;
LABEL_20:

LABEL_21:
  return v14;
}

id QLPlistDataForData(void *a1, void *a2, unsigned char *a3, char a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = *MEMORY[0x263F1DC40];
  if (![v8 conformsToType:*MEMORY[0x263F1DC40]])
  {
    if (a3)
    {
      uint64_t v10 = 0;
      *a3 = 0;
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  if (a3) {
    *a3 = 1;
  }
  if (a4)
  {
    if (!v7) {
      goto LABEL_12;
    }
  }
  else
  {
    char v11 = [v8 isEqual:v9];
    uint64_t v10 = 0;
    if (!v7 || (v11 & 1) == 0) {
      goto LABEL_20;
    }
  }
  if ((unint64_t)[v7 length] > 0x500000)
  {
LABEL_12:
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  uint64_t v15 = 0;
  id v12 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:&v15 error:0];
  if (v12)
  {
    if (v15 == 200)
    {
      id v13 = [MEMORY[0x263F08AC0] dataWithPropertyList:v12 format:100 options:0 error:0];
    }
    else
    {
      id v13 = v7;
    }
    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v10 = 0;
  }

LABEL_20:
  return v10;
}

void sub_217F38CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id QLSLogHandle()
{
  uint64_t v0 = (void *)_qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    uint64_t v0 = (void *)_qlsLogHandle;
  }
  return v0;
}

uint64_t QLUTIManagerTypeIsInternallyClaimedType(uint64_t a1)
{
  uint64_t v2 = +[QLUTIManager internallyClaimedTypes];
  uint64_t v3 = [v2 containsObject:a1];

  return v3;
}

void sub_217F3ADF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _QLMachDispatchIncomingMessageAndReplyIfNecessary(uint64_t a1, uint64_t (*a2)(uint64_t, vm_address_t), int a3, int a4, _DWORD *a5)
{
  uint64_t v9 = (ipc_space_t *)MEMORY[0x263EF8960];
  uint64_t v10 = *MEMORY[0x263EF8960];
  if (a5) {
    *a5 = 0;
  }
  vm_address_t address = 0;
  int v11 = a3 + 68;
  if ((a4 & 0x20000) == 0) {
    int v11 = a3;
  }
  vm_size_t v12 = -*MEMORY[0x263EF8AF8] & (v11 + *MEMORY[0x263EF8AF8] - 1);
  uint64_t v13 = vm_allocate(v10, &address, v12, 335544321);
  if (!v13)
  {
    int v14 = a2(a1, address);
    if (a5) {
      *a5 = v14;
    }
    uint64_t v15 = (mach_msg_header_t *)address;
    if ((*(_DWORD *)address & 0x80000000) == 0 && *(_DWORD *)(address + 32) == -305) {
      *(_DWORD *)(address + 8) = 0;
    }
    if (v15->msgh_remote_port)
    {
      BOOLean_t v16 = voucher_mach_msg_set(v15);
      if ((*(_DWORD *)address & 0x1F) == 0x12) {
        int v17 = 1;
      }
      else {
        int v17 = 17;
      }
      uint64_t v13 = mach_msg((mach_msg_header_t *)address, v17 | a4 & 0xFFFFFFFC, *(_DWORD *)(address + 4), 0, 0, 0, 0);
      long long v18 = _log_0();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v16)
      {
        if (v19) {
          _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_2(v18);
        }

        voucher_mach_msg_clear((mach_msg_header_t *)address);
      }
      else
      {
        if (v19) {
          _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_1(v18);
        }
      }
      uint64_t v15 = (mach_msg_header_t *)address;
      if ((v13 - 268435459) <= 1)
      {
        mach_port_name_t v20 = *(_DWORD *)(address + 12);
        if (v20 - 1 <= 0xFFFFFFFD && ((*(_DWORD *)address >> 8) & 0x1Fu) - 17 <= 1) {
          mach_port_deallocate(*v9, v20);
        }
        mach_msg_destroy(v15);
        uint64_t v15 = (mach_msg_header_t *)address;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    MEMORY[0x21D45D860](v10, v15, v12);
  }
  return v13;
}

id _log_0()
{
  uint64_t v0 = MEMORY[0x263F16100];
  uint64_t v1 = *(void **)(MEMORY[0x263F16100] + 144);
  if (!v1)
  {
    QLTInitLogging();
    uint64_t v1 = *(void **)(v0 + 144);
  }
  return v1;
}

uint64_t _QLMachGetMachPortCount()
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  uint64_t v0 = (unsigned int *)MEMORY[0x263EF8960];
  mach_error_t v1 = MEMORY[0x21D45D3A0](*MEMORY[0x263EF8960], &v12, (char *)&v10 + 4, &v11, &v10);
  if (v1)
  {
    mach_error_t v2 = v1;
    uint64_t v3 = _log_0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _QLMachGetMachPortCount_cold_3(v2);
    }
LABEL_11:

    return HIDWORD(v10);
  }
  mach_error_t v4 = MEMORY[0x21D45D860](*v0, v12, 4 * HIDWORD(v10));
  if (v4)
  {
    mach_error_t v5 = v4;
    uint64_t v6 = _log_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      _QLMachGetMachPortCount_cold_2(v5);
    }
  }
  mach_error_t v7 = MEMORY[0x21D45D860](*v0, v11, 4 * v10);
  if (v7)
  {
    mach_error_t v8 = v7;
    uint64_t v3 = _log_0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _QLMachGetMachPortCount_cold_1(v8);
    }
    goto LABEL_11;
  }
  return HIDWORD(v10);
}

uint64_t _QLMachRegisterForNoSenders(mach_port_t notify, int *a2)
{
  return _QLMachRequestNoSenderNotification(notify, notify, a2);
}

uint64_t _QLMachRequestNoSenderNotification(mach_port_name_t name, mach_port_t notify, int *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v17 = 0;
  *(_OWORD *)port_info_out = 0u;
  long long v16 = 0u;
  mach_port_t previous = 0;
  mach_msg_type_number_t port_info_outCnt = 10;
  uint64_t v6 = (ipc_space_t *)MEMORY[0x263EF8960];
  uint64_t v7 = mach_port_request_notification(*MEMORY[0x263EF8960], name, 70, 2u, notify, 0x15u, &previous);
  if (v7)
  {
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (previous) {
    mach_port_deallocate(*v6, previous);
  }
  if (a3)
  {
    if (!mach_port_get_attributes(*v6, name, 2, port_info_out, &port_info_outCnt))
    {
      int v8 = v16 + port_info_out[1];
      goto LABEL_9;
    }
LABEL_8:
    int v8 = 0;
LABEL_9:
    *a3 = v8;
  }
LABEL_10:
  uint64_t v9 = _log_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = mach_error_string(v7);
    if (a3) {
      int v12 = *a3;
    }
    else {
      int v12 = -1;
    }
    *(_DWORD *)buf = 67110146;
    mach_port_name_t v19 = name;
    __int16 v20 = 1024;
    mach_port_t v21 = notify;
    __int16 v22 = 2080;
    long long v23 = v11;
    __int16 v24 = 1024;
    mach_port_t v25 = previous;
    __int16 v26 = 1024;
    int v27 = v12;
    _os_log_debug_impl(&dword_217F31000, v9, OS_LOG_TYPE_DEBUG, "No sender notification request on %i for %i (%s) - old port: %i - seqno: %i", buf, 0x24u);
  }

  return v7;
}

uint64_t _QLMachUnregisterForNoSenders(mach_port_name_t a1)
{
  return _QLMachRequestNoSenderNotification(a1, 0, 0);
}

uint64_t _QLMachGetMinimumSequenceNumber(mach_port_name_t name, _DWORD *a2)
{
  uint64_t v8 = 0;
  *(_OWORD *)port_info_out = 0u;
  long long v7 = 0u;
  mach_msg_type_number_t port_info_outCnt = 10;
  uint64_t result = mach_port_get_attributes(*MEMORY[0x263EF8960], name, 2, port_info_out, &port_info_outCnt);
  int v4 = v7 + port_info_out[1];
  if (result) {
    int v4 = 0;
  }
  *a2 = v4;
  return result;
}

id QLScaledImageFromImageURL(const __CFURL *a1, int a2, unsigned char *a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v15 = CGImageSourceCreateWithURL(a1, 0);
  if (v15)
  {
    long long v16 = v15;
    uint64_t v17 = QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType(v15, a5, a6, a7, a8, 0, a2, a3, a4, 1);
    if (v17)
    {
      long long v18 = v17;
      mach_port_name_t v19 = +[QLPlatformImage imageWithCGImage:v17 scale:1 orientation:a8];
      CGImageRelease(v18);
    }
    else
    {
      mach_port_name_t v19 = 0;
    }
    CFRelease(v16);
  }
  else
  {
    mach_port_name_t v19 = 0;
  }
  return v19;
}

CGImageSource *QLScaledPlatformImageFromImageSource(CGImageSource *a1, double a2, double a3)
{
  return QLScaledPlatformImageFromImageSourceWithOptions(a1, 0, a2, a3);
}

CGImageSource *QLScaledPlatformImageFromImageSourceWithOptions(CGImageSource *a1, char a2, double a3, double a4)
{
  int v4 = a1;
  v32[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    double v27 = 0.0;
    double valuePtr = 0.0;
    unsigned int v26 = 1;
    uint64_t v31 = *MEMORY[0x263F0F620];
    uint64_t v8 = MEMORY[0x263EFFA88];
    v32[0] = MEMORY[0x263EFFA88];
    CFDictionaryRef v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v4, 0, v9);
    if (v10)
    {
      CFDictionaryRef v11 = v10;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x263F0F4F8]);
      if (Value) {
        CFNumberGetValue(Value, kCFNumberCGFloatType, &valuePtr);
      }
      CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v11, (const void *)*MEMORY[0x263F0F4F0]);
      if (v13) {
        CFNumberGetValue(v13, kCFNumberCGFloatType, &v27);
      }
      CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v11, (const void *)*MEMORY[0x263F0F4C8]);
      if (v14) {
        CFNumberGetValue(v14, kCFNumberIntType, &v26);
      }
      CFRelease(v11);
      double v15 = v27;
      double v16 = valuePtr;
    }
    else
    {
      double v15 = 0.0;
      double v16 = 0.0;
    }
    BOOL v17 = v16 < a3 && v15 < a3;
    double v18 = v16 * v15;
    if (v17 || v18 < a3 * a3)
    {
      PrimaryImageIndeCGFloat x = CGImageSourceGetPrimaryImageIndex(v4);
      if (a2)
      {
        uint64_t v29 = *MEMORY[0x263F0F608];
        uint64_t v30 = v8;
        CFDictionaryRef v21 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      }
      else
      {
        CFDictionaryRef v21 = 0;
      }
      ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v4, PrimaryImageIndex, v21);
      int v4 = +[QLPlatformImage imageWithCGImage:ImageAtIndex scale:v26 orientation:a4];
      if (ImageAtIndex) {
        CFRelease(ImageAtIndex);
      }
    }
    else
    {
      __int16 v24 = QLThumbnailingImageIOCreateAndDecodeThumbnailWithImageSource(v4, 0, 0, 3, 1, a3 * a4, a3 * a4);
      if (v24)
      {
        mach_port_t v25 = v24;
        int v4 = +[QLPlatformImage imageWithCGImage:v24 scale:1 orientation:a4];
        CGImageRelease(v25);
      }
      else
      {
        int v4 = 0;
      }
    }
  }
  return v4;
}

unint64_t _QLThumbnailComputeBaselineFromData(uint64_t a1, unint64_t a2, unint64_t a3, vImagePixelCount a4, uint64_t a5, __int16 a6, uint64_t a7)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (a4 != 64 && a4 != 32 || a3 != 8 && a3 != 16)
  {
    double v16 = _log_1();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      return 0;
    }
    LODWORD(buf.data) = 134218240;
    *(void **)((char *)&buf.data + 4) = (void *)a3;
    WORD2(buf.height) = 2048;
    *(vImagePixelCount *)((char *)&buf.height + 6) = a4;
    BOOL v17 = "image format not supported for baseline alignment (bpc = %zu, bpp = %zu)";
    double v18 = v16;
    uint32_t v19 = 22;
LABEL_14:
    _os_log_impl(&dword_217F31000, v18, OS_LOG_TYPE_INFO, v17, (uint8_t *)&buf, v19);
    goto LABEL_15;
  }
  unsigned int v14 = a6 & 0x1F;
  if (v14 > 7)
  {
LABEL_22:
    double v16 = _log_1();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    LODWORD(buf.data) = 67109120;
    HIDWORD(buf.data) = v14;
    BOOL v17 = "image format not supported for baseline alignment (alpha info %d)";
    double v18 = v16;
    uint32_t v19 = 8;
    goto LABEL_14;
  }
  if (((1 << v14) & 0xE) == 0)
  {
    if (((1 << v14) & 0x61) != 0) {
      return 0;
    }
    if (v14 == 7)
    {
      if (a2) {
        return a2 - 1;
      }
      else {
        return 0;
      }
    }
    goto LABEL_22;
  }
  if (!a7)
  {
    double v16 = _log_1();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    LOWORD(buf.data) = 0;
    BOOL v17 = "no bitmap data => can't compute baseline alignment";
    goto LABEL_30;
  }
  vImagePixelCount v20 = a4 / a3;
  vImagePixelCount v21 = a1 * (a4 / a3);
  size_t v22 = 4 * v21;
  if ((a6 & 0x100) != 0)
  {
    uint64_t v24 = 4 * v21;
    long long v23 = (char *)malloc_type_malloc(4 * v21, 0xE2BBF20DuLL);
    size_t v22 = v24;
  }
  else
  {
    long long v23 = 0;
  }
  if (a2 < 2)
  {
LABEL_26:
    if (v23) {
      free(v23);
    }
    double v16 = _log_1();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    LOWORD(buf.data) = 0;
    BOOL v17 = "more than the half of the image is transparent => cancel baseline computation";
LABEL_30:
    double v18 = v16;
    uint32_t v19 = 2;
    goto LABEL_14;
  }
  uint64_t v25 = 0;
  unsigned int v26 = (char *)(a7 + (a2 - 1) * a5);
  vImagePixelCount v27 = a4 >> 3;
  vImagePixelCount v28 = v20 - 1;
  int64_t v29 = v20 * a1;
  int64_t v42 = v27 * a1;
  uint64_t v30 = 2 * v27 * a1;
  uint64_t v31 = &v23[4 * v20 * a1];
  uint64_t v32 = -a5;
  if (a2 >> 1 <= 1) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = a2 >> 1;
  }
  size_t v38 = v22;
  uint64_t v39 = v33;
  uint64_t v40 = -a5;
  size_t v41 = v30;
  int64_t v34 = v29;
  while ((a6 & 0x100) == 0)
  {
    if (v42 >= 1)
    {
      long long v35 = v26;
      while (v35[v28] <= 0xB0u)
      {
        v35 += v27;
        if (v35 >= &v26[v42]) {
          goto LABEL_46;
        }
      }
      return (unsigned __int16)v25;
    }
LABEL_46:
    v26 += v32;
    if (++v25 == v33) {
      goto LABEL_26;
    }
  }
  long long v36 = v23;
  bzero(v23, v22);
  buf.data = v26;
  buf.CGFloat height = 1;
  buf.CGFloat width = v34;
  buf.rowBytes = v42;
  dest.data = v36;
  dest.CGFloat height = 1;
  dest.CGFloat width = v34;
  dest.rowBytes = v41;
  vImageConvert_Planar16FtoPlanarF(&buf, &dest, 0);
  uint64_t v33 = v39;
  uint64_t v32 = v40;
  long long v23 = v36;
  if (v34 < 1)
  {
LABEL_45:
    size_t v22 = v38;
    goto LABEL_46;
  }
  CGFloat v37 = (float *)v36;
  while ((float)(v37[v28] * 255.0) < 177.0)
  {
    v37 += v20;
    if (v37 >= (float *)v31) {
      goto LABEL_45;
    }
  }
  free(v36);
  return (unsigned __int16)v25;
}

BOOL QLSThumbnailSizeIsSufficientForLowQuality(double a1, double a2, double a3)
{
  BOOL v3 = a3 <= 32.0;
  double v4 = a2 * 0.5;
  if (a1 / a3 > 0.5) {
    BOOL v3 = 1;
  }
  return v4 < a1 && v3;
}

id _log_1()
{
  uint64_t v0 = MEMORY[0x263F16100];
  mach_error_t v1 = *(void **)(MEMORY[0x263F16100] + 120);
  if (!v1)
  {
    QLTInitLogging();
    mach_error_t v1 = *(void **)(v0 + 120);
  }
  return v1;
}

double QLThumbnailingImageIOGetSizeFromImageProperties(const __CFDictionary *a1)
{
  double v1 = *MEMORY[0x263F001B0];
  if (a1)
  {
    double v15 = 0.0;
    double valuePtr = 0.0;
    BOOL v3 = (const void *)*MEMORY[0x263F0F4F8];
    CFTypeID TypeID = CFNumberGetTypeID();
    CFNumberRef v5 = (const __CFNumber *)_QLDictionaryValueForKey(a1, v3, TypeID, 0);
    if (v5) {
      CFNumberGetValue(v5, kCFNumberCGFloatType, &valuePtr);
    }
    uint64_t v6 = (const void *)*MEMORY[0x263F0F4F0];
    CFTypeID v7 = CFNumberGetTypeID();
    CFNumberRef v8 = (const __CFNumber *)_QLDictionaryValueForKey(a1, v6, v7, 0);
    if (v8)
    {
      CFNumberGetValue(v8, kCFNumberCGFloatType, &v15);
      double v9 = valuePtr;
      if (valuePtr != 0.0)
      {
        double v10 = v15;
        if (v15 != 0.0)
        {
          int v11 = _QLDictionaryIntValueForKey(a1, (const void *)*MEMORY[0x263F0F4C8], 0xFFFFFFFFLL);
          if (v11 == -1)
          {
            int v12 = (const void *)*MEMORY[0x263F0F518];
            CFTypeID v13 = CFDictionaryGetTypeID();
            if (!_QLDictionaryValueForKey(a1, v12, v13, 0)) {
              return v9;
            }
            int v11 = _QLDictionaryIntValueForKey(a1, (const void *)*MEMORY[0x263F0F540], 0xFFFFFFFFLL);
          }
          if ((v11 - 5) >= 4) {
            return v9;
          }
          else {
            return v10;
          }
        }
      }
    }
  }
  return v1;
}

double QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(CGImageSource *a1, size_t a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F0F620];
  v10[0] = MEMORY[0x263EFFA88];
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(a1, a2, v4);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    double v7 = QLThumbnailingImageIOGetSizeFromImageProperties(v5);
    CFRelease(v6);
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
  }

  return v7;
}

CGImageSource *QLThumbnailingImageIOCreateThumbnailFromData(const __CFData *a1, unsigned char *a2, double a3, double a4)
{
  uint64_t result = CGImageSourceCreateWithData(a1, 0);
  if (result)
  {
    CFNumberRef v8 = result;
    uint64_t v9 = _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(result, 0, a2, 0, 0, 0, a3, a4);
    CFRelease(v8);
    return v9;
  }
  return result;
}

CGImage *_QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(CGImageSource *a1, int a2, unsigned char *a3, uint64_t a4, uint64_t a5, int a6, double a7, double a8)
{
  if (a1)
  {
    CFTypeID v13 = [NSNumber numberWithBool:1];
    if (a7 >= a8) {
      double v14 = a7;
    }
    else {
      double v14 = a8;
    }
    long long v35 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v34 = *MEMORY[0x263F0F5B8];
    double v15 = [NSNumber numberWithDouble:v14];
    uint64_t v16 = *MEMORY[0x263F0F638];
    BOOL v17 = [NSNumber numberWithInt:a5];
    uint64_t v18 = *MEMORY[0x263F0F630];
    uint64_t v19 = *MEMORY[0x263F0F5B0];
    uint64_t v20 = *MEMORY[0x263F0F620];
    vImagePixelCount v21 = [NSNumber numberWithUnsignedChar:a4];
    objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v13, v34, v15, v16, v17, v18, MEMORY[0x263EFFA80], v19, v13, v20, v21, *MEMORY[0x263F0F608], v13, *MEMORY[0x263F0F650], v13, *MEMORY[0x263F0F618], 0);
    CFDictionaryRef v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    PrimaryImageIndeCGFloat x = CGImageSourceGetPrimaryImageIndex(a1);
    ThumbnailAtIndeCGFloat x = CGImageSourceCreateThumbnailAtIndex(a1, PrimaryImageIndex, v22);
    if (ThumbnailAtIndex)
    {
      uint64_t v25 = ThumbnailAtIndex;
      double Width = (double)CGImageGetWidth(ThumbnailAtIndex);
      BOOL v27 = a8 > (double)CGImageGetHeight(v25) && a7 > Width;
      if (a6) {
        char v28 = 0;
      }
      else {
        char v28 = QLThumbnailingImageIOCanEfficientlyThumbnailImageSource(a1) ^ 1;
      }
      if (a2) {
        BOOL v29 = 0;
      }
      else {
        BOOL v29 = v27;
      }
      if (!v29 || (v28 & 1) != 0)
      {
        if (a3 && a7 > (double)CGImageGetWidth(v25) && a8 > (double)CGImageGetHeight(v25)) {
          *a3 = 1;
        }
        goto LABEL_20;
      }
      CGImageRelease(v25);
    }
    [(__CFDictionary *)v22 setObject:v13 forKeyedSubscript:*MEMORY[0x263F0F5A8]];
    uint64_t v25 = CGImageSourceCreateThumbnailAtIndex(a1, PrimaryImageIndex, v22);
LABEL_20:

    return v25;
  }
  return 0;
}

unint64_t QLThumbnailingImageIOExpectedMemoryUsageForImageSourceThumbnail(CGImageSource *a1, double a2, double a3, double a4)
{
  v29[1] = *MEMORY[0x263EF8340];
  CFStringRef Type = CGImageSourceGetType(a1);
  if (!Type) {
    return 0;
  }
  CFStringRef v9 = Type;
  uint64_t v28 = *MEMORY[0x263F0F620];
  v29[0] = MEMORY[0x263EFFA88];
  CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
  CFDictionaryRef v11 = CGImageSourceCopyPropertiesAtIndex(a1, 0, v10);
  double v12 = QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(a1, 0);
  double v14 = v13;
  double v15 = [(__CFDictionary *)v11 objectForKeyedSubscript:*MEMORY[0x263F0F1A8]];
  uint64_t v16 = [MEMORY[0x263F1D920] typeWithIdentifier:v9];
  int v17 = [v15 intValue];
  if (v17 >= 0) {
    int v18 = v17;
  }
  else {
    int v18 = v17 + 1;
  }
  double v19 = (double)(v18 >> 1);
  unint64_t v20 = (unint64_t)(v12 * v14 * v19);
  double v21 = a2 * a4;
  double v22 = a3 * a4;
  unint64_t v23 = (unint64_t)(v22 * (v21 * v19));
  if (([v16 conformsToType:*MEMORY[0x263F1DB40]] & 1) != 0
    || [v16 conformsToType:*MEMORY[0x263F1DC60]])
  {
    if (v12 * 0.125 < v21 || v14 * 0.125 < v22)
    {
      if (v12 * 0.25 < v21 || v14 * 0.25 < v22)
      {
        if (v14 * 0.5 < v22 || v12 * 0.5 < v21) {
          int v25 = 1;
        }
        else {
          int v25 = 2;
        }
      }
      else
      {
        int v25 = 4;
      }
    }
    else
    {
      int v25 = 8;
    }
    unint64_t v20 = 2 * (v20 / (v25 * v25) + v23);
  }
  else if ([v16 conformsToType:*MEMORY[0x263F1DAE8]])
  {
    unint64_t v20 = 4 * v23;
  }
  else if ([v16 conformsToType:*MEMORY[0x263F1DC08]])
  {
    v20 *= 3;
  }

  return v20;
}

uint64_t QLThumbnailingImageIOCanEfficientlyThumbnailImageSource(CGImageSource *a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  mach_error_t v2 = [MEMORY[0x263F1D920] typeWithIdentifier:CGImageSourceGetType(a1)];
  uint64_t v14 = *MEMORY[0x263F0F620];
  v15[0] = MEMORY[0x263EFFA88];
  uint64_t v3 = 1;
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(a1, 0, v4);
  double v6 = QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(a1, 0);
  double v8 = v7;
  CFStringRef v9 = [(__CFDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F0F1A8]];
  if ((uint64_t)(v6 * v8 * (double)[v9 integerValue] * 0.125) >= 16777217)
  {
    if (([v2 conformsToType:*MEMORY[0x263F1DB40]] & 1) == 0)
    {
      CFDictionaryRef v10 = [MEMORY[0x263F1D920] typeWithIdentifier:*MEMORY[0x263F01A88]];
      uint64_t v3 = [v2 conformsToType:v10];
      if ((v3 & 1) == 0)
      {
        char v11 = [v2 conformsToType:*MEMORY[0x263F1DAE8]];

        if (v11) {
          goto LABEL_5;
        }
        CFDictionaryRef v10 = _log_1();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v13 = 0;
          _os_log_impl(&dword_217F31000, v10, OS_LOG_TYPE_DEFAULT, "Image is too large, not returning any thumbnail", v13, 2u);
        }
      }

      goto LABEL_9;
    }
LABEL_5:
    uint64_t v3 = 1;
  }
LABEL_9:

  return v3;
}

CGImage *QLThumbnailingImageIOCreateAndDecodeThumbnailWithImageSource(CGImageSource *a1, int a2, unsigned char *a3, uint64_t a4, int a5, double a6, double a7)
{
  return _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(a1, a2, a3, 1, a4, a5, a6, a7);
}

double QLImageIOCropSizeForSize(double result, double a2, double a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

double QLImageIOCropRectForSize(double a1, double a2, double a3)
{
  BOOL v3 = a1 < a3;
  double result = rint((a1 - a3) * 0.5);
  if (v3) {
    return 0.0;
  }
  return result;
}

CGImageRef QLImageIOCreateScaledImageOfMaximumAndMinimumSize(CGImage *a1, CGInterpolationQuality a2, double a3, double a4, double a5)
{
  CFStringRef v9 = a1;
  double Width = (double)CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(v9);
  QLDetermineSizeRespectingAspectRatioAndMinimumDimension(Width, (double)Height, a5, a3, a4);
  double v13 = v12;
  double v15 = v14;
  ColorSpace = CGImageGetColorSpace(v9);
  CGColorSpaceIsWideGamutRGB(ColorSpace);
  int v17 = (CGContext *)QLTCreateCGContext();
  if (v17)
  {
    int v18 = v17;
    double v19 = rint((v13 - a3) * 0.5);
    if (v13 >= a3) {
      double v20 = v19;
    }
    else {
      double v20 = 0.0;
    }
    double v21 = rint((v15 - a4) * 0.5);
    if (v15 >= a4) {
      double v22 = v21;
    }
    else {
      double v22 = 0.0;
    }
    CGContextSetInterpolationQuality(v17, a2);
    v26.origin.CGFloat x = -v20;
    v26.origin.CGFloat y = -v22;
    v26.size.CGFloat width = v13;
    v26.size.CGFloat height = v15;
    CGContextDrawImage(v18, v26, v9);
    CGImageRef Image = CGBitmapContextCreateImage(v18);
    CFStringRef v9 = v18;
LABEL_12:
    CFRelease(v9);
    return Image;
  }
  uint64_t v24 = _log_1();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
    QLImageIOCreateScaledImageOfMaximumAndMinimumSize_cold_1(v24);
  }

  CGImageRef Image = 0;
  CGImageRef result = 0;
  if (v9) {
    goto LABEL_12;
  }
  return result;
}

void QLDetermineSizeRespectingAspectRatioAndMinimumDimension(double a1, double a2, double a3, double a4, double a5)
{
  double v8 = QLAdaptSizeInSize(0, 0, a4, a5, a1, a2);
  double v10 = ceil(v9);
  double v11 = ceil(v8);
  if (v11 >= v10) {
    double v12 = v10;
  }
  else {
    double v12 = v11;
  }
  if (v12 < a3) {
    QLAdaptSizeOutSize(1, 1, a3, a3, a1, a2);
  }
}

CGImageRef QLImageIOCreateCroppedImageRef(CGImage *a1, double a2, double a3)
{
  if (!a1) {
    QLImageIOCreateCroppedImageRef_cold_1();
  }
  double Width = (double)CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  double v8 = (double)Height;
  if (a2 <= Width) {
    double v9 = a2;
  }
  else {
    double v9 = Width;
  }
  double v10 = rint((Width - a2) * 0.5);
  if (a2 > Width) {
    double v10 = 0.0;
  }
  BOOL v11 = a3 <= v8;
  if (a3 <= v8) {
    double v12 = a3;
  }
  else {
    double v12 = (double)Height;
  }
  double v13 = rint((v8 - a3) * 0.5);
  if (!v11) {
    double v13 = 0.0;
  }
  return CGImageCreateWithImageInRect(a1, *(CGRect *)(&v9 - 2));
}

CGImageRef QLThumbnailImageIOCreateICNSThumbnailWithImageSource(CGImageSource *a1, double a2, double a3)
{
  v25[1] = *MEMORY[0x263EF8340];
  size_t Count = CGImageSourceGetCount(a1);
  if (!Count) {
    return 0;
  }
  size_t v7 = Count;
  size_t v8 = 0;
  size_t v9 = 0;
  CFTypeRef v10 = 0;
  uint64_t v11 = *MEMORY[0x263F0F620];
  double v12 = 1.79769313e308;
  uint64_t v13 = MEMORY[0x263EFFA88];
  do
  {
    uint64_t v24 = v11;
    v25[0] = v13;
    CFDictionaryRef v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(a1, v9, v14);
    if (v15)
    {
      CFDictionaryRef v16 = v15;
      double v17 = QLThumbnailingImageIOGetSizeFromImageProperties(v15);
      if (v17 >= a2 && v18 >= a3 && v17 < v12 && v18 < v12)
      {
        if (v17 >= v18) {
          double v12 = v18;
        }
        else {
          double v12 = v17;
        }
        if (v10) {
          CFRelease(v10);
        }
        CFTypeRef v10 = CFRetain(v16);
        size_t v8 = v9;
      }
      CFRelease(v16);
    }

    ++v9;
  }
  while (v7 != v9);
  if (!v10) {
    return 0;
  }
  ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(a1, v8, 0);
  CFRelease(v10);
  return ImageAtIndex;
}

CGImageRef QLThumbnailingImageIOCreateCroppedAndScaledThumbnailToSatisfyConstraints(CGImage *a1, CGInterpolationQuality a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = a1;
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(v13);
  QLDetermineSizeRespectingAspectRatioAndMinimumDimension(a3, a4, a5, a6, a7);
  if (v16 >= a6) {
    double v16 = a6;
  }
  if (v17 >= a7) {
    double v17 = a7;
  }
  BOOL v18 = a3 >= a6;
  if (a4 >= a7) {
    BOOL v18 = 1;
  }
  if (v16 == Width && v17 == Height) {
    goto LABEL_22;
  }
  if (a3 < a5 || a4 < a5)
  {
    return QLImageIOCreateScaledImageOfMaximumAndMinimumSize(v13, a2, a6, a7, a5);
  }
  else
  {
    if (!v18) {
      return 0;
    }
    if (v16 >= Width && v17 >= Height)
    {
LABEL_22:
      CFRetain(v13);
      return v13;
    }
    return QLImageIOCreateCroppedImageRef(v13, v16, v17);
  }
}

CGImage *QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType(CGImageSource *a1, double a2, double a3, double a4, double a5, uint64_t a6, int a7, unsigned char *a8, uint64_t a9, int a10)
{
  if (a4 >= 1.0) {
    double v18 = a4;
  }
  else {
    double v18 = 1.0;
  }
  double v19 = QLThumbnailingImageIOGetSizeFromImageSourceAtIndex(a1, 0);
  double v21 = v19;
  double v22 = v20;
  if (v19 < 1.0 || v20 < 1.0)
  {
    uint64_t v24 = _log_1();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_1(v24, v21, v22);
    }
  }
  else
  {
    double v25 = v18 * a5;
    double v26 = a3 * a5;
    double v27 = a2 * a5;
    QLDetermineSizeRespectingAspectRatioAndMinimumDimension(v19, v20, v25, v27, v26);
    if (a7)
    {
      CGImageRef result = _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(a1, a7, a8, 1, a9, a10, v27, v26);
      if (result) {
        return result;
      }
    }
    else
    {
      BOOL v31 = v21 < v27;
      if (v22 >= v26) {
        BOOL v31 = 0;
      }
      BOOL v32 = v21 < v25;
      if (v22 < v25) {
        BOOL v32 = 1;
      }
      if (v32 || v31)
      {
        double v28 = v21;
        double v29 = v22;
      }
      uint64_t v33 = _QLThumbnailingImageIOCreateSimpleThumbnailWithImageSource(a1, 0, a8, 1, a9, a10, v28, v29);
      if (v33)
      {
        uint64_t v34 = v33;
        CGImageRef v35 = QLThumbnailingImageIOCreateCroppedAndScaledThumbnailToSatisfyConstraints(v33, (CGInterpolationQuality)a9, v21, v22, v25, v27, v26);
        CGImageRelease(v34);
        return v35;
      }
    }
    uint64_t v24 = _log_1();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_2(v24);
    }
  }

  return 0;
}

CGImage *QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource(CGImageSource *a1, unsigned char *a2, uint64_t a3, int a4, double a5, double a6, double a7, double a8)
{
  return QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType(a1, a5, a6, a7, a8, (uint64_t)a2, 0, a2, a3, a4);
}

CGImageSourceRef QLThumbnailingImageIOCreateImageSourceFromData(const __CFData *a1, uint64_t a2)
{
  v14[2] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *MEMORY[0x263F0F610];
    v14[0] = *MEMORY[0x263F0F640];
    v14[1] = v3;
    uint64_t v4 = *MEMORY[0x263EFFB38];
    v13[0] = a2;
    v13[1] = v4;
    CFDictionaryRef v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    double v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    size_t v7 = (const void **)v14;
    size_t v8 = (const void **)v13;
    CFIndex v9 = 2;
  }
  else
  {
    size_t v7 = (const void **)MEMORY[0x263F0F610];
    size_t v8 = (const void **)MEMORY[0x263EFFB38];
    CFDictionaryRef v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
    double v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
    CFIndex v9 = 1;
  }
  CFDictionaryRef v10 = CFDictionaryCreate(0, v7, v8, v9, v5, v6);
  CGImageSourceRef v11 = CGImageSourceCreateWithData(a1, v10);
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

uint64_t QLStackTrace()
{
  return 0;
}

void QLSInitLogging()
{
  if (QLSInitLogging_once != -1) {
    dispatch_once(&QLSInitLogging_once, &__block_literal_global_2);
  }
}

uint64_t __QLSInitLogging_block_invoke()
{
  _qlsLogHandle = (uint64_t)os_log_create("com.apple.quicklook", "default");
  return MEMORY[0x270F9A758]();
}

void sub_217F3F1F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217F3F5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t QLCreateReservedBitmapContextWithSize(CGColorSpace *a1)
{
  if (a1)
  {
    DeviceRGB = a1;
    CFRetain(a1);
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  _QLComputeValuesForCGContextCreationWithSizeAndScale();
  CGColorSpaceRelease(DeviceRGB);
  return 0;
}

CGImageRef QLCreateImageWithBitmapContext(CGContext *a1)
{
  ColorSpace = CGBitmapContextGetColorSpace(a1);
  Data = CGBitmapContextGetData(a1);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(a1);
  size_t Height = CGBitmapContextGetHeight(a1);
  double v6 = CGDataProviderCreateWithData(0, Data, Height * BytesPerRow, 0);
  size_t Width = CGBitmapContextGetWidth(a1);
  size_t v8 = CGBitmapContextGetHeight(a1);
  size_t BitsPerComponent = CGBitmapContextGetBitsPerComponent(a1);
  size_t BitsPerPixel = CGBitmapContextGetBitsPerPixel(a1);
  size_t v11 = CGBitmapContextGetBytesPerRow(a1);
  CGBitmapInfo BitmapInfo = CGBitmapContextGetBitmapInfo(a1);
  CGImageRef v13 = CGImageCreate(Width, v8, BitsPerComponent, BitsPerPixel, v11, ColorSpace, BitmapInfo, v6, 0, 0, kCGRenderingIntentDefault);
  CFRelease(v6);
  return v13;
}

CGImageRef QLCreateImageWithMallocedBitmapContextTransferData(CGContext *a1)
{
  ColorSpace = CGBitmapContextGetColorSpace(a1);
  Data = CGBitmapContextGetData(a1);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(a1);
  size_t Height = CGBitmapContextGetHeight(a1);
  double v6 = CGDataProviderCreateWithData(0, Data, Height * BytesPerRow, (CGDataProviderReleaseDataCallback)_DataFree);
  size_t Width = CGBitmapContextGetWidth(a1);
  size_t v8 = CGBitmapContextGetHeight(a1);
  size_t BitsPerComponent = CGBitmapContextGetBitsPerComponent(a1);
  size_t BitsPerPixel = CGBitmapContextGetBitsPerPixel(a1);
  size_t v11 = CGBitmapContextGetBytesPerRow(a1);
  CGBitmapInfo BitmapInfo = CGBitmapContextGetBitmapInfo(a1);
  CGImageRef v13 = CGImageCreate(Width, v8, BitsPerComponent, BitsPerPixel, v11, ColorSpace, BitmapInfo, v6, 0, 0, kCGRenderingIntentDefault);
  CFRelease(v6);
  return v13;
}

void _DataFree(int a1, void *a2)
{
}

CGImageRef QLCreateImageWithBlock(void *a1)
{
  double v1 = a1;
  uint64_t v2 = QLCreateReservedBitmapContextWithSize(0);
  if (v2)
  {
    uint64_t v3 = (CGContext *)v2;
    v1[2](v1, v2);
    CGImageRef v4 = QLCreateImageWithMallocedBitmapContextTransferData(v3);
    CFRelease(v3);
  }
  else
  {
    CGImageRef v4 = 0;
  }

  return v4;
}

uint64_t QLCreateMallocedBitmapContextWithSizeAndColorSpace(CGColorSpace *a1)
{
  return QLCreateReservedBitmapContextWithSize(a1);
}

CGContext *_QLDestroyReservedBitmapContext(CGContext *result, uint64_t (*a2)(CGContext *, size_t))
{
  if (result)
  {
    if (a2)
    {
      uint64_t v2 = result;
      CGImageRef result = (CGContext *)CGBitmapContextGetData(result);
      if (result)
      {
        uint64_t v3 = result;
        size_t Height = CGBitmapContextGetHeight(v2);
        size_t v5 = CGBitmapContextGetBytesPerRow(v2) * Height;
        return (CGContext *)a2(v3, v5);
      }
    }
  }
  return result;
}

uint64_t QLCreateMallocedBitmapContextWithSize()
{
  return QLCreateReservedBitmapContextWithSize(0);
}

void *_MallocReserve(size_t a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x34FD80C3uLL);
}

uint64_t QLCreateMallocedBitmapContextWithSizeSupportingSubPixelAntialiasing()
{
  return QLCreateReservedBitmapContextWithSize(0);
}

CGContextRef QLCreateMallocedGrayscaleContextWithSize(double a1, double a2)
{
  unint64_t v2 = (unint64_t)a1;
  unint64_t v3 = (unint64_t)a2;
  if ((unint64_t)a1) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0;
  }
  CGContextRef v5 = 0;
  if (!is_mul_ok(v2, v3)) {
    return v5;
  }
  size_t v7 = malloc_type_calloc(v2 * v3, 1uLL, 0x85793EADuLL);
  if (!v7)
  {
    uint64_t v11 = MEMORY[0x263F16100];
    double v12 = *(NSObject **)(MEMORY[0x263F16100] + 120);
    if (!v12)
    {
      QLTInitLogging();
      double v12 = *(NSObject **)(v11 + 120);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      QLCreateMallocedGrayscaleContextWithSize_cold_1(v12);
    }
    return 0;
  }
  size_t v8 = v7;
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  if (!DeviceGray)
  {
    free(v8);
    return 0;
  }
  CFDictionaryRef v10 = DeviceGray;
  CGContextRef v5 = CGBitmapContextCreate(v8, v2, v3, 8uLL, v2, DeviceGray, 0);
  CGColorSpaceRelease(v10);
  if (!v5) {
    free(v8);
  }
  return v5;
}

CGContext *_QLDestroyMallocedBitmapContext(CGContext *a1)
{
  return _QLDestroyReservedBitmapContext(a1, (uint64_t (*)(CGContext *, size_t))_MallocDiscard);
}

void QLContextSetGrayFillColor(CGContext *a1, CGFloat a2, CGFloat a3)
{
  GenericGrayGamma2_2 = CGColorCreateGenericGrayGamma2_2(a2, a3);
  CGContextSetFillColorWithColor(a1, GenericGrayGamma2_2);
  CFRelease(GenericGrayGamma2_2);
}

void QLContextSetGrayStrokeColor(CGContext *a1, CGFloat a2, CGFloat a3)
{
  GenericGrayGamma2_2 = CGColorCreateGenericGrayGamma2_2(a2, a3);
  CGContextSetStrokeColorWithColor(a1, GenericGrayGamma2_2);
  CFRelease(GenericGrayGamma2_2);
}

void QLContextSetRGBFillColor(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  SRGB = CGColorCreateSRGB(a2, a3, a4, a5);
  CGContextSetFillColorWithColor(a1, SRGB);
  CFRelease(SRGB);
}

void QLContextSetRGBStrokeColor(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  SRGB = CGColorCreateSRGB(a2, a3, a4, a5);
  CGContextSetStrokeColorWithColor(a1, SRGB);
  CFRelease(SRGB);
}

id _log_2()
{
  uint64_t v0 = MEMORY[0x263F16100];
  double v1 = *(void **)(MEMORY[0x263F16100] + 160);
  if (!v1)
  {
    QLTInitLogging();
    double v1 = *(void **)(v0 + 160);
  }
  return v1;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_217F44B4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F44C4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F45168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    double v18 = _log_2();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[QLPreviewParts computePreviewInThread]();
    }

    objc_end_catch();
    JUMPOUT(0x217F45148);
  }
  _Unwind_Resume(a1);
}

void sub_217F4556C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F45694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F4570C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F4583C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F459B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F45AA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F45C88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217F45D54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void QLPreviewCopyEmbeddedIWorkData_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)vImage_Buffer buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_217F31000, log, OS_LOG_TYPE_DEBUG, "Looking inside %@", buf, 0xCu);
}

void QLPreviewCopyEmbeddedIWorkData_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_217F31000, v0, v1, "Unable to determine whether %@ is a directory: %@");
}

void __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217F31000, a2, OS_LOG_TYPE_ERROR, "Error reading archive: %@", (uint8_t *)&v2, 0xCu);
}

void __QLPreviewCopyEmbeddedIWorkData_block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_217F31000, a2, a3, "Error reading archive %@ : %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void QLGuessEncodingForTextFileAtURL_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_217F31000, v0, v1, "Error while attempting to read data from file '%@' for encoding detection: %@");
}

void QLGuessEncodingForTextFileAtURL_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_217F31000, v0, v1, "Error while attempting to get attributes from file '%@': %@");
}

void QLPlistDataForFile_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_217F31000, v0, v1, "Could not read %@: %@");
}

void QLPlistDataForFile_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_217F31000, v0, v1, "Could not retrieve file size for %@: %@");
}

void _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "mach_msg_return_t _QLMachDispatchIncomingMessageAndReplyIfNecessary(mach_msg_header_t *, BOOLean_t (*)(mach_msg_h"
       "eader_t *, mach_msg_header_t *), mach_msg_size_t, mach_msg_options_t, BOOLean_t *)";
  _os_log_debug_impl(&dword_217F31000, log, OS_LOG_TYPE_DEBUG, "_QLMachDispatchIncomingMessageAndReplyIfNecessary: Sent last message without voucher. (%s)", (uint8_t *)&v1, 0xCu);
}

void _QLMachDispatchIncomingMessageAndReplyIfNecessary_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "mach_msg_return_t _QLMachDispatchIncomingMessageAndReplyIfNecessary(mach_msg_header_t *, BOOLean_t (*)(mach_msg_h"
       "eader_t *, mach_msg_header_t *), mach_msg_size_t, mach_msg_options_t, BOOLean_t *)";
  _os_log_debug_impl(&dword_217F31000, log, OS_LOG_TYPE_DEBUG, "_QLMachDispatchIncomingMessageAndReplyIfNecessary: Sent last message with voucher attached. Clearing voucher now. (%s)", (uint8_t *)&v1, 0xCu);
}

void _QLMachGetMachPortCount_cold_1(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_0(&dword_217F31000, v1, v2, "Can't deallocate port types array: %s", v3, v4, v5, v6, 2u);
}

void _QLMachGetMachPortCount_cold_2(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_0(&dword_217F31000, v1, v2, "Can't deallocate port names array: %s", v3, v4, v5, v6, 2u);
}

void _QLMachGetMachPortCount_cold_3(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_0(&dword_217F31000, v1, v2, "Can't get task port list: %s", v3, v4, v5, v6, 2u);
}

void QLImageIOCreateScaledImageOfMaximumAndMinimumSize_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_217F31000, log, OS_LOG_TYPE_FAULT, "Could not create CGContext to draw thumbnail smaller than minimum dimension.", v1, 2u);
}

void QLImageIOCreateCroppedImageRef_cold_1()
{
  __assert_rtn("QLImageIOCreateCroppedImageRef", "QLThumbnailingImageIO.m", 460, "imageRef != NULL");
}

void QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_217F31000, log, OS_LOG_TYPE_ERROR, "Will not generate thumbnail from image because it has an incorrect size: (%f, %f)", (uint8_t *)&v3, 0x16u);
}

void QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSourceAndContentType_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_217F31000, log, OS_LOG_TYPE_ERROR, "Could not generate thumbnail from image.", v1, 2u);
}

void QLCreateMallocedGrayscaleContextWithSize_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_217F31000, log, OS_LOG_TYPE_ERROR, "Can't malloc bitmap data", v1, 2u);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x270EE5070](theString);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A20](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x270EE5A28](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x270EE5A30](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5A40](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B70](gray, alpha);
}

CGColorRef CGColorCreateGenericGrayGamma2_2(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B78](gray, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

uint64_t CGContextDrawPDFPageWithAnnotations()
{
  return MEMORY[0x270EE5F28]();
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

uint64_t CGContextSetLineWidthThreshold()
{
  return MEMORY[0x270EE6180]();
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGContextSetTextGreekingThreshold()
{
  return MEMORY[0x270EE6230]();
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x270EE6298](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x270EE6680](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetSizeAfterOrientation()
{
  return MEMORY[0x270EE6850]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5028](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5050](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x270EE6A80](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  MEMORY[0x270EE6D80](page, *(void *)&box);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CGAffineTransform *__cdecl CGPDFPageGetDrawingTransform(CGAffineTransform *__return_ptr retstr, CGPDFPageRef page, CGPDFBox box, CGRect rect, int rotate, BOOL preserveAspectRatio)
{
  return (CGAffineTransform *)MEMORY[0x270EE6D98](retstr, page, *(void *)&box, *(void *)&rotate, preserveAspectRatio, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

int CGPDFPageGetRotationAngle(CGPDFPageRef page)
{
  return MEMORY[0x270EE6DA8](page);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x270EE7340]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x270EE7350](dict, size);
}

uint64_t QLTCreateCGContext()
{
  return MEMORY[0x270EFB9A8]();
}

uint64_t QLTCreateCGContextWithSize()
{
  return MEMORY[0x270EFB9B0]();
}

uint64_t QLTImageClassWithError()
{
  return MEMORY[0x270EFB9B8]();
}

uint64_t QLTInitLogging()
{
  return MEMORY[0x270EFB9C0]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x270EFDCE8](task);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

uint64_t UTTypeCopyParentIdentifiers()
{
  return MEMORY[0x270EE8568]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _QLComputeValuesForCGContextCreationWithSizeAndScale()
{
  return MEMORY[0x270EFB9C8]();
}

uint64_t _UTTypeCopyPedigreeSet()
{
  return MEMORY[0x270EE85B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t archive_entry_pathname_w()
{
  return MEMORY[0x270F97D98]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x270F97E20]();
}

uint64_t archive_entry_size_is_set()
{
  return MEMORY[0x270F97E28]();
}

uint64_t archive_errno()
{
  return MEMORY[0x270F97E50]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_data()
{
  return MEMORY[0x270F97E80]();
}

uint64_t archive_read_data_skip()
{
  return MEMORY[0x270F97E98]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x270F97EE0]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x270F97F20]();
}

uint64_t archive_read_open_memory()
{
  return MEMORY[0x270F97F28]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x270F97F50]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x270F97F68]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x270EDA1E8](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_names(ipc_space_t task, mach_port_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_port_type_array_t *types, mach_msg_type_number_t *typesCnt)
{
  return MEMORY[0x270EDA218](*(void *)&task, names, namesCnt, types, typesCnt);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x270EDA220](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

uint64_t ucsdet_close()
{
  return MEMORY[0x270F996E0]();
}

uint64_t ucsdet_detect()
{
  return MEMORY[0x270F996E8]();
}

uint64_t ucsdet_getName()
{
  return MEMORY[0x270F996F0]();
}

uint64_t ucsdet_open()
{
  return MEMORY[0x270F996F8]();
}

uint64_t ucsdet_setText()
{
  return MEMORY[0x270F99700]();
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF020](src, dest, *(void *)&flags);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

void voucher_mach_msg_clear(mach_msg_header_t *msg)
{
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAE8](msg);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x270EDBBA0](a1);
}