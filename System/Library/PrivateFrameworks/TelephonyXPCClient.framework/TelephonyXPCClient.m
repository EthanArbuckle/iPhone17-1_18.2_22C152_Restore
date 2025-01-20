void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void __destroy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE40c27_ZTSN12TelephonyXPC6ResultE72c15_ZTSN3xpc4dictE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 72));
  *(void *)(a1 + 72) = 0;
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEclIJS2_S4_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 40);
  if (*(char *)(a1 + 71) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(void *)(a1 + 56));
  }
  else {
    std::string __p = *(std::string *)(a1 + 48);
  }
  v3 = *(void **)(a1 + 72);
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, int *, xpc_object_t *))(v2 + 16))(v2, &v5, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_219295810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(void *a1, void *a2)
{
  result = (void *)a2[4];
  if (result) {
    result = _Block_copy(result);
  }
  uint64_t v6 = a2[5];
  uint64_t v5 = a2[6];
  a1[4] = result;
  a1[5] = v6;
  a1[6] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __copy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(void *a1, uint64_t a2)
{
  _Block_object_assign(a1 + 4, *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
}

xpc_object_t __copy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE40c27_ZTSN12TelephonyXPC6ResultE72c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 32);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  *(void *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  uint64_t v5 = (std::string *)(a1 + 48);
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  v7 = *(void **)(a2 + 72);
  *(void *)(a1 + 72) = v7;
  if (v7) {
    return xpc_retain(v7);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 72) = result;
  return result;
}

void sub_219295960(_Unwind_Exception *exception_object)
{
  v3 = *(const void **)(v1 + 32);
  if (v3) {
    _Block_release(v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void ___ZN12TelephonyXPC6Client5State7performENSt3__110shared_ptrINS_7CommandEEE_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v3 = (std::__shared_weak_count *)a1[6];
  v4[0] = a1[5];
  v4[1] = (uint64_t)v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  TelephonyXPC::Client::State::perform_sync(v2, v4);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_219295A48(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(void *)(a1 + 40) = 0;
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

xpc_object_t __copy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(const void **)(a2 + 32);
  if (v4) {
    uint64_t v5 = _Block_copy(v4);
  }
  else {
    uint64_t v5 = 0;
  }
  long long v6 = *(void **)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v6;
  if (v6) {
    return xpc_retain(v6);
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 88);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void __destroy_helper_block_e8_32b40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 7);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = (std::__shared_weak_count *)a1[6];
  uint64_t v4 = a1[5];
  uint64_t v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void sub_219295C08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
}

void TelephonyXPC::Client::perform(void **a1, uint64_t *a2)
{
  v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    TelephonyXPC::Client::State::perform(v3, v4, v5);
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  else
  {
    TelephonyXPC::Client::State::perform(v3, v4, 0);
  }
}

void TelephonyXPC::Client::State::perform(void *a1, uint64_t a2, std::__shared_weak_count *a3)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1174405120;
  v9[2] = ___ZN12TelephonyXPC6Client5State7performENSt3__110shared_ptrINS_7CommandEEE_block_invoke;
  v9[3] = &__block_descriptor_tmp_73;
  v9[4] = a1;
  v9[5] = a2;
  v10 = a3;
  if (a3) {
    atomic_fetch_add_explicit(&a3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[2];
  if (!v4 || (uint64_t v5 = a1[1], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v7 = v6;
  v8 = a1[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_26;
  block[5] = v5;
  v12 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  block[4] = v9;
  dispatch_async(v8, block);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      if (*(void *)(a1 + 40))
      {
        memset(&v36, 170, sizeof(v36));
        TelephonyXPC::Command::State::name(**(TelephonyXPC::Command::State ***)(a1 + 56));
        ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v3 + 10));
        if ((*(unsigned int (**)(void *, uint64_t))v3[10])(v3 + 10, 20))
        {
          unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v33 = v6;
          long long v34 = v6;
          long long handler = v6;
          ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&handler);
          uint64_t v7 = MEMORY[0x21D485430](&handler, "Performing ");
          MEMORY[0x21D485440](v7, &v36);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          MEMORY[0x21D4853A0](&handler);
        }
        uint64_t v8 = **(void **)(a1 + 56);
        if (*(void *)(v8 + 8) && *(void *)(v8 + 16))
        {
          uint64_t v9 = MEMORY[0x21D485890](v3[5]);
          uint64_t v10 = MEMORY[0x263EF86F0];
          v11 = *(void ****)(a1 + 56);
          if (v9 == MEMORY[0x263EF86F0])
          {
            TelephonyXPC::Command::State::get(*v11, &v31);
            aBlock[0] = MEMORY[0x263EF8330];
            aBlock[1] = 1174405120;
            aBlock[2] = ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_2;
            aBlock[3] = &__block_descriptor_tmp_42;
            uint64_t v14 = *(void *)(a1 + 40);
            v13 = *(std::__shared_weak_count **)(a1 + 48);
            aBlock[4] = v3;
            aBlock[5] = v14;
            v27 = v13;
            if (v13) {
              atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
            }
            if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external(&v28, v36.__r_.__value_.__l.__data_, v36.__r_.__value_.__l.__size_);
            }
            else {
              std::string v28 = v36;
            }
            v15 = *(std::__shared_weak_count **)(a1 + 64);
            uint64_t v29 = *(void *)(a1 + 56);
            v30 = v15;
            if (v15) {
              atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            v16 = _Block_copy(aBlock);
            if (MEMORY[0x21D485890](v3[5]) == v10)
            {
              v17 = (_xpc_connection_s *)v3[5];
              xpc_object_t v18 = v31;
              v19 = v3[3];
              *(void *)&long long handler = MEMORY[0x263EF8330];
              *((void *)&handler + 1) = 1174405120;
              *(void *)&long long v33 = ___ZN12TelephonyXPC6Client5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke;
              *((void *)&v33 + 1) = &__block_descriptor_tmp_46;
              v20 = v16 ? _Block_copy(v16) : 0;
              *(void *)&long long v34 = v20;
              xpc_connection_send_message_with_reply(v17, v18, v19, &handler);
              if ((void)v34) {
                _Block_release((const void *)v34);
              }
            }
            if (v16) {
              _Block_release(v16);
            }
            xpc_release(v31);
            xpc_object_t v31 = 0;
            if (v30) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v30);
            }
            if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v28.__r_.__value_.__l.__data_);
            }
            if (v27) {
              std::__shared_weak_count::__release_weak(v27);
            }
          }
          else
          {
            std::string::basic_string[abi:ne180100]<0>(&handler, "Server not available");
            int v23 = -534716415;
            *(_OWORD *)std::string __p = handler;
            uint64_t v25 = v33;
            long long handler = 0uLL;
            *(void *)&long long v33 = 0;
            xpc_object_t v12 = xpc_null_create();
            v22 = v12;
            TelephonyXPC::Command::notify((uint64_t *)v11, (uint64_t)&v23, &v22);
            xpc_release(v12);
            if (SHIBYTE(v25) < 0) {
              operator delete(__p[0]);
            }
            if (SBYTE7(v33) < 0) {
              operator delete((void *)handler);
            }
          }
        }
        else
        {
          TelephonyXPC::Command::State::get((void **)v8, &object);
          TelephonyXPC::Client::State::send_sync((uint64_t)v3, &object);
          xpc_release(object);
          xpc_object_t object = 0;
        }
        if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v36.__r_.__value_.__l.__data_);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_219296198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,std::__shared_weak_count *a33,xpc_object_t object,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v43) {
    _Block_release(v43);
  }
  if (a33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a33);
  }
  if (a31 < 0) {
    operator delete(__p);
  }
  if (a25) {
    std::__shared_weak_count::__release_weak(a25);
  }
  xpc_release(object);
  if (*(char *)(v44 - 81) < 0) {
    operator delete(*(void **)(v44 - 104));
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Command::State::name(TelephonyXPC::Command::State *this)
{
  v1[0] = this;
  v1[1] = "command";
  xpc_object_t object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v1, &object);
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_21929631C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

xpc_object_t TelephonyXPC::Command::State::get@<X0>(void **this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *this;
  *a2 = v2;
  if (v2) {
    return xpc_retain(v2);
  }
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

void std::__shared_ptr_pointer<TelephonyXPC::Event *,std::shared_ptr<TelephonyXPC::Event>::__shared_ptr_default_delete<TelephonyXPC::Event,TelephonyXPC::Event>,std::allocator<TelephonyXPC::Event>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    operator delete(v1);
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  xpc_object_t object = v1;
  if (v1) {
    xpc_retain(v1);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(v2 + 16))(v2, &object);
  xpc_release(object);
}

void sub_219296428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void ___ZN12TelephonyXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke(void *a1, xpc_object_t *a2)
{
  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    long long v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = v6;
      if (!a1[5])
      {
LABEL_22:
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        return;
      }
      xpc_object_t reply = xpc_dictionary_create_reply(*a2);
      if (reply || (xpc_object_t reply = xpc_null_create()) != 0)
      {
        if (MEMORY[0x21D485890](reply) == MEMORY[0x263EF8708])
        {
          xpc_retain(reply);
          xpc_object_t v9 = reply;
        }
        else
        {
          xpc_object_t v9 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v9 = xpc_null_create();
        xpc_object_t reply = 0;
      }
      xpc_release(reply);
      xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(*a2);
      xpc_object_t v11 = remote_connection;
      if (remote_connection) {
        xpc_retain(remote_connection);
      }
      else {
        xpc_object_t v11 = xpc_null_create();
      }
      uint64_t v12 = MEMORY[0x21D485890](*(void *)(v5 + 40));
      uint64_t v13 = MEMORY[0x263EF86F0];
      if (v12 == MEMORY[0x263EF86F0]
        && MEMORY[0x21D485890](v11) == v13
        && MEMORY[0x21D485890](v9) == MEMORY[0x263EF8708]
        && v11 == *(xpc_object_t *)(v5 + 40))
      {
        xpc_object_t v26 = v9;
        if (v9) {
          xpc_retain(v9);
        }
        else {
          xpc_object_t v26 = xpc_null_create();
        }
        TelephonyXPC::Client::State::send_sync(v5, &v26);
        xpc_release(v26);
        xpc_object_t v26 = 0;
        v17 = (ctu::LoggerCommonBase *)(v5 + 80);
        ctu::LoggerCommonBase::getLogLevel(v17);
        if (!(**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v17)(v17, 20)) {
          goto LABEL_21;
        }
        unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v23 = v18;
        long long v24 = v18;
        long long v22 = v18;
        ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v22);
        uint64_t v19 = MEMORY[0x21D485430](&v22, "Sent reply for: ");
        xpc::dict::to_debug_string((xpc::dict *)__p, (uint64_t)*a2);
        MEMORY[0x21D485440](v19, __p);
        if (v21 < 0) {
          operator delete(__p[0]);
        }
      }
      else
      {
        uint64_t v14 = (ctu::LoggerCommonBase *)(v5 + 80);
        ctu::LoggerCommonBase::getLogLevel(v14);
        if (!(**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v14)(v14, 20))
        {
LABEL_21:
          xpc_release(v11);
          xpc_release(v9);
          goto LABEL_22;
        }
        unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v23 = v15;
        long long v24 = v15;
        long long v22 = v15;
        ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v22);
        uint64_t v16 = MEMORY[0x21D485430](&v22, "Unable to send reply for: ");
        xpc::dict::to_debug_string((xpc::dict *)__p, (uint64_t)*a2);
        MEMORY[0x21D485440](v16, __p);
        if (v21 < 0) {
          operator delete(__p[0]);
        }
      }
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x21D4853A0](&v22);
      goto LABEL_21;
    }
  }
}

void sub_219296714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x21D4853A0](&a16);
  xpc_release(v18);
  xpc_release(v17);
  std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Command::create(uint64_t a1@<X0>, uint64_t a2@<X1>, xpc_object_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  xpc_object_t v9 = *(void **)a2;
  if (*(void *)a2) {
    xpc_object_t v9 = _Block_copy(v9);
  }
  uint64_t v10 = *(NSObject **)(a2 + 8);
  aBlock = v9;
  xpc_object_t object = v10;
  if (v10) {
    dispatch_retain(v10);
  }
  xpc_object_t v11 = *a3;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t v11 = xpc_null_create();
  }
  uint64_t v12 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_dictionary_create(0, 0, 0);
  uint64_t v13 = v12;
  uint64_t v14 = MEMORY[0x263EF8708];
  if (v12)
  {
    v8->~__shared_weak_count = v12;
  }
  else
  {
    uint64_t v13 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    v8->~__shared_weak_count = v13;
    if (!v13)
    {
      long long v15 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
      uint64_t v13 = 0;
      goto LABEL_15;
    }
  }
  if (MEMORY[0x21D485890](v13) == v14)
  {
    xpc_retain(v13);
    goto LABEL_16;
  }
  long long v15 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
LABEL_15:
  v8->~__shared_weak_count = v15;
LABEL_16:
  xpc_release(v13);
  if (aBlock) {
    uint64_t v16 = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(aBlock);
  }
  else {
    uint64_t v16 = 0;
  }
  v8->~__shared_weak_count_0 = v16;
  v8->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))object;
  if (object) {
    dispatch_retain(object);
  }
  if (MEMORY[0x21D485890](v11) == v14)
  {
    if (v11)
    {
      xpc_retain(v11);
      v17 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v11;
    }
    else
    {
      v17 = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    }
    long long v18 = v8->~__shared_weak_count;
    v8->~__shared_weak_count = v17;
    xpc_release(v18);
  }
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v19 = (const char *)a1;
  }
  else {
    uint64_t v19 = *(const char **)a1;
  }
  xpc_object_t v26 = xpc_string_create(v19);
  if (!v26) {
    xpc_object_t v26 = xpc_null_create();
  }
  v25[0] = &v8->~__shared_weak_count;
  v25[1] = "command";
  xpc::dict::object_proxy::operator=((uint64_t)v25, &v26, &v27);
  xpc_release(v27);
  xpc_object_t v27 = 0;
  xpc_release(v26);
  v20 = (std::__shared_weak_count *)operator new(0x20uLL);
  v20->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA7728;
  v20->__shared_owners_ = 0;
  v20->__shared_weak_owners_ = 0;
  v20[1].__vftable = v8;
  xpc_release(v11);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  char v21 = operator new(0x10uLL);
  atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  *char v21 = v8;
  v21[1] = v20;
  atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  *a4 = v21;
  v25[0] = v21;
  long long v22 = operator new(0x20uLL);
  void *v22 = &unk_26CAA77A0;
  v22[1] = 0;
  v22[2] = 0;
  v22[3] = v21;
  a4[1] = v22;
  v25[0] = 0;
  std::unique_ptr<TelephonyXPC::Event>::reset[abi:ne180100](v25);
  std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  std::__shared_weak_count::__release_shared[abi:ne180100](v20);
}

void sub_219296A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_ptr<TelephonyXPC::Event>::reset[abi:ne180100]((void **)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  _Unwind_Resume(a1);
}

void sub_219296A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::default_delete<TelephonyXPC::Command::State>::operator()[abi:ne180100](v9);
  xpc_release(v10);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a9);
  JUMPOUT(0x219296A8CLL);
}

xpc_object_t xpc::dict::object_proxy::operator=@<X0>(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, xpc_object_t *a3@<X8>)
{
  xpc_dictionary_set_value(**(xpc_object_t **)a1, *(const char **)(a1 + 8), *a2);
  *a3 = *a2;
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

void ___ZN12TelephonyXPC6Client5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (object)
  {
    xpc_object_t v3 = object;
    xpc_retain(object);
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t objecta = v3;
  xpc_object_t v5 = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v4 + 16))(v4, &objecta);
  xpc_release(objecta);
  xpc_release(v5);
}

void sub_219296BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke_2(void *a1, xpc_object_t *a2)
{
  xpc_object_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    long long v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = v6;
      if (!a1[5])
      {
LABEL_30:
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        return;
      }
      xpc_object_t v8 = *a2;
      if (v8 && MEMORY[0x21D485890](v8) == MEMORY[0x263EF8708]) {
        xpc_retain(v8);
      }
      else {
        xpc_object_t v8 = xpc_null_create();
      }
      *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)std::string v28 = v9;
      *(_OWORD *)&v28[16] = v9;
      std::string::basic_string[abi:ne180100]<0>(&v22, "Unknown internal error");
      *(_DWORD *)std::string v28 = -534716416;
      *(_OWORD *)&v28[8] = v22;
      *(void *)&v28[24] = v23;
      xpc_object_t v26 = v8;
      xpc_object_t v27 = (void *)0xAAAAAAAAAAAAAAAALL;
      if (v8) {
        xpc_retain(v8);
      }
      else {
        xpc_object_t v26 = xpc_null_create();
      }
      TelephonyXPC::Client::State::parseReply_sync(&v27, &v26, (uint64_t)v28);
      xpc_release(v26);
      xpc_object_t v26 = 0;
      uint64_t v10 = (ctu::LoggerCommonBase *)(v5 + 80);
      if (*(_DWORD *)v28)
      {
        ctu::LoggerCommonBase::getLogLevel(v10);
        if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v10)(v10, 20))
        {
          unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v23 = v11;
          long long v24 = v11;
          long long v22 = v11;
          ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v22);
          uint64_t v12 = MEMORY[0x21D485430](&v22, "Failure: ");
          TelephonyXPC::Result::describe((TelephonyXPC::Result *)__p, (uint64_t)v28);
          MEMORY[0x21D485440](v12, __p);
          if (v21 < 0) {
            operator delete(__p[0]);
          }
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
          goto LABEL_18;
        }
      }
      else
      {
        ctu::LoggerCommonBase::getLogLevel(v10);
        if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v10)(v10, 20))
        {
          unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v23 = v13;
          long long v24 = v13;
          long long v22 = v13;
          ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v22);
          uint64_t v14 = MEMORY[0x21D485430](&v22, "Successful: ");
          MEMORY[0x21D485440](v14, a1 + 7);
          ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
LABEL_18:
          MEMORY[0x21D4853A0](&v22);
        }
      }
      long long v15 = (uint64_t *)a1[10];
      int v18 = *(_DWORD *)v28;
      if ((v28[31] & 0x80000000) != 0) {
        std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)&v28[8], *(std::string::size_type *)&v28[16]);
      }
      else {
        std::string v19 = *(std::string *)&v28[8];
      }
      xpc_object_t v16 = v27;
      v17 = v27;
      if (v27)
      {
        xpc_retain(v27);
      }
      else
      {
        xpc_object_t v16 = xpc_null_create();
        v17 = v16;
      }
      TelephonyXPC::Command::notify(v15, (uint64_t)&v18, &v17);
      xpc_release(v16);
      v17 = 0;
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v19.__r_.__value_.__l.__data_);
      }
      xpc_release(v27);
      if ((v28[31] & 0x80000000) != 0) {
        operator delete(*(void **)&v28[8]);
      }
      xpc_release(v8);
      goto LABEL_30;
    }
  }
}

void sub_219296EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  xpc_release(*(xpc_object_t *)(v25 - 88));
  if (*(char *)(v25 - 49) < 0) {
    operator delete(*(void **)(v25 - 72));
  }
  xpc_release(v24);
  std::__shared_weak_count::__release_shared[abi:ne180100](v23);
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
    long long v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    long long v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void TelephonyXPC::Command::notify(uint64_t *a1, uint64_t a2, void **a3)
{
  uint64_t v4 = *a1;
  int v7 = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else {
    std::string __p = *(std::string *)(a2 + 8);
  }
  size_t v5 = *a3;
  xpc_object_t object = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Command::State::notify(v4, &v7, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_219297138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void TelephonyXPC::Command::State::notify(uint64_t a1, int *a2, xpc_object_t *a3)
{
  if (*(void *)(a1 + 8) && *(void *)(a1 + 16))
  {
    int v10 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&v11, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string v11 = *(std::string *)(a2 + 2);
    }
    xpc_object_t v5 = *a3;
    if (v5) {
      xpc_retain(v5);
    }
    else {
      xpc_object_t v5 = xpc_null_create();
    }
    long long v6 = *(const void **)(a1 + 8);
    if (v6) {
      int v7 = _Block_copy(v6);
    }
    else {
      int v7 = 0;
    }
    uint64_t v8 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEclIJS2_S4_EEEvDpT__block_invoke;
    block[3] = &__block_descriptor_tmp_1;
    if (v7) {
      long long v9 = _Block_copy(v7);
    }
    else {
      long long v9 = 0;
    }
    aBlock = v9;
    int v14 = v10;
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v11;
    }
    xpc_object_t object = v5;
    if (v5) {
      xpc_retain(v5);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    dispatch_async(v8, block);
    xpc_release(object);
    xpc_object_t object = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v7) {
      _Block_release(v7);
    }
    xpc_release(v5);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
}

void sub_21929732C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v21) {
    _Block_release(v21);
  }
  xpc_release(v20);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::parseReply_sync(void **a1, void *a2, uint64_t a3)
{
  *a1 = (void *)0xAAAAAAAAAAAAAAAALL;
  *a1 = xpc_null_create();
  memset(&__p, 170, sizeof(__p));
  std::string::basic_string[abi:ne180100]<0>(&__p, "Server not available");
  if (MEMORY[0x21D485890](*a2) == MEMORY[0x263EF8708])
  {
    long long v13 = a2;
    int v14 = "commandData";
    xpc::dict::object_proxy::operator xpc::dict((uint64_t)&v13, &object);
    std::string::size_type v7 = object.__r_.__value_.__r.__words[0];
    object.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    uint64_t v8 = *a1;
    *a1 = (void *)v7;
    xpc_release(v8);
    xpc_release(object.__r_.__value_.__l.__data_);
    long long v13 = a2;
    int v14 = "commandResult";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v13, &object);
    int v6 = xpc::dyn_cast_or_default();
    xpc_release(object.__r_.__value_.__l.__data_);
    v9[0] = a1;
    v9[1] = "KeyErrorString";
    xpc::dict::object_proxy::operator xpc::object((uint64_t)v9, &v10);
    long long v13 = 0;
    int v14 = 0;
    uint64_t v15 = 0;
    xpc::dyn_cast_or_default();
    if (SHIBYTE(v15) < 0) {
      operator delete(v13);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = object;
    *((unsigned char *)&object.__r_.__value_.__s + 23) = 0;
    object.__r_.__value_.__s.__data_[0] = 0;
    xpc_release(v10);
  }
  else
  {
    int v6 = -534716415;
  }
  *(_DWORD *)a3 = v6;
  std::string::operator=((std::string *)(a3 + 8), &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_219297518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, xpc_object_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (*(char *)(v21 - 33) < 0) {
    operator delete(*(void **)(v21 - 56));
  }
  xpc_release(object);
  if (a20 < 0) {
    operator delete(__p);
  }
  xpc::dict::~dict(v20);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Event::getData(TelephonyXPC::Event *this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)this;
  *a2 = 0xAAAAAAAAAAAAAAAALL;
  v3[0] = v2;
  v3[1] = "eventData";
  xpc::dict::object_proxy::operator xpc::dict((uint64_t)v3, a2);
}

void xpc::dict::object_proxy::operator xpc::dict(uint64_t a1@<X0>, void *a2@<X8>)
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
  if (MEMORY[0x21D485890](v4) != MEMORY[0x263EF8708])
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

void TelephonyXPC::Client::State::perform_sync(void *a1, uint64_t *a2)
{
  if (*a2)
  {
    xpc_object_t v3 = (std::__shared_weak_count *)a1[2];
    if (!v3 || (uint64_t v5 = a1[1], (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    std::string::size_type v7 = v6;
    p_shared_weak_owners = &v6->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 1174405120;
    v15[2] = ___ZN12TelephonyXPC6Client5State12perform_syncENSt3__110shared_ptrINS_7CommandEEE_block_invoke;
    v15[3] = &__block_descriptor_tmp_44;
    v15[4] = a1;
    v15[5] = v5;
    xpc_object_t v16 = v7;
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    long long v9 = (std::__shared_weak_count *)a2[1];
    uint64_t v17 = *a2;
    int v18 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    xpc_object_t v10 = (std::__shared_weak_count *)a1[2];
    if (!v10 || (v11 = a1[1], (uint64_t v12 = std::__shared_weak_count::lock(v10)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    long long v13 = v12;
    int v14 = a1[3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
    block[3] = &__block_descriptor_tmp_26;
    block[5] = v11;
    v20 = v13;
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    void block[4] = v15;
    dispatch_async(v14, block);
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if (v16) {
      std::__shared_weak_count::__release_weak(v16);
    }
    std::__shared_weak_count::__release_weak(v7);
  }
}

void TelephonyXPC::Client::State::handleMessage_sync(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = a1 + 80;
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(v4, 20))
  {
    v39 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v37 = v5;
    *(_OWORD *)v38 = v5;
    *(_OWORD *)block = v5;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)block);
    uint64_t v6 = MEMORY[0x21D485430](block, "Message From Server: ");
    xpc::dict::to_debug_string((xpc::dict *)&__p, *a2);
    MEMORY[0x21D485440](v6, &__p);
    if (v35 < 0) {
      operator delete(__p);
    }
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](block);
  }
  std::string::size_type v7 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v7 || (uint64_t v8 = *(void *)(a1 + 8), (v9 = std::__shared_weak_count::lock(v7)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v10 = v9;
  atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  std::string __p = (void *)0xAAAAAAAAAAAAAAAALL;
  long long v34 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = (void *)*a2;
  xpc_object_t v32 = v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t v32 = xpc_null_create();
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TelephonyXPC6Client5State18handleMessage_syncEN3xpc4dictE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_88;
  aBlock[4] = a1;
  aBlock[5] = v8;
  uint64_t v29 = v10;
  atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  uint64_t v12 = _Block_copy(aBlock);
  long long v13 = *(NSObject **)(a1 + 24);
  if (v13) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  }
  v30 = v12;
  dispatch_object_t object = v13;
  TelephonyXPC::Event::create(&v32, (uint64_t)&v30, &__p);
  if (object) {
    dispatch_release(object);
  }
  if (v30) {
    _Block_release(v30);
  }
  xpc_release(v32);
  xpc_object_t v32 = 0;
  TelephonyXPC::Event::State::name(*(TelephonyXPC::Event::State **)__p);
  int v14 = (void *)BYTE7(v37);
  if (SBYTE7(v37) < 0) {
    int v14 = block[1];
  }
  if (v14 != (void *)7)
  {
    BOOL v19 = 0;
    if ((SBYTE7(v37) & 0x80000000) == 0) {
      goto LABEL_28;
    }
LABEL_31:
    operator delete(block[0]);
    if (v19) {
      goto LABEL_53;
    }
    goto LABEL_32;
  }
  uint64_t v15 = (void **)block[0];
  if ((SBYTE7(v37) & 0x80u) == 0) {
    uint64_t v15 = block;
  }
  int v16 = *(_DWORD *)v15;
  int v17 = *(_DWORD *)((char *)v15 + 3);
  BOOL v19 = v16 == *(_DWORD *)"invalid" && v17 == *(_DWORD *)"alid";
  if (SBYTE7(v37) < 0) {
    goto LABEL_31;
  }
LABEL_28:
  if (v19) {
    goto LABEL_53;
  }
LABEL_32:
  uint64_t v20 = *(void *)(a1 + 224);
  TelephonyXPC::Event::State::name(*(TelephonyXPC::Event::State **)__p);
  uint64_t v21 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::find<std::string>(v20, block);
  if (SBYTE7(v37) < 0) {
    operator delete(block[0]);
  }
  if ((void *)(*(void *)(a1 + 224) + 8) != v21)
  {
    long long v23 = __p;
    long long v22 = v34;
    if (v34) {
      atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    long long v24 = (const void *)v21[7];
    if (v24) {
      uint64_t v25 = _Block_copy(v24);
    }
    else {
      uint64_t v25 = 0;
    }
    xpc_object_t v26 = v21[8];
    block[0] = (void *)MEMORY[0x263EF8330];
    block[1] = (void *)1174405120;
    *(void *)&long long v37 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke;
    *((void *)&v37 + 1) = &__block_descriptor_tmp_79;
    if (v25) {
      xpc_object_t v27 = _Block_copy(v25);
    }
    else {
      xpc_object_t v27 = 0;
    }
    v38[0] = v27;
    v38[1] = v23;
    v39 = v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_async(v26, block);
    if (v39) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v39);
    }
    if (v38[0]) {
      _Block_release(v38[0]);
    }
    if (v25) {
      _Block_release(v25);
    }
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
LABEL_53:
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  if (v29) {
    std::__shared_weak_count::__release_weak(v29);
  }
  std::__shared_weak_count::__release_weak(v10);
}

void sub_219297BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, char a17, uint64_t a18, xpc_object_t object, void *__p,std::__shared_weak_count *a21,int a22,__int16 a23,char a24,char a25,char a26)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  std::__shared_weak_count::__release_weak(v26);
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void TelephonyXPC::Event::State::name(TelephonyXPC::Event::State *this)
{
  v1[0] = this;
  v1[1] = "event";
  xpc_object_t object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v1, &object);
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_219297D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
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

void *std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::find<std::string>(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)(a1 + 8);
  xpc_object_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  long long v5 = (void *)(a1 + 8);
  do
  {
    char v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0) {
      std::string::size_type v7 = v3;
    }
    else {
      std::string::size_type v7 = v3 + 1;
    }
    if (v6 >= 0) {
      long long v5 = v3;
    }
    xpc_object_t v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void *a2)
{
  size_t v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    size_t v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (void *)*a1;
    size_t v3 = v2;
  }
  size_t v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (void *)*a2;
    size_t v5 = v4;
  }
  if (v5 >= v3) {
    size_t v6 = v3;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (v3 == v5) {
      return 0;
    }
    if (v3 >= v5) {
      return 1;
    }
  }
  return 255;
}

void std::__shared_ptr_pointer<TelephonyXPC::Event::State *,std::shared_ptr<TelephonyXPC::Event::State>::__shared_ptr_default_delete<TelephonyXPC::Event::State,TelephonyXPC::Event::State>,std::allocator<TelephonyXPC::Event::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(TelephonyXPC::Event::State **)(a1 + 24);
  if (v1)
  {
    TelephonyXPC::Event::State::~State(v1);
    operator delete(v2);
  }
}

void TelephonyXPC::Event::create(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  size_t v6 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  xpc_object_t v7 = *a1;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t v7 = xpc_null_create();
  }
  if (*(void *)a2) {
    uint64_t v8 = _Block_copy(*(const void **)a2);
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = *(NSObject **)(a2 + 8);
  if (v9) {
    dispatch_retain(v9);
  }
  v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
  if (v7)
  {
    xpc_retain(v7);
    if (v8)
    {
LABEL_11:
      xpc_object_t v10 = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(v8);
      goto LABEL_14;
    }
  }
  else
  {
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    if (v8) {
      goto LABEL_11;
    }
  }
  xpc_object_t v10 = 0;
LABEL_14:
  v6->~__shared_weak_count_0 = v10;
  v6->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v9;
  if (v9) {
    dispatch_retain(v9);
  }
  uint64_t v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA7018;
  v11->__shared_owners_ = 0;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = v6;
  if (v9) {
    dispatch_release(v9);
  }
  if (v8) {
    _Block_release(v8);
  }
  xpc_release(v7);
  uint64_t v12 = operator new(0x10uLL);
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  void *v12 = v6;
  v12[1] = v11;
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  *a3 = v12;
  long long v13 = operator new(0x20uLL);
  void *v13 = &unk_26CAA70C0;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = v12;
  a3[1] = v13;
  int v14 = 0;
  std::unique_ptr<TelephonyXPC::Event>::reset[abi:ne180100](&v14);
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);

  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
}

void sub_219298074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<TelephonyXPC::Event>::reset[abi:ne180100]((void **)va);
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  _Unwind_Resume(a1);
}

void sub_2192980A4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  TelephonyXPC::Event::State::~State(v10);
  operator delete(v12);
  dispatch::callback<void({block_pointer})(xpc::dict)>::~callback((uint64_t)&a10);
  xpc_release(v11);
  JUMPOUT(0x219298098);
}

void std::unique_ptr<TelephonyXPC::Event>::reset[abi:ne180100](void **a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    size_t v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    operator delete(v1);
  }
}

void TelephonyXPC::Event::State::~State(TelephonyXPC::Event::State *this)
{
  if (!*((void *)this + 1) || !*((void *)this + 2)) {
    goto LABEL_37;
  }
  TelephonyXPC::Event::State::name(this);
  uint64_t v2 = HIBYTE(v17);
  if (SHIBYTE(v17) < 0) {
    uint64_t v2 = v16;
  }
  if (v2 != 7)
  {
    BOOL v7 = 0;
    if (SHIBYTE(v17) < 0) {
      goto LABEL_19;
    }
LABEL_17:
    if (v7) {
      goto LABEL_37;
    }
    goto LABEL_20;
  }
  p_p = (int *)__p;
  if (SHIBYTE(v17) >= 0) {
    p_p = (int *)&__p;
  }
  int v4 = *p_p;
  int v5 = *(int *)((char *)p_p + 3);
  BOOL v7 = v4 == *(_DWORD *)"invalid" && v5 == *(_DWORD *)"alid";
  if ((SHIBYTE(v17) & 0x80000000) == 0) {
    goto LABEL_17;
  }
LABEL_19:
  operator delete(__p);
  if (v7) {
    goto LABEL_37;
  }
LABEL_20:
  xpc_object_t v8 = *(xpc_object_t *)this;
  if (*(void *)this) {
    xpc_retain(*(xpc_object_t *)this);
  }
  else {
    xpc_object_t v8 = xpc_null_create();
  }
  long long v9 = (const void *)*((void *)this + 1);
  if (v9) {
    xpc_object_t v10 = _Block_copy(v9);
  }
  else {
    xpc_object_t v10 = 0;
  }
  uint64_t v11 = *((void *)this + 2);
  std::string __p = (void *)MEMORY[0x263EF8330];
  uint64_t v16 = 1174405120;
  int v17 = ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke;
  int v18 = &__block_descriptor_tmp_0;
  if (v10) {
    uint64_t v12 = _Block_copy(v10);
  }
  else {
    uint64_t v12 = 0;
  }
  aBlock = v12;
  xpc_object_t object = v8;
  if (v8) {
    xpc_retain(v8);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  dispatch_async(v11, &__p);
  xpc_release(object);
  xpc_object_t object = 0;
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v10) {
    _Block_release(v10);
  }
  xpc_release(v8);
LABEL_37:
  long long v13 = *((void *)this + 2);
  if (v13) {
    dispatch_release(v13);
  }
  int v14 = (const void *)*((void *)this + 1);
  if (v14) {
    _Block_release(v14);
  }
  xpc_release(*(xpc_object_t *)this);
  *(void *)this = 0;
}

void std::__shared_ptr_pointer<TelephonyXPC::Command *,std::shared_ptr<TelephonyXPC::Command>::__shared_ptr_default_delete<TelephonyXPC::Command,TelephonyXPC::Command>,std::allocator<TelephonyXPC::Command>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    operator delete(v1);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Command::State *,std::shared_ptr<TelephonyXPC::Command::State>::__shared_ptr_default_delete<TelephonyXPC::Command::State,TelephonyXPC::Command::State>,std::allocator<TelephonyXPC::Command::State>>::__on_zero_shared(uint64_t a1)
{
}

void std::default_delete<TelephonyXPC::Command::State>::operator()[abi:ne180100](uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 16);
    if (v2) {
      dispatch_release(v2);
    }
    size_t v3 = *(const void **)(a1 + 8);
    if (v3) {
      _Block_release(v3);
    }
    xpc_release(*(xpc_object_t *)a1);
    operator delete((void *)a1);
  }
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

uint64_t __copy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *__copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
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

void *__copy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  xpc_object_t result = *(void **)(a2 + 32);
  if (result) {
    xpc_object_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  int v5 = (std::string *)(a1 + 7);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 56);
    a1[9] = *(void *)(a2 + 72);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  uint64_t v7 = *(void *)(a2 + 88);
  a1[10] = *(void *)(a2 + 80);
  a1[11] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
}

void sub_21929855C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

void *TelephonyXPC::Event::Event(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void TelephonyXPC::Event::getName(TelephonyXPC::Event::State **this)
{
}

void TelephonyXPC::Event::name(TelephonyXPC::Event::State **this)
{
}

uint64_t dispatch::callback<void({block_pointer})(xpc::dict)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void std::__shared_ptr_pointer<TelephonyXPC::Event::State *,std::shared_ptr<TelephonyXPC::Event::State>::__shared_ptr_default_delete<TelephonyXPC::Event::State,TelephonyXPC::Event::State>,std::allocator<TelephonyXPC::Event::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Event::State *,std::shared_ptr<TelephonyXPC::Event::State>::__shared_ptr_default_delete<TelephonyXPC::Event::State,TelephonyXPC::Event::State>,std::allocator<TelephonyXPC::Event::State>>::__get_deleter(uint64_t a1, uint64_t a2)
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

void std::__shared_ptr_pointer<TelephonyXPC::Event *,std::shared_ptr<TelephonyXPC::Event>::__shared_ptr_default_delete<TelephonyXPC::Event,TelephonyXPC::Event>,std::allocator<TelephonyXPC::Event>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Event *,std::shared_ptr<TelephonyXPC::Event>::__shared_ptr_default_delete<TelephonyXPC::Event,TelephonyXPC::Event>,std::allocator<TelephonyXPC::Event>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void TelephonyXPC::Client::State::~State(TelephonyXPC::Client::State *this)
{
  *(void *)this = &unk_26CAA7138;
  *((void *)this + 9) = &unk_26CAA7168;
  uint64_t v2 = (const void *)*((void *)this + 30);
  if (v2)
  {
    if (*((void *)this + 32))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *((const void **)this + 32), *((CFNotificationName *)this + 30), 0);
      pthread_mutex_lock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
      uint64_t v4 = (os_unfair_lock_s *)xmmword_26AD00580;
      if (!(void)xmmword_26AD00580)
      {
        int v5 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
        *(_OWORD *)&v5->__on_zero_shared = 0u;
        *(_OWORD *)&v5->__on_zero_shared_weak = 0u;
        *(_OWORD *)&v5->~__shared_weak_count = 0u;
        std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>((std::__shared_weak_count_vtbl **)&v12, v5);
        long long v6 = v12;
        long long v12 = 0uLL;
        uint64_t v7 = (std::__shared_weak_count *)*((void *)&xmmword_26AD00580 + 1);
        xmmword_26AD00580 = v6;
        if (v7)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v7);
          if (*((void *)&v12 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
          }
        }
        uint64_t v4 = (os_unfair_lock_s *)xmmword_26AD00580;
      }
      xpc_object_t v8 = (std::__shared_weak_count *)*((void *)&xmmword_26AD00580 + 1);
      if (*((void *)&xmmword_26AD00580 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26AD00580 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
      uint64_t v9 = *((void *)this + 32);
      if (v9)
      {
        *(void *)&long long v12 = MEMORY[0x263EF8330];
        *((void *)&v12 + 1) = 0x40000000;
        long long v13 = ___ZN12TelephonyXPC18ClientStateTracker6removeEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke;
        int v14 = &__block_descriptor_tmp;
        uint64_t v15 = v4;
        uint64_t v16 = v9;
        xpc_object_t v10 = v4 + 4;
        os_unfair_lock_lock(v10);
        v13((uint64_t)&v12);
        os_unfair_lock_unlock(v10);
      }
      if (v8) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      }
      *((void *)this + 32) = 0;
      uint64_t v2 = (const void *)*((void *)this + 30);
    }
    CFRelease(v2);
  }
  uint64_t v11 = (std::__shared_weak_count *)*((void *)this + 29);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (*((char *)this + 215) < 0) {
    operator delete(*((void **)this + 24));
  }
  if (*((char *)this + 191) < 0) {
    operator delete(*((void **)this + 21));
  }
  if (*((char *)this + 167) < 0) {
    operator delete(*((void **)this + 18));
  }
  *((void *)this + 9) = &unk_26CAA71F8;
  MEMORY[0x21D485380]((char *)this + 80);
  ctu::XpcClient::~XpcClient(this);
}

{
  void *v1;
  uint64_t vars8;

  TelephonyXPC::Client::State::~State(this);

  operator delete(v1);
}

void sub_219298950(void *a1)
{
}

void TelephonyXPC::Client::State::Parameters::~Parameters(void **this)
{
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void non-virtual thunk to'TelephonyXPC::Client::State::~State(TelephonyXPC::Client::State *this)
{
}

{
  void *v1;
  uint64_t vars8;

  TelephonyXPC::Client::State::~State((TelephonyXPC::Client::State *)((char *)this - 72));

  operator delete(v1);
}

void TelephonyXPC::Client::create(void **a1@<X0>, std::string::size_type *a2@<X1>, void *a3@<X8>)
{
  int v5 = *a1;
  xpc_object_t v30 = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t v30 = xpc_null_create();
  }
  std::string::size_type v7 = *a2;
  long long v6 = (std::__shared_weak_count *)a2[1];
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (MEMORY[0x21D485890](v30) != MEMORY[0x263EF8708])
  {
    xpc_object_t v8 = 0;
LABEL_8:
    syslog(3, "Could not create TelephonyXPCClient, verify parameters\n");
    uint64_t v9 = 0;
    goto LABEL_75;
  }
  memset(v35, 0, 56);
  *(_OWORD *)__s = 0u;
  block = &v30;
  v39 = "ServiceXPCName";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&block, object);
  xpc::dyn_cast_or_default();
  *(_OWORD *)__s = *(_OWORD *)&v31.__r_.__value_.__l.__data_;
  *(void *)char v35 = *((void *)&v31.__r_.__value_.__l + 2);
  *((unsigned char *)&v31.__r_.__value_.__s + 23) = 0;
  v31.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(object[0]);
  block = &v30;
  v39 = "ServiceNotificationName";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&block, object);
  xpc::dyn_cast_or_default();
  *(std::string *)&v35[8] = v31;
  *((unsigned char *)&v31.__r_.__value_.__s + 23) = 0;
  v31.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(object[0]);
  block = &v30;
  v39 = "ClientHostName";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)&block, object);
  xpc::dyn_cast_or_default();
  *(std::string *)&v35[32] = v31;
  *((unsigned char *)&v31.__r_.__value_.__s + 23) = 0;
  v31.__r_.__value_.__s.__data_[0] = 0;
  xpc_release(object[0]);
  xpc_object_t v10 = (std::string::value_type *)v35[7];
  int v11 = v35[7];
  long long v12 = __s[1];
  if (v35[7] < 0) {
    xpc_object_t v10 = __s[1];
  }
  if (!v10)
  {
    xpc_object_t v8 = 0;
    uint64_t v9 = 0;
    if ((v35[55] & 0x80) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
  int v13 = v35[31];
  std::string::size_type v14 = *(void *)&v35[16];
  if (v35[31] >= 0) {
    uint64_t v15 = v35[31];
  }
  else {
    uint64_t v15 = *(void *)&v35[16];
  }
  uint64_t v16 = v35[55];
  int v17 = v35[55];
  if (!v15) {
    goto LABEL_21;
  }
  std::string::size_type v18 = *(void *)&v35[40];
  if (v35[55] < 0) {
    uint64_t v16 = *(void *)&v35[40];
  }
  if (!v16)
  {
LABEL_21:
    xpc_object_t v8 = 0;
    uint64_t v9 = 0;
    if ((v35[55] & 0x80) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
  uint64_t v9 = (std::string *)operator new(0x108uLL);
  if (v11 < 0)
  {
    std::string::__init_copy_ctor_external(&v31, __s[0], (std::string::size_type)v12);
  }
  else
  {
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = *(_OWORD *)__s;
    v31.__r_.__value_.__r.__words[2] = *(void *)v35;
  }
  if (v13 < 0) {
    std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)&v35[8], v14);
  }
  else {
    std::string v32 = *(std::string *)&v35[8];
  }
  if (v17 < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)&v35[32], v18);
  }
  else {
    std::string __p = *(std::string *)&v35[32];
  }
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  std::string::basic_string[abi:ne180100]<0>(&block, (char *)p_p);
  ctu::XpcClient::XpcClient();
  if (SHIBYTE(v40) < 0) {
    operator delete(block);
  }
  v9[3].__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26CAA71F8;
  ctu::LoggerCommonBase::LoggerCommonBase();
  v9[3].__r_.__value_.__l.__size_ = (std::string::size_type)&unk_26CAA7238;
  v9[5].__r_.__value_.__l.__size_ = v7;
  v9[5].__r_.__value_.__r.__words[2] = (std::string::size_type)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v9->__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26CAA7138;
  v9[3].__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26CAA7168;
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(v9 + 6, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
  }
  else {
    void v9[6] = v31;
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(v9 + 7, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
  }
  else {
    v9[7] = v32;
  }
  uint64_t v20 = v9 + 8;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v20, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)&v20->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    v9[8].__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
  }
  v9[9].__r_.__value_.__r.__words[0] = 0;
  uint64_t v21 = operator new(0x18uLL);
  v21[2] = 0;
  v21[1] = 0;
  *uint64_t v21 = v21 + 1;
  v9[9].__r_.__value_.__l.__size_ = (std::string::size_type)v21;
  object[0] = v21;
  long long v22 = operator new(0x20uLL);
  void *v22 = &unk_26CAA7278;
  v22[1] = 0;
  v22[2] = 0;
  v22[3] = v21;
  v9[9].__r_.__value_.__r.__words[2] = (std::string::size_type)v22;
  object[0] = 0;
  std::unique_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::reset[abi:ne180100]((void ***)object);
  LODWORD(v9[10].__r_.__value_.__r.__words[1]) = 0;
  long long v23 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  v9[10].__r_.__value_.__r.__words[2] = 0;
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v24 = &v32;
  }
  else {
    long long v24 = (std::string *)v32.__r_.__value_.__r.__words[0];
  }
  v9[10].__r_.__value_.__r.__words[0] = (std::string::size_type)CFStringCreateWithCString(*v23, (const char *)v24, 0x600u);
  ctu::LoggerCommonBase::setLogLevel();
  xpc_object_t v8 = (std::__shared_weak_count *)operator new(0x20uLL);
  v8->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA72F0;
  v8->__shared_owners_ = 0;
  v8->__shared_weak_owners_ = 0;
  v8[1].__vftable = (std::__shared_weak_count_vtbl *)v9;
  uint64_t v25 = (std::__shared_weak_count *)v9->__r_.__value_.__r.__words[2];
  if (v25)
  {
    if (v25->__shared_owners_ != -1) {
      goto LABEL_58;
    }
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v9->__r_.__value_.__l.__size_ = (std::string::size_type)v9;
    v9->__r_.__value_.__r.__words[2] = (std::string::size_type)v8;
    std::__shared_weak_count::__release_weak(v25);
  }
  else
  {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v9->__r_.__value_.__l.__size_ = (std::string::size_type)v9;
    v9->__r_.__value_.__r.__words[2] = (std::string::size_type)v8;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v8);
LABEL_58:
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  object[0] = (xpc_object_t)MEMORY[0x263EF8330];
  object[1] = (xpc_object_t)0x40000000;
  object[2] = ___ZN12TelephonyXPC6Client5State4initEv_block_invoke;
  object[3] = &__block_descriptor_tmp_15;
  object[4] = v9;
  long long v37 = object;
  block = (xpc_object_t *)MEMORY[0x263EF8330];
  v39 = (const char *)0x40000000;
  v40 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  v41 = &__block_descriptor_tmp_16;
  p_size = &v9->__r_.__value_.__l.__size_;
  v43 = &v37;
  data = v9[1].__r_.__value_.__l.__data_;
  if (v9[1].__r_.__value_.__l.__size_)
  {
    dispatch_async_and_wait(data, &block);
    if ((v17 & 0x80) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
  dispatch_sync(data, &block);
  if ((v17 & 0x80) != 0) {
LABEL_68:
  }
    operator delete(*(void **)&v35[32]);
LABEL_69:
  if ((v35[31] & 0x80000000) != 0)
  {
    operator delete(*(void **)&v35[8]);
    if ((v11 & 0x80000000) == 0)
    {
LABEL_71:
      if (!v9) {
        goto LABEL_8;
      }
      goto LABEL_75;
    }
  }
  else if ((v11 & 0x80000000) == 0)
  {
    goto LABEL_71;
  }
  operator delete(__s[0]);
  if (!v9) {
    goto LABEL_8;
  }
LABEL_75:
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  xpc_release(v30);
  xpc_object_t v30 = 0;
  xpc_object_t v27 = operator new(0x10uLL);
  std::string v28 = v27;
  if (v8)
  {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    void *v27 = v9;
    v27[1] = v8;
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    void *v27 = v9;
    v27[1] = 0;
  }
  *a3 = v27;
  __s[0] = (std::string::value_type *)v27;
  uint64_t v29 = operator new(0x20uLL);
  *uint64_t v29 = &unk_26CAA7680;
  v29[1] = 0;
  v29[2] = 0;
  v29[3] = v28;
  a3[1] = v29;
  __s[0] = 0;
  std::unique_ptr<TelephonyXPC::Event>::reset[abi:ne180100]((void **)__s);
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void sub_219299130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, xpc_object_t object, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,xpc_object_t a39)
{
  if (v40[191] < 0) {
    operator delete(*v43);
  }
  if (v40[167] < 0) {
    operator delete(*v41);
  }
  *a10 = a11;
  MEMORY[0x21D485380](v42);
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)v40);
  if (v39) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  }
  TelephonyXPC::Client::State::Parameters::~Parameters(&a13);
  operator delete(v40);
  TelephonyXPC::Client::State::Parameters::~Parameters(&a29);
  if (v39) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void xpc::dict::~dict(xpc_object_t *this)
{
  *this = 0;
}

void *TelephonyXPC::Client::Client(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void TelephonyXPC::Client::setEventHandler(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void *)*a1;
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v13 = *(std::string *)a2;
  }
  if (*(void *)a3) {
    int v5 = _Block_copy(*(const void **)a3);
  }
  else {
    int v5 = 0;
  }
  long long v6 = *(NSObject **)(a3 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1174405120;
  v14[2] = ___ZN12TelephonyXPC6Client5State15setEventHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS2_10shared_ptrINS_5EventEEEEEE_block_invoke;
  v14[3] = &__block_descriptor_tmp_71;
  v14[4] = v4;
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v13;
  }
  if (v5) {
    std::string::size_type v7 = _Block_copy(v5);
  }
  else {
    std::string::size_type v7 = 0;
  }
  aBlock = v7;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  xpc_object_t v8 = (std::__shared_weak_count *)v4[2];
  if (!v8 || (uint64_t v9 = v4[1], (v10 = std::__shared_weak_count::lock(v8)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v11 = v10;
  long long v12 = v4[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_26;
  block[5] = v9;
  BOOL v19 = v11;
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = v14;
  dispatch_async(v12, block);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
}

void sub_2192995C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void TelephonyXPC::Client::eventsOn(TelephonyXPC::Client *this)
{
  uint64_t v1 = *(void **)this;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  v7[2] = ___ZN12TelephonyXPC6Client5State8eventsOnEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_72;
  v7[4] = v1;
  uint64_t v2 = (std::__shared_weak_count *)v1[2];
  if (!v2 || (v3 = v1[1], (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v5 = v4;
  long long v6 = v1[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_26;
  block[5] = v3;
  uint64_t v9 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = v7;
  dispatch_async(v6, block);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

void TelephonyXPC::Client::perform(void **a1, uint64_t a2, uint64_t a3, void **a4)
{
  uint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  std::string::size_type v18 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v8 = *(void **)a3;
  if (*(void *)a3) {
    xpc_object_t v8 = _Block_copy(v8);
  }
  uint64_t v9 = *(NSObject **)(a3 + 8);
  aBlock = v8;
  dispatch_object_t v16 = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  xpc_object_t v10 = *a4;
  xpc_object_t object = v10;
  if (v10) {
    xpc_retain(v10);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Command::create(a2, (uint64_t)&aBlock, &object, &v17);
  xpc_release(object);
  xpc_object_t object = 0;
  if (v16) {
    dispatch_release(v16);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  int v11 = *a1;
  uint64_t v12 = v17;
  std::string v13 = v18;
  if (v18)
  {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    TelephonyXPC::Client::State::perform(v11, v12, v13);
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  else
  {
    TelephonyXPC::Client::State::perform(v11, v17, 0);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
}

void sub_219299854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void TelephonyXPC::Client::performWithBlockingSyncReply(uint64_t *a1, uint64_t a2, uint64_t a3, void **a4, uint64_t a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v19 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  aBlock = 0;
  dispatch_object_t v17 = 0;
  uint64_t v9 = *a4;
  xpc_object_t object = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Command::create(a2, (uint64_t)&aBlock, &object, &v18);
  xpc_release(object);
  xpc_object_t object = 0;
  if (v17) {
    dispatch_release(v17);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  uint64_t v10 = *a1;
  uint64_t v12 = (TelephonyXPC::Command::State **)v18;
  int v11 = v19;
  if (v19) {
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v12)
  {
    memset(&v20, 170, sizeof(v20));
    TelephonyXPC::Command::State::name(*v12);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      std::string::size_type v14 = &v20;
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v14 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_debug_impl(&dword_219294000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Performing %s", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 1174405120;
    long long v22 = ___ZN12TelephonyXPC6Client5State28performWithBlockingSyncReplyENSt3__110shared_ptrINS_7CommandEEERNS_6ResultERN3xpc4dictE_block_invoke;
    long long v23 = &__block_descriptor_tmp_74;
    uint64_t v24 = v10;
    uint64_t v25 = v12;
    xpc_object_t v26 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v27 = a5;
    uint64_t v28 = a3;
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v20;
    }
    std::string v13 = *(NSObject **)(v10 + 32);
    if (v13)
    {
      dispatch_retain(*(dispatch_object_t *)(v10 + 32));
      if (dispatch_workloop_is_current()) {
        v22((uint64_t)&buf);
      }
      else {
        dispatch_sync(*(dispatch_queue_t *)(v10 + 24), &buf);
      }
      dispatch_release(v13);
    }
    else
    {
      dispatch_sync(*(dispatch_queue_t *)(v10 + 24), &buf);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v20.__r_.__value_.__l.__data_);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_219294000, &_os_log_internal, OS_LOG_TYPE_ERROR, "No command provided, exiting perform", (uint8_t *)&buf, 2u);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
}

void sub_219299B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  dispatch_release(v35);
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a26);
  }
  if (a19 < 0) {
    operator delete(a14);
  }
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  if (a13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a13);
  }
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::eventsOff(TelephonyXPC::Client *this)
{
  uint64_t v1 = *(void **)this;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 0x40000000;
  v7[2] = ___ZN12TelephonyXPC6Client5State9eventsOffEv_block_invoke;
  v7[3] = &__block_descriptor_tmp_75;
  v7[4] = v1;
  uint64_t v2 = (std::__shared_weak_count *)v1[2];
  if (!v2 || (v3 = v1[1], (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v5 = v4;
  long long v6 = v1[3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &__block_descriptor_tmp_26;
  block[5] = v3;
  uint64_t v9 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = v7;
  dispatch_async(v6, block);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

void TelephonyXPC::Client::State::handleServerError_sync(uint64_t a1, xpc::object *a2)
{
  uint64_t v4 = *(void *)(a1 + 224);
  std::string::basic_string[abi:ne180100]<0>(&block, "EventServerStateChange");
  int v5 = std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::find<std::string>(v4, &block);
  if (SBYTE7(v42) < 0) {
    operator delete((void *)block);
  }
  if ((void *)(*(void *)(a1 + 224) + 8) != v5)
  {
    xpc_object_t v40 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v7 = v6;
    uint64_t v8 = MEMORY[0x263EF8708];
    if (v6)
    {
      xpc_object_t v40 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v40 = v7;
      if (!v7)
      {
        xpc_object_t v9 = xpc_null_create();
        xpc_object_t v7 = 0;
        goto LABEL_11;
      }
    }
    if (MEMORY[0x21D485890](v7) == v8)
    {
      xpc_retain(v7);
      goto LABEL_12;
    }
    xpc_object_t v9 = xpc_null_create();
LABEL_11:
    xpc_object_t v40 = v9;
LABEL_12:
    xpc_release(v7);
    xpc_object_t v39 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v11 = v10;
    if (v10)
    {
      xpc_object_t v39 = v10;
    }
    else
    {
      xpc_object_t v11 = xpc_null_create();
      xpc_object_t v39 = v11;
      if (!v11)
      {
        xpc_object_t v12 = xpc_null_create();
        xpc_object_t v11 = 0;
        goto LABEL_19;
      }
    }
    if (MEMORY[0x21D485890](v11) == v8)
    {
      xpc_retain(v11);
LABEL_20:
      xpc_release(v11);
      xpc_object_t v37 = xpc_string_create("ServerStateError");
      if (!v37) {
        xpc_object_t v37 = xpc_null_create();
      }
      *(void *)&long long block = &v39;
      *((void *)&block + 1) = "KeyServerState";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v37, &object);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(v37);
      xpc_object_t v37 = 0;
      xpc::object::to_string((uint64_t *)&block, a2);
      if ((SBYTE7(v42) & 0x80u) == 0) {
        p_long long block = (const char *)&block;
      }
      else {
        p_long long block = (const char *)block;
      }
      xpc_object_t v35 = xpc_string_create(p_block);
      if (!v35) {
        xpc_object_t v35 = xpc_null_create();
      }
      v34[0] = &v39;
      v34[1] = "KeyErrorString";
      xpc::dict::object_proxy::operator=((uint64_t)v34, &v35, &v36);
      xpc_release(v36);
      xpc_object_t v36 = 0;
      xpc_release(v35);
      xpc_object_t v35 = 0;
      if (SBYTE7(v42) < 0) {
        operator delete((void *)block);
      }
      xpc_object_t v32 = xpc_string_create("eventNotification");
      if (!v32) {
        xpc_object_t v32 = xpc_null_create();
      }
      *(void *)&long long block = &v40;
      *((void *)&block + 1) = "command";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v32, &v33);
      xpc_release(v33);
      xpc_object_t v33 = 0;
      xpc_release(v32);
      xpc_object_t v32 = 0;
      xpc_object_t v30 = xpc_string_create("EventServerStateChange");
      if (!v30) {
        xpc_object_t v30 = xpc_null_create();
      }
      *(void *)&long long block = &v40;
      *((void *)&block + 1) = "event";
      xpc::dict::object_proxy::operator=((uint64_t)&block, &v30, &v31);
      xpc_release(v31);
      xpc_object_t v31 = 0;
      xpc_release(v30);
      xpc_object_t v30 = 0;
      xpc_object_t v14 = v39;
      if (v39) {
        xpc_retain(v39);
      }
      else {
        xpc_object_t v14 = xpc_null_create();
      }
      xpc_dictionary_set_value(v40, "eventData", v14);
      xpc_object_t v15 = xpc_null_create();
      xpc_release(v14);
      xpc_release(v15);
      xpc_object_t v27 = v40;
      if (v40) {
        xpc_retain(v40);
      }
      else {
        xpc_object_t v27 = xpc_null_create();
      }
      aBlock = 0;
      dispatch_object_t v26 = 0;
      TelephonyXPC::Event::create(&v27, (uint64_t)&aBlock, &v28);
      dispatch_object_t v16 = (const void *)v5[7];
      if (v16) {
        dispatch_object_t v17 = _Block_copy(v16);
      }
      else {
        dispatch_object_t v17 = 0;
      }
      unint64_t v18 = v5[8];
      *(void *)&long long block = MEMORY[0x263EF8330];
      *((void *)&block + 1) = 1174405120;
      *(void *)&long long v42 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEclIJS5_EEEvDpT__block_invoke;
      *((void *)&v42 + 1) = &__block_descriptor_tmp_79;
      if (v17) {
        BOOL v19 = _Block_copy(v17);
      }
      else {
        BOOL v19 = 0;
      }
      *(void *)&long long v43 = v19;
      *((void *)&v43 + 1) = v28;
      uint64_t v44 = v29;
      if (v29) {
        atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      dispatch_async(v18, &block);
      if (v44) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v44);
      }
      if ((void)v43) {
        _Block_release((const void *)v43);
      }
      if (v17) {
        _Block_release(v17);
      }
      if (v29) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v29);
      }
      if (v26) {
        dispatch_release(v26);
      }
      if (aBlock) {
        _Block_release(aBlock);
      }
      xpc_release(v27);
      xpc_object_t v27 = 0;
      xpc_release(v39);
      xpc_release(v40);
      goto LABEL_60;
    }
    xpc_object_t v12 = xpc_null_create();
LABEL_19:
    xpc_object_t v39 = v12;
    goto LABEL_20;
  }
LABEL_60:
  if (*(void *)a2 != MEMORY[0x263EF86C0])
  {
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
    {
      uint64_t v44 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v42 = v20;
      long long v43 = v20;
      long long block = v20;
      uint64_t v21 = ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&block);
      MEMORY[0x21D485430](v21, "Destroy server connection");
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x21D4853A0](&block);
    }
    int v22 = *(_DWORD *)(a1 + 248);
    if (v22)
    {
      *(_DWORD *)(a1 + 248) = v22 - 1;
      ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
      if ((**(unsigned int (***)(uint64_t, uint64_t))(a1 + 80))(a1 + 80, 20))
      {
        uint64_t v44 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v42 = v23;
        long long v43 = v23;
        long long block = v23;
        uint64_t v24 = ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&block);
        MEMORY[0x21D485430](v24, "Extra decreased to ");
        ctu::operator<<();
        ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
        MEMORY[0x21D4853A0](&block);
      }
      if (!*(_DWORD *)(a1 + 248))
      {
        TelephonyXPC::Client::State::destroyConnection_sync((TelephonyXPC::Client::State *)a1);
        TelephonyXPC::Client::State::handleServerReady_sync((TelephonyXPC::Client::State *)a1);
      }
    }
    else
    {
      TelephonyXPC::Client::State::destroyConnection_sync((TelephonyXPC::Client::State *)a1);
    }
  }
}

void sub_21929A30C(_Unwind_Exception *a1)
{
  MEMORY[0x21D4853A0](v1 - 112);
  _Unwind_Resume(a1);
}

void sub_21929A330(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, xpc_object_t object, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,xpc_object_t a25)
{
  dispatch::callback<void({block_pointer})(xpc::dict)>::~callback((uint64_t)&a10);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(a25);
  xpc_release(*(xpc_object_t *)(v25 - 120));
  JUMPOUT(0x21929A31CLL);
}

uint64_t ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

void ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 - 1) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)(a1 - 24), *(void *)(a1 - 16));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 - 24);
    a2->__r_.__value_.__r.__words[2] = *(void *)(a1 - 8);
  }
}

uint64_t ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

uint64_t ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

void ___ZN12TelephonyXPC18ClientStateTracker6removeEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(char **)(v1 + 32);
  if (*(char **)(v1 + 24) == v2)
  {
    uint64_t v3 = *(char **)(v1 + 24);
  }
  else
  {
    uint64_t v3 = *(char **)(v1 + 24);
    while (*(void *)v3 != *(void *)(a1 + 40))
    {
      v3 += 8;
      if (v3 == v2)
      {
        uint64_t v3 = *(char **)(v1 + 32);
        break;
      }
    }
  }
  if (v3 != v2)
  {
    uint64_t v4 = *(void **)v3;
    if (*(void *)v3)
    {
      int v5 = (std::__shared_weak_count *)v4[1];
      if (v5) {
        std::__shared_weak_count::__release_weak(v5);
      }
      operator delete(v4);
      uint64_t v2 = *(char **)(v1 + 32);
    }
    xpc_object_t v6 = v3;
    xpc_object_t v7 = v3 + 8;
    size_t v8 = v2 - (v3 + 8);
    if (v8) {
      memmove(v6, v7, v8);
    }
    *(void *)(v1 + 32) = &v6[v8];
  }
}

void *ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CAA71F8;
  MEMORY[0x21D485380](a1 + 1);
  return a1;
}

void ctu::Loggable<TelephonyXPC::Client::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CAA71F8;
  MEMORY[0x21D485380](a1 + 1);

  operator delete(a1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26439C180, MEMORY[0x263F8C060]);
}

void sub_21929A610(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  xpc_object_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void ***)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,0>(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 24);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v4 = *(void **)a1;
    operator delete(v4);
  }
}

void std::unique_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>::reset[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Client::State *,std::shared_ptr<TelephonyXPC::Client::State>::__shared_ptr_default_delete<TelephonyXPC::Client::State,TelephonyXPC::Client::State>,std::allocator<TelephonyXPC::Client::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Client::State *,std::shared_ptr<TelephonyXPC::Client::State>::__shared_ptr_default_delete<TelephonyXPC::Client::State,TelephonyXPC::Client::State>,std::allocator<TelephonyXPC::Client::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Client::State *,std::shared_ptr<TelephonyXPC::Client::State>::__shared_ptr_default_delete<TelephonyXPC::Client::State,TelephonyXPC::Client::State>,std::allocator<TelephonyXPC::Client::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void ___ZN12TelephonyXPC6Client5State4initEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  pthread_mutex_lock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  uint64_t v2 = (os_unfair_lock_s *)xmmword_26AD00580;
  if (!(void)xmmword_26AD00580)
  {
    uint64_t v3 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
    *(_OWORD *)&v3->__on_zero_shared = 0u;
    *(_OWORD *)&v3->__on_zero_shared_weak = 0u;
    *(_OWORD *)&v3->~__shared_weak_count = 0u;
    std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>((std::__shared_weak_count_vtbl **)&v21, v3);
    long long v4 = v21;
    long long v21 = 0uLL;
    int v5 = (std::__shared_weak_count *)*((void *)&xmmword_26AD00580 + 1);
    xmmword_26AD00580 = v4;
    if (v5)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      if (*((void *)&v21 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v21 + 1));
      }
    }
    uint64_t v2 = (os_unfair_lock_s *)xmmword_26AD00580;
  }
  xpc_object_t v6 = (std::__shared_weak_count *)*((void *)&xmmword_26AD00580 + 1);
  if (*((void *)&xmmword_26AD00580 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26AD00580 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  xpc_object_t v7 = *(std::__shared_weak_count **)(v1 + 16);
  if (!v7 || (uint64_t v8 = *(void *)(v1 + 8), (v9 = std::__shared_weak_count::lock(v7)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v10 = v9;
  if (v8)
  {
    *(void *)&long long v21 = MEMORY[0x263EF8330];
    *((void *)&v21 + 1) = 1174405120;
    *(void *)&long long v22 = ___ZN12TelephonyXPC18ClientStateTracker6insertENSt3__110shared_ptrINS_6Client5StateEEE_block_invoke;
    *((void *)&v22 + 1) = &__block_descriptor_tmp_18;
    *(void *)&long long v23 = v2;
    *((void *)&v23 + 1) = v8;
    uint64_t v24 = v9;
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    xpc_object_t v11 = v2 + 4;
    os_unfair_lock_lock(v2 + 4);
    uint64_t v12 = ((uint64_t (*)(long long *))v22)(&v21);
    os_unfair_lock_unlock(v11);
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  *(void *)(v1 + 256) = v12;
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (*(void *)(v1 + 256))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(v1 + 256), (CFNotificationCallback)TelephonyXPC::Client::State::handleDaemonReadyNotificationStatic, *(CFStringRef *)(v1 + 240), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
    {
      uint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v14;
      long long v23 = v14;
      long long v21 = v14;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v21);
      uint64_t v15 = MEMORY[0x21D485430](&v21, "Watching for notification: ");
      long long v19 = 0uLL;
      uint64_t v20 = 0;
      ctu::cf::assign();
      *(_OWORD *)std::string __p = 0uLL;
      uint64_t v18 = 0;
      MEMORY[0x21D485440](v15, __p);
      if (SHIBYTE(v18) < 0) {
        operator delete(__p[0]);
      }
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x21D4853A0](&v21);
    }
    TelephonyXPC::Client::State::connect_sync((TelephonyXPC::Client::State *)v1);
  }
  else
  {
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 80))
    {
      uint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v16;
      long long v23 = v16;
      long long v21 = v16;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v21);
      MEMORY[0x21D485430](&v21, "ClientStateTracker unable to insert state pointer");
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x21D4853A0](&v21);
    }
  }
}

void sub_21929AC18(_Unwind_Exception *a1, void *a2, uint64_t a3, int a4, __int16 a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  if (a7 < 0) {
    operator delete(a2);
  }
  MEMORY[0x21D4853A0](va);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::handleDaemonReadyNotificationStatic(TelephonyXPC::Client::State *this, __CFNotificationCenter *a2, void *a3, const __CFString *a4, const void *a5, const __CFDictionary *a6)
{
  void (*v22)(unint64_t *__return_ptr, long long *);
  void *v23;
  os_unfair_lock_s *v24;
  __CFNotificationCenter *v25;
  std::__shared_weak_count *v26;

  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  pthread_mutex_lock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  xpc_object_t v7 = (os_unfair_lock_s *)xmmword_26AD00580;
  if (!(void)xmmword_26AD00580)
  {
    uint64_t v8 = (std::__shared_weak_count_vtbl *)operator new(0x30uLL);
    *(_OWORD *)&v8->__on_zero_shared = 0u;
    *(_OWORD *)&v8->__on_zero_shared_weak = 0u;
    *(_OWORD *)&v8->~__shared_weak_count = 0u;
    std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>((std::__shared_weak_count_vtbl **)&block, v8);
    long long v9 = block;
    long long block = 0uLL;
    xpc_object_t v10 = (std::__shared_weak_count *)*((void *)&xmmword_26AD00580 + 1);
    xmmword_26AD00580 = v9;
    if (v10)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      if (*((void *)&block + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&block + 1));
      }
    }
    xpc_object_t v7 = (os_unfair_lock_s *)xmmword_26AD00580;
  }
  xpc_object_t v11 = (std::__shared_weak_count *)*((void *)&xmmword_26AD00580 + 1);
  if (*((void *)&xmmword_26AD00580 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&xmmword_26AD00580 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance);
  if (a2)
  {
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 0x40000000;
    long long v22 = (void (*)(unint64_t *__return_ptr, long long *))___ZN12TelephonyXPC18ClientStateTracker7isValidEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke;
    long long v23 = &__block_descriptor_tmp_22;
    uint64_t v24 = v7;
    uint64_t v25 = a2;
    os_unfair_lock_lock(v7 + 4);
    v22(&v18, &block);
    os_unfair_lock_unlock(v7 + 4);
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  unint64_t v18 = 0;
  long long v19 = 0;
  if (v11) {
LABEL_10:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
LABEL_11:
  unint64_t v12 = v18;
  if (v18)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 0x40000000;
    v20[2] = ___ZN12TelephonyXPC6Client5State17handleDaemonReadyEv_block_invoke;
    v20[3] = &__block_descriptor_tmp_25;
    v20[4] = v18;
    std::string v13 = *(std::__shared_weak_count **)(v18 + 16);
    if (!v13 || (long long v14 = *(__CFNotificationCenter **)(v18 + 8), (v15 = std::__shared_weak_count::lock(v13)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    long long v16 = v15;
    dispatch_object_t v17 = *(NSObject **)(v12 + 24);
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 1174405120;
    long long v22 = (void (*)(unint64_t *__return_ptr, long long *))___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
    long long v23 = &__block_descriptor_tmp_26;
    uint64_t v25 = v14;
    dispatch_object_t v26 = v16;
    atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v24 = (os_unfair_lock_s *)v20;
    dispatch_async(v17, &block);
    if (v26) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v26);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
}

void sub_21929AEE4(_Unwind_Exception *a1)
{
}

void TelephonyXPC::Client::State::connect_sync(TelephonyXPC::Client::State *this)
{
  uint64_t v2 = (TelephonyXPC::Client::State *)((char *)this + 80);
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))this + 10))(v2, 40))
  {
    uint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v3;
    long long v23 = v3;
    *(_OWORD *)xpc_object_t object = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)object);
    uint64_t v4 = MEMORY[0x21D485430](object, "Started on name '");
    uint64_t v5 = MEMORY[0x21D485440](v4, (char *)this + 144);
    MEMORY[0x21D485430](v5, "'");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](object);
  }
  ctu::LoggerCommonBase::getLogLevel(v2);
  if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v2)(v2, 20))
  {
    uint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v22 = v6;
    long long v23 = v6;
    *(_OWORD *)xpc_object_t object = v6;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)object);
    MEMORY[0x21D485430](object, "Create server connection");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](object);
  }
  xpc_object_t v7 = (char *)this + 144;
  if (*((char *)this + 167) < 0) {
    xpc_object_t v7 = *(const char **)v7;
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v7, *((dispatch_queue_t *)this + 3), 2uLL);
  if (mach_service)
  {
    xpc_object_t v9 = mach_service;
    object[0] = mach_service;
LABEL_10:
    xpc_retain(v9);
    goto LABEL_11;
  }
  xpc_object_t v9 = xpc_null_create();
  object[0] = v9;
  if (v9) {
    goto LABEL_10;
  }
  xpc_object_t v9 = 0;
  object[0] = xpc_null_create();
LABEL_11:
  ctu::XpcClient::setServer_sync();
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v9);
  if (*((_DWORD *)this + 54))
  {
    ctu::LoggerCommonBase::getLogLevel(v2);
    if ((**(unsigned int (***)(ctu::LoggerCommonBase *, uint64_t))v2)(v2, 20))
    {
      uint64_t v24 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v22 = v10;
      long long v23 = v10;
      *(_OWORD *)xpc_object_t object = v10;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)object);
      uint64_t v11 = MEMORY[0x21D485430](object, "Checked in state is ");
      uint64_t v12 = v11;
      uint64_t v13 = *((int *)this + 54);
      if (v13 <= 2) {
        MEMORY[0x21D485430](v11, (&off_26439C380)[v13]);
      }
      MEMORY[0x21D485430](v12, ", skipping");
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x21D4853A0](object);
    }
  }
  else
  {
    TelephonyXPC::Client::State::changeCheckInState_sync((uint64_t)this, 1u);
    long long v14 = (std::__shared_weak_count *)*((void *)this + 2);
    if (!v14 || (uint64_t v15 = *((void *)this + 1), (v16 = std::__shared_weak_count::lock(v14)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    dispatch_object_t v17 = v16;
    p_shared_weak_owners = &v16->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v16->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    std::string::basic_string[abi:ne180100]<0>(v26, "checkIn");
    object[0] = (xpc_object_t)MEMORY[0x263EF8330];
    object[1] = (xpc_object_t)1174405120;
    *(void *)&long long v22 = ___ZN12TelephonyXPC6Client5State12checkIn_syncEv_block_invoke;
    *((void *)&v22 + 1) = &__block_descriptor_tmp_32;
    *(void *)&long long v23 = this;
    *((void *)&v23 + 1) = v15;
    uint64_t v24 = v17;
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    long long v19 = _Block_copy(object);
    uint64_t v25 = v19;
    xpc_object_t v20 = xpc_null_create();
    TelephonyXPC::Client::State::createCommand_sync(&v28, (uint64_t)this, (uint64_t)v26, &v25, &v20);
    TelephonyXPC::Client::State::perform_sync(this, &v28);
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
    xpc_release(v20);
    xpc_object_t v20 = 0;
    if (v19) {
      _Block_release(v19);
    }
    if (v27 < 0) {
      operator delete(v26[0]);
    }
    if (v24) {
      std::__shared_weak_count::__release_weak(v24);
    }
    std::__shared_weak_count::__release_weak(v17);
  }
  if (*((_DWORD *)this + 55))
  {
    TelephonyXPC::Client::State::changeEventsState_sync((uint64_t)this, 0);
    TelephonyXPC::Client::State::eventsOn_sync(this);
  }
}

void sub_21929B2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  long long v21 = *(std::__shared_weak_count **)(v19 - 40);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  xpc_release(object);
  if (v18) {
    _Block_release(v18);
  }
  if (a17) {
    std::__shared_weak_count::__release_weak(a17);
  }
  if (*(char *)(v19 - 49) < 0) {
    operator delete(*(void **)(v19 - 72));
  }
  std::__shared_weak_count::__release_weak(v17);
  _Unwind_Resume(a1);
}

void *___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void *___ZN12TelephonyXPC18ClientStateTracker6insertENSt3__110shared_ptrINS_6Client5StateEEE_block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  long long v3 = operator new(0x10uLL);
  uint64_t v4 = v3;
  uint64_t v5 = a1[6];
  void *v3 = a1[5];
  v3[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v7 = (void *)v2[4];
  unint64_t v6 = v2[5];
  if ((unint64_t)v7 >= v6)
  {
    xpc_object_t v9 = (void *)v2[3];
    uint64_t v10 = v7 - v9;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<std::weak_ptr<TelephonyXPC::Client::State> *,std::allocator<std::weak_ptr<TelephonyXPC::Client::State> *>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v6 - (void)v9;
    if (v12 >> 2 > v11) {
      unint64_t v11 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      if (v13 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      long long v14 = (char *)operator new(8 * v13);
    }
    else
    {
      long long v14 = 0;
    }
    uint64_t v15 = &v14[8 * v10];
    *(void *)uint64_t v15 = v4;
    uint64_t v8 = v15 + 8;
    if (v7 != v9)
    {
      do
      {
        uint64_t v16 = *--v7;
        *((void *)v15 - 1) = v16;
        v15 -= 8;
      }
      while (v7 != v9);
      xpc_object_t v7 = (void *)v2[3];
    }
    v2[3] = v15;
    v2[4] = v8;
    v2[5] = &v14[8 * v13];
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    void *v7 = v3;
    uint64_t v8 = v7 + 1;
  }
  v2[4] = v8;
  return v4;
}

uint64_t __copy_helper_block_e8_40c55_ZTSNSt3__110shared_ptrIN12TelephonyXPC6Client5StateEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c55_ZTSNSt3__110shared_ptrIN12TelephonyXPC6Client5StateEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::vector<std::weak_ptr<TelephonyXPC::Client::State> *,std::allocator<std::weak_ptr<TelephonyXPC::Client::State> *>>::__throw_length_error[abi:ne180100]()
{
}

std::__shared_weak_count *___ZN12TelephonyXPC18ClientStateTracker7isValidEPNSt3__18weak_ptrINS_6Client5StateEEE_block_invoke@<X0>(std::__shared_weak_count *result@<X0>, void *a2@<X8>)
{
  uint64_t shared_owners = result[1].__shared_owners_;
  uint64_t v4 = *(void **)(shared_owners + 24);
  uint64_t v5 = *(void **)(shared_owners + 32);
  if (v4 != v5)
  {
    while (*v4 != result[1].__shared_weak_owners_)
    {
      if (++v4 == v5)
      {
        uint64_t v4 = v5;
        break;
      }
    }
  }
  if (v4 == v5)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    unint64_t v6 = (void *)*v4;
    *a2 = 0;
    a2[1] = 0;
    uint64_t result = (std::__shared_weak_count *)v6[1];
    if (result)
    {
      uint64_t result = std::__shared_weak_count::lock(result);
      a2[1] = result;
      if (result) {
        *a2 = *v6;
      }
    }
  }
  return result;
}

void ___ZN12TelephonyXPC6Client5State17handleDaemonReadyEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v5 = v2;
    long long v6 = v2;
    long long v4 = v2;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v4);
    MEMORY[0x21D485430](&v4, "Daemon ready received");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](&v4);
  }
  if (MEMORY[0x21D485890](*(void *)(v1 + 40)) == MEMORY[0x263EF86F0])
  {
    ++*(_DWORD *)(v1 + 248);
    ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
    if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
    {
      unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v5 = v3;
      long long v6 = v3;
      long long v4 = v3;
      ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&v4);
      MEMORY[0x21D485430](&v4, "Extra increased to ");
      ctu::operator<<();
      ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
      MEMORY[0x21D4853A0](&v4);
    }
  }
  else
  {
    TelephonyXPC::Client::State::handleServerReady_sync((TelephonyXPC::Client::State *)v1);
  }
}

void sub_21929B6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void TelephonyXPC::Client::State::handleServerReady_sync(TelephonyXPC::Client::State *this)
{
  long long v2 = (char *)this + 80;
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(char *, uint64_t))this + 10))(v2, 20))
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v4[1] = v3;
    uint64_t v4[2] = v3;
    v4[0] = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v4);
    MEMORY[0x21D485430](v4, "Server ready");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](v4);
  }
  TelephonyXPC::Client::State::connect_sync(this);
}

uint64_t TelephonyXPC::Client::State::changeEventsState_sync(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a1 + 80;
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
  uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(a1 + 80))(v4, 40);
  if (result)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = v6;
    v11[2] = v6;
    v11[0] = v6;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v11);
    uint64_t v7 = MEMORY[0x21D485430](v11, "Changing event state from ");
    uint64_t v8 = v7;
    uint64_t v9 = *(int *)(a1 + 220);
    if (v9 <= 2) {
      MEMORY[0x21D485430](v7, (&off_26439C398)[v9]);
    }
    uint64_t v10 = MEMORY[0x21D485430](v8, " to ");
    if (a2 <= 2) {
      MEMORY[0x21D485430](v10, (&off_26439C398)[a2]);
    }
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    uint64_t result = MEMORY[0x21D4853A0](v11);
  }
  *(_DWORD *)(a1 + 220) = a2;
  return result;
}

void TelephonyXPC::Client::State::eventsOn_sync(TelephonyXPC::Client::State *this)
{
  int v2 = *((_DWORD *)this + 55);
  if (v2 == 1) {
    goto LABEL_4;
  }
  if (!v2)
  {
    TelephonyXPC::Client::State::changeEventsState_sync((uint64_t)this, 1u);
LABEL_4:
    long long v3 = (std::__shared_weak_count *)*((void *)this + 2);
    if (!v3 || (v4 = *((void *)this + 1), (unint64_t v5 = std::__shared_weak_count::lock(v3)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    long long v6 = v5;
    p_shared_weak_owners = &v5->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    std::string::basic_string[abi:ne180100]<0>(v21, "eventsOn");
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN12TelephonyXPC6Client5State13eventsOn_syncEv_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_69;
    aBlock[4] = this;
    aBlock[5] = v4;
    uint64_t v19 = v6;
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    uint64_t v8 = _Block_copy(aBlock);
    xpc_object_t v20 = v8;
    uint64_t v9 = (std::__shared_weak_count *)*((void *)this + 29);
    v16[0] = *((void *)this + 28);
    v16[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    TelephonyXPC::Client::State::convert_sync(&object, (uint64_t)this, (uint64_t)v16);
    TelephonyXPC::Client::State::createCommand_sync(&v23, (uint64_t)this, (uint64_t)v21, &v20, &object);
    TelephonyXPC::Client::State::perform_sync(this, &v23);
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    xpc_release(object);
    xpc_object_t object = 0;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    if (v8) {
      _Block_release(v8);
    }
    if (v22 < 0) {
      operator delete(v21[0]);
    }
    if (v19) {
      std::__shared_weak_count::__release_weak(v19);
    }
    std::__shared_weak_count::__release_weak(v6);
    return;
  }
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(char *, uint64_t))this + 10))((char *)this + 80, 20))
  {
    unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v14[1] = v10;
    v14[2] = v10;
    v14[0] = v10;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v14);
    uint64_t v11 = MEMORY[0x21D485430](v14, "Events state is ");
    uint64_t v12 = v11;
    uint64_t v13 = *((int *)this + 55);
    if (v13 <= 2) {
      MEMORY[0x21D485430](v11, (&off_26439C398)[v13]);
    }
    MEMORY[0x21D485430](v12, ", skipping");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](v14);
  }
}

uint64_t TelephonyXPC::Client::State::changeCheckInState_sync(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a1 + 80;
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(a1 + 80));
  uint64_t result = (**(uint64_t (***)(uint64_t, uint64_t))(a1 + 80))(v4, 40);
  if (result)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = v6;
    v11[2] = v6;
    v11[0] = v6;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v11);
    uint64_t v7 = MEMORY[0x21D485430](v11, "Changing checked in state from ");
    uint64_t v8 = v7;
    uint64_t v9 = *(int *)(a1 + 216);
    if (v9 <= 2) {
      MEMORY[0x21D485430](v7, (&off_26439C380)[v9]);
    }
    uint64_t v10 = MEMORY[0x21D485430](v8, " to ");
    if (a2 <= 2) {
      MEMORY[0x21D485430](v10, (&off_26439C380)[a2]);
    }
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    uint64_t result = MEMORY[0x21D4853A0](v11);
  }
  *(_DWORD *)(a1 + 216) = a2;
  return result;
}

void TelephonyXPC::Client::State::createCommand_sync(void *a1, uint64_t a2, uint64_t a3, void **a4, void *a5)
{
  uint64_t v10 = MEMORY[0x21D485890](*a5);
  uint64_t v11 = MEMORY[0x263EF8708];
  if (v10 != MEMORY[0x263EF8708])
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    if (v12 || (xpc_object_t v12 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x21D485890](v12) == v11)
      {
        xpc_retain(v12);
        xpc_object_t v13 = v12;
      }
      else
      {
        xpc_object_t v13 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v13 = xpc_null_create();
      xpc_object_t v12 = 0;
    }
    xpc_release(v12);
    xpc_object_t v14 = xpc_null_create();
    unint64_t v15 = (void *)*a5;
    *a5 = v13;
    xpc_release(v15);
    xpc_release(v14);
  }
  uint64_t v16 = (const char *)(a2 + 192);
  if (*(char *)(a2 + 215) < 0) {
    uint64_t v16 = *(const char **)v16;
  }
  xpc_object_t v31 = xpc_string_create(v16);
  if (!v31) {
    xpc_object_t v31 = xpc_null_create();
  }
  unint64_t v29 = (unint64_t)a5;
  xpc_object_t v30 = "clientName";
  xpc::dict::object_proxy::operator=((uint64_t)&v29, &v31, &v32);
  xpc_release(v32);
  xpc_object_t v32 = 0;
  xpc_release(v31);
  xpc_object_t v31 = 0;
  *a1 = 0;
  a1[1] = 0;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v30 = (const char *)0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN12TelephonyXPC6Client5State18createCommand_syncENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvNS_6ResultEN3xpc4dictEEEESD__block_invoke;
  aBlock[3] = &__block_descriptor_tmp_59;
  dispatch_object_t v17 = *a4;
  if (*a4) {
    dispatch_object_t v17 = _Block_copy(v17);
  }
  uint64_t v28 = v17;
  unint64_t v18 = _Block_copy(aBlock);
  uint64_t v19 = *(NSObject **)(a2 + 24);
  if (v19) {
    dispatch_retain(v19);
  }
  unint64_t v29 = (unint64_t)v18;
  xpc_object_t v30 = (const char *)v19;
  if (v18) {
    xpc_object_t v20 = _Block_copy(v18);
  }
  else {
    xpc_object_t v20 = 0;
  }
  uint64_t v24 = v20;
  dispatch_object_t v25 = v19;
  if (v19) {
    dispatch_retain(v19);
  }
  long long v21 = (void *)*a5;
  xpc_object_t object = v21;
  if (v21) {
    xpc_retain(v21);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Command::create(a3, (uint64_t)&v24, &object, &v26);
  long long v22 = v26;
  long long v26 = 0uLL;
  *(_OWORD *)a1 = v22;
  xpc_release(object);
  xpc_object_t object = 0;
  if (v25) {
    dispatch_release(v25);
  }
  if (v24) {
    _Block_release(v24);
  }
  if (v19) {
    dispatch_release(v19);
  }
  if (v18) {
    _Block_release(v18);
  }
  if (v28) {
    _Block_release(v28);
  }
}

void sub_21929BF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *aBlock,char a21)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State12checkIn_syncEv_block_invoke(void *a1, _DWORD *a2)
{
  long long v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    long long v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = v6;
      if (a1[5] && !*a2) {
        TelephonyXPC::Client::State::changeCheckInState_sync(v5, 2u);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_21929C028(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t TelephonyXPC::Result::describe(TelephonyXPC::Result *this, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  long long v44 = v4;
  long long v43 = v4;
  long long v42 = v4;
  long long v41 = v4;
  long long v40 = v4;
  long long v39 = v4;
  long long v38 = v4;
  long long v37 = v4;
  long long v36 = v4;
  *(_OWORD *)xpc_object_t v32 = v4;
  long long v33 = v4;
  long long v30 = v4;
  long long v31 = v4;
  long long v28 = v4;
  long long v29 = v4;
  uint64_t v5 = MEMORY[0x263F8C340] + 64;
  uint64_t v35 = MEMORY[0x263F8C340] + 64;
  long long v6 = (uint64_t *)MEMORY[0x263F8C2C8];
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v27 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(uint64_t *)((char *)&v27 + *(void *)(v27 - 24)) = v7;
  uint64_t v8 = (std::ios_base *)((char *)&v27 + *(void *)(v27 - 24));
  std::ios_base::init(v8, &v28);
  uint64_t v9 = MEMORY[0x263F8C340] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v27 = v9;
  uint64_t v35 = v5;
  std::streambuf::basic_streambuf();
  uint64_t v10 = MEMORY[0x263F8C318] + 16;
  *(void *)&long long v28 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)xpc_object_t v32 = 0u;
  long long v33 = 0u;
  LODWORD(v34) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"Result:'", 8);
  switch(*(_DWORD *)a2)
  {
    case 0xE020E000:
      uint64_t v11 = "kInternalError";
      break;
    case 0xE020E001:
      uint64_t v11 = "kServerError";
      break;
    case 0xE020E002:
      uint64_t v11 = "kCommandError";
      break;
    case 0xE020E003:
      uint64_t v11 = "kTimeout";
      break;
    case 0xE020E004:
      uint64_t v11 = "kNotSupported";
      break;
    case 0xE020E005:
      uint64_t v11 = "kRetry";
      break;
    case 0xE020E006:
      uint64_t v11 = "kPermissionDenied";
      break;
    case 0xE020E007:
      uint64_t v11 = "kNotAvailable";
      break;
    default:
      if (*(_DWORD *)a2) {
        uint64_t v11 = "kInvalidErrorCode";
      }
      else {
        uint64_t v11 = "kSuccess";
      }
      break;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v11);
  if ((v26 & 0x80u) == 0) {
    xpc_object_t v12 = __p;
  }
  else {
    xpc_object_t v12 = (void **)__p[0];
  }
  if ((v26 & 0x80u) == 0) {
    uint64_t v13 = v26;
  }
  else {
    uint64_t v13 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)v12, v13);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"'", 1);
  if ((char)v26 < 0) {
    operator delete(__p[0]);
  }
  if (*(char *)(a2 + 31) < 0)
  {
    if (!*(void *)(a2 + 16)) {
      goto LABEL_32;
    }
  }
  else if (!*(unsigned char *)(a2 + 31))
  {
    goto LABEL_32;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" Info:'", 7);
  int v14 = *(char *)(a2 + 31);
  if (v14 >= 0) {
    uint64_t v15 = a2 + 8;
  }
  else {
    uint64_t v15 = *(void *)(a2 + 8);
  }
  if (v14 >= 0) {
    uint64_t v16 = *(unsigned __int8 *)(a2 + 31);
  }
  else {
    uint64_t v16 = *(void *)(a2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, v15, v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"'", 1);
LABEL_32:
  if ((v34 & 0x10) != 0)
  {
    uint64_t v18 = *((void *)&v33 + 1);
    if (*((void *)&v33 + 1) < (unint64_t)v31)
    {
      *((void *)&v33 + 1) = v31;
      uint64_t v18 = v31;
    }
    uint64_t v19 = (const void **)&v30 + 1;
  }
  else
  {
    if ((v34 & 8) == 0)
    {
      size_t v17 = 0;
      *((unsigned char *)this + 23) = 0;
      goto LABEL_47;
    }
    uint64_t v19 = (const void **)&v29;
    uint64_t v18 = v30;
  }
  xpc_object_t v20 = *v19;
  size_t v17 = v18 - (void)*v19;
  if (v17 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v17 >= 0x17)
  {
    uint64_t v21 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v21 = v17 | 7;
    }
    uint64_t v22 = v21 + 1;
    uint64_t v23 = (TelephonyXPC::Result *)operator new(v21 + 1);
    *((void *)this + 1) = v17;
    *((void *)this + 2) = v22 | 0x8000000000000000;
    *(void *)this = v23;
    this = v23;
    goto LABEL_46;
  }
  *((unsigned char *)this + 23) = v17;
  if (v17) {
LABEL_46:
  }
    memmove(this, v20, v17);
LABEL_47:
  *((unsigned char *)this + v17) = 0;
  uint64_t v27 = *v6;
  *(uint64_t *)((char *)&v27 + *(void *)(v27 - 24)) = v6[3];
  *(void *)&long long v28 = v10;
  if (SBYTE7(v33) < 0) {
    operator delete(v32[0]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D4855E0](&v35);
}

void sub_21929C4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

void TelephonyXPC::Client::State::send_sync(uint64_t a1, void **a2)
{
  if (MEMORY[0x21D485890](*(void *)(a1 + 40)) == MEMORY[0x263EF86F0])
  {
    long long v4 = *(_xpc_connection_s **)(a1 + 40);
    uint64_t v5 = *a2;
    xpc_connection_send_message(v4, v5);
  }
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D4855E0](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v23[0] = 0xAAAAAAAAAAAAAAAALL;
  v23[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x21D485520](v23, a1);
  if (LOBYTE(v23[0]))
  {
    long long v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        size_t v17 = (std::locale::__imp *)operator new(v18 + 1);
        __b[1].__locale_ = (std::locale::__imp *)v16;
        __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
        __b[0].__locale_ = v17;
      }
      else
      {
        HIBYTE(__b[2].__locale_) = v16;
        size_t v17 = (std::locale::__imp *)__b;
      }
      memset(v17, v9, v16);
      *((unsigned char *)v17 + v16) = 0;
      xpc_object_t v20 = SHIBYTE(__b[2].__locale_) >= 0 ? __b : (std::locale *)__b[0].__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(__b[2].__locale_) < 0) {
        operator delete(__b[0].__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x21D485530](v23);
  return a1;
}

void sub_21929C980(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x21D485530](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21929C950);
}

void sub_21929C9EC(_Unwind_Exception *a1)
{
}

void ___ZN12TelephonyXPC6Client5State18createCommand_syncENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch5blockIU13block_pointerFvNS_6ResultEN3xpc4dictEEEESD__block_invoke(uint64_t a1, int *a2, void **a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v7 = *a2;
  if (*((char *)a2 + 31) < 0) {
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
  }
  else {
    std::string __p = *(std::string *)(a2 + 2);
  }
  uint64_t v5 = *a3;
  xpc_object_t object = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, int *, xpc_object_t *))(v4 + 16))(v4, &v7, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_21929CABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c76_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEN3xpc4dictEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN12TelephonyXPC6Client5State13eventsOn_syncEv_block_invoke(void *a1, _DWORD *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    long long v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      int v7 = v6;
      if (a1[5] && !*a2) {
        TelephonyXPC::Client::State::changeEventsState_sync(v5, 2u);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_21929CBC8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::convert_sync(xpc_object_t *a1, uint64_t a2, uint64_t a3)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  *a1 = xpc_null_create();
  if (*(void *)(*(void *)a3 + 16))
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x21D485890](v6) == MEMORY[0x263EF8708])
      {
        xpc_retain(v6);
        xpc_object_t v7 = v6;
      }
      else
      {
        xpc_object_t v7 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
    }
    xpc_release(v6);
    xpc_object_t v8 = xpc_null_create();
    xpc_object_t v9 = *a1;
    *a1 = v7;
    xpc_release(v9);
    xpc_release(v8);
    xpc_object_t v10 = xpc_array_create(0, 0);
    if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x21D485890](v10) == MEMORY[0x263EF86D8])
      {
        xpc_retain(v10);
        xpc_object_t v11 = v10;
      }
      else
      {
        xpc_object_t v11 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v11 = xpc_null_create();
      xpc_object_t v10 = 0;
    }
    xpc_release(v10);
    uint64_t v12 = *(void **)(a2 + 224);
    uint64_t v13 = (void *)*v12;
    if ((void *)*v12 != v12 + 1)
    {
      do
      {
        BOOL v14 = (const char *)(v13 + 4);
        if (*((char *)v13 + 55) < 0) {
          BOOL v14 = *(const char **)v14;
        }
        xpc_object_t v15 = xpc_string_create(v14);
        if (!v15) {
          xpc_object_t v15 = xpc_null_create();
        }
        xpc_array_append_value(v11, v15);
        xpc_release(v15);
        size_t v16 = (void *)v13[1];
        if (v16)
        {
          do
          {
            size_t v17 = v16;
            size_t v16 = (void *)*v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            size_t v17 = (void *)v13[2];
            BOOL v18 = *v17 == (void)v13;
            uint64_t v13 = v17;
          }
          while (!v18);
        }
        uint64_t v13 = v17;
      }
      while (v17 != (void *)(*(void *)(a2 + 224) + 8));
    }
    if (v11)
    {
      xpc_retain(v11);
      xpc_object_t v19 = v11;
    }
    else
    {
      xpc_object_t v19 = xpc_null_create();
    }
    xpc_dictionary_set_value(*a1, "eventList", v19);
    xpc_object_t v20 = xpc_null_create();
    xpc_release(v19);
    xpc_release(v20);
    xpc_release(v11);
  }
}

void sub_21929CE48(_Unwind_Exception *a1)
{
  xpc_release(v3);
  xpc_release(v2);
  xpc::dict::~dict(v1);
  _Unwind_Resume(a1);
}

void ___ZN12TelephonyXPC6Client5State15setEventHandlerENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS2_10shared_ptrINS_5EventEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(char *)(a1 + 63) < 0) {
    std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)(a1 + 40), *(void *)(a1 + 48));
  }
  else {
    std::string v36 = *(std::string *)(a1 + 40);
  }
  uint64_t v3 = *(const void **)(a1 + 64);
  if (v3) {
    uint64_t v4 = _Block_copy(v3);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(NSObject **)(a1 + 72);
  xpc_object_t object = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  std::string::size_type v6 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
  int v7 = SHIBYTE(v36.__r_.__value_.__r.__words[2]);
  std::string::size_type size = v36.__r_.__value_.__l.__size_;
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v6 = v36.__r_.__value_.__l.__size_;
  }
  if (v6) {
    BOOL v9 = v4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if (!v5)
    {
LABEL_64:
      _Block_release(v4);
      goto LABEL_65;
    }
    xpc_object_t v10 = *(uint64_t ***)(v2 + 224);
    uint64_t v12 = (void **)(v10 + 1);
    xpc_object_t v11 = (char *)v10[1];
    uint64_t v13 = (char **)(v10 + 1);
    BOOL v14 = (char **)(v10 + 1);
    if (v11)
    {
      do
      {
        while (1)
        {
          BOOL v14 = (char **)v11;
          xpc_object_t v15 = v11 + 32;
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v36, (void *)v11 + 4) & 0x80) == 0)break; {
          xpc_object_t v11 = *v14;
          }
          uint64_t v13 = v14;
          if (!*v14) {
            goto LABEL_22;
          }
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v15, &v36) & 0x80) == 0) {
          goto LABEL_55;
        }
        xpc_object_t v11 = v14[1];
      }
      while (v11);
      uint64_t v13 = v14 + 1;
    }
LABEL_22:
    unint64_t v38 = 0xAAAAAAAAAAAAAA00;
    size_t v16 = (char *)operator new(0x48uLL);
    v37[0] = v16;
    v37[1] = v10 + 1;
    size_t v17 = (std::string *)(v16 + 32);
    if (v7 < 0)
    {
      std::string::__init_copy_ctor_external(v17, v36.__r_.__value_.__l.__data_, size);
    }
    else
    {
      *(_OWORD *)&v17->__r_.__value_.__l.__data_ = *(_OWORD *)&v36.__r_.__value_.__l.__data_;
      *((void *)v16 + 6) = *((void *)&v36.__r_.__value_.__l + 2);
    }
    *((void *)v16 + 7) = 0;
    *((void *)v16 + 8) = 0;
    LOBYTE(v38) = 1;
    *(void *)size_t v16 = 0;
    *((void *)v16 + 1) = 0;
    *((void *)v16 + 2) = v14;
    void *v13 = v16;
    BOOL v18 = (uint64_t *)**v10;
    if (v18)
    {
      const std::locale::facet *v10 = v18;
      size_t v16 = *v13;
    }
    xpc_object_t v19 = (char *)*v12;
    BOOL v9 = v16 == *v12;
    v16[24] = v9;
    if (!v9)
    {
      do
      {
        uint64_t v20 = *((void *)v16 + 2);
        if (*(unsigned char *)(v20 + 24)) {
          break;
        }
        uint64_t v21 = *(char **)(v20 + 16);
        uint64_t v22 = *(void *)v21;
        if (*(void *)v21 == v20)
        {
          uint64_t v25 = *((void *)v21 + 1);
          if (!v25 || (v26 = *(unsigned __int8 *)(v25 + 24), uint64_t v23 = (unsigned char *)(v25 + 24), v26))
          {
            if (*(char **)v20 == v16)
            {
              uint64_t v27 = (uint64_t *)*((void *)v16 + 2);
            }
            else
            {
              uint64_t v27 = *(uint64_t **)(v20 + 8);
              uint64_t v28 = *v27;
              *(void *)(v20 + 8) = *v27;
              if (v28)
              {
                *(void *)(v28 + 16) = v20;
                uint64_t v21 = *(char **)(v20 + 16);
              }
              v27[2] = (uint64_t)v21;
              *(void *)(*(void *)(v20 + 16) + 8 * (**(void **)(v20 + 16) != v20)) = v27;
              uint64_t *v27 = v20;
              *(void *)(v20 + 16) = v27;
              uint64_t v21 = (char *)v27[2];
              uint64_t v20 = *(void *)v21;
            }
            *((unsigned char *)v27 + 24) = 1;
            v21[24] = 0;
            uint64_t v31 = *(void *)(v20 + 8);
            *(void *)uint64_t v21 = v31;
            if (v31) {
              *(void *)(v31 + 16) = v21;
            }
            *(void *)(v20 + 16) = *((void *)v21 + 2);
            *(void *)(*((void *)v21 + 2) + 8 * (**((void **)v21 + 2) != (void)v21)) = v20;
            *(void *)(v20 + 8) = v21;
            goto LABEL_53;
          }
        }
        else if (!v22 || (v24 = *(unsigned __int8 *)(v22 + 24), uint64_t v23 = (unsigned char *)(v22 + 24), v24))
        {
          if (*(char **)v20 == v16)
          {
            uint64_t v29 = *((void *)v16 + 1);
            *(void *)uint64_t v20 = v29;
            if (v29)
            {
              *(void *)(v29 + 16) = v20;
              uint64_t v21 = *(char **)(v20 + 16);
            }
            *((void *)v16 + 2) = v21;
            *(void *)(*(void *)(v20 + 16) + 8 * (**(void **)(v20 + 16) != v20)) = v16;
            *((void *)v16 + 1) = v20;
            *(void *)(v20 + 16) = v16;
            uint64_t v21 = (char *)*((void *)v16 + 2);
          }
          else
          {
            size_t v16 = (char *)*((void *)v16 + 2);
          }
          v16[24] = 1;
          v21[24] = 0;
          uint64_t v20 = *((void *)v21 + 1);
          long long v30 = *(char **)v20;
          *((void *)v21 + 1) = *(void *)v20;
          if (v30) {
            *((void *)v30 + 2) = v21;
          }
          *(void *)(v20 + 16) = *((void *)v21 + 2);
          *(void *)(*((void *)v21 + 2) + 8 * (**((void **)v21 + 2) != (void)v21)) = v20;
          *(void *)uint64_t v20 = v21;
LABEL_53:
          *((void *)v21 + 2) = v20;
          break;
        }
        *(unsigned char *)(v20 + 24) = 1;
        size_t v16 = v21;
        v21[24] = v21 == v19;
        *uint64_t v23 = 1;
      }
      while (v21 != v19);
    }
    v10[2] = (uint64_t *)((char *)v10[2] + 1);
    BOOL v14 = (char **)v37[0];
    v37[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v37);
LABEL_55:
    xpc_object_t v32 = (char *)_Block_copy(v4);
    long long v33 = v14[7];
    v14[7] = v32;
    if (v33) {
      _Block_release(v33);
    }
    uint64_t v5 = object;
    if (object) {
      dispatch_retain(object);
    }
    unint64_t v34 = v14[8];
    v14[8] = (char *)object;
    if (v34) {
      dispatch_release(v34);
    }
  }
  if (v5) {
    dispatch_release(v5);
  }
  if (v4) {
    goto LABEL_64;
  }
LABEL_65:
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
}

void sub_21929D220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c89_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::string *)(a1 + 40);
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
  std::string::size_type v6 = *(void **)(a2 + 64);
  if (v6) {
    std::string::size_type v6 = _Block_copy(v6);
  }
  int v7 = *(NSObject **)(a2 + 72);
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v7;
  if (v7)
  {
    dispatch_retain(v7);
  }
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c89_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN12TelephonyXPC5EventEEEEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 72);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 64);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 63) < 0)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    operator delete(v4);
  }
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  long long v5 = this;
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
    xpc_object_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    long long v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void ___ZN12TelephonyXPC6Client5State8eventsOnEv_block_invoke(uint64_t a1)
{
}

void ___ZN12TelephonyXPC6Client5State28performWithBlockingSyncReplyENSt3__110shared_ptrINS_7CommandEEERNS_6ResultERN3xpc4dictE_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (MEMORY[0x21D485890](*(void *)(v2 + 40)) == MEMORY[0x263EF86F0])
  {
    xpc_object_t v4 = xpc_null_create();
    TelephonyXPC::Command::State::get(**(void ****)(a1 + 40), &message);
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(*(xpc_connection_t *)(v2 + 40), message);
    if (v5 || (xpc_object_t v5 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x21D485890](v5) == MEMORY[0x263EF8708])
      {
        xpc_retain(v5);
        xpc_object_t v6 = v5;
      }
      else
      {
        xpc_object_t v6 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
    }
    xpc_object_t v7 = xpc_null_create();
    xpc_release(v4);
    xpc_release(v7);
    xpc_release(v5);
    xpc_release(message);
    xpc_object_t object = v6;
    xpc_object_t message = 0;
    if (v6) {
      xpc_retain(v6);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    TelephonyXPC::Client::State::parseReply_sync((void **)buf, &object, *(void *)(a1 + 64));
    xpc_object_t v8 = *(void ***)(a1 + 56);
    BOOL v9 = *(void **)buf;
    *(void *)long long buf = xpc_null_create();
    xpc_object_t v10 = *v8;
    std::string *v8 = v9;
    xpc_release(v10);
    xpc_release(*(xpc_object_t *)buf);
    *(void *)long long buf = 0;
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_object_t v11 = *(_DWORD **)(a1 + 64);
    if (*v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        TelephonyXPC::Result::describe((TelephonyXPC::Result *)buf, (uint64_t)v11);
        uint64_t v12 = v17 >= 0 ? buf : *(unsigned char **)buf;
        *(_DWORD *)BOOL v18 = 136315138;
        xpc_object_t v19 = v12;
        _os_log_error_impl(&dword_219294000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failure: %s", v18, 0xCu);
        if (v17 < 0) {
          operator delete(*(void **)buf);
        }
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = (void *)(a1 + 72);
      if (*(char *)(a1 + 95) < 0) {
        uint64_t v13 = (void *)*v13;
      }
      *(_DWORD *)long long buf = 136315138;
      *(void *)&buf[4] = v13;
      _os_log_debug_impl(&dword_219294000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Successful: %s", buf, 0xCu);
    }
    xpc_release(v6);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = (void *)(a1 + 72);
    if (*(char *)(a1 + 95) < 0) {
      uint64_t v3 = (void *)*v3;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&buf[4] = v3;
    _os_log_error_impl(&dword_219294000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Server unavailable, unable to perform command %s", buf, 0xCu);
  }
}

void sub_21929D728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void __copy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  std::string::size_type v3 = *(void *)(a2 + 48);
  a1[1].__r_.__value_.__r.__words[2] = *(void *)(a2 + 40);
  a1[2].__r_.__value_.__r.__words[0] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v4 = a1 + 3;
  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 72), *(void *)(a2 + 80));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 72);
    a1[3].__r_.__value_.__r.__words[2] = *(void *)(a2 + 88);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
}

void sub_21929D824(_Unwind_Exception *exception_object)
{
  std::string::size_type v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIN12TelephonyXPC7CommandEEE72c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void ___ZN12TelephonyXPC6Client5State9eventsOffEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 220);
  if (v2 == 1) {
    goto LABEL_4;
  }
  if (v2 == 2)
  {
    TelephonyXPC::Client::State::changeEventsState_sync(*(void *)(a1 + 32), 1u);
LABEL_4:
    std::string::size_type v3 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v3 || (v4 = *(void *)(v1 + 8), (long long v5 = std::__shared_weak_count::lock(v3)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    xpc_object_t v6 = v5;
    p_shared_weak_owners = &v5->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    std::string::basic_string[abi:ne180100]<0>(v21, "eventsOff");
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1174405120;
    *(void *)&long long v17 = ___ZN12TelephonyXPC6Client5State14eventsOff_syncEv_block_invoke;
    *((void *)&v17 + 1) = &__block_descriptor_tmp_78;
    *(void *)&long long v18 = v1;
    *((void *)&v18 + 1) = v4;
    xpc_object_t v19 = v6;
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    xpc_object_t v8 = _Block_copy(&aBlock);
    uint64_t v20 = v8;
    BOOL v9 = *(std::__shared_weak_count **)(v1 + 232);
    v14[0] = *(void *)(v1 + 224);
    v14[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    TelephonyXPC::Client::State::convert_sync(&object, v1, (uint64_t)v14);
    TelephonyXPC::Client::State::createCommand_sync(&v23, v1, (uint64_t)v21, &v20, &object);
    TelephonyXPC::Client::State::perform_sync((void *)v1, &v23);
    if (v24) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
    }
    xpc_release(object);
    xpc_object_t object = 0;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
    if (v8) {
      _Block_release(v8);
    }
    if (v22 < 0) {
      operator delete(v21[0]);
    }
    if (v19) {
      std::__shared_weak_count::__release_weak(v19);
    }
    std::__shared_weak_count::__release_weak(v6);
    return;
  }
  ctu::LoggerCommonBase::getLogLevel((ctu::LoggerCommonBase *)(v1 + 80));
  if ((**(unsigned int (***)(uint64_t, uint64_t))(v1 + 80))(v1 + 80, 20))
  {
    xpc_object_t v19 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v10;
    long long v18 = v10;
    long long aBlock = v10;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)&aBlock);
    uint64_t v11 = MEMORY[0x21D485430](&aBlock, "Events state is ");
    uint64_t v12 = v11;
    uint64_t v13 = *(int *)(v1 + 220);
    if (v13 <= 2) {
      MEMORY[0x21D485430](v11, (&off_26439C398)[v13]);
    }
    MEMORY[0x21D485430](v12, ", skipping");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](&aBlock);
  }
}

void ___ZN12TelephonyXPC6Client5State14eventsOff_syncEv_block_invoke(void *a1)
{
  int v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      long long v5 = v4;
      if (a1[5]) {
        TelephonyXPC::Client::State::changeEventsState_sync(v3, 0);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_21929DBEC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void TelephonyXPC::Client::State::destroyConnection_sync(TelephonyXPC::Client::State *this)
{
  int v2 = (char *)this + 80;
  ctu::LoggerCommonBase::getLogLevel((TelephonyXPC::Client::State *)((char *)this + 80));
  if ((**((unsigned int (***)(char *, uint64_t))this + 10))(v2, 20))
  {
    unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v5[1] = v3;
    v5[2] = v3;
    v5[0] = v3;
    ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v5);
    MEMORY[0x21D485430](v5, "Destroy server connection");
    ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog();
    MEMORY[0x21D4853A0](v5);
  }
  TelephonyXPC::Client::State::changeCheckInState_sync((uint64_t)this, 0);
  xpc_object_t object = xpc_null_create();
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
}

void sub_21929DCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void xpc::dict::to_debug_string(xpc::dict *this, uint64_t a2)
{
  long long v3 = (char *)MEMORY[0x21D485830](a2);
  memset(this, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(this, v3);

  free(v3);
}

std::__shared_weak_count_vtbl **std::shared_ptr<TelephonyXPC::ClientStateTracker>::shared_ptr[abi:ne180100]<TelephonyXPC::ClientStateTracker,void>(std::__shared_weak_count_vtbl **a1, std::__shared_weak_count_vtbl *a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA7608;
  v4->__shared_owners_ = 0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = a2;
  a1[1] = (std::__shared_weak_count_vtbl *)v4;
  if (a2)
  {
    long long v5 = (std::__shared_weak_count *)a2->~__shared_weak_count_0;
    if (!v5)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
      a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
      goto LABEL_6;
    }
    if (v5->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      a2->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))a2;
      a2->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v4;
      std::__shared_weak_count::__release_weak(v5);
LABEL_6:
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  return a1;
}

void sub_21929DE14(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::default_delete<TelephonyXPC::ClientStateTracker>::operator()[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<TelephonyXPC::ClientStateTracker *,std::shared_ptr<TelephonyXPC::ClientStateTracker>::__shared_ptr_default_delete<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker>,std::allocator<TelephonyXPC::ClientStateTracker>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<TelephonyXPC::ClientStateTracker *,std::shared_ptr<TelephonyXPC::ClientStateTracker>::__shared_ptr_default_delete<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker>,std::allocator<TelephonyXPC::ClientStateTracker>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::ClientStateTracker *,std::shared_ptr<TelephonyXPC::ClientStateTracker>::__shared_ptr_default_delete<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker>,std::allocator<TelephonyXPC::ClientStateTracker>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<TelephonyXPC::ClientStateTracker>::operator()[abi:ne180100](void *__p)
{
  if (__p)
  {
    int v2 = (void *)__p[3];
    if (v2)
    {
      __p[4] = v2;
      operator delete(v2);
    }
    long long v3 = (std::__shared_weak_count *)__p[1];
    if (v3) {
      std::__shared_weak_count::__release_weak(v3);
    }
    operator delete(__p);
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Client *,std::shared_ptr<TelephonyXPC::Client>::__shared_ptr_default_delete<TelephonyXPC::Client,TelephonyXPC::Client>,std::allocator<TelephonyXPC::Client>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<TelephonyXPC::Client *,std::shared_ptr<TelephonyXPC::Client>::__shared_ptr_default_delete<TelephonyXPC::Client,TelephonyXPC::Client>,std::allocator<TelephonyXPC::Client>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (v1)
  {
    int v2 = (std::__shared_weak_count *)v1[1];
    if (v2) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v2);
    }
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Client *,std::shared_ptr<TelephonyXPC::Client>::__shared_ptr_default_delete<TelephonyXPC::Client,TelephonyXPC::Client>,std::allocator<TelephonyXPC::Client>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t __cxx_global_var_init_2()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>::~PthreadMutexGuardPolicy, &ctu::Singleton<TelephonyXPC::ClientStateTracker,TelephonyXPC::ClientStateTracker,ctu::PthreadMutexGuardPolicy<TelephonyXPC::ClientStateTracker>>::sInstance, &dword_219294000);
  }
  return result;
}

void *TelephonyXPC::Command::Command(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void TelephonyXPC::Command::name(TelephonyXPC::Command::State **this)
{
}

void TelephonyXPC::Command::getName(TelephonyXPC::Command::State **this@<X0>, void *a2@<X8>)
{
  TelephonyXPC::Command::State::name(*this);
  ctu::cf::convert_copy();
  if (v4 < 0) {
    operator delete(__p);
  }
  *a2 = 0xAAAAAAAAAAAAAAAALL;
}

void sub_21929E0AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

xpc_object_t TelephonyXPC::Command::get@<X0>(void ***this@<X0>, void *a2@<X8>)
{
  return TelephonyXPC::Command::State::get(*this, a2);
}

BOOL TelephonyXPC::Command::notifiable(TelephonyXPC::Command *this)
{
  return *(void *)(*(void *)this + 8) && *(void *)(*(void *)this + 16) != 0;
}

void std::__shared_ptr_pointer<TelephonyXPC::Command::State *,std::shared_ptr<TelephonyXPC::Command::State>::__shared_ptr_default_delete<TelephonyXPC::Command::State,TelephonyXPC::Command::State>,std::allocator<TelephonyXPC::Command::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Command::State *,std::shared_ptr<TelephonyXPC::Command::State>::__shared_ptr_default_delete<TelephonyXPC::Command::State,TelephonyXPC::Command::State>,std::allocator<TelephonyXPC::Command::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_pointer<TelephonyXPC::Command *,std::shared_ptr<TelephonyXPC::Command>::__shared_ptr_default_delete<TelephonyXPC::Command,TelephonyXPC::Command>,std::allocator<TelephonyXPC::Command>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<TelephonyXPC::Command *,std::shared_ptr<TelephonyXPC::Command>::__shared_ptr_default_delete<TelephonyXPC::Command,TelephonyXPC::Command>,std::allocator<TelephonyXPC::Command>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x270F97268]();
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F97410](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x270F97420]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x270F97438]();
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x270F97508]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
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

uint64_t ctu::operator<<()
{
  return MEMORY[0x270F977A8]();
}

{
  return MEMORY[0x270F977B8]();
}

{
  return MEMORY[0x270F977C8]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x270F977D8]();
}

{
  return MEMORY[0x270F977E0]();
}

{
  return MEMORY[0x270F97820]();
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::forceLog()
{
  return MEMORY[0x270F97838]();
}

uint64_t ctu::LoggerCommonBase::getLogLevel(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x270F978D0](this);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x270F97948](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
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

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
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
  return MEMORY[0x270F98DE8]();
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t dispatch_workloop_is_current()
{
  return MEMORY[0x270ED95D8]();
}

void free(void *a1)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
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

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
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