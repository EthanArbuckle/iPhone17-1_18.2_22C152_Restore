__n128 telephonytransport::TelephonyTransport::TelephonyTransport(uint64_t a1, __n128 *a2)
{
  __n128 result;

  *(void *)a1 = &unk_26C9ADA40;
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

void telephonytransport::TelephonyTransport::~TelephonyTransport(telephonytransport::TelephonyTransport *this)
{
  *(void *)this = &unk_26C9ADA40;
  v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

BOOL telephonytransport::isReadRequested(int a1)
{
  return a1 != 1;
}

BOOL telephonytransport::isWriteRequested(int a1)
{
  return a1 != 0;
}

BOOL telephonytransport::NetworkIfaceParams::readRequested(telephonytransport::NetworkIfaceParams *this)
{
  return *((_DWORD *)this + 14) != 1;
}

BOOL telephonytransport::NetworkIfaceParams::writeRequested(telephonytransport::NetworkIfaceParams *this)
{
  return *((_DWORD *)this + 14) != 0;
}

uint64_t telephonytransport::NetworkIfaceParams::isValid(telephonytransport::NetworkIfaceParams *this)
{
  if (*((char *)this + 23) < 0)
  {
    if (!*((void *)this + 1)) {
      return 0;
    }
  }
  else if (!*((unsigned char *)this + 23))
  {
    return 0;
  }
  if (*((_DWORD *)this + 14) == 1)
  {
    if (*((char *)this + 55) < 0)
    {
      if (*((void *)this + 5)) {
        return 0;
      }
    }
    else if (*((unsigned char *)this + 55))
    {
      return 0;
    }
  }
  return 1;
}

void telephonytransport::TCPSocketStream::create(telephonytransport *a1@<X0>, NSObject **a2@<X1>, void *a3@<X2>, int a4@<W3>, char *a5@<X4>, std::__shared_weak_count_vtbl **a6@<X8>)
{
  if (!*a3)
  {
    v16 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid socket descriptor";
LABEL_24:
      _os_log_error_impl(&dword_2185A0000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_18:
    *a6 = 0;
    a6[1] = 0;
    return;
  }
  if (a4 != 1)
  {
    uint64_t v18 = *((void *)a1 + 1);
    if (!v18 || *(void *)(v18 + 8) == -1)
    {
      v16 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v17 = "Delegate is mandatory";
        goto LABEL_24;
      }
    }
    else
    {
      if (*a2) {
        goto LABEL_3;
      }
      v16 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v17 = "Providing readQueue is mandatory when read mode is specified";
        goto LABEL_24;
      }
    }
    goto LABEL_18;
  }
LABEL_3:
  v12 = (std::__shared_weak_count_vtbl *)operator new(0x50uLL);
  v13 = *a2;
  dispatch_queue_t v20 = v13;
  if (v13) {
    dispatch_retain(v13);
  }
  telephonytransport::TCPSocketStream::TCPSocketStream((uint64_t)v12, (uint64_t)a1, &v20, (uint64_t)a3, a4, a5);
  v14 = (std::__shared_weak_count *)operator new(0x20uLL);
  v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADB80;
  v14->__shared_owners_ = 0;
  v14->__shared_weak_owners_ = 0;
  v14[1].__vftable = v12;
  if (v13) {
    dispatch_release(v13);
  }
  if (LODWORD(v12[1].__on_zero_shared) == 1
    || (BOOL started = telephonytransport::TCPSocketStream::startReading((telephonytransport::TCPSocketStream *)v12)))
  {
    *a6 = v12;
    a6[1] = (std::__shared_weak_count_vtbl *)v14;
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    v19 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)started);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2185A0000, v19, OS_LOG_TYPE_ERROR, "Failed to initialize", buf, 2u);
    }
    *a6 = 0;
    a6[1] = 0;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
}

void sub_2185A14B8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::TCPSocketStream::init(telephonytransport::TCPSocketStream *this)
{
  return *((_DWORD *)this + 14) == 1 || telephonytransport::TCPSocketStream::startReading(this);
}

uint64_t telephonytransport::TCPSocketStream::TCPSocketStream(uint64_t a1, uint64_t a2, dispatch_queue_t *a3, uint64_t a4, int a5, char *a6)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpsockstream", a6, (void *)(a1 + 24));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)a1 = &unk_26C9ADAB0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)a4;
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(_DWORD *)(a1 + 56) = a5;
  *(void *)(a1 + 64) = 0;
  v11 = *a3;
  if (*a3)
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v11, 0);
    v13 = dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
    if (*a3) {
      v11 = dispatch_queue_create_with_target_V2("TCPSocketStream", v13, *a3);
    }
    else {
      v11 = dispatch_queue_create("TCPSocketStream", v13);
    }
  }
  *(void *)(a1 + 72) = v11;
  return a1;
}

void telephonytransport::TCPSocketStream::~TCPSocketStream(telephonytransport::TCPSocketStream *this)
{
  *(void *)this = &unk_26C9ADAB0;
  v2 = *((void *)this + 8);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  v3 = *((void *)this + 9);
  if (v3) {
    dispatch_release(v3);
  }
  v4 = *((void *)this + 8);
  if (v4) {
    dispatch_release(v4);
  }
  v5 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  *(void *)this = &unk_26C9ADA40;
  v6 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  v7 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::TCPSocketStream::~TCPSocketStream(this);

  operator delete(v1);
}

BOOL telephonytransport::TCPSocketStream::startReading(telephonytransport::TCPSocketStream *this)
{
  if (*((void *)this + 8))
  {
    v3 = (NSObject **)*((void *)this + 3);
    v2 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v2)
    {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
      v4 = *v3;
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    else
    {
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2185A0000, v4, OS_LOG_TYPE_ERROR, "Already started reading", buf, 2u);
    }
    return 1;
  }
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF83E8], *(int *)(*((void *)this + 5) + 16), 0, *((dispatch_queue_t *)this + 9));
  v6 = *((void *)this + 8);
  *((void *)this + 8) = v5;
  if (v6)
  {
    dispatch_release(v6);
    dispatch_source_t v5 = (dispatch_source_t)*((void *)this + 8);
  }
  if (v5)
  {
    uint64_t v8 = *((void *)this + 1);
    v7 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    int v9 = *(_DWORD *)(*((void *)this + 5) + 16);
    v10 = (std::__shared_weak_count *)operator new(0x10018uLL);
    v10->__shared_owners_ = 0;
    v10->__shared_weak_owners_ = 0;
    v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADBF8;
    bzero(&v10[1], 0x10000uLL);
    uint64_t v11 = *((void *)this + 3);
    v12 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v13 = *((void *)this + 8);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 1174405120;
    handler[2] = ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = v8;
    v30 = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    int v35 = v9;
    v31 = v10 + 1;
    v32 = v10;
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v33 = v11;
    v34 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_source_set_event_handler(v13, handler);
    *(void *)buf = 0;
    v23 = buf;
    uint64_t v24 = 0x3802000000;
    v25 = __Block_byref_object_copy_;
    uint64_t v15 = *((void *)this + 5);
    v14 = (std::__shared_weak_count *)*((void *)this + 6);
    v26 = __Block_byref_object_dispose_;
    uint64_t v27 = v15;
    v28 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v16 = *((void *)this + 8);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 1107296256;
    v21[2] = ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke_3;
    v21[3] = &__block_descriptor_tmp_4_0;
    v21[4] = buf;
    dispatch_source_set_cancel_handler(v16, v21);
    dispatch_resume(*((dispatch_object_t *)this + 8));
    _Block_object_dispose(buf, 8);
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    if (v30) {
      std::__shared_weak_count::__release_weak(v30);
    }
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    if (v7) {
      std::__shared_weak_count::__release_weak(v7);
    }
    return 1;
  }
  v19 = (NSObject **)*((void *)this + 3);
  uint64_t v18 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v18)
  {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    dispatch_queue_t v20 = *v19;
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  else
  {
    dispatch_queue_t v20 = *v19;
  }
  BOOL result = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2185A0000, v20, OS_LOG_TYPE_ERROR, "Unable to create read source", buf, 2u);
    return 0;
  }
  return result;
}

void sub_2185A1A48(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL telephonytransport::TCPSocketStream::write(telephonytransport::TCPSocketStream *this, const unsigned __int8 *a2, unint64_t a3)
{
  v3 = this;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!*((_DWORD *)this + 14))
  {
    dispatch_source_t v5 = (NSObject **)*((void *)this + 3);
    v4 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      v3 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      v3 = *v5;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v16) = 0;
      _os_log_fault_impl(&dword_2185A0000, v3, OS_LOG_TYPE_FAULT, "Write is not supported", (uint8_t *)&v16, 2u);
    }
    __break(1u);
  }
  unint64_t v6 = a3;
  if (!a3) {
    return 1;
  }
  v7 = a2;
  unint64_t v8 = 0;
  while (1)
  {
    ssize_t v9 = send(*((_DWORD *)v3[5].isa + 4), &v7[v8], v6 - v8, 0);
    if (v9 == -1) {
      break;
    }
    v8 += v9;
LABEL_14:
    if (v8 >= v6) {
      return 1;
    }
  }
  if (*__error() == 35 || *__error() == 35) {
    goto LABEL_14;
  }
  isa = (NSObject **)v3[3].isa;
  uint64_t v11 = (std::__shared_weak_count *)v3[4].isa;
  if (v11)
  {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    v13 = *isa;
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  else
  {
    v13 = *isa;
  }
  BOOL result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v14 = __error();
    uint64_t v15 = strerror(*v14);
    int v16 = 136315138;
    v17 = v15;
    _os_log_error_impl(&dword_2185A0000, v13, OS_LOG_TYPE_ERROR, "Write failed: %s", (uint8_t *)&v16, 0xCu);
    return 0;
  }
  return result;
}

void ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      v4 = v3;
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5)
      {
        ssize_t v6 = recv(*(_DWORD *)(a1 + 80), *(void **)(a1 + 48), 0x10000uLL, 0);
        if (v6 == -1)
        {
          if (*__error() != 35 && *__error() != 35)
          {
            v10 = **(NSObject ***)(a1 + 64);
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              uint64_t v11 = __error();
              v12 = strerror(*v11);
              int v13 = 136315138;
              v14 = v12;
              _os_log_error_impl(&dword_2185A0000, v10, OS_LOG_TYPE_ERROR, "Error encountered while reading: %s", (uint8_t *)&v13, 0xCu);
            }
            exit(1);
          }
          v7 = **(NSObject ***)(a1 + 64);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v8 = __error();
            ssize_t v9 = strerror(*v8);
            int v13 = 136315138;
            v14 = v9;
            _os_log_debug_impl(&dword_2185A0000, v7, OS_LOG_TYPE_DEBUG, "Read issue: %s", (uint8_t *)&v13, 0xCu);
          }
        }
        else if (v6)
        {
          (*(void (**)(uint64_t, void, ssize_t))(*(void *)v5 + 16))(v5, *(void *)(a1 + 48), v6);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

void sub_2185A1DB8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE48c48_ZTSKNSt3__110shared_ptrINS_5arrayIhLm65536EEEEE64c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[7];
  result[6] = a2[6];
  result[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a2[9];
  result[8] = a2[8];
  result[9] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE48c48_ZTSKNSt3__110shared_ptrINS_5arrayIhLm65536EEEEE64c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[9];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[7];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[5];
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN18telephonytransport15TCPSocketStream12startReadingEv_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 48);
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

void std::__shared_ptr_pointer<telephonytransport::TCPSocketStream *,std::shared_ptr<telephonytransport::TCPSocketStream>::__shared_ptr_default_delete<telephonytransport::TCPSocketStream,telephonytransport::TCPSocketStream>,std::allocator<telephonytransport::TCPSocketStream>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPSocketStream *,std::shared_ptr<telephonytransport::TCPSocketStream>::__shared_ptr_default_delete<telephonytransport::TCPSocketStream,telephonytransport::TCPSocketStream>,std::allocator<telephonytransport::TCPSocketStream>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPSocketStream *,std::shared_ptr<telephonytransport::TCPSocketStream>::__shared_ptr_default_delete<telephonytransport::TCPSocketStream,telephonytransport::TCPSocketStream>,std::allocator<telephonytransport::TCPSocketStream>>::__get_deleter(uint64_t a1, uint64_t a2)
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

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__shared_ptr_emplace<std::array<unsigned char,65536ul>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADBF8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::array<unsigned char,65536ul>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADBF8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t telephonytransport::getDefaultOSLogHandle(telephonytransport *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&_MergedGlobals))
  {
    telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"default", (const char *)&unk_2185C7DB6, &qword_267BD5A98);
    __cxa_atexit((void (*)(void *))std::shared_ptr<telephonytransport::OSLogHandle>::~shared_ptr[abi:ne180100], &qword_267BD5A98, &dword_2185A0000);
    __cxa_guard_release(&_MergedGlobals);
  }
  return qword_267BD5A98;
}

void sub_2185A2134(_Unwind_Exception *a1)
{
}

uint64_t std::shared_ptr<telephonytransport::OSLogHandle>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

uint64_t telephonytransport::getMacAddress(telephonytransport *this, char *a2, unsigned __int8 *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17 = 0;
  uint64_t v5 = (telephonytransport *)getifaddrs(&v17);
  if (v5)
  {
    ssize_t v6 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v7 = "Unable to get interface addresses";
      unint64_t v8 = v6;
      uint32_t v9 = 2;
LABEL_15:
      _os_log_error_impl(&dword_2185A0000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v10 = v17;
  if (!v17)
  {
LABEL_8:
    v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v5);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = this;
      v7 = "Couldn't find mac address for interface: %s";
      unint64_t v8 = v12;
      uint32_t v9 = 12;
      goto LABEL_15;
    }
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_10;
  }
  while (1)
  {
    uint64_t v5 = (telephonytransport *)strcmp((const char *)this, v10->ifa_name);
    if (!v5)
    {
      ifa_addr = v10->ifa_addr;
      if (ifa_addr->sa_data[4] == 6) {
        break;
      }
    }
    v10 = v10->ifa_next;
    if (!v10) {
      goto LABEL_8;
    }
  }
  uint64_t v15 = &ifa_addr->sa_len + ifa_addr->sa_data[3];
  int v16 = *((_DWORD *)v15 + 2);
  *((_WORD *)a2 + 2) = *((_WORD *)v15 + 6);
  *(_DWORD *)a2 = v16;
  uint64_t v13 = 1;
LABEL_10:
  if (v17) {
    MEMORY[0x21D46D910]();
  }
  return v13;
}

void telephonytransport::toString(const __CFString *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  if (this)
  {
    CFIndex Length = CFStringGetLength(this);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    v16.location = 0;
    v16.length = Length;
    CFIndex Bytes = CFStringGetBytes(this, v16, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    if (usedBufLen && Bytes != 0)
    {
      memset(__p, 170, sizeof(__p));
      std::vector<unsigned char>::vector(__p, usedBufLen);
      v17.location = 0;
      v17.length = Length;
      if (CFStringGetBytes(this, v17, 0x8000100u, 0, 0, (UInt8 *)__p[0], (char *)__p[1] - (char *)__p[0], 0))
      {
        unint64_t v8 = (char *)__p[0];
        uint32_t v9 = (char *)__p[1];
        int64_t v10 = (char *)__p[1] - (char *)__p[0];
        uint64_t v11 = (unsigned char *)a2;
        if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x17)
        {
          std::string::__grow_by((std::string *)a2, 0x16uLL, v10 - 22, 0, 0, 0, 0);
          *(void *)(a2 + 8) = 0;
          uint64_t v11 = *(unsigned char **)a2;
          if (*(char *)(a2 + 23) >= 0) {
            uint64_t v11 = (unsigned char *)a2;
          }
        }
        if (v9 != v8)
        {
          int64_t v12 = v10;
          do
          {
            char v13 = *v8++;
            *v11++ = v13;
            --v12;
          }
          while (v12);
        }
        unsigned char *v11 = 0;
        if (*(char *)(a2 + 23) < 0) {
          *(void *)(a2 + 8) = v10;
        }
        else {
          *(unsigned char *)(a2 + 23) = v10 & 0x7F;
        }
      }
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
}

void sub_2185A2440(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (*(char *)(v12 + 23) < 0) {
    operator delete(*(void **)v12);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_2185A24CC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264329F98, MEMORY[0x263F8C060]);
}

void sub_2185A258C(_Unwind_Exception *a1)
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void telephonytransport::TCPServer::create(telephonytransport *a1@<X0>, NSObject **a2@<X1>, long long *a3@<X2>, long long *a4@<X3>, int a5@<W4>, char *a6@<X5>, telephonytransport::TCPServer **a7@<X8>)
{
  uint64_t v8 = *((void *)a1 + 1);
  if (!v8 || *(void *)(v8 + 8) == -1)
  {
    CFRange v17 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "Must provide a valid delegate";
      v19 = buf;
      goto LABEL_16;
    }
LABEL_8:
    *a7 = 0;
    a7[1] = 0;
    return;
  }
  uint32_t v9 = *a2;
  if (!*a2)
  {
    CFRange v17 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = 0;
      uint64_t v18 = "Providing acceptQueue is mandatory";
      v19 = (uint8_t *)&v21;
LABEL_16:
      _os_log_error_impl(&dword_2185A0000, v17, OS_LOG_TYPE_ERROR, v18, v19, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v15 = (telephonytransport::TCPServer *)operator new(0x78uLL);
  uint64_t v20 = v9;
  dispatch_retain(v9);
  telephonytransport::TCPServer::TCPServer((uint64_t)v15, (uint64_t)a1, &v20, a3, a4, a5, a6);
  CFRange v16 = (std::__shared_weak_count *)operator new(0x20uLL);
  v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADCE0;
  v16->__shared_owners_ = 0;
  v16->__shared_weak_owners_ = 0;
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)v15;
  dispatch_release(v9);
  if (telephonytransport::TCPServer::init(v15) && telephonytransport::TCPServer::startServer(v15))
  {
    *a7 = v15;
    a7[1] = (telephonytransport::TCPServer *)v16;
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    *a7 = 0;
    a7[1] = 0;
  }

  std::__shared_weak_count::__release_shared[abi:ne180100](v16);
}

void sub_2185A27B0(_Unwind_Exception *a1)
{
  telephonytransport::TCPServer::~TCPServer(v1);
  operator delete(v4);
  dispatch_release(v2);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::TCPServer::init(telephonytransport::TCPServer *this)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)socket(2, 1, 0);
  telephonytransport::NetworkSocket::created(v2, v29);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 13);
  uint64_t v4 = *(void *)v29;
  *((_OWORD *)this + 6) = *(_OWORD *)v29;
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    uint64_t v5 = *((void *)this + 12);
    if (v5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = *(NSObject ***)this;
    v7 = (std::__shared_weak_count *)*((void *)this + 1);
    if (v7)
    {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      uint32_t v9 = *v8;
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    else
    {
      uint32_t v9 = *v8;
    }
    BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)v29 = 0;
      CFRange v17 = "Failed to create socket";
      uint64_t v18 = v9;
      uint32_t v19 = 2;
LABEL_41:
      _os_log_error_impl(&dword_2185A0000, v18, OS_LOG_TYPE_ERROR, v17, v29, v19);
      return 0;
    }
    return result;
  }
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  if (*((char *)this + 63) < 0) {
    uint64_t v6 = *((void *)this + 6);
  }
  else {
    uint64_t v6 = *((unsigned __int8 *)this + 63);
  }
  int64_t v10 = (void *)((char *)this + 40);
  if (v6)
  {
    BOOL result = telephonytransport::NetworkSocket::bindToInterface(v5, (const char *)this + 40);
    if (!result) {
      return result;
    }
  }
  *(_DWORD *)&v32.sa_data[10] = 0;
  *(void *)&v32.sa_data[2] = 0;
  *(_WORD *)v32.sa_data = bswap32(*((unsigned __int16 *)this + 44)) >> 16;
  *(_WORD *)&v32.sa_len = 528;
  uint64_t v12 = (const char **)((char *)this + 64);
  if (*((char *)this + 87) < 0)
  {
    if (!*((void *)this + 9)) {
      goto LABEL_17;
    }
    char v13 = *v12;
  }
  else
  {
    char v13 = (char *)this + 64;
    if (!*((unsigned char *)this + 87))
    {
LABEL_17:
      BOOL result = telephonytransport::NetworkSocket::setNonBlockingAndNoSigpipe(*((telephonytransport::NetworkSocket **)this
                                                                             + 12));
      if (result)
      {
        BOOL result = telephonytransport::NetworkSocket::enablePortReuse(*((telephonytransport::NetworkSocket **)this + 12));
        if (result)
        {
          if (!bind(*(_DWORD *)(*((void *)this + 12) + 16), &v32, 0x10u)) {
            return 1;
          }
          uint64_t v15 = *(NSObject ***)this;
          v14 = (std::__shared_weak_count *)*((void *)this + 1);
          if (v14)
          {
            atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
            CFRange v16 = *v15;
            std::__shared_weak_count::__release_shared[abi:ne180100](v14);
          }
          else
          {
            CFRange v16 = *v15;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            if (*((char *)this + 87) < 0) {
              uint64_t v12 = (const char **)*v12;
            }
            int v28 = *((_DWORD *)this + 22);
            if (*((char *)this + 63) < 0) {
              int64_t v10 = (void *)*v10;
            }
            *(_DWORD *)v29 = 136315650;
            *(void *)&v29[4] = v12;
            *(_WORD *)&v29[12] = 1024;
            *(_DWORD *)&v29[14] = v28;
            __int16 v30 = 2080;
            v31 = v10;
            _os_log_error_impl(&dword_2185A0000, v16, OS_LOG_TYPE_ERROR, "Unable to bind to %s:%u - %s", v29, 0x1Cu);
          }
          uint64_t v24 = *(NSObject ***)this;
          v23 = (std::__shared_weak_count *)*((void *)this + 1);
          if (v23)
          {
            atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
            v25 = *v24;
            std::__shared_weak_count::__release_shared[abi:ne180100](v23);
          }
          else
          {
            v25 = *v24;
          }
          BOOL result = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
          if (result)
          {
            v26 = __error();
            uint64_t v27 = strerror(*v26);
            *(_DWORD *)v29 = 136315138;
            *(void *)&v29[4] = v27;
            CFRange v17 = "%s";
            uint64_t v18 = v25;
LABEL_40:
            uint32_t v19 = 12;
            goto LABEL_41;
          }
        }
      }
      return result;
    }
  }
  if (inet_pton(2, v13, &v32.sa_data[2]) == 1) {
    goto LABEL_17;
  }
  __int16 v21 = *(NSObject ***)this;
  uint64_t v20 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v20)
  {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    v22 = *v21;
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  else
  {
    v22 = *v21;
  }
  BOOL result = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  if (result)
  {
    if (*((char *)this + 87) < 0) {
      uint64_t v12 = (const char **)*v12;
    }
    *(_DWORD *)v29 = 136315138;
    *(void *)&v29[4] = v12;
    CFRange v17 = "Invalid address: %s";
    uint64_t v18 = v22;
    goto LABEL_40;
  }
  return result;
}

BOOL telephonytransport::TCPServer::startServer(telephonytransport::TCPServer *this)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (listen(*(_DWORD *)(*((void *)this + 12) + 16), 5))
  {
    uint64_t v3 = *(NSObject ***)this;
    uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
    if (v2)
    {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v4 = *v3;
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    else
    {
      uint64_t v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)((char *)this + 64);
      if (*((char *)this + 87) < 0) {
        v26 = (void *)*v26;
      }
      int v27 = *((_DWORD *)this + 22);
      int v28 = (void *)((char *)this + 40);
      if (*((char *)this + 63) < 0) {
        int v28 = (void *)*v28;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v27;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v28;
      _os_log_error_impl(&dword_2185A0000, v4, OS_LOG_TYPE_ERROR, "Failed to listen for %s:%u - %s", buf, 0x1Cu);
    }
    uint64_t v18 = *(NSObject ***)this;
    CFRange v17 = (std::__shared_weak_count *)*((void *)this + 1);
    if (v17)
    {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      uint32_t v19 = *v18;
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    else
    {
      uint32_t v19 = *v18;
    }
    BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    v29 = __error();
    __int16 v30 = strerror(*v29);
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v30;
    v23 = "%s";
    uint64_t v24 = v19;
    uint32_t v25 = 12;
LABEL_46:
    _os_log_error_impl(&dword_2185A0000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
    return 0;
  }
  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x263EF83E8], *(int *)(*((void *)this + 12) + 16), 0, *((dispatch_queue_t *)this + 4));
  uint64_t v6 = *((void *)this + 14);
  *((void *)this + 14) = v5;
  if (v6)
  {
    dispatch_release(v6);
    dispatch_source_t v5 = (dispatch_source_t)*((void *)this + 14);
  }
  if (!v5)
  {
    __int16 v21 = *(NSObject ***)this;
    uint64_t v20 = (std::__shared_weak_count *)*((void *)this + 1);
    if (v20)
    {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
      v22 = *v21;
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    else
    {
      v22 = *v21;
    }
    BOOL result = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    v23 = "Unable to create accept source";
    uint64_t v24 = v22;
    uint32_t v25 = 2;
    goto LABEL_46;
  }
  int v7 = *(_DWORD *)(*((void *)this + 12) + 16);
  uint64_t v8 = *((void *)this + 2);
  uint32_t v9 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int64_t v10 = *(NSObject ***)this;
  uint64_t v11 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = *((void *)this + 14);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  handler[4] = v8;
  uint64_t v33 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v36 = v7;
  v34 = v10;
  int v35 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_source_set_event_handler(v12, handler);
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3802000000;
  *(void *)&buf[24] = __Block_byref_object_copy__0;
  uint64_t v14 = *((void *)this + 12);
  char v13 = (std::__shared_weak_count *)*((void *)this + 13);
  v38 = __Block_byref_object_dispose__0;
  uint64_t v39 = v14;
  v40 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v15 = *((void *)this + 14);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 1107296256;
  v31[2] = ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke_2;
  v31[3] = &__block_descriptor_tmp_3;
  v31[4] = buf;
  dispatch_source_set_cancel_handler(v15, v31);
  dispatch_resume(*((dispatch_object_t *)this + 14));
  _Block_object_dispose(buf, 8);
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
  if (v33) {
    std::__shared_weak_count::__release_weak(v33);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  return 1;
}

uint64_t telephonytransport::TCPServer::TCPServer(uint64_t a1, uint64_t a2, NSObject **a3, long long *a4, long long *a5, int a6, char *a7)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpserver", a7, (void *)a1);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  char v13 = *a3;
  *(void *)(a1 + 32) = *a3;
  if (v13) {
    dispatch_retain(v13);
  }
  long long v14 = *a4;
  *(void *)(a1 + 56) = *((void *)a4 + 2);
  *(_OWORD *)(a1 + 40) = v14;
  *((void *)a4 + 1) = 0;
  *((void *)a4 + 2) = 0;
  *(void *)a4 = 0;
  long long v15 = *a5;
  *(void *)(a1 + 80) = *((void *)a5 + 2);
  *(_OWORD *)(a1 + 64) = v15;
  *((void *)a5 + 1) = 0;
  *((void *)a5 + 2) = 0;
  *(void *)a5 = 0;
  *(_DWORD *)(a1 + 88) = a6;
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 96) = 0;
  return a1;
}

void telephonytransport::TCPServer::~TCPServer(telephonytransport::TCPServer *this)
{
  uint64_t v2 = *((void *)this + 14);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *((void *)this + 14);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 13);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (*((char *)this + 87) < 0) {
    operator delete(*((void **)this + 8));
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  dispatch_source_t v5 = *((void *)this + 4);
  if (v5) {
    dispatch_release(v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  int v7 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

void ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      uint64_t v4 = v3;
      dispatch_source_t v5 = *(void (****)(void, unint64_t *))(a1 + 32);
      if (v5)
      {
        unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v11 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
        uint64_t v6 = (void *)accept(*(_DWORD *)(a1 + 64), 0, 0);
        telephonytransport::NetworkSocket::created(v6, &v10);
        if (v10)
        {
          (**v5)(v5, &v10);
        }
        else
        {
          int v7 = **(NSObject ***)(a1 + 48);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            uint64_t v8 = __error();
            uint32_t v9 = strerror(*v8);
            *(_DWORD *)buf = 136315138;
            char v13 = v9;
            _os_log_error_impl(&dword_2185A0000, v7, OS_LOG_TYPE_ERROR, "Accept failed: %s", buf, 0xCu);
          }
        }
        if (v11) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v11);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

void sub_2185A3190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c65_ZTSKNSt3__18weak_ptrIN18telephonytransport17TCPServerDelegateEEE48c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[7];
  result[6] = a2[6];
  result[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c65_ZTSKNSt3__18weak_ptrIN18telephonytransport17TCPServerDelegateEEE48c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN18telephonytransport9TCPServer11startServerEv_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 48);
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 48) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void std::__shared_ptr_pointer<telephonytransport::TCPServer *,std::shared_ptr<telephonytransport::TCPServer>::__shared_ptr_default_delete<telephonytransport::TCPServer,telephonytransport::TCPServer>,std::allocator<telephonytransport::TCPServer>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::TCPServer *,std::shared_ptr<telephonytransport::TCPServer>::__shared_ptr_default_delete<telephonytransport::TCPServer,telephonytransport::TCPServer>,std::allocator<telephonytransport::TCPServer>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(telephonytransport::TCPServer **)(a1 + 24);
  if (v1)
  {
    telephonytransport::TCPServer::~TCPServer(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPServer *,std::shared_ptr<telephonytransport::TCPServer>::__shared_ptr_default_delete<telephonytransport::TCPServer,telephonytransport::TCPServer>,std::allocator<telephonytransport::TCPServer>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL telephonytransport::toDataMessageType(telephonytransport *this)
{
  return this == 1;
}

void telephonytransport::TransactionManager::add(std::mutex *this@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  std::mutex::lock(this);
  uint64_t v6 = (char *)operator new(0xA8uLL);
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *((void *)v6 + 3) = 850045863;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((void *)v6 + 10) = 0;
  *((void *)v6 + 11) = 1018212795;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *(_OWORD *)(v6 + 124) = 0u;
  *(void *)uint64_t v6 = &unk_26C9ADD58;
  CFRange v17 = v6;
  opaque = (uint64_t **)this[1].__m_.__opaque;
  int v7 = *(uint64_t **)this[1].__m_.__opaque;
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        uint32_t v9 = (uint64_t **)v7;
        unint64_t v10 = v7[4];
        if (v10 <= a2) {
          break;
        }
        int v7 = *v9;
        opaque = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v10 >= a2) {
        break;
      }
      int v7 = v9[1];
      if (!v7)
      {
        opaque = v9 + 1;
        goto LABEL_9;
      }
    }
    uint64_t v14 = std::promise<telephonytransport::TransactionResponse>::~promise((uint64_t *)&v17);
    long long v15 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      __int16 v16 = 0;
      _os_log_fault_impl(&dword_2185A0000, v15, OS_LOG_TYPE_FAULT, "Emplace should always succeed (duplicate txnId is fatal)", (uint8_t *)&v16, 2u);
    }
    __break(1u);
  }
  else
  {
    uint32_t v9 = (uint64_t **)this[1].__m_.__opaque;
LABEL_9:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = a2;
    v11[5] = (uint64_t)v6;
    CFRange v17 = 0;
    uint64_t *v11 = 0;
    v11[1] = 0;
    v11[2] = (uint64_t)v9;
    *opaque = v11;
    uint64_t v12 = *(void *)this[1].__m_.__sig;
    char v13 = v11;
    if (v12)
    {
      this[1].__m_.__sig = v12;
      char v13 = *opaque;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)this[1].__m_.__opaque, v13);
    ++*(void *)&this[1].__m_.__opaque[8];
    std::promise<telephonytransport::TransactionResponse>::~promise((uint64_t *)&v17);
    std::promise<telephonytransport::TransactionResponse>::get_future(a3, v11[5]);
    std::mutex::unlock(this);
  }
}

void sub_2185A34D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  std::mutex::unlock(v10);
  _Unwind_Resume(a1);
}

void std::promise<telephonytransport::TransactionResponse>::get_future(void *a1, uint64_t a2)
{
  if (!a2) {
    std::__throw_future_error[abi:ne180100](3u);
  }
  *a1 = a2;
  uint64_t v3 = (std::mutex *)(a2 + 24);
  std::mutex::lock((std::mutex *)(a2 + 24));
  int v4 = *(_DWORD *)(a2 + 136);
  if ((v4 & 2) != 0) {
    std::__throw_future_error[abi:ne180100](1u);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(a2 + 8), 1uLL, memory_order_relaxed);
  *(_DWORD *)(a2 + 136) = v4 | 2;
  std::mutex::unlock(v3);
}

void sub_2185A3574(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::TransactionManager::fulfilPromise(uint64_t a1, unint64_t a2, int a3, long long *a4)
{
  std::mutex::lock((std::mutex *)a1);
  uint64_t v8 = *(void **)(a1 + 72);
  if (!v8) {
    goto LABEL_12;
  }
  uint32_t v9 = (void *)(a1 + 72);
  do
  {
    unint64_t v10 = v8[4];
    BOOL v11 = v10 >= a2;
    if (v10 >= a2) {
      uint64_t v12 = v8;
    }
    else {
      uint64_t v12 = v8 + 1;
    }
    if (v11) {
      uint32_t v9 = v8;
    }
    uint64_t v8 = (void *)*v12;
  }
  while (*v12);
  if (v9 != (void *)(a1 + 72) && v9[4] <= a2)
  {
    LODWORD(v15) = a3;
    long long v16 = *a4;
    *(void *)a4 = 0;
    *((void *)a4 + 1) = 0;
    std::promise<telephonytransport::TransactionResponse>::set_value(v9 + 5, (uint64_t)&v15);
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    unint64_t v15 = a2;
    std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__erase_unique<unsigned long long>(a1 + 64, &v15);
    uint64_t v13 = 1;
  }
  else
  {
LABEL_12:
    uint64_t v13 = 0;
  }
  std::mutex::unlock((std::mutex *)a1);
  return v13;
}

void sub_2185A3664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  std::mutex::unlock(v12);
  _Unwind_Resume(a1);
}

void std::promise<telephonytransport::TransactionResponse>::set_value(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (!v2) {
    std::__throw_future_error[abi:ne180100](3u);
  }

  std::__assoc_state<telephonytransport::TransactionResponse>::set_value<telephonytransport::TransactionResponse>(v2, a2);
}

void telephonytransport::TransactionManager::remove(std::mutex *this, unint64_t a2)
{
  std::mutex::lock(this);
  unint64_t v4 = a2;
  std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__erase_unique<unsigned long long>((uint64_t)&this[1], &v4);
  std::mutex::unlock(this);
}

void sub_2185A3708(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void std::__assoc_state<telephonytransport::TransactionResponse>::~__assoc_state(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);

  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = MEMORY[0x263F8C320] + 16;
  uint64_t v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);

  operator delete(v3);
}

uint64_t std::__assoc_state<telephonytransport::TransactionResponse>::__on_zero_shared(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 136))
  {
    uint64_t v2 = *(std::__shared_weak_count **)(a1 + 160);
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
  }
  uint64_t v3 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 8);

  return v3(a1);
}

uint64_t *std::promise<telephonytransport::TransactionResponse>::~promise(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((*(unsigned char *)(v2 + 136) & 1) == 0)
    {
      v7.__ptr_ = 0;
      uint64_t v3 = *(void *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v7);
      uint64_t v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        unint64_t v4 = std::future_category();
        MEMORY[0x21D46D570](v6, 4, v4);
        std::make_exception_ptr[abi:ne180100]<std::future_error>(v6);
      }
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v2 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
    }
  }
  return a1;
}

void std::make_exception_ptr[abi:ne180100]<std::future_error>(const std::logic_error *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::logic_error::logic_error(exception, a1);
  v3->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C2E0] + 16);
  v3[1] = a1[1];
  __cxa_throw(v3, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_2185A39C4(void *a1)
{
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
      unint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), dispatch_source_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint32_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint32_t v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint32_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
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
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), dispatch_source_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
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
        uint64_t *v2 = (uint64_t)v3;
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

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  exception = __cxa_allocate_exception(0x20uLL);
  uint64_t v3 = std::future_category();
  MEMORY[0x21D46D570](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x263F8C1A0], MEMORY[0x263F8C0C0]);
}

void sub_2185A3BD0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__assoc_state<telephonytransport::TransactionResponse>::set_value<telephonytransport::TransactionResponse>(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (std::mutex *)(a1 + 24);
  std::mutex::lock((std::mutex *)(a1 + 24));
  if ((*(unsigned char *)(a1 + 136) & 1) != 0
    || (v7.__ptr_ = 0, uint64_t v5 = *(void *)(a1 + 16), std::exception_ptr::~exception_ptr(&v7), v5))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  *(_DWORD *)(a1 + 144) = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 152) = *(void *)(a2 + 8);
  *(void *)(a1 + 160) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(a1 + 136) |= 5u;
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 88));
  std::mutex::unlock(v4);
}

void sub_2185A3C8C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__erase_unique<unsigned long long>(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  unint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      std::exception_ptr v7 = v2;
    }
    else {
      std::exception_ptr v7 = v2 + 1;
    }
    if (v6) {
      unint64_t v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__remove_node_pointer((uint64_t **)a1, v4);
  std::promise<telephonytransport::TransactionResponse>::~promise(v4 + 5);
  operator delete(v4);
  return 1;
}

uint64_t *std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
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
    unint64_t v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      unint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    unint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      unint64_t v4 = (uint64_t *)*v4;
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
  std::exception_ptr v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      std::exception_ptr v7 = 0;
      __n128 result = (uint64_t *)v2;
    }
    else
    {
      std::exception_ptr v7 = v6[1];
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
      __n128 result = v3;
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
    if (*(uint64_t **)v12 != v7) {
      break;
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
        __n128 result = v7;
      }
      std::exception_ptr v7 = *(uint64_t **)v12;
    }
    uint32_t v19 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_68;
    }
    uint64_t v20 = (uint64_t *)v7[1];
    if (v20 && !*((unsigned char *)v20 + 24))
    {
      if (v19 && !*((unsigned char *)v19 + 24))
      {
LABEL_68:
        uint64_t v20 = v7;
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
        *uint64_t v20 = (uint64_t)v7;
        v7[2] = (uint64_t)v20;
        uint32_t v19 = v7;
      }
      uint64_t v23 = v20[2];
      *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      uint64_t v24 = *(uint64_t **)v23;
      uint64_t v27 = *(void *)(*(void *)v23 + 8);
      *(void *)uint64_t v23 = v27;
      if (v27) {
        *(void *)(v27 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      v24[1] = v23;
      goto LABEL_72;
    }
    *((unsigned char *)v7 + 24) = 0;
    CFRange v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
LABEL_49:
    std::exception_ptr v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v13 = *(uint64_t **)(v12 + 8);
    uint64_t v14 = *v13;
    *(void *)(v12 + 8) = *v13;
    if (v14) {
      *(void *)(v14 + 16) = v12;
    }
    v13[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
    uint64_t *v13 = v12;
    *(void *)(v12 + 16) = v13;
    if (result == (uint64_t *)*v7) {
      __n128 result = v7;
    }
    std::exception_ptr v7 = *(uint64_t **)(*v7 + 8);
  }
  unint64_t v15 = (void *)*v7;
  if (!*v7 || *((unsigned char *)v15 + 24))
  {
    long long v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_59;
    }
    *((unsigned char *)v7 + 24) = 0;
    CFRange v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      CFRange v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  long long v16 = (uint64_t *)v7[1];
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_59:
    unint64_t v15 = v7;
  }
  else
  {
    *((unsigned char *)v15 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = v15[1];
    uint64_t *v7 = v22;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v15[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
    v15[1] = v7;
    v7[2] = (uint64_t)v15;
    long long v16 = v7;
  }
  uint64_t v23 = v15[2];
  *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  uint64_t v24 = *(uint64_t **)(v23 + 8);
  uint64_t v25 = *v24;
  *(void *)(v23 + 8) = *v24;
  if (v25) {
    *(void *)(v25 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  *uint64_t v24 = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void telephonytransport::NetworkSocketForwarder::create(uint64_t *a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, std::__shared_weak_count_vtbl **a5@<X8>)
{
  int v35 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  int v36 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v33 = 0;
  v34 = 0;
  uint64_t v9 = (std::__shared_weak_count *)a2[1];
  uint64_t v30 = *a2;
  v31 = v9;
  dispatch_object_t object = 0;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  telephonytransport::TCPSocketStream::create((telephonytransport *)&v33, &object, &v30, 1, a4, &v35);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  if (object) {
    dispatch_release(object);
  }
  uint64_t v10 = (telephonytransport *)v34;
  if (v34) {
    std::__shared_weak_count::__release_weak(v34);
  }
  uint64_t v11 = v35;
  if (v35)
  {
    uint64_t v12 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
    v12->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_26C9ADDA0;
    v12->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v11;
    uint64_t v13 = v36;
    int v35 = 0;
    int v36 = 0;
    v12->__get_deleter = 0;
    v12->__on_zero_shared_weak = 0;
    v12->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v13;
    uint64_t v14 = (std::__shared_weak_count *)operator new(0x20uLL);
    v14->__shared_weak_owners_ = 0;
    v14->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADDE0;
    v14->__shared_owners_ = 0;
    v14[1].__vftable = v12;
    memset(buf, 170, 16);
    uint64_t v27 = v12;
    int v28 = v14;
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    unint64_t v15 = *a3;
    dispatch_object_t v26 = v15;
    if (v15) {
      dispatch_retain(v15);
    }
    long long v16 = (std::__shared_weak_count *)a1[1];
    uint64_t v24 = *a1;
    uint64_t v25 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    telephonytransport::TCPSocketStream::create((telephonytransport *)&v27, &v26, &v24, 0, a4, (std::__shared_weak_count_vtbl **)buf);
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    if (v26) {
      dispatch_release(v26);
    }
    CFRange v17 = v28;
    if (v28) {
      std::__shared_weak_count::__release_weak(v28);
    }
    uint64_t v18 = *(const void *(__cdecl **)(const std::__shared_weak_count *__hidden, const std::type_info *))buf;
    if (*(void *)buf)
    {
      uint32_t v19 = *(void (__cdecl **)(std::__shared_weak_count *__hidden))&buf[8];
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = 0;
      on_zero_shared_weak = (std::__shared_weak_count *)v12->__on_zero_shared_weak;
      v12->__get_deleter = v18;
      v12->__on_zero_shared_weak = v19;
      if (on_zero_shared_weak) {
        std::__shared_weak_count::__release_shared[abi:ne180100](on_zero_shared_weak);
      }
      *a5 = v12;
      a5[1] = (std::__shared_weak_count_vtbl *)v14;
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    else
    {
      uint64_t v22 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v17);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = 0;
        _os_log_error_impl(&dword_2185A0000, v22, OS_LOG_TYPE_ERROR, "Failed to create source transport", (uint8_t *)&v23, 2u);
      }
      *a5 = 0;
      a5[1] = 0;
    }
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  else
  {
    BOOL v21 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v10);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2185A0000, v21, OS_LOG_TYPE_ERROR, "Failed to create destination transport", buf, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
}

void sub_2185A43A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, dispatch_object_t object, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_object_t a20)
{
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  __int16 v23 = *(std::__shared_weak_count **)(v21 - 56);
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::NetworkSocketForwarder::handleRead(telephonytransport::NetworkSocketForwarder *this, unsigned __int8 *a2)
{
  return (***((uint64_t (****)(void, unsigned __int8 *))this + 1))(*((void *)this + 1), a2);
}

void telephonytransport::NetworkSocketForwarder::~NetworkSocketForwarder(telephonytransport::NetworkSocketForwarder *this)
{
  *(void *)this = &unk_26C9ADDA0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  unint64_t v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C9ADDA0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  unint64_t v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocketForwarder *,std::shared_ptr<telephonytransport::NetworkSocketForwarder>::__shared_ptr_default_delete<telephonytransport::NetworkSocketForwarder,telephonytransport::NetworkSocketForwarder>,std::allocator<telephonytransport::NetworkSocketForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocketForwarder *,std::shared_ptr<telephonytransport::NetworkSocketForwarder>::__shared_ptr_default_delete<telephonytransport::NetworkSocketForwarder,telephonytransport::NetworkSocketForwarder>,std::allocator<telephonytransport::NetworkSocketForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocketForwarder *,std::shared_ptr<telephonytransport::NetworkSocketForwarder>::__shared_ptr_default_delete<telephonytransport::NetworkSocketForwarder,telephonytransport::NetworkSocketForwarder>,std::allocator<telephonytransport::NetworkSocketForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::RawIPIfaceToSocketForwarder::create(uint64_t a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, void *a5@<X8>)
{
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v32 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  int v28 = 0;
  telephonytransport::BaseProtocol::create((uint64_t)&v29, &v28, a2, 1, a4, &v31);
  if (v28) {
    dispatch_release(v28);
  }
  uint64_t v9 = (telephonytransport *)v30;
  if (v30) {
    std::__shared_weak_count::__release_weak(v30);
  }
  unint64_t v10 = v31;
  if (v31)
  {
    uint64_t v11 = operator new(0x28uLL);
    void *v11 = &unk_26C9ADE58;
    v11[1] = v10;
    uint64_t v12 = v32;
    unint64_t v31 = 0;
    sockaddr v32 = 0;
    v11[3] = 0;
    v11[4] = 0;
    v11[2] = v12;
    uint64_t v13 = (std::__shared_weak_count *)operator new(0x20uLL);
    v13->__shared_weak_owners_ = 0;
    v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADE98;
    v13->__shared_owners_ = 0;
    v13[1].__vftable = (std::__shared_weak_count_vtbl *)v11;
    *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v25 = v11;
    dispatch_object_t v26 = v13;
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v14 = *a3;
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    if (*(char *)(a1 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    }
    else {
      std::string v19 = *(std::string *)a1;
    }
    int v20 = 12;
    std::string::basic_string[abi:ne180100]<0>(&__p, "ip or ip6");
    uint64_t v23 = 0x100000000;
    telephonytransport::NetworkIface::create((telephonytransport *)&v25, &object, (uint64_t)&v19, a4, (telephonytransport::NetworkIface **)&v27);
    if (v22 < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    if (object) {
      dispatch_release(object);
    }
    if (v26) {
      std::__shared_weak_count::__release_weak(v26);
    }
    long long v16 = v27;
    long long v27 = 0uLL;
    CFRange v17 = (std::__shared_weak_count *)v11[4];
    *(_OWORD *)(v11 + 3) = v16;
    if (v17)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      uint64_t v18 = (std::__shared_weak_count *)*((void *)&v27 + 1);
      *a5 = v11;
      a5[1] = v13;
      if (v18) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
    }
    else
    {
      *a5 = v11;
      a5[1] = v13;
    }
  }
  else
  {
    unint64_t v15 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_2185A0000, v15, OS_LOG_TYPE_ERROR, "Failed to create destination write only protocol", (uint8_t *)&v19, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
}

void sub_2185A4814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (v24) {
    dispatch_release(v24);
  }
  if (a23) {
    std::__shared_weak_count::__release_weak(a23);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  long long v27 = *(std::__shared_weak_count **)(v25 - 56);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  _Unwind_Resume(a1);
}

__n128 telephonytransport::RawIPIfaceToSocketForwarder::RawIPIfaceToSocketForwarder(uint64_t a1, __n128 *a2)
{
  *(void *)a1 = &unk_26C9ADE58;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

{
  __n128 result;

  *(void *)a1 = &unk_26C9ADE58;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

void telephonytransport::NetworkIfaceParams::~NetworkIfaceParams(void **this)
{
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

uint64_t telephonytransport::RawIPIfaceToSocketForwarder::init(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  unint64_t v4 = *(std::__shared_weak_count **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

uint64_t telephonytransport::RawIPIfaceToSocketForwarder::handleRead(std::mutex **this, unsigned __int8 *a2, size_t a3)
{
  return telephonytransport::BaseProtocol::sendMessage(this[1], 1u, a2, a3);
}

void telephonytransport::RawIPIfaceToSocketForwarder::~RawIPIfaceToSocketForwarder(telephonytransport::RawIPIfaceToSocketForwarder *this)
{
  *(void *)this = &unk_26C9ADE58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C9ADE58;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  operator delete(this);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int v5 = this;
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
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
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
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__shared_ptr_pointer<telephonytransport::RawIPIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::RawIPIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::RawIPIfaceToSocketForwarder,telephonytransport::RawIPIfaceToSocketForwarder>,std::allocator<telephonytransport::RawIPIfaceToSocketForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::RawIPIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::RawIPIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::RawIPIfaceToSocketForwarder,telephonytransport::RawIPIfaceToSocketForwarder>,std::allocator<telephonytransport::RawIPIfaceToSocketForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::RawIPIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::RawIPIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::RawIPIfaceToSocketForwarder,telephonytransport::RawIPIfaceToSocketForwarder>,std::allocator<telephonytransport::RawIPIfaceToSocketForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::SocketToEthernetIfaceForwarder::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, NSObject **a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, std::string *a6@<X8>)
{
  v38 = (telephonytransport::NetworkIface *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v39 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v36 = 0;
  v37 = 0;
  int v35 = 0;
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v29, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v29 = *(std::string *)a2;
  }
  int v30 = 1;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  __p = 0;
  uint64_t v34 = 1;
  telephonytransport::NetworkIface::create((telephonytransport *)&v36, &v35, (uint64_t)&v29, a5, &v38);
  if (SHIBYTE(v33) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  if (v35) {
    dispatch_release(v35);
  }
  uint64_t v11 = (telephonytransport *)v37;
  if (v37) {
    std::__shared_weak_count::__release_weak(v37);
  }
  uint64_t v12 = v38;
  if (v38)
  {
    uint64_t v13 = (char *)operator new(0x618uLL);
    *(void *)uint64_t v13 = &unk_26C9ADF10;
    *((void *)v13 + 1) = v12;
    uint64_t v14 = v39;
    v38 = 0;
    uint64_t v39 = 0;
    *((void *)v13 + 3) = 0;
    *((void *)v13 + 4) = 0;
    *((void *)v13 + 2) = v14;
    *((_DWORD *)v13 + 10) = *(_DWORD *)(a4 + 6);
    *((_WORD *)v13 + 22) = *(_WORD *)(a4 + 10);
    *(_DWORD *)(v13 + 46) = *(_DWORD *)a4;
    *((_WORD *)v13 + 25) = *(_WORD *)(a4 + 4);
    unint64_t v15 = (std::__shared_weak_count *)operator new(0x20uLL);
    v15->__shared_weak_owners_ = 0;
    v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9ADF50;
    v15->__shared_owners_ = 0;
    v15[1].__vftable = (std::__shared_weak_count_vtbl *)v13;
    v29.__r_.__value_.__l.__size_ = (std::string::size_type)v15;
    unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
    int v28 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v25 = v13;
    dispatch_object_t v26 = v15;
    atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    long long v16 = *a3;
    dispatch_object_t object = v16;
    if (v16) {
      dispatch_retain(v16);
    }
    telephonytransport::BaseProtocol::create((uint64_t)&v25, &object, a1, 0, a5, &v27);
    if (object) {
      dispatch_release(object);
    }
    CFRange v17 = v26;
    if (v26) {
      std::__shared_weak_count::__release_weak(v26);
    }
    unint64_t v18 = v27;
    if (v27)
    {
      std::string v19 = v28;
      unint64_t v27 = 0;
      int v28 = 0;
      int v20 = (std::__shared_weak_count *)*((void *)v13 + 4);
      *((void *)v13 + 3) = v18;
      *((void *)v13 + 4) = v19;
      if (v20) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
      a6->__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
      a6->__r_.__value_.__l.__size_ = (std::string::size_type)v15;
      a6 = &v29;
    }
    else
    {
      char v22 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v17);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_error_impl(&dword_2185A0000, v22, OS_LOG_TYPE_ERROR, "Failed to create source read only protocol", v23, 2u);
      }
    }
    a6->__r_.__value_.__r.__words[0] = 0;
    a6->__r_.__value_.__l.__size_ = 0;
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
    if (v29.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v29.__r_.__value_.__l.__size_);
    }
  }
  else
  {
    uint64_t v21 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v11);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_2185A0000, v21, OS_LOG_TYPE_ERROR, "Failed to create destination write only transport", (uint8_t *)&v29, 2u);
    }
    a6->__r_.__value_.__r.__words[0] = 0;
    a6->__r_.__value_.__l.__size_ = 0;
  }
  if (v39) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  }
}

void sub_2185A4F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14, char a15)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  unint64_t v18 = *(std::__shared_weak_count **)(v16 - 72);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  _Unwind_Resume(a1);
}

__n128 telephonytransport::SocketToEthernetIfaceForwarder::SocketToEthernetIfaceForwarder(uint64_t a1, __n128 *a2, int *a3)
{
  *(void *)a1 = &unk_26C9ADF10;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  int v4 = *(int *)((char *)a3 + 6);
  *(_WORD *)(a1 + 44) = *((_WORD *)a3 + 5);
  *(_DWORD *)(a1 + 40) = v4;
  int v5 = *a3;
  *(_WORD *)(a1 + 50) = *((_WORD *)a3 + 2);
  *(_DWORD *)(a1 + 46) = v5;
  return result;
}

{
  __n128 result;
  int v4;
  int v5;

  *(void *)a1 = &unk_26C9ADF10;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  int v4 = *(int *)((char *)a3 + 6);
  *(_WORD *)(a1 + 44) = *((_WORD *)a3 + 5);
  *(_DWORD *)(a1 + 40) = v4;
  int v5 = *a3;
  *(_WORD *)(a1 + 50) = *((_WORD *)a3 + 2);
  *(_DWORD *)(a1 + 46) = v5;
  return result;
}

uint64_t telephonytransport::SocketToEthernetIfaceForwarder::init(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  int v4 = *(std::__shared_weak_count **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

uint64_t telephonytransport::SocketToEthernetIfaceForwarder::handleMessage(BOOL this, int a2, unsigned __int8 *a3, size_t __n)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a2 == 1) {
    goto LABEL_6;
  }
  int v4 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
  this = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
  if (this)
  {
    *(_WORD *)buf = 0;
    int v5 = "Only kPDPIP message type is supported here";
    std::string::size_type v6 = v4;
    uint32_t v7 = 2;
LABEL_4:
    _os_log_fault_impl(&dword_2185A0000, v6, OS_LOG_TYPE_FAULT, v5, buf, v7);
    goto LABEL_5;
  }
  while (1)
  {
LABEL_5:
    while (1)
    {
      __break(1u);
LABEL_6:
      size_t v8 = __n;
      if (__n + 14 < 0x5EF) {
        break;
      }
      uint64_t v9 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
      this = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
      if (this)
      {
        *(_DWORD *)buf = 134217984;
        size_t v19 = v8;
        int v5 = "Cannot handle packet of length: %lu";
        std::string::size_type v6 = v9;
        uint32_t v7 = 12;
        goto LABEL_4;
      }
    }
    __src = a3;
    uint64_t v10 = this;
    int v11 = *a3 >> 4;
    if (v11 == 4) {
      break;
    }
    if (v11 == 6)
    {
      __int16 v12 = -8826;
      goto LABEL_13;
    }
    unint64_t v15 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
    this = os_log_type_enabled(v15, OS_LOG_TYPE_FAULT);
    if (this)
    {
      int v16 = *__src >> 4;
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = v16;
      int v5 = "IP header version: %u is invalid";
      std::string::size_type v6 = v15;
      uint32_t v7 = 8;
      goto LABEL_4;
    }
  }
  __int16 v12 = 8;
LABEL_13:
  *(_WORD *)(this + 52) = v12;
  memcpy((void *)(this + 54), a3, __n);
  uint64_t v13 = ***(uint64_t (****)(void))(v10 + 8);

  return v13();
}

void telephonytransport::SocketToEthernetIfaceForwarder::~SocketToEthernetIfaceForwarder(telephonytransport::SocketToEthernetIfaceForwarder *this)
{
  *(void *)this = &unk_26C9ADF10;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C9ADF10;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::SocketToEthernetIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToEthernetIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToEthernetIfaceForwarder,telephonytransport::SocketToEthernetIfaceForwarder>,std::allocator<telephonytransport::SocketToEthernetIfaceForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToEthernetIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToEthernetIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToEthernetIfaceForwarder,telephonytransport::SocketToEthernetIfaceForwarder>,std::allocator<telephonytransport::SocketToEthernetIfaceForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToEthernetIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToEthernetIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToEthernetIfaceForwarder,telephonytransport::SocketToEthernetIfaceForwarder>,std::allocator<telephonytransport::SocketToEthernetIfaceForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void *telephonytransport::NetworkSocket::created@<X0>(void *this@<X0>, void *a2@<X8>)
{
  if (this == -1)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    int v3 = (int)this;
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    int v4 = operator new(0x18uLL);
    telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"networksocket", (const char *)&str_1, v4);
    v4[4] = v3;
    this = std::shared_ptr<telephonytransport::NetworkSocket>::shared_ptr[abi:ne180100]<telephonytransport::NetworkSocket,void>(&v5, (uint64_t)v4);
    *(_OWORD *)a2 = v5;
  }
  return this;
}

void sub_2185A5460(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

telephonytransport::NetworkSocket *telephonytransport::NetworkSocket::NetworkSocket(telephonytransport::NetworkSocket *this, int a2)
{
  *((_DWORD *)this + 4) = a2;
  return this;
}

{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"networksocket", (const char *)&str_1, this);
  *((_DWORD *)this + 4) = a2;
  return this;
}

uint64_t telephonytransport::NetworkSocket::init(telephonytransport::NetworkSocket *this)
{
  return 1;
}

void telephonytransport::NetworkSocket::~NetworkSocket(telephonytransport::NetworkSocket *this)
{
  close(*((_DWORD *)this + 4));
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

uint64_t telephonytransport::NetworkSocket::getValue(telephonytransport::NetworkSocket *this)
{
  return *((unsigned int *)this + 4);
}

BOOL telephonytransport::NetworkSocket::setNonBlockingAndNoSigpipe(telephonytransport::NetworkSocket *this)
{
  if (fcntl(*((_DWORD *)this + 4), 4, 4) == -1)
  {
    size_t v8 = *(NSObject ***)this;
    uint32_t v7 = (std::__shared_weak_count *)*((void *)this + 1);
    if (v7)
    {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v9 = *v8;
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    else
    {
      uint64_t v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2185A0000, v9, OS_LOG_TYPE_ERROR, "Warning: Unable to mark socket as non blocking", buf, 2u);
    }
    return 0;
  }
  else
  {
    int v12 = 1;
    int v2 = setsockopt(*((_DWORD *)this + 4), 0xFFFF, 4130, &v12, 4u);
    BOOL v3 = v2 != -1;
    if (v2 == -1)
    {
      long long v5 = *(NSObject ***)this;
      int v4 = (std::__shared_weak_count *)*((void *)this + 1);
      if (v4)
      {
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        std::string::size_type v6 = *v5;
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      else
      {
        std::string::size_type v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)int v11 = 0;
        _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Unable to set SO_NOSIGPIPE option", v11, 2u);
      }
    }
  }
  return v3;
}

BOOL telephonytransport::NetworkSocket::enablePortReuse(telephonytransport::NetworkSocket *this)
{
  int v8 = 1;
  int v2 = setsockopt(*((_DWORD *)this + 4), 0xFFFF, 512, &v8, 4u);
  if (v2 == -1)
  {
    int v4 = *(NSObject ***)this;
    BOOL v3 = (std::__shared_weak_count *)*((void *)this + 1);
    if (v3)
    {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v5 = *v4;
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    else
    {
      long long v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint32_t v7 = 0;
      _os_log_error_impl(&dword_2185A0000, v5, OS_LOG_TYPE_ERROR, "Failed to enable port reuse", v7, 2u);
    }
  }
  return v2 != -1;
}

BOOL telephonytransport::NetworkSocket::bindToInterface(uint64_t a1, const char *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((a2[23] & 0x80000000) == 0)
  {
    if (a2[23])
    {
      int v4 = a2;
      goto LABEL_6;
    }
    return 0;
  }
  if (!*((void *)a2 + 1)) {
    return 0;
  }
  int v4 = *(const char **)a2;
LABEL_6:
  unsigned int v14 = if_nametoindex(v4);
  if (!v14)
  {
    uint64_t v9 = *(NSObject ***)a1;
    int v8 = *(std::__shared_weak_count **)(a1 + 8);
    if (v8)
    {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v10 = *v9;
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    else
    {
      uint64_t v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (a2[23] >= 0) {
        uint64_t v13 = a2;
      }
      else {
        uint64_t v13 = *(const char **)a2;
      }
      *(_DWORD *)buf = 136315138;
      int v16 = v13;
      _os_log_error_impl(&dword_2185A0000, v10, OS_LOG_TYPE_ERROR, "Unable to find index for interface: %s", buf, 0xCu);
    }
    return 1;
  }
  if (!setsockopt(*(_DWORD *)(a1 + 16), 0, 25, &v14, 4u)) {
    return 1;
  }
  std::string::size_type v6 = *(NSObject ***)a1;
  long long v5 = *(std::__shared_weak_count **)(a1 + 8);
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    uint32_t v7 = *v6;
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  else
  {
    uint32_t v7 = *v6;
  }
  BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (result)
  {
    if (a2[23] >= 0) {
      int v12 = a2;
    }
    else {
      int v12 = *(const char **)a2;
    }
    *(_DWORD *)buf = 136315138;
    int v16 = v12;
    _os_log_error_impl(&dword_2185A0000, v7, OS_LOG_TYPE_ERROR, "Unable to bind to interface: %s", buf, 0xCu);
    return 0;
  }
  return result;
}

void *std::shared_ptr<telephonytransport::NetworkSocket>::shared_ptr[abi:ne180100]<telephonytransport::NetworkSocket,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  int v4 = operator new(0x20uLL);
  void *v4 = &unk_26C9ADFC8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2185A5940(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    telephonytransport::NetworkSocket::~NetworkSocket(v1);
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocket *,std::shared_ptr<telephonytransport::NetworkSocket>::__shared_ptr_default_delete<telephonytransport::NetworkSocket,telephonytransport::NetworkSocket>,std::allocator<telephonytransport::NetworkSocket>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocket *,std::shared_ptr<telephonytransport::NetworkSocket>::__shared_ptr_default_delete<telephonytransport::NetworkSocket,telephonytransport::NetworkSocket>,std::allocator<telephonytransport::NetworkSocket>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(telephonytransport::NetworkSocket **)(a1 + 24);
  if (v1)
  {
    telephonytransport::NetworkSocket::~NetworkSocket(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocket *,std::shared_ptr<telephonytransport::NetworkSocket>::__shared_ptr_default_delete<telephonytransport::NetworkSocket,telephonytransport::NetworkSocket>,std::allocator<telephonytransport::NetworkSocket>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::TCPClientSocketFactoryNetwork::create(uint64_t a1@<X0>, uint64_t a2@<X1>, telephonytransport::TCPClientSocketFactoryNetwork **a3@<X8>)
{
  int v8 = (telephonytransport::TCPClientSocketFactoryNetwork *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v9 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  std::string::size_type v6 = (char *)operator new(0x58uLL);
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclientsocketfactory", "network", (void *)v6 + 1);
  *(void *)std::string::size_type v6 = &unk_26C9AE040;
  *(_OWORD *)(v6 + 24) = *(_OWORD *)a1;
  *((void *)v6 + 5) = *(void *)(a1 + 16);
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *((_OWORD *)v6 + 3) = *(_OWORD *)a2;
  *((void *)v6 + 8) = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::shared_ptr[abi:ne180100]<telephonytransport::TCPClientSocketFactoryNetwork,void>(&v8, (uint64_t)v6);
  if (telephonytransport::TCPClientSocketFactoryNetwork::init(v8))
  {
    uint32_t v7 = v9;
    *a3 = v8;
    a3[1] = (telephonytransport::TCPClientSocketFactoryNetwork *)v7;
    if (!v7) {
      return;
    }
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void sub_2185A5AF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t telephonytransport::TCPClientSocketFactoryNetwork::TCPClientSocketFactoryNetwork(uint64_t a1, long long *a2, long long *a3)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclientsocketfactory", "network", (void *)(a1 + 8));
  *(void *)a1 = &unk_26C9AE040;
  long long v6 = *a2;
  *(void *)(a1 + 40) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 24) = v6;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  long long v7 = *a3;
  *(void *)(a1 + 64) = *((void *)a3 + 2);
  *(_OWORD *)(a1 + 48) = v7;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  *(void *)a3 = 0;
  return a1;
}

{
  long long v6;
  long long v7;

  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclientsocketfactory", "network", (void *)(a1 + 8));
  *(void *)a1 = &unk_26C9AE040;
  long long v6 = *a2;
  *(void *)(a1 + 40) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 24) = v6;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  long long v7 = *a3;
  *(void *)(a1 + 64) = *((void *)a3 + 2);
  *(_OWORD *)(a1 + 48) = v7;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  *(void *)a3 = 0;
  return a1;
}

BOOL telephonytransport::TCPClientSocketFactoryNetwork::init(telephonytransport::TCPClientSocketFactoryNetwork *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((_WORD *)this + 36) = 528;
  int v2 = (const char **)((char *)this + 24);
  BOOL v3 = (char *)this + 24;
  if (*((char *)this + 47) < 0) {
    BOOL v3 = *v2;
  }
  int v4 = inet_pton(2, v3, (char *)this + 76);
  if (v4 != 1)
  {
    long long v6 = (NSObject **)*((void *)this + 1);
    long long v5 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v5)
    {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v7 = *v6;
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    else
    {
      long long v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (*((char *)this + 47) < 0) {
        int v2 = (const char **)*v2;
      }
      int v9 = 136315138;
      uint64_t v10 = v2;
      _os_log_error_impl(&dword_2185A0000, v7, OS_LOG_TYPE_ERROR, "Invalid address: %s", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4 == 1;
}

void telephonytransport::TCPClientSocketFactoryNetwork::connectTo(telephonytransport::TCPClientSocketFactoryNetwork *this@<X0>, unsigned int a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *((_WORD *)this + 37) = bswap32(a2) >> 16;
  uint64_t v21 = (int *)0xAAAAAAAAAAAAAAAALL;
  char v22 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  long long v6 = (void *)socket(2, 1, 0);
  telephonytransport::NetworkSocket::created(v6, &v21);
  long long v7 = v21;
  if (!v21)
  {
    int v9 = (NSObject **)*((void *)this + 1);
    int v8 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v8)
    {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v10 = *v9;
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    else
    {
      uint64_t v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2185A0000, v10, OS_LOG_TYPE_ERROR, "Failed to create socket", buf, 2u);
    }
    unsigned int v14 = v22;
    *a3 = 0;
LABEL_18:
    a3[1] = (uint64_t)v14;
    a3 = (uint64_t *)&v21;
    goto LABEL_26;
  }
  if (*((char *)this + 71) < 0)
  {
    if (!*((void *)this + 7)) {
      goto LABEL_9;
    }
  }
  else if (!*((unsigned char *)this + 71))
  {
    goto LABEL_9;
  }
  if (!telephonytransport::NetworkSocket::bindToInterface((uint64_t)v21, (const char *)this + 48)) {
    goto LABEL_26;
  }
LABEL_9:
  if (!connect(v7[4], (const sockaddr *)((char *)this + 72), 0x10u))
  {
    if (!telephonytransport::NetworkSocket::setNonBlockingAndNoSigpipe((telephonytransport::NetworkSocket *)v7)) {
      goto LABEL_26;
    }
    unsigned int v14 = v22;
    *a3 = (uint64_t)v7;
    goto LABEL_18;
  }
  int v12 = (NSObject **)*((void *)this + 1);
  uint64_t v11 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v11)
  {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v13 = *v12;
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  else
  {
    uint64_t v13 = *v12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    unint64_t v18 = (char *)this + 24;
    if (*((char *)this + 47) < 0) {
      unint64_t v18 = *(char **)v18;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v24 = v18;
    __int16 v25 = 1024;
    unsigned int v26 = a2;
    _os_log_error_impl(&dword_2185A0000, v13, OS_LOG_TYPE_ERROR, "Failed to connect to: %s:%u", buf, 0x12u);
  }
  int v16 = (NSObject **)*((void *)this + 1);
  unint64_t v15 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v15)
  {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v17 = *v16;
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  else
  {
    uint64_t v17 = *v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    size_t v19 = __error();
    uint64_t v20 = strerror(*v19);
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = v20;
    _os_log_error_impl(&dword_2185A0000, v17, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
LABEL_26:
  *a3 = 0;
  a3[1] = 0;
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
}

void sub_2185A5FD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void telephonytransport::TCPClientSocketFactoryNetwork::~TCPClientSocketFactoryNetwork(void **this)
{
  *this = &unk_26C9AE040;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  int v2 = (std::__shared_weak_count *)this[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *this = &unk_26C9AE040;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  int v2 = (std::__shared_weak_count *)this[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(this);
}

void *std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::shared_ptr[abi:ne180100]<telephonytransport::TCPClientSocketFactoryNetwork,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  int v4 = operator new(0x20uLL);
  void *v4 = &unk_26C9AE0A0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2185A613C(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 16))(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<telephonytransport::TCPClientSocketFactoryNetwork *,std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::__shared_ptr_default_delete<telephonytransport::TCPClientSocketFactoryNetwork,telephonytransport::TCPClientSocketFactoryNetwork>,std::allocator<telephonytransport::TCPClientSocketFactoryNetwork>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPClientSocketFactoryNetwork *,std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::__shared_ptr_default_delete<telephonytransport::TCPClientSocketFactoryNetwork,telephonytransport::TCPClientSocketFactoryNetwork>,std::allocator<telephonytransport::TCPClientSocketFactoryNetwork>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPClientSocketFactoryNetwork *,std::shared_ptr<telephonytransport::TCPClientSocketFactoryNetwork>::__shared_ptr_default_delete<telephonytransport::TCPClientSocketFactoryNetwork,telephonytransport::TCPClientSocketFactoryNetwork>,std::allocator<telephonytransport::TCPClientSocketFactoryNetwork>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::PCIServiceTransport::create(uint64_t a1@<X0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, char *a4@<X3>, std::__shared_weak_count_vtbl **a5@<X8>)
{
  uint64_t v10 = (std::__shared_weak_count_vtbl *)operator new(0x50uLL);
  telephonytransport::PCIServiceTransport::PCIServiceTransport((uint64_t)v10, a1, a4);
  uint64_t v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE238;
  v11->__shared_owners_ = 0;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = v10;
  on_zero_shared = (std::__shared_weak_count *)v10->__on_zero_shared;
  if (on_zero_shared)
  {
    if (on_zero_shared->__shared_owners_ != -1) {
      goto LABEL_6;
    }
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v10->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v10->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v11;
    std::__shared_weak_count::__release_weak(on_zero_shared);
  }
  else
  {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v10->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v10->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v11;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
LABEL_6:
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v21 = v10;
  char v22 = v11;
  atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  uint64_t v13 = *a2;
  dispatch_object_t object = v13;
  if (v13) {
    dispatch_retain(v13);
  }
  telephonytransport::BaseProtocol::create((uint64_t)&v21, &object, a3, 2, a4, &v23);
  if (object) {
    dispatch_release(object);
  }
  unsigned int v14 = v22;
  if (v22) {
    std::__shared_weak_count::__release_weak(v22);
  }
  unint64_t v15 = v23;
  if (v23)
  {
    int v16 = v24;
    unint64_t v23 = 0;
    uint64_t v24 = 0;
    on_zero_shared_weak = (std::__shared_weak_count *)v10[1].__on_zero_shared_weak;
    v10[1].__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v15;
    v10[1].__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v16;
    if (on_zero_shared_weak) {
      std::__shared_weak_count::__release_shared[abi:ne180100](on_zero_shared_weak);
    }
    *a5 = v10;
    a5[1] = (std::__shared_weak_count_vtbl *)v11;
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    unint64_t v18 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v14);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = 0;
      _os_log_impl(&dword_2185A0000, v18, OS_LOG_TYPE_INFO, "Failed to create base protocol", (uint8_t *)&v19, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
}

void sub_2185A63E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIServiceTransport::init(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  int v4 = *(std::__shared_weak_count **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

uint64_t telephonytransport::PCIServiceTransport::PCIServiceTransport(uint64_t a1, uint64_t a2, char *a3)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"pciservicetransport", a3, (void *)(a1 + 24));
  *(void *)a1 = &unk_26C9AE118;
  long long v5 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INITIATED, 0);
  *(void *)(a1 + 40) = dispatch_queue_create("PCIServiceTransport", v5);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  return a1;
}

void sub_2185A6534(_Unwind_Exception *exception_object)
{
  long long v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

void telephonytransport::PCIServiceTransport::executeAsync(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 8);
  long long v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v5;
  long long v12 = v5;
  long long v6 = a2 + 3;
  long long v7 = (void *)a2[3];
  if (!v7)
  {
    long long v6 = (void *)&v12 + 1;
    goto LABEL_7;
  }
  if (v7 != a2)
  {
    *((void *)&v12 + 1) = a2[3];
LABEL_7:
    void *v6 = 0;
    goto LABEL_9;
  }
  *((void *)&v12 + 1) = &v11;
  (*(void (**)(void *, long long *))(*a2 + 24))(a2, &v11);
LABEL_9:
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1174405120;
  v8[2] = ___ZN18telephonytransport19PCIServiceTransport12executeAsyncEONSt3__18functionIFvvEEE_block_invoke;
  v8[3] = &__block_descriptor_tmp_1;
  v8[4] = v4;
  int v9 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v10, (uint64_t)&v11);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v8);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v10);
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](&v11);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_2185A66C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN18telephonytransport19PCIServiceTransport12executeAsyncEONSt3__18functionIFvvEEE_block_invoke(void *a1)
{
  int v2 = (std::__shared_weak_count *)a1[5];
  if (v2)
  {
    long long v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      uint64_t v4 = v3;
      if (a1[4])
      {
        uint64_t v5 = a1[9];
        if (!v5) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        (*(void (**)(uint64_t))(*(void *)v5 + 48))(v5);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

void sub_2185A6790(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c66_ZTSNSt3__18weak_ptrIN18telephonytransport19PCIServiceTransportEEE48c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 48, a2 + 48);
}

void sub_2185A67E8(_Unwind_Exception *exception_object)
{
  long long v3 = *(std::__shared_weak_count **)(v1 + 40);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_32c66_ZTSNSt3__18weak_ptrIN18telephonytransport19PCIServiceTransportEEE48c27_ZTSNSt3__18functionIFvvEEE(uint64_t a1)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 48));
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(void *a1, uint64_t *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = a1[6];
      if (v7)
      {
        uint64_t v9 = a1[1];
        uint64_t v8 = a1[2];
        if (v8)
        {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 16), 1uLL, memory_order_relaxed);
          uint64_t v10 = a1[2];
          uint64_t v22 = a1[1];
          if (v10) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 16), 1uLL, memory_order_relaxed);
          }
        }
        else
        {
          uint64_t v10 = 0;
          uint64_t v22 = a1[1];
        }
        unsigned int v23 = -1431655766;
        unsigned int v20 = *(_DWORD *)(*a2 + 36);
        unsigned int v21 = *(_DWORD *)(*a2 + 32);
        uint64_t v11 = *(unsigned int *)(*a2 + 24);
        unsigned int v19 = *(_DWORD *)(*a2 + 28);
        uint64_t v13 = *(unsigned int *)(*a2 + 16);
        uint64_t v12 = *(unsigned int *)(*a2 + 20);
        unsigned int v14 = operator new(0x20uLL);
        void *v14 = &unk_26C9AE2F0;
        v14[1] = a1;
        v14[2] = v9;
        v14[3] = v8;
        unint64_t v28 = (unint64_t)v14;
        unint64_t v15 = operator new(0x20uLL);
        *unint64_t v15 = &unk_26C9AE380;
        v15[1] = a1;
        v15[2] = v22;
        v15[3] = v10;
        v24[3] = v15;
        char v16 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, void, void, uint64_t, void **, void *, unsigned int *))(*(void *)v7 + 16))(v7, v21, v12, v11, v20, v19, v13, &v25, v24, &v23);
        std::__function::__value_func<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__value_func[abi:ne180100](v24);
        std::__function::__value_func<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__value_func[abi:ne180100](&v25);
        if (v16)
        {
          uint64_t v27 = 2863311530;
          __int16 v25 = &unk_26C9AF7F0;
          uint64_t v26 = 0;
          unint64_t v28 = 0xAAAAAAAA00000000;
          uint64_t v17 = *(void *)(*a2 + 8);
          *(void *)(*a2 + 8) = 0;
          uint64_t v18 = v26;
          uint64_t v26 = v17;
          if (v18) {
            (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
          }
          LOBYTE(v28) = v28 | 3;
          uint64_t v27 = v23;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCICreateResponse>((uint64_t)a1, (PB::Base *)&v25);
          telephonytransport::PCICreateResponse::~PCICreateResponse((telephonytransport::PCICreateResponse *)&v25);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCICreateRequest>((uint64_t)a1, *a2);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A6AA0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCICreateRequest>(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  v3[0] = &unk_26C9AF7F0;
  v3[1] = v2;
  *(void *)((char *)&v4 + 4) = 0x200000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCICreateResponse>(a1, (PB::Base *)v3);
  telephonytransport::PCICreateResponse::~PCICreateResponse((telephonytransport::PCICreateResponse *)v3);
}

void sub_2185A6B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCICreateResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 2u, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIFreeRequest>(uint64_t a1, uint64_t *a2)
{
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        if ((*(uint64_t (**)(uint64_t, void))(*(void *)v7 + 24))(v7, *(unsigned int *)(*(void *)(*a2 + 8) + 16)))
        {
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          uint64_t v8 = *(void *)(*a2 + 8);
          *(void *)(*a2 + 8) = 0;
          uint64_t v9 = v13;
          uint64_t v12 = &unk_26C9AF860;
          uint64_t v13 = v8;
          if (v9) {
            (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
          }
          BYTE4(v14) |= 1u;
          LODWORD(v14) = 0;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFreeResponse>(a1, (PB::Base *)&v12);
        }
        else
        {
          uint64_t v10 = *a2;
          uint64_t v14 = 0x100000001;
          uint64_t v11 = *(void *)(v10 + 8);
          *(void *)(v10 + 8) = 0;
          uint64_t v12 = &unk_26C9AF860;
          uint64_t v13 = v11;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFreeResponse>(a1, (PB::Base *)&v12);
        }
        telephonytransport::PCIFreeResponse::~PCIFreeResponse((telephonytransport::PCIFreeResponse *)&v12);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A6E10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  telephonytransport::PCIFreeResponse::~PCIFreeResponse((telephonytransport::PCIFreeResponse *)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFreeResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0xAu, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIReadRequest>(uint64_t a1, uint64_t *a2)
{
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        memset(__p, 170, sizeof(__p));
        std::vector<unsigned char>::vector(__p, *(unsigned int *)(*a2 + 16));
        uint64_t v16 = 0;
        if ((*(uint64_t (**)(uint64_t, void, void, void, void *, uint64_t *))(*(void *)v7 + 32))(v7, *(unsigned int *)(*(void *)(*a2 + 8) + 16), *(unsigned int *)(*a2 + 16), *(unsigned int *)(*a2 + 20), __p[0], &v16))
        {
          uint64_t v12 = &unk_26C9AF780;
          __int16 v13 = 0;
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v8 = *(void *)(*a2 + 8);
          *(void *)(*a2 + 8) = 0;
          uint64_t v9 = v14;
          uint64_t v14 = v8;
          if (v9) {
            (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
          }
          BYTE4(v15) |= 1u;
          LODWORD(v15) = 0;
          char v10 = v13;
          if (!v13)
          {
            uint64_t v11 = (void **)operator new(0x10uLL);
            std::__shared_weak_count *v11 = 0;
            v11[1] = 0;
            std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v13, v11);
            char v10 = v13;
          }
          PB::Data::assign(v10, (const unsigned __int8 *)__p[0], (const unsigned __int8 *)__p[0] + v16);
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadResponse>(a1, (PB::Base *)&v12);
          telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)&v12);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRequest>(a1, *a2);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A70F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRequest>(uint64_t a1, uint64_t a2)
{
  v3[0] = &unk_26C9AF780;
  v3[1] = 0;
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  void v3[2] = v2;
  v3[3] = 0x100000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadResponse>(a1, (PB::Base *)v3);
  telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)v3);
}

void sub_2185A719C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 4u, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 2) + 8);
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIWriteRequest>(uint64_t a1, uint64_t *a2)
{
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
        if ((*(uint64_t (**)(uint64_t, void, void, void, void, unint64_t *))(*(void *)v7 + 48))(v7, *(unsigned int *)(*(void *)(*a2 + 16) + 16), **(void **)(*a2 + 8), *(void *)(*(void *)(*a2 + 8) + 8), *(unsigned int *)(*a2 + 24), &v13))
        {
          unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v8 = *a2;
          HIDWORD(v11) = 0;
          LODWORD(v12) = 0;
          uint64_t v9 = *(void *)(v8 + 16);
          *(void *)(v8 + 16) = 0;
          v10[0] = &unk_26C9AF940;
          v10[1] = v9;
          LOBYTE(v12) = v12 | 3;
          LODWORD(v11) = v13;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIWriteResponse>(a1, (PB::Base *)v10);
          telephonytransport::PCIWriteResponse::~PCIWriteResponse((telephonytransport::PCIWriteResponse *)v10);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIWriteRequest>(a1, *a2);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A73EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  telephonytransport::PCIWriteResponse::~PCIWriteResponse((telephonytransport::PCIWriteResponse *)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIWriteRequest>(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  v3[0] = &unk_26C9AF940;
  v3[1] = v2;
  *(void *)((char *)&v4 + 4) = 0x200000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIWriteResponse>(a1, (PB::Base *)v3);
  telephonytransport::PCIWriteResponse::~PCIWriteResponse((telephonytransport::PCIWriteResponse *)v3);
}

void sub_2185A7480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIWriteResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 8u, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      unint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCISendImageRequest>(uint64_t a1, uint64_t *a2)
{
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
        int v12 = -1431655766;
        if ((*(uint64_t (**)(uint64_t, void, void, void, void, unint64_t *, int *))(*(void *)v7 + 56))(v7, *(unsigned int *)(*(void *)(*a2 + 16) + 16), **(void **)(*a2 + 8), *(void *)(*(void *)(*a2 + 8) + 8), *(unsigned int *)(*a2 + 24), &v13, &v12))
        {
          unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
          uint64_t v11 = 0;
          uint64_t v8 = *(void *)(*a2 + 16);
          *(void *)(*a2 + 16) = 0;
          v9[0] = &unk_26C9AF588;
          v9[1] = v8;
          BYTE4(v11) |= 7u;
          unint64_t v10 = __PAIR64__(v12, v13);
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCISendImageResponse>(a1, (PB::Base *)v9);
          telephonytransport::PCISendImageResponse::~PCISendImageResponse((telephonytransport::PCISendImageResponse *)v9);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCISendImageRequest>(a1, *a2);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A76DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  telephonytransport::PCISendImageResponse::~PCISendImageResponse((telephonytransport::PCISendImageResponse *)&a9);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCISendImageRequest>(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  v3[0] = &unk_26C9AF588;
  v3[1] = v2;
  void v3[2] = 0xAAAAAAAAAAAAAAAALL;
  v3[3] = 0x400000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCISendImageResponse>(a1, (PB::Base *)v3);
  telephonytransport::PCISendImageResponse::~PCISendImageResponse((telephonytransport::PCISendImageResponse *)v3);
}

void sub_2185A7770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCISendImageResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0xCu, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      int v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(uint64_t a1, uint64_t *a2)
{
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        memset(__p, 170, sizeof(__p));
        std::vector<unsigned char>::vector(__p, *(unsigned int *)(*a2 + 16));
        uint64_t v16 = 0;
        if ((*(uint64_t (**)(uint64_t, void, void, void, void, void *, uint64_t *))(*(void *)v7 + 40))(v7, *(unsigned int *)(*(void *)(*a2 + 8) + 16), *(unsigned int *)(*a2 + 24), *(unsigned int *)(*a2 + 16), *(unsigned int *)(*a2 + 20), __p[0], &v16))
        {
          int v12 = &unk_26C9AF5F8;
          __int16 v13 = 0;
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v8 = *(void *)(*a2 + 8);
          *(void *)(*a2 + 8) = 0;
          uint64_t v9 = v14;
          uint64_t v14 = v8;
          if (v9) {
            (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
          }
          BYTE4(v15) |= 1u;
          LODWORD(v15) = 0;
          char v10 = v13;
          if (!v13)
          {
            uint64_t v11 = (void **)operator new(0x10uLL);
            std::__shared_weak_count *v11 = 0;
            v11[1] = 0;
            std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v13, v11);
            char v10 = v13;
          }
          PB::Data::assign(v10, (const unsigned __int8 *)__p[0], (const unsigned __int8 *)__p[0] + v16);
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadRegisterResponse>(a1, (PB::Base *)&v12);
          telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)&v12);
        }
        else
        {
          telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(a1, *a2);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A7A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendFailureResponseOnConcurrentQueue<telephonytransport::PCIReadRegisterRequest>(uint64_t a1, uint64_t a2)
{
  v3[0] = &unk_26C9AF5F8;
  v3[1] = 0;
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  void v3[2] = v2;
  v3[3] = 0x100000001;
  telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadRegisterResponse>(a1, (PB::Base *)v3);
  telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v3);
}

void sub_2185A7AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIReadRegisterResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0xEu, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 2) + 8);
      *(_DWORD *)buf = 136315394;
      int v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIUnblockReadRequest>(uint64_t a1, uint64_t *a2)
{
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        if ((*(uint64_t (**)(uint64_t, void))(*(void *)v7 + 64))(v7, *(unsigned int *)(*(void *)(*a2 + 8) + 16)))
        {
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          uint64_t v8 = *(void *)(*a2 + 8);
          *(void *)(*a2 + 8) = 0;
          uint64_t v9 = v13;
          int v12 = &unk_26C9AF5C0;
          uint64_t v13 = v8;
          if (v9) {
            (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
          }
          BYTE4(v14) |= 1u;
          LODWORD(v14) = 0;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIUnblockReadResponse>(a1, (PB::Base *)&v12);
        }
        else
        {
          uint64_t v10 = *a2;
          uint64_t v14 = 0x100000001;
          uint64_t v11 = *(void *)(v10 + 8);
          *(void *)(v10 + 8) = 0;
          int v12 = &unk_26C9AF5C0;
          uint64_t v13 = v11;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIUnblockReadResponse>(a1, (PB::Base *)&v12);
        }
        telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse((telephonytransport::PCIUnblockReadResponse *)&v12);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A7D7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse((telephonytransport::PCIUnblockReadResponse *)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIUnblockReadResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0x10u, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      int v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCIFlushReadRequest>(uint64_t a1, uint64_t *a2)
{
  long long v3 = *(std::__shared_weak_count **)(a1 + 56);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      long long v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7)
      {
        if ((*(uint64_t (**)(uint64_t, void))(*(void *)v7 + 72))(v7, *(unsigned int *)(*(void *)(*a2 + 8) + 16)))
        {
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          uint64_t v8 = *(void *)(*a2 + 8);
          *(void *)(*a2 + 8) = 0;
          uint64_t v9 = v13;
          int v12 = &unk_26C9AF550;
          uint64_t v13 = v8;
          if (v9) {
            (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
          }
          BYTE4(v14) |= 1u;
          LODWORD(v14) = 0;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFlushReadResponse>(a1, (PB::Base *)&v12);
        }
        else
        {
          uint64_t v10 = *a2;
          uint64_t v14 = 0x100000001;
          uint64_t v11 = *(void *)(v10 + 8);
          *(void *)(v10 + 8) = 0;
          int v12 = &unk_26C9AF550;
          uint64_t v13 = v11;
          telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFlushReadResponse>(a1, (PB::Base *)&v12);
        }
        telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse((telephonytransport::PCIFlushReadResponse *)&v12);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_2185A8020(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse((telephonytransport::PCIFlushReadResponse *)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIServiceTransport::sendMessage<telephonytransport::PCIFlushReadResponse>(uint64_t a1, PB::Base *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(a1 + 64), 0x12u, a2) & 1) == 0)
  {
    uint64_t v5 = *(NSObject ***)(a1 + 24);
    long long v4 = *(std::__shared_weak_count **)(a1 + 32);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      long long v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
      if (v10 >= 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      uint64_t v8 = *(void *)(*((void *)a2 + 1) + 8);
      *(_DWORD *)buf = 136315394;
      int v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void telephonytransport::PCIServiceTransport::handleMessage(telephonytransport::PCIServiceTransport *this, unsigned int a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  if (a2 - 1 >= 0x12) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = a2;
  }
  switch(v4)
  {
    case 0u:
      __int16 v13 = (NSObject **)*((void *)this + 3);
      int v12 = (std::__shared_weak_count *)*((void *)this + 4);
      if (v12)
      {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v14 = *v13;
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      else
      {
        uint64_t v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__p = 134217984;
        *(void *)&__p[4] = a4;
        _os_log_error_impl(&dword_2185A0000, v14, OS_LOG_TYPE_ERROR, "Skipping Unknown message type of length: %zu", __p, 0xCu);
      }
      return;
    case 1u:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x48uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE410;
      uint64_t v16 = v15 + 1;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF748;
      v15[1].__shared_owners_ = 0;
      LODWORD(v15[2].__shared_weak_owners_) = 0;
      if (telephonytransport::deserializeMessage((uint64_t)&v15[1], 1, a3, a4))
      {
        uint64_t shared_owners = v15[1].__shared_owners_;
        if (shared_owners)
        {
          char v18 = *(unsigned char *)(shared_owners + 20);
          if ((v18 & 1) == 0)
          {
            unsigned int v20 = (NSObject **)*((void *)this + 3);
            unsigned int v19 = (std::__shared_weak_count *)*((void *)this + 4);
            if (v19)
            {
              atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
              unsigned int v21 = *v20;
              std::__shared_weak_count::__release_shared[abi:ne180100](v19);
            }
            else
            {
              unsigned int v21 = *v20;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
              goto LABEL_246;
            }
            goto LABEL_295;
          }
          v84 = (os_log_t *)*((void *)this + 3);
          v85 = (std::__shared_weak_count *)*((void *)this + 4);
          if ((v18 & 2) == 0)
          {
            if (v85)
            {
              atomic_fetch_add_explicit(&v85->__shared_owners_, 1uLL, memory_order_relaxed);
              unsigned int v21 = *v84;
              std::__shared_weak_count::__release_shared[abi:ne180100](v85);
            }
            else
            {
              unsigned int v21 = *v84;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
              goto LABEL_289;
            }
            goto LABEL_295;
          }
          if (v85) {
            atomic_fetch_add_explicit(&v85->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if ((v15[2].__shared_weak_owners_ & 0x10) != 0)
          {
            if ((v15[2].__shared_weak_owners_ & 2) != 0)
            {
              if ((v15[2].__shared_weak_owners_ & 4) != 0)
              {
                if ((v15[2].__shared_weak_owners_ & 8) != 0)
                {
                  if (v15[2].__shared_weak_owners_)
                  {
                    if ((v15[2].__shared_weak_owners_ & 0x20) != 0)
                    {
                      char v131 = 1;
                      if (!v85)
                      {
LABEL_362:
                        v124 = operator new(0x20uLL);
                        if (v131) {
                          void *v124 = &unk_26C9AE4F0;
                        }
                        else {
                          void *v124 = &unk_26C9AE460;
                        }
                        goto LABEL_364;
                      }
LABEL_361:
                      std::__shared_weak_count::__release_shared[abi:ne180100](v85);
                      goto LABEL_362;
                    }
                    v100 = *v84;
                    if (!os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR))
                    {
LABEL_360:
                      char v131 = 0;
                      if (!v85) {
                        goto LABEL_362;
                      }
                      goto LABEL_361;
                    }
                    std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
                    if (v136 >= 0) {
                      v130 = __p;
                    }
                    else {
                      v130 = *(unsigned char **)__p;
                    }
                    *(_DWORD *)buf = 136315394;
                    v139 = "SizeReadIO";
                    __int16 v140 = 2080;
                    v141 = v130;
                  }
                  else
                  {
                    v100 = *v84;
                    if (!os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_360;
                    }
                    std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
                    if (v136 >= 0) {
                      v129 = __p;
                    }
                    else {
                      v129 = *(unsigned char **)__p;
                    }
                    *(_DWORD *)buf = 136315394;
                    v139 = "CreateTimeOutMs";
                    __int16 v140 = 2080;
                    v141 = v129;
                  }
                }
                else
                {
                  v100 = *v84;
                  if (!os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_360;
                  }
                  std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
                  if (v136 >= 0) {
                    v128 = __p;
                  }
                  else {
                    v128 = *(unsigned char **)__p;
                  }
                  *(_DWORD *)buf = 136315394;
                  v139 = "OpenRetryCount";
                  __int16 v140 = 2080;
                  v141 = v128;
                }
              }
              else
              {
                v100 = *v84;
                if (!os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_360;
                }
                std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
                if (v136 >= 0) {
                  v125 = __p;
                }
                else {
                  v125 = *(unsigned char **)__p;
                }
                *(_DWORD *)buf = 136315394;
                v139 = "NumReadIO";
                __int16 v140 = 2080;
                v141 = v125;
              }
            }
            else
            {
              v100 = *v84;
              if (!os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR)) {
                goto LABEL_360;
              }
              std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
              if (v136 >= 0) {
                v118 = __p;
              }
              else {
                v118 = *(unsigned char **)__p;
              }
              *(_DWORD *)buf = 136315394;
              v139 = "Flags";
              __int16 v140 = 2080;
              v141 = v118;
            }
          }
          else
          {
            v100 = *v84;
            if (!os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR)) {
              goto LABEL_360;
            }
            std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
            if (v136 >= 0) {
              v101 = __p;
            }
            else {
              v101 = *(unsigned char **)__p;
            }
            *(_DWORD *)buf = 136315394;
            v139 = "PciTransportInterface";
            __int16 v140 = 2080;
            v141 = v101;
          }
          _os_log_error_impl(&dword_2185A0000, v100, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
          if (v136 < 0) {
            operator delete(*(void **)__p);
          }
          goto LABEL_360;
        }
        v67 = (NSObject **)*((void *)this + 3);
        v66 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v66)
        {
          atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v67;
          std::__shared_weak_count::__release_shared[abi:ne180100](v66);
        }
        else
        {
          unsigned int v21 = *v67;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
          goto LABEL_218;
        }
      }
      else
      {
        v51 = (NSObject **)*((void *)this + 3);
        v50 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v50)
        {
          atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v51;
          std::__shared_weak_count::__release_shared[abi:ne180100](v50);
        }
        else
        {
          unsigned int v21 = *v51;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
          goto LABEL_115;
        }
      }
LABEL_295:
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      return;
    case 2u:
    case 4u:
    case 5u:
    case 6u:
    case 8u:
    case 0xAu:
    case 0xCu:
    case 0xEu:
    case 0x10u:
    case 0x12u:
      uint64_t v9 = (NSObject **)*((void *)this + 3);
      uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 4);
      if (v8)
      {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        char v10 = *v9;
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      else
      {
        char v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        telephonytransport::toString(v4, __p);
        uint64_t v11 = v136 >= 0 ? __p : *(const char **)__p;
        *(_DWORD *)buf = 136315394;
        v139 = v11;
        __int16 v140 = 2048;
        v141 = (unsigned char *)a4;
        _os_log_error_impl(&dword_2185A0000, v10, OS_LOG_TYPE_ERROR, "Ignoring unsupported message type: %s, length: %zu", buf, 0x16u);
        if (v136 < 0) {
          operator delete(*(void **)__p);
        }
      }
      return;
    case 3u:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x38uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE570;
      uint64_t v16 = v15 + 1;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF828;
      v15[1].__shared_owners_ = 0;
      LODWORD(v15[2].__vftable) = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v15[1], 3, a3, a4) & 1) == 0)
      {
        v53 = (NSObject **)*((void *)this + 3);
        v52 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v52)
        {
          atomic_fetch_add_explicit(&v52->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v53;
          std::__shared_weak_count::__release_shared[abi:ne180100](v52);
        }
        else
        {
          unsigned int v21 = *v53;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          goto LABEL_115;
        }
        goto LABEL_295;
      }
      uint64_t v22 = v15[1].__shared_owners_;
      if (!v22)
      {
        v69 = (NSObject **)*((void *)this + 3);
        v68 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v68)
        {
          atomic_fetch_add_explicit(&v68->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v69;
          std::__shared_weak_count::__release_shared[abi:ne180100](v68);
        }
        else
        {
          unsigned int v21 = *v69;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          goto LABEL_218;
        }
        goto LABEL_295;
      }
      char v23 = *(unsigned char *)(v22 + 20);
      if ((v23 & 1) == 0)
      {
        __int16 v25 = (NSObject **)*((void *)this + 3);
        uint64_t v24 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v24)
        {
          atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v25;
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        }
        else
        {
          unsigned int v21 = *v25;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          goto LABEL_246;
        }
        goto LABEL_295;
      }
      v86 = (os_log_t *)*((void *)this + 3);
      v87 = (std::__shared_weak_count *)*((void *)this + 4);
      if ((v23 & 2) == 0)
      {
        if (v87)
        {
          atomic_fetch_add_explicit(&v87->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v86;
          std::__shared_weak_count::__release_shared[abi:ne180100](v87);
        }
        else
        {
          unsigned int v21 = *v86;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          goto LABEL_289;
        }
        goto LABEL_295;
      }
      if (v87) {
        atomic_fetch_add_explicit(&v87->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if ((uint64_t)v15[2].__vftable)
      {
        if (((uint64_t)v15[2].__vftable & 2) != 0)
        {
          char v119 = 1;
          goto LABEL_320;
        }
        v102 = *v86;
        if (os_log_type_enabled(*v86, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          if (v136 >= 0) {
            v134 = __p;
          }
          else {
            v134 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "TimeoutMs";
          __int16 v140 = 2080;
          v141 = v134;
LABEL_385:
          _os_log_error_impl(&dword_2185A0000, v102, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
          if (v136 < 0) {
            operator delete(*(void **)__p);
          }
        }
      }
      else
      {
        v102 = *v86;
        if (os_log_type_enabled(*v86, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
          if (v136 >= 0) {
            v103 = __p;
          }
          else {
            v103 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "BytesToRead";
          __int16 v140 = 2080;
          v141 = v103;
          goto LABEL_385;
        }
      }
      char v119 = 0;
LABEL_320:
      if (v87) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v87);
      }
      v124 = operator new(0x20uLL);
      if (v119) {
        void *v124 = &unk_26C9AE640;
      }
      else {
        void *v124 = &unk_26C9AE5C0;
      }
      goto LABEL_364;
    case 7u:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x38uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE6C0;
      uint64_t v16 = v15 + 1;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF898;
      v15[1].__shared_owners_ = 0;
      HIDWORD(v15[2].__vftable) = 0;
      v15[1].__shared_weak_owners_ = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v15[1], 7, a3, a4) & 1) == 0)
      {
        v55 = (NSObject **)*((void *)this + 3);
        v54 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v54)
        {
          atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v55;
          std::__shared_weak_count::__release_shared[abi:ne180100](v54);
        }
        else
        {
          unsigned int v21 = *v55;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          goto LABEL_115;
        }
        goto LABEL_295;
      }
      uint64_t shared_weak_owners = v15[1].__shared_weak_owners_;
      if (!shared_weak_owners)
      {
        v71 = (NSObject **)*((void *)this + 3);
        v70 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v70)
        {
          atomic_fetch_add_explicit(&v70->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v71;
          std::__shared_weak_count::__release_shared[abi:ne180100](v70);
        }
        else
        {
          unsigned int v21 = *v71;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          goto LABEL_218;
        }
        goto LABEL_295;
      }
      char v27 = *(unsigned char *)(shared_weak_owners + 20);
      if ((v27 & 1) == 0)
      {
        uint64_t v29 = (NSObject **)*((void *)this + 3);
        unint64_t v28 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v28)
        {
          atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v29;
          std::__shared_weak_count::__release_shared[abi:ne180100](v28);
        }
        else
        {
          unsigned int v21 = *v29;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          goto LABEL_246;
        }
        goto LABEL_295;
      }
      v88 = (os_log_t *)*((void *)this + 3);
      v89 = (std::__shared_weak_count *)*((void *)this + 4);
      if ((v27 & 2) == 0)
      {
        if (v89)
        {
          atomic_fetch_add_explicit(&v89->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v88;
          std::__shared_weak_count::__release_shared[abi:ne180100](v89);
        }
        else
        {
          unsigned int v21 = *v88;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          goto LABEL_289;
        }
        goto LABEL_295;
      }
      if (v89) {
        atomic_fetch_add_explicit(&v89->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v15[1].__shared_owners_)
      {
        if (BYTE4(v15[2].__vftable))
        {
          char v122 = 1;
          goto LABEL_302;
        }
        v104 = *v88;
        if (os_log_type_enabled(*v88, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          if (v136 >= 0) {
            v105 = __p;
          }
          else {
            v105 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "TimeoutMs";
          __int16 v140 = 2080;
          v141 = v105;
          goto LABEL_371;
        }
      }
      else
      {
        v104 = *v88;
        if (os_log_type_enabled(*v88, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
          if (v136 >= 0) {
            v132 = __p;
          }
          else {
            v132 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "data";
          __int16 v140 = 2080;
          v141 = v132;
LABEL_371:
          _os_log_error_impl(&dword_2185A0000, v104, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
          if (v136 < 0) {
            operator delete(*(void **)__p);
          }
        }
      }
      char v122 = 0;
LABEL_302:
      if (v89) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v89);
      }
      v124 = operator new(0x20uLL);
      if (v122) {
        void *v124 = &unk_26C9AE790;
      }
      else {
        void *v124 = &unk_26C9AE710;
      }
      goto LABEL_364;
    case 9u:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x28uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE810;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF908;
      v15[1].__shared_owners_ = 0;
      if (telephonytransport::deserializeMessage((uint64_t)&v15[1], 9, a3, a4))
      {
        uint64_t v38 = v15[1].__shared_owners_;
        if (v38)
        {
          char v39 = *(unsigned char *)(v38 + 20);
          if (v39)
          {
            if ((v39 & 2) != 0)
            {
              v110 = (std::__shared_weak_count *)*((void *)this + 4);
              if (v110)
              {
                atomic_fetch_add_explicit(&v110->__shared_owners_, 1uLL, memory_order_relaxed);
                std::__shared_weak_count::__release_shared[abi:ne180100](v110);
              }
              v111 = operator new(0x20uLL);
              void *v111 = &unk_26C9AE860;
              v111[1] = this;
              v111[2] = v15 + 1;
              v111[3] = v15;
              v137 = v111;
              telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p);
              goto LABEL_366;
            }
            v95 = (NSObject **)*((void *)this + 3);
            v94 = (std::__shared_weak_count *)*((void *)this + 4);
            if (v94)
            {
              atomic_fetch_add_explicit(&v94->__shared_owners_, 1uLL, memory_order_relaxed);
              unsigned int v21 = *v95;
              std::__shared_weak_count::__release_shared[abi:ne180100](v94);
            }
            else
            {
              unsigned int v21 = *v95;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
              goto LABEL_289;
            }
          }
          else
          {
            uint64_t v41 = (NSObject **)*((void *)this + 3);
            v40 = (std::__shared_weak_count *)*((void *)this + 4);
            if (v40)
            {
              atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
              unsigned int v21 = *v41;
              std::__shared_weak_count::__release_shared[abi:ne180100](v40);
            }
            else
            {
              unsigned int v21 = *v41;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
              goto LABEL_246;
            }
          }
        }
        else
        {
          v77 = (NSObject **)*((void *)this + 3);
          v76 = (std::__shared_weak_count *)*((void *)this + 4);
          if (v76)
          {
            atomic_fetch_add_explicit(&v76->__shared_owners_, 1uLL, memory_order_relaxed);
            unsigned int v21 = *v77;
            std::__shared_weak_count::__release_shared[abi:ne180100](v76);
          }
          else
          {
            unsigned int v21 = *v77;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
            goto LABEL_218;
          }
        }
      }
      else
      {
        v61 = (NSObject **)*((void *)this + 3);
        v60 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v60)
        {
          atomic_fetch_add_explicit(&v60->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v61;
          std::__shared_weak_count::__release_shared[abi:ne180100](v60);
        }
        else
        {
          unsigned int v21 = *v61;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
          goto LABEL_115;
        }
      }
      goto LABEL_295;
    case 0xBu:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x38uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE8E0;
      uint64_t v16 = v15 + 1;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF7B8;
      v15[1].__shared_owners_ = 0;
      HIDWORD(v15[2].__vftable) = 0;
      v15[1].__shared_weak_owners_ = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v15[1], 11, a3, a4) & 1) == 0)
      {
        v57 = (NSObject **)*((void *)this + 3);
        v56 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v56)
        {
          atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v57;
          std::__shared_weak_count::__release_shared[abi:ne180100](v56);
        }
        else
        {
          unsigned int v21 = *v57;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          goto LABEL_115;
        }
        goto LABEL_295;
      }
      uint64_t v30 = v15[1].__shared_weak_owners_;
      if (!v30)
      {
        v73 = (NSObject **)*((void *)this + 3);
        v72 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v72)
        {
          atomic_fetch_add_explicit(&v72->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v73;
          std::__shared_weak_count::__release_shared[abi:ne180100](v72);
        }
        else
        {
          unsigned int v21 = *v73;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          goto LABEL_218;
        }
        goto LABEL_295;
      }
      char v31 = *(unsigned char *)(v30 + 20);
      if ((v31 & 1) == 0)
      {
        uint64_t v33 = (NSObject **)*((void *)this + 3);
        uint64_t v32 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v32)
        {
          atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v33;
          std::__shared_weak_count::__release_shared[abi:ne180100](v32);
        }
        else
        {
          unsigned int v21 = *v33;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          goto LABEL_246;
        }
        goto LABEL_295;
      }
      v90 = (os_log_t *)*((void *)this + 3);
      v91 = (std::__shared_weak_count *)*((void *)this + 4);
      if ((v31 & 2) == 0)
      {
        if (v91)
        {
          atomic_fetch_add_explicit(&v91->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v90;
          std::__shared_weak_count::__release_shared[abi:ne180100](v91);
        }
        else
        {
          unsigned int v21 = *v90;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          goto LABEL_289;
        }
        goto LABEL_295;
      }
      if (v91) {
        atomic_fetch_add_explicit(&v91->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v15[1].__shared_owners_)
      {
        if (BYTE4(v15[2].__vftable))
        {
          char v123 = 1;
          goto LABEL_308;
        }
        v106 = *v90;
        if (os_log_type_enabled(*v90, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          if (v136 >= 0) {
            v107 = __p;
          }
          else {
            v107 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "TimeoutMs";
          __int16 v140 = 2080;
          v141 = v107;
          goto LABEL_377;
        }
      }
      else
      {
        v106 = *v90;
        if (os_log_type_enabled(*v90, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
          if (v136 >= 0) {
            v133 = __p;
          }
          else {
            v133 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "data";
          __int16 v140 = 2080;
          v141 = v133;
LABEL_377:
          _os_log_error_impl(&dword_2185A0000, v106, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
          if (v136 < 0) {
            operator delete(*(void **)__p);
          }
        }
      }
      char v123 = 0;
LABEL_308:
      if (v91) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v91);
      }
      v124 = operator new(0x20uLL);
      if (v123) {
        void *v124 = &unk_26C9AE9B0;
      }
      else {
        void *v124 = &unk_26C9AE930;
      }
      goto LABEL_364;
    case 0xDu:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x38uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEA30;
      uint64_t v16 = v15 + 1;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF630;
      v15[1].__shared_owners_ = 0;
      HIDWORD(v15[2].__vftable) = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v15[1], 13, a3, a4) & 1) == 0)
      {
        v63 = (NSObject **)*((void *)this + 3);
        v62 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v62)
        {
          atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v63;
          std::__shared_weak_count::__release_shared[abi:ne180100](v62);
        }
        else
        {
          unsigned int v21 = *v63;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          goto LABEL_115;
        }
        goto LABEL_295;
      }
      uint64_t v42 = v15[1].__shared_owners_;
      if (!v42)
      {
        v79 = (NSObject **)*((void *)this + 3);
        v78 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v78)
        {
          atomic_fetch_add_explicit(&v78->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v79;
          std::__shared_weak_count::__release_shared[abi:ne180100](v78);
        }
        else
        {
          unsigned int v21 = *v79;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          goto LABEL_218;
        }
        goto LABEL_295;
      }
      char v43 = *(unsigned char *)(v42 + 20);
      if ((v43 & 1) == 0)
      {
        v45 = (NSObject **)*((void *)this + 3);
        v44 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v44)
        {
          atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v45;
          std::__shared_weak_count::__release_shared[abi:ne180100](v44);
        }
        else
        {
          unsigned int v21 = *v45;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          goto LABEL_246;
        }
        goto LABEL_295;
      }
      v96 = (os_log_t *)*((void *)this + 3);
      v97 = (std::__shared_weak_count *)*((void *)this + 4);
      if ((v43 & 2) == 0)
      {
        if (v97)
        {
          atomic_fetch_add_explicit(&v97->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v96;
          std::__shared_weak_count::__release_shared[abi:ne180100](v97);
        }
        else
        {
          unsigned int v21 = *v96;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          goto LABEL_289;
        }
        goto LABEL_295;
      }
      if (v97) {
        atomic_fetch_add_explicit(&v97->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (BYTE4(v15[2].__vftable))
      {
        if ((BYTE4(v15[2].__vftable) & 2) != 0)
        {
          if ((BYTE4(v15[2].__vftable) & 4) != 0)
          {
            char v127 = 1;
            if (!v97) {
              goto LABEL_335;
            }
            goto LABEL_334;
          }
          v112 = *v96;
          if (!os_log_type_enabled(*v96, OS_LOG_TYPE_ERROR))
          {
LABEL_333:
            char v127 = 0;
            if (!v97)
            {
LABEL_335:
              v124 = operator new(0x20uLL);
              if (v127) {
                void *v124 = &unk_26C9AEB00;
              }
              else {
                void *v124 = &unk_26C9AEA80;
              }
LABEL_364:
              v124[1] = this;
              v124[2] = v16;
              v124[3] = v15;
              v137 = v124;
              telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p);
              goto LABEL_366;
            }
LABEL_334:
            std::__shared_weak_count::__release_shared[abi:ne180100](v97);
            goto LABEL_335;
          }
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          if (v136 >= 0) {
            v126 = __p;
          }
          else {
            v126 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "WhichRegister";
          __int16 v140 = 2080;
          v141 = v126;
        }
        else
        {
          v112 = *v96;
          if (!os_log_type_enabled(*v96, OS_LOG_TYPE_ERROR)) {
            goto LABEL_333;
          }
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
          if (v136 >= 0) {
            v120 = __p;
          }
          else {
            v120 = *(unsigned char **)__p;
          }
          *(_DWORD *)buf = 136315394;
          v139 = "TimeoutMs";
          __int16 v140 = 2080;
          v141 = v120;
        }
      }
      else
      {
        v112 = *v96;
        if (!os_log_type_enabled(*v96, OS_LOG_TYPE_ERROR)) {
          goto LABEL_333;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
        if (v136 >= 0) {
          v113 = __p;
        }
        else {
          v113 = *(unsigned char **)__p;
        }
        *(_DWORD *)buf = 136315394;
        v139 = "BytesToRead";
        __int16 v140 = 2080;
        v141 = v113;
      }
      _os_log_error_impl(&dword_2185A0000, v112, OS_LOG_TYPE_ERROR, "%s is missing. Skipping MessageType: %s", buf, 0x16u);
      if (v136 < 0) {
        operator delete(*(void **)__p);
      }
      goto LABEL_333;
    case 0xFu:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x28uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEB80;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF668;
      v15[1].__shared_owners_ = 0;
      if (telephonytransport::deserializeMessage((uint64_t)&v15[1], 15, a3, a4))
      {
        uint64_t v34 = v15[1].__shared_owners_;
        if (v34)
        {
          char v35 = *(unsigned char *)(v34 + 20);
          if (v35)
          {
            if ((v35 & 2) != 0)
            {
              v108 = (std::__shared_weak_count *)*((void *)this + 4);
              if (v108)
              {
                atomic_fetch_add_explicit(&v108->__shared_owners_, 1uLL, memory_order_relaxed);
                std::__shared_weak_count::__release_shared[abi:ne180100](v108);
              }
              v109 = operator new(0x20uLL);
              void *v109 = &unk_26C9AEBD0;
              v109[1] = this;
              v109[2] = v15 + 1;
              v109[3] = v15;
              v137 = v109;
              telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p);
              goto LABEL_366;
            }
            v93 = (NSObject **)*((void *)this + 3);
            v92 = (std::__shared_weak_count *)*((void *)this + 4);
            if (v92)
            {
              atomic_fetch_add_explicit(&v92->__shared_owners_, 1uLL, memory_order_relaxed);
              unsigned int v21 = *v93;
              std::__shared_weak_count::__release_shared[abi:ne180100](v92);
            }
            else
            {
              unsigned int v21 = *v93;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
              goto LABEL_289;
            }
          }
          else
          {
            v37 = (NSObject **)*((void *)this + 3);
            uint64_t v36 = (std::__shared_weak_count *)*((void *)this + 4);
            if (v36)
            {
              atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
              unsigned int v21 = *v37;
              std::__shared_weak_count::__release_shared[abi:ne180100](v36);
            }
            else
            {
              unsigned int v21 = *v37;
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
              goto LABEL_246;
            }
          }
        }
        else
        {
          v75 = (NSObject **)*((void *)this + 3);
          v74 = (std::__shared_weak_count *)*((void *)this + 4);
          if (v74)
          {
            atomic_fetch_add_explicit(&v74->__shared_owners_, 1uLL, memory_order_relaxed);
            unsigned int v21 = *v75;
            std::__shared_weak_count::__release_shared[abi:ne180100](v74);
          }
          else
          {
            unsigned int v21 = *v75;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
            goto LABEL_218;
          }
        }
      }
      else
      {
        v59 = (NSObject **)*((void *)this + 3);
        v58 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v58)
        {
          atomic_fetch_add_explicit(&v58->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v59;
          std::__shared_weak_count::__release_shared[abi:ne180100](v58);
        }
        else
        {
          unsigned int v21 = *v59;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
          goto LABEL_115;
        }
      }
      goto LABEL_295;
    case 0x11u:
      uint64_t v15 = (std::__shared_weak_count *)operator new(0x28uLL);
      v15->__shared_owners_ = 0;
      v15->__shared_weak_owners_ = 0;
      v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEC50;
      v15[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF6A0;
      v15[1].__shared_owners_ = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v15[1], 17, a3, a4) & 1) == 0)
      {
        v65 = (NSObject **)*((void *)this + 3);
        v64 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v64)
        {
          atomic_fetch_add_explicit(&v64->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v65;
          std::__shared_weak_count::__release_shared[abi:ne180100](v64);
        }
        else
        {
          unsigned int v21 = *v65;
        }
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_295;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
LABEL_115:
        if (v136 >= 0) {
          v82 = __p;
        }
        else {
          v82 = *(const char **)__p;
        }
        *(_DWORD *)buf = 136315394;
        v139 = v82;
        __int16 v140 = 2048;
        v141 = (unsigned char *)a4;
        v83 = "Failed to deserialize message. MessageType: %s, length: %zu";
        goto LABEL_293;
      }
      uint64_t v46 = v15[1].__shared_owners_;
      if (!v46)
      {
        v81 = (NSObject **)*((void *)this + 3);
        v80 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v80)
        {
          atomic_fetch_add_explicit(&v80->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v81;
          std::__shared_weak_count::__release_shared[abi:ne180100](v80);
        }
        else
        {
          unsigned int v21 = *v81;
        }
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_295;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
LABEL_218:
        if (v136 >= 0) {
          v116 = __p;
        }
        else {
          v116 = *(const char **)__p;
        }
        *(_DWORD *)buf = 136315394;
        v139 = v116;
        __int16 v140 = 2048;
        v141 = (unsigned char *)a4;
        v83 = "messageId is missing. Skipping MessageType: %s, length: %zu";
        goto LABEL_293;
      }
      char v47 = *(unsigned char *)(v46 + 20);
      if ((v47 & 1) == 0)
      {
        v49 = (NSObject **)*((void *)this + 3);
        v48 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v48)
        {
          atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v49;
          std::__shared_weak_count::__release_shared[abi:ne180100](v48);
        }
        else
        {
          unsigned int v21 = *v49;
        }
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_295;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
LABEL_246:
        if (v136 >= 0) {
          v117 = __p;
        }
        else {
          v117 = *(const char **)__p;
        }
        *(_DWORD *)buf = 136315394;
        v139 = v117;
        __int16 v140 = 2048;
        v141 = (unsigned char *)a4;
        v83 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
LABEL_293:
        _os_log_error_impl(&dword_2185A0000, v21, OS_LOG_TYPE_ERROR, v83, buf, 0x16u);
        if (v136 < 0) {
          operator delete(*(void **)__p);
        }
        goto LABEL_295;
      }
      if ((v47 & 2) == 0)
      {
        v99 = (NSObject **)*((void *)this + 3);
        v98 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v98)
        {
          atomic_fetch_add_explicit(&v98->__shared_owners_, 1uLL, memory_order_relaxed);
          unsigned int v21 = *v99;
          std::__shared_weak_count::__release_shared[abi:ne180100](v98);
        }
        else
        {
          unsigned int v21 = *v99;
        }
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_295;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
LABEL_289:
        if (v136 >= 0) {
          v121 = __p;
        }
        else {
          v121 = *(const char **)__p;
        }
        *(_DWORD *)buf = 136315394;
        v139 = v121;
        __int16 v140 = 2048;
        v141 = (unsigned char *)a4;
        v83 = "Transport token is missing. Skipping MessageType: %s, length: %zu";
        goto LABEL_293;
      }
      v114 = (std::__shared_weak_count *)*((void *)this + 4);
      if (v114)
      {
        atomic_fetch_add_explicit(&v114->__shared_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v114);
      }
      v115 = operator new(0x20uLL);
      void *v115 = &unk_26C9AECA0;
      v115[1] = this;
      v115[2] = v15 + 1;
      v115[3] = v15;
      v137 = v115;
      telephonytransport::PCIServiceTransport::executeAsync((uint64_t)this, __p);
LABEL_366:
      std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](__p);
      return;
    default:
      return;
  }
}

void sub_2185A9D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void telephonytransport::PCIServiceTransport::~PCIServiceTransport(telephonytransport::PCIServiceTransport *this)
{
  *(void *)this = &unk_26C9AE118;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  unsigned int v4 = *((void *)this + 5);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  long long v6 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  NSObject *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t vars8;

  *(void *)this = &unk_26C9AE118;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  unsigned int v4 = *((void *)this + 5);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  long long v6 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }

  operator delete(this);
}

void std::unique_ptr<PB::Data>::reset[abi:ne180100](void ***a1, void **a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    free(*v2);
    operator delete(v2);
  }
}

void std::__shared_ptr_pointer<telephonytransport::PCIServiceTransport *,std::shared_ptr<telephonytransport::PCIServiceTransport>::__shared_ptr_default_delete<telephonytransport::PCIServiceTransport,telephonytransport::PCIServiceTransport>,std::allocator<telephonytransport::PCIServiceTransport>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIServiceTransport *,std::shared_ptr<telephonytransport::PCIServiceTransport>::__shared_ptr_default_delete<telephonytransport::PCIServiceTransport,telephonytransport::PCIServiceTransport>,std::allocator<telephonytransport::PCIServiceTransport>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIServiceTransport *,std::shared_ptr<telephonytransport::PCIServiceTransport>::__shared_ptr_default_delete<telephonytransport::PCIServiceTransport,telephonytransport::PCIServiceTransport>,std::allocator<telephonytransport::PCIServiceTransport>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
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

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  operator delete(v1);
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE2F0;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE2F0;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE2F0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE2F0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::operator()(void *a1, int *a2, unsigned __int8 *a3, const unsigned __int8 **a4, uint64_t *a5)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v6 = (std::__shared_weak_count *)a1[3];
  if (v6)
  {
    int v7 = *a2;
    int v8 = *a3;
    uint64_t v9 = *a4;
    uint64_t v10 = *a5;
    uint64_t v11 = a1[1];
    int v12 = std::__shared_weak_count::lock(v6);
    if (v12)
    {
      __int16 v13 = v12;
      if (a1[2])
      {
        if (v8)
        {
          __int16 v25 = 0;
          uint64_t v24 = &unk_26C9AF710;
          uint64_t v14 = operator new(0x18uLL);
          uint64_t v26 = v14;
          v14[4] = v7;
          v14[5] = 3;
          *(void *)uint64_t v14 = &unk_26C9AF6D8;
          *((void *)v14 + 1) = 0;
          uint64_t v15 = (void **)operator new(0x10uLL);
          *uint64_t v15 = 0;
          v15[1] = 0;
          std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v25, v15);
          PB::Data::assign(v25, v9, &v9[v10]);
          if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(v11 + 64), 5u, (const PB::Base *)&v24) & 1) == 0)
          {
            uint64_t v17 = *(NSObject ***)(v11 + 24);
            uint64_t v16 = *(std::__shared_weak_count **)(v11 + 32);
            if (v16)
            {
              atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
              char v18 = *v17;
              std::__shared_weak_count::__release_shared[abi:ne180100](v16);
            }
            else
            {
              char v18 = *v17;
            }
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(buf, "kReadIndication");
              if (v28 >= 0) {
                uint64_t v22 = buf;
              }
              else {
                uint64_t v22 = *(uint8_t **)buf;
              }
              uint64_t v23 = *((void *)v26 + 1);
              *(_DWORD *)uint64_t v29 = 136315394;
              uint64_t v30 = v22;
              __int16 v31 = 2048;
              uint64_t v32 = v23;
              _os_log_error_impl(&dword_2185A0000, v18, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", v29, 0x16u);
              if (v28 < 0) {
                operator delete(*(void **)buf);
              }
            }
          }
          telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)&v24);
        }
        else
        {
          unsigned int v20 = *(NSObject ***)(v11 + 24);
          unsigned int v19 = *(std::__shared_weak_count **)(v11 + 32);
          if (v19)
          {
            atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
            unsigned int v21 = *v20;
            std::__shared_weak_count::__release_shared[abi:ne180100](v19);
          }
          else
          {
            unsigned int v21 = *v20;
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_2185A0000, v21, OS_LOG_TYPE_ERROR, "Received indication with failure", buf, 2u);
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
}

void sub_2185AA6B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_0,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::target_type()
{
}

void *std::__function::__value_func<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE380;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE380;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE380;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE380;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::operator()(void *a1, int *a2, int *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v6 = (std::__shared_weak_count *)a1[3];
  if (v6)
  {
    int v7 = *a2;
    int v8 = *a3;
    uint64_t v9 = *a4;
    uint64_t v10 = *a5;
    uint64_t v11 = a1[1];
    int v12 = std::__shared_weak_count::lock(v6);
    if (v12)
    {
      __int16 v13 = v12;
      if (a1[2])
      {
        int v23 = 0;
        v20[0] = &unk_26C9AF8D0;
        uint64_t v14 = operator new(0x18uLL);
        v20[2] = v10;
        unsigned int v21 = v14;
        v14[4] = v7;
        v14[5] = 3;
        *(void *)uint64_t v14 = &unk_26C9AF6D8;
        *((void *)v14 + 1) = 0;
        int v22 = v8;
        LOBYTE(v23) = 7;
        v20[1] = v9;
        if ((telephonytransport::BaseProtocol::sendMessage(*(std::mutex **)(v11 + 64), 6u, (const PB::Base *)v20) & 1) == 0)
        {
          uint64_t v16 = *(NSObject ***)(v11 + 24);
          uint64_t v15 = *(std::__shared_weak_count **)(v11 + 32);
          if (v15)
          {
            atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
            uint64_t v17 = *v16;
            std::__shared_weak_count::__release_shared[abi:ne180100](v15);
          }
          else
          {
            uint64_t v17 = *v16;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kStatusIndication");
            if (v25 >= 0) {
              char v18 = __p;
            }
            else {
              char v18 = (void **)__p[0];
            }
            uint64_t v19 = *((void *)v21 + 1);
            *(_DWORD *)buf = 136315394;
            char v27 = v18;
            __int16 v28 = 2048;
            uint64_t v29 = v19;
            _os_log_error_impl(&dword_2185A0000, v17, OS_LOG_TYPE_ERROR, "Failed to send response of MessageType: %s, TxnId: %llu", buf, 0x16u);
            if (v25 < 0) {
              operator delete(__p[0]);
            }
          }
        }
        telephonytransport::PCIStatusIndication::~PCIStatusIndication((telephonytransport::PCIStatusIndication *)v20);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
}

void sub_2185AAB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  telephonytransport::PCIStatusIndication::~PCIStatusIndication((telephonytransport::PCIStatusIndication *)&a9);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleRequestOnConcurrentQueue<telephonytransport::PCICreateRequest>(std::shared_ptr<telephonytransport::PCICreateRequest> &&)::$_1,std::allocator<std::shared_ptr<telephonytransport::PCICreateRequest> &&>,void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::target_type()
{
}

void *std::__function::__value_func<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__value_func[abi:ne180100](void *a1)
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

void std::__shared_ptr_emplace<telephonytransport::PCICreateRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE410;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCICreateRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE410;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCICreateRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE460;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE460;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE460;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE460;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE4F0;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE4F0;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE4F0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE4F0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)1>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE570;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE570;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE5C0;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE5C0;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE5C0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE5C0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE640;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE640;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE640;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE640;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)3>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE6C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE6C0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIWriteRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE710;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE710;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE710;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE710;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE790;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE790;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE790;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE790;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)7>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE810;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE810;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFreeRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE860;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE860;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE860;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE860;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)9>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE8E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AE8E0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCISendImageRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE930;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE930;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE930;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE930;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AE9B0;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AE9B0;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AE9B0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AE9B0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)11>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEA30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEA30;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AEA80;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AEA80;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AEA80;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AEA80;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AEB00;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AEB00;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AEB00;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AEB00;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)13>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEB80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEB80;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AEBD0;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AEBD0;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AEBD0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AEBD0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)15>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEC50;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadRequest>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEC50;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFlushReadRequest>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26C9AECA0;
  uint64_t v2 = (std::__shared_weak_count *)a1[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::~__func(void *__p)
{
  void *__p = &unk_26C9AECA0;
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

char *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t a1)
{
  uint64_t result = (char *)operator new(0x20uLL);
  *(void *)uint64_t result = &unk_26C9AECA0;
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 24);
  *((void *)result + 3) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26C9AECA0;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(result + 8);
  uint64_t v2 = *(void *)(result + 24);
  *(void *)(a2 + 24) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 24);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[3];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

void std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::operator()(uint64_t a1)
{
}

uint64_t std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2},std::allocator<void telephonytransport::PCIServiceTransport::handleMessageOfType<(telephonytransport::PCIMessageType)17>(unsigned char *,unsigned long)::{lambda(void)#2}>,void ()(void)>::target_type()
{
}

void telephonytransport::SocketToRawIPIfaceForwarder::create(uint64_t *a1@<X0>, uint64_t a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, std::string *a5@<X8>)
{
  uint64_t v36 = (telephonytransport::NetworkIface *)0xAAAAAAAAAAAAAAAALL;
  v37 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v34 = 0;
  char v35 = 0;
  uint64_t v33 = 0;
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v27 = *(std::string *)a2;
  }
  int v28 = 12;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  __p = 0;
  uint64_t v32 = 1;
  telephonytransport::NetworkIface::create((telephonytransport *)&v34, &v33, (uint64_t)&v27, a4, &v36);
  if (SHIBYTE(v31) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  if (v33) {
    dispatch_release(v33);
  }
  uint64_t v9 = (telephonytransport *)v35;
  if (v35) {
    std::__shared_weak_count::__release_weak(v35);
  }
  uint64_t v10 = v36;
  if (v36)
  {
    uint64_t v11 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
    v11->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_26C9AED20;
    v11->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    int v12 = v37;
    uint64_t v36 = 0;
    v37 = 0;
    v11->__get_deleter = 0;
    v11->__on_zero_shared_weak = 0;
    v11->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v12;
    __int16 v13 = (std::__shared_weak_count *)operator new(0x20uLL);
    v13->__shared_weak_owners_ = 0;
    v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AED60;
    v13->__shared_owners_ = 0;
    v13[1].__vftable = v11;
    v27.__r_.__value_.__l.__size_ = (std::string::size_type)v13;
    unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v26 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    int v23 = v11;
    uint64_t v24 = v13;
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v14 = *a3;
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    telephonytransport::BaseProtocol::create((uint64_t)&v23, &object, a1, 0, a4, &v25);
    if (object) {
      dispatch_release(object);
    }
    uint64_t v15 = v24;
    if (v24) {
      std::__shared_weak_count::__release_weak(v24);
    }
    unint64_t v16 = v25;
    if (v25)
    {
      uint64_t v17 = v26;
      unint64_t v25 = 0;
      uint64_t v26 = 0;
      on_zero_shared_weak = (std::__shared_weak_count *)v11->__on_zero_shared_weak;
      v11->__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v16;
      v11->__on_zero_shared_weak = (void (__cdecl *)(std::__shared_weak_count *__hidden))v17;
      if (on_zero_shared_weak) {
        std::__shared_weak_count::__release_shared[abi:ne180100](on_zero_shared_weak);
      }
      a5->__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
      a5->__r_.__value_.__l.__size_ = (std::string::size_type)v13;
      a5 = &v27;
    }
    else
    {
      unsigned int v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v15);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)unsigned int v21 = 0;
        _os_log_error_impl(&dword_2185A0000, v20, OS_LOG_TYPE_ERROR, "Failed to create source read only protocol", v21, 2u);
      }
    }
    a5->__r_.__value_.__r.__words[0] = 0;
    a5->__r_.__value_.__l.__size_ = 0;
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
    if (v27.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v27.__r_.__value_.__l.__size_);
    }
  }
  else
  {
    uint64_t v19 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v9);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_2185A0000, v19, OS_LOG_TYPE_ERROR, "Failed to create destination write only transport", (uint8_t *)&v27, 2u);
    }
    a5->__r_.__value_.__r.__words[0] = 0;
    a5->__r_.__value_.__l.__size_ = 0;
  }
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
}

void sub_2185ACC90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14, char a15)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  char v18 = *(std::__shared_weak_count **)(v16 - 56);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  _Unwind_Resume(a1);
}

__n128 telephonytransport::SocketToRawIPIfaceForwarder::SocketToRawIPIfaceForwarder(uint64_t a1, __n128 *a2)
{
  *(void *)a1 = &unk_26C9AED20;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

{
  __n128 result;

  *(void *)a1 = &unk_26C9AED20;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

uint64_t telephonytransport::SocketToRawIPIfaceForwarder::init(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  unsigned int v4 = *(std::__shared_weak_count **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

uint64_t telephonytransport::SocketToRawIPIfaceForwarder::handleMessage(BOOL this, int a2, unsigned __int8 *a3)
{
  if (a2 != 1)
  {
    long long v3 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)this);
    this = os_log_type_enabled(v3, OS_LOG_TYPE_FAULT);
    if (this)
    {
      *(_WORD *)long long v6 = 0;
      _os_log_fault_impl(&dword_2185A0000, v3, OS_LOG_TYPE_FAULT, "Only kPDPIP message type is supported here", v6, 2u);
    }
    __break(1u);
  }
  unsigned int v4 = ***(uint64_t (****)(void))(this + 8);

  return v4();
}

void telephonytransport::SocketToRawIPIfaceForwarder::~SocketToRawIPIfaceForwarder(telephonytransport::SocketToRawIPIfaceForwarder *this)
{
  *(void *)this = &unk_26C9AED20;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C9AED20;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::SocketToRawIPIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToRawIPIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToRawIPIfaceForwarder,telephonytransport::SocketToRawIPIfaceForwarder>,std::allocator<telephonytransport::SocketToRawIPIfaceForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToRawIPIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToRawIPIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToRawIPIfaceForwarder,telephonytransport::SocketToRawIPIfaceForwarder>,std::allocator<telephonytransport::SocketToRawIPIfaceForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketToRawIPIfaceForwarder *,std::shared_ptr<telephonytransport::SocketToRawIPIfaceForwarder>::__shared_ptr_default_delete<telephonytransport::SocketToRawIPIfaceForwarder,telephonytransport::SocketToRawIPIfaceForwarder>,std::allocator<telephonytransport::SocketToRawIPIfaceForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::SocketAndRawIPIfaceBridge::create(uint64_t *a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X2>, NSObject **a4@<X3>, char *a5@<X4>, void *a6@<X8>)
{
  v26.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v26.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = *a2;
  dispatch_object_t object = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  telephonytransport::SocketToRawIPIfaceForwarder::create(a1, a3, &object, a5, &v26);
  if (object) {
    dispatch_release(object);
  }
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  int v12 = *a4;
  dispatch_object_t v22 = v12;
  if (v12) {
    dispatch_retain(v12);
  }
  telephonytransport::RawIPIfaceToSocketForwarder::create(a3, a1, &v22, a5, &v23);
  __int16 v13 = (telephonytransport *)v22;
  if (v22) {
    dispatch_release(v22);
  }
  std::string::size_type v14 = v26.__r_.__value_.__r.__words[0];
  if (v26.__r_.__value_.__r.__words[0] && (unint64_t v15 = v23) != 0)
  {
    *a6 = 0xAAAAAAAAAAAAAAAALL;
    a6[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v16 = operator new(0x20uLL);
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
    void *v16 = v14;
    v16[1] = size;
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = 0uLL;
    char v18 = v24;
    v16[2] = v15;
    v16[3] = v18;
    unint64_t v23 = 0;
    uint64_t v24 = 0;
    *a6 = v16;
    uint64_t v19 = operator new(0x20uLL);
    void *v19 = &unk_26C9AEDD8;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = v16;
    a6[1] = v19;
  }
  else
  {
    unsigned int v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v13);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v21 = 0;
      _os_log_error_impl(&dword_2185A0000, v20, OS_LOG_TYPE_ERROR, "Failed to create SocketAndRawIPIfaceBridge", v21, 2u);
    }
    *a6 = 0;
    a6[1] = 0;
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
  }
  if (v26.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v26.__r_.__value_.__l.__size_);
  }
}

void sub_2185AD158(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, dispatch_object_t object, uint64_t a12, std::__shared_weak_count *a13, dispatch_object_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  std::default_delete<telephonytransport::SocketAndRawIPIfaceBridge>::operator()[abi:ne180100](v16);
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  _Unwind_Resume(a1);
}

__n128 telephonytransport::SocketAndRawIPIfaceBridge::SocketAndRawIPIfaceBridge(_OWORD *a1, uint64_t a2, __n128 *a3)
{
  *a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  __n128 result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  __n128 result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndRawIPIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndRawIPIfaceBridge,telephonytransport::SocketAndRawIPIfaceBridge>,std::allocator<telephonytransport::SocketAndRawIPIfaceBridge>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndRawIPIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndRawIPIfaceBridge,telephonytransport::SocketAndRawIPIfaceBridge>,std::allocator<telephonytransport::SocketAndRawIPIfaceBridge>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketAndRawIPIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndRawIPIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndRawIPIfaceBridge,telephonytransport::SocketAndRawIPIfaceBridge>,std::allocator<telephonytransport::SocketAndRawIPIfaceBridge>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<telephonytransport::SocketAndRawIPIfaceBridge>::operator()[abi:ne180100](void *__p)
{
  if (__p)
  {
    uint64_t v2 = (std::__shared_weak_count *)__p[3];
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    long long v3 = (std::__shared_weak_count *)__p[1];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    operator delete(__p);
  }
}

void telephonytransport::NetworkIface::create(telephonytransport *a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, telephonytransport::NetworkIface **a5@<X8>)
{
  uint64_t v6 = *(unsigned __int8 *)(a3 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a3 + 8);
  }
  if (!v6)
  {
LABEL_8:
    int v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v13 = "Invalid network interface parameters";
LABEL_24:
      _os_log_error_impl(&dword_2185A0000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (*(_DWORD *)(a3 + 56) == 1)
  {
    uint64_t v11 = *(unsigned __int8 *)(a3 + 55);
    if ((v11 & 0x80u) != 0) {
      uint64_t v11 = *(void *)(a3 + 40);
    }
    if (v11) {
      goto LABEL_8;
    }
  }
  else
  {
    if (!*a2)
    {
      int v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(a1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        __int16 v13 = "Providing readQueue is mandatory when read mode is specified";
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    std::string::size_type v14 = (std::__shared_weak_count *)*((void *)a1 + 1);
    if (!v14
      || (std::string::size_type v14 = std::__shared_weak_count::lock(v14)) == 0
      || (uint64_t v15 = *(void *)a1, std::__shared_weak_count::__release_shared[abi:ne180100](v14), !v15))
    {
      int v12 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v14);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        __int16 v13 = "Delegate is mandatory for modes that require reader";
        goto LABEL_24;
      }
LABEL_25:
      *a5 = 0;
      a5[1] = 0;
      return;
    }
  }
  uint64_t v16 = (telephonytransport::NetworkIface *)operator new(0x80uLL);
  uint64_t v17 = *a2;
  dispatch_queue_t v21 = v17;
  if (v17) {
    dispatch_retain(v17);
  }
  telephonytransport::NetworkIface::NetworkIface((uint64_t)v16, (uint64_t)a1, &v21, (long long *)a3, a4);
  char v18 = (std::__shared_weak_count *)operator new(0x20uLL);
  v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AEF60;
  v18->__shared_owners_ = 0;
  v18->__shared_weak_owners_ = 0;
  v18[1].__vftable = (std::__shared_weak_count_vtbl *)v16;
  if (v17) {
    dispatch_release(v17);
  }
  BOOL v19 = telephonytransport::NetworkIface::init(v16);
  if (v19)
  {
    *a5 = v16;
    a5[1] = (telephonytransport::NetworkIface *)v18;
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    unsigned int v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2185A0000, v20, OS_LOG_TYPE_ERROR, "Failed to initialize", buf, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v18);
}

void sub_2185AD4F8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::NetworkIface::init(telephonytransport::NetworkIface *this)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v25 = v2;
  long long v26 = v2;
  long long v23 = v2;
  long long v24 = v2;
  long long v21 = v2;
  long long v22 = v2;
  long long v19 = v2;
  long long v20 = v2;
  long long v17 = v2;
  long long v18 = v2;
  long long v15 = v2;
  long long v16 = v2;
  long long v13 = v2;
  long long v14 = v2;
  *(_OWORD *)uint64_t v11 = v2;
  long long v12 = v2;
  if (*((_DWORD *)this + 24) == 1) {
    goto LABEL_4;
  }
  if (telephonytransport::NetworkIface::initializeReader(this, v11))
  {
    if (!*((_DWORD *)this + 24)) {
      return 1;
    }
LABEL_4:
    if (telephonytransport::NetworkIface::initializeWriter(this, v11)) {
      return 1;
    }
    uint64_t v5 = (NSObject **)*((void *)this + 3);
    unsigned int v4 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      uint64_t v6 = *v5;
    }
    BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)uint64_t v10 = 0;
      uint64_t v9 = "Failed to initialize writer";
LABEL_17:
      _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, v9, v10, 2u);
      return 0;
    }
    return result;
  }
  int v8 = (NSObject **)*((void *)this + 3);
  int v7 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v7)
  {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v6 = *v8;
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  else
  {
    uint64_t v6 = *v8;
  }
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_WORD *)uint64_t v10 = 0;
    uint64_t v9 = "Failed to initialize reader";
    goto LABEL_17;
  }
  return result;
}

uint64_t telephonytransport::NetworkIface::NetworkIface(uint64_t a1, uint64_t a2, dispatch_queue_t *a3, long long *a4, char *a5)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"nwiface", a5, (void *)(a1 + 24));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)a1 = &unk_26C9AEED0;
  long long v9 = *a4;
  *(void *)(a1 + 56) = *((void *)a4 + 2);
  *(_OWORD *)(a1 + 40) = v9;
  *((void *)a4 + 1) = 0;
  *((void *)a4 + 2) = 0;
  *(void *)a4 = 0;
  *(_DWORD *)(a1 + 64) = *((_DWORD *)a4 + 6);
  long long v10 = a4[2];
  *(void *)(a1 + 88) = *((void *)a4 + 6);
  *(_OWORD *)(a1 + 72) = v10;
  *((void *)a4 + 5) = 0;
  *((void *)a4 + 6) = 0;
  *((void *)a4 + 4) = 0;
  *(void *)(a1 + 96) = *((void *)a4 + 7);
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 0;
  uint64_t v11 = *a3;
  if (*a3)
  {
    dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v11, 0);
    long long v13 = dispatch_queue_attr_make_with_qos_class(0, qos_class, 0);
    if (*a3) {
      uint64_t v11 = dispatch_queue_create_with_target_V2("NetworkIface", v13, *a3);
    }
    else {
      uint64_t v11 = dispatch_queue_create("NetworkIface", v13);
    }
  }
  *(void *)(a1 + 120) = v11;
  return a1;
}

void telephonytransport::NetworkIface::~NetworkIface(telephonytransport::NetworkIface *this)
{
  *(void *)this = &unk_26C9AEED0;
  long long v2 = *((void *)this + 14);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  long long v3 = (pcap_t *)*((void *)this + 13);
  if (v3) {
    pcap_close(v3);
  }
  unsigned int v4 = *((void *)this + 15);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = *((void *)this + 14);
  if (v5) {
    dispatch_release(v5);
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  *(void *)this = &unk_26C9ADA40;
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  int v7 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::NetworkIface::~NetworkIface(this);

  operator delete(v1);
}

BOOL telephonytransport::NetworkIface::initializeReader(telephonytransport::NetworkIface *this, char *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unsigned int v4 = (char *)this + 40;
  if (*((char *)this + 63) < 0) {
    unsigned int v4 = *(const char **)v4;
  }
  uint64_t v5 = pcap_open_live(v4, 1522, 1, 10, a2);
  if (!v5)
  {
    long long v14 = (NSObject **)*((void *)this + 3);
    long long v13 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v15 = *v14;
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    else
    {
      long long v15 = *v14;
    }
    BOOL result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (result)
    {
      buf.bf_len = 136315138;
      *(void *)(&buf.bf_len + 1) = a2;
      long long v17 = "Unable to create read handle! Details: %s";
      p_bpf_program buf = &buf;
      long long v19 = v15;
LABEL_46:
      uint32_t v31 = 12;
LABEL_52:
      _os_log_error_impl(&dword_2185A0000, v19, OS_LOG_TYPE_ERROR, v17, (uint8_t *)p_buf, v31);
      return 0;
    }
    return result;
  }
  uint64_t v6 = v5;
  telephonytransport::NetworkIface::verifyDataLinkType(this, v5);
  if (*((_DWORD *)this + 25) == 1 && pcap_setdirection(v6, PCAP_D_IN))
  {
    int v8 = (NSObject **)*((void *)this + 3);
    int v7 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v7)
    {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v9 = *v8;
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    else
    {
      long long v9 = *v8;
    }
    BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (result)
    {
      buf.bf_len = 136315138;
      *(void *)(&buf.bf_len + 1) = pcap_geterr(v6);
      long long v17 = "Unable to set direction, error: %s";
      p_bpf_program buf = &buf;
LABEL_45:
      long long v19 = v9;
      goto LABEL_46;
    }
    return result;
  }
  if (pcap_setnonblock(v6, 1, a2) == -1)
  {
    uint64_t v11 = (NSObject **)*((void *)this + 3);
    long long v10 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v10)
    {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v12 = *v11;
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
    else
    {
      long long v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.bf_len) = 0;
      _os_log_error_impl(&dword_2185A0000, v12, OS_LOG_TYPE_ERROR, "Warning: Unable to mark socket as non blocking", (uint8_t *)&buf, 2u);
    }
  }
  int v20 = pcap_snapshot(v6);
  if (v20 >= 1523)
  {
    int v21 = pcap_set_snaplen(v6, v20);
    long long v23 = (NSObject **)*((void *)this + 3);
    long long v22 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v21)
    {
      if (v22)
      {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
        long long v24 = *v23;
        std::__shared_weak_count::__release_shared[abi:ne180100](v22);
      }
      else
      {
        long long v24 = *v23;
      }
      BOOL result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      LOWORD(buf.bf_len) = 0;
      long long v17 = "Failed to update snapshot length for read handle";
      p_bpf_program buf = &buf;
      goto LABEL_51;
    }
    if (v22)
    {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v25 = *v23;
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    else
    {
      long long v25 = *v23;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      buf.bf_len = 67109376;
      *(&buf.bf_len + 1) = 1522;
      LOWORD(buf.bf_insns) = 1024;
      *(_DWORD *)((char *)&buf.bf_insns + 2) = v20;
      _os_log_impl(&dword_2185A0000, v25, OS_LOG_TYPE_INFO, "Changed snaplength from %d to %d", (uint8_t *)&buf, 0xEu);
    }
  }
  memset(&buf, 170, sizeof(buf));
  long long v26 = (char *)this + 72;
  if (*((char *)this + 95) < 0) {
    long long v26 = *(const char **)v26;
  }
  if (!pcap_compile(v6, &buf, v26, 1, 0xFFFFFFFF))
  {
    if (!pcap_setfilter(v6, &buf))
    {
      pcap_freecode(&buf);
      return telephonytransport::NetworkIface::startReading(this, v6);
    }
    uint64_t v30 = (NSObject **)*((void *)this + 3);
    uint64_t v29 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v29)
    {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v24 = *v30;
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
    else
    {
      long long v24 = *v30;
    }
    BOOL result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    LOWORD(v32) = 0;
    long long v17 = "Unable to set filter";
    p_bpf_program buf = (bpf_program *)&v32;
LABEL_51:
    long long v19 = v24;
    uint32_t v31 = 2;
    goto LABEL_52;
  }
  int v28 = (NSObject **)*((void *)this + 3);
  uint64_t v27 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v27)
  {
    atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    long long v9 = *v28;
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  else
  {
    long long v9 = *v28;
  }
  BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v32 = 136315138;
    uint64_t v33 = pcap_geterr(v6);
    long long v17 = "Unable to compile filter expression, error: %s";
    p_bpf_program buf = (bpf_program *)&v32;
    goto LABEL_45;
  }
  return result;
}

BOOL telephonytransport::NetworkIface::verifyDataLinkType(telephonytransport::NetworkIface *this, pcap *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    int v7 = (NSObject **)*((void *)this + 3);
    uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v6)
    {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      int v8 = *v7;
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    else
    {
      int v8 = *v7;
    }
    BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    LOWORD(v20) = 0;
    long long v15 = "No valid handle exists to determine link type.";
    long long v16 = v8;
    uint32_t v17 = 2;
LABEL_20:
    _os_log_error_impl(&dword_2185A0000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v20, v17);
    return 0;
  }
  int v3 = pcap_datalink(a2);
  int v4 = v3;
  if (v3 < 0)
  {
    long long v10 = (NSObject **)*((void *)this + 3);
    long long v9 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v11 = *v10;
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    else
    {
      uint64_t v11 = *v10;
    }
    BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v20 = 67109120;
    LODWORD(v21) = v4;
    long long v15 = "Failed to determine link type. pcap_datalink returned: %d";
    long long v16 = v11;
    uint32_t v17 = 8;
    goto LABEL_20;
  }
  if (v3 == *((_DWORD *)this + 16)) {
    return 1;
  }
  long long v13 = (NSObject **)*((void *)this + 3);
  long long v12 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v12)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    long long v14 = *v13;
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  else
  {
    long long v14 = *v13;
  }
  BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (result)
  {
    long long v18 = pcap_datalink_val_to_description(v4);
    long long v19 = pcap_datalink_val_to_description(*((_DWORD *)this + 16));
    int v20 = 136315394;
    int v21 = v18;
    __int16 v22 = 2080;
    long long v23 = v19;
    long long v15 = "Data link type is: %s ; Expected: %s";
    long long v16 = v14;
    uint32_t v17 = 22;
    goto LABEL_20;
  }
  return result;
}

BOOL telephonytransport::NetworkIface::startReading(telephonytransport::NetworkIface *this, pcap *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (*((void *)this + 14))
  {
    int v4 = (NSObject **)*((void *)this + 3);
    int v3 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v3)
    {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v5 = *v4;
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    else
    {
      uint64_t v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)bpf_program buf = 0;
      _os_log_error_impl(&dword_2185A0000, v5, OS_LOG_TYPE_ERROR, "Warning: Already started reading", buf, 2u);
    }
    return 1;
  }
  int selectable_fd = pcap_get_selectable_fd(a2);
  if (selectable_fd == -1)
  {
    long long v19 = (NSObject **)*((void *)this + 3);
    long long v18 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v18)
    {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      int v20 = *v19;
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    else
    {
      int v20 = *v19;
    }
    BOOL result = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)bpf_program buf = 0;
      long long v26 = "Unable to retrieve a selectable fd";
LABEL_45:
      uint64_t v29 = v20;
      uint32_t v30 = 2;
      goto LABEL_46;
    }
  }
  else
  {
    int v8 = selectable_fd;
    {
      __int16 v22 = (NSObject **)*((void *)this + 3);
      int v21 = (std::__shared_weak_count *)*((void *)this + 4);
      if (v21)
      {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
        long long v23 = *v22;
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }
      else
      {
        long long v23 = *v22;
      }
      BOOL result = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v27 = __error();
        int v28 = strerror(*v27);
        *(_DWORD *)bpf_program buf = 136315138;
        uint64_t v38 = v28;
        long long v26 = "Unable to set immediate mode, error: %s";
        uint64_t v29 = v23;
        uint32_t v30 = 12;
LABEL_46:
        _os_log_error_impl(&dword_2185A0000, v29, OS_LOG_TYPE_ERROR, v26, buf, v30);
        return 0;
      }
    }
    else
    {
      dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF83E8], v8, 0, *((dispatch_queue_t *)this + 15));
      long long v10 = *((void *)this + 14);
      *((void *)this + 14) = v9;
      if (v10)
      {
        dispatch_release(v10);
        dispatch_source_t v9 = (dispatch_source_t)*((void *)this + 14);
      }
      if (v9)
      {
        uint64_t v11 = *((void *)this + 1);
        long long v12 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v13 = *((void *)this + 3);
        long long v14 = (std::__shared_weak_count *)*((void *)this + 4);
        if (v14) {
          atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        long long v15 = *((void *)this + 14);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 1174405120;
        handler[2] = ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke;
        handler[3] = &__block_descriptor_tmp_2;
        handler[4] = v11;
        uint64_t v33 = v12;
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v34 = a2;
        uint64_t v35 = v13;
        uint64_t v36 = v14;
        if (v14) {
          atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        dispatch_source_set_event_handler(v15, handler);
        long long v16 = *((void *)this + 14);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 0x40000000;
        v31[2] = ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke_3;
        v31[3] = &__block_descriptor_tmp_4;
        v31[4] = a2;
        dispatch_source_set_cancel_handler(v16, v31);
        dispatch_resume(*((dispatch_object_t *)this + 14));
        if (v36) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v36);
        }
        if (v33) {
          std::__shared_weak_count::__release_weak(v33);
        }
        if (v14) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v14);
        }
        if (v12) {
          std::__shared_weak_count::__release_weak(v12);
        }
        return 1;
      }
      long long v25 = (NSObject **)*((void *)this + 3);
      uint64_t v24 = (std::__shared_weak_count *)*((void *)this + 4);
      if (v24)
      {
        atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
        int v20 = *v25;
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
      else
      {
        int v20 = *v25;
      }
      BOOL result = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)bpf_program buf = 0;
        long long v26 = "Unable to create read source";
        goto LABEL_45;
      }
    }
  }
  return result;
}

BOOL telephonytransport::NetworkIface::initializeWriter(telephonytransport::NetworkIface *this, char *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = (char *)this + 40;
  if (*((char *)this + 63) < 0) {
    int v4 = *(const char **)v4;
  }
  uint64_t v5 = pcap_open_live(v4, 1522, 1, 10, a2);
  *((void *)this + 13) = v5;
  if (v5)
  {
    telephonytransport::NetworkIface::verifyDataLinkType(this, v5);
  }
  else
  {
    int v7 = (NSObject **)*((void *)this + 3);
    uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v6)
    {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      int v8 = *v7;
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    else
    {
      int v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = a2;
      _os_log_error_impl(&dword_2185A0000, v8, OS_LOG_TYPE_ERROR, "Unable to create write handle! Details: %s", (uint8_t *)&v10, 0xCu);
    }
  }
  return v5 != 0;
}

BOOL telephonytransport::NetworkIface::write(telephonytransport::NetworkIface *this, const unsigned __int8 *a2, size_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!*((_DWORD *)this + 24))
  {
    uint64_t v5 = (NSObject **)*((void *)this + 3);
    int v4 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v6 = *v5;
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    else
    {
      uint64_t v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v14) = 0;
      _os_log_fault_impl(&dword_2185A0000, v6, OS_LOG_TYPE_FAULT, "Write is not supported", (uint8_t *)&v14, 2u);
    }
    __break(1u);
  }
  int v7 = pcap_inject(*((pcap_t **)this + 13), a2, a3);
  if (v7 == -1)
  {
    dispatch_source_t v9 = (NSObject **)*((void *)this + 3);
    int v8 = (std::__shared_weak_count *)*((void *)this + 4);
    if (v8)
    {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
      int v10 = *v9;
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    else
    {
      int v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = (void *)((char *)this + 40);
      if (*((char *)this + 63) < 0) {
        uint64_t v12 = (void *)*v12;
      }
      uint64_t v13 = pcap_geterr(*((pcap_t **)this + 13));
      int v14 = 136315394;
      long long v15 = v12;
      __int16 v16 = 2080;
      uint32_t v17 = v13;
      _os_log_error_impl(&dword_2185A0000, v10, OS_LOG_TYPE_ERROR, "Failed to write packet to %s, error: %s", (uint8_t *)&v14, 0x16u);
    }
  }
  return v7 != -1;
}

void ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v2 = *(std::__shared_weak_count **)(a1 + 40);
  if (v2)
  {
    int v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      int v4 = v3;
      uint64_t v5 = *(u_char **)(a1 + 32);
      {
        uint64_t v6 = **(NSObject ***)(a1 + 56);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v7 = pcap_geterr(*(pcap_t **)(a1 + 48));
          int v8 = 136315138;
          dispatch_source_t v9 = v7;
          _os_log_error_impl(&dword_2185A0000, v6, OS_LOG_TYPE_ERROR, "Error encountered while reading: %s", (uint8_t *)&v8, 0xCu);
        }
        exit(1);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
}

void sub_2185AE5F4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::sReceivePacket(_anonymous_namespace_ *this, unsigned __int8 *a2, const pcap_pkthdr *a3, const unsigned __int8 *a4)
{
  return (*(uint64_t (**)(_anonymous_namespace_ *, const pcap_pkthdr *, void))(*(void *)this + 16))(this, a3, *((unsigned int *)a2 + 5));
}

void *__copy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE56c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(void *result, void *a2)
{
  uint64_t v2 = a2[5];
  result[4] = a2[4];
  result[5] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c74_ZTSKNSt3__18weak_ptrIN18telephonytransport26TelephonyTransportDelegateEEE56c62_ZTSKNSt3__110shared_ptrIN18telephonytransport11OSLogHandleEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void ___ZN18telephonytransport12NetworkIface12startReadingEP4pcap_block_invoke_3(uint64_t a1)
{
}

void std::__shared_ptr_pointer<telephonytransport::NetworkIface *,std::shared_ptr<telephonytransport::NetworkIface>::__shared_ptr_default_delete<telephonytransport::NetworkIface,telephonytransport::NetworkIface>,std::allocator<telephonytransport::NetworkIface>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkIface *,std::shared_ptr<telephonytransport::NetworkIface>::__shared_ptr_default_delete<telephonytransport::NetworkIface,telephonytransport::NetworkIface>,std::allocator<telephonytransport::NetworkIface>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkIface *,std::shared_ptr<telephonytransport::NetworkIface>::__shared_ptr_default_delete<telephonytransport::NetworkIface,telephonytransport::NetworkIface>,std::allocator<telephonytransport::NetworkIface>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::TCPClientTransportFactory::createNetwork(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v11 = (telephonytransport::TCPClientSocketFactoryNetwork *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v10 = *(std::string *)a1;
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  telephonytransport::TCPClientSocketFactoryNetwork::create((uint64_t)&v10, (uint64_t)&__p, &v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  uint64_t v5 = v11;
  if (v11)
  {
    uint64_t v6 = operator new(0x20uLL);
    telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclienttransport", "factory", v6);
    int v7 = v12;
    std::logic_error v6[2] = v5;
    v6[3] = v7;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    *a3 = v6;
    int v8 = operator new(0x20uLL);
    *int v8 = &unk_26C9AEFD8;
    v8[1] = 0;
    v8[2] = 0;
    v8[3] = v6;
    a3[1] = v8;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
}

void sub_2185AE8A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t telephonytransport::TCPClientTransportFactory::TCPClientTransportFactory(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  return a1;
}

{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"tcpclienttransport", "factory", (void *)a1);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  return a1;
}

void telephonytransport::TCPClientTransportFactory::createUSB(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void telephonytransport::TCPClientTransportFactory::connect(uint64_t a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, char *a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v6 = a2[1];
  if (!v6 || *(void *)(v6 + 8) == -1)
  {
    int v14 = *(NSObject ***)a1;
    uint64_t v13 = *(std::__shared_weak_count **)(a1 + 8);
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v15 = *v14;
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    else
    {
      long long v15 = *v14;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)bpf_program buf = 0;
    uint64_t v18 = "Must provide a valid delegate";
    goto LABEL_32;
  }
  if (!*a3)
  {
    uint32_t v17 = *(NSObject ***)a1;
    __int16 v16 = *(std::__shared_weak_count **)(a1 + 8);
    if (v16)
    {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v15 = *v17;
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
    else
    {
      long long v15 = *v17;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)bpf_program buf = 0;
    uint64_t v18 = "Providing readQueue is mandatory";
LABEL_32:
    _os_log_error_impl(&dword_2185A0000, v15, OS_LOG_TYPE_ERROR, v18, buf, 2u);
LABEL_21:
    *(void *)a5 = 0;
    *(void *)(a5 + 8) = 0;
    return;
  }
  memset(buf, 170, sizeof(buf));
  (***(void (****)(uint8_t *__return_ptr))(a1 + 16))(buf);
  uint64_t v10 = *(void *)buf;
  if (*(void *)buf)
  {
    uint64_t v11 = (std::__shared_weak_count *)a2[1];
    uint64_t v22 = *a2;
    long long v23 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = *a3;
    dispatch_object_t object = v12;
    if (v12)
    {
      dispatch_retain(v12);
      uint64_t v10 = *(void *)buf;
    }
    uint64_t v19 = v10;
    int v20 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    telephonytransport::TCPSocketStream::create((telephonytransport *)&v22, &object, &v19, 2, a4, (std::__shared_weak_count_vtbl **)a5);
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    if (object) {
      dispatch_release(object);
    }
    if (v23) {
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  else
  {
    *(void *)a5 = 0;
    *(void *)(a5 + 8) = 0;
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
}

void sub_2185AEB8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, dispatch_object_t object, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (object) {
    dispatch_release(object);
  }
  if (a14) {
    std::__shared_weak_count::__release_weak(a14);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<telephonytransport::TCPClientTransportFactory *,std::shared_ptr<telephonytransport::TCPClientTransportFactory>::__shared_ptr_default_delete<telephonytransport::TCPClientTransportFactory,telephonytransport::TCPClientTransportFactory>,std::allocator<telephonytransport::TCPClientTransportFactory>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::TCPClientTransportFactory *,std::shared_ptr<telephonytransport::TCPClientTransportFactory>::__shared_ptr_default_delete<telephonytransport::TCPClientTransportFactory,telephonytransport::TCPClientTransportFactory>,std::allocator<telephonytransport::TCPClientTransportFactory>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<telephonytransport::TCPClientTransportFactory *,std::shared_ptr<telephonytransport::TCPClientTransportFactory>::__shared_ptr_default_delete<telephonytransport::TCPClientTransportFactory,telephonytransport::TCPClientTransportFactory>,std::allocator<telephonytransport::TCPClientTransportFactory>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::SocketAndEthernetIfaceBridge::create(uint64_t *a1@<X0>, NSObject **a2@<X1>, uint64_t a3@<X2>, NSObject **a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, void *a7@<X8>)
{
  v28.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v28.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v13 = *a2;
  dispatch_object_t object = v13;
  if (v13) {
    dispatch_retain(v13);
  }
  telephonytransport::SocketToEthernetIfaceForwarder::create(a1, a3, &object, a5, a6, &v28);
  if (object) {
    dispatch_release(object);
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  long long v26 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  int v14 = *a4;
  dispatch_object_t v24 = v14;
  if (v14) {
    dispatch_retain(v14);
  }
  telephonytransport::EthernetIfaceToSocketForwarder::create(a3, a1, &v24, a6, &v25);
  long long v15 = (telephonytransport *)v24;
  if (v24) {
    dispatch_release(v24);
  }
  std::string::size_type v16 = v28.__r_.__value_.__r.__words[0];
  if (v28.__r_.__value_.__r.__words[0] && (unint64_t v17 = v25) != 0)
  {
    *a7 = 0xAAAAAAAAAAAAAAAALL;
    a7[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v18 = operator new(0x20uLL);
    std::string::size_type size = v28.__r_.__value_.__l.__size_;
    *uint64_t v18 = v16;
    v18[1] = size;
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = 0uLL;
    int v20 = v26;
    v18[2] = v17;
    v18[3] = v20;
    unint64_t v25 = 0;
    long long v26 = 0;
    *a7 = v18;
    int v21 = operator new(0x20uLL);
    *int v21 = &unk_26C9AF050;
    v21[1] = 0;
    v21[2] = 0;
    v21[3] = v18;
    a7[1] = v21;
  }
  else
  {
    uint64_t v22 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v15);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v23 = 0;
      _os_log_error_impl(&dword_2185A0000, v22, OS_LOG_TYPE_ERROR, "Failed to create SocketAndEthernetIfaceBridge", v23, 2u);
    }
    *a7 = 0;
    a7[1] = 0;
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
  }
  if (v28.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28.__r_.__value_.__l.__size_);
  }
}

void sub_2185AEDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, dispatch_object_t object, uint64_t a12, std::__shared_weak_count *a13, dispatch_object_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  std::default_delete<telephonytransport::SocketAndRawIPIfaceBridge>::operator()[abi:ne180100](v16);
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  _Unwind_Resume(a1);
}

__n128 telephonytransport::SocketAndEthernetIfaceBridge::SocketAndEthernetIfaceBridge(_OWORD *a1, uint64_t a2, __n128 *a3)
{
  *a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  __n128 result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  __n128 result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndEthernetIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndEthernetIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndEthernetIfaceBridge,telephonytransport::SocketAndEthernetIfaceBridge>,std::allocator<telephonytransport::SocketAndEthernetIfaceBridge>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::SocketAndEthernetIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndEthernetIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndEthernetIfaceBridge,telephonytransport::SocketAndEthernetIfaceBridge>,std::allocator<telephonytransport::SocketAndEthernetIfaceBridge>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<telephonytransport::SocketAndEthernetIfaceBridge *,std::shared_ptr<telephonytransport::SocketAndEthernetIfaceBridge>::__shared_ptr_default_delete<telephonytransport::SocketAndEthernetIfaceBridge,telephonytransport::SocketAndEthernetIfaceBridge>,std::allocator<telephonytransport::SocketAndEthernetIfaceBridge>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

double telephonytransport::sBuildLoggingCategory@<D0>(telephonytransport *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  memset(v11, 170, sizeof(v11));
  std::string::basic_string[abi:ne180100]<0>(v11, (char *)this);
  if (a2 && *a2)
  {
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v11, 46, &__p);
    size_t v6 = strlen(a2);
    int v7 = std::string::append(&__p, a2, v6);
    long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    *(std::string *)a3 = *v7;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v11[2]) < 0) {
      operator delete(v11[0]);
    }
  }
  else
  {
    *(void **)&long long v8 = v11[0];
    *(_OWORD *)a3 = *(_OWORD *)v11;
    *(void **)(a3 + 16) = v11[2];
  }
  return *(double *)&v8;
}

void sub_2185AEFAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  memset(a3, 170, 24);
  uint64_t result = std::string::basic_string[abi:ne180100]((uint64_t)a3, v5 + 1);
  if (*(char *)(result + 23) >= 0) {
    int v7 = (char *)result;
  }
  else {
    int v7 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      long long v8 = a1;
    }
    else {
      long long v8 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v7, v8, v5);
  }
  dispatch_source_t v9 = &v7[v5];
  *dispatch_source_t v9 = a2;
  v9[1] = 0;
  return result;
}

void telephonytransport::OSLogHandle::create(telephonytransport::OSLogHandle *this@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  int v7 = operator new(8uLL);
  telephonytransport::sBuildLoggingCategory(this, a2, (uint64_t)__p);
  if (v10 >= 0) {
    long long v8 = __p;
  }
  else {
    long long v8 = (void **)__p[0];
  }
  void *v7 = os_log_create("com.apple.rtt", (const char *)v8);
  std::shared_ptr<telephonytransport::OSLogHandle>::shared_ptr[abi:ne180100]<telephonytransport::OSLogHandle,void>(a3, (uint64_t)v7);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

void sub_2185AF11C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

telephonytransport::OSLogHandle *telephonytransport::OSLogHandle::OSLogHandle(telephonytransport::OSLogHandle *this, const char *subsystem, const char *category)
{
  *(void *)this = os_log_create(subsystem, category);
  return this;
}

{
  *(void *)this = os_log_create(subsystem, category);
  return this;
}

uint64_t telephonytransport::OSLogHandle::get(telephonytransport::OSLogHandle *this)
{
  return *(void *)this;
}

void telephonytransport::OSLogHandle::~OSLogHandle(void **this)
{
}

{
  os_release(*this);
}

telephonytransport::Loggable *telephonytransport::Loggable::Loggable(telephonytransport::Loggable *this, telephonytransport::OSLogHandle *a2, const char *a3)
{
  return this;
}

{
  telephonytransport::OSLogHandle::create(a2, a3, this);
  return this;
}

void *telephonytransport::Loggable::Loggable(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  *uint64_t result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  *uint64_t result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

__n128 telephonytransport::Loggable::Loggable(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  __n128 result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

uint64_t telephonytransport::Loggable::getOSLog(telephonytransport::Loggable *this)
{
  return **(void **)this;
}

void *telephonytransport::Loggable::getOSLogHandle@<X0>(void *this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = this[1];
  *a2 = *this;
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    size_t v6 = operator new(v4 + 1);
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

void *std::shared_ptr<telephonytransport::OSLogHandle>::shared_ptr[abi:ne180100]<telephonytransport::OSLogHandle,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &unk_26C9AF0C8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_2185AF3E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0;
  if (v10) {
    std::default_delete<telephonytransport::OSLogHandle>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<telephonytransport::OSLogHandle *,std::shared_ptr<telephonytransport::OSLogHandle>::__shared_ptr_default_delete<telephonytransport::OSLogHandle,telephonytransport::OSLogHandle>,std::allocator<telephonytransport::OSLogHandle>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::OSLogHandle *,std::shared_ptr<telephonytransport::OSLogHandle>::__shared_ptr_default_delete<telephonytransport::OSLogHandle,telephonytransport::OSLogHandle>,std::allocator<telephonytransport::OSLogHandle>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<telephonytransport::OSLogHandle *,std::shared_ptr<telephonytransport::OSLogHandle>::__shared_ptr_default_delete<telephonytransport::OSLogHandle,telephonytransport::OSLogHandle>,std::allocator<telephonytransport::OSLogHandle>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<telephonytransport::OSLogHandle>::operator()[abi:ne180100](uint64_t a1, void **a2)
{
  if (a2)
  {
    os_release(*a2);
    operator delete(a2);
  }
}

void telephonytransport::PCIClientTransport::create(NSObject **a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, std::__shared_weak_count_vtbl **a6@<X8>)
{
  uint64_t v12 = (std::__shared_weak_count_vtbl *)operator new(0x70uLL);
  telephonytransport::PCIClientTransport::PCIClientTransport(v12, a3, a4, a5);
  uint64_t v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF1A0;
  v13->__shared_owners_ = 0;
  v13[1].__vftable = v12;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v25 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = v12;
  long long v23 = v13;
  atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  int v14 = *a1;
  dispatch_object_t object = v14;
  if (v14) {
    dispatch_retain(v14);
  }
  telephonytransport::BaseProtocol::create((uint64_t)&v22, &object, a2, 2, a5, &v24);
  if (object) {
    dispatch_release(object);
  }
  long long v15 = v23;
  if (v23) {
    std::__shared_weak_count::__release_weak(v23);
  }
  unint64_t v16 = v24;
  if (v24)
  {
    unint64_t v17 = v25;
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    get_deleter = (std::__shared_weak_count *)v12[2].__get_deleter;
    v12[2].__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v16;
    v12[2].__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v17;
    if (get_deleter) {
      std::__shared_weak_count::__release_shared[abi:ne180100](get_deleter);
    }
    *a6 = v12;
    a6[1] = (std::__shared_weak_count_vtbl *)v13;
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v19 = *(NSObject **)telephonytransport::getDefaultOSLogHandle((telephonytransport *)v15);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = 0;
      _os_log_impl(&dword_2185A0000, v19, OS_LOG_TYPE_INFO, "Failed to create base protocol", (uint8_t *)&v20, 2u);
    }
    *a6 = 0;
    a6[1] = 0;
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v13);
}

void sub_2185AF654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIClientTransport::init(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 104);
  *(_OWORD *)(a1 + 96) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

void *telephonytransport::PCIClientTransport::PCIClientTransport(void *a1, uint64_t a2, uint64_t a3, char *a4)
{
  telephonytransport::OSLogHandle::create((telephonytransport::OSLogHandle *)"pciclienttransport", a4, a1 + 1);
  *a1 = &unk_26C9AF140;
  a1[3] = 0xAAAAAAAAAAAAAAAALL;
  int v7 = (char *)operator new(0x60uLL);
  *(void *)int v7 = 850045863;
  *(_OWORD *)(v7 + 8) = 0u;
  *(_OWORD *)(v7 + 24) = 0u;
  *(_OWORD *)(v7 + 40) = 0u;
  *((void *)v7 + 10) = 0;
  *((void *)v7 + 9) = 0;
  *((void *)v7 + 7) = 0;
  *((void *)v7 + 8) = v7 + 72;
  *((std::chrono::steady_clock::time_point *)v7 + 11) = std::chrono::steady_clock::now();
  a1[3] = v7;
  long long v8 = (void *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 24);
  if (!v9)
  {
    long long v8 = a1 + 7;
    goto LABEL_5;
  }
  if (v9 != a2)
  {
    a1[7] = v9;
LABEL_5:
    *long long v8 = 0;
    goto LABEL_7;
  }
  a1[7] = a1 + 4;
  (*(void (**)(void))(*(void *)*v8 + 24))();
LABEL_7:
  char v10 = (void *)(a3 + 24);
  uint64_t v11 = *(void *)(a3 + 24);
  if (v11)
  {
    if (v11 == a3)
    {
      a1[11] = a1 + 8;
      (*(void (**)(void))(*(void *)*v10 + 24))();
      goto LABEL_13;
    }
    a1[11] = v11;
  }
  else
  {
    char v10 = a1 + 11;
  }
  void *v10 = 0;
LABEL_13:
  a1[12] = 0;
  a1[13] = 0;
  return a1;
}

void sub_2185AF878(_Unwind_Exception *exception_object)
{
  long long v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

_DWORD *telephonytransport::PCIClientTransport::getNextMessageId@<X0>(telephonytransport::PCIClientTransport *this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  *a3 = 0xAAAAAAAAAAAAAAAALL;
  __n128 result = operator new(0x18uLL);
  *(void *)__n128 result = &unk_26C9AF6D8;
  result[5] = 0;
  *a3 = result;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v8 = *((unsigned char *)result + 20);
  *((void *)result + 1) = add;
  *((unsigned char *)result + 20) = v8 | 3;
  result[4] = a2;
  return result;
}

uint64_t telephonytransport::PCIClientTransport::transportCreate(telephonytransport::PCIClientTransport *this, int a2, unsigned int a3, unsigned int a4, int a5, int a6, int a7, unsigned int *a8)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v68 = v15;
  long long v69 = v15;
  v66 = &unk_26C9AF748;
  v67 = 0;
  DWORD2(v69) = 16;
  LODWORD(v69) = a2;
  unint64_t v16 = operator new(0x18uLL);
  *(void *)unint64_t v16 = &unk_26C9AF6D8;
  *((_DWORD *)v16 + 5) = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v18 = *((unsigned char *)v16 + 20);
  *((void *)v16 + 1) = add;
  *((unsigned char *)v16 + 20) = v18 | 3;
  *((_DWORD *)v16 + 4) = 0;
  uint64_t v19 = (uint64_t)v67;
  v67 = v16;
  if (v19)
  {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
    unint64_t v16 = v67;
  }
  DWORD1(v69) = a5;
  HIDWORD(v68) = a6;
  BYTE8(v69) |= 0x2Fu;
  LODWORD(v68) = a7;
  *(void *)((char *)&v68 + 4) = __PAIR64__(a4, a3);
  unint64_t v20 = *((void *)v16 + 1);
  v72 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v20, &v72);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 1u, (const PB::Base *)&v66) & 1) == 0)
  {
    long long v26 = (NSObject **)*((void *)this + 1);
    unint64_t v25 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v25)
    {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v27 = *v26;
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    else
    {
      uint64_t v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
      std::string v28 = v78 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)v81 = v28;
      _os_log_error_impl(&dword_2185A0000, v27, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v78) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_28;
  }
  int v21 = v72;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>((uint64_t)v21, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    long long v23 = (NSObject **)*((void *)this + 1);
    uint64_t v22 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v22)
    {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      unint64_t v24 = *v23;
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    else
    {
      unint64_t v24 = *v23;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string __p = 0;
      _os_log_error_impl(&dword_2185A0000, v24, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v20);
    goto LABEL_28;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, (uint64_t *)&v72);
  unsigned int v29 = *(_DWORD *)buf;
  if (*(_DWORD *)buf != 2)
  {
    char v47 = (NSObject **)*((void *)this + 1);
    uint64_t v46 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v46)
    {
      atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
      v48 = *v47;
      std::__shared_weak_count::__release_shared[abi:ne180100](v46);
    }
    else
    {
      v48 = *v47;
    }
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v73, "kCreateResponse");
      int v56 = v74;
      v57 = *(unsigned char **)v73;
      telephonytransport::toString(v29, v70);
      v58 = v73;
      if (v56 < 0) {
        v58 = v57;
      }
      if (v71 >= 0) {
        v59 = v70;
      }
      else {
        v59 = (void **)v70[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = v20;
      __int16 v76 = 2080;
      v77 = v58;
      __int16 v78 = 2080;
      v79 = v59;
      _os_log_error_impl(&dword_2185A0000, v48, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v71 < 0) {
        operator delete(v70[0]);
      }
      if (v74 < 0) {
        operator delete(*(void **)v73);
      }
    }
    uint32_t v30 = 0;
    uint64_t v31 = 0;
    v52 = v82;
    goto LABEL_58;
  }
  uint64_t v31 = *(void *)&v81[4];
  uint32_t v30 = v82;
  if (v82) {
    atomic_fetch_add_explicit(&v82->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v31)
  {
    v50 = (NSObject **)*((void *)this + 1);
    v49 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v49)
    {
      atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
      v51 = *v50;
      std::__shared_weak_count::__release_shared[abi:ne180100](v49);
    }
    else
    {
      v51 = *v50;
    }
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      goto LABEL_70;
    }
    *(_WORD *)std::string __p = 0;
    v55 = "No response";
LABEL_83:
    _os_log_error_impl(&dword_2185A0000, v51, OS_LOG_TYPE_ERROR, v55, __p, 2u);
    goto LABEL_70;
  }
  uint64_t v32 = *(void *)(v31 + 8);
  if (!v32)
  {
    v54 = (NSObject **)*((void *)this + 1);
    v53 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v53)
    {
      atomic_fetch_add_explicit(&v53->__shared_owners_, 1uLL, memory_order_relaxed);
      v51 = *v54;
      std::__shared_weak_count::__release_shared[abi:ne180100](v53);
    }
    else
    {
      v51 = *v54;
    }
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      goto LABEL_70;
    }
    *(_WORD *)std::string __p = 0;
    v55 = "Response doesn't contain messageId";
    goto LABEL_83;
  }
  if (!telephonytransport::PCIMessageId::operator==(v32, (uint64_t)v67))
  {
    uint64_t v34 = (NSObject **)*((void *)this + 1);
    uint64_t v33 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v33)
    {
      atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v35 = *v34;
      std::__shared_weak_count::__release_shared[abi:ne180100](v33);
    }
    else
    {
      uint64_t v35 = *v34;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      goto LABEL_44;
    }
    *(_WORD *)std::string __p = 0;
    char v43 = "Response messageId must match request messageId";
LABEL_43:
    _os_log_fault_impl(&dword_2185A0000, v35, OS_LOG_TYPE_FAULT, v43, __p, 2u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if ((*(unsigned char *)(v31 + 24) & 2) != 0)
  {
    if (*(_DWORD *)(v31 + 20))
    {
      v63 = (NSObject **)*((void *)this + 1);
      v62 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v62)
      {
        atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
        v64 = *v63;
        std::__shared_weak_count::__release_shared[abi:ne180100](v62);
      }
      else
      {
        v64 = *v63;
      }
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kCreateRequest");
        v65 = v78 >= 0 ? __p : *(unsigned char **)__p;
        *(_DWORD *)v73 = 136315138;
        *(void *)&v73[4] = v65;
        _os_log_error_impl(&dword_2185A0000, v64, OS_LOG_TYPE_ERROR, "%s failed", v73, 0xCu);
        if (SHIBYTE(v78) < 0) {
          operator delete(*(void **)__p);
        }
      }
      goto LABEL_70;
    }
    v52 = v30;
LABEL_58:
    int v21 = v30;
    uint32_t v30 = v52;
    if (!v52) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
  v61 = (NSObject **)*((void *)this + 1);
  v60 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v60)
  {
    atomic_fetch_add_explicit(&v60->__shared_owners_, 1uLL, memory_order_relaxed);
    v51 = *v61;
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
  else
  {
    v51 = *v61;
  }
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    v55 = "Response doesn't contain result";
    goto LABEL_83;
  }
LABEL_70:
  if (v30)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    int v21 = 0;
    uint64_t v31 = 0;
LABEL_72:
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    goto LABEL_29;
  }
LABEL_28:
  int v21 = 0;
  uint64_t v31 = 0;
LABEL_29:
  uint64_t v36 = (uint64_t)v72;
  if (v72 && !atomic_fetch_add(&v72->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(uint64_t))(*(void *)v36 + 16))(v36);
    if (!v31) {
      goto LABEL_48;
    }
  }
  else if (!v31)
  {
    goto LABEL_48;
  }
  if (*(unsigned char *)(v31 + 24))
  {
    unsigned int v40 = *(_DWORD *)(v31 + 16);
    if (v40)
    {
      *a8 = v40;
      uint64_t v44 = 1;
      if (!v21) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    uint64_t v42 = (NSObject **)*((void *)this + 1);
    uint64_t v41 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v41)
    {
      atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v35 = *v42;
      std::__shared_weak_count::__release_shared[abi:ne180100](v41);
    }
    else
    {
      uint64_t v35 = *v42;
    }
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      goto LABEL_44;
    }
    *(_WORD *)std::string __p = 0;
    char v43 = "Create must return valid token";
    goto LABEL_43;
  }
  uint64_t v38 = (NSObject **)*((void *)this + 1);
  v37 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v37)
  {
    atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v39 = *v38;
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v39 = *v38;
LABEL_46:
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    _os_log_error_impl(&dword_2185A0000, v39, OS_LOG_TYPE_ERROR, "Created transport token is missing", __p, 2u);
  }
LABEL_48:
  uint64_t v44 = 0;
  if (v21) {
LABEL_49:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
LABEL_50:
  telephonytransport::PCICreateRequest::~PCICreateRequest((telephonytransport::PCICreateRequest *)&v66);
  return v44;
}

void sub_2185B008C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (v24)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  uint64_t v26 = a18;
  if (a18)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a18 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
    }
  }
  telephonytransport::PCICreateRequest::~PCICreateRequest((telephonytransport::PCICreateRequest *)&a9);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::transportFree(telephonytransport::PCIClientTransport *this, int a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v45 = &unk_26C9AF908;
  uint64_t v46 = 0;
  uint64_t v4 = operator new(0x18uLL);
  *(void *)uint64_t v4 = &unk_26C9AF6D8;
  v4[5] = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v6 = *((unsigned char *)v4 + 20);
  *((void *)v4 + 1) = add;
  *((unsigned char *)v4 + 20) = v6 | 3;
  v4[4] = a2;
  uint64_t v7 = (uint64_t)v46;
  uint64_t v46 = v4;
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    unint64_t add = v46[1];
  }
  uint64_t v49 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), add, &v49);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 9u, (const PB::Base *)&v45) & 1) == 0)
  {
    uint64_t v13 = (NSObject **)*((void *)this + 1);
    uint64_t v12 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v12)
    {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      int v14 = *v13;
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    else
    {
      int v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
      long long v15 = v55 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)v58 = v15;
      _os_log_error_impl(&dword_2185A0000, v14, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v55) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_28;
  }
  uint64_t v8 = v49;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v8, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    char v10 = (NSObject **)*((void *)this + 1);
    uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v11 = *v10;
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    else
    {
      uint64_t v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string __p = 0;
      _os_log_error_impl(&dword_2185A0000, v11, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), add);
    goto LABEL_28;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v49);
  unsigned int v16 = *(_DWORD *)buf;
  if (*(_DWORD *)buf != 10)
  {
    uint64_t v26 = (NSObject **)*((void *)this + 1);
    unint64_t v25 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v25)
    {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v27 = *v26;
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    else
    {
      uint64_t v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v50, "kFreeResponse");
      int v35 = v51;
      uint64_t v36 = *(unsigned char **)v50;
      telephonytransport::toString(v16, v47);
      v37 = v50;
      if (v35 < 0) {
        v37 = v36;
      }
      if (v48 >= 0) {
        uint64_t v38 = v47;
      }
      else {
        uint64_t v38 = (void **)v47[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = add;
      __int16 v53 = 2080;
      v54 = v37;
      __int16 v55 = 2080;
      int v56 = v38;
      _os_log_error_impl(&dword_2185A0000, v27, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v48 < 0) {
        operator delete(v47[0]);
      }
      if (v51 < 0) {
        operator delete(*(void **)v50);
      }
    }
    uint64_t v18 = 0;
    unint64_t v17 = 0;
    uint64_t v31 = v59;
    goto LABEL_42;
  }
  uint64_t v18 = *(void *)&v58[4];
  unint64_t v17 = v59;
  if (v59) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v59 + 8), 1uLL, memory_order_relaxed);
  }
  if (!v18)
  {
    unsigned int v29 = (NSObject **)*((void *)this + 1);
    std::string v28 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v28)
    {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      uint32_t v30 = *v29;
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
LABEL_51:
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      *(_WORD *)std::string __p = 0;
      uint64_t v34 = "No response";
      goto LABEL_68;
    }
LABEL_50:
    uint32_t v30 = *v29;
    goto LABEL_51;
  }
  uint64_t v19 = *(void *)(v18 + 8);
  if (v19)
  {
    if (!telephonytransport::PCIMessageId::operator==(v19, (uint64_t)v46))
    {
      int v21 = (NSObject **)*((void *)this + 1);
      unint64_t v20 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v20)
      {
        atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
        unint64_t v17 = *v21;
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
      else
      {
        unint64_t v17 = *v21;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)std::string __p = 0;
        _os_log_fault_impl(&dword_2185A0000, v17, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
      }
      __break(1u);
      goto LABEL_50;
    }
    if ((*(unsigned char *)(v18 + 20) & 1) == 0)
    {
      unsigned int v40 = (NSObject **)*((void *)this + 1);
      uint64_t v39 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v39)
      {
        atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
        uint32_t v30 = *v40;
        std::__shared_weak_count::__release_shared[abi:ne180100](v39);
      }
      else
      {
        uint32_t v30 = *v40;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string __p = 0;
        uint64_t v34 = "Response doesn't contain result";
        goto LABEL_68;
      }
      goto LABEL_55;
    }
    if (*(_DWORD *)(v18 + 16))
    {
      uint64_t v42 = (NSObject **)*((void *)this + 1);
      uint64_t v41 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v41)
      {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
        char v43 = *v42;
        std::__shared_weak_count::__release_shared[abi:ne180100](v41);
      }
      else
      {
        char v43 = *v42;
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kFreeRequest");
        uint64_t v44 = v55 >= 0 ? __p : *(unsigned char **)__p;
        *(_DWORD *)v50 = 136315138;
        *(void *)&v50[4] = v44;
        _os_log_error_impl(&dword_2185A0000, v43, OS_LOG_TYPE_ERROR, "%s failed", v50, 0xCu);
        if (SHIBYTE(v55) < 0) {
          operator delete(*(void **)__p);
        }
      }
      goto LABEL_55;
    }
    uint64_t v31 = v17;
LABEL_42:
    uint64_t v22 = (std::__shared_weak_count *)v17;
    unint64_t v17 = v31;
    if (!v31) {
      goto LABEL_29;
    }
    goto LABEL_57;
  }
  uint64_t v33 = (NSObject **)*((void *)this + 1);
  uint64_t v32 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v32)
  {
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
    uint32_t v30 = *v33;
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  else
  {
    uint32_t v30 = *v33;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    uint64_t v34 = "Response doesn't contain messageId";
LABEL_68:
    _os_log_error_impl(&dword_2185A0000, v30, OS_LOG_TYPE_ERROR, v34, __p, 2u);
  }
LABEL_55:
  if (v17)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
    uint64_t v18 = 0;
    uint64_t v22 = 0;
LABEL_57:
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v18 = 0;
  uint64_t v22 = 0;
LABEL_29:
  uint64_t v23 = v49;
  if (v49 && !atomic_fetch_add((atomic_ullong *volatile)(v49 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(uint64_t))(*(void *)v23 + 16))(v23);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  telephonytransport::PCIFreeRequest::~PCIFreeRequest((telephonytransport::PCIFreeRequest *)&v45);
  return v18 != 0;
}

void sub_2185B0780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (v20)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  uint64_t v22 = a14;
  if (a14)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a14 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v22 + 16))(v22);
    }
  }
  telephonytransport::PCIFreeRequest::~PCIFreeRequest((telephonytransport::PCIFreeRequest *)&a9);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIClientTransport::read(telephonytransport::PCIClientTransport *this, int a2, unsigned int a3, unsigned int a4, unsigned __int8 *a5, NSObject *a6)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  unint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v60 = &unk_26C9AF828;
  v61 = 0;
  unint64_t v63 = 0xAAAAAAAA00000000;
  uint64_t v12 = operator new(0x18uLL);
  *(void *)uint64_t v12 = &unk_26C9AF6D8;
  *((_DWORD *)v12 + 5) = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v14 = *((unsigned char *)v12 + 20);
  *((void *)v12 + 1) = add;
  *((unsigned char *)v12 + 20) = v14 | 3;
  *((_DWORD *)v12 + 4) = a2;
  uint64_t v15 = (uint64_t)v61;
  v61 = v12;
  if (v15)
  {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
    uint64_t v12 = v61;
  }
  LOBYTE(v63) = v63 | 3;
  unint64_t v62 = __PAIR64__(a4, a3);
  unsigned int v16 = *((void *)v12 + 1);
  uint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), (unint64_t)v16, &v66);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 3u, (const PB::Base *)&v60) & 1) == 0)
  {
    uint64_t v22 = (NSObject **)*((void *)this + 1);
    int v21 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v21)
    {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      unsigned int v16 = *v22;
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
    else
    {
      unsigned int v16 = *v22;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
      uint64_t v23 = v72 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)v75 = v23;
      _os_log_error_impl(&dword_2185A0000, v16, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v72) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_28;
  }
  uint64_t v17 = v66;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (!std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v17, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v66);
    LODWORD(v24) = *(_DWORD *)buf;
    if (*(_DWORD *)buf != 4) {
      goto LABEL_45;
    }
    uint64_t v24 = *(void *)&v75[4];
    unsigned int v16 = v76;
    if (v76) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v76 + 8), 1uLL, memory_order_relaxed);
    }
    if (v24)
    {
      uint64_t v25 = *(void *)(v24 + 16);
      if (v25)
      {
        if (!telephonytransport::PCIMessageId::operator==(v25, (uint64_t)v61))
        {
          uint64_t v27 = (NSObject **)*((void *)this + 1);
          uint64_t v26 = (std::__shared_weak_count *)*((void *)this + 2);
          if (v26)
          {
            atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
            a6 = *v27;
            std::__shared_weak_count::__release_shared[abi:ne180100](v26);
          }
          else
          {
            a6 = *v27;
          }
          if (!os_log_type_enabled(a6, OS_LOG_TYPE_FAULT)) {
            goto LABEL_44;
          }
          *(_WORD *)std::string __p = 0;
          v37 = "Response messageId must match request messageId";
          goto LABEL_43;
        }
        if (*(unsigned char *)(v24 + 28))
        {
          if (!*(_DWORD *)(v24 + 24))
          {
            uint64_t v46 = v16;
            goto LABEL_58;
          }
          v57 = (NSObject **)*((void *)this + 1);
          int v56 = (std::__shared_weak_count *)*((void *)this + 2);
          if (v56)
          {
            atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
            v58 = *v57;
            std::__shared_weak_count::__release_shared[abi:ne180100](v56);
          }
          else
          {
            v58 = *v57;
          }
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kReadRequest");
            uint64_t v59 = v72 >= 0 ? __p : *(unsigned char **)__p;
            *(_DWORD *)v67 = 136315138;
            *(void *)&v67[4] = v59;
            _os_log_error_impl(&dword_2185A0000, v58, OS_LOG_TYPE_ERROR, "%s failed", v67, 0xCu);
            if (SHIBYTE(v72) < 0) {
              operator delete(*(void **)__p);
            }
          }
          goto LABEL_70;
        }
        __int16 v55 = (NSObject **)*((void *)this + 1);
        v54 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v54)
        {
          atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
          v45 = *v55;
          std::__shared_weak_count::__release_shared[abi:ne180100](v54);
        }
        else
        {
          v45 = *v55;
        }
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)std::string __p = 0;
          uint64_t v49 = "Response doesn't contain result";
          goto LABEL_83;
        }
LABEL_70:
        if (v16)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16);
          std::string v28 = 0;
          uint64_t v24 = 0;
          goto LABEL_72;
        }
        goto LABEL_28;
      }
      char v48 = (NSObject **)*((void *)this + 1);
      char v47 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v47)
      {
        atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
        v45 = *v48;
        std::__shared_weak_count::__release_shared[abi:ne180100](v47);
      }
      else
      {
        v45 = *v48;
      }
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)std::string __p = 0;
      uint64_t v49 = "Response doesn't contain messageId";
    }
    else
    {
      uint64_t v44 = (NSObject **)*((void *)this + 1);
      char v43 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v43)
      {
        atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
        v45 = *v44;
        std::__shared_weak_count::__release_shared[abi:ne180100](v43);
      }
      else
      {
        v45 = *v44;
      }
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)std::string __p = 0;
      uint64_t v49 = "No response";
    }
LABEL_83:
    _os_log_error_impl(&dword_2185A0000, v45, OS_LOG_TYPE_ERROR, v49, __p, 2u);
    goto LABEL_70;
  }
  uint64_t v19 = (NSObject **)*((void *)this + 1);
  uint64_t v18 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v18)
  {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    unint64_t v20 = *v19;
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  else
  {
    unint64_t v20 = *v19;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    _os_log_error_impl(&dword_2185A0000, v20, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
  }
  telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), (unint64_t)v16);
LABEL_28:
  std::string v28 = 0;
  uint64_t v24 = 0;
  while (1)
  {
    uint64_t v29 = v66;
    if (v66 && !atomic_fetch_add((atomic_ullong *volatile)(v66 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(uint64_t))(*(void *)v29 + 16))(v29);
      if (!v24) {
        goto LABEL_50;
      }
    }
    else if (!v24)
    {
      goto LABEL_50;
    }
    uint64_t v30 = *(void *)(v24 + 8);
    if (!v30)
    {
      int v35 = (NSObject **)*((void *)this + 1);
      uint64_t v34 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v34)
      {
        atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v36 = *v35;
        std::__shared_weak_count::__release_shared[abi:ne180100](v34);
      }
      else
      {
        uint64_t v36 = *v35;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string __p = 0;
        _os_log_error_impl(&dword_2185A0000, v36, OS_LOG_TYPE_ERROR, "No data read", __p, 2u);
      }
LABEL_50:
      uint64_t v41 = 0;
      if (!v28) {
        goto LABEL_52;
      }
LABEL_51:
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
      goto LABEL_52;
    }
    size_t v31 = *(void *)(v30 + 8);
    if (v31 <= a3) {
      break;
    }
    uint64_t v33 = (NSObject **)*((void *)this + 1);
    uint64_t v32 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v32)
    {
      atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      a6 = *v33;
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
    else
    {
      a6 = *v33;
    }
    if (os_log_type_enabled(a6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)std::string __p = 0;
      v37 = "Can't read more bytes than requested";
LABEL_43:
      _os_log_fault_impl(&dword_2185A0000, a6, OS_LOG_TYPE_FAULT, v37, __p, 2u);
    }
LABEL_44:
    __break(1u);
LABEL_45:
    uint64_t v39 = (NSObject **)*((void *)this + 1);
    uint64_t v38 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v38)
    {
      atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
      unsigned int v40 = *v39;
      std::__shared_weak_count::__release_shared[abi:ne180100](v38);
    }
    else
    {
      unsigned int v40 = *v39;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v67, "kReadResponse");
      int v50 = v68;
      char v51 = *(unsigned char **)v67;
      telephonytransport::toString(v24, v64);
      v52 = v67;
      if (v50 < 0) {
        v52 = v51;
      }
      if (v65 >= 0) {
        __int16 v53 = v64;
      }
      else {
        __int16 v53 = (void **)v64[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = v16;
      __int16 v70 = 2080;
      char v71 = v52;
      __int16 v72 = 2080;
      v73 = v53;
      _os_log_error_impl(&dword_2185A0000, v40, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v65 < 0) {
        operator delete(v64[0]);
      }
      if (v68 < 0) {
        operator delete(*(void **)v67);
      }
    }
    unsigned int v16 = 0;
    uint64_t v24 = 0;
    uint64_t v46 = v76;
LABEL_58:
    std::string v28 = (std::__shared_weak_count *)v16;
    unsigned int v16 = v46;
    if (v46) {
LABEL_72:
    }
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16);
  }
  memcpy(a5, *(const void **)v30, v31);
  a6->isa = *(Class *)(*(void *)(v24 + 8) + 8);
  uint64_t v41 = 1;
  if (v28) {
    goto LABEL_51;
  }
LABEL_52:
  telephonytransport::PCIReadRequest::~PCIReadRequest((telephonytransport::PCIReadRequest *)&v60);
  return v41;
}

void sub_2185B0F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  if (v30)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  uint64_t v32 = a16;
  if (a16)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a16 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v32 + 16))(v32);
    }
  }
  telephonytransport::PCIReadRequest::~PCIReadRequest((telephonytransport::PCIReadRequest *)&a9);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::write(telephonytransport::PCIClientTransport *this, int a2, unsigned __int8 *a3, uint64_t a4, int a5, NSObject *a6)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v58 = 0;
  uint64_t v59 = 2863311530;
  int v56 = &unk_26C9AF898;
  v57 = 0;
  uint64_t v12 = operator new(0x18uLL);
  *(void *)uint64_t v12 = &unk_26C9AF6D8;
  v12[5] = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v14 = *((unsigned char *)v12 + 20);
  *((void *)v12 + 1) = add;
  *((unsigned char *)v12 + 20) = v14 | 3;
  v12[4] = a2;
  uint64_t v15 = (uint64_t)v58;
  v58 = v12;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
  }
  unsigned int v16 = v57;
  if (!v57)
  {
    uint64_t v17 = (void **)operator new(0x10uLL);
    NSObject *v17 = 0;
    v17[1] = 0;
    std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v57, v17);
    unsigned int v16 = v57;
  }
  PB::Data::assign(v16, a3, &a3[a4]);
  BYTE4(v59) |= 1u;
  LODWORD(v59) = a5;
  unint64_t v18 = v58[1];
  uint64_t v62 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v18, &v62);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 7u, (const PB::Base *)&v56) & 1) == 0)
  {
    uint64_t v24 = (NSObject **)*((void *)this + 1);
    uint64_t v23 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v23)
    {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v25 = *v24;
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    else
    {
      uint64_t v25 = *v24;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
      uint64_t v26 = v68 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)char v71 = v26;
      _os_log_error_impl(&dword_2185A0000, v25, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v68) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_30;
  }
  uint64_t v19 = v62;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v19, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    int v21 = (NSObject **)*((void *)this + 1);
    unint64_t v20 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v20)
    {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v22 = *v21;
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    else
    {
      uint64_t v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string __p = 0;
      _os_log_error_impl(&dword_2185A0000, v22, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v18);
    goto LABEL_30;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v62);
  unsigned int v27 = *(_DWORD *)buf;
  if (*(_DWORD *)buf != 8)
  {
    v37 = (NSObject **)*((void *)this + 1);
    uint64_t v36 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v36)
    {
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v38 = *v37;
      std::__shared_weak_count::__release_shared[abi:ne180100](v36);
    }
    else
    {
      uint64_t v38 = *v37;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v63, "kWriteResponse");
      int v46 = v64;
      char v47 = *(unsigned char **)v63;
      telephonytransport::toString(v27, v60);
      char v48 = v63;
      if (v46 < 0) {
        char v48 = v47;
      }
      if (v61 >= 0) {
        uint64_t v49 = v60;
      }
      else {
        uint64_t v49 = (void **)v60[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = v18;
      __int16 v66 = 2080;
      v67 = v48;
      __int16 v68 = 2080;
      long long v69 = v49;
      _os_log_error_impl(&dword_2185A0000, v38, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v61 < 0) {
        operator delete(v60[0]);
      }
      if (v64 < 0) {
        operator delete(*(void **)v63);
      }
    }
    uint64_t v29 = 0;
    std::string v28 = 0;
    uint64_t v42 = v72;
    goto LABEL_47;
  }
  uint64_t v29 = *(void *)&v71[4];
  std::string v28 = v72;
  if (v72) {
    atomic_fetch_add_explicit(&v72->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v29)
  {
    unsigned int v40 = (NSObject **)*((void *)this + 1);
    uint64_t v39 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v39)
    {
      atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v41 = *v40;
      std::__shared_weak_count::__release_shared[abi:ne180100](v39);
LABEL_56:
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_WORD *)std::string __p = 0;
      v45 = "No response";
      goto LABEL_73;
    }
LABEL_55:
    uint64_t v41 = *v40;
    goto LABEL_56;
  }
  uint64_t v30 = *(void *)(v29 + 8);
  if (v30)
  {
    if (!telephonytransport::PCIMessageId::operator==(v30, (uint64_t)v58))
    {
      uint64_t v32 = (NSObject **)*((void *)this + 1);
      size_t v31 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v31)
      {
        atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
        a6 = *v32;
        std::__shared_weak_count::__release_shared[abi:ne180100](v31);
      }
      else
      {
        a6 = *v32;
      }
      if (os_log_type_enabled(a6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)std::string __p = 0;
        _os_log_fault_impl(&dword_2185A0000, a6, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
      }
      __break(1u);
      goto LABEL_55;
    }
    if ((*(unsigned char *)(v29 + 24) & 2) == 0)
    {
      char v51 = (NSObject **)*((void *)this + 1);
      int v50 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v50)
      {
        atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v41 = *v51;
        std::__shared_weak_count::__release_shared[abi:ne180100](v50);
      }
      else
      {
        uint64_t v41 = *v51;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string __p = 0;
        v45 = "Response doesn't contain result";
        goto LABEL_73;
      }
      goto LABEL_60;
    }
    if (*(_DWORD *)(v29 + 20))
    {
      __int16 v53 = (NSObject **)*((void *)this + 1);
      v52 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v52)
      {
        atomic_fetch_add_explicit(&v52->__shared_owners_, 1uLL, memory_order_relaxed);
        v54 = *v53;
        std::__shared_weak_count::__release_shared[abi:ne180100](v52);
      }
      else
      {
        v54 = *v53;
      }
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kWriteRequest");
        __int16 v55 = v68 >= 0 ? __p : *(unsigned char **)__p;
        *(_DWORD *)unint64_t v63 = 136315138;
        *(void *)&v63[4] = v55;
        _os_log_error_impl(&dword_2185A0000, v54, OS_LOG_TYPE_ERROR, "%s failed", v63, 0xCu);
        if (SHIBYTE(v68) < 0) {
          operator delete(*(void **)__p);
        }
      }
      goto LABEL_60;
    }
    uint64_t v42 = v28;
LABEL_47:
    uint64_t v33 = v28;
    std::string v28 = v42;
    if (!v42) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
  uint64_t v44 = (NSObject **)*((void *)this + 1);
  char v43 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v43)
  {
    atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v41 = *v44;
    std::__shared_weak_count::__release_shared[abi:ne180100](v43);
  }
  else
  {
    uint64_t v41 = *v44;
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    v45 = "Response doesn't contain messageId";
LABEL_73:
    _os_log_error_impl(&dword_2185A0000, v41, OS_LOG_TYPE_ERROR, v45, __p, 2u);
  }
LABEL_60:
  if (v28)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    uint64_t v29 = 0;
    uint64_t v33 = 0;
LABEL_62:
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v29 = 0;
  uint64_t v33 = 0;
LABEL_31:
  uint64_t v34 = v62;
  if (v62 && !atomic_fetch_add((atomic_ullong *volatile)(v62 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(uint64_t))(*(void *)v34 + 16))(v34);
  }
  if (v29 && (*(unsigned char *)(v29 + 24) & 1) != 0) {
    a6->isa = (Class)*(unsigned int *)(v29 + 16);
  }
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
  telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)&v56);
  return v29 != 0;
}

void sub_2185B1708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (v22)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  uint64_t v24 = a16;
  if (a16)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a16 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
    }
  }
  telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)&a9);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::sendImage(telephonytransport::PCIClientTransport *this, int a2, unsigned __int8 *a3, uint64_t a4, int a5, NSObject *a6, unsigned int *a7)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  char v61 = 0;
  uint64_t v62 = 2863311530;
  uint64_t v59 = &unk_26C9AF7B8;
  uint64_t v60 = 0;
  char v14 = operator new(0x18uLL);
  *(void *)char v14 = &unk_26C9AF6D8;
  v14[5] = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v16 = *((unsigned char *)v14 + 20);
  *((void *)v14 + 1) = add;
  *((unsigned char *)v14 + 20) = v16 | 3;
  v14[4] = a2;
  uint64_t v17 = (uint64_t)v61;
  char v61 = v14;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  unint64_t v18 = v60;
  if (!v60)
  {
    uint64_t v19 = (void **)operator new(0x10uLL);
    NSObject *v19 = 0;
    v19[1] = 0;
    std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)&v60, v19);
    unint64_t v18 = v60;
  }
  PB::Data::assign(v18, a3, &a3[a4]);
  BYTE4(v62) |= 1u;
  LODWORD(v62) = a5;
  unint64_t v20 = v61[1];
  uint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), v20, &v65);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0xBu, (const PB::Base *)&v59) & 1) == 0)
  {
    uint64_t v26 = (NSObject **)*((void *)this + 1);
    uint64_t v25 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v25)
    {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      unsigned int v27 = *v26;
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    else
    {
      unsigned int v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
      std::string v28 = v71 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)char v74 = v28;
      _os_log_error_impl(&dword_2185A0000, v27, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v71) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_30;
  }
  uint64_t v21 = v65;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v21, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    uint64_t v23 = (NSObject **)*((void *)this + 1);
    uint64_t v22 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v22)
    {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v24 = *v23;
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    else
    {
      uint64_t v24 = *v23;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string __p = 0;
      _os_log_error_impl(&dword_2185A0000, v24, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), v20);
    goto LABEL_30;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v65);
  unsigned int v29 = *(_DWORD *)buf;
  if (*(_DWORD *)buf != 12)
  {
    unsigned int v40 = (NSObject **)*((void *)this + 1);
    uint64_t v39 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v39)
    {
      atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v41 = *v40;
      std::__shared_weak_count::__release_shared[abi:ne180100](v39);
    }
    else
    {
      uint64_t v41 = *v40;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v66, "kSendImageResponse");
      int v49 = v67;
      int v50 = *(unsigned char **)v66;
      telephonytransport::toString(v29, v63);
      char v51 = v66;
      if (v49 < 0) {
        char v51 = v50;
      }
      if (v64 >= 0) {
        v52 = v63;
      }
      else {
        v52 = (void **)v63[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = v20;
      __int16 v69 = 2080;
      __int16 v70 = v51;
      __int16 v71 = 2080;
      __int16 v72 = v52;
      _os_log_error_impl(&dword_2185A0000, v41, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v64 < 0) {
        operator delete(v63[0]);
      }
      if (v67 < 0) {
        operator delete(*(void **)v66);
      }
    }
    uint64_t v31 = 0;
    uint64_t v30 = 0;
    v45 = v75;
    goto LABEL_49;
  }
  uint64_t v31 = *(void *)&v74[4];
  uint64_t v30 = v75;
  if (v75) {
    atomic_fetch_add_explicit(&v75->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v31)
  {
    char v43 = (NSObject **)*((void *)this + 1);
    uint64_t v42 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v42)
    {
      atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v44 = *v43;
      std::__shared_weak_count::__release_shared[abi:ne180100](v42);
LABEL_58:
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_62;
      }
      *(_WORD *)std::string __p = 0;
      char v48 = "No response";
      goto LABEL_75;
    }
LABEL_57:
    uint64_t v44 = *v43;
    goto LABEL_58;
  }
  uint64_t v32 = *(void *)(v31 + 8);
  if (v32)
  {
    if (!telephonytransport::PCIMessageId::operator==(v32, (uint64_t)v61))
    {
      uint64_t v34 = (NSObject **)*((void *)this + 1);
      uint64_t v33 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v33)
      {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
        a6 = *v34;
        std::__shared_weak_count::__release_shared[abi:ne180100](v33);
      }
      else
      {
        a6 = *v34;
      }
      if (os_log_type_enabled(a6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)std::string __p = 0;
        _os_log_fault_impl(&dword_2185A0000, a6, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
      }
      __break(1u);
      goto LABEL_57;
    }
    if ((*(unsigned char *)(v31 + 28) & 4) == 0)
    {
      v54 = (NSObject **)*((void *)this + 1);
      __int16 v53 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v53)
      {
        atomic_fetch_add_explicit(&v53->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v44 = *v54;
        std::__shared_weak_count::__release_shared[abi:ne180100](v53);
      }
      else
      {
        uint64_t v44 = *v54;
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string __p = 0;
        char v48 = "Response doesn't contain result";
        goto LABEL_75;
      }
      goto LABEL_62;
    }
    if (*(_DWORD *)(v31 + 24))
    {
      int v56 = (NSObject **)*((void *)this + 1);
      __int16 v55 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v55)
      {
        atomic_fetch_add_explicit(&v55->__shared_owners_, 1uLL, memory_order_relaxed);
        v57 = *v56;
        std::__shared_weak_count::__release_shared[abi:ne180100](v55);
      }
      else
      {
        v57 = *v56;
      }
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageRequest");
        v58 = v71 >= 0 ? __p : *(unsigned char **)__p;
        *(_DWORD *)__int16 v66 = 136315138;
        *(void *)&v66[4] = v58;
        _os_log_error_impl(&dword_2185A0000, v57, OS_LOG_TYPE_ERROR, "%s failed", v66, 0xCu);
        if (SHIBYTE(v71) < 0) {
          operator delete(*(void **)__p);
        }
      }
      goto LABEL_62;
    }
    v45 = v30;
LABEL_49:
    int v35 = v30;
    uint64_t v30 = v45;
    if (!v45) {
      goto LABEL_31;
    }
    goto LABEL_64;
  }
  char v47 = (NSObject **)*((void *)this + 1);
  int v46 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v46)
  {
    atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v44 = *v47;
    std::__shared_weak_count::__release_shared[abi:ne180100](v46);
  }
  else
  {
    uint64_t v44 = *v47;
  }
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    char v48 = "Response doesn't contain messageId";
LABEL_75:
    _os_log_error_impl(&dword_2185A0000, v44, OS_LOG_TYPE_ERROR, v48, __p, 2u);
  }
LABEL_62:
  if (v30)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    uint64_t v31 = 0;
    int v35 = 0;
LABEL_64:
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v31 = 0;
  int v35 = 0;
LABEL_31:
  uint64_t v36 = v65;
  if (v65 && !atomic_fetch_add((atomic_ullong *volatile)(v65 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(uint64_t))(*(void *)v36 + 16))(v36);
  }
  if (v31)
  {
    char v37 = *(unsigned char *)(v31 + 28);
    if ((v37 & 2) != 0)
    {
      *a7 = *(_DWORD *)(v31 + 20);
      char v37 = *(unsigned char *)(v31 + 28);
    }
    if (v37) {
      a6->isa = (Class)*(unsigned int *)(v31 + 16);
    }
  }
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
  telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)&v59);
  return v31 != 0;
}

void sub_2185B1E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (v22)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  uint64_t v24 = a16;
  if (a16)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a16 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v24 + 16))(v24);
    }
  }
  telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)&a9);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::PCIClientTransport::readRegister(telephonytransport::PCIClientTransport *this, int a2, int a3, unsigned int a4, unsigned int a5, unsigned __int8 *a6, NSObject *a7)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v65 = 2863311530;
  uint64_t v62 = &unk_26C9AF630;
  unint64_t v63 = 0;
  char v14 = operator new(0x18uLL);
  *(void *)char v14 = &unk_26C9AF6D8;
  *((_DWORD *)v14 + 5) = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v16 = *((unsigned char *)v14 + 20);
  *((void *)v14 + 1) = add;
  *((unsigned char *)v14 + 20) = v16 | 3;
  *((_DWORD *)v14 + 4) = a2;
  uint64_t v17 = (uint64_t)v63;
  unint64_t v63 = v14;
  if (v17)
  {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
    char v14 = v63;
  }
  LODWORD(v65) = a3;
  BYTE4(v65) |= 7u;
  unint64_t v64 = __PAIR64__(a5, a4);
  unint64_t v18 = *((void *)v14 + 1);
  uint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), (unint64_t)v18, &v68);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0xDu, (const PB::Base *)&v62) & 1) == 0)
  {
    uint64_t v24 = (NSObject **)*((void *)this + 1);
    uint64_t v23 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v23)
    {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      unint64_t v18 = *v24;
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    else
    {
      unint64_t v18 = *v24;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
      uint64_t v25 = v74 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)uint64_t v77 = v25;
      _os_log_error_impl(&dword_2185A0000, v18, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v74) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_28;
  }
  uint64_t v19 = v68;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (!std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v19, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v68);
    LODWORD(v26) = *(_DWORD *)buf;
    if (*(_DWORD *)buf != 14) {
      goto LABEL_45;
    }
    uint64_t v26 = *(void *)&v77[4];
    unint64_t v18 = v78;
    if (v78) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v78 + 8), 1uLL, memory_order_relaxed);
    }
    if (v26)
    {
      uint64_t v27 = *(void *)(v26 + 16);
      if (v27)
      {
        if (!telephonytransport::PCIMessageId::operator==(v27, (uint64_t)v63))
        {
          unsigned int v29 = (NSObject **)*((void *)this + 1);
          std::string v28 = (std::__shared_weak_count *)*((void *)this + 2);
          if (v28)
          {
            atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
            a7 = *v29;
            std::__shared_weak_count::__release_shared[abi:ne180100](v28);
          }
          else
          {
            a7 = *v29;
          }
          if (!os_log_type_enabled(a7, OS_LOG_TYPE_FAULT)) {
            goto LABEL_44;
          }
          *(_WORD *)std::string __p = 0;
          uint64_t v39 = "Response messageId must match request messageId";
          goto LABEL_43;
        }
        if (*(unsigned char *)(v26 + 28))
        {
          if (!*(_DWORD *)(v26 + 24))
          {
            char v48 = v18;
            goto LABEL_58;
          }
          uint64_t v59 = (NSObject **)*((void *)this + 1);
          v58 = (std::__shared_weak_count *)*((void *)this + 2);
          if (v58)
          {
            atomic_fetch_add_explicit(&v58->__shared_owners_, 1uLL, memory_order_relaxed);
            uint64_t v60 = *v59;
            std::__shared_weak_count::__release_shared[abi:ne180100](v58);
          }
          else
          {
            uint64_t v60 = *v59;
          }
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterRequest");
            char v61 = v74 >= 0 ? __p : *(unsigned char **)__p;
            *(_DWORD *)__int16 v69 = 136315138;
            *(void *)&v69[4] = v61;
            _os_log_error_impl(&dword_2185A0000, v60, OS_LOG_TYPE_ERROR, "%s failed", v69, 0xCu);
            if (SHIBYTE(v74) < 0) {
              operator delete(*(void **)__p);
            }
          }
          goto LABEL_70;
        }
        v57 = (NSObject **)*((void *)this + 1);
        int v56 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v56)
        {
          atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
          char v47 = *v57;
          std::__shared_weak_count::__release_shared[abi:ne180100](v56);
        }
        else
        {
          char v47 = *v57;
        }
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)std::string __p = 0;
          char v51 = "Response doesn't contain result";
          goto LABEL_83;
        }
LABEL_70:
        if (v18)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
          uint64_t v30 = 0;
          uint64_t v26 = 0;
          goto LABEL_72;
        }
        goto LABEL_28;
      }
      int v50 = (NSObject **)*((void *)this + 1);
      int v49 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v49)
      {
        atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
        char v47 = *v50;
        std::__shared_weak_count::__release_shared[abi:ne180100](v49);
      }
      else
      {
        char v47 = *v50;
      }
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)std::string __p = 0;
      char v51 = "Response doesn't contain messageId";
    }
    else
    {
      int v46 = (NSObject **)*((void *)this + 1);
      v45 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v45)
      {
        atomic_fetch_add_explicit(&v45->__shared_owners_, 1uLL, memory_order_relaxed);
        char v47 = *v46;
        std::__shared_weak_count::__release_shared[abi:ne180100](v45);
      }
      else
      {
        char v47 = *v46;
      }
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      *(_WORD *)std::string __p = 0;
      char v51 = "No response";
    }
LABEL_83:
    _os_log_error_impl(&dword_2185A0000, v47, OS_LOG_TYPE_ERROR, v51, __p, 2u);
    goto LABEL_70;
  }
  uint64_t v21 = (NSObject **)*((void *)this + 1);
  unint64_t v20 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v20)
  {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v22 = *v21;
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  else
  {
    uint64_t v22 = *v21;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    _os_log_error_impl(&dword_2185A0000, v22, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
  }
  telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), (unint64_t)v18);
LABEL_28:
  uint64_t v30 = 0;
  uint64_t v26 = 0;
  while (1)
  {
    uint64_t v31 = v68;
    if (v68 && !atomic_fetch_add((atomic_ullong *volatile)(v68 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(uint64_t))(*(void *)v31 + 16))(v31);
      if (!v26) {
        goto LABEL_50;
      }
    }
    else if (!v26)
    {
      goto LABEL_50;
    }
    uint64_t v32 = *(void *)(v26 + 8);
    if (!v32)
    {
      char v37 = (NSObject **)*((void *)this + 1);
      uint64_t v36 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v36)
      {
        atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v38 = *v37;
        std::__shared_weak_count::__release_shared[abi:ne180100](v36);
      }
      else
      {
        uint64_t v38 = *v37;
      }
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string __p = 0;
        _os_log_error_impl(&dword_2185A0000, v38, OS_LOG_TYPE_ERROR, "No data read", __p, 2u);
      }
LABEL_50:
      uint64_t v43 = 0;
      if (!v30) {
        goto LABEL_52;
      }
LABEL_51:
      std::__shared_weak_count::__release_shared[abi:ne180100](v30);
      goto LABEL_52;
    }
    size_t v33 = *(void *)(v32 + 8);
    if (v33 <= a4) {
      break;
    }
    int v35 = (NSObject **)*((void *)this + 1);
    uint64_t v34 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v34)
    {
      atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
      a7 = *v35;
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    else
    {
      a7 = *v35;
    }
    if (os_log_type_enabled(a7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)std::string __p = 0;
      uint64_t v39 = "Can't read more bytes than requested";
LABEL_43:
      _os_log_fault_impl(&dword_2185A0000, a7, OS_LOG_TYPE_FAULT, v39, __p, 2u);
    }
LABEL_44:
    __break(1u);
LABEL_45:
    uint64_t v41 = (NSObject **)*((void *)this + 1);
    unsigned int v40 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v40)
    {
      atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v42 = *v41;
      std::__shared_weak_count::__release_shared[abi:ne180100](v40);
    }
    else
    {
      uint64_t v42 = *v41;
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v69, "kReadRegisterResponse");
      int v52 = v70;
      __int16 v53 = *(unsigned char **)v69;
      telephonytransport::toString(v26, v66);
      v54 = v69;
      if (v52 < 0) {
        v54 = v53;
      }
      if (v67 >= 0) {
        __int16 v55 = v66;
      }
      else {
        __int16 v55 = (void **)v66[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = v18;
      __int16 v72 = 2080;
      uint64_t v73 = v54;
      __int16 v74 = 2080;
      v75 = v55;
      _os_log_error_impl(&dword_2185A0000, v42, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v67 < 0) {
        operator delete(v66[0]);
      }
      if (v70 < 0) {
        operator delete(*(void **)v69);
      }
    }
    unint64_t v18 = 0;
    uint64_t v26 = 0;
    char v48 = v78;
LABEL_58:
    uint64_t v30 = (std::__shared_weak_count *)v18;
    unint64_t v18 = v48;
    if (v48) {
LABEL_72:
    }
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
  }
  memcpy(a6, *(const void **)v32, v33);
  a7->isa = *(Class *)(*(void *)(v26 + 8) + 8);
  uint64_t v43 = 1;
  if (v30) {
    goto LABEL_51;
  }
LABEL_52:
  telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest((telephonytransport::PCIReadRegisterRequest *)&v62);
  return v43;
}

void sub_2185B26BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  if (v30)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  uint64_t v32 = a16;
  if (a16)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a16 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v32 + 16))(v32);
    }
  }
  telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest((telephonytransport::PCIReadRegisterRequest *)&a9);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::unblockRead(telephonytransport::PCIClientTransport *this, int a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v45 = &unk_26C9AF668;
  int v46 = 0;
  uint64_t v4 = operator new(0x18uLL);
  *(void *)uint64_t v4 = &unk_26C9AF6D8;
  v4[5] = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v6 = *((unsigned char *)v4 + 20);
  *((void *)v4 + 1) = add;
  *((unsigned char *)v4 + 20) = v6 | 3;
  v4[4] = a2;
  uint64_t v7 = (uint64_t)v46;
  int v46 = v4;
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    unint64_t add = v46[1];
  }
  uint64_t v49 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), add, &v49);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0xFu, (const PB::Base *)&v45) & 1) == 0)
  {
    uint64_t v13 = (NSObject **)*((void *)this + 1);
    uint64_t v12 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v12)
    {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      char v14 = *v13;
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    else
    {
      char v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
      uint64_t v15 = v55 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)v58 = v15;
      _os_log_error_impl(&dword_2185A0000, v14, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v55) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_28;
  }
  uint64_t v8 = v49;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v8, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    char v10 = (NSObject **)*((void *)this + 1);
    uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v11 = *v10;
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    else
    {
      uint64_t v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string __p = 0;
      _os_log_error_impl(&dword_2185A0000, v11, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), add);
    goto LABEL_28;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v49);
  unsigned int v16 = *(_DWORD *)buf;
  if (*(_DWORD *)buf != 16)
  {
    uint64_t v26 = (NSObject **)*((void *)this + 1);
    uint64_t v25 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v25)
    {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v27 = *v26;
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    else
    {
      uint64_t v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v50, "kUnblockReadResponse");
      int v35 = v51;
      uint64_t v36 = *(unsigned char **)v50;
      telephonytransport::toString(v16, v47);
      char v37 = v50;
      if (v35 < 0) {
        char v37 = v36;
      }
      if (v48 >= 0) {
        uint64_t v38 = v47;
      }
      else {
        uint64_t v38 = (void **)v47[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = add;
      __int16 v53 = 2080;
      v54 = v37;
      __int16 v55 = 2080;
      int v56 = v38;
      _os_log_error_impl(&dword_2185A0000, v27, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v48 < 0) {
        operator delete(v47[0]);
      }
      if (v51 < 0) {
        operator delete(*(void **)v50);
      }
    }
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    uint64_t v31 = v59;
    goto LABEL_42;
  }
  uint64_t v18 = *(void *)&v58[4];
  uint64_t v17 = v59;
  if (v59) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v59 + 8), 1uLL, memory_order_relaxed);
  }
  if (!v18)
  {
    unsigned int v29 = (NSObject **)*((void *)this + 1);
    std::string v28 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v28)
    {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v30 = *v29;
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
LABEL_51:
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      *(_WORD *)std::string __p = 0;
      uint64_t v34 = "No response";
      goto LABEL_68;
    }
LABEL_50:
    uint64_t v30 = *v29;
    goto LABEL_51;
  }
  uint64_t v19 = *(void *)(v18 + 8);
  if (v19)
  {
    if (!telephonytransport::PCIMessageId::operator==(v19, (uint64_t)v46))
    {
      uint64_t v21 = (NSObject **)*((void *)this + 1);
      unint64_t v20 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v20)
      {
        atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v17 = *v21;
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
      else
      {
        uint64_t v17 = *v21;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)std::string __p = 0;
        _os_log_fault_impl(&dword_2185A0000, v17, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
      }
      __break(1u);
      goto LABEL_50;
    }
    if ((*(unsigned char *)(v18 + 20) & 1) == 0)
    {
      unsigned int v40 = (NSObject **)*((void *)this + 1);
      uint64_t v39 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v39)
      {
        atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v30 = *v40;
        std::__shared_weak_count::__release_shared[abi:ne180100](v39);
      }
      else
      {
        uint64_t v30 = *v40;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string __p = 0;
        uint64_t v34 = "Response doesn't contain result";
        goto LABEL_68;
      }
      goto LABEL_55;
    }
    if (*(_DWORD *)(v18 + 16))
    {
      uint64_t v42 = (NSObject **)*((void *)this + 1);
      uint64_t v41 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v41)
      {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v43 = *v42;
        std::__shared_weak_count::__release_shared[abi:ne180100](v41);
      }
      else
      {
        uint64_t v43 = *v42;
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadRequest");
        uint64_t v44 = v55 >= 0 ? __p : *(unsigned char **)__p;
        *(_DWORD *)int v50 = 136315138;
        *(void *)&v50[4] = v44;
        _os_log_error_impl(&dword_2185A0000, v43, OS_LOG_TYPE_ERROR, "%s failed", v50, 0xCu);
        if (SHIBYTE(v55) < 0) {
          operator delete(*(void **)__p);
        }
      }
      goto LABEL_55;
    }
    uint64_t v31 = v17;
LABEL_42:
    uint64_t v22 = (std::__shared_weak_count *)v17;
    uint64_t v17 = v31;
    if (!v31) {
      goto LABEL_29;
    }
    goto LABEL_57;
  }
  size_t v33 = (NSObject **)*((void *)this + 1);
  uint64_t v32 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v32)
  {
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v30 = *v33;
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  else
  {
    uint64_t v30 = *v33;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    uint64_t v34 = "Response doesn't contain messageId";
LABEL_68:
    _os_log_error_impl(&dword_2185A0000, v30, OS_LOG_TYPE_ERROR, v34, __p, 2u);
  }
LABEL_55:
  if (v17)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
    uint64_t v18 = 0;
    uint64_t v22 = 0;
LABEL_57:
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v18 = 0;
  uint64_t v22 = 0;
LABEL_29:
  uint64_t v23 = v49;
  if (v49 && !atomic_fetch_add((atomic_ullong *volatile)(v49 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(uint64_t))(*(void *)v23 + 16))(v23);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest((telephonytransport::PCIUnblockReadRequest *)&v45);
  return v18 != 0;
}

void sub_2185B2DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (v20)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  uint64_t v22 = a14;
  if (a14)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a14 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v22 + 16))(v22);
    }
  }
  telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest((telephonytransport::PCIUnblockReadRequest *)&a9);
  _Unwind_Resume(a1);
}

BOOL telephonytransport::PCIClientTransport::flushRead(telephonytransport::PCIClientTransport *this, int a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v45 = &unk_26C9AF6A0;
  int v46 = 0;
  uint64_t v4 = operator new(0x18uLL);
  *(void *)uint64_t v4 = &unk_26C9AF6D8;
  v4[5] = 0;
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)(*((void *)this + 3) + 88), 1uLL);
  char v6 = *((unsigned char *)v4 + 20);
  *((void *)v4 + 1) = add;
  *((unsigned char *)v4 + 20) = v6 | 3;
  v4[4] = a2;
  uint64_t v7 = (uint64_t)v46;
  int v46 = v4;
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    unint64_t add = v46[1];
  }
  uint64_t v49 = 0xAAAAAAAAAAAAAAAALL;
  telephonytransport::TransactionManager::add(*((std::mutex **)this + 3), add, &v49);
  if ((telephonytransport::BaseProtocol::sendMessage(*((std::mutex **)this + 12), 0x11u, (const PB::Base *)&v45) & 1) == 0)
  {
    uint64_t v13 = (NSObject **)*((void *)this + 1);
    uint64_t v12 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v12)
    {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      char v14 = *v13;
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    else
    {
      char v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
      uint64_t v15 = v55 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)bpf_program buf = 136315138;
      *(void *)v58 = v15;
      _os_log_error_impl(&dword_2185A0000, v14, OS_LOG_TYPE_ERROR, "Failed to send message. RequestT: %s", buf, 0xCu);
      if (SHIBYTE(v55) < 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_28;
  }
  uint64_t v8 = v49;
  *(void *)std::string __p = std::chrono::steady_clock::now().__d_.__rep_ + 60000000000;
  if (std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(v8, (std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *)__p))
  {
    char v10 = (NSObject **)*((void *)this + 1);
    uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v11 = *v10;
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    else
    {
      uint64_t v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string __p = 0;
      _os_log_error_impl(&dword_2185A0000, v11, OS_LOG_TYPE_ERROR, "Timed out waiting for response", __p, 2u);
    }
    telephonytransport::TransactionManager::remove(*((std::mutex **)this + 3), add);
    goto LABEL_28;
  }
  std::future<telephonytransport::TransactionResponse>::get((uint64_t)buf, &v49);
  unsigned int v16 = *(_DWORD *)buf;
  if (*(_DWORD *)buf != 18)
  {
    uint64_t v26 = (NSObject **)*((void *)this + 1);
    uint64_t v25 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v25)
    {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v27 = *v26;
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    else
    {
      uint64_t v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v50, "kFlushReadResponse");
      int v35 = v51;
      uint64_t v36 = *(unsigned char **)v50;
      telephonytransport::toString(v16, v47);
      char v37 = v50;
      if (v35 < 0) {
        char v37 = v36;
      }
      if (v48 >= 0) {
        uint64_t v38 = v47;
      }
      else {
        uint64_t v38 = (void **)v47[0];
      }
      *(_DWORD *)std::string __p = 134218498;
      *(void *)&__p[4] = add;
      __int16 v53 = 2080;
      v54 = v37;
      __int16 v55 = 2080;
      int v56 = v38;
      _os_log_error_impl(&dword_2185A0000, v27, OS_LOG_TYPE_ERROR, "Received response type doesn't match expected response type. TxnId: %llu, Expected: %s, Received: %s", __p, 0x20u);
      if (v48 < 0) {
        operator delete(v47[0]);
      }
      if (v51 < 0) {
        operator delete(*(void **)v50);
      }
    }
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    uint64_t v31 = v59;
    goto LABEL_42;
  }
  uint64_t v18 = *(void *)&v58[4];
  uint64_t v17 = v59;
  if (v59) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v59 + 8), 1uLL, memory_order_relaxed);
  }
  if (!v18)
  {
    unsigned int v29 = (NSObject **)*((void *)this + 1);
    std::string v28 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v28)
    {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v30 = *v29;
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
LABEL_51:
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      *(_WORD *)std::string __p = 0;
      uint64_t v34 = "No response";
      goto LABEL_68;
    }
LABEL_50:
    uint64_t v30 = *v29;
    goto LABEL_51;
  }
  uint64_t v19 = *(void *)(v18 + 8);
  if (v19)
  {
    if (!telephonytransport::PCIMessageId::operator==(v19, (uint64_t)v46))
    {
      uint64_t v21 = (NSObject **)*((void *)this + 1);
      unint64_t v20 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v20)
      {
        atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v17 = *v21;
        std::__shared_weak_count::__release_shared[abi:ne180100](v20);
      }
      else
      {
        uint64_t v17 = *v21;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)std::string __p = 0;
        _os_log_fault_impl(&dword_2185A0000, v17, OS_LOG_TYPE_FAULT, "Response messageId must match request messageId", __p, 2u);
      }
      __break(1u);
      goto LABEL_50;
    }
    if ((*(unsigned char *)(v18 + 20) & 1) == 0)
    {
      unsigned int v40 = (NSObject **)*((void *)this + 1);
      uint64_t v39 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v39)
      {
        atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v30 = *v40;
        std::__shared_weak_count::__release_shared[abi:ne180100](v39);
      }
      else
      {
        uint64_t v30 = *v40;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string __p = 0;
        uint64_t v34 = "Response doesn't contain result";
        goto LABEL_68;
      }
      goto LABEL_55;
    }
    if (*(_DWORD *)(v18 + 16))
    {
      uint64_t v42 = (NSObject **)*((void *)this + 1);
      uint64_t v41 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v41)
      {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v43 = *v42;
        std::__shared_weak_count::__release_shared[abi:ne180100](v41);
      }
      else
      {
        uint64_t v43 = *v42;
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadRequest");
        uint64_t v44 = v55 >= 0 ? __p : *(unsigned char **)__p;
        *(_DWORD *)int v50 = 136315138;
        *(void *)&v50[4] = v44;
        _os_log_error_impl(&dword_2185A0000, v43, OS_LOG_TYPE_ERROR, "%s failed", v50, 0xCu);
        if (SHIBYTE(v55) < 0) {
          operator delete(*(void **)__p);
        }
      }
      goto LABEL_55;
    }
    uint64_t v31 = v17;
LABEL_42:
    uint64_t v22 = (std::__shared_weak_count *)v17;
    uint64_t v17 = v31;
    if (!v31) {
      goto LABEL_29;
    }
    goto LABEL_57;
  }
  size_t v33 = (NSObject **)*((void *)this + 1);
  uint64_t v32 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v32)
  {
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v30 = *v33;
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  else
  {
    uint64_t v30 = *v33;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string __p = 0;
    uint64_t v34 = "Response doesn't contain messageId";
LABEL_68:
    _os_log_error_impl(&dword_2185A0000, v30, OS_LOG_TYPE_ERROR, v34, __p, 2u);
  }
LABEL_55:
  if (v17)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
    uint64_t v18 = 0;
    uint64_t v22 = 0;
LABEL_57:
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v17);
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v18 = 0;
  uint64_t v22 = 0;
LABEL_29:
  uint64_t v23 = v49;
  if (v49 && !atomic_fetch_add((atomic_ullong *volatile)(v49 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
    (*(void (**)(uint64_t))(*(void *)v23 + 16))(v23);
  }
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest((telephonytransport::PCIFlushReadRequest *)&v45);
  return v18 != 0;
}

void sub_2185B34A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (v20)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  uint64_t v22 = a14;
  if (a14)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(a14 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(uint64_t))(*(void *)v22 + 16))(v22);
    }
  }
  telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest((telephonytransport::PCIFlushReadRequest *)&a9);
  _Unwind_Resume(a1);
}

void telephonytransport::PCIClientTransport::handleMessage(telephonytransport::PCIClientTransport *this, unsigned int a2, unsigned __int8 *a3, uint64_t a4)
{
  uint64_t v178 = *MEMORY[0x263EF8340];
  if (a2 - 1 >= 0x12) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = a2;
  }
  switch(v4)
  {
    case 0u:
      uint64_t v30 = (NSObject **)*((void *)this + 1);
      unsigned int v29 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v29)
      {
        atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v31 = *v30;
        std::__shared_weak_count::__release_shared[abi:ne180100](v29);
      }
      else
      {
        uint64_t v31 = *v30;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string __p = 134217984;
        *(void *)&__p[4] = a4;
        _os_log_error_impl(&dword_2185A0000, v31, OS_LOG_TYPE_ERROR, "Skipping Unknown message type of length: %zu", __p, 0xCu);
      }
      return;
    case 1u:
    case 3u:
    case 7u:
    case 9u:
    case 0xBu:
    case 0xDu:
    case 0xFu:
    case 0x11u:
      uint64_t v9 = (NSObject **)*((void *)this + 1);
      uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v8)
      {
        atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
        char v10 = *v9;
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      else
      {
        char v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        telephonytransport::toString(v4, __p);
        if (__p[23] >= 0) {
          uint64_t v11 = __p;
        }
        else {
          uint64_t v11 = *(unsigned char **)__p;
        }
        *(_DWORD *)bpf_program buf = 136315394;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v171 = 2048;
        uint64_t v172 = a4;
        uint64_t v12 = "Ignoring unsupported message type: %s, length: %zu";
        goto LABEL_13;
      }
      return;
    case 2u:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x38uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF218;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF7F0;
      v16[1].__shared_owners_ = 0;
      HIDWORD(v16[1].__shared_weak_owners_) = 0;
      LODWORD(v16[2].__vftable) = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 2, a3, a4) & 1) == 0)
      {
        v57 = (NSObject **)*((void *)this + 1);
        int v56 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v56)
        {
          atomic_fetch_add_explicit(&v56->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v57;
          std::__shared_weak_count::__release_shared[abi:ne180100](v56);
        }
        else
        {
          unint64_t v20 = *v57;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
          goto LABEL_146;
        }
        goto LABEL_282;
      }
      uint64_t shared_owners = v16[1].__shared_owners_;
      if (!shared_owners)
      {
        uint64_t v78 = (NSObject **)*((void *)this + 1);
        uint64_t v77 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v77)
        {
          atomic_fetch_add_explicit(&v77->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v78;
          std::__shared_weak_count::__release_shared[abi:ne180100](v77);
        }
        else
        {
          unint64_t v20 = *v78;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
          goto LABEL_236;
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(shared_owners + 20) & 1) == 0)
      {
        uint64_t v19 = (NSObject **)*((void *)this + 1);
        uint64_t v18 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v18)
        {
          atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v19;
          std::__shared_weak_count::__release_shared[abi:ne180100](v18);
        }
        else
        {
          unint64_t v20 = *v19;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
          goto LABEL_276;
        }
        goto LABEL_282;
      }
      uint64_t v107 = *((void *)this + 3);
      unint64_t v108 = *(void *)(shared_owners + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v109 = telephonytransport::TransactionManager::fulfilPromise(v107, v108, 2, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v109 & 1) == 0)
      {
        v111 = (NSObject **)*((void *)this + 1);
        v110 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v110)
        {
          atomic_fetch_add_explicit(&v110->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v111;
          std::__shared_weak_count::__release_shared[abi:ne180100](v110);
        }
        else
        {
          char v10 = *v111;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kCreateResponse");
          goto LABEL_323;
        }
      }
      return;
    case 4u:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x38uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF268;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF780;
      v16[1].__shared_owners_ = 0;
      v16[1].__shared_weak_owners_ = 0;
      v16[2].__vftable = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 4, a3, a4) & 1) == 0)
      {
        unint64_t v64 = (NSObject **)*((void *)this + 1);
        unint64_t v63 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v63)
        {
          atomic_fetch_add_explicit(&v63->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v64;
          std::__shared_weak_count::__release_shared[abi:ne180100](v63);
        }
        else
        {
          unint64_t v20 = *v64;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
          goto LABEL_146;
        }
        goto LABEL_282;
      }
      uint64_t shared_weak_owners = v16[1].__shared_weak_owners_;
      if (!shared_weak_owners)
      {
        v84 = (NSObject **)*((void *)this + 1);
        uint64_t v83 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v83)
        {
          atomic_fetch_add_explicit(&v83->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v84;
          std::__shared_weak_count::__release_shared[abi:ne180100](v83);
        }
        else
        {
          unint64_t v20 = *v84;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
          goto LABEL_236;
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(shared_weak_owners + 20) & 1) == 0)
      {
        uint64_t v34 = (NSObject **)*((void *)this + 1);
        size_t v33 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v33)
        {
          atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v34;
          std::__shared_weak_count::__release_shared[abi:ne180100](v33);
        }
        else
        {
          unint64_t v20 = *v34;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
          goto LABEL_276;
        }
        goto LABEL_282;
      }
      uint64_t v120 = *((void *)this + 3);
      unint64_t v121 = *(void *)(shared_weak_owners + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v122 = telephonytransport::TransactionManager::fulfilPromise(v120, v121, 4, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v122 & 1) == 0)
      {
        v124 = (NSObject **)*((void *)this + 1);
        char v123 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v123)
        {
          atomic_fetch_add_explicit(&v123->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v124;
          std::__shared_weak_count::__release_shared[abi:ne180100](v123);
        }
        else
        {
          char v10 = *v124;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadResponse");
          goto LABEL_323;
        }
      }
      return;
    case 5u:
      *(_OWORD *)&__p[8] = 0uLL;
      *(void *)std::string __p = &unk_26C9AF710;
      if (telephonytransport::deserializeMessage((uint64_t)__p, 5, a3, a4))
      {
        if (*(void *)&__p[16])
        {
          if ((*(unsigned char *)(*(void *)&__p[16] + 20) & 2) != 0)
          {
            if (*(void *)&__p[8])
            {
              uint64_t v103 = *(void *)(*(void *)&__p[8] + 8);
              if (!v103)
              {
                v105 = (NSObject **)*((void *)this + 1);
                v104 = (std::__shared_weak_count *)*((void *)this + 2);
                if (v104)
                {
                  atomic_fetch_add_explicit(&v104->__shared_owners_, 1uLL, memory_order_relaxed);
                  v106 = *v105;
                  std::__shared_weak_count::__release_shared[abi:ne180100](v104);
                }
                else
                {
                  v106 = *v105;
                }
                if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)bpf_program buf = 0;
                  _os_log_fault_impl(&dword_2185A0000, v106, OS_LOG_TYPE_FAULT, "Zero size message is not expected in read indication", buf, 2u);
                }
                __break(1u);
                goto LABEL_290;
              }
              std::function<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::operator()(*((void *)this + 7), *(_DWORD *)(*(void *)&__p[16] + 16), **(void **)&__p[8], v103);
              goto LABEL_336;
            }
            v159 = (NSObject **)*((void *)this + 1);
            v158 = (std::__shared_weak_count *)*((void *)this + 2);
            if (v158)
            {
              atomic_fetch_add_explicit(&v158->__shared_owners_, 1uLL, memory_order_relaxed);
              uint64_t v15 = *v159;
              std::__shared_weak_count::__release_shared[abi:ne180100](v158);
            }
            else
            {
              uint64_t v15 = *v159;
            }
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(buf, "kReadIndication");
              if (v173 >= 0) {
                v164 = buf;
              }
              else {
                v164 = *(unsigned char **)buf;
              }
              *(_DWORD *)v174 = 136315394;
              v175 = "data";
              __int16 v176 = 2080;
              v177 = v164;
              v94 = "%s is missing. Skipping MessageType: %s";
              goto LABEL_333;
            }
          }
          else
          {
            char v14 = (NSObject **)*((void *)this + 1);
            uint64_t v13 = (std::__shared_weak_count *)*((void *)this + 2);
            if (v13)
            {
              atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
              uint64_t v15 = *v14;
              std::__shared_weak_count::__release_shared[abi:ne180100](v13);
            }
            else
            {
              uint64_t v15 = *v14;
            }
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              std::string::basic_string[abi:ne180100]<0>(buf, "kReadIndication");
              if (v173 >= 0) {
                v155 = buf;
              }
              else {
                v155 = *(unsigned char **)buf;
              }
              *(_DWORD *)v174 = 136315394;
              v175 = "messageId()->hasTransportToken";
              __int16 v176 = 2080;
              v177 = v155;
              v94 = "%s is missing. Skipping MessageType: %s";
LABEL_333:
              v95 = v15;
              goto LABEL_334;
            }
          }
        }
        else
        {
          uint64_t v76 = (NSObject **)*((void *)this + 1);
          v75 = (std::__shared_weak_count *)*((void *)this + 2);
          if (v75)
          {
            atomic_fetch_add_explicit(&v75->__shared_owners_, 1uLL, memory_order_relaxed);
            uint64_t v15 = *v76;
            std::__shared_weak_count::__release_shared[abi:ne180100](v75);
          }
          else
          {
            uint64_t v15 = *v76;
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string[abi:ne180100]<0>(buf, "kReadIndication");
            if (v173 >= 0) {
              v152 = buf;
            }
            else {
              v152 = *(unsigned char **)buf;
            }
            *(_DWORD *)v174 = 136315394;
            v175 = "messageId";
            __int16 v176 = 2080;
            v177 = v152;
            v94 = "%s is missing. Skipping MessageType: %s";
            goto LABEL_333;
          }
        }
      }
      else
      {
        v54 = (NSObject **)*((void *)this + 1);
        __int16 v53 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v53)
        {
          atomic_fetch_add_explicit(&v53->__shared_owners_, 1uLL, memory_order_relaxed);
          __int16 v55 = *v54;
          std::__shared_weak_count::__release_shared[abi:ne180100](v53);
        }
        else
        {
          __int16 v55 = *v54;
        }
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(buf, "kReadIndication");
          if (v173 >= 0) {
            v93 = buf;
          }
          else {
            v93 = *(const char **)buf;
          }
          *(_DWORD *)v174 = 136315394;
          v175 = v93;
          __int16 v176 = 2048;
          v177 = (unsigned char *)a4;
          v94 = "Failed to deserialize message. MessageType: %s, length: %zu";
          v95 = v55;
LABEL_334:
          _os_log_error_impl(&dword_2185A0000, v95, OS_LOG_TYPE_ERROR, v94, v174, 0x16u);
          if (v173 < 0) {
            operator delete(*(void **)buf);
          }
        }
      }
LABEL_336:
      telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)__p);
      return;
    case 6u:
      *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v169 = 2863311530;
      *(_OWORD *)&__p[8] = v21;
      *(void *)std::string __p = &unk_26C9AF8D0;
      uint64_t v168 = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)__p, 6, a3, a4) & 1) == 0)
      {
        uint64_t v59 = (NSObject **)*((void *)this + 1);
        v58 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v58)
        {
          atomic_fetch_add_explicit(&v58->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v60 = *v59;
          std::__shared_weak_count::__release_shared[abi:ne180100](v58);
        }
        else
        {
          uint64_t v60 = *v59;
        }
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
          goto LABEL_353;
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
        if (v173 >= 0) {
          v96 = buf;
        }
        else {
          v96 = *(const char **)buf;
        }
        *(_DWORD *)v174 = 136315394;
        v175 = v96;
        __int16 v176 = 2048;
        v177 = (unsigned char *)a4;
        v97 = "Failed to deserialize message. MessageType: %s, length: %zu";
        v98 = v60;
        goto LABEL_351;
      }
      uint64_t v22 = v168;
      if (!v168)
      {
        v80 = (NSObject **)*((void *)this + 1);
        uint64_t v79 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v79)
        {
          atomic_fetch_add_explicit(&v79->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v25 = *v80;
          std::__shared_weak_count::__release_shared[abi:ne180100](v79);
        }
        else
        {
          uint64_t v25 = *v80;
        }
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_353;
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
        if (v173 >= 0) {
          v153 = buf;
        }
        else {
          v153 = *(unsigned char **)buf;
        }
        *(_DWORD *)v174 = 136315394;
        v175 = "messageId";
        __int16 v176 = 2080;
        v177 = v153;
        v97 = "%s is missing. Skipping MessageType: %s";
        goto LABEL_350;
      }
      if ((*(unsigned char *)(v168 + 20) & 2) == 0)
      {
        uint64_t v24 = (NSObject **)*((void *)this + 1);
        uint64_t v23 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v23)
        {
          atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v25 = *v24;
          std::__shared_weak_count::__release_shared[abi:ne180100](v23);
        }
        else
        {
          uint64_t v25 = *v24;
        }
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_353;
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
        if (v173 >= 0) {
          v156 = buf;
        }
        else {
          v156 = *(unsigned char **)buf;
        }
        *(_DWORD *)v174 = 136315394;
        v175 = "messageId()->hasTransportToken";
        __int16 v176 = 2080;
        v177 = v156;
        v97 = "%s is missing. Skipping MessageType: %s";
        goto LABEL_350;
      }
      char v112 = BYTE4(v169);
      if ((v169 & 0x400000000) == 0)
      {
        v114 = (NSObject **)*((void *)this + 1);
        v113 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v113)
        {
          atomic_fetch_add_explicit(&v113->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v25 = *v114;
          std::__shared_weak_count::__release_shared[abi:ne180100](v113);
        }
        else
        {
          uint64_t v25 = *v114;
        }
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_353;
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
        if (v173 >= 0) {
          v162 = buf;
        }
        else {
          v162 = *(unsigned char **)buf;
        }
        *(_DWORD *)v174 = 136315394;
        v175 = "Status";
        __int16 v176 = 2080;
        v177 = v162;
        v97 = "%s is missing. Skipping MessageType: %s";
        goto LABEL_350;
      }
      if ((v169 & 0x100000000) == 0)
      {
        v151 = (NSObject **)*((void *)this + 1);
        v150 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v150)
        {
          atomic_fetch_add_explicit(&v150->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v25 = *v151;
          std::__shared_weak_count::__release_shared[abi:ne180100](v150);
        }
        else
        {
          uint64_t v25 = *v151;
        }
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_353;
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
        if (v173 >= 0) {
          v165 = buf;
        }
        else {
          v165 = *(unsigned char **)buf;
        }
        *(_DWORD *)v174 = 136315394;
        v175 = "Arg1";
        __int16 v176 = 2080;
        v177 = v165;
        v97 = "%s is missing. Skipping MessageType: %s";
        goto LABEL_350;
      }
LABEL_290:
      if ((v112 & 2) != 0)
      {
        std::function<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::operator()(*((void *)this + 11), *(_DWORD *)(v22 + 16), v169, *(uint64_t *)&__p[8], *(uint64_t *)&__p[16]);
        goto LABEL_353;
      }
      v161 = (NSObject **)*((void *)this + 1);
      v160 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v160)
      {
        atomic_fetch_add_explicit(&v160->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v25 = *v161;
        std::__shared_weak_count::__release_shared[abi:ne180100](v160);
      }
      else
      {
        uint64_t v25 = *v161;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "kStatusIndication");
        if (v173 >= 0) {
          v166 = buf;
        }
        else {
          v166 = *(unsigned char **)buf;
        }
        *(_DWORD *)v174 = 136315394;
        v175 = "Arg2";
        __int16 v176 = 2080;
        v177 = v166;
        v97 = "%s is missing. Skipping MessageType: %s";
LABEL_350:
        v98 = v25;
LABEL_351:
        _os_log_error_impl(&dword_2185A0000, v98, OS_LOG_TYPE_ERROR, v97, v174, 0x16u);
        if (v173 < 0) {
          operator delete(*(void **)buf);
        }
      }
LABEL_353:
      telephonytransport::PCIStatusIndication::~PCIStatusIndication((telephonytransport::PCIStatusIndication *)__p);
      return;
    case 8u:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x38uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF2B8;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF940;
      v16[1].__shared_owners_ = 0;
      HIDWORD(v16[1].__shared_weak_owners_) = 0;
      LODWORD(v16[2].__vftable) = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 8, a3, a4) & 1) == 0)
      {
        __int16 v66 = (NSObject **)*((void *)this + 1);
        uint64_t v65 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v65)
        {
          atomic_fetch_add_explicit(&v65->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v66;
          std::__shared_weak_count::__release_shared[abi:ne180100](v65);
        }
        else
        {
          unint64_t v20 = *v66;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
          goto LABEL_146;
        }
        goto LABEL_282;
      }
      uint64_t v35 = v16[1].__shared_owners_;
      if (!v35)
      {
        v86 = (NSObject **)*((void *)this + 1);
        v85 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v85)
        {
          atomic_fetch_add_explicit(&v85->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v86;
          std::__shared_weak_count::__release_shared[abi:ne180100](v85);
        }
        else
        {
          unint64_t v20 = *v86;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
          goto LABEL_236;
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(v35 + 20) & 1) == 0)
      {
        char v37 = (NSObject **)*((void *)this + 1);
        uint64_t v36 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v36)
        {
          atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v37;
          std::__shared_weak_count::__release_shared[abi:ne180100](v36);
        }
        else
        {
          unint64_t v20 = *v37;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
          goto LABEL_276;
        }
        goto LABEL_282;
      }
      uint64_t v125 = *((void *)this + 3);
      unint64_t v126 = *(void *)(v35 + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v127 = telephonytransport::TransactionManager::fulfilPromise(v125, v126, 8, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v127 & 1) == 0)
      {
        v129 = (NSObject **)*((void *)this + 1);
        v128 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v128)
        {
          atomic_fetch_add_explicit(&v128->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v129;
          std::__shared_weak_count::__release_shared[abi:ne180100](v128);
        }
        else
        {
          char v10 = *v129;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kWriteResponse");
          goto LABEL_323;
        }
      }
      return;
    case 0xAu:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x30uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF308;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF860;
      v16[1].__shared_owners_ = 0;
      p_uint64_t shared_owners = &v16[1].__shared_owners_;
      v16[1].__shared_weak_owners_ = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 10, a3, a4) & 1) == 0)
      {
        __int16 v72 = (NSObject **)*((void *)this + 1);
        __int16 v71 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v71)
        {
          atomic_fetch_add_explicit(&v71->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v72;
          std::__shared_weak_count::__release_shared[abi:ne180100](v71);
        }
        else
        {
          unint64_t v20 = *v72;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
          goto LABEL_146;
        }
        goto LABEL_282;
      }
      uint64_t v47 = *p_shared_owners;
      if (!*p_shared_owners)
      {
        v92 = (NSObject **)*((void *)this + 1);
        v91 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v91)
        {
          atomic_fetch_add_explicit(&v91->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v92;
          std::__shared_weak_count::__release_shared[abi:ne180100](v91);
        }
        else
        {
          unint64_t v20 = *v92;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
          goto LABEL_236;
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(v47 + 20) & 1) == 0)
      {
        uint64_t v49 = (NSObject **)*((void *)this + 1);
        char v48 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v48)
        {
          atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v49;
          std::__shared_weak_count::__release_shared[abi:ne180100](v48);
        }
        else
        {
          unint64_t v20 = *v49;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
          goto LABEL_276;
        }
        goto LABEL_282;
      }
      uint64_t v140 = *((void *)this + 3);
      unint64_t v141 = *(void *)(v47 + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v142 = telephonytransport::TransactionManager::fulfilPromise(v140, v141, 10, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v142 & 1) == 0)
      {
        v144 = (NSObject **)*((void *)this + 1);
        v143 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v143)
        {
          atomic_fetch_add_explicit(&v143->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v144;
          std::__shared_weak_count::__release_shared[abi:ne180100](v143);
        }
        else
        {
          char v10 = *v144;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kFreeResponse");
          goto LABEL_323;
        }
      }
      return;
    case 0xCu:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x38uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF358;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF588;
      v16[1].__shared_owners_ = 0;
      v16[2].__vftable = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 12, a3, a4) & 1) == 0)
      {
        uint64_t v62 = (NSObject **)*((void *)this + 1);
        char v61 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v61)
        {
          atomic_fetch_add_explicit(&v61->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v62;
          std::__shared_weak_count::__release_shared[abi:ne180100](v61);
        }
        else
        {
          unint64_t v20 = *v62;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
          goto LABEL_146;
        }
        goto LABEL_282;
      }
      uint64_t v26 = v16[1].__shared_owners_;
      if (!v26)
      {
        v82 = (NSObject **)*((void *)this + 1);
        v81 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v81)
        {
          atomic_fetch_add_explicit(&v81->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v82;
          std::__shared_weak_count::__release_shared[abi:ne180100](v81);
        }
        else
        {
          unint64_t v20 = *v82;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
          goto LABEL_236;
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(v26 + 20) & 1) == 0)
      {
        std::string v28 = (NSObject **)*((void *)this + 1);
        uint64_t v27 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v27)
        {
          atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v28;
          std::__shared_weak_count::__release_shared[abi:ne180100](v27);
        }
        else
        {
          unint64_t v20 = *v28;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
          goto LABEL_276;
        }
        goto LABEL_282;
      }
      uint64_t v115 = *((void *)this + 3);
      unint64_t v116 = *(void *)(v26 + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v117 = telephonytransport::TransactionManager::fulfilPromise(v115, v116, 12, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v117 & 1) == 0)
      {
        char v119 = (NSObject **)*((void *)this + 1);
        v118 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v118)
        {
          atomic_fetch_add_explicit(&v118->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v119;
          std::__shared_weak_count::__release_shared[abi:ne180100](v118);
        }
        else
        {
          char v10 = *v119;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kSendImageResponse");
          goto LABEL_323;
        }
      }
      return;
    case 0xEu:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x38uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF3A8;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF5F8;
      v16[1].__shared_owners_ = 0;
      v16[1].__shared_weak_owners_ = 0;
      v16[2].__vftable = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 14, a3, a4) & 1) == 0)
      {
        __int16 v74 = (NSObject **)*((void *)this + 1);
        uint64_t v73 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v73)
        {
          atomic_fetch_add_explicit(&v73->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v74;
          std::__shared_weak_count::__release_shared[abi:ne180100](v73);
        }
        else
        {
          unint64_t v20 = *v74;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
          goto LABEL_146;
        }
        goto LABEL_282;
      }
      uint64_t v50 = v16[1].__shared_weak_owners_;
      if (!v50)
      {
        v100 = (NSObject **)*((void *)this + 1);
        v99 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v99)
        {
          atomic_fetch_add_explicit(&v99->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v100;
          std::__shared_weak_count::__release_shared[abi:ne180100](v99);
        }
        else
        {
          unint64_t v20 = *v100;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
          goto LABEL_236;
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(v50 + 20) & 1) == 0)
      {
        int v52 = (NSObject **)*((void *)this + 1);
        char v51 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v51)
        {
          atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v52;
          std::__shared_weak_count::__release_shared[abi:ne180100](v51);
        }
        else
        {
          unint64_t v20 = *v52;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
          goto LABEL_276;
        }
        goto LABEL_282;
      }
      uint64_t v145 = *((void *)this + 3);
      unint64_t v146 = *(void *)(v50 + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v147 = telephonytransport::TransactionManager::fulfilPromise(v145, v146, 14, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v147 & 1) == 0)
      {
        v149 = (NSObject **)*((void *)this + 1);
        v148 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v148)
        {
          atomic_fetch_add_explicit(&v148->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v149;
          std::__shared_weak_count::__release_shared[abi:ne180100](v148);
        }
        else
        {
          char v10 = *v149;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kReadRegisterResponse");
          goto LABEL_323;
        }
      }
      return;
    case 0x10u:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x30uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF3F8;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF5C0;
      v16[1].__shared_owners_ = 0;
      uint64_t v38 = &v16[1].__shared_owners_;
      v16[1].__shared_weak_owners_ = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 16, a3, a4) & 1) == 0)
      {
        uint64_t v68 = (NSObject **)*((void *)this + 1);
        char v67 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v67)
        {
          atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v68;
          std::__shared_weak_count::__release_shared[abi:ne180100](v67);
        }
        else
        {
          unint64_t v20 = *v68;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
          goto LABEL_146;
        }
        goto LABEL_282;
      }
      uint64_t v39 = *v38;
      if (!*v38)
      {
        v88 = (NSObject **)*((void *)this + 1);
        v87 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v87)
        {
          atomic_fetch_add_explicit(&v87->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v88;
          std::__shared_weak_count::__release_shared[abi:ne180100](v87);
        }
        else
        {
          unint64_t v20 = *v88;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
          goto LABEL_236;
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(v39 + 20) & 1) == 0)
      {
        uint64_t v41 = (NSObject **)*((void *)this + 1);
        unsigned int v40 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v40)
        {
          atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v41;
          std::__shared_weak_count::__release_shared[abi:ne180100](v40);
        }
        else
        {
          unint64_t v20 = *v41;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
          goto LABEL_276;
        }
        goto LABEL_282;
      }
      uint64_t v130 = *((void *)this + 3);
      unint64_t v131 = *(void *)(v39 + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v132 = telephonytransport::TransactionManager::fulfilPromise(v130, v131, 16, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v132 & 1) == 0)
      {
        v134 = (NSObject **)*((void *)this + 1);
        v133 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v133)
        {
          atomic_fetch_add_explicit(&v133->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v134;
          std::__shared_weak_count::__release_shared[abi:ne180100](v133);
        }
        else
        {
          char v10 = *v134;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kUnblockReadResponse");
          goto LABEL_323;
        }
      }
      return;
    case 0x12u:
      unsigned int v16 = (std::__shared_weak_count *)operator new(0x30uLL);
      v16->__shared_owners_ = 0;
      v16->__shared_weak_owners_ = 0;
      v16->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF448;
      v16[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF550;
      v16[1].__shared_owners_ = 0;
      uint64_t v42 = &v16[1].__shared_owners_;
      v16[1].__shared_weak_owners_ = 0;
      if ((telephonytransport::deserializeMessage((uint64_t)&v16[1], 18, a3, a4) & 1) == 0)
      {
        char v70 = (NSObject **)*((void *)this + 1);
        __int16 v69 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v69)
        {
          atomic_fetch_add_explicit(&v69->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v70;
          std::__shared_weak_count::__release_shared[abi:ne180100](v69);
        }
        else
        {
          unint64_t v20 = *v70;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
LABEL_146:
        if (__p[23] >= 0) {
          v101 = __p;
        }
        else {
          v101 = *(unsigned char **)__p;
        }
        *(_DWORD *)bpf_program buf = 136315394;
        *(void *)&uint8_t buf[4] = v101;
        __int16 v171 = 2048;
        uint64_t v172 = a4;
        v102 = "Failed to deserialize message. MessageType: %s, length: %zu";
        goto LABEL_280;
      }
      uint64_t v43 = *v42;
      if (!*v42)
      {
        v90 = (NSObject **)*((void *)this + 1);
        v89 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v89)
        {
          atomic_fetch_add_explicit(&v89->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v90;
          std::__shared_weak_count::__release_shared[abi:ne180100](v89);
        }
        else
        {
          unint64_t v20 = *v90;
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_282;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
LABEL_236:
        if (__p[23] >= 0) {
          v154 = __p;
        }
        else {
          v154 = *(unsigned char **)__p;
        }
        *(_DWORD *)bpf_program buf = 136315394;
        *(void *)&uint8_t buf[4] = v154;
        __int16 v171 = 2048;
        uint64_t v172 = a4;
        v102 = "messageId is missing. Skipping MessageType: %s, length: %zu";
LABEL_280:
        _os_log_error_impl(&dword_2185A0000, v20, OS_LOG_TYPE_ERROR, v102, buf, 0x16u);
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        goto LABEL_282;
      }
      if ((*(unsigned char *)(v43 + 20) & 1) == 0)
      {
        v45 = (NSObject **)*((void *)this + 1);
        uint64_t v44 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v44)
        {
          atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v20 = *v45;
          std::__shared_weak_count::__release_shared[abi:ne180100](v44);
        }
        else
        {
          unint64_t v20 = *v45;
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
LABEL_276:
          if (__p[23] >= 0) {
            v157 = __p;
          }
          else {
            v157 = *(unsigned char **)__p;
          }
          *(_DWORD *)bpf_program buf = 136315394;
          *(void *)&uint8_t buf[4] = v157;
          __int16 v171 = 2048;
          uint64_t v172 = a4;
          v102 = "TxnId is missing. Skipping MessageType: %s, length: %zu";
          goto LABEL_280;
        }
LABEL_282:
        std::__shared_weak_count::__release_shared[abi:ne180100](v16);
        return;
      }
      uint64_t v135 = *((void *)this + 3);
      unint64_t v136 = *(void *)(v43 + 8);
      *(void *)std::string __p = v16 + 1;
      *(void *)&__p[8] = v16;
      char v137 = telephonytransport::TransactionManager::fulfilPromise(v135, v136, 18, (long long *)__p);
      if (*(void *)&__p[8]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&__p[8]);
      }
      if ((v137 & 1) == 0)
      {
        v139 = (NSObject **)*((void *)this + 1);
        v138 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v138)
        {
          atomic_fetch_add_explicit(&v138->__shared_owners_, 1uLL, memory_order_relaxed);
          char v10 = *v139;
          std::__shared_weak_count::__release_shared[abi:ne180100](v138);
        }
        else
        {
          char v10 = *v139;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "kFlushReadResponse");
LABEL_323:
          if (__p[23] >= 0) {
            v163 = __p;
          }
          else {
            v163 = *(unsigned char **)__p;
          }
          *(_DWORD *)bpf_program buf = 136315394;
          *(void *)&uint8_t buf[4] = v163;
          __int16 v171 = 2048;
          uint64_t v172 = a4;
          uint64_t v12 = "Unable to fulfil promise for - MessageType: %s, length: %zu";
LABEL_13:
          _os_log_error_impl(&dword_2185A0000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
          if ((__p[23] & 0x80000000) != 0) {
            operator delete(*(void **)__p);
          }
        }
      }
      return;
    default:
      return;
  }
}

void sub_2185B4E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

uint64_t std::function<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::operator()(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int v8 = a2;
  char v7 = 1;
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, char *, uint64_t *, uint64_t *))(*(void *)a1 + 48))(a1, &v8, &v7, &v6, &v5);
}

uint64_t std::function<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::operator()(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  int v8 = a3;
  int v9 = a2;
  uint64_t v6 = a5;
  uint64_t v7 = a4;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, int *, uint64_t *, uint64_t *))(*(void *)a1 + 48))(a1, &v9, &v8, &v7, &v6);
}

void telephonytransport::PCIClientTransport::~PCIClientTransport(telephonytransport::PCIClientTransport *this)
{
  *(void *)this = &unk_26C9AF140;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 13);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::__function::__value_func<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__value_func[abi:ne180100]((void *)this + 8);
  std::__function::__value_func<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__value_func[abi:ne180100]((void *)this + 4);
  uint64_t v3 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    std::default_delete<telephonytransport::TransactionManager>::operator()[abi:ne180100](v3);
  }
  unsigned int v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  uint64_t vars8;

  *(void *)this = &unk_26C9AF140;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 13);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::__function::__value_func<void ()(unsigned int,unsigned int,unsigned long long,unsigned long long)>::~__value_func[abi:ne180100]((void *)this + 8);
  std::__function::__value_func<void ()(unsigned int,BOOL,unsigned char *,unsigned long)>::~__value_func[abi:ne180100]((void *)this + 4);
  uint64_t v3 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    std::default_delete<telephonytransport::TransactionManager>::operator()[abi:ne180100](v3);
  }
  unsigned int v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }

  operator delete(this);
}

void std::default_delete<telephonytransport::TransactionManager>::operator()[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(*(void **)(a1 + 72));
  std::mutex::~mutex((std::mutex *)a1);

  operator delete(v2);
}

void std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(*a1);
    std::__tree<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::promise<telephonytransport::TransactionResponse>>>>::destroy(a1[1]);
    std::promise<telephonytransport::TransactionResponse>::~promise(a1 + 5);
    operator delete(a1);
  }
}

void std::__shared_ptr_pointer<telephonytransport::PCIClientTransport *,std::shared_ptr<telephonytransport::PCIClientTransport>::__shared_ptr_default_delete<telephonytransport::PCIClientTransport,telephonytransport::PCIClientTransport>,std::allocator<telephonytransport::PCIClientTransport>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIClientTransport *,std::shared_ptr<telephonytransport::PCIClientTransport>::__shared_ptr_default_delete<telephonytransport::PCIClientTransport,telephonytransport::PCIClientTransport>,std::allocator<telephonytransport::PCIClientTransport>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 16))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::PCIClientTransport *,std::shared_ptr<telephonytransport::PCIClientTransport>::__shared_ptr_default_delete<telephonytransport::PCIClientTransport,telephonytransport::PCIClientTransport>,std::allocator<telephonytransport::PCIClientTransport>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::future<telephonytransport::TransactionResponse>::get(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v3 + 24);
  *(void *)&__lk.__owns_ = 0xAAAAAAAAAAAAAA01;
  std::mutex::lock((std::mutex *)(v3 + 24));
  std::__assoc_sub_state::__sub_wait((std::__assoc_sub_state *)v3, &__lk);
  uint64_t v4 = *(void *)(v3 + 16);
  v8.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v8);
  if (v4)
  {
    std::exception_ptr::exception_ptr(&v8, (const std::exception_ptr *)(v3 + 16));
    v7.__ptr_ = &v8;
    std::rethrow_exception(v7);
    __break(1u);
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)(v3 + 144);
    uint64_t v5 = *(void *)(v3 + 160);
    *(void *)(a1 + 8) = *(void *)(v3 + 152);
    *(void *)(a1 + 16) = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
    if (__lk.__owns_) {
      std::mutex::unlock(__lk.__m_);
    }
    if (!atomic_fetch_add((atomic_ullong *volatile)(v3 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v6 = *(void (**)(uint64_t))(*(void *)v3 + 16);
      v6(v3);
    }
  }
}

void sub_2185B5384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception_ptr a10, std::mutex *a11, char a12)
{
  std::exception_ptr::~exception_ptr(&a10);
  if (a12) {
    std::mutex::unlock(a11);
  }
  if (v12)
  {
    if (!atomic_fetch_add(v12 + 1, 0xFFFFFFFFFFFFFFFFLL)) {
      (*(void (**)(atomic_ullong *))(*v12 + 16))(v12);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t std::__assoc_sub_state::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>(uint64_t a1, std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *a2)
{
  m = (std::mutex *)(a1 + 24);
  v14.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 24);
  *(void *)&v14.__owns_ = 0xAAAAAAAAAAAAAA01;
  std::mutex::lock((std::mutex *)(a1 + 24));
  unsigned int v5 = *(_DWORD *)(a1 + 136);
  if ((v5 & 8) != 0)
  {
    uint64_t v12 = 2;
    goto LABEL_26;
  }
  if ((v5 & 4) != 0)
  {
    uint64_t v12 = ((v5 >> 2) & 1) == 0;
    goto LABEL_26;
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < *a2)
  {
    if (*a2 > std::chrono::steady_clock::now().__d_.__rep_)
    {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v6 = *a2;
      v7.__d_.__rep_ = v6 - std::chrono::steady_clock::now().__d_.__rep_;
      if (v7.__d_.__rep_ >= 1)
      {
        std::chrono::steady_clock::now();
        v8.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
        if (!v8.__d_.__rep_)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = 0;
          goto LABEL_14;
        }
        if (v8.__d_.__rep_ < 1)
        {
          if ((unint64_t)v8.__d_.__rep_ >= 0xFFDF3B645A1CAC09) {
            goto LABEL_13;
          }
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = 0x8000000000000000;
        }
        else
        {
          if ((unint64_t)v8.__d_.__rep_ > 0x20C49BA5E353F7)
          {
            std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_14;
          }
LABEL_13:
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = 1000 * v8.__d_.__rep_;
LABEL_14:
          if (v9 > (v7.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
          {
            v10.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_17;
          }
        }
        v10.__d_.__rep_ = v9 + v7.__d_.__rep_;
LABEL_17:
        std::condition_variable::__do_timed_wait((std::condition_variable *)(a1 + 88), &v14, v10);
        std::chrono::steady_clock::now();
      }
      std::chrono::steady_clock::now();
    }
    unsigned int v11 = *(_DWORD *)(a1 + 136);
    if ((v11 & 4) != 0) {
      goto LABEL_24;
    }
  }
  unsigned int v11 = *(_DWORD *)(a1 + 136);
LABEL_24:
  uint64_t v12 = ((v11 >> 2) & 1) == 0;
  if (v14.__owns_)
  {
    m = v14.__m_;
LABEL_26:
    std::mutex::unlock(m);
  }
  return v12;
}

void std::__shared_ptr_emplace<telephonytransport::PCICreateResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF218;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCICreateResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF218;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCICreateResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF268;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF268;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF2B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIWriteResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF2B8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIWriteResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF308;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFreeResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF308;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFreeResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF358;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCISendImageResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF358;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCISendImageResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF3A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF3A8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIReadRegisterResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF3F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF3F8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIUnblockReadResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF448;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<telephonytransport::PCIFlushReadResponse>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF448;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<telephonytransport::PCIFlushReadResponse>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void telephonytransport::EthernetIfaceToSocketForwarder::create(uint64_t a1@<X0>, uint64_t *a2@<X1>, NSObject **a3@<X2>, char *a4@<X3>, void *a5@<X8>)
{
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v32 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  std::string v28 = 0;
  telephonytransport::BaseProtocol::create((uint64_t)&v29, &v28, a2, 1, a4, &v31);
  if (v28) {
    dispatch_release(v28);
  }
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = (telephonytransport *)v30;
  if (v30) {
    std::__shared_weak_count::__release_weak(v30);
  }
  unint64_t v10 = v31;
  if (v31)
  {
    unsigned int v11 = operator new(0x28uLL);
    void *v11 = &unk_26C9AF498;
    v11[1] = v10;
    uint64_t v12 = v32;
    unint64_t v31 = 0;
    uint64_t v32 = 0;
    v11[3] = 0;
    v11[4] = 0;
    v11[2] = v12;
    uint64_t v13 = (std::__shared_weak_count *)operator new(0x20uLL);
    v13->__shared_weak_owners_ = 0;
    v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AF4D8;
    v13->__shared_owners_ = 0;
    v13[1].__vftable = (std::__shared_weak_count_vtbl *)v11;
    *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v25 = v11;
    uint64_t v26 = v13;
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::unique_lock<std::mutex> v14 = *a3;
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    if (*(char *)(a1 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    }
    else {
      std::string v19 = *(std::string *)a1;
    }
    int v20 = 1;
    std::string::basic_string[abi:ne180100]<0>(&__p, "ip or ip6");
    uint64_t v23 = 0x100000000;
    telephonytransport::NetworkIface::create((telephonytransport *)&v25, &object, (uint64_t)&v19, a4, (telephonytransport::NetworkIface **)&v27);
    if (v22 < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v19.__r_.__value_.__l.__data_);
    }
    if (object) {
      dispatch_release(object);
    }
    if (v26) {
      std::__shared_weak_count::__release_weak(v26);
    }
    long long v16 = v27;
    long long v27 = 0uLL;
    uint64_t v17 = (std::__shared_weak_count *)v11[4];
    *(_OWORD *)(v11 + 3) = v16;
    if (v17)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      uint64_t v18 = (std::__shared_weak_count *)*((void *)&v27 + 1);
      *a5 = v11;
      a5[1] = v13;
      if (v18) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
    }
    else
    {
      *a5 = v11;
      a5[1] = v13;
    }
  }
  else
  {
    uint64_t v15 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v9);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_2185A0000, v15, OS_LOG_TYPE_ERROR, "Failed to create destination write only protocol", (uint8_t *)&v19, 2u);
    }
    *a5 = 0;
    a5[1] = 0;
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
}

void sub_2185B5C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23)
{
  if (v24) {
    dispatch_release(v24);
  }
  if (a23) {
    std::__shared_weak_count::__release_weak(a23);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  long long v27 = *(std::__shared_weak_count **)(v25 - 56);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  _Unwind_Resume(a1);
}

__n128 telephonytransport::EthernetIfaceToSocketForwarder::EthernetIfaceToSocketForwarder(uint64_t a1, __n128 *a2)
{
  *(void *)a1 = &unk_26C9AF498;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

{
  __n128 result;

  *(void *)a1 = &unk_26C9AF498;
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  return result;
}

uint64_t telephonytransport::EthernetIfaceToSocketForwarder::init(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return 1;
}

uint64_t telephonytransport::EthernetIfaceToSocketForwarder::handleRead(std::mutex **this, unsigned __int8 *a2, uint64_t a3)
{
  return telephonytransport::BaseProtocol::sendMessage(this[1], 1u, a2 + 14, a3 - 14);
}

void telephonytransport::EthernetIfaceToSocketForwarder::~EthernetIfaceToSocketForwarder(telephonytransport::EthernetIfaceToSocketForwarder *this)
{
  *(void *)this = &unk_26C9AF498;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_26C9AF498;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }

  operator delete(this);
}

void std::__shared_ptr_pointer<telephonytransport::EthernetIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::EthernetIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::EthernetIfaceToSocketForwarder,telephonytransport::EthernetIfaceToSocketForwarder>,std::allocator<telephonytransport::EthernetIfaceToSocketForwarder>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::EthernetIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::EthernetIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::EthernetIfaceToSocketForwarder,telephonytransport::EthernetIfaceToSocketForwarder>,std::allocator<telephonytransport::EthernetIfaceToSocketForwarder>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::EthernetIfaceToSocketForwarder *,std::shared_ptr<telephonytransport::EthernetIfaceToSocketForwarder>::__shared_ptr_default_delete<telephonytransport::EthernetIfaceToSocketForwarder,telephonytransport::EthernetIfaceToSocketForwarder>,std::allocator<telephonytransport::EthernetIfaceToSocketForwarder>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void *telephonytransport::toString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 0x13) {
    uint64_t v2 = "???";
  }
  else {
    uint64_t v2 = (&off_264329FF0)[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t telephonytransport::deserializeMessage(uint64_t a1, int a2, unsigned __int8 *a3, uint64_t a4)
{
  if (!a4) {
    return 1;
  }
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v5;
  v7[1] = v5;
  PB::Reader::Reader((PB::Reader *)v7, a3);
  return (*(uint64_t (**)(uint64_t, _OWORD *))(*(void *)a1 + 16))(a1, v7);
}

uint64_t telephonytransport::toPCIMessageType(uint64_t this)
{
  if ((this - 1) >= 0x12) {
    return 0;
  }
  else {
    return this;
  }
}

void *telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF550;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF550;
  return this;
}

void telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse(telephonytransport::PCIFlushReadResponse *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF550;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse(this);

  operator delete(v1);
}

telephonytransport::PCIFlushReadResponse *telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse(telephonytransport::PCIFlushReadResponse *this, const telephonytransport::PCIFlushReadResponse *a2)
{
  *(void *)this = &unk_26C9AF550;
  *((void *)this + 1) = 0;
  uint64_t v4 = (uint64_t *)((char *)this + 8);
  *((void *)this + 2) = 0;
  long long v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v5)
  {
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v6 = operator new(0x18uLL);
    uint64_t *v4 = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  if (*((unsigned char *)a2 + 20))
  {
    int v7 = *((_DWORD *)a2 + 4);
    *((unsigned char *)this + 20) = 1;
    *((_DWORD *)this + 4) = v7;
  }
  return this;
}

uint64_t telephonytransport::PCIFlushReadResponse::operator=(uint64_t a1, const telephonytransport::PCIFlushReadResponse *a2)
{
  if ((const telephonytransport::PCIFlushReadResponse *)a1 != a2)
  {
    memset(v6, 170, sizeof(v6));
    telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse((telephonytransport::PCIFlushReadResponse *)v6, a2);
    uint64_t v3 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v6[1];
    v6[1] = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 16);
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v6[2];
    std::logic_error v6[2] = __PAIR64__(v4, v3);
    telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse((telephonytransport::PCIFlushReadResponse *)v6);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFlushReadResponse *a2, telephonytransport::PCIFlushReadResponse *a3)
{
  int v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF550;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIFlushReadResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    memset(v6, 170, sizeof(v6));
    telephonytransport::PCIFlushReadResponse::PCIFlushReadResponse((uint64_t)v6, a2);
    uint64_t v3 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v6[1];
    v6[1] = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 16);
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v6[2];
    std::logic_error v6[2] = __PAIR64__(v4, v3);
    telephonytransport::PCIFlushReadResponse::~PCIFlushReadResponse((telephonytransport::PCIFlushReadResponse *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIFlushReadResponse::formatText(telephonytransport::PCIFlushReadResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if (*((unsigned char *)this + 20)) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIFlushReadResponse::readFrom(telephonytransport::PCIFlushReadResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_28;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v22 = *((void *)a2 + 1);
        unint64_t v23 = *((void *)a2 + 2);
        uint64_t v24 = *(void *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v27 = 0;
          if (v23 <= v22) {
            unint64_t v23 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_47;
            }
            unint64_t v32 = v22 + 1;
            char v33 = *(unsigned char *)(v24 + v22);
            *((void *)a2 + 1) = v32;
            v27 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v30 += 7;
            unint64_t v22 = v32;
            BOOL v14 = v31++ > 8;
            if (v14)
            {
LABEL_43:
              LODWORD(v27) = 0;
              goto LABEL_47;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v27) = 0;
          }
        }
        else
        {
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (1)
          {
            unint64_t v28 = v22 + 1;
            *((void *)a2 + 1) = v22 + 1;
            char v29 = *(unsigned char *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0) {
              break;
            }
            v25 += 7;
            unint64_t v22 = v28;
            BOOL v14 = v26++ > 8;
            if (v14) {
              goto LABEL_43;
            }
          }
        }
LABEL_47:
        *((_DWORD *)this + 4) = v27;
      }
      else if ((v11 >> 3) == 1)
      {
        std::string v19 = operator new(0x18uLL);
        *(void *)std::string v19 = &unk_26C9AF6D8;
        v19[5] = 0;
        uint64_t v20 = *((void *)this + 1);
        *((void *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
          std::string v19 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_28:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_28;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIMessageId::PCIMessageId(uint64_t this)
{
  *(void *)this = &unk_26C9AF6D8;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

{
  *(void *)this = &unk_26C9AF6D8;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

uint64_t telephonytransport::PCIFlushReadResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 20))
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL telephonytransport::PCIFlushReadResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 20) & 1) == 0;
  if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 20) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

BOOL telephonytransport::PCIMessageId::operator==(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 20) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 20) & 2) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 20) & 2) != 0)
  {
    return 0;
  }
  BOOL v2 = (*(unsigned char *)(a2 + 20) & 1) == 0;
  if (*(unsigned char *)(a1 + 20)) {
    return (*(unsigned char *)(a2 + 20) & 1) != 0 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  }
  return v2;
}

uint64_t telephonytransport::PCIFlushReadResponse::hash_value(telephonytransport::PCIFlushReadResponse *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if (*((unsigned char *)this + 20)) {
    uint64_t v5 = *((int *)this + 4);
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v1;
}

void *telephonytransport::PCIFlushReadResponse::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void *telephonytransport::PCISendImageResponse::PCISendImageResponse(void *this)
{
  *this = &unk_26C9AF588;
  this[1] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &unk_26C9AF588;
  this[1] = 0;
  this[3] = 0;
  return this;
}

void telephonytransport::PCISendImageResponse::~PCISendImageResponse(telephonytransport::PCISendImageResponse *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF588;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCISendImageResponse::~PCISendImageResponse(this);

  operator delete(v1);
}

telephonytransport::PCISendImageResponse *telephonytransport::PCISendImageResponse::PCISendImageResponse(telephonytransport::PCISendImageResponse *this, const telephonytransport::PCISendImageResponse *a2)
{
  *(void *)this = &unk_26C9AF588;
  *((void *)this + 1) = 0;
  *((void *)this + 3) = 0;
  uint64_t v4 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v4)
  {
    uint64_t v5 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v5, v4);
  }
  char v6 = *((unsigned char *)a2 + 28);
  if ((v6 & 4) != 0)
  {
    int v8 = *((_DWORD *)a2 + 6);
    char v7 = 4;
    *((unsigned char *)this + 28) = 4;
    *((_DWORD *)this + 6) = v8;
    char v6 = *((unsigned char *)a2 + 28);
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  char v7 = 0;
  if (*((unsigned char *)a2 + 28))
  {
LABEL_7:
    int v9 = *((_DWORD *)a2 + 4);
    v7 |= 1u;
    *((unsigned char *)this + 28) = v7;
    *((_DWORD *)this + 4) = v9;
    char v6 = *((unsigned char *)a2 + 28);
  }
LABEL_8:
  if ((v6 & 2) != 0)
  {
    int v10 = *((_DWORD *)a2 + 5);
    *((unsigned char *)this + 28) = v7 | 2;
    *((_DWORD *)this + 5) = v10;
  }
  return this;
}

uint64_t telephonytransport::PCISendImageResponse::operator=(uint64_t a1, const telephonytransport::PCISendImageResponse *a2)
{
  if ((const telephonytransport::PCISendImageResponse *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v3;
    long long v10 = v3;
    telephonytransport::PCISendImageResponse::PCISendImageResponse((telephonytransport::PCISendImageResponse *)&v9, a2);
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v9 + 1);
    *((void *)&v9 + 1) = v4;
    long long v5 = v10;
    int v6 = *(_DWORD *)(a1 + 28);
    DWORD2(v10) = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v6;
    uint64_t v7 = *(void *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)&long long v10 = v7;
    telephonytransport::PCISendImageResponse::~PCISendImageResponse((telephonytransport::PCISendImageResponse *)&v9);
  }
  return a1;
}

double telephonytransport::swap(telephonytransport *this, telephonytransport::PCISendImageResponse *a2, telephonytransport::PCISendImageResponse *a3)
{
  int v3 = *((_DWORD *)this + 7);
  *((_DWORD *)this + 7) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *((_DWORD *)this + 4);
  *((_DWORD *)this + 4) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  double result = *(double *)((char *)a2 + 20);
  uint64_t v6 = *(void *)((char *)this + 20);
  *(double *)((char *)this + 20) = result;
  *(void *)((char *)a2 + 20) = v6;
  return result;
}

uint64_t telephonytransport::PCISendImageResponse::PCISendImageResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF588;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(a1 + 20) = *(void *)(a2 + 20);
  return a1;
}

uint64_t telephonytransport::PCISendImageResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v3;
    long long v10 = v3;
    telephonytransport::PCISendImageResponse::PCISendImageResponse((uint64_t)&v9, a2);
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v9 + 1);
    *((void *)&v9 + 1) = v4;
    long long v5 = v10;
    int v6 = *(_DWORD *)(a1 + 28);
    DWORD2(v10) = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v6;
    uint64_t v7 = *(void *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)&long long v10 = v7;
    telephonytransport::PCISendImageResponse::~PCISendImageResponse((telephonytransport::PCISendImageResponse *)&v9);
  }
  return a1;
}

uint64_t telephonytransport::PCISendImageResponse::formatText(telephonytransport::PCISendImageResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 28);
  if (v5)
  {
    PB::TextFormatter::format(a2, "bytesWritten");
    char v5 = *((unsigned char *)this + 28);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "cookie");
  }
  uint64_t v6 = *((void *)this + 1);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "messageId");
  }
  if ((*((unsigned char *)this + 28) & 4) != 0) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCISendImageResponse::readFrom(telephonytransport::PCISendImageResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        long long v21 = operator new(0x18uLL);
        *(void *)long long v21 = &unk_26C9AF6D8;
        void v21[5] = 0;
        uint64_t v22 = *((void *)this + 1);
        *((void *)this + 1) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
          long long v21 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        unint64_t v2 = *((void *)a2 + 1);
        unint64_t v3 = *((void *)a2 + 2);
        int v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0) {
          return v4 == 0;
        }
        break;
      case 2u:
        *((unsigned char *)this + 28) |= 4u;
        unint64_t v23 = *((void *)a2 + 1);
        unint64_t v24 = *((void *)a2 + 2);
        uint64_t v25 = *(void *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          do
          {
            unint64_t v29 = v23 + 1;
            *((void *)a2 + 1) = v23 + 1;
            char v30 = *(unsigned char *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_79;
            }
            v26 += 7;
            unint64_t v23 = v29;
            BOOL v14 = v27++ > 8;
          }
          while (!v14);
LABEL_59:
          LODWORD(v28) = 0;
          goto LABEL_79;
        }
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v28 = 0;
        if (v24 <= v23) {
          unint64_t v24 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v49 = v23 + 1;
            char v50 = *(unsigned char *)(v25 + v23);
            *((void *)a2 + 1) = v49;
            v28 |= (unint64_t)(v50 & 0x7F) << v47;
            if (v50 < 0)
            {
              v47 += 7;
              unint64_t v23 = v49;
              BOOL v14 = v48++ > 8;
              if (v14) {
                goto LABEL_59;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v28) = 0;
            }
          }
          break;
        }
LABEL_79:
        *((_DWORD *)this + 6) = v28;
        goto LABEL_20;
      case 3u:
        *((unsigned char *)this + 28) |= 1u;
        unint64_t v31 = *((void *)a2 + 1);
        unint64_t v32 = *((void *)a2 + 2);
        uint64_t v33 = *(void *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          do
          {
            unint64_t v37 = v31 + 1;
            *((void *)a2 + 1) = v31 + 1;
            char v38 = *(unsigned char *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0) {
              goto LABEL_82;
            }
            v34 += 7;
            unint64_t v31 = v37;
            BOOL v14 = v35++ > 8;
          }
          while (!v14);
LABEL_66:
          LODWORD(v36) = 0;
          goto LABEL_82;
        }
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v36 = 0;
        if (v32 <= v31) {
          unint64_t v32 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v32 == v31)
          {
            LODWORD(v36) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v53 = v31 + 1;
            char v54 = *(unsigned char *)(v33 + v31);
            *((void *)a2 + 1) = v53;
            v36 |= (unint64_t)(v54 & 0x7F) << v51;
            if (v54 < 0)
            {
              v51 += 7;
              unint64_t v31 = v53;
              BOOL v14 = v52++ > 8;
              if (v14) {
                goto LABEL_66;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v36) = 0;
            }
          }
          break;
        }
LABEL_82:
        *((_DWORD *)this + 4) = v36;
        goto LABEL_20;
      case 4u:
        *((unsigned char *)this + 28) |= 2u;
        unint64_t v39 = *((void *)a2 + 1);
        unint64_t v40 = *((void *)a2 + 2);
        uint64_t v41 = *(void *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          do
          {
            unint64_t v45 = v39 + 1;
            *((void *)a2 + 1) = v39 + 1;
            char v46 = *(unsigned char *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0) {
              goto LABEL_85;
            }
            v42 += 7;
            unint64_t v39 = v45;
            BOOL v14 = v43++ > 8;
          }
          while (!v14);
LABEL_73:
          LODWORD(v44) = 0;
          goto LABEL_85;
        }
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v44 = 0;
        if (v40 <= v39) {
          unint64_t v40 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v40 == v39)
          {
            LODWORD(v44) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v57 = v39 + 1;
            char v58 = *(unsigned char *)(v41 + v39);
            *((void *)a2 + 1) = v57;
            v44 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              unint64_t v39 = v57;
              BOOL v14 = v56++ > 8;
              if (v14) {
                goto LABEL_73;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v44) = 0;
            }
          }
          break;
        }
LABEL_85:
        *((_DWORD *)this + 5) = v44;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_25;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t telephonytransport::PCISendImageResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  char v5 = *(unsigned char *)(v3 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(v3 + 28) & 1) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 28) & 2) == 0) {
      return this;
    }
    goto LABEL_9;
  }
  this = PB::Writer::writeVarInt(a2);
  char v5 = *(unsigned char *)(v3 + 28);
  if (v5) {
    goto LABEL_8;
  }
LABEL_5:
  if ((v5 & 2) == 0) {
    return this;
  }
LABEL_9:

  return PB::Writer::writeVarInt(a2);
}

BOOL telephonytransport::PCISendImageResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 28) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 28) & 4) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 28) & 4) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 28))
  {
    if ((*(unsigned char *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 28))
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 28) & 2) == 0;
  if ((*(unsigned char *)(a1 + 28) & 2) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 28) & 2) != 0 && *(_DWORD *)(a1 + 20) == *(_DWORD *)(a2 + 20);
}

uint64_t telephonytransport::PCISendImageResponse::hash_value(telephonytransport::PCISendImageResponse *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if ((*((unsigned char *)this + 28) & 4) == 0)
  {
    uint64_t v5 = 0;
    if (*((unsigned char *)this + 28)) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*((unsigned char *)this + 28) & 2) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v5 ^ v1 ^ v6 ^ v7;
  }
  uint64_t v5 = *((int *)this + 6);
  if ((*((unsigned char *)this + 28) & 1) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v6 = *((unsigned int *)this + 4);
  if ((*((unsigned char *)this + 28) & 2) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v7 = *((unsigned int *)this + 5);
  return v5 ^ v1 ^ v6 ^ v7;
}

void *telephonytransport::PCISendImageResponse::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void *telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF5C0;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF5C0;
  return this;
}

void telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse(telephonytransport::PCIUnblockReadResponse *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF5C0;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse(this);

  operator delete(v1);
}

telephonytransport::PCIUnblockReadResponse *telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse(telephonytransport::PCIUnblockReadResponse *this, const telephonytransport::PCIUnblockReadResponse *a2)
{
  *(void *)this = &unk_26C9AF5C0;
  *((void *)this + 1) = 0;
  uint64_t v4 = (uint64_t *)((char *)this + 8);
  *((void *)this + 2) = 0;
  uint64_t v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v5)
  {
    uint64_t v6 = operator new(0x18uLL);
    uint64_t *v4 = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  if (*((unsigned char *)a2 + 20))
  {
    int v7 = *((_DWORD *)a2 + 4);
    *((unsigned char *)this + 20) = 1;
    *((_DWORD *)this + 4) = v7;
  }
  return this;
}

uint64_t telephonytransport::PCIUnblockReadResponse::operator=(uint64_t a1, const telephonytransport::PCIUnblockReadResponse *a2)
{
  if ((const telephonytransport::PCIUnblockReadResponse *)a1 != a2)
  {
    memset(v6, 170, sizeof(v6));
    telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse((telephonytransport::PCIUnblockReadResponse *)v6, a2);
    uint64_t v3 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v6[1];
    v6[1] = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 16);
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v6[2];
    std::logic_error v6[2] = __PAIR64__(v4, v3);
    telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse((telephonytransport::PCIUnblockReadResponse *)v6);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIUnblockReadResponse *a2, telephonytransport::PCIUnblockReadResponse *a3)
{
  int v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF5C0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    memset(v6, 170, sizeof(v6));
    telephonytransport::PCIUnblockReadResponse::PCIUnblockReadResponse((uint64_t)v6, a2);
    uint64_t v3 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v6[1];
    v6[1] = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 16);
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v6[2];
    std::logic_error v6[2] = __PAIR64__(v4, v3);
    telephonytransport::PCIUnblockReadResponse::~PCIUnblockReadResponse((telephonytransport::PCIUnblockReadResponse *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadResponse::formatText(telephonytransport::PCIUnblockReadResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if (*((unsigned char *)this + 20)) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIUnblockReadResponse::readFrom(telephonytransport::PCIUnblockReadResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_28;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v22 = *((void *)a2 + 1);
        unint64_t v23 = *((void *)a2 + 2);
        uint64_t v24 = *(void *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v27 = 0;
          if (v23 <= v22) {
            unint64_t v23 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_47;
            }
            unint64_t v32 = v22 + 1;
            char v33 = *(unsigned char *)(v24 + v22);
            *((void *)a2 + 1) = v32;
            v27 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v30 += 7;
            unint64_t v22 = v32;
            BOOL v14 = v31++ > 8;
            if (v14)
            {
LABEL_43:
              LODWORD(v27) = 0;
              goto LABEL_47;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v27) = 0;
          }
        }
        else
        {
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (1)
          {
            unint64_t v28 = v22 + 1;
            *((void *)a2 + 1) = v22 + 1;
            char v29 = *(unsigned char *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0) {
              break;
            }
            v25 += 7;
            unint64_t v22 = v28;
            BOOL v14 = v26++ > 8;
            if (v14) {
              goto LABEL_43;
            }
          }
        }
LABEL_47:
        *((_DWORD *)this + 4) = v27;
      }
      else if ((v11 >> 3) == 1)
      {
        std::string v19 = operator new(0x18uLL);
        *(void *)std::string v19 = &unk_26C9AF6D8;
        v19[5] = 0;
        uint64_t v20 = *((void *)this + 1);
        *((void *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
          std::string v19 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_28:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_28;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIUnblockReadResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 20))
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL telephonytransport::PCIUnblockReadResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 20) & 1) == 0;
  if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 20) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIUnblockReadResponse::hash_value(telephonytransport::PCIUnblockReadResponse *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if (*((unsigned char *)this + 20)) {
    uint64_t v5 = *((int *)this + 4);
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v1;
}

void *telephonytransport::PCIUnblockReadResponse::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void *telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse(void *this)
{
  *this = &unk_26C9AF5F8;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &unk_26C9AF5F8;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse(telephonytransport::PCIReadRegisterResponse *this)
{
  *(void *)this = &unk_26C9AF5F8;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse(this);

  operator delete(v1);
}

telephonytransport::PCIReadRegisterResponse *telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse(telephonytransport::PCIReadRegisterResponse *this, const telephonytransport::PCIReadRegisterResponse *a2)
{
  *(void *)this = &unk_26C9AF5F8;
  *((void *)this + 1) = 0;
  uint64_t v4 = (void ***)((char *)this + 8);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  uint64_t v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 2);
  if (v5)
  {
    uint64_t v6 = operator new(0x18uLL);
    *((void *)this + 2) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  if (*((unsigned char *)a2 + 28))
  {
    int v7 = *((_DWORD *)a2 + 6);
    *((unsigned char *)this + 28) = 1;
    *((_DWORD *)this + 6) = v7;
  }
  uint64_t v8 = (const PB::Data *)*((void *)a2 + 1);
  if (v8)
  {
    char v9 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v9, v8);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v9);
  }
  return this;
}

uint64_t telephonytransport::PCIReadRegisterResponse::operator=(uint64_t a1, const telephonytransport::PCIReadRegisterResponse *a2)
{
  if ((const telephonytransport::PCIReadRegisterResponse *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadRegisterResponse *a2, telephonytransport::PCIReadRegisterResponse *a3)
{
  int v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  uint64_t v4 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF5F8;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (void ***)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v7 = *(void ***)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadRegisterResponse::PCIReadRegisterResponse((uint64_t)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadRegisterResponse::~PCIReadRegisterResponse((telephonytransport::PCIReadRegisterResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterResponse::formatText(telephonytransport::PCIReadRegisterResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if (*((unsigned char *)this + 28)) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIReadRegisterResponse::readFrom(telephonytransport::PCIReadRegisterResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    uint64_t v8 = (void ***)((char *)this + 8);
    while (1)
    {
      uint64_t v9 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        unint64_t v13 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v14 = *(unsigned char *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0) {
          break;
        }
        v10 += 7;
        unint64_t v2 = v13;
        BOOL v15 = v11++ > 8;
        if (v15) {
          goto LABEL_20;
        }
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v25 = (void **)operator new(0x10uLL);
        void *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if (v22 == 2)
      {
        *((unsigned char *)this + 28) |= 1u;
        unint64_t v26 = *((void *)a2 + 1);
        unint64_t v27 = *((void *)a2 + 2);
        uint64_t v28 = *(void *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v31 = 0;
          if (v27 <= v26) {
            unint64_t v27 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_53;
            }
            unint64_t v36 = v26 + 1;
            char v37 = *(unsigned char *)(v28 + v26);
            *((void *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0) {
              break;
            }
            v34 += 7;
            unint64_t v26 = v36;
            BOOL v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v31) = 0;
          }
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            unint64_t v32 = v26 + 1;
            *((void *)a2 + 1) = v26 + 1;
            char v33 = *(unsigned char *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v26 = v32;
            BOOL v15 = v30++ > 8;
            if (v15) {
              goto LABEL_49;
            }
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if (v22 == 1)
      {
        unint64_t v23 = operator new(0x18uLL);
        *(void *)unint64_t v23 = &unk_26C9AF6D8;
        v23[5] = 0;
        uint64_t v24 = *((void *)this + 2);
        *((void *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
          unint64_t v23 = (_DWORD *)*((void *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v16 = 0;
    unsigned int v17 = 0;
    unint64_t v12 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v18 = v2 + 1;
      char v19 = *(unsigned char *)(v9 + v2);
      *((void *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0) {
        goto LABEL_26;
      }
      v16 += 7;
      unint64_t v2 = v18;
      BOOL v15 = v17++ > 8;
      if (v15) {
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadRegisterResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 28)) {
    this = PB::Writer::writeVarInt(a2);
  }
  if (*(void *)(v3 + 8))
  {
    return MEMORY[0x270F58868](a2);
  }
  return this;
}

BOOL telephonytransport::PCIReadRegisterResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 28))
  {
    if ((*(unsigned char *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 28))
  {
    return 0;
  }
  if (*(void *)(a1 + 8))
  {
    if (!*(void *)(a2 + 8)) {
      return 0;
    }
    if (PB::Data::operator==()) {
      return 1;
    }
    if (*(void *)(a1 + 8)) {
      return 0;
    }
  }
  return *(void *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIReadRegisterResponse::hash_value(telephonytransport::PCIReadRegisterResponse *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v4 ^ v3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (*((unsigned char *)this + 28)) {
    uint64_t v6 = *((int *)this + 6);
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((void *)this + 1)) {
    uint64_t v7 = PBHashBytes();
  }
  else {
    uint64_t v7 = 0;
  }
  return v6 ^ v5 ^ v7;
}

void *telephonytransport::PCIReadRegisterResponse::makeMessageId(void *this)
{
  if (!this[2])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest(uint64_t this)
{
  *(void *)this = &unk_26C9AF630;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 28) = 0;
  return this;
}

{
  *(void *)this = &unk_26C9AF630;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 28) = 0;
  return this;
}

void telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest(telephonytransport::PCIReadRegisterRequest *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF630;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest(this);

  operator delete(v1);
}

telephonytransport::PCIReadRegisterRequest *telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest(telephonytransport::PCIReadRegisterRequest *this, const telephonytransport::PCIReadRegisterRequest *a2)
{
  *(void *)this = &unk_26C9AF630;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 7) = 0;
  uint64_t v4 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v4)
  {
    uint64_t v5 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v5, v4);
  }
  char v6 = *((unsigned char *)a2 + 28);
  if ((v6 & 4) != 0)
  {
    int v8 = *((_DWORD *)a2 + 6);
    char v7 = 4;
    *((unsigned char *)this + 28) = 4;
    *((_DWORD *)this + 6) = v8;
    char v6 = *((unsigned char *)a2 + 28);
    if ((v6 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  char v7 = 0;
  if ((*((unsigned char *)a2 + 28) & 2) != 0)
  {
LABEL_7:
    int v9 = *((_DWORD *)a2 + 5);
    v7 |= 2u;
    *((unsigned char *)this + 28) = v7;
    *((_DWORD *)this + 5) = v9;
    char v6 = *((unsigned char *)a2 + 28);
  }
LABEL_8:
  if (v6)
  {
    int v10 = *((_DWORD *)a2 + 4);
    *((unsigned char *)this + 28) = v7 | 1;
    *((_DWORD *)this + 4) = v10;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRegisterRequest::operator=(uint64_t a1, const telephonytransport::PCIReadRegisterRequest *a2)
{
  if ((const telephonytransport::PCIReadRegisterRequest *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v3;
    long long v10 = v3;
    telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest((telephonytransport::PCIReadRegisterRequest *)&v9, a2);
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v9 + 1);
    *((void *)&v9 + 1) = v4;
    long long v5 = v10;
    int v6 = *(_DWORD *)(a1 + 28);
    DWORD2(v10) = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v6;
    uint64_t v7 = *(void *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)&long long v10 = v7;
    telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest((telephonytransport::PCIReadRegisterRequest *)&v9);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadRegisterRequest *a2, telephonytransport::PCIReadRegisterRequest *a3)
{
  int v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF630;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v3;
    long long v10 = v3;
    telephonytransport::PCIReadRegisterRequest::PCIReadRegisterRequest((uint64_t)&v9, a2);
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v9 + 1);
    *((void *)&v9 + 1) = v4;
    long long v5 = v10;
    int v6 = *(_DWORD *)(a1 + 28);
    DWORD2(v10) = *(_DWORD *)(a1 + 24);
    HIDWORD(v10) = v6;
    uint64_t v7 = *(void *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)&long long v10 = v7;
    telephonytransport::PCIReadRegisterRequest::~PCIReadRegisterRequest((telephonytransport::PCIReadRegisterRequest *)&v9);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadRegisterRequest::formatText(telephonytransport::PCIReadRegisterRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 28)) {
    PB::TextFormatter::format(a2, "bytesToRead");
  }
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  char v6 = *((unsigned char *)this + 28);
  if ((v6 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "timeoutMs");
    char v6 = *((unsigned char *)this + 28);
  }
  if ((v6 & 4) != 0) {
    PB::TextFormatter::format(a2, "whichRegister");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIReadRegisterRequest::readFrom(telephonytransport::PCIReadRegisterRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        long long v21 = operator new(0x18uLL);
        *(void *)long long v21 = &unk_26C9AF6D8;
        void v21[5] = 0;
        uint64_t v22 = *((void *)this + 1);
        *((void *)this + 1) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
          long long v21 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        unint64_t v2 = *((void *)a2 + 1);
        unint64_t v3 = *((void *)a2 + 2);
        int v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0) {
          return v4 == 0;
        }
        break;
      case 2u:
        *((unsigned char *)this + 28) |= 4u;
        unint64_t v23 = *((void *)a2 + 1);
        unint64_t v24 = *((void *)a2 + 2);
        uint64_t v25 = *(void *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          do
          {
            unint64_t v29 = v23 + 1;
            *((void *)a2 + 1) = v23 + 1;
            char v30 = *(unsigned char *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_79;
            }
            v26 += 7;
            unint64_t v23 = v29;
            BOOL v14 = v27++ > 8;
          }
          while (!v14);
LABEL_59:
          LODWORD(v28) = 0;
          goto LABEL_79;
        }
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v28 = 0;
        if (v24 <= v23) {
          unint64_t v24 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v49 = v23 + 1;
            char v50 = *(unsigned char *)(v25 + v23);
            *((void *)a2 + 1) = v49;
            v28 |= (unint64_t)(v50 & 0x7F) << v47;
            if (v50 < 0)
            {
              v47 += 7;
              unint64_t v23 = v49;
              BOOL v14 = v48++ > 8;
              if (v14) {
                goto LABEL_59;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v28) = 0;
            }
          }
          break;
        }
LABEL_79:
        *((_DWORD *)this + 6) = v28;
        goto LABEL_20;
      case 3u:
        *((unsigned char *)this + 28) |= 2u;
        unint64_t v31 = *((void *)a2 + 1);
        unint64_t v32 = *((void *)a2 + 2);
        uint64_t v33 = *(void *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          do
          {
            unint64_t v37 = v31 + 1;
            *((void *)a2 + 1) = v31 + 1;
            char v38 = *(unsigned char *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0) {
              goto LABEL_82;
            }
            v34 += 7;
            unint64_t v31 = v37;
            BOOL v14 = v35++ > 8;
          }
          while (!v14);
LABEL_66:
          LODWORD(v36) = 0;
          goto LABEL_82;
        }
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v36 = 0;
        if (v32 <= v31) {
          unint64_t v32 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v32 == v31)
          {
            LODWORD(v36) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v53 = v31 + 1;
            char v54 = *(unsigned char *)(v33 + v31);
            *((void *)a2 + 1) = v53;
            v36 |= (unint64_t)(v54 & 0x7F) << v51;
            if (v54 < 0)
            {
              v51 += 7;
              unint64_t v31 = v53;
              BOOL v14 = v52++ > 8;
              if (v14) {
                goto LABEL_66;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v36) = 0;
            }
          }
          break;
        }
LABEL_82:
        *((_DWORD *)this + 5) = v36;
        goto LABEL_20;
      case 4u:
        *((unsigned char *)this + 28) |= 1u;
        unint64_t v39 = *((void *)a2 + 1);
        unint64_t v40 = *((void *)a2 + 2);
        uint64_t v41 = *(void *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          do
          {
            unint64_t v45 = v39 + 1;
            *((void *)a2 + 1) = v39 + 1;
            char v46 = *(unsigned char *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0) {
              goto LABEL_85;
            }
            v42 += 7;
            unint64_t v39 = v45;
            BOOL v14 = v43++ > 8;
          }
          while (!v14);
LABEL_73:
          LODWORD(v44) = 0;
          goto LABEL_85;
        }
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v44 = 0;
        if (v40 <= v39) {
          unint64_t v40 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v40 == v39)
          {
            LODWORD(v44) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v57 = v39 + 1;
            char v58 = *(unsigned char *)(v41 + v39);
            *((void *)a2 + 1) = v57;
            v44 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              unint64_t v39 = v57;
              BOOL v14 = v56++ > 8;
              if (v14) {
                goto LABEL_73;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v44) = 0;
            }
          }
          break;
        }
LABEL_85:
        *((_DWORD *)this + 4) = v44;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_25;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t telephonytransport::PCIReadRegisterRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  char v5 = *(unsigned char *)(v3 + 28);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(v3 + 28) & 2) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 28) & 1) == 0) {
      return this;
    }
    goto LABEL_9;
  }
  this = PB::Writer::writeVarInt(a2);
  char v5 = *(unsigned char *)(v3 + 28);
  if ((v5 & 2) != 0) {
    goto LABEL_8;
  }
LABEL_5:
  if ((v5 & 1) == 0) {
    return this;
  }
LABEL_9:

  return PB::Writer::writeVarInt(a2);
}

BOOL telephonytransport::PCIReadRegisterRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 28) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 28) & 4) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 28) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 28) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 28) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 28) & 2) != 0)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 28) & 1) == 0;
  if ((*(unsigned char *)(a1 + 28) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 28) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIReadRegisterRequest::hash_value(telephonytransport::PCIReadRegisterRequest *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if ((*((unsigned char *)this + 28) & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*((unsigned char *)this + 28) & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v6 = 0;
    if (*((unsigned char *)this + 28)) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v5 ^ v1 ^ v6 ^ v7;
  }
  uint64_t v5 = *((unsigned int *)this + 6);
  if ((*((unsigned char *)this + 28) & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v6 = *((unsigned int *)this + 5);
  if ((*((unsigned char *)this + 28) & 1) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v7 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6 ^ v7;
}

void *telephonytransport::PCIReadRegisterRequest::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void *telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest(void *this)
{
  *this = &unk_26C9AF668;
  this[1] = 0;
  return this;
}

{
  *this = &unk_26C9AF668;
  this[1] = 0;
  return this;
}

void telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest(telephonytransport::PCIUnblockReadRequest *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF668;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest(this);

  operator delete(v1);
}

telephonytransport::PCIUnblockReadRequest *telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest(telephonytransport::PCIUnblockReadRequest *this, const telephonytransport::PCIUnblockReadRequest *a2)
{
  *(void *)this = &unk_26C9AF668;
  *((void *)this + 1) = 0;
  uint64_t v3 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v3)
  {
    uint64_t v4 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v4, v3);
  }
  return this;
}

const telephonytransport::PCIUnblockReadRequest *telephonytransport::PCIUnblockReadRequest::operator=(const telephonytransport::PCIUnblockReadRequest *a1, const telephonytransport::PCIUnblockReadRequest *a2)
{
  if (a1 != a2)
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
    telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest((telephonytransport::PCIUnblockReadRequest *)&v5, a2);
    unint64_t v3 = *((void *)a1 + 1);
    *((void *)a1 + 1) = v6;
    unint64_t v6 = v3;
    telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest((telephonytransport::PCIUnblockReadRequest *)&v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIUnblockReadRequest *a2, telephonytransport::PCIUnblockReadRequest *a3)
{
  uint64_t v3 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  return this;
}

void *telephonytransport::PCIUnblockReadRequest::PCIUnblockReadRequest(void *a1, uint64_t a2)
{
  *a1 = &unk_26C9AF668;
  a1[1] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &unk_26C9AF668;
  a1[1] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)(a2 + 8) = 0;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v3;
    v6[0] = &unk_26C9AF668;
    v6[1] = v4;
    telephonytransport::PCIUnblockReadRequest::~PCIUnblockReadRequest((telephonytransport::PCIUnblockReadRequest *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIUnblockReadRequest::formatText(telephonytransport::PCIUnblockReadRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIUnblockReadRequest::readFrom(telephonytransport::PCIUnblockReadRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_27;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        char v19 = operator new(0x18uLL);
        *(void *)char v19 = &unk_26C9AF6D8;
        v19[5] = 0;
        uint64_t v20 = *((void *)this + 1);
        *((void *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
          char v19 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_27;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIUnblockReadRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  unint64_t v2 = *(const PB::Base **)(this + 8);
  if (v2) {
    return PB::Writer::writeSubmessage(a2, v2);
  }
  return this;
}

BOOL telephonytransport::PCIUnblockReadRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  BOOL result = v3 == 0;
  if (v2) {
    return v3 && telephonytransport::PCIMessageId::operator==(v2, v3);
  }
  return result;
}

uint64_t telephonytransport::PCIUnblockReadRequest::hash_value(telephonytransport::PCIUnblockReadRequest *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (!v1) {
    return 0;
  }
  char v2 = *(unsigned char *)(v1 + 20);
  uint64_t v3 = *(unsigned int *)(v1 + 16);
  if ((v2 & 2) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(v1 + 8);
  if ((v2 & 1) == 0) {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

void *telephonytransport::PCIUnblockReadRequest::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void *telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest(void *this)
{
  *this = &unk_26C9AF6A0;
  this[1] = 0;
  return this;
}

{
  *this = &unk_26C9AF6A0;
  this[1] = 0;
  return this;
}

void telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest(telephonytransport::PCIFlushReadRequest *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF6A0;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest(this);

  operator delete(v1);
}

telephonytransport::PCIFlushReadRequest *telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest(telephonytransport::PCIFlushReadRequest *this, const telephonytransport::PCIFlushReadRequest *a2)
{
  *(void *)this = &unk_26C9AF6A0;
  *((void *)this + 1) = 0;
  uint64_t v3 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v3)
  {
    uint64_t v4 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v4, v3);
  }
  return this;
}

const telephonytransport::PCIFlushReadRequest *telephonytransport::PCIFlushReadRequest::operator=(const telephonytransport::PCIFlushReadRequest *a1, const telephonytransport::PCIFlushReadRequest *a2)
{
  if (a1 != a2)
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
    telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest((telephonytransport::PCIFlushReadRequest *)&v5, a2);
    unint64_t v3 = *((void *)a1 + 1);
    *((void *)a1 + 1) = v6;
    unint64_t v6 = v3;
    telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest((telephonytransport::PCIFlushReadRequest *)&v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFlushReadRequest *a2, telephonytransport::PCIFlushReadRequest *a3)
{
  uint64_t v3 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  return this;
}

void *telephonytransport::PCIFlushReadRequest::PCIFlushReadRequest(void *a1, uint64_t a2)
{
  *a1 = &unk_26C9AF6A0;
  a1[1] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &unk_26C9AF6A0;
  a1[1] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

uint64_t telephonytransport::PCIFlushReadRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)(a2 + 8) = 0;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v3;
    v6[0] = &unk_26C9AF6A0;
    v6[1] = v4;
    telephonytransport::PCIFlushReadRequest::~PCIFlushReadRequest((telephonytransport::PCIFlushReadRequest *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIFlushReadRequest::formatText(telephonytransport::PCIFlushReadRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIFlushReadRequest::readFrom(telephonytransport::PCIFlushReadRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_27;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        char v19 = operator new(0x18uLL);
        *(void *)char v19 = &unk_26C9AF6D8;
        v19[5] = 0;
        uint64_t v20 = *((void *)this + 1);
        *((void *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
          char v19 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_27;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIFlushReadRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  unint64_t v2 = *(const PB::Base **)(this + 8);
  if (v2) {
    return PB::Writer::writeSubmessage(a2, v2);
  }
  return this;
}

BOOL telephonytransport::PCIFlushReadRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  BOOL result = v3 == 0;
  if (v2) {
    return v3 && telephonytransport::PCIMessageId::operator==(v2, v3);
  }
  return result;
}

uint64_t telephonytransport::PCIFlushReadRequest::hash_value(telephonytransport::PCIFlushReadRequest *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (!v1) {
    return 0;
  }
  char v2 = *(unsigned char *)(v1 + 20);
  uint64_t v3 = *(unsigned int *)(v1 + 16);
  if ((v2 & 2) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(v1 + 8);
  if ((v2 & 1) == 0) {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

void *telephonytransport::PCIFlushReadRequest::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void telephonytransport::PCIMessageId::~PCIMessageId(telephonytransport::PCIMessageId *this)
{
  PB::Base::~Base(this);

  operator delete(v1);
}

uint64_t telephonytransport::PCIMessageId::PCIMessageId(uint64_t this, const telephonytransport::PCIMessageId *a2)
{
  *(void *)this = &unk_26C9AF6D8;
  *(_DWORD *)(this + 20) = 0;
  if ((*((unsigned char *)a2 + 20) & 2) != 0)
  {
    int v3 = *((_DWORD *)a2 + 4);
    *(unsigned char *)(this + 20) = 2;
    *(_DWORD *)(this + 16) = v3;
    char v2 = 3;
    if ((*((unsigned char *)a2 + 20) & 1) == 0) {
      return this;
    }
    goto LABEL_5;
  }
  char v2 = 1;
  if (*((unsigned char *)a2 + 20))
  {
LABEL_5:
    uint64_t v4 = *((void *)a2 + 1);
    *(unsigned char *)(this + 20) = v2;
    *(void *)(this + 8) = v4;
  }
  return this;
}

uint64_t telephonytransport::PCIMessageId::operator=(uint64_t a1, const telephonytransport::PCIMessageId *a2)
{
  if ((const telephonytransport::PCIMessageId *)a1 != a2)
  {
    memset(v7, 170, sizeof(v7));
    telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v7, a2);
    unsigned int v3 = *(_DWORD *)(a1 + 16);
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v7[2];
    _OWORD v7[2] = __PAIR64__(v4, v3);
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v7[1];
    v7[1] = v5;
    PB::Base::~Base((PB::Base *)v7);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIMessageId *a2, telephonytransport::PCIMessageId *a3)
{
  int v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  int v4 = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIMessageId::PCIMessageId(uint64_t result, uint64_t a2)
{
  *(void *)BOOL result = &unk_26C9AF6D8;
  *(_DWORD *)(result + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(result + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

{
  *(void *)BOOL result = &unk_26C9AF6D8;
  *(_DWORD *)(result + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  *(_DWORD *)(result + 16) = *(_DWORD *)(a2 + 16);
  *(void *)(result + 8) = *(void *)(a2 + 8);
  return result;
}

uint64_t telephonytransport::PCIMessageId::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    v9[0] = &unk_26C9AF6D8;
    uint64_t v3 = *(void *)(a2 + 8);
    uint64_t v4 = *(void *)(a2 + 16);
    *(_DWORD *)(a2 + 20) = 0;
    int v6 = *(_DWORD *)(a1 + 16);
    int v5 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v4;
    int v10 = v6;
    int v11 = v5;
    uint64_t v7 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v3;
    v9[1] = v7;
    PB::Base::~Base((PB::Base *)v9);
  }
  return a1;
}

uint64_t telephonytransport::PCIMessageId::formatText(telephonytransport::PCIMessageId *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 20);
  if ((v5 & 2) != 0)
  {
    PB::TextFormatter::format(a2, "transportToken");
    char v5 = *((unsigned char *)this + 20);
  }
  if (v5) {
    PB::TextFormatter::format(a2, "txnId");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIMessageId::readFrom(telephonytransport::PCIMessageId *this, PB::Reader *a2)
{
  unint64_t v3 = *((void *)a2 + 1);
  unint64_t v2 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v3 < v2 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v3 > 0xFFFFFFFFFFFFFFF5 || v3 + 10 > v2) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v3 + 1;
        *((void *)a2 + 1) = v3 + 1;
        char v13 = *(unsigned char *)(v8 + v3);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v3 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_30;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v26 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v27 = *(void *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v2)
        {
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v30 = 0;
          if (v2 <= v26) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v26)
            {
              uint64_t v30 = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_64;
            }
            unint64_t v38 = v26++;
            char v39 = *(unsigned char *)(v27 + v38);
            *((void *)a2 + 1) = v26;
            v30 |= (unint64_t)(v39 & 0x7F) << v36;
            if ((v39 & 0x80) == 0) {
              break;
            }
            v36 += 7;
            BOOL v14 = v37++ > 8;
            if (v14)
            {
              uint64_t v30 = 0;
              goto LABEL_63;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            uint64_t v30 = 0;
          }
LABEL_63:
          unint64_t v3 = v38 + 1;
        }
        else
        {
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          while (1)
          {
            unint64_t v3 = v26 + 1;
            *((void *)a2 + 1) = v26 + 1;
            char v31 = *(unsigned char *)(v27 + v26);
            v30 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0) {
              break;
            }
            v28 += 7;
            unint64_t v26 = v3;
            BOOL v14 = v29++ > 8;
            if (v14)
            {
              uint64_t v30 = 0;
              break;
            }
          }
        }
LABEL_64:
        *((void *)this + 1) = v30;
      }
      else if ((v11 >> 3) == 1)
      {
        *((unsigned char *)this + 20) |= 2u;
        unint64_t v19 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
        uint64_t v20 = *(void *)a2;
        if (v19 > 0xFFFFFFFFFFFFFFF5 || v19 + 10 > v2)
        {
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          if (v2 <= v19) {
            unint64_t v3 = *((void *)a2 + 1);
          }
          else {
            unint64_t v3 = *((void *)a2 + 2);
          }
          while (1)
          {
            if (v3 == v19)
            {
              LODWORD(v23) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_60;
            }
            unint64_t v34 = v19++;
            char v35 = *(unsigned char *)(v20 + v34);
            *((void *)a2 + 1) = v19;
            v23 |= (unint64_t)(v35 & 0x7F) << v32;
            if ((v35 & 0x80) == 0) {
              break;
            }
            v32 += 7;
            BOOL v14 = v33++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              goto LABEL_59;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v23) = 0;
          }
LABEL_59:
          unint64_t v3 = v34 + 1;
        }
        else
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (1)
          {
            unint64_t v3 = v19 + 1;
            *((void *)a2 + 1) = v19 + 1;
            char v24 = *(unsigned char *)(v20 + v19);
            v23 |= (unint64_t)(v24 & 0x7F) << v21;
            if ((v24 & 0x80) == 0) {
              break;
            }
            v21 += 7;
            unint64_t v19 = v3;
            BOOL v14 = v22++ > 8;
            if (v14)
            {
              LODWORD(v23) = 0;
              break;
            }
          }
        }
LABEL_60:
        *((_DWORD *)this + 4) = v23;
      }
      else
      {
LABEL_30:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
        unint64_t v3 = *((void *)a2 + 1);
        unint64_t v2 = *((void *)a2 + 2);
      }
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v3 >= v2 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v3 > v2) {
      unint64_t v2 = v3;
    }
    while (v2 != v3)
    {
      unint64_t v17 = v3 + 1;
      char v18 = *(unsigned char *)(v8 + v3);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v3 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_30;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIMessageId::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  char v4 = *(unsigned char *)(this + 20);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v4 = *(unsigned char *)(v3 + 20);
  }
  if (v4)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

uint64_t telephonytransport::PCIMessageId::hash_value(telephonytransport::PCIMessageId *this)
{
  if ((*((unsigned char *)this + 20) & 2) != 0)
  {
    uint64_t v1 = *((unsigned int *)this + 4);
    if (*((unsigned char *)this + 20)) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v2 = 0;
    return v2 ^ v1;
  }
  uint64_t v1 = 0;
  if ((*((unsigned char *)this + 20) & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v2 = *((void *)this + 1);
  return v2 ^ v1;
}

void *telephonytransport::PCIReadIndication::PCIReadIndication(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF710;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF710;
  return this;
}

void telephonytransport::PCIReadIndication::~PCIReadIndication(telephonytransport::PCIReadIndication *this)
{
  *(void *)this = &unk_26C9AF710;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIReadIndication::~PCIReadIndication(this);

  operator delete(v1);
}

telephonytransport::PCIReadIndication *telephonytransport::PCIReadIndication::PCIReadIndication(telephonytransport::PCIReadIndication *this, const telephonytransport::PCIReadIndication *a2)
{
  *(void *)this = &unk_26C9AF710;
  *((void *)this + 1) = 0;
  char v4 = (void ***)((char *)this + 8);
  *((void *)this + 2) = 0;
  char v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 2);
  if (v5)
  {
    int v6 = operator new(0x18uLL);
    *((void *)this + 2) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  uint64_t v7 = (const PB::Data *)*((void *)a2 + 1);
  if (v7)
  {
    uint64_t v8 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v8, v7);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v8);
  }
  return this;
}

uint64_t telephonytransport::PCIReadIndication::operator=(uint64_t a1, const telephonytransport::PCIReadIndication *a2)
{
  if ((const telephonytransport::PCIReadIndication *)a1 != a2)
  {
    memset(v5, 170, sizeof(v5));
    telephonytransport::PCIReadIndication::PCIReadIndication((telephonytransport::PCIReadIndication *)v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v5[1];
    *(_OWORD *)&v5[1] = v3;
    telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadIndication *a2, telephonytransport::PCIReadIndication *a3)
{
  uint64_t v3 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  return this;
}

void *telephonytransport::PCIReadIndication::PCIReadIndication(void *a1, uint64_t a2)
{
  a1[1] = 0;
  uint64_t v4 = (void ***)(a1 + 1);
  *a1 = &unk_26C9AF710;
  a1[2] = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = a1[2];
  a1[2] = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *(void ***)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIReadIndication::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    memset(v5, 170, sizeof(v5));
    telephonytransport::PCIReadIndication::PCIReadIndication(v5, a2);
    long long v3 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v5[1];
    *(_OWORD *)&v5[1] = v3;
    telephonytransport::PCIReadIndication::~PCIReadIndication((telephonytransport::PCIReadIndication *)v5);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadIndication::formatText(telephonytransport::PCIReadIndication *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIReadIndication::readFrom(telephonytransport::PCIReadIndication *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    uint64_t v8 = (void ***)((char *)this + 8);
    while (1)
    {
      uint64_t v9 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        unint64_t v13 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v14 = *(unsigned char *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0) {
          break;
        }
        v10 += 7;
        unint64_t v2 = v13;
        BOOL v15 = v11++ > 8;
        if (v15) {
          goto LABEL_29;
        }
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v12 >> 3) == 2)
      {
        uint64_t v23 = (void **)operator new(0x10uLL);
        _DWORD *v23 = 0;
        v23[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v23);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v20 = operator new(0x18uLL);
        *(void *)uint64_t v20 = &unk_26C9AF6D8;
        v20[5] = 0;
        uint64_t v21 = *((void *)this + 2);
        *((void *)this + 2) = v20;
        if (v21)
        {
          (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
          uint64_t v20 = (_DWORD *)*((void *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v20 + 16))(v20, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_29:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v16 = 0;
    unsigned int v17 = 0;
    unint64_t v12 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v18 = v2 + 1;
      char v19 = *(unsigned char *)(v9 + v2);
      *((void *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0) {
        goto LABEL_21;
      }
      v16 += 7;
      unint64_t v2 = v18;
      BOOL v15 = v17++ > 8;
      if (v15) {
        goto LABEL_29;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadIndication::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(void *)(v3 + 8))
  {
    return MEMORY[0x270F58868](a2);
  }
  return this;
}

BOOL telephonytransport::PCIReadIndication::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if (*(void *)(a1 + 8))
  {
    if (!*(void *)(a2 + 8)) {
      return 0;
    }
    if (PB::Data::operator==()) {
      return 1;
    }
    if (*(void *)(a1 + 8)) {
      return 0;
    }
  }
  return *(void *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIReadIndication::hash_value(telephonytransport::PCIReadIndication *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v4 ^ v3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (*((void *)this + 1)) {
    uint64_t v6 = PBHashBytes();
  }
  else {
    uint64_t v6 = 0;
  }
  return v6 ^ v5;
}

void *telephonytransport::PCIReadIndication::makeMessageId(void *this)
{
  if (!this[2])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCICreateRequest::PCICreateRequest(uint64_t this)
{
  *(void *)this = &unk_26C9AF748;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 40) = 0;
  return this;
}

{
  *(void *)this = &unk_26C9AF748;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 40) = 0;
  return this;
}

void telephonytransport::PCICreateRequest::~PCICreateRequest(telephonytransport::PCICreateRequest *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF748;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCICreateRequest::~PCICreateRequest(this);

  operator delete(v1);
}

telephonytransport::PCICreateRequest *telephonytransport::PCICreateRequest::PCICreateRequest(telephonytransport::PCICreateRequest *this, const telephonytransport::PCICreateRequest *a2)
{
  *(void *)this = &unk_26C9AF748;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 10) = 0;
  uint64_t v4 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v4)
  {
    uint64_t v5 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v5, v4);
  }
  char v6 = *((unsigned char *)a2 + 40);
  if ((v6 & 0x10) != 0)
  {
    int v8 = *((_DWORD *)a2 + 8);
    char v7 = 16;
    *((unsigned char *)this + 40) = 16;
    *((_DWORD *)this + 8) = v8;
    char v6 = *((unsigned char *)a2 + 40);
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  char v7 = 0;
  if (*((unsigned char *)a2 + 40))
  {
LABEL_7:
    int v9 = *((_DWORD *)a2 + 4);
    v7 |= 1u;
    *((unsigned char *)this + 40) = v7;
    *((_DWORD *)this + 4) = v9;
    char v6 = *((unsigned char *)a2 + 40);
  }
LABEL_8:
  if ((v6 & 8) != 0)
  {
    int v12 = *((_DWORD *)a2 + 7);
    v7 |= 8u;
    *((unsigned char *)this + 40) = v7;
    *((_DWORD *)this + 7) = v12;
    char v6 = *((unsigned char *)a2 + 40);
    if ((v6 & 2) == 0)
    {
LABEL_10:
      if ((v6 & 4) == 0) {
        goto LABEL_11;
      }
LABEL_16:
      int v14 = *((_DWORD *)a2 + 6);
      v7 |= 4u;
      *((unsigned char *)this + 40) = v7;
      *((_DWORD *)this + 6) = v14;
      if ((*((unsigned char *)a2 + 40) & 0x20) == 0) {
        return this;
      }
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_10;
  }
  int v13 = *((_DWORD *)a2 + 5);
  v7 |= 2u;
  *((unsigned char *)this + 40) = v7;
  *((_DWORD *)this + 5) = v13;
  char v6 = *((unsigned char *)a2 + 40);
  if ((v6 & 4) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  if ((v6 & 0x20) != 0)
  {
LABEL_12:
    int v10 = *((_DWORD *)a2 + 9);
    *((unsigned char *)this + 40) = v7 | 0x20;
    *((_DWORD *)this + 9) = v10;
  }
  return this;
}

uint64_t telephonytransport::PCICreateRequest::operator=(uint64_t a1, const telephonytransport::PCICreateRequest *a2)
{
  if ((const telephonytransport::PCICreateRequest *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v3;
    long long v10 = v3;
    long long v8 = v3;
    telephonytransport::PCICreateRequest::PCICreateRequest((telephonytransport::PCICreateRequest *)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = DWORD2(v10);
    DWORD2(v10) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    long long v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v9;
    long long v9 = v6;
    *(void *)&long long v6 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = v10;
    *(void *)&long long v10 = v6;
    telephonytransport::PCICreateRequest::~PCICreateRequest((telephonytransport::PCICreateRequest *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCICreateRequest *a2, telephonytransport::PCICreateRequest *a3)
{
  int v3 = *(_DWORD *)(this + 40);
  *(_DWORD *)(this + 40) = *((_DWORD *)a2 + 10);
  *((_DWORD *)a2 + 10) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 32);
  *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 36);
  *(_DWORD *)(this + 36) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v4;
  return this;
}

uint64_t telephonytransport::PCICreateRequest::PCICreateRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF748;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a2 + 40) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  return a1;
}

uint64_t telephonytransport::PCICreateRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v3;
    long long v10 = v3;
    long long v8 = v3;
    telephonytransport::PCICreateRequest::PCICreateRequest((uint64_t)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)(a1 + 40) = DWORD2(v10);
    DWORD2(v10) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    long long v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 16) = v9;
    long long v9 = v6;
    *(void *)&long long v6 = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = v10;
    *(void *)&long long v10 = v6;
    telephonytransport::PCICreateRequest::~PCICreateRequest((telephonytransport::PCICreateRequest *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::PCICreateRequest::formatText(telephonytransport::PCICreateRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 40);
  if (v5)
  {
    PB::TextFormatter::format(a2, "createTimeOutMs");
    char v5 = *((unsigned char *)this + 40);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "flags");
  }
  uint64_t v6 = *((void *)this + 1);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "messageId");
  }
  char v7 = *((unsigned char *)this + 40);
  if ((v7 & 4) != 0)
  {
    PB::TextFormatter::format(a2, "numReadIO");
    char v7 = *((unsigned char *)this + 40);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)this + 40) & 8) == 0)
  {
    goto LABEL_9;
  }
  PB::TextFormatter::format(a2, "openRetryCount");
  char v7 = *((unsigned char *)this + 40);
  if ((v7 & 0x10) == 0)
  {
LABEL_10:
    if ((v7 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PB::TextFormatter::format(a2, "pciTransportInterface");
  if ((*((unsigned char *)this + 40) & 0x20) != 0) {
LABEL_11:
  }
    PB::TextFormatter::format(a2, "sizeReadIO");
LABEL_12:

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCICreateRequest::readFrom(telephonytransport::PCICreateRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        uint64_t v21 = operator new(0x18uLL);
        *(void *)uint64_t v21 = &unk_26C9AF6D8;
        void v21[5] = 0;
        uint64_t v22 = *((void *)this + 1);
        *((void *)this + 1) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
          uint64_t v21 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        unint64_t v2 = *((void *)a2 + 1);
        unint64_t v3 = *((void *)a2 + 2);
        int v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0) {
          return v4 == 0;
        }
        break;
      case 2u:
        *((unsigned char *)this + 40) |= 0x10u;
        unint64_t v23 = *((void *)a2 + 1);
        unint64_t v24 = *((void *)a2 + 2);
        uint64_t v25 = *(void *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          do
          {
            unint64_t v29 = v23 + 1;
            *((void *)a2 + 1) = v23 + 1;
            char v30 = *(unsigned char *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_124;
            }
            v26 += 7;
            unint64_t v23 = v29;
            BOOL v14 = v27++ > 8;
          }
          while (!v14);
LABEL_80:
          LODWORD(v28) = 0;
          goto LABEL_124;
        }
        char v71 = 0;
        unsigned int v72 = 0;
        uint64_t v28 = 0;
        if (v24 <= v23) {
          unint64_t v24 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v73 = v23 + 1;
            char v74 = *(unsigned char *)(v25 + v23);
            *((void *)a2 + 1) = v73;
            v28 |= (unint64_t)(v74 & 0x7F) << v71;
            if (v74 < 0)
            {
              v71 += 7;
              unint64_t v23 = v73;
              BOOL v14 = v72++ > 8;
              if (v14) {
                goto LABEL_80;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v28) = 0;
            }
          }
          break;
        }
LABEL_124:
        *((_DWORD *)this + 8) = v28;
        goto LABEL_20;
      case 3u:
        *((unsigned char *)this + 40) |= 1u;
        unint64_t v31 = *((void *)a2 + 1);
        unint64_t v32 = *((void *)a2 + 2);
        uint64_t v33 = *(void *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          do
          {
            unint64_t v37 = v31 + 1;
            *((void *)a2 + 1) = v31 + 1;
            char v38 = *(unsigned char *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0) {
              goto LABEL_127;
            }
            v34 += 7;
            unint64_t v31 = v37;
            BOOL v14 = v35++ > 8;
          }
          while (!v14);
LABEL_87:
          LODWORD(v36) = 0;
          goto LABEL_127;
        }
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v36 = 0;
        if (v32 <= v31) {
          unint64_t v32 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v32 == v31)
          {
            LODWORD(v36) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v77 = v31 + 1;
            char v78 = *(unsigned char *)(v33 + v31);
            *((void *)a2 + 1) = v77;
            v36 |= (unint64_t)(v78 & 0x7F) << v75;
            if (v78 < 0)
            {
              v75 += 7;
              unint64_t v31 = v77;
              BOOL v14 = v76++ > 8;
              if (v14) {
                goto LABEL_87;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v36) = 0;
            }
          }
          break;
        }
LABEL_127:
        *((_DWORD *)this + 4) = v36;
        goto LABEL_20;
      case 4u:
        *((unsigned char *)this + 40) |= 8u;
        unint64_t v39 = *((void *)a2 + 1);
        unint64_t v40 = *((void *)a2 + 2);
        uint64_t v41 = *(void *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          do
          {
            unint64_t v45 = v39 + 1;
            *((void *)a2 + 1) = v39 + 1;
            char v46 = *(unsigned char *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0) {
              goto LABEL_130;
            }
            v42 += 7;
            unint64_t v39 = v45;
            BOOL v14 = v43++ > 8;
          }
          while (!v14);
LABEL_94:
          LODWORD(v44) = 0;
          goto LABEL_130;
        }
        char v79 = 0;
        unsigned int v80 = 0;
        uint64_t v44 = 0;
        if (v40 <= v39) {
          unint64_t v40 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v40 == v39)
          {
            LODWORD(v44) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v81 = v39 + 1;
            char v82 = *(unsigned char *)(v41 + v39);
            *((void *)a2 + 1) = v81;
            v44 |= (unint64_t)(v82 & 0x7F) << v79;
            if (v82 < 0)
            {
              v79 += 7;
              unint64_t v39 = v81;
              BOOL v14 = v80++ > 8;
              if (v14) {
                goto LABEL_94;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v44) = 0;
            }
          }
          break;
        }
LABEL_130:
        *((_DWORD *)this + 7) = v44;
        goto LABEL_20;
      case 5u:
        *((unsigned char *)this + 40) |= 2u;
        unint64_t v47 = *((void *)a2 + 1);
        unint64_t v48 = *((void *)a2 + 2);
        uint64_t v49 = *(void *)a2;
        if (v47 <= 0xFFFFFFFFFFFFFFF5 && v47 + 10 <= v48)
        {
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0;
          do
          {
            unint64_t v53 = v47 + 1;
            *((void *)a2 + 1) = v47 + 1;
            char v54 = *(unsigned char *)(v49 + v47);
            v52 |= (unint64_t)(v54 & 0x7F) << v50;
            if ((v54 & 0x80) == 0) {
              goto LABEL_133;
            }
            v50 += 7;
            unint64_t v47 = v53;
            BOOL v14 = v51++ > 8;
          }
          while (!v14);
LABEL_101:
          LODWORD(v52) = 0;
          goto LABEL_133;
        }
        char v83 = 0;
        unsigned int v84 = 0;
        uint64_t v52 = 0;
        if (v48 <= v47) {
          unint64_t v48 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v48 == v47)
          {
            LODWORD(v52) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v85 = v47 + 1;
            char v86 = *(unsigned char *)(v49 + v47);
            *((void *)a2 + 1) = v85;
            v52 |= (unint64_t)(v86 & 0x7F) << v83;
            if (v86 < 0)
            {
              v83 += 7;
              unint64_t v47 = v85;
              BOOL v14 = v84++ > 8;
              if (v14) {
                goto LABEL_101;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v52) = 0;
            }
          }
          break;
        }
LABEL_133:
        *((_DWORD *)this + 5) = v52;
        goto LABEL_20;
      case 6u:
        *((unsigned char *)this + 40) |= 4u;
        unint64_t v55 = *((void *)a2 + 1);
        unint64_t v56 = *((void *)a2 + 2);
        uint64_t v57 = *(void *)a2;
        if (v55 <= 0xFFFFFFFFFFFFFFF5 && v55 + 10 <= v56)
        {
          char v58 = 0;
          unsigned int v59 = 0;
          uint64_t v60 = 0;
          do
          {
            unint64_t v61 = v55 + 1;
            *((void *)a2 + 1) = v55 + 1;
            char v62 = *(unsigned char *)(v57 + v55);
            v60 |= (unint64_t)(v62 & 0x7F) << v58;
            if ((v62 & 0x80) == 0) {
              goto LABEL_136;
            }
            v58 += 7;
            unint64_t v55 = v61;
            BOOL v14 = v59++ > 8;
          }
          while (!v14);
LABEL_108:
          LODWORD(v60) = 0;
          goto LABEL_136;
        }
        char v87 = 0;
        unsigned int v88 = 0;
        uint64_t v60 = 0;
        if (v56 <= v55) {
          unint64_t v56 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v56 == v55)
          {
            LODWORD(v60) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v89 = v55 + 1;
            char v90 = *(unsigned char *)(v57 + v55);
            *((void *)a2 + 1) = v89;
            v60 |= (unint64_t)(v90 & 0x7F) << v87;
            if (v90 < 0)
            {
              v87 += 7;
              unint64_t v55 = v89;
              BOOL v14 = v88++ > 8;
              if (v14) {
                goto LABEL_108;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v60) = 0;
            }
          }
          break;
        }
LABEL_136:
        *((_DWORD *)this + 6) = v60;
        goto LABEL_20;
      case 7u:
        *((unsigned char *)this + 40) |= 0x20u;
        unint64_t v63 = *((void *)a2 + 1);
        unint64_t v64 = *((void *)a2 + 2);
        uint64_t v65 = *(void *)a2;
        if (v63 <= 0xFFFFFFFFFFFFFFF5 && v63 + 10 <= v64)
        {
          char v66 = 0;
          unsigned int v67 = 0;
          uint64_t v68 = 0;
          do
          {
            unint64_t v69 = v63 + 1;
            *((void *)a2 + 1) = v63 + 1;
            char v70 = *(unsigned char *)(v65 + v63);
            v68 |= (unint64_t)(v70 & 0x7F) << v66;
            if ((v70 & 0x80) == 0) {
              goto LABEL_139;
            }
            v66 += 7;
            unint64_t v63 = v69;
            BOOL v14 = v67++ > 8;
          }
          while (!v14);
LABEL_115:
          LODWORD(v68) = 0;
          goto LABEL_139;
        }
        char v91 = 0;
        unsigned int v92 = 0;
        uint64_t v68 = 0;
        if (v64 <= v63) {
          unint64_t v64 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v64 == v63)
          {
            LODWORD(v68) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v93 = v63 + 1;
            char v94 = *(unsigned char *)(v65 + v63);
            *((void *)a2 + 1) = v93;
            v68 |= (unint64_t)(v94 & 0x7F) << v91;
            if (v94 < 0)
            {
              v91 += 7;
              unint64_t v63 = v93;
              BOOL v14 = v92++ > 8;
              if (v14) {
                goto LABEL_115;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v68) = 0;
            }
          }
          break;
        }
LABEL_139:
        *((_DWORD *)this + 9) = v68;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_25;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t telephonytransport::PCICreateRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  char v5 = *(unsigned char *)(v3 + 40);
  if ((v5 & 0x10) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v5 = *(unsigned char *)(v3 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)(v3 + 40) & 1) == 0)
  {
    goto LABEL_5;
  }
  this = PB::Writer::writeVarInt(a2);
  char v5 = *(unsigned char *)(v3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_12:
  this = PB::Writer::writeVarInt(a2);
  char v5 = *(unsigned char *)(v3 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
LABEL_14:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 40) & 0x20) == 0) {
      return this;
    }
    goto LABEL_15;
  }
LABEL_13:
  this = PB::Writer::writeVarInt(a2);
  char v5 = *(unsigned char *)(v3 + 40);
  if ((v5 & 4) != 0) {
    goto LABEL_14;
  }
LABEL_8:
  if ((v5 & 0x20) == 0) {
    return this;
  }
LABEL_15:

  return PB::Writer::writeVarInt(a2);
}

BOOL telephonytransport::PCICreateRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 40) & 0x10) != 0)
  {
    if ((*(unsigned char *)(a2 + 40) & 0x10) == 0 || *(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 40) & 0x10) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if ((*(unsigned char *)(a2 + 40) & 1) == 0 || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 40))
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 40) & 8) != 0)
  {
    if ((*(unsigned char *)(a2 + 40) & 8) == 0 || *(_DWORD *)(a1 + 28) != *(_DWORD *)(a2 + 28)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 40) & 8) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 40) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 40) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 40) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 40) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 40) & 4) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 40) & 4) != 0)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 40) & 0x20) == 0;
  if ((*(unsigned char *)(a1 + 40) & 0x20) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 40) & 0x20) != 0 && *(_DWORD *)(a1 + 36) == *(_DWORD *)(a2 + 36);
}

uint64_t telephonytransport::PCICreateRequest::hash_value(telephonytransport::PCICreateRequest *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if ((*((unsigned char *)this + 40) & 0x10) != 0)
  {
    uint64_t v5 = *((unsigned int *)this + 8);
    if (*((unsigned char *)this + 40))
    {
LABEL_9:
      uint64_t v6 = *((unsigned int *)this + 4);
      if ((*((unsigned char *)this + 40) & 8) != 0) {
        goto LABEL_10;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (*((unsigned char *)this + 40)) {
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
  if ((*((unsigned char *)this + 40) & 8) != 0)
  {
LABEL_10:
    uint64_t v7 = *((unsigned int *)this + 7);
    if ((*((unsigned char *)this + 40) & 2) != 0) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((*((unsigned char *)this + 40) & 2) != 0)
  {
LABEL_11:
    uint64_t v8 = *((unsigned int *)this + 5);
    if ((*((unsigned char *)this + 40) & 4) != 0) {
      goto LABEL_12;
    }
LABEL_18:
    uint64_t v9 = 0;
    if ((*((unsigned char *)this + 40) & 0x20) != 0) {
      goto LABEL_13;
    }
LABEL_19:
    uint64_t v10 = 0;
    return v5 ^ v1 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((*((unsigned char *)this + 40) & 4) == 0) {
    goto LABEL_18;
  }
LABEL_12:
  uint64_t v9 = *((unsigned int *)this + 6);
  if ((*((unsigned char *)this + 40) & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_13:
  uint64_t v10 = *((unsigned int *)this + 9);
  return v5 ^ v1 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

void *telephonytransport::PCICreateRequest::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void *telephonytransport::PCIReadResponse::PCIReadResponse(void *this)
{
  *this = &unk_26C9AF780;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

{
  *this = &unk_26C9AF780;
  this[1] = 0;
  this[2] = 0;
  this[3] = 0;
  return this;
}

void telephonytransport::PCIReadResponse::~PCIReadResponse(telephonytransport::PCIReadResponse *this)
{
  *(void *)this = &unk_26C9AF780;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIReadResponse::~PCIReadResponse(this);

  operator delete(v1);
}

telephonytransport::PCIReadResponse *telephonytransport::PCIReadResponse::PCIReadResponse(telephonytransport::PCIReadResponse *this, const telephonytransport::PCIReadResponse *a2)
{
  *(void *)this = &unk_26C9AF780;
  *((void *)this + 1) = 0;
  uint64_t v4 = (void ***)((char *)this + 8);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  uint64_t v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 2);
  if (v5)
  {
    uint64_t v6 = operator new(0x18uLL);
    *((void *)this + 2) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  if (*((unsigned char *)a2 + 28))
  {
    int v7 = *((_DWORD *)a2 + 6);
    *((unsigned char *)this + 28) = 1;
    *((_DWORD *)this + 6) = v7;
  }
  uint64_t v8 = (const PB::Data *)*((void *)a2 + 1);
  if (v8)
  {
    uint64_t v9 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v9, v8);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v9);
  }
  return this;
}

uint64_t telephonytransport::PCIReadResponse::operator=(uint64_t a1, const telephonytransport::PCIReadResponse *a2)
{
  if ((const telephonytransport::PCIReadResponse *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadResponse::PCIReadResponse((telephonytransport::PCIReadResponse *)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadResponse *a2, telephonytransport::PCIReadResponse *a3)
{
  int v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  uint64_t v4 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIReadResponse::PCIReadResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF780;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (void ***)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v7 = *(void ***)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIReadResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIReadResponse::PCIReadResponse((uint64_t)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIReadResponse::~PCIReadResponse((telephonytransport::PCIReadResponse *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadResponse::formatText(telephonytransport::PCIReadResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if (*((unsigned char *)this + 28)) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIReadResponse::readFrom(telephonytransport::PCIReadResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    uint64_t v8 = (void ***)((char *)this + 8);
    while (1)
    {
      uint64_t v9 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        unint64_t v13 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v14 = *(unsigned char *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0) {
          break;
        }
        v10 += 7;
        unint64_t v2 = v13;
        BOOL v15 = v11++ > 8;
        if (v15) {
          goto LABEL_20;
        }
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v25 = (void **)operator new(0x10uLL);
        void *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if (v22 == 2)
      {
        *((unsigned char *)this + 28) |= 1u;
        unint64_t v26 = *((void *)a2 + 1);
        unint64_t v27 = *((void *)a2 + 2);
        uint64_t v28 = *(void *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v31 = 0;
          if (v27 <= v26) {
            unint64_t v27 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_53;
            }
            unint64_t v36 = v26 + 1;
            char v37 = *(unsigned char *)(v28 + v26);
            *((void *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0) {
              break;
            }
            v34 += 7;
            unint64_t v26 = v36;
            BOOL v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v31) = 0;
          }
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            unint64_t v32 = v26 + 1;
            *((void *)a2 + 1) = v26 + 1;
            char v33 = *(unsigned char *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v26 = v32;
            BOOL v15 = v30++ > 8;
            if (v15) {
              goto LABEL_49;
            }
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if (v22 == 1)
      {
        unint64_t v23 = operator new(0x18uLL);
        *(void *)unint64_t v23 = &unk_26C9AF6D8;
        v23[5] = 0;
        uint64_t v24 = *((void *)this + 2);
        *((void *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
          unint64_t v23 = (_DWORD *)*((void *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v16 = 0;
    unsigned int v17 = 0;
    unint64_t v12 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v18 = v2 + 1;
      char v19 = *(unsigned char *)(v9 + v2);
      *((void *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0) {
        goto LABEL_26;
      }
      v16 += 7;
      unint64_t v2 = v18;
      BOOL v15 = v17++ > 8;
      if (v15) {
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 28)) {
    this = PB::Writer::writeVarInt(a2);
  }
  if (*(void *)(v3 + 8))
  {
    return MEMORY[0x270F58868](a2);
  }
  return this;
}

BOOL telephonytransport::PCIReadResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 28))
  {
    if ((*(unsigned char *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 28))
  {
    return 0;
  }
  if (*(void *)(a1 + 8))
  {
    if (!*(void *)(a2 + 8)) {
      return 0;
    }
    if (PB::Data::operator==()) {
      return 1;
    }
    if (*(void *)(a1 + 8)) {
      return 0;
    }
  }
  return *(void *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIReadResponse::hash_value(telephonytransport::PCIReadResponse *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v4 ^ v3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (*((unsigned char *)this + 28)) {
    uint64_t v6 = *((int *)this + 6);
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((void *)this + 1)) {
    uint64_t v7 = PBHashBytes();
  }
  else {
    uint64_t v7 = 0;
  }
  return v6 ^ v5 ^ v7;
}

void *telephonytransport::PCIReadResponse::makeMessageId(void *this)
{
  if (!this[2])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCISendImageRequest::PCISendImageRequest(uint64_t this)
{
  *(_DWORD *)(this + 28) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_26C9AF7B8;
  return this;
}

{
  *(_DWORD *)(this + 28) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_26C9AF7B8;
  return this;
}

void telephonytransport::PCISendImageRequest::~PCISendImageRequest(telephonytransport::PCISendImageRequest *this)
{
  *(void *)this = &unk_26C9AF7B8;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCISendImageRequest::~PCISendImageRequest(this);

  operator delete(v1);
}

telephonytransport::PCISendImageRequest *telephonytransport::PCISendImageRequest::PCISendImageRequest(telephonytransport::PCISendImageRequest *this, const telephonytransport::PCISendImageRequest *a2)
{
  *(void *)this = &unk_26C9AF7B8;
  *((void *)this + 1) = 0;
  uint64_t v4 = (void ***)((char *)this + 8);
  *((_DWORD *)this + 7) = 0;
  *((void *)this + 2) = 0;
  uint64_t v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 2);
  if (v5)
  {
    uint64_t v6 = operator new(0x18uLL);
    *((void *)this + 2) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  if (*((unsigned char *)a2 + 28))
  {
    int v7 = *((_DWORD *)a2 + 6);
    *((unsigned char *)this + 28) = 1;
    *((_DWORD *)this + 6) = v7;
  }
  uint64_t v8 = (const PB::Data *)*((void *)a2 + 1);
  if (v8)
  {
    uint64_t v9 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v9, v8);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v9);
  }
  return this;
}

uint64_t telephonytransport::PCISendImageRequest::operator=(uint64_t a1, const telephonytransport::PCISendImageRequest *a2)
{
  if ((const telephonytransport::PCISendImageRequest *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCISendImageRequest::PCISendImageRequest((telephonytransport::PCISendImageRequest *)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCISendImageRequest *a2, telephonytransport::PCISendImageRequest *a3)
{
  int v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  uint64_t v4 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCISendImageRequest::PCISendImageRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF7B8;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (void ***)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v7 = *(void ***)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCISendImageRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCISendImageRequest::PCISendImageRequest((uint64_t)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCISendImageRequest::~PCISendImageRequest((telephonytransport::PCISendImageRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCISendImageRequest::formatText(telephonytransport::PCISendImageRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if (*((unsigned char *)this + 28)) {
    PB::TextFormatter::format(a2, "timeoutMs");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCISendImageRequest::readFrom(telephonytransport::PCISendImageRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    uint64_t v8 = (void ***)((char *)this + 8);
    while (1)
    {
      uint64_t v9 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        unint64_t v13 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v14 = *(unsigned char *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0) {
          break;
        }
        v10 += 7;
        unint64_t v2 = v13;
        BOOL v15 = v11++ > 8;
        if (v15) {
          goto LABEL_20;
        }
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v25 = (void **)operator new(0x10uLL);
        void *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if (v22 == 2)
      {
        *((unsigned char *)this + 28) |= 1u;
        unint64_t v26 = *((void *)a2 + 1);
        unint64_t v27 = *((void *)a2 + 2);
        uint64_t v28 = *(void *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v31 = 0;
          if (v27 <= v26) {
            unint64_t v27 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_53;
            }
            unint64_t v36 = v26 + 1;
            char v37 = *(unsigned char *)(v28 + v26);
            *((void *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0) {
              break;
            }
            v34 += 7;
            unint64_t v26 = v36;
            BOOL v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v31) = 0;
          }
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            unint64_t v32 = v26 + 1;
            *((void *)a2 + 1) = v26 + 1;
            char v33 = *(unsigned char *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v26 = v32;
            BOOL v15 = v30++ > 8;
            if (v15) {
              goto LABEL_49;
            }
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if (v22 == 1)
      {
        unint64_t v23 = operator new(0x18uLL);
        *(void *)unint64_t v23 = &unk_26C9AF6D8;
        v23[5] = 0;
        uint64_t v24 = *((void *)this + 2);
        *((void *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
          unint64_t v23 = (_DWORD *)*((void *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v16 = 0;
    unsigned int v17 = 0;
    unint64_t v12 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v18 = v2 + 1;
      char v19 = *(unsigned char *)(v9 + v2);
      *((void *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0) {
        goto LABEL_26;
      }
      v16 += 7;
      unint64_t v2 = v18;
      BOOL v15 = v17++ > 8;
      if (v15) {
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCISendImageRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 28)) {
    this = PB::Writer::writeVarInt(a2);
  }
  if (*(void *)(v3 + 8))
  {
    return MEMORY[0x270F58868](a2);
  }
  return this;
}

BOOL telephonytransport::PCISendImageRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 28))
  {
    if ((*(unsigned char *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 28))
  {
    return 0;
  }
  if (*(void *)(a1 + 8))
  {
    if (!*(void *)(a2 + 8)) {
      return 0;
    }
    if (PB::Data::operator==()) {
      return 1;
    }
    if (*(void *)(a1 + 8)) {
      return 0;
    }
  }
  return *(void *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCISendImageRequest::hash_value(telephonytransport::PCISendImageRequest *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v4 ^ v3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (*((unsigned char *)this + 28)) {
    uint64_t v6 = *((unsigned int *)this + 6);
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((void *)this + 1)) {
    uint64_t v7 = PBHashBytes();
  }
  else {
    uint64_t v7 = 0;
  }
  return v6 ^ v5 ^ v7;
}

void *telephonytransport::PCISendImageRequest::makeMessageId(void *this)
{
  if (!this[2])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCICreateResponse::PCICreateResponse(uint64_t this)
{
  *(void *)this = &unk_26C9AF7F0;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_26C9AF7F0;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void telephonytransport::PCICreateResponse::~PCICreateResponse(telephonytransport::PCICreateResponse *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF7F0;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCICreateResponse::~PCICreateResponse(this);

  operator delete(v1);
}

telephonytransport::PCICreateResponse *telephonytransport::PCICreateResponse::PCICreateResponse(telephonytransport::PCICreateResponse *this, const telephonytransport::PCICreateResponse *a2)
{
  *(void *)this = &unk_26C9AF7F0;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  uint64_t v4 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v4)
  {
    uint64_t v5 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v5, v4);
  }
  if ((*((unsigned char *)a2 + 24) & 2) == 0)
  {
    char v6 = 1;
    if ((*((unsigned char *)a2 + 24) & 1) == 0) {
      return this;
    }
    goto LABEL_7;
  }
  int v7 = *((_DWORD *)a2 + 5);
  *((unsigned char *)this + 24) = 2;
  *((_DWORD *)this + 5) = v7;
  char v6 = 3;
  if (*((unsigned char *)a2 + 24))
  {
LABEL_7:
    int v8 = *((_DWORD *)a2 + 4);
    *((unsigned char *)this + 24) = v6;
    *((_DWORD *)this + 4) = v8;
  }
  return this;
}

uint64_t telephonytransport::PCICreateResponse::operator=(uint64_t a1, const telephonytransport::PCICreateResponse *a2)
{
  if ((const telephonytransport::PCICreateResponse *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v8 = v3;
    long long v9 = v3;
    telephonytransport::PCICreateResponse::PCICreateResponse((telephonytransport::PCICreateResponse *)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    uint64_t v6 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    *(void *)&long long v9 = v6;
    telephonytransport::PCICreateResponse::~PCICreateResponse((telephonytransport::PCICreateResponse *)&v8);
  }
  return a1;
}

double telephonytransport::swap(telephonytransport *this, telephonytransport::PCICreateResponse *a2, telephonytransport::PCICreateResponse *a3)
{
  int v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  double result = *((double *)a2 + 2);
  uint64_t v6 = *((void *)this + 2);
  *((double *)this + 2) = result;
  *((void *)a2 + 2) = v6;
  return result;
}

uint64_t telephonytransport::PCICreateResponse::PCICreateResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF7F0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCICreateResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v8 = v3;
    long long v9 = v3;
    telephonytransport::PCICreateResponse::PCICreateResponse((uint64_t)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    uint64_t v6 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    *(void *)&long long v9 = v6;
    telephonytransport::PCICreateResponse::~PCICreateResponse((telephonytransport::PCICreateResponse *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::PCICreateResponse::formatText(telephonytransport::PCICreateResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 24)) {
    PB::TextFormatter::format(a2, "createdTransportToken");
  }
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if ((*((unsigned char *)this + 24) & 2) != 0) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCICreateResponse::readFrom(telephonytransport::PCICreateResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_19;
        }
      }
LABEL_25:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v21 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v24 = *((void *)a2 + 1);
        unint64_t v25 = *((void *)a2 + 2);
        uint64_t v26 = *(void *)a2;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v29 = 0;
          if (v25 <= v24) {
            unint64_t v25 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_66;
            }
            unint64_t v42 = v24 + 1;
            char v43 = *(unsigned char *)(v26 + v24);
            *((void *)a2 + 1) = v42;
            v29 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0) {
              break;
            }
            v40 += 7;
            unint64_t v24 = v42;
            BOOL v14 = v41++ > 8;
            if (v14)
            {
LABEL_54:
              LODWORD(v29) = 0;
              goto LABEL_66;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v29) = 0;
          }
        }
        else
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (1)
          {
            unint64_t v30 = v24 + 1;
            *((void *)a2 + 1) = v24 + 1;
            char v31 = *(unsigned char *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0) {
              break;
            }
            v27 += 7;
            unint64_t v24 = v30;
            BOOL v14 = v28++ > 8;
            if (v14) {
              goto LABEL_54;
            }
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v29;
      }
      else if (v21 == 2)
      {
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v32 = *((void *)a2 + 1);
        unint64_t v33 = *((void *)a2 + 2);
        uint64_t v34 = *(void *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v33)
        {
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v37 = 0;
          if (v33 <= v32) {
            unint64_t v33 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v33 == v32)
            {
              LODWORD(v37) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_69;
            }
            unint64_t v46 = v32 + 1;
            char v47 = *(unsigned char *)(v34 + v32);
            *((void *)a2 + 1) = v46;
            v37 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0) {
              break;
            }
            v44 += 7;
            unint64_t v32 = v46;
            BOOL v14 = v45++ > 8;
            if (v14)
            {
LABEL_61:
              LODWORD(v37) = 0;
              goto LABEL_69;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v37) = 0;
          }
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            unint64_t v38 = v32 + 1;
            *((void *)a2 + 1) = v32 + 1;
            char v39 = *(unsigned char *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0) {
              break;
            }
            v35 += 7;
            unint64_t v32 = v38;
            BOOL v14 = v36++ > 8;
            if (v14) {
              goto LABEL_61;
            }
          }
        }
LABEL_69:
        *((_DWORD *)this + 5) = v37;
      }
      else if (v21 == 1)
      {
        unint64_t v22 = operator new(0x18uLL);
        *(void *)unint64_t v22 = &unk_26C9AF6D8;
        v22[5] = 0;
        uint64_t v23 = *((void *)this + 1);
        *((void *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
          unint64_t v22 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_19:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_25;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCICreateResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  char v5 = *(unsigned char *)(v3 + 24);
  if ((v5 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v5 = *(unsigned char *)(v3 + 24);
  }
  if (v5)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL telephonytransport::PCICreateResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 24) & 1) == 0;
  if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 24) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCICreateResponse::hash_value(telephonytransport::PCICreateResponse *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if ((*((unsigned char *)this + 24) & 2) != 0)
  {
    uint64_t v5 = *((int *)this + 5);
    if (*((unsigned char *)this + 24)) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v5 ^ v1 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*((unsigned char *)this + 24) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6;
}

void *telephonytransport::PCICreateResponse::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRequest::PCIReadRequest(uint64_t this)
{
  *(void *)this = &unk_26C9AF828;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_26C9AF828;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void telephonytransport::PCIReadRequest::~PCIReadRequest(telephonytransport::PCIReadRequest *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF828;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIReadRequest::~PCIReadRequest(this);

  operator delete(v1);
}

telephonytransport::PCIReadRequest *telephonytransport::PCIReadRequest::PCIReadRequest(telephonytransport::PCIReadRequest *this, const telephonytransport::PCIReadRequest *a2)
{
  *(void *)this = &unk_26C9AF828;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 6) = 0;
  uint64_t v4 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v4)
  {
    uint64_t v5 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v5, v4);
  }
  if ((*((unsigned char *)a2 + 24) & 2) == 0)
  {
    char v6 = 1;
    if ((*((unsigned char *)a2 + 24) & 1) == 0) {
      return this;
    }
    goto LABEL_7;
  }
  int v7 = *((_DWORD *)a2 + 5);
  *((unsigned char *)this + 24) = 2;
  *((_DWORD *)this + 5) = v7;
  char v6 = 3;
  if (*((unsigned char *)a2 + 24))
  {
LABEL_7:
    int v8 = *((_DWORD *)a2 + 4);
    *((unsigned char *)this + 24) = v6;
    *((_DWORD *)this + 4) = v8;
  }
  return this;
}

uint64_t telephonytransport::PCIReadRequest::operator=(uint64_t a1, const telephonytransport::PCIReadRequest *a2)
{
  if ((const telephonytransport::PCIReadRequest *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v8 = v3;
    long long v9 = v3;
    telephonytransport::PCIReadRequest::PCIReadRequest((telephonytransport::PCIReadRequest *)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    uint64_t v6 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    *(void *)&long long v9 = v6;
    telephonytransport::PCIReadRequest::~PCIReadRequest((telephonytransport::PCIReadRequest *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIReadRequest *a2, telephonytransport::PCIReadRequest *a3)
{
  int v3 = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIReadRequest::PCIReadRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF828;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIReadRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v8 = v3;
    long long v9 = v3;
    telephonytransport::PCIReadRequest::PCIReadRequest((uint64_t)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    uint64_t v6 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    *(void *)&long long v9 = v6;
    telephonytransport::PCIReadRequest::~PCIReadRequest((telephonytransport::PCIReadRequest *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIReadRequest::formatText(telephonytransport::PCIReadRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 24)) {
    PB::TextFormatter::format(a2, "bytesToRead");
  }
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if ((*((unsigned char *)this + 24) & 2) != 0) {
    PB::TextFormatter::format(a2, "timeoutMs");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIReadRequest::readFrom(telephonytransport::PCIReadRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_19;
        }
      }
LABEL_25:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v21 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v24 = *((void *)a2 + 1);
        unint64_t v25 = *((void *)a2 + 2);
        uint64_t v26 = *(void *)a2;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v29 = 0;
          if (v25 <= v24) {
            unint64_t v25 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_66;
            }
            unint64_t v42 = v24 + 1;
            char v43 = *(unsigned char *)(v26 + v24);
            *((void *)a2 + 1) = v42;
            v29 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0) {
              break;
            }
            v40 += 7;
            unint64_t v24 = v42;
            BOOL v14 = v41++ > 8;
            if (v14)
            {
LABEL_54:
              LODWORD(v29) = 0;
              goto LABEL_66;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v29) = 0;
          }
        }
        else
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (1)
          {
            unint64_t v30 = v24 + 1;
            *((void *)a2 + 1) = v24 + 1;
            char v31 = *(unsigned char *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0) {
              break;
            }
            v27 += 7;
            unint64_t v24 = v30;
            BOOL v14 = v28++ > 8;
            if (v14) {
              goto LABEL_54;
            }
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v29;
      }
      else if (v21 == 2)
      {
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v32 = *((void *)a2 + 1);
        unint64_t v33 = *((void *)a2 + 2);
        uint64_t v34 = *(void *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v33)
        {
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v37 = 0;
          if (v33 <= v32) {
            unint64_t v33 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v33 == v32)
            {
              LODWORD(v37) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_69;
            }
            unint64_t v46 = v32 + 1;
            char v47 = *(unsigned char *)(v34 + v32);
            *((void *)a2 + 1) = v46;
            v37 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0) {
              break;
            }
            v44 += 7;
            unint64_t v32 = v46;
            BOOL v14 = v45++ > 8;
            if (v14)
            {
LABEL_61:
              LODWORD(v37) = 0;
              goto LABEL_69;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v37) = 0;
          }
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            unint64_t v38 = v32 + 1;
            *((void *)a2 + 1) = v32 + 1;
            char v39 = *(unsigned char *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0) {
              break;
            }
            v35 += 7;
            unint64_t v32 = v38;
            BOOL v14 = v36++ > 8;
            if (v14) {
              goto LABEL_61;
            }
          }
        }
LABEL_69:
        *((_DWORD *)this + 5) = v37;
      }
      else if (v21 == 1)
      {
        unint64_t v22 = operator new(0x18uLL);
        *(void *)unint64_t v22 = &unk_26C9AF6D8;
        v22[5] = 0;
        uint64_t v23 = *((void *)this + 1);
        *((void *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
          unint64_t v22 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_19:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_25;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIReadRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  char v5 = *(unsigned char *)(v3 + 24);
  if ((v5 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v5 = *(unsigned char *)(v3 + 24);
  }
  if (v5)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL telephonytransport::PCIReadRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 24) & 1) == 0;
  if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 24) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIReadRequest::hash_value(telephonytransport::PCIReadRequest *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if ((*((unsigned char *)this + 24) & 2) != 0)
  {
    uint64_t v5 = *((unsigned int *)this + 5);
    if (*((unsigned char *)this + 24)) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v5 ^ v1 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*((unsigned char *)this + 24) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6;
}

void *telephonytransport::PCIReadRequest::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void *telephonytransport::PCIFreeResponse::PCIFreeResponse(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF860;
  return this;
}

{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C9AF860;
  return this;
}

void telephonytransport::PCIFreeResponse::~PCIFreeResponse(telephonytransport::PCIFreeResponse *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF860;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIFreeResponse::~PCIFreeResponse(this);

  operator delete(v1);
}

telephonytransport::PCIFreeResponse *telephonytransport::PCIFreeResponse::PCIFreeResponse(telephonytransport::PCIFreeResponse *this, const telephonytransport::PCIFreeResponse *a2)
{
  *(void *)this = &unk_26C9AF860;
  *((void *)this + 1) = 0;
  uint64_t v4 = (uint64_t *)((char *)this + 8);
  *((void *)this + 2) = 0;
  uint64_t v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v5)
  {
    uint64_t v6 = operator new(0x18uLL);
    uint64_t *v4 = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  if (*((unsigned char *)a2 + 20))
  {
    int v7 = *((_DWORD *)a2 + 4);
    *((unsigned char *)this + 20) = 1;
    *((_DWORD *)this + 4) = v7;
  }
  return this;
}

uint64_t telephonytransport::PCIFreeResponse::operator=(uint64_t a1, const telephonytransport::PCIFreeResponse *a2)
{
  if ((const telephonytransport::PCIFreeResponse *)a1 != a2)
  {
    memset(v6, 170, sizeof(v6));
    telephonytransport::PCIFreeResponse::PCIFreeResponse((telephonytransport::PCIFreeResponse *)v6, a2);
    uint64_t v3 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v6[1];
    v6[1] = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 16);
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v6[2];
    void v6[2] = __PAIR64__(v4, v3);
    telephonytransport::PCIFreeResponse::~PCIFreeResponse((telephonytransport::PCIFreeResponse *)v6);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFreeResponse *a2, telephonytransport::PCIFreeResponse *a3)
{
  int v3 = *(_DWORD *)(this + 20);
  *(_DWORD *)(this + 20) = *((_DWORD *)a2 + 5);
  *((_DWORD *)a2 + 5) = v3;
  uint64_t v4 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 16);
  *(_DWORD *)(this + 16) = *((_DWORD *)a2 + 4);
  *((_DWORD *)a2 + 4) = v4;
  return this;
}

uint64_t telephonytransport::PCIFreeResponse::PCIFreeResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF860;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a2 + 20) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIFreeResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    memset(v6, 170, sizeof(v6));
    telephonytransport::PCIFreeResponse::PCIFreeResponse((uint64_t)v6, a2);
    uint64_t v3 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v6[1];
    v6[1] = v3;
    LODWORD(v3) = *(_DWORD *)(a1 + 16);
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    *(void *)(a1 + 16) = v6[2];
    void v6[2] = __PAIR64__(v4, v3);
    telephonytransport::PCIFreeResponse::~PCIFreeResponse((telephonytransport::PCIFreeResponse *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIFreeResponse::formatText(telephonytransport::PCIFreeResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if (*((unsigned char *)this + 20)) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIFreeResponse::readFrom(telephonytransport::PCIFreeResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_28;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((unsigned char *)this + 20) |= 1u;
        unint64_t v22 = *((void *)a2 + 1);
        unint64_t v23 = *((void *)a2 + 2);
        uint64_t v24 = *(void *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v23)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v27 = 0;
          if (v23 <= v22) {
            unint64_t v23 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v23 == v22)
            {
              LODWORD(v27) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_47;
            }
            unint64_t v32 = v22 + 1;
            char v33 = *(unsigned char *)(v24 + v22);
            *((void *)a2 + 1) = v32;
            v27 |= (unint64_t)(v33 & 0x7F) << v30;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v30 += 7;
            unint64_t v22 = v32;
            BOOL v14 = v31++ > 8;
            if (v14)
            {
LABEL_43:
              LODWORD(v27) = 0;
              goto LABEL_47;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v27) = 0;
          }
        }
        else
        {
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (1)
          {
            unint64_t v28 = v22 + 1;
            *((void *)a2 + 1) = v22 + 1;
            char v29 = *(unsigned char *)(v24 + v22);
            v27 |= (unint64_t)(v29 & 0x7F) << v25;
            if ((v29 & 0x80) == 0) {
              break;
            }
            v25 += 7;
            unint64_t v22 = v28;
            BOOL v14 = v26++ > 8;
            if (v14) {
              goto LABEL_43;
            }
          }
        }
LABEL_47:
        *((_DWORD *)this + 4) = v27;
      }
      else if ((v11 >> 3) == 1)
      {
        char v19 = operator new(0x18uLL);
        *(void *)char v19 = &unk_26C9AF6D8;
        v19[5] = 0;
        uint64_t v20 = *((void *)this + 1);
        *((void *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
          char v19 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_28:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_28;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIFreeResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 20))
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL telephonytransport::PCIFreeResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 20) & 1) == 0;
  if ((*(unsigned char *)(a1 + 20) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 20) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIFreeResponse::hash_value(telephonytransport::PCIFreeResponse *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if (*((unsigned char *)this + 20)) {
    uint64_t v5 = *((int *)this + 4);
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v1;
}

void *telephonytransport::PCIFreeResponse::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIWriteRequest::PCIWriteRequest(uint64_t this)
{
  *(_DWORD *)(this + 28) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_26C9AF898;
  return this;
}

{
  *(_DWORD *)(this + 28) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = &unk_26C9AF898;
  return this;
}

void telephonytransport::PCIWriteRequest::~PCIWriteRequest(telephonytransport::PCIWriteRequest *this)
{
  *(void *)this = &unk_26C9AF898;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::unique_ptr<PB::Data>::reset[abi:ne180100]((void ***)this + 1, 0);

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIWriteRequest::~PCIWriteRequest(this);

  operator delete(v1);
}

telephonytransport::PCIWriteRequest *telephonytransport::PCIWriteRequest::PCIWriteRequest(telephonytransport::PCIWriteRequest *this, const telephonytransport::PCIWriteRequest *a2)
{
  *(void *)this = &unk_26C9AF898;
  *((void *)this + 1) = 0;
  uint64_t v4 = (void ***)((char *)this + 8);
  *((_DWORD *)this + 7) = 0;
  *((void *)this + 2) = 0;
  uint64_t v5 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 2);
  if (v5)
  {
    uint64_t v6 = operator new(0x18uLL);
    *((void *)this + 2) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v6, v5);
  }
  if (*((unsigned char *)a2 + 28))
  {
    int v7 = *((_DWORD *)a2 + 6);
    *((unsigned char *)this + 28) = 1;
    *((_DWORD *)this + 6) = v7;
  }
  uint64_t v8 = (const PB::Data *)*((void *)a2 + 1);
  if (v8)
  {
    char v9 = (PB::Data *)operator new(0x10uLL);
    PB::Data::Data(v9, v8);
    std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, (void **)v9);
  }
  return this;
}

uint64_t telephonytransport::PCIWriteRequest::operator=(uint64_t a1, const telephonytransport::PCIWriteRequest *a2)
{
  if ((const telephonytransport::PCIWriteRequest *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIWriteRequest::PCIWriteRequest((telephonytransport::PCIWriteRequest *)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIWriteRequest *a2, telephonytransport::PCIWriteRequest *a3)
{
  int v3 = *(_DWORD *)(this + 28);
  *(_DWORD *)(this + 28) = *((_DWORD *)a2 + 7);
  *((_DWORD *)a2 + 7) = v3;
  uint64_t v4 = *(void *)(this + 16);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  LODWORD(v4) = *(_DWORD *)(this + 24);
  *(_DWORD *)(this + 24) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v4;
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  return this;
}

uint64_t telephonytransport::PCIWriteRequest::PCIWriteRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF898;
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (void ***)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a2 + 28) = 0;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 16) = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  int v7 = *(void ***)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  std::unique_ptr<PB::Data>::reset[abi:ne180100](v4, v7);
  return a1;
}

uint64_t telephonytransport::PCIWriteRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIWriteRequest::PCIWriteRequest((uint64_t)v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    int v5 = *(_DWORD *)(a1 + 28);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(_DWORD *)&v8[24] = v4;
    *(_DWORD *)&v8[28] = v5;
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIWriteRequest::~PCIWriteRequest((telephonytransport::PCIWriteRequest *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIWriteRequest::formatText(telephonytransport::PCIWriteRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((void *)this + 1)) {
    PB::TextFormatter::format();
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if (*((unsigned char *)this + 28)) {
    PB::TextFormatter::format(a2, "timeoutMs");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIWriteRequest::readFrom(telephonytransport::PCIWriteRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    uint64_t v8 = (void ***)((char *)this + 8);
    while (1)
    {
      uint64_t v9 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        unint64_t v13 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v14 = *(unsigned char *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0) {
          break;
        }
        v10 += 7;
        unint64_t v2 = v13;
        BOOL v15 = v11++ > 8;
        if (v15) {
          goto LABEL_20;
        }
      }
LABEL_26:
      if ((v12 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v22 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        char v25 = (void **)operator new(0x10uLL);
        void *v25 = 0;
        v25[1] = 0;
        std::unique_ptr<PB::Data>::reset[abi:ne180100](v8, v25);
        PB::Reader::read(a2, (PB::Data *)*v8);
      }
      else if (v22 == 2)
      {
        *((unsigned char *)this + 28) |= 1u;
        unint64_t v26 = *((void *)a2 + 1);
        unint64_t v27 = *((void *)a2 + 2);
        uint64_t v28 = *(void *)a2;
        if (v26 > 0xFFFFFFFFFFFFFFF5 || v26 + 10 > v27)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v31 = 0;
          if (v27 <= v26) {
            unint64_t v27 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v27 == v26)
            {
              LODWORD(v31) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_53;
            }
            unint64_t v36 = v26 + 1;
            char v37 = *(unsigned char *)(v28 + v26);
            *((void *)a2 + 1) = v36;
            v31 |= (unint64_t)(v37 & 0x7F) << v34;
            if ((v37 & 0x80) == 0) {
              break;
            }
            v34 += 7;
            unint64_t v26 = v36;
            BOOL v15 = v35++ > 8;
            if (v15)
            {
LABEL_49:
              LODWORD(v31) = 0;
              goto LABEL_53;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v31) = 0;
          }
        }
        else
        {
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (1)
          {
            unint64_t v32 = v26 + 1;
            *((void *)a2 + 1) = v26 + 1;
            char v33 = *(unsigned char *)(v28 + v26);
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if ((v33 & 0x80) == 0) {
              break;
            }
            v29 += 7;
            unint64_t v26 = v32;
            BOOL v15 = v30++ > 8;
            if (v15) {
              goto LABEL_49;
            }
          }
        }
LABEL_53:
        *((_DWORD *)this + 6) = v31;
      }
      else if (v22 == 1)
      {
        unint64_t v23 = operator new(0x18uLL);
        *(void *)unint64_t v23 = &unk_26C9AF6D8;
        v23[5] = 0;
        uint64_t v24 = *((void *)this + 2);
        *((void *)this + 2) = v23;
        if (v24)
        {
          (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
          unint64_t v23 = (_DWORD *)*((void *)this + 2);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v23 + 16))(v23, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_20:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v16 = 0;
    unsigned int v17 = 0;
    unint64_t v12 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v18 = v2 + 1;
      char v19 = *(unsigned char *)(v9 + v2);
      *((void *)a2 + 1) = v18;
      v12 |= (unint64_t)(v19 & 0x7F) << v16;
      if ((v19 & 0x80) == 0) {
        goto LABEL_26;
      }
      v16 += 7;
      unint64_t v2 = v18;
      BOOL v15 = v17++ > 8;
      if (v15) {
        goto LABEL_20;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIWriteRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 16);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  if (*(unsigned char *)(v3 + 28)) {
    this = PB::Writer::writeVarInt(a2);
  }
  if (*(void *)(v3 + 8))
  {
    return MEMORY[0x270F58868](a2);
  }
  return this;
}

BOOL telephonytransport::PCIWriteRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a2 + 16);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 28))
  {
    if ((*(unsigned char *)(a2 + 28) & 1) == 0 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 28))
  {
    return 0;
  }
  if (*(void *)(a1 + 8))
  {
    if (!*(void *)(a2 + 8)) {
      return 0;
    }
    if (PB::Data::operator==()) {
      return 1;
    }
    if (*(void *)(a1 + 8)) {
      return 0;
    }
  }
  return *(void *)(a2 + 8) == 0;
}

uint64_t telephonytransport::PCIWriteRequest::hash_value(telephonytransport::PCIWriteRequest *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v5 = v4 ^ v3;
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (*((unsigned char *)this + 28)) {
    uint64_t v6 = *((unsigned int *)this + 6);
  }
  else {
    uint64_t v6 = 0;
  }
  if (*((void *)this + 1)) {
    uint64_t v7 = PBHashBytes();
  }
  else {
    uint64_t v7 = 0;
  }
  return v6 ^ v5 ^ v7;
}

void *telephonytransport::PCIWriteRequest::makeMessageId(void *this)
{
  if (!this[2])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[2] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIStatusIndication::PCIStatusIndication(uint64_t this)
{
  *(void *)this = &unk_26C9AF8D0;
  *(void *)(this + 24) = 0;
  *(_DWORD *)(this + 36) = 0;
  return this;
}

{
  *(void *)this = &unk_26C9AF8D0;
  *(void *)(this + 24) = 0;
  *(_DWORD *)(this + 36) = 0;
  return this;
}

void telephonytransport::PCIStatusIndication::~PCIStatusIndication(telephonytransport::PCIStatusIndication *this)
{
  *(void *)this = &unk_26C9AF8D0;
  uint64_t v2 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIStatusIndication::~PCIStatusIndication(this);

  operator delete(v1);
}

telephonytransport::PCIStatusIndication *telephonytransport::PCIStatusIndication::PCIStatusIndication(telephonytransport::PCIStatusIndication *this, const telephonytransport::PCIStatusIndication *a2)
{
  *(void *)this = &unk_26C9AF8D0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 9) = 0;
  uint64_t v4 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 3);
  if (v4)
  {
    uint64_t v5 = operator new(0x18uLL);
    *((void *)this + 3) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v5, v4);
  }
  char v6 = *((unsigned char *)a2 + 36);
  if ((v6 & 4) != 0)
  {
    int v8 = *((_DWORD *)a2 + 8);
    char v7 = 4;
    *((unsigned char *)this + 36) = 4;
    *((_DWORD *)this + 8) = v8;
    char v6 = *((unsigned char *)a2 + 36);
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  char v7 = 0;
  if (*((unsigned char *)a2 + 36))
  {
LABEL_7:
    uint64_t v9 = *((void *)a2 + 1);
    v7 |= 1u;
    *((unsigned char *)this + 36) = v7;
    *((void *)this + 1) = v9;
    char v6 = *((unsigned char *)a2 + 36);
  }
LABEL_8:
  if ((v6 & 2) != 0)
  {
    uint64_t v10 = *((void *)a2 + 2);
    *((unsigned char *)this + 36) = v7 | 2;
    *((void *)this + 2) = v10;
  }
  return this;
}

uint64_t telephonytransport::PCIStatusIndication::operator=(uint64_t a1, const telephonytransport::PCIStatusIndication *a2)
{
  if ((const telephonytransport::PCIStatusIndication *)a1 != a2)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)int v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIStatusIndication::PCIStatusIndication((telephonytransport::PCIStatusIndication *)v8, a2);
    uint64_t v4 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(void *)&v8[24] = v4;
    LODWORD(v4) = *(_DWORD *)(a1 + 32);
    unsigned int v5 = *(_DWORD *)(a1 + 36);
    *(void *)(a1 + 32) = v9;
    unint64_t v9 = __PAIR64__(v5, v4);
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIStatusIndication::~PCIStatusIndication((telephonytransport::PCIStatusIndication *)v8);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIStatusIndication *a2, telephonytransport::PCIStatusIndication *a3)
{
  int v3 = *(_DWORD *)(this + 36);
  *(_DWORD *)(this + 36) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a2 + 9) = v3;
  int v4 = *(_DWORD *)(this + 32);
  *(_DWORD *)(this + 32) = *((_DWORD *)a2 + 8);
  uint64_t v5 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  uint64_t v7 = *(void *)(this + 16);
  uint64_t v6 = *(void *)(this + 24);
  uint64_t v8 = *((void *)a2 + 3);
  *(void *)(this + 16) = *((void *)a2 + 2);
  *(void *)(this + 24) = v8;
  *((_DWORD *)a2 + 8) = v4;
  *((void *)a2 + 2) = v7;
  *((void *)a2 + 3) = v6;
  return this;
}

uint64_t telephonytransport::PCIStatusIndication::PCIStatusIndication(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF8D0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a2 + 36) = 0;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a2 + 24) = 0;
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIStatusIndication::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v8 = v3;
    *(_OWORD *)&v8[16] = v3;
    telephonytransport::PCIStatusIndication::PCIStatusIndication((uint64_t)v8, a2);
    uint64_t v4 = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = *(void *)&v8[24];
    *(void *)&v8[24] = v4;
    LODWORD(v4) = *(_DWORD *)(a1 + 32);
    unsigned int v5 = *(_DWORD *)(a1 + 36);
    *(void *)(a1 + 32) = v9;
    unint64_t v9 = __PAIR64__(v5, v4);
    long long v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)&v8[8];
    *(_OWORD *)&v8[8] = v6;
    telephonytransport::PCIStatusIndication::~PCIStatusIndication((telephonytransport::PCIStatusIndication *)v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIStatusIndication::formatText(telephonytransport::PCIStatusIndication *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  char v5 = *((unsigned char *)this + 36);
  if (v5)
  {
    PB::TextFormatter::format(a2, "arg1");
    char v5 = *((unsigned char *)this + 36);
  }
  if ((v5 & 2) != 0) {
    PB::TextFormatter::format(a2, "arg2");
  }
  uint64_t v6 = *((void *)this + 3);
  if (v6) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v6 + 32))(v6, a2, "messageId");
  }
  if ((*((unsigned char *)this + 36) & 4) != 0) {
    PB::TextFormatter::format(a2, "status");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIStatusIndication::readFrom(telephonytransport::PCIStatusIndication *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0) {
    return v4 == 0;
  }
  while (1)
  {
    uint64_t v8 = *(void *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
      break;
    }
    char v9 = 0;
    unsigned int v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v2 + 1;
      *((void *)a2 + 1) = v2 + 1;
      char v13 = *(unsigned char *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v12;
      BOOL v14 = v10++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
LABEL_25:
    if ((v11 & 7) == 4)
    {
      int v4 = 0;
      return v4 == 0;
    }
    switch((v11 >> 3))
    {
      case 1u:
        unint64_t v21 = operator new(0x18uLL);
        *(void *)unint64_t v21 = &unk_26C9AF6D8;
        void v21[5] = 0;
        uint64_t v22 = *((void *)this + 3);
        *((void *)this + 3) = v21;
        if (v22)
        {
          (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
          unint64_t v21 = (_DWORD *)*((void *)this + 3);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v21 + 16))(v21, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
LABEL_20:
        unint64_t v2 = *((void *)a2 + 1);
        unint64_t v3 = *((void *)a2 + 2);
        int v4 = *((unsigned __int8 *)a2 + 24);
        if (v2 >= v3 || v4 != 0) {
          return v4 == 0;
        }
        break;
      case 2u:
        *((unsigned char *)this + 36) |= 4u;
        unint64_t v23 = *((void *)a2 + 1);
        unint64_t v24 = *((void *)a2 + 2);
        uint64_t v25 = *(void *)a2;
        if (v23 <= 0xFFFFFFFFFFFFFFF5 && v23 + 10 <= v24)
        {
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          do
          {
            unint64_t v29 = v23 + 1;
            *((void *)a2 + 1) = v23 + 1;
            char v30 = *(unsigned char *)(v25 + v23);
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if ((v30 & 0x80) == 0) {
              goto LABEL_79;
            }
            v26 += 7;
            unint64_t v23 = v29;
            BOOL v14 = v27++ > 8;
          }
          while (!v14);
LABEL_59:
          LODWORD(v28) = 0;
          goto LABEL_79;
        }
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v28 = 0;
        if (v24 <= v23) {
          unint64_t v24 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v24 == v23)
          {
            LODWORD(v28) = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v49 = v23 + 1;
            char v50 = *(unsigned char *)(v25 + v23);
            *((void *)a2 + 1) = v49;
            v28 |= (unint64_t)(v50 & 0x7F) << v47;
            if (v50 < 0)
            {
              v47 += 7;
              unint64_t v23 = v49;
              BOOL v14 = v48++ > 8;
              if (v14) {
                goto LABEL_59;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              LODWORD(v28) = 0;
            }
          }
          break;
        }
LABEL_79:
        *((_DWORD *)this + 8) = v28;
        goto LABEL_20;
      case 3u:
        *((unsigned char *)this + 36) |= 1u;
        unint64_t v31 = *((void *)a2 + 1);
        unint64_t v32 = *((void *)a2 + 2);
        uint64_t v33 = *(void *)a2;
        if (v31 <= 0xFFFFFFFFFFFFFFF5 && v31 + 10 <= v32)
        {
          char v34 = 0;
          unsigned int v35 = 0;
          uint64_t v36 = 0;
          do
          {
            unint64_t v37 = v31 + 1;
            *((void *)a2 + 1) = v31 + 1;
            char v38 = *(unsigned char *)(v33 + v31);
            v36 |= (unint64_t)(v38 & 0x7F) << v34;
            if ((v38 & 0x80) == 0) {
              goto LABEL_82;
            }
            v34 += 7;
            unint64_t v31 = v37;
            BOOL v14 = v35++ > 8;
          }
          while (!v14);
LABEL_66:
          uint64_t v36 = 0;
          goto LABEL_82;
        }
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v36 = 0;
        if (v32 <= v31) {
          unint64_t v32 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v32 == v31)
          {
            uint64_t v36 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v53 = v31 + 1;
            char v54 = *(unsigned char *)(v33 + v31);
            *((void *)a2 + 1) = v53;
            v36 |= (unint64_t)(v54 & 0x7F) << v51;
            if (v54 < 0)
            {
              v51 += 7;
              unint64_t v31 = v53;
              BOOL v14 = v52++ > 8;
              if (v14) {
                goto LABEL_66;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v36 = 0;
            }
          }
          break;
        }
LABEL_82:
        *((void *)this + 1) = v36;
        goto LABEL_20;
      case 4u:
        *((unsigned char *)this + 36) |= 2u;
        unint64_t v39 = *((void *)a2 + 1);
        unint64_t v40 = *((void *)a2 + 2);
        uint64_t v41 = *(void *)a2;
        if (v39 <= 0xFFFFFFFFFFFFFFF5 && v39 + 10 <= v40)
        {
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          do
          {
            unint64_t v45 = v39 + 1;
            *((void *)a2 + 1) = v39 + 1;
            char v46 = *(unsigned char *)(v41 + v39);
            v44 |= (unint64_t)(v46 & 0x7F) << v42;
            if ((v46 & 0x80) == 0) {
              goto LABEL_85;
            }
            v42 += 7;
            unint64_t v39 = v45;
            BOOL v14 = v43++ > 8;
          }
          while (!v14);
LABEL_73:
          uint64_t v44 = 0;
          goto LABEL_85;
        }
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v44 = 0;
        if (v40 <= v39) {
          unint64_t v40 = *((void *)a2 + 1);
        }
        while (2)
        {
          if (v40 == v39)
          {
            uint64_t v44 = 0;
            *((unsigned char *)a2 + 24) = 1;
          }
          else
          {
            unint64_t v57 = v39 + 1;
            char v58 = *(unsigned char *)(v41 + v39);
            *((void *)a2 + 1) = v57;
            v44 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              unint64_t v39 = v57;
              BOOL v14 = v56++ > 8;
              if (v14) {
                goto LABEL_73;
              }
              continue;
            }
            if (*((unsigned char *)a2 + 24)) {
              uint64_t v44 = 0;
            }
          }
          break;
        }
LABEL_85:
        *((void *)this + 2) = v44;
        goto LABEL_20;
      default:
        goto LABEL_19;
    }
  }
  char v15 = 0;
  unsigned int v16 = 0;
  unint64_t v11 = 0;
  if (v2 > v3) {
    unint64_t v3 = v2;
  }
  do
  {
    if (v3 == v2)
    {
      int v4 = 1;
      *((unsigned char *)a2 + 24) = 1;
      return v4 == 0;
    }
    unint64_t v17 = v2 + 1;
    char v18 = *(unsigned char *)(v8 + v2);
    *((void *)a2 + 1) = v17;
    v11 |= (unint64_t)(v18 & 0x7F) << v15;
    if ((v18 & 0x80) == 0) {
      goto LABEL_25;
    }
    v15 += 7;
    unint64_t v2 = v17;
    BOOL v14 = v16++ > 8;
  }
  while (!v14);
LABEL_19:
  uint64_t result = PB::Reader::skip(a2);
  if (result) {
    goto LABEL_20;
  }
  return result;
}

uint64_t telephonytransport::PCIStatusIndication::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 24);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  char v5 = *(unsigned char *)(v3 + 36);
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)(v3 + 36) & 1) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    this = PB::Writer::writeVarInt(a2);
    if ((*(unsigned char *)(v3 + 36) & 2) == 0) {
      return this;
    }
    goto LABEL_9;
  }
  this = PB::Writer::writeVarInt(a2);
  char v5 = *(unsigned char *)(v3 + 36);
  if (v5) {
    goto LABEL_8;
  }
LABEL_5:
  if ((v5 & 2) == 0) {
    return this;
  }
LABEL_9:

  return PB::Writer::writeVarInt(a2);
}

BOOL telephonytransport::PCIStatusIndication::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(a2 + 24);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 36) & 4) != 0)
  {
    if ((*(unsigned char *)(a2 + 36) & 4) == 0 || *(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 36) & 4) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)(a1 + 36))
  {
    if ((*(unsigned char *)(a2 + 36) & 1) == 0 || *(void *)(a1 + 8) != *(void *)(a2 + 8)) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a2 + 36))
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 36) & 2) == 0;
  if ((*(unsigned char *)(a1 + 36) & 2) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 36) & 2) != 0 && *(void *)(a1 + 16) == *(void *)(a2 + 16);
}

uint64_t telephonytransport::PCIStatusIndication::hash_value(telephonytransport::PCIStatusIndication *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if ((*((unsigned char *)this + 36) & 4) == 0)
  {
    uint64_t v5 = 0;
    if (*((unsigned char *)this + 36)) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*((unsigned char *)this + 36) & 2) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v5 ^ v1 ^ v6 ^ v7;
  }
  uint64_t v5 = *((unsigned int *)this + 8);
  if ((*((unsigned char *)this + 36) & 1) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v6 = *((void *)this + 1);
  if ((*((unsigned char *)this + 36) & 2) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v7 = *((void *)this + 2);
  return v5 ^ v1 ^ v6 ^ v7;
}

void *telephonytransport::PCIStatusIndication::makeMessageId(void *this)
{
  if (!this[3])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[3] = this;
  }
  return this;
}

void *telephonytransport::PCIFreeRequest::PCIFreeRequest(void *this)
{
  *this = &unk_26C9AF908;
  this[1] = 0;
  return this;
}

{
  *this = &unk_26C9AF908;
  this[1] = 0;
  return this;
}

void telephonytransport::PCIFreeRequest::~PCIFreeRequest(telephonytransport::PCIFreeRequest *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF908;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIFreeRequest::~PCIFreeRequest(this);

  operator delete(v1);
}

telephonytransport::PCIFreeRequest *telephonytransport::PCIFreeRequest::PCIFreeRequest(telephonytransport::PCIFreeRequest *this, const telephonytransport::PCIFreeRequest *a2)
{
  *(void *)this = &unk_26C9AF908;
  *((void *)this + 1) = 0;
  uint64_t v3 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v3)
  {
    uint64_t v4 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v4, v3);
  }
  return this;
}

const telephonytransport::PCIFreeRequest *telephonytransport::PCIFreeRequest::operator=(const telephonytransport::PCIFreeRequest *a1, const telephonytransport::PCIFreeRequest *a2)
{
  if (a1 != a2)
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
    telephonytransport::PCIFreeRequest::PCIFreeRequest((telephonytransport::PCIFreeRequest *)&v5, a2);
    unint64_t v3 = *((void *)a1 + 1);
    *((void *)a1 + 1) = v6;
    unint64_t v6 = v3;
    telephonytransport::PCIFreeRequest::~PCIFreeRequest((telephonytransport::PCIFreeRequest *)&v5);
  }
  return a1;
}

uint64_t telephonytransport::swap(uint64_t this, telephonytransport::PCIFreeRequest *a2, telephonytransport::PCIFreeRequest *a3)
{
  uint64_t v3 = *(void *)(this + 8);
  *(void *)(this + 8) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  return this;
}

void *telephonytransport::PCIFreeRequest::PCIFreeRequest(void *a1, uint64_t a2)
{
  *a1 = &unk_26C9AF908;
  a1[1] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

{
  uint64_t v3;
  uint64_t v4;

  *a1 = &unk_26C9AF908;
  a1[1] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

uint64_t telephonytransport::PCIFreeRequest::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    *(void *)(a2 + 8) = 0;
    uint64_t v4 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = v3;
    v6[0] = &unk_26C9AF908;
    v6[1] = v4;
    telephonytransport::PCIFreeRequest::~PCIFreeRequest((telephonytransport::PCIFreeRequest *)v6);
  }
  return a1;
}

uint64_t telephonytransport::PCIFreeRequest::formatText(telephonytransport::PCIFreeRequest *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIFreeRequest::readFrom(telephonytransport::PCIFreeRequest *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_27;
        }
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 1)
      {
        char v19 = operator new(0x18uLL);
        *(void *)char v19 = &unk_26C9AF6D8;
        v19[5] = 0;
        uint64_t v20 = *((void *)this + 1);
        *((void *)this + 1) = v19;
        if (v20)
        {
          (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
          char v19 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v19 + 16))(v19, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_27:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || *((unsigned char *)a2 + 24)) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_20;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_27;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIFreeRequest::writeTo(uint64_t this, PB::Writer *a2)
{
  unint64_t v2 = *(const PB::Base **)(this + 8);
  if (v2) {
    return PB::Writer::writeSubmessage(a2, v2);
  }
  return this;
}

BOOL telephonytransport::PCIFreeRequest::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  BOOL result = v3 == 0;
  if (v2) {
    return v3 && telephonytransport::PCIMessageId::operator==(v2, v3);
  }
  return result;
}

uint64_t telephonytransport::PCIFreeRequest::hash_value(telephonytransport::PCIFreeRequest *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (!v1) {
    return 0;
  }
  char v2 = *(unsigned char *)(v1 + 20);
  uint64_t v3 = *(unsigned int *)(v1 + 16);
  if ((v2 & 2) == 0) {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(v1 + 8);
  if ((v2 & 1) == 0) {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

void *telephonytransport::PCIFreeRequest::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

uint64_t telephonytransport::PCIWriteResponse::PCIWriteResponse(uint64_t this)
{
  *(void *)this = &unk_26C9AF940;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = &unk_26C9AF940;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 20) = 0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void telephonytransport::PCIWriteResponse::~PCIWriteResponse(telephonytransport::PCIWriteResponse *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_26C9AF940;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  PB::Base::~Base(this);
}

{
  void *v1;
  uint64_t vars8;

  telephonytransport::PCIWriteResponse::~PCIWriteResponse(this);

  operator delete(v1);
}

telephonytransport::PCIWriteResponse *telephonytransport::PCIWriteResponse::PCIWriteResponse(telephonytransport::PCIWriteResponse *this, const telephonytransport::PCIWriteResponse *a2)
{
  *(void *)this = &unk_26C9AF940;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 6) = 0;
  uint64_t v4 = (const telephonytransport::PCIMessageId *)*((void *)a2 + 1);
  if (v4)
  {
    uint64_t v5 = operator new(0x18uLL);
    *((void *)this + 1) = telephonytransport::PCIMessageId::PCIMessageId((uint64_t)v5, v4);
  }
  if ((*((unsigned char *)a2 + 24) & 2) == 0)
  {
    char v6 = 1;
    if ((*((unsigned char *)a2 + 24) & 1) == 0) {
      return this;
    }
    goto LABEL_7;
  }
  int v7 = *((_DWORD *)a2 + 5);
  *((unsigned char *)this + 24) = 2;
  *((_DWORD *)this + 5) = v7;
  char v6 = 3;
  if (*((unsigned char *)a2 + 24))
  {
LABEL_7:
    int v8 = *((_DWORD *)a2 + 4);
    *((unsigned char *)this + 24) = v6;
    *((_DWORD *)this + 4) = v8;
  }
  return this;
}

uint64_t telephonytransport::PCIWriteResponse::operator=(uint64_t a1, const telephonytransport::PCIWriteResponse *a2)
{
  if ((const telephonytransport::PCIWriteResponse *)a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v8 = v3;
    long long v9 = v3;
    telephonytransport::PCIWriteResponse::PCIWriteResponse((telephonytransport::PCIWriteResponse *)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    uint64_t v6 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    *(void *)&long long v9 = v6;
    telephonytransport::PCIWriteResponse::~PCIWriteResponse((telephonytransport::PCIWriteResponse *)&v8);
  }
  return a1;
}

double telephonytransport::swap(telephonytransport *this, telephonytransport::PCIWriteResponse *a2, telephonytransport::PCIWriteResponse *a3)
{
  int v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  double result = *((double *)a2 + 2);
  uint64_t v6 = *((void *)this + 2);
  *((double *)this + 2) = result;
  *((void *)a2 + 2) = v6;
  return result;
}

uint64_t telephonytransport::PCIWriteResponse::PCIWriteResponse(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26C9AF940;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

uint64_t telephonytransport::PCIWriteResponse::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v8 = v3;
    long long v9 = v3;
    telephonytransport::PCIWriteResponse::PCIWriteResponse((uint64_t)&v8, a2);
    int v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = DWORD2(v9);
    DWORD2(v9) = v4;
    uint64_t v5 = *(void *)(a1 + 8);
    *(void *)(a1 + 8) = *((void *)&v8 + 1);
    *((void *)&v8 + 1) = v5;
    uint64_t v6 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v9;
    *(void *)&long long v9 = v6;
    telephonytransport::PCIWriteResponse::~PCIWriteResponse((telephonytransport::PCIWriteResponse *)&v8);
  }
  return a1;
}

uint64_t telephonytransport::PCIWriteResponse::formatText(telephonytransport::PCIWriteResponse *this, PB::TextFormatter *a2, const char *a3)
{
  PB::TextFormatter::beginObject(a2, a3);
  if (*((unsigned char *)this + 24)) {
    PB::TextFormatter::format(a2, "bytesWritten");
  }
  uint64_t v5 = *((void *)this + 1);
  if (v5) {
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(void *)v5 + 32))(v5, a2, "messageId");
  }
  if ((*((unsigned char *)this + 24) & 2) != 0) {
    PB::TextFormatter::format(a2, "result");
  }

  return MEMORY[0x270F587F0](a2);
}

uint64_t telephonytransport::PCIWriteResponse::readFrom(telephonytransport::PCIWriteResponse *this, PB::Reader *a2)
{
  unint64_t v2 = *((void *)a2 + 1);
  unint64_t v3 = *((void *)a2 + 2);
  int v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    while (1)
    {
      uint64_t v8 = *(void *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        unint64_t v12 = v2 + 1;
        *((void *)a2 + 1) = v2 + 1;
        char v13 = *(unsigned char *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0) {
          break;
        }
        v9 += 7;
        unint64_t v2 = v12;
        BOOL v14 = v10++ > 8;
        if (v14) {
          goto LABEL_19;
        }
      }
LABEL_25:
      if ((v11 & 7) == 4)
      {
        int v4 = 0;
        return v4 == 0;
      }
      unint64_t v21 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        *((unsigned char *)this + 24) |= 1u;
        unint64_t v24 = *((void *)a2 + 1);
        unint64_t v25 = *((void *)a2 + 2);
        uint64_t v26 = *(void *)a2;
        if (v24 > 0xFFFFFFFFFFFFFFF5 || v24 + 10 > v25)
        {
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v29 = 0;
          if (v25 <= v24) {
            unint64_t v25 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v25 == v24)
            {
              LODWORD(v29) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_66;
            }
            unint64_t v42 = v24 + 1;
            char v43 = *(unsigned char *)(v26 + v24);
            *((void *)a2 + 1) = v42;
            v29 |= (unint64_t)(v43 & 0x7F) << v40;
            if ((v43 & 0x80) == 0) {
              break;
            }
            v40 += 7;
            unint64_t v24 = v42;
            BOOL v14 = v41++ > 8;
            if (v14)
            {
LABEL_54:
              LODWORD(v29) = 0;
              goto LABEL_66;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v29) = 0;
          }
        }
        else
        {
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          while (1)
          {
            unint64_t v30 = v24 + 1;
            *((void *)a2 + 1) = v24 + 1;
            char v31 = *(unsigned char *)(v26 + v24);
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if ((v31 & 0x80) == 0) {
              break;
            }
            v27 += 7;
            unint64_t v24 = v30;
            BOOL v14 = v28++ > 8;
            if (v14) {
              goto LABEL_54;
            }
          }
        }
LABEL_66:
        *((_DWORD *)this + 4) = v29;
      }
      else if (v21 == 2)
      {
        *((unsigned char *)this + 24) |= 2u;
        unint64_t v32 = *((void *)a2 + 1);
        unint64_t v33 = *((void *)a2 + 2);
        uint64_t v34 = *(void *)a2;
        if (v32 > 0xFFFFFFFFFFFFFFF5 || v32 + 10 > v33)
        {
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v37 = 0;
          if (v33 <= v32) {
            unint64_t v33 = *((void *)a2 + 1);
          }
          while (1)
          {
            if (v33 == v32)
            {
              LODWORD(v37) = 0;
              *((unsigned char *)a2 + 24) = 1;
              goto LABEL_69;
            }
            unint64_t v46 = v32 + 1;
            char v47 = *(unsigned char *)(v34 + v32);
            *((void *)a2 + 1) = v46;
            v37 |= (unint64_t)(v47 & 0x7F) << v44;
            if ((v47 & 0x80) == 0) {
              break;
            }
            v44 += 7;
            unint64_t v32 = v46;
            BOOL v14 = v45++ > 8;
            if (v14)
            {
LABEL_61:
              LODWORD(v37) = 0;
              goto LABEL_69;
            }
          }
          if (*((unsigned char *)a2 + 24)) {
            LODWORD(v37) = 0;
          }
        }
        else
        {
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          while (1)
          {
            unint64_t v38 = v32 + 1;
            *((void *)a2 + 1) = v32 + 1;
            char v39 = *(unsigned char *)(v34 + v32);
            v37 |= (unint64_t)(v39 & 0x7F) << v35;
            if ((v39 & 0x80) == 0) {
              break;
            }
            v35 += 7;
            unint64_t v32 = v38;
            BOOL v14 = v36++ > 8;
            if (v14) {
              goto LABEL_61;
            }
          }
        }
LABEL_69:
        *((_DWORD *)this + 5) = v37;
      }
      else if (v21 == 1)
      {
        uint64_t v22 = operator new(0x18uLL);
        *(void *)uint64_t v22 = &unk_26C9AF6D8;
        v22[5] = 0;
        uint64_t v23 = *((void *)this + 1);
        *((void *)this + 1) = v22;
        if (v23)
        {
          (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
          uint64_t v22 = (_DWORD *)*((void *)this + 1);
        }
        if (!PB::Reader::placeMark()
          || ((*(uint64_t (**)(_DWORD *, PB::Reader *))(*(void *)v22 + 16))(v22, a2) & 1) == 0)
        {
          return 0;
        }
        PB::Reader::recallMark();
      }
      else
      {
LABEL_19:
        uint64_t result = PB::Reader::skip(a2);
        if (!result) {
          return result;
        }
      }
      unint64_t v2 = *((void *)a2 + 1);
      unint64_t v3 = *((void *)a2 + 2);
      int v4 = *((unsigned __int8 *)a2 + 24);
      if (v2 >= v3 || v4 != 0) {
        return v4 == 0;
      }
    }
    char v15 = 0;
    unsigned int v16 = 0;
    unint64_t v11 = 0;
    if (v2 > v3) {
      unint64_t v3 = v2;
    }
    while (v3 != v2)
    {
      unint64_t v17 = v2 + 1;
      char v18 = *(unsigned char *)(v8 + v2);
      *((void *)a2 + 1) = v17;
      v11 |= (unint64_t)(v18 & 0x7F) << v15;
      if ((v18 & 0x80) == 0) {
        goto LABEL_25;
      }
      v15 += 7;
      unint64_t v2 = v17;
      BOOL v14 = v16++ > 8;
      if (v14) {
        goto LABEL_19;
      }
    }
    int v4 = 1;
    *((unsigned char *)a2 + 24) = 1;
  }
  return v4 == 0;
}

uint64_t telephonytransport::PCIWriteResponse::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3 = this;
  int v4 = *(const PB::Base **)(this + 8);
  if (v4) {
    this = PB::Writer::writeSubmessage(a2, v4);
  }
  char v5 = *(unsigned char *)(v3 + 24);
  if ((v5 & 2) != 0)
  {
    this = PB::Writer::writeVarInt(a2);
    char v5 = *(unsigned char *)(v3 + 24);
  }
  if (v5)
  {
    return PB::Writer::writeVarInt(a2);
  }
  return this;
}

BOOL telephonytransport::PCIWriteResponse::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !telephonytransport::PCIMessageId::operator==(v4, v5)) {
      return 0;
    }
  }
  else if (v5)
  {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 24) & 2) != 0)
  {
    if ((*(unsigned char *)(a2 + 24) & 2) == 0 || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 20)) {
      return 0;
    }
  }
  else if ((*(unsigned char *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  BOOL result = (*(unsigned char *)(a2 + 24) & 1) == 0;
  if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
    return result;
  }
  return (*(unsigned char *)(a2 + 24) & 1) != 0 && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

uint64_t telephonytransport::PCIWriteResponse::hash_value(telephonytransport::PCIWriteResponse *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1)
  {
    char v2 = *(unsigned char *)(v1 + 20);
    uint64_t v3 = *(unsigned int *)(v1 + 16);
    if ((v2 & 2) == 0) {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void *)(v1 + 8);
    if ((v2 & 1) == 0) {
      uint64_t v4 = 0;
    }
    uint64_t v1 = v4 ^ v3;
  }
  if ((*((unsigned char *)this + 24) & 2) != 0)
  {
    uint64_t v5 = *((int *)this + 5);
    if (*((unsigned char *)this + 24)) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v5 ^ v1 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*((unsigned char *)this + 24) & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = *((unsigned int *)this + 4);
  return v5 ^ v1 ^ v6;
}

void *telephonytransport::PCIWriteResponse::makeMessageId(void *this)
{
  if (!this[1])
  {
    uint64_t v1 = this;
    this = operator new(0x18uLL);
    *this = &unk_26C9AF6D8;
    *((_DWORD *)this + 5) = 0;
    v1[1] = this;
  }
  return this;
}

void telephonytransport::BaseProtocol::create(uint64_t a1@<X0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, int a4@<W3>, char *a5@<X4>, void *a6@<X8>)
{
  unint64_t v12 = operator new(0xA8uLL);
  telephonytransport::BaseProtocol::BaseProtocol((uint64_t)v12, a1, a5);
  char v13 = (std::__shared_weak_count *)operator new(0x20uLL);
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9AFC10;
  v13->__shared_owners_ = 0;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)v12;
  unint64_t v24 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v25 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  BOOL v14 = *a2;
  dispatch_object_t object = v14;
  if (v14) {
    dispatch_retain(v14);
  }
  char v15 = (std::__shared_weak_count *)a3[1];
  uint64_t v19 = *a3;
  uint64_t v20 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  telephonytransport::TCPSocketStream::create((telephonytransport *)&v22, &object, &v19, a4, a5, &v24);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v23) {
    std::__shared_weak_count::__release_weak(v23);
  }
  unsigned int v16 = v24;
  if (v24)
  {
    unint64_t v17 = v25;
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    char v18 = (std::__shared_weak_count *)*((void *)v12 + 20);
    *((void *)v12 + 19) = v16;
    *((void *)v12 + 20) = v17;
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    *a6 = v12;
    a6[1] = v13;
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    *a6 = 0;
    a6[1] = 0;
  }
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v13);
}

void sub_2185C12F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, dispatch_object_t object, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (object) {
    dispatch_release(object);
  }
  if (a14) {
    std::__shared_weak_count::__release_weak(a14);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  _Unwind_Resume(a1);
}

void telephonytransport::BaseProtocol::init(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 160);
  *(_OWORD *)(a1 + 152) = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

uint64_t telephonytransport::BaseProtocol::BaseProtocol(uint64_t a1, uint64_t a2, char *a3)
{
  *(void *)a1 = &unk_26C9AFB78;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a1 + 64) = 850045863;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 24));
  std::vector<unsigned char>::reserve((unint64_t *)(a1 + 128));
  return a1;
}

void sub_2185C1450(_Unwind_Exception *a1)
{
  uint64_t v6 = (std::__shared_weak_count *)v1[20];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  int v7 = *v4;
  if (*v4)
  {
    v1[17] = v7;
    operator delete(v7);
  }
  std::mutex::~mutex(v3);
  uint64_t v8 = (std::__shared_weak_count *)v1[7];
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  char v9 = *v2;
  if (*v2)
  {
    v1[4] = v9;
    operator delete(v9);
  }
  unsigned int v10 = (std::__shared_weak_count *)v1[2];
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::reserve(unint64_t *a1)
{
  unint64_t v1 = *a1;
  if (!((a1[2] - *a1) >> 16))
  {
    long long v3 = (char *)a1[1];
    uint64_t v4 = operator new(0x10000uLL);
    uint64_t v5 = &v3[(void)v4 - v1];
    uint64_t v6 = v5;
    if (v3 != (char *)v1)
    {
      int v7 = &v3[~v1];
      do
      {
        char v8 = *--v3;
        (v7--)[(void)v4] = v8;
      }
      while (v3 != (char *)v1);
      uint64_t v6 = v4;
    }
    *a1 = (unint64_t)v6;
    a1[1] = (unint64_t)v5;
    a1[2] = (unint64_t)(v4 + 0x10000);
    if (v1)
    {
      operator delete((void *)v1);
    }
  }
}

void telephonytransport::BaseProtocol::handleRead(telephonytransport::BaseProtocol *this, char *__src, unint64_t a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unint64_t v3 = a3;
    int v7 = (char *)*((void *)this + 3);
    uint64_t v6 = (char *)*((void *)this + 4);
    char v8 = ((char *)this + 24);
    while (1)
    {
      if (v7 == v6) {
        goto LABEL_20;
      }
      unint64_t v9 = v6 - v7;
      if (v6 - v7 + v3 <= 7)
      {
LABEL_23:
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)v8, v6, __src, &__src[v3], v3);
        return;
      }
      if (v9 <= 7)
      {
        unint64_t v10 = 8 - v9;
        unint64_t v11 = &__src[8 - v9];
        std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)v8, v6, __src, v11, 8 - v9);
        v3 -= v10;
        int v7 = (char *)*((void *)this + 3);
        uint64_t v6 = (char *)*((void *)this + 4);
        unint64_t v9 = v6 - v7;
        __src = v11;
      }
      unint64_t v12 = bswap32(*((_DWORD *)v7 + 1)) + 8;
      unint64_t v13 = v12 - v9;
      if (v12 < v9)
      {
        unsigned int v16 = (unint64_t *)*((void *)this + 1);
        char v15 = (std::__shared_weak_count *)*((void *)this + 2);
        if (v15)
        {
          atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
          unint64_t v3 = *v16;
          std::__shared_weak_count::__release_shared[abi:ne180100](v15);
        }
        else
        {
          unint64_t v3 = *v16;
        }
        if (!os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_FAULT)) {
          goto LABEL_19;
        }
        LOWORD(v26) = 0;
        unint64_t v17 = "Data available in buffer must not be greater than kHeaderSize + payloadLength";
        goto LABEL_17;
      }
      if (v3 < v13) {
        goto LABEL_23;
      }
      BOOL v14 = __src;
      __src += v13;
      std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)v8, v6, v14, __src, v13);
      if (telephonytransport::BaseProtocol::processData(this, *((unsigned __int8 **)this + 3), *((void *)this + 4) - *((void *)this + 3)) != v12)break; {
      uint64_t v6 = (char *)*((void *)this + 3);
      }
      *((void *)this + 4) = v6;
      int v7 = v6;
      v3 -= v13;
      if (!v3) {
        return;
      }
    }
    unint64_t v25 = (unint64_t *)*((void *)this + 1);
    unint64_t v24 = (std::__shared_weak_count *)*((void *)this + 2);
    if (v24)
    {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
      unint64_t v3 = *v25;
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    else
    {
      unint64_t v3 = *v25;
    }
    if (!os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    LOWORD(v26) = 0;
    unint64_t v17 = "Failed to process the message properly";
LABEL_17:
    char v18 = v3;
    uint32_t v19 = 2;
LABEL_18:
    _os_log_fault_impl(&dword_2185A0000, v18, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v26, v19);
LABEL_19:
    while (1)
    {
      __break(1u);
LABEL_20:
      unint64_t v20 = telephonytransport::BaseProtocol::processData(this, (unsigned __int8 *)__src, v3);
      unint64_t v21 = v20;
      if (v20 <= v3) {
        break;
      }
      uint64_t v23 = (NSObject **)*((void *)this + 1);
      uint64_t v22 = (std::__shared_weak_count *)*((void *)this + 2);
      if (v22)
      {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
        char v8 = *v23;
        std::__shared_weak_count::__release_shared[abi:ne180100](v22);
      }
      else
      {
        char v8 = *v23;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v26 = 134218240;
        unint64_t v27 = v21;
        __int16 v28 = 2048;
        unint64_t v29 = v3;
        unint64_t v17 = "Processed bytes cannot exceed length. Processed: %zu, Length: %zu";
        char v18 = v8;
        uint32_t v19 = 22;
        goto LABEL_18;
      }
    }
    if (v20 != v3)
    {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(v8, &__src[v20], &__src[v3], v3 - v20);
    }
  }
}

unint64_t telephonytransport::BaseProtocol::processData(telephonytransport::BaseProtocol *this, unsigned __int8 *a2, unint64_t a3)
{
  if (!a3) {
    return 0;
  }
  for (unint64_t i = 0; i < a3; i += v6 + 8)
  {
    if (a3 - i < 8) {
      break;
    }
    uint64_t v6 = bswap32(*((_DWORD *)a2 + 1));
    if (a3 - i < v6 + 8) {
      break;
    }
    int v7 = a2 + 8;
    char v8 = (std::__shared_weak_count *)*((void *)this + 7);
    if (v8)
    {
      unsigned int v9 = *(_DWORD *)a2;
      unint64_t v10 = std::__shared_weak_count::lock(v8);
      if (v10)
      {
        unint64_t v11 = v10;
        unint64_t v12 = (void (***)(void, void, unsigned __int8 *, uint64_t))*((void *)this + 6);
        if (v12) {
          (**v12)(v12, bswap32(v9), v7, v6);
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v11);
      }
    }
    a2 = &v7[v6];
  }
  return i;
}

void sub_2185C1950(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::BaseProtocol::sendMessage(std::mutex *this, unsigned int a2, const PB::Base *a3)
{
  memset(v8, 170, sizeof(v8));
  PB::Writer::Writer((PB::Writer *)v8);
  (*(void (**)(const PB::Base *, unsigned __int8 **))(*(void *)a3 + 24))(a3, v8);
  uint64_t v6 = telephonytransport::BaseProtocol::sendMessage(this, a2, v8[1], (LODWORD(v8[0]) - LODWORD(v8[1])));
  PB::Writer::~Writer((PB::Writer *)v8);
  return v6;
}

void sub_2185C1A04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  PB::Writer::~Writer((PB::Writer *)va);
  _Unwind_Resume(a1);
}

uint64_t telephonytransport::BaseProtocol::sendMessage(std::mutex *this, unsigned int a2, const unsigned __int8 *a3, size_t a4)
{
  char v8 = this + 1;
  std::mutex::lock(this + 1);
  sig = (_DWORD *)this[2].__m_.__sig;
  unint64_t v10 = *(void *)this[2].__m_.__opaque - (void)sig;
  if (a4 + 8 <= v10)
  {
    if (a4 + 8 < v10) {
      *(void *)this[2].__m_.__opaque = (char *)sig + a4 + 8;
    }
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)&this[2], a4 + 8 - v10);
    sig = (_DWORD *)this[2].__m_.__sig;
  }
  _DWORD *sig = bswap32(a2);
  *(_DWORD *)(this[2].__m_.__sig + 4) = bswap32(a4);
  memcpy((void *)(this[2].__m_.__sig + 8), a3, a4);
  uint64_t v11 = (***(uint64_t (****)(void))&this[2].__m_.__opaque[16])();
  std::mutex::unlock(v8);
  return v11;
}

void sub_2185C1B14(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void telephonytransport::BaseProtocol::~BaseProtocol(std::mutex *this)
{
  this->__m_.__sig = (uint64_t)&unk_26C9AFB78;
  char v2 = *(std::__shared_weak_count **)&this[2].__m_.__opaque[24];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  sig = (void *)this[2].__m_.__sig;
  if (sig)
  {
    *(void *)this[2].__m_.__opaque = sig;
    operator delete(sig);
  }
  std::mutex::~mutex(this + 1);
  uint64_t v4 = *(std::__shared_weak_count **)&this->__m_.__opaque[48];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  uint64_t v5 = *(void **)&this->__m_.__opaque[16];
  if (v5)
  {
    *(void *)&this->__m_.__opaque[24] = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(std::__shared_weak_count **)&this->__m_.__opaque[8];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

{
  std::__shared_weak_count *v2;
  void *sig;
  std::__shared_weak_count *v4;
  void *v5;
  std::__shared_weak_count *v6;
  uint64_t vars8;

  this->__m_.__sig = (uint64_t)&unk_26C9AFB78;
  char v2 = *(std::__shared_weak_count **)&this[2].__m_.__opaque[24];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  sig = (void *)this[2].__m_.__sig;
  if (sig)
  {
    *(void *)this[2].__m_.__opaque = sig;
    operator delete(sig);
  }
  std::mutex::~mutex(this + 1);
  uint64_t v4 = *(std::__shared_weak_count **)&this->__m_.__opaque[48];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  uint64_t v5 = *(void **)&this->__m_.__opaque[16];
  if (v5)
  {
    *(void *)&this->__m_.__opaque[24] = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(std::__shared_weak_count **)&this->__m_.__opaque[8];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }

  operator delete(this);
}

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, char *__src, char *a3, unint64_t a4)
{
  int v7 = result;
  unint64_t v8 = result[2];
  unsigned int v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      _OWORD v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    BOOL result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    unsigned int v9 = (char *)v7[1];
    goto LABEL_17;
  }
  unint64_t v12 = (unsigned char *)result[1];
  size_t v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    size_t v16 = a3 - __src;
    if (v16) {
      BOOL result = memmove(v9, __src, v16);
    }
    char v15 = &v9[v16];
    goto LABEL_20;
  }
  BOOL v14 = &__src[v13];
  if (v12 != v9)
  {
    BOOL result = memmove((void *)*result, __src, v13);
    unsigned int v9 = (char *)v7[1];
  }
  if (a3 != v14) {
    BOOL result = memmove(v9, v14, a3 - v14);
  }
  char v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

void std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  if (a5 < 1) {
    return;
  }
  uint64_t v10 = *(unsigned char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    size_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    size_t v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15) {
      size_t v16 = (char *)operator new(v15);
    }
    else {
      size_t v16 = 0;
    }
    int v26 = &v13[(void)v16];
    memcpy(&v13[(void)v16], __src, a5);
    if (v11 == __dst)
    {
      unint64_t v27 = &v13[(void)v16];
    }
    else
    {
      do
      {
        v13[(void)v16 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      uint64_t v10 = *(unsigned char **)(a1 + 8);
      unint64_t v27 = v16;
    }
    __int16 v28 = &v26[a5];
    unint64_t v29 = &v16[v15];
    if (v10 != __dst) {
      memmove(v28, __dst, v10 - __dst);
    }
    uint64_t v30 = *(char **)a1;
    *(void *)a1 = v27;
    *(void *)(a1 + 8) = &v28[v10 - __dst];
    *(void *)(a1 + 16) = v29;
    if (v30)
    {
      operator delete(v30);
    }
    return;
  }
  uint64_t v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    char v18 = &__src[a5];
    unint64_t v20 = *(unsigned char **)(a1 + 8);
LABEL_17:
    unint64_t v21 = &__dst[a5];
    uint64_t v22 = &v20[-a5];
    uint64_t v23 = v20;
    if (&v20[-a5] < v10)
    {
      unint64_t v24 = (char *)(&v10[a5] - v20);
      uint64_t v23 = v20;
      do
      {
        char v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(void *)(a1 + 8) = v23;
    if (v20 != v21) {
      memmove(&__dst[a5], __dst, v20 - v21);
    }
    if (v18 != __src)
    {
      memmove(__dst, __src, v18 - __src);
    }
    return;
  }
  char v18 = &__src[v17];
  int64_t v19 = a4 - &__src[v17];
  if (a4 != &__src[v17]) {
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  }
  unint64_t v20 = &v10[v19];
  *(void *)(a1 + 8) = &v10[v19];
  if (v17 >= 1) {
    goto LABEL_17;
  }
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  uint64_t v5 = (char *)a1[1];
  uint64_t v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    int v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    uint64_t v12 = &v7[v11];
    size_t v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      unint64_t v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      uint64_t v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void std::__shared_ptr_pointer<telephonytransport::BaseProtocol *,std::shared_ptr<telephonytransport::BaseProtocol>::__shared_ptr_default_delete<telephonytransport::BaseProtocol,telephonytransport::BaseProtocol>,std::allocator<telephonytransport::BaseProtocol>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<telephonytransport::BaseProtocol *,std::shared_ptr<telephonytransport::BaseProtocol>::__shared_ptr_default_delete<telephonytransport::BaseProtocol,telephonytransport::BaseProtocol>,std::allocator<telephonytransport::BaseProtocol>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<telephonytransport::BaseProtocol *,std::shared_ptr<telephonytransport::BaseProtocol>::__shared_ptr_default_delete<telephonytransport::BaseProtocol,telephonytransport::BaseProtocol>,std::allocator<telephonytransport::BaseProtocol>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void telephonytransport::NetworkSocketBridge::create(uint64_t *a1@<X0>, NSObject **a2@<X1>, uint64_t *a3@<X2>, NSObject **a4@<X3>, char *a5@<X4>, void *a6@<X8>)
{
  int v26 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v27 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v11 = *a2;
  dispatch_object_t object = v11;
  if (v11) {
    dispatch_retain(v11);
  }
  telephonytransport::NetworkSocketForwarder::create(a1, a3, &object, a5, &v26);
  if (object) {
    dispatch_release(object);
  }
  uint64_t v23 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = *a4;
  dispatch_object_t v22 = v12;
  if (v12) {
    dispatch_retain(v12);
  }
  telephonytransport::NetworkSocketForwarder::create(a3, a1, &v22, a5, &v23);
  size_t v13 = (telephonytransport *)v22;
  if (v22) {
    dispatch_release(v22);
  }
  unint64_t v14 = v26;
  if (v26 && (char v15 = v23) != 0)
  {
    *a6 = 0xAAAAAAAAAAAAAAAALL;
    a6[1] = 0xAAAAAAAAAAAAAAAALL;
    size_t v16 = operator new(0x20uLL);
    uint64_t v17 = v27;
    void *v16 = v14;
    v16[1] = v17;
    int v26 = 0;
    unint64_t v27 = 0;
    char v18 = v24;
    v16[2] = v15;
    v16[3] = v18;
    uint64_t v23 = 0;
    unint64_t v24 = 0;
    *a6 = v16;
    int64_t v19 = operator new(0x20uLL);
    void *v19 = &unk_26C9AFC88;
    v19[1] = 0;
    v19[2] = 0;
    v19[3] = v16;
    a6[1] = v19;
  }
  else
  {
    unint64_t v20 = *(NSObject **)telephonytransport::getDefaultOSLogHandle(v13);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v21 = 0;
      _os_log_error_impl(&dword_2185A0000, v20, OS_LOG_TYPE_ERROR, "Failed to create NetworkSocketBridge", v21, 2u);
    }
    *a6 = 0;
    a6[1] = 0;
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
}

void sub_2185C22F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, dispatch_object_t object, uint64_t a12, std::__shared_weak_count *a13, dispatch_object_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  std::default_delete<telephonytransport::SocketAndRawIPIfaceBridge>::operator()[abi:ne180100](v16);
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  _Unwind_Resume(a1);
}

__n128 telephonytransport::NetworkSocketBridge::NetworkSocketBridge(_OWORD *a1, uint64_t a2, __n128 *a3)
{
  *a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  __n128 result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  *a1 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  __n128 result = *a3;
  a1[1] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocketBridge *,std::shared_ptr<telephonytransport::NetworkSocketBridge>::__shared_ptr_default_delete<telephonytransport::NetworkSocketBridge,telephonytransport::NetworkSocketBridge>,std::allocator<telephonytransport::NetworkSocketBridge>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<telephonytransport::NetworkSocketBridge *,std::shared_ptr<telephonytransport::NetworkSocketBridge>::__shared_ptr_default_delete<telephonytransport::NetworkSocketBridge,telephonytransport::NetworkSocketBridge>,std::allocator<telephonytransport::NetworkSocketBridge>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<telephonytransport::NetworkSocketBridge *,std::shared_ptr<telephonytransport::NetworkSocketBridge>::__shared_ptr_default_delete<telephonytransport::NetworkSocketBridge,telephonytransport::NetworkSocketBridge>,std::allocator<telephonytransport::NetworkSocketBridge>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

uint64_t PBHashBytes()
{
  return MEMORY[0x270F585C8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x270F587A0](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x270F587A8]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x270F587D0](this, a2);
}

{
  return MEMORY[0x270F587D8](this, a2);
}

{
  return MEMORY[0x270F587E8](this, a2);
}

void PB::Base::~Base(PB::Base *this)
{
}

uint64_t PB::Data::assign(PB::Data *this, const unsigned __int8 *a2, const unsigned __int8 *a3)
{
  return MEMORY[0x270F58800](this, a2, a3);
}

uint64_t PB::Data::Data(PB::Data *this, const PB::Data *a2)
{
  return MEMORY[0x270F58808](this, a2);
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x270F58810]();
}

uint64_t PB::Reader::read(PB::Reader *this, PB::Data *a2)
{
  return MEMORY[0x270F58818](this, a2);
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x270F58828](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x270F58830]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F58838](this, a2);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x270F58840](this);
}

{
  return MEMORY[0x270F58848](this);
}

{
  return MEMORY[0x270F58858](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x270F58860](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x270F588A0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t PB::Data::operator==()
{
  return MEMORY[0x270F588B0]();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98340](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x270F98398](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x270F985E0](this, *(void *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x270F988E0]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x270F98E98]();
}

void std::rethrow_exception(std::exception_ptr a1)
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x270ED9478](queue, relative_priority_ptr);
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
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

void pcap_close(pcap_t *a1)
{
}

int pcap_compile(pcap_t *a1, bpf_program *a2, const char *a3, int a4, bpf_u_int32 a5)
{
  return MEMORY[0x270F9AB08](a1, a2, a3, *(void *)&a4, *(void *)&a5);
}

int pcap_datalink(pcap_t *a1)
{
  return MEMORY[0x270F9AB10](a1);
}

const char *__cdecl pcap_datalink_val_to_description(int a1)
{
  return (const char *)MEMORY[0x270F9AB18](*(void *)&a1);
}

int pcap_dispatch(pcap_t *a1, int a2, pcap_handler a3, u_char *a4)
{
  return MEMORY[0x270F9AB20](a1, *(void *)&a2, a3, a4);
}

void pcap_freecode(bpf_program *a1)
{
}

int pcap_get_selectable_fd(pcap_t *a1)
{
  return MEMORY[0x270F9AB50](a1);
}

char *__cdecl pcap_geterr(pcap_t *a1)
{
  return (char *)MEMORY[0x270F9AB58](a1);
}

int pcap_inject(pcap_t *a1, const void *a2, size_t a3)
{
  return MEMORY[0x270F9AB60](a1, a2, a3);
}

pcap_t *__cdecl pcap_open_live(const char *a1, int a2, int a3, int a4, char *a5)
{
  return (pcap_t *)MEMORY[0x270F9AB70](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4, a5);
}

int pcap_set_snaplen(pcap_t *a1, int a2)
{
  return MEMORY[0x270F9AB78](a1, *(void *)&a2);
}

int pcap_setdirection(pcap_t *a1, pcap_direction_t a2)
{
  return MEMORY[0x270F9AB80](a1, *(void *)&a2);
}

int pcap_setfilter(pcap_t *a1, bpf_program *a2)
{
  return MEMORY[0x270F9AB88](a1, a2);
}

int pcap_setnonblock(pcap_t *a1, int a2, char *a3)
{
  return MEMORY[0x270F9AB90](a1, *(void *)&a2, a3);
}

int pcap_snapshot(pcap_t *a1)
{
  return MEMORY[0x270F9AB98](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}