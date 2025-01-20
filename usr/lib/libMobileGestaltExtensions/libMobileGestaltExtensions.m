uint64_t sub_1A6ED6800(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  return MEMORY[0x1F41818D8]();
}

void sub_1A6ED6810(uint64_t a1)
{
}

void sub_1A6ED681C(uint64_t a1)
{
}

void sub_1A6ED6828(uint64_t a1, uint64_t a2)
{
}

void sub_1A6ED6838(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1A6ED6848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](a1, sel_registerForNotification_argument_question_, a2, a3, a4);
}

void sub_1A6ED68FC(uint64_t a1)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1AD0C6360]();
  if (!qword_1EB283CE0) {
    qword_1EB283CE0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  uint64_t v7 = *(void *)(a1 + 32);
  v24[0] = v6;
  v24[1] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8, v24, count:2, v9];
  [*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:objc_msgSend_objectForKey_((void *)qword_1EB283CE0, v11, v10, v12, v13) forKey:v10];
  v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v14)
  {
    id v15 = v14;
  }
  else
  {
    v19 = [MGNotificationObserver alloc];
    *(void *)(*(void *)(*(void *)(v19 + 48) + 8) + 40) = [v19 initWithType:v20 argument:*(unsigned int *)(v19 + 56) argument:*(void *)(v19 + 32) argument:v21];
    [objc_msgSend_setObject_forKey_((void *)qword_1EB283CE0, v22, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10, v23];
  }
  [*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addBlock:v16 withBlock:v17 withBlock:v18];
}

id sub_1A6ED6C68(void *a1, uint64_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v8 = [NSString stringWithUTF8String:a2];
  id v12 = (id)[a1 valueForEntitlement:v9 defaultValue:v8 defaultEntitlement:v10 defaultValue:v11];
  return v12;
}

uint64_t _MGSSetLazyFuncs(uint64_t a1, void *a2, pthread_mutex_t *a3)
{
  qword_1EB283D08 = a1;
  off_1EB283CF8 = a2;
  qword_1EB283D00 = (uint64_t)a3;
  pthread_mutex_lock(a3);
  uint64_t v3 = (void *)qword_1EB283D08;
  *(void *)(qword_1EB283D08 + 208) = sub_1A6EDA1E8;
  v3[27] = sub_1A6EDA7CC;
  v3[28] = sub_1A6ED974C;
  v3[29] = sub_1A6ED7E94;
  v3[30] = sub_1A6ED6C68;
  v3[31] = _MGSCopyLocalizedString;
  v3[32] = sub_1A6EDA0C8;
  v3[33] = sub_1A6ED8508;
  v3[34] = sub_1A6ED98E0;
  v3[35] = j__objc_msgSend_processIdentifier;
  v3[36] = sub_1A6ED9C3C;
  v3[37] = sub_1A6ED9AC4;
  v3[38] = sub_1A6ED8104;
  v3[39] = sub_1A6ED9B30;
  v3[40] = sub_1A6ED9784;
  v3[41] = sub_1A6ED8170;
  v3[42] = sub_1A6EDAD14;
  v3[43] = sub_1A6EDB074;
  v3[44] = sub_1A6ED9B9C;
  v3[45] = sub_1A6EDAFD0;
  v3[46] = sub_1A6ED6848;
  v3[47] = sub_1A6EDABD8;
  v3[48] = sub_1A6ED9BF8;
  v3[49] = j__objc_msgSend_start;
  v3[50] = sub_1A6EDB010;
  v3[51] = sub_1A6ED9D40;
  uint64_t v4 = (pthread_mutex_t *)qword_1EB283D00;

  return pthread_mutex_unlock(v4);
}

void sub_1A6ED7C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"libMobileGestalt %s:%d: %@", a1, a2, a3, 0);
  CFStringRef v11 = CFStringCreateWithFormatAndArguments(v9, 0, v10, &a9);
  CFIndex Length = CFStringGetLength(v11);
  CFIndex v13 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v14 = (char *)malloc_type_calloc(1uLL, v13, 0xBF105376uLL);
  if (v14)
  {
    if (CFStringGetCString(v11, v14, v13, 0x8000100u) == 1 && off_1E96E6988 != 0) {
      off_1E96E6988(v14);
    }
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  free(v14);
}

id sub_1A6ED7E94(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1AD0C6360]();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3052000000;
  v53 = sub_1A6ED6838;
  v54 = sub_1A6ED681C;
  uint64_t v55 = 0;
  uint64_t v3 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v8 = [MobileGestaltHelperProxy v4:v5:v6:v7];
  CFIndex v13 = [v8 v9:v10:v11:v12];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1A6ED6800;
  v50[3] = &unk_1E5CB25D8;
  v50[4] = &buf;
  [objc_msgSend_getServerAnswerForQuestion_reply_(v13, v14, a1, (uint64_t)v50, v15);
  if (objc_msgSend_error(v8, v16, v17, v18, v19))
  {
    v24 = (void (*)(uint64_t))off_1EB283CF8;
    if (off_1EB283CF8)
    {
      uint64_t v25 = [v8 v20:v21:v22:v23];
      v24(v25);
    }
  }
  [v8 invalidate:v20, v21, v22, v23];
  v26 = *(void **)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  if (v26)
  {
    id v33 = [v26 objectForKey:v27 ? @"answer" : v28 ? v29 : @""];
    v34 = (void (*)(uint64_t))off_1EB283CF8;
    if (off_1EB283CF8)
    {
      v35 = [v26 objectForKey:v30 error:v31, v32];
      uint64_t v40 = [v35 v36:v37:v38:v39];
      v34(v40);
    }
    uint64_t v41 = [v26 objectForKeyedSubscript:v30:@"logString"v31, v32];
    if (v41)
    {
      v42 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
      if (v42) {
        v48 = v42 + 1;
      }
      else {
        v48 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
      }
      sub_1A6ED7C4C((uint64_t)v48, 87, @"%@", v43, v44, v45, v46, v47, v41);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    id v33 = 0;
  }
  return v33;
}

void sub_1A6ED80E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1A6ED8104(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(qword_1EB283D08 + 752);
  if (!v5) {
    uint64_t v5 = sub_1A6ED8170(94, 3);
  }
  CFAllocatorRef v9 = [v5 a2:a3 a4:a5];
  uint64_t v10 = *(uint64_t **)(qword_1EB283D08 + 736);
  if (!v10) {
    uint64_t v10 = (uint64_t *)sub_1A6ED8170(92, 1);
  }
  return [v9 effectiveBoolValueForSetting:v6, *v10, v7, v8] == 2;
}

void *sub_1A6ED8170(int a1, int a2)
{
  pthread_mutex_lock((pthread_mutex_t *)qword_1EB283D00);
  uint64_t v4 = *(void **)(qword_1EB283D08 + 8 * a1);
  if (!v4)
  {
    uint64_t v5 = off_1E5CB25F8[2 * a1];
    uint64_t v6 = dlopen(v5, 1);
    if (!v6
      || (a2 != 3
        ? (uint64_t v11 = dlsym(v6, off_1E5CB25F8[2 * a1 + 1]))
        : (v10 = (NSString *)objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)off_1E5CB25F8[2 * a1 + 1], v8, v9), v11 = NSClassFromString(v10)), (uint64_t v4 = v11) == 0))
    {
      sub_1A6EDC030(a1, (uint64_t)v5);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)qword_1EB283D00);
  return v4;
}

id _MGSCopyLocalizedString(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v9 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v13 = [NSString stringWithUTF8String:a1];
  uint64_t v17 = [v9 bundleWithPath:v14 bundleIdentifier:v13 bundleVersion:v15 bundleVersionString:v16];
  if (v17)
  {
    uint64_t v22 = v17;
    uint64_t v51 = a3;
    uint64_t v23 = [v17 objc_msgSend_localizations:v18, v19, v20, v21];
    if (v23)
    {
      uint64_t v27 = v23;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v24, @"/var/mobile/Library/Preferences/.GlobalPreferences.plist", v25, v26];
      uint64_t v32 = [v28 objectForKey:v29 forKey:@"AppleLanguages" defaultValue:v30 defaultValueType:v31];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        uint64_t v32 = [v28 objectForKey:v33 forKey:@"NSLanguages" inDictionary:v34 withDefaultValue:v35];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v37 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v24 forPreferences:v27 preferredLanguages:v32];
        if (objc_msgSend_count(v37, v38, v39, v40, v41))
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          uint64_t v42 = [v37 countByEnumeratingWithState:v24 objects:(id *)&v52 count:v56];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v53;
LABEL_9:
            uint64_t v45 = 0;
            while (1)
            {
              if (*(void *)v53 != v44) {
                objc_enumerationMutation(v37);
              }
              uint64_t v46 = *(void *)(*((void *)&v52 + 1) + 8 * v45);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v48 = [v22 localizedStringForKey:v47 value:a2 table:a4 localization:v46];
                if (v48) {
                  break;
                }
              }
              if (v43 == ++v45)
              {
                uint64_t v43 = [v37 countByEnumeratingWithState:v47 objects:(id *)&v52 count:16];
                if (v43) {
                  goto LABEL_9;
                }
                goto LABEL_19;
              }
            }
            id v49 = v48;
            if (v49) {
              goto LABEL_20;
            }
          }
        }
      }
    }
LABEL_19:
    id v49 = (id)[v22 localizedStringForKey:v24 value:a2 table:a4];
  }
  else
  {
    id v49 = 0;
  }
LABEL_20:
  return v49;
}

dispatch_queue_t sub_1A6ED84D8()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.MobileGestalt.observers", 0);
  qword_1EB283CF0 = (uint64_t)result;
  return result;
}

uint64_t sub_1A6ED8508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MGNotificationRegistration alloc];

  return MEMORY[0x1F4181798](v4, sel_initWithQueue_block_, a1, a2, v5);
}

uint64_t sub_1A6ED859C(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    v24 = a2;
    _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "IPC error %@", (uint8_t *)&v23, 0xCu);
  }
  [objc_msgSend_setError_(*(void **)(a1 + 32), v4, 10, v5, v6)];
  uint64_t v11 = [a2 v7:v8 v9:v10];
  uint64_t result = [v11 isEqual:v12 *MEMORY[0x1E4F281F8] v13 v14];
  if (result)
  {
    uint64_t result = [a2 v16:v17 v18:v19];
    if (result == 4097) {
      return [*(void **)(a1 + 32) setError:v20 code:v21 userInfo:v22];
    }
  }
  return result;
}

void sub_1A6ED8744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A6ED875C(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_1A6ED8828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A6ED8840(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t sub_1A6ED8A94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = [*(void **)(a1 + 32) updateWatcher:a2 a3:a3 a4:a4 a5:a5];
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16);
    return v7();
  }
  return result;
}

uint64_t sub_1A6ED8AEC(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_1A6ED8D70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = [*(void **)(a1 + 32) updateWatcher:a2, a3, a4, a5];
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 64) + 16);
    return v7();
  }
  return result;
}

uint64_t sub_1A6ED8DC8(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_1A6ED8DD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(void **)(a1 + 32) updateWatcher:a2, a3, a4, a5];
}

void sub_1A6ED8E4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 56);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(NSObject **)(v2 + 48);
  if (v4)
  {
    dispatch_source_cancel(v4);
  }
}

uint64_t sub_1A6ED8F70(uint64_t a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t result = [v2 countByEnumeratingWithState:a2 objects:&v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:v7 objects:v12 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_1A6ED906C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4181798](a3, sel_invokeBlocks, a3, a4, a5);
}

uint64_t sub_1A6ED9094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_invokeBlocks, a3, a4, a5);
}

void sub_1A6ED909C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a2 & 2) != 0) {
    MEMORY[0x1F4181798](a3, sel_invokeBlocks, a3, a4, a5);
  }
}

uint64_t sub_1A6ED90AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_invokeBlocks, a3, a4, a5);
}

uint64_t sub_1A6ED90B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_invokeBlocks, a3, a4, a5);
}

void sub_1A6ED9500(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = *(NSObject **)(v1 + 16);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = sub_1A6ED9584;
    v4[3] = &unk_1E5CB2540;
    uint64_t v3 = *(void *)(a1 + 40);
    v4[4] = v1;
    v4[5] = v3;
    dispatch_async(v2, v4);
  }
}

uint64_t sub_1A6ED9584(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

uint64_t sub_1A6ED9634(uint64_t a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:a2 objects:(id *)&v18 count:v22];
  if (v4)
  {
    uint64_t v9 = v4;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [*(void **)(*(void *)(a1 + 32) + 8) objectForKey:v5 withObject:v12 withObject:v7 withObject:v8];
        [v12 removeBlock:v14, v13, v15, v16];
      }
      uint64_t v9 = [v3 countByEnumeratingWithState:v5 objects:&v18 count:16];
    }
    while (v9);
  }
  return [*(void **)(*(void *)(a1 + 32) + 8) removeAllObjects:v5, v6, v7, v8];
}

void sub_1A6ED974C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  [a1 a2:a3 a4:a4 a5:a5];
}

uint64_t sub_1A6ED9784(uint64_t a1)
{
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3052000000;
  uint64_t v35 = sub_1A6ED6838;
  uint64_t v36 = sub_1A6ED681C;
  uint64_t v37 = 0;
  uint64_t v2 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v7 = [MobileGestaltHelperProxy v3:v4:v5:v6];
  uint64_t v12 = [v7 v8:v9 v10:v11];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1A6ED98D0;
  v31[3] = &unk_1E5CB25B0;
  v31[4] = &v32;
  [v12 getSpringboardRegionOverride:v13 reply:a1];
  if (objc_msgSend_error(v7, v15, v16, v17, v18))
  {
    uint64_t v23 = (void (*)(uint64_t))off_1EB283CF8;
    if (off_1EB283CF8)
    {
      uint64_t v24 = [v7 v19:v20 v21:v22];
      v23(v24);
    }
  }
  [v7 invalidate:v19, v20, v21, v22];
  uint64_t v25 = (void *)v33[5];
  _Block_object_dispose(&v32, 8);
  return [v25 v26:v27:v28:v29];
}

void sub_1A6ED98B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A6ED98D0(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  return MEMORY[0x1F41818D8]();
}

uint64_t sub_1A6ED98E0(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v5 = 0;
  if (MGGetSInt32Answer() == 4)
  {
    uint64_t v51 = 0;
    long long v52 = &v51;
    uint64_t v53 = 0x3052000000;
    long long v54 = sub_1A6ED6838;
    long long v55 = sub_1A6ED681C;
    uint64_t v56 = 0;
    uint64_t v6 = (void *)MEMORY[0x1AD0C6360]();
    uint64_t v11 = [MobileGestaltHelperProxy v7:v8:v9:v10];
    uint64_t v16 = [v11 v12:v13:v14:v15];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = sub_1A6ED9AB4;
    v50[3] = &unk_1E5CB25D8;
    v50[4] = &v51;
    [v16 getAppleTVMode:v17 withOptions:v50 withCompletionHandler:v18 withErrorHandler:v19];
    if (objc_msgSend_error(v11, v20, v21, v22, v23))
    {
      uint64_t v28 = (void (*)(uint64_t))off_1EB283CF8;
      if (off_1EB283CF8)
      {
        uint64_t v29 = [v11 v24:v25 v26:v27];
        v28(v29);
      }
    }
    [v11 invalidate:v24, v25, v26, v27];
    uint64_t v30 = (void *)v52[5];
    _Block_object_dispose(&v51, 8);
    id v31 = v30;
    uint64_t v35 = [v30 objectForKeyedSubscript:v32 width:v33];
    uint64_t v39 = [v30 objectForKeyedSubscript:v36:@"height"v37, v38];
    uint64_t v5 = 0;
    if (v35)
    {
      uint64_t v44 = (void *)v39;
      if (v39)
      {
        *a1 = [v35 intValue:v40, v41, v42, v43];
        *a2 = [v44 v45:v46 v47:v48];
        uint64_t v5 = 1;
      }
    }
  }
  return v5;
}

void sub_1A6ED9A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A6ED9AB4(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  return MEMORY[0x1F41818D8]();
}

BOOL sub_1A6ED9AC4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(qword_1EB283D08 + 752);
  if (!v5) {
    uint64_t v5 = sub_1A6ED8170(94, 3);
  }
  uint64_t v9 = [v5 a2:a3 a4:a5];
  uint64_t v10 = *(uint64_t **)(qword_1EB283D08 + 728);
  if (!v10) {
    uint64_t v10 = (uint64_t *)sub_1A6ED8170(91, 1);
  }
  return [v9 effectiveBoolValueForSetting:v6, *v10, v7, v8] == 2;
}

BOOL sub_1A6ED9B30(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(qword_1EB283D08 + 752);
  if (!v5) {
    uint64_t v5 = sub_1A6ED8170(94, 3);
  }
  uint64_t v9 = [v5 a2:a3 a4:a5];
  uint64_t v10 = *(uint64_t **)(qword_1EB283D08 + 744);
  if (!v10) {
    uint64_t v10 = (uint64_t *)sub_1A6ED8170(93, 1);
  }
  return [v9 effectiveBoolValueForSetting:v6, *v10, v7, v8] == 2;
}

uint64_t sub_1A6ED9B9C()
{
  v0 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v5 = [MobileGestaltHelperProxy v1:v2:v3:v4];
  uint64_t v10 = [v5 _proxyRebuildCache:v6, v7, v8, v9];
  [v5 invalidate:v11, v12, v13, v14];
  _MGClearInProcessCache();
  return v10;
}

uint64_t sub_1A6ED9BF8()
{
  v0 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v5 = [MobileGestaltHelperProxy v1:v2:v3:v4];
  uint64_t v10 = [v5 proxySetCacheSentinel:v6, v7, v8, v9];
  return v10;
}

uint64_t sub_1A6ED9C3C()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1AD0C6360]();
  unsigned int v12 = 0;
  int v1 = sub_1A6EDBC10((int *)&v12);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
    if (v3) {
      uint64_t v9 = v3 + 1;
    }
    else {
      uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
    }
    sub_1A6ED7C4C((uint64_t)v9, 259, @"getSensorProvisioningState returned error %ld", v4, v5, v6, v7, v8, v2);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v14 = v2;
      _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "getSensorProvisioningState returned error %ld", buf, 0xCu);
    }
  }
  uint64_t v10 = v12;
  return v10;
}

void sub_1A6ED9D40(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1AD0C6360]();
  uint64_t v40 = 0;
  uint64_t v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v40];
  if (v6)
  {
    uint64_t v10 = (void *)v6;
    uint64_t v39 = 0;
    uint64_t v11 = [NSString stringWithUTF8String:a2];
    [v10 writeToFile:v12 options:268435457 error:(uint64_t)&v39];
    if (v39)
    {
      uint64_t v13 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
      uint64_t v14 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
      if (v14) {
        uint64_t v13 = v14 + 1;
      }
      [objc_msgSend_localizedDescription(v39, v15, v16, v17, v18)];
      sub_1A6ED7C4C((uint64_t)v13, 288, @"Failed to persist file %s with reason: %@", v19, v20, v21, v22, v23, a2);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = [v39 localizedDescription:v24, v25, v26, v27];
        *(_DWORD *)long long buf = 136315394;
        uint64_t v42 = a2;
        __int16 v43 = 2112;
        uint64_t v44 = v28;
        uint64_t v29 = MEMORY[0x1E4F14500];
        uint64_t v30 = "Failed to persist file %s with reason: %@";
        uint32_t v31 = 22;
LABEL_12:
        _os_log_impl(&dword_1A6ED5000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, v31);
      }
    }
  }
  else
  {
    uint64_t v32 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
    if (v32) {
      uint64_t v38 = v32 + 1;
    }
    else {
      uint64_t v38 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
    }
    sub_1A6ED7C4C((uint64_t)v38, 279, @"failed to write cache: %@", v33, v34, v35, v36, v37, v40);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v42 = v40;
      uint64_t v29 = MEMORY[0x1E4F14500];
      uint64_t v30 = "failed to write cache: %@";
      uint32_t v31 = 12;
      goto LABEL_12;
    }
  }
}

uint64_t sub_1A6ED9F2C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (void *)sub_1A6ED9FD8(a1, a2, a3, a4, a5);
  uint64_t v10 = [v5 v6:v7:v8:v9];
  if (v10)
  {
    uint64_t result = [v10 v11:v12:v13:v14];
    if (result) {
      return result;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      uint64_t v16 = MEMORY[0x1E4F14500];
      uint64_t v17 = "Valid OTATaskAgentClient but failed to get CrashReporterID.";
      uint64_t v18 = (uint8_t *)&v19;
LABEL_7:
      _os_log_impl(&dword_1A6ED5000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    uint64_t v16 = MEMORY[0x1E4F14500];
    uint64_t v17 = "Failed to get OTATaskAgentClient for CrashReporterID.";
    uint64_t v18 = buf;
    goto LABEL_7;
  }
  return 0;
}

uint64_t sub_1A6ED9FD8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_1A6ED6838;
  uint64_t v12 = sub_1A6ED681C;
  uint64_t v5 = qword_1E96E6980;
  uint64_t v13 = qword_1E96E6980;
  if (!qword_1E96E6980)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1A6EDB0D8;
    v7[3] = &unk_1E5CB2C80;
    v7[4] = &v8;
    sub_1A6EDB0D8((uint64_t)v7, a2, a3, a4, a5);
    uint64_t v5 = v9[5];
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1A6EDA0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A6EDA0C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1E96E6970 != -1) {
    dispatch_once(&qword_1E96E6970, &unk_1EFC370F0);
  }
  uint64_t v5 = (void *)qword_1E96E6968;

  return [v5 copyWithZone:a2];
}

uint64_t sub_1A6EDA11C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_1A6ED9F2C(a1, a2, a3, a4, a5);
  qword_1E96E6968 = result;
  return result;
}

uint64_t sub_1A6EDA13C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (void *)sub_1A6ED9FD8(a1, a2, a3, a4, a5);
  uint64_t v10 = [v5 v6:v7 v8:v9];
  if (v10)
  {
    uint64_t result = [v10 v11:v12 v13:v14];
    if (result) {
      return result;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      uint64_t v16 = MEMORY[0x1E4F14500];
      uint64_t v17 = "Valid OTATaskAgentClient but failed to get CrashReporterID.";
      uint64_t v18 = (uint8_t *)&v19;
LABEL_7:
      _os_log_impl(&dword_1A6ED5000, v16, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    uint64_t v16 = MEMORY[0x1E4F14500];
    uint64_t v17 = "Failed to get OTATaskAgentClient for AWDID.";
    uint64_t v18 = buf;
    goto LABEL_7;
  }
  return 0;
}

uint64_t sub_1A6EDA1E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1E96E6958 != -1) {
    dispatch_once(&qword_1E96E6958, &unk_1EFC37130);
  }
  uint64_t v5 = (void *)qword_1E96E6960;

  return [v5 copyWithZone:a2];
}

uint64_t sub_1A6EDA23C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_1A6EDA13C(a1, a2, a3, a4, a5);
  qword_1E96E6960 = result;
  return result;
}

SEL sub_1A6EDA25C(int a1)
{
  switch(a1)
  {
    case 1:
      uint64_t v3 = @"ICCID";
      goto LABEL_4;
    case 2:
      uint64_t v3 = @"IMEI";
      goto LABEL_4;
    case 3:
      uint64_t v3 = @"MEID";
      goto LABEL_4;
    case 4:
      uint64_t v3 = @"baseId";
      goto LABEL_4;
    case 5:
      uint64_t v3 = @"baseProfile";
      goto LABEL_4;
    case 6:
      uint64_t v3 = @"baseVersion";
      goto LABEL_4;
    case 7:
      uint64_t v3 = @"displayCSN";
      goto LABEL_4;
    case 8:
      uint64_t v3 = @"CSN";
LABEL_4:
      SEL result = NSSelectorFromString(&v3->isa);
      break;
    default:
      uint64_t v6 = v1;
      uint64_t v7 = v2;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Key not recognized", v5, 2u);
      }
      SEL result = 0;
      break;
  }
  return result;
}

uint64_t sub_1A6EDA3C8(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    LOWORD(v12) = 0;
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = "Invalid equipmentInfo";
LABEL_13:
    uint32_t v10 = 2;
    goto LABEL_14;
  }
  if (!a2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    LOWORD(v12) = 0;
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = "Invalid CT selector";
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    LOWORD(v12) = 0;
    uint64_t v8 = MEMORY[0x1E4F14500];
    uint64_t v9 = "EquipmentInfo doesn't respond to target selector";
    goto LABEL_13;
  }
  uint64_t v7 = [a1 performSelector:v4 withObject:a2 withObject:v5 withObject:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = objc_opt_class();
      uint64_t v8 = MEMORY[0x1E4F14500];
      uint64_t v9 = "Target selector returned unexpected class %@";
      uint32_t v10 = 12;
LABEL_14:
      _os_log_impl(&dword_1A6ED5000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, v10);
    }
    return 0;
  }
  return v7;
}

uint64_t sub_1A6EDA564(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6 = (int)a2;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [a1 a2:a3 a4:a5];
  uint64_t v9 = [v7 countByEnumeratingWithState:v8 objects:(id *)&v25 count:16];
  if (v9)
  {
    uint64_t v14 = v9;
    uint64_t v15 = *(void *)v26;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v26 != v15) {
        objc_enumerationMutation(v7);
      }
      uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
      uint64_t v18 = [v17 v10:v11 v12:v13];
      if (!v6 && v18 == 1) {
        break;
      }
      uint64_t v23 = [v17 v19:v20 v21:v22];
      if (v6 == 1 && v23 == 2) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v7 countByEnumeratingWithState:v10 objects:&v25 count:v29];
        uint64_t v17 = 0;
        if (v14) {
          goto LABEL_3;
        }
        return sub_1A6EDA3C8(v17, a3);
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  return sub_1A6EDA3C8(v17, a3);
}

uint64_t sub_1A6EDA698(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v6 = [a1 a2:a3 a4:a4 a5:a5];
  uint64_t v8 = [v6 countByEnumeratingWithState:v7 objects:(void *)&v15 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t result = sub_1A6EDA3C8(*(void **)(*((void *)&v15 + 1) + 8 * v11), (uint64_t)a2);
      if (result) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v6 countByEnumeratingWithState:v13 objects:v15 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "All slots had nil at desired property", v14, 2u);
    }
    return 0;
  }
  return result;
}

const void *sub_1A6EDA7CC(int a1, const char *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = sub_1A6EDA25C(a1);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "getSelectorForKey failed. No selector found.", buf, 2u);
  }
  long long v25 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F23A80]);
  MobileEquipmentInfo = [v4 getMobileEquipmentInfo:v5 withMobileEquipmentInfo:&v25 withMobileEquipmentInfoSize:v6 withMobileEquipmentInfoVersion:v7];
  uint64_t v12 = v25;
  if (v25)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      uint64_t v21 = 0;
      goto LABEL_9;
    }
    uint64_t v17 = [v12 localizedDescriptionWithFormat:v13, v14, v15, v16];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v27 = v17;
    long long v18 = MEMORY[0x1E4F14500];
    __int16 v19 = "MobileEquipmentInfo failed with error %@";
    uint32_t v20 = 12;
LABEL_7:
    _os_log_impl(&dword_1A6ED5000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, v20);
    goto LABEL_8;
  }
  if (a2 >= 2)
  {
    if (a2 != 2)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      *(_WORD *)long long buf = 0;
      long long v18 = MEMORY[0x1E4F14500];
      __int16 v19 = "invalid index selected";
      uint32_t v20 = 2;
      goto LABEL_7;
    }
    uint64_t v23 = (const void *)sub_1A6EDA698(MobileEquipmentInfo, v3, v9, v10, v11);
  }
  else
  {
    uint64_t v23 = (const void *)sub_1A6EDA564(MobileEquipmentInfo, a2, (uint64_t)v3, v10, v11);
  }
  uint64_t v21 = v23;
  if (v23) {
    CFRetain(v23);
  }
LABEL_9:
  if (v4) {

  }
  return v21;
}

uint64_t sub_1A6EDA974(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = (int)a2;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  SubscriptionInfoWithError = [a1 getSubscriptionInfoWithError:a2, (uint64_t)&v48, a4, a5];
  uint64_t v12 = v48;
  if (!SubscriptionInfoWithError || v48)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = [v12 localizedDescription:v28, v29, v30, v31];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v51 = v32;
      uint64_t v33 = MEMORY[0x1E4F14500];
      uint64_t v34 = "Failed to get subscription info with error %@";
      uint32_t v35 = 12;
LABEL_23:
      _os_log_impl(&dword_1A6ED5000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
    }
    return 0;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v13 = [SubscriptionInfoWithError subscriptions:v8, v9, v10, v11];
  uint64_t v15 = [v13 countByEnumeratingWithState:v14 objects:(id *)&v44 count:v49];
  if (!v15)
  {
LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v51) = v5;
      uint64_t v33 = MEMORY[0x1E4F14500];
      uint64_t v34 = "No subscription context found for slot %d";
      uint32_t v35 = 8;
      goto LABEL_23;
    }
    return 0;
  }
  uint64_t v20 = v15;
  uint64_t v21 = *(void *)v45;
LABEL_5:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v45 != v21) {
      objc_enumerationMutation(v13);
    }
    uint64_t v23 = *(void **)(*((void *)&v44 + 1) + 8 * v22);
    uint64_t v24 = [v23 v16:v17 v18:v19];
    if (!v5 && v24 == 1) {
      break;
    }
    uint64_t v27 = [v23 v16:v25 v26:v19];
    if (v5 == 1 && v27 == 2) {
      break;
    }
    if (v20 == ++v22)
    {
      uint64_t v20 = [v13 countByEnumeratingWithState:v16 objects:v44 count:v49];
      if (v20) {
        goto LABEL_5;
      }
      goto LABEL_21;
    }
  }
  if (!v23) {
    goto LABEL_21;
  }
  uint64_t SIMStatus_error = [a1 getSIMStatus:v16 error:&v48];
  uint64_t v37 = v48;
  if (v48 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = [v37 localizedDescriptionWithFormat:v38, v39, v40, v41];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v51 = v42;
    _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "getSimStatus failed with error %@", buf, 0xCu);
  }
  return SIMStatus_error;
}

const void *sub_1A6EDABD8(int a1, const char *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F23A80]);
  uint64_t v9 = v4;
  if (a1 != 2)
  {
    uint64_t v10 = 0;
    if (a1 != 1) {
      goto LABEL_10;
    }
    SIMTrayStatusOrError = (const void *)sub_1A6EDA974(v4, a2, v6, v7, v8);
    goto LABEL_8;
  }
  SIMTrayStatusOrError = (const void *)[v4 getSIMTrayStatusOrError:v5 withCompletion:^(NSDictionary * _Nonnull, NSError * _Nonnull) {
    v19 = (uint64_t)v7;
    v8 = v8;
}];
  if (!v19)
  {
LABEL_8:
    uint64_t v10 = SIMTrayStatusOrError;
    if (SIMTrayStatusOrError) {
      CFRetain(SIMTrayStatusOrError);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = sub_1A6EDB278(2);
    uint64_t v17 = [v19 localizedDescriptionWithFormat:v13, v14, v15, v16];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Query for %@ returned error %@", buf, 0x16u);
  }
  uint64_t v10 = 0;
LABEL_10:
  if (v9) {

  }
  return v10;
}

id sub_1A6EDAD14(int a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  if (a1)
  {
    if (a1 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v47) = a1;
        uint64_t v30 = MEMORY[0x1E4F14500];
        uint64_t v31 = "Invalid index: %d";
        uint32_t v32 = 8;
LABEL_22:
        _os_log_impl(&dword_1A6ED5000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
      }
LABEL_23:
      uint64_t v7 = 0;
      goto LABEL_31;
    }
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F23A80]);
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v30 = MEMORY[0x1E4F14500];
      uint64_t v31 = "Failed to alloc telephony client.";
      uint32_t v32 = 2;
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  uint64_t v7 = v3;
  SubscriptionInfoWithError = [v3 getSubscriptionInfoWithError:v4, (uint64_t)&v44, v5, v6];
  if (!SubscriptionInfoWithError)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v47 = v44;
      uint64_t v33 = MEMORY[0x1E4F14500];
      uint64_t v34 = "Failed to retrieve subscription info: %@";
      uint32_t v35 = 12;
LABEL_30:
      _os_log_impl(&dword_1A6ED5000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, v35);
    }
LABEL_31:
    uint64_t v37 = 0;
    id v38 = 0;
    goto LABEL_32;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v13 = [SubscriptionInfoWithError subscriptions:v9, v10, v11, v12];
  uint64_t v15 = [v13 countByEnumeratingWithState:v14 objects:(id *)&v40 count:v45];
  if (!v15)
  {
LABEL_28:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v33 = MEMORY[0x1E4F14500];
      uint64_t v34 = "Failed to retrieve phone number.";
      uint32_t v35 = 2;
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  uint64_t v18 = v15;
  uint64_t v19 = *(void *)v41;
LABEL_9:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v41 != v19) {
      objc_enumerationMutation(v13);
    }
    uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * v20);
    PhoneNumber_error = [v7 getPhoneNumber:v16 error:&v21];
    if (PhoneNumber_error)
    {
      uint64_t v25 = PhoneNumber_error;
      if (objc_msgSend_isPresent(PhoneNumber_error, v16, v23, v24, v17))
      {
        if (objc_msgSend_slotID(v21, v16, v26, v27, v17) == v2) {
          break;
        }
      }
    }
    if (v18 == ++v20)
    {
      uint64_t v18 = [v13 countByEnumeratingWithState:v16 objects:(id *)v40 count:v45];
      if (v18) {
        goto LABEL_9;
      }
      goto LABEL_28;
    }
  }
  id v36 = (id)[v25 v16:v28:v29:v17];
  if (!v36) {
    goto LABEL_28;
  }
  uint64_t v37 = v36;
  id v38 = v36;
LABEL_32:

  return v38;
}

uint64_t sub_1A6EDAFD0()
{
  v0 = *(uint64_t (**)(void))(qword_1EB283D08 + 768);
  if (!v0) {
    v0 = (uint64_t (*)(void))sub_1A6ED8170(96, 2);
  }

  return v0();
}

CFPropertyListRef sub_1A6EDB010()
{
  uint64_t v0 = *MEMORY[0x1E4F1CFC8];
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"StoreDemoMode", @"com.apple.demo-settings");
  if (v1)
  {
    CFPropertyListRef v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID()) {
      return v2;
    }
  }
  return (CFPropertyListRef)v0;
}

CFPropertyListRef sub_1A6EDB074()
{
  uint64_t v0 = *MEMORY[0x1E4F1CFC8];
  CFPropertyListRef v1 = CFPreferencesCopyAppValue(@"PressDemoMode", @"com.apple.demo-settings");
  if (v1)
  {
    CFPropertyListRef v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID()) {
      return v2;
    }
  }
  return (CFPropertyListRef)v0;
}

Class sub_1A6EDB0D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  if (!qword_1E96E6978)
  {
    v11[1] = (void *)MEMORY[0x1E4F143A8];
    v11[2] = (void *)3221225472;
    v11[3] = sub_1A6EDB204;
    v11[4] = &unk_1E5CB2CB8;
    v11[5] = v11;
    long long v12 = xmmword_1E5CB2CA0;
    uint64_t v13 = 0;
    qword_1E96E6978 = _sl_dlopen();
  }
  if (!qword_1E96E6978) {
    sub_1A6EDC118(v11, a2, a3, a4, a5);
  }
  if (v11[0]) {
    free(v11[0]);
  }
  Class result = objc_getClass("OTATaskingAgentClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    sub_1A6EDC180((uint64_t)result, v7, v8, v9, v10);
  }
  qword_1E96E6980 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t sub_1A6EDB204()
{
  uint64_t result = _sl_dlopen();
  qword_1E96E6978 = result;
  return result;
}

__CFString *sub_1A6EDB278(int a1)
{
  CFPropertyListRef v1 = @"MGS_SIM_NULL_STATUS";
  if (a1 == 2) {
    CFPropertyListRef v1 = @"MGS_SIM_TRAY_STATUS";
  }
  if (a1 == 1) {
    CFPropertyListRef v2 = @"MGS_SIM_STATUS";
  }
  else {
    CFPropertyListRef v2 = v1;
  }
  CFRetain(v2);
  return v2;
}

os_log_t sub_1A6EDB2C8()
{
  os_log_t result = os_log_create("com.apple.BiometricKit", "Library-MesaFactory");
  qword_1E96E6990 = (uint64_t)result;
  if (!result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_1A6EDBF34(&v1);
      os_log_t result = v1;
    }
    else
    {
      os_log_t result = 0;
    }
  }
  qword_1E96E6998 = (uint64_t)result;
  return result;
}

uint64_t sub_1A6EDB334(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, void *a7)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  size_t v7 = a5 + 8;
  BOOL v8 = a5 >= 0xFFFFFFFFFFFFFFF8;
  if (a5 >= 0xFFFFFFFFFFFFFFF8)
  {
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    if (qword_1E96E6990) {
      uint64_t v20 = qword_1E96E6990;
    }
    else {
      uint64_t v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int16 v22 = 136316162;
      *(void *)&v22[4] = "err == 0 ";
      __int16 v23 = 2048;
      BOOL v24 = v8;
      __int16 v25 = 2080;
      uint64_t v26 = "";
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v29 = 1024;
      int v30 = 66;
      _os_log_impl(&dword_1A6ED5000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
    }
    return 1;
  }
  else
  {
    uint64_t v16 = malloc_type_malloc(a5 + 8, 0x5F22DC4FuLL);
    if (v16)
    {
      uint64_t v17 = v16;
      _WORD *v16 = 19778;
      v16[1] = a2;
      v16[2] = 1;
      v16[3] = a3;
      if (a5) {
        memmove(v16 + 4, a4, a5);
      }
      if (a7)
      {
        *(void *)__int16 v22 = *a7;
        uint64_t v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
        *a7 = *(void *)v22;
      }
      else
      {
        *(void *)__int16 v22 = 0;
        uint64_t v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
      }
      free(v17);
    }
    else
    {
      if (qword_1E96E6950 != -1) {
        dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
      }
      if (qword_1E96E6990) {
        uint64_t v21 = qword_1E96E6990;
      }
      else {
        uint64_t v21 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int16 v22 = 136316162;
        *(void *)&v22[4] = "cmd";
        __int16 v23 = 2048;
        BOOL v24 = 0;
        __int16 v25 = 2080;
        uint64_t v26 = "";
        __int16 v27 = 2080;
        uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        __int16 v29 = 1024;
        int v30 = 69;
        _os_log_impl(&dword_1A6ED5000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
      }
      return 12;
    }
  }
  return v18;
}

uint64_t sub_1A6EDB620()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v0 = sub_1A6EDB334(dword_1E96E69A4, 2, 1, 0, 0, 0, 0);
  uint64_t v1 = v0;
  if (v0)
  {
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    if (qword_1E96E6990) {
      CFTypeID v3 = qword_1E96E6990;
    }
    else {
      CFTypeID v3 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136316162;
      uint64_t v5 = "err == 0 ";
      __int16 v6 = 2048;
      uint64_t v7 = v1;
      __int16 v8 = 2080;
      uint64_t v9 = "";
      __int16 v10 = 2080;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v12 = 1024;
      int v13 = 97;
      _os_log_impl(&dword_1A6ED5000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
  return v1;
}

uint64_t sub_1A6EDB770()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = 0;
  uint64_t v5 = 4;
  int v0 = sub_1A6EDB334(dword_1E96E69A4, 16, 0, 0, 0, &v6, &v5);
  if (v0)
  {
    int v2 = v0;
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    if (qword_1E96E6990) {
      CFTypeID v3 = qword_1E96E6990;
    }
    else {
      CFTypeID v3 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136316162;
      __int16 v8 = "err == 0 ";
      __int16 v9 = 2048;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      __int16 v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v15 = 1024;
      int v16 = 116;
      _os_log_impl(&dword_1A6ED5000, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v5 != 4)
  {
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    if (qword_1E96E6990) {
      int v4 = qword_1E96E6990;
    }
    else {
      int v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136316162;
      __int16 v8 = "size == sizeof(state)";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      __int16 v12 = "";
      __int16 v13 = 2080;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v15 = 1024;
      int v16 = 117;
      _os_log_impl(&dword_1A6ED5000, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 0;
  }
  return v6;
}

uint64_t sub_1A6EDB9B0()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (dword_1E96E69A4) {
    goto LABEL_5;
  }
  mach_port_t v0 = *MEMORY[0x1E4F2EF00];
  CFDictionaryRef v1 = IOServiceMatching("AppleBiometricServices");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    uint64_t v4 = IOServiceOpen(MatchingService, *MEMORY[0x1E4F14960], 0, &dword_1E96E69A4);
    if (!v4)
    {
      IOObjectRelease(v3);
LABEL_5:
      if (!sub_1A6EDB770()) {
        sub_1A6EDB620();
      }
      return 0;
    }
    uint64_t v5 = v4;
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    if (qword_1E96E6990) {
      uint64_t v7 = qword_1E96E6990;
    }
    else {
      uint64_t v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      __int16 v9 = "err == 0 ";
      __int16 v10 = 2048;
      uint64_t v11 = (int)v5;
      __int16 v12 = 2080;
      __int16 v13 = "";
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v16 = 1024;
      int v17 = 137;
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    uint64_t v5 = 3758097084;
    if (qword_1E96E6990) {
      uint64_t v7 = qword_1E96E6990;
    }
    else {
      uint64_t v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      __int16 v9 = "service";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      __int16 v13 = "";
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      __int16 v16 = 1024;
      int v17 = 134;
LABEL_23:
      _os_log_impl(&dword_1A6ED5000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v8, 0x30u);
    }
  }
  return v5;
}

uint64_t sub_1A6EDBC10(int *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (qword_1E96E6950 != -1) {
    dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
  }
  int v2 = MEMORY[0x1E4F14500];
  if (qword_1E96E6998) {
    io_object_t v3 = qword_1E96E6998;
  }
  else {
    io_object_t v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    *(void *)__int16 v14 = a1;
    _os_log_impl(&dword_1A6ED5000, v3, OS_LOG_TYPE_DEFAULT, "getSensorProvisioningState %p\n", (uint8_t *)&v13, 0xCu);
  }
  if (a1)
  {
    if (byte_1E96E69A9)
    {
      uint64_t v4 = 0;
      *a1 = dword_1E96E6948;
    }
    else
    {
      uint64_t v4 = sub_1A6EDB9B0();
      if (v4)
      {
        if (qword_1E96E6950 != -1) {
          dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
        }
        if (qword_1E96E6990) {
          __int16 v12 = qword_1E96E6990;
        }
        else {
          __int16 v12 = v2;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = 136316162;
          *(void *)__int16 v14 = "err == 0 ";
          *(_WORD *)&v14[8] = 2048;
          uint64_t v15 = (int)v4;
          __int16 v16 = 2080;
          int v17 = "";
          __int16 v18 = 2080;
          uint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
          __int16 v20 = 1024;
          int v21 = 404;
          _os_log_impl(&dword_1A6ED5000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
        }
      }
      else
      {
        *a1 = sub_1A6EDB770();
      }
    }
  }
  else
  {
    uint64_t v4 = 3758097090;
  }
  if (dword_1E96E69A4)
  {
    IOServiceClose(dword_1E96E69A4);
    dword_1E96E69A4 = 0;
  }
  if (v4)
  {
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    if (qword_1E96E6998) {
      uint64_t v5 = qword_1E96E6998;
    }
    else {
      uint64_t v5 = v2;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (a1) {
        int v6 = *a1;
      }
      else {
        int v6 = -1;
      }
      int v13 = 67109376;
      *(_DWORD *)__int16 v14 = v4;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v6;
      __int16 v9 = v5;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_36:
      _os_log_impl(&dword_1A6ED5000, v9, v10, "getSensorProvisioningState -> %{errno}d %d\n", (uint8_t *)&v13, 0xEu);
    }
  }
  else
  {
    if (qword_1E96E6950 != -1) {
      dispatch_once(&qword_1E96E6950, &unk_1EFC37110);
    }
    if (qword_1E96E6998) {
      uint64_t v7 = qword_1E96E6998;
    }
    else {
      uint64_t v7 = v2;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (a1) {
        int v8 = *a1;
      }
      else {
        int v8 = -1;
      }
      int v13 = 67109376;
      *(_DWORD *)__int16 v14 = 0;
      *(_WORD *)&v14[4] = 1024;
      *(_DWORD *)&v14[6] = v8;
      __int16 v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_36;
    }
  }
  return v4;
}

void sub_1A6EDBF34(void *a1)
{
  *(_WORD *)int v2 = 0;
  _os_log_error_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-MesaFactory'!\n", v2, 2u);
  *a1 = qword_1E96E6990;
}

void sub_1A6EDBF94(int a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109378;
  v1[1] = a1;
  __int16 v2 = 2080;
  uint64_t v3 = xpc_strerror();
  _os_log_error_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v1, 0x12u);
}

void sub_1A6EDC030(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = rindex("/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m", 47);
  if (v4) {
    os_log_type_t v10 = v4 + 1;
  }
  else {
    os_log_type_t v10 = "/Library/Caches/com.apple.xbs/Sources/MobileGestaltSupport/MobileGestaltExtensions/MobileGestaltSupport.m";
  }
  uint64_t v11 = off_1E5CB25F8[2 * a1 + 1];
  sub_1A6ED7C4C((uint64_t)v10, 330, @"%s missing from %s\n", v5, v6, v7, v8, v9, (char)v11);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v13 = v11;
    __int16 v14 = 2080;
    uint64_t v15 = a2;
    _os_log_impl(&dword_1A6ED5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s missing from %s\n", buf, 0x16u);
  }
  __assert_rtn("_MGSLoadSymbol", "MobileGestaltSupport.m", 331, "0");
}

void sub_1A6EDC118(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler:a2, a3, a4, a5];
  uint64_t v10 = [NSString stringWithUTF8String:(uint64_t)"void *CrashReporterSupportLibrary(void)"];
  [objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v6, v11, v10, @"MobileGestaltSupport.m", 32, @"%s", *a1)];
  __break(1u);
}

void sub_1A6EDC180(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler:a2, a3, a4, a5];
  uint64_t v9 = [NSString stringWithUTF8String:((uint64_t)"Class getOTATaskingAgentClientClass(void)_block_invoke")];
  [v5 handleFailureInFunction:v10 file:v9 lineNumber:33 description:[[NSString alloc] initWithFormat:@"Unable to find class %s", @"OTATaskingAgentClient"]];
  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86D8](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateComputerName(CFAllocatorRef allocator)
{
  return (CFStringRef)MEMORY[0x1F4101DC8](allocator);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x1F4101FF8](allocator, name, prefsID);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x1F4102030](prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return MEMORY[0x1F4102040](prefs, queue);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MGClearInProcessCache()
{
  return MEMORY[0x1F417CF08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CDD88](a1, *(void *)&a2);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}