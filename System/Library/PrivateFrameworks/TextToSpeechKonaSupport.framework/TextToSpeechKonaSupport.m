void sub_1D72251C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D72252EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D72254AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1D72257D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1D72259D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7225B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7225E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D722605C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D7226140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  v11 = v10;

  objc_sync_exit(v9);
  a9.super_class = (Class)AXKonaSpeechEngine;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1D72265C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D72269BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t globalEciCallback(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 eciCallback:a2 iParam:a3 instanceData:a4];
}

uint64_t GlobalKlattConstHook(uint64_t a1, void *a2)
{
  return [a2 klattConstantHook:a1];
}

uint64_t GlobalKlattDynamicHook(KlattFrame *a1, void *a2)
{
  return [a2 klattDynamicHook:a1];
}

void sub_1D7226FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,void *a43,void *a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,id a54,char a55)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);

  _Unwind_Resume(a1);
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

void sub_1D72273E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7227610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7227830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7227AE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D7227CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  objc_sync_exit(v20);

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1D7227DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1D7227F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17)
{
  v19 = v18;
  objc_sync_exit(v19);

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1D7228008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D72280AC(_Unwind_Exception *a1)
{
  v3 = v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D722819C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7228218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D722844C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D72284DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D72285FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D7228940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7228B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D7228BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D7228C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D7228CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D7228D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D7229A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  _Unwind_Resume(a1);
}

void sub_1D7229F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1D722A3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D722A9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void _GLOBAL__sub_I_AXKonaSpeechEngine_mm()
{
  v12[14] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1D946AF20]();
  uint64_t v1 = *MEMORY[0x1E4F386F0];
  v11[0] = @"en-US";
  v11[1] = @"en-GB";
  v12[0] = v1;
  v12[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F38770];
  v11[2] = @"es-ES";
  v11[3] = @"es-MX";
  v12[2] = v2;
  v12[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F38700];
  v11[4] = @"fr-FR";
  v11[5] = @"fr-CA";
  v12[4] = v3;
  v12[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F38708];
  v11[6] = @"de-DE";
  v11[7] = @"it-IT";
  uint64_t v5 = *MEMORY[0x1E4F38718];
  v12[6] = v4;
  v12[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F38748];
  v11[8] = @"pt-BR";
  v11[9] = @"fi-FI";
  uint64_t v7 = *MEMORY[0x1E4F386F8];
  v12[8] = v6;
  v12[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F38720];
  v11[10] = @"ja-JP";
  v11[11] = @"ko-KR";
  uint64_t v9 = *MEMORY[0x1E4F38728];
  v12[10] = v8;
  v12[11] = v9;
  uint64_t v10 = *MEMORY[0x1E4F38768];
  v11[12] = @"zh-CN";
  v11[13] = @"zh-TW";
  v12[12] = v10;
  v12[13] = v10;
  kKonaLangToNLLang = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:14];
}

uint64_t AXTTSLogKona()
{
  return MEMORY[0x1F41062E8]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1F4106310]();
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t eciActivateDict2()
{
  return MEMORY[0x1F4163FF0]();
}

uint64_t eciAddText2()
{
  return MEMORY[0x1F4163FF8]();
}

uint64_t eciDelete2()
{
  return MEMORY[0x1F4164000]();
}

uint64_t eciDeleteDict2()
{
  return MEMORY[0x1F4164008]();
}

uint64_t eciInsertIndex2()
{
  return MEMORY[0x1F4164010]();
}

uint64_t eciLoadDictVolume2()
{
  return MEMORY[0x1F4164018]();
}

uint64_t eciNew2()
{
  return MEMORY[0x1F4164020]();
}

uint64_t eciNewDict2()
{
  return MEMORY[0x1F4164028]();
}

uint64_t eciRegisterCallback2()
{
  return MEMORY[0x1F4164030]();
}

uint64_t eciRegisterKlattHooks2()
{
  return MEMORY[0x1F4164038]();
}

uint64_t eciRegisterSampleBuffer2()
{
  return MEMORY[0x1F4164040]();
}

uint64_t eciSetIniContent()
{
  return MEMORY[0x1F4164048]();
}

uint64_t eciSetParam2()
{
  return MEMORY[0x1F4164050]();
}

uint64_t eciSetStandardVoice2()
{
  return MEMORY[0x1F4164058]();
}

uint64_t eciSynchronize2()
{
  return MEMORY[0x1F4164060]();
}

uint64_t eciSynthesize2()
{
  return MEMORY[0x1F4164068]();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}