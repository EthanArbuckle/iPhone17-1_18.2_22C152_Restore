void *__destroy_helper_block_ea8_32c114_ZTSKZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEE3__0(uint64_t a1)
{
  return std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100]((void *)(a1 + 40));
}

void *__destroy_helper_block_ea8_32c120_ZTSKZZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEEN3__0clEvEUlvE_(uint64_t a1)
{
  return std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100]((void *)(a1 + 112));
}

void *__destroy_helper_block_ea8_32c108_ZTSKZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEE3__0(uint64_t a1)
{
  return std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100]((void *)(a1 + 40));
}

uint64_t __copy_helper_block_ea8_32c114_ZTSKZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEE3__0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

uint64_t __copy_helper_block_ea8_32c108_ZTSKZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEE3__0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

id __copy_helper_block_ea8_32c114_ZTSKZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_EUlvE_(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = v5;
  return result;
}

id __copy_helper_block_ea8_32c86_ZTSKZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectE3__0(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t __copy_helper_block_ea8_32c126_ZTSKZZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEEN3__0clEvEUlvE_(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__value_func[abi:nn180100](a1 + 48, a2 + 48);
}

void sub_1000046A0(_Unwind_Exception *exception_object)
{
  v3 = *(std::__shared_weak_count **)(v1 + 40);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_ea8_32c126_ZTSKZZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEEN3__0clEvEUlvE_(uint64_t a1)
{
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100]((void *)(a1 + 48));
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
}

void __destroy_helper_block_ea8_32c101_ZTSKZZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectENK3__0clES3_EUlvE_(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
}

void ___ZZZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectENK3__0clES3_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (xpc_get_type(*(xpc_object_t *)(a1 + 48)) == (xpc_type_t)&_xpc_type_error)
  {
    v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void **)(a1 + 48);
    Backend::Server::handleConnectionError((uint64_t)v2, v4, v5);
  }
  else
  {
    v3 = *(void **)(a1 + 48);
    Backend::Server::handleConnectionMessage(v2, v3);
  }
}

void ___ZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    id v6 = v3;
    v7 = *(NSObject ***)(a1 + 32);
    v8 = *v7;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3321888768;
    v14 = ___ZZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
    v15 = &__block_descriptor_48_ea8_32c114_ZTSKZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_EUlvE__e5_v8__0l;
    id v16 = v6;
    v17 = v7;
    v4 = objc_retainBlock(&v12);

LABEL_8:
    dispatch_async(v8, v4);
LABEL_9:

    goto LABEL_10;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v9 = *(NSObject ***)(a1 + 32);
    id v10 = v3;
    v11 = *(NSObject ***)(a1 + 32);
    v8 = *v9;
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3321888768;
    v14 = ___ZZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_ENKUlvE0_cvU13block_pointerFvvEEv_block_invoke;
    v15 = &__block_descriptor_48_ea8_32c115_ZTSKZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_EUlvE0__e5_v8__0l;
    id v16 = v10;
    v17 = v11;
    v4 = objc_retainBlock(&v12);

    goto LABEL_8;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    v4 = (id)WPOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      ___ZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEE_block_invoke_cold_1((uint64_t)string, (uint8_t *)&v12, v4);
    }
    goto LABEL_9;
  }
LABEL_10:
}

void sub_100004998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Backend::Server::handleNewConnection(uint64_t a1, void *a2)
{
  id v7 = a2;
  std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__emplace_unique_key_args<NSObject  {objcproto13OS_xpc_object}* {__strong},NSObject  {objcproto13OS_xpc_object}* const {__strong}&>((uint64_t **)(a1 + 16), (unint64_t *)&v7, &v7);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3321888768;
  handler[2] = ___ZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObject_block_invoke;
  handler[3] = &__block_descriptor_48_ea8_32c86_ZTSKZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectE3__0_e33_v16__0__NSObject_OS_xpc_object__8l;
  id v3 = v7;
  id v5 = v3;
  uint64_t v6 = a1;
  xpc_connection_set_event_handler((xpc_connection_t)v3, handler);

  xpc_connection_resume((xpc_connection_t)v7);
}

void sub_100004A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__emplace_unique_key_args<NSObject  {objcproto13OS_xpc_object}* {__strong},NSObject  {objcproto13OS_xpc_object}* const {__strong}&>(uint64_t **a1, unint64_t *a2, id *a3)
{
  uint64_t v6 = a1 + 1;
  id v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        id v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      id v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    id v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = (uint64_t)*a3;
    std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  id v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  id result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      id v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), id v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            id v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              id v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            id v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), id v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            id v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          id v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *id v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

id __copy_helper_block_ea8_32c101_ZTSKZZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectENK3__0clES3_EUlvE_(void *a1, uint64_t a2)
{
  v4 = *(void **)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v4;
  id result = *(id *)(a2 + 48);
  a1[6] = result;
  return result;
}

void ___ZZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(Backend::DatabaseHandle **)(a1 + 32);
  Backend::DatabaseHandle::dataWithoutPendingUpdates(v2, &v5);
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__value_func[abi:nn180100]((uint64_t)v7, a1 + 40);
  id v3 = *((void *)v2 + 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = ___ZZZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEEN3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v8[3] = &__block_descriptor_80_ea8_32c126_ZTSKZZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEEN3__0clEvEUlvE__e5_v8__0l;
  v8[4] = v5;
  unint64_t v9 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__value_func[abi:nn180100]((uint64_t)v10, (uint64_t)v7);
  v4 = objc_retainBlock(v8);
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](v10);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v9);
  }
  dispatch_async(v3, v4);

  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](v7);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
}

void sub_100004EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a21);
  }
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](v21);
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a11);
  }
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void Backend::DatabaseHandle::dataWithoutPendingUpdates(Backend::DatabaseHandle *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  v4 = (std::mutex *)((char *)this + 80);
  std::mutex::lock((std::mutex *)((char *)this + 80));
  uint64_t v6 = *((void *)this + 8);
  uint64_t v5 = *((void *)this + 9);
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  *a2 = v6;
  a2[1] = v5;

  std::mutex::unlock(v4);
}

void std::__function::__func<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::shared_ptr<Platform::SharedMemory> &&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  unsigned __int8 v3 = 0;
  WebPrivacy::XPC::sendReply<WebPrivacy::XPC::GetListReply,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>(v2, &v3, a2);
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::GetListReply,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  id v7 = a1;
  xpc_dictionary_get_remote_connection(v7);
  uint64_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = WebPrivacy::XPC::serializeReply<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>(v7, a2, a3);
  xpc_connection_send_message(v5, v6);
}

void sub_1000050A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void *___ZZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 32);
  Backend::DatabaseHandle::header(v2, (uint64_t)&v6);
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::__value_func[abi:nn180100]((uint64_t)v11, a1 + 40);
  unsigned __int8 v3 = v2[1];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3321888768;
  v12[2] = ___ZZZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEEN3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v12[3] = &__block_descriptor_144_ea8_32c120_ZTSKZZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEEN3__0clEvEUlvE__e5_v8__0l;
  LOBYTE(v13) = 0;
  char v20 = 0;
  if (v10)
  {
    __int16 v13 = v6;
    long long v14 = v7;
    long long v15 = v8;
    *(void *)id v16 = v9[0];
    *(void *)&v16[6] = *(void *)((char *)v9 + 6);
    uint64_t v17 = *(void *)((char *)&v9[1] + 6);
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    char v20 = 1;
  }
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::__value_func[abi:nn180100]((uint64_t)v21, (uint64_t)v11);
  v4 = objc_retainBlock(v12);
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v21);
  dispatch_async(v3, v4);

  return std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v11);
}

void sub_100005230(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void *Backend::DatabaseHandle::getHeader(NSObject **a1, uint64_t a2)
{
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::__value_func[abi:nn180100]((uint64_t)v7, a2);
  unsigned __int8 v3 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = ___ZZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v8[3] = &__block_descriptor_72_ea8_32c108_ZTSKZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEE3__0_e5_v8__0l;
  v8[4] = a1;
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::__value_func[abi:nn180100]((uint64_t)v9, (uint64_t)v7);
  v4 = objc_retainBlock(v8);
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v9);
  dispatch_async(v3, v4);

  return std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v7);
}

void sub_100005348(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::destroy_deallocate(void **__p)
{
  if (*((char *)__p + 47) < 0) {
    operator delete(__p[3]);
  }

  operator delete(__p);
}

uint64_t std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  uint64_t v3;

  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = v3;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

std::string *std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::__clone(uint64_t a1)
{
  uint64_t v2 = (std::string *)operator new(0x30uLL);
  std::string::size_type v3 = *(void *)(a1 + 8);
  v2->__r_.__value_.__r.__words[0] = (std::string::size_type)off_100018A48;
  v2->__r_.__value_.__l.__size_ = v3;
  LOWORD(v2->__r_.__value_.__r.__words[2]) = *(_WORD *)(a1 + 16);
  v4 = v2 + 1;
  if (*(char *)(a1 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a1 + 24), *(void *)(a1 + 32));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 + 24);
    v2[1].__r_.__value_.__r.__words[2] = *(void *)(a1 + 40);
  }
  return v2;
}

void sub_100005548(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t Backend::DatabaseHandle::header@<X0>(dispatch_queue_t *this@<X0>, uint64_t a2@<X8>)
{
  dispatch_assert_queue_V2(*this);
  uint64_t result = Backend::DatabaseHandle::mappedArrayView((Backend::DatabaseHandle *)this);
  if (v5 > 0x47)
  {
    *(_WORD *)a2 = *(_WORD *)result;
    *(_OWORD *)(a2 + 2) = *(_OWORD *)(result + 2);
    *(_OWORD *)(a2 + 18) = *(_OWORD *)(result + 18);
    *(void *)(a2 + 34) = *(void *)(result + 34);
    *(void *)(a2 + 40) = *(void *)(result + 40);
    *(void *)(a2 + 48) = *(void *)(result + 48);
    char v6 = 1;
    *(void *)(a2 + 56) = 0;
    *(void *)(a2 + 64) = 0;
  }
  else
  {
    char v6 = 0;
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 72) = v6;
  return result;
}

uint64_t Backend::DatabaseHandle::mappedArrayView(Backend::DatabaseHandle *this)
{
  uint64_t v2 = (std::mutex *)((char *)this + 80);
  std::mutex::lock((std::mutex *)((char *)this + 80));
  std::string::size_type v3 = (Platform::SharedMemory *)*((void *)this + 8);
  if (v3) {
    uint64_t v4 = Platform::SharedMemory::view(v3);
  }
  else {
    uint64_t v4 = 0;
  }
  std::mutex::unlock(v2);
  return v4;
}

void sub_1000056BC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    long long v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void Backend::Server::handleConnectionMessage(void *a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v4 = WPOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      Backend::Server::handleConnectionMessage(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    goto LABEL_10;
  }
  id v12 = v3;
  if (xpc_get_type(v12) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_8;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v12, "msg");
  if (uint64 >= 0xA)
  {
    long long v14 = WPOSLogXPC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      Backend::Server::handleConnectionMessage(uint64, v14);
    }
LABEL_8:

    long long v15 = WPOSLogXPC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      Backend::Server::handleConnectionMessage(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_10;
  }

  if (uint64 > 9u) {
    goto LABEL_22;
  }
  if (((1 << uint64) & 0x30F) == 0)
  {
    if (uint64 == 4)
    {
LABEL_21:
      Backend::Server::handleUpdateList((uint64_t)a1, v12);
      goto LABEL_10;
    }
    if (uint64 == 6)
    {
LABEL_20:
      Backend::Server::handleGetList((uint64_t)a1, v12);
      goto LABEL_10;
    }
LABEL_22:
    v25 = WPOSLogXPC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      Backend::Server::handleConnectionMessage(uint64, v25);
    }
    goto LABEL_10;
  }
  uint64_t isAppleInternalInstall = Platform::isAppleInternalInstall();
  if (isAppleInternalInstall)
  {
    switch((char)uint64)
    {
      case 0:
        Backend::Server::handleSetServerEndpoint(isAppleInternalInstall, v12);
        break;
      case 2:
        Backend::Server::handleGetStatus(a1, v12);
        break;
      case 4:
        goto LABEL_21;
      case 6:
        goto LABEL_20;
      case 8:
        Backend::Server::handleDeleteList((uint64_t)a1, v12);
        break;
      default:
        goto LABEL_22;
    }
  }
  else
  {
    v24 = WPOSLogXPC();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      Backend::Server::handleConnectionMessage(uint64, v24);
    }
  }
LABEL_10:
}

void sub_100005950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Backend::Server::handleGetList(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  unsigned __int16 v4 = WebPrivacy::XPC::decode<WebPrivacy::XPC::GetList>(v3);
  if (v4 > 0xFFu)
  {
    uint64_t v5 = (NSObject **)Backend::Server::databaseHandle(a1, v4);
    v8[0] = off_100018B20;
    v8[1] = v3;
    v8[3] = v8;
    Backend::DatabaseHandle::getData(v5, (uint64_t)v8);
    std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](v8);
  }
  else
  {
    LOBYTE(v8[0]) = 1;
    WebPrivacy::XPC::sendReply<WebPrivacy::XPC::GetListReply,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>(v3, (unsigned __int8 *)v8, (uint64_t)&v6);
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v7);
    }
  }
}

void sub_100005A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

uint64_t Backend::Server::databaseHandle(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
      uint64_t v2 = a1 + 40;
      break;
    case 2:
      uint64_t v2 = a1 + 48;
      break;
    case 3:
      uint64_t v2 = a1 + 56;
      break;
    case 4:
      uint64_t v2 = a1 + 64;
      break;
    case 5:
      uint64_t v2 = a1 + 72;
      break;
    case 6:
      uint64_t v2 = a1 + 80;
      break;
    case 7:
      uint64_t v2 = a1 + 88;
      break;
    case 8:
      uint64_t v2 = a1 + 96;
      break;
    default:
      Backend::Server::databaseHandle();
  }
  return *(void *)v2;
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::XPC::GetList>(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned __int8 v6 = 0;
    unsigned __int16 v4 = xpc_dictionary_get_array(v1, "args");
    int v2 = WebPrivacy::XPC::Message<(MessageName)6,Backend::RemoteList>::decode(&v6, v4);

    if (v2) {
      unsigned __int8 v3 = v6;
    }
    else {
      unsigned __int8 v3 = 0;
    }
  }
  else
  {
    int v2 = 0;
    unsigned __int8 v3 = 0;
  }

  return v3 | (v2 << 8);
}

void sub_100005BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)6,Backend::RemoteList>::decode(unsigned char *a1, void *a2)
{
  id v3 = a2;
  if (xpc_array_get_count(v3) == 1) {
    uint64_t v4 = WebPrivacy::XPC::decode(v3, a1);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_100005C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WebPrivacy::XPC::serializeReply<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_uint64(reply, "msg", 7uLL);
  xpc_object_t value = xpc_array_create_empty();
  uint64_t v6 = *a2;
  xpc_object_t v7 = value;
  xpc_object_t v8 = xpc_uint64_create(v6);
  xpc_array_append_value(v7, v8);

  v10[0] = &value;
  v10[1] = a3;
  WebPrivacy::XPC::serializeReply<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>(NSObject  {objcproto13OS_xpc_object}*,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory> &&)::{lambda(void)#1}::operator()((uint64_t)v10);
  xpc_dictionary_set_value(reply, "args", value);

  return reply;
}

void sub_100005D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::serializeReply<(MessageName)7,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory>>(NSObject  {objcproto13OS_xpc_object}*,WebPrivacy::MessageError,std::shared_ptr<Platform::SharedMemory> &&)::{lambda(void)#1}::operator()(uint64_t a1)
{
  id v1 = *(void **)(a1 + 8);
  xpc_object_t xarray = **(id **)a1;
  if (*v1) {
    readonly = (void *)xpc_shmem_create_readonly();
  }
  else {
    readonly = xpc_null_create();
  }
  xpc_array_append_value(xarray, readonly);
}

void sub_100005DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *Backend::DatabaseHandle::getData(NSObject **a1, uint64_t a2)
{
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__value_func[abi:nn180100]((uint64_t)v7, a2);
  id v3 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = ___ZZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v8[3] = &__block_descriptor_72_ea8_32c114_ZTSKZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEE3__0_e5_v8__0l;
  void v8[4] = a1;
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__value_func[abi:nn180100]((uint64_t)v9, (uint64_t)v7);
  uint64_t v4 = objc_retainBlock(v8);
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](v9);
  dispatch_async(v3, v4);

  return std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](v7);
}

void sub_100005EF4(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__value_func[abi:nn180100](void *a1)
{
  int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::shared_ptr<Platform::SharedMemory> &&)>::destroy(uint64_t a1)
{
}

uint64_t std::__function::__value_func<void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = v3;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  uint64_t v3;

  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

id std::__function::__func<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = off_100018B20;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

uint64_t WebPrivacy::XPC::decode(void *a1, unsigned char *a2)
{
  id v3 = a1;
  if (!xpc_array_get_count(v3))
  {

LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = xpc_array_get_value(v3, 0);
  xpc_type_t type = xpc_get_type(v4);

  if (type != (xpc_type_t)&_xpc_type_uint64) {
    goto LABEL_6;
  }
  int uint64 = xpc_array_get_uint64(v3, 0);
  if ((uint64 - 1) >= 8) {
    goto LABEL_6;
  }
  *a2 = uint64;
  uint64_t v7 = 1;
LABEL_7:

  return v7;
}

void sub_1000061A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObject_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject ***)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3321888768;
  void v10[2] = ___ZZZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectENK3__0clES3_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
  v10[3] = &__block_descriptor_56_ea8_32c101_ZTSKZZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectENK3__0clES3_EUlvE__e5_v8__0l;
  void v10[4] = v4;
  id v11 = v5;
  id v12 = v3;
  id v7 = v5;
  id v8 = v3;
  uint64_t v9 = objc_retainBlock(v10);

  dispatch_async(v6, v9);
}

void Backend::Server::handleUpdateList(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v16 = v3;
  WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateList>(v3, (uint64_t)v13);
  if (v15)
  {
    int v4 = v13[0];
    if (((v13[0] - 1) & 0xF8) != 0) {
      char v5 = 0;
    }
    else {
      char v5 = 0x101010101010202uLL >> (8 * (v13[0] - 1));
    }
    double v6 = *(double *)&Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::lastFailedDownloadTime;
    if (v6 + 10.0 <= Platform::secondsSince1970InGMT())
    {
      uint64_t updated = Backend::Server::incomingDatabaseUpdateMessages(a1, v4);
      std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::push_back[abi:nn180100]((char **)updated, &v16);
      if (*(void *)(updated + 8) - *(void *)updated == 8)
      {
        uint64_t v9 = (NSObject **)Backend::Server::databaseHandle(a1, v4);
        LOBYTE(v11) = v4;
        HIBYTE(v11) = v5;
        if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&__p, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
        }
        else {
          std::string __p = v14;
        }
        uint64_t v18 = 0;
        uint64_t v10 = (std::string *)operator new(0x30uLL);
        v10->__r_.__value_.__r.__words[0] = (std::string::size_type)off_100018A48;
        v10->__r_.__value_.__l.__size_ = a1;
        LOWORD(v10->__r_.__value_.__r.__words[2]) = v11;
        v10[1] = __p;
        memset(&__p, 0, sizeof(__p));
        uint64_t v18 = v10;
        Backend::DatabaseHandle::getHeader(v9, (uint64_t)v17);
        std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v17);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
    }
    else
    {
      id v7 = WPOSLogServer();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        Backend::Server::handleUpdateList(v4, v7);
      }
      LOBYTE(v17[0]) = 2;
      WebPrivacy::XPC::sendReply<WebPrivacy::XPC::UpdateListReply,WebPrivacy::MessageError>(v3, (unsigned __int8 *)v17);
    }
  }
  else
  {
    LOBYTE(v17[0]) = 1;
    WebPrivacy::XPC::sendReply<WebPrivacy::XPC::UpdateListReply,WebPrivacy::MessageError>(v3, (unsigned __int8 *)v17);
  }
  if (v15 && SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
}

void sub_1000064BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,void *a25,char a26)
{
  if (a24)
  {
    if (a23 < 0) {
      operator delete(__p);
    }
  }

  _Unwind_Resume(a1);
}

id std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::push_back[abi:nn180100](char **a1, id *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  id v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = (v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v25 = v4;
    if (v13) {
      std::string v14 = (char *)std::allocator<NSObject  {objcproto13OS_xpc_object}* {__strong}>::allocate_at_least[abi:nn180100](v4, v13);
    }
    else {
      std::string v14 = 0;
    }
    char v15 = &v14[8 * v10];
    id v16 = &v14[8 * v13];
    v24 = v16;
    *(void *)char v15 = *a2;
    uint64_t v9 = v15 + 8;
    v23.i64[1] = (uint64_t)(v15 + 8);
    uint64_t v18 = *a1;
    uint64_t v17 = a1[1];
    if (v17 == *a1)
    {
      int64x2_t v20 = vdupq_n_s64((unint64_t)v17);
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *(void *)uint64_t v17 = 0;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      int64x2_t v20 = *(int64x2_t *)a1;
      uint64_t v9 = (char *)v23.i64[1];
      id v16 = v24;
    }
    *a1 = v15;
    a1[1] = v9;
    int64x2_t v23 = v20;
    uint64_t v21 = a1[2];
    a1[2] = v16;
    v24 = v21;
    uint64_t v22 = v20.i64[0];
    id result = (id)std::__split_buffer<NSObject  {objcproto13OS_xpc_object}* {__strong}>::~__split_buffer((uint64_t)&v22);
  }
  else
  {
    id result = *a2;
    *(void *)id v7 = result;
    uint64_t v9 = v7 + 8;
  }
  a1[1] = v9;
  return result;
}

void *std::allocator<NSObject  {objcproto13OS_xpc_object}* {__strong}>::allocate_at_least[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::__split_buffer<NSObject  {objcproto13OS_xpc_object}* {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void ***)(a1 + 8);
  double v5 = *(double *)(a2 + 48);
  double v6 = Platform::secondsSince1970InGMT();
  id v7 = WPOSLogServer();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5 <= v6)
  {
    if (v8)
    {
      if ((*(unsigned char *)(a1 + 16) - 1) > 7u) {
        CFStringRef v10 = @"Invalid";
      }
      else {
        CFStringRef v10 = *(&off_100018C68 + (char)(*(unsigned char *)(a1 + 16) - 1));
      }
      std::string v14 = (const char *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0) {
        std::string v14 = *(const char **)(a1 + 24);
      }
      if (!v14) {
        std::string v14 = "unspecified client";
      }
      uint64_t v15 = ((unsigned char *)v4[14] - (unsigned char *)v4[13]) >> 3;
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v23 = v15 + 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetching %{public}@ on behalf of %{public}s (%zu active fetcher(s)).", buf, 0x20u);
    }
    id v16 = *(void ***)(a2 + 34);
    if (*(unsigned char *)(a2 + 72)) {
      unint64_t v17 = *(unsigned int *)(a2 + 42) | ((unint64_t)*(unsigned __int16 *)(a2 + 46) << 32) | 0x1000000000000;
    }
    else {
      unint64_t v17 = 0;
    }
    if (!*(unsigned char *)(a2 + 72)) {
      id v16 = 0;
    }
    uint64_t v18 = *v4;
    LOBYTE(v21[0]) = *(unsigned char *)(a1 + 16);
    BYTE1(v21[0]) = 1;
    BYTE2(v21[0]) = *(unsigned char *)(a1 + 17);
    *(void ***)((char *)v21 + 3) = v16;
    *(_DWORD *)((char *)&v21[1] + 3) = v17;
    BYTE1(v21[2]) = BYTE6(v17);
    *(_WORD *)((char *)&v21[1] + 7) = WORD2(v17);
    Backend::ListUpdateFetcher::create(v18);
  }
  if (v8)
  {
    if ((*(unsigned char *)(a1 + 16) - 1) > 7u) {
      CFStringRef v9 = @"Invalid";
    }
    else {
      CFStringRef v9 = *(&off_100018C68 + (char)(*(unsigned char *)(a1 + 16) - 1));
    }
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Skipped fetch update for %{public}@ (last update was too recent).", buf, 0xCu);
  }
  uint64_t updated = Backend::Server::incomingDatabaseUpdateMessages((uint64_t)v4, *(unsigned __int8 *)(a1 + 16));
  uint64_t v12 = *(id **)updated;
  *(void *)buf = *(void *)updated;
  *(_OWORD *)&buf[8] = *(_OWORD *)(updated + 8);
  uint64_t v19 = *(id **)&buf[8];
  *(void *)(updated + 8) = 0;
  *(void *)(updated + 16) = 0;
  *(void *)uint64_t updated = 0;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__vdeallocate((void **)updated);
  *(void *)uint64_t updated = 0;
  *(void *)(updated + 8) = 0;
  *(void *)(updated + 16) = 0;
  memset(v21, 0, sizeof(v21));
  int64x2_t v20 = (Backend::ListUpdateFetcher *)v21;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v20);
  while (v12 != v19)
  {
    id v13 = *v12;
    LOBYTE(v21[0]) = 0;
    WebPrivacy::XPC::sendReply<WebPrivacy::XPC::UpdateListReply,WebPrivacy::MessageError>(v13, (unsigned __int8 *)v21);

    ++v12;
  }
  v21[0] = (void **)buf;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100](v21);
}

void sub_100006AF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, Backend::ListUpdateFetcher *a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a11) {
    std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::operator()(a11);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  id v1 = *a1;
  int v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    double v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        double v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      double v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

double Platform::secondsSince1970InGMT(void)
{
  v0 = +[NSDate date];
  [v0 timeIntervalSince1970];
  double v2 = v1;
  uint64_t v3 = +[NSTimeZone systemTimeZone];
  double v4 = v2 + (double)(uint64_t)[v3 secondsFromGMT];

  return v4;
}

void sub_100006C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Backend::Server::incomingDatabaseUpdateMessages(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 1:
      uint64_t result = a1 + 128;
      break;
    case 2:
      uint64_t result = a1 + 152;
      break;
    case 3:
      uint64_t result = a1 + 176;
      break;
    case 4:
      uint64_t result = a1 + 200;
      break;
    case 5:
      uint64_t result = a1 + 224;
      break;
    case 6:
      uint64_t result = a1 + 248;
      break;
    case 7:
      uint64_t result = a1 + 272;
      break;
    case 8:
      uint64_t result = a1 + 296;
      break;
    default:
      Backend::Server::incomingDatabaseUpdateMessages();
  }
  return result;
}

void std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__vdeallocate(void **a1)
{
  double v1 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    double v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        double v5 = (void *)*((void *)v3 - 1);
        v3 -= 8;
      }
      while (v3 != v1);
      double v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::UpdateListReply,WebPrivacy::MessageError>(void *a1, unsigned __int8 *a2)
{
  id v5 = a1;
  xpc_dictionary_get_remote_connection(v5);
  uint64_t v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  double v4 = WebPrivacy::XPC::serializeReply<(MessageName)5,WebPrivacy::MessageError>(v5, a2);
  xpc_connection_send_message(v3, v4);
}

void sub_100006DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::decode<WebPrivacy::XPC::UpdateList>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v8[0] = 0;
    __p[1] = 0;
    uint64_t v10 = 0;
    __p[0] = 0;
    double v4 = xpc_dictionary_get_array(v3, "args");
    char v5 = WebPrivacy::XPC::Message<(MessageName)4,Backend::RemoteList,std::string>::decode(v8, v4);

    if (v5)
    {
      char v6 = v8[0];
      *(_OWORD *)(a2 + 8) = *(_OWORD *)__p;
      *(void *)(a2 + 24) = v10;
      *(unsigned char *)a2 = v6;
      *(unsigned char *)(a2 + 32) = 1;
    }
    else
    {
      int v7 = SHIBYTE(v10);
      *(unsigned char *)a2 = 0;
      *(unsigned char *)(a2 + 32) = 0;
      if (v7 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 32) = 0;
  }
}

void sub_100006EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)4,Backend::RemoteList,std::string>::decode(unsigned char *a1, void *a2)
{
  id v3 = a2;
  if (xpc_array_get_count(v3) == 2) {
    uint64_t v4 = WebPrivacy::XPC::Message<(MessageName)4,Backend::RemoteList,std::string>::decodeOne<0u>(a1, v3);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_100006F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)4,Backend::RemoteList,std::string>::decodeOne<0u>(unsigned char *a1, void *a2)
{
  id v3 = a2;
  if (WebPrivacy::XPC::decode(v3, a1)) {
    uint64_t v4 = WebPrivacy::XPC::Message<(MessageName)4,Backend::RemoteList,std::string>::decodeOne<1u>((uint64_t)a1, v3);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_100006F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)4,Backend::RemoteList,std::string>::decodeOne<1u>(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_array_get_count(v3) <= 1)
  {

    goto LABEL_7;
  }
  uint64_t v4 = xpc_array_get_value(v3, 1uLL);
  xpc_type_t type = xpc_get_type(v4);

  if (type != (xpc_type_t)&_xpc_type_string)
  {
LABEL_7:

    uint64_t v8 = 0;
    goto LABEL_8;
  }
  string = (char *)xpc_array_get_string(v3, 1uLL);
  std::string::basic_string[abi:nn180100]<0>(&v10, string);
  int v7 = (void **)(a1 + 8);
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*v7);
  }
  *(_OWORD *)int v7 = v10;
  *(void *)(a1 + 24) = v11;

  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

void sub_10000708C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    char v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    char v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

id WebPrivacy::XPC::serializeReply<(MessageName)5,WebPrivacy::MessageError>(void *a1, unsigned __int8 *a2)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_uint64(reply, "msg", 5uLL);
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v5 = *a2;
  id v6 = empty;
  xpc_object_t v7 = xpc_uint64_create(v5);
  xpc_array_append_value(v6, v7);

  xpc_dictionary_set_value(reply, "args", v6);

  return reply;
}

void sub_100007204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZZZNK7Backend14DatabaseHandle7getDataEONSt3__18functionIFvONS1_10shared_ptrIN8Platform12SharedMemoryEEEEEEEN3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    double v2 = *(void (**)(void))(*(void *)v1 + 48);
    v2();
  }
  else
  {
    id v3 = std::__throw_bad_function_call[abi:nn180100]();
    __destroy_helper_block_ea8_32c114_ZTSKZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_EUlvE_((uint64_t)v3);
  }
}

void __destroy_helper_block_ea8_32c114_ZTSKZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_EUlvE_(uint64_t a1)
{
}

uint64_t __copy_helper_block_ea8_32c120_ZTSKZZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEEN3__0clEvEUlvE_(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 104) = 0;
  if (*(unsigned char *)(a2 + 104))
  {
    *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
    long long v2 = *(_OWORD *)(a2 + 34);
    *(_OWORD *)(a1 + 50) = *(_OWORD *)(a2 + 50);
    *(_OWORD *)(a1 + 34) = v2;
    uint64_t v3 = *(void *)(a2 + 66);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    *(void *)(a1 + 66) = v3;
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 96) = 0;
    *(unsigned char *)(a1 + 104) = 1;
  }
  return std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::__value_func[abi:nn180100](a1 + 112, a2 + 112);
}

uint64_t ___ZZZNK7Backend14DatabaseHandle9getHeaderEONSt3__18functionIFvONS1_8optionalINS_14DatabaseHeaderEEEEEEEN3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if (v1)
  {
    long long v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
    return v2();
  }
  else
  {
    size_t v4 = std::__throw_bad_function_call[abi:nn180100]();
    return ___ZZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(v4);
  }
}

void ___ZZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_ENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
}

__n128 Backend::ClientInfo::ClientInfo(uint64_t a1, long long *a2, __n128 *a3)
{
  long long v3 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v3;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  __n128 result = *a3;
  *(void *)(a1 + 40) = a3[1].n128_u64[0];
  *(__n128 *)(a1 + 24) = result;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  a3->n128_u64[0] = 0;
  return result;
}

void Backend::ClientInfo::~ClientInfo(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

uint64_t Backend::Configuration::serverEndpoint(Backend::Configuration *this)
{
  if (!Platform::isAppleInternalInstall()) {
    return 0;
  }
  uint64_t v1 = +[NSUserDefaults standardUserDefaults];
  long long v2 = [v1 persistentDomainForName:@"com.apple.WebPrivacy"];

  id v3 = [v2 objectForKey:@"ServerEndpoint"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4)
  {
    unsigned __int8 v6 = [v4 intValue];
    if ((v6 & 0xFC) != 0) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v6;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1000074BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Backend::Configuration::setServerEndpoint(uint64_t a1)
{
  long long v2 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v5 = @"ServerEndpoint";
  id v3 = +[NSNumber numberWithInt:a1];
  unsigned __int8 v6 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 setPersistentDomain:v4 forName:@"com.apple.WebPrivacy"];

  [v2 synchronize];
}

void sub_1000075D4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id Backend::Configuration::getURLRequest(Backend::Configuration *this, const Backend::ListUpdateRequestJSONSerializer *a2)
{
  id v3 = this;
  switch(Backend::Configuration::serverEndpoint(this))
  {
    case 0u:
      uint64_t v4 = 0;
      v43[22] = 0;
      *(void *)&long long v40 = "https://wps.apple.com";
      *((void *)&v40 + 1) = "/v1/getRemoteList";
      CFStringRef v5 = &v42;
      do
      {
        unsigned __int8 v6 = *(unsigned char **)&v41[8 * v4 - 16];
        char v7 = *v6;
        if (*v6)
        {
          uint64_t v8 = v6 + 1;
          do
          {
            *(unsigned char *)CFStringRef v5 = v7;
            CFStringRef v5 = (long long *)((char *)v5 + 1);
            int v9 = *v8++;
            char v7 = v9;
          }
          while (v9);
        }
        ++v4;
      }
      while (v4 != 2);
      goto LABEL_7;
    case 1u:
      uint64_t v12 = 0;
      v43[22] = 0;
      *(void *)&long long v40 = "http://localhost:8080";
      *((void *)&v40 + 1) = "/v1/getRemoteList";
      id v13 = &v42;
      do
      {
        std::string v14 = *(unsigned char **)&v41[8 * v12 - 16];
        char v15 = *v14;
        if (*v14)
        {
          id v16 = v14 + 1;
          do
          {
            *(unsigned char *)id v13 = v15;
            id v13 = (long long *)((char *)v13 + 1);
            int v17 = *v16++;
            char v15 = v17;
          }
          while (v17);
        }
        ++v12;
      }
      while (v12 != 2);
LABEL_7:
      long long v40 = v42;
      *(_OWORD *)v41 = *(_OWORD *)v43;
      *(void *)&v41[15] = *(void *)&v43[15];
      id v10 = [objc_alloc((Class)NSString) initWithUTF8String:&v40];
      goto LABEL_27;
    case 2u:
      uint64_t v18 = 0;
      v43[42] = 0;
      *(void *)&long long v40 = "https://remote-list-api-qa.corp.apple.com";
      *((void *)&v40 + 1) = "/v1/getRemoteList";
      uint64_t v19 = &v42;
      do
      {
        int64x2_t v20 = *(unsigned char **)&v41[8 * v18 - 16];
        char v21 = *v20;
        if (*v20)
        {
          uint64_t v22 = v20 + 1;
          do
          {
            *(unsigned char *)uint64_t v19 = v21;
            uint64_t v19 = (long long *)((char *)v19 + 1);
            int v23 = *v22++;
            char v21 = v23;
          }
          while (v23);
        }
        ++v18;
      }
      while (v18 != 2);
      long long v40 = v42;
      *(_OWORD *)v41 = *(_OWORD *)v43;
      *(_OWORD *)&v41[16] = *(_OWORD *)&v43[16];
      *(_OWORD *)&v41[27] = *(_OWORD *)&v43[27];
      id v10 = [objc_alloc((Class)NSString) initWithUTF8String:&v40];
      goto LABEL_27;
    case 3u:
      uint64_t v24 = 0;
      v43[33] = 0;
      *(void *)&long long v40 = "https://wps-stage.corp.apple.com";
      *((void *)&v40 + 1) = "/v1/getRemoteList";
      uint64_t v25 = &v42;
      do
      {
        v26 = *(unsigned char **)&v41[8 * v24 - 16];
        char v27 = *v26;
        if (*v26)
        {
          v28 = v26 + 1;
          do
          {
            *(unsigned char *)uint64_t v25 = v27;
            uint64_t v25 = (long long *)((char *)v25 + 1);
            int v29 = *v28++;
            char v27 = v29;
          }
          while (v29);
        }
        ++v24;
      }
      while (v24 != 2);
      long long v40 = v42;
      *(_OWORD *)v41 = *(_OWORD *)v43;
      *(_OWORD *)&v41[16] = *(_OWORD *)&v43[16];
      *(_WORD *)&v41[32] = *(_WORD *)&v43[32];
      id v10 = [objc_alloc((Class)NSString) initWithUTF8String:&v40];
LABEL_27:
      id v11 = v10;
      break;
    default:
      id v11 = 0;
      break;
  }
  v30 = +[NSURL URLWithString:v11];

  v31 = Backend::ListUpdateRequestJSONSerializer::serializedData(a2);
  if (*((char *)v3 + 23) < 0) {
    id v3 = *(Backend::Configuration **)v3;
  }
  v32 = +[NSString stringWithUTF8String:v3];
  id v33 = v30;
  id v34 = v31;
  id v35 = v32;
  id v36 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v33];
  [v36 setNetworkServiceType:5];
  [v36 setAllowsCellularAccess:0];
  [v36 setValue:@"POST" forHTTPHeaderField:@"X-HTTP-Method-Override"];
  [v36 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v36 setValue:@"1.5.0-prod.1682973469258.a186" forHTTPHeaderField:@"X-API-Version"];
  [v36 setHTTPMethod:@"POST"];
  [v36 setHTTPBody:v34];
  if ([v35 length])
  {
    v37 = _CFNetworkCopyDefaultUserAgentString();
    v38 = +[NSString stringWithFormat:@"%@ %@", v35, v37];
    [v36 setHTTPUserAgent:v38];
  }

  return v36;
}

void sub_100007A10(_Unwind_Exception *a1)
{
  int v9 = v7;

  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v3[0] = off_100018550;
  v3[3] = v3;
  Backend::Server::start((uint64_t)"com.apple.webprivacyd", (uint64_t)v3);
  std::function<NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::~function(v3);
  dispatch_main();
}

void sub_100007AF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::~__value_func[abi:nn180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<main::$_0,std::allocator<main::$_0>,NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::~__func()
{
}

void *std::__function::__func<main::$_0,std::allocator<main::$_0>,NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  *__n128 result = off_100018550;
  return result;
}

void std::__function::__func<main::$_0,std::allocator<main::$_0>,NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = off_100018550;
}

xpc_connection_t std::__function::__func<main::$_0,std::allocator<main::$_0>,NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::operator()(uint64_t a1, const char **a2)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service(*a2, (dispatch_queue_t)&_dispatch_main_q, 1uLL);

  return mach_service;
}

void *std::__function::__value_func<NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::~__value_func[abi:nn180100](void *a1)
{
  long long v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t Backend::DatabaseHandle::DatabaseHandle(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(void *)a1 = dispatch_queue_create("com.apple.WebPrivacy.DatabaseUpdates", 0);
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(void *)(a1 + 32) = v6;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  if (*(char *)(a1 + 39) >= 0) {
    size_t v7 = *(unsigned __int8 *)(a1 + 39);
  }
  else {
    size_t v7 = *(void *)(a1 + 24);
  }
  uint64_t v8 = std::string::basic_string[abi:nn180100](a1 + 40, v7 + 4);
  if (*(char *)(a1 + 63) >= 0) {
    int v9 = (void *)v8;
  }
  else {
    int v9 = *(void **)(a1 + 40);
  }
  if (v7)
  {
    if (*(char *)(a1 + 39) >= 0) {
      id v10 = (const void *)(a1 + 16);
    }
    else {
      id v10 = *(const void **)(a1 + 16);
    }
    memmove(v9, v10, v7);
  }
  strcpy((char *)v9 + v7, ".tmp");
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 850045863;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(void *)(a1 + 136) = 0;
  Backend::DatabaseHandle::initialize((NSObject **)a1);

  return a1;
}

void sub_100007D58(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v3);
  }
  Platform::WorkDispatcher::~WorkDispatcher((id *)v1);

  _Unwind_Resume(a1);
}

void Backend::DatabaseHandle::initialize(NSObject **this)
{
  uint64_t v1 = *this;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3321888768;
  v3[2] = ___ZZN7Backend14DatabaseHandle10initializeEvENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c50_ZTSKZN7Backend14DatabaseHandle10initializeEvE3__0_e5_v8__0l;
  void v3[4] = this;
  long long v2 = objc_retainBlock(v3);
  dispatch_async(v1, v2);
}

void Platform::WorkDispatcher::~WorkDispatcher(id *this)
{
}

uint64_t Backend::DatabaseHandle::open@<X0>(dispatch_queue_t *this@<X0>, _DWORD *a2@<X8>)
{
  dispatch_assert_queue_V2(*this);
  uint64_t v4 = (const char *)(this + 2);
  if (*((char *)this + 39) < 0) {
    uint64_t v4 = *(const char **)v4;
  }
  uint64_t result = open(v4, 0);
  *a2 = result;
  return result;
}

void Backend::DatabaseHandle::apply(dispatch_queue_t *a1, uint64_t a2, uint64_t a3)
{
  dispatch_assert_queue_not_V2(*a1);
  v9[1] = (void **)a1;
  Backend::DatabaseUpdate::DatabaseUpdate(v10, a2);
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)v14, a3);
  id v16 = a1;
  Backend::DatabaseUpdate::DatabaseUpdate(v17, v10);
  if (v15)
  {
    if (v15 == v14)
    {
      uint64_t v22 = v21;
      (*(void (**)(void *, void *))(v14[0] + 24))(v14, v21);
    }
    else
    {
      uint64_t v22 = v15;
      char v15 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v6 = malloc_type_malloc(0xC0uLL, 0x10F004075AC7B26uLL);
  *uint64_t v6 = _NSConcreteMallocBlock;
  v6[1] = 50331650;
  v6[2] = Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0)::{lambda(void *)#1}::__invoke;
  v6[3] = &Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0)::descriptor;
  v6[4] = v16;
  Backend::DatabaseUpdate::DatabaseUpdate(v6 + 5, v17);
  if (v22)
  {
    if (v22 == v21)
    {
      v6[23] = v6 + 20;
      (*(void (**)(void *))(v21[0] + 24))(v21);
    }
    else
    {
      v6[23] = v22;
      uint64_t v22 = 0;
    }
  }
  else
  {
    v6[23] = 0;
  }
  size_t v7 = objc_retainBlock(v6);

  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v21);
  v9[0] = (void **)&v20;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](v9);
  if (__p)
  {
    uint64_t v19 = __p;
    operator delete(__p);
  }
  uint64_t v8 = objc_retainBlock(v7);
  dispatch_async(*a1, v8);

  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v14);
  id v16 = (dispatch_queue_t *)&v13;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v16);
  if (v11)
  {
    uint64_t v12 = v11;
    operator delete(v11);
  }
}

void sub_1000080E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41)
{
}

uint64_t Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::~$_0(uint64_t a1)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100]((void *)(a1 + 128));
  uint64_t v4 = (void **)(a1 + 104);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v4);
  long long v2 = *(void **)(a1 + 80);
  if (v2)
  {
    *(void *)(a1 + 88) = v2;
    operator delete(v2);
  }
  return a1;
}

BOOL Backend::DatabaseHandle::mapSharedMemory(Backend::DatabaseHandle *this)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)this);
  Backend::DatabaseHandle::open((dispatch_queue_t *)this, &v8);
  if (v8 == -1) {
    return 0;
  }
  int v6 = v8;
  Platform::SharedMemory::map();
  close(v6);
  BOOL v2 = v7 != 0;
  if ((void)v7)
  {
    std::mutex::lock((std::mutex *)((char *)this + 80));
    long long v3 = v7;
    long long v7 = 0uLL;
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 9);
    *((_OWORD *)this + 4) = v3;
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v4);
    }
    std::mutex::unlock((std::mutex *)((char *)this + 80));
  }
  if (*((void *)&v7 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v7 + 1));
  }
  return v2;
}

void sub_100008250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, uint64_t a12, std::__shared_weak_count *a13)
{
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a13);
  }
  _Unwind_Resume(exception_object);
}

void Backend::DatabaseHandle::unmapSharedMemory(Backend::DatabaseHandle *this)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)this);
  std::mutex::lock((std::mutex *)((char *)this + 80));
  BOOL v2 = (std::__shared_weak_count *)*((void *)this + 9);
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }

  std::mutex::unlock((std::mutex *)((char *)this + 80));
}

void *Backend::DatabaseHandle::unlink(NSObject **a1, uint64_t a2)
{
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)v7, a2);
  long long v3 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = ___ZZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v8[3] = &__block_descriptor_72_ea8_32c68_ZTSKZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEE3__0_e5_v8__0l;
  void v8[4] = a1;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)v9, (uint64_t)v7);
  uint64_t v4 = objc_retainBlock(v8);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v9);
  dispatch_async(v3, v4);

  return std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v7);
}

void sub_1000083D4(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void *Backend::DatabaseHandle::loadRules(NSObject **a1, uint64_t a2)
{
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::__value_func[abi:nn180100]((uint64_t)v7, a2);
  long long v3 = *a1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3321888768;
  v8[2] = ___ZZNK7Backend14DatabaseHandle9loadRulesEONSt3__18functionIFvONS1_6vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS7_IS9_EEEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke;
  v8[3] = &__block_descriptor_72_ea8_32c157_ZTSKZNK7Backend14DatabaseHandle9loadRulesEONSt3__18functionIFvONS1_6vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS7_IS9_EEEEEEEE3__0_e5_v8__0l;
  void v8[4] = a1;
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::__value_func[abi:nn180100]((uint64_t)v9, (uint64_t)v7);
  uint64_t v4 = objc_retainBlock(v8);
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v9);
  dispatch_async(v3, v4);

  return std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v7);
}

void sub_1000084EC(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v1);
  _Unwind_Resume(a1);
}

void *Backend::DatabaseHandle::loadRules@<X0>(dispatch_queue_t *this@<X0>, void *a2@<X8>)
{
  dispatch_assert_queue_V2(*this);
  Backend::DatabaseHandle::mappedArrayView((Backend::DatabaseHandle *)this);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v5[0] = off_100018778;
  v5[1] = a2;
  v5[3] = v5;
  WebPrivacy::enumerateListRules();
  return std::__function::__value_func<void ()(Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](v5);
}

void sub_1000085B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<void ()(Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100]((void ***)va);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::string::basic_string[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    int v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t *Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v49 = 0;
  *(void *)v60.count = v2;
  *(void *)v60.hash = &v49;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)&v60.hash[2], (uint64_t)(a1 + 16));
  long long v67 = *(_OWORD *)v60.count;
  std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)&v68, (uint64_t)&v60.hash[2]);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](&v60.hash[2]);
  Backend::DatabaseHandle::header((dispatch_queue_t *)v2, (uint64_t)&v60);
  if (LOBYTE(v60.wbuf[8]))
  {
    if (*(void *)((char *)&v60.hash[6] + 2) == *(uint64_t *)((char *)a1 + 42) && *(void *)v60.wbuf == a1[6])
    {
      if (*(void *)((char *)v60.count + 2) != *(uint64_t *)((char *)a1 + 10)
        || *(void *)((char *)v60.hash + 2) != *(uint64_t *)((char *)a1 + 18)
        || *(void *)((char *)&v60.hash[2] + 2) != *(uint64_t *)((char *)a1 + 26)
        || *(void *)((char *)&v60.hash[4] + 2) != *(uint64_t *)((char *)a1 + 34))
      {
        int v9 = WPOSLogDatabase();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(v9);
        }
        return Platform::ScopeExit<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}>::~ScopeExit((uint64_t *)&v67);
      }
      char v49 = 1;
      uint64_t v19 = WPOSLogDatabase();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Skipped database update (states match)", v61, 2u);
      }
      if (*(char *)(v2 + 39) < 0) {
        std::string::__init_copy_ctor_external(&v48, *(const std::string::value_type **)(v2 + 16), *(void *)(v2 + 24));
      }
      else {
        std::string v48 = *(std::string *)(v2 + 16);
      }
      Platform::FileOutputStream::FileOutputStream((uint64_t)v61, (__n128 *)&v48);
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v48.__r_.__value_.__l.__data_);
      }
      *(void *)v59 = Platform::FileOutputStream::open((Platform::FileOutputStream *)v61, "r+");
      *(void *)&v59[8] = v31;
      if (*(_DWORD *)v59)
      {
        v32 = (id)WPOSLogDatabase();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          std::error_code::message(&v66, (const std::error_code *)v59);
          Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
        }
      }
      else
      {
        *(void *)v59 = Platform::FileOutputStream::seek((Platform::FileOutputStream *)v61, 0);
        *(void *)&v59[8] = v33;
        if (*(_DWORD *)v59)
        {
          v32 = (id)WPOSLogDatabase();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            std::error_code::message(&v66, (const std::error_code *)v59);
            Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
          }
        }
        else
        {
          *(void *)v59 = Platform::FileOutputStream::writeBytes((Platform::FileOutputStream *)v61, (const unsigned __int8 *)a1 + 8, 0x48uLL);
          *(void *)&v59[8] = v34;
          if (!*(_DWORD *)v59)
          {
LABEL_88:
            Platform::FileOutputStream::~FileOutputStream((Platform::FileOutputStream *)v61);
            return Platform::ScopeExit<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}>::~ScopeExit((uint64_t *)&v67);
          }
          v32 = (id)WPOSLogDatabase();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            std::error_code::message(&v66, (const std::error_code *)v59);
            Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
          }
        }
      }

      goto LABEL_88;
    }
  }
  Backend::DatabaseHandle::loadRules((dispatch_queue_t *)v2, &v47);
  if (Backend::DatabaseUpdate::apply(a1 + 1, &v47))
  {
    uint64_t v4 = (const std::__fs::filesystem::path *)(v2 + 40);
    if (*(char *)(v2 + 63) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v2 + 40), *(void *)(v2 + 48));
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)&v4->__pn_.__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = *(void *)(v2 + 56);
    }
    Platform::FileOutputStream::FileOutputStream((uint64_t)&v66, (__n128 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    *(void *)v60.count = Platform::FileOutputStream::open((Platform::FileOutputStream *)&v66, "w+");
    *(void *)v60.hash = v10;
    if (v60.count[0])
    {
      id v11 = (id)WPOSLogDatabase();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        std::error_code::message((std::string *)v61, (const std::error_code *)&v60);
        Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
      }
LABEL_34:

      goto LABEL_35;
    }
    *(_WORD *)v61 = *((_WORD *)a1 + 4);
    *(_OWORD *)&v61[2] = *(_OWORD *)((char *)a1 + 10);
    *(_OWORD *)&v61[18] = *(_OWORD *)((char *)a1 + 26);
    *(void *)v62 = *(uint64_t *)((char *)a1 + 42);
    *(void *)&v62[6] = a1[6];
    uint64_t v63 = a1[7];
    uint64_t v64 = 0;
    uint64_t v65 = 0;
    *(void *)v60.count = Platform::FileOutputStream::writeBytes((Platform::FileOutputStream *)&v66, v61, 0x48uLL);
    *(void *)v60.hash = v12;
    if (v60.count[0])
    {
      id v11 = (id)WPOSLogDatabase();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        std::error_code::message((std::string *)v59, (const std::error_code *)&v60);
        Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
      }
      goto LABEL_34;
    }
    CC_SHA256_Init(&v60);
    std::vector<std::string>::pointer begin = v47.__begin_;
    std::vector<std::string>::pointer end = v47.__end_;
    if (v47.__begin_ != v47.__end_)
    {
      char v22 = 1;
      while (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
      {
        size_t size = begin->__r_.__value_.__l.__size_;
        if (size >= 0xFFFFFFFF)
        {
          v41 = WPOSLogDatabase();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(size, v41);
          }
LABEL_35:
          int v13 = 1;
          goto LABEL_36;
        }
        uint64_t v24 = (const unsigned __int8 *)begin->__r_.__value_.__r.__words[0];
        if ((v22 & 1) == 0) {
          goto LABEL_55;
        }
LABEL_57:
        *(void *)&v53.__val_ = Platform::FileOutputStream::writeBytes((Platform::FileOutputStream *)&v66, v24, size);
        v53.__cat_ = v26;
        if (v53.__val_)
        {
          long long v40 = (id)WPOSLogDatabase();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            std::error_code::message((std::string *)v59, &v53);
            Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(v59, (uint8_t *)&v50, size, v40);
          }

          goto LABEL_35;
        }
        CC_SHA256_Update(&v60, v24, size);
        char v22 = 0;
        if (++begin == end) {
          goto LABEL_59;
        }
      }
      size_t size = HIBYTE(begin->__r_.__value_.__r.__words[2]);
      uint64_t v24 = (const unsigned __int8 *)begin;
      if (v22) {
        goto LABEL_57;
      }
LABEL_55:
      *(void *)&v50.__val_ = Platform::FileOutputStream::writeBytes((Platform::FileOutputStream *)&v66, "\n", 1uLL);
      v50.__cat_ = v25;
      if (v50.__val_)
      {
        id v11 = (id)WPOSLogDatabase();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          std::error_code::message((std::string *)v59, &v50);
          Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
        }
        goto LABEL_34;
      }
      CC_SHA256_Update(&v60, "\n", 1u);
      goto LABEL_57;
    }
LABEL_59:
    *(void *)&v50.__val_ = Platform::FileOutputStream::close((Platform::FileOutputStream *)&v66);
    v50.__cat_ = v27;
    if (v50.__val_)
    {
      id v11 = (id)WPOSLogDatabase();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        std::error_code::message((std::string *)v59, &v50);
        Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
      }
      goto LABEL_34;
    }
    memset(v59, 0, sizeof(v59));
    CC_SHA256_Final(v59, &v60);
    if (*(void *)v59 != *(void *)&v61[2]
      || *(void *)&v59[8] != *(void *)&v61[10]
      || *(void *)&v59[16] != *(void *)&v61[18]
      || *(void *)&v59[24] != *(void *)&v61[26])
    {
      v39 = (id)WPOSLogDatabase();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        Platform::description();
        int v42 = v51;
        v43 = *(std::error_code **)&v50.__val_;
        Platform::description();
        v44 = &v50;
        if (v42 < 0) {
          v44 = v43;
        }
        if (v54 >= 0) {
          v45 = &v53;
        }
        else {
          v45 = *(std::error_code **)&v53.__val_;
        }
        *(_DWORD *)buf = 136315394;
        v56 = v44;
        __int16 v57 = 2080;
        v58 = v45;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to save database: SHA256 did not match expected result (%s vs. %s)", buf, 0x16u);
        if (v54 < 0) {
          operator delete(*(void **)&v53.__val_);
        }
        if (v51 < 0) {
          operator delete(*(void **)&v50.__val_);
        }
      }

      uint64_t v52 = 0;
      Backend::DatabaseHandle::unlink((NSObject **)v2, (uint64_t)&v50);
      std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](&v50);
      goto LABEL_35;
    }
    int v13 = 0;
LABEL_36:
    Platform::FileOutputStream::~FileOutputStream((Platform::FileOutputStream *)&v66);
    v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](v14);
    if (!v13)
    {
      if (*(char *)(v2 + 63) < 0) {
        uint64_t v4 = (const std::__fs::filesystem::path *)v4->__pn_.__r_.__value_.__r.__words[0];
      }
      id v16 = (const std::__fs::filesystem::path *)(v2 + 16);
      int v17 = (const std::__fs::filesystem::path *)(v2 + 16);
      if (*(char *)(v2 + 39) < 0) {
        int v17 = (const std::__fs::filesystem::path *)v16->__pn_.__r_.__value_.__r.__words[0];
      }
      rename(v4, v17, v15);
      if (v18 == -1)
      {
        v28 = (id)WPOSLogDatabase();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          if (*(char *)(v2 + 39) < 0) {
            id v16 = (const std::__fs::filesystem::path *)v16->__pn_.__r_.__value_.__r.__words[0];
          }
          int v29 = __error();
          Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()((uint64_t)v16, (uint64_t)v29, (uint64_t)&v66);
        }
      }
      else
      {
        if (Backend::DatabaseHandle::mapSharedMemory((Backend::DatabaseHandle *)v2))
        {
          char v49 = 1;
          return Platform::ScopeExit<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}>::~ScopeExit((uint64_t *)&v67);
        }
        v28 = (id)WPOSLogDatabase();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          if (*(char *)(v2 + 39) < 0) {
            id v16 = (const std::__fs::filesystem::path *)v16->__pn_.__r_.__value_.__r.__words[0];
          }
          v30 = __error();
          Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()((uint64_t)v16, (uint64_t)v30, (uint64_t)&v66);
        }
      }

      *(void *)&v60.hash[4] = 0;
      Backend::DatabaseHandle::unlink((NSObject **)v2, (uint64_t)&v60);
      std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](&v60);
    }
  }
  else
  {
    uint64_t v5 = (id)WPOSLogDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      Backend::DatabaseUpdate::description(&v60);
      Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()();
    }

    v66.__r_.__value_.__r.__words[0] = (std::string::size_type)&v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
  }
  return Platform::ScopeExit<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}>::~ScopeExit((uint64_t *)&v67);
}

void sub_100008E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char *a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  Platform::FileOutputStream::~FileOutputStream((Platform::FileOutputStream *)(v59 - 208));
  a45 = &a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&a45);
  Platform::ScopeExit<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}>::~ScopeExit((uint64_t *)(v59 - 160));
  _Unwind_Resume(a1);
}

void Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0)::{lambda(void const*)#1}::__invoke(uint64_t a1)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100]((void *)(a1 + 160));
  long long v3 = (void **)(a1 + 136);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v2 = *(void **)(a1 + 112);
  if (v2)
  {
    *(void *)(a1 + 120) = v2;
    operator delete(v2);
  }
}

uint64_t *Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  return Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()((uint64_t *)(a1 + 32));
}

uint64_t *Platform::ScopeExit<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}>::~ScopeExit(uint64_t *a1)
{
  if (a1[5])
  {
    uint64_t v2 = *a1;
    char v8 = *(unsigned char *)a1[1];
    std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)v9, (uint64_t)(a1 + 2));
    char v11 = v8;
    if (v10)
    {
      if (v10 == v9)
      {
        int v13 = v12;
        (*(void (**)(void *, void *))(v9[0] + 24))(v9, v12);
      }
      else
      {
        int v13 = v10;
        uint64_t v10 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    long long v3 = (char *)malloc_type_malloc(0x48uLL, 0x10E00406C4F201FuLL);
    uint64_t v4 = v3;
    *(void *)long long v3 = _NSConcreteMallocBlock;
    *((void *)v3 + 1) = 50331650;
    *((void *)v3 + 2) = Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1})::{lambda(void *)#1}::__invoke;
    *((void *)v3 + 3) = &Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1})::descriptor;
    v3[32] = v11;
    if (v13)
    {
      if (v13 == v12)
      {
        *((void *)v3 + 8) = v3 + 40;
        (*(void (**)(void *))(v12[0] + 24))(v12);
      }
      else
      {
        *((void *)v3 + 8) = v13;
        int v13 = 0;
      }
    }
    else
    {
      *((void *)v3 + 8) = 0;
    }
    id v5 = objc_retainBlock(v4);

    std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v12);
    id v6 = objc_retainBlock(v5);
    dispatch_async(*(dispatch_queue_t *)(v2 + 8), v6);

    std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v9);
  }
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](a1 + 2);
  return a1;
}

void sub_1000092BC(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v2);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v1);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v3);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  uint64_t v3;

  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = v3;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1})::{lambda(void const*)#1}::__invoke(uint64_t a1)
{
  return std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100]((void *)(a1 + 40));
}

void *Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(void)::{lambda(void)#1}::operator() const(void)::{lambda(void)#1})::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  return std::function<void ()(BOOL)>::operator()(a1 + 40, *(unsigned char *)(a1 + 32));
}

void *std::function<void ()(BOOL)>::operator()(uint64_t a1, char a2)
{
  char v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (void *)(*(uint64_t (**)(uint64_t, char *))(*(void *)v2 + 48))(v2, &v4);
  }
  std::__throw_bad_function_call[abi:nn180100]();
  return std::__throw_bad_function_call[abi:nn180100]();
}

void *std::__throw_bad_function_call[abi:nn180100]()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v0);
}

void *std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

BOOL ___ZZN7Backend14DatabaseHandle10initializeEvENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  return Backend::DatabaseHandle::mapSharedMemory(*(Backend::DatabaseHandle **)(a1 + 32));
}

uint64_t __copy_helper_block_ea8_32c50_ZTSKZN7Backend14DatabaseHandle10initializeEvE3__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void ___ZZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (const char *)(v2 + 16);
  if (*(char *)(v2 + 39) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  int v4 = unlink(v3);
  BOOL v5 = v4 == -1;
  if (v4 == -1)
  {
    id v6 = (id)WPOSLogDatabase();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unable to delete database: %{errno}i", buf, 8u);
    }
  }
  char v8 = (const char *)(v2 + 40);
  if (*(char *)(v2 + 63) < 0) {
    char v8 = *(const char **)v8;
  }
  if (unlink(v8) == -1)
  {
    int v9 = (id)WPOSLogDatabase();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Unable to delete temporary database: %{errno}i", buf, 8u);
    }
  }
  Backend::DatabaseHandle::unmapSharedMemory((Backend::DatabaseHandle *)v2);
  if (*(void *)(a1 + 64))
  {
    std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)v13, a1 + 40);
    char v11 = *(NSObject **)(v2 + 8);
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v15 = 3321888768;
    id v16 = ___ZZZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke;
    int v17 = &__block_descriptor_72_ea8_32c81_ZTSKZZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEENK3__0clEvEUlvE__e5_v8__0l;
    BOOL v18 = v5;
    std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100]((uint64_t)v19, (uint64_t)v13);
    uint64_t v12 = objc_retainBlock(buf);
    std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v19);
    dispatch_async(v11, v12);

    std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v13);
  }
}

void sub_100009848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c68_ZTSKZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEE3__0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

void *__destroy_helper_block_ea8_32c68_ZTSKZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEE3__0(uint64_t a1)
{
  return std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100]((void *)(a1 + 40));
}

void *___ZZZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEENK3__0clEvENKUlvE_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  return std::function<void ()(BOOL)>::operator()(a1 + 40, *(unsigned char *)(a1 + 32) == 0);
}

uint64_t __copy_helper_block_ea8_32c81_ZTSKZZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEENK3__0clEvEUlvE_(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  return std::__function::__value_func<void ()(BOOL)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

void *__destroy_helper_block_ea8_32c81_ZTSKZZN7Backend14DatabaseHandle6unlinkEONSt3__18functionIFvbEEEENK3__0clEvEUlvE_(uint64_t a1)
{
  return std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100]((void *)(a1 + 40));
}

uint64_t std::__function::__value_func<void ()(std::vector<std::string> &&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = v3;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  uint64_t v3;

  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void ___ZZNK7Backend14DatabaseHandle9loadRulesEONSt3__18functionIFvONS1_6vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS7_IS9_EEEEEEEENK3__0cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(dispatch_queue_t **)(a1 + 32);
  Backend::DatabaseHandle::loadRules(v2, &v9);
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::__value_func[abi:nn180100]((uint64_t)v11, a1 + 40);
  long long v13 = v9;
  uint64_t v14 = v10;
  long long v9 = 0uLL;
  uint64_t v10 = 0;
  if (v12)
  {
    if (v12 == v11)
    {
      id v16 = v15;
      (*(void (**)(void *, void *))(v11[0] + 24))(v11, v15);
    }
    else
    {
      id v16 = v12;
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v3 = (char *)malloc_type_malloc(0x58uLL, 0x10E00404BA5BF57uLL);
  int v4 = v3;
  *(void *)uint64_t v3 = _NSConcreteMallocBlock;
  *((void *)v3 + 1) = 50331650;
  *((void *)v3 + 2) = Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1})::{lambda(void *)#1}::__invoke;
  *((void *)v3 + 3) = &Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1})::descriptor;
  *((_OWORD *)v3 + 2) = v13;
  BOOL v5 = v16;
  *((void *)v3 + 6) = v14;
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  if (v5)
  {
    if (v5 == v15)
    {
      *((void *)v3 + 10) = v3 + 56;
      (*(void (**)(void *))(v15[0] + 24))(v15);
    }
    else
    {
      *((void *)v3 + 10) = v5;
      id v16 = 0;
    }
  }
  else
  {
    *((void *)v3 + 10) = 0;
  }
  id v6 = objc_retainBlock(v4);

  std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v15);
  char v8 = (void **)&v13;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v8);
  id v7 = objc_retainBlock(v6);
  dispatch_async(v2[1], v7);

  std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v11);
  *(void *)&long long v13 = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v13);
}

void sub_100009B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v20);
  a10 = (void **)&a19;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&a10);
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v19);
  a10 = (void **)&a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c157_ZTSKZNK7Backend14DatabaseHandle9loadRulesEONSt3__18functionIFvONS1_6vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS7_IS9_EEEEEEEE3__0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return std::__function::__value_func<void ()(std::vector<std::string> &&)>::__value_func[abi:nn180100](a1 + 40, a2 + 40);
}

void *__destroy_helper_block_ea8_32c157_ZTSKZNK7Backend14DatabaseHandle9loadRulesEONSt3__18functionIFvONS1_6vectorINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS7_IS9_EEEEEEEE3__0(uint64_t a1)
{
  return std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100]((void *)(a1 + 40));
}

void Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1})::{lambda(void const*)#1}::__invoke(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100]((void *)(a1 + 56));
  uint64_t v2 = v1;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v2);
}

uint64_t Platform::BlockPtr<void ()(void)>::fromCallable<Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1}>(Backend::DatabaseHandle::loadRules(std::function<void ()(std::vector<std::string> &&)> &&)::$_0::operator() const(void)::{lambda(void)#1})::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
    return v2();
  }
  else
  {
    int v4 = std::__throw_bad_function_call[abi:nn180100]();
    return std::__function::__value_func<void ()(std::vector<std::string> &&)>::__value_func[abi:nn180100]((uint64_t)v4, v5);
  }
}

void std::__function::__func<Backend::DatabaseHandle::loadRules(void)::$_0,std::allocator<Backend::DatabaseHandle::loadRules(void)::$_0>,void ()(Platform::ArrayView<unsigned char> &&)>::~__func()
{
}

void *std::__function::__func<Backend::DatabaseHandle::loadRules(void)::$_0,std::allocator<Backend::DatabaseHandle::loadRules(void)::$_0>,void ()(Platform::ArrayView<unsigned char> &&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_100018778;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<Backend::DatabaseHandle::loadRules(void)::$_0,std::allocator<Backend::DatabaseHandle::loadRules(void)::$_0>,void ()(Platform::ArrayView<unsigned char> &&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_100018778;
  a2[1] = v2;
  return result;
}

void std::__function::__func<Backend::DatabaseHandle::loadRules(void)::$_0,std::allocator<Backend::DatabaseHandle::loadRules(void)::$_0>,void ()(Platform::ArrayView<unsigned char> &&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  std::string::basic_string[abi:nn180100](__p, *(void **)a2, *(void *)(a2 + 8));
  unint64_t v3 = *(void *)(v2 + 8);
  unint64_t v4 = *(void *)(v2 + 16);
  if (v3 >= v4)
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v3 - *(void *)v2) >> 3);
    unint64_t v7 = v6 + 1;
    if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *(void *)v2) >> 3);
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v9 = v7;
    }
    v23.__end_cap_.__value_ = (std::allocator<std::string> *)(v2 + 16);
    if (v9) {
      uint64_t v10 = (char *)std::allocator<std::string>::allocate_at_least[abi:nn180100](v2 + 16, v9);
    }
    else {
      uint64_t v10 = 0;
    }
    char v11 = &v10[24 * v6];
    long long v12 = *(_OWORD *)__p;
    *((void *)v11 + 2) = v22;
    *(_OWORD *)char v11 = v12;
    __p[1] = 0;
    uint64_t v22 = 0;
    __p[0] = 0;
    uint64_t v14 = *(std::string **)v2;
    long long v13 = *(std::string **)(v2 + 8);
    if (v13 == *(std::string **)v2)
    {
      int v17 = *(std::string **)(v2 + 8);
      uint64_t v15 = &v10[24 * v6];
    }
    else
    {
      uint64_t v15 = &v10[24 * v6];
      do
      {
        long long v16 = *(_OWORD *)&v13[-1].__r_.__value_.__l.__data_;
        *((void *)v15 - 1) = *((void *)&v13[-1].__r_.__value_.__l + 2);
        *(_OWORD *)(v15 - 24) = v16;
        v15 -= 24;
        v13[-1].__r_.__value_.__l.__size_ = 0;
        v13[-1].__r_.__value_.__r.__words[2] = 0;
        v13[-1].__r_.__value_.__r.__words[0] = 0;
        --v13;
      }
      while (v13 != v14);
      int v17 = *(std::string **)v2;
      long long v13 = *(std::string **)(v2 + 8);
    }
    BOOL v18 = v11 + 24;
    *(void *)uint64_t v2 = v15;
    v23.__first_ = v17;
    v23.__begin_ = v17;
    *(void *)(v2 + 8) = v11 + 24;
    v23.__end_ = v13;
    uint64_t v19 = *(std::string **)(v2 + 16);
    *(void *)(v2 + 16) = &v10[24 * v9];
    v23.__end_cap_.__value_ = v19;
    std::__split_buffer<std::string>::~__split_buffer(&v23);
    int v20 = SHIBYTE(v22);
    *(void *)(v2 + 8) = v18;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v5 = *(_OWORD *)__p;
    *(void *)(v3 + 16) = v22;
    *(_OWORD *)unint64_t v3 = v5;
    *(void *)(v2 + 8) = v3 + 24;
  }
}

void sub_100009F1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::allocator<std::string>::allocate_at_least[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(24 * a2);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:nn180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      long long v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        long long v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void *std::string::basic_string[abi:nn180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void *std::__function::__value_func<void ()(Platform::ArrayView<unsigned char> &&)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X1>, uint64_t a2@<X8>, float a3@<S0>)
{
  *(float *)a1 = a3;
  *(void *)(a1 + 4) = a2;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + 14) = v4;
  return result;
}

uint64_t Backend::DatabaseUpdate::DatabaseUpdate(uint64_t a1, std::vector<std::string> *this)
{
  *(_WORD *)a1 = this->__begin_;
  long long v3 = *(_OWORD *)((char *)&this->__begin_ + 2);
  *(_OWORD *)(a1 + 18) = *(_OWORD *)((char *)&this->__end_cap_.__value_ + 2);
  *(_OWORD *)(a1 + 2) = v3;
  uint64_t v4 = *(uint64_t *)((char *)&this[1].__end_ + 2);
  *(void *)(a1 + 40) = this[1].__end_cap_.__value_;
  *(void *)(a1 + 34) = v4;
  *(void *)(a1 + 48) = this[2].__begin_;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)&this->__end_cap_.__value_ = 0u;
  *(_OWORD *)&this[1].__end_ = 0u;
  *(_OWORD *)&this->__begin_ = 0u;
  this[2].__begin_ = 0;
  *(std::vector<std::string> *)(a1 + 72) = this[3];
  this[3].__end_ = 0;
  this[3].__end_cap_.__value_ = 0;
  this[3].__begin_ = 0;
  uint64_t v5 = this + 4;
  *(std::vector<std::string> *)(a1 + 96) = this[4];
  this[4].__begin_ = 0;
  this[4].__end_ = 0;
  this[4].__end_cap_.__value_ = 0;
  std::vector<std::string>::__vdeallocate(this + 4);
  v5->__begin_ = 0;
  v5->__end_ = 0;
  v5->__end_cap_.__value_ = 0;
  memset(v7, 0, sizeof(v7));
  size_t v8 = (void **)v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v8);
  return a1;
}

uint64_t Backend::DatabaseUpdate::operator=(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 2);
  *(_OWORD *)(a1 + 18) = *(_OWORD *)(a2 + 18);
  *(_OWORD *)(a1 + 2) = v4;
  uint64_t v5 = *(void *)(a2 + 34);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 34) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  size_t v8 = *(void **)(a1 + 72);
  unint64_t v6 = (char *)(a1 + 72);
  size_t v7 = v8;
  *(void *)unint64_t v6 = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  if (a1 != a2) {
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>(v6, *(char **)(a2 + 72), *(void *)(a2 + 80), (uint64_t)(*(void *)(a2 + 80) - *(void *)(a2 + 72)) >> 2);
  }
  if (v7) {
    operator delete(v7);
  }
  long long v10 = *(_OWORD *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 112);
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 96) = 0;
  if (a1 != a2) {
    std::vector<std::string>::__assign_with_size[abi:nn180100]<std::string*,std::string*>((std::vector<std::string> *)(a1 + 96), *(std::string **)(a2 + 96), *(long long **)(a2 + 104), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 104) - *(void *)(a2 + 96)) >> 3));
  }
  long long v12 = (void **)&v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v12);
  return a1;
}

void sub_10000A34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&a12);
  _Unwind_Resume(a1);
}

void Backend::DatabaseUpdate::appendIndexToRemove(Backend::DatabaseUpdate *this, int a2)
{
  long long v4 = (char *)this + 88;
  unint64_t v5 = *((void *)this + 11);
  unint64_t v6 = (char *)*((void *)this + 10);
  if ((unint64_t)v6 >= v5)
  {
    size_t v8 = (char *)*((void *)this + 9);
    uint64_t v9 = (v6 - v8) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      abort();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      long long v13 = (char *)std::allocator<unsigned int>::allocate_at_least[abi:nn180100]((uint64_t)v4, v12);
      size_t v8 = (char *)*((void *)this + 9);
      unint64_t v6 = (char *)*((void *)this + 10);
    }
    else
    {
      long long v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    uint64_t v15 = &v13[4 * v12];
    *(_DWORD *)uint64_t v14 = a2;
    size_t v7 = v14 + 4;
    while (v6 != v8)
    {
      int v16 = *((_DWORD *)v6 - 1);
      v6 -= 4;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    *((void *)this + 9) = v14;
    *((void *)this + 10) = v7;
    *((void *)this + 11) = v15;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v6 = a2;
    size_t v7 = v6 + 4;
  }
  *((void *)this + 10) = v7;
}

void Backend::DatabaseUpdate::appendNewRule(void *a1, long long *a2)
{
  unint64_t v6 = a1[14];
  long long v4 = (std::allocator<std::string> *)(a1 + 14);
  unint64_t v5 = v6;
  unint64_t v7 = *((void *)v4 - 1);
  if (v7 >= v6)
  {
    uint64_t v10 = a1[12];
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v10) >> 3);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - v10) >> 3);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x555555555555555) {
      unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v14 = v12;
    }
    v24.__end_cap_.__value_ = v4;
    if (v14) {
      uint64_t v15 = (char *)std::allocator<std::string>::allocate_at_least[abi:nn180100]((uint64_t)v4, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    int v16 = &v15[24 * v11];
    long long v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)int v16 = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    uint64_t v19 = a1[12];
    unint64_t v18 = a1[13];
    if (v18 == v19)
    {
      int64x2_t v22 = vdupq_n_s64(v18);
      int v20 = &v15[24 * v11];
    }
    else
    {
      int v20 = &v15[24 * v11];
      do
      {
        long long v21 = *(_OWORD *)(v18 - 24);
        *((void *)v20 - 1) = *(void *)(v18 - 8);
        *(_OWORD *)(v20 - 24) = v21;
        v20 -= 24;
        *(void *)(v18 - 16) = 0;
        *(void *)(v18 - 8) = 0;
        *(void *)(v18 - 24) = 0;
        v18 -= 24;
      }
      while (v18 != v19);
      int64x2_t v22 = *((int64x2_t *)a1 + 6);
    }
    uint64_t v9 = v16 + 24;
    a1[12] = v20;
    a1[13] = v16 + 24;
    *(int64x2_t *)&v24.__begin_ = v22;
    std::__split_buffer<std::string> v23 = (std::string *)a1[14];
    a1[14] = &v15[24 * v14];
    v24.__end_cap_.__value_ = v23;
    v24.__first_ = (std::__split_buffer<std::string>::pointer)v22.i64[0];
    std::__split_buffer<std::string>::~__split_buffer(&v24);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    uint64_t v9 = (char *)(v7 + 24);
  }
  a1[13] = v9;
}

uint64_t Backend::DatabaseUpdate::apply(void *a1, std::vector<std::string> *this)
{
  std::vector<std::string>::pointer begin = this->__begin_;
  std::vector<std::string>::pointer end = this->__end_;
  unint64_t v6 = (unsigned int *)a1[9];
  unint64_t v7 = (unsigned int *)a1[10];
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = 0;
  if (v6 == v7)
  {
LABEL_8:
    if (v6) {
      operator delete(v6);
    }
    std::vector<std::string>::pointer v13 = this->__begin_;
    std::vector<std::string>::pointer v12 = this->__end_;
    if (this->__begin_ == v12)
    {
      std::vector<std::string>::pointer v12 = this->__begin_;
    }
    else
    {
      std::vector<std::string>::pointer v14 = v13 + 1;
      while (1)
      {
        std::string::size_type size = HIBYTE(v14[-1].__r_.__value_.__r.__words[2]);
        if ((size & 0x80u) != 0) {
          std::string::size_type size = v14[-1].__r_.__value_.__l.__size_;
        }
        if (!size) {
          break;
        }
        if (v14++ == v12)
        {
          std::vector<std::string>::pointer v13 = this->__end_;
          goto LABEL_32;
        }
      }
      std::vector<std::string>::pointer v13 = v14 - 1;
      if (&v14[-1] != v12 && v14 != v12)
      {
        do
        {
          std::string::size_type v18 = HIBYTE(v14->__r_.__value_.__r.__words[2]);
          if ((v18 & 0x80u) != 0) {
            std::string::size_type v18 = v14->__r_.__value_.__l.__size_;
          }
          if (v18)
          {
            if (SHIBYTE(v13->__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v13->__r_.__value_.__l.__data_);
            }
            long long v19 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
            v13->__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v19;
            ++v13;
            *((unsigned char *)&v14->__r_.__value_.__s + 23) = 0;
            v14->__r_.__value_.__s.__data_[0] = 0;
          }
          ++v14;
        }
        while (v14 != v12);
        std::vector<std::string>::pointer v12 = this->__end_;
      }
    }
LABEL_32:
    v20.__i_ = v13;
    v21.__i_ = v12;
    std::vector<std::string>::erase(this, v20, v21);
    uint64_t v23 = a1[12];
    int64x2_t v22 = a1 + 12;
    uint64_t v31 = v23;
    long long v32 = *(_OWORD *)(v22 + 1);
    uint64_t v29 = v32;
    *int64x2_t v22 = 0;
    v22[1] = 0;
    v22[2] = 0;
    std::vector<std::string>::__vdeallocate((std::vector<std::string> *)v22);
    *int64x2_t v22 = 0;
    v22[1] = 0;
    v22[2] = 0;
    memset(v30, 0, sizeof(v30));
    uint64_t v33 = v30;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v33);
    std::vector<std::string>::reserve(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3)- 0x5555555555555555 * ((v29 - v23) >> 3));
    std::vector<std::string>::__insert_with_size[abi:nn180100]<std::move_iterator<std::__wrap_iter<std::string*>>,std::move_iterator<std::__wrap_iter<std::string*>>>(this, this->__end_, v31, (long long *)v32, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v32 - v31) >> 3));
    v30[0] = (void **)&v31;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](v30);
    std::vector<std::string>::pointer v24 = this->__begin_;
    uint64_t v25 = this->__end_;
    unint64_t v26 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v25 - (char *)this->__begin_) >> 3));
    if (v25 == this->__begin_) {
      uint64_t v27 = 0;
    }
    else {
      uint64_t v27 = v26;
    }
    uint64_t v17 = 1;
    std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *,false>((uint64_t)v24, (char *)v25, (uint64_t)&v31, v27, 1);
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3);
    uint64_t v9 = v6;
    while (1)
    {
      unint64_t v10 = *v9;
      if (v8 <= v10) {
        break;
      }
      unint64_t v11 = &this->__begin_[v10];
      if (SHIBYTE(v11->__r_.__value_.__r.__words[2]) < 0)
      {
        v11->__r_.__value_.__l.__size_ = 0;
        unint64_t v11 = (std::string *)v11->__r_.__value_.__r.__words[0];
      }
      else
      {
        *((unsigned char *)&v11->__r_.__value_.__s + 23) = 0;
      }
      v11->__r_.__value_.__s.__data_[0] = 0;
      if (++v9 == v7) {
        goto LABEL_8;
      }
    }
    if (v6) {
      operator delete(v6);
    }
    return 0;
  }
  return v17;
}

void sub_10000A82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, char a15)
{
  a12 = (void **)&a15;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&a12);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::reserve(std::vector<std::string> *this, std::vector<std::string>::size_type __n)
{
  xpc_object_t value = this->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::string> *)&this->__end_cap_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3) < __n)
  {
    if (__n >= 0xAAAAAAAAAAAAAABLL) {
      abort();
    }
    int64_t v5 = this->__end_ - this->__begin_;
    v14.__end_cap_.__value_ = p_end_cap;
    unint64_t v6 = (char *)std::allocator<std::string>::allocate_at_least[abi:nn180100]((uint64_t)p_end_cap, __n);
    std::vector<std::string>::pointer begin = this->__begin_;
    std::vector<std::string>::pointer end = this->__end_;
    if (end == this->__begin_)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)end);
      unint64_t v10 = (std::string *)&v6[24 * v5];
    }
    else
    {
      unint64_t v10 = (std::string *)&v6[24 * v5];
      do
      {
        long long v11 = *(_OWORD *)&end[-1].__r_.__value_.__l.__data_;
        v10[-1].__r_.__value_.__r.__words[2] = end[-1].__r_.__value_.__r.__words[2];
        *(_OWORD *)&v10[-1].__r_.__value_.__l.__data_ = v11;
        --v10;
        end[-1].__r_.__value_.__l.__size_ = 0;
        end[-1].__r_.__value_.__r.__words[2] = 0;
        end[-1].__r_.__value_.__r.__words[0] = 0;
        --end;
      }
      while (end != begin);
      int64x2_t v12 = *(int64x2_t *)&this->__begin_;
    }
    this->__begin_ = v10;
    this->__end_ = (std::vector<std::string>::pointer)&v6[24 * v5];
    *(int64x2_t *)&v14.__begin_ = v12;
    std::vector<std::string>::pointer v13 = this->__end_cap_.__value_;
    this->__end_cap_.__value_ = (std::string *)&v6[24 * v7];
    v14.__end_cap_.__value_ = v13;
    v14.__first_ = (std::__split_buffer<std::string>::pointer)v12.i64[0];
    std::__split_buffer<std::string>::~__split_buffer(&v14);
  }
}

uint64_t Backend::DatabaseUpdate::description@<X0>(void *a1@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)&v8);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v8, (uint64_t)"Update(", 7);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v8, (uint64_t)" removed; ", 10);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v8, (uint64_t)" added; new state := ", 21);
  Platform::dataToBase64String();
  if ((v7 & 0x80u) == 0) {
    long long v3 = __p;
  }
  else {
    long long v3 = (void **)__p[0];
  }
  if ((v7 & 0x80u) == 0) {
    uint64_t v4 = v7;
  }
  else {
    uint64_t v4 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v8, (uint64_t)v3, v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v8, (uint64_t)")", 1);
  std::stringbuf::str[abi:nn180100]<std::allocator<char>>((uint64_t)v9, a1);
  if (v10 < 0) {
    operator delete((void *)v9[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return std::ios::~ios();
}

void sub_10000AB4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:nn180100](uint64_t a1)
{
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v2;
  uint64_t v4 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v4, (void *)(a1 + 8));
  v4[1].__vftable = 0;
  v4[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_10000ACEC(_Unwind_Exception *a1)
{
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
  return a1;
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

char *std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unsigned __int8 v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unsigned __int8 v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      abort();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<unsigned int>::__vallocate[abi:nn180100](v7, v11);
    std::vector<std::string>::pointer v13 = (char *)v7[1];
    int64x2_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      std::string::size_type v18 = v9;
      long long v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  int64x2_t v12 = (void **)(result + 8);
  std::__split_buffer<std::string> v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  int v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    std::string::size_type v18 = v9;
    long long v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *int64x2_t v12 = &v9[v17];
  return result;
}

char *std::vector<unsigned int>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    abort();
  }
  uint64_t result = (char *)std::allocator<unsigned int>::allocate_at_least[abi:nn180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::allocator<unsigned int>::allocate_at_least[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(4 * a2);
}

void std::vector<std::string>::__assign_with_size[abi:nn180100]<std::string*,std::string*>(std::vector<std::string> *this, std::string *__str, long long *a3, unint64_t a4)
{
  int v8 = this + 16;
  std::vector<std::string>::pointer begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_cap_.__value_ - (char *)this->__begin_) >> 3) < a4)
  {
    std::vector<std::string>::__vdeallocate(this);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v10 = 0x5555555555555556 * (((char *)this->__end_cap_.__value_ - (char *)this->__begin_) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_cap_.__value_ - (char *)this->__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<std::string>::__vallocate[abi:nn180100](this, v11);
    int64x2_t v12 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(v8, (long long *)__str, a3, this->__end_);
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)begin) >> 3) < a4)
  {
    std::vector<std::string>::pointer v13 = (std::string *)((char *)__str + 8 * (((char *)this->__end_ - (char *)begin) >> 3));
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::string *,std::string *,std::string *,0>(__str, v13, begin);
    int64x2_t v12 = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(v8, (long long *)v13, a3, this->__end_);
LABEL_11:
    this->__end_ = v12;
    return;
  }
  std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::string *,std::string *,std::string *,0>(__str, (std::string *)a3, begin);
  unint64_t v15 = v14;
  std::vector<std::string>::pointer end = this->__end_;
  if (end != v14)
  {
    do
    {
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0) {
        operator delete(end[-1].__r_.__value_.__l.__data_);
      }
      --end;
    }
    while (end != v15);
  }
  this->__end_ = v15;
}

void sub_10000B138(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_10000B140(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    abort();
  }
  uint64_t result = (char *)std::allocator<std::string>::allocate_at_least[abi:nn180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(int a1, long long *a2, long long *a3, std::string *this)
{
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)v6, *((void *)v6 + 1));
      }
      else
      {
        long long v7 = *v6;
        this->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
      }
      unint64_t v6 = (long long *)((char *)v6 + 24);
      ++this;
    }
    while (v6 != a3);
  }
  return this;
}

std::string *std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::string *,std::string *,std::string *,0>(std::string *__str, std::string *a2, std::string *this)
{
  uint64_t v4 = __str;
  if (__str != a2)
  {
    do
      std::string::operator=(this++, v4++);
    while (v4 != a2);
    return a2;
  }
  return (std::string *)v4;
}

std::string *std::vector<std::string>::__insert_with_size[abi:nn180100]<std::move_iterator<std::__wrap_iter<std::string*>>,std::move_iterator<std::__wrap_iter<std::string*>>>(std::vector<std::string> *this, std::vector<std::string>::pointer __from_s, uint64_t a3, long long *a4, uint64_t a5)
{
  int64_t v5 = __from_s;
  if (a5 < 1) {
    return v5;
  }
  xpc_object_t value = this->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::string> *)&this->__end_cap_;
  unint64_t v10 = value;
  int64x2_t v12 = (std::string *)*((void *)p_end_cap - 1);
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v12) >> 3)) < a5)
  {
    std::vector<std::string>::pointer begin = this->__begin_;
    unint64_t v14 = a5 - 0x5555555555555555 * (((char *)v12 - (char *)this->__begin_) >> 3);
    if (v14 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)__from_s - (char *)begin) >> 3);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v10 - (char *)begin) >> 3);
    uint64_t v17 = 2 * v16;
    if (2 * v16 <= v14) {
      uint64_t v17 = a5 - 0x5555555555555555 * (((char *)v12 - (char *)this->__begin_) >> 3);
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v18 = v17;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v18) {
      long long v19 = (std::string *)std::allocator<std::string>::allocate_at_least[abi:nn180100]((uint64_t)p_end_cap, v18);
    }
    else {
      long long v19 = 0;
    }
    uint64_t v25 = v19 + v15;
    __v.__first_ = v19;
    __v.__begin_ = v25;
    __v.__end_cap_.__value_ = &v19[v18];
    unint64_t v26 = &v25[a5];
    uint64_t v27 = 24 * a5;
    do
    {
      long long v28 = *(_OWORD *)a3;
      v25->__r_.__value_.__r.__words[2] = *(void *)(a3 + 16);
      *(_OWORD *)&v25->__r_.__value_.__l.__data_ = v28;
      ++v25;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)a3 = 0;
      a3 += 24;
      v27 -= 24;
    }
    while (v27);
    __v.__end_ = v26;
    int64_t v5 = std::vector<std::string>::__swap_out_circular_buffer(this, &__v, v5);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    return v5;
  }
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)__from_s) >> 3)) >= a5)
  {
    std::vector<std::string>::const_iterator v20 = (long long *)(a3 + 24 * a5);
LABEL_18:
    std::vector<std::string>::__move_range(this, __from_s, v12, &__from_s[a5]);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::move_iterator<std::__wrap_iter<std::string *>>,std::move_iterator<std::__wrap_iter<std::string *>>,std::string *>((uint64_t)&__v, (long long *)a3, v20, (uint64_t)v5);
    return v5;
  }
  std::vector<std::string>::const_iterator v20 = (long long *)(a3 + 8 * (((char *)v12 - (char *)__from_s) >> 3));
  std::vector<std::string>::const_iterator v21 = (std::string *)*((void *)p_end_cap - 1);
  if (v20 != a4)
  {
    uint64_t v22 = a3 + 8 * (((char *)v12 - (char *)__from_s) >> 3);
    uint64_t v23 = *((void *)p_end_cap - 1);
    do
    {
      long long v24 = *(_OWORD *)v22;
      *(void *)(v23 + 16) = *(void *)(v22 + 16);
      *(_OWORD *)uint64_t v23 = v24;
      v23 += 24;
      *(void *)(v22 + 8) = 0;
      *(void *)(v22 + 16) = 0;
      *(void *)uint64_t v22 = 0;
      v22 += 24;
      ++v21;
    }
    while ((long long *)v22 != a4);
  }
  this->__end_ = v21;
  if ((char *)v12 - (char *)__from_s >= 1) {
    goto LABEL_18;
  }
  return v5;
}

void sub_10000B44C(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__move_range(std::vector<std::string> *this, std::vector<std::string>::pointer __from_s, std::vector<std::string>::pointer __from_e, std::vector<std::string>::pointer __to)
{
  std::vector<std::string>::pointer end = this->__end_;
  long long v7 = (char *)__from_s + (char *)end - (char *)__to;
  std::vector<std::string>::pointer v8 = end;
  if (v7 < (char *)__from_e)
  {
    unint64_t v9 = (unint64_t)v7;
    std::vector<std::string>::pointer v8 = this->__end_;
    do
    {
      long long v10 = *(_OWORD *)v9;
      v8->__r_.__value_.__r.__words[2] = *(void *)(v9 + 16);
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      ++v8;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      *(void *)unint64_t v9 = 0;
      v9 += 24;
    }
    while (v9 < (unint64_t)__from_e);
  }
  this->__end_ = v8;
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::string *,std::string *,std::string *>((uint64_t)&v11, (uint64_t)__from_s, (uint64_t)v7, (uint64_t)end);
}

std::vector<std::string>::pointer std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v, std::vector<std::string>::pointer __p)
{
  std::vector<std::string>::pointer result = __v->__begin_;
  std::vector<std::string>::pointer begin = this->__begin_;
  unint64_t v6 = result;
  if (this->__begin_ != __p)
  {
    std::vector<std::string>::pointer v7 = __p;
    std::__split_buffer<std::string>::pointer v8 = __v->__begin_;
    do
    {
      unint64_t v6 = v8 - 1;
      long long v9 = *(_OWORD *)&v7[-1].__r_.__value_.__l.__data_;
      v8[-1].__r_.__value_.__r.__words[2] = v7[-1].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v8[-1].__r_.__value_.__l.__data_ = v9;
      v7[-1].__r_.__value_.__l.__size_ = 0;
      v7[-1].__r_.__value_.__r.__words[2] = 0;
      v7[-1].__r_.__value_.__r.__words[0] = 0;
      --v7;
      --v8;
    }
    while (v7 != begin);
  }
  __v->__begin_ = v6;
  std::vector<std::string>::pointer end = this->__end_;
  std::__split_buffer<std::string>::pointer v11 = __v->__end_;
  if (end != __p)
  {
    do
    {
      long long v12 = *(_OWORD *)&__p->__r_.__value_.__l.__data_;
      v11->__r_.__value_.__r.__words[2] = __p->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
      ++v11;
      *(_OWORD *)&__p->__r_.__value_.__r.__words[1] = 0uLL;
      __p->__r_.__value_.__r.__words[0] = 0;
      ++__p;
    }
    while (__p != end);
    unint64_t v6 = __v->__begin_;
  }
  __v->__end_ = v11;
  std::vector<std::string>::pointer v13 = this->__begin_;
  this->__begin_ = v6;
  __v->__begin_ = v13;
  unint64_t v14 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v14;
  xpc_object_t value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return result;
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::string *,std::string *,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    do
    {
      uint64_t v7 = a4 - 24;
      if (*(char *)(a4 - 1) < 0) {
        operator delete(*(void **)v7);
      }
      long long v8 = *(_OWORD *)(v6 - 24);
      *(void *)(v7 + 16) = *(void *)(v6 - 8);
      *(_OWORD *)uint64_t v7 = v8;
      *(unsigned char *)(v6 - 1) = 0;
      *(unsigned char *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24;
    }
    while (v6 != a2);
  }
  return a3;
}

long long *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::move_iterator<std::__wrap_iter<std::string *>>,std::move_iterator<std::__wrap_iter<std::string *>>,std::string *>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  int64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      long long v7 = *v5;
      *(void *)(a4 + 16) = *((void *)v5 + 2);
      *(_OWORD *)a4 = v7;
      a4 += 24;
      *((unsigned char *)v5 + 23) = 0;
      *(unsigned char *)int64_t v5 = 0;
      int64_t v5 = (long long *)((char *)v5 + 24);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *,false>(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  std::__split_buffer<std::string>::pointer v11 = a2 - 24;
  long long v12 = (void **)a1;
LABEL_2:
  uint64_t v13 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v12;
    uint64_t v14 = v13;
    uint64_t v15 = a2 - (char *)v12;
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((a2 - (char *)v12) >> 3);
    if (!(!v6 & v5))
    {
      switch(v16)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)a2 - 3, v12) & 0x80) != 0)
          {
            uint64_t v31 = v12[2];
            long long v29 = *(_OWORD *)v12;
            long long v27 = *(_OWORD *)v11;
            v12[2] = (void *)*((void *)a2 - 1);
            *(_OWORD *)long long v12 = v27;
            *(_OWORD *)std::__split_buffer<std::string>::pointer v11 = v29;
            *((void *)a2 - 1) = v31;
          }
          break;
        case 3uLL:
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(v12, v12 + 3, (void *)a2 - 3);
          break;
        case 4uLL:
          std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>((uint64_t)v12, v12 + 3, v12 + 6, (void *)a2 - 3);
          break;
        case 5uLL:
          std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>((uint64_t)v12, v12 + 3, v12 + 6, v12 + 9, (void *)a2 - 3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v15 <= 575) {
      break;
    }
    if (v14 == 1)
    {
      if (v12 != (void **)a2)
      {
        std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *,std::string *>((uint64_t)v12, a2, a2, a3);
      }
      return;
    }
    unint64_t v17 = v16 >> 1;
    unint64_t v18 = &v12[3 * (v16 >> 1)];
    if ((unint64_t)v15 >= 0xC01)
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(v12, &v12[3 * (v16 >> 1)], (void *)a2 - 3);
      uint64_t v19 = 3 * v17;
      std::vector<std::string>::const_iterator v20 = &v12[3 * v17 - 3];
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(v12 + 3, v20, (void *)a2 - 6);
      std::vector<std::string>::const_iterator v21 = v12 + 6;
      uint64_t v22 = &v12[v19 + 3];
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(v21, v22, (void *)a2 - 9);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(v20, v18, v22);
      v30 = *(void **)(a1 + 16);
      long long v28 = *(_OWORD *)a1;
      long long v23 = *(_OWORD *)v18;
      *(void *)(a1 + 16) = v18[2];
      *(_OWORD *)a1 = v23;
      v18[2] = v30;
      *(_OWORD *)unint64_t v18 = v28;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(&v12[3 * (v16 >> 1)], v12, (void *)a2 - 3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)(a1 - 24), (void **)a1) & 0x80) == 0)
    {
      long long v12 = std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,std::string *,std::__less<void,void> &>((void **)a1, (unint64_t)a2);
      goto LABEL_18;
    }
LABEL_13:
    long long v24 = (void **)std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,std::string *,std::__less<void,void> &>((long long *)a1, a2);
    if ((v25 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v26 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, v24);
    long long v12 = v24 + 3;
    if (std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>((uint64_t)(v24 + 3), (void **)a2))
    {
      a4 = -v14;
      a2 = (char *)v24;
      if (v26) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v13 = v14 + 1;
    if (!v26)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *,false>(a1, v24, a3, -v14, a5 & 1);
      long long v12 = v24 + 3;
LABEL_18:
      a5 = 0;
      a4 = -v14;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>((uint64_t)v12, a2);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(v12, a2);
  }
}

void std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(uint64_t a1, void *a2)
{
  if ((void *)a1 != a2)
  {
    uint64_t v17 = v2;
    uint64_t v18 = v3;
    char v6 = (void *)(a1 + 24);
    if ((void *)(a1 + 24) != a2)
    {
      uint64_t v7 = 0;
      long long v8 = (void *)a1;
      do
      {
        long long v9 = (void **)v8;
        long long v8 = v6;
        if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v6, v9) & 0x80) != 0)
        {
          long long v15 = *(_OWORD *)v8;
          uint64_t v16 = v8[2];
          v8[1] = 0;
          v8[2] = 0;
          void *v8 = 0;
          uint64_t v10 = v7;
          do
          {
            uint64_t v11 = a1 + v10;
            long long v12 = (void **)(a1 + v10 + 24);
            if (*(char *)(a1 + v10 + 47) < 0) {
              operator delete(*v12);
            }
            *(_OWORD *)long long v12 = *(_OWORD *)v11;
            *(void *)(a1 + v10 + 40) = *(void *)(v11 + 16);
            *(unsigned char *)(v11 + 23) = 0;
            *(unsigned char *)uint64_t v11 = 0;
            if (!v10)
            {
              uint64_t v14 = a1;
              goto LABEL_13;
            }
            v10 -= 24;
          }
          while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v15, (void **)(v10 + a1)) & 0x80) != 0);
          int v13 = *(char *)(a1 + v10 + 47);
          uint64_t v14 = a1 + v10 + 24;
          if (v13 < 0) {
            operator delete(*(void **)v14);
          }
LABEL_13:
          *(_OWORD *)uint64_t v14 = v15;
          *(void *)(v14 + 16) = v16;
        }
        char v6 = v8 + 3;
        v7 += 24;
      }
      while (v8 + 3 != a2);
    }
  }
}

void std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(void *a1, void *a2)
{
  if (a1 != a2)
  {
    uint64_t v16 = v2;
    uint64_t v17 = v3;
    char v5 = a1;
    char v6 = a1 + 3;
    if (a1 + 3 != a2)
    {
      uint64_t v7 = a1 - 3;
      do
      {
        long long v8 = (void **)v5;
        char v5 = v6;
        if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v6, v8) & 0x80) != 0)
        {
          long long v14 = *(_OWORD *)v5;
          long long v15 = (void *)v5[2];
          v5[1] = 0;
          v5[2] = 0;
          *char v5 = 0;
          long long v9 = v7;
          do
          {
            uint64_t v10 = (void **)(v9 + 6);
            if (*((char *)v9 + 71) < 0) {
              operator delete(*v10);
            }
            *(_OWORD *)uint64_t v10 = *(_OWORD *)(v9 + 3);
            v9[8] = v9[5];
            *((unsigned char *)v9 + 47) = 0;
            *((unsigned char *)v9 + 24) = 0;
            char v11 = std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v14, (void **)v9);
            v9 -= 3;
          }
          while (v11 < 0);
          int v12 = *((char *)v9 + 71);
          int v13 = (void **)(v9 + 6);
          if (v12 < 0) {
            operator delete(*v13);
          }
          *(_OWORD *)int v13 = v14;
          v13[2] = v15;
        }
        char v6 = v5 + 3;
        v7 += 3;
      }
      while (v5 + 3 != a2);
    }
  }
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(void **a1, void **a2, void *a3)
{
  char v6 = std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, a1);
  int v7 = (char)std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a3, a2);
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      std::vector<std::string>::const_iterator v21 = a1[2];
      long long v22 = *(_OWORD *)a1;
      long long v23 = (void *)a3[2];
      *(_OWORD *)a1 = *(_OWORD *)a3;
      a1[2] = v23;
      *(_OWORD *)a3 = v22;
      a3[2] = v21;
    }
    else
    {
      long long v9 = a1[2];
      long long v10 = *(_OWORD *)a1;
      char v11 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v11;
      *(_OWORD *)a2 = v10;
      a2[2] = v9;
      if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a3, a2) & 0x80) != 0)
      {
        int v12 = a2[2];
        long long v13 = *(_OWORD *)a2;
        long long v14 = (void *)a3[2];
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v14;
        *(_OWORD *)a3 = v13;
        a3[2] = v12;
        return 2;
      }
    }
  }
  else
  {
    if ((v7 & 0x80000000) == 0) {
      return 0;
    }
    long long v15 = a2[2];
    long long v16 = *(_OWORD *)a2;
    uint64_t v17 = (void *)a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v17;
    *(_OWORD *)a3 = v16;
    a3[2] = v15;
    if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, a1) & 0x80) != 0)
    {
      uint64_t v18 = a1[2];
      long long v19 = *(_OWORD *)a1;
      std::vector<std::string>::const_iterator v20 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v20;
      *(_OWORD *)a2 = v19;
      a2[2] = v18;
      return 2;
    }
  }
  return 1;
}

void **std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,std::string *,std::__less<void,void> &>(void **a1, unint64_t a2)
{
  unint64_t v2 = a2;
  long long v14 = *(_OWORD *)a1;
  long long v15 = a1[2];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v14, (void **)(a2 - 24)) & 0x80) != 0)
  {
    char v5 = a1;
    do
      v5 += 3;
    while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v14, v5) & 0x80) == 0);
  }
  else
  {
    uint64_t v4 = a1 + 3;
    do
    {
      char v5 = v4;
      if ((unint64_t)v4 >= v2) {
        break;
      }
      char v6 = std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v14, v4);
      uint64_t v4 = v5 + 3;
    }
    while ((v6 & 0x80) == 0);
  }
  if ((unint64_t)v5 < v2)
  {
    do
      v2 -= 24;
    while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v14, (void **)v2) & 0x80) != 0);
  }
  while ((unint64_t)v5 < v2)
  {
    long long v7 = *(_OWORD *)v5;
    uint64_t v17 = v5[2];
    long long v16 = v7;
    long long v8 = *(_OWORD *)v2;
    v5[2] = *(void **)(v2 + 16);
    *(_OWORD *)char v5 = v8;
    long long v9 = v16;
    *(void *)(v2 + 16) = v17;
    *(_OWORD *)unint64_t v2 = v9;
    do
      v5 += 3;
    while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v14, v5) & 0x80) == 0);
    do
      v2 -= 24;
    while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v14, (void **)v2) & 0x80) != 0);
  }
  long long v10 = v5 - 3;
  if (v5 - 3 == a1)
  {
    if (*((char *)v5 - 1) < 0) {
      operator delete(*v10);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*a1);
    }
    long long v11 = *(_OWORD *)v10;
    a1[2] = *(v5 - 1);
    *(_OWORD *)a1 = v11;
    *((unsigned char *)v5 - 1) = 0;
    *((unsigned char *)v5 - 24) = 0;
  }
  long long v12 = v14;
  *(v5 - 1) = v15;
  *(_OWORD *)long long v10 = v12;
  return v5;
}

void *std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,std::string *,std::__less<void,void> &>(long long *a1, void *a2)
{
  uint64_t v4 = 0;
  long long v15 = *a1;
  uint64_t v16 = *((void *)a1 + 2);
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  *(void *)a1 = 0;
  do
    v4 += 24;
  while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((long long *)((char *)a1 + v4), (void **)&v15) & 0x80) != 0);
  unint64_t v5 = (unint64_t)a1 + v4;
  if (v4 == 24)
  {
    do
    {
      if (v5 >= (unint64_t)a2) {
        break;
      }
      a2 -= 3;
    }
    while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (void **)&v15) & 0x80) == 0);
  }
  else
  {
    do
      a2 -= 3;
    while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (void **)&v15) & 0x80) == 0);
  }
  char v6 = (void *)((char *)a1 + v4);
  if (v5 < (unint64_t)a2)
  {
    long long v7 = a2;
    do
    {
      long long v17 = *(_OWORD *)v6;
      long long v8 = v17;
      uint64_t v18 = v6[2];
      uint64_t v9 = v18;
      uint64_t v10 = v7[2];
      *(_OWORD *)char v6 = *(_OWORD *)v7;
      v6[2] = v10;
      v7[2] = v9;
      *(_OWORD *)long long v7 = v8;
      do
        v6 += 3;
      while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v6, (void **)&v15) & 0x80) != 0);
      do
        v7 -= 3;
      while ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v7, (void **)&v15) & 0x80) == 0);
    }
    while (v6 < v7);
  }
  long long v11 = (void **)(v6 - 3);
  if (v6 - 3 == (void *)a1)
  {
    if (*((char *)v6 - 1) < 0) {
      operator delete(*v11);
    }
  }
  else
  {
    if (*((char *)a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v12 = *(_OWORD *)v11;
    *((void *)a1 + 2) = *(v6 - 1);
    *a1 = v12;
    *((unsigned char *)v6 - 1) = 0;
    *((unsigned char *)v6 - 24) = 0;
  }
  long long v13 = v15;
  *(v6 - 1) = v16;
  *(_OWORD *)long long v11 = v13;
  return v6 - 3;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(uint64_t a1, void **a2)
{
  uint64_t v4 = ((uint64_t)a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      char v6 = a2 - 3;
      if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2 - 3, (void **)a1) & 0x80) != 0)
      {
        long long v7 = *(void **)(a1 + 16);
        long long v8 = *(_OWORD *)a1;
        uint64_t v9 = v6[2];
        *(_OWORD *)a1 = *(_OWORD *)v6;
        *(void *)(a1 + 16) = v9;
        *(_OWORD *)char v6 = v8;
        v6[2] = v7;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>((void **)a1, (void **)(a1 + 24), a2 - 3);
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, (void **)(a1 + 24), (void **)(a1 + 48), a2 - 3);
      return 1;
    case 5uLL:
      std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, (void **)(a1 + 24), (void **)(a1 + 48), (void **)(a1 + 72), a2 - 3);
      return 1;
    default:
      uint64_t v10 = (void **)(a1 + 48);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>((void **)a1, (void **)(a1 + 24), (void *)(a1 + 48));
      long long v11 = (void **)(a1 + 72);
      if ((void **)(a1 + 72) == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v11, v10) & 0x80) != 0)
    {
      long long v20 = *(_OWORD *)v11;
      std::vector<std::string>::const_iterator v21 = v11[2];
      v11[1] = 0;
      v11[2] = 0;
      *long long v11 = 0;
      uint64_t v14 = v12;
      do
      {
        uint64_t v15 = a1 + v14;
        uint64_t v16 = (void **)(a1 + v14 + 72);
        if (*(char *)(a1 + v14 + 95) < 0) {
          operator delete(*v16);
        }
        *(_OWORD *)uint64_t v16 = *(_OWORD *)(v15 + 48);
        *(void *)(a1 + v14 + 88) = *(void *)(v15 + 64);
        *(unsigned char *)(v15 + 71) = 0;
        *(unsigned char *)(v15 + 48) = 0;
        if (v14 == -48)
        {
          uint64_t v19 = a1;
          goto LABEL_15;
        }
        char v17 = std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(&v20, (void **)(a1 + v14 + 24));
        v14 -= 24;
      }
      while (v17 < 0);
      int v18 = *(char *)(a1 + v14 + 95);
      uint64_t v19 = a1 + v14 + 72;
      if (v18 < 0) {
        operator delete(*(void **)v19);
      }
LABEL_15:
      *(_OWORD *)uint64_t v19 = v20;
      *(void *)(v19 + 16) = v21;
      if (++v13 == 8) {
        return v11 + 3 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 24;
    v11 += 3;
    if (v11 == a2) {
      return 1;
    }
  }
}

uint64_t std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    unint64_t v5 = a2;
  }
  else {
    unint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:nn180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:nn180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

__n128 std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(uint64_t a1, void **a2, void **a3, void *a4)
{
  std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>((void **)a1, a2, a3);
  if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a4, a3) & 0x80) != 0)
  {
    uint64_t v9 = a3[2];
    long long v10 = *(_OWORD *)a3;
    long long v11 = (void *)a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v11;
    *(_OWORD *)a4 = v10;
    a4[2] = v9;
    if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a3, a2) & 0x80) != 0)
    {
      uint64_t v12 = a2[2];
      long long v13 = *(_OWORD *)a2;
      uint64_t v14 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v14;
      *(_OWORD *)a3 = v13;
      a3[2] = v12;
      if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (void **)a1) & 0x80) != 0)
      {
        uint64_t v15 = *(void **)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v16 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v16;
        *(__n128 *)a2 = result;
        a2[2] = v15;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(uint64_t a1, void **a2, void **a3, void **a4, void *a5)
{
  std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, a2, a3, a4);
  if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a5, a4) & 0x80) != 0)
  {
    long long v11 = a4[2];
    long long v12 = *(_OWORD *)a4;
    long long v13 = (void *)a5[2];
    *(_OWORD *)a4 = *(_OWORD *)a5;
    a4[2] = v13;
    *(_OWORD *)a5 = v12;
    a5[2] = v11;
    if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a4, a3) & 0x80) != 0)
    {
      uint64_t v14 = a3[2];
      long long v15 = *(_OWORD *)a3;
      uint64_t v16 = a4[2];
      *(_OWORD *)a3 = *(_OWORD *)a4;
      a3[2] = v16;
      *(_OWORD *)a4 = v15;
      a4[2] = v14;
      if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a3, a2) & 0x80) != 0)
      {
        char v17 = a2[2];
        long long v18 = *(_OWORD *)a2;
        uint64_t v19 = a3[2];
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v19;
        *(_OWORD *)a3 = v18;
        a3[2] = v17;
        if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (void **)a1) & 0x80) != 0)
        {
          long long v20 = *(void **)(a1 + 16);
          __n128 result = *(__n128 *)a1;
          std::vector<std::string>::const_iterator v21 = a2[2];
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(void *)(a1 + 16) = v21;
          *(__n128 *)a2 = result;
          a2[2] = v20;
        }
      }
    }
  }
  return result;
}

void *std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *,std::string *>(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  if ((void *)a1 != a2)
  {
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) / 24;
    if ((uint64_t)a2 - a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      long long v12 = (__n128 *)(a1 + 24 * v10);
      do
      {
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, a4, v9, v12);
        long long v12 = (__n128 *)((char *)v12 - 24);
        --v11;
      }
      while (v11);
    }
    long long v13 = a2;
    if (a2 != a3)
    {
      uint64_t v14 = a2;
      do
      {
        if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v14, (void **)a1) & 0x80) != 0)
        {
          uint64_t v15 = v14[2];
          long long v16 = *(_OWORD *)v14;
          uint64_t v17 = *(void *)(a1 + 16);
          *(_OWORD *)uint64_t v14 = *(_OWORD *)a1;
          v14[2] = v17;
          *(_OWORD *)a1 = v16;
          *(void *)(a1 + 16) = v15;
          std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, a4, v9, (__n128 *)a1);
        }
        v14 += 3;
      }
      while (v14 != a3);
      long long v13 = a3;
    }
    if (v8 >= 25)
    {
      int64_t v18 = v8 / 0x18uLL;
      uint64_t v19 = a2 - 3;
      do
      {
        uint64_t v20 = *(void *)a1;
        *(void *)long long v28 = *(void *)(a1 + 8);
        *(void *)&v28[7] = *(void *)(a1 + 15);
        char v21 = *(unsigned char *)(a1 + 23);
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        uint64_t v22 = std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, a4, v18);
        uint64_t v23 = v22;
        int v24 = *(char *)(v22 + 23);
        if (v19 == (void *)v22)
        {
          if (v24 < 0) {
            operator delete(*(void **)v22);
          }
          *(void *)uint64_t v23 = v20;
          *(void *)(v23 + 8) = *(void *)v28;
          *(void *)(v23 + 15) = *(void *)&v28[7];
          *(unsigned char *)(v23 + 23) = v21;
        }
        else
        {
          if (v24 < 0) {
            operator delete(*(void **)v22);
          }
          long long v25 = *(_OWORD *)v19;
          *(void *)(v23 + 16) = v19[2];
          *(_OWORD *)uint64_t v23 = v25;
          *uint64_t v19 = v20;
          v19[1] = *(void *)v28;
          *(void *)((char *)v19 + 15) = *(void *)&v28[7];
          *((unsigned char *)v19 + 23) = v21;
          std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(a1, v23 + 24, a4, 0xAAAAAAAAAAAAAAABLL * ((v23 + 24 - a1) >> 3));
        }
        v19 -= 3;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

void sub_10000C7E0(_Unwind_Exception *exception_object)
{
  if (v2 < 0) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4)
{
  unint64_t v6 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v21 = v4;
    uint64_t v22 = v5;
    size_t v7 = a4;
    uint64_t v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      uint64_t v11 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      uint64_t v12 = a1 + 24 * v11;
      uint64_t v13 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
      if (v13 < a3
        && (std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)(a1 + 24 * v11), (void **)(v12 + 24)) & 0x80u) != 0)
      {
        v12 += 24;
        uint64_t v11 = v13;
      }
      if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)v12, (void **)v7) & 0x80) == 0)
      {
        __n128 v19 = *v7;
        unint64_t v20 = v7[1].n128_u64[0];
        v7->n128_u64[1] = 0;
        v7[1].n128_u64[0] = 0;
        v7->n128_u64[0] = 0;
        while (1)
        {
          uint64_t v15 = (__n128 *)v12;
          if (v7[1].n128_i8[7] < 0) {
            operator delete((void *)v7->n128_u64[0]);
          }
          __n128 v16 = *(__n128 *)v12;
          v7[1].n128_u64[0] = *(void *)(v12 + 16);
          *size_t v7 = v16;
          *(unsigned char *)(v12 + 23) = 0;
          *(unsigned char *)uint64_t v12 = 0;
          if (v9 < v11) {
            break;
          }
          uint64_t v17 = (2 * v11) | 1;
          uint64_t v12 = a1 + 24 * v17;
          uint64_t v18 = 2 * v11 + 2;
          if (v18 < a3
            && (std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)(a1 + 24 * v17), (void **)(v12 + 24)) & 0x80u) != 0)
          {
            v12 += 24;
            uint64_t v17 = v18;
          }
          size_t v7 = v15;
          uint64_t v11 = v17;
          if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)v12, (void **)&v19) & 0x80) != 0)
          {
            if (v15[1].n128_i8[7] < 0) {
              operator delete((void *)v15->n128_u64[0]);
            }
            break;
          }
        }
        __n128 result = v19;
        v15[1].n128_u64[0] = v20;
        __n128 *v15 = result;
      }
    }
  }
  return result;
}

uint64_t std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = a1 + 24 * v5 + 24;
    uint64_t v9 = 2 * v5;
    uint64_t v5 = (2 * v5) | 1;
    uint64_t v10 = v9 + 2;
    if (v9 + 2 < a3
      && (std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)v8, (void **)(v8 + 24)) & 0x80u) != 0)
    {
      v8 += 24;
      uint64_t v5 = v10;
    }
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    long long v11 = *(_OWORD *)v8;
    *(void *)(a1 + 16) = *(void *)(v8 + 16);
    *(_OWORD *)a1 = v11;
    *(unsigned char *)(v8 + 23) = 0;
    *(unsigned char *)uint64_t v8 = 0;
    a1 = v8;
  }
  while (v5 <= v7);
  return v8;
}

double std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v15 = v4;
    uint64_t v16 = v5;
    unint64_t v7 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v8 = (long long *)(a1 + 24 * v7);
    uint64_t v9 = (long long *)(a2 - 24);
    if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v8, (void **)(a2 - 24)) & 0x80) != 0)
    {
      long long v13 = *v9;
      uint64_t v14 = *((void *)v9 + 2);
      *((void *)v9 + 1) = 0;
      *((void *)v9 + 2) = 0;
      *(void *)uint64_t v9 = 0;
      while (1)
      {
        long long v11 = v8;
        if (*((char *)v9 + 23) < 0) {
          operator delete(*(void **)v9);
        }
        long long v12 = *v8;
        *((void *)v9 + 2) = *((void *)v8 + 2);
        *uint64_t v9 = v12;
        *((unsigned char *)v8 + 23) = 0;
        *(unsigned char *)uint64_t v8 = 0;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (long long *)(a1 + 24 * v7);
        uint64_t v9 = v11;
        if ((std::operator<=>[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(v8, (void **)&v13) & 0x80) == 0)
        {
          if (*((char *)v11 + 23) < 0) {
            operator delete(*(void **)v11);
          }
          break;
        }
      }
      double result = *(double *)&v13;
      *long long v11 = v13;
      *((void *)v11 + 2) = v14;
    }
  }
  return result;
}

std::vector<std::string>::iterator std::vector<std::string>::erase(std::vector<std::string> *this, std::vector<std::string>::const_iterator __first, std::vector<std::string>::const_iterator __last)
{
  if (__first.__i_ != __last.__i_)
  {
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::move_iterator<std::__wrap_iter<std::string *>>,std::move_iterator<std::__wrap_iter<std::string *>>,std::string *>((uint64_t)&v9, (long long *)__last.__i_, (long long *)this->__end_, (uint64_t)__first.__i_);
    uint64_t v6 = v5;
    std::vector<std::string>::pointer end = this->__end_;
    if (end != v5)
    {
      do
      {
        if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(end[-1].__r_.__value_.__l.__data_);
        }
        --end;
      }
      while (end != v6);
    }
    this->__end_ = v6;
  }
  return (std::vector<std::string>::iterator)__first.__i_;
}

void *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  if (v13)
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_10000CD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

uint64_t std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:nn180100](__p, v12, __c);
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_10000CEA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:nn180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t std::stringbuf::str[abi:nn180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:nn180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  uint64_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:nn180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

__n128 Platform::FileOutputStream::FileOutputStream(uint64_t a1, __n128 *a2)
{
  *(void *)a1 = off_1000187C0;
  __n128 result = *a2;
  *(void *)(a1 + 24) = a2[1].n128_u64[0];
  *(__n128 *)(a1 + 8) = result;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  a2->n128_u64[0] = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

void Platform::FileOutputStream::~FileOutputStream(void **this)
{
  if (this[4]) {
    Platform::FileOutputStream::close((Platform::FileOutputStream *)this);
  }
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  Platform::FileOutputStream::~FileOutputStream(this);

  operator delete();
}

uint64_t Platform::FileOutputStream::close(Platform::FileOutputStream *this)
{
  int v2 = (FILE *)*((void *)this + 4);
  if (!v2) {
    Platform::FileOutputStream::close();
  }
  int v3 = fclose(v2);
  *((void *)this + 4) = 0;
  if (v3)
  {
    uint64_t v4 = *__error();
    std::generic_category();
  }
  else
  {
    std::system_category();
    return 0;
  }
  return v4;
}

uint64_t Platform::FileOutputStream::open(Platform::FileOutputStream *this, const char *a2)
{
  if (*((void *)this + 4)) {
    Platform::FileOutputStream::open();
  }
  int v3 = (char *)this + 8;
  if (*((char *)this + 31) < 0) {
    int v3 = *(const char **)v3;
  }
  uint64_t v4 = fopen(v3, a2);
  *((void *)this + 4) = v4;
  if (v4)
  {
    std::system_category();
    return 0;
  }
  else
  {
    uint64_t v5 = *__error();
    std::generic_category();
  }
  return v5;
}

uint64_t Platform::FileOutputStream::writeBytes(Platform::FileOutputStream *this, const unsigned __int8 *__ptr, size_t a3)
{
  int v3 = (FILE *)*((void *)this + 4);
  if (!v3) {
    Platform::FileOutputStream::writeBytes();
  }
  if (fwrite(__ptr, 1uLL, a3, v3) == a3)
  {
    std::system_category();
    return 0;
  }
  else
  {
    unsigned int v6 = ferror(*((FILE **)this + 4));
    std::generic_category();
    return v6;
  }
}

uint64_t Platform::FileOutputStream::getOffset(Platform::FileOutputStream *this, unint64_t *a2)
{
  int v2 = (FILE *)*((void *)this + 4);
  if (!v2) {
    Platform::FileOutputStream::getOffset();
  }
  uint64_t v4 = ftell(v2);
  *a2 = v4;
  if (v4 == -1)
  {
    uint64_t v5 = *__error();
    std::generic_category();
  }
  else
  {
    std::system_category();
    return 0;
  }
  return v5;
}

uint64_t Platform::FileOutputStream::seek(Platform::FileOutputStream *this, uint64_t a2)
{
  int v2 = (FILE *)*((void *)this + 4);
  if (!v2) {
    Platform::FileOutputStream::seek();
  }
  if (fseek(v2, a2, 0) == -1)
  {
    uint64_t v3 = *__error();
    std::generic_category();
  }
  else
  {
    std::system_category();
    return 0;
  }
  return v3;
}

uint64_t Backend::ListUpdateFetcher::ListUpdateFetcher(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  *(void *)a1 = v7;
  __int16 v8 = *(_WORD *)(a3 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a3;
  *(_WORD *)(a1 + 24) = v8;
  std::string::basic_string[abi:nn180100]<0>(__p, "1");
  Backend::Configuration::Configuration(a1 + 32, a4, __p);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  *(void *)(a1 + 80) = 0;

  return a1;
}

void sub_10000D38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void Backend::ListUpdateFetcher::~ListUpdateFetcher(id *this)
{
  Backend::Configuration::~Configuration((Backend::Configuration *)(this + 4));
}

void sub_10000D404(_Unwind_Exception *a1)
{
  Backend::Configuration::~Configuration((Backend::Configuration *)(v1 + 4));
  _Unwind_Resume(a1);
}

void Backend::ListUpdateFetcher::fetch(uint64_t a1, uint64_t a2)
{
  id v16 = *(id *)a1;
  char v17 = *(unsigned char *)(a1 + 8);
  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::__value_func[abi:nn180100]((uint64_t)v18, a2);
  *(void *)buf = v16;
  uint8_t buf[8] = v17;
  if (v19)
  {
    if (v19 == v18)
    {
      uint64_t v22 = v21;
      (*(void (**)(void *, void *))(v18[0] + 24))(v18, v21);
    }
    else
    {
      uint64_t v22 = v19;
      __n128 v19 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
  uint64_t v4 = (char *)malloc_type_malloc(0x50uLL, 0x10E004094FBFC1BuLL);
  uint64_t v5 = v4;
  *(void *)uint64_t v4 = _NSConcreteMallocBlock;
  *((void *)v4 + 1) = 50331650;
  *((void *)v4 + 2) = Platform::BlockPtr<void ()(NSData *,NSURLResponse *,NSError *)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0)::{lambda(void *,NSData *,NSURLResponse *,NSError *)#1}::__invoke;
  *((void *)v4 + 3) = &Platform::BlockPtr<void ()(NSData *,NSURLResponse *,NSError *)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0)::descriptor;
  uint64_t v6 = *(void *)buf;
  *(void *)buf = 0;
  *((void *)v4 + 4) = v6;
  v4[40] = buf[8];
  if (v22)
  {
    if (v22 == v21)
    {
      *((void *)v4 + 9) = v4 + 48;
      (*(void (**)(void *))(v21[0] + 24))(v21);
    }
    else
    {
      *((void *)v4 + 9) = v22;
      uint64_t v22 = 0;
    }
  }
  else
  {
    *((void *)v4 + 9) = 0;
  }
  id v7 = objc_retainBlock(v5);

  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::~__value_func[abi:nn180100](v21);
  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::~__value_func[abi:nn180100](v18);

  __int16 v8 = Backend::ListUpdateFetcher::createURLRequest((Backend::ListUpdateFetcher *)a1);
  int v9 = (id)WPOSLogNetwork();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v8 URL];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sending request to %{public}@", buf, 0xCu);
  }
  if (Backend::sharedURLSession(void)::onceToken != -1) {
    dispatch_once(&Backend::sharedURLSession(void)::onceToken, &__block_literal_global);
  }
  id v11 = (id)Backend::sharedURLSession(void)::sharedSession;
  id v12 = objc_retainBlock(v7);
  uint64_t v13 = [v11 dataTaskWithRequest:v8 completionHandler:v12];
  uint64_t v15 = *(void **)(a1 + 80);
  uint64_t v14 = (id *)(a1 + 80);
  *uint64_t v14 = (id)v13;

  [*v14 resume];
}

void sub_10000D710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id Backend::ListUpdateFetcher::createURLRequest(Backend::ListUpdateFetcher *this)
{
  int v1 = (Backend::ListUpdateFetcher *)((char *)this + 32);
  Backend::ListUpdateRequestJSONSerializer::ListUpdateRequestJSONSerializer((uint64_t)v4, (uint64_t)this + 32, (__n128 *)((char *)this + 8));
  int v2 = Backend::Configuration::getURLRequest(v1, (const Backend::ListUpdateRequestJSONSerializer *)v4);
  Backend::ListUpdateRequestJSONSerializer::~ListUpdateRequestJSONSerializer((Backend::ListUpdateRequestJSONSerializer *)v4);

  return v2;
}

void sub_10000D810(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  Backend::ListUpdateRequestJSONSerializer::~ListUpdateRequestJSONSerializer((Backend::ListUpdateRequestJSONSerializer *)va);
  _Unwind_Resume(a1);
}

void Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = (id)WPOSLogNetwork();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if ((*(unsigned char *)(a1 + 8) - 1) > 7u) {
        CFStringRef v11 = @"Invalid";
      }
      else {
        CFStringRef v11 = *(&off_100018878 + (char)(*(unsigned char *)(a1 + 8) - 1));
      }
      uint64_t v14 = [v9 localizedDescription];
      Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()((uint64_t)v11, v14, v26, v10);
    }
  }
  else
  {
    uint64_t v10 = (id)WPOSLogNetwork();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = [v7 length];
      if ((*(unsigned char *)(a1 + 8) - 1) > 7u) {
        CFStringRef v13 = @"Invalid";
      }
      else {
        CFStringRef v13 = *(&off_100018878 + (char)(*(unsigned char *)(a1 + 8) - 1));
      }
      *(_DWORD *)buf = 134218242;
      *(void *)long long v28 = v12;
      *(_WORD *)&v28[8] = 2114;
      *(void *)&v28[10] = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Fetched list update: %zu bytes for %{public}@", buf, 0x16u);
    }
  }

  uint64_t v15 = *(NSObject **)a1;
  uint8_t v23 = *(unsigned char *)(a1 + 8);
  id v16 = v7;
  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::__value_func[abi:nn180100]((uint64_t)v24, a1 + 16);
  buf[0] = v23;
  *(void *)&v28[4] = v16;
  if (v25)
  {
    if (v25 == v24)
    {
      long long v29 = &v28[12];
      (*(void (**)(void *, unsigned char *))(v24[0] + 24))(v24, &v28[12]);
    }
    else
    {
      long long v29 = v25;
      long long v25 = 0;
    }
  }
  else
  {
    long long v29 = 0;
  }
  char v17 = (char *)malloc_type_malloc(0x50uLL, 0x10E0040FBF52619uLL);
  char v18 = v17;
  *(void *)char v17 = _NSConcreteMallocBlock;
  *((void *)v17 + 1) = 50331650;
  *((void *)v17 + 2) = Platform::BlockPtr<void ()(void)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1}>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1})::{lambda(void *)#1}::__invoke;
  *((void *)v17 + 3) = &Platform::BlockPtr<void ()(void)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1}>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1})::descriptor;
  v17[32] = buf[0];
  uint64_t v19 = *(void *)&v28[4];
  unint64_t v20 = v29;
  *(void *)&v28[4] = 0;
  *((void *)v17 + 5) = v19;
  if (v20)
  {
    if (v20 == &v28[12])
    {
      *((void *)v17 + 9) = v17 + 48;
      (*(void (**)(unsigned char *))(*(void *)&v28[12] + 24))(&v28[12]);
    }
    else
    {
      *((void *)v17 + 9) = v20;
      long long v29 = 0;
    }
  }
  else
  {
    *((void *)v17 + 9) = 0;
  }
  id v21 = objc_retainBlock(v18);

  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::~__value_func[abi:nn180100](&v28[12]);
  id v22 = objc_retainBlock(v21);
  dispatch_async(v15, v22);

  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::~__value_func[abi:nn180100](v24);
}

void sub_10000DB78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Platform::BlockPtr<void ()(NSData *,NSURLResponse *,NSError *)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0)::{lambda(void const*)#1}::__invoke(uint64_t a1)
{
  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::~__value_func[abi:nn180100]((void *)(a1 + 48));
  int v2 = *(void **)(a1 + 32);
}

void Platform::BlockPtr<void ()(NSData *,NSURLResponse *,NSError *)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0)::{lambda(void *,NSData *,NSURLResponse *,NSError *)#1}::__invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
}

void Platform::BlockPtr<void ()(void)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1}>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1})::{lambda(void const*)#1}::__invoke(uint64_t a1)
{
  std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::~__value_func[abi:nn180100]((void *)(a1 + 48));
  int v2 = *(void **)(a1 + 40);
}

void Platform::BlockPtr<void ()(void)>::fromCallable<Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1}>(Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(NSData *,NSURLResponse *,NSError *)::{lambda(void)#1})::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  Backend::ListUpdateResponse::ListUpdateResponse(v4, *(unsigned __int8 *)(a1 + 32), *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 72);
  if (!v2)
  {
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
  }
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v2 + 48))(v2, v4);
  uint64_t v3 = (void **)&v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v3);
  if (__p)
  {
    uint64_t v6 = __p;
    operator delete(__p);
  }
}

void sub_10000DD14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
}

void *std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void ___ZN7BackendL16sharedURLSessionEv_block_invoke(id a1)
{
  id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  [v3 setTimeoutIntervalForRequest:15.0];
  uint64_t v1 = +[NSURLSession sessionWithConfiguration:v3];
  uint64_t v2 = (void *)Backend::sharedURLSession(void)::sharedSession;
  Backend::sharedURLSession(void)::sharedSession = v1;
}

void sub_10000DE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<void ()(Backend::ListUpdateResponse &&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = v3;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

__n128 Backend::ListUpdateRequestJSONSerializer::ListUpdateRequestJSONSerializer(uint64_t a1, uint64_t a2, __n128 *a3)
{
  *(void *)a1 = a2;
  __n128 result = *a3;
  *(_WORD *)(a1 + 24) = a3[1].n128_u16[0];
  *(__n128 *)(a1 + 8) = result;
  return result;
}

id Backend::ListUpdateRequestJSONSerializer::serializedData(Backend::ListUpdateRequestJSONSerializer *this)
{
  v18[0] = @"client";
  v16[0] = @"clientId";
  uint64_t v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  v17[0] = v2;
  v16[1] = @"clientVersion";
  uint64_t v3 = (void *)(*(void *)this + 24);
  if (*(char *)(*(void *)this + 47) < 0) {
    uint64_t v3 = (void *)*v3;
  }
  uint64_t v4 = +[NSString stringWithUTF8String:v3];
  v17[1] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v5;
  v18[1] = @"remoteList";
  if ((*((unsigned char *)this + 8) - 1) > 7u) {
    CFStringRef v6 = @"Invalid";
  }
  else {
    CFStringRef v6 = *(&off_1000188B8 + (char)(*((unsigned char *)this + 8) - 1));
  }
  v19[1] = v6;
  v18[2] = @"remoteListVersion";
  if (*((unsigned char *)this + 10) == 1) {
    uint64_t v7 = @"v1";
  }
  else {
    uint64_t v7 = @"v2";
  }
  id v8 = v7;
  v19[2] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v10 = [v9 mutableCopy];

  if (*((unsigned char *)this + 25))
  {
    CFStringRef v11 = +[NSData dataWithBytesNoCopy:(char *)this + 11 length:14 freeWhenDone:0];
    id v12 = Platform::dataToBase64String(v11);

    if (v12) {
      [v10 setObject:v12 forKeyedSubscript:@"state"];
    }
  }
  uint64_t v15 = 0;
  CFStringRef v13 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:&v15];

  return v13;
}

void sub_10000E148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t Backend::ListUpdateResponse::ListUpdateResponse(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)a1 = 1;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 113) = 0u;
  if (!v5) {
    goto LABEL_9;
  }
  v56 = (Backend::DatabaseUpdate *)(a1 + 8);
  id v66 = 0;
  __int16 v57 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v66];
  id v7 = v66;
  if (v7)
  {
    id v8 = (id)WPOSLogNetwork();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      Backend::ListUpdateResponse::ListUpdateResponse((uint64_t)v7, buf, (uint64_t)[v5 length], v8);
    }
LABEL_5:
    id v9 = 0;
LABEL_6:
    LODWORD(v10) = 1;
    goto LABEL_7;
  }
  id v12 = v57;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v12;
  }
  else {
    id v9 = 0;
  }

  if (!v9)
  {
    id v8 = (id)WPOSLogNetwork();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      Backend::ListUpdateResponse::ListUpdateResponse(v14, (uint64_t)buf);
    }
    goto LABEL_5;
  }
  id v13 = [v9 objectForKey:@"responseType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v13;
  }
  else {
    id v8 = 0;
  }

  if ([v8 isEqualToString:@"FULL_LIST"])
  {
    char v15 = 1;
  }
  else
  {
    if (([v8 isEqualToString:@"DIFF_LIST"] & 1) == 0)
    {
      id v22 = WPOSLogNetwork();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        Backend::ListUpdateResponse::ListUpdateResponse();
      }
      goto LABEL_6;
    }
    char v15 = 2;
  }
  *(unsigned char *)a1 = v15;
  id v16 = [v9 objectForKey:@"newListState"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v55 = (NSString *)v16;
  }
  else {
    v55 = 0;
  }

  if (!v55)
  {
    id v21 = WPOSLogNetwork();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      Backend::ListUpdateResponse::ListUpdateResponse();
    }
    LODWORD(v10) = 1;
    goto LABEL_97;
  }
  char v17 = Platform::base64StringToData(v55);
  char v54 = v17;
  if (v17)
  {
    unint64_t v18 = Platform::makeArray<unsigned char,14ul>(v17);
    if ((v19 & 0xFF000000000000) != 0)
    {
      *(void *)(a1 + 42) = v18;
      *(_DWORD *)(a1 + 50) = v19;
      *(_WORD *)(a1 + 54) = WORD2(v19);
      *(unsigned char *)(a1 + 8) = a2;
      *(unsigned char *)(a1 + 9) = 1;
      id v20 = [v9 objectForKey:@"checksum"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        std::error_code v53 = (NSString *)v20;
      }
      else {
        std::error_code v53 = 0;
      }

      if (!v53)
      {
        v41 = WPOSLogNetwork();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          Backend::ListUpdateResponse::ListUpdateResponse();
        }
        LODWORD(v10) = 1;
        goto LABEL_95;
      }
      long long v25 = Platform::base64StringToData(v53);
      BOOL v26 = v25;
      if (!v25)
      {
        int v42 = WPOSLogNetwork();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          Backend::ListUpdateResponse::ListUpdateResponse();
        }
        LODWORD(v10) = 1;
        goto LABEL_94;
      }
      std::error_code v50 = v25;
      Platform::makeArray<unsigned char,32ul>(v25, (uint64_t)buf);
      if (v73)
      {
        long long v27 = v72;
        *(_OWORD *)(a1 + 10) = *(_OWORD *)buf;
        *(_OWORD *)(a1 + 26) = v27;
        long long v28 = [v9 objectForKey:@"nextUpdateDuration"];
        long long v29 = Platform::dynamic_objc_cast<NSString>(v28);

        if ([v29 length]
          && [v29 characterAtIndex:(char *)[v29 length] - 1] == 115)
        {
          uint64_t v30 = [v29 substringToIndex:(char *)[v29 length] - 1];

          long long v29 = v30;
        }
        if ([v29 length])
        {
          id v31 = [v29 integerValue];
          if (v31)
          {
            *(double *)(a1 + 56) = Platform::secondsSince1970InGMT() + (double)(uint64_t)v31;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            std::string v48 = v29;
            long long v32 = [v9 objectForKey:@"deletes"];
            Platform::dynamic_objc_cast<NSArray>(v32);
            id obj = (id)objc_claimAutoreleasedReturnValue();

            id v33 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
            if (v33)
            {
              uint64_t v34 = *(void *)v63;
              while (2)
              {
                for (uint64_t i = 0; i != v33; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v63 != v34) {
                    objc_enumerationMutation(obj);
                  }
                  id v36 = *(id *)(*((void *)&v62 + 1) + 8 * i);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {

LABEL_85:
                    v45 = (id)WPOSLogNetwork();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                    {
                      v46 = objc_opt_class();
                      Backend::ListUpdateResponse::ListUpdateResponse(v46, (uint64_t)__p);
                    }

                    LODWORD(v10) = 1;
                    goto LABEL_92;
                  }
                  if (!v36) {
                    goto LABEL_85;
                  }
                  Backend::DatabaseUpdate::appendIndexToRemove(v56, (int)[v36 unsignedIntValue]);
                }
                id v33 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
                if (v33) {
                  continue;
                }
                break;
              }
            }

            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v37 = [v9 objectForKey:@"additions"];
            Platform::dynamic_objc_cast<NSArray>(v37);
            id v49 = (id)objc_claimAutoreleasedReturnValue();

            id v10 = [v49 countByEnumeratingWithState:&v58 objects:v69 count:16];
            if (v10)
            {
              id obja = *(id *)v59;
              while (2)
              {
                for (j = 0; j != v10; j = ((char *)j + 1))
                {
                  if (*(id *)v59 != obja) {
                    objc_enumerationMutation(v49);
                  }
                  v39 = Platform::dynamic_objc_cast<NSString>(*(void **)(*((void *)&v58 + 1) + 8 * (void)j));
                  if (!v39)
                  {
                    id v10 = (id)WPOSLogNetwork();
                    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
                    {
                      std::vector<std::string> v47 = objc_opt_class();
                      Backend::ListUpdateResponse::ListUpdateResponse(v47, (uint64_t)__p);
                    }

                    LODWORD(v10) = 1;
                    goto LABEL_91;
                  }
                  id v40 = v39;
                  std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v40 cStringUsingEncoding:4]);
                  Backend::DatabaseUpdate::appendNewRule(v56, (long long *)__p);
                  if (v68 < 0) {
                    operator delete(__p[0]);
                  }
                }
                id v10 = [v49 countByEnumeratingWithState:&v58 objects:v69 count:16];
                if (v10) {
                  continue;
                }
                break;
              }
            }
LABEL_91:

LABEL_92:
            long long v29 = v48;
            goto LABEL_93;
          }
          v44 = WPOSLogNetwork();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            Backend::ListUpdateResponse::ListUpdateResponse();
          }
        }
        else
        {
          v43 = WPOSLogNetwork();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            Backend::ListUpdateResponse::ListUpdateResponse();
          }
        }
      }
      else
      {
        long long v29 = (id)WPOSLogNetwork();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          Backend::ListUpdateResponse::ListUpdateResponse((uint8_t *)__p, (uint64_t)[v54 length], v29);
          LODWORD(v10) = 1;
LABEL_93:

          BOOL v26 = v50;
LABEL_94:

LABEL_95:
          goto LABEL_96;
        }
      }
      LODWORD(v10) = 1;
      goto LABEL_93;
    }
    int v24 = (id)WPOSLogNetwork();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      Backend::ListUpdateResponse::ListUpdateResponse(buf, (uint64_t)[v54 length], v24);
    }
  }
  else
  {
    uint8_t v23 = WPOSLogNetwork();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      Backend::ListUpdateResponse::ListUpdateResponse();
    }
  }
  LODWORD(v10) = 1;
LABEL_96:

LABEL_97:
LABEL_7:

  if (!v10) {
    *(unsigned char *)(a1 + 128) = 1;
  }
LABEL_9:

  return a1;
}

void sub_10000E9E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, Backend::DatabaseUpdate *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  Backend::DatabaseUpdate::~DatabaseUpdate(a17);
  _Unwind_Resume(a1);
}

id Platform::dynamic_objc_cast<NSString>(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_10000EC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t Platform::makeArray<unsigned char,14ul>(void *a1)
{
  id v1 = a1;
  if ([v1 length] == (id)14)
  {
    id v2 = [v1 bytes];
    unint64_t v3 = *v2 & 0xFFFFFFFFFFFFFF00;
    uint64_t v4 = *v2;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v3 = 0;
  }

  return v3 | v4;
}

void sub_10000ECEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Platform::makeArray<unsigned char,32ul>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v6 = a1;
  if ([v6 length] == (id)32)
  {
    unint64_t v3 = [v6 bytes];
    long long v4 = v3[1];
    *(_OWORD *)a2 = *v3;
    *(_OWORD *)(a2 + 16) = v4;
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    *(unsigned char *)a2 = 0;
  }
  *(unsigned char *)(a2 + 32) = v5;
}

void sub_10000ED78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id Platform::dynamic_objc_cast<NSArray>(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_10000EDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void Backend::DatabaseUpdate::~DatabaseUpdate(Backend::DatabaseUpdate *this)
{
  unint64_t v3 = (void **)((char *)this + 96);
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v3);
  id v2 = (void *)*((void *)this + 9);
  if (v2)
  {
    *((void *)this + 10) = v2;
    operator delete(v2);
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t Platform::isAppleInternalInstall(void)
{
  if (Platform::isAppleInternalInstall(void)::onceToken != -1) {
    dispatch_once(&Platform::isAppleInternalInstall(void)::onceToken, &__block_literal_global_0);
  }
  return Platform::isAppleInternalInstall(void)::isInternal;
}

void ___ZN8Platform22isAppleInternalInstallEv_block_invoke(id a1)
{
  Platform::isAppleInternalInstall(void)::isInternal = os_variant_allows_internal_security_policies();
}

uint64_t Platform::OutputStream::writeUInt8(Platform::OutputStream *this, char a2)
{
  char v3 = a2;
  return (*(uint64_t (**)(Platform::OutputStream *, char *, uint64_t))(*(void *)this + 24))(this, &v3, 1);
}

uint64_t Platform::OutputStream::writeUInt32(Platform::OutputStream *this, unsigned int a2)
{
  unsigned int v3 = bswap32(a2);
  return (*(uint64_t (**)(Platform::OutputStream *, unsigned int *, uint64_t))(*(void *)this + 24))(this, &v3, 4);
}

uint64_t Platform::OutputStream::writeUInt64(Platform::OutputStream *this, unint64_t a2)
{
  unint64_t v3 = bswap64(a2);
  return (*(uint64_t (**)(Platform::OutputStream *, unint64_t *, uint64_t))(*(void *)this + 24))(this, &v3, 8);
}

unint64_t Platform::OutputStream::getOffset32(Platform::OutputStream *this, unsigned int *a2)
{
  unint64_t v7 = 0;
  uint64_t v3 = (*(uint64_t (**)(Platform::OutputStream *, unint64_t *))(*(void *)this + 32))(this, &v7);
  uint64_t v4 = v3;
  if (v3)
  {
    unsigned int v5 = v3;
  }
  else if (HIDWORD(v7))
  {
    uint64_t v4 = 34;
    std::generic_category();
    unsigned int v5 = 34;
  }
  else
  {
    *a2 = v7;
    std::system_category();
    unsigned int v5 = 0;
  }
  return v4 & 0xFFFFFFFF00000000 | v5;
}

void Backend::Server::start(uint64_t a1, uint64_t a2)
{
  _set_user_dir_suffix();
  if (Backend::Server::shared(void)::onceToken != -1) {
    dispatch_once(&Backend::Server::shared(void)::onceToken, &__block_literal_global_1);
  }
  uint64_t v4 = Backend::Server::shared(void)::server;
  {
    unsigned int v5 = (_xpc_connection_s *)Backend::Server::start(char const*,std::function<NSObject  {objcproto13OS_xpc_object}* ()(char const*)> &&)::globalConnection;
  }
  else
  {
    uint64_t v6 = a1;
    uint64_t v7 = Backend::Server::shared(void)::server;
    std::function<NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::operator()(a2, v6);
    unsigned int v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = v7;
    Backend::Server::start(char const*,std::function<NSObject  {objcproto13OS_xpc_object}* ()(char const*)> &&)::globalConnection = (uint64_t)v5;
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3321888768;
  handler[2] = ___ZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEE_block_invoke;
  handler[3] = &__block_descriptor_40_ea8_32c99_ZTSKZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEE3__0_e33_v16__0__NSObject_OS_xpc_object__8l;
  void handler[4] = v4;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_resume((xpc_connection_t)Backend::Server::start(char const*,std::function<NSObject  {objcproto13OS_xpc_object}* ()(char const*)> &&)::globalConnection);
}

uint64_t Backend::Server::shared(Backend::Server *this)
{
  if (Backend::Server::shared(void)::onceToken != -1) {
    dispatch_once(&Backend::Server::shared(void)::onceToken, &__block_literal_global_1);
  }
  return Backend::Server::shared(void)::server;
}

id std::function<NSObject  {objcproto13OS_xpc_object}* ()(char const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = (*(void (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v7);
    return v3;
  }
  else
  {
    unsigned int v5 = std::__throw_bad_function_call[abi:nn180100]();
    return (id)__copy_helper_block_ea8_32c99_ZTSKZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEE3__0((uint64_t)v5, v6);
  }
}

uint64_t __copy_helper_block_ea8_32c99_ZTSKZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEE3__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void __destroy_helper_block_ea8_32c86_ZTSKZN7Backend6Server19handleNewConnectionEPU24objcproto13OS_xpc_object8NSObjectE3__0(uint64_t a1)
{
}

void Backend::Server::handleConnectionError(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v32 = v5;
  id v31 = a3;
  uint64_t v6 = xpc_copy_description(v31);
  uint64_t v7 = (id)WPOSLogXPC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)v5);
    __int16 v35 = 2080;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Connection from PID[%d] interrupted: %s", buf, 0x12u);
  }

  free(v6);
  id v8 = &Backend::allListTypes;
  do
  {
    uint64_t updated = Backend::Server::incomingDatabaseUpdateMessages(a1, *v8);
    id v10 = *(id **)updated;
    CFStringRef v11 = *(id **)(updated + 8);
    if (*(id **)updated == v11) {
      goto LABEL_10;
    }
    while (1)
    {
      id v12 = *v10;
      if (xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary) {
        break;
      }

LABEL_8:
      if (++v10 == v11)
      {
        id v10 = v11;
        goto LABEL_10;
      }
    }
    xpc_dictionary_get_remote_connection(v12);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v14 = v13 == v32;

    if (!v14) {
      goto LABEL_8;
    }
    if (v10 != v11)
    {
      for (uint64_t i = v10 + 1; i != v11; ++i)
      {
        id v16 = *i;
        if (xpc_get_type(v16) == (xpc_type_t)&_xpc_type_dictionary)
        {
          xpc_dictionary_get_remote_connection(v16);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v18 = v17 == v32;

          if (v18) {
            continue;
          }
        }
        else
        {
        }
        id v19 = *i;
        *uint64_t i = 0;
        id v20 = *v10;
        *id v10 = v19;

        ++v10;
      }
    }
LABEL_10:
    std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::erase(updated, v10, *(void ***)(updated + 8));
    ++v8;
  }
  while (v8 != (char *)&GCC_except_table4);
  for (j = *(void **)(a1 + 24); j; j = (void *)*j)
  {
    unint64_t v22 = j[4];
    if ((unint64_t)v32 >= v22)
    {
      if (v22 >= (unint64_t)v32)
      {
        std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__erase_unique<NSObject  {objcproto13OS_xpc_object}* {__strong}>(a1 + 16, (unint64_t *)&v32);
        goto LABEL_28;
      }
      ++j;
    }
  }
  uint8_t v23 = WPOSLogXPC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    Backend::Server::handleConnectionError(v23, v24, v25, v26, v27, v28, v29, v30);
  }
LABEL_28:
}

void sub_10000F510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void Backend::Server::handleSetServerEndpoint(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int16 v2 = WebPrivacy::XPC::decode<WebPrivacy::XPC::SetServerEndpoint>(v3);
  if (v2 >= 0x100u) {
    Backend::Configuration::setServerEndpoint(v2);
  }
  WebPrivacy::XPC::sendReply<WebPrivacy::XPC::SetServerEndpointReply>(v3);
}

void sub_10000F604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void Backend::Server::handleGetStatus(void *a1, void *a2)
{
  id v3 = a2;
  if ((unsigned __int16)WebPrivacy::XPC::decode<WebPrivacy::XPC::GetStatus>(v3) > 0xFFu)
  {
    id v15 = v3;
    uint64_t v4 = (char *)operator new(0x30uLL);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)uint64_t v4 = off_100018B68;
    *((void *)v4 + 3) = 0;
    *((void *)v4 + 4) = 0;
    *((void *)v4 + 5) = 0;
    std::vector<WebPrivacy::ListStatus>::reserve((char **)v4 + 3, 8uLL);
    id v5 = v3;
    uint64_t v6 = 0;
    uint64_t v7 = a1[6];
    id v17 = (void *)a1[5];
    LOBYTE(v18) = 2;
    uint64_t v19 = v7;
    char v20 = 3;
    uint64_t v8 = a1[8];
    uint64_t v21 = a1[7];
    char v22 = 4;
    uint64_t v23 = v8;
    char v24 = 5;
    uint64_t v9 = a1[10];
    uint64_t v25 = a1[9];
    char v26 = 6;
    uint64_t v27 = v9;
    char v28 = 7;
    uint64_t v10 = a1[12];
    uint64_t v29 = a1[11];
    char v30 = 8;
    uint64_t v31 = v10;
    LOBYTE(__p) = 1;
    do
    {
      CFStringRef v11 = *(NSObject ***)((char *)&__p + v6 + 8);
      char v12 = *((unsigned char *)&__p + v6);
      id v13 = v5;
      atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 1, 1uLL, memory_order_relaxed);
      uint64_t v34 = 0;
      BOOL v14 = operator new(0x38uLL);
      *(void *)BOOL v14 = off_100018BA0;
      v14[8] = v12;
      *((void *)v14 + 2) = v13;
      *((void *)v14 + 3) = a1;
      *((void *)v14 + 4) = v4 + 24;
      *((void *)v14 + 5) = v4;
      *((void *)v14 + 6) = v11;
      uint64_t v34 = v14;
      Backend::DatabaseHandle::getHeader(v11, (uint64_t)v33);
      std::__function::__value_func<void ()(std::optional<Backend::DatabaseHeader> &&)>::~__value_func[abi:nn180100](v33);
      v6 += 16;
    }
    while (v6 != 128);

    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
    id v3 = v15;
  }
  else
  {
    std::string __p = 0;
    id v17 = 0;
    uint64_t v18 = 0;
    memset(v33, 0, sizeof(v33));
    LOBYTE(v32) = 0;
    WebPrivacy::XPC::sendReply<WebPrivacy::XPC::GetStatusReply,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(v3, (uint64_t)&__p, (uint64_t)v33, (unsigned __int8 *)&v32);
    id v32 = (void **)v33;
    std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](&v32);
    if (__p)
    {
      id v17 = __p;
      operator delete(__p);
    }
  }
}

void sub_10000F86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  std::__shared_weak_count::__release_shared[abi:nn180100](v17);

  _Unwind_Resume(a1);
}

void Backend::Server::handleDeleteList(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int16 v4 = WebPrivacy::XPC::decode<WebPrivacy::XPC::DeleteList>(v3);
  if (v4 > 0xFFu)
  {
    id v5 = (NSObject **)Backend::Server::databaseHandle(a1, v4);
    v7[0] = off_100018C30;
    v7[1] = v3;
    void v7[3] = v7;
    Backend::DatabaseHandle::unlink(v5, (uint64_t)v7);
    std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](v7);
  }
  else
  {
    LOBYTE(v7[0]) = 1;
    char v6 = 0;
    WebPrivacy::XPC::sendReply<WebPrivacy::XPC::DeleteListReply,WebPrivacy::MessageError,BOOL>(v3, (unsigned __int8 *)v7, &v6);
  }
}

void sub_10000F9C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void ___ZN7Backend6Server6sharedEv_block_invoke(id a1)
{
}

void sub_10000FA38()
{
}

Backend::Server *Backend::Server::Server(Backend::Server *this)
{
  id v2 = &_dispatch_main_q;
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.webprivacyd", 0);
  *((void *)this + 3) = 0;
  *(void *)this = v3;
  *((void *)this + 1) = &_dispatch_main_q;
  *((void *)this + 2) = (char *)this + 24;
  *((void *)this + 4) = 0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 39) = 0;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  Backend::Server::initialize((void **)this);
  return this;
}

void sub_10000FB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _Unwind_Exception *exception_object, uint64_t a18)
{
  a18 = v18 + 296;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 272;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 248;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 224;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 200;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 176;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 152;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 128;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  a18 = v18 + 104;
  std::vector<std::unique_ptr<Backend::ListUpdateFetcher>>::__destroy_vector::operator()[abi:nn180100]((void ***)&a18);
  uint64_t v28 = *(void *)(v18 + 96);
  *(void *)(v18 + 96) = 0;
  if (v28) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100](v22, v28);
  }
  uint64_t v29 = *v27;
  *uint64_t v27 = 0;
  if (v29) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100]((uint64_t)v27, v29);
  }
  uint64_t v30 = *v26;
  uint64_t *v26 = 0;
  if (v30) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100]((uint64_t)v26, v30);
  }
  uint64_t v31 = *v25;
  uint64_t *v25 = 0;
  if (v31) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100]((uint64_t)v25, v31);
  }
  uint64_t v32 = *v24;
  uint64_t *v24 = 0;
  if (v32) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100]((uint64_t)v24, v32);
  }
  uint64_t v33 = *v23;
  *uint64_t v23 = 0;
  if (v33) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100]((uint64_t)v23, v33);
  }
  uint64_t v34 = *v21;
  uint64_t *v21 = 0;
  if (v34) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100]((uint64_t)v21, v34);
  }
  uint64_t v35 = *v20;
  *char v20 = 0;
  if (v35) {
    std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100]((uint64_t)v20, v35);
  }
  std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::destroy(v19, *(void **)(v18 + 24));
  Platform::WorkDispatcher::~WorkDispatcher((id *)v18);
  _Unwind_Resume(a1);
}

void Backend::Server::initialize(void **this)
{
  Platform::getUserCacheDirectory();
  if (v8)
  {
    if (v8 != 1)
    {
      std::__throw_bad_variant_access[abi:nn180100]();
      __break(1u);
      return;
    }
    id v2 = (id)WPOSLogServer();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      std::error_code::message(&v6, &v7);
      Backend::Server::initialize();
    }
  }
  else
  {
    std::string::basic_string[abi:nn180100]<0>(__p, "com.apple.WebPrivacy");
    Platform::stringByAppendingPathComponent();
    if (v11 < 0) {
      operator delete(*(void **)__p);
    }
    for (uint64_t i = 0; i != 8; ++i)
      Backend::Server::initializeDatabaseManager(this, (uint64_t)&v6, Backend::allListTypes[i]);
    unsigned __int16 v4 = WPOSLogServer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = &v6;
      if ((v6.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v5 = (std::string *)v6.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string __p = 136380675;
      *(void *)&__p[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Initialized databases: %{private}s", __p, 0xCu);
    }
    if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v6.__r_.__value_.__l.__data_);
    }
  }
  if (v8 != -1) {
    ((void (*)(char *, std::error_code *))off_100018A28[v8])(&v9, &v7);
  }
}

void sub_10000FE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  char v26 = v25;

  if (a18 != -1) {
    ((void (*)(void **, char *))off_100018A28[a18])(&__p, &a15);
  }
  _Unwind_Resume(a1);
}

void Backend::Server::initializeDatabaseManager(void **a1, uint64_t a2, int a3)
{
  *(void *)&__p.__val_ = Platform::createDirectoryWithIntermediateDirectories();
  __p.__cat_ = v5;
  if (__p.__val_)
  {
    std::string v6 = (id)WPOSLogServer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      std::error_code::message(&v11, &__p);
      Backend::Server::initializeDatabaseManager();
    }
  }
  else
  {
    int v7 = a3 - 1;
    if ((a3 - 1) > 7u) {
      int v8 = @"Invalid";
    }
    else {
      int v8 = *(&off_100018C68 + (char)v7);
    }
    std::string v6 = [(__CFString *)v8 stringByAppendingPathExtension:@"wplist", *(void *)&__p.__val_, __p.__cat_];
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)[v6 cStringUsingEncoding:4]);
    Platform::stringByAppendingPathComponent();
    if (v10 < 0) {
      operator delete(*(void **)&__p.__val_);
    }
    switch(v7)
    {
      case 0:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      case 1:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      case 2:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      case 3:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      case 4:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      case 5:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      case 6:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      case 7:
        Backend::DatabaseHandle::create((uint64_t)&v11, *a1);
      default:
        if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v11.__r_.__value_.__l.__data_);
        }
        break;
    }
  }
}

void sub_10001013C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void Backend::DatabaseHandle::create(uint64_t a1, void *a2)
{
}

void sub_100010244(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::XPC::SetServerEndpoint>(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned __int8 v6 = 0;
    unsigned __int16 v4 = xpc_dictionary_get_array(v1, "args");
    int v2 = WebPrivacy::XPC::Message<(MessageName)0,WebPrivacy::ServerEndpoint>::decode(&v6, v4);

    if (v2) {
      unsigned __int8 v3 = v6;
    }
    else {
      unsigned __int8 v3 = 0;
    }
  }
  else
  {
    int v2 = 0;
    unsigned __int8 v3 = 0;
  }

  return v3 | (v2 << 8);
}

void sub_100010334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::SetServerEndpointReply>(void *a1)
{
  id v3 = a1;
  xpc_dictionary_get_remote_connection(v3);
  id v1 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  int v2 = WebPrivacy::XPC::serializeReply<(MessageName)1>(v3);
  xpc_connection_send_message(v1, v2);
}

void sub_1000103C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v12 = v11;

  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::XPC::GetStatus>(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v3 = xpc_dictionary_get_array(v1, "args");
    int v2 = xpc_array_get_count(v3) == 0;
  }
  else
  {
    int v2 = 0;
  }

  return (v2 << 8);
}

void sub_10001046C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::GetStatusReply,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(void *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  id v9 = a1;
  xpc_dictionary_get_remote_connection(v9);
  int v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  int v8 = WebPrivacy::XPC::serializeReply<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(v9, a2, a3, a4);
  xpc_connection_send_message(v7, v8);
}

void sub_10001051C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<WebPrivacy::ListStatus>::reserve(char **a1, unint64_t a2)
{
  unsigned __int16 v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 4) < a2)
  {
    if (a2 >= 0x555555555555556) {
      abort();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    unsigned __int8 v6 = (char *)std::allocator<WebPrivacy::ListStatus>::allocate_at_least[abi:nn180100](result, a2);
    id v9 = *a1;
    unint64_t v8 = (unint64_t)a1[1];
    if ((char *)v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64(v8);
      char v10 = &v6[v5];
    }
    else
    {
      char v10 = &v6[v5];
      do
      {
        *((_OWORD *)v10 - 3) = *(_OWORD *)(v8 - 48);
        long long v11 = *(_OWORD *)(v8 - 32);
        *((void *)v10 - 2) = *(void *)(v8 - 16);
        *((_OWORD *)v10 - 2) = v11;
        *(void *)(v8 - 24) = 0;
        *(void *)(v8 - 16) = 0;
        *(void *)(v8 - 32) = 0;
        *((void *)v10 - 1) = *(void *)(v8 - 8);
        v10 -= 48;
        v8 -= 48;
      }
      while ((char *)v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5];
    int64x2_t v15 = v12;
    id v13 = a1[2];
    a1[2] = &v6[48 * v7];
    id v16 = v13;
    uint64_t v14 = v12.i64[0];
    return std::__split_buffer<WebPrivacy::ListStatus>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

uint64_t Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1::~$_1(uint64_t a1)
{
  int v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }

  return a1;
}

uint64_t WebPrivacy::XPC::decode<WebPrivacy::XPC::DeleteList>(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned __int8 v6 = 0;
    unsigned __int16 v4 = xpc_dictionary_get_array(v1, "args");
    int v2 = WebPrivacy::XPC::Message<(MessageName)8,Backend::RemoteList>::decode(&v6, v4);

    if (v2) {
      unsigned __int8 v3 = v6;
    }
    else {
      unsigned __int8 v3 = 0;
    }
  }
  else
  {
    int v2 = 0;
    unsigned __int8 v3 = 0;
  }

  return v3 | (v2 << 8);
}

void sub_100010718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::DeleteListReply,WebPrivacy::MessageError,BOOL>(void *a1, unsigned __int8 *a2, unsigned char *a3)
{
  id v7 = a1;
  xpc_dictionary_get_remote_connection(v7);
  uint64_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v6 = WebPrivacy::XPC::serializeReply<(MessageName)9,WebPrivacy::MessageError,BOOL>(v7, a2, a3);
  xpc_connection_send_message(v5, v6);
}

void sub_1000107C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int64x2_t v12 = v11;

  _Unwind_Resume(a1);
}

void ___ZZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_ENKUlvE0_cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
}

id __copy_helper_block_ea8_32c115_ZTSKZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_EUlvE0_(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = v5;
  return result;
}

void __destroy_helper_block_ea8_32c115_ZTSKZZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEEENK3__0clES7_EUlvE0_(uint64_t a1)
{
}

void std::vector<std::unique_ptr<Backend::ListUpdateFetcher>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  id v1 = *a1;
  int v2 = (Backend::ListUpdateFetcher **)**a1;
  if (v2)
  {
    unsigned __int16 v4 = (Backend::ListUpdateFetcher **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<Backend::ListUpdateFetcher>::reset[abi:nn180100](--v4, 0);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

Backend::ListUpdateFetcher *std::unique_ptr<Backend::ListUpdateFetcher>::reset[abi:nn180100](Backend::ListUpdateFetcher **a1, Backend::ListUpdateFetcher *a2)
{
  id result = *a1;
  *a1 = a2;
  if (result)
  {
    Backend::ListUpdateFetcher::~ListUpdateFetcher(result);
    operator delete();
  }
  return result;
}

void std::default_delete<Backend::DatabaseHandle>::operator()[abi:nn180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::mutex::~mutex((std::mutex *)(a2 + 80));
    unsigned __int8 v3 = *(std::__shared_weak_count **)(a2 + 72);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v3);
    }
    if (*(char *)(a2 + 63) < 0) {
      operator delete(*(void **)(a2 + 40));
    }
    if (*(char *)(a2 + 39) < 0) {
      operator delete(*(void **)(a2 + 16));
    }

    operator delete();
  }
}

uint64_t std::__throw_bad_variant_access[abi:nn180100]()
{
  return _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8nn180100IOZNS0_6__dtorINS0_8__traitsIJNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10error_codeEEEELNS0_6_TraitE1EE9__destroyB8nn180100EvEUlRT_E_JRNS0_6__baseILSG_1EJSD_SE_EEEEEEDcSI_DpT0_();
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8nn180100IOZNS0_6__dtorINS0_8__traitsIJNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10error_codeEEEELNS0_6_TraitE1EE9__destroyB8nn180100EvEUlRT_E_JRNS0_6__baseILSG_1EJSD_SE_EEEEEEDcSI_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

void std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    std::vector<WebPrivacy::ListStatus>::__clear[abi:nn180100]((uint64_t *)v2);
    unsigned __int8 v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<WebPrivacy::ListStatus>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 48)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

void *std::allocator<WebPrivacy::ListStatus>::allocate_at_least[abi:nn180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__split_buffer<WebPrivacy::ListStatus>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<WebPrivacy::ListStatus>::__destruct_at_end[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 48;
      *(void *)(a1 + 16) = v2 - 48;
      if (*(char *)(v2 - 9) < 0)
      {
        operator delete(*(void **)(v2 - 32));
        uint64_t v5 = *(void *)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void **std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::erase(uint64_t a1, void **a2, void **a3)
{
  if (a2 != a3)
  {
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,NSObject  {objcproto13OS_xpc_object}* {__strong}*,NSObject  {objcproto13OS_xpc_object}* {__strong}*,NSObject  {objcproto13OS_xpc_object}* {__strong}*,0>(a3, *(void ***)(a1 + 8), a2);
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        unint64_t v8 = *(void **)(v7 - 8);
        v7 -= 8;
      }
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

void **std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,NSObject  {objcproto13OS_xpc_object}* {__strong}*,NSObject  {objcproto13OS_xpc_object}* {__strong}*,NSObject  {objcproto13OS_xpc_object}* {__strong}*,0>(void **a1, void **a2, void **a3)
{
  unsigned __int16 v4 = a1;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = *v4;
      *v4++ = 0;
      uint64_t v7 = *a3;
      *a3++ = v6;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

uint64_t std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__erase_unique<NSObject  {objcproto13OS_xpc_object}* {__strong}>(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (v6) {
      uint64_t v4 = (uint64_t)v2;
    }
    uint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(void *)(v4 + 32)) {
    return 0;
  }
  std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::erase((uint64_t **)a1, v4);
  return 1;
}

uint64_t *std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::erase(uint64_t **a1, uint64_t a2)
{
  unint64_t v3 = std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__remove_node_pointer(a1, (uint64_t *)a2);

  operator delete((void *)a2);
  return v3;
}

uint64_t *std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      id result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      id result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      id v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *id v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        id result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    int64x2_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      id v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        id v16 = v7;
      }
      else
      {
        int64x2_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      char v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    id v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      id result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  char v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    char v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *char v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  char v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::destroy(a1, *a2);
    std::__tree<NSObject  {objcproto13OS_xpc_object}* {__strong}>::destroy(a1, a2[1]);

    operator delete(a2);
  }
}

uint64_t WebPrivacy::XPC::Message<(MessageName)0,WebPrivacy::ServerEndpoint>::decode(unsigned __int8 *a1, void *a2)
{
  id v3 = a2;
  if (xpc_array_get_count(v3) == 1) {
    uint64_t v4 = WebPrivacy::XPC::Message<(MessageName)0,WebPrivacy::ServerEndpoint>::decodeOne<0u>(a1, v3);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_100011168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t WebPrivacy::XPC::Message<(MessageName)0,WebPrivacy::ServerEndpoint>::decodeOne<0u>(unsigned __int8 *a1, void *a2)
{
  id v3 = a2;
  if (!xpc_array_get_count(v3))
  {

LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = xpc_array_get_value(v3, 0);
  xpc_type_t type = xpc_get_type(v4);

  if (type != (xpc_type_t)&_xpc_type_uint64) {
    goto LABEL_6;
  }
  unsigned __int8 uint64 = xpc_array_get_uint64(v3, 0);
  if (uint64 >= 4u) {
    goto LABEL_6;
  }
  *a1 = uint64;
  uint64_t v7 = 1;
LABEL_7:

  return v7;
}

void sub_10001122C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WebPrivacy::XPC::serializeReply<(MessageName)1>(void *a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_uint64(reply, "msg", 1uLL);

  return reply;
}

void sub_1000112A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::~__func(uint64_t a1)
{
  *(void *)a1 = off_100018A48;
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  return a1;
}

void std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::~__func(uint64_t a1)
{
  *(void *)a1 = off_100018A48;
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }

  operator delete();
}

void std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_100018A48;
  uint64_t v2 = *(void *)(a1 + 8);
  *(_WORD *)(a2 + 16) = *(_WORD *)(a1 + 16);
  *(void *)(a2 + 8) = v2;
  id v3 = (std::string *)(a2 + 24);
  if (*(char *)(a1 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)(a1 + 24), *(void *)(a1 + 32));
  }
  else
  {
    long long v4 = *(_OWORD *)(a1 + 24);
    *(void *)(a2 + 40) = *(void *)(a1 + 40);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
}

void std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::destroy(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
}

void Backend::ListUpdateFetcher::create(void *a1)
{
}

void sub_100011464(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

uint64_t std::__split_buffer<std::unique_ptr<Backend::ListUpdateFetcher>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<Backend::ListUpdateFetcher>::reset[abi:nn180100]((Backend::ListUpdateFetcher **)(i - 8), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void _ZNSt3__110__function6__funcIZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS2_18ListUpdateResponseEEED0Ev()
{
}

__n128 _ZNKSt3__110__function6__funcIZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS2_18ListUpdateResponseEEE7__cloneEv(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = off_100018A90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS2_18ListUpdateResponseEEE7__cloneEPNS0_6__baseISK_EE(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_100018A90;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void _ZNSt3__110__function6__funcIZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS2_18ListUpdateResponseEEEclESJ_(uint64_t a1, Backend::ListUpdateResponse *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  int v5 = *(Backend::ListUpdateFetcher ***)(v4 + 104);
  BOOL v6 = *(Backend::ListUpdateFetcher ***)(v4 + 112);
  if (v5 == v6)
  {
    BOOL v6 = *(Backend::ListUpdateFetcher ***)(v4 + 104);
  }
  else
  {
    while (*(Backend::ListUpdateFetcher **)(a1 + 24) != *v5)
    {
      if (++v5 == v6)
      {
        int v5 = *(Backend::ListUpdateFetcher ***)(v4 + 112);
        goto LABEL_12;
      }
    }
    if (v5 != v6)
    {
      uint64_t v7 = v5 + 1;
      if (v5 + 1 != v6)
      {
        do
        {
          int v8 = *v7;
          if (*(Backend::ListUpdateFetcher **)(a1 + 24) != *v7)
          {
            *uint64_t v7 = 0;
            std::unique_ptr<Backend::ListUpdateFetcher>::reset[abi:nn180100](v5++, v8);
          }
          ++v7;
        }
        while (v7 != v6);
        BOOL v6 = *(Backend::ListUpdateFetcher ***)(v4 + 112);
      }
    }
  }
LABEL_12:
  std::vector<std::unique_ptr<Backend::ListUpdateFetcher>>::erase(v4 + 104, v5, v6);
  int v9 = *(unsigned __int8 *)(a1 + 16);
  if (*((unsigned char *)a2 + 128))
  {
    uint64_t v10 = (dispatch_queue_t *)Backend::Server::databaseHandle(v4, v9);
    Backend::ListUpdateResponse::takeUpdate(a2, (uint64_t)&v22);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 16);
    uint64_t v18 = (id **)off_100018AD8;
    uint64_t v19 = v4;
    uint64_t v20 = v11;
    BOOL v21 = (void ***)&v18;
    Backend::DatabaseHandle::apply(v10, (uint64_t)&v22, (uint64_t)&v18);
    std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](&v18);
    uint64_t v18 = (id **)&v26;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v18);
    if (__p)
    {
      uint64_t v25 = __p;
      operator delete(__p);
    }
  }
  else
  {
    uint64_t updated = Backend::Server::incomingDatabaseUpdateMessages(v4, v9);
    id v13 = WPOSLogServer();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      _ZNSt3__110__function6__funcIZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS2_18ListUpdateResponseEEEclESJ__cold_1();
    }
    uint64_t v22 = *(id **)updated;
    uint64_t v14 = v22;
    long long v23 = *(_OWORD *)(updated + 8);
    id v16 = (id *)v23;
    *(void *)(updated + 8) = 0;
    *(void *)(updated + 16) = 0;
    *(void *)uint64_t updated = 0;
    std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__vdeallocate((void **)updated);
    *(void *)uint64_t updated = 0;
    *(void *)(updated + 8) = 0;
    *(void *)(updated + 16) = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v17 = (void ***)&v18;
    std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v17);
    for (; v14 != v16; ++v14)
    {
      id v15 = *v14;
      LOBYTE(v18) = 2;
      WebPrivacy::XPC::sendReply<WebPrivacy::XPC::UpdateListReply,WebPrivacy::MessageError>(v15, (unsigned __int8 *)&v18);
    }
    uint64_t v18 = &v22;
    std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v18);
    Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::lastFailedDownloadTime = Platform::secondsSince1970InGMT();
  }
}

void sub_1000117EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  std::__function::__value_func<void ()(BOOL)>::~__value_func[abi:nn180100](&a13);
  a13 = v27 + 96;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&a13);
  if (__p)
  {
    a27 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void Backend::ListUpdateResponse::takeUpdate(Backend::ListUpdateResponse *this@<X0>, uint64_t a2@<X8>)
{
  if (!*((unsigned char *)this + 128)) {
    Backend::ListUpdateResponse::takeUpdate();
  }
  *((unsigned char *)this + 128) = 0;
  uint64_t v2 = (char *)this + 8;
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  *(_OWORD *)std::error_code __p = 0u;
  memset(v4, 0, sizeof(v4));
  Backend::DatabaseUpdate::DatabaseUpdate(a2, (char *)this + 8);
  Backend::DatabaseUpdate::operator=((uint64_t)v2, (uint64_t)v4);
  uint64_t v3 = (void **)&v7;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v3);
  if (__p[1])
  {
    *(void **)&long long v6 = __p[1];
    operator delete(__p[1]);
  }
}

void sub_10001190C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  Backend::DatabaseUpdate::~DatabaseUpdate(v11);
  Backend::DatabaseUpdate::~DatabaseUpdate((Backend::DatabaseUpdate *)&a11);
  _Unwind_Resume(a1);
}

Backend::ListUpdateFetcher **std::vector<std::unique_ptr<Backend::ListUpdateFetcher>>::erase(uint64_t a1, Backend::ListUpdateFetcher **a2, Backend::ListUpdateFetcher **a3)
{
  if (a2 != a3)
  {
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::unique_ptr<Backend::ListUpdateFetcher> *,std::unique_ptr<Backend::ListUpdateFetcher> *,std::unique_ptr<Backend::ListUpdateFetcher> *,0>(a3, *(Backend::ListUpdateFetcher ***)(a1 + 8), a2);
    long long v6 = v5;
    long long v7 = *(Backend::ListUpdateFetcher ***)(a1 + 8);
    if (v7 != v5)
    {
      do
        std::unique_ptr<Backend::ListUpdateFetcher>::reset[abi:nn180100](--v7, 0);
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

Backend::ListUpdateFetcher **std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::unique_ptr<Backend::ListUpdateFetcher> *,std::unique_ptr<Backend::ListUpdateFetcher> *,std::unique_ptr<Backend::ListUpdateFetcher> *,0>(Backend::ListUpdateFetcher **a1, Backend::ListUpdateFetcher **a2, Backend::ListUpdateFetcher **a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      long long v6 = *v4;
      *v4++ = 0;
      std::unique_ptr<Backend::ListUpdateFetcher>::reset[abi:nn180100](a3++, v6);
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void _ZNSt3__110__function6__funcIZZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_ENKUlSE_E_clINS2_18ListUpdateResponseEEESC_SE_EUlbE_NS_9allocatorISI_EEFvbEED0Ev()
{
}

__n128 _ZNKSt3__110__function6__funcIZZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_ENKUlSE_E_clINS2_18ListUpdateResponseEEESC_SE_EUlbE_NS_9allocatorISI_EEFvbEE7__cloneEv(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = off_100018AD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_ENKUlSE_E_clINS2_18ListUpdateResponseEEESC_SE_EUlbE_NS_9allocatorISI_EEFvbEE7__cloneEPNS0_6__baseISL_EE(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_100018AD8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void _ZNSt3__110__function6__funcIZZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_ENKUlSE_E_clINS2_18ListUpdateResponseEEESC_SE_EUlbE_NS_9allocatorISI_EEFvbEEclEOb(uint64_t a1, unsigned char *a2)
{
  int v2 = *a2;
  uint64_t v3 = *(void *)(a1 + 8);
  if (*a2) {
    unsigned __int8 v4 = 0;
  }
  else {
    unsigned __int8 v4 = 3;
  }
  unsigned __int8 v13 = v4;
  uint64_t updated = Backend::Server::incomingDatabaseUpdateMessages(v3, *(unsigned __int8 *)(a1 + 16));
  long long v6 = WPOSLogServer();
  long long v7 = v6;
  if (v2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = (uint64_t)(*(void *)(updated + 8) - *(void *)updated) >> 3;
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Replying to %zu update message(s)", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    _ZNSt3__110__function6__funcIZZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_ENKUlSE_E_clINS2_18ListUpdateResponseEEESC_SE_EUlbE_NS_9allocatorISI_EEFvbEEclEOb_cold_1();
  }
  int v9 = *(id **)updated;
  *(void *)buf = *(void *)updated;
  *(_OWORD *)&uint8_t buf[8] = *(_OWORD *)(updated + 8);
  uint64_t v11 = *(id **)&buf[8];
  *(void *)(updated + 8) = 0;
  *(void *)(updated + 16) = 0;
  *(void *)uint64_t updated = 0;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__vdeallocate((void **)updated);
  *(void *)uint64_t updated = 0;
  *(void *)(updated + 8) = 0;
  *(void *)(updated + 16) = 0;
  memset(v12, 0, sizeof(v12));
  uint64_t v14 = v12;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100]((void ***)&v14);
  while (v9 != v11)
  {
    id v10 = *v9;
    WebPrivacy::XPC::sendReply<WebPrivacy::XPC::UpdateListReply,WebPrivacy::MessageError &>(v10, &v13);

    ++v9;
  }
  v12[0] = (void **)buf;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100](v12);
}

void sub_100011C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  a12 = (void **)&a17;
  std::vector<NSObject  {objcproto13OS_xpc_object}* {__strong}>::__destroy_vector::operator()[abi:nn180100](&a12);
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::UpdateListReply,WebPrivacy::MessageError &>(void *a1, unsigned __int8 *a2)
{
  id v5 = a1;
  xpc_dictionary_get_remote_connection(v5);
  uint64_t v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v4 = WebPrivacy::XPC::serializeReply<(MessageName)5,WebPrivacy::MessageError>(v5, a2);
  xpc_connection_send_message(v3, v4);
}

void sub_100011CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::shared_ptr<Platform::SharedMemory> &&)>::~__func(uint64_t a1)
{
  operator delete();
}

void *std::__function::__func<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::shared_ptr<Platform::SharedMemory> &&)>::__clone(uint64_t a1)
{
  int v2 = operator new(0x10uLL);
  *int v2 = off_100018B20;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

void std::__function::__func<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleGetList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::shared_ptr<Platform::SharedMemory> &&)>::destroy_deallocate(id *a1)
{
  operator delete(a1);
}

id WebPrivacy::XPC::serializeReply<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(void *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_uint64(reply, "msg", 3uLL);
  v13[1] = a2;
  xpc_object_t value = xpc_array_create_empty();
  v13[0] = &value;
  WebPrivacy::XPC::serializeReply<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(NSObject  {objcproto13OS_xpc_object}*,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint &&)::{lambda(void)#3}::operator()((uint64_t)v13);
  v12[0] = &value;
  v12[1] = a3;
  WebPrivacy::XPC::serializeReply<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(NSObject  {objcproto13OS_xpc_object}*,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint &&)::{lambda(void)#2}::operator()((uint64_t)v12);
  uint64_t v8 = *a4;
  xpc_object_t v9 = value;
  xpc_object_t v10 = xpc_uint64_create(v8);
  xpc_array_append_value(v9, v10);

  xpc_dictionary_set_value(reply, "args", value);

  return reply;
}

void sub_100011ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::serializeReply<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(NSObject  {objcproto13OS_xpc_object}*,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint &&)::{lambda(void)#3}::operator()(uint64_t a1)
{
  id v1 = *(int ***)(a1 + 8);
  xpc_object_t xarray = **(id **)a1;
  xpc_object_t empty = xpc_array_create_empty();
  xpc_object_t v3 = xpc_uint64_create(v1[1] - *v1);
  xpc_array_append_value(empty, v3);

  unsigned __int8 v4 = *v1;
  id v5 = v1[1];
  while (v4 != v5)
  {
    int64_t v6 = *v4;
    id v7 = empty;
    xpc_object_t v8 = xpc_int64_create(v6);
    xpc_array_append_value(v7, v8);

    ++v4;
  }
  xpc_array_append_value(xarray, empty);
}

void sub_100011FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void WebPrivacy::XPC::serializeReply<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(NSObject  {objcproto13OS_xpc_object}*,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint &&)::{lambda(void)#2}::operator()(uint64_t a1)
{
  id v1 = *(unsigned __int8 ***)(a1 + 8);
  xpc_object_t xarray = **(id **)a1;
  xpc_object_t empty = xpc_array_create_empty();
  xpc_object_t v3 = xpc_uint64_create(0xAAAAAAAAAAAAAAABLL * ((v1[1] - *v1) >> 4));
  xpc_array_append_value(empty, v3);

  unsigned __int8 v4 = *v1;
  id v5 = v1[1];
  while (v4 != v5)
  {
    id v6 = empty;
    xpc_object_t v7 = xpc_array_create_empty();
    uint64_t v8 = *v4;
    id v9 = v7;
    xpc_object_t v10 = xpc_uint64_create(v8);
    xpc_array_append_value(v9, v10);

    uint64_t v11 = *((void *)v4 + 1);
    id v12 = v9;
    xpc_object_t v13 = xpc_uint64_create(v11);
    xpc_array_append_value(v12, v13);

    id v14 = v12;
    uint64_t v17 = (const char *)*((void *)v4 + 2);
    id v16 = v4 + 16;
    id v15 = v17;
    if ((v16[23] & 0x80u) == 0) {
      uint64_t v18 = (const char *)v16;
    }
    else {
      uint64_t v18 = v15;
    }
    xpc_object_t v19 = xpc_string_create(v18);
    xpc_array_append_value(v14, v19);

    double v20 = *((double *)v16 + 3);
    id v21 = v14;
    xpc_object_t v22 = xpc_double_create(v20);
    xpc_array_append_value(v21, v22);

    xpc_array_append_value(v6, v21);
    unsigned __int8 v4 = v16 + 32;
  }
  xpc_array_append_value(xarray, empty);
}

void sub_1000121C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::vector<WebPrivacy::ListStatus>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100018B68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<WebPrivacy::ListStatus>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100018B68;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

void std::__shared_ptr_emplace<std::vector<WebPrivacy::ListStatus>>::__on_zero_shared(uint64_t a1)
{
  id v1 = (void **)(a1 + 24);
  std::vector<WebPrivacy::ListStatus>::__destroy_vector::operator()[abi:nn180100](&v1);
}

uint64_t std::__function::__func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::~__func(uint64_t a1)
{
  *(void *)a1 = off_100018BA0;
  int v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }

  return a1;
}

void std::__function::__func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::~__func(uint64_t a1)
{
  *(void *)a1 = off_100018BA0;
  int v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }

  operator delete();
}

void *std::__function::__func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::__clone(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  int v2 = operator new(0x38uLL);
  *int v2 = off_100018BA0;
  std::__compressed_pair_elem<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,0,false>::__compressed_pair_elem[abi:nn180100]<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1 const&,0ul>((uint64_t)(v2 + 1), v1);
  return v2;
}

uint64_t std::__function::__func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = off_100018BA0;
  return std::__compressed_pair_elem<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,0,false>::__compressed_pair_elem[abi:nn180100]<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1 const&,0ul>((uint64_t)(a2 + 1), a1 + 8);
}

void std::__function::__func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::destroy(uint64_t a1)
{
}

void std::__function::__func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::destroy_deallocate(void *a1)
{
  std::__function::__alloc_func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::destroy[abi:nn180100]((uint64_t)a1 + 8);

  operator delete(a1);
}

void std::__function::__func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::operator()(uint64_t a1, __int16 *a2)
{
  if (*((unsigned char *)a2 + 72))
  {
    unsigned __int8 v4 = *(NSObject ***)(a1 + 48);
    char v5 = *(unsigned char *)(a1 + 8);
    id v6 = *(id *)(a1 + 16);
    long long v12 = *(_OWORD *)(a1 + 24);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    __int16 v8 = *a2;
    uint64_t v9 = *((void *)a2 + 6);
    id v15 = 0;
    xpc_object_t v10 = (char *)operator new(0x78uLL);
    *(void *)xpc_object_t v10 = off_100018BE8;
    v10[8] = v5;
    *((void *)v10 + 2) = v6;
    *(_OWORD *)(v10 + 24) = v12;
    *((void *)v10 + 5) = v7;
    *((_WORD *)v10 + 24) = v8;
    *(_OWORD *)(v10 + 50) = *(_OWORD *)(a2 + 1);
    *(_OWORD *)(v10 + 66) = *(_OWORD *)(a2 + 9);
    *(void *)(v10 + 82) = *(void *)(a2 + 17);
    *((void *)v10 + 11) = *((void *)a2 + 5);
    *((void *)v10 + 12) = v9;
    *((void *)v10 + 13) = 0;
    *((void *)v10 + 14) = 0;
    id v15 = v10;
    Backend::DatabaseHandle::loadRules(v4, (uint64_t)v13);
    std::__function::__value_func<void ()(std::vector<std::string> &&)>::~__value_func[abi:nn180100](v13);
  }
  else
  {
    uint64_t v11 = *(char ***)(a1 + 32);
    LOBYTE(v13[0]) = *(unsigned char *)(a1 + 8);
    v13[1] = 0;
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)&unk_1000166DE);
    uint64_t v17 = 0;
    std::vector<WebPrivacy::ListStatus>::push_back[abi:nn180100](v11, (uint64_t)v13);
    if (v16 < 0) {
      operator delete(__p);
    }
    Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_0::operator()<std::vector<WebPrivacy::ListStatus>>(a1 + 16, *(void **)(a1 + 32));
  }
}

void sub_1000125F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__compressed_pair_elem<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,0,false>::__compressed_pair_elem[abi:nn180100]<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1 const&,0ul>(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

void std::__function::__alloc_func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::destroy[abi:nn180100](uint64_t a1)
{
  int v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
  xpc_object_t v3 = *(void **)(a1 + 8);
}

uint64_t std::vector<WebPrivacy::ListStatus>::push_back[abi:nn180100](char **a1, uint64_t a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*a1) >> 4);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0x555555555555555) {
      abort();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*a1) >> 4);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v13 = 0x555555555555555;
    }
    else {
      unint64_t v13 = v11;
    }
    uint64_t v27 = result;
    id v14 = (char *)std::allocator<WebPrivacy::ListStatus>::allocate_at_least[abi:nn180100](result, v13);
    char v16 = &v14[48 * v10];
    *(_OWORD *)char v16 = *(_OWORD *)a2;
    long long v17 = *(_OWORD *)(a2 + 16);
    *((void *)v16 + 4) = *(void *)(a2 + 32);
    *((_OWORD *)v16 + 1) = v17;
    *(void *)(a2 + 24) = 0;
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 16) = 0;
    *((void *)v16 + 5) = *(void *)(a2 + 40);
    xpc_object_t v19 = *a1;
    unint64_t v18 = (unint64_t)a1[1];
    if ((char *)v18 == *a1)
    {
      int64x2_t v22 = vdupq_n_s64(v18);
      double v20 = &v14[48 * v10];
    }
    else
    {
      double v20 = &v14[48 * v10];
      do
      {
        *((_OWORD *)v20 - 3) = *(_OWORD *)(v18 - 48);
        long long v21 = *(_OWORD *)(v18 - 32);
        *((void *)v20 - 2) = *(void *)(v18 - 16);
        *((_OWORD *)v20 - 2) = v21;
        *(void *)(v18 - 24) = 0;
        *(void *)(v18 - 16) = 0;
        *(void *)(v18 - 32) = 0;
        *((void *)v20 - 1) = *(void *)(v18 - 8);
        v20 -= 48;
        v18 -= 48;
      }
      while ((char *)v18 != v19);
      int64x2_t v22 = *(int64x2_t *)a1;
    }
    uint64_t v9 = v16 + 48;
    *a1 = v20;
    a1[1] = v16 + 48;
    int64x2_t v25 = v22;
    long long v23 = a1[2];
    a1[2] = &v14[48 * v15];
    uint64_t v26 = v23;
    uint64_t v24 = v22.i64[0];
    uint64_t result = std::__split_buffer<WebPrivacy::ListStatus>::~__split_buffer((uint64_t)&v24);
  }
  else
  {
    *(_OWORD *)unint64_t v7 = *(_OWORD *)a2;
    long long v8 = *(_OWORD *)(a2 + 16);
    *(void *)(v7 + 32) = *(void *)(a2 + 32);
    *(_OWORD *)(v7 + 16) = v8;
    *(void *)(a2 + 24) = 0;
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)(v7 + 40) = *(void *)(a2 + 40);
    uint64_t v9 = (char *)(v7 + 48);
  }
  a1[1] = v9;
  return result;
}

void Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_0::operator()<std::vector<WebPrivacy::ListStatus>>(uint64_t a1, void *a2)
{
  if (a2[1] - *a2 == 384)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    memset(&v22, 0, sizeof(v22));
    std::vector<int>::reserve(&v22, v4[4]);
    unint64_t v6 = (void *)v4[2];
    if (v6 != v4 + 3)
    {
      do
      {
        std::vector<int>::pointer pid = (std::vector<int>::pointer)xpc_connection_get_pid((xpc_connection_t)v6[4]);
        int v7 = (int)pid;
        std::vector<int>::pointer end = v22.__end_;
        if (v22.__end_ >= v22.__end_cap_.__value_)
        {
          std::vector<int>::pointer pid = v22.__begin_;
          int64_t v10 = v22.__end_ - v22.__begin_;
          unint64_t v11 = v10 + 1;
          if ((unint64_t)(v10 + 1) >> 62) {
            abort();
          }
          int64_t v12 = (char *)v22.__end_cap_.__value_ - (char *)v22.__begin_;
          if (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 1 > v11) {
            unint64_t v11 = v12 >> 1;
          }
          if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v13 = v11;
          }
          if (v13)
          {
            id v14 = (char *)std::allocator<unsigned int>::allocate_at_least[abi:nn180100]((uint64_t)&v22.__end_cap_, v13);
            std::vector<int>::pointer pid = v22.__begin_;
            std::vector<int>::pointer end = v22.__end_;
          }
          else
          {
            id v14 = 0;
          }
          uint64_t v15 = (int *)&v14[4 * v10];
          int *v15 = v7;
          uint64_t v9 = v15 + 1;
          while (end != pid)
          {
            int v16 = *--end;
            *--uint64_t v15 = v16;
          }
          v22.__begin_ = v15;
          v22.__end_ = v9;
          v22.__end_cap_.__value_ = (int *)&v14[4 * v13];
          if (pid) {
            operator delete(pid);
          }
        }
        else
        {
          *v22.__end_ = (int)pid;
          uint64_t v9 = end + 1;
        }
        v22.__end_ = v9;
        long long v17 = (void *)v6[1];
        if (v17)
        {
          do
          {
            unint64_t v18 = v17;
            long long v17 = (void *)*v17;
          }
          while (v17);
        }
        else
        {
          do
          {
            unint64_t v18 = (void *)v6[2];
            BOOL v19 = *v18 == (void)v6;
            unint64_t v6 = v18;
          }
          while (!v19);
        }
        unint64_t v6 = v18;
      }
      while (v18 != v4 + 3);
    }
    double v20 = *(void **)a1;
    unsigned __int8 v21 = Backend::Configuration::serverEndpoint((Backend::Configuration *)pid);
    WebPrivacy::XPC::sendReply<WebPrivacy::XPC::GetStatusReply,std::vector<int>,std::vector<WebPrivacy::ListStatus> &,WebPrivacy::ServerEndpoint>(v20, (uint64_t)&v22, (uint64_t)a2, &v21);
    if (v22.__begin_)
    {
      v22.__end_ = v22.__begin_;
      operator delete(v22.__begin_);
    }
  }
}

void sub_100012A28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  xpc_object_t value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62) {
      abort();
    }
    int64_t v5 = (char *)this->__end_ - (char *)this->__begin_;
    unint64_t v6 = (char *)std::allocator<unsigned int>::allocate_at_least[abi:nn180100]((uint64_t)p_end_cap, __n);
    int v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = (int *)&v6[4 * v8];
    std::vector<int>::pointer begin = this->__begin_;
    std::vector<int>::pointer end = this->__end_;
    int64_t v12 = v7;
    if (end != this->__begin_)
    {
      int64_t v12 = v7;
      do
      {
        int v13 = *--end;
        *--int64_t v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::GetStatusReply,std::vector<int>,std::vector<WebPrivacy::ListStatus> &,WebPrivacy::ServerEndpoint>(void *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  id v9 = a1;
  xpc_dictionary_get_remote_connection(v9);
  int v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = WebPrivacy::XPC::serializeReply<(MessageName)3,std::vector<int>,std::vector<WebPrivacy::ListStatus>,WebPrivacy::ServerEndpoint>(v9, a2, a3, a4);
  xpc_connection_send_message(v7, v8);
}

void sub_100012B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t _ZNSt3__110__function6__funcIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENSG_IcEEEENSG_ISN_EEEEEED1Ev(uint64_t a1)
{
  *(void *)a1 = off_100018BE8;
  int v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }

  return a1;
}

void _ZNSt3__110__function6__funcIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENSG_IcEEEENSG_ISN_EEEEEED0Ev(uint64_t a1)
{
  *(void *)a1 = off_100018BE8;
  int v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }

  operator delete();
}

void *_ZNKSt3__110__function6__funcIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENSG_IcEEEENSG_ISN_EEEEEE7__cloneEv(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  int v2 = operator new(0x78uLL);
  *int v2 = off_100018BE8;
  _ZNSt3__122__compressed_pair_elemIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS1_14DatabaseHeaderEEEEEDaOT_EUlSD_E_Li0ELb0EEC2B8nn180100IJRKSE_EJLm0EEEENS_21piecewise_construct_tENS_5tupleIJDpT_EEENS_15__tuple_indicesIJXspT0_EEEE((uint64_t)(v2 + 1), v1);
  return v2;
}

uint64_t _ZNKSt3__110__function6__funcIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENSG_IcEEEENSG_ISN_EEEEEE7__cloneEPNS0_6__baseISR_EE(uint64_t a1, void *a2)
{
  *a2 = off_100018BE8;
  return _ZNSt3__122__compressed_pair_elemIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS1_14DatabaseHeaderEEEEEDaOT_EUlSD_E_Li0ELb0EEC2B8nn180100IJRKSE_EJLm0EEEENS_21piecewise_construct_tENS_5tupleIJDpT_EEENS_15__tuple_indicesIJXspT0_EEEE((uint64_t)(a2 + 1), a1 + 8);
}

void _ZNSt3__110__function6__funcIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENSG_IcEEEENSG_ISN_EEEEEE7destroyEv(uint64_t a1)
{
}

void _ZNSt3__110__function6__funcIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENSG_IcEEEENSG_ISN_EEEEEE18destroy_deallocateEv(void *a1)
{
  std::__function::__alloc_func<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1,std::allocator<Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_1>,void ()(std::optional<Backend::DatabaseHeader> &&)>::destroy[abi:nn180100]((uint64_t)a1 + 8);

  operator delete(a1);
}

void _ZNSt3__110__function6__funcIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS_6vectorINS_12basic_stringIcNS_11char_traitsIcEENSG_IcEEEENSG_ISN_EEEEEEclESQ_(uint64_t a1, void *a2)
{
  xpc_object_t v3 = *(char ***)(a1 + 32);
  v4[0] = *(unsigned char *)(a1 + 8);
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 3);
  Platform::dataToBase64String();
  uint64_t v8 = *(void *)(a1 + 96);
  std::vector<WebPrivacy::ListStatus>::push_back[abi:nn180100](v3, (uint64_t)v4);
  if (v7 < 0) {
    operator delete(__p);
  }
  Backend::Server::handleGetStatus(NSObject  {objcproto13OS_xpc_object}*)::$_0::operator()<std::vector<WebPrivacy::ListStatus>>(a1 + 16, *(void **)(a1 + 32));
}

void sub_100012DD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNSt3__122__compressed_pair_elemIZZN7Backend6Server15handleGetStatusEPU24objcproto13OS_xpc_object8NSObjectENK3__1clINS_8optionalINS1_14DatabaseHeaderEEEEEDaOT_EUlSD_E_Li0ELb0EEC2B8nn180100IJRKSE_EJLm0EEEENS_21piecewise_construct_tENS_5tupleIJDpT_EEENS_15__tuple_indicesIJXspT0_EEEE(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(id *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  long long v5 = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 58) = *(_OWORD *)(a2 + 58);
  *(_OWORD *)(a1 + 42) = v5;
  uint64_t v6 = *(void *)(a2 + 74);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 74) = v6;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  return a1;
}

uint64_t WebPrivacy::XPC::Message<(MessageName)8,Backend::RemoteList>::decode(unsigned char *a1, void *a2)
{
  id v3 = a2;
  if (xpc_array_get_count(v3) == 1) {
    uint64_t v4 = WebPrivacy::XPC::decode(v3, a1);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void sub_100012ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WebPrivacy::XPC::serializeReply<(MessageName)9,WebPrivacy::MessageError,BOOL>(void *a1, unsigned __int8 *a2, unsigned char *a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_uint64(reply, "msg", 9uLL);
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v7 = *a2;
  id v8 = empty;
  xpc_object_t v9 = xpc_uint64_create(v7);
  xpc_array_append_value(v8, v9);

  LOBYTE(a3) = *a3;
  id v10 = v8;
  xpc_object_t v11 = xpc_BOOL_create((BOOL)a3);
  xpc_array_append_value(v10, v11);

  xpc_dictionary_set_value(reply, "args", v10);

  return reply;
}

void sub_100012FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(BOOL)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(BOOL)>::~__func(uint64_t a1)
{
  operator delete();
}

void *std::__function::__func<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(BOOL)>::__clone(uint64_t a1)
{
  int v2 = operator new(0x10uLL);
  *int v2 = off_100018C30;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

id std::__function::__func<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(BOOL)>::__clone(uint64_t a1, void *a2)
{
  *a2 = off_100018C30;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

void std::__function::__func<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(BOOL)>::destroy(uint64_t a1)
{
}

void std::__function::__func<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(BOOL)>::destroy_deallocate(id *a1)
{
  operator delete(a1);
}

void std::__function::__func<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleDeleteList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(BOOL)>::operator()(uint64_t a1, char *a2)
{
  char v4 = *a2;
  int v2 = *(void **)(a1 + 8);
  unsigned __int8 v3 = 0;
  WebPrivacy::XPC::sendReply<WebPrivacy::XPC::DeleteListReply,WebPrivacy::MessageError,BOOL &>(v2, &v3, &v4);
}

void WebPrivacy::XPC::sendReply<WebPrivacy::XPC::DeleteListReply,WebPrivacy::MessageError,BOOL &>(void *a1, unsigned __int8 *a2, unsigned char *a3)
{
  id v7 = a1;
  xpc_dictionary_get_remote_connection(v7);
  long long v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = WebPrivacy::XPC::serializeReply<(MessageName)9,WebPrivacy::MessageError,BOOL>(v7, a2, a3);
  xpc_connection_send_message(v5, v6);
}

void sub_100013224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int64_t v12 = v11;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3(a1, 4.8452e-34, a2, a3);
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to rename temporary database to '%{private}s': %{errno}i", v3, 0x12u);
}

{
  uint8_t *v3;
  os_log_t v4;

  OUTLINED_FUNCTION_3(a1, 4.8452e-34, a2, a3);
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to map new database '%{private}s' into memory: %{errno}i", v3, 0x12u);
}

void Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()()
{
  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to close database: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to write line separator: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to write database header: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to open database for writing: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to apply database update: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to update existing database header (writeBytes): %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to update existing database header (seek): %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  int v7;
  os_log_t v8;
  uint8_t *v9;

  OUTLINED_FUNCTION_0();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  OUTLINED_FUNCTION_2(v2, v6, 4.8149e-34);
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v7, v8, "Failed to update existing database header (open): %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(char *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  if (a1[23] >= 0) {
    char v5 = a1;
  }
  else {
    char v5 = *(char **)a1;
  }
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to write line (%zu bytes): %s", buf, 0x16u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to write line (%zu bytes exceeded size limit)", (uint8_t *)&v2, 0xCu);
}

void Backend::DatabaseHandle::apply(Backend::DatabaseUpdate &&,std::function<void ()(BOOL)> &&)::$_0::operator()(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to apply database update: states match, but hashes are inconsistent", v1, 2u);
}

void Platform::FileOutputStream::close()
{
}

void Platform::FileOutputStream::open()
{
}

void Platform::FileOutputStream::writeBytes()
{
}

void Platform::FileOutputStream::getOffset()
{
}

void Platform::FileOutputStream::seek()
{
}

void Backend::ListUpdateFetcher::fetch(std::function<void ()(Backend::ListUpdateResponse &&)> &&)::$_0::operator()(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ with error: %{public}@", buf, 0x16u);
}

void Backend::ListUpdateResponse::ListUpdateResponse(void *a1, uint64_t a2)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v2 = a1;
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v3, v4, "Response object has unexpected type: %{public}@");
}

{
  id v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v2 = a1;
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v3, v4, "Failed to parse new rule: %{public}@");
}

{
  id v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  id v2 = a1;
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v3, v4, "Failed to parse deletion index: %{public}@");
}

void Backend::ListUpdateResponse::ListUpdateResponse()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Missing key for list state", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to convert list state from Base64 to data.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to parse list platform.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to convert checksum from Base64 to data.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Missing next update duration", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Next update duration specifies an invalid integer.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to parse response type.", v2, v3, v4, v5, v6);
}

void Backend::ListUpdateResponse::ListUpdateResponse(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 14;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set list state (size mismatch: %zu, expected %u).", buf, 0x12u);
}

{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set checksum (size: %zu).", buf, 0xCu);
}

void Backend::ListUpdateResponse::ListUpdateResponse(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to parse %zu bytes as JSON: %{public}@", buf, 0x16u);
}

void ___ZN7Backend6Server5startEPKcONSt3__18functionIFPU24objcproto13OS_xpc_object8NSObjectS2_EEE_block_invoke_cold_1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136380675;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Handled error from client: %{private}s", buf, 0xCu);
}

void Backend::Server::handleConnectionError(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void Backend::Server::incomingDatabaseUpdateMessages()
{
}

void Backend::Server::handleConnectionMessage(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, a1, a3, "Received unexpected message type.", a5, a6, a7, a8, 0);
}

void Backend::Server::handleConnectionMessage(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Received invalid message from client: %llu", (uint8_t *)&v2, 0xCu);
}

void Backend::Server::handleConnectionMessage(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Received unexpected message name: %d", (uint8_t *)v2, 8u);
}

{
  _DWORD v2[2];

  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Incoming message: %{public}d is limited to Apple internal builds.", (uint8_t *)v2, 8u);
}

void Backend::Server::handleUpdateList(char a1, NSObject *a2)
{
  if ((a1 - 1) > 7u) {
    CFStringRef v2 = @"Invalid";
  }
  else {
    CFStringRef v2 = *(&off_100018C68 + (char)(a1 - 1));
  }
  int v3 = 138543362;
  CFStringRef v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Skipped fetch update for %{public}@ (recently failed to download).", (uint8_t *)&v3, 0xCu);
}

void Backend::Server::initialize()
{
  OUTLINED_FUNCTION_0();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to get user cache directory: %{public}s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void Backend::Server::initializeDatabaseManager()
{
  OUTLINED_FUNCTION_0();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136446210;
  *(void *)(v2 + 4) = v8;
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to create database directory: %{public}s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void Backend::Server::databaseHandle()
{
}

void std::__function::__func<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0,std::allocator<Backend::Server::handleUpdateList(NSObject  {objcproto13OS_xpc_object}*)::$_0>,void ()(std::optional<Backend::DatabaseHeader> &&)>::operator()(Backend::ListUpdateFetcher *a1)
{
}

void _ZNSt3__110__function6__funcIZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_EUlSE_E_NS_9allocatorISF_EEFvONS2_18ListUpdateResponseEEEclESJ__cold_1()
{
  OUTLINED_FUNCTION_2_1(__stack_chk_guard);
  int v2 = 134217984;
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Replying to %zu update message(s) (download failure)", (uint8_t *)&v2, 0xCu);
}

void Backend::ListUpdateResponse::takeUpdate()
{
}

void _ZNSt3__110__function6__funcIZZZN7Backend6Server16handleUpdateListEPU24objcproto13OS_xpc_object8NSObjectEN3__0clINS_8optionalINS2_14DatabaseHeaderEEEEEDaOT_ENKUlSE_E_clINS2_18ListUpdateResponseEEESC_SE_EUlbE_NS_9allocatorISI_EEFvbEEclEOb_cold_1()
{
  OUTLINED_FUNCTION_2_1(__stack_chk_guard);
  int v2 = 134218242;
  uint64_t v3 = v0;
  __int16 v4 = 2080;
  uint64_t v5 = "UpdateFailed";
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Replying to %zu update message(s) (error: %s)", (uint8_t *)&v2, 0x16u);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

uint64_t _CFNetworkCopyDefaultUserAgentString()
{
  return __CFNetworkCopyDefaultUserAgentString();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t WPOSLogXPC(void)
{
  return WPOSLogXPC();
}

uint64_t WPOSLogServer(void)
{
  return WPOSLogServer();
}

uint64_t WPOSLogNetwork(void)
{
  return WPOSLogNetwork();
}

uint64_t WPOSLogDatabase(void)
{
  return WPOSLogDatabase();
}

uint64_t WebPrivacy::enumerateListRules()
{
  return WebPrivacy::enumerateListRules();
}

uint64_t Platform::description()
{
  return Platform::description();
}

uint64_t Platform::SharedMemory::map()
{
  return Platform::SharedMemory::map();
}

uint64_t Platform::base64StringToData(NSString *a1)
{
  return Platform::base64StringToData(a1);
}

uint64_t Platform::dataToBase64String(NSData *a1)
{
  return Platform::dataToBase64String(a1);
}

uint64_t Platform::dataToBase64String()
{
  return Platform::dataToBase64String();
}

uint64_t Platform::getUserCacheDirectory(void)
{
  return Platform::getUserCacheDirectory();
}

uint64_t Platform::stringByAppendingPathComponent()
{
  return Platform::stringByAppendingPathComponent();
}

uint64_t Platform::createDirectoryWithIntermediateDirectories()
{
  return Platform::createDirectoryWithIntermediateDirectories();
}

uint64_t Platform::SharedMemory::view(Platform::SharedMemory *this)
{
  return Platform::SharedMemory::view(this);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return std::error_code::message(retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

const std::error_category *std::generic_category(void)
{
  return std::generic_category();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uint64(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
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

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return _xpc_double_create(value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

uint64_t xpc_shmem_create_readonly()
{
  return _xpc_shmem_create_readonly();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}