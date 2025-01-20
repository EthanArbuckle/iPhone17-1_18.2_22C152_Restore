void sub_22D3C6CE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2649A8198, MEMORY[0x263F8C060]);
}

void sub_22D3C70D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t OSLogCopyFormattedString(uint64_t a1, void *a2, uint64_t a3)
{
  v3 = OSLogCopyFormattedStringImpl(a1, a2, a3);
  uint64_t v4 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v3];

  return v4;
}

__CFString *OSLogCopyFormattedStringImpl(uint64_t a1, void *a2, uint64_t a3)
{
  v21[4] = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x230F7DCD0]();
  if (OSLogCopyFormattedStringImpl_onceToken != -1) {
    dispatch_once(&OSLogCopyFormattedStringImpl_onceToken, &__block_literal_global);
  }
  uint64_t v7 = [(id)OSLogCopyFormattedStringImpl_sFormatter JSONObjectWithType:a1 value:a2 info:a3];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_6;
  }
  v9 = (__CFString *)stringWithJSONObject((uint64_t)v7, &v19);
  if (!v9)
  {
    uint64_t v7 = v19;
LABEL_6:
    v21[0] = @"decode failure";
    v20[0] = @"type";
    v20[1] = @"error";
    uint64_t v10 = [v7 description];
    if (v10) {
      v11 = (__CFString *)v10;
    }
    else {
      v11 = @"nil";
    }
    v21[1] = v11;
    v20[2] = @"fake JSON";
    uint64_t v12 = [v8 description];
    if (v12) {
      v13 = (__CFString *)v12;
    }
    else {
      v13 = @"nil";
    }
    v21[2] = v13;
    v20[3] = @"raw value";
    uint64_t v14 = [a2 description];
    if (v14) {
      v15 = (__CFString *)v14;
    }
    else {
      v15 = @"nil";
    }
    v21[3] = v15;
    v9 = (__CFString *)stringWithJSONObject([NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4], &v19);
  }
  v16 = @"{\"error\":\"complete decode failure\"}";
  if (v9) {
    v16 = v9;
  }
  v17 = v16;
  return v17;
}

__CFString *OSStateCreateStringWithData(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v7 = 1;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:a2 freeWhenDone:0];
  size_t v5 = OSLogCopyFormattedStringImpl(a1, v4, (uint64_t)&v7);

  return v5;
}

CLLogFormatter *__OSLogCopyFormattedStringImpl_block_invoke()
{
  result = objc_alloc_init(CLLogFormatter);
  OSLogCopyFormattedStringImpl_sFormatter = (uint64_t)result;
  return result;
}

id stringWithJSONObject(uint64_t a1, void *a2)
{
  if (a2) {
    *a2 = 0;
  }
  uint64_t v5 = 0;
  uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:a1 options:4 error:&v5];
  if (v3) {
    return (id)[[NSString alloc] initWithData:v3 encoding:4];
  }
  id result = 0;
  if (a2) {
    *a2 = v5;
  }
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}