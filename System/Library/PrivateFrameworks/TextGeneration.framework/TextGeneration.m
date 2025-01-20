const char *_nlpLoggingSubsystem()
{
  return "com.apple.TextGeneration";
}

uint64_t _nlpDefaultLog()
{
  if (_nlpDefaultLog::token != -1) {
    dispatch_once(&_nlpDefaultLog::token, &__block_literal_global);
  }
  return _nlpDefaultLog::log;
}

os_log_t ___nlpDefaultLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.TextGeneration", "TextGenerationDefaultLog");
  _nlpDefaultLog::log = (uint64_t)result;
  return result;
}

uint64_t _nlpSignpostLog()
{
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  return _nlpSignpostLog::log;
}

os_log_t ___nlpSignpostLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.TextGeneration", "TextGenerationSignposts");
  _nlpSignpostLog::log = (uint64_t)result;
  return result;
}

uint64_t TGTextGenerationEqualAllowingNil(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else if (v3)
  {
    uint64_t v6 = [v4 isEqual:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_25EB641EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTGITextGenerationInferenceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!TextGenerationInferenceLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __TextGenerationInferenceLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_265534018;
    uint64_t v6 = 0;
    TextGenerationInferenceLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!TextGenerationInferenceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("TGITextGenerationInference");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getTGITextGenerationInferenceClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getTGITextGenerationInferenceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __TextGenerationInferenceLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TextGenerationInferenceLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_25EB6686C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  v17 = v16;

  _Unwind_Resume(a1);
}

void sub_25EB66A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25EB66B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25EB66BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25EB66D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25EB66E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25EB66F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25EB67144(_Unwind_Exception *a1)
{
  TGITextGenerationInferenceModelConfiguration::~TGITextGenerationInferenceModelConfiguration(v1);
  _Unwind_Resume(a1);
}

void TGITextGenerationInferenceModelConfiguration::~TGITextGenerationInferenceModelConfiguration(TGITextGenerationInferenceModelConfiguration *this)
{
  if (*((char *)&this[1].var0.var0.var0.var0.var1 + 23) < 0) {
    operator delete(this[1].var0.var0.var0.var0.var1.var0);
  }
  if (SHIBYTE(this->var0.var0.var1.var0[2]) < 0) {
    operator delete((void *)this->var0.var0.var1.var0[0]);
  }
  if (*((char *)&this->var0.var0.var0.var0.var1 + 23) < 0) {
    operator delete(this->var0.var0.var0.var0.var1.var0);
  }
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  std::string::size_type v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __getTGITextGenerationInferenceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[TGTextGenerationResource createWithResourceDict:](v0);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void free(void *a1)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}