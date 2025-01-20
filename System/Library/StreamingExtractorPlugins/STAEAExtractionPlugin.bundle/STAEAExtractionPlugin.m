id sub_1E84(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15;
  id v16;
  __CFString *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  CFStringRef v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  CFStringRef v41;
  uint64_t vars8;

  v15 = a1;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = +[NSString stringWithFormat:@"[%s:%d][%s] %@", a7, a8, a6, v16];
  v20 = sub_20C0();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v25 = &stru_8300;
    *(_DWORD *)buf = 136448002;
    v27 = "STCreateErrorWithInfo";
    v28 = 2080;
    if (v17) {
      v25 = v17;
    }
    v29 = a7;
    v30 = 1024;
    v31 = a8;
    v32 = 2080;
    v33 = a6;
    v34 = 2112;
    v35 = v15;
    v36 = 2048;
    v37 = a2;
    v38 = 2112;
    v39 = v16;
    v40 = 2112;
    v41 = v25;
    _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}s: Error [%s:%d][%s]: %@ - %ld - %@ %@\n", buf, 0x4Eu);
  }

  if (v18)
  {
    v21 = [v18 mutableCopy];
  }
  else
  {
    v21 = +[NSMutableDictionary dictionaryWithCapacity:2];
  }
  v22 = v21;
  [v21 setObject:v19 forKey:NSDebugDescriptionErrorKey];
  if (v17) {
    [v22 setObject:v17 forKey:NSUnderlyingErrorKey];
  }
  v23 = +[NSError errorWithDomain:v15 code:a2 userInfo:v22];

  return v23;
}

id sub_20AC(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_1E84(a1, a2, a3, a4, 0, a5, a6, a7);
}

id sub_20C0()
{
  if (qword_CA90 != -1) {
    dispatch_once(&qword_CA90, &stru_8228);
  }
  v0 = off_C9C0;

  return v0;
}

void sub_2114(id a1)
{
  v1 = STGetLoggingCategory();
  off_C9C0 = os_log_create("com.apple.StreamingExtractor", v1);

  _objc_release_x1();
}

id sub_2158()
{
  if (qword_CA98 != -1) {
    dispatch_once(&qword_CA98, &stru_8248);
  }
  v0 = off_C9C8;

  return v0;
}

void sub_21AC(id a1)
{
  v1 = STGetLoggingCategory();
  off_C9C8 = os_log_create("com.apple.StreamingExtractor.signposts", v1);

  _objc_release_x1();
}

id STCreateAEAError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  uint64_t v8 = AAThreadErrorContextLeave();
  uint64_t v9 = (int)v8;
  v10 = +[NSString stringWithFormat:@"aaError: 0x%x - %@", v8, v7];

  v11 = sub_20AC(@"AAError", v9, v10, 0, a2, a3, a4);

  return v11;
}

const char *STGetLoggingCategory()
{
  return "STAEAExtractorPlugin";
}

id STAEAProgressCallback(id result)
{
  if (result) {
    return objc_msgSend(result, "extractionProgress:");
  }
  return result;
}

id STAEAEntryMessageCallback(id result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result) {
    return [result processEntryMessage:a2 path:a3 data:a4];
  }
  return result;
}

uint64_t sub_371C(void *a1, uint64_t a2)
{
  if (a1)
  {
    return (uint64_t)[a1 aeaContextCallback:a2];
  }
  else
  {
    v3 = sub_20C0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_55F0();
    }

    return 0xFFFFFFFFLL;
  }
}

void sub_3B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3B40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3B50(uint64_t a1)
{
}

void sub_3B58(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = sub_20C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = *(void *)(v9 + 32);
    unint64_t v11 = *(void *)(v9 + 16);
    *(_DWORD *)buf = 138413058;
    uint64_t v25 = v10;
    __int16 v26 = 2082;
    v27 = "-[STAEAExtractor supplyBytes:withCompletionBlock:]_block_invoke";
    __int16 v28 = 2048;
    uint64_t v29 = a4;
    __int16 v30 = 2048;
    unint64_t v31 = v11;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%@] %{public}s: Extracting %zu bytes, offset %lld", buf, 0x2Au);
  }

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    unint64_t v12 = 0;
    uint64_t v13 = (id *)(a1 + 4);
    while (1)
    {
      if (v12 >= a1[7]) {
        goto LABEL_20;
      }
      uint64_t v14 = AAAssetExtractorWrite();
      uint64_t v15 = v14;
      if (v14 < 0) {
        break;
      }
      if (!v14)
      {
        v23 = sub_20C0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_5858();
        }

        [*v13 setIsComplete:1];
LABEL_19:
        *a5 = 1;
        goto LABEL_20;
      }
      v12 += v14;
      v16 = sub_20C0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *((void *)*v13 + 4);
        *(_DWORD *)buf = 138413314;
        uint64_t v25 = v17;
        __int16 v26 = 2082;
        v27 = "-[STAEAExtractor supplyBytes:withCompletionBlock:]_block_invoke";
        __int16 v28 = 2048;
        uint64_t v29 = v15;
        __int16 v30 = 2048;
        unint64_t v31 = v12;
        __int16 v32 = 2048;
        uint64_t v33 = a4;
        _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "[%@] %{public}s: AAAssetExtractorWrite wrote %ld bytes which brings it to %zu out of %zu", buf, 0x34u);
      }

      if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
        goto LABEL_20;
      }
    }
    v18 = sub_20C0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_57DC();
    }

    v19 = +[NSString stringWithFormat:@"AAAssetExtractorWrite returned %ld", v15];
    uint64_t v20 = STCreateAEAError(v19, (uint64_t)"-[STAEAExtractor supplyBytes:withCompletionBlock:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/AEAExtractionPlugin/STAEAExtractorPlugin.m", 393);
    uint64_t v21 = *(void *)(a1[5] + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    goto LABEL_19;
  }
  unint64_t v12 = 0;
LABEL_20:
  *(void *)(a1[4] + 16) += v12;
}

void sub_4728(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void sub_4764(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_4784(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_47CC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_47D8()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_487C()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4920()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_49C4()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4A68()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4B0C()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4BB0()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4C54()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4CF8()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4D9C()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4E40()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4EE4()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_4F88()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_502C()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_50D0()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_5174()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_5218()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_52BC()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_5360()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_5404()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_54A8()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_554C()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_55F0()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_5694()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_5738()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_57DC()
{
  sub_4750();
  sub_47A4();
  sub_4764(&dword_0, v0, v1, "[%@] %{public}s: AAAssetExtractorWrite returned %ld");
}

void sub_5858()
{
  sub_4750();
  sub_47A4();
  sub_4764(&dword_0, v0, v1, "[%@] %{public}s: AAAssetExtractor indicated the stream is complete, but there are %ld more bytes to write");
}

void sub_58D4()
{
  sub_47CC(__stack_chk_guard);
  sub_4750();
  uint64_t v2 = "-[STAEAExtractor suspendStreamWithCompletionBlock:]";
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "[%@] %{public}s: No extractor to suspend", v1, 0x16u);
}

void sub_5954()
{
  sub_46FC();
  sub_4744();
  sub_4714();
  sub_4728(&dword_0, v0, v1, "%{public}s: %s: AssertMacros: %s, %s file: %s, line: %d\n", v2, v3, v4, v5, 2u);
}

void sub_59F8()
{
  sub_47CC(__stack_chk_guard);
  sub_4750();
  sub_47B8();
  sub_4784(&dword_0, v0, v1, "[%@] %{public}s: AAAssetExtractorDestroy returned %d ");
}

void sub_5A6C()
{
  sub_47CC(__stack_chk_guard);
  sub_4750();
  sub_47B8();
  sub_4784(&dword_0, v0, v1, "[%@] %{public}s: AAAssetExtractorDestroy returned %d");
}

void sub_5AE0()
{
  sub_47CC(__stack_chk_guard);
  sub_4750();
  sub_4764(&dword_0, v0, v1, "[%@] %{public}s: Terminating extraction (%@)");
}

uint64_t AAAssetExtractorCreate()
{
  return _AAAssetExtractorCreate();
}

uint64_t AAAssetExtractorDestroy()
{
  return _AAAssetExtractorDestroy();
}

uint64_t AAAssetExtractorSetParameterCallback()
{
  return _AAAssetExtractorSetParameterCallback();
}

uint64_t AAAssetExtractorSetParameterPtr()
{
  return _AAAssetExtractorSetParameterPtr();
}

uint64_t AAAssetExtractorWrite()
{
  return _AAAssetExtractorWrite();
}

uint64_t AAThreadErrorContextEnter()
{
  return _AAThreadErrorContextEnter();
}

uint64_t AAThreadErrorContextLeave()
{
  return _AAThreadErrorContextLeave();
}

int AEAContextGetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, size_t buf_capacity, uint8_t *buf, size_t *buf_size)
{
  return _AEAContextGetFieldBlob(context, field, representation, buf_capacity, buf, buf_size);
}

uint64_t AEAContextGetFieldUInt(AEAContext context, AEAContextField field)
{
  return _AEAContextGetFieldUInt(context, field);
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return _AEAContextSetFieldBlob(context, field, representation, buf, buf_size);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_archiveID(void *a1, const char *a2, ...)
{
  return [a1 archiveID];
}

id objc_msgSend_asymmetricDecryptionKey(void *a1, const char *a2, ...)
{
  return [a1 asymmetricDecryptionKey];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return [a1 isComplete];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_sandboxToken(void *a1, const char *a2, ...)
{
  return [a1 sandboxToken];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_signingPublicKey(void *a1, const char *a2, ...)
{
  return [a1 signingPublicKey];
}

id objc_msgSend_sourceDirectory(void *a1, const char *a2, ...)
{
  return [a1 sourceDirectory];
}

id objc_msgSend_sourceDirectorySandboxExtension(void *a1, const char *a2, ...)
{
  return [a1 sourceDirectorySandboxExtension];
}

id objc_msgSend_symmetricDecryptionKey(void *a1, const char *a2, ...)
{
  return [a1 symmetricDecryptionKey];
}