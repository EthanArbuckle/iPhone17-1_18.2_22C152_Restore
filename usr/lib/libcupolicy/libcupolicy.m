void __destroy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___ZN25CellularUsagePolicyClient5startEv_block_invoke(uint64_t a1)
{
}

uint64_t __copy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t network_usage_policy_set_changed_handler(uint64_t *a1, NSObject *a2, void *a3)
{
  if (a1 && (uint64_t v3 = *a1) != 0) {
    return CellularUsagePolicyClient::setPolicyChangedHandler(v3, a2, a3);
  }
  else {
    return 22;
  }
}

void __destroy_helper_block_e8_40c21_ZTSN8dispatch5queueE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);
  if (v3)
  {
    dispatch_release(v3);
  }
}

void __destroy_helper_block_e8_32c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE56c16_ZTSN3xpc5arrayE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(void *)(a1 + 56) = 0;
  uint64_t v2 = *(const void **)(a1 + 48);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

xpc_object_t __copy_helper_block_e8_32c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE56c16_ZTSN3xpc5arrayE(void *a1, void *a2)
{
  uint64_t v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  v5 = (const void *)a2[6];
  if (v5) {
    v6 = _Block_copy(v5);
  }
  else {
    v6 = 0;
  }
  v7 = (void *)a2[7];
  a1[6] = v6;
  a1[7] = v7;
  if (v7) {
    return xpc_retain(v7);
  }
  xpc_object_t result = xpc_null_create();
  a1[7] = result;
  return result;
}

void CellularUsagePolicyClient::start_sync(CellularUsagePolicyClient *this)
{
  uint64_t v3 = (int *)((char *)this + 80);
  int v2 = *((_DWORD *)this + 20);
  if (v2 != -1) {
    notify_cancel(v2);
  }
  uint64_t v4 = *((void *)this + 3);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN25CellularUsagePolicyClient10start_syncEv_block_invoke;
  handler[3] = &__block_descriptor_tmp_36;
  handler[4] = this;
  notify_register_dispatch("com.apple.coretelephony.daemon_ready", v3, v4, handler);
  CellularUsagePolicyClient::connectAndCheckin_sync((dispatch_queue_t *)this);
}

void CellularUsagePolicyClient::connectAndCheckin_sync(dispatch_queue_t *this)
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.commcenter.cupolicy.xpc", this[3], 2uLL);
  if (mach_service)
  {
    xpc_object_t v3 = mach_service;
    xpc_object_t object = mach_service;
LABEL_4:
    xpc_retain(v3);
    goto LABEL_5;
  }
  xpc_object_t v3 = xpc_null_create();
  xpc_object_t object = v3;
  if (v3) {
    goto LABEL_4;
  }
  xpc_object_t v3 = 0;
  xpc_object_t object = xpc_null_create();
LABEL_5:
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
  if (MEMORY[0x23ECFEDA0](v3) == MEMORY[0x263EF86F0]) {
    CellularUsagePolicyClient::checkin_sync((xpc_connection_t *)this);
  }
  xpc_release(v3);
}

void sub_23D383AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void CellularUsagePolicyClient::checkin_sync(xpc_connection_t *this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_object_t message = 0;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kRegisterCUPolicyClient", object, (uint64_t)"kRequest", (void **)buf);
  xpc_release(object[0]);
  xpc_object_t message = *(xpc_object_t *)buf;
  *(void *)buf = xpc_null_create();
  xpc_release(*(xpc_object_t *)buf);
  int v2 = getprogname();
  if (v2)
  {
    xpc_object_t v6 = xpc_string_create(v2);
    if (!v6) {
      xpc_object_t v6 = xpc_null_create();
    }
    object[0] = &message;
    object[1] = "kProgName";
    xpc::dict::object_proxy::operator=((uint64_t)object, &v6, &v7);
    xpc_release(v7);
    xpc_object_t v7 = 0;
    xpc_release(v6);
    xpc_object_t v6 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    xpc::object::to_string((uint64_t *)object, (xpc::object *)&message);
    if (v5 >= 0) {
      xpc_object_t v3 = object;
    }
    else {
      xpc_object_t v3 = (xpc_object_t *)object[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v3;
    _os_log_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Checking in with server: %s", buf, 0xCu);
    if (v5 < 0) {
      operator delete(object[0]);
    }
  }
  xpc_connection_send_message(this[5], message);
  xpc_release(message);
}

void sub_23D383C60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void xpc::dict_creator::operator()<char const*>(char *string@<X2>, void **a2@<X0>, uint64_t a3@<X1>, void **a4@<X8>)
{
  xpc_object_t v7 = xpc_string_create(string);
  xpc_object_t v8 = v7;
  if (v7)
  {
    xpc_object_t v11 = v7;
LABEL_4:
    xpc_retain(v8);
    goto LABEL_5;
  }
  xpc_object_t v8 = xpc_null_create();
  xpc_object_t v11 = v8;
  if (v8) {
    goto LABEL_4;
  }
  xpc_object_t v8 = 0;
  xpc_object_t v11 = xpc_null_create();
LABEL_5:
  v10[0] = a2;
  v10[1] = a3;
  xpc::dict::object_proxy::operator=((uint64_t)v10, &v11, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v11);
  xpc_object_t v11 = 0;
  v9 = *a2;
  *a4 = *a2;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    *a4 = xpc_null_create();
  }
  xpc_release(v8);
}

xpc_object_t xpc::dict::object_proxy::operator=@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

xpc::dict_creator *xpc::dict_creator::dict_creator(xpc::dict_creator *this)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x23ECFEDA0](v2) == MEMORY[0x263EF8708])
    {
      xpc_retain(v2);
      xpc_object_t v3 = v2;
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  *(void *)this = v3;
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v4);
  return this;
}

void *__copy_helper_block_e8_40c21_ZTSN8dispatch5queueE48c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  xpc_object_t result = *(void **)(a2 + 48);
  if (result) {
    xpc_object_t result = _Block_copy(result);
  }
  *(void *)(a1 + 48) = result;
  return result;
}

const void **___ZN25CellularUsagePolicyClient23setPolicyChangedHandlerEP16dispatch_queue_sU13block_pointerFvPvE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  }
  xpc_object_t v4 = *(NSObject **)(v2 + 88);
  *(void *)(v2 + 88) = v3;
  if (v4) {
    dispatch_release(v4);
  }
  char v5 = *(void **)(a1 + 48);
  if (v5) {
    char v5 = _Block_copy(v5);
  }
  xpc_object_t v6 = *(const void **)(v2 + 96);
  *(void *)(v2 + 96) = v5;
  if (v6) {
    _Block_release(v6);
  }
  v27 = 0;
  xpc_object_t object = (xpc_object_t)MGCopyAnswer();
  v28 = 0;
  xpc_object_t v7 = (const void **)ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&v28, (CFTypeRef *)&object);
  xpc_object_t v8 = v27;
  v27 = v28;
  v28 = v8;
  v9 = ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(v7);
  LOBYTE(v28) = 0;
  ctu::cf::assign((ctu::cf *)v9, v27, v10);
  if ((_BYTE)v28)
  {
    if (!*(unsigned char *)(v2 + 128)) {
      return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v27);
    }
    xpc_object_t object = 0;
    xpc_object_t v11 = xpc_array_create(0, 0);
    xpc_object_t v12 = v11;
    uint64_t v13 = MEMORY[0x263EF86D8];
    if (v11)
    {
      xpc_object_t object = v11;
    }
    else
    {
      xpc_object_t v12 = xpc_null_create();
      xpc_object_t object = v12;
      if (!v12)
      {
        xpc_object_t v17 = xpc_null_create();
        xpc_object_t v12 = 0;
        goto LABEL_22;
      }
    }
    if (MEMORY[0x23ECFEDA0](v12) == v13)
    {
      xpc_retain(v12);
LABEL_23:
      xpc_release(v12);
      v18 = (BOOL *)object;
      v28 = (BOOL *)object;
      if (object) {
        xpc_retain(object);
      }
      else {
        v28 = (BOOL *)xpc_null_create();
      }
      xpc::array::iterator::iterator(v24, (void **)&v28, 0);
      xpc_release(v28);
      v28 = v18;
      if (v18) {
        xpc_retain(v18);
      }
      else {
        v28 = (BOOL *)xpc_null_create();
      }
      if (MEMORY[0x23ECFEDA0](v18) == v13) {
        count = (void *)xpc_array_get_count(v18);
      }
      else {
        count = 0;
      }
      xpc::array::iterator::iterator(v23, (void **)&v28, count);
      xpc_release(v28);
      std::copy[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>>(v24, v23, &object);
      xpc_release(v23[0]);
      v23[0] = 0;
      xpc_release(v24[0]);
      v24[0] = 0;
      xpc_object_t v20 = object;
      xpc_object_t v22 = object;
      if (object)
      {
        xpc_retain(object);
      }
      else
      {
        xpc_object_t v20 = xpc_null_create();
        xpc_object_t v22 = v20;
      }
      CellularUsagePolicyClient::dispatchClientCallback_sync((void *)v2, &v22);
      xpc_release(v20);
      xpc_object_t v22 = 0;
      xpc_release(object);
      return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v27);
    }
    xpc_object_t v17 = xpc_null_create();
LABEL_22:
    xpc_object_t object = v17;
    goto LABEL_23;
  }
  xpc_object_t v14 = xpc_null_create();
  v15 = v14;
  v25 = v14;
  if (v14)
  {
    xpc_retain(v14);
    xpc_object_t v16 = v15;
  }
  else
  {
    xpc_object_t v16 = xpc_null_create();
    v25 = v16;
  }
  CellularUsagePolicyClient::dispatchClientCallback_sync((void *)v2, &v25);
  xpc_release(v16);
  v25 = 0;
  xpc_release(v15);
  return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v27);
}

void sub_23D38416C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, uint64_t a12, xpc_object_t a13, uint64_t a14, uint64_t a15, xpc_object_t object)
{
  xpc_release(v17);
  xpc_release(v16);
  ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)(v18 - 48));
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v4 = *a2;
  if (*a2 && (CFTypeID v5 = CFGetTypeID(*a2), v5 == CFBooleanGetTypeID()))
  {
    *a1 = v4;
  }
  else
  {
    *a1 = 0;
    if (*a2) {
      CFRelease(*a2);
    }
  }
  return a1;
}

void CellularUsagePolicyClient::handleMessage_sync(uint64_t a1, xpc::object *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    xpc::object::to_string((uint64_t *)__p, a2);
    CFTypeRef v4 = v8 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Received msg from server: %s", buf, 0xCu);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
  }
  if (xpc_dictionary_get_value(*(xpc_object_t *)a2, "kDataUsagePolicyNotification"))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Received new data usage policy list", (uint8_t *)__p, 2u);
    }
    *(void *)buf = 0;
    __p[0] = a2;
    __p[1] = "kDataUsagePolicies";
    xpc::dict::object_proxy::operator xpc::array((uint64_t)__p, buf);
    xpc_object_t v5 = *(xpc_object_t *)buf;
    xpc_object_t v6 = *(xpc_object_t *)buf;
    if (*(void *)buf)
    {
      xpc_retain(*(xpc_object_t *)buf);
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v6 = v5;
    }
    CellularUsagePolicyClient::handleDataUsagePolicies_sync(a1, &v6);
    xpc_release(v5);
    xpc_object_t v6 = 0;
    xpc_release(*(xpc_object_t *)buf);
  }
}

void sub_23D38447C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void xpc::dict::object_proxy::operator xpc::array(uint64_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t value = xpc_dictionary_get_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8));
  if (value)
  {
    xpc_object_t v4 = value;
    xpc_retain(value);
    *a2 = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    *a2 = v4;
    if (!v4)
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23ECFEDA0](v4) != MEMORY[0x263EF86D8])
  {
    xpc_object_t v5 = xpc_null_create();
LABEL_8:
    *a2 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
}

void CellularUsagePolicyClient::handleDataUsagePolicies_sync(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v4 = (void *)(a1 + 112);
  xpc_object_t v5 = (uint64_t *)(a1 + 104);
  std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(a1 + 104, *(xpc_object_t **)(a1 + 112));
  *(v4 - 1) = v4;
  *xpc_object_t v4 = 0;
  v4[1] = 0;
  xpc_object_t v6 = *a2;
  xpc_object_t object = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::array::iterator::iterator(v12, &object, 0);
  xpc_release(object);
  xpc_object_t v7 = *a2;
  xpc_object_t object = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  if (MEMORY[0x23ECFEDA0](*a2) == MEMORY[0x263EF86D8]) {
    count = (void *)xpc_array_get_count(*a2);
  }
  else {
    count = 0;
  }
  xpc::array::iterator::iterator(v11, &object, count);
  xpc_release(object);
  std::copy[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(v12, v11, (uint64_t)v5, *v5);
  xpc_release(v11[0]);
  v11[0] = 0;
  xpc_release(v12[0]);
  v12[0] = 0;
  *(unsigned char *)(a1 + 128) = 1;
  xpc_object_t v9 = *a2;
  uint64_t v10 = v9;
  if (v9)
  {
    xpc_retain(v9);
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    uint64_t v10 = v9;
  }
  CellularUsagePolicyClient::dispatchClientCallback_sync((void *)a1, &v10);
  xpc_release(v9);
}

void sub_23D3846B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12, uint64_t a13, uint64_t a14)
{
  xpc_release(v14);
  _Unwind_Resume(a1);
}

void **xpc::array::iterator::iterator(void **a1, void **a2, void *a3)
{
  xpc_object_t v5 = *a2;
  *a1 = *a2;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    *a1 = xpc_null_create();
  }
  a1[1] = a3;
  return a1;
}

void std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(uint64_t a1, xpc_object_t *a2)
{
  if (a2)
  {
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(a1, *a2);
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<xpc::dict,0>(a2 + 4);
    operator delete(a2);
  }
}

xpc_object_t std::copy[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(void **a1, void **a2, uint64_t a3, uint64_t a4)
{
  char v8 = *a1;
  v13[0] = v8;
  if (v8) {
    xpc_retain(v8);
  }
  else {
    v13[0] = xpc_null_create();
  }
  v13[1] = a1[1];
  xpc_object_t v9 = *a2;
  v12[0] = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    v12[0] = xpc_null_create();
  }
  v12[1] = a2[1];
  std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(v13, v12, a3, a4, (uint64_t)object);
  xpc_object_t v10 = object[2];
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v12[0]);
  v12[0] = 0;
  xpc_release(v13[0]);
  return v10;
}

void sub_23D3848A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
}

void std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v11[0] = *a1;
  *a1 = xpc_null_create();
  v11[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(v11, object, a3, a4, a5);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v11[0]);
}

void sub_23D384980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
}

void std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  v11[0] = *a1;
  *a1 = xpc_null_create();
  v11[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(v11, object, a3, a4, a5);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v11[0]);
}

void sub_23D384A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  long long v22 = 0u;
  long long v23 = 0u;
  xpc_object_t v10 = *a1;
  v21[0] = v10;
  if (v10) {
    xpc_retain(v10);
  }
  else {
    v21[0] = xpc_null_create();
  }
  v21[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator>(v21, object, (xpc_object_t *)&v22);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v21[0]);
  v21[0] = 0;
  *(_OWORD *)uint64_t v18 = 0u;
  long long v19 = 0u;
  v17[0] = (xpc_object_t)v22;
  *(void *)&long long v22 = xpc_null_create();
  v17[1] = *((xpc_object_t *)&v22 + 1);
  v16[0] = (xpc_object_t)v23;
  *(void *)&long long v23 = xpc_null_create();
  v16[1] = *((xpc_object_t *)&v23 + 1);
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>((uint64_t)v17, v16, a3, a4, (uint64_t)v18);
  xpc_release(v16[0]);
  v16[0] = 0;
  xpc_release(v17[0]);
  v17[0] = 0;
  v14[0] = *a1;
  *a1 = xpc_null_create();
  v14[1] = a1[1];
  v13[0] = v18[0];
  v18[0] = xpc_null_create();
  v13[1] = v18[1];
  std::__rewrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,xpc::array::iterator>(v14, v13, v15);
  long long v11 = v19;
  *(void *)a5 = v15[0];
  xpc_object_t v12 = xpc_null_create();
  v15[0] = v12;
  *(void *)(a5 + 8) = v15[1];
  *(_OWORD *)(a5 + 16) = v11;
  xpc_release(v12);
  v15[0] = 0;
  xpc_release(v13[0]);
  v13[0] = 0;
  xpc_release(v14[0]);
  v14[0] = 0;
  xpc_release(v18[0]);
  xpc_release((xpc_object_t)v23);
  *(void *)&long long v23 = 0;
  xpc_release((xpc_object_t)v22);
}

void sub_23D384C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t a15, uint64_t a16, xpc_object_t a17, uint64_t a18, xpc_object_t a19, uint64_t a20,uint64_t a21,uint64_t a22,xpc_object_t a23)
{
  xpc_release(object);
  xpc_release(a11);
  xpc_release(a19);
  std::pair<xpc::array::iterator,xpc::array::iterator>::~pair((xpc_object_t *)(v23 - 80));
  _Unwind_Resume(a1);
}

void std::__unwrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__unwrap[abi:ne180100]((uint64_t)v7, (uint64_t)object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

void std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__unwrap[abi:ne180100](uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_object_t v6 = *(void **)a1;
  *(void *)a1 = xpc_null_create();
  xpc_object_t v7 = *(void **)(a1 + 8);
  if (v6)
  {
    xpc_retain(v6);
    xpc_object_t v8 = v6;
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
  }
  v15[0] = v8;
  xpc_object_t v9 = xpc_null_create();
  v15[1] = v7;
  xpc_release(v9);
  xpc_object_t v10 = *(void **)a2;
  *(void *)a2 = xpc_null_create();
  long long v11 = *(void **)(a2 + 8);
  if (v10)
  {
    xpc_retain(v10);
    xpc_object_t v12 = v10;
  }
  else
  {
    xpc_object_t v12 = xpc_null_create();
  }
  object[0] = v12;
  xpc_object_t v13 = xpc_null_create();
  object[1] = v11;
  xpc_release(v13);
  std::pair<xpc::array::iterator,xpc::array::iterator>::pair[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,0>(a3, v15, object);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10);
  xpc_release(v15[0]);
  v15[0] = 0;
  xpc_release(v6);
}

xpc_object_t *std::pair<xpc::array::iterator,xpc::array::iterator>::pair[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,0>(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
{
  *a1 = *a2;
  *a2 = xpc_null_create();
  xpc_object_t v6 = *a3;
  a1[1] = a2[1];
  a1[2] = v6;
  *a3 = xpc_null_create();
  a1[3] = a3[1];
  return a1;
}

void std::__rewrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,xpc::array::iterator>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, void *a3@<X8>)
{
  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__rewrap[abi:ne180100](v7, object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

void std::__unwrap_range_impl<xpc::array::iterator,xpc::array::iterator>::__rewrap[abi:ne180100](xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, void *a3@<X8>)
{
  v7[0] = *a1;
  *a1 = xpc_null_create();
  v7[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__rewrap_iter[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::__unwrap_iter_impl<xpc::array::iterator,false>>(v7, object, a3);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v7[0]);
}

void std::__rewrap_iter[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::__unwrap_iter_impl<xpc::array::iterator,false>>(void **a1@<X0>, xpc_object_t *a2@<X1>, void *a3@<X8>)
{
  xpc_object_t v5 = *a1;
  *a1 = xpc_null_create();
  xpc_object_t v6 = *a2;
  *a2 = xpc_null_create();
  xpc_object_t v7 = a2[1];
  *a3 = v6;
  xpc_object_t v8 = xpc_null_create();
  a3[1] = v7;
  xpc_release(v8);
  xpc_release(v5);
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>@<X0>(uint64_t a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  *(void *)&long long v12 = a3;
  *((void *)&v12 + 1) = a4;
  for (uint64_t i = *(void *)(a1 + 8); i != a2[1] || *(void *)a1 != *a2; *(void *)(a1 + 8) = i)
  {
    v10[0] = a1;
    v10[1] = i;
    xpc::array::object_proxy::operator xpc::dict((uint64_t)v10, &object);
    std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>::operator=[abi:ne180100]((uint64_t)&v12, &object);
    xpc_release(object);
    uint64_t i = *(void *)(a1 + 8) + 1;
  }
  return std::pair<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>::pair[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(a5, (xpc_object_t *)a1, &v12);
}

void sub_23D38517C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

uint64_t std::pair<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>>::pair[abi:ne180100]<xpc::array::iterator,std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>,0>(uint64_t a1, xpc_object_t *a2, _OWORD *a3)
{
  *(void *)a1 = *a2;
  *a2 = xpc_null_create();
  *(void *)(a1 + 8) = a2[1];
  *(_OWORD *)(a1 + 16) = *a3;
  return a1;
}

uint64_t std::insert_iterator<std::set<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>>::operator=[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v3 = std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__emplace_hint_unique_key_args<xpc::dict,xpc::dict>(*(uint64_t ***)a1, *(void **)(a1 + 8), a2, a2);
  *(void *)(a1 + 8) = v3;
  xpc_object_t v4 = (uint64_t *)v3[1];
  if (v4)
  {
    do
    {
      xpc_object_t v5 = v4;
      xpc_object_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  else
  {
    do
    {
      xpc_object_t v5 = (uint64_t *)v3[2];
      BOOL v6 = *v5 == (void)v3;
      uint64_t v3 = v5;
    }
    while (!v6);
  }
  *(void *)(a1 + 8) = v5;
  return a1;
}

uint64_t *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__emplace_hint_unique_key_args<xpc::dict,xpc::dict>(uint64_t **a1, void *a2, void *a3, void *a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  BOOL v6 = std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>(a1, a2, &v12, &v11, a3);
  xpc_object_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    xpc_object_t v8 = (uint64_t **)v6;
    memset(v10, 0, sizeof(v10));
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__construct_node<xpc::dict>((uint64_t)a1, a4, v10);
    std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__insert_node_at(a1, v12, v8, v10[0]);
    xpc_object_t v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<xpc::dict,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<xpc::dict,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

uint64_t *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  xpc_object_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  xpc_object_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

xpc_object_t std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__construct_node<xpc::dict>@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  BOOL v6 = operator new(0x28uLL);
  *a3 = v6;
  a3[1] = v5;
  *((unsigned char *)a3 + 16) = 0;
  v6[4] = *a2;
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  *((unsigned char *)a3 + 16) = 1;
  return result;
}

uint64_t *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>(void *a1, void *a2, void *a3, uint64_t *a4, void *a5)
{
  xpc_object_t v9 = a1 + 1;
  if (a1 + 1 != a2 && !CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), a5, a2 + 4))
  {
    if (!CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), a2 + 4, a5))
    {
      *a3 = a2;
      *a4 = (uint64_t)a2;
      return a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      xpc_object_t v14 = (void *)a2[1];
      do
      {
        v15 = v14;
        xpc_object_t v14 = (void *)*v14;
      }
      while (v14);
    }
    else
    {
      uint64_t v18 = a2;
      do
      {
        v15 = (void *)v18[2];
        BOOL v17 = *v15 == (void)v18;
        uint64_t v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), a5, v15 + 4)) {
        goto LABEL_28;
      }
      uint64_t v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = a2;
    }
    return a4;
  }
  if ((void *)*a1 == a2)
  {
    uint64_t v12 = a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  uint64_t v11 = (void *)*a2;
  if (*a2)
  {
    do
    {
      uint64_t v12 = v11;
      uint64_t v11 = (void *)v11[1];
    }
    while (v11);
  }
  else
  {
    xpc_object_t v16 = a2;
    do
    {
      uint64_t v12 = (void *)v16[2];
      BOOL v17 = *v12 == (void)v16;
      xpc_object_t v16 = v12;
    }
    while (v17);
  }
  if (CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:

  return std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>((uint64_t)a1, a3, a5);
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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
      uint64_t v3 = (uint64_t *)v2[2];
      xpc_object_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            xpc_object_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            xpc_object_t v9 = (uint64_t **)v2[1];
            xpc_object_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              void v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            void *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
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
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<xpc::dict,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<xpc::dict,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(xpc_object_t **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<xpc::dict,0>(v2 + 4);
    }
    operator delete(v2);
  }
}

void xpc::array::object_proxy::operator xpc::dict(uint64_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t value = xpc_array_get_value(**(xpc_object_t **)a1, *(void *)(a1 + 8));
  if (value)
  {
    xpc_object_t v4 = value;
    xpc_retain(value);
    *a2 = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    *a2 = v4;
    if (!v4)
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23ECFEDA0](v4) != MEMORY[0x263EF8708])
  {
    xpc_object_t v5 = xpc_null_create();
LABEL_8:
    *a2 = v5;
    goto LABEL_9;
  }
  xpc_retain(v4);
LABEL_9:
  xpc_release(v4);
}

void CellularUsagePolicyClient::dispatchClientCallback_sync(void *a1, void **a2)
{
  if (a1[11])
  {
    uint64_t v3 = (const void *)a1[12];
    if (v3)
    {
      xpc_object_t v5 = _Block_copy(v3);
      std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v15, a1 + 1);
      uint64_t v7 = v15;
      int v6 = v16;
      if (v16)
      {
        atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
      int v8 = a1[11];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 1174405120;
      xpc_object_t v11[2] = ___ZN25CellularUsagePolicyClient27dispatchClientCallback_syncEN3xpc5arrayE_block_invoke;
      v11[3] = &__block_descriptor_tmp_42;
      v11[4] = v7;
      uint64_t v12 = v6;
      if (v6) {
        atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      if (v5) {
        xpc_object_t v9 = _Block_copy(v5);
      }
      else {
        xpc_object_t v9 = 0;
      }
      xpc_object_t v10 = *a2;
      aBlock = v9;
      xpc_object_t object = v10;
      if (v10) {
        xpc_retain(v10);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      dispatch_async(v8, v11);
      xpc_release(object);
      xpc_object_t object = 0;
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v12) {
        std::__shared_weak_count::__release_weak(v12);
      }
      if (v6) {
        std::__shared_weak_count::__release_weak(v6);
      }
      if (v5) {
        _Block_release(v5);
      }
    }
  }
}

void sub_23D385958(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void network_usage_policy_create_client()
{
}

void sub_23D3859F4(_Unwind_Exception *a1)
{
  MEMORY[0x23ECFEB30](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void std::shared_ptr<CellularUsagePolicyClient>::shared_ptr[abi:ne180100]<CellularUsagePolicyClient,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1},void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_23D385A98(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[3], v1, (dispatch_function_t)std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1}::operator() const(CellularUsagePolicyClient*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_23D385AC0(_Unwind_Exception *a1)
{
}

void std::shared_ptr<CellularUsagePolicyClient>::__enable_weak_this[abi:ne180100]<ctu::XpcClient,CellularUsagePolicyClient,void>(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    xpc_object_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      xpc_object_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        xpc_object_t v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
    }
  }
}

void CellularUsagePolicyClient::create(CellularUsagePolicyClient *this)
{
}

void sub_23D385BB4(_Unwind_Exception *a1)
{
  MEMORY[0x23ECFEB30](v1, 0x10B3C408A6EA412);
  _Unwind_Resume(a1);
}

void CellularUsagePolicyClient::CellularUsagePolicyClient(CellularUsagePolicyClient *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "com.apple.cupolicy.client");
  ctu::XpcClient::XpcClient();
  if (v3 < 0) {
    operator delete(__p);
  }
  ctu::OsLogLogger::OsLogLogger((CellularUsagePolicyClient *)((char *)this + 72), "com.apple.telephony", "cupolicy");
  *(void *)this = &unk_26F113778;
  *((_DWORD *)this + 20) = -1;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = (char *)this + 112;
  *((unsigned char *)this + 128) = 0;
}

void sub_23D385C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  ctu::XpcClient::~XpcClient(v15);
  _Unwind_Resume(a1);
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
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void CellularUsagePolicyClient::start(CellularUsagePolicyClient *this)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN25CellularUsagePolicyClient5startEv_block_invoke;
  v3[3] = &__block_descriptor_tmp;
  v3[4] = this;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v6, (void *)this + 1);
  uint64_t v2 = *((void *)this + 3);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_26F1139E8;
  block[5] = v6;
  size_t v5 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = v3;
  dispatch_async(v2, block);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t CellularUsagePolicyClient::setPolicyChangedHandler(uint64_t a1, dispatch_object_t object, void *a3)
{
  if (!object) {
    return 22;
  }
  dispatch_retain(object);
  if (a3) {
    a3 = _Block_copy(a3);
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1174405120;
  v9[2] = ___ZN25CellularUsagePolicyClient23setPolicyChangedHandlerEP16dispatch_queue_sU13block_pointerFvPvE_block_invoke;
  v9[3] = &__block_descriptor_tmp_33;
  v9[4] = a1;
  dispatch_object_t objecta = object;
  dispatch_retain(object);
  if (a3) {
    uint64_t v6 = _Block_copy(a3);
  }
  else {
    uint64_t v6 = 0;
  }
  aBlock = v6;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v14, (void *)(a1 + 8));
  uint64_t v8 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_26F1139E8;
  block[5] = v14;
  uint64_t v13 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = v9;
  dispatch_async(v8, block);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (objecta) {
    dispatch_release(objecta);
  }
  if (a3) {
    _Block_release(a3);
  }
  dispatch_release(object);
  return 0;
}

void *std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(void *a1, void *a2)
{
  char v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  size_t v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

void ___ZN25CellularUsagePolicyClient27dispatchClientCallback_syncEN3xpc5arrayE_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[5];
  if (v2)
  {
    char v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      size_t v4 = v3;
      if (a1[4]) {
        (*(void (**)(void))(a1[6] + 16))();
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

void sub_23D386134(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

CellularUsagePolicyClient **network_usage_policy_destroy_client(CellularUsagePolicyClient **result)
{
  if (result)
  {
    uint64_t v1 = result;
    CellularUsagePolicyClient::shutdown(*result);
    uint64_t v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    JUMPOUT(0x23ECFEB30);
  }
  return result;
}

uint64_t network_usage_policy_get_datausage_policies(uint64_t *a1, void *a2)
{
  if (a1 && (uint64_t v2 = *a1) != 0) {
    return CellularUsagePolicyClient::getDataUsagePolicies(v2, a2);
  }
  else {
    return 22;
  }
}

uint64_t network_usage_policy_get_for_bundle(uint64_t *a1, char *a2, const void *a3)
{
  if (a1 && a2 && (uint64_t v3 = *a1) != 0) {
    return CellularUsagePolicyClient::getDataUsagePolicy(v3, a2, a3);
  }
  else {
    return 22;
  }
}

uint64_t network_usage_policy_get_cell_data_allowed_from_policy(xpc_object_t object)
{
  uint64_t v1 = (uint64_t)object;
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v8 = (xpc_object_t)v1;
    uint64_t v2 = MEMORY[0x23ECFEDA0](v1);
    uint64_t v3 = MEMORY[0x263EF8708];
    if (v2 == MEMORY[0x263EF8708])
    {
      xpc_retain((xpc_object_t)v1);
      xpc_object_t v4 = (xpc_object_t)v1;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v8 = v4;
    }
    xpc_release((xpc_object_t)v1);
    if (MEMORY[0x23ECFEDA0](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyKeyDataAllowed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
      uint64_t v1 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      xpc_object_t v4 = v8;
    }
    else
    {
      uint64_t v1 = 1;
    }
    xpc_release(v4);
  }
  return v1;
}

void sub_23D3862B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12)
{
}

xpc_object_t xpc::dict::object_proxy::operator xpc::object@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t value = xpc_dictionary_get_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8));
  *a2 = value;
  if (value) {
    return xpc_retain(value);
  }
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

uint64_t network_usage_policy_get_WiFi_data_allowed_from_policy(xpc_object_t object)
{
  uint64_t v1 = (uint64_t)object;
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v8 = (xpc_object_t)v1;
    uint64_t v2 = MEMORY[0x23ECFEDA0](v1);
    uint64_t v3 = MEMORY[0x263EF8708];
    if (v2 == MEMORY[0x263EF8708])
    {
      xpc_retain((xpc_object_t)v1);
      xpc_object_t v4 = (xpc_object_t)v1;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v8 = v4;
    }
    xpc_release((xpc_object_t)v1);
    if (MEMORY[0x23ECFEDA0](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyKeyWiFiAllowed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
      uint64_t v1 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      xpc_object_t v4 = v8;
    }
    else
    {
      uint64_t v1 = 1;
    }
    xpc_release(v4);
  }
  return v1;
}

void sub_23D386424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12)
{
}

uint64_t network_usage_policy_get_first_use_flow_performed_from_policy(xpc_object_t object)
{
  uint64_t v1 = (uint64_t)object;
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v8 = (xpc_object_t)v1;
    uint64_t v2 = MEMORY[0x23ECFEDA0](v1);
    uint64_t v3 = MEMORY[0x263EF8708];
    if (v2 == MEMORY[0x263EF8708])
    {
      xpc_retain((xpc_object_t)v1);
      xpc_object_t v4 = (xpc_object_t)v1;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v8 = v4;
    }
    xpc_release((xpc_object_t)v1);
    if (MEMORY[0x23ECFEDA0](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyFirstNetworkUseFlowPerformed";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
      uint64_t v1 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      xpc_object_t v4 = v8;
    }
    else
    {
      uint64_t v1 = 1;
    }
    xpc_release(v4);
  }
  return v1;
}

void sub_23D386548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12)
{
}

char *network_usage_policy_get_bundle_from_policy(char *object)
{
  string_ptr = object;
  if (object)
  {
    xpc_retain(object);
    xpc_object_t v8 = string_ptr;
    uint64_t v2 = MEMORY[0x23ECFEDA0](string_ptr);
    uint64_t v3 = MEMORY[0x263EF8708];
    if (v2 == MEMORY[0x263EF8708])
    {
      xpc_retain(string_ptr);
      xpc_object_t v4 = string_ptr;
    }
    else
    {
      xpc_object_t v4 = (char *)xpc_null_create();
      xpc_object_t v8 = v4;
    }
    xpc_release(string_ptr);
    if (MEMORY[0x23ECFEDA0](v4) == v3)
    {
      v6[0] = &v8;
      v6[1] = "kCUPolicyKeyBundleID";
      xpc_object_t xstring = 0;
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &xstring);
      if (MEMORY[0x23ECFEDA0](xstring) != MEMORY[0x263EF8758] && MEMORY[0x23ECFEDA0](xstring) == MEMORY[0x263EF8798]) {
        string_ptr = (char *)xpc_string_get_string_ptr(xstring);
      }
      else {
        string_ptr = 0;
      }
      xpc_release(xstring);
      xpc_object_t v4 = v8;
    }
    else
    {
      string_ptr = 0;
    }
    xpc_release(v4);
  }
  return string_ptr;
}

void sub_23D3866A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t a11, xpc_object_t object)
{
}

uint64_t perform_first_network_use_flow(uint64_t *a1, char *a2, char a3, const void *a4)
{
  if (a1 && a2 && (uint64_t v4 = *a1) != 0) {
    return CellularUsagePolicyClient::performFirstNetworkUseFlow(v4, a2, a3, a4);
  }
  else {
    return 22;
  }
}

void __clang_call_terminate(void *a1)
{
}

void CellularUsagePolicyClient::shutdown(CellularUsagePolicyClient *this)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZN25CellularUsagePolicyClient8shutdownEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_3;
  v3[4] = this;
  uint64_t v4 = v3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_50;
  block[4] = (char *)this + 8;
  block[5] = &v4;
  uint64_t v2 = (char *)this + 24;
  uint64_t v1 = *((void *)this + 3);
  if (*((void *)v2 + 1)) {
    dispatch_async_and_wait(v1, block);
  }
  else {
    dispatch_sync(v1, block);
  }
}

void ___ZN25CellularUsagePolicyClient8shutdownEv_block_invoke(uint64_t a1)
{
}

void CellularUsagePolicyClient::shutdown_sync(xpc_connection_t *this)
{
  CellularUsagePolicyClient::checkout_sync(this);
  int v2 = *((_DWORD *)this + 20);
  if (v2 != -1) {
    notify_cancel(v2);
  }
  xpc_connection_t v3 = this[12];
  this[12] = 0;
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = this[11];
  this[11] = 0;
  if (v4) {
    dispatch_release(v4);
  }
  xpc_object_t object = xpc_null_create();
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
}

void sub_23D386868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t CellularUsagePolicyClient::performFirstNetworkUseFlow(uint64_t a1, char *a2, char a3, const void *a4)
{
  uint64_t result = 22;
  if (!a2 || !a4) {
    return result;
  }
  memset(&v15, 0, sizeof(v15));
  std::string::basic_string[abi:ne180100]<0>(&v15, a2);
  xpc_object_t v8 = _Block_copy(a4);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1174405120;
  xpc_object_t v11[2] = ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke;
  v11[3] = &__block_descriptor_tmp_15;
  v11[4] = a1;
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v15;
  }
  char v14 = a3;
  if (v8) {
    xpc_object_t v9 = _Block_copy(v8);
  }
  else {
    xpc_object_t v9 = 0;
  }
  aBlock = v9;
  uint64_t v18 = 0;
  long long v19 = 0;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v18, (void *)(a1 + 8));
  xpc_object_t v10 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_26F1139E8;
  block[5] = v18;
  BOOL v17 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = v11;
  dispatch_async(v10, block);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!v8) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (v8) {
LABEL_21:
  }
    _Block_release(v8);
LABEL_22:
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  return 0;
}

void sub_23D386A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (v24) {
    _Block_release(v24);
  }
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Performing first network use flow", buf, 2u);
  }
  xpc_object_t v17 = 0;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)buf);
  xpc::dict_creator::operator()<char const*>("kCUPerformFirstNetworkUseFlow", (void **)buf, (uint64_t)"kRequest", &v16);
  xpc_release(*(xpc_object_t *)buf);
  xpc_object_t v17 = v16;
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v16);
  xpc_connection_t v3 = (const char *)(a1 + 40);
  if (*(char *)(a1 + 63) < 0) {
    xpc_connection_t v3 = *(const char **)v3;
  }
  xpc_object_t v14 = xpc_string_create(v3);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  *(void *)buf = &v17;
  uint64_t v13 = "kCUPolicyKeyBundleID";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v14, &v15);
  xpc_release(v15);
  xpc_object_t v15 = 0;
  xpc_release(v14);
  xpc_object_t v14 = 0;
  xpc_object_t v10 = xpc_BOOL_create(*(unsigned char *)(a1 + 72));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  *(void *)buf = &v17;
  uint64_t v13 = "kCUIgnoreFGApp";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v10, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v10);
  xpc_object_t v10 = 0;
  uint64_t v4 = *(_xpc_connection_s **)(v2 + 40);
  xpc_object_t v5 = v17;
  uint64_t v6 = *(NSObject **)(v2 + 24);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_8;
  handler[3] = &__block_descriptor_tmp_14;
  uint64_t v7 = *(void **)(a1 + 64);
  if (v7) {
    uint64_t v7 = _Block_copy(v7);
  }
  aBlock = v7;
  xpc_connection_send_message_with_reply(v4, v5, v6, handler);
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(v17);
}

void sub_23D386C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(*(xpc_object_t *)(v14 - 40));
  _Unwind_Resume(a1);
}

void ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_8(uint64_t a1, xpc_object_t object)
{
  if (object)
  {
    xpc_object_t v3 = object;
    xpc_retain(object);
    xpc_object_t v13 = v3;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v13 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23ECFEDA0](v3) == MEMORY[0x263EF8708])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  xpc_object_t v13 = v4;
LABEL_9:
  xpc_release(v3);
  v11[0] = &v13;
  v11[1] = "kCUFirstNetworkUseFlowPeformedResult";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v11, &v12);
  char v5 = xpc::dyn_cast_or_default();
  xpc_release(v12);
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1174405120;
  v8[2] = ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_2;
  v8[3] = &__block_descriptor_tmp_10;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    uint64_t v7 = _Block_copy(v7);
  }
  aBlock = v7;
  char v10 = v5;
  dispatch_async(global_queue, v8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(v13);
}

void sub_23D386E3C(_Unwind_Exception *a1)
{
  xpc_release(*(xpc_object_t *)(v1 - 48));
  xpc_release(*(xpc_object_t *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t ___ZN25CellularUsagePolicyClient26performFirstNetworkUseFlowEPKcbU13block_pointerFvbE_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *__copy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 40);
    v4->__r_.__value_.__r.__words[2] = *(void *)(a2 + 56);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  uint64_t result = *(void **)(a2 + 64);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 64) = result;
  return result;
}

void __destroy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 64);
  if (v2) {
    _Block_release(v2);
  }
  if (*(char *)(a1 + 63) < 0)
  {
    xpc_object_t v3 = *(void **)(a1 + 40);
    operator delete(v3);
  }
}

uint64_t CellularUsagePolicyClient::getDataUsagePolicies(uint64_t a1, void *aBlock)
{
  if (!aBlock) {
    return 22;
  }
  xpc_object_t v3 = _Block_copy(aBlock);
  xpc_object_t v4 = v3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1174405120;
  v8[2] = ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke;
  v8[3] = &__block_descriptor_tmp_20;
  void v8[4] = a1;
  if (v3) {
    long long v5 = _Block_copy(v3);
  }
  else {
    long long v5 = 0;
  }
  aBlocka = v5;
  uint64_t v12 = 0;
  xpc_object_t v13 = 0;
  std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v12, (void *)(a1 + 8));
  uint64_t v7 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_26F1139E8;
  block[5] = v12;
  uint64_t v11 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  block[4] = v8;
  dispatch_async(v7, block);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (aBlocka) {
    _Block_release(aBlocka);
  }
  if (v4) {
    _Block_release(v4);
  }
  return 0;
}

void ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1174405120;
  v3[2] = ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2;
  v3[3] = &__block_descriptor_tmp_17;
  v3[4] = v2;
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  aBlock = v1;
  CellularUsagePolicyClient::fetchDataUsagePoliciesIfNeeded_sync(v2, v3);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_23D3871A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(exception_object);
}

void CellularUsagePolicyClient::fetchDataUsagePoliciesIfNeeded_sync(uint64_t a1, void *aBlock)
{
  if (*(unsigned char *)(a1 + 128))
  {
    xpc_object_t v3 = (void (*)(void *, uint64_t))aBlock[2];
    v3(aBlock, 1);
  }
  else
  {
    if (aBlock) {
      long long v5 = _Block_copy(aBlock);
    }
    else {
      long long v5 = 0;
    }
    uint64_t v6 = (void **)xpc::dict_creator::dict_creator((xpc::dict_creator *)&v12);
    xpc::dict_creator::operator()<char const*>("kCUGetNetworkAccessPolicies", v6, (uint64_t)"kRequest", &v11);
    xpc_release(v12);
    uint64_t v7 = v11;
    xpc_object_t v11 = xpc_null_create();
    xpc_release(v11);
    xpc_object_t v8 = *(_xpc_connection_s **)(a1 + 40);
    xpc_object_t v9 = *(NSObject **)(a1 + 24);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    void v10[2] = ___ZN25CellularUsagePolicyClient35fetchDataUsagePoliciesIfNeeded_syncEU13block_pointerFvbE_block_invoke;
    v10[3] = &unk_264E980B8;
    v10[4] = aBlock;
    v10[5] = a1;
    xpc_connection_send_message_with_reply(v8, v7, v9, v10);
    xpc_release(v7);
    if (v5) {
      _Block_release(v5);
    }
  }
}

void sub_23D3872FC(_Unwind_Exception *a1)
{
  xpc_release(v2);
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(a1);
}

void ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    xpc_object_t v3 = *(const void **)(a1 + 40);
    if (v3) {
      long long v5 = _Block_copy(v3);
    }
    else {
      long long v5 = 0;
    }
    uint64_t v6 = v5;
    CellularUsagePolicyClient::getDataUsagePolicies_sync(v4, &v6);
    if (v5) {
      _Block_release(v5);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2_cold_1();
    }
    xpc_null_create();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_23D3873D0(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void CellularUsagePolicyClient::getDataUsagePolicies_sync(uint64_t a1, const void **a2)
{
  xpc_object_t object = xpc_null_create();
  if (*(void *)(a1 + 120))
  {
    xpc_object_t v4 = xpc_array_create(0, 0);
    if (v4 || (xpc_object_t v4 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x23ECFEDA0](v4) == MEMORY[0x263EF86D8])
      {
        xpc_retain(v4);
        xpc_object_t v5 = v4;
      }
      else
      {
        xpc_object_t v5 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v4 = 0;
    }
    xpc_release(v4);
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v7 = object;
    xpc_object_t object = v5;
    xpc_release(v7);
    xpc_release(v6);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::back_insert_iterator<xpc::array>>((uint64_t)&v14, *(void **)(a1 + 104), (void *)(a1 + 112), &object);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1174405120;
  void v10[2] = ___ZN25CellularUsagePolicyClient25getDataUsagePolicies_syncEN8dispatch5blockIU13block_pointerFvPvEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_24;
  if (*a2) {
    xpc_object_t v9 = _Block_copy(*a2);
  }
  else {
    xpc_object_t v9 = 0;
  }
  aBlock = v9;
  xpc_object_t v12 = object;
  if (object) {
    xpc_retain(object);
  }
  else {
    xpc_object_t v12 = xpc_null_create();
  }
  dispatch_async(global_queue, v10);
  xpc_release(v12);
  xpc_object_t v12 = 0;
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(object);
}

void sub_23D387588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object)
{
}

void *__copy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN25CellularUsagePolicyClient35fetchDataUsagePoliciesIfNeeded_syncEU13block_pointerFvbE_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  xpc_object_t objecta = 0;
  uint64_t v4 = MEMORY[0x263EF8708];
  if (object)
  {
    xpc_object_t v5 = object;
    xpc_retain(object);
    xpc_object_t objecta = v5;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t objecta = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x23ECFEDA0](v5) == v4)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  xpc_object_t objecta = v6;
LABEL_9:
  xpc_release(v5);
  if (MEMORY[0x23ECFEDA0](objecta) == v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      xpc::object::to_string((uint64_t *)__p, (xpc::object *)&objecta);
      xpc_object_t v7 = v11 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Initial network access policies msg received from server: %s", buf, 0xCu);
      if (v11 < 0) {
        operator delete(__p[0]);
      }
    }
    *(void *)buf = 0;
    __p[0] = &objecta;
    __p[1] = "kDataUsagePolicies";
    xpc::dict::object_proxy::operator xpc::array((uint64_t)__p, buf);
    if (MEMORY[0x23ECFEDA0](*(void *)buf) == MEMORY[0x263EF86D8])
    {
      xpc_object_t v8 = *(xpc_object_t *)buf;
      xpc_object_t v9 = *(xpc_object_t *)buf;
      if (*(void *)buf)
      {
        xpc_retain(*(xpc_object_t *)buf);
      }
      else
      {
        xpc_object_t v8 = xpc_null_create();
        xpc_object_t v9 = v8;
      }
      CellularUsagePolicyClient::handleDataUsagePolicies_sync(v3, &v9);
      xpc_release(v8);
      xpc_object_t v9 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    xpc_release(*(xpc_object_t *)buf);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  xpc_release(objecta);
}

void sub_23D387838(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t a14, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t ___ZN25CellularUsagePolicyClient25getDataUsagePolicies_syncEN8dispatch5blockIU13block_pointerFvPvEEE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

xpc_object_t __copy_helper_block_e8_32c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE40c16_ZTSN3xpc5arrayE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(const void **)(a2 + 32);
  if (v4) {
    xpc_object_t v5 = _Block_copy(v4);
  }
  else {
    xpc_object_t v5 = 0;
  }
  xpc_object_t v6 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  if (v6) {
    return xpc_retain(v6);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE40c16_ZTSN3xpc5arrayE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(void *)(a1 + 40) = 0;
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

void CellularUsagePolicyClient::getDataUsagePolicy_sync(uint64_t a1, void **a2, unsigned __int8 **a3)
{
  uint64_t v4 = *(void **)(a1 + 104);
  xpc_object_t v5 = (void *)(a1 + 112);
  if (v4 != (void *)(a1 + 112))
  {
    while (1)
    {
      if (xpc_dictionary_get_value((xpc_object_t)v4[4], "kCUPolicyKeyBundleID"))
      {
        std::string __p = 0;
        size_t __n = 0;
        uint64_t v33 = 0;
        v29[0] = v4 + 4;
        v29[1] = "kCUPolicyKeyBundleID";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)v29, &object);
        v34 = 0;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        xpc::dyn_cast_or_default();
        if (SHIBYTE(v36) < 0) {
          operator delete(v34);
        }
        xpc_release(object);
        if (v33 >= 0) {
          size_t v7 = HIBYTE(v33);
        }
        else {
          size_t v7 = __n;
        }
        xpc_object_t v8 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
        int v9 = (char)v8;
        if ((char)v8 < 0) {
          xpc_object_t v8 = a3[1];
        }
        if ((unsigned __int8 *)v7 == v8)
        {
          if (v9 >= 0) {
            char v10 = (unsigned __int8 *)a3;
          }
          else {
            char v10 = *a3;
          }
          if (v33 < 0)
          {
            xpc_object_t v12 = __p;
            int v13 = memcmp(__p, v10, __n);
            operator delete(v12);
            if (!v13) {
              break;
            }
            goto LABEL_23;
          }
          if (!HIBYTE(v33)) {
            break;
          }
          uint64_t v11 = 0;
          while (*((unsigned __int8 *)&__p + v11) == v10[v11])
          {
            if (HIBYTE(v33) == ++v11) {
              goto LABEL_30;
            }
          }
        }
        if (v33 < 0) {
          operator delete(__p);
        }
      }
LABEL_23:
      uint64_t v14 = (void *)v4[1];
      if (v14)
      {
        do
        {
          xpc_object_t v15 = v14;
          uint64_t v14 = (void *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          xpc_object_t v15 = (void *)v4[2];
          BOOL v16 = *v15 == (void)v4;
          uint64_t v4 = v15;
        }
        while (!v16);
      }
      uint64_t v4 = v15;
      if (v15 == v5)
      {
        uint64_t v4 = v5;
        break;
      }
    }
  }
LABEL_30:
  xpc_object_t v17 = xpc_null_create();
  uint64_t v18 = v17;
  if (v4 == v5)
  {
    xpc_object_t v21 = v17;
  }
  else
  {
    xpc_object_t v19 = xpc_copy((xpc_object_t)v4[4]);
    if (v19 || (xpc_object_t v19 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x23ECFEDA0](v19) == MEMORY[0x263EF8708])
      {
        xpc_retain(v19);
        xpc_object_t v20 = v19;
      }
      else
      {
        xpc_object_t v20 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v20 = xpc_null_create();
      xpc_object_t v19 = 0;
    }
    xpc_release(v19);
    xpc_object_t v22 = xpc_array_create(0, 0);
    if (v22 || (xpc_object_t v22 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x23ECFEDA0](v22) == MEMORY[0x263EF86D8])
      {
        xpc_retain(v22);
        xpc_object_t v21 = v22;
      }
      else
      {
        xpc_object_t v21 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v21 = xpc_null_create();
      xpc_object_t v22 = 0;
    }
    xpc_release(v22);
    xpc_object_t v23 = xpc_null_create();
    xpc_release(v18);
    xpc_release(v23);
    xpc_array_append_value(v21, v20);
    xpc_release(v20);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK25CellularUsagePolicyClient23getDataUsagePolicy_syncEN8dispatch5blockIU13block_pointerFvPvEEERKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_27;
  v25 = *a2;
  if (*a2) {
    v25 = _Block_copy(v25);
  }
  aBlock = v25;
  xpc_object_t v28 = v21;
  if (v21) {
    xpc_retain(v21);
  }
  else {
    xpc_object_t v28 = xpc_null_create();
  }
  dispatch_async(global_queue, block);
  xpc_release(v28);
  xpc_object_t v28 = 0;
  if (aBlock) {
    _Block_release(aBlock);
  }
  xpc_release(v21);
}

void sub_23D387CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, xpc_object_t object)
{
  xpc_release(v19);
  xpc_release(v18);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK25CellularUsagePolicyClient23getDataUsagePolicy_syncEN8dispatch5blockIU13block_pointerFvPvEEERKNSt3__112basic_stringIcNS6_11char_traitsIcEENS6_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t CellularUsagePolicyClient::getDataUsagePolicy(uint64_t a1, char *a2, const void *a3)
{
  uint64_t result = 22;
  if (a2 && a3)
  {
    memset(&v13, 0, sizeof(v13));
    std::string::basic_string[abi:ne180100]<0>(&v13, a2);
    xpc_object_t v6 = _Block_copy(a3);
    size_t v7 = v6;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 1174405120;
    void v10[2] = ___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke;
    v10[3] = &__block_descriptor_tmp_31;
    void v10[4] = a1;
    if (v6) {
      xpc_object_t v8 = _Block_copy(v6);
    }
    else {
      xpc_object_t v8 = 0;
    }
    aBlock = v8;
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v13;
    }
    uint64_t v16 = 0;
    xpc_object_t v17 = 0;
    std::shared_ptr<ctu::XpcClient const>::shared_ptr[abi:ne180100]<ctu::XpcClient,void>(&v16, (void *)(a1 + 8));
    int v9 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
    block[3] = &unk_26F1139E8;
    block[5] = v16;
    xpc_object_t v15 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    void block[4] = v10;
    dispatch_async(v9, block);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v7) {
      _Block_release(v7);
    }
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
    return 0;
  }
  return result;
}

void sub_23D387F08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *aBlock, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v24) {
    _Block_release(v24);
  }
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1174405120;
  v4[2] = ___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_28;
  v4[4] = v3;
  if (v2) {
    uint64_t v2 = _Block_copy(v2);
  }
  aBlock = v2;
  if (*(char *)(a1 + 71) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
  }
  else {
    std::string __p = *(std::string *)(a1 + 48);
  }
  CellularUsagePolicyClient::fetchDataUsagePoliciesIfNeeded_sync(v3, v4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_23D388034(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *aBlock, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN25CellularUsagePolicyClient18getDataUsagePolicyEPKcU13block_pointerFvPvE_block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(const void **)(a1 + 40);
    if (v3) {
      xpc_object_t v5 = _Block_copy(v3);
    }
    else {
      xpc_object_t v5 = 0;
    }
    xpc_object_t v6 = v5;
    CellularUsagePolicyClient::getDataUsagePolicy_sync(v4, &v6, (unsigned __int8 **)(a1 + 48));
    if (v5) {
      _Block_release(v5);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2_cold_1();
    }
    xpc_null_create();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_23D38811C(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 40);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  a1[1].__r_.__value_.__r.__words[2] = (std::string::size_type)v4;
  xpc_object_t v5 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(void *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
}

void sub_23D388198(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(const void **)(v1 + 40);
  if (v3) {
    _Block_release(v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvPvEEE48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    _Block_release(v2);
  }
}

xpc_object_t std::copy[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>>(void **a1, void **a2, xpc_object_t *a3)
{
  long long v6 = *a1;
  v11[0] = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    v11[0] = xpc_null_create();
  }
  v11[1] = a1[1];
  size_t v7 = *a2;
  v10[0] = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    v10[0] = xpc_null_create();
  }
  v10[1] = a2[1];
  std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(v11, v10, a3, object);
  xpc_object_t v8 = object[2];
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v10[0]);
  v10[0] = 0;
  xpc_release(v11[0]);
  return v8;
}

void sub_23D3882C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12)
{
}

void ___ZN25CellularUsagePolicyClient10start_syncEv_block_invoke(uint64_t a1)
{
}

void CellularUsagePolicyClient::checkout_sync(xpc_connection_t *this)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v6 = 0;
  xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
  xpc::dict_creator::operator()<char const*>("kUnregisterCUPolicyClient", object, (uint64_t)"kRequest", (void **)buf);
  xpc_release(object[0]);
  uint64_t v2 = *(void **)buf;
  long long v6 = *(void **)buf;
  *(void *)buf = xpc_null_create();
  xpc_release(*(xpc_object_t *)buf);
  xpc_connection_send_message(this[5], v2);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    xpc::object::to_string((uint64_t *)object, (xpc::object *)&v6);
    if (v5 >= 0) {
      uint64_t v3 = object;
    }
    else {
      uint64_t v3 = (xpc_object_t *)object[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v3;
    _os_log_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Checking out with server: %s", buf, 0xCu);
    if (v5 < 0) {
      operator delete(object[0]);
    }
    uint64_t v2 = v6;
  }
  xpc_release(v2);
}

void sub_23D388424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

void CellularUsagePolicyClient::handleServerError_sync(uint64_t a1, void *a2)
{
  if (*a2 == MEMORY[0x263EF86A0] && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Connection interrupted", v2, 2u);
  }
}

void CellularUsagePolicyClient::~CellularUsagePolicyClient(xpc_object_t **this)
{
  *this = (xpc_object_t *)&unk_26F113778;
  std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy((uint64_t)(this + 13), this[14]);
  uint64_t v2 = this[12];
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = this[11];
  if (v3) {
    dispatch_release(v3);
  }
  MEMORY[0x23ECFEA50](this + 9);

  ctu::XpcClient::~XpcClient((ctu::XpcClient *)this);
}

{
  xpc_object_t *v2;
  NSObject *v3;
  uint64_t vars8;

  *this = (xpc_object_t *)&unk_26F113778;
  std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::destroy((uint64_t)(this + 13), this[14]);
  uint64_t v2 = this[12];
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = this[11];
  if (v3) {
    dispatch_release(v3);
  }
  MEMORY[0x23ECFEA50](this + 9);
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)this);

  JUMPOUT(0x23ECFEB30);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264E98018, MEMORY[0x263F8C060]);
}

void sub_23D388644(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  char v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    char v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::__tree_const_iterator<xpc::dict,std::__tree_node<xpc::dict,void *> *,long>,std::back_insert_iterator<xpc::array>>(uint64_t a1, void *a2, void *a3, xpc_object_t *a4)
{
  char v5 = a2;
  if (a2 != a3)
  {
    do
    {
      xpc_object_t v7 = (xpc_object_t)v5[4];
      if (v7) {
        xpc_retain((xpc_object_t)v5[4]);
      }
      else {
        xpc_object_t v7 = xpc_null_create();
      }
      xpc_array_append_value(*a4, v7);
      xpc_release(v7);
      uint64_t v8 = (void *)v5[1];
      if (v8)
      {
        do
        {
          int v9 = v8;
          uint64_t v8 = (void *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          int v9 = (void *)v5[2];
          BOOL v10 = *v9 == (void)v5;
          char v5 = v9;
        }
        while (!v10);
      }
      char v5 = v9;
    }
    while (v9 != a3);
    return a3;
  }
  return v5;
}

void sub_23D3887D8(_Unwind_Exception *a1)
{
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void std::__copy[abi:ne180100]<std::_ClassicAlgPolicy,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, void *a4@<X8>)
{
  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_23D388894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
}

void std::__dispatch_copy_or_move[abi:ne180100]<std::_ClassicAlgPolicy,std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, void *a4@<X8>)
{
  v9[0] = *a1;
  *a1 = xpc_null_create();
  v9[1] = a1[1];
  object[0] = *a2;
  *a2 = xpc_null_create();
  object[1] = a2[1];
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(v9, object, a3, a4);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9[0]);
}

void sub_23D388960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, uint64_t a10, xpc_object_t a11)
{
}

void std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(xpc_object_t *a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X2>, void *a4@<X8>)
{
  long long v21 = 0u;
  long long v22 = 0u;
  xpc_object_t v8 = *a1;
  v20[0] = v8;
  if (v8) {
    xpc_retain(v8);
  }
  else {
    v20[0] = xpc_null_create();
  }
  v20[1] = a1[1];
  v19[0] = *a2;
  *a2 = xpc_null_create();
  v19[1] = a2[1];
  std::__unwrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator>(v20, v19, (xpc_object_t *)&v21);
  xpc_release(v19[0]);
  v19[0] = 0;
  xpc_release(v20[0]);
  v20[0] = 0;
  xpc_object_t v16 = 0;
  xpc_object_t v17 = 0;
  uint64_t v18 = 0;
  v15[0] = (xpc_object_t)v21;
  *(void *)&long long v21 = xpc_null_create();
  v15[1] = *((xpc_object_t *)&v21 + 1);
  object[0] = (xpc_object_t)v22;
  *(void *)&long long v22 = xpc_null_create();
  object[1] = *((xpc_object_t *)&v22 + 1);
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>((uint64_t)v15, object, a3, &v16);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v15[0]);
  v15[0] = 0;
  v12[0] = *a1;
  *a1 = xpc_null_create();
  v12[1] = a1[1];
  v11[0] = v16;
  xpc_object_t v16 = xpc_null_create();
  v11[1] = v17;
  std::__rewrap_range[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,xpc::array::iterator>(v12, v11, v13);
  uint64_t v9 = v18;
  *a4 = v13[0];
  xpc_object_t v10 = xpc_null_create();
  v13[0] = v10;
  a4[1] = v13[1];
  a4[2] = v9;
  xpc_release(v10);
  v13[0] = 0;
  xpc_release(v11[0]);
  v11[0] = 0;
  xpc_release(v12[0]);
  v12[0] = 0;
  xpc_release(v16);
  xpc_release((xpc_object_t)v22);
  *(void *)&long long v22 = 0;
  xpc_release((xpc_object_t)v21);
}

void sub_23D388B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, xpc_object_t a12, uint64_t a13, uint64_t a14, uint64_t a15, xpc_object_t a16, uint64_t a17, xpc_object_t a18, uint64_t a19, xpc_object_t a20)
{
  xpc_release(object);
  xpc_release(a12);
  xpc_release(a20);
  std::pair<xpc::array::iterator,xpc::array::iterator>::~pair((xpc_object_t *)(v20 - 64));
  _Unwind_Resume(a1);
}

xpc_object_t *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<xpc::array::iterator,xpc::array::iterator,std::back_insert_iterator<xpc::array>>@<X0>(uint64_t a1@<X1>, void *a2@<X2>, xpc_object_t *a3@<X3>, xpc_object_t *a4@<X8>)
{
  xpc_object_t v12 = a3;
  for (uint64_t i = *(void *)(a1 + 8); i != a2[1] || *(void *)a1 != *a2; *(void *)(a1 + 8) = i)
  {
    v10[0] = a1;
    v10[1] = i;
    xpc::array::object_proxy::operator xpc::object((uint64_t)v10, &value);
    xpc_array_append_value(*a3, value);
    xpc_release(value);
    uint64_t i = *(void *)(a1 + 8) + 1;
  }
  return std::pair<xpc::array::iterator,std::back_insert_iterator<xpc::array>>::pair[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(a4, (xpc_object_t *)a1, (xpc_object_t *)&v12);
}

void sub_23D388CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object)
{
}

xpc_object_t *std::pair<xpc::array::iterator,xpc::array::iterator>::~pair(xpc_object_t *a1)
{
  a1[2] = 0;
  xpc_release(*a1);
  *a1 = 0;
  return a1;
}

xpc_object_t xpc::array::object_proxy::operator xpc::object@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t value = xpc_array_get_value(**(xpc_object_t **)a1, *(void *)(a1 + 8));
  *a2 = value;
  if (value) {
    return xpc_retain(value);
  }
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

xpc_object_t *std::pair<xpc::array::iterator,std::back_insert_iterator<xpc::array>>::pair[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>,0>(xpc_object_t *a1, xpc_object_t *a2, xpc_object_t *a3)
{
  *a1 = *a2;
  *a2 = xpc_null_create();
  a1[1] = a2[1];
  a1[2] = *a3;
  return a1;
}

BOOL CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()(uint64_t a1, void *a2, void *a3)
{
  xpc_object_t v13 = 0;
  uint64_t v14 = a2;
  xpc_object_t v15 = "kCUPolicyKeyBundleID";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&v14, &v13);
  xpc_object_t object = 0;
  uint64_t v14 = a3;
  xpc_object_t v15 = "kCUPolicyKeyBundleID";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&v14, &object);
  uint64_t v4 = MEMORY[0x23ECFEDA0](v13);
  uint64_t v5 = MEMORY[0x263EF8758];
  if (v4 == MEMORY[0x263EF8758] || MEMORY[0x23ECFEDA0](object) == v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    uint64_t v11 = 0;
    uint64_t v14 = 0;
    xpc_object_t v15 = 0;
    uint64_t v16 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v16) < 0) {
      operator delete(v14);
    }
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v9 = 0;
    uint64_t v14 = 0;
    xpc_object_t v15 = 0;
    uint64_t v16 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v16) < 0) {
      operator delete(v14);
    }
    BOOL v6 = (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v10, __p) & 0x80u) != 0;
    if (SHIBYTE(v9) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v11) < 0) {
      operator delete(v10[0]);
    }
  }
  xpc_release(object);
  xpc_release(v13);
  return v6;
}

void sub_23D388EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, xpc_object_t object)
{
  if (*(char *)(v19 - 17) < 0) {
    operator delete(*(void **)(v19 - 40));
  }
  if (a18 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v19 - 48));
  _Unwind_Resume(a1);
}

void *std::__tree<xpc::dict,CellularUsagePolicyClient::policy_cmp_by_bundleId,std::allocator<xpc::dict>>::__find_equal<xpc::dict>(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        xpc_object_t v8 = v4;
        uint64_t v9 = v4 + 4;
        if (!CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()(v7, a3, v4 + 4)) {
          break;
        }
        uint64_t v4 = (void *)*v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!CellularUsagePolicyClient::policy_cmp_by_bundleId::operator()(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = (void *)v8[1];
    }
    while (v4);
  }
  else
  {
    xpc_object_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
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
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
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

void std::__destroy_at[abi:ne180100]<xpc::dict,0>(xpc_object_t *a1)
{
  *a1 = 0;
}

void std::__shared_ptr_pointer<CellularUsagePolicyClient *,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient *)#1},std::allocator<CellularUsagePolicyClient>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x23ECFEB30);
}

void std::__shared_ptr_pointer<CellularUsagePolicyClient *,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient *)#1},std::allocator<CellularUsagePolicyClient>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<CellularUsagePolicyClient *,std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient *)#1},std::allocator<CellularUsagePolicyClient>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t std::shared_ptr<CellularUsagePolicyClient> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<CellularUsagePolicyClient>(CellularUsagePolicyClient*)::{lambda(CellularUsagePolicyClient*)#1}::operator() const(CellularUsagePolicyClient*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void *___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ___ZN25CellularUsagePolicyClient20getDataUsagePoliciesEU13block_pointerFvPvE_block_invoke_2_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_23D382000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to ping data usage policy server", v0, 2u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972A8](this, a2, a3);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x270F97570](this, a2, a3);
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x270F97740]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x270F97748]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x270F977E0]();
}

{
  return MEMORY[0x270F977F0]();
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x270F97948](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
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

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}