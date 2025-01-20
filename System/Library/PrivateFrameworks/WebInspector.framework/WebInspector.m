void traceMessagePayloadIfKeyExists(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v4 = RWIMessageTraceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [a2 objectForKeyedSubscript:@"__argument"];
    if (v5)
    {
      v6 = (void *)v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v6 objectForKeyedSubscript:a1];
        if (v7)
        {
          v8 = v7;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
            v10 = RWIMessageTraceLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              traceMessagePayloadIfKeyExists_cold_1((uint64_t)v9, v10);
            }
          }
        }
      }
    }
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_226FA3A48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FA3B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FA3C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FA3D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_226FA3DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_RWITCPConnection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_226FA3FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FA4278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_226FA4450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FA4758(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_226FA48F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FA49B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v11 = v10;

  _Unwind_Resume(a1);
}

char *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (!a2) {
    return (char *)a1;
  }
  size_t v3 = a2;
  result = std::vector<unsigned char>::__vallocate[abi:sn180100](a1, a2);
  v5 = (unsigned char *)a1[1];
  v6 = &v5[v3];
  while (v5)
  {
    *v5++ = 0;
    if (!--v3)
    {
      a1[1] = v6;
      return (char *)a1;
    }
  }
  __break(1u);
  return result;
}

char *std::vector<unsigned char>::__vallocate[abi:sn180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    abort();
  }
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2082;
  *(void *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL auditTokenHasEntitlement(_OWORD *a1, void *a2)
{
  size_t v3 = a2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  long long v5 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  v7 = v6;
  if (v6)
  {
    CFErrorRef error = 0;
    CFBooleanRef v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, v3, &error);
    CFBooleanRef v9 = v8;
    if (error)
    {
      NSLog(&cfstr_UnableToGetEnt.isa, v3, error);
      CFRelease(error);
      BOOL v10 = 0;
      if (!v9) {
        goto LABEL_12;
      }
    }
    else
    {
      if (!v8)
      {
        BOOL v10 = 0;
LABEL_12:
        CFRelease(v7);
        goto LABEL_13;
      }
      CFTypeID v11 = CFGetTypeID(v8);
      BOOL v10 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
    }
    CFRelease(v9);
    goto LABEL_12;
  }
  NSLog(&cfstr_UnableToCreate.isa, v3);
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

void sub_226FA5A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t RWIAutomationAvailabilityFromString(void *a1, uint64_t *a2)
{
  id v3 = a1;
  if ([v3 isEqualToString:@"WIRAutomationAvailabilityNotAvailable"])
  {
    uint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"WIRAutomationAvailabilityAvailable"])
  {
    uint64_t v4 = 1;
  }
  else
  {
    if (![v3 isEqualToString:@"WIRAutomationAvailabilityUnknown"])
    {
      uint64_t v5 = 0;
      goto LABEL_8;
    }
    uint64_t v4 = 2;
  }
  *a2 = v4;
  uint64_t v5 = 1;
LABEL_8:

  return v5;
}

__CFString *RWINSStringFromAutomationAvailability(uint64_t a1)
{
  v1 = @"WIRAutomationAvailabilityNotAvailable";
  if (a1 == 1) {
    v1 = @"WIRAutomationAvailabilityAvailable";
  }
  if (a1 == 2) {
    return @"WIRAutomationAvailabilityUnknown";
  }
  else {
    return v1;
  }
}

__CFString *NSStringFromRWIDebuggerAvailability(uint64_t a1)
{
  v1 = @"Not Debuggable";
  if (a1 == 1) {
    v1 = @"Debuggable (Not Visible)";
  }
  if (a1 == 2) {
    return @"Debuggable (Visible)";
  }
  else {
    return v1;
  }
}

void sub_226FA6980(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

id RWIDefaultLog()
{
  if (RWIDefaultLog_onceToken != -1) {
    dispatch_once(&RWIDefaultLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)RWIDefaultLog_defaultLog;
  return v0;
}

void __RWIDefaultLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebInspector", "default");
  v1 = (void *)RWIDefaultLog_defaultLog;
  RWIDefaultLog_defaultLog = (uint64_t)v0;
}

id RWIMessageTraceLog()
{
  if (RWIMessageTraceLog_onceToken != -1) {
    dispatch_once(&RWIMessageTraceLog_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)RWIMessageTraceLog_messageTraceLog;
  return v0;
}

void __RWIMessageTraceLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebInspector", "message-trace");
  v1 = (void *)RWIMessageTraceLog_messageTraceLog;
  RWIMessageTraceLog_messageTraceLog = (uint64_t)v0;
}

id RWIMessageDumpStateLog()
{
  if (RWIMessageDumpStateLog_onceToken != -1) {
    dispatch_once(&RWIMessageDumpStateLog_onceToken, &__block_literal_global_10);
  }
  os_log_t v0 = (void *)RWIMessageDumpStateLog_dumpStateLog;
  return v0;
}

void __RWIMessageDumpStateLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.WebInspector", "dump-state");
  v1 = (void *)RWIMessageDumpStateLog_dumpStateLog;
  RWIMessageDumpStateLog_dumpStateLog = (uint64_t)v0;
}

uint64_t Inspector::toJSONObjectArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!this) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"array" format];
  }
  uint64_t v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v20 objects:v24 count:16];
  uint64_t v7 = result;
  if (result)
  {
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(this);
        }
        CFTypeID v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x263EFF940] raise:v9, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v5), v11 format];
        }
        uint64_t v12 = *a2;
        if (v11)
        {
          [v11 toJSONObject];
          CFTypeID v11 = v19;
        }
        v13 = (void *)(v12 + 16);
        unint64_t v14 = *(unsigned int *)(v12 + 28);
        if (v14 == *(_DWORD *)(v12 + 24))
        {
          unint64_t v15 = v14 + (v14 >> 2);
          if (v15 >= 0x10) {
            unint64_t v16 = v15 + 1;
          }
          else {
            unint64_t v16 = 16;
          }
          if (v16 <= v14 + 1) {
            unint64_t v17 = v14 + 1;
          }
          else {
            unint64_t v17 = v16;
          }
          WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)v13, v17);
          unint64_t v14 = *(unsigned int *)(v12 + 28);
          v18 = (void *)(*(void *)(v12 + 16) + 8 * v14);
        }
        else
        {
          v18 = (void *)(*v13 + 8 * v14);
        }
        void *v18 = v11;
        *(_DWORD *)(v12 + 28) = v14 + 1;
        v19 = 0;
        ++v10;
      }
      while (v7 != v10);
      uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v20 objects:v24 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_226FA6E1C(_Unwind_Exception *a1)
{
  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

_DWORD **WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(_DWORD **a1)
{
  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*v2 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v2;
    }
  }
  return a1;
}

uint64_t Inspector::toJSONStringArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!this) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"array" format];
  }
  uint64_t v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v22 objects:v27 count:16];
  uint64_t v7 = result;
  if (result)
  {
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(this);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x263EFF940] raise:v9, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v5), v11 format];
        }
        uint64_t v12 = *a2;
        MEMORY[0x22A6705C0](&v21, v11);
        WTF::JSONImpl::Value::create((uint64_t *)&v26, (WTF::JSONImpl::Value *)&v21, v13);
        unint64_t v14 = (uint64_t *)(v12 + 16);
        uint64_t v15 = *(unsigned int *)(v12 + 28);
        if (v15 == *(_DWORD *)(v12 + 24))
        {
          unint64_t v16 = (uint64_t *)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)v14, v15 + 1, (unint64_t)&v26);
          uint64_t v15 = *(unsigned int *)(v12 + 28);
          uint64_t v17 = *(void *)(v12 + 16);
          uint64_t v18 = *v16;
          *unint64_t v16 = 0;
        }
        else
        {
          uint64_t v17 = *v14;
          uint64_t v18 = (uint64_t)v26;
          v26 = 0;
        }
        *(void *)(v17 + 8 * v15) = v18;
        *(_DWORD *)(v12 + 28) = v15 + 1;
        v19 = v26;
        v26 = 0;
        if (v19)
        {
          if (*v19 == 1) {
            WTF::JSONImpl::Value::operator delete();
          }
          else {
            --*v19;
          }
        }
        long long v20 = v21;
        long long v21 = 0;
        if (v20)
        {
          if (*v20 == 2) {
            WTF::StringImpl::destroy();
          }
          else {
            *v20 -= 2;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v22 objects:v27 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_226FA70F8(_Unwind_Exception *a1)
{
  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::toJSONIntegerArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!this) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"array" format];
  }
  uint64_t v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v19 objects:v24 count:16];
  uint64_t v7 = result;
  if (result)
  {
    uint64_t v8 = *(void *)v20;
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(this);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x263EFF940] raise:v9, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v5), v11 format];
        }
        uint64_t v12 = *a2;
        WTF::JSONImpl::Value::create((WTF::JSONImpl::Value *)[v11 intValue]);
        v13 = (uint64_t *)(v12 + 16);
        uint64_t v14 = *(unsigned int *)(v12 + 28);
        if (v14 == *(_DWORD *)(v12 + 24))
        {
          uint64_t v15 = (void *)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)v13, v14 + 1, (unint64_t)&v23);
          uint64_t v14 = *(unsigned int *)(v12 + 28);
          uint64_t v16 = *(void *)(v12 + 16);
          uint64_t v17 = (_DWORD *)*v15;
          *uint64_t v15 = 0;
        }
        else
        {
          uint64_t v16 = *v13;
          uint64_t v17 = v23;
          long long v23 = 0;
        }
        *(void *)(v16 + 8 * v14) = v17;
        *(_DWORD *)(v12 + 28) = v14 + 1;
        uint64_t v18 = v23;
        long long v23 = 0;
        if (v18)
        {
          if (*v18 == 1) {
            WTF::JSONImpl::Value::operator delete();
          }
          else {
            --*v18;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v19 objects:v24 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_226FA736C(_Unwind_Exception *a1)
{
  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::toJSONDoubleArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!this) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"array" format];
  }
  uint64_t v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v21 objects:v26 count:16];
  uint64_t v7 = result;
  if (result)
  {
    uint64_t v8 = *(void *)v22;
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(this);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x263EFF940] raise:v9, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v5), v11 format];
        }
        uint64_t v12 = *a2;
        v13 = (WTF::JSONImpl::Value *)[v11 doubleValue];
        WTF::JSONImpl::Value::create((uint64_t *)&v25, v13, v14);
        uint64_t v15 = (uint64_t *)(v12 + 16);
        uint64_t v16 = *(unsigned int *)(v12 + 28);
        if (v16 == *(_DWORD *)(v12 + 24))
        {
          uint64_t v17 = (uint64_t *)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)v15, v16 + 1, (unint64_t)&v25);
          uint64_t v16 = *(unsigned int *)(v12 + 28);
          uint64_t v18 = *(void *)(v12 + 16);
          uint64_t v19 = *v17;
          *uint64_t v17 = 0;
        }
        else
        {
          uint64_t v18 = *v15;
          uint64_t v19 = (uint64_t)v25;
          uint64_t v25 = 0;
        }
        *(void *)(v18 + 8 * v16) = v19;
        *(_DWORD *)(v12 + 28) = v16 + 1;
        long long v20 = v25;
        uint64_t v25 = 0;
        if (v20)
        {
          if (*v20 == 1) {
            WTF::JSONImpl::Value::operator delete();
          }
          else {
            --*v20;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_226FA75B0(_Unwind_Exception *a1)
{
  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::toJSONStringArrayArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!this) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"array" format];
  }
  uint64_t v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v22 objects:v26 count:16];
  uint64_t v7 = result;
  if (result)
  {
    uint64_t v8 = *(void *)v23;
    uint64_t v9 = *MEMORY[0x263EFF4A0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(this);
        }
        uint64_t v11 = *(Inspector **)(*((void *)&v22 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x263EFF940] raise:v9, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v5), v11 format];
        }
        uint64_t v12 = *a2;
        Inspector::toJSONStringArray(v11, (uint64_t *)&v21);
        uint64_t v13 = (uint64_t)v21;
        long long v21 = 0;
        double v14 = (void *)(v12 + 16);
        unint64_t v15 = *(unsigned int *)(v12 + 28);
        if (v15 == *(_DWORD *)(v12 + 24))
        {
          unint64_t v16 = v15 + (v15 >> 2);
          if (v16 >= 0x10) {
            unint64_t v17 = v16 + 1;
          }
          else {
            unint64_t v17 = 16;
          }
          if (v17 <= v15 + 1) {
            unint64_t v18 = v15 + 1;
          }
          else {
            unint64_t v18 = v17;
          }
          WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)v14, v18);
          unint64_t v15 = *(unsigned int *)(v12 + 28);
          uint64_t v19 = (uint64_t *)(*(void *)(v12 + 16) + 8 * v15);
        }
        else
        {
          uint64_t v19 = (uint64_t *)(*v14 + 8 * v15);
        }
        uint64_t *v19 = v13;
        *(_DWORD *)(v12 + 28) = v15 + 1;
        long long v20 = v21;
        long long v21 = 0;
        if (v20)
        {
          if (*v20 == 1) {
            WTF::JSONImpl::Value::operator delete();
          }
          else {
            --*v20;
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t result = [(Inspector *)this countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_226FA7800(_Unwind_Exception *a1)
{
  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

void *Inspector::toObjCStringArray(WTF::JSONImpl::ArrayBase **a1)
{
  if (!*a1) {
    return 0;
  }
  uint64_t v2 = *((unsigned int *)*a1 + 7);
  id v3 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v2];
  if (v2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      WTF::JSONImpl::ArrayBase::get(*a1);
      WTF::JSONImpl::Value::asString((uint64_t *)&v10, v9);
      if (v9)
      {
        if (*(_DWORD *)v9 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*(_DWORD *)v9;
        }
      }
      if (v10
        || ([MEMORY[0x263EFF940] raise:v5 format:@"array should contain objects of type 'String'"], v10))
      {
        v6 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        v6 = &stru_26DB29208;
      }
      objc_msgSend(v3, "addObject:", v6, 0);
      uint64_t v7 = v10;
      uint64_t v10 = 0;
      if (v7)
      {
        if (*v7 == 2) {
          WTF::StringImpl::destroy();
        }
        else {
          *v7 -= 2;
        }
      }
      ++v4;
    }
    while (v2 != v4);
  }
  return v3;
}

void sub_226FA799C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a9) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void *Inspector::toObjCIntegerArray(WTF::JSONImpl::ArrayBase **a1)
{
  if (!*a1) {
    return 0;
  }
  uint64_t v2 = *((unsigned int *)*a1 + 7);
  id v3 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v2];
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      WTF::JSONImpl::ArrayBase::get(*a1);
      uint64_t v5 = WTF::JSONImpl::Value::asInteger(v8);
      v6 = v8;
      uint64_t v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*(_DWORD *)v6;
        }
      }
      if ((v5 & 0xFF00000000) == 0) {
        Inspector::toObjCIntegerArray();
      }
      objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v5));
    }
  }
  return v3;
}

void sub_226FA7AC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(uint64_t result, unint64_t a2)
{
  if (*(unsigned int *)(result + 8) >= a2) {
    return 1;
  }
  int v2 = a2;
  if (!(a2 >> 29))
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void **)result;
    uint64_t v5 = *(unsigned int *)(result + 12);
    v6 = (void *)WTF::fastMalloc((WTF *)(8 * a2));
    *(_DWORD *)(v3 + 8) = v2;
    *(void *)uint64_t v3 = v6;
    memcpy(v6, v4, 8 * v5);
    if (v4)
    {
      if (*(void **)v3 == v4)
      {
        *(void *)uint64_t v3 = 0;
        *(_DWORD *)(v3 + 8) = 0;
      }
      WTF::fastFree((WTF *)v4, v7);
    }
    return 1;
  }
  __break(0xC471u);
  return result;
}

unint64_t WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v5 = *(void *)a1;
  if (*(void *)a1 > a3 || v5 + 8 * (unint64_t)*(unsigned int *)(a1 + 12) <= a3)
  {
    unint64_t v9 = *(unsigned int *)(a1 + 8) + ((unint64_t)*(unsigned int *)(a1 + 8) >> 2);
    if (v9 >= 0x10) {
      unint64_t v10 = v9 + 1;
    }
    else {
      unint64_t v10 = 16;
    }
    if (v10 > a2) {
      a2 = v10;
    }
    WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(a1, a2);
  }
  else
  {
    uint64_t v6 = a3 - v5;
    unint64_t v7 = *(unsigned int *)(a1 + 8) + ((unint64_t)*(unsigned int *)(a1 + 8) >> 2);
    if (v7 >= 0x10) {
      unint64_t v8 = v7 + 1;
    }
    else {
      unint64_t v8 = 16;
    }
    if (v8 > a2) {
      a2 = v8;
    }
    WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(a1, a2);
    return *(void *)a1 + v6;
  }
  return v3;
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::enable(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) enableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FA7D58(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FA7DF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FA7E7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::disable(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) disableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FA7FD8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FA8074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FA80FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getMatchedStylesForNode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, char *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke;
    v17[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v17[4] = a1;
    v17[5] = a2;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke_2;
    v16[3] = &__block_descriptor_48_e17_v32__0__8__16__24l;
    v16[4] = a1;
    v16[5] = a2;
    LOBYTE(v18) = 0;
    int v10 = a4[1];
    if (a4[1]) {
      LOBYTE(v18) = *a4;
    }
    char v15 = 0;
    if (a5[1])
    {
      char v15 = *a5;
      uint64_t v11 = &v15;
    }
    else
    {
      uint64_t v11 = 0;
    }
    if (v10) {
      uint64_t v13 = &v18;
    }
    else {
      uint64_t v13 = 0;
    }
    return [*(id *)(a1 + 16) getMatchedStylesForNodeWithErrorCallback:v17 successCallback:v16 nodeId:a3 includePseudo:v13 includeInherited:v11];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v12 = v18;
    unint64_t v18 = 0;
    if (v12)
    {
      if (*v12 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v12 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FA82B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FA834C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke_2(WTF::JSONImpl::Object *a1, void **a2, Inspector **a3, Inspector **a4)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v57 = *((void *)a1 + 4);
  WTF::JSONImpl::Object::create((uint64_t *)&v76, a1);
  v58 = (Inspector **)a2;
  if (a2)
  {
    uint64_t v5 = *a2;
    if (!*a2)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"matchedCSSRules" format];
      uint64_t v5 = *a2;
    }
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v72 objects:v81 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v73;
      uint64_t v8 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v73 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v11 = (void *)MEMORY[0x263EFF940];
            uint64_t v12 = (objc_class *)objc_opt_class();
            [v11 raise:v8, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v12), v10, v57 format];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v72 objects:v81 count:16];
      }
      while (v6);
    }
  }
  if (a3)
  {
    uint64_t v13 = *a3;
    if (!*a3)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"pseudoElements" format];
      uint64_t v13 = *a3;
    }
    long long v71 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v68 = 0u;
    uint64_t v14 = [(Inspector *)v13 countByEnumeratingWithState:&v68 objects:v80 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v69;
      uint64_t v16 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v69 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v68 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v19 = (void *)MEMORY[0x263EFF940];
            long long v20 = (objc_class *)objc_opt_class();
            [v19 raise:v16, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v20), v18 format];
          }
        }
        uint64_t v14 = [(Inspector *)v13 countByEnumeratingWithState:&v68 objects:v80 count:16];
      }
      while (v14);
    }
  }
  if (a4)
  {
    long long v21 = *a4;
    if (!*a4)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"inherited" format];
      long long v21 = *a4;
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v22 = [(Inspector *)v21 countByEnumeratingWithState:&v64 objects:v79 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v65;
      uint64_t v24 = *MEMORY[0x263EFF4A0];
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v65 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v64 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v27 = (void *)MEMORY[0x263EFF940];
            uint64_t v28 = (objc_class *)objc_opt_class();
            [v27 raise:v24, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v28), v26 format];
          }
        }
        uint64_t v22 = [(Inspector *)v21 countByEnumeratingWithState:&v64 objects:v79 count:16];
      }
      while (v22);
    }
  }
  if (v58)
  {
    uint64_t v29 = (uint64_t)v76;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v63 = (WTF::StringImpl *)v77[0];
    Inspector::toJSONObjectArray(*v58, (uint64_t *)&v61);
    uint64_t v30 = (uint64_t)v61;
    v61 = 0;
    v62 = (_DWORD *)v30;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v29 + 16), &v63, (uint64_t *)&v62, (uint64_t)v77);
    if (v78)
    {
      v31 = (uint64_t *)(v29 + 24);
      uint64_t v32 = *(unsigned int *)(v29 + 36);
      if (v32 == *(_DWORD *)(v29 + 32))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v31, (unint64_t)&v63);
      }
      else
      {
        uint64_t v33 = *v31;
        v34 = v63;
        if (v63) {
          *(_DWORD *)v63 += 2;
        }
        *(void *)(v33 + 8 * v32) = v34;
        *(_DWORD *)(v29 + 36) = v32 + 1;
      }
    }
    v35 = v62;
    v62 = 0;
    if (v35)
    {
      if (*v35 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v35;
      }
    }
    v36 = v61;
    v61 = 0;
    if (v36)
    {
      if (*v36 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v36;
      }
    }
    v37 = v63;
    v63 = 0;
    if (v37)
    {
      if (*(_DWORD *)v37 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v37 -= 2;
      }
    }
  }
  if (a3)
  {
    uint64_t v38 = (uint64_t)v76;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v63 = (WTF::StringImpl *)v77[0];
    Inspector::toJSONObjectArray(*a3, (uint64_t *)&v61);
    uint64_t v39 = (uint64_t)v61;
    v61 = 0;
    v62 = (_DWORD *)v39;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v38 + 16), &v63, (uint64_t *)&v62, (uint64_t)v77);
    if (v78)
    {
      v40 = (uint64_t *)(v38 + 24);
      uint64_t v41 = *(unsigned int *)(v38 + 36);
      if (v41 == *(_DWORD *)(v38 + 32))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v40, (unint64_t)&v63);
      }
      else
      {
        uint64_t v42 = *v40;
        v43 = v63;
        if (v63) {
          *(_DWORD *)v63 += 2;
        }
        *(void *)(v42 + 8 * v41) = v43;
        *(_DWORD *)(v38 + 36) = v41 + 1;
      }
    }
    v44 = v62;
    v62 = 0;
    if (v44)
    {
      if (*v44 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v44;
      }
    }
    v45 = v61;
    v61 = 0;
    if (v45)
    {
      if (*v45 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v45;
      }
    }
    v46 = v63;
    v63 = 0;
    if (v46)
    {
      if (*(_DWORD *)v46 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v46 -= 2;
      }
    }
  }
  if (a4)
  {
    uint64_t v47 = (uint64_t)v76;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v63 = (WTF::StringImpl *)v77[0];
    Inspector::toJSONObjectArray(*a4, (uint64_t *)&v61);
    uint64_t v48 = (uint64_t)v61;
    v61 = 0;
    v62 = (_DWORD *)v48;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v47 + 16), &v63, (uint64_t *)&v62, (uint64_t)v77);
    if (v78)
    {
      v49 = (uint64_t *)(v47 + 24);
      uint64_t v50 = *(unsigned int *)(v47 + 36);
      if (v50 == *(_DWORD *)(v47 + 32))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v49, (unint64_t)&v63);
      }
      else
      {
        uint64_t v51 = *v49;
        v52 = v63;
        if (v63) {
          *(_DWORD *)v63 += 2;
        }
        *(void *)(v51 + 8 * v50) = v52;
        *(_DWORD *)(v47 + 36) = v50 + 1;
      }
    }
    v53 = v62;
    v62 = 0;
    if (v53)
    {
      if (*v53 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v53;
      }
    }
    v54 = v61;
    v61 = 0;
    if (v54)
    {
      if (*v54 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v54;
      }
    }
    v55 = v63;
    v63 = 0;
    if (v55)
    {
      if (*(_DWORD *)v55 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v55 -= 2;
      }
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v76;
  v76 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FA8AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,_DWORD *a44)
{
  if (a18)
  {
    if (*a18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a18 -= 2;
    }
  }
  if (a44)
  {
    if (*a44 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a44;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getInlineStylesForNode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e13_v24__0__8__16l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getInlineStylesForNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FA8CF4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FA8D90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, id *a2, id *a3)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v25, a1);
  if (a2 && !*a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"inlineStyle" format];
  }
  if (a3 && !*a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"attributesStyle" format];
  }
  if (a2)
  {
    uint64_t v5 = (uint64_t)v25;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    uint64_t v24 = (WTF::StringImpl *)v26[0];
    if (*a2)
    {
      [*a2 toJSONObject];
      uint64_t v6 = v22;
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v23 = (_DWORD *)v6;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v5 + 16), &v24, (uint64_t *)&v23, (uint64_t)v26);
    if (v27)
    {
      uint64_t v7 = (uint64_t *)(v5 + 24);
      uint64_t v8 = *(unsigned int *)(v5 + 36);
      if (v8 == *(_DWORD *)(v5 + 32))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v7, (unint64_t)&v24);
      }
      else
      {
        uint64_t v9 = *v7;
        uint64_t v10 = v24;
        if (v24) {
          *(_DWORD *)v24 += 2;
        }
        *(void *)(v9 + 8 * v8) = v10;
        *(_DWORD *)(v5 + 36) = v8 + 1;
      }
    }
    uint64_t v11 = v23;
    uint64_t v23 = 0;
    if (v11)
    {
      if (*v11 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*v11;
      }
    }
    uint64_t v22 = 0;
    uint64_t v12 = v24;
    uint64_t v24 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy();
        if (!a3) {
          goto LABEL_44;
        }
        goto LABEL_25;
      }
      *(_DWORD *)v12 -= 2;
    }
  }
  if (!a3) {
    goto LABEL_44;
  }
LABEL_25:
  uint64_t v13 = (uint64_t)v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v24 = (WTF::StringImpl *)v26[0];
  if (*a3)
  {
    [*a3 toJSONObject];
    uint64_t v14 = v22;
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v23 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v13 + 16), &v24, (uint64_t *)&v23, (uint64_t)v26);
  if (v27)
  {
    uint64_t v15 = (uint64_t *)(v13 + 24);
    uint64_t v16 = *(unsigned int *)(v13 + 36);
    if (v16 == *(_DWORD *)(v13 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v24);
    }
    else
    {
      uint64_t v17 = *v15;
      uint64_t v18 = v24;
      if (v24) {
        *(_DWORD *)v24 += 2;
      }
      *(void *)(v17 + 8 * v16) = v18;
      *(_DWORD *)(v13 + 36) = v16 + 1;
    }
  }
  uint64_t v19 = v23;
  uint64_t v23 = 0;
  if (v19)
  {
    if (*v19 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v19;
    }
  }
  long long v20 = v24;
  uint64_t v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
LABEL_44:
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v25;
  long long v25 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FA90BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getComputedStyleForNode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getComputedStyleForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getComputedStyleForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getComputedStyleForNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FA92C0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getComputedStyleForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FA935C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getComputedStyleForNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"computedStyle" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  long long v20 = 0;
  long long v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    uint64_t v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  uint64_t v16 = v21;
  long long v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  uint64_t v17 = v20;
  long long v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  uint64_t v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  char v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FA9644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getFontDataForNode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher18getFontDataForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher18getFontDataForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolCSSFont_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getFontDataForNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FA983C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher18getFontDataForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FA98D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher18getFontDataForNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"primaryFont" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      uint64_t v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FA9AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getAllStyleSheets(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getAllStyleSheetsEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getAllStyleSheetsEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) getAllStyleSheetsWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    uint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FA9C80(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getAllStyleSheetsEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FA9D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getAllStyleSheetsEl_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"headers" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  long long v20 = 0;
  long long v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    uint64_t v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  uint64_t v16 = v21;
  long long v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  char v17 = v20;
  long long v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  uint64_t v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  char v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAA004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getStyleSheet(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher13getStyleSheetElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher13getStyleSheetElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e38_v16__0__RWIProtocolCSSStyleSheetBody_8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) getStyleSheetWithErrorCallback:v10 successCallback:v9 styleSheetId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAA214(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher13getStyleSheetElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAA2B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher13getStyleSheetElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"styleSheet" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      uint64_t v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAA47C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getStyleSheetText(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getStyleSheetTextElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getStyleSheetTextElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) getStyleSheetTextWithErrorCallback:v10 successCallback:v9 styleSheetId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAA670(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getStyleSheetTextElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAA70C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getStyleSheetTextElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"text" format];
  }
  uint64_t v3 = v8;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v9;
  MEMORY[0x22A6705C0](&v9, a2);
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
  uint64_t v4 = v9;
  uint64_t v9 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  uint64_t v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FAA854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setString(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2, const WTF::String *a3)
{
  WTF::JSONImpl::Value::create((uint64_t *)&v10, a3, a2);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, (WTF::StringImpl **)a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    uint64_t v5 = (uint64_t *)((char *)this + 24);
    uint64_t v6 = *((unsigned int *)this + 9);
    if (v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      uint64_t v7 = *v5;
      uint64_t v8 = *(_DWORD **)a2;
      if (*(void *)a2) {
        *v8 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  uint64_t result = v10;
  uint64_t v10 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAA998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setStyleSheetText(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = this;
    v12[5] = a2;
    if (*(void *)a3) {
      uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v8 = &stru_26DB29208;
    }
    if (*(void *)a4) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    return [*((id *)this + 2) setStyleSheetTextWithErrorCallback:v13 successCallback:v12 styleSheetId:v8 text:v10];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v14;
    uint64_t v14 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAAB38(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAABD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAAC5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setStyleText(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher12setStyleTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher12setStyleTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e29_v16__0__RWIProtocolCSSStyle_8l;
    v12[4] = a1;
    v12[5] = a2;
    CFTypeRef v8 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolCSSStyleId alloc] initWithJSONObject:a3]);
    if (*a4) {
      uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v9 = &stru_26DB29208;
    }
    return [*(id *)(a1 + 16) setStyleTextWithErrorCallback:v13 successCallback:v12 styleId:v8 text:v9];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v10 = v14;
    uint64_t v14 = 0;
    if (v10)
    {
      if (*v10 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v10 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FAAE00(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher12setStyleTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAAE9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher12setStyleTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"style" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      CFTypeRef v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAB068(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setRuleSelector(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher15setRuleSelectorElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher15setRuleSelectorElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolCSSRule_8l;
    v12[4] = a1;
    v12[5] = a2;
    CFTypeRef v8 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolCSSRuleId alloc] initWithJSONObject:a3]);
    if (*a4) {
      uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v9 = &stru_26DB29208;
    }
    return [*(id *)(a1 + 16) setRuleSelectorWithErrorCallback:v13 successCallback:v12 ruleId:v8 selector:v9];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v10 = v14;
    uint64_t v14 = 0;
    if (v10)
    {
      if (*v10 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v10 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FAB28C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher15setRuleSelectorElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAB328(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher15setRuleSelectorElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"rule" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      CFTypeRef v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAB4F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setGroupingHeaderText(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher21setGroupingHeaderTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher21setGroupingHeaderTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e32_v16__0__RWIProtocolCSSGrouping_8l;
    v12[4] = a1;
    v12[5] = a2;
    CFTypeRef v8 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolCSSRuleId alloc] initWithJSONObject:a3]);
    if (*a4) {
      uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v9 = &stru_26DB29208;
    }
    return [*(id *)(a1 + 16) setGroupingHeaderTextWithErrorCallback:v13 successCallback:v12 ruleId:v8 headerText:v9];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v10 = v14;
    uint64_t v14 = 0;
    if (v10)
    {
      if (*v10 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v10 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FAB718(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher21setGroupingHeaderTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAB7B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher21setGroupingHeaderTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"grouping" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      CFTypeRef v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAB980(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::createStyleSheet(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16createStyleSheetElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16createStyleSheetElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) createStyleSheetWithErrorCallback:v10 successCallback:v9 frameId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FABB74(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16createStyleSheetElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FABC10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16createStyleSheetElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"styleSheetId" format];
  }
  uint64_t v3 = v8;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v9;
  MEMORY[0x22A6705C0](&v9, a2);
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
  uint64_t v4 = v9;
  uint64_t v9 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  CFTypeRef v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FABD58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::addRule(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7addRuleElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7addRuleElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolCSSRule_8l;
    v12[4] = this;
    v12[5] = a2;
    if (*(void *)a3) {
      CFTypeRef v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFTypeRef v8 = &stru_26DB29208;
    }
    if (*(void *)a4) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    return [*((id *)this + 2) addRuleWithErrorCallback:v13 successCallback:v12 styleSheetId:v8 selector:v10];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v14;
    uint64_t v14 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FABF68(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7addRuleElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAC004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7addRuleElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"rule" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      CFTypeRef v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAC1D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getSupportedCSSProperties(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher25getSupportedCSSPropertiesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher25getSupportedCSSPropertiesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) getSupportedCSSPropertiesWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    CFTypeRef v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAC3AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher25getSupportedCSSPropertiesEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAC448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher25getSupportedCSSPropertiesEl_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"cssProperties" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFTypeRef v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  long long v20 = 0;
  long long v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    uint64_t v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  uint64_t v16 = v21;
  long long v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  char v17 = v20;
  long long v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  uint64_t v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  char v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAC730(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getSupportedSystemFontFamilyNames(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher33getSupportedSystemFontFamilyNamesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher33getSupportedSystemFontFamilyNamesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) getSupportedSystemFontFamilyNamesWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    CFTypeRef v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAC920(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher33getSupportedSystemFontFamilyNamesEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAC9BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher33getSupportedSystemFontFamilyNamesEl_block_invoke_2(WTF::JSONImpl::Object *a1, Inspector *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v16, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"fontFamilyNames" format];
  }
  uint64_t v3 = (uint64_t)v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = v17;
  Inspector::toJSONStringArray(a2, (uint64_t *)&v13);
  uint64_t v4 = (uint64_t)v13;
  uint64_t v13 = 0;
  uint64_t v14 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v15, (uint64_t *)&v14, (uint64_t)&v17);
  if (v18)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v15);
    }
    else
    {
      uint64_t v7 = *v5;
      CFTypeRef v8 = v15;
      if (v15) {
        *(_DWORD *)v15 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v14;
  uint64_t v14 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*v10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v10;
    }
  }
  uint64_t v11 = v15;
  uint64_t v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v16;
  uint64_t v16 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FACB7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::forcePseudoState(uint64_t a1, uint64_t a2, uint64_t a3, WTF::JSONImpl::ArrayBase **a4)
{
  if (objc_opt_respondsToSelector())
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v14[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v14[4] = a1;
    v14[5] = a2;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v13[3] = &__block_descriptor_48_e5_v8__0l;
    v13[4] = a1;
    v13[5] = a2;
    CFTypeRef v8 = *a4;
    *a4 = 0;
    uint64_t v15 = v8;
    uint64_t v9 = Inspector::toObjCStringArray(&v15);
    uint64_t v10 = v15;
    uint64_t v15 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*(_DWORD *)v10;
      }
    }
    return [*(id *)(a1 + 16) forcePseudoStateWithErrorCallback:v14 successCallback:v13 nodeId:a3 forcedPseudoClasses:v9];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v15;
    uint64_t v15 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FACDA4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FACE58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FACEE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorCSSBackendDispatcher::setLayoutContextTypeChangedMode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = this;
    v12[5] = a2;
    uint64_t v6 = *(void *)a3;
    if (*(void *)a3)
    {
      uint64_t v7 = *(unsigned __int8 **)(v6 + 8);
      unint64_t v8 = *(unsigned int *)(v6 + 4) | ((unint64_t)((*(_DWORD *)(v6 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0x100000000;
    }
    for (uint64_t i = 0; i != 6; i += 3)
    {
      if (WTF::operator==(v7, v8, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolCSSLayoutContextTypeChangedMode>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolCSSLayoutContextTypeChangedMode>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)[*((id *)this + 2) setLayoutContextTypeChangedModeWithErrorCallback:v13 successCallback:v12 mode:(&Inspector::fromProtocolString<RWIProtocolCSSLayoutContextTypeChangedMode>(WTF::String const&)::mappings)[i + 2]];
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t result = v14;
    uint64_t v14 = 0;
    if (result)
    {
      if (*result == 2) {
        return (_DWORD *)WTF::StringImpl::destroy();
      }
      else {
        *result -= 2;
      }
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v14;
    uint64_t v14 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_226FAD104(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAD1B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAD240(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getDocument(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolDOMNode_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) getDocumentWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAD39C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAD438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"root" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAD604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::requestChildNodes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = a1;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = a1;
    v11[5] = a2;
    LODWORD(v13) = 0;
    if (*(unsigned char *)(a4 + 4))
    {
      LODWORD(v13) = *(_DWORD *)a4;
      unint64_t v8 = &v13;
    }
    else
    {
      unint64_t v8 = 0;
    }
    return [*(id *)(a1 + 16) requestChildNodesWithErrorCallback:v12 successCallback:v11 nodeId:a3 depth:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FAD80C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAD8A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAD930(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::querySelector(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e9_v16__0_i8l;
    v11[4] = this;
    v11[5] = a2;
    if (*(void *)a4) {
      unint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v8 = &stru_26DB29208;
    }
    return [*((id *)this + 2) querySelectorWithErrorCallback:v12 successCallback:v11 nodeId:a3 selector:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FADAB4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FADB50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, unsigned int *a2)
{
  WTF::JSONImpl::Object::create(v7, a1);
  if (a2)
  {
    uint64_t v3 = (WTF::JSONImpl::ObjectBase *)v7[0];
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    uint64_t v6 = (WTF::StringImpl *)v7[1];
    WTF::JSONImpl::ObjectBase::setInteger(v3, &v6, (WTF::JSONImpl::Value *)*a2);
    uint64_t v4 = v6;
    uint64_t v6 = 0;
    if (v4)
    {
      if (*(_DWORD *)v4 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v4 -= 2;
      }
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = (_DWORD *)v7[0];
  v7[0] = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FADC3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11)
{
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setInteger(WTF::JSONImpl::ObjectBase *this, WTF::StringImpl **a2, WTF::JSONImpl::Value *a3)
{
  WTF::JSONImpl::Value::create(a3);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    uint64_t v5 = (uint64_t *)((char *)this + 24);
    uint64_t v6 = *((unsigned int *)this + 9);
    if (v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = *a2;
      if (*a2) {
        *(_DWORD *)v8 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  uint64_t result = v10;
  uint64_t v10 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FADD54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::querySelectorAll(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16querySelectorAllEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16querySelectorAllEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v11[4] = this;
    v11[5] = a2;
    if (*(void *)a4) {
      unint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v8 = &stru_26DB29208;
    }
    return [*((id *)this + 2) querySelectorAllWithErrorCallback:v12 successCallback:v11 nodeId:a3 selector:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FADED8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16querySelectorAllEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FADF74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16querySelectorAllEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, Inspector *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v16, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"nodeIds" format];
  }
  uint64_t v3 = (uint64_t)v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = v17;
  Inspector::toJSONIntegerArray(a2, (uint64_t *)&v13);
  uint64_t v4 = (uint64_t)v13;
  uint64_t v13 = 0;
  uint64_t v14 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v15, (uint64_t *)&v14, (uint64_t)&v17);
  if (v18)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v15);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v15;
      if (v15) {
        *(_DWORD *)v15 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v14;
  uint64_t v14 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*v10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v10;
    }
  }
  uint64_t v11 = v15;
  uint64_t v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v16;
  uint64_t v16 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAE134(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setNodeName(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11setNodeNameEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11setNodeNameEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e8_v12__0i8l;
    v11[4] = this;
    v11[5] = a2;
    if (*(void *)a4) {
      unint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v8 = &stru_26DB29208;
    }
    return [*((id *)this + 2) setNodeNameWithErrorCallback:v12 successCallback:v11 nodeId:a3 name:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAE338(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11setNodeNameEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAE3D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11setNodeNameEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, WTF::JSONImpl::Value *a2)
{
  WTF::JSONImpl::Object::create(v7, a1);
  uint64_t v3 = (WTF::JSONImpl::ObjectBase *)v7[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v6 = (WTF::StringImpl *)v7[1];
  WTF::JSONImpl::ObjectBase::setInteger(v3, &v6, a2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = (_DWORD *)v7[0];
  v7[0] = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAE4BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setNodeValue(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = this;
    v11[5] = a2;
    if (*(void *)a4) {
      unint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v8 = &stru_26DB29208;
    }
    return [*((id *)this + 2) setNodeValueWithErrorCallback:v12 successCallback:v11 nodeId:a3 value:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAE684(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAE720(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAE7A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::removeNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) removeNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAE90C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAE9A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAEA30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setAttributeValue(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4, const WTF::String *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = this;
    v15[5] = a2;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = this;
    v14[5] = a2;
    if (*(void *)a4) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    if (*(void *)a5) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_26DB29208;
    }
    return [*((id *)this + 2) setAttributeValueWithErrorCallback:v15 successCallback:v14 nodeId:a3 name:v10 value:v12];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v16;
    uint64_t v16 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAEBE0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAEC7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAED04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setAttributesAsText(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4, const WTF::String *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = this;
    v15[5] = a2;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = this;
    v14[5] = a2;
    if (*(void *)a4) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    uint64_t v16 = 0;
    if (*(void *)a5)
    {
      uint64_t v16 = WTF::StringImpl::operator NSString *();
      if (*(void *)a5) {
        uint64_t v12 = &v16;
      }
      else {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    return [*((id *)this + 2) setAttributesAsTextWithErrorCallback:v15 successCallback:v14 nodeId:a3 text:v10 name:v12];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = (_DWORD *)v16;
    uint64_t v16 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAEEC4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAEF60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAEFE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::removeAttribute(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = this;
    v11[5] = a2;
    if (*(void *)a4) {
      unint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v8 = &stru_26DB29208;
    }
    return [*((id *)this + 2) removeAttributeWithErrorCallback:v12 successCallback:v11 nodeId:a3 name:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAF16C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAF208(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAF290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getSupportedEventNames(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getSupportedEventNamesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getSupportedEventNamesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) getSupportedEventNamesWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAF3EC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getSupportedEventNamesEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAF488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getSupportedEventNamesEl_block_invoke_2(WTF::JSONImpl::Object *a1, Inspector *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v16, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"eventNames" format];
  }
  uint64_t v3 = (uint64_t)v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = v17;
  Inspector::toJSONStringArray(a2, (uint64_t *)&v13);
  uint64_t v4 = (uint64_t)v13;
  uint64_t v13 = 0;
  uint64_t v14 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v15, (uint64_t *)&v14, (uint64_t)&v17);
  if (v18)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v15);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v15;
      if (v15) {
        *(_DWORD *)v15 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v14;
  uint64_t v14 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*v10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v10;
    }
  }
  uint64_t v11 = v15;
  uint64_t v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v16;
  uint64_t v16 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAF648(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getDataBindingsForNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getDataBindingsForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getDataBindingsForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getDataBindingsForNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAF82C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getDataBindingsForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAF8C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getDataBindingsForNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"dataBindings" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unint64_t v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  long long v20 = 0;
  long long v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    uint64_t v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  uint64_t v16 = v21;
  long long v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  char v17 = v20;
  long long v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  char v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  char v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FAFBB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getAssociatedDataForNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getAssociatedDataForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getAssociatedDataForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e9_v16__0__8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getAssociatedDataForNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FAFDA8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getAssociatedDataForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FAFE44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getAssociatedDataForNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (a2)
  {
    if (!*a2) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"optional parameter '%@' cannot be nil", @"associatedData" format];
    }
    uint64_t v3 = v8;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    uint64_t v7 = v9;
    MEMORY[0x22A6705C0](&v9, *a2);
    WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
    uint64_t v4 = v9;
    uint64_t v9 = 0;
    if (v4)
    {
      if (*v4 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v4 -= 2;
      }
    }
    uint64_t v5 = v7;
    uint64_t v7 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  unint64_t v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FAFF94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getEventListenersForNode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getEventListenersForNodeEliONSt3__18optionalIbEE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = a1;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getEventListenersForNodeEliONSt3__18optionalIbEE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v11[4] = a1;
    v11[5] = a2;
    LOBYTE(v13) = 0;
    if (a4[1])
    {
      LOBYTE(v13) = *a4;
      unint64_t v8 = &v13;
    }
    else
    {
      unint64_t v8 = 0;
    }
    return [*(id *)(a1 + 16) getEventListenersForNodeWithErrorCallback:v12 successCallback:v11 nodeId:a3 includeAncestors:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB018C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getEventListenersForNodeEliONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB0228(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getEventListenersForNodeEliONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"listeners" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          unint64_t v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  long long v20 = 0;
  long long v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    uint64_t v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  uint64_t v16 = v21;
  long long v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  char v17 = v20;
  long long v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  char v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  char v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB0510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setEventListenerDisabled(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (objc_opt_respondsToSelector())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke;
    v11[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v11[4] = this;
    v11[5] = a2;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke_2;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = this;
    v10[5] = a2;
    return [*((id *)this + 2) setEventListenerDisabledWithErrorCallback:v11 successCallback:v10 eventListenerId:a3 disabled:a4];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB0710(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB07AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB0834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setBreakpointForEventListener(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = a1;
    v15[5] = a2;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = a1;
    v14[5] = a2;
    uint64_t v16 = 0;
    if (*a4)
    {
      unint64_t v8 = [RWIProtocolDebuggerBreakpointOptions alloc];
      uint64_t v13 = (_DWORD *)*a4;
      *a4 = 0;
      uint64_t v16 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v8 initWithJSONObject:&v13]);
      uint64_t v9 = v13;
      uint64_t v13 = 0;
      if (v9)
      {
        if (*v9 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v9;
        }
      }
      if (*a4) {
        uint64_t v11 = (CFTypeRef *)&v16;
      }
      else {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "setBreakpointForEventListenerWithErrorCallback:successCallback:eventListenerId:options:", v15, v14, a3, v11, v13);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v10 = v16;
    uint64_t v16 = 0;
    if (v10)
    {
      if (*v10 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v10 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB0A10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB0ADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB0B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::removeBreakpointForEventListener(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) removeBreakpointForEventListenerWithErrorCallback:v9 successCallback:v8 eventListenerId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB0CC8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB0D64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB0DEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getAccessibilityPropertiesForNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher33getAccessibilityPropertiesForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher33getAccessibilityPropertiesForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e47_v16__0__RWIProtocolDOMAccessibilityProperties_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getAccessibilityPropertiesForNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB0F50(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher33getAccessibilityPropertiesForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB0FEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher33getAccessibilityPropertiesForNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"properties" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB11B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getOuterHTML(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12getOuterHTMLEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12getOuterHTMLEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getOuterHTMLWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB1394(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12getOuterHTMLEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB1430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12getOuterHTMLEli_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"outerHTML" format];
  }
  uint64_t v3 = v8;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v9;
  MEMORY[0x22A6705C0](&v9, a2);
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
  uint64_t v4 = v9;
  uint64_t v9 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  unint64_t v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FB1578(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setOuterHTML(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = this;
    v11[5] = a2;
    if (*(void *)a4) {
      unint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v8 = &stru_26DB29208;
    }
    return [*((id *)this + 2) setOuterHTMLWithErrorCallback:v12 successCallback:v11 nodeId:a3 outerHTML:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB176C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB1808(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB1890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::insertAdjacentHTML(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4, const WTF::String *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = this;
    v15[5] = a2;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = this;
    v14[5] = a2;
    if (*(void *)a4) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    if (*(void *)a5) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_26DB29208;
    }
    return [*((id *)this + 2) insertAdjacentHTMLWithErrorCallback:v15 successCallback:v14 nodeId:a3 position:v10 html:v12];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v16;
    uint64_t v16 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB1A40(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB1ADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB1B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::performSearch(uint64_t a1, uint64_t a2, void *a3, WTF::JSONImpl::ArrayBase **a4, unsigned char *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke;
    v19[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v19[4] = a1;
    v19[5] = a2;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke_2;
    v18[3] = &__block_descriptor_48_e21_v20__0__NSString_8i16l;
    v18[4] = a1;
    v18[5] = a2;
    if (*a3) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    long long v20 = 0;
    uint64_t v12 = *a4;
    if (*a4)
    {
      *a4 = 0;
      char v17 = v12;
      long long v20 = Inspector::toObjCIntegerArray(&v17);
      uint64_t v13 = v17;
      char v17 = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*(_DWORD *)v13;
        }
      }
    }
    LOBYTE(v17) = 0;
    if (a5[1])
    {
      LOBYTE(v17) = *a5;
      uint64_t v15 = &v17;
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (*a4) {
      uint64_t v16 = (void **)&v20;
    }
    else {
      uint64_t v16 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "performSearchWithErrorCallback:successCallback:query:nodeIds:caseSensitive:", v19, v18, v10, v16, v15, v17);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v20;
    long long v20 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB1D68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB1E1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2, WTF::JSONImpl::Value *a3)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v12, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"searchId" format];
  }
  uint64_t v5 = v12;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = v13;
  MEMORY[0x22A6705C0](&v13, a2);
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v11, (const WTF::String *)&v13);
  uint64_t v6 = v13;
  uint64_t v13 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  unint64_t v8 = v12;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = v13;
  WTF::JSONImpl::ObjectBase::setInteger(v8, &v11, a3);
  uint64_t v9 = v11;
  uint64_t v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v12;
  uint64_t v12 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FB1FC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getSearchResults(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3, uint64_t a4, uint64_t a5)
{
  if (objc_opt_respondsToSelector())
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16getSearchResultsElRKN3WTF6StringEii_block_invoke;
    v14[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v14[4] = this;
    v14[5] = a2;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16getSearchResultsElRKN3WTF6StringEii_block_invoke_2;
    v13[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v13[4] = this;
    v13[5] = a2;
    if (*(void *)a3) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    return [*((id *)this + 2) getSearchResultsWithErrorCallback:v14 successCallback:v13 searchId:v10 fromIndex:a4 toIndex:a5];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v15;
    uint64_t v15 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB21D0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16getSearchResultsElRKN3WTF6StringEii_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB226C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16getSearchResultsElRKN3WTF6StringEii_block_invoke_2(WTF::JSONImpl::Object *a1, Inspector *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v16, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"nodeIds" format];
  }
  uint64_t v3 = (uint64_t)v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = v17;
  Inspector::toJSONIntegerArray(a2, (uint64_t *)&v13);
  uint64_t v4 = (uint64_t)v13;
  uint64_t v13 = 0;
  uint64_t v14 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v15, (uint64_t *)&v14, (uint64_t)&v17);
  if (v18)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v15);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v15;
      if (v15) {
        *(_DWORD *)v15 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v14;
  uint64_t v14 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*v10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v10;
    }
  }
  uint64_t v11 = v15;
  uint64_t v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v16;
  uint64_t v16 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB242C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::discardSearchResults(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) discardSearchResultsWithErrorCallback:v10 successCallback:v9 searchId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB2628(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB26C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB274C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::requestNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11requestNodeElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11requestNodeElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e8_v12__0i8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) requestNodeWithErrorCallback:v10 successCallback:v9 objectId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB28C8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11requestNodeElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB2964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11requestNodeElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, WTF::JSONImpl::Value *a2)
{
  WTF::JSONImpl::Object::create(v7, a1);
  uint64_t v3 = (WTF::JSONImpl::ObjectBase *)v7[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v6 = (WTF::StringImpl *)v7[1];
  WTF::JSONImpl::ObjectBase::setInteger(v3, &v6, a2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = (_DWORD *)v7[0];
  v7[0] = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB2A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setInspectModeEnabled(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, CFTypeRef *a5, void *a6)
{
  if (objc_opt_respondsToSelector())
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    void v26[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    uint64_t v28 = 0;
    if (*a4)
    {
      uint64_t v12 = [RWIProtocolDOMHighlightConfig alloc];
      long long v25 = *a4;
      *a4 = 0;
      uint64_t v28 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v12 initWithJSONObject:&v25]);
      uint64_t v13 = v25;
      long long v25 = 0;
      if (v13)
      {
        if (*v13 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v13;
        }
      }
    }
    long long v25 = 0;
    if (*a5)
    {
      uint64_t v16 = [RWIProtocolDOMGridOverlayConfig alloc];
      long long v24 = *a5;
      *a5 = 0;
      long long v25 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v16 initWithJSONObject:&v24]);
      char v17 = v24;
      long long v24 = 0;
      if (v17)
      {
        if (*v17 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v17;
        }
      }
    }
    long long v24 = 0;
    if (*a6)
    {
      char v18 = [RWIProtocolDOMFlexOverlayConfig alloc];
      long long v23 = (_DWORD *)*a6;
      *a6 = 0;
      long long v24 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v18 initWithJSONObject:&v23]);
      uint64_t v19 = v23;
      long long v23 = 0;
      if (v19)
      {
        if (*v19 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v19;
        }
      }
      if (*a6) {
        long long v20 = (CFTypeRef *)&v24;
      }
      else {
        long long v20 = 0;
      }
    }
    else
    {
      long long v20 = 0;
    }
    if (*a4) {
      long long v21 = (CFTypeRef *)&v28;
    }
    else {
      long long v21 = 0;
    }
    if (*a5) {
      uint64_t v22 = (CFTypeRef *)&v25;
    }
    else {
      uint64_t v22 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "setInspectModeEnabledWithErrorCallback:successCallback:enabled:highlightConfig:gridOverlayConfig:flexOverlayConfig:", v27, v26, a3, v21, v22, v20, v23, v24, v25);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v14 = v28;
    uint64_t v28 = 0;
    if (v14)
    {
      if (*v14 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v14 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB2D54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, uint64_t a10, uint64_t a11)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB2E50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB2ED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightRect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFTypeRef *a7, void *a8, unsigned char *a9)
{
  if (objc_opt_respondsToSelector())
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke;
    v29[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v29[4] = a1;
    v29[5] = a2;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke_2;
    v28[3] = &__block_descriptor_48_e5_v8__0l;
    v28[4] = a1;
    v28[5] = a2;
    uint64_t v30 = 0;
    if (*a7)
    {
      char v17 = [RWIProtocolDOMRGBAColor alloc];
      char v27 = *a7;
      *a7 = 0;
      uint64_t v30 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v17 initWithJSONObject:&v27]);
      char v18 = v27;
      char v27 = 0;
      if (v18)
      {
        if (*v18 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v18;
        }
      }
    }
    char v27 = 0;
    if (*a8)
    {
      long long v21 = [RWIProtocolDOMRGBAColor alloc];
      long long v26 = (_DWORD *)*a8;
      *a8 = 0;
      char v27 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v21 initWithJSONObject:&v26]);
      uint64_t v22 = v26;
      long long v26 = 0;
      if (v22)
      {
        if (*v22 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v22;
        }
      }
    }
    LOBYTE(v26) = 0;
    if (a9[1])
    {
      LOBYTE(v26) = *a9;
      long long v23 = &v26;
    }
    else
    {
      long long v23 = 0;
    }
    long long v24 = (CFTypeRef *)&v30;
    if (!*a7) {
      long long v24 = 0;
    }
    long long v25 = (CFTypeRef *)&v27;
    if (!*a8) {
      long long v25 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "highlightRectWithErrorCallback:successCallback:x:y:width:height:color:outlineColor:usePageCoordinates:", v29, v28, a3, a4, a5, a6, v24, v25, v23, v26, v27);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v19 = v30;
    uint64_t v30 = 0;
    if (v19)
    {
      if (*v19 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v19 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB316C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, uint64_t a13)
{
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB3250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB32D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightQuad(uint64_t a1, uint64_t a2, WTF::JSONImpl::ArrayBase **a3, CFTypeRef *a4, void *a5, unsigned char *a6)
{
  if (objc_opt_respondsToSelector())
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    void v26[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    uint64_t v12 = *a3;
    *a3 = 0;
    uint64_t v28 = v12;
    uint64_t v13 = Inspector::toObjCIntegerArray(&v28);
    uint64_t v14 = v28;
    uint64_t v28 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*(_DWORD *)v14;
      }
    }
    uint64_t v28 = 0;
    if (*a4)
    {
      uint64_t v16 = [RWIProtocolDOMRGBAColor alloc];
      long long v25 = *a4;
      *a4 = 0;
      uint64_t v28 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v16 initWithJSONObject:&v25]);
      char v17 = v25;
      long long v25 = 0;
      if (v17)
      {
        if (*v17 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v17;
        }
      }
    }
    long long v25 = 0;
    if (*a5)
    {
      uint64_t v19 = [RWIProtocolDOMRGBAColor alloc];
      long long v24 = (_DWORD *)*a5;
      *a5 = 0;
      long long v25 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v19 initWithJSONObject:&v24]);
      long long v20 = v24;
      long long v24 = 0;
      if (v20)
      {
        if (*v20 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v20;
        }
      }
    }
    LOBYTE(v24) = 0;
    if (a6[1])
    {
      LOBYTE(v24) = *a6;
      long long v21 = &v24;
    }
    else
    {
      long long v21 = 0;
    }
    if (*a4) {
      uint64_t v22 = &v28;
    }
    else {
      uint64_t v22 = 0;
    }
    if (*a5) {
      long long v23 = (CFTypeRef *)&v25;
    }
    else {
      long long v23 = 0;
    }
    return [*(id *)(a1 + 16) highlightQuadWithErrorCallback:v27 successCallback:v26 quad:v13 color:v22 outlineColor:v23 usePageCoordinates:v21];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v15 = v28;
    uint64_t v28 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB3580(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a10;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB367C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB3704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightSelector(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, CFTypeRef *a6, CFTypeRef **a7)
{
  if (objc_opt_respondsToSelector())
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke;
    v29[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v29[4] = a1;
    v29[5] = a2;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke_2;
    v28[3] = &__block_descriptor_48_e5_v8__0l;
    v28[4] = a1;
    v28[5] = a2;
    if (*a3) {
      uint64_t v14 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v14 = &stru_26DB29208;
    }
    uint64_t v30 = 0;
    if (*a4) {
      uint64_t v30 = WTF::StringImpl::operator NSString *();
    }
    CFTypeRef v16 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolDOMHighlightConfig alloc] initWithJSONObject:a5]);
    CFTypeRef v27 = 0;
    if (*a6)
    {
      char v17 = [RWIProtocolDOMGridOverlayConfig alloc];
      long long v26 = *a6;
      *a6 = 0;
      CFTypeRef v27 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v17 initWithJSONObject:&v26]);
      char v18 = v26;
      long long v26 = 0;
      if (v18)
      {
        if (*v18 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v18;
        }
      }
    }
    long long v26 = 0;
    long long v20 = *a7;
    if (*a7)
    {
      long long v21 = [RWIProtocolDOMFlexOverlayConfig alloc];
      long long v25 = *a7;
      *a7 = 0;
      long long v26 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v21 initWithJSONObject:&v25]);
      uint64_t v22 = v25;
      long long v25 = 0;
      if (v22)
      {
        if (*(_DWORD *)v22 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*(_DWORD *)v22;
        }
      }
      long long v20 = (CFTypeRef *)&v26;
      if (!*a7) {
        long long v20 = 0;
      }
    }
    if (*a4) {
      long long v23 = &v30;
    }
    else {
      long long v23 = 0;
    }
    if (*a6) {
      long long v24 = &v27;
    }
    else {
      long long v24 = 0;
    }
    return [*(id *)(a1 + 16) highlightSelectorWithErrorCallback:v29 successCallback:v28 selectorString:v14 frameId:v23 highlightConfig:v16 gridOverlayConfig:v24 flexOverlayConfig:v20];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v15 = (_DWORD *)v30;
    uint64_t v30 = 0;
    if (v15)
    {
      if (*v15 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v15 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB39C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB3AB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB3B3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightNode(uint64_t a1, uint64_t a2, int *a3, void *a4, uint64_t a5, CFTypeRef *a6, CFTypeRef **a7)
{
  if (objc_opt_respondsToSelector())
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke;
    v30[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v30[4] = a1;
    v30[5] = a2;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke_2;
    v29[3] = &__block_descriptor_48_e5_v8__0l;
    v29[4] = a1;
    v29[5] = a2;
    int v28 = 0;
    if (*((unsigned char *)a3 + 4)) {
      int v28 = *a3;
    }
    uint64_t v31 = 0;
    if (*a4) {
      uint64_t v31 = WTF::StringImpl::operator NSString *();
    }
    CFTypeRef v14 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolDOMHighlightConfig alloc] initWithJSONObject:a5]);
    CFTypeRef v27 = 0;
    if (*a6)
    {
      uint64_t v15 = [RWIProtocolDOMGridOverlayConfig alloc];
      long long v26 = *a6;
      *a6 = 0;
      CFTypeRef v27 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v15 initWithJSONObject:&v26]);
      CFTypeRef v16 = v26;
      long long v26 = 0;
      if (v16)
      {
        if (*v16 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v16;
        }
      }
    }
    long long v26 = 0;
    uint64_t v19 = *a7;
    if (*a7)
    {
      long long v20 = [RWIProtocolDOMFlexOverlayConfig alloc];
      long long v25 = *a7;
      *a7 = 0;
      long long v26 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v20 initWithJSONObject:&v25]);
      long long v21 = v25;
      long long v25 = 0;
      if (v21)
      {
        if (*(_DWORD *)v21 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*(_DWORD *)v21;
        }
      }
      uint64_t v19 = (CFTypeRef *)&v26;
      if (!*a7) {
        uint64_t v19 = 0;
      }
    }
    if (*((unsigned char *)a3 + 4)) {
      uint64_t v22 = &v28;
    }
    else {
      uint64_t v22 = 0;
    }
    if (*a4) {
      long long v23 = &v31;
    }
    else {
      long long v23 = 0;
    }
    if (*a6) {
      long long v24 = &v27;
    }
    else {
      long long v24 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "highlightNodeWithErrorCallback:successCallback:nodeId:objectId:highlightConfig:gridOverlayConfig:flexOverlayConfig:", v30, v29, v22, v23, v14, v24, v19, v25, v26, v27);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    char v17 = (_DWORD *)v31;
    uint64_t v31 = 0;
    if (v17)
    {
      if (*v17 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v17 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB3E04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a10;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB3EF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB3F78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightNodeList(uint64_t a1, uint64_t a2, WTF::JSONImpl::ArrayBase **a3, uint64_t a4, CFTypeRef *a5, void *a6)
{
  if (objc_opt_respondsToSelector())
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    void v26[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    uint64_t v12 = *a3;
    *a3 = 0;
    int v28 = v12;
    uint64_t v13 = Inspector::toObjCIntegerArray(&v28);
    CFTypeRef v14 = v28;
    int v28 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 1) {
        WTF::JSONImpl::Value::operator delete();
      }
      else {
        --*(_DWORD *)v14;
      }
    }
    CFTypeRef v16 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolDOMHighlightConfig alloc] initWithJSONObject:a4]);
    int v28 = 0;
    if (*a5)
    {
      char v17 = [RWIProtocolDOMGridOverlayConfig alloc];
      long long v25 = *a5;
      *a5 = 0;
      int v28 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v17 initWithJSONObject:&v25]);
      char v18 = v25;
      long long v25 = 0;
      if (v18)
      {
        if (*v18 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v18;
        }
      }
    }
    long long v25 = 0;
    if (*a6)
    {
      long long v20 = [RWIProtocolDOMFlexOverlayConfig alloc];
      long long v24 = (_DWORD *)*a6;
      *a6 = 0;
      long long v25 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v20 initWithJSONObject:&v24]);
      long long v21 = v24;
      long long v24 = 0;
      if (v21)
      {
        if (*v21 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v21;
        }
      }
      if (*a6) {
        uint64_t v22 = (CFTypeRef *)&v25;
      }
      else {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    if (*a5) {
      long long v23 = &v28;
    }
    else {
      long long v23 = 0;
    }
    return [*(id *)(a1 + 16) highlightNodeListWithErrorCallback:v27 successCallback:v26 nodeIds:v13 highlightConfig:v16 gridOverlayConfig:v23 flexOverlayConfig:v22];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v15 = v28;
    int v28 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB4230(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a10;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB432C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB43B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::hideHighlight(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) hideHighlightWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB4510(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB45AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB4634(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightFrame(uint64_t a1, uint64_t a2, void *a3, CFTypeRef *a4, void *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke;
    v22[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v22[4] = a1;
    v22[5] = a2;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke_2;
    v21[3] = &__block_descriptor_48_e5_v8__0l;
    v21[4] = a1;
    v21[5] = a2;
    if (*a3) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    long long v23 = 0;
    if (*a4)
    {
      uint64_t v12 = [RWIProtocolDOMRGBAColor alloc];
      long long v20 = *a4;
      *a4 = 0;
      long long v23 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v12 initWithJSONObject:&v20]);
      uint64_t v13 = v20;
      long long v20 = 0;
      if (v13)
      {
        if (*v13 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v13;
        }
      }
    }
    long long v20 = 0;
    if (*a5)
    {
      uint64_t v15 = [RWIProtocolDOMRGBAColor alloc];
      uint64_t v19 = (_DWORD *)*a5;
      *a5 = 0;
      long long v20 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v15 initWithJSONObject:&v19]);
      CFTypeRef v16 = v19;
      uint64_t v19 = 0;
      if (v16)
      {
        if (*v16 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v16;
        }
      }
      if (*a5) {
        char v17 = (CFTypeRef *)&v20;
      }
      else {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
    if (*a4) {
      char v18 = (CFTypeRef *)&v23;
    }
    else {
      char v18 = 0;
    }
    return [*(id *)(a1 + 16) highlightFrameWithErrorCallback:v22 successCallback:v21 frameId:v10 contentColor:v18 contentOutlineColor:v17];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v23;
    long long v23 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB48A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a10;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB4984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB4A0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::showGridOverlay(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (objc_opt_respondsToSelector())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v11[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v11[4] = a1;
    v11[5] = a2;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = a1;
    v10[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "showGridOverlayWithErrorCallback:successCallback:nodeId:gridOverlayConfig:", v11, v10, a3, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMGridOverlayConfig alloc], "initWithJSONObject:", a4)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB4B94(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB4C30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB4CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::hideGridOverlay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = a1;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = a1;
    v9[5] = a2;
    LODWORD(v11) = 0;
    if (*(unsigned char *)(a3 + 4))
    {
      LODWORD(v11) = *(_DWORD *)a3;
      uint64_t v6 = &v11;
    }
    else
    {
      uint64_t v6 = 0;
    }
    return [*(id *)(a1 + 16) hideGridOverlayWithErrorCallback:v10 successCallback:v9 nodeId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB4E38(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB4ED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB4F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::showFlexOverlay(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (objc_opt_respondsToSelector())
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v11[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v11[4] = a1;
    v11[5] = a2;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = a1;
    v10[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "showFlexOverlayWithErrorCallback:successCallback:nodeId:flexOverlayConfig:", v11, v10, a3, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMFlexOverlayConfig alloc], "initWithJSONObject:", a4)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v12;
    uint64_t v12 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB50E4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB5180(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB5208(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::hideFlexOverlay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = a1;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = a1;
    v9[5] = a2;
    LODWORD(v11) = 0;
    if (*(unsigned char *)(a3 + 4))
    {
      LODWORD(v11) = *(_DWORD *)a3;
      uint64_t v6 = &v11;
    }
    else
    {
      uint64_t v6 = 0;
    }
    return [*(id *)(a1 + 16) hideFlexOverlayWithErrorCallback:v10 successCallback:v9 nodeId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB5388(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB5424(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB54AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::pushNodeByPathToFrontend(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24pushNodeByPathToFrontendElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24pushNodeByPathToFrontendElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e8_v12__0i8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) pushNodeByPathToFrontendWithErrorCallback:v10 successCallback:v9 path:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB5628(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24pushNodeByPathToFrontendElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB56C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24pushNodeByPathToFrontendElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, WTF::JSONImpl::Value *a2)
{
  WTF::JSONImpl::Object::create(v7, a1);
  uint64_t v3 = (WTF::JSONImpl::ObjectBase *)v7[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v6 = (WTF::StringImpl *)v7[1];
  WTF::JSONImpl::ObjectBase::setInteger(v3, &v6, a2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = (_DWORD *)v7[0];
  v7[0] = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB57AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::resolveNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11resolveNodeEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11resolveNodeEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e40_v16__0__RWIProtocolRuntimeRemoteObject_8l;
    v11[4] = this;
    v11[5] = a2;
    uint64_t v13 = 0;
    if (*(void *)a4)
    {
      uint64_t v13 = WTF::StringImpl::operator NSString *();
      if (*(void *)a4) {
        unint64_t v8 = &v13;
      }
      else {
        unint64_t v8 = 0;
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    return [*((id *)this + 2) resolveNodeWithErrorCallback:v12 successCallback:v11 nodeId:a3 objectGroup:v8];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = (_DWORD *)v13;
    uint64_t v13 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB5984(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11resolveNodeEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB5A20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11resolveNodeEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"object" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  CFTypeRef v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  CFTypeRef v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB5BEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getAttributes(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getAttributesEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getAttributesEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getAttributesWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB5DD0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getAttributesEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB5E6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getAttributesEli_block_invoke_2(WTF::JSONImpl::Object *a1, Inspector *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v16, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"attributes" format];
  }
  uint64_t v3 = (uint64_t)v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = v17;
  Inspector::toJSONStringArray(a2, (uint64_t *)&v13);
  uint64_t v4 = (uint64_t)v13;
  uint64_t v13 = 0;
  CFTypeRef v14 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v15, (uint64_t *)&v14, (uint64_t)&v17);
  if (v18)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v15);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v15;
      if (v15) {
        *(_DWORD *)v15 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v14;
  CFTypeRef v14 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*v10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v10;
    }
  }
  uint64_t v11 = v15;
  uint64_t v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v16;
  CFTypeRef v16 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB602C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::moveTo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (objc_opt_respondsToSelector())
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher6moveToEliiONSt3__18optionalIiEE_block_invoke;
    v14[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v14[4] = a1;
    v14[5] = a2;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher6moveToEliiONSt3__18optionalIiEE_block_invoke_2;
    v13[3] = &__block_descriptor_48_e8_v12__0i8l;
    v13[4] = a1;
    v13[5] = a2;
    LODWORD(v15) = 0;
    if (*(unsigned char *)(a5 + 4))
    {
      LODWORD(v15) = *(_DWORD *)a5;
      uint64_t v10 = &v15;
    }
    else
    {
      uint64_t v10 = 0;
    }
    return [*(id *)(a1 + 16) moveToWithErrorCallback:v14 successCallback:v13 nodeId:a3 targetNodeId:a4 insertBeforeNodeId:v10];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v15;
    uint64_t v15 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB6244(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher6moveToEliiONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB62E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher6moveToEliiONSt3__18optionalIiEE_block_invoke_2(WTF::JSONImpl::Object *a1, WTF::JSONImpl::Value *a2)
{
  WTF::JSONImpl::Object::create(v7, a1);
  uint64_t v3 = (WTF::JSONImpl::ObjectBase *)v7[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v6 = (WTF::StringImpl *)v7[1];
  WTF::JSONImpl::ObjectBase::setInteger(v3, &v6, a2);
  uint64_t v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = (_DWORD *)v7[0];
  v7[0] = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB63C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::undo(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) undoWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB6568(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB6604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB668C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::redo(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) redoWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB67E8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB6884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB690C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::markUndoableState(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) markUndoableStateWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB6A68(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB6B04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB6B8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::focus(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) focusWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB6CF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB6D8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB6E14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setInspectedNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) setInspectedNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB6F78(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB7014(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB709C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setAllowEditingUserAgentShadowTrees(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) setAllowEditingUserAgentShadowTreesWithErrorCallback:v9 successCallback:v8 allow:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB7200(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB729C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB7324(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getMediaStats(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getMediaStatsEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getMediaStatsEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e34_v16__0__RWIProtocolDOMMediaStats_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) getMediaStatsWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB7488(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getMediaStatsEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB7524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getMediaStatsEli_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"mediaStats" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  CFTypeRef v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  CFTypeRef v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB76F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::enable(Inspector::ObjCInspectorDOMStorageBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) enableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB78CC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB7968(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB79F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::disable(Inspector::ObjCInspectorDOMStorageBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) disableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    unint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB7B4C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB7BE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB7C70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::getDOMStorageItems(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "getDOMStorageItemsWithErrorCallback:successCallback:storageId:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMStorageStorageId alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB7DF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB7E8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1, Inspector *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v16, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"entries" format];
  }
  uint64_t v3 = (uint64_t)v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v15 = v17;
  Inspector::toJSONStringArrayArray(a2, (uint64_t *)&v13);
  uint64_t v4 = (uint64_t)v13;
  uint64_t v13 = 0;
  CFTypeRef v14 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v15, (uint64_t *)&v14, (uint64_t)&v17);
  if (v18)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v15);
    }
    else
    {
      uint64_t v7 = *v5;
      unint64_t v8 = v15;
      if (v15) {
        *(_DWORD *)v15 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v14;
  CFTypeRef v14 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v13;
  uint64_t v13 = 0;
  if (v10)
  {
    if (*v10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v10;
    }
  }
  uint64_t v11 = v15;
  uint64_t v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v16;
  CFTypeRef v16 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB804C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::setDOMStorageItem(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke;
    v16[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v16[4] = a1;
    v16[5] = a2;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke_2;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = a1;
    v15[5] = a2;
    CFTypeRef v10 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolDOMStorageStorageId alloc] initWithJSONObject:a3]);
    if (*a4) {
      uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v11 = &stru_26DB29208;
    }
    if (*a5) {
      uint64_t v13 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v13 = &stru_26DB29208;
    }
    return [*(id *)(a1 + 16) setDOMStorageItemWithErrorCallback:v16 successCallback:v15 storageId:v10 key:v11 value:v13];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v12 = v17;
    char v17 = 0;
    if (v12)
    {
      if (*v12 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v12 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB829C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB8338(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB83C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::removeDOMStorageItem(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = a1;
    v12[5] = a2;
    CFTypeRef v8 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)[RWIProtocolDOMStorageStorageId alloc] initWithJSONObject:a3]);
    if (*a4) {
      uint64_t v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v9 = &stru_26DB29208;
    }
    return [*(id *)(a1 + 16) removeDOMStorageItemWithErrorCallback:v13 successCallback:v12 storageId:v8 key:v9];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    CFTypeRef v10 = v14;
    CFTypeRef v14 = 0;
    if (v10)
    {
      if (*v10 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v10 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB8564(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB8600(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB8688(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::clearDOMStorageItems(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "clearDOMStorageItemsWithErrorCallback:successCallback:storageId:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMStorageStorageId alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    CFTypeRef v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB8808(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB88A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB892C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::enable(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) enableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    CFTypeRef v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB8A88(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB8B24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB8BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::disable(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) disableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    CFTypeRef v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB8D08(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB8DA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB8E2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::setExtraHTTPHeaders(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "setExtraHTTPHeadersWithErrorCallback:successCallback:headers:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolNetworkHeaders alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    CFTypeRef v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FB8FAC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB9048(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB90D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::getResponseBody(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15getResponseBodyElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15getResponseBodyElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e21_v20__0__NSString_8B16l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) getResponseBodyWithErrorCallback:v10 successCallback:v9 requestId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB924C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15getResponseBodyElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB92E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15getResponseBodyElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2, WTF::JSONImpl::Value *a3)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v12, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"body" format];
  }
  uint64_t v5 = v12;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = v13;
  MEMORY[0x22A6705C0](&v13, a2);
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v11, (const WTF::String *)&v13);
  uint64_t v6 = v13;
  uint64_t v13 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  CFTypeRef v8 = v12;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = v13;
  WTF::JSONImpl::ObjectBase::setBoolean(v8, &v11, a3);
  uint64_t v9 = v11;
  uint64_t v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v12;
  uint64_t v12 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FB9490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setBoolean(WTF::JSONImpl::ObjectBase *this, WTF::StringImpl **a2, WTF::JSONImpl::Value *a3)
{
  WTF::JSONImpl::Value::create(a3);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    uint64_t v5 = (uint64_t *)((char *)this + 24);
    uint64_t v6 = *((unsigned int *)this + 9);
    if (v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      uint64_t v7 = *v5;
      CFTypeRef v8 = *a2;
      if (*a2) {
        *(_DWORD *)v8 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  uint64_t result = v10;
  CFTypeRef v10 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB95DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::setResourceCachingDisabled(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) setResourceCachingDisabledWithErrorCallback:v9 successCallback:v8 disabled:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    CFTypeRef v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB9740(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB97DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FB9864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::loadResource(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e34_v28__0__NSString_8__NSString_16i24l;
    v12[4] = this;
    v12[5] = a2;
    if (*(void *)a3) {
      CFTypeRef v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFTypeRef v8 = &stru_26DB29208;
    }
    if (*(void *)a4) {
      CFTypeRef v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFTypeRef v10 = &stru_26DB29208;
    }
    return [*((id *)this + 2) loadResourceWithErrorCallback:v13 successCallback:v12 frameId:v8 url:v10];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v14;
    CFTypeRef v14 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB9A04(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB9AA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2, uint64_t a3, WTF::JSONImpl::Value *a4)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v17, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"content" format];
  }
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"mimeType" format];
  }
  uint64_t v7 = v17;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  CFTypeRef v16 = v18;
  MEMORY[0x22A6705C0](&v18, a2);
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v16, (const WTF::String *)&v18);
  CFTypeRef v8 = v18;
  char v18 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  uint64_t v9 = v16;
  CFTypeRef v16 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  CFTypeRef v10 = v17;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  CFTypeRef v16 = v18;
  MEMORY[0x22A6705C0](&v18, a3);
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v16, (const WTF::String *)&v18);
  uint64_t v11 = v18;
  char v18 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  uint64_t v12 = v16;
  CFTypeRef v16 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  uint64_t v13 = v17;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  CFTypeRef v16 = v18;
  WTF::JSONImpl::ObjectBase::setInteger(v13, &v16, a4);
  CFTypeRef v14 = v16;
  CFTypeRef v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v17;
  char v17 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FB9D00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::getSerializedCertificate(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) getSerializedCertificateWithErrorCallback:v10 successCallback:v9 requestId:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FB9EF8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FB9F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"serializedCertificate" format];
  }
  uint64_t v3 = v8;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v9;
  MEMORY[0x22A6705C0](&v9, a2);
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
  uint64_t v4 = v9;
  uint64_t v9 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  CFTypeRef v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FBA0DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::resolveWebSocket(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher16resolveWebSocketElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher16resolveWebSocketElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e40_v16__0__RWIProtocolRuntimeRemoteObject_8l;
    v12[4] = this;
    v12[5] = a2;
    if (*(void *)a3) {
      CFTypeRef v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFTypeRef v8 = &stru_26DB29208;
    }
    uint64_t v14 = 0;
    if (*(void *)a4)
    {
      uint64_t v14 = WTF::StringImpl::operator NSString *();
      if (*(void *)a4) {
        CFTypeRef v10 = &v14;
      }
      else {
        CFTypeRef v10 = 0;
      }
    }
    else
    {
      CFTypeRef v10 = 0;
    }
    return [*((id *)this + 2) resolveWebSocketWithErrorCallback:v13 successCallback:v12 requestId:v8 objectGroup:v10];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = (_DWORD *)v14;
    uint64_t v14 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBA2FC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher16resolveWebSocketElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBA398(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher16resolveWebSocketElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"object" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      CFTypeRef v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  CFTypeRef v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBA564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::setInterceptionEnabled(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) setInterceptionEnabledWithErrorCallback:v9 successCallback:v8 enabled:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    CFTypeRef v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBA748(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBA7E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBA86C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::addInterception(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, unsigned char *a5, char *a6)
{
  if (objc_opt_respondsToSelector())
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke;
    v25[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v25[4] = a1;
    v25[5] = a2;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2;
    v24[3] = &__block_descriptor_48_e5_v8__0l;
    v24[4] = a1;
    v24[5] = a2;
    if (*a3) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_26DB29208;
    }
    uint64_t v14 = *a4;
    if (*a4)
    {
      uint64_t v15 = *(unsigned __int8 **)(v14 + 8);
      unint64_t v16 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0x100000000;
    }
    uint64_t v17 = 0;
    while (!WTF::operator==(v15, v16, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 1]))
    {
      v17 += 3;
      if (v17 == 6)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        uint64_t result = v26;
        long long v26 = 0;
        if (result)
        {
          if (*result == 2) {
            return (_DWORD *)WTF::StringImpl::destroy();
          }
          else {
            *result -= 2;
          }
        }
        return result;
      }
    }
    char v18 = (&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 2];
    LOBYTE(v26) = 0;
    int v19 = a5[1];
    if (a5[1]) {
      LOBYTE(v26) = *a5;
    }
    char v23 = 0;
    if (a6[1])
    {
      char v23 = *a6;
      long long v20 = &v23;
    }
    else
    {
      long long v20 = 0;
    }
    if (v19) {
      uint64_t v22 = &v26;
    }
    else {
      uint64_t v22 = 0;
    }
    return (_DWORD *)[*(id *)(a1 + 16) addInterceptionWithErrorCallback:v25 successCallback:v24 url:v12 stage:v18 caseSensitive:v22 isRegex:v20];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v13 = v26;
    long long v26 = 0;
    if (v13)
    {
      if (*v13 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v13 -= 2;
      }
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBAB04(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 72);
  *(void *)(v1 - 72) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBABB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBAC40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::removeInterception(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, unsigned char *a5, char *a6)
{
  if (objc_opt_respondsToSelector())
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke;
    v25[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v25[4] = a1;
    v25[5] = a2;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2;
    v24[3] = &__block_descriptor_48_e5_v8__0l;
    v24[4] = a1;
    v24[5] = a2;
    if (*a3) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_26DB29208;
    }
    uint64_t v14 = *a4;
    if (*a4)
    {
      uint64_t v15 = *(unsigned __int8 **)(v14 + 8);
      unint64_t v16 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0x100000000;
    }
    uint64_t v17 = 0;
    while (!WTF::operator==(v15, v16, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 1]))
    {
      v17 += 3;
      if (v17 == 6)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        uint64_t result = v26;
        long long v26 = 0;
        if (result)
        {
          if (*result == 2) {
            return (_DWORD *)WTF::StringImpl::destroy();
          }
          else {
            *result -= 2;
          }
        }
        return result;
      }
    }
    char v18 = (&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 2];
    LOBYTE(v26) = 0;
    int v19 = a5[1];
    if (a5[1]) {
      LOBYTE(v26) = *a5;
    }
    char v23 = 0;
    if (a6[1])
    {
      char v23 = *a6;
      long long v20 = &v23;
    }
    else
    {
      long long v20 = 0;
    }
    if (v19) {
      uint64_t v22 = &v26;
    }
    else {
      uint64_t v22 = 0;
    }
    return (_DWORD *)[*(id *)(a1 + 16) removeInterceptionWithErrorCallback:v25 successCallback:v24 url:v12 stage:v18 caseSensitive:v22 isRegex:v20];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v13 = v26;
    long long v26 = 0;
    if (v13)
    {
      if (*v13 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v13 -= 2;
      }
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBAED8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 72);
  *(void *)(v1 - 72) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBAF8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBB014(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::interceptContinue(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke;
    v16[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v16[4] = this;
    v16[5] = a2;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke_2;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = this;
    v15[5] = a2;
    if (*(void *)a3) {
      CFTypeRef v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFTypeRef v8 = &stru_26DB29208;
    }
    uint64_t v10 = *(void *)a4;
    if (*(void *)a4)
    {
      uint64_t v11 = *(unsigned __int8 **)(v10 + 8);
      unint64_t v12 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0x100000000;
    }
    for (uint64_t i = 0; i != 6; i += 3)
    {
      if (WTF::operator==(v11, v12, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)[*((id *)this + 2) interceptContinueWithErrorCallback:v16 successCallback:v15 requestId:v8 stage:(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[i + 2]];
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t result = v17;
    uint64_t v17 = 0;
    if (result)
    {
      if (*result == 2) {
        return (_DWORD *)WTF::StringImpl::destroy();
      }
      else {
        *result -= 2;
      }
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v17;
    uint64_t v17 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_226FBB25C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBB310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBB398(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::interceptWithRequest(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t *a6, void *a7)
{
  if (objc_opt_respondsToSelector())
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    void v26[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    if (*a3) {
      uint64_t v14 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v14 = &stru_26DB29208;
    }
    uint64_t v28 = 0;
    if (*a4) {
      uint64_t v28 = WTF::StringImpl::operator NSString *();
    }
    uint64_t v25 = 0;
    if (*a5) {
      uint64_t v25 = WTF::StringImpl::operator NSString *();
    }
    CFTypeRef v24 = 0;
    if (*a6)
    {
      unint64_t v16 = [RWIProtocolNetworkHeaders alloc];
      uint64_t v23 = *a6;
      *a6 = 0;
      CFTypeRef v24 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v16 initWithJSONObject:&v23]);
      uint64_t v17 = (_DWORD *)v23;
      uint64_t v23 = 0;
      if (v17)
      {
        if (*v17 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*v17;
        }
      }
    }
    uint64_t v23 = 0;
    if (*a7)
    {
      uint64_t v23 = WTF::StringImpl::operator NSString *();
      int v19 = &v23;
      if (!*a7) {
        int v19 = 0;
      }
    }
    else
    {
      int v19 = 0;
    }
    if (*a4) {
      long long v20 = &v28;
    }
    else {
      long long v20 = 0;
    }
    if (*a5) {
      long long v21 = &v25;
    }
    else {
      long long v21 = 0;
    }
    if (*a6) {
      uint64_t v22 = &v24;
    }
    else {
      uint64_t v22 = 0;
    }
    return [*(id *)(a1 + 16) interceptWithRequestWithErrorCallback:v27 successCallback:v26 requestId:v14 url:v20 method:v21 headers:v22 postData:v19];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v15 = (_DWORD *)v28;
    uint64_t v28 = 0;
    if (v15)
    {
      if (*v15 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v15 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBB61C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBB6E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBB770(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::interceptWithResponse(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, int *a7, void *a8, CFTypeRef **a9)
{
  if (objc_opt_respondsToSelector())
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke;
    v32[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v32[4] = a1;
    v32[5] = a2;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke_2;
    v31[3] = &__block_descriptor_48_e5_v8__0l;
    v31[4] = a1;
    v31[5] = a2;
    if (*a3) {
      uint64_t v17 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v17 = &stru_26DB29208;
    }
    if (*a4) {
      int v19 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      int v19 = &stru_26DB29208;
    }
    uint64_t v33 = 0;
    if (*a6) {
      uint64_t v33 = WTF::StringImpl::operator NSString *();
    }
    int v30 = 0;
    if (*((unsigned char *)a7 + 4)) {
      int v30 = *a7;
    }
    uint64_t v29 = 0;
    if (*a8) {
      uint64_t v29 = WTF::StringImpl::operator NSString *();
    }
    CFTypeRef v28 = 0;
    long long v20 = *a9;
    if (*a9)
    {
      long long v21 = [RWIProtocolNetworkHeaders alloc];
      CFTypeRef v27 = *a9;
      *a9 = 0;
      CFTypeRef v28 = (id)CFMakeCollectable([(RWIProtocolJSONObject *)v21 initWithJSONObject:&v27]);
      uint64_t v22 = v27;
      CFTypeRef v27 = 0;
      if (v22)
      {
        if (*(_DWORD *)v22 == 1) {
          WTF::JSONImpl::Value::operator delete();
        }
        else {
          --*(_DWORD *)v22;
        }
      }
      long long v20 = &v28;
      if (!*a9) {
        long long v20 = 0;
      }
    }
    if (*a6) {
      CFTypeRef v24 = &v33;
    }
    else {
      CFTypeRef v24 = 0;
    }
    uint64_t v25 = &v30;
    if (!*((unsigned char *)a7 + 4)) {
      uint64_t v25 = 0;
    }
    long long v26 = &v29;
    if (!*a8) {
      long long v26 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "interceptWithResponseWithErrorCallback:successCallback:requestId:content:base64Encoded:mimeType:status:statusText:headers:", v32, v31, v17, v19, a5, v24, v25, v26, v20, v27, v28, v29);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    char v18 = (_DWORD *)v33;
    uint64_t v33 = 0;
    if (v18)
    {
      if (*v18 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v18 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBBA1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBBAE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBBB70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::interceptRequestWithResponse(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, int a7, void *a8, uint64_t a9)
{
  if (objc_opt_respondsToSelector())
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke;
    v25[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v25[4] = a1;
    v25[5] = a2;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke_2;
    v24[3] = &__block_descriptor_48_e5_v8__0l;
    v24[4] = a1;
    v24[5] = a2;
    if (*a3) {
      uint64_t v17 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v17 = &stru_26DB29208;
    }
    if (*a4) {
      int v19 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      int v19 = &stru_26DB29208;
    }
    if (*a6) {
      long long v20 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      long long v20 = &stru_26DB29208;
    }
    if (*a8) {
      long long v21 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      long long v21 = &stru_26DB29208;
    }
    LODWORD(v23) = a7;
    return objc_msgSend(*(id *)(a1 + 16), "interceptRequestWithResponseWithErrorCallback:successCallback:requestId:content:base64Encoded:mimeType:status:statusText:headers:", v25, v24, v17, v19, a5, v20, v23, v21, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolNetworkHeaders alloc], "initWithJSONObject:", a9)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    char v18 = v26;
    long long v26 = 0;
    if (v18)
    {
      if (*v18 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v18 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBBDA0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 72);
  *(void *)(v1 - 72) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBBE3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBBEC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::interceptRequestWithError(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke;
    v16[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v16[4] = this;
    v16[5] = a2;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke_2;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = this;
    v15[5] = a2;
    if (*(void *)a3) {
      CFTypeRef v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CFTypeRef v8 = &stru_26DB29208;
    }
    uint64_t v10 = *(void *)a4;
    if (*(void *)a4)
    {
      uint64_t v11 = *(unsigned __int8 **)(v10 + 8);
      unint64_t v12 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0x100000000;
    }
    for (uint64_t i = 0; i != 12; i += 3)
    {
      if (WTF::operator==(v11, v12, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkResourceErrorType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkResourceErrorType>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)[*((id *)this + 2) interceptRequestWithErrorWithErrorCallback:v16 successCallback:v15 requestId:v8 errorType:(&Inspector::fromProtocolString<RWIProtocolNetworkResourceErrorType>(WTF::String const&)::mappings)[i + 2]];
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t result = v17;
    uint64_t v17 = 0;
    if (result)
    {
      if (*result == 2) {
        return (_DWORD *)WTF::StringImpl::destroy();
      }
      else {
        *result -= 2;
      }
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v17;
    uint64_t v17 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_226FBC10C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBC1C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBC248(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::enable(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) enableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    CFTypeRef v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBC3A4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBC440(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBC4C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::disable(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) disableWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    CFTypeRef v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBC624(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBC6C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBC748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::reload(uint64_t a1, uint64_t a2, unsigned char *a3, char *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = a1;
    v15[5] = a2;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = a1;
    v14[5] = a2;
    LOBYTE(v16) = 0;
    int v8 = a3[1];
    if (a3[1]) {
      LOBYTE(v16) = *a3;
    }
    char v13 = 0;
    if (a4[1])
    {
      char v13 = *a4;
      uint64_t v9 = &v13;
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (v8) {
      uint64_t v11 = &v16;
    }
    else {
      uint64_t v11 = 0;
    }
    return [*(id *)(a1 + 16) reloadWithErrorCallback:v15 successCallback:v14 ignoreCache:v11 revalidateAllResources:v9];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v10 = v16;
    unint64_t v16 = 0;
    if (v10)
    {
      if (*v10 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v10 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBC8EC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBC988(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBCA10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::navigate(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) navigateWithErrorCallback:v10 successCallback:v9 url:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBCB8C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBCC28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBCCB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::overrideUserAgent(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    uint64_t v11 = 0;
    if (*(void *)a3)
    {
      uint64_t v11 = WTF::StringImpl::operator NSString *();
      if (*(void *)a3) {
        uint64_t v6 = &v11;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    return [*((id *)this + 2) overrideUserAgentWithErrorCallback:v10 successCallback:v9 value:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = (_DWORD *)v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBCE3C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBCED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBCF60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorPageBackendDispatcher::overrideSetting(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned char *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke;
    v17[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v17[4] = a1;
    v17[5] = a2;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke_2;
    v16[3] = &__block_descriptor_48_e5_v8__0l;
    v16[4] = a1;
    v16[5] = a2;
    uint64_t v8 = *a3;
    if (*a3)
    {
      uint64_t v9 = *(unsigned __int8 **)(v8 + 8);
      unint64_t v10 = *(unsigned int *)(v8 + 4) | ((unint64_t)((*(_DWORD *)(v8 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0x100000000;
    }
    uint64_t v12 = 0;
    while (!WTF::operator==(v9, v10, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageSetting>(WTF::String const&)::mappings)[v12], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageSetting>(WTF::String const&)::mappings)[v12 + 1]))
    {
      v12 += 3;
      if (v12 == 36)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        uint64_t result = v18;
        char v18 = 0;
        if (result)
        {
          if (*result == 2) {
            return (_DWORD *)WTF::StringImpl::destroy();
          }
          else {
            *result -= 2;
          }
        }
        return result;
      }
    }
    char v13 = (&Inspector::fromProtocolString<RWIProtocolPageSetting>(WTF::String const&)::mappings)[v12 + 2];
    LOBYTE(v18) = 0;
    if (a4[1])
    {
      LOBYTE(v18) = *a4;
      uint64_t v14 = &v18;
    }
    else
    {
      uint64_t v14 = 0;
    }
    return (_DWORD *)[*(id *)(a1 + 16) overrideSettingWithErrorCallback:v17 successCallback:v16 setting:v13 value:v14];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v18;
    char v18 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBD1A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBD25C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBD2E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

char *Inspector::ObjCInspectorPageBackendDispatcher::overrideUserPreference(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke;
    v24[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v24[4] = this;
    v24[5] = a2;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke_2;
    v23[3] = &__block_descriptor_48_e5_v8__0l;
    v23[4] = this;
    v23[5] = a2;
    uint64_t v8 = *(void *)a3;
    if (*(void *)a3)
    {
      uint64_t v9 = *(unsigned __int8 **)(v8 + 8);
      unint64_t v10 = *(unsigned int *)(v8 + 4) | ((unint64_t)((*(_DWORD *)(v8 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0x100000000;
    }
    uint64_t v12 = 0;
    while (!WTF::operator==(v9, v10, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[v12], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[v12 + 1]))
    {
      v12 += 3;
      if (v12 == 9)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        uint64_t result = v21;
        long long v21 = 0;
        if (result)
        {
          if (*(_DWORD *)result == 2) {
            return (char *)WTF::StringImpl::destroy();
          }
          else {
            *(_DWORD *)result -= 2;
          }
        }
        return result;
      }
    }
    char v13 = (&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[v12 + 2];
    LOBYTE(v21) = 0;
    LOBYTE(v22) = 0;
    uint64_t v14 = *(void *)a4;
    if (*(void *)a4)
    {
      uint64_t v15 = 0;
      unint64_t v16 = *(unsigned __int8 **)(v14 + 8);
      unint64_t v17 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
      do
      {
        if (WTF::operator==(v16, v17, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[v15], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[v15 + 1]))
        {
          long long v21 = (&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[v15 + 2];
          LOBYTE(v22) = 1;
          if (*(void *)a4) {
            int v19 = &v21;
          }
          else {
            int v19 = 0;
          }
          return (char *)objc_msgSend(*((id *)this + 2), "overrideUserPreferenceWithErrorCallback:successCallback:name:value:", v24, v23, v13, v19, v21, v22);
        }
        v15 += 3;
      }
      while (v15 != 15);
      int v19 = 0;
      long long v21 = 0;
      LOBYTE(v22) = 0;
      if (*(void *)a4)
      {
        long long v20 = (_Unwind_Exception *)std::__throw_bad_optional_access[abi:sn180100]();
        long long v21 = 0;
        _Unwind_Resume(v20);
      }
    }
    else
    {
      int v19 = 0;
    }
    return (char *)objc_msgSend(*((id *)this + 2), "overrideUserPreferenceWithErrorCallback:successCallback:name:value:", v24, v23, v13, v19, v21, v22);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v21;
    long long v21 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    return (char *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBD674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBD6FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::getCookies(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher10getCookiesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher10getCookiesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) getCookiesWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    uint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBD858(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher10getCookiesEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBD8F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher10getCookiesEl_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"cookies" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  long long v20 = 0;
  long long v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    uint64_t v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  unint64_t v16 = v21;
  long long v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  unint64_t v17 = v20;
  long long v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  char v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  CFTypeRef v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBDBDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setCookie(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "setCookieWithErrorCallback:successCallback:cookie:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolPageCookie alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBDDF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBDE8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBDF14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::deleteCookie(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = this;
    v12[5] = a2;
    if (*(void *)a3) {
      uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v8 = &stru_26DB29208;
    }
    if (*(void *)a4) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    return [*((id *)this + 2) deleteCookieWithErrorCallback:v13 successCallback:v12 cookieName:v8 url:v10];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v14;
    uint64_t v14 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBE0B4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBE150(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBE1D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::getResourceTree(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15getResourceTreeEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15getResourceTreeEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e42_v16__0__RWIProtocolPageFrameResourceTree_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) getResourceTreeWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    uint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBE334(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15getResourceTreeEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBE3D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher15getResourceTreeEl_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v15, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"frameTree" format];
  }
  uint64_t v3 = (uint64_t)v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v14 = v16;
  if (a2)
  {
    [a2 toJSONObject];
    uint64_t v4 = v12;
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v3 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    uint64_t v5 = (uint64_t *)(v3 + 24);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
    if (v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      uint64_t v7 = *v5;
      uint64_t v8 = v14;
      if (v14) {
        *(_DWORD *)v14 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  uint64_t v9 = v13;
  uint64_t v13 = 0;
  if (v9)
  {
    if (*v9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v9;
    }
  }
  uint64_t v10 = v14;
  uint64_t v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v15;
  uint64_t v15 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBE59C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::getResourceContent(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  if (objc_opt_respondsToSelector())
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18getResourceContentElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18getResourceContentElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e21_v20__0__NSString_8B16l;
    v12[4] = this;
    v12[5] = a2;
    if (*(void *)a3) {
      uint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v8 = &stru_26DB29208;
    }
    if (*(void *)a4) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    return [*((id *)this + 2) getResourceContentWithErrorCallback:v13 successCallback:v12 frameId:v8 url:v10];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v9 = v14;
    uint64_t v14 = 0;
    if (v9)
    {
      if (*v9 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v9 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBE7BC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18getResourceContentElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBE858(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector34ObjCInspectorPageBackendDispatcher18getResourceContentElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2, WTF::JSONImpl::Value *a3)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v12, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"content" format];
  }
  uint64_t v5 = v12;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = v13;
  MEMORY[0x22A6705C0](&v13, a2);
  WTF::JSONImpl::ObjectBase::setString(v5, (const WTF::String *)&v11, (const WTF::String *)&v13);
  uint64_t v6 = v13;
  uint64_t v13 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  uint64_t v8 = v12;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v11 = v13;
  WTF::JSONImpl::ObjectBase::setBoolean(v8, &v11, a3);
  uint64_t v9 = v11;
  uint64_t v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v12;
  uint64_t v12 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FBEA00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setBootstrapScript(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    uint64_t v11 = 0;
    if (*(void *)a3)
    {
      uint64_t v11 = WTF::StringImpl::operator NSString *();
      if (*(void *)a3) {
        uint64_t v6 = &v11;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    return [*((id *)this + 2) setBootstrapScriptWithErrorCallback:v10 successCallback:v9 source:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = (_DWORD *)v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBEC04(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBECA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBED28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::searchInResource(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, char *a6, char *a7, void *a8)
{
  if (objc_opt_respondsToSelector())
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16searchInResourceElRKN3WTF6StringES4_S4_ONSt3__18optionalIbEES8_S4__block_invoke;
    v29[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v29[4] = a1;
    v29[5] = a2;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16searchInResourceElRKN3WTF6StringES4_S4_ONSt3__18optionalIbEES8_S4__block_invoke_2;
    v28[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v28[4] = a1;
    v28[5] = a2;
    if (*a3) {
      unint64_t v16 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v16 = &stru_26DB29208;
    }
    if (*a4) {
      char v18 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      char v18 = &stru_26DB29208;
    }
    if (*a5) {
      int v19 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      int v19 = &stru_26DB29208;
    }
    char v27 = 0;
    int v20 = a6[1];
    if (a6[1]) {
      char v27 = *a6;
    }
    char v26 = 0;
    int v21 = a7[1];
    if (a7[1]) {
      char v26 = *a7;
    }
    uint64_t v30 = 0;
    if (*a8)
    {
      uint64_t v30 = WTF::StringImpl::operator NSString *();
      int v20 = a6[1];
      int v21 = a7[1];
      uint64_t v22 = &v30;
      if (!*a8) {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    if (v20) {
      long long v23 = &v27;
    }
    else {
      long long v23 = 0;
    }
    long long v24 = &v26;
    if (!v21) {
      long long v24 = 0;
    }
    return [*(id *)(a1 + 16) searchInResourceWithErrorCallback:v29 successCallback:v28 frameId:v16 url:v18 query:v19 caseSensitive:v23 isRegex:v24 requestId:v22];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    char v17 = (_DWORD *)v30;
    uint64_t v30 = 0;
    if (v17)
    {
      if (*v17 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v17 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBEF84(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 72);
  *(void *)(v1 - 72) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16searchInResourceElRKN3WTF6StringES4_S4_ONSt3__18optionalIbEES8_S4__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBF020(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher16searchInResourceElRKN3WTF6StringES4_S4_ONSt3__18optionalIbEES8_S4__block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"result" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  int v20 = 0;
  int v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    uint64_t v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  unint64_t v16 = v21;
  int v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  char v17 = v20;
  int v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  char v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  char v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBF308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::searchInResources(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4, char *a5)
{
  if (objc_opt_respondsToSelector())
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke;
    v18[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v18[4] = a1;
    v18[5] = a2;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke_2;
    v17[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v17[4] = a1;
    v17[5] = a2;
    if (*a3) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_26DB29208;
    }
    LOBYTE(v19) = 0;
    int v12 = a4[1];
    if (a4[1]) {
      LOBYTE(v19) = *a4;
    }
    char v16 = 0;
    if (a5[1])
    {
      char v16 = *a5;
      uint64_t v13 = &v16;
    }
    else
    {
      uint64_t v13 = 0;
    }
    if (v12) {
      uint64_t v14 = &v19;
    }
    else {
      uint64_t v14 = 0;
    }
    return [*(id *)(a1 + 16) searchInResourcesWithErrorCallback:v18 successCallback:v17 text:v10 caseSensitive:v14 isRegex:v13];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v11 = v19;
    int v19 = 0;
    if (v11)
    {
      if (*v11 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v11 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_226FBF568(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 56);
  *(void *)(v1 - 56) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBF604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  WTF::JSONImpl::Object::create((uint64_t *)&v27, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"result" format];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v24;
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(a2);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v8 = (void *)MEMORY[0x263EFF940];
          uint64_t v9 = (objc_class *)objc_opt_class();
          [v8 raise:v5, @"array should contain objects of type '%@', found bad value: %@", NSStringFromClass(v9), v7 format];
        }
      }
      uint64_t v3 = [a2 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v3);
  }
  uint64_t v10 = (uint64_t)v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  uint64_t v11 = (uint64_t)v20;
  int v20 = 0;
  int v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v10 + 16), &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    int v12 = (uint64_t *)(v10 + 24);
    uint64_t v13 = *(unsigned int *)(v10 + 36);
    if (v13 == *(_DWORD *)(v10 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      uint64_t v14 = *v12;
      uint64_t v15 = v22;
      if (v22) {
        *(_DWORD *)v22 += 2;
      }
      *(void *)(v14 + 8 * v13) = v15;
      *(_DWORD *)(v10 + 36) = v13 + 1;
    }
  }
  char v16 = v21;
  int v21 = 0;
  if (v16)
  {
    if (*v16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v16;
    }
  }
  char v17 = v20;
  int v20 = 0;
  if (v17)
  {
    if (*v17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*v17;
    }
  }
  char v18 = v22;
  uint64_t v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v27;
  char v27 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBF8EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a25)
  {
    if (*a25 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a25;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setShowPaintRects(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) setShowPaintRectsWithErrorCallback:v9 successCallback:v8 result:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBFAE4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBFB80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBFC08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setEmulatedMedia(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  if (objc_opt_respondsToSelector())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    if (*(void *)a3) {
      uint64_t v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v6 = &stru_26DB29208;
    }
    return [*((id *)this + 2) setEmulatedMediaWithErrorCallback:v10 successCallback:v9 media:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v11;
    uint64_t v11 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FBFD84(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FBFE20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

_DWORD *___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v2, a1);
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v2;
  int v2 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FBFEA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::snapshotNode(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v8[4] = this;
    v8[5] = a2;
    return [*((id *)this + 2) snapshotNodeWithErrorCallback:v9 successCallback:v8 nodeId:a3];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v7 = v10;
    uint64_t v10 = 0;
    if (v7)
    {
      if (*v7 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v7 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FC0004(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FC00A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"dataURL" format];
  }
  uint64_t v3 = v8;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v9;
  MEMORY[0x22A6705C0](&v9, a2);
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
  uint64_t v4 = v9;
  uint64_t v9 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  uint64_t v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FC01E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorPageBackendDispatcher::snapshotRect(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const WTF::String *a7)
{
  if (objc_opt_respondsToSelector())
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotRectEliiiiRKN3WTF6StringE_block_invoke;
    v21[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v21[4] = this;
    v21[5] = a2;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotRectEliiiiRKN3WTF6StringE_block_invoke_2;
    v20[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v20[4] = this;
    v20[5] = a2;
    uint64_t v14 = *(void *)a7;
    if (*(void *)a7)
    {
      uint64_t v15 = *(unsigned __int8 **)(v14 + 8);
      unint64_t v16 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
    }
    else
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0x100000000;
    }
    for (uint64_t i = 0; i != 6; i += 3)
    {
      if (WTF::operator==(v15, v16, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageCoordinateSystem>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageCoordinateSystem>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)[*((id *)this + 2) snapshotRectWithErrorCallback:v21 successCallback:v20 x:a3 y:a4 width:a5 height:a6 coordinateSystem:(&Inspector::fromProtocolString<RWIProtocolPageCoordinateSystem>(WTF::String const&)::mappings)[i + 2]];
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t result = v22;
    uint64_t v22 = 0;
    if (result)
    {
      if (*result == 2) {
        return (_DWORD *)WTF::StringImpl::destroy();
      }
      else {
        *result -= 2;
      }
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    char v17 = v22;
    uint64_t v22 = 0;
    if (v17)
    {
      if (*v17 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v17 -= 2;
      }
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_226FC04A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 88);
  *(void *)(v1 - 88) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotRectEliiiiRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FC055C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotRectEliiiiRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"dataURL" format];
  }
  uint64_t v3 = v8;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v9;
  MEMORY[0x22A6705C0](&v9, a2);
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
  uint64_t v4 = v9;
  uint64_t v9 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  uint64_t v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FC06A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::archive(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  if (objc_opt_respondsToSelector())
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7archiveEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7archiveEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v6[4] = this;
    v6[5] = a2;
    return [*((id *)this + 2) archiveWithErrorCallback:v7 successCallback:v6];
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    uint64_t v5 = v8;
    uint64_t v8 = 0;
    if (v5)
    {
      if (*v5 == 2) {
        WTF::StringImpl::destroy();
      }
      else {
        *v5 -= 2;
      }
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_226FC0868(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 - 40);
  *(void *)(v1 - 40) = 0;
  if (v3) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7archiveEl_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MEMORY[0x22A6705C0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  int v2 = v4;
  uint64_t v4 = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_226FC0904(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::ObjectBase *___ZN9Inspector34ObjCInspectorPageBackendDispatcher7archiveEl_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  WTF::JSONImpl::Object::create((uint64_t *)&v8, a1);
  if (!a2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required parameter '%@' cannot be nil", @"data" format];
  }
  uint64_t v3 = v8;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v7 = v9;
  MEMORY[0x22A6705C0](&v9, a2);
  WTF::JSONImpl::ObjectBase::setString(v3, (const WTF::String *)&v7, (const WTF::String *)&v9);
  uint64_t v4 = v9;
  uint64_t v9 = 0;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*v5 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v5 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  uint64_t result = v8;
  uint64_t v8 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1) {
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*(_DWORD *)result;
    }
  }
  return result;
}

void sub_226FC0A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

void Inspector::ObjCInspectorCSSBackendDispatcher::~ObjCInspectorCSSBackendDispatcher(Inspector::ObjCInspectorCSSBackendDispatcher *this, void *a2)
{
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
}

{
  const void *v3;
  WTF *v4;
  uint64_t vars8;

  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorDOMBackendDispatcher::~ObjCInspectorDOMBackendDispatcher(Inspector::ObjCInspectorDOMBackendDispatcher *this, void *a2)
{
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
}

{
  const void *v3;
  WTF *v4;
  uint64_t vars8;

  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorDOMStorageBackendDispatcher::~ObjCInspectorDOMStorageBackendDispatcher(Inspector::ObjCInspectorDOMStorageBackendDispatcher *this, void *a2)
{
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
}

{
  const void *v3;
  WTF *v4;
  uint64_t vars8;

  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorNetworkBackendDispatcher::~ObjCInspectorNetworkBackendDispatcher(Inspector::ObjCInspectorNetworkBackendDispatcher *this, void *a2)
{
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
}

{
  const void *v3;
  WTF *v4;
  uint64_t vars8;

  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorPageBackendDispatcher::~ObjCInspectorPageBackendDispatcher(Inspector::ObjCInspectorPageBackendDispatcher *this, void *a2)
{
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
}

{
  const void *v3;
  WTF *v4;
  uint64_t vars8;

  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (WTF *)*((void *)this + 1);
  *((void *)this + 1) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  WTF::fastFree(this, a2);
}

_DWORD *WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>@<X0>(uint64_t *a1@<X0>, WTF::StringImpl **a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  CFTypeRef v28 = a3;
  uint64_t v8 = *a1;
  if (*a1
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(a1, 0), (uint64_t v8 = *a1) != 0))
  {
    int v9 = *(_DWORD *)(v8 - 8);
  }
  else
  {
    int v9 = 0;
  }
  unsigned int v10 = *((_DWORD *)*a2 + 4);
  if (v10 < 0x100) {
    unsigned int v11 = WTF::StringImpl::hashSlowCase(*a2);
  }
  else {
    unsigned int v11 = v10 >> 8;
  }
  int v12 = 0;
  for (int i = 1; ; ++i)
  {
    uint64_t v14 = v11 & v9;
    uint64_t v15 = (void *)(v8 + 16 * v14);
    if (*v15 != -1) {
      break;
    }
    int v12 = (void *)(v8 + 16 * v14);
LABEL_13:
    unsigned int v11 = i + v14;
  }
  if (!*v15)
  {
    if (v12)
    {
      *int v12 = 0;
      v12[1] = 0;
      --*(_DWORD *)(*a1 - 16);
      uint64_t v15 = v12;
    }
    uint64_t result = WTF::HashMapTranslator<WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>::translate<WTF::String const&,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableAddResult<WTF::HashTableIterator<WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>,WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>> WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineAdd<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>> &&)::{lambda(void)#1}>((uint64_t)v15, (_DWORD **)a2, &v28);
    uint64_t v17 = *a1;
    if (*a1) {
      int v18 = *(_DWORD *)(v17 - 12) + 1;
    }
    else {
      int v18 = 1;
    }
    *(_DWORD *)(v17 - 12) = v18;
    uint64_t v21 = *a1;
    if (*a1) {
      int v22 = *(_DWORD *)(v21 - 12);
    }
    else {
      int v22 = 0;
    }
    uint64_t v25 = (*(_DWORD *)(v21 - 16) + v22);
    unint64_t v26 = *(unsigned int *)(v21 - 4);
    if (v26 > 0x400)
    {
      if (v26 > 2 * v25) {
        goto LABEL_33;
      }
    }
    else if (3 * v26 > 4 * v25)
    {
      goto LABEL_33;
    }
    uint64_t result = (_DWORD *)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(a1, (uint64_t)v15);
    uint64_t v15 = result;
    uint64_t v21 = *a1;
    if (!*a1)
    {
      uint64_t v27 = 0;
      goto LABEL_39;
    }
LABEL_33:
    uint64_t v27 = *(unsigned int *)(v21 - 4);
LABEL_39:
    *(void *)a4 = v15;
    *(void *)(a4 + 8) = v21 + 16 * v27;
    *(unsigned char *)(a4 + 16) = 1;
    return result;
  }
  if (!WTF::equal()) {
    goto LABEL_13;
  }
  uint64_t v19 = *a1;
  if (*a1) {
    uint64_t v20 = *(unsigned int *)(v19 - 4);
  }
  else {
    uint64_t v20 = 0;
  }
  *(void *)a4 = v15;
  *(void *)(a4 + 8) = v19 + 16 * v20;
  *(unsigned char *)(a4 + 16) = 0;
  uint64_t v23 = v8 + 16 * v14;
  uint64_t v24 = *a3;
  *a3 = 0;
  uint64_t result = *(_DWORD **)(v23 + 8);
  *(void *)(v23 + 8) = v24;
  if (result)
  {
    if (*result == 1)
    {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else
    {
      --*result;
    }
  }
  return result;
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (*a1 && (int v4 = *(_DWORD *)(v3 - 4)) != 0) {
    unsigned int v5 = v4 << (6 * *(_DWORD *)(v3 - 12) >= (2 * v4));
  }
  else {
    unsigned int v5 = 8;
  }
  return WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(a1, v5, a2);
}

_DWORD *WTF::HashMapTranslator<WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>::translate<WTF::String const&,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableAddResult<WTF::HashTableIterator<WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>,WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>> WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineAdd<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>> &&)::{lambda(void)#1}>(uint64_t a1, _DWORD **a2, uint64_t **a3)
{
  WTF::String::operator=((_DWORD **)a1, a2);
  uint64_t v5 = **a3;
  **a3 = 0;
  uint64_t result = *(_DWORD **)(a1 + 8);
  *(void *)(a1 + 8) = v5;
  if (result)
  {
    if (*result == 1)
    {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else
    {
      --*result;
    }
  }
  return result;
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  if (*a1)
  {
    unsigned int v7 = *(_DWORD *)(v6 - 4);
    int v8 = *(_DWORD *)(v6 - 12);
  }
  else
  {
    unsigned int v7 = 0;
    int v8 = 0;
  }
  uint64_t v9 = WTF::fastZeroedMalloc((WTF *)(16 * a2 + 16));
  *a1 = v9 + 16;
  *(_DWORD *)(v9 + 12) = a2;
  *(_DWORD *)(*a1 - 8) = a2 - 1;
  *(_DWORD *)(*a1 - 16) = 0;
  *(_DWORD *)(*a1 - 12) = v8;
  uint64_t v11 = 0;
  if (v7)
  {
    uint64_t v12 = v7;
    uint64_t v13 = v6;
    do
    {
      uint64_t v14 = *(WTF::StringImpl **)v13;
      if (*(void *)v13 != -1)
      {
        if (v14)
        {
          uint64_t v16 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::lookupForReinsert(a1, (WTF::StringImpl **)v13);
          uint64_t v17 = *(_DWORD **)(v16 + 8);
          *(void *)(v16 + 8) = 0;
          if (v17)
          {
            if (*v17 == 1) {
              WTF::JSONImpl::Value::operator delete();
            }
            else {
              --*v17;
            }
          }
          int v18 = *(_DWORD **)v16;
          *(void *)uint64_t v16 = 0;
          if (v18)
          {
            if (*v18 == 2) {
              WTF::StringImpl::destroy();
            }
            else {
              *v18 -= 2;
            }
          }
          uint64_t v19 = *(WTF::StringImpl **)v13;
          *(void *)uint64_t v13 = 0;
          *(void *)uint64_t v16 = v19;
          uint64_t v20 = *(void *)(v13 + 8);
          *(void *)(v13 + 8) = 0;
          *(void *)(v16 + 8) = v20;
          uint64_t v21 = *(_DWORD **)(v13 + 8);
          *(void *)(v13 + 8) = 0;
          if (v21)
          {
            if (*v21 == 1) {
              WTF::JSONImpl::Value::operator delete();
            }
            else {
              --*v21;
            }
          }
          int v22 = *(WTF::StringImpl **)v13;
          *(void *)uint64_t v13 = 0;
          if (v22)
          {
            if (*(_DWORD *)v22 == 2) {
              WTF::StringImpl::destroy();
            }
            else {
              *(_DWORD *)v22 -= 2;
            }
          }
          if (v13 == a3) {
            uint64_t v11 = v16;
          }
        }
        else
        {
          uint64_t v15 = *(_DWORD **)(v13 + 8);
          *(void *)(v13 + 8) = 0;
          if (v15)
          {
            if (*v15 == 1)
            {
              WTF::JSONImpl::Value::operator delete();
              uint64_t v14 = *(WTF::StringImpl **)v13;
            }
            else
            {
              --*v15;
            }
          }
          *(void *)uint64_t v13 = 0;
          if (v14)
          {
            if (*(_DWORD *)v14 == 2) {
              WTF::StringImpl::destroy();
            }
            else {
              *(_DWORD *)v14 -= 2;
            }
          }
        }
      }
      v13 += 16;
      --v12;
    }
    while (v12);
  }
  else
  {
    uint64_t result = 0;
    if (!v6) {
      return result;
    }
  }
  WTF::fastFree((WTF *)(v6 - 16), v10);
  return v11;
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::lookupForReinsert(uint64_t *a1, WTF::StringImpl **a2)
{
  uint64_t v2 = *a1;
  if (*a1) {
    int v3 = *(_DWORD *)(v2 - 8);
  }
  else {
    int v3 = 0;
  }
  unsigned int v4 = *((_DWORD *)*a2 + 4);
  if (v4 < 0x100) {
    unsigned int v5 = WTF::StringImpl::hashSlowCase(*a2);
  }
  else {
    unsigned int v5 = v4 >> 8;
  }
  int v6 = 0;
  do
  {
    uint64_t v7 = v5 & v3;
    unsigned int v5 = ++v6 + v7;
  }
  while (*(void *)(v2 + 16 * v7));
  return v2 + 16 * v7;
}

_DWORD **WTF::String::operator=(_DWORD **a1, _DWORD **a2)
{
  int v3 = *a2;
  if (*a2) {
    *v3 += 2;
  }
  unsigned int v4 = *a1;
  *a1 = v3;
  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
  return a1;
}

uint64_t WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>(uint64_t a1, unint64_t a2)
{
  int v3 = (_DWORD **)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(a1, *(unsigned int *)(a1 + 12) + 1, a2);
  uint64_t v4 = *(unsigned int *)(a1 + 12);
  uint64_t v5 = *(void *)a1;
  int v6 = *v3;
  if (*v3) {
    *v6 += 2;
  }
  *(void *)(v5 + 8 * v4) = v6;
  *(_DWORD *)(a1 + 12) = v4 + 1;
  return 1;
}

BOOL WTF::operator==(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  int v5 = a4 - 1;
  if (!a4) {
    int v5 = 0;
  }
  BOOL result = a2 == v5 && a1 == a3;
  if (a1 == a3 || a2 != v5) {
    return result;
  }
  if (!a2) {
    return 1;
  }
  if ((a2 & 0xFF00000000) == 0)
  {
    if (!v5) {
      goto LABEL_61;
    }
    if (*(_WORD *)a1 != *a3) {
      return 0;
    }
    uint64_t v13 = (int16x8_t *)(a1 + 2);
    unsigned int v14 = v5 - 1;
    uint64_t v15 = (uint8x8_t *)(a3 + 1);
    if (v14 >= 8)
    {
      uint16x8_t v16 = (uint16x8_t)vceqq_s16(*v13, (int16x8_t)vmovl_u8(*v15));
      v16.i16[0] = vminvq_u16(v16);
      if (v16.i32[0])
      {
        unsigned int v17 = v14 & 7;
        do
        {
          uint16x8_t v18 = (uint16x8_t)vceqq_s16(*(int16x8_t *)((char *)v13 + 2 * v17), (int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)v15 + v17)));
          v18.i16[0] = vminvq_u16(v18);
          BOOL result = v18.i32[0] != 0;
          v17 += 8;
          if (v18.i32[0]) {
            BOOL v19 = v17 >= v14;
          }
          else {
            BOOL v19 = 1;
          }
        }
        while (!v19);
        return result;
      }
      return 0;
    }
    if (v14 >= 4)
    {
      unint64_t v20 = (v15->u32[0] | ((unint64_t)v15->u32[0] << 16)) & 0xFFFF0000FFFFLL;
      BOOL v12 = ((v20 | (v20 << 8)) & 0xFF00FF00FF00FFLL) == v13->i64[0];
      uint64_t v21 = v14 & 3;
      unint64_t v22 = (*(unsigned int *)((char *)v15->u32 + v21) | ((unint64_t)*(unsigned int *)((char *)v15->u32 + v21) << 16)) & 0xFFFF0000FFFFLL;
      uint64_t v23 = (v22 | (v22 << 8)) & 0xFF00FF00FF00FFLL;
      uint64_t v24 = *(uint64_t *)((char *)v13->i64 + 2 * v21);
      return v12 && v23 == v24;
    }
    if (v14 >= 2)
    {
      int v25 = (v15->u16[0] | (v15->u16[0] << 8)) & 0xFF00FF;
      __int32 v26 = v13->i32[0];
      uint64_t v27 = v14 & 1;
      int v28 = (*(unsigned __int16 *)((char *)v15->u16 + v27) | (*(unsigned __int16 *)((char *)v15->u16 + v27) << 8)) & 0xFF00FF;
      int v29 = *(__int32 *)((char *)v13->i32 + 2 * v27);
      return v25 == v26 && v28 == v29;
    }
    if (v14 == 1)
    {
      int v11 = v15->u8[0];
      int v10 = v13->u16[0];
      return v10 == v11;
    }
    return 1;
  }
  if (!v5)
  {
LABEL_61:
    __break(1u);
    JUMPOUT(0x226FC1674);
  }
  if (*a1 != *a3) {
    return 0;
  }
  unsigned int v7 = v5 - 1;
  if (v5 == 1) {
    return 1;
  }
  int v8 = (int8x16_t *)(a1 + 1);
  uint64_t v9 = (int8x16_t *)(a3 + 1);
  if (v5 == 2)
  {
    int v10 = v8->u8[0];
    int v11 = v9->u8[0];
    return v10 == v11;
  }
  switch(31 - __clz(v5 - 2))
  {
    case 0u:
      int v10 = v8->u16[0];
      int v11 = v9->u16[0];
      return v10 == v11;
    case 1u:
      if (v8->u16[0] != v9->u16[0]) {
        return 0;
      }
      int v10 = *(unsigned __int16 *)&a1[v5 - 2];
      int v11 = *(unsigned __int16 *)&a3[v5 - 2];
      return v10 == v11;
    case 2u:
      if (v8->i32[0] != v9->i32[0]) {
        return 0;
      }
      int v10 = *(_DWORD *)&a1[v5 - 4];
      int v11 = *(_DWORD *)&a3[v5 - 4];
      return v10 == v11;
    case 3u:
      if (v8->i64[0] != v9->i64[0]) {
        return 0;
      }
      return *(void *)&a1[v5 - 8] == *(void *)&a3[v5 - 8];
    case 4u:
      uint8x16_t v31 = (uint8x16_t)vandq_s8(vceqq_s8(*(int8x16_t *)&a1[v5 - 16], *(int8x16_t *)&a3[v5 - 16]), vceqq_s8(*(int8x16_t *)(a1 + 1), *(int8x16_t *)(a3 + 1)));
      v31.i8[0] = vminvq_u8(v31);
      return v31.i32[0] != 0;
    default:
      uint8x16_t v30 = (uint8x16_t)vceqq_s8(*v8, *v9);
      v30.i8[0] = vminvq_u8(v30);
      if (!v30.i32[0]) {
        return 0;
      }
      if (v7 < 0x10) {
        return 1;
      }
      unsigned int v32 = v7 & 0xF;
      do
      {
        uint8x16_t v33 = (uint8x16_t)vceqq_s8(*(int8x16_t *)((char *)v8 + v32), *(int8x16_t *)((char *)v9 + v32));
        v33.i8[0] = vminvq_u8(v33);
        BOOL result = v33.i32[0] != 0;
        v32 += 16;
        if (v33.i32[0]) {
          BOOL v34 = v32 >= v7;
        }
        else {
          BOOL v34 = 1;
        }
      }
      while (!v34);
      break;
  }
  return result;
}

uint64_t std::__throw_bad_optional_access[abi:sn180100]()
{
  return WTF::RefCounted<Inspector::BackendDispatcher>::deref();
}

WTF *WTF::RefCounted<Inspector::BackendDispatcher>::deref(WTF *result, void *a2)
{
  uint64_t v2 = result;
  if (*(_DWORD *)result == 1)
  {
    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)result + 24, a2);
    uint64_t v4 = (_DWORD **)*((void *)v2 + 2);
    if (v4) {
      WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,Inspector::SupplementalBackendDispatcher *,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<Inspector::SupplementalBackendDispatcher *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v4, v3);
    }
    uint64_t v5 = *((void *)v2 + 1);
    *((void *)v2 + 1) = 0;
    if (v5) {
      WTF::RefCounted<Inspector::FrontendRouter>::deref(v5, v3);
    }
    return (WTF *)WTF::fastFree(v2, v3);
  }
  else
  {
    --*(_DWORD *)result;
  }
  return result;
}

uint64_t WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 12);
  if (v3) {
    WTF::VectorDestructor<true,std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>>::destruct(*(_DWORD **)a1, (_DWORD *)(*(void *)a1 + 16 * v3));
  }
  uint64_t v4 = *(WTF **)a1;
  if (*(void *)a1)
  {
    *(void *)a1 = 0;
    *(_DWORD *)(a1 + 8) = 0;
    WTF::fastFree(v4, a2);
  }
  return a1;
}

_DWORD *WTF::VectorDestructor<true,std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>>::destruct(_DWORD *result, _DWORD *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    do
    {
      BOOL result = (_DWORD *)*((void *)v3 + 1);
      *((void *)v3 + 1) = 0;
      if (result)
      {
        if (*result == 2) {
          BOOL result = (_DWORD *)WTF::StringImpl::destroy();
        }
        else {
          *result -= 2;
        }
      }
      v3 += 4;
    }
    while (v3 != a2);
  }
  return result;
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,Inspector::SupplementalBackendDispatcher *,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<Inspector::SupplementalBackendDispatcher *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(_DWORD **a1, void *a2)
{
  uint64_t v3 = *((unsigned int *)a1 - 1);
  if (v3)
  {
    uint64_t v4 = a1;
    do
    {
      uint64_t v5 = *v4;
      if (*v4 != (_DWORD *)-1)
      {
        *uint64_t v4 = 0;
        if (v5)
        {
          if (*v5 == 2) {
            WTF::StringImpl::destroy();
          }
          else {
            *v5 -= 2;
          }
        }
      }
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return WTF::fastFree((WTF *)(a1 - 2), a2);
}

uint64_t WTF::RefCounted<Inspector::FrontendRouter>::deref(uint64_t this, void *a2)
{
  uint64_t v2 = this;
  if (*(_DWORD *)this == 1)
  {
    uint64_t v3 = *(WTF **)(this + 8);
    if ((WTF *)(v2 + 24) != v3 && v3 != 0)
    {
      *(void *)(v2 + 8) = 0;
      *(_DWORD *)(v2 + 16) = 0;
      WTF::fastFree(v3, a2);
    }
    return WTF::fastFree((WTF *)v2, a2);
  }
  else
  {
    --*(_DWORD *)this;
  }
  return this;
}

void sub_226FC1A30(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  if (a10) {
    -[RWIProtocolConfiguration setCSSHandler:]();
  }
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  unsigned int v17 = a14;
  a14 = 0;
  if (v17) {
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC1C64(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  if (a10) {
    -[RWIProtocolConfiguration setCSSHandler:]();
  }
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  unsigned int v17 = a14;
  a14 = 0;
  if (v17) {
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC1E44(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  if (a10) {
    -[RWIProtocolConfiguration setCSSHandler:]();
  }
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  unsigned int v17 = a14;
  a14 = 0;
  if (v17) {
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC2024(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  if (a10) {
    -[RWIProtocolConfiguration setCSSHandler:]();
  }
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  unsigned int v17 = a14;
  a14 = 0;
  if (v17) {
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC2204(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  if (a10) {
    -[RWIProtocolConfiguration setCSSHandler:]();
  }
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  unsigned int v17 = a14;
  a14 = 0;
  if (v17) {
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  }
  _Unwind_Resume(exception_object);
}

void *Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(void *a1, CFTypeRef cf)
{
  a1[1] = 0;
  *a1 = &unk_26DB28B58;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    uint64_t v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4) {
      CFRelease(v4);
    }
  }
  return a1;
}

void sub_226FC2430(_Unwind_Exception *a1, void *a2)
{
  uint64_t v5 = *(const void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
  if (v5) {
    CFRelease(v5);
  }
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorCSSBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  int v8 = (void *)WTF::fastMalloc((WTF *)0x20);
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      int v10 = (_DWORD *)MEMORY[0x263F103A0];
      *MEMORY[0x263F103A0] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      int v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  uint64_t v11 = *a3;
  *a3 = 0;
  uint64_t v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  uint64_t v12 = v14;
  uint64_t v14 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  BOOL result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2) {
      return (_DWORD *)WTF::StringImpl::destroy();
    }
    else {
      *result -= 2;
    }
  }
  return result;
}

void sub_226FC2560(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

void *Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent(void *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  *a1 = &unk_26DB28FA0;
  int v6 = *a2;
  if (*a2) {
    *v6 += 2;
  }
  *a1 = &unk_26DB28F60;
  a1[1] = v6;
  uint64_t v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(void *)a3 + 40))(a3);
  Inspector::CSSBackendDispatcher::create();
  a1[3] = v13;
  *(void *)(v13 + 24) = a1[2];
  uint64_t v8 = a1[2];
  uint64_t v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a3 + 40))(a3);
  ++*v9;
  uint64_t v11 = *(WTF **)(v8 + 8);
  *(void *)(v8 + 8) = v9;
  if (v11) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  }
  return a1;
}

void sub_226FC26D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *a9)
{
  uint64_t v11 = *((void *)v9 + 3);
  *((void *)v9 + 3) = 0;
  if (v11)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent();
    a1 = a9;
  }
  uint64_t v12 = *((void *)v9 + 2);
  *((void *)v9 + 2) = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(v9);
  _Unwind_Resume(a1);
}

void Inspector::InspectorAgentBase::~InspectorAgentBase(Inspector::InspectorAgentBase *this)
{
  uint64_t v2 = (_DWORD *)*((void *)this + 1);
  *(void *)this = &unk_26DB28FA0;
  *((void *)this + 1) = 0;
  if (v2)
  {
    if (*v2 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v2 -= 2;
    }
  }
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

void Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *this, void *a2)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *(WTF **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  uint64_t v5 = (_DWORD *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v5)
  {
    if (v5[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
    }
    else {
      --v5[2];
    }
  }
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(this);
}

void std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100](int a1, WTF *this)
{
  if (this)
  {
    uint64_t v3 = (const void *)*((void *)this + 2);
    *((void *)this + 2) = 0;
    if (v3) {
      CFRelease(v3);
    }
    uint64_t v4 = (WTF *)*((void *)this + 1);
    *((void *)this + 1) = 0;
    if (v4) {
      WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, this);
    }
    WTF::fastFree(this, this);
  }
}

void *Inspector::ObjCInspectorDOMBackendDispatcher::ObjCInspectorDOMBackendDispatcher(void *a1, CFTypeRef cf)
{
  a1[1] = 0;
  *a1 = &unk_26DB28C10;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    uint64_t v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4) {
      CFRelease(v4);
    }
  }
  return a1;
}

void sub_226FC2964(_Unwind_Exception *a1, void *a2)
{
  uint64_t v5 = *(const void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
  if (v5) {
    CFRelease(v5);
  }
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x20);
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      int v10 = (_DWORD *)MEMORY[0x263F103A0];
      *MEMORY[0x263F103A0] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      int v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  uint64_t v11 = *a3;
  *a3 = 0;
  uint64_t v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  uint64_t v12 = v14;
  uint64_t v14 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  BOOL result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2) {
      return (_DWORD *)WTF::StringImpl::destroy();
    }
    else {
      *result -= 2;
    }
  }
  return result;
}

void sub_226FC2A94(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

void *Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::AlternateDispatchableAgent(void *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  *a1 = &unk_26DB28FA0;
  uint64_t v6 = *a2;
  if (*a2) {
    *v6 += 2;
  }
  *a1 = &unk_26DB28FE0;
  a1[1] = v6;
  uint64_t v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(void *)a3 + 40))(a3);
  Inspector::DOMBackendDispatcher::create();
  a1[3] = v13;
  *(void *)(v13 + 24) = a1[2];
  uint64_t v8 = a1[2];
  uint64_t v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a3 + 40))(a3);
  ++*v9;
  uint64_t v11 = *(WTF **)(v8 + 8);
  *(void *)(v8 + 8) = v9;
  if (v11) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  }
  return a1;
}

void sub_226FC2C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *a9)
{
  uint64_t v11 = *((void *)v9 + 3);
  *((void *)v9 + 3) = 0;
  if (v11)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent();
    a1 = a9;
  }
  uint64_t v12 = *((void *)v9 + 2);
  *((void *)v9 + 2) = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(v9);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

void Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *this, void *a2)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *(WTF **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  uint64_t v5 = (_DWORD *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v5)
  {
    if (v5[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
    }
    else {
      --v5[2];
    }
  }
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(this);
}

void *Inspector::ObjCInspectorDOMStorageBackendDispatcher::ObjCInspectorDOMStorageBackendDispatcher(void *a1, CFTypeRef cf)
{
  a1[1] = 0;
  *a1 = &unk_26DB28DB0;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    uint64_t v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4) {
      CFRelease(v4);
    }
  }
  return a1;
}

void sub_226FC2DD4(_Unwind_Exception *a1, void *a2)
{
  uint64_t v5 = *(const void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
  if (v5) {
    CFRelease(v5);
  }
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMStorageBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x20);
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      int v10 = (_DWORD *)MEMORY[0x263F103A0];
      *MEMORY[0x263F103A0] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      int v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  uint64_t v11 = *a3;
  *a3 = 0;
  uint64_t v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  uint64_t v12 = v14;
  uint64_t v14 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  BOOL result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2) {
      return (_DWORD *)WTF::StringImpl::destroy();
    }
    else {
      *result -= 2;
    }
  }
  return result;
}

void sub_226FC2F04(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

void *Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::AlternateDispatchableAgent(void *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  *a1 = &unk_26DB28FA0;
  uint64_t v6 = *a2;
  if (*a2) {
    *v6 += 2;
  }
  *a1 = &unk_26DB29020;
  a1[1] = v6;
  uint64_t v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(void *)a3 + 40))(a3);
  Inspector::DOMStorageBackendDispatcher::create();
  a1[3] = v13;
  *(void *)(v13 + 24) = a1[2];
  uint64_t v8 = a1[2];
  uint64_t v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a3 + 40))(a3);
  ++*v9;
  uint64_t v11 = *(WTF **)(v8 + 8);
  *(void *)(v8 + 8) = v9;
  if (v11) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  }
  return a1;
}

void sub_226FC3074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *a9)
{
  uint64_t v11 = *((void *)v9 + 3);
  *((void *)v9 + 3) = 0;
  if (v11)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent();
    a1 = a9;
  }
  uint64_t v12 = *((void *)v9 + 2);
  *((void *)v9 + 2) = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(v9);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

void Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *this, void *a2)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *(WTF **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  uint64_t v5 = (_DWORD *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v5)
  {
    if (v5[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
    }
    else {
      --v5[2];
    }
  }
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(this);
}

void *Inspector::ObjCInspectorNetworkBackendDispatcher::ObjCInspectorNetworkBackendDispatcher(void *a1, CFTypeRef cf)
{
  a1[1] = 0;
  *a1 = &unk_26DB28E00;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    uint64_t v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4) {
      CFRelease(v4);
    }
  }
  return a1;
}

void sub_226FC3244(_Unwind_Exception *a1, void *a2)
{
  uint64_t v5 = *(const void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
  if (v5) {
    CFRelease(v5);
  }
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorNetworkBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x20);
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      int v10 = (_DWORD *)MEMORY[0x263F103A0];
      *MEMORY[0x263F103A0] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      int v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  uint64_t v11 = *a3;
  *a3 = 0;
  uint64_t v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  uint64_t v12 = v14;
  uint64_t v14 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  BOOL result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2) {
      return (_DWORD *)WTF::StringImpl::destroy();
    }
    else {
      *result -= 2;
    }
  }
  return result;
}

void sub_226FC3374(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

void *Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::AlternateDispatchableAgent(void *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  *a1 = &unk_26DB28FA0;
  uint64_t v6 = *a2;
  if (*a2) {
    *v6 += 2;
  }
  *a1 = &unk_26DB29060;
  a1[1] = v6;
  uint64_t v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(void *)a3 + 40))(a3);
  Inspector::NetworkBackendDispatcher::create();
  a1[3] = v13;
  *(void *)(v13 + 24) = a1[2];
  uint64_t v8 = a1[2];
  uint64_t v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a3 + 40))(a3);
  ++*v9;
  uint64_t v11 = *(WTF **)(v8 + 8);
  *(void *)(v8 + 8) = v9;
  if (v11) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  }
  return a1;
}

void sub_226FC34E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *a9)
{
  uint64_t v11 = *((void *)v9 + 3);
  *((void *)v9 + 3) = 0;
  if (v11)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent();
    a1 = a9;
  }
  uint64_t v12 = *((void *)v9 + 2);
  *((void *)v9 + 2) = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(v9);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

void Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *this, void *a2)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *(WTF **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  uint64_t v5 = (_DWORD *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v5)
  {
    if (v5[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
    }
    else {
      --v5[2];
    }
  }
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(this);
}

void *Inspector::ObjCInspectorPageBackendDispatcher::ObjCInspectorPageBackendDispatcher(void *a1, CFTypeRef cf)
{
  a1[1] = 0;
  *a1 = &unk_26DB28EA0;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    uint64_t v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4) {
      CFRelease(v4);
    }
  }
  return a1;
}

void sub_226FC36B4(_Unwind_Exception *a1, void *a2)
{
  uint64_t v5 = *(const void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
  if (v5) {
    CFRelease(v5);
  }
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorPageBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x20);
  uint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      int v10 = (_DWORD *)MEMORY[0x263F103A0];
      *MEMORY[0x263F103A0] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      int v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  uint64_t v11 = *a3;
  *a3 = 0;
  uint64_t v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  uint64_t v12 = v14;
  uint64_t v14 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  BOOL result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2) {
      return (_DWORD *)WTF::StringImpl::destroy();
    }
    else {
      *result -= 2;
    }
  }
  return result;
}

void sub_226FC37E4(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

void *Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::AlternateDispatchableAgent(void *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  *a1 = &unk_26DB28FA0;
  uint64_t v6 = *a2;
  if (*a2) {
    *v6 += 2;
  }
  *a1 = &unk_26DB290A0;
  a1[1] = v6;
  uint64_t v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(void *)a3 + 40))(a3);
  Inspector::PageBackendDispatcher::create();
  a1[3] = v13;
  *(void *)(v13 + 24) = a1[2];
  uint64_t v8 = a1[2];
  uint64_t v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)a3 + 40))(a3);
  ++*v9;
  uint64_t v11 = *(WTF **)(v8 + 8);
  *(void *)(v8 + 8) = v9;
  if (v11) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  }
  return a1;
}

void sub_226FC3954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *a9)
{
  uint64_t v11 = *((void *)v9 + 3);
  *((void *)v9 + 3) = 0;
  if (v11)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent();
    a1 = a9;
  }
  uint64_t v12 = *((void *)v9 + 2);
  *((void *)v9 + 2) = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(v9);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

void Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *this, void *a2)
{
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *(WTF **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
  if (v4) {
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  }
  uint64_t v5 = (_DWORD *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v5)
  {
    if (v5[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
    }
    else {
      --v5[2];
    }
  }
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  Inspector::InspectorAgentBase::~InspectorAgentBase(this);
}

void OUTLINED_FUNCTION_2_0()
{
  *(void *)uint64_t v0 = v2;
  *(_DWORD *)(v0 + 8) = v1;
}

void sub_226FC3C78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC401C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC44E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC4930(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC4E50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC5378(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC57C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, uint64_t a14)
{
  if (a11)
  {
    if (*a11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a11 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setDouble(WTF::JSONImpl::ObjectBase *this, WTF::StringImpl **a2, double a3)
{
  WTF::JSONImpl::Value::create((uint64_t *)&v10, this, a3);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    uint64_t v5 = (uint64_t *)((char *)this + 24);
    uint64_t v6 = *((unsigned int *)this + 9);
    if (v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      uint64_t v7 = *v5;
      uint64_t v8 = *a2;
      if (*a2) {
        *(_DWORD *)v8 += 2;
      }
      *(void *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  BOOL result = v10;
  int v10 = 0;
  if (result)
  {
    if (*result == 1) {
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*result;
    }
  }
  return result;
}

void sub_226FC5994(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC5CD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC623C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a11 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC6524(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC6868(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC6E64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _DWORD *a17, _DWORD *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,_DWORD *a28)
{
  if (a28)
  {
    if (*a28 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a28 -= 2;
    }
  }
  if (a17)
  {
    if (*a17 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a17;
    }
  }
  if (a18)
  {
    if (*a18 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a18;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC73E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC7890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC7D50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14, _DWORD *a15, _DWORD *a16)
{
  if (a16)
  {
    if (*a16 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a16 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC81F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC8638(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC8B90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC8FE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC93A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC9894(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FC9CE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCA1A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCA6D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCAB28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCAEE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCB298(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCB8B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCBD9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCC290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCC824(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCCEA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCD5F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCE2F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::toProtocolString@<X0>(void *a1@<X8>)
{
  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

{
  uint64_t result;
  uint64_t v3;

  uint64_t result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *a1 = v3;
  return result;
}

void sub_226FCED04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCF2C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCF998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FCFFB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, uint64_t a14)
{
  if (a11)
  {
    if (*a11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a11 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD0934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD0F40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD1500(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD1B78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD21A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD26EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD2B98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD3184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD3728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD3D20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD4190(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD4544(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD49DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a13 -= 2;
    }
  }
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD4E2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD526C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD56AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD5B4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD5F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a14 -= 2;
    }
  }
  if (a12)
  {
    if (*a12 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a12;
    }
  }
  if (a13)
  {
    if (*a13 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a13;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD6564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _DWORD *a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,_DWORD *a26)
{
  if (a26)
  {
    if (*a26 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a26 -= 2;
    }
  }
  if (a15)
  {
    if (*a15 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a15;
    }
  }
  if (a16)
  {
    if (*a16 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a16;
    }
  }
  _Unwind_Resume(exception_object);
}

void RWIAugmentableInspectorControllerClient::~RWIAugmentableInspectorControllerClient(RWIAugmentableInspectorControllerClient *this)
{
}

uint64_t RWIAugmentableInspectorControllerClient::inspectorControllerDestroyed(RWIAugmentableInspectorControllerClient *this)
{
  return [*((id *)this + 1) inspectorControllerDestroyed];
}

uint64_t RWIAugmentableInspectorControllerClient::inspectorConnected(RWIAugmentableInspectorControllerClient *this)
{
  uint64_t v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *((void *)this + 1);
  return [v2 postNotificationName:@"RWIProtocolInspectorFrontendConnectedNotification" object:v3 userInfo:0];
}

uint64_t RWIAugmentableInspectorControllerClient::inspectorDisconnected(RWIAugmentableInspectorControllerClient *this)
{
  uint64_t v2 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *((void *)this + 1);
  return [v2 postNotificationName:@"RWIProtocolInspectorFrontendDisconnectedNotification" object:v3 userInfo:0];
}

void sub_226FD6BA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD6C60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD6D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD6E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, _DWORD *a10)
{
  if (a9)
  {
    if (*a9 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a9 -= 2;
    }
  }
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD7018(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a11 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD710C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD71A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD724C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD7314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10)
{
  if (a10)
  {
    if (*a10 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a10 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD7448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10)
{
  if (a10)
  {
    if (*a10 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a10;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD7510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD7648(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v3 = v4;
  uint64_t v4 = 0;
  if (v3) {
    Inspector::toJSONObjectArray();
  }
  -[RWIProtocolJSONObject setJSONArray:forKey:]((uint64_t)va, (uint64_t *)va1);
  _Unwind_Resume(a1);
}

void sub_226FD76E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD77F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FD79D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FD7D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_226FD7DF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD818C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12) {
    -[RWIProtocolCSSPseudoIdMatches pseudoId](a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD8368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD8460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSRuleMatch>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolCSSRuleMatch alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FD8608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_226FD8A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD8C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD8D60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD8E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FD9004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD90E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD9190(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD9258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FD9380(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD9430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FD970C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_226FD9918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD9A10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSSelector>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolCSSSelector alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FD9BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD9E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FD9FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDA1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDA41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDA70C(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FDA848(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDAD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_226FDB000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDB0F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSRule>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolCSSRule alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FDB2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDB4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDB674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDB848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDBACC(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FDBC08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDBDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDBFD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDC0C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSGrouping>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolCSSGrouping alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FDC270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDC438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDC740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDC92C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDCA54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDCB04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDCBA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDCC50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDCCEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDCD9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDCF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDD390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_226FDD57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDD798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDD890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSProperty>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolCSSProperty alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FDDA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDDC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDDD80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSShorthandEntry>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolCSSShorthandEntry alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FDDF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDE1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDE440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDE8B4(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FDE9F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDEB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDEC6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FDED20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDEF64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FDF110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDF40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDF6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_226FDF958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDFA50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSFontVariationAxis>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolCSSFontVariationAxis alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FDFBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FDFE74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE01B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE026C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE0550(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE0670(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE079C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE089C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE0954(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE0A84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE0BD8(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE0D18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE0E84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE1120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE1528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE1620(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimeRemoteObject>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolRuntimeRemoteObject alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FE17C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE19D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE1CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE2180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_226FE2388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE2480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolConsoleCallFrame>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolConsoleCallFrame alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FE2628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE2930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE2B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE30AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE31A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolDOMNode>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolDOMNode alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FE334C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE345C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE350C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE3A00(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE3B2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE3C4C(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE3D78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE3EB0(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE3FEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE4198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE43B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE44AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE4640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE485C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE4954(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE4A84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE4B34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE4C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE4F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE53A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE57B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE59AC(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE5AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE5B8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE5C3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE5CD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE5D88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE5E48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE6054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE6408(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE64B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE6768(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE68A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE6AEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE6B9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE6CA4(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE6DD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE6F84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE7034(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE73E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE7494(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE757C(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FE76A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE7780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE7B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE7D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE7F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE8104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE820C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE8398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE8720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE88AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE89FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE8B30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE8C80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12) {
    -[RWIProtocolCSSPseudoIdMatches pseudoId](a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_226FE8E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE8FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE923C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE9410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FE9638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE9A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FE9DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEA28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEA4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEA670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEA854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEAA70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEAB8C(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FEACC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FEB0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEB1DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolDebuggerBreakpointAction>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolDebuggerBreakpointAction alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FEB384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEB5C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEB74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEBA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEBB88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolDebuggerScope>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolDebuggerScope alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FEBD30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEC10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_226FEC410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEC62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEC724(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FEC8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FECA50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FECBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FECCDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FECF08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FED148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FED320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FED6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FED848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FED99C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEDB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEDD88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEE4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEE7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEE934(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FEEB88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FEEE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FEF150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEF374(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FEF4B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FEF664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEF838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEFA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FEFBE8(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FEFD14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FEFFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF043C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF05C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF0750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF08BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF0B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF0CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF0F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF10E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF1218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF13C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF15A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF169C(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FF17C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF1974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF1BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF1CE8(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FF1E14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF1F68(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FF20A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF22C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF2808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF2958(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF2A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF2FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_226FF318C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF33A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF34A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolPageFrameResourceTree>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolPageFrameResourceTree alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FF3648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF3898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF3990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolPageFrameResource>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolPageFrameResource alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FF3B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF3CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF411C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF4678(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FF47A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF484C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF4900(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF4B24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF4BFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF4E90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF50D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF544C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF5620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF5704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF57B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF59DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF5AB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF5D48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF60D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF61C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimePropertyPreview>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolRuntimePropertyPreview alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FF6370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF65C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF66B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimeEntryPreview>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolRuntimeEntryPreview alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FF6860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF6A2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF6B78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF6DAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF6E84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF7118(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF7358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF7560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF76EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF78C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF79C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF7B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF7D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF7E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF8050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF82A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF8478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF884C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF8A54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF8C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF8E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF9058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF91DC(_Unwind_Exception *a1)
{
  if (*v1 == 2) {
    WTF::StringImpl::destroy();
  }
  else {
    *v1 -= 2;
  }
  _Unwind_Resume(a1);
}

void sub_226FF9308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *a12 -= 2;
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF94EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FF967C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF972C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF97C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF9878(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FF9AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FF9CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FFA228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FFA4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FFA6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a14;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FFA7D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimeStructureDescription>(WTF::JSONImpl::ArrayBase **a1)
{
  if (*a1)
  {
    uint64_t v2 = *((unsigned int *)*a1 + 7);
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    if (v2)
    {
      for (uint64_t i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        uint64_t v5 = cf;
        unsigned int v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          uint64_t v8 = 0;
        }
        else
        {
          if (v6 != 5) {
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          }
          ++*(_DWORD *)cf;
          uint64_t v8 = v5;
        }
        CFTypeRef cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            uint64_t v9 = [RWIProtocolRuntimeStructureDescription alloc];
            uint16x8_t v16 = v8;
            int v10 = [(RWIProtocolJSONObject *)v9 initWithJSONObject:&v16];
            uint64_t v11 = v10;
            CFTypeRef cf = v10;
            if (v10) {
              CFRetain(v10);
            }

            uint64_t v12 = v16;
            uint16x8_t v16 = 0;
            if (v12)
            {
              if (*v12 == 1) {
                WTF::JSONImpl::Value::operator delete();
              }
              else {
                --*v12;
              }
            }
            uint64_t v13 = WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            objc_msgSend(v3, "addObject:", v13, v16);

            CFTypeRef v14 = cf;
            CFTypeRef cf = 0;
            if (v14) {
              CFRelease(v14);
            }
          }
        }
        else
        {
          --*v5;
          if (v8) {
            goto LABEL_14;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

void sub_226FFA980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  if (a9)
  {
    if (*a9 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a9;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FFAB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FFADBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_226FFB308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FFB3B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FFB454(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FFB504(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  _Unwind_Resume(exception_object);
}

void sub_226FFB698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

void sub_226FFB86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a12) {
    Inspector::toJSONObjectArray();
  }
  if (a11)
  {
    if (*a11 == 1) {
      WTF::JSONImpl::Value::operator delete();
    }
    else {
      --*a11;
    }
  }

  _Unwind_Resume(a1);
}

uint64_t std::__lower_bound[abi:sn180100]<std::_ClassicAlgPolicy,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,WTF::ComparableStringView,std::__identity,RWIProtocolCSSPseudoId const* WTF::SortedArrayMap<std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId>[23]>::tryGet<WTF::String>(WTF::String const&)::{lambda(WTF::String&,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const* &)#1}>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 != a1)
  {
    unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
    uint64_t v2 = a1;
    do
    {
      uint64_t v4 = v2 + 24 * (v3 >> 1);
      int v5 = WTF::codePointCompare();
      if (v5 >= 0) {
        v3 >>= 1;
      }
      else {
        v3 += ~(v3 >> 1);
      }
      if (v5 < 0) {
        uint64_t v2 = v4 + 24;
      }
    }
    while (v3);
  }
  return v2;
}

id WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get(id *a1)
{
  return *a1;
}

unint64_t removeObjectFromArray(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = [v3 count];
  if (v5)
  {
    id v6 = [v3 objectAtIndex:0];

    if (v6 == v4)
    {
      uint64_t v9 = 0;
      unint64_t v5 = 1;
LABEL_8:
      [v3 removeObjectAtIndex:v9];
    }
    else
    {
      uint64_t v7 = 1;
      while (v5 != v7)
      {
        id v8 = [v3 objectAtIndex:v7];

        ++v7;
        if (v8 == v4)
        {
          uint64_t v9 = v7 - 1;
          unint64_t v5 = v7 - 1 < v5;
          goto LABEL_8;
        }
      }
      unint64_t v5 = 0;
    }
  }

  return v5;
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t convertRBSProcessState(void *a1)
{
  id v1 = a1;
  if ([v1 taskState] == 4)
  {
    uint64_t v2 = [v1 endowmentNamespaces];
    int v3 = [v2 containsObject:*MEMORY[0x263F3F620]];

    if (v3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_227000FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22700113C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void logUnexpectedType(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unint64_t v5 = RWIDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    logUnexpectedType_cold_1((uint64_t)v3, (uint64_t)v4, v5);
  }
}

void sub_227002048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id processNameForPID()
{
  int v0 = MEMORY[0x270FA5388]();
  uint64_t v5 = *MEMORY[0x263EF8340];
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath(v0, buffer, 0x1000u))
  {
    id v1 = [NSString stringWithUTF8String:buffer];
    uint64_t v2 = [v1 lastPathComponent];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

void sub_227002138(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t isInternalInstall()
{
  if (isInternalInstall::onceToken != -1) {
    dispatch_once(&isInternalInstall::onceToken, &__block_literal_global_1);
  }
  return isInternalInstall::isInternal;
}

uint64_t __isInternalInstall_block_invoke()
{
  uint64_t result = os_variant_allows_internal_security_policies();
  isInternalInstall::isInternal = result;
  return result;
}

uint64_t isSimulatingCustomerInstall()
{
  if (isSimulatingCustomerInstall::onceToken != -1) {
    dispatch_once(&isSimulatingCustomerInstall::onceToken, &__block_literal_global_3);
  }
  return isSimulatingCustomerInstall::simulateCustomerInstall;
}

uint64_t __isSimulatingCustomerInstall_block_invoke()
{
  uint64_t result = CFPreferencesGetAppBooleanValue(@"SimulateCustomerInstall", @"com.apple.WebInspector", 0);
  isSimulatingCustomerInstall::simulateCustomerInstall = result != 0;
  return result;
}

__CFData *protocolIconDataForBundleIdentifier(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", 16.0, 16.0, 2.0);
  id v3 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v1];
  id v4 = [v3 prepareImageForDescriptor:v2];

  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263F4B540] genericApplicationIcon];
    id v4 = [v5 prepareImageForDescriptor:v2];

    if (!v4)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
  }
  Mutable = CFDataCreateMutable(0, 0);
  uint64_t v7 = [(id)*MEMORY[0x263F1DC08] identifier];
  id v8 = CGImageDestinationCreateWithData(Mutable, v7, 1uLL, 0);

  if (v8)
  {
    CGImageDestinationAddImage(v8, (CGImageRef)[v4 CGImage], 0);
    CGImageDestinationFinalize(v8);
    uint64_t v9 = Mutable;
LABEL_8:
    CFRelease(v8);
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  id v8 = Mutable;
  if (Mutable) {
    goto LABEL_8;
  }
LABEL_9:

LABEL_10:
  return v9;
}

void sub_2270023A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void traceMessagePayloadIfKeyExists_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226FA0000, a2, OS_LOG_TYPE_DEBUG, "payload: %{private}@", (uint8_t *)&v2, 0xCu);
}

void Inspector::toJSONObjectArray()
{
  OUTLINED_FUNCTION_0_3();
  if (v2) {
    WTF::JSONImpl::Value::operator delete();
  }
  else {
    _DWORD *v0 = v1;
  }
}

void Inspector::toObjCIntegerArray()
{
}

void Inspector::ObjCInspectorCSSBackendDispatcher::enable()
{
  OUTLINED_FUNCTION_0_4();
  if (v2) {
    WTF::StringImpl::destroy();
  }
  else {
    _DWORD *v0 = v1;
  }
}

WTF *Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(WTF **a1, void *a2)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result) {
    return WTF::RefCounted<Inspector::BackendDispatcher>::deref(result, a2);
  }
  return result;
}

uint64_t std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorCSSBackendDispatcher>>()
{
  OUTLINED_FUNCTION_1_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent()
{
  OUTLINED_FUNCTION_0_5();
  if (v2)
  {
    OUTLINED_FUNCTION_1_1();
    (*(void (**)(void))(v3 + 8))();
  }
  else
  {
    *(_DWORD *)(v0 + 8) = v1;
  }
  OUTLINED_FUNCTION_2_0();
}

uint64_t std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMBackendDispatcher>>()
{
  OUTLINED_FUNCTION_1_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMStorageBackendDispatcher>>()
{
  OUTLINED_FUNCTION_1_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorNetworkBackendDispatcher>>()
{
  OUTLINED_FUNCTION_1_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorPageBackendDispatcher>>()
{
  OUTLINED_FUNCTION_1_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void Inspector::toObjCArray<RWIProtocolCSSRuleMatch>()
{
}

void logUnexpectedType_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_226FA0000, log, OS_LOG_TYPE_ERROR, "Unexpected type: %{private}@, Expected type: %{private}@", (uint8_t *)&v3, 0x16u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4B20](cf);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x270F0CD10]();
}

uint64_t JSGlobalContextGetAugmentableInspectorController()
{
  return MEMORY[0x270EF5328]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
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

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x270EE5790]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x270EE57A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t WTF::StringImpl::createWithoutCopyingNonEmpty()
{
  return MEMORY[0x270EF54B0]();
}

uint64_t WTF::StringImpl::destroy()
{
  return MEMORY[0x270EF54B8]();
}

uint64_t WTF::StringImpl::operator NSString *()
{
  return MEMORY[0x270EF54C0]();
}

uint64_t WTF::fastMalloc(WTF *this)
{
  return MEMORY[0x270EF54C8](this);
}

uint64_t WTF::codePointCompare()
{
  return MEMORY[0x270EF54D0]();
}

uint64_t WTF::fastZeroedMalloc(WTF *this)
{
  return MEMORY[0x270EF54D8](this);
}

uint64_t WTF::equal()
{
  return MEMORY[0x270EF54E0]();
}

uint64_t WTF::String::String(WTF::String *this, const __CFString *a2)
{
  return MEMORY[0x270EF54E8](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::remove(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x270EF54F0](this, a2);
}

uint64_t WTF::JSONImpl::Array::create(WTF::JSONImpl::Array *this)
{
  return MEMORY[0x270EF54F8](this);
}

uint64_t WTF::JSONImpl::Value::create(WTF::JSONImpl::Value *this, const WTF::String *a2)
{
  return MEMORY[0x270EF5500](this, a2);
}

uint64_t WTF::JSONImpl::Value::create(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x270EF5508](this);
}

{
  return MEMORY[0x270EF5518](this);
}

uint64_t WTF::JSONImpl::Value::create(WTF::JSONImpl::Value *this, double a2)
{
  return MEMORY[0x270EF5510](this, a2);
}

uint64_t WTF::JSONImpl::Value::operator delete()
{
  return MEMORY[0x270EF5520]();
}

uint64_t WTF::JSONImpl::Object::create(WTF::JSONImpl::Object *this)
{
  return MEMORY[0x270EF5528](this);
}

uint64_t WTF::fastFree(WTF *this, void *a2)
{
  return MEMORY[0x270EF5530](this, a2);
}

uint64_t Inspector::BackendDispatcher::sendResponse()
{
  return MEMORY[0x270EF5538]();
}

uint64_t Inspector::BackendDispatcher::sendPendingErrors(Inspector::BackendDispatcher *this)
{
  return MEMORY[0x270EF5540](this);
}

uint64_t Inspector::BackendDispatcher::reportProtocolError()
{
  return MEMORY[0x270EF5548]();
}

{
  return MEMORY[0x270EF5550]();
}

uint64_t Inspector::CSSBackendDispatcher::create()
{
  return MEMORY[0x270EF5558]();
}

uint64_t Inspector::DOMBackendDispatcher::create()
{
  return MEMORY[0x270EF5560]();
}

uint64_t Inspector::PageBackendDispatcher::create()
{
  return MEMORY[0x270EF5568]();
}

uint64_t Inspector::NetworkBackendDispatcher::create()
{
  return MEMORY[0x270EF5570]();
}

uint64_t Inspector::DOMStorageBackendDispatcher::create()
{
  return MEMORY[0x270EF5578]();
}

uint64_t WTF::StringImpl::hashSlowCase(WTF::StringImpl *this)
{
  return MEMORY[0x270EF5580](this);
}

uint64_t WTF::JSONImpl::ObjectBase::getBoolean(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x270EF5588](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getInteger(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x270EF5590](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getArray(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x270EF5598](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getDouble(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x270EF55A0](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getObject(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x270EF55A8](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getString(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x270EF55B0](this, a2);
}

uint64_t WTF::JSONImpl::Value::toJSONString(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x270EF55B8](this);
}

uint64_t WTF::JSONImpl::Value::asString(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x270EF55C0](this);
}

uint64_t WTF::JSONImpl::Value::asInteger(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x270EF55C8](this);
}

uint64_t WTF::JSONImpl::ArrayBase::get(WTF::JSONImpl::ArrayBase *this)
{
  return MEMORY[0x270EF55D0](this);
}

uint64_t Inspector::FrontendRouter::sendEvent(Inspector::FrontendRouter *this, const WTF::String *a2)
{
  return MEMORY[0x270EF55D8](this, a2);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

uint64_t lockdown_copy_checkin_info()
{
  return MEMORY[0x270F99B28]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x270F99B50]();
}

uint64_t lockdown_get_socket()
{
  return MEMORY[0x270F99B60]();
}

uint64_t lockdown_recv()
{
  return MEMORY[0x270F99B68]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x270EDAB10]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

uint64_t secure_lockdown_checkin()
{
  return MEMORY[0x270F99B90]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}