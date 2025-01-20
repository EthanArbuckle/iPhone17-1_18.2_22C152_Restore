void ___ZN6AriOsa7IpcInitEPNS_13IpcDescriptorE_block_invoke_2(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4)
{
  const char *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(const char *, void, uint64_t);
  uint64_t v11;
  void *__p[2];
  char v13;
  uint64_t vars8;

  if (a2)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke_2", a3);
    if (v13 >= 0) {
      v7 = __p;
    }
    else {
      v7 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) PCITransportStatusError Async read error 0x%08x sz(%u)", v6, v7, 74, a2, a4);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    v8 = *(void *)(a1 + 32);
    v9 = *(void (**)(const char *, void, uint64_t))(v8 + 160);
    v11 = *(void *)(v8 + 176);
    v9(a3, a4, v11);
  }
}

void sub_230AB7E4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int a2, _DWORD *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = a2;
      if (v6 <= a2) {
        unint64_t v8 = a2 % v6;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & a2;
    }
    v9 = *(uint64_t ***)(*(void *)a1 + 8 * v8);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (*((_DWORD *)i + 4) == a2) {
            return i;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= v6) {
              v11 %= v6;
            }
          }
          else
          {
            v11 &= v6 - 1;
          }
          if (v11 != v8) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  }
  v12 = (void *)(a1 + 16);
  v35[2] = 0xAAAAAAAAAAAAAA01;
  v13 = operator new(0x38uLL);
  v35[0] = v13;
  v35[1] = a1 + 16;
  void *v13 = 0;
  v13[1] = v5;
  *((_DWORD *)v13 + 4) = *a3;
  *((_DWORD *)v13 + 6) = 0;
  v13[4] = v13 + 4;
  v13[5] = v13 + 4;
  v13[6] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v6 || (float)(v15 * (float)v6) < v14)
  {
    BOOL v16 = 1;
    if (v6 >= 3) {
      BOOL v16 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v6);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      int8x8_t prime = (int8x8_t)v18;
    }
    else {
      int8x8_t prime = (int8x8_t)v17;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v6) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v6)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v6 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }
      else
      {
        uint64_t v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }
      if (*(void *)&prime <= v26) {
        int8x8_t prime = (int8x8_t)v26;
      }
      if (*(void *)&prime >= v6)
      {
        unint64_t v6 = *(void *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v20 = operator new(8 * *(void *)&prime);
          v21 = *(void **)a1;
          *(void *)a1 = v20;
          if (v21) {
            operator delete(v21);
          }
          uint64_t v22 = 0;
          *(int8x8_t *)(a1 + 8) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v22++) = 0;
          while (*(void *)&prime != v22);
          v23 = (void *)*v12;
          if (*v12)
          {
            unint64_t v24 = v23[1];
            uint8x8_t v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(void *)&prime) {
                v24 %= *(void *)&prime;
              }
            }
            else
            {
              v24 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v24) = v12;
            v29 = (void *)*v23;
            if (*v23)
            {
              do
              {
                unint64_t v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(void *)&prime) {
                    v30 %= *(void *)&prime;
                  }
                }
                else
                {
                  v30 &= *(void *)&prime - 1;
                }
                if (v30 != v24)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v30))
                  {
                    *(void *)(*(void *)a1 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  void *v23 = *v29;
                  void *v29 = **(void **)(*(void *)a1 + 8 * v30);
                  **(void **)(*(void *)a1 + 8 * v30) = v29;
                  v29 = v23;
                }
                unint64_t v30 = v24;
LABEL_55:
                v23 = v29;
                v29 = (void *)*v29;
                unint64_t v24 = v30;
              }
              while (v29);
            }
          }
          unint64_t v6 = (unint64_t)prime;
          goto LABEL_59;
        }
        v34 = *(void **)a1;
        *(void *)a1 = 0;
        if (v34) {
          operator delete(v34);
        }
        unint64_t v6 = 0;
        *(void *)(a1 + 8) = 0;
      }
    }
LABEL_59:
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v8 = v5 % v6;
      }
      else {
        unint64_t v8 = v5;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & v5;
    }
  }
  v31 = *(void **)(*(void *)a1 + 8 * v8);
  i = (uint64_t *)v35[0];
  if (v31)
  {
    *(void *)v35[0] = *v31;
LABEL_72:
    void *v31 = i;
    goto LABEL_73;
  }
  *(void *)v35[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(*(void *)a1 + 8 * v8) = v12;
  if (*i)
  {
    unint64_t v32 = *(void *)(*i + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v32 >= v6) {
        v32 %= v6;
      }
    }
    else
    {
      v32 &= v6 - 1;
    }
    v31 = (void *)(*(void *)a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  v35[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v35);
  return i;
}

void sub_230AB8280(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriClientProxy::getShortName(Ari::AriClientProxy *this)
{
  return (uint64_t)this + 16;
}

void *ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[](uint64_t a1, int a2)
{
  int v10 = a2;
  MEMORY[0x230FC6810](*(unsigned char *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 166);
  BOOL v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x230FC6810](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 167);
  BOOL v5 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((void *)a1, a2) == 0;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::sw_dbug_trap(a1, v5);
  unint64_t v6 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t *)a1, a2, &v10)+ 4;
  BOOL v8 = AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v7) == -1;
  MEMORY[0x230FC6810](v8, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 172);
  return v6;
}

void std::__shared_ptr_emplace<AriHostRt::RtTransaction>::__on_zero_shared(uint64_t a1)
{
}

void AriHostRt::RtTransaction::create(const unsigned __int8 *a1@<X0>, unsigned int a2@<W1>, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *a3@<X2>, AriDispatch::Timer *a4@<X3>, uint64_t a5@<X4>, std::chrono::system_clock::time_point **a6@<X8>)
{
  MEMORY[0x230FC6810](a2 < 0xC, "msgSz < sizeof(ARI_IPC_HEADER_t)", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 62);
  make_shared_buffer(a1);
  unint64_t v11 = (std::chrono::system_clock::time_point *)operator new(0x78uLL);
  v12 = (std::__shared_weak_count *)v11;
  v11[1].__d_.__rep_ = 0;
  v11[2].__d_.__rep_ = 0;
  v11->__d_.__rep_ = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)&unk_26E554930;
  v13 = v11 + 3;
  v18[0] = 0xAAAAAAAAAAAAAAAALL;
  v18[1] = 0xAAAAAAAAAAAAAAAALL;
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v14 = *a3;
  float v15 = (std::__shared_weak_count *)a3[1];
  v17[0] = v14;
  v17[1] = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  AriHostRt::RtTransaction::RtTransaction(v11 + 3, v18, v17, a4, a5);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  *a6 = v13;
  a6[1] = (std::chrono::system_clock::time_point *)v12;
  shared_owners = (std::__shared_weak_count *)v12[1].__shared_owners_;
  if (!shared_owners)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)&v12[1];
    v12[1].__shared_owners_ = (uint64_t)v12;
    goto LABEL_9;
  }
  if (shared_owners->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)&v12[1];
    v12[1].__shared_owners_ = (uint64_t)v12;
    std::__shared_weak_count::__release_weak(shared_owners);
LABEL_9:
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
}

void sub_230AB8508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  std::__shared_weak_count::~__shared_weak_count(v10);
  operator delete(v14);
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt7SendRawEPhjj_block_invoke(uint64_t isAlloc)
{
  uint64_t v1 = isAlloc;
  v2 = (_DWORD *)(isAlloc + 56);
  int v3 = *(_DWORD *)(isAlloc + 56);
  if (v3 != 0x8000 && (~v3 & 0x7F00) != 0 && *(_DWORD *)(isAlloc + 56) != 0)
  {
    uint64_t v15 = *(void *)(isAlloc + 40);
    isAlloc = (uint64_t)std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((void *)(v15 + 33320), v3);
    if (!isAlloc)
    {
      isAlloc = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(v15 + 33032);
      if (isAlloc)
      {
        v31 = (AriHostRt::RtTransaction *)0xAAAAAAAAAAAAAAAALL;
        unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
        BOOL v16 = *(const unsigned __int8 **)(v1 + 48);
        unsigned int v17 = *(_DWORD *)(v1 + 60);
        unint64_t v18 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[](*(void *)(v1 + 40) + 33032, (*(_DWORD *)(v1 + 56) >> 8) & 0x7F);
        v19 = (std::__shared_weak_count *)v18[1];
        v34[0] = *v18;
        v34[1] = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)v19;
        if (v19) {
          atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        AriHostRt::RtTransaction::create(v16, v17, v34, *(AriDispatch::Timer **)(*(void *)(v1 + 40) + 24), (*(_DWORD *)(*(void *)(v1 + 40) + 8) * *(_DWORD *)(v1 + 64)), (std::chrono::system_clock::time_point **)&v31);
        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        }
        v20 = v31;
        AriHostRt::RtTransaction::startTimeoutCountDown((int64_t *)v31);
        isAlloc = (uint64_t)std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(void *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
        v21 = (std::__shared_weak_count *)v32;
        if (v32) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v32 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v22 = *(std::__shared_weak_count **)(isAlloc + 32);
        *(void *)(isAlloc + 24) = v20;
        *(void *)(isAlloc + 32) = v21;
        if (v22) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v22);
        }
        if (v21) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v21);
        }
      }
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = AriHostRt::sendRawInternal_nl((AriHostRt *)isAlloc, *(AriMsg **)(v1 + 48), (unsigned __int8 *)*(unsigned int *)(v1 + 60));
  int8x8_t v8 = *(int8x8_t *)(*(void *)(v1 + 40) + 33328);
  if (v8)
  {
    unint64_t v9 = *(int *)(v1 + 56);
    uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = *(int *)(v1 + 56);
      if (*(void *)&v8 <= v9) {
        unint64_t v11 = v9 % *(void *)&v8;
      }
    }
    else
    {
      unint64_t v11 = (*(void *)&v8 - 1) & v9;
    }
    v12 = *(uint64_t ***)(*(void *)(*(void *)(v1 + 40) + 33320) + 8 * v11);
    if (v12)
    {
      for (i = *v12; i; i = (uint64_t *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (*((_DWORD *)i + 4) == v9)
          {
            if (*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24))
            {
              v23 = &v31;
              AriOsa::LogSrcInfo((uint64_t *)&v31, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SendRaw_block_invoke", v6);
              if (v33 < 0) {
                v23 = v31;
              }
              unint64_t v24 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(void *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
              AriHostRt::RtTransaction::asString((uint64_t *)__p, (AriHostRt::RtTransaction *)v24[3]);
              if (v30 >= 0) {
                unint64_t v26 = __p;
              }
              else {
                unint64_t v26 = (void **)__p[0];
              }
              Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Fail to complete the transaction(%s), cancelling", v25, v23, 699, v26);
              if (v30 < 0) {
                operator delete(__p[0]);
              }
              if (v33 < 0) {
                operator delete(v31);
              }
              uint8x8_t v27 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(void *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
              AriHostRt::RtTransaction::cancel((AriHostRt::RtTransaction *)v27[3], *(unsigned int *)(*(void *)(*(void *)(v1 + 32) + 8) + 24));
              std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>((void *)(*(void *)(v1 + 40) + 33320), *(_DWORD *)(v1 + 56));
            }
            else
            {
              LODWORD(v31) = 0;
              if (!AriMsg::GetBufSeq(*(AriMsg **)(v1 + 48), (const unsigned __int8 *)*(unsigned int *)(v1 + 60), (uint64_t)&v31, v7))
              {
                uint64_t v28 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(*(void *)(v1 + 40) + 33320, *(_DWORD *)(v1 + 56), v2);
                AriMsg::SetBufSeq(**(AriMsg ***)(v28[3] + 16), (const unsigned __int8 *)(*(void *)(*(void *)(v28[3] + 16) + 8) - **(void **)(v28[3] + 16)));
              }
            }
            return;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= *(void *)&v8) {
              v14 %= *(void *)&v8;
            }
          }
          else
          {
            v14 &= *(void *)&v8 - 1;
          }
          if (v14 != v11) {
            return;
          }
        }
      }
    }
  }
}

void sub_230AB88A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  _Unwind_Resume(exception_object);
}

void AriHostRt::RtTransaction::~RtTransaction(AriHostRt::RtTransaction *this)
{
  v2 = (std::__shared_weak_count *)*((void *)this + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  int v3 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  BOOL v4 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  BOOL v5 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void ___ZN3Ari22AriXpcServerConnection4initEv_block_invoke(void *a1, void *a2)
{
  int v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    unint64_t v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint8x8_t v7 = v6;
      uint64_t v8 = a1[5];
      if (v8)
      {
        if (MEMORY[0x230FC6F30](a2) == MEMORY[0x263EF8708])
        {
          Ari::AriXpcServerConnection::handleClientMessage((Ari::AriXpcServerConnection *)v5, a2);
        }
        else
        {
          AriOsa::LogSrcInfo((uint64_t *)v36, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v9);
          int v10 = v37;
          unint64_t v11 = (void **)v36[0];
          asString((uint64_t *)__p, a2);
          v13 = v36;
          if (v10 < 0) {
            v13 = v11;
          }
          if (v35 >= 0) {
            unint64_t v14 = __p;
          }
          else {
            unint64_t v14 = (void **)__p[0];
          }
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) %s", v12, v13, 372, v14);
          if (v35 < 0) {
            operator delete(__p[0]);
          }
          if (v37 < 0) {
            operator delete(v36[0]);
          }
          AriOsa::LogSrcInfo((uint64_t *)v36, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v15);
          if (v37 >= 0) {
            unsigned int v17 = v36;
          }
          else {
            unsigned int v17 = (void **)v36[0];
          }
          unint64_t v18 = (void *)(v5 + 32);
          if (*(char *)(v5 + 55) < 0) {
            unint64_t v18 = (void *)*v18;
          }
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Terminating conn(%s)", v16, v17, 375, v18);
          if (v37 < 0) {
            operator delete(v36[0]);
          }
          xpc_connection_cancel(*(xpc_connection_t *)(v5 + 16));
          uint64_t v31 = v8;
          for (i = *(uint64_t ***)(v5 + 80); i; i = (uint64_t **)*i)
          {
            v20 = (AriHostRt *)*((unsigned int *)i + 4);
            if (AriHostRt::DeregisterClient(v20))
            {
              AriOsa::LogSrcInfo((uint64_t *)v36, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v21);
              if (v37 >= 0) {
                v23 = v36;
              }
              else {
                v23 = (void **)v36[0];
              }
              Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to deregister cid 0x%x", v22, v23, 386, v20);
            }
            else
            {
              AriOsa::LogSrcInfo((uint64_t *)v36, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v21);
              if (v37 >= 0) {
                uint8x8_t v25 = v36;
              }
              else {
                uint8x8_t v25 = (void **)v36[0];
              }
              Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Deregistered cid 0x%x", v24, v25, 382, v20);
            }
            if (v37 < 0) {
              operator delete(v36[0]);
            }
          }
          if (*(void *)(v5 + 88))
          {
            unint64_t v26 = *(void **)(v5 + 80);
            if (v26)
            {
              do
              {
                uint8x8_t v27 = (void *)*v26;
                operator delete(v26);
                unint64_t v26 = v27;
              }
              while (v27);
            }
            *(void *)(v5 + 80) = 0;
            uint64_t v28 = *(void *)(v5 + 72);
            if (v28)
            {
              for (uint64_t j = 0; j != v28; ++j)
                *(void *)(*(void *)(v5 + 64) + 8 * j) = 0;
            }
            *(void *)(v5 + 88) = 0;
          }
          uint64_t v32 = v31;
          char v33 = v7;
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v30 = *(void *)(v5 + 128);
          if (!v30) {
            std::__throw_bad_function_call[abi:ne180100]();
          }
          (*(void (**)(uint64_t, uint64_t *))(*(void *)v30 + 48))(v30, &v32);
          if (v33) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v33);
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_230AB8C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriXpcServerConnection::handleClientMessage(Ari::AriXpcServerConnection *this, void *a2)
{
  int v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (!v3 || (uint64_t v5 = *(void *)this, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint8x8_t v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  BOOL v8 = MEMORY[0x230FC6F30](a2) != MEMORY[0x263EF8708];
  MEMORY[0x230FC6810](v8, "xpc_get_type(dictionary) != XPC_TYPE_DICTIONARY", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 499);
  xpc_retain(a2);
  unint64_t v9 = *((void *)this + 3);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1174405120;
  v11[2] = ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke;
  v11[3] = &__block_descriptor_tmp_84;
  v11[4] = this;
  v11[5] = v5;
  v12 = v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v13 = a2;
  dispatch_async(v9, v11);
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
  std::__shared_weak_count::__release_weak(v7);
  return 0;
}

void sub_230AB8DF0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriClientXpcProxy::getShortName(Ari::AriClientXpcProxy *this)
{
  return (uint64_t)this + 56;
}

uint64_t Ari::AriClientGcdProxy::forwardIndication(uint64_t a1, uint64_t a2)
{
  int v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3 || (uint64_t v5 = *(void *)(a1 + 40), (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint8x8_t v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  MEMORY[0x230FC6810](*(void *)(a1 + 56) == 0, "conn == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 123);
  uint64_t BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)a2, (const unsigned __int8 *)(*(void *)(*(void *)a2 + 8) - **(void **)a2));
  AriOsa::LogSrcInfo((uint64_t *)v23, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardIndication", v9);
  if (v24 >= 0) {
    int v10 = v23;
  }
  else {
    int v10 = (void **)v23[0];
  }
  unint64_t v11 = (void *)(a1 + 16);
  if (*(char *)(a1 + 39) < 0) {
    unint64_t v11 = (void *)*v11;
  }
  uint64_t v12 = *(void *)(*(void *)a2 + 8) - **(void **)a2;
  v13 = *(NSObject **)(a1 + 56);
  label = dispatch_queue_get_label(v13);
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Indication(0x%08x) for client(%s) Type(GCD) size(%zu) dispq(%s:%p)", v15, v10, 127, BufGmid, v11, v12, label, v13);
  if (v24 < 0) {
    operator delete(v23[0]);
  }
  BOOL v16 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN3Ari17AriClientGcdProxy17forwardIndicationENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_19;
  block[4] = a1;
  block[5] = v5;
  v20 = v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  unsigned int v17 = *(std::__shared_weak_count **)(a2 + 8);
  v21 = *(AriMsg ***)a2;
  uint64_t v22 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v16, block);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v20) {
    std::__shared_weak_count::__release_weak(v20);
  }
  std::__shared_weak_count::__release_weak(v7);
  return 0;
}

void sub_230AB8FE4(_Unwind_Exception *a1)
{
  if (*(char *)(v2 - 81) < 0) {
    operator delete(*(void **)(v2 - 104));
  }
  std::__shared_weak_count::__release_weak(v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t AriHostRt::InboundRespCB(AriHostRt *a1)
{
  AriHostRt::GetInstance(a1);
  uint64_t BufCtx = AriMsg::GetBufCtx(**(AriMsg ***)a1, (const unsigned __int8 *)(*(void *)(*(void *)a1 + 8) - **(void **)a1));
  int BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)a1, (const unsigned __int8 *)(*(void *)(*(void *)a1 + 8) - **(void **)a1));
  if (BufCtx == 32513)
  {
    std::string::basic_string[abi:ne180100]<0>(&v47, "arirt_internal_client");
    Ari::LogTransportBuf();
    if (v48 < 0) {
      operator delete(v47);
    }
    if (BufGmid > 68190207)
    {
      if (BufGmid == 68190208)
      {
        unint64_t v43 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
        ARI_AriMsgAttribResp_Extract();
        AriOsa::LogSrcInfo((uint64_t *)v45, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v23);
        if (v46 >= 0) {
          uint8x8_t v25 = v45;
        }
        else {
          uint8x8_t v25 = (void **)v45[0];
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Error getting expected internal message AriMsgAttribResp", v24, v25, 1185);
        goto LABEL_64;
      }
      if (BufGmid == 84312064)
      {
        LODWORD(v43) = -1431655766;
        int v16 = ARI_CsiGetCurrentBootStateRspCb_Extract();
        AriOsa::LogSrcInfo((uint64_t *)v45, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v15);
        if (v46 >= 0) {
          uint64_t v30 = v45;
        }
        else {
          uint64_t v30 = (void **)v45[0];
        }
        if (v16) {
          uint64_t v31 = "there was an error";
        }
        else {
          uint64_t v31 = "BB is not ready";
        }
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Received boot state, but %s", v29, v30, 1175, v31);
LABEL_64:
        if (v46 < 0) {
          operator delete(v45[0]);
        }
        return 0;
      }
    }
    else
    {
      if (BufGmid == 67436544)
      {
        unint64_t v43 = 0xAAAAAAAAAAAAAAAALL;
        if (!ARI_AriACK_Extract())
        {
          AriOsa::LogSrcInfo((uint64_t *)v45, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v17);
          int v18 = v46;
          v19 = (void **)v45[0];
          uint64_t v20 = asString();
          uint64_t v22 = v45;
          if (v18 < 0) {
            uint64_t v22 = v19;
          }
          Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) ACK received for AriHostRt internal message(%d-0x%03X) with status(%s(%d))", v21, v22, 1197, v43 >> 26, (v43 >> 15) & 0x3FF, v20, HIDWORD(v43));
          goto LABEL_64;
        }
        return 0;
      }
      if (BufGmid == 67600384)
      {
        unint64_t v43 = 0xAAAAAAAAAAAAAAAALL;
        if (!ARI_AriNACK_Extract())
        {
          AriOsa::LogSrcInfo((uint64_t *)v45, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v5);
          int v32 = v46;
          char v33 = (void **)v45[0];
          uint64_t v34 = asString();
          v36 = v45;
          if (v32 < 0) {
            v36 = v33;
          }
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) NACK received for AriHostRt internal message(%d-0x%03X) with status(%s(%d))", v35, v36, 1217, v43 >> 26, (v43 >> 15) & 0x3FF, v34, HIDWORD(v43));
          goto LABEL_64;
        }
        return 0;
      }
    }
    AriOsa::LogSrcInfo((uint64_t *)v45, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v4);
    if (v46 >= 0) {
      uint8x8_t v27 = v45;
    }
    else {
      uint8x8_t v27 = (void **)v45[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unexpected AriHostRt internal message(%d-0x%03X)", v26, v27, 1225, BufGmid >> 26, (BufGmid >> 15) & 0x3FF);
    goto LABEL_64;
  }
  if (std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(qword_26AB82510, BufCtx))
  {
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>(qword_26AB82510, BufCtx);
  }
  if (std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(qword_26AB82538, BufCtx))
  {
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>(qword_26AB82538, BufCtx);
  }
  if (qword_26AB82560 && !qword_26AB82550) {
    AriDispatch::Semaphore::signal((AriDispatch::Semaphore *)qword_26AB82560);
  }
  if (ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)&unk_26AB823F0))
  {
    unint64_t v6 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[]((uint64_t)&unk_26AB823F0, (BufCtx >> 8) & 0x7F);
    uint64_t v8 = *v6;
    uint8x8_t v7 = (std::__shared_weak_count *)v6[1];
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8);
    if (*(char *)(v9 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)v9, *(void *)(v9 + 8));
    }
    else
    {
      long long v10 = *(_OWORD *)v9;
      v40.__r_.__value_.__r.__words[2] = *(void *)(v9 + 16);
      *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v10;
    }
    Ari::LogTransportBuf();
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v40.__r_.__value_.__l.__data_);
    }
    uint64_t v28 = (std::__shared_weak_count *)*((void *)a1 + 1);
    v38 = *(AriMsg ***)a1;
    v39 = v28;
    if (v28) {
      atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v14 = (*(uint64_t (**)(uint64_t, AriMsg ***))(*(void *)v8 + 32))(v8, &v38);
    if (v39) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v39);
    }
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "client_not_registered");
    Ari::LogTransportBuf();
    if (v42 < 0) {
      operator delete(__p);
    }
    if (!qword_26AB825A0)
    {
      AriOsa::LogSrcInfo((uint64_t *)v45, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundRespCB", v11);
      v13 = v46 >= 0 ? v45 : (void **)v45[0];
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Non-registered cid 0x%04X from buffer ctx 0x%08X", v12, v13, 1247, (BufCtx >> 8) & 0x7F, BufCtx);
      if (v46 < 0) {
        operator delete(v45[0]);
      }
    }
    return 0xFFFFFFFFLL;
  }
  return v14;
}

void sub_230AB96B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
}

void __destroy_helper_block_e8_40c48_ZTSNSt3__18weak_ptrIN3Ari17AriClientGcdProxyEEE56c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  int v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t AriHostRt::InboundMsgCB(AriHostRt *this, unsigned __int8 *a2)
{
  uint64_t BufCtx = (Ari *)AriMsg::GetBufCtx(this, a2);
  int v4 = (int)BufCtx;
  if ((Ari::GetLogLevels(BufCtx) & 4) != 0) {
    Ari::LogHeader(this, v5);
  }
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  v13 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  shared_buffer = (AriHostRt *)make_shared_buffer((const unsigned __int8 *)this);
  AriHostRt::GetInstance(shared_buffer);
  uint8x8_t v7 = qword_26AB7A300;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke;
  block[3] = &__block_descriptor_tmp_89;
  block[4] = 0xAAAAAAAAAAAAAAAALL;
  long long v10 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  int v11 = v4;
  dispatch_async(v7, block);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  return 0;
}

void sub_230AB98D0(_Unwind_Exception *exception_object)
{
  int v3 = *(std::__shared_weak_count **)(v1 - 40);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(uint64_t a1)
{
  MEMORY[0x230FC6810](*(unsigned char *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 259);
  BOOL v2 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x230FC6810](v2, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 261);
  uint64_t isAlloc = IDMgr::isAlloc((IDMgr *)(a1 + 40));
  BOOL v5 = AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v4) == -1;
  MEMORY[0x230FC6810](v5, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 263);
  return isAlloc;
}

void ___ZN9AriHostRt16DeregisterClientEj_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  unsigned int v4 = atomic_load(*(unsigned int **)(a1 + 40));
  if (v4 != -1)
  {
    int v5 = *(_DWORD *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 40) + 33192;
    v72 = &unk_26E554B20;
    int v73 = v5;
    v74 = &v72;
    MEMORY[0x230FC6810](*(unsigned char *)(v6 + 88) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 333);
    BOOL v7 = AriOsa::OsMutexTake(*(AriOsa **)(v6 + 80), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
    MEMORY[0x230FC6810](v7, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 336);
    uint64_t v9 = *(uint64_t **)v6;
    if (*(void *)v6)
    {
      long long v10 = 0;
      int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        LODWORD(__p[0]) = *((_DWORD *)v9 + 4);
        if (!v74) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        if ((*((unsigned int (**)(void **, void **, uint64_t *))*v74 + 6))(v74, __p, v9 + 4))
        {
          if ((unint64_t)v11 >= v12)
          {
            uint64_t v14 = (v11 - v10) >> 2;
            unint64_t v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 62) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if ((uint64_t)(v12 - (void)v10) >> 1 > v15) {
              unint64_t v15 = (uint64_t)(v12 - (void)v10) >> 1;
            }
            if (v12 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v16 = v15;
            }
            if (v16) {
              unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v16);
            }
            else {
              uint64_t v8 = 0;
            }
            unsigned int v17 = (char *)(v16 + 4 * v14);
            *(_DWORD *)unsigned int v17 = *((_DWORD *)v9 + 4);
            v13 = v17 + 4;
            while (v11 != v10)
            {
              int v18 = *((_DWORD *)v11 - 1);
              v11 -= 4;
              *((_DWORD *)v17 - 1) = v18;
              v17 -= 4;
            }
            unint64_t v12 = v16 + 4 * (void)v8;
            if (v10) {
              operator delete(v10);
            }
            long long v10 = v17;
            goto LABEL_24;
          }
          *(_DWORD *)int v11 = *((_DWORD *)v9 + 4);
          v11 += 4;
        }
        v13 = v11;
LABEL_24:
        uint64_t v9 = (uint64_t *)*v9;
        int v11 = v13;
        if (!v9) {
          goto LABEL_31;
        }
      }
    }
    long long v10 = 0;
    v13 = 0;
LABEL_31:
    BOOL v25 = AriOsa::OsMutexGive(*(AriOsa **)(v6 + 80), v8) == -1;
    MEMORY[0x230FC6810](v25, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 346);
    std::__function::__value_func<int ()(int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](&v72);
    unint64_t v26 = *(unsigned int **)(a1 + 40);
    v68 = 0;
    v69 = 0;
    v67 = 0;
    uint64_t v27 = v13 - v10;
    if (v13 == v10)
    {
      uint64_t v28 = 0;
    }
    else
    {
      if (v27 < 0) {
        std::vector<int>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v28 = (int *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v27 >> 2);
      v67 = v28;
      v69 = &v28[v29];
      memmove(v28, v10, v13 - v10);
      v68 = &v28[v27 >> 2];
    }
    AriHostRt::checkShouldDeregIndication_nl(v26, &v67);
    if (v28)
    {
      v68 = v28;
      operator delete(v28);
    }
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = (AriHostRt::ClientTransitionTracker **)(v30 + 33432);
    int v32 = *(std::__shared_weak_count **)(v30 + 33440);
    if (v32)
    {
      char v33 = std::__shared_weak_count::lock(v32);
      if (v33)
      {
        uint64_t v34 = v33;
        if (*v31) {
          AriHostRt::ClientTransitionTracker::removeAllTracking(*v31, *(unsigned int *)(a1 + 48));
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v34);
      }
    }
    uint64_t v35 = *(void *)(a1 + 40);
    v36 = (AriHostRt::ClientTransitionTracker **)(v35 + 33416);
    char v37 = *(std::__shared_weak_count **)(v35 + 33424);
    if (v37)
    {
      v38 = std::__shared_weak_count::lock(v37);
      if (v38)
      {
        v39 = v38;
        if (*v36) {
          AriHostRt::ClientTransitionTracker::removeAllTracking(*v36, *(unsigned int *)(a1 + 48));
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v39);
      }
    }
    uint64_t v40 = *(void *)(a1 + 40);
    v41 = (AriHostRt::ClientTransitionTracker **)(v40 + 33448);
    char v42 = *(std::__shared_weak_count **)(v40 + 33456);
    if (v42)
    {
      unint64_t v43 = std::__shared_weak_count::lock(v42);
      if (v43)
      {
        unint64_t v44 = v43;
        if (*v41) {
          AriHostRt::ClientTransitionTracker::removeAllTracking(*v41, *(unsigned int *)(a1 + 48));
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v44);
      }
    }
    if (!ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(void *)(a1 + 40) + 33032))
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregisterClient_block_invoke", v45);
      if (v71 >= 0) {
        v58 = __p;
      }
      else {
        v58 = (void **)__p[0];
      }
      Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Attempt to de-reg an non-existant CID(%x)", v57, v58, 613, *(unsigned int *)(a1 + 48));
      if (v71 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_88;
    }
    uint64_t v46 = *(void *)(a1 + 40);
    v47 = (void *)(v46 + 33032);
    int v48 = *(_DWORD *)(a1 + 48);
    MEMORY[0x230FC6810](*(unsigned char *)(v46 + 33136) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 235);
    BOOL v49 = AriOsa::OsMutexTake(*(AriOsa **)(v46 + 33128), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
    MEMORY[0x230FC6810](v49, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 236);
    int v50 = IDMgr::free((IDMgr *)(v46 + 33072));
    ResMgr<std::shared_ptr<Ari::AriClientProxy>>::sw_dbug_trap(v46 + 33032, v50 ^ 1);
    v51 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((void *)(v46 + 33032), v48);
    v52 = v51;
    int8x8_t v53 = *(int8x8_t *)(v46 + 33040);
    uint64_t v54 = *v51;
    unint64_t v55 = v51[1];
    uint8x8_t v56 = (uint8x8_t)vcnt_s8(v53);
    v56.i16[0] = vaddlv_u8(v56);
    if (v56.u32[0] > 1uLL)
    {
      if (v55 >= *(void *)&v53) {
        v55 %= *(void *)&v53;
      }
    }
    else
    {
      v55 &= *(void *)&v53 - 1;
    }
    v59 = *(uint64_t **)(*v47 + 8 * v55);
    do
    {
      v60 = v59;
      v59 = (uint64_t *)*v59;
    }
    while (v59 != v51);
    if (v60 == (uint64_t *)(v46 + 33048)) {
      goto LABEL_75;
    }
    unint64_t v61 = v60[1];
    if (v56.u32[0] > 1uLL)
    {
      if (v61 >= *(void *)&v53) {
        v61 %= *(void *)&v53;
      }
    }
    else
    {
      v61 &= *(void *)&v53 - 1;
    }
    if (v61 != v55)
    {
LABEL_75:
      if (v54)
      {
        unint64_t v62 = *(void *)(v54 + 8);
        if (v56.u32[0] > 1uLL)
        {
          unint64_t v63 = *(void *)(v54 + 8);
          if (v62 >= *(void *)&v53) {
            unint64_t v63 = v62 % *(void *)&v53;
          }
        }
        else
        {
          unint64_t v63 = v62 & (*(void *)&v53 - 1);
        }
        if (v63 == v55) {
          goto LABEL_79;
        }
      }
      *(void *)(*v47 + 8 * v55) = 0;
      uint64_t v54 = *v51;
    }
    if (!v54)
    {
LABEL_85:
      uint64_t *v60 = v54;
      uint64_t *v51 = 0;
      --*(void *)(v46 + 33056);
      v64 = (std::__shared_weak_count *)v51[5];
      if (v64) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v64);
      }
      operator delete(v52);
      BOOL v66 = AriOsa::OsMutexGive(*(AriOsa **)(v46 + 33128), v65) == -1;
      MEMORY[0x230FC6810](v66, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 241);
LABEL_88:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      if (!v10) {
        return;
      }
      char v24 = v10;
      goto LABEL_90;
    }
    unint64_t v62 = *(void *)(v54 + 8);
LABEL_79:
    if (v56.u32[0] > 1uLL)
    {
      if (v62 >= *(void *)&v53) {
        v62 %= *(void *)&v53;
      }
    }
    else
    {
      v62 &= *(void *)&v53 - 1;
    }
    if (v62 != v55)
    {
      *(void *)(*v47 + 8 * v62) = v60;
      uint64_t v54 = *v51;
    }
    goto LABEL_85;
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregisterClient_block_invoke", a3);
  int v19 = v71;
  uint64_t v20 = (void **)__p[0];
  atomic_load(*(unsigned int **)(a1 + 40));
  uint64_t v21 = asString();
  v23 = __p;
  if (v19 < 0) {
    v23 = v20;
  }
  Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for DeregisterClient on cid %u", v22, v23, 578, v21, *(unsigned int *)(a1 + 48));
  if (v71 < 0)
  {
    char v24 = (char *)__p[0];
LABEL_90:
    operator delete(v24);
  }
}

void sub_230AB9FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  if (v23) {
    operator delete(v23);
  }
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke(uint64_t a1)
{
  unsigned int v48 = 0;
  AriHostRt::GetInstance((AriHostRt *)a1);
  uint64_t v2 = ((_WORD)dword_26AB7A2F4 + 1) & 0x7FF;
  BufSeq = (AriHostRt *)AriMsg::GetBufSeq(**(AriMsg ***)(a1 + 32), (const unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) - **(void **)(a1 + 32)), (uint64_t)&v48, v3);
  if (v48 != v2)
  {
    BufSeq = (AriHostRt *)AriHostRt::GetInstance(BufSeq);
    if (dword_26AB7A2F4 != 2048)
    {
      AriOsa::LogSrcInfo((uint64_t *)v46, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v5);
      BOOL v7 = v47 >= 0 ? v46 : (void **)v46[0];
      BufSeq = (AriHostRt *)Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Missing expected BB.SEQ(0x%03x), got BB.SEQ(0x%03x)", v6, v7, 1103, v2, v48);
      if (v47 < 0) {
        operator delete(v46[0]);
      }
    }
  }
  int v8 = v48;
  Instance = (AriHostRt *)AriHostRt::GetInstance(BufSeq);
  dword_26AB7A2F4 = v8;
  long long v10 = (AriHostRt *)AriHostRt::GetInstance(Instance);
  unsigned int v12 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v12 != 2)
  {
    AriOsa::LogSrcInfo((uint64_t *)v46, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v11);
    int v35 = v47;
    v36 = (void **)v46[0];
    uint64_t v37 = asString();
    if (v35 >= 0) {
      v39 = v46;
    }
    else {
      v39 = v36;
    }
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for InboundMsgCB", v38, v39, 1110, v37);
    goto LABEL_29;
  }
  AriHostRt::GetInstance(v10);
  uint64_t v14 = qword_26AB825A0;
  if (!qword_26AB825A0) {
    goto LABEL_20;
  }
  unint64_t v15 = (AriHostRt *)AriOsa::LogSrcInfo((uint64_t *)v46, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v13);
  int v16 = v47;
  unsigned int v17 = (void **)v46[0];
  int v18 = *(uint64_t **)(a1 + 32);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  uint64_t v21 = *(unsigned int *)(a1 + 48);
  AriHostRt::GetInstance(v15);
  uint64_t v22 = v19 - v20;
  if (v16 >= 0) {
    v23 = v46;
  }
  else {
    v23 = v17;
  }
  label = dispatch_queue_get_label((dispatch_queue_t)qword_26AB825A8);
  unint64_t v26 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Inbound Msg sz%zu ctx(0x%08X) for sniffer (%s) ", v25, v23, 1118, v22, v21, label);
  if (v47 < 0) {
    operator delete(v46[0]);
  }
  AriHostRt::GetInstance(v26);
  uint64_t v27 = qword_26AB825A8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke_2;
  block[3] = &__block_descriptor_tmp_87;
  uint64_t v29 = *(void *)(a1 + 32);
  uint64_t v28 = *(std::__shared_weak_count **)(a1 + 40);
  block[4] = v14;
  void block[5] = v29;
  v45 = v28;
  if (v28) {
    atomic_fetch_add_explicit(&v28->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v27, block);
  AriHostRt::GetInstance(v30);
  int v31 = byte_26AB825B0;
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
  if (v31)
  {
LABEL_20:
    unsigned int v32 = *(_DWORD *)(a1 + 48);
    if (v32 >= 0x8000)
    {
      AriOsa::LogSrcInfo((uint64_t *)v46, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundMsgCB_block_invoke", v13);
      if (v47 >= 0) {
        uint64_t v34 = v46;
      }
      else {
        uint64_t v34 = (void **)v46[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) GetBufCtx Invalid CTX", v33, v34, 1130);
LABEL_29:
      if (v47 < 0) {
        operator delete(v46[0]);
      }
      return;
    }
    uint64_t v40 = *(void *)(a1 + 32);
    if (v32)
    {
      v41 = *(std::__shared_weak_count **)(a1 + 40);
      v42[0] = v40;
      v42[1] = v41;
      if (v41) {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      AriHostRt::InboundRespCB((AriHostRt *)v42);
    }
    else
    {
      v41 = *(std::__shared_weak_count **)(a1 + 40);
      v43[0] = v40;
      v43[1] = v41;
      if (v41) {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      AriHostRt::InboundIndCB((AriHostRt *)v43);
    }
    if (v41) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v41);
    }
  }
}

void sub_230ABA3D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  BOOL v25 = v24;
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::InboundIndCB(AriHostRt *a1)
{
  AriHostRt::GetInstance(a1);
  unsigned int BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)a1, (const unsigned __int8 *)(*(void *)(*(void *)a1 + 8) - **(void **)a1));
  if (BufGmid == 92700672)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundIndCB", v2);
    if ((SBYTE7(v44) & 0x80u) == 0) {
      int v5 = __p;
    }
    else {
      int v5 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Received All-ready via indication", v4, v5, 1272);
    if (SBYTE7(v44) < 0) {
      operator delete(__p[0]);
    }
    AriHostRt::processStartEvent_nl(&AriHostRt::GetInstance(void)::instance);
  }
  uint64_t v6 = (BufGmid >> 15) & 0x3FF;
  uint64_t v38 = BufGmid >> 26;
  int v7 = v6 | (v38 << 10);
  if (ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)&unk_26AB82480))
  {
    unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v50[7] = v8;
    v50[8] = v8;
    v50[5] = v8;
    v50[6] = v8;
    v50[3] = v8;
    v50[4] = v8;
    v50[1] = v8;
    v50[2] = v8;
    long long v49 = v8;
    v50[0] = v8;
    *(_OWORD *)char v47 = v8;
    long long v48 = v8;
    long long v45 = v8;
    long long v46 = v8;
    *(_OWORD *)__p = v8;
    long long v44 = v8;
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__p);
    uint64_t v9 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[]((uint64_t)&unk_26AB82480, v7);
    unsigned int v37 = 0;
    while (1)
    {
      uint64_t v9 = (uint64_t *)v9[1];
      if (v9 == ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[]((uint64_t)&unk_26AB82480, v7)) {
        break;
      }
      int v11 = (unsigned int *)v9[2];
      long long v10 = (std::__shared_weak_count *)v9[3];
      if (v10) {
        atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v12 = v11[2];
      uint64_t v13 = (*(uint64_t (**)(unsigned int *))(*(void *)v11 + 16))(v11);
      int v14 = *(char *)(v13 + 23);
      if (v14 >= 0) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = *(void *)v13;
      }
      if (v14 >= 0) {
        uint64_t v16 = *(unsigned __int8 *)(v13 + 23);
      }
      else {
        uint64_t v16 = *(void *)(v13 + 8);
      }
      unsigned int v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(__p, v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"-", 1);
      int v18 = (std::__shared_weak_count *)*((void *)a1 + 1);
      v41 = *(AriMsg ***)a1;
      char v42 = v18;
      if (v18) {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v20 = (*(uint64_t (**)(unsigned int *, AriMsg ***))(*(void *)v11 + 40))(v11, &v41);
      if (v42) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v42);
      }
      if (v20)
      {
        AriOsa::LogSrcInfo((uint64_t *)&v40, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundIndCB", v19);
        uint64_t v22 = &v40;
        if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          uint64_t v22 = (std::string *)v40.__r_.__value_.__r.__words[0];
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Error handling indication for CID 0x%x registered for gmid(%d-0x%x)", v21, v22, 1301, v12, v38, v6);
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v40.__r_.__value_.__l.__data_);
        }
        unsigned int v37 = -1;
      }
      if (v10) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
    }
    memset(&v40, 170, sizeof(v40));
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&__p[1], &v40);
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = v40.__r_.__value_.__l.__size_;
      if (v40.__r_.__value_.__l.__size_ <= 1) {
        goto LABEL_57;
      }
      uint64_t v28 = (std::string *)v40.__r_.__value_.__r.__words[0];
    }
    else
    {
      std::string::size_type size = HIBYTE(v40.__r_.__value_.__r.__words[2]);
      if (HIBYTE(v40.__r_.__value_.__r.__words[2]) <= 1u)
      {
LABEL_55:
        std::string v39 = v40;
LABEL_58:
        Ari::LogTransportBuf();
        if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v39.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v40.__r_.__value_.__l.__data_);
        }
        __p[0] = *(void **)MEMORY[0x263F8C2C8];
        *(void **)((char *)__p + *((void *)__p[0] - 3)) = *(void **)(MEMORY[0x263F8C2C8] + 24);
        __p[1] = (void *)(MEMORY[0x263F8C318] + 16);
        if (SHIBYTE(v48) < 0) {
          operator delete(v47[1]);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x230FC6B60](v50);
        return v37;
      }
      uint64_t v28 = &v40;
    }
    uint64_t v29 = (unsigned __int8 *)v28 + size;
    uint64_t v30 = v28;
    int v31 = (std::string *)((char *)v28 + size);
    do
    {
      unsigned int v32 = v30;
      char v33 = (unsigned __int8 *)v30;
      while (1)
      {
        int v34 = *v33++;
        if (v34 == 45) {
          break;
        }
        unsigned int v32 = (std::string *)v33;
        if (v33 == v29)
        {
          unsigned int v32 = v31;
          goto LABEL_51;
        }
      }
      uint64_t v30 = (std::string *)((char *)&v32->__r_.__value_.__l.__data_ + 1);
      int v31 = v32;
    }
    while (v33 != v29);
LABEL_51:
    std::string::size_type v35 = (char *)v32 - (char *)v28;
    if (v32 == (std::string *)v29) {
      std::string::size_type v36 = -1;
    }
    else {
      std::string::size_type v36 = v35;
    }
    std::string::erase(&v40, v36, 0xFFFFFFFFFFFFFFFFLL);
    if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_55;
    }
    std::string::size_type size = v40.__r_.__value_.__l.__size_;
LABEL_57:
    std::string::__init_copy_ctor_external(&v39, v40.__r_.__value_.__l.__data_, size);
    goto LABEL_58;
  }
  std::string::basic_string[abi:ne180100]<0>(&v52, "client_not_registered");
  Ari::LogTransportBuf();
  if (v53 < 0) {
    operator delete(v52);
  }
  if (!qword_26AB825A0)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "InboundIndCB", v23);
    BOOL v25 = (SBYTE7(v44) & 0x80u) == 0 ? __p : (void **)__p[0];
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) No handler is registered for indication gmid(%d-0x%x)", v24, v25, 1282, v38, (BufGmid >> 15) & 0x3FF);
    if (SBYTE7(v44) < 0) {
      operator delete(__p[0]);
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_230ABA970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriOsa::IpcWrite(uint64_t (**a1)(void, uint64_t, uint64_t, int *, uint64_t, uint64_t, void), uint64_t a2, uint64_t a3)
{
  if (a1) {
    BOOL v6 = a2 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  uint64_t v7 = v6;
  MEMORY[0x230FC6810](v7, "(ipc_desc == NULL) || (pBuf == NULL)", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", 132);
  int v15 = 0;
  if (*a1) {
    unsigned int v9 = (*a1)(a1, a2, a3, &v15, 1, 2000, 0);
  }
  else {
    unsigned int v9 = 0;
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcWrite", v8);
  if (v14 >= 0) {
    int v11 = __p;
  }
  else {
    int v11 = (void **)__p[0];
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Write(size=%u) completed with status %u", v10, v11, 148, a3, v9);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  if (v9) {
    return 0;
  }
  else {
    return 4294967204;
  }
}

void sub_230ABAB2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN3Ari17AriClientGcdProxy17forwardIndicationENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unsigned int v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      int v5 = v4;
      if (*(void *)(a1 + 40)) {
        (*(void (**)(void, void))(v3 + 72))(**(void **)(a1 + 56), *(void *)(*(void *)(a1 + 56) + 8) - **(void **)(a1 + 56));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_230ABABC8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        int v5 = (uint64_t *)v3[1];
        BOOL v6 = (std::__shared_weak_count *)v3[3];
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

uint64_t AriFramer::fmrMsgCb(AriFramer *this, unsigned __int8 *a2, const char *a3)
{
  uint64_t v3 = (size_t *)((char *)this + 32952);
  if (!*((void *)this + 4121))
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", a3);
    if (v55 >= 0) {
      int v11 = __p;
    }
    else {
      int v11 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) clientAriMsgCB is NULL", v10, v11, 65);
    uint64_t v12 = a2;
    if (v55 < 0) {
      operator delete(__p[0]);
    }
LABEL_79:
    if (v12) {
LABEL_80:
    }
      free(v12);
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = (unint64_t)a3;
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", a3);
  if (v55 >= 0) {
    long long v8 = __p;
  }
  else {
    long long v8 = (void **)__p[0];
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) entering with cachedSize(%zu) data(%p)", v7, v8, 84, *v3, a2);
  if (v55 < 0)
  {
    operator delete(__p[0]);
    if (!v4)
    {
LABEL_67:
      if (a2) {
        free(a2);
      }
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v9);
      if (v55 >= 0) {
        long long v45 = __p;
      }
      else {
        long long v45 = (void **)__p[0];
      }
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) exiting with cachedSize(%zu)", v44, v45, 179, *v3);
      if (v55 < 0) {
        operator delete(__p[0]);
      }
      return 0;
    }
  }
  else if (!v4)
  {
    goto LABEL_67;
  }
  uint64_t v13 = 0;
  char v14 = (unsigned __int8 *)this + 184;
  while (1)
  {
    MEMORY[0x230FC6810]((*v3 & 0xFFFFFFFFFFFF8000) != 0, "sizeof(scratchBuffer) < cachedSize", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", 89);
    unint64_t v16 = 0x7FFF - *v3;
    size_t v17 = v4 >= v16 ? 0x7FFF - *v3 : v4;
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v15);
    uint64_t v19 = v55 >= 0 ? __p : (void **)__p[0];
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) TOP newDataSizeRemains(%zu) newDataSizeConsumed(%zu) cachedSize(%zu) newDataToConsume(%zu)", v18, v19, 96, v4, v13, *v3, v17);
    if (v55 < 0)
    {
      operator delete(__p[0]);
      if (a2)
      {
LABEL_23:
        memcpy(&v14[*v3], &a2[v13], v17);
        goto LABEL_30;
      }
    }
    else if (a2)
    {
      goto LABEL_23;
    }
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v20);
    if (v55 >= 0) {
      uint64_t v22 = __p;
    }
    else {
      uint64_t v22 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Data is NULL, but IpcRead also fails for size (%zu)", v21, v22, 103, v17);
    if (v55 < 0) {
      operator delete(__p[0]);
    }
LABEL_30:
    unint64_t v23 = v4 - v17;
    size_t v24 = *v3;
    unint64_t v49 = v4 - v17;
    if (v4 <= v16) {
      unint64_t v23 = 0;
    }
    unint64_t v50 = v23;
    size_t v25 = v24 + v17;
    int v53 = -1;
    unint64_t v52 = -1;
    uint64_t v27 = 0;
    uint64_t v28 = v14;
    if (AriFramer_HeaderMagicScan(v14, v24 + v17, &v53, &v52)) {
      break;
    }
LABEL_42:
    if (v53 < 0)
    {
LABEL_55:
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
      if (v55 >= 0) {
        v41 = __p;
      }
      else {
        v41 = (void **)__p[0];
      }
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) No unfinished data, resetting cache", v40, v41, 159);
      unint64_t v37 = v50;
      if (v55 < 0) {
        operator delete(__p[0]);
      }
      *uint64_t v3 = 0;
    }
    else
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
      if (v55 >= 0) {
        char v33 = __p;
      }
      else {
        char v33 = (void **)__p[0];
      }
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Cache unfinished message @ index(%zu) and sz(%zu)", v32, v33, 153, v27 + v53, v25 - (v27 + v53));
      if (v55 < 0) {
        operator delete(__p[0]);
      }
      uint64_t v34 = v53;
      size_t v35 = v25 - v27 - v53;
      *uint64_t v3 = v35;
      memmove(v14, &v28[v34], v35);
      unint64_t v37 = v50;
    }
    v13 += v17;
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v36);
    if (v55 >= 0) {
      unint64_t v43 = __p;
    }
    else {
      unint64_t v43 = (void **)__p[0];
    }
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) BOTTOM newDataSizeRemains(%zu) newDataSizeConsumed(%zu) cachedSize(%zu)", v42, v43, 163, v37, v13, *v3);
    if (v55 < 0) {
      operator delete(__p[0]);
    }
    unint64_t v4 = v49;
    if (!v37) {
      goto LABEL_67;
    }
  }
  uint64_t v27 = 0;
  uint64_t v28 = v14;
  while (1)
  {
    if (v27 + v53 + v52 >= 0x7FFF)
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
      if (v55 >= 0) {
        std::string v39 = __p;
      }
      else {
        std::string v39 = (void **)__p[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Illegal message len(%zu), resetting cachedSize(%zu)", v38, v39, 129, v52, *v3);
      if (v55 < 0) {
        operator delete(__p[0]);
      }
      int v53 = -1;
      goto LABEL_55;
    }
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v26);
    if (v55 >= 0) {
      uint64_t v30 = __p;
    }
    else {
      uint64_t v30 = (void **)__p[0];
    }
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Got message @ index(%zu) and sz(%zu)", v29, v30, 135, v27 + v53, v52);
    if (v55 < 0) {
      operator delete(__p[0]);
    }
    if (((unsigned int (*)(unsigned __int8 *, unint64_t))v3[2])(&v28[v53], v52)) {
      break;
    }
    v27 += v53 + v52;
    int v53 = -1;
    uint64_t v28 = &v14[v27];
    if ((AriFramer_HeaderMagicScan(&v14[v27], v25 - v27, &v53, &v52) & 1) == 0) {
      goto LABEL_42;
    }
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "fmrMsgCb", v31);
  if (v55 >= 0) {
    long long v48 = __p;
  }
  else {
    long long v48 = (void **)__p[0];
  }
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Not able to process ARI message due to internal error", v47, v48, 140);
  uint64_t v12 = a2;
  if ((v55 & 0x80000000) == 0) {
    goto LABEL_79;
  }
  operator delete(__p[0]);
  if (a2) {
    goto LABEL_80;
  }
  return 0xFFFFFFFFLL;
}

void sub_230ABB214(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt14RegisterClientENSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEERKNS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPj_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  uint64_t v3 = (long long *)a1[7];
  uint64_t v4 = a1[5];
  int v5 = (std::__shared_weak_count *)operator new(0x70uLL);
  BOOL v6 = v5;
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554AD0;
  uint64_t v7 = (uint64_t)&v5[1];
  uint64_t v12 = v4;
  uint64_t v13 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v8 = (AriHostRt *)Ari::AriClientXpcProxy::AriClientXpcProxy((uint64_t)&v5[1], &v12, v3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v12 = v7;
  uint64_t v13 = v6;
  AriHostRt::GetInstance(v8);
  unsigned int v9 = (AriHostRt *)ResMgr<std::shared_ptr<Ari::AriClientProxy>>::alloc(&v12);
  int v10 = (int)v9;
  AriHostRt::GetInstance(v9);
  int v11 = (AriHostRt *)MEMORY[0x230FC6810](v10 == 0x7FFFFFFF, "allocated_id == GetInstance().clientMgr.INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 537);
  *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = v10;
  LODWORD(v6[1].__shared_owners_) = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  AriHostRt::GetInstance(v11);
  if (byte_26AB7A2EC) {
    (*(void (**)(uint64_t, uint64_t, void))(*(void *)v7 + 48))(v7, 1, 0);
  }

  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
}

void sub_230ABB3A8(_Unwind_Exception *a1)
{
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v4);
  _Unwind_Resume(a1);
}

void ___ZN3Ari12AriXpcServer4initEv_block_invoke(uint64_t a1, void *a2, const char *a3)
{
  v73[4] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    AriOsa::LogSrcInfo((uint64_t *)&v70, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", a3);
    int v4 = v72;
    int v5 = (void **)v70;
    asString((uint64_t *)__p, a2);
    uint64_t v7 = &v70;
    if (v4 < 0) {
      uint64_t v7 = v5;
    }
    if (v69 >= 0) {
      long long v8 = __p;
    }
    else {
      long long v8 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Skipping event due to termination imminent: %s", v6, v7, 273, v8);
LABEL_8:
    if (v69 < 0) {
      operator delete(__p[0]);
    }
    if (v72 < 0) {
      operator delete(v70);
    }
    return;
  }
  int v10 = *(uint64_t **)(a1 + 40);
  uint64_t v11 = MEMORY[0x230FC6F30](a2);
  if (v11 == MEMORY[0x263EF8720])
  {
    AriOsa::LogSrcInfo((uint64_t *)&v70, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v12);
    int v18 = v72;
    uint64_t v19 = (void **)v70;
    asString((uint64_t *)__p, a2);
    uint64_t v21 = &v70;
    if (v18 < 0) {
      uint64_t v21 = v19;
    }
    if (v69 >= 0) {
      uint64_t v22 = __p;
    }
    else {
      uint64_t v22 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Connection error: %s", v20, v21, 280, v22);
    if (v69 < 0) {
      operator delete(__p[0]);
    }
    if (v72 < 0) {
      operator delete(v70);
    }
    if (a2 == (void *)MEMORY[0x263EF86C0]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    return;
  }
  if (v11 != MEMORY[0x263EF86F0])
  {
    AriOsa::LogSrcInfo((uint64_t *)&v70, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v12);
    int v13 = v72;
    char v14 = (void **)v70;
    asString((uint64_t *)__p, a2);
    unint64_t v16 = &v70;
    if (v13 < 0) {
      unint64_t v16 = v14;
    }
    if (v69 >= 0) {
      size_t v17 = __p;
    }
    else {
      size_t v17 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unknown xpc event: %s", v15, v16, 288, v17);
    goto LABEL_8;
  }
  AriOsa::LogSrcInfo((uint64_t *)&v70, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init_block_invoke", v12);
  int v23 = v72;
  size_t v24 = (void **)v70;
  asString((uint64_t *)__p, a2);
  unint64_t v26 = &v70;
  if (v23 < 0) {
    unint64_t v26 = v24;
  }
  if (v69 >= 0) {
    uint64_t v27 = __p;
  }
  else {
    uint64_t v27 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) New xpc connection: %s", v25, v26, 292, v27);
  if (v69 < 0) {
    operator delete(__p[0]);
  }
  if (v72 < 0) {
    operator delete(v70);
  }
  uint64_t v28 = (std::__shared_weak_count *)v10[1];
  if (!v28 || (v29 = *v10, (uint64_t v30 = std::__shared_weak_count::lock(v28)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  int v31 = v30;
  p_shared_weak_owners = &v30->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v30->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  v73[0] = &unk_26E5544B0;
  v73[1] = v29;
  v73[2] = v31;
  v73[3] = v73;
  Ari::AriXpcServerConnection::create(a2, (uint64_t)v73, &v70);
  char v33 = v70;
  unint64_t v34 = 0x9DDFEA08EB382D69 * (((8 * v70) + 8) ^ ((unint64_t)v70 >> 32));
  unint64_t v35 = 0x9DDFEA08EB382D69 * (((unint64_t)v70 >> 32) ^ (v34 >> 47) ^ v34);
  unint64_t v36 = 0x9DDFEA08EB382D69 * (v35 ^ (v35 >> 47));
  unint64_t v37 = v10[5];
  if (!v37)
  {
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_59;
  }
  uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v37);
  v38.i16[0] = vaddlv_u8(v38);
  if (v38.u32[0] > 1uLL)
  {
    unint64_t v39 = 0x9DDFEA08EB382D69 * (v35 ^ (v35 >> 47));
    if (v36 >= v37) {
      unint64_t v39 = v36 % v37;
    }
  }
  else
  {
    unint64_t v39 = v36 & (v37 - 1);
  }
  std::string v40 = *(uint64_t ****)(v10[4] + 8 * v39);
  if (!v40 || (v41 = *v40) == 0)
  {
LABEL_59:
    unint64_t v43 = operator new(0x20uLL);
    long long v44 = v10 + 6;
    *unint64_t v43 = 0;
    v43[1] = v36;
    long long v45 = v71;
    void v43[2] = v33;
    v43[3] = v45;
    v70 = 0;
    char v71 = 0;
    float v46 = (float)(unint64_t)(v10[7] + 1);
    float v47 = *((float *)v10 + 16);
    if (v37 && (float)(v47 * (float)v37) >= v46)
    {
LABEL_105:
      uint64_t v64 = v10[4];
      v65 = *(void **)(v64 + 8 * v39);
      if (v65)
      {
        *unint64_t v43 = *v65;
      }
      else
      {
        *unint64_t v43 = *v44;
        *long long v44 = v43;
        *(void *)(v64 + 8 * v39) = v44;
        if (!*v43)
        {
LABEL_114:
          ++v10[7];
          goto LABEL_115;
        }
        unint64_t v66 = *(void *)(*v43 + 8);
        if ((v37 & (v37 - 1)) != 0)
        {
          if (v66 >= v37) {
            v66 %= v37;
          }
        }
        else
        {
          v66 &= v37 - 1;
        }
        v65 = (void *)(v10[4] + 8 * v66);
      }
      void *v65 = v43;
      goto LABEL_114;
    }
    BOOL v48 = 1;
    if (v37 >= 3) {
      BOOL v48 = (v37 & (v37 - 1)) != 0;
    }
    unint64_t v49 = v48 | (2 * v37);
    unint64_t v50 = vcvtps_u32_f32(v46 / v47);
    if (v49 <= v50) {
      int8x8_t prime = (int8x8_t)v50;
    }
    else {
      int8x8_t prime = (int8x8_t)v49;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v37 = v10[5];
    }
    if (*(void *)&prime > v37) {
      goto LABEL_71;
    }
    if (*(void *)&prime < v37)
    {
      unint64_t v58 = vcvtps_u32_f32((float)(unint64_t)v10[7] / *((float *)v10 + 16));
      if (v37 < 3 || (uint8x8_t v59 = (uint8x8_t)vcnt_s8((int8x8_t)v37), v59.i16[0] = vaddlv_u8(v59), v59.u32[0] > 1uLL))
      {
        unint64_t v58 = std::__next_prime(v58);
      }
      else
      {
        uint64_t v60 = 1 << -(char)__clz(v58 - 1);
        if (v58 >= 2) {
          unint64_t v58 = v60;
        }
      }
      if (*(void *)&prime <= v58) {
        int8x8_t prime = (int8x8_t)v58;
      }
      if (*(void *)&prime >= v37)
      {
        unint64_t v37 = v10[5];
      }
      else
      {
        if (prime)
        {
LABEL_71:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v52 = operator new(8 * *(void *)&prime);
          int v53 = (void *)v10[4];
          v10[4] = (uint64_t)v52;
          if (v53) {
            operator delete(v53);
          }
          uint64_t v54 = 0;
          v10[5] = (uint64_t)prime;
          do
            *(void *)(v10[4] + 8 * v54++) = 0;
          while (*(void *)&prime != v54);
          char v55 = (void *)*v44;
          if (*v44)
          {
            unint64_t v56 = v55[1];
            uint8x8_t v57 = (uint8x8_t)vcnt_s8(prime);
            v57.i16[0] = vaddlv_u8(v57);
            if (v57.u32[0] > 1uLL)
            {
              if (v56 >= *(void *)&prime) {
                v56 %= *(void *)&prime;
              }
            }
            else
            {
              v56 &= *(void *)&prime - 1;
            }
            *(void *)(v10[4] + 8 * v56) = v44;
            unint64_t v61 = (void *)*v55;
            if (*v55)
            {
              do
              {
                unint64_t v62 = v61[1];
                if (v57.u32[0] > 1uLL)
                {
                  if (v62 >= *(void *)&prime) {
                    v62 %= *(void *)&prime;
                  }
                }
                else
                {
                  v62 &= *(void *)&prime - 1;
                }
                if (v62 != v56)
                {
                  uint64_t v63 = v10[4];
                  if (!*(void *)(v63 + 8 * v62))
                  {
                    *(void *)(v63 + 8 * v62) = v55;
                    goto LABEL_96;
                  }
                  *char v55 = *v61;
                  *unint64_t v61 = **(void **)(v10[4] + 8 * v62);
                  **(void **)(v10[4] + 8 * v62) = v61;
                  unint64_t v61 = v55;
                }
                unint64_t v62 = v56;
LABEL_96:
                char v55 = v61;
                unint64_t v61 = (void *)*v61;
                unint64_t v56 = v62;
              }
              while (v61);
            }
          }
          unint64_t v37 = (unint64_t)prime;
          goto LABEL_100;
        }
        v67 = (void *)v10[4];
        v10[4] = 0;
        if (v67) {
          operator delete(v67);
        }
        unint64_t v37 = 0;
        v10[5] = 0;
      }
    }
LABEL_100:
    if ((v37 & (v37 - 1)) != 0)
    {
      if (v36 >= v37) {
        unint64_t v39 = v36 % v37;
      }
      else {
        unint64_t v39 = v36;
      }
    }
    else
    {
      unint64_t v39 = (v37 - 1) & v36;
    }
    goto LABEL_105;
  }
  while (1)
  {
    unint64_t v42 = (unint64_t)v41[1];
    if (v42 == v36) {
      break;
    }
    if (v38.u32[0] > 1uLL)
    {
      if (v42 >= v37) {
        v42 %= v37;
      }
    }
    else
    {
      v42 &= v37 - 1;
    }
    if (v42 != v39) {
      goto LABEL_59;
    }
LABEL_58:
    v41 = (uint64_t **)*v41;
    if (!v41) {
      goto LABEL_59;
    }
  }
  if (v41[2] != v70) {
    goto LABEL_58;
  }
  if (v71) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v71);
  }
LABEL_115:
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::~__value_func[abi:ne180100](v73);
  std::__shared_weak_count::__release_weak(v31);
}

void sub_230ABBB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>>>::operator()[abi:ne180100](1, v25);
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::~__value_func[abi:ne180100](&a24);
  std::__shared_weak_count::__release_weak(v24);
  _Unwind_Resume(a1);
}

void Ari::AriXpcServerConnection::create(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v9[4] = *MEMORY[0x263EF8340];
  BOOL v6 = (std::__shared_weak_count *)operator new(0xA0uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554570;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)v8, a2);
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100]((uint64_t)v9, (uint64_t)v8);
  Ari::AriXpcServerConnection::AriXpcServerConnection((uint64_t)&v6[1], a1, (uint64_t)v9);
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::~__value_func[abi:ne180100](v9);
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::~__value_func[abi:ne180100](v8);
  shared_owners = (std::__shared_weak_count *)v6[1].__shared_owners_;
  if (!shared_owners)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v6[1].__vftable = (std::__shared_weak_count_vtbl *)&v6[1];
    v6[1].__shared_owners_ = (uint64_t)v6;
    goto LABEL_5;
  }
  if (shared_owners->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v6[1].__vftable = (std::__shared_weak_count_vtbl *)&v6[1];
    v6[1].__shared_owners_ = (uint64_t)v6;
    std::__shared_weak_count::__release_weak(shared_owners);
LABEL_5:
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  Ari::AriXpcServerConnection::init((Ari::AriXpcServerConnection *)&v6[1]);
  *a3 = v6 + 1;
  a3[1] = v6;
}

void sub_230ABBCE0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void AriFramer::IpcDataCb(AriFramer *this, const char *a2, uint64_t a3, void *a4)
{
  MEMORY[0x230FC6810](a3 == 0, "cbCtx == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", 37);
  AriOsa::LogSrcInfo((uint64_t *)v21, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "IpcDataCb", v7);
  if (v22 >= 0) {
    unsigned int v9 = v21;
  }
  else {
    unsigned int v9 = (void **)v21[0];
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Owner(%p) data(%p) size(%zu)", v8, v9, 39, a3, this, a2);
  if (v22 < 0)
  {
    operator delete(v21[0]);
    if (!a2) {
      return;
    }
  }
  else if (!a2)
  {
    return;
  }
  int v10 = *(uint64_t (**)(AriFramer *, const char *, _OWORD *))(a3 + 32960);
  if (!v10)
  {
    if (!AriFramer::fmrMsgCb((AriFramer *)a3, (unsigned __int8 *)this, a2)) {
      return;
    }
    goto LABEL_16;
  }
  long long v11 = *(_OWORD *)(a3 + 48);
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v18[2] = *(_OWORD *)(a3 + 32);
  v18[3] = v11;
  v18[4] = *(_OWORD *)(a3 + 64);
  long long v12 = *(_OWORD *)(a3 + 16);
  v18[0] = *(_OWORD *)a3;
  v18[1] = v12;
  int v13 = *(NSObject **)(a3 + 88);
  uint64_t v19 = *(void *)(a3 + 80);
  dispatch_object_t object = v13;
  if (v13) {
    dispatch_retain(v13);
  }
  int v15 = v10(this, a2, v18);
  if (object) {
    dispatch_release(object);
  }
  if (v15)
  {
LABEL_16:
    AriOsa::LogSrcInfo((uint64_t *)v21, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", "IpcDataCb", v14);
    if (v22 >= 0) {
      size_t v17 = v21;
    }
    else {
      size_t v17 = (void **)v21[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Not able to handle ARI_RT_IPC_DATA", v16, v17, 53);
    if (v22 < 0) {
      operator delete(v21[0]);
    }
  }
}

void sub_230ABBEB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,dispatch_object_t object)
{
  if (*(char *)(v26 - 49) < 0) {
    operator delete(*(void **)(v26 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriClientGcdProxy::forwardResponse(uint64_t a1, AriMsg ***a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3 || (uint64_t v5 = *(void *)(a1 + 40), (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  MEMORY[0x230FC6810](*(void *)(a1 + 56) == 0, "conn == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 102);
  uint64_t BufCtx = AriMsg::GetBufCtx(**a2, (const unsigned __int8 *)((*a2)[1] - **a2));
  unsigned int v9 = v25;
  AriOsa::LogSrcInfo((uint64_t *)v25, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardResponse", v10);
  if (v26 < 0) {
    unsigned int v9 = (void **)v25[0];
  }
  long long v11 = (void *)(a1 + 16);
  if (*(char *)(a1 + 39) < 0) {
    long long v11 = (void *)*v11;
  }
  int v13 = **a2;
  long long v12 = (*a2)[1];
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a1 + 24))(__p, a1);
  if (v24 >= 0) {
    int v15 = __p;
  }
  else {
    int v15 = (void **)__p[0];
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Msg for client(%s) Type(GCD) size(%zu) %s ctx(0x%08X)", v14, v9, 106, v11, v12 - v13, v15, BufCtx);
  if (v24 < 0) {
    operator delete(__p[0]);
  }
  if (v26 < 0) {
    operator delete(v25[0]);
  }
  unint64_t v16 = *(NSObject **)(a1 + 56);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN3Ari17AriClientGcdProxy15forwardResponseENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  block[4] = a1;
  void block[5] = v5;
  int v20 = v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  size_t v17 = (std::__shared_weak_count *)a2[1];
  uint64_t v21 = *a2;
  char v22 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v16, block);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (v20) {
    std::__shared_weak_count::__release_weak(v20);
  }
  std::__shared_weak_count::__release_weak(v7);
  return 0;
}

void sub_230ABC104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v30 - 89) < 0) {
    operator delete(*(void **)(v30 - 112));
  }
  std::__shared_weak_count::__release_weak(v29);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriClientGcdProxy::getConnectDescription@<X0>(dispatch_queue_t *this@<X0>, std::string *a2@<X8>)
{
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v4;
  v24[8] = v4;
  v24[5] = v4;
  v24[6] = v4;
  v24[3] = v4;
  v24[4] = v4;
  v24[1] = v4;
  v24[2] = v4;
  long long v23 = v4;
  v24[0] = v4;
  *(_OWORD *)uint64_t v21 = v4;
  long long v22 = v4;
  v20[2] = v4;
  v20[3] = v4;
  v20[0] = v4;
  v20[1] = v4;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v20);
  uint64_t v5 = *(void *)&v20[0];
  *(_DWORD *)((char *)v20 + *(void *)(*(void *)&v20[0] - 24) + 8) |= 0x200u;
  *(_DWORD *)((char *)v20 + *(void *)(v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v20 + *(void *)(v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  memset(a2, 170, sizeof(std::string));
  label = (char *)dispatch_queue_get_label(this[7]);
  std::string::basic_string[abi:ne180100]<0>(&v16, label);
  uint64_t v7 = std::string::insert(&v16, 0, "dispq(", 6uLL);
  long long v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v8;
  v7->__r_.__value_.__l.__size_ = 0;
  v7->__r_.__value_.__r.__words[2] = 0;
  v7->__r_.__value_.__r.__words[0] = 0;
  std::string::push_back(&v17, 64);
  std::string v18 = v17;
  memset(&v17, 0, sizeof(v17));
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v20 + 8, __p);
  if ((v15 & 0x80u) == 0) {
    unsigned int v9 = __p;
  }
  else {
    unsigned int v9 = (void **)__p[0];
  }
  if ((v15 & 0x80u) == 0) {
    std::string::size_type v10 = v15;
  }
  else {
    std::string::size_type v10 = (std::string::size_type)__p[1];
  }
  long long v11 = std::string::append(&v18, (const std::string::value_type *)v9, v10);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  std::string::push_back(&v19, 41);
  *a2 = v19;
  memset(&v19, 0, sizeof(v19));
  if ((char)v15 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v18.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  *(void *)&v20[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v20 + *(void *)(*(void *)&v20[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v20[0] + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(v21[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x230FC6B60](v24);
}

void sub_230ABC43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,char a42)
{
  if (a40 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  std::ostringstream::~ostringstream((uint64_t)&a42);
  _Unwind_Resume(a1);
}

void ___ZN3Ari17AriClientGcdProxy15forwardResponseENSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    long long v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      if (*(void *)(a1 + 40)) {
        (*(void (**)(void, void))(v3 + 64))(**(void **)(a1 + 56), *(void *)(*(void *)(a1 + 56) + 8) - **(void **)(a1 + 56));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_230ABC54C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::sendRawInternal_nl(AriHostRt *this, AriMsg *a2, unsigned __int8 *a3)
{
  uint64_t v5 = &v53.__r_.__value_.__s.__data_[21];
  size_t v6 = a3;
  uint64_t BufCtx = AriMsg::GetBufCtx(a2, (const unsigned __int8 *)a3);
  unsigned int BufGmid = (AriHostRt *)AriMsg::GetBufGmid(a2, (const unsigned __int8 *)v6);
  memset(&v53, 0, sizeof(v53));
  if (((BufCtx >> 8) & 0x7F) == 0x7F)
  {
    *((unsigned char *)&v53.__r_.__value_.__s + 23) = 21;
    qmemcpy(&v53, "arirt_internal_client", 21);
  }
  else
  {
    AriHostRt::GetInstance(BufGmid);
    unsigned int BufGmid = (AriHostRt *)ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)&unk_26AB823F0);
    if (BufGmid)
    {
      AriHostRt::GetInstance(BufGmid);
      unsigned int v9 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[]((uint64_t)&unk_26AB823F0, (BufCtx >> 8) & 0x7F);
      std::string::size_type v10 = (const std::string *)(*(uint64_t (**)(void))(*(void *)*v9 + 16))(*v9);
      unsigned int BufGmid = (AriHostRt *)std::string::operator=(&v53, v10);
      goto LABEL_10;
    }
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    {
      v53.__r_.__value_.__l.__size_ = 21;
      long long v11 = (std::string *)v53.__r_.__value_.__r.__words[0];
      uint64_t v5 = (std::string::value_type *)(v53.__r_.__value_.__r.__words[0] + 21);
    }
    else
    {
      *((unsigned char *)&v53.__r_.__value_.__s + 23) = 21;
      long long v11 = &v53;
    }
    qmemcpy(v11, "client_not_registered", 21);
  }
  *uint64_t v5 = 0;
LABEL_10:
  Instance = (AriHostRt *)AriHostRt::GetInstance(BufGmid);
  unsigned int v14 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v14 == 2)
  {
    unsigned __int8 v15 = (AriHostRt *)AriHostRt::GetInstance(Instance);
    uint64_t v17 = qword_26AB825A0;
    if (!qword_26AB825A0) {
      goto LABEL_18;
    }
    std::string v18 = (AriHostRt *)AriOsa::LogSrcInfo((uint64_t *)v54, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendRawInternal_nl", v16);
    int v19 = v55;
    int v20 = (void **)v54[0];
    AriHostRt::GetInstance(v18);
    if (v19 >= 0) {
      uint64_t v21 = v54;
    }
    else {
      uint64_t v21 = v20;
    }
    label = dispatch_queue_get_label((dispatch_queue_t)qword_26AB825A8);
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Outbound Msg sz%d ctx(0x%08X) for sniffer (%s) ", v23, v21, 741, a3, BufCtx, label);
    if (v55 < 0) {
      operator delete(v54[0]);
    }
    char v24 = malloc_type_malloc(v6, 0xF0120842uLL);
    MEMORY[0x230FC6810](v24 == 0, "_msg == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 745);
    unint64_t v25 = (AriHostRt *)memcpy(v24, a2, v6);
    AriHostRt::GetInstance(v25);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt18sendRawInternal_nlEPhj_block_invoke;
    block[3] = &__block_descriptor_tmp_55;
    block[4] = v17;
    void block[5] = v24;
    int v50 = (int)a3;
    dispatch_async((dispatch_queue_t)qword_26AB825A8, block);
    unsigned __int8 v15 = (AriHostRt *)AriHostRt::GetInstance(v26);
    if (byte_26AB825B0)
    {
LABEL_18:
      AriHostRt::GetInstance(v15);
      int v27 = dword_26AB7A2F8;
      uint64_t v28 = (AriHostRt *)AriMsg::SetBufSeq(a2, (const unsigned __int8 *)v6);
      AriHostRt::GetInstance(v28);
      uint64_t v29 = (AriHostRt *)AriOsa::IpcWrite(qword_26AB7A320, (uint64_t)a2, v6);
      uint64_t v31 = (uint64_t)v29;
      if (v29)
      {
        unsigned int v32 = v54;
        AriOsa::LogSrcInfo((uint64_t *)v54, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_fmr.h", "write", v30);
        if (v55 >= 0) {
          unint64_t v34 = v54;
        }
        else {
          unint64_t v34 = (void **)v54[0];
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) IPC write failure on buffer(%p) sz(%zu)", v33, v34, 82, a2, v6);
        if (v55 < 0) {
          operator delete(v54[0]);
        }
        AriOsa::LogSrcInfo((uint64_t *)v54, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendRawInternal_nl", v35);
        if (v55 < 0) {
          unsigned int v32 = (void **)v54[0];
        }
        if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v36 = &v53;
        }
        else {
          unint64_t v36 = (std::string *)v53.__r_.__value_.__r.__words[0];
        }
        BufDigest = (AriHostRt *)GetBufDigest((const unsigned __int8 *)a2, v6, (const char *)v36);
        int v38 = v52;
        unint64_t v39 = (void **)__p[0];
        AriHostRt::GetInstance(BufDigest);
        v41 = __p;
        if (v38 < 0) {
          v41 = v39;
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed write to framer with (%s) AP.SEQ(%d) not advanced", v40, v32, 769, v41, dword_26AB7A2F8);
        if (v52 < 0) {
          operator delete(__p[0]);
        }
        if (v55 < 0) {
          operator delete(v54[0]);
        }
        goto LABEL_55;
      }
      AriHostRt::GetInstance(v29);
      dword_26AB7A2F8 = v27 + 1;
      if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v48, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
      }
      else {
        std::string v48 = v53;
      }
      Ari::LogTransportBuf();
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v48.__r_.__value_.__l.__data_);
      }
    }
    uint64_t v31 = 0;
    goto LABEL_55;
  }
  AriOsa::LogSrcInfo((uint64_t *)v54, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendRawInternal_nl", v13);
  if (v55 >= 0) {
    unint64_t v42 = v54;
  }
  else {
    unint64_t v42 = (void **)v54[0];
  }
  uint64_t v43 = asString();
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v44 = &v53;
  }
  else {
    long long v44 = (std::string *)v53.__r_.__value_.__r.__words[0];
  }
  GetBufDigest((const unsigned __int8 *)a2, v6, (const char *)v44);
  if (v52 >= 0) {
    float v46 = __p;
  }
  else {
    float v46 = (void **)__p[0];
  }
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for sendRawInternal(%s)", v45, v42, 733, v43, v46);
  if (v52 < 0) {
    operator delete(__p[0]);
  }
  if (v55 < 0) {
    operator delete(v54[0]);
  }
  uint64_t v31 = 4294967206;
LABEL_55:
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v53.__r_.__value_.__l.__data_);
  }
  return v31;
}

void sub_230ABCA64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v34 - 105) < 0) {
    operator delete(*(void **)(v34 - 128));
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_32c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::sw_dbug_trap(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)result;
    IDMgr::dump((IDMgr *)(result + 40));
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v3);
    if (v12 >= 0) {
      uint64_t v5 = __p;
    }
    else {
      uint64_t v5 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ResMgr(%p) dump total entries: %zu", v4, v5, 274, v2, v2[3]);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    for (i = (uint64_t *)v2[2]; i; i = (uint64_t *)*i)
    {
      uint64_t v8 = v2[17];
      if (v8)
      {
        std::function<void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::operator()(v8, *((_DWORD *)i + 4), *((_DWORD *)i + 6));
      }
      else
      {
        AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v6);
        if (v12 >= 0) {
          std::string::size_type v10 = __p;
        }
        else {
          std::string::size_type v10 = (void **)__p[0];
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) id(%08d-0x%08x) ts:%u", v9, v10, 284, *((unsigned int *)i + 4), *((unsigned int *)i + 4), *((unsigned int *)i + 6));
        if (v12 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    AriOsa::OsSleep((AriOsa *)0x7D0);
    return MEMORY[0x230FC6810](1, "true", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 287);
  }
  return result;
}

void sub_230ABCC80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *AriHostRt::GetInstance(AriHostRt *this)
{
  {
    AriHostRt::AriHostRt((AriHostRt *)&AriHostRt::GetInstance(void)::instance);
    __cxa_atexit((void (*)(void *))AriHostRt::~AriHostRt, &AriHostRt::GetInstance(void)::instance, &dword_230AB7000);
  }
  return &AriHostRt::GetInstance(void)::instance;
}

void sub_230ABCD24(_Unwind_Exception *a1)
{
}

uint64_t *ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[](uint64_t a1, int a2)
{
  int v10 = a2;
  MEMORY[0x230FC6810](*(unsigned char *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 166);
  BOOL v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x230FC6810](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 167);
  BOOL v5 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((void *)a1, a2) == 0;
  ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(a1, v5);
  size_t v6 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(a1, a2, &v10)+ 4;
  BOOL v8 = AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v7) == -1;
  MEMORY[0x230FC6810](v8, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 172);
  return v6;
}

void __destroy_helper_block_e8_40c50_ZTSNSt3__18weak_ptrIN9AriHostRt13RtTransactionEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void *__copy_helper_block_e8_40c48_ZTSNSt3__18weak_ptrIN3Ari17AriClientGcdProxyEEE56c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(void *result, void *a2)
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

uint64_t AriHostRt::SendRaw(AriHostRt *this, unsigned __int8 *a2, int a3)
{
  unsigned int v4 = a2;
  AriHostRt::GetInstance(this);
  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = -1;
  int BufCtx = AriMsg::GetBufCtx(this, (const unsigned __int8 *)v4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt7SendRawEPhjj_block_invoke;
  block[3] = &unk_264BA1BB0;
  void block[5] = &AriHostRt::GetInstance(void)::instance;
  void block[6] = this;
  int v10 = BufCtx;
  unsigned int v11 = v4;
  int v12 = a3;
  block[4] = &v13;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  uint64_t v7 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v7;
}

void sub_230ABCF48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

std::chrono::system_clock::time_point *AriHostRt::RtTransaction::RtTransaction(std::chrono::system_clock::time_point *a1, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *a2, std::chrono::duration<long long, std::ratio<1, 1000000>>::rep *a3, AriDispatch::Timer *this, uint64_t a5)
{
  a1->__d_.__rep_ = 0;
  a1[1].__d_.__rep_ = 0;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7 = a2[1];
  a1[2].__d_.__rep_ = *a2;
  a1[3].__d_.__rep_ = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v8 = a3[1];
  a1[4].__d_.__rep_ = *a3;
  a1[5].__d_.__rep_ = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  a1[6].__d_.__rep_ = 1000000 * a5;
  AriDispatch::Timer::Create(this, (dispatch_queue_s *)a2);
  a1[9].__d_.__rep_ = (std::chrono::duration<long long, std::ratio<1, 1000000>>::rep)this;
  a1[10].__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  a1[11].__d_.__rep_ = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  return a1;
}

void sub_230ABCFF0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = (std::__shared_weak_count *)v1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  unsigned int v4 = (std::__shared_weak_count *)v1[5];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  BOOL v5 = (std::__shared_weak_count *)v1[3];
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  size_t v6 = (std::__shared_weak_count *)v1[1];
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t Ari::AriClientXpcProxy::forwardIndication(uint64_t a1, AriMsg ***a2)
{
  uint64_t BufGmid = AriMsg::GetBufGmid(**a2, (const unsigned __int8 *)((*a2)[1] - **a2));
  BOOL v5 = __p;
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardIndication", v6);
  if (v17 < 0) {
    BOOL v5 = (void **)__p[0];
  }
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v8 = (void *)(a1 + 56);
  if (*(char *)(a1 + 79) < 0) {
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v8 = (void *)*v8;
  }
  int v10 = **a2;
  unsigned int v9 = (*a2)[1];
  uint64_t v11 = *(void *)(a1 + 40);
  if (*(char *)(v11 + 55) < 0) {
    std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)(v11 + 32), *(void *)(v11 + 40));
  }
  else {
    std::string v15 = *(std::string *)(v11 + 32);
  }
  int v12 = &v15;
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    int v12 = (std::string *)v15.__r_.__value_.__r.__words[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Indication(0x%08x) for client(%s) Type(XPC) size(%zu) conn(%s)", v7, v5, 193, BufGmid, v8, v9 - v10, v12);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "AriCmd", 0x2002uLL);
  xpc_dictionary_set_data(v13, "AriMsg", **a2, (*a2)[1] - **a2);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 40) + 16), v13);
  xpc_release(v13);
  return 0;
}

void sub_230ABD1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)result;
    IDMgr::dump((IDMgr *)(result + 40));
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v3);
    if (v13 >= 0) {
      BOOL v5 = __p;
    }
    else {
      BOOL v5 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ResMgr(%p) dump total entries: %zu", v4, v5, 274, v2, v2[3]);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    for (i = (uint64_t *)v2[2]; i; i = (uint64_t *)*i)
    {
      uint64_t v8 = v2[17];
      if (v8)
      {
        int v9 = *((_DWORD *)i + 6);
        LODWORD(__p[0]) = *((_DWORD *)i + 4);
        int v14 = v9;
        (*(void (**)(uint64_t, void **, int *, uint64_t *))(*(void *)v8 + 48))(v8, __p, &v14, i + 4);
      }
      else
      {
        AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "sw_dbug_trap", v6);
        if (v13 >= 0) {
          uint64_t v11 = __p;
        }
        else {
          uint64_t v11 = (void **)__p[0];
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) id(%08d-0x%08x) ts:%u", v10, v11, 284, *((unsigned int *)i + 4), *((unsigned int *)i + 4), *((unsigned int *)i + 6));
        if (v13 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    AriOsa::OsSleep((AriOsa *)0x7D0);
    return MEMORY[0x230FC6810](1, "true", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 287);
  }
  return result;
}

void sub_230ABD39C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriClientXpcProxy::forwardResponse(uint64_t a1, AriMsg ***a2)
{
  uint64_t BufCtx = AriMsg::GetBufCtx(**a2, (const unsigned __int8 *)((*a2)[1] - **a2));
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "forwardResponse", v5);
  if (v12 >= 0) {
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7 = __p;
  }
  else {
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7 = (void **)__p[0];
  }
  uint64_t v8 = (void *)(a1 + 56);
  if (*(char *)(a1 + 79) < 0) {
    uint64_t v8 = (void *)*v8;
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Msg for client(%s) Type(%s) cid(0x%x) size(%zu) ctx(0x%08x)", v6, v7, 178, v8, "XPC", *(unsigned int *)(a1 + 8), (*a2)[1] - **a2, BufCtx);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "AriCmd", 0x2001uLL);
  xpc_dictionary_set_data(v9, "AriMsg", **a2, (*a2)[1] - **a2);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 40) + 16), v9);
  xpc_release(v9);
  return 0;
}

void sub_230ABD4E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE7__cloneEPNS0_6__baseISA_EE(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26E5544B0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t AriHostRt::DeregisterClient(AriHostRt *this)
{
  int v1 = (int)this;
  AriHostRt::GetInstance(this);
  uint64_t v6 = 0;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = -1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt16DeregisterClientEj_block_invoke;
  block[3] = &unk_264BA1B40;
  int v5 = v1;
  block[4] = &v6;
  void block[5] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  uint64_t v2 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void *std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int a2, _DWORD *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = a2;
      if (v6 <= a2) {
        unint64_t v8 = a2 % v6;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & a2;
    }
    int v9 = *(void ***)(*(void *)a1 + 8 * v8);
    if (v9)
    {
      int v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2) {
              return v10;
            }
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v11 >= v6) {
                v11 %= v6;
              }
            }
            else
            {
              v11 &= v6 - 1;
            }
            if (v11 != v8) {
              break;
            }
          }
          int v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  }
  int v10 = operator new(0x28uLL);
  *int v10 = 0;
  v10[1] = v5;
  *((_DWORD *)v10 + 4) = *a3;
  v10[3] = 0;
  v10[4] = 0;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v6 || (float)(v13 * (float)v6) < v12)
  {
    BOOL v14 = 1;
    if (v6 >= 3) {
      BOOL v14 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v6);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__rehash<true>(a1, v17);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v8 = v5 % v6;
      }
      else {
        unint64_t v8 = v5;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & v5;
    }
  }
  uint64_t v18 = *(void *)a1;
  int v19 = *(void **)(*(void *)a1 + 8 * v8);
  if (v19)
  {
    *int v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  *int v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v8) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v20 >= v6) {
        v20 %= v6;
      }
    }
    else
    {
      v20 &= v6 - 1;
    }
    int v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_230ABD804(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::RegisterClient(AriHostRt *a1, uint64_t a2, _DWORD *a3)
{
  unint64_t v6 = (AriHostRt *)AriHostRt::Init(a1);
  if (v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 0;
  AriHostRt::GetInstance(v6);
  unint64_t v8 = qword_26AB7A300;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1174405120;
  v10[2] = ___ZN9AriHostRt14RegisterClientENSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEERKNS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEPj_block_invoke;
  v10[3] = &unk_26E5546B0;
  int v9 = (std::__shared_weak_count *)*((void *)a1 + 1);
  v10[5] = *(void *)a1;
  unint64_t v11 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v12 = a2;
  v10[4] = &v13;
  dispatch_sync(v8, v10);
  *a3 = *((_DWORD *)v14 + 6);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  _Block_object_dispose(&v13, 8);
  return 0;
}

void sub_230ABD920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>(void *a1, int a2)
{
  uint64_t v3 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(a1, a2);
  if (!v3) {
    return;
  }
  unsigned int v4 = v3;
  int8x8_t v5 = (int8x8_t)a1[1];
  uint64_t v6 = *v3;
  unint64_t v7 = v3[1];
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v5);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    if (v7 >= *(void *)&v5) {
      v7 %= *(void *)&v5;
    }
  }
  else
  {
    v7 &= *(void *)&v5 - 1;
  }
  int v9 = *(uint64_t **)(*a1 + 8 * v7);
  do
  {
    int v10 = v9;
    int v9 = (uint64_t *)*v9;
  }
  while (v9 != v3);
  if (v10 == a1 + 2) {
    goto LABEL_20;
  }
  unint64_t v11 = v10[1];
  if (v8.u32[0] > 1uLL)
  {
    if (v11 >= *(void *)&v5) {
      v11 %= *(void *)&v5;
    }
  }
  else
  {
    v11 &= *(void *)&v5 - 1;
  }
  if (v11 != v7)
  {
LABEL_20:
    if (v6)
    {
      unint64_t v12 = *(void *)(v6 + 8);
      if (v8.u32[0] > 1uLL)
      {
        unint64_t v13 = *(void *)(v6 + 8);
        if (v12 >= *(void *)&v5) {
          unint64_t v13 = v12 % *(void *)&v5;
        }
      }
      else
      {
        unint64_t v13 = v12 & (*(void *)&v5 - 1);
      }
      if (v13 == v7) {
        goto LABEL_24;
      }
    }
    *(void *)(*a1 + 8 * v7) = 0;
    uint64_t v6 = *v3;
  }
  if (v6)
  {
    unint64_t v12 = *(void *)(v6 + 8);
LABEL_24:
    if (v8.u32[0] > 1uLL)
    {
      if (v12 >= *(void *)&v5) {
        v12 %= *(void *)&v5;
      }
    }
    else
    {
      v12 &= *(void *)&v5 - 1;
    }
    if (v12 != v7)
    {
      *(void *)(*a1 + 8 * v12) = v10;
      uint64_t v6 = *v3;
    }
  }
  *int v10 = v6;
  *uint64_t v3 = 0;
  --a1[3];
  BOOL v14 = (std::__shared_weak_count *)v3[4];
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }

  operator delete(v4);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>(void *a1, int a2)
{
  unint64_t v2 = a1[1];
  if (!v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (v2 <= a2) {
      unint64_t v4 = a2 % v2;
    }
  }
  else
  {
    unint64_t v4 = (v2 - 1) & a2;
  }
  int8x8_t v5 = *(uint64_t ***)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  for (result = *v5; result; result = (uint64_t *)*result)
  {
    unint64_t v7 = result[1];
    if (v7 == a2)
    {
      if (*((_DWORD *)result + 4) == a2) {
        return result;
      }
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2) {
          v7 %= v2;
        }
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t __copy_helper_block_e8_40c50_ZTSNSt3__18weak_ptrIN9AriHostRt13RtTransactionEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t AriFramer::init(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  MEMORY[0x230FC6810](a3 == 0, "msg_cb == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/src/ari_fmr.cpp", 17);
  strlcpy((char *)(a1 + 96), a2, 0x40uLL);
  *(void *)(a1 + 160) = AriFramer::IpcDataCb;
  *(void *)(a1 + 168) = a5;
  *(void *)(a1 + 176) = a1;
  uint64_t result = AriOsa::IpcInit(a1, v10, v11);
  if (!result)
  {
    *(void *)(a1 + 32960) = a4;
    *(void *)(a1 + 32968) = a3;
  }
  return result;
}

uint64_t AriFramer::close(AriFramer *this)
{
  return 0;
}

void Ari::AriClientProxy::AriClientProxyDebugDump(uint64_t a1, uint64_t a2, const char *a3)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "AriClientProxyDebugDump", a3);
  if (v10 >= 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  uint8x8_t v8 = (void *)(*(void *)a3 + 16);
  if (*(char *)(*(void *)a3 + 39) < 0) {
    uint8x8_t v8 = (void *)*v8;
  }
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) #%03d Client(%s-%d) ts(%u)", v6, v7, 28, a1, v8, *(unsigned int *)(*(void *)a3 + 8), a2);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
}

void sub_230ABDCE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

Ari::AriClientGcdProxy *Ari::AriClientGcdProxy::AriClientGcdProxy(Ari::AriClientGcdProxy *this, char *a2, NSObject *a3)
{
  *(void *)this = &unk_26E554410;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 2, a2);
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *(void *)this = &unk_26E554240;
  *((void *)this + 7) = a3;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  dispatch_retain(a3);
  int8x8_t v5 = dlopen("/usr/lib/libARI.dylib", 1);
  *((void *)this + 12) = v5;
  MEMORY[0x230FC6810](v5 == 0, "hostlibHandle == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 54);
  uint64_t v6 = dlsym(*((void **)this + 12), "AriClientResponseCallback");
  *((void *)this + 8) = v6;
  MEMORY[0x230FC6810](v6 == 0, "clientResponseCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 57);
  unint64_t v7 = dlsym(*((void **)this + 12), "AriClientIndicationCallback");
  *((void *)this + 9) = v7;
  MEMORY[0x230FC6810](v7 == 0, "clientIndicationCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 60);
  uint8x8_t v8 = dlsym(*((void **)this + 12), "AriClientNotifyEventCallback");
  *((void *)this + 10) = v8;
  MEMORY[0x230FC6810](v8 == 0, "clientNotifyEventCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 63);
  int v9 = dlsym(*((void **)this + 12), "AriClientCancelTrxCallback");
  *((void *)this + 11) = v9;
  MEMORY[0x230FC6810](v9 == 0, "clientCancelTrxCallback == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 66);
  return this;
}

void sub_230ABDEA4(_Unwind_Exception *exception_object)
{
  int8x8_t v5 = *(std::__shared_weak_count **)(v1 + 48);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  *(void *)uint64_t v1 = v3;
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void Ari::AriClientGcdProxy::~AriClientGcdProxy(Ari::AriClientGcdProxy *this)
{
  *(void *)this = &unk_26E554240;
  dispatch_release(*((dispatch_object_t *)this + 7));
  *((void *)this + 11) = 0;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  dlclose(*((void **)this + 12));
  *((void *)this + 12) = 0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  *(void *)this = &unk_26E554410;
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
}

{
  uint64_t vars8;

  Ari::AriClientGcdProxy::~AriClientGcdProxy(this);

  JUMPOUT(0x230FC6BB0);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  int8x8_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_230ABE134(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x230FC6B60](v1);
  _Unwind_Resume(a1);
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
  MEMORY[0x230FC6B60](a1 + 112);
  return a1;
}

uint64_t Ari::AriClientGcdProxy::notifyEvent(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 80))(a2, *(unsigned int *)(a1 + 8));
}

uint64_t Ari::AriClientGcdProxy::cancelTransaction(uint64_t (**this)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return this[11](a2, a3, a4);
}

uint64_t Ari::AriClientXpcProxy::AriClientXpcProxy(uint64_t a1, void *a2, long long *a3)
{
  uint64_t v6 = *a2;
  if (*(char *)(*a2 + 55) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v6 + 32), *(void *)(v6 + 40));
  }
  else {
    std::string __p = *(std::string *)(v6 + 32);
  }
  *(void *)a1 = &unk_26E554410;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 16), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    *(std::string *)(a1 + 16) = __p;
  }
  *(void *)a1 = &unk_26E5542F0;
  *(void *)(a1 + 40) = *a2;
  uint64_t v7 = a2[1];
  *(void *)(a1 + 48) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  uint8x8_t v8 = (std::string *)(a1 + 56);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v9 = *a3;
    *(void *)(a1 + 72) = *((void *)a3 + 2);
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
  }
  return a1;
}

void sub_230ABE3B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v18 = *(std::__shared_weak_count **)(v14 + 48);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  *(void *)uint64_t v14 = v16;
  if (*(char *)(v14 + 39) < 0) {
    operator delete(*v15);
  }
  _Unwind_Resume(exception_object);
}

void Ari::AriXpcServerConnection::getConnectDescription(Ari::AriXpcServerConnection *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 55) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 4), *((void *)this + 5));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *((_OWORD *)this + 2);
    a2->__r_.__value_.__r.__words[2] = *((void *)this + 6);
  }
}

void Ari::AriClientXpcProxy::~AriClientXpcProxy(void **this)
{
  *this = &unk_26E5542F0;
  if (*((char *)this + 79) < 0) {
    operator delete(this[7]);
  }
  uint64_t v2 = (std::__shared_weak_count *)this[6];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  *this = &unk_26E554410;
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

{
  uint64_t vars8;

  Ari::AriClientXpcProxy::~AriClientXpcProxy(this);

  JUMPOUT(0x230FC6BB0);
}

void Ari::AriClientXpcProxy::getConnectDescription(Ari::AriClientXpcProxy *this@<X0>, std::string *a2@<X8>)
{
  std::operator+<char>();
  uint64_t v4 = std::string::append(&v13, "] ", 2uLL);
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v14.__r_.__value_.__r.__words[2] = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v14.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  uint8x8_t v8 = (const std::string::value_type *)*((void *)this + 2);
  uint64_t v7 = (char *)this + 16;
  uint64_t v6 = v8;
  int v9 = v7[23];
  if (v9 >= 0) {
    char v10 = v7;
  }
  else {
    char v10 = v6;
  }
  if (v9 >= 0) {
    std::string::size_type v11 = v7[23];
  }
  else {
    std::string::size_type v11 = *((void *)v7 + 1);
  }
  unint64_t v12 = std::string::append(&v14, v10, v11);
  *a2 = *v12;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
}

void sub_230ABE5B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void Ari::AriXpcServerConnection::send(xpc_connection_t *this, void *a2)
{
}

uint64_t Ari::AriClientXpcProxy::notifyEvent(uint64_t a1, unsigned int a2, const char *a3)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "notifyEvent", a3);
  int v6 = v15;
  uint64_t v7 = (void **)__p[0];
  uint64_t v8 = *(unsigned int *)(a1 + 8);
  uint64_t v9 = asString();
  if (v6 >= 0) {
    std::string::size_type v11 = __p;
  }
  else {
    std::string::size_type v11 = v7;
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Notifying ARI event for cid 0x%x event %s", v10, v11, 206, v8, v9);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "AriCmd", 0x2003uLL);
  xpc_dictionary_set_uint64(v12, "AriEvent", a2);
  xpc_dictionary_set_uint64(v12, "AriCid", *(unsigned int *)(a1 + 8));
  xpc_dictionary_set_uint64(v12, "AriToken", (uint64_t)a3);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 40) + 16), v12);
  xpc_release(v12);
  return 0;
}

void sub_230ABE714(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriClientXpcProxy::cancelTransaction(Ari::AriClientXpcProxy *this, uint64_t a2, const char *a3, int a4)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "cancelTransaction", a3);
  int v8 = v16;
  uint64_t v9 = (void **)__p[0];
  uint64_t v10 = asString();
  if (v8 >= 0) {
    xpc_object_t v12 = __p;
  }
  else {
    xpc_object_t v12 = v9;
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Canceling transaction 0x%04x gmid 0x%x reason(%s)", v11, v12, 221, a2, a3, v10);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "AriCmd", 0x2004uLL);
  xpc_dictionary_set_uint64(v13, "context_id", (int)a2);
  xpc_dictionary_set_uint64(v13, "AriGmid", a3);
  xpc_dictionary_set_int64(v13, "AriResult", a4);
  xpc_connection_send_message(*(xpc_connection_t *)(*((void *)this + 5) + 16), v13);
  xpc_release(v13);
  return 0;
}

void sub_230ABE85C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Ari::AriXpcServer::create(void *a1@<X8>)
{
  uint64_t v3 = (char *)operator new(0x60uLL);
  *((void *)v3 + 2) = 0;
  *((void *)v3 + 1) = 0;
  *(void *)uint64_t v3 = &unk_26E554460;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_OWORD *)(v3 + 72) = 0u;
  *((_DWORD *)v3 + 22) = 1065353216;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v3 + 1, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit((atomic_ullong *volatile)v3 + 2, 1uLL, memory_order_relaxed);
  *((void *)v3 + 3) = v3 + 24;
  *((void *)v3 + 4) = v3;
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v3);
  Ari::AriXpcServer::init((Ari::AriXpcServer *)(v3 + 24));
  *a1 = v3 + 24;
  a1[1] = v3;
}

void sub_230ABE914(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void Ari::AriXpcServer::init(Ari::AriXpcServer *this)
{
  uint64_t v2 = getprogname();
  if (!strncmp(v2, "CommCenter", 0x10uLL)
    || (uint64_t v4 = getprogname(), !strncmp(v4, "CommCenter-asan", 0x10uLL))
    || (long long v5 = getprogname(), !strncmp(v5, "basebandd", 0x10uLL)))
  {
    AriOsa::LogSrcInfo((uint64_t *)v14, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "init", v3);
    if (v15 >= 0) {
      uint64_t v7 = v14;
    }
    else {
      uint64_t v7 = (void **)v14[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) XPC Listener: setting up connection", v6, v7, 260);
    if (SHIBYTE(v15) < 0) {
      operator delete(v14[0]);
    }
    int v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v9 = dispatch_queue_create("AriHostRt", v8);
    *((void *)this + 2) = v9;
    MEMORY[0x230FC6810](v9 == 0, "listenQueue == nullptr", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 262);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.commcenter.ari.rt.xpc", *((dispatch_queue_t *)this + 2), 1uLL);
    *((void *)this + 3) = mach_service;
    MEMORY[0x230FC6810](mach_service == 0, "serverConn == nullptr", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", 264);
    v14[0] = 0;
    v14[1] = v14;
    uint64_t v15 = 0x2000000000;
    char v16 = 0;
    std::string::size_type v11 = (_xpc_connection_s *)*((void *)this + 3);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ___ZN3Ari12AriXpcServer4initEv_block_invoke;
    handler[3] = &unk_264BA19C0;
    handler[4] = v14;
    handler[5] = this;
    xpc_connection_set_event_handler(v11, handler);
    xpc_connection_resume(*((xpc_connection_t *)this + 3));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"ARI_SERVER_READY_NOTIFICATION", 0, 0, 1u);
    _Block_object_dispose(v14, 8);
  }
}

void sub_230ABEB04(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 25) < 0) {
    operator delete(*(void **)(v1 - 48));
  }
  _Unwind_Resume(exception_object);
}

double Ari::AriXpcServer::AriXpcServer(Ari::AriXpcServer *this)
{
  double result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 16) = 1065353216;
  return result;
}

{
  double result;

  double result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 16) = 1065353216;
  return result;
}

void Ari::AriXpcServer::~AriXpcServer(Ari::AriXpcServer *this)
{
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = (std::__shared_weak_count *)v2[3];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  long long v5 = (void *)*((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v5) {
    operator delete(v5);
  }
  int v6 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

void Ari::AriXpcServer::dumpState(Ari::AriXpcServer *this, uint64_t a2, const char *a3)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "dumpState", a3);
  if (v12 >= 0) {
    long long v5 = __p;
  }
  else {
    long long v5 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) XPC Server has %zu active connections:", v4, v5, 316, *((void *)this + 7));
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  for (i = (void *)*((void *)this + 6); i; i = (void *)*i)
  {
    dispatch_queue_t v9 = (Ari::AriXpcServerConnection *)i[2];
    uint64_t v10 = (std::__shared_weak_count *)i[3];
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    Ari::AriXpcServerConnection::dumpState(v9, v6, v7);
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
  }
}

void sub_230ABEC98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Ari::AriXpcServerConnection::dumpState(Ari::AriXpcServerConnection *this, uint64_t a2, const char *a3)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "dumpState", a3);
  if ((SBYTE7(v22) & 0x80u) == 0) {
    long long v5 = __p;
  }
  else {
    long long v5 = (void **)__p[0];
  }
  uint64_t v6 = (void *)((char *)this + 32);
  if (*((char *)this + 55) < 0) {
    uint64_t v6 = (void *)*v6;
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) %zu registered clients on connection %s", v4, v5, 620, *((void *)this + 11), v6);
  if (SBYTE7(v22) < 0) {
    operator delete(__p[0]);
  }
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[7] = v7;
  v28[8] = v7;
  v28[5] = v7;
  v28[6] = v7;
  v28[3] = v7;
  v28[4] = v7;
  v28[1] = v7;
  v28[2] = v7;
  long long v27 = v7;
  v28[0] = v7;
  *(_OWORD *)unint64_t v25 = v7;
  long long v26 = v7;
  long long v23 = v7;
  long long v24 = v7;
  *(_OWORD *)std::string __p = v7;
  long long v22 = v7;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)__p);
  dispatch_queue_t v9 = (void *)((char *)this + 80);
  while (1)
  {
    dispatch_queue_t v9 = (void *)*v9;
    if (!v9) {
      break;
    }
    uint64_t v10 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", ", 2);
  }
  AriOsa::LogSrcInfo((uint64_t *)v19, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "dumpState", v8);
  int v11 = v20;
  char v12 = (void **)v19[0];
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&__p[1], v17);
  std::string v14 = v19;
  if (v11 < 0) {
    std::string v14 = v12;
  }
  if (v18 >= 0) {
    uint64_t v15 = v17;
  }
  else {
    uint64_t v15 = (void **)v17[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Associated cids: %s", v13, v14, 626, v15);
  if (v18 < 0) {
    operator delete(v17[0]);
  }
  if (v20 < 0) {
    operator delete(v19[0]);
  }
  __p[0] = *(void **)MEMORY[0x263F8C2C8];
  *(void **)((char *)__p + *((void *)__p[0] - 3)) = *(void **)(MEMORY[0x263F8C2C8] + 24);
  __p[1] = (void *)(MEMORY[0x263F8C318] + 16);
  if (SHIBYTE(v26) < 0) {
    operator delete(v25[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x230FC6B60](v28);
}

void sub_230ABEF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  std::ostringstream::~ostringstream((uint64_t)&a25);
  _Unwind_Resume(a1);
}

uint64_t Ari::AriXpcServerConnection::AriXpcServerConnection(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = 0;
  asString(a2);
  *(_OWORD *)(a1 + 64) = 0u;
  *(unsigned char *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_DWORD *)(a1 + 96) = 1065353216;
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100](a1 + 104, a3);
  xpc_retain(*(xpc_object_t *)(a1 + 16));
  *(void *)(a1 + 24) = dispatch_queue_create("ConnectionQueue (multiple instances)", 0);
  return a1;
}

void sub_230ABF038(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::~__value_func[abi:ne180100](v4);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v3);
  if (*(char *)(v1 + 55) < 0) {
    operator delete(*v2);
  }
  uint64_t v6 = *(std::__shared_weak_count **)(v1 + 8);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  _Unwind_Resume(a1);
}

void Ari::AriXpcServerConnection::~AriXpcServerConnection(Ari::AriXpcServerConnection *this)
{
  uint64_t v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    xpc_release(v2);
    *((void *)this + 2) = 0;
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3)
  {
    dispatch_release(v3);
    *((void *)this + 3) = 0;
  }
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::~__value_func[abi:ne180100]((void *)this + 13);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)this + 64);
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

void Ari::AriXpcServerConnection::init(Ari::AriXpcServerConnection *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (!v2 || (v3 = *(void *)this, (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v5 = v4;
  p_shared_weak_owners = &v4->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  xpc_connection_set_target_queue(*((xpc_connection_t *)this + 2), *((dispatch_queue_t *)this + 3));
  long long v7 = (_xpc_connection_s *)*((void *)this + 2);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZN3Ari22AriXpcServerConnection4initEv_block_invoke;
  handler[3] = &__block_descriptor_tmp_56;
  handler[4] = this;
  handler[5] = v3;
  dispatch_queue_t v9 = v5;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  xpc_connection_set_event_handler(v7, handler);
  xpc_connection_resume(*((xpc_connection_t *)this + 2));
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  std::__shared_weak_count::__release_weak(v5);
}

void sub_230ABF1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  std::__shared_weak_count::__release_weak(v16);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t Ari::AriXpcServerConnection::handleRegistration(Ari::AriXpcServerConnection *this, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, "AriCheckin");
  if (!string)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v5);
    if (v61 >= 0) {
      char v12 = __p;
    }
    else {
      char v12 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Received invalid check-in name in client registration request", v11, v12, 464);
    goto LABEL_33;
  }
  uint64_t v6 = (char *)string;
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v5);
  if (v61 >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Received checkin from client %s", v7, v8, 421, v6);
  if (v61 < 0) {
    operator delete(__p[0]);
  }
  if (!*((unsigned char *)this + 56))
  {
    if (qword_26AB82600) {
      char v10 = std::function<BOOL ()(void *)>::operator()((uint64_t)&checkerFunction, (uint64_t)xdict);
    }
    else {
      char v10 = 1;
    }
    *((unsigned char *)this + 56) = v10;
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v9);
    if (v61 >= 0) {
      std::string v14 = __p;
    }
    else {
      std::string v14 = (void **)__p[0];
    }
    if (*((unsigned char *)this + 56)) {
      uint64_t v15 = "yes";
    }
    else {
      uint64_t v15 = "no";
    }
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Entitlement check; Client: %s Entitled: %s", v13, v14, 426, v6, v15);
    if (v61 < 0) {
      operator delete(__p[0]);
    }
    if (!*((unsigned char *)this + 56)) {
      return 0xFFFFFFFFLL;
    }
  }
  unsigned int v59 = 0;
  char v16 = (std::__shared_weak_count *)*((void *)this + 1);
  v58[0] = *(void *)this;
  if (!v16 || (size_t v17 = std::__shared_weak_count::lock(v16), (v58[1] = v17) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  char v18 = v17;
  std::string::basic_string[abi:ne180100]<0>(__p, v6);
  int v19 = AriHostRt::RegisterClient((AriHostRt *)v58, (uint64_t)__p, &v59);
  if (v61 < 0) {
    operator delete(__p[0]);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  if (v19)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v20);
    if (v61 >= 0) {
      long long v22 = __p;
    }
    else {
      long long v22 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Error registering ARI client %s", v21, v22, 458, v6);
LABEL_33:
    if (v61 < 0) {
      operator delete(__p[0]);
    }
    return 0xFFFFFFFFLL;
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleRegistration", v20);
  if (v61 >= 0) {
    unint64_t v25 = __p;
  }
  else {
    unint64_t v25 = (void **)__p[0];
  }
  uint64_t v26 = v59;
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Sending XPC ARI registration reply with cid 0x%04x", v24, v25, 435, v59);
  if (v61 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v27 = (int)v26;
  if (xpc_dictionary_get_BOOL(xdict, "ExpectsReply")) {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  }
  else {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  unint64_t v29 = reply;
  xpc_dictionary_set_uint64(reply, "AriCmd", 0xA010uLL);
  xpc_dictionary_set_uint64(v29, "AriCid", v26);
  xpc_connection_send_message(*((xpc_connection_t *)this + 2), v29);
  xpc_release(v29);
  unint64_t v30 = *((void *)this + 9);
  if (v30)
  {
    uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)v30);
    v31.i16[0] = vaddlv_u8(v31);
    if (v31.u32[0] > 1uLL)
    {
      uint64_t v26 = (int)v26;
      if (v30 <= (int)v26) {
        uint64_t v26 = (int)v26 % v30;
      }
    }
    else
    {
      uint64_t v26 = (v30 - 1) & (int)v26;
    }
    unsigned int v32 = *(uint64_t ***)(*((void *)this + 8) + 8 * v26);
    if (v32)
    {
      for (i = *v32; i; i = (uint64_t *)*i)
      {
        unint64_t v34 = i[1];
        if (v34 == v27)
        {
          if (*((_DWORD *)i + 4) == v27) {
            return 0;
          }
        }
        else
        {
          if (v31.u32[0] > 1uLL)
          {
            if (v34 >= v30) {
              v34 %= v30;
            }
          }
          else
          {
            v34 &= v30 - 1;
          }
          if (v34 != v26) {
            break;
          }
        }
      }
    }
  }
  else
  {
    uint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  }
  unint64_t v35 = operator new(0x18uLL);
  *unint64_t v35 = 0;
  v35[1] = v27;
  *((_DWORD *)v35 + 4) = v27;
  float v36 = (float)(unint64_t)(*((void *)this + 11) + 1);
  float v37 = *((float *)this + 24);
  if (!v30 || (float)(v37 * (float)v30) < v36)
  {
    BOOL v38 = 1;
    if (v30 >= 3) {
      BOOL v38 = (v30 & (v30 - 1)) != 0;
    }
    unint64_t v39 = v38 | (2 * v30);
    unint64_t v40 = vcvtps_u32_f32(v36 / v37);
    if (v39 <= v40) {
      int8x8_t prime = (int8x8_t)v40;
    }
    else {
      int8x8_t prime = (int8x8_t)v39;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v30 = *((void *)this + 9);
    }
    if (*(void *)&prime > v30) {
      goto LABEL_73;
    }
    if (*(void *)&prime < v30)
    {
      unint64_t v48 = vcvtps_u32_f32((float)*((unint64_t *)this + 11) / *((float *)this + 24));
      if (v30 < 3 || (uint8x8_t v49 = (uint8x8_t)vcnt_s8((int8x8_t)v30), v49.i16[0] = vaddlv_u8(v49), v49.u32[0] > 1uLL))
      {
        unint64_t v48 = std::__next_prime(v48);
      }
      else
      {
        uint64_t v50 = 1 << -(char)__clz(v48 - 1);
        if (v48 >= 2) {
          unint64_t v48 = v50;
        }
      }
      if (*(void *)&prime <= v48) {
        int8x8_t prime = (int8x8_t)v48;
      }
      if (*(void *)&prime >= v30)
      {
        unint64_t v30 = *((void *)this + 9);
      }
      else
      {
        if (prime)
        {
LABEL_73:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v42 = operator new(8 * *(void *)&prime);
          uint64_t v43 = (void *)*((void *)this + 8);
          *((void *)this + 8) = v42;
          if (v43) {
            operator delete(v43);
          }
          uint64_t v44 = 0;
          *((int8x8_t *)this + 9) = prime;
          do
            *(void *)(*((void *)this + 8) + 8 * v44++) = 0;
          while (*(void *)&prime != v44);
          long long v45 = (void *)*((void *)this + 10);
          if (v45)
          {
            unint64_t v46 = v45[1];
            uint8x8_t v47 = (uint8x8_t)vcnt_s8(prime);
            v47.i16[0] = vaddlv_u8(v47);
            if (v47.u32[0] > 1uLL)
            {
              if (v46 >= *(void *)&prime) {
                v46 %= *(void *)&prime;
              }
            }
            else
            {
              v46 &= *(void *)&prime - 1;
            }
            *(void *)(*((void *)this + 8) + 8 * v46) = (char *)this + 80;
            unint64_t v51 = (void *)*v45;
            if (*v45)
            {
              do
              {
                unint64_t v52 = v51[1];
                if (v47.u32[0] > 1uLL)
                {
                  if (v52 >= *(void *)&prime) {
                    v52 %= *(void *)&prime;
                  }
                }
                else
                {
                  v52 &= *(void *)&prime - 1;
                }
                if (v52 != v46)
                {
                  uint64_t v53 = *((void *)this + 8);
                  if (!*(void *)(v53 + 8 * v52))
                  {
                    *(void *)(v53 + 8 * v52) = v45;
                    goto LABEL_98;
                  }
                  void *v45 = *v51;
                  void *v51 = **(void **)(*((void *)this + 8) + 8 * v52);
                  **(void **)(*((void *)this + 8) + 8 * v52) = v51;
                  unint64_t v51 = v45;
                }
                unint64_t v52 = v46;
LABEL_98:
                long long v45 = v51;
                unint64_t v51 = (void *)*v51;
                unint64_t v46 = v52;
              }
              while (v51);
            }
          }
          unint64_t v30 = (unint64_t)prime;
          goto LABEL_102;
        }
        uint8x8_t v57 = (void *)*((void *)this + 8);
        *((void *)this + 8) = 0;
        if (v57) {
          operator delete(v57);
        }
        unint64_t v30 = 0;
        *((void *)this + 9) = 0;
      }
    }
LABEL_102:
    if ((v30 & (v30 - 1)) != 0)
    {
      if (v30 <= v27) {
        uint64_t v26 = v27 % v30;
      }
      else {
        uint64_t v26 = v27;
      }
    }
    else
    {
      uint64_t v26 = (v30 - 1) & v27;
    }
  }
  uint64_t v54 = *((void *)this + 8);
  char v55 = *(void **)(v54 + 8 * v26);
  if (v55)
  {
    *unint64_t v35 = *v55;
LABEL_115:
    *char v55 = v35;
    goto LABEL_116;
  }
  *unint64_t v35 = *((void *)this + 10);
  *((void *)this + 10) = v35;
  *(void *)(v54 + 8 * v26) = (char *)this + 80;
  if (*v35)
  {
    unint64_t v56 = *(void *)(*v35 + 8);
    if ((v30 & (v30 - 1)) != 0)
    {
      if (v56 >= v30) {
        v56 %= v30;
      }
    }
    else
    {
      v56 &= v30 - 1;
    }
    char v55 = (void *)(*((void *)this + 8) + 8 * v56);
    goto LABEL_115;
  }
LABEL_116:
  uint64_t result = 0;
  ++*((void *)this + 11);
  return result;
}

void sub_230ABF8DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  operator delete(v21);
  _Unwind_Resume(a1);
}

int8x8_t **Ari::AriXpcServerConnection::handleDeregistration(int8x8_t *this, xpc_object_t xdict)
{
  uint64 = (AriHostRt *)xpc_dictionary_get_uint64(xdict, "AriCid");
  long long v5 = uint64;
  if (!uint64)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleDeregistration", v4);
    if (v30 >= 0) {
      char v10 = __p;
    }
    else {
      char v10 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Attempt to de-register cid 0x%x", v9, v10, 488, 0);
LABEL_11:
    if (v30 < 0) {
      operator delete(__p[0]);
    }
    return (int8x8_t **)0xFFFFFFFFLL;
  }
  if (AriHostRt::DeregisterClient(uint64))
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleDeregistration", v6);
    if (v30 >= 0) {
      int v8 = __p;
    }
    else {
      int v8 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to deregister cid 0x%x", v7, v8, 483, v5);
    goto LABEL_11;
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleDeregistration", v6);
  if (v30 >= 0) {
    std::string v14 = __p;
  }
  else {
    std::string v14 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Deregistered cid 0x%x", v13, v14, 477, v5);
  if (v30 < 0) {
    operator delete(__p[0]);
  }
  int8x8_t v15 = this[9];
  if (!*(void *)&v15) {
    return 0;
  }
  unint64_t v16 = (int)v5;
  uint8x8_t v17 = (uint8x8_t)vcnt_s8(v15);
  v17.i16[0] = vaddlv_u8(v17);
  if (v17.u32[0] > 1uLL)
  {
    unint64_t v18 = (int)v5;
    if (*(void *)&v15 <= (unint64_t)(int)v5) {
      unint64_t v18 = (unint64_t)(int)v5 % *(void *)&v15;
    }
  }
  else
  {
    unint64_t v18 = (*(void *)&v15 - 1) & (int)v5;
  }
  int8x8_t v19 = this[8];
  int v11 = *(int8x8_t ***)(*(void *)&v19 + 8 * v18);
  if (v11)
  {
    char v20 = *v11;
    if (!*v11) {
      return 0;
    }
    uint64_t v21 = *(void *)&v15 - 1;
    do
    {
      unint64_t v22 = (unint64_t)v20[1];
      if (v22 == (int)v5)
      {
        if (v20[2].i32[0] == v5)
        {
          int8x8_t v23 = *v20;
          if (v17.u32[0] > 1uLL)
          {
            if ((unint64_t)(int)v5 >= *(void *)&v15) {
              unint64_t v16 = (unint64_t)(int)v5 % *(void *)&v15;
            }
          }
          else
          {
            unint64_t v16 = (int)v5 & (unint64_t)v21;
          }
          long long v24 = *(int8x8_t **)(*(void *)&v19 + 8 * v16);
          do
          {
            unint64_t v25 = v24;
            long long v24 = (int8x8_t *)*v24;
          }
          while (v24 != v20);
          if (v25 == &this[10]) {
            goto LABEL_55;
          }
          unint64_t v26 = (unint64_t)v25[1];
          if (v17.u32[0] > 1uLL)
          {
            if (v26 >= *(void *)&v15) {
              v26 %= *(void *)&v15;
            }
          }
          else
          {
            v26 &= v21;
          }
          if (v26 == v16)
          {
LABEL_57:
            if (v23)
            {
              unint64_t v27 = *(void *)(*(void *)&v23 + 8);
              goto LABEL_59;
            }
          }
          else
          {
LABEL_55:
            if (!*(void *)&v23) {
              goto LABEL_56;
            }
            unint64_t v27 = *(void *)(*(void *)&v23 + 8);
            if (v17.u32[0] > 1uLL)
            {
              unint64_t v28 = *(void *)(*(void *)&v23 + 8);
              if (v27 >= *(void *)&v15) {
                unint64_t v28 = v27 % *(void *)&v15;
              }
            }
            else
            {
              unint64_t v28 = v27 & v21;
            }
            if (v28 != v16)
            {
LABEL_56:
              *(void *)(*(void *)&v19 + 8 * v16) = 0;
              int8x8_t v23 = *v20;
              goto LABEL_57;
            }
LABEL_59:
            if (v17.u32[0] > 1uLL)
            {
              if (v27 >= *(void *)&v15) {
                v27 %= *(void *)&v15;
              }
            }
            else
            {
              v27 &= v21;
            }
            if (v27 != v16)
            {
              *(void *)(*(void *)&this[8] + 8 * v27) = v25;
              int8x8_t v23 = *v20;
            }
          }
          *unint64_t v25 = v23;
          int8x8_t *v20 = 0;
          --*(void *)&this[11];
          operator delete(v20);
          return 0;
        }
      }
      else
      {
        if (v17.u32[0] > 1uLL)
        {
          if (v22 >= *(void *)&v15) {
            v22 %= *(void *)&v15;
          }
        }
        else
        {
          v22 &= v21;
        }
        if (v22 != v18) {
          return 0;
        }
      }
      int v11 = 0;
      char v20 = (int8x8_t *)*v20;
    }
    while (v20);
  }
  return v11;
}

void sub_230ABFC50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(Ari::AriXpcServerConnection **)(a1 + 32);
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      long long v5 = v4;
      if (*(void *)(a1 + 40))
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCmd");
        uint64_t v8 = uint64;
        if (uint64 == 4112)
        {
          Ari::AriXpcServerConnection::handleRegistration(v3, *(xpc_object_t *)(a1 + 56));
        }
        else if (*((unsigned char *)v3 + 56))
        {
          switch((int)uint64)
          {
            case 4113:
              Ari::AriXpcServerConnection::handleDeregistration((int8x8_t *)v3, *(xpc_object_t *)(a1 + 56));
              break;
            case 4114:
              char v20 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriGmid");
              uint64_t v21 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              AriHostRt::RegIndication(v20, v21);
              break;
            case 4115:
              unint64_t v22 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriGmid");
              int v23 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              AriHostRt::DeregIndication(v22, v23);
              break;
            case 4116:
              int v24 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriEvent");
              unint64_t v25 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              uint64_t v26 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriToken");
              AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke_2", v27);
              int v28 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
              std::string::size_type v29 = __p.__r_.__value_.__r.__words[0];
              uint64_t v30 = asString();
              p_p = &__p;
              if (v28 < 0) {
                p_p = (std::string *)v29;
              }
              Ari::Log((Ari *)4, (uint64_t)"(%s:%d) Received notify ACK from cid 0x%x for event %s token %llu", v31, p_p, 578, v25, v30, v26);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              AriHostRt::ProcessClientNotifyAck(v25, v24, v26);
              break;
            case 4117:
              char v33 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              memset(&__p, 170, sizeof(__p));
              string = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 56), "ErrorReason");
              std::string::basic_string[abi:ne180100]<0>(&__p, string);
              uint64_t v35 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "ErrorType");
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(&v46, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else {
                std::string v46 = __p;
              }
              AriHostRt::ProcessClientError(v33, v35, (uint64_t)&v46);
              if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v46.__r_.__value_.__l.__data_);
              }
              goto LABEL_13;
            case 4118:
              float v36 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              AriHostRt::RegAllIndications(v36);
              break;
            case 4119:
              float v37 = (AriHostRt *)xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCid");
              xpc_object_t array = xpc_dictionary_get_array(*(xpc_object_t *)(a1 + 56), "AriGmidList");
              __p.__r_.__value_.__r.__words[0] = 0;
              __p.__r_.__value_.__l.__size_ = (std::string::size_type)&__p;
              __p.__r_.__value_.__r.__words[2] = 0x4002000000;
              uint8x8_t v49 = __Block_byref_object_copy_;
              uint64_t v50 = __Block_byref_object_dispose_;
              v51[0] = v51;
              v51[1] = v51;
              v51[2] = 0;
              applier[0] = MEMORY[0x263EF8330];
              applier[1] = 0x40000000;
              applier[2] = ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke_73;
              applier[3] = &unk_264BA19E8;
              applier[4] = &__p;
              xpc_array_apply(array, applier);
              AriHostRt::PushAllIndications(v37, __p.__r_.__value_.__l.__size_ + 40);
              _Block_object_dispose(&__p, 8);
              std::__list_imp<unsigned int>::clear(v51);
              break;
            default:
              if (uint64 != 4097)
              {
                AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke_2", v7);
                int v39 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
                std::string::size_type v40 = __p.__r_.__value_.__r.__words[0];
                uint64_t v41 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriCmd");
                uint64_t v43 = &__p;
                if (v39 < 0) {
                  uint64_t v43 = (std::string *)v40;
                }
                Ari::Log((Ari *)8, (uint64_t)"(%s:%d) received unknown xpc command 0x%llx", v42, v43, 592, v41);
                goto LABEL_13;
              }
              size_t length = 0xAAAAAAAAAAAAAAAALL;
              uint64_t v11 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "context_id");
              uint64_t v12 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 56), "AriMsgTO");
              data = (AriHostRt *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 56), "AriMsg", &length);
              int8x8_t v15 = data;
              if (!v11 || !length || !data)
              {
                AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke", v14);
                if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  long long v45 = &__p;
                }
                else {
                  long long v45 = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Received invalid message from XPC client id(%u) size(%lu), msg(%p)\n", v44, v45, 526, v11, length, v15);
                goto LABEL_13;
              }
              AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke", v14);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint8x8_t v17 = &__p;
              }
              else {
                uint8x8_t v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              Ari::Log((Ari *)4, (uint64_t)"(%s:%d) message received for ctx 0x%08x to(%d)", v16, v17, 530, v11, v12);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke", v18);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                int8x8_t v19 = &__p;
              }
              else {
                int8x8_t v19 = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              Ari::LogBuf((Ari *)"msg", (const char *)v19, (const char *)0x213, (uint64_t)v15, (const void *)length);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              AriHostRt::SendRaw(v15, (unsigned __int8 *)length, v12);
              break;
          }
        }
        else
        {
          AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "handleClientMessage_block_invoke_2", v7);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            char v10 = &__p;
          }
          else {
            char v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Entitlement check failed for client; ignoring xpc command 0x%x",
            v9,
            v10,
            598,
            v8);
LABEL_13:
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
        xpc_release(*(xpc_object_t *)(a1 + 56));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_230AC023C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy_(void *result, void *a2)
{
  result[5] = result + 5;
  result[6] = result + 5;
  result[7] = 0;
  uint64_t v2 = a2[7];
  if (v2)
  {
    uint64_t v4 = a2[5];
    uint64_t v3 = (uint64_t *)a2[6];
    uint64_t v5 = *v3;
    *(void *)(v5 + 8) = *(void *)(v4 + 8);
    **(void **)(v4 + 8) = v5;
    uint64_t v6 = result[5];
    *(void *)(v6 + 8) = v3;
    *uint64_t v3 = v6;
    result[5] = v4;
    *(void *)(v4 + 8) = result + 5;
    result[7] = v2;
    a2[7] = 0;
  }
  return result;
}

void *__Block_byref_object_dispose_(uint64_t a1)
{
  return std::__list_imp<unsigned int>::clear((void *)(a1 + 40));
}

uint64_t ___ZN3Ari22AriXpcServerConnection19handleClientMessageEPv_block_invoke_73(uint64_t a1, int a2, xpc_object_t xuint)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  int value = xpc_uint64_get_value(xuint);
  uint64_t v5 = operator new(0x18uLL);
  v5[4] = value;
  uint64_t v6 = v3[5];
  v3 += 5;
  *(void *)uint64_t v5 = v6;
  *((void *)v5 + 1) = v3;
  *(void *)(v6 + 8) = v5;
  *uint64_t v3 = v5;
  ++v3[2];
  return 1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264BA1948, MEMORY[0x263F8C060]);
}

void sub_230AC043C(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
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
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
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
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
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
    std::string::size_type v6 = operator new(v4 + 1);
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

void *std::__list_imp<unsigned int>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
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
    dispatch_queue_t v9 = operator new(v7 + 1);
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

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
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

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__shared_ptr_emplace<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate,std::allocator<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554460;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate,std::allocator<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554460;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x230FC6BB0);
}

void std::__shared_ptr_emplace<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate,std::allocator<Ari::AriXpcServer::create(void)::AriXpcServerNoPrivate>>::__on_zero_shared(uint64_t a1)
{
}

void *_ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEED1Ev(void *a1)
{
  *a1 = &unk_26E5544B0;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEED0Ev(void *a1)
{
  *a1 = &unk_26E5544B0;
  int v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }

  JUMPOUT(0x230FC6BB0);
}

void *_ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE7__cloneEv(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26E5544B0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE7destroyEv(uint64_t a1)
{
  int v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE18destroy_deallocateEv(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }

  operator delete(__p);
}

void _ZNSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEEclEOS9_(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a2 = 0;
  a2[1] = 0;
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    size_t v6 = std::__shared_weak_count::lock(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)(a1 + 8);
      if (v8)
      {
        dispatch_queue_t v9 = *(NSObject **)(v8 + 16);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 1174405120;
        v11[2] = ___ZZZN3Ari12AriXpcServer4initEvEUb_ENK3__0clENSt3__110shared_ptrINS_22AriXpcServerConnectionEEE_block_invoke;
        v11[3] = &__block_descriptor_tmp_110;
        char v10 = *(std::__shared_weak_count **)(a1 + 16);
        v11[4] = v8;
        uint64_t v12 = v10;
        if (v10) {
          atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v13 = v4;
        std::string v14 = v3;
        if (v3) {
          atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        dispatch_async(v9, v11);
        if (v14) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v14);
        }
        if (v12) {
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t _ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN3Ari12AriXpcServer4initEvEUb_E3__0)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN3Ari12AriXpcServer4initEvEUb_E3__0NS_9allocatorIS4_EEFvNS_10shared_ptrINS2_22AriXpcServerConnectionEEEEE11target_typeEv()
{
  return &_ZTIZZN3Ari12AriXpcServer4initEvEUb_E3__0;
}

void ___ZZZN3Ari12AriXpcServer4initEvEUb_ENK3__0clENSt3__110shared_ptrINS_22AriXpcServerConnectionEEE_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[5];
  if (!v2) {
    return;
  }
  uint64_t v3 = std::__shared_weak_count::lock(v2);
  if (!v3) {
    return;
  }
  uint64_t v5 = v3;
  size_t v6 = (void *)a1[4];
  if (!v6) {
    goto LABEL_64;
  }
  uint64_t v7 = __p;
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_server.cpp", "operator()_block_invoke", v4);
  if (v32 < 0) {
    uint64_t v7 = (void **)__p[0];
  }
  uint64_t v9 = a1[6];
  if (*(char *)(v9 + 55) < 0) {
    std::string::__init_copy_ctor_external(&v30, *(const std::string::value_type **)(v9 + 32), *(void *)(v9 + 40));
  }
  else {
    std::string v30 = *(std::string *)(v9 + 32);
  }
  if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v10 = &v30;
  }
  else {
    char v10 = (std::string *)v30.__r_.__value_.__r.__words[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Removing connection %s", v8, v7, 302, v10);
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }
  if (v32 < 0) {
    operator delete(__p[0]);
  }
  int8x8_t v11 = (int8x8_t)v6[5];
  if (!*(void *)&v11) {
    goto LABEL_64;
  }
  unint64_t v12 = a1[6];
  unint64_t v13 = 0x9DDFEA08EB382D69 * (((8 * v12) + 8) ^ HIDWORD(v12));
  unint64_t v14 = 0x9DDFEA08EB382D69 * (HIDWORD(v12) ^ (v13 >> 47) ^ v13);
  unint64_t v15 = 0x9DDFEA08EB382D69 * (v14 ^ (v14 >> 47));
  uint8x8_t v16 = (uint8x8_t)vcnt_s8(v11);
  v16.i16[0] = vaddlv_u8(v16);
  if (v16.u32[0] > 1uLL)
  {
    unint64_t v17 = v15;
    if (v15 >= *(void *)&v11) {
      unint64_t v17 = v15 % *(void *)&v11;
    }
  }
  else
  {
    unint64_t v17 = v15 & (*(void *)&v11 - 1);
  }
  uint64_t v18 = v6[4];
  int8x8_t v19 = *(void ***)(v18 + 8 * v17);
  if (!v19) {
    goto LABEL_64;
  }
  char v20 = *v19;
  if (!*v19) {
    goto LABEL_64;
  }
  uint64_t v21 = *(void *)&v11 - 1;
  while (1)
  {
    unint64_t v22 = v20[1];
    if (v22 == v15) {
      break;
    }
    if (v16.u32[0] > 1uLL)
    {
      if (v22 >= *(void *)&v11) {
        v22 %= *(void *)&v11;
      }
    }
    else
    {
      v22 &= v21;
    }
    if (v22 != v17) {
      goto LABEL_64;
    }
LABEL_32:
    char v20 = (void *)*v20;
    if (!v20) {
      goto LABEL_64;
    }
  }
  if (v20[2] != v12) {
    goto LABEL_32;
  }
  int v23 = (void *)*v20;
  if (v16.u32[0] > 1uLL)
  {
    if (v15 >= *(void *)&v11) {
      v15 %= *(void *)&v11;
    }
  }
  else
  {
    v15 &= v21;
  }
  int v24 = *(void **)(v18 + 8 * v15);
  do
  {
    unint64_t v25 = v24;
    int v24 = (void *)*v24;
  }
  while (v24 != v20);
  if (v25 == v6 + 6) {
    goto LABEL_51;
  }
  unint64_t v26 = v25[1];
  if (v16.u32[0] > 1uLL)
  {
    if (v26 >= *(void *)&v11) {
      v26 %= *(void *)&v11;
    }
  }
  else
  {
    v26 &= v21;
  }
  if (v26 == v15)
  {
LABEL_53:
    if (v23)
    {
      unint64_t v27 = v23[1];
      goto LABEL_55;
    }
  }
  else
  {
LABEL_51:
    if (!v23) {
      goto LABEL_52;
    }
    unint64_t v27 = v23[1];
    if (v16.u32[0] > 1uLL)
    {
      unint64_t v28 = v23[1];
      if (v27 >= *(void *)&v11) {
        unint64_t v28 = v27 % *(void *)&v11;
      }
    }
    else
    {
      unint64_t v28 = v27 & v21;
    }
    if (v28 != v15)
    {
LABEL_52:
      *(void *)(v18 + 8 * v15) = 0;
      int v23 = (void *)*v20;
      goto LABEL_53;
    }
LABEL_55:
    if (v16.u32[0] > 1uLL)
    {
      if (v27 >= *(void *)&v11) {
        v27 %= *(void *)&v11;
      }
    }
    else
    {
      v27 &= v21;
    }
    if (v27 != v15)
    {
      *(void *)(v6[4] + 8 * v27) = v25;
      int v23 = (void *)*v20;
    }
  }
  *unint64_t v25 = v23;
  void *v20 = 0;
  --v6[7];
  std::string::size_type v29 = (std::__shared_weak_count *)v20[3];
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  operator delete(v20);
LABEL_64:
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

void sub_230AC0EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c43_ZTSNSt3__18weak_ptrIN3Ari12AriXpcServerEEE48c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(void *result, void *a2)
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

void __destroy_helper_block_e8_32c43_ZTSNSt3__18weak_ptrIN3Ari12AriXpcServerEEE48c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t a1)
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::shared_ptr<Ari::AriXpcServerConnection>,void *>>>::operator()[abi:ne180100](char a1, void *__p)
{
  if (a1)
  {
    uint64_t v3 = (std::__shared_weak_count *)__p[3];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
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

void *std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t std::__function::__value_func<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
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

  JUMPOUT(0x230FC6BB0);
}

void std::__shared_ptr_emplace<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate,std::allocator<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554570;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate,std::allocator<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554570;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x230FC6BB0);
}

void std::__shared_ptr_emplace<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate,std::allocator<Ari::AriXpcServerConnection::create(_xpc_connection_s *,std::function<void ()(std::shared_ptr<Ari::AriXpcServerConnection>)>)::AriXpcServerConnectionNoPrivate>>::__on_zero_shared(uint64_t a1)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x230FC6A40](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      char v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x230FC6A50](v13);
  return a1;
}

void sub_230AC13E8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x230FC6A50](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x230AC13C8);
}

void sub_230AC143C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      memset(__p, 170, sizeof(__p));
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      unint64_t v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0) {
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

void sub_230AC15C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
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

uint64_t AriSdk::MsgBase::send()
{
  return 0xFFFFFFFFLL;
}

AriSdk::MsgBase *AriSdk::MsgBase::MsgBase(AriSdk::MsgBase *this)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26E554600;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 39);
  return this;
}

void sub_230AC1728(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 56);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 16);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(exception_object);
}

AriSdk::MsgBase *AriSdk::MsgBase::MsgBase(AriSdk::MsgBase *this, const unsigned __int8 *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = &unk_26E554600;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 53);
  return this;
}

void sub_230AC17B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 56);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 16);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(exception_object);
}

void AriSdk::MsgBase::~MsgBase(AriSdk::MsgBase *this)
{
  *(void *)this = &unk_26E554600;
  MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 67);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

uint64_t AriHost::Send()
{
  return 0xFFFFFFFFLL;
}

uint64_t AriOsa::IpcInit(uint64_t a1, uint64_t a2, const char *a3)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit", a3);
  if ((SBYTE7(v18) & 0x80u) == 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Using transport device %s", v4, v5, 35, a1 + 96);
  if (SBYTE7(v18) < 0) {
    operator delete(__p[0]);
  }
  if (!strcmp("ABMRT/PCIe/ARI", (const char *)(a1 + 96)))
  {
    unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v10;
    long long v21 = v10;
    long long v18 = v10;
    long long v19 = v10;
    *(_OWORD *)std::string __p = v10;
    TelephonyBasebandPCITransportInitParameters();
    uint64_t v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v12 = dispatch_queue_create("ariIpcReadQueue", v11);
    unint64_t v13 = *(NSObject **)(a1 + 88);
    *(void *)(a1 + 88) = v12;
    if (v13)
    {
      dispatch_release(v13);
      dispatch_queue_t v12 = *(dispatch_queue_t *)(a1 + 88);
    }
    __p[1] = v12;
    LODWORD(v19) = v19 | 5;
    LODWORD(__p[0]) = 8;
    unint64_t v14 = capabilities::radio::ARITransportTimeout((capabilities::radio *)v12);
    if ((v14 & 0x8000000000000000) != 0) {
      __assert_rtn("IpcInit", "ari_osa_ios_libtu_ipc.cpp", 46, "0 <= capabilities::radio::ARITransportTimeout().count()");
    }
    uint64_t v15 = capabilities::radio::ARITransportTimeout((capabilities::radio *)v14);
    if (v15 >= 0x100000000) {
      __assert_rtn("IpcInit", "ari_osa_ios_libtu_ipc.cpp", 47, "capabilities::radio::ARITransportTimeout().count() <= std::numeric_limits<UInt32>::max()");
    }
    DWORD2(v18) = capabilities::radio::ARITransportTimeout((capabilities::radio *)v15);
    *(void *)((char *)&v19 + 4) = 0x100000000004;
    *(void *)&long long v18 = &__block_literal_global;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 0x40000000;
    v16[2] = ___ZN6AriOsa7IpcInitEPNS_13IpcDescriptorE_block_invoke_2;
    v16[3] = &__block_descriptor_tmp_13;
    v16[4] = a1;
    *(void *)&long long v21 = 0;
    long long v20 = (unint64_t)v16;
    if (TelephonyBasebandPCITransportCreate()) {
      return 0;
    }
    else {
      return 4294967204;
    }
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit", v6);
    if ((SBYTE7(v18) & 0x80u) == 0) {
      size_t v8 = __p;
    }
    else {
      size_t v8 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) SocketTransport unavailable on this build", v7, v8, 123);
    if (SBYTE7(v18) < 0) {
      operator delete(__p[0]);
    }
    return 4294967204;
  }
}

void sub_230AC1AD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN6AriOsa7IpcInitEPNS_13IpcDescriptorE_block_invoke(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4)
{
  if (a2)
  {
    if (a2 == 1)
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke", a3);
      if (v14 >= 0) {
        size_t v8 = __p;
      }
      else {
        size_t v8 = (void **)__p[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) PCITransportStatusError reported from PCITransport library (%p, %p)", v7, v8, 56, a3, a4);
    }
    else
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke", a3);
      if (v14 >= 0) {
        dispatch_queue_t v12 = __p;
      }
      else {
        dispatch_queue_t v12 = (void **)__p[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unrecognized status reported by PCITransport library: status=0x%08x (%p, %p)", v11, v12, 62, a2, a3, a4);
    }
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_osa_ios_libtu_ipc.cpp", "IpcInit_block_invoke", a3);
    if (v14 >= 0) {
      long long v10 = __p;
    }
    else {
      long long v10 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) PCITransportStatusNotReady reported from PCITransport library (%p, %p)", v9, v10, 59, a3, a4);
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }
}

void sub_230AC1C18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriOsa::IpcRead()
{
  return 4294967204;
}

uint64_t AriOsa::IpcPoll()
{
  return 4294967204;
}

uint64_t AriOsa::IpcFreeBuf(AriOsa *this, unsigned __int8 *a2)
{
  return 0;
}

uint64_t AriOsa::IpcClose()
{
  return 0;
}

uint64_t AriHostRt::RtTransaction::cancel(AriHostRt::RtTransaction *this, uint64_t a2)
{
  AriDispatch::Timer::cancel(*((AriDispatch::Timer **)this + 7));
  uint64_t v4 = *((void *)this + 4);
  uint64_t BufCtx = AriMsg::GetBufCtx(**((AriMsg ***)this + 2), (const unsigned __int8 *)(*(void *)(*((void *)this + 2) + 8) - **((void **)this + 2)));
  uint64_t BufGmid = AriMsg::GetBufGmid(**((AriMsg ***)this + 2), (const unsigned __int8 *)(*(void *)(*((void *)this + 2) + 8) - **((void **)this + 2)));
  size_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v4 + 56);

  return v7(v4, BufCtx, BufGmid, a2);
}

uint64_t AriHostRt::RtTransaction::getFullContextId(AriMsg ***this)
{
  return AriMsg::GetBufCtx(*this[2], (const unsigned __int8 *)(this[2][1] - *this[2]));
}

uint64_t AriHostRt::RtTransaction::getGMID(AriMsg ***this)
{
  return AriMsg::GetBufGmid(*this[2], (const unsigned __int8 *)(this[2][1] - *this[2]));
}

uint64_t AriHostRt::RtTransaction::startTimeoutCountDown(int64_t *this)
{
  AriHostRt::GetInstance((AriHostRt *)this);
  uint64_t v2 = (std::__shared_weak_count *)this[1];
  if (!v2 || (uint64_t v3 = std::__shared_weak_count::lock(v2)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v4 = v3;
  p_shared_weak_owners = &v3->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  dispatch_time(0, this[6]);
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  AriDispatch::Timer::set();
  std::__shared_weak_count::__release_weak(v4);
  std::__shared_weak_count::__release_weak(v4);
  return 0;
}

void sub_230AC1E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_weak(a15);
  }
  std::__shared_weak_count::__release_weak(v15);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt13RtTransaction21startTimeoutCountDownEv_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = (AriHostRt::RtTransaction *)a1[5];
      if (v6)
      {
        uint64_t v7 = a1[7];
        int BufCtx = AriMsg::GetBufCtx(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(void *)(*(void *)(v3 + 16) + 8) - **(void **)(v3 + 16)));
        if (std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((void *)(v7 + 33320), BufCtx))
        {
          long long v10 = v27;
          AriOsa::LogSrcInfo((uint64_t *)v27, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "startTimeoutCountDown_block_invoke", v9);
          if (v28 < 0) {
            long long v10 = (void **)v27[0];
          }
          AriHostRt::RtTransaction::asString((uint64_t *)__p, (AriHostRt::RtTransaction *)v3);
          int v11 = v26;
          dispatch_queue_t v12 = (void **)__p[0];
          unint64_t v13 = *(void *)(v3 + 48);
          __uint64_t v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          uint8x8_t v16 = __p;
          if (v11 < 0) {
            uint8x8_t v16 = v12;
          }
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Transaction(%s) timeout after %llu msec (%llu msec actual)", v15, v10, 95, v16, v13 / 0xF4240, (v14 - *(void *)(v3 + 88)) / 0xF4240);
          if (v26 < 0) {
            operator delete(__p[0]);
          }
          if (v28 < 0) {
            operator delete(v27[0]);
          }
          AriHostRt::RtTransaction::cancel(v6, 4294967212);
          uint64_t v17 = a1[7];
          int v18 = AriMsg::GetBufCtx(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(void *)(*(void *)(v3 + 16) + 8) - **(void **)(v3 + 16)));
          std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__erase_unique<int>((void *)(v17 + 33320), v18);
          long long v19 = (uint64_t *)(a1[7] + 33512);
          if (*v19)
          {
            AriHostRt::RtTransaction::asString((uint64_t *)v27, (AriHostRt::RtTransaction *)v3);
            if (v28 >= 0) {
              long long v20 = (char *)v27;
            }
            else {
              long long v20 = (char *)v27[0];
            }
            std::string::basic_string[abi:ne180100]<0>(v23, v20);
            int v21 = AriMsg::GetBufCtx(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(void *)(*(void *)(v3 + 16) + 8) - **(void **)(v3 + 16)));
            int BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)(v3 + 16), (const unsigned __int8 *)(*(void *)(*(void *)(v3 + 16) + 8) - **(void **)(v3 + 16)));
            std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*v19, 1, (uint64_t)v23, v21, BufGmid);
            if (v24 < 0) {
              operator delete(v23[0]);
            }
            if (v28 < 0) {
              operator delete(v27[0]);
            }
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_230AC207C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a31 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::RtTransaction::asString(AriHostRt::RtTransaction *this)
{
  uint64_t v1 = *((void *)this + 2);
  uint64_t v2 = *(const unsigned __int8 **)v1;
  uint64_t v3 = *(void *)(v1 + 8) - *(void *)v1;
  uint64_t v4 = (*(uint64_t (**)(void))(**((void **)this + 4) + 16))(*((void *)this + 4));
  if (*(char *)(v4 + 23) >= 0) {
    uint64_t v5 = (const char *)v4;
  }
  else {
    uint64_t v5 = *(const char **)v4;
  }

  return GetBufDigest(v2, v3, v5);
}

uint64_t std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  int v8 = a2;
  int v6 = a5;
  int v7 = a4;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, uint64_t, int *, int *))(*(void *)a1 + 48))(a1, &v8, a3, &v7, &v6);
}

uint64_t AriHostRt::RtTransaction::getClientProxy@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 40);
  *a2 = *(void *)(this + 32);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t AriHostRt::RtTransaction::updateSeq(AriMsg ***this)
{
  return AriMsg::SetBufSeq(*this[2], (const unsigned __int8 *)(this[2][1] - *this[2]));
}

unint64_t AriHostRt::RtTransaction::getTimeoutMs(AriHostRt::RtTransaction *this)
{
  return *((void *)this + 6) / 0xF4240uLL;
}

BOOL AriHostRt::RtTransaction::isLaterThan(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 80) >= a2;
}

uint64_t AriHostRt::ClientTransitionTracker::ClientTransitionTracker(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](a1 + 40, a2);
  *(void *)(a1 + 72) = 850045863;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(void *)(a1 + 128) = 0;
  return a1;
}

void sub_230AC2284(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *AriHostRt::ClientTransitionTracker::create@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(a2, a1);
}

void AriHostRt::ClientTransitionTracker::~ClientTransitionTracker(AriHostRt::ClientTransitionTracker *this)
{
  std::mutex::~mutex((std::mutex *)((char *)this + 72));
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 5);

  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table((uint64_t)this);
}

{
  uint64_t vars8;

  std::mutex::~mutex((std::mutex *)((char *)this + 72));
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)this + 5);

  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table((uint64_t)this);
}

uint64_t AriHostRt::ClientTransitionTracker::trackClient(uint64_t *a1, void *a2, const char *a3)
{
  unint64_t add = atomic_fetch_add(&AriHostRt::ClientTransitionTracker::tokenGenerator, 1uLL);
  AriOsa::LogSrcInfo((uint64_t *)v47, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "trackClient", a3);
  int v7 = v48;
  int v8 = (void **)v47[0];
  uint64_t v9 = *(unsigned int *)(*a2 + 8);
  (*(void (**)(void **__return_ptr))(*(void *)*a2 + 24))(__p);
  if (v7 >= 0) {
    int v11 = v47;
  }
  else {
    int v11 = v8;
  }
  if (v46 >= 0) {
    dispatch_queue_t v12 = __p;
  }
  else {
    dispatch_queue_t v12 = (void **)__p[0];
  }
  Ari::Log((Ari *)4, (uint64_t)"(%s:%d) tracking client 0x%x with token %llu for transition: %s", v10, v11, 164, v9, add, v12);
  if (v46 < 0) {
    operator delete(__p[0]);
  }
  if (v48 < 0) {
    operator delete(v47[0]);
  }
  std::mutex::lock((std::mutex *)(a1 + 9));
  unint64_t v13 = a1[1];
  if (v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v15 = add;
      if (v13 <= add) {
        unint64_t v15 = add % v13;
      }
    }
    else
    {
      unint64_t v15 = (v13 - 1) & add;
    }
    uint8x8_t v16 = *(void ***)(*a1 + 8 * v15);
    if (v16)
    {
      for (i = *v16; i; i = (void *)*i)
      {
        unint64_t v18 = i[1];
        if (v18 == add)
        {
          if (i[2] == add) {
            goto LABEL_84;
          }
        }
        else
        {
          if (v14.u32[0] > 1uLL)
          {
            if (v18 >= v13) {
              v18 %= v13;
            }
          }
          else
          {
            v18 &= v13 - 1;
          }
          if (v18 != v15) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  }
  i = operator new(0x28uLL);
  long long v19 = a1 + 2;
  void *i = 0;
  i[1] = add;
  i[3] = 0;
  i[4] = 0;
  i[2] = add;
  float v20 = (float)(unint64_t)(a1[3] + 1);
  float v21 = *((float *)a1 + 8);
  if (!v13 || (float)(v21 * (float)v13) < v20)
  {
    BOOL v22 = 1;
    if (v13 >= 3) {
      BOOL v22 = (v13 & (v13 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v13);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    else {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v13 = a1[1];
    }
    if (*(void *)&prime > v13) {
      goto LABEL_40;
    }
    if (*(void *)&prime < v13)
    {
      unint64_t v32 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v13 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        unint64_t v32 = std::__next_prime(v32);
      }
      else
      {
        uint64_t v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2) {
          unint64_t v32 = v34;
        }
      }
      if (*(void *)&prime <= v32) {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime >= v13)
      {
        unint64_t v13 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_40:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          char v26 = operator new(8 * *(void *)&prime);
          unint64_t v27 = (void *)*a1;
          *a1 = (uint64_t)v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          std::string::size_type v29 = (void *)*v19;
          if (*v19)
          {
            unint64_t v30 = v29[1];
            uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&prime) {
                v30 %= *(void *)&prime;
              }
            }
            else
            {
              v30 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v30) = v19;
            uint64_t v35 = (void *)*v29;
            if (*v29)
            {
              do
              {
                unint64_t v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(void *)&prime) {
                    v36 %= *(void *)&prime;
                  }
                }
                else
                {
                  v36 &= *(void *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(void *)(*a1 + 8 * v36))
                  {
                    *(void *)(*a1 + 8 * v36) = v29;
                    goto LABEL_65;
                  }
                  void *v29 = *v35;
                  *uint64_t v35 = **(void **)(*a1 + 8 * v36);
                  **(void **)(*a1 + 8 * v36) = v35;
                  uint64_t v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_65:
                std::string::size_type v29 = v35;
                uint64_t v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v13 = (unint64_t)prime;
          goto LABEL_69;
        }
        uint64_t v44 = (void *)*a1;
        *a1 = 0;
        if (v44) {
          operator delete(v44);
        }
        unint64_t v13 = 0;
        a1[1] = 0;
      }
    }
LABEL_69:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v13 <= add) {
        unint64_t v15 = add % v13;
      }
      else {
        unint64_t v15 = add;
      }
    }
    else
    {
      unint64_t v15 = (v13 - 1) & add;
    }
  }
  uint64_t v37 = *a1;
  BOOL v38 = *(void **)(*a1 + 8 * v15);
  if (v38)
  {
    void *i = *v38;
LABEL_82:
    void *v38 = i;
    goto LABEL_83;
  }
  void *i = *v19;
  void *v19 = i;
  *(void *)(v37 + 8 * v15) = v19;
  if (*i)
  {
    unint64_t v39 = *(void *)(*i + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v39 >= v13) {
        v39 %= v13;
      }
    }
    else
    {
      v39 &= v13 - 1;
    }
    BOOL v38 = (void *)(*a1 + 8 * v39);
    goto LABEL_82;
  }
LABEL_83:
  ++a1[3];
LABEL_84:
  uint64_t v41 = *a2;
  uint64_t v40 = a2[1];
  if (v40) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v40 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v42 = (std::__shared_weak_count *)i[4];
  i[3] = v41;
  i[4] = v40;
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  std::mutex::unlock((std::mutex *)(a1 + 9));
  return (*(uint64_t (**)(void, const char *, unint64_t))(*(void *)*a2 + 48))(*a2, a3, add);
}

void sub_230AC2844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>::operator()[abi:ne180100](1, v27);
  std::mutex::unlock(v26);
  _Unwind_Resume(a1);
}

void AriHostRt::ClientTransitionTracker::removeClient(int8x8_t *this, uint64_t a2, unint64_t a3)
{
  int v6 = (std::mutex *)&this[9];
  std::mutex::lock((std::mutex *)&this[9]);
  int8x8_t v8 = this[1];
  if (!*(void *)&v8) {
    goto LABEL_17;
  }
  uint8x8_t v9 = (uint8x8_t)vcnt_s8(v8);
  v9.i16[0] = vaddlv_u8(v9);
  if (v9.u32[0] > 1uLL)
  {
    unint64_t v10 = a3;
    if (*(void *)&v8 <= a3) {
      unint64_t v10 = a3 % *(void *)&v8;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v8 - 1) & a3;
  }
  int v11 = *(uint64_t ***)(*(void *)this + 8 * v10);
  if (!v11 || (dispatch_queue_t v12 = *v11) == 0)
  {
LABEL_17:
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v7);
    if (v25 >= 0) {
      unint64_t v15 = __p;
    }
    else {
      unint64_t v15 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) attempted ack of stale token %llu for cid 0x%x", v14, v15, 198, a3, a2);
    goto LABEL_21;
  }
  while (1)
  {
    unint64_t v13 = v12[1];
    if (v13 == a3) {
      break;
    }
    if (v9.u32[0] > 1uLL)
    {
      if (v13 >= *(void *)&v8) {
        v13 %= *(void *)&v8;
      }
    }
    else
    {
      v13 &= *(void *)&v8 - 1;
    }
    if (v13 != v10) {
      goto LABEL_17;
    }
LABEL_16:
    dispatch_queue_t v12 = (uint64_t *)*v12;
    if (!v12) {
      goto LABEL_17;
    }
  }
  if (v12[2] != a3) {
    goto LABEL_16;
  }
  if (*(_DWORD *)(v12[3] + 8) == a2)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v7);
    if (v25 >= 0) {
      uint64_t v17 = __p;
    }
    else {
      uint64_t v17 = (void **)__p[0];
    }
    Ari::Log((Ari *)4, (uint64_t)"(%s:%d) no longer tracking client 0x%x with token %llu", v16, v17, 182, a2, a3);
    if (v25 < 0) {
      operator delete(__p[0]);
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::erase(this, v12);
    if (!*(void *)&this[3])
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v18);
      if (v25 >= 0) {
        float v20 = __p;
      }
      else {
        float v20 = (void **)__p[0];
      }
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) All transitions are complete.  Executing post-transition action", v19, v20, 186);
      if (v25 < 0) {
        operator delete(__p[0]);
      }
      int8x8_t v21 = this[8];
      if (!*(void *)&v21) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(int8x8_t))(**(void **)&v21 + 48))(v21);
    }
    goto LABEL_23;
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeClient", v7);
  if (v25 >= 0) {
    unint64_t v23 = __p;
  }
  else {
    unint64_t v23 = (void **)__p[0];
  }
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) mismatched cid, expected 0x%x, received ack for cid 0x%x with token %llu", v22, v23, 193, *(unsigned int *)(v12[3] + 8), a2, a3);
LABEL_21:
  if (v25 < 0) {
    operator delete(__p[0]);
  }
LABEL_23:
  std::mutex::unlock(v6);
}

void sub_230AC2B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  std::mutex::unlock(v19);
  _Unwind_Resume(a1);
}

void AriHostRt::ClientTransitionTracker::removeAllTracking(AriHostRt::ClientTransitionTracker *this, uint64_t a2)
{
  uint64_t v4 = (std::mutex *)((char *)this + 72);
  std::mutex::lock((std::mutex *)((char *)this + 72));
  if (*((void *)this + 3))
  {
    int v6 = (uint64_t *)*((void *)this + 2);
    if (v6)
    {
      do
      {
        while (*(_DWORD *)(v6[3] + 8) != a2)
        {
          int v6 = (uint64_t *)*v6;
          if (!v6) {
            goto LABEL_12;
          }
        }
        AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeAllTracking", v5);
        if (v13 >= 0) {
          int8x8_t v8 = __p;
        }
        else {
          int8x8_t v8 = (void **)__p[0];
        }
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Removing active transition tracking for cid 0x%x token %llu", v7, v8, 213, a2, v6[2]);
        if (v13 < 0) {
          operator delete(__p[0]);
        }
        int v6 = (uint64_t *)std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::erase(this, v6);
      }
      while (v6);
LABEL_12:
      if (!*((void *)this + 3))
      {
        AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "removeAllTracking", v5);
        if (v13 >= 0) {
          unint64_t v10 = __p;
        }
        else {
          unint64_t v10 = (void **)__p[0];
        }
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) All transitions are complete.  Executing post-transition action", v9, v10, 223);
        if (v13 < 0) {
          operator delete(__p[0]);
        }
        uint64_t v11 = *((void *)this + 8);
        if (!v11) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        (*(void (**)(uint64_t))(*(void *)v11 + 48))(v11);
      }
    }
  }
  std::mutex::unlock(v4);
}

void sub_230AC2D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  std::mutex::unlock(v19);
  _Unwind_Resume(a1);
}

void AriHostRt::ClientTransitionTracker::logRemainingClients(AriHostRt::ClientTransitionTracker *this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if (*((void *)this + 3))
  {
    unint64_t v24 = (std::mutex *)((char *)this + 72);
    std::mutex::lock((std::mutex *)((char *)this + 72));
    for (i = (void *)*((void *)this + 2); i; i = (void *)*i)
    {
      AriOsa::LogSrcInfo((uint64_t *)v27, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "logRemainingClients", v4);
      int v6 = SHIBYTE(v27[2]);
      int v7 = (void **)v27[0];
      uint64_t v9 = i[2];
      int8x8_t v8 = (unsigned int *)i[3];
      uint64_t v10 = v8[2];
      (*(void (**)(void **__return_ptr))(*(void *)v8 + 24))(__p);
      if (v6 >= 0) {
        dispatch_queue_t v12 = v27;
      }
      else {
        dispatch_queue_t v12 = v7;
      }
      char v13 = __p;
      if (v26 < 0) {
        char v13 = (void **)__p[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Pending transition for cid 0x%x token %llu client %s", v11, v12, 238, v10, v9, v13, v24);
      if (v26 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v27[2]) < 0) {
        operator delete(v27[0]);
      }
      uint64_t v14 = (*(uint64_t (**)(void))(*(void *)i[3] + 16))(i[3]);
      unint64_t v15 = (char *)v14;
      if (*(char *)(v14 + 23) >= 0) {
        size_t v16 = *(unsigned __int8 *)(v14 + 23);
      }
      else {
        size_t v16 = *(void *)(v14 + 8);
      }
      memset(v27, 170, sizeof(v27));
      std::string::basic_string[abi:ne180100]((uint64_t)v27, v16 + 1);
      if (SHIBYTE(v27[2]) >= 0) {
        uint64_t v17 = v27;
      }
      else {
        uint64_t v17 = (void **)v27[0];
      }
      if (v16)
      {
        if (v15[23] >= 0) {
          unint64_t v18 = v15;
        }
        else {
          unint64_t v18 = *(char **)v15;
        }
        memmove(v17, v18, v16);
      }
      *(_WORD *)((char *)v17 + v16) = 44;
      if (SHIBYTE(v27[2]) >= 0) {
        long long v19 = v27;
      }
      else {
        long long v19 = (void **)v27[0];
      }
      if (SHIBYTE(v27[2]) >= 0) {
        std::string::size_type v20 = HIBYTE(v27[2]);
      }
      else {
        std::string::size_type v20 = (std::string::size_type)v27[1];
      }
      std::string::append(a2, (const std::string::value_type *)v19, v20);
      if (SHIBYTE(v27[2]) < 0) {
        operator delete(v27[0]);
      }
    }
    if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
      if (size)
      {
        std::string::size_type v22 = a2->__r_.__value_.__r.__words[0];
        std::string::size_type v21 = a2->__r_.__value_.__r.__words[0] + size;
        goto LABEL_37;
      }
    }
    else if (*((unsigned char *)&a2->__r_.__value_.__s + 23))
    {
      std::string::size_type v21 = (std::string::size_type)a2 + HIBYTE(a2->__r_.__value_.__r.__words[2]);
      std::string::size_type v22 = (std::string::size_type)a2;
LABEL_37:
      std::string::erase(a2, ~v22 + v21, 1uLL);
    }
    std::mutex::unlock(v24);
  }
}

void sub_230AC2F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::mutex *a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  std::mutex::unlock(a14);
  if (*(char *)(v26 + 23) < 0) {
    operator delete(*(void **)v26);
  }
  _Unwind_Resume(a1);
}

void AriHostRt::AriHostRt(AriHostRt *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  *(_DWORD *)this = -1;
  uint64_t v2 = (char *)this + 33064;
  *((_WORD *)this + 2) = 0;
  *((void *)this + 1) = 0x80000000001;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4127) = 0;
  *((void *)this + 4128) = 0;
  *((void *)this + 4126) = 0;
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
  *((void *)this + 29) = 0;
  v9[0] = &unk_26E5549D0;
  v9[1] = Ari::AriClientProxy::AriClientProxyDebugDump;
  uint64_t v10 = v9;
  *(_OWORD *)((char *)this + 33032) = 0u;
  *(_OWORD *)((char *)this + 33048) = 0u;
  *((_DWORD *)this + 8266) = 1065353216;
  MEMORY[0x230FC6890]((char *)this + 33072, 1, 127);
  *((void *)v2 + 8) = 0;
  v2[72] = 0;
  uint64_t v3 = (uint64_t)v10;
  if (!v10) {
    goto LABEL_4;
  }
  if (v10 != v9)
  {
    uint64_t v3 = (*(uint64_t (**)(void))(*v10 + 16))();
LABEL_4:
    *((void *)v2 + 13) = v3;
    goto LABEL_6;
  }
  *((void *)v2 + 13) = (char *)this + 33144;
  (*(void (**)(void *, char *))(v9[0] + 24))(v9, (char *)this + 33144);
LABEL_6:
  MEMORY[0x230FC6810](0, "max >= INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 138);
  if (!AriOsa::OsMutexCreate((AriOsa *)(v2 + 64), v4)) {
    v2[72] = 1;
  }
  std::__function::__value_func<void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v9);
  int8x8_t v8 = 0;
  *(_OWORD *)((char *)this + 33176) = 0u;
  *(_OWORD *)((char *)this + 33192) = 0u;
  *((_DWORD *)v2 + 36) = 1065353216;
  MEMORY[0x230FC6890]((char *)this + 33216, 1, 0xFFFFLL);
  *((void *)v2 + 26) = 0;
  v2[216] = 0;
  uint64_t v5 = (uint64_t)v8;
  if (!v8) {
    goto LABEL_11;
  }
  if (v8 != v7)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(*v8 + 16))();
LABEL_11:
    *((void *)v2 + 31) = v5;
    goto LABEL_13;
  }
  *((void *)v2 + 31) = (char *)this + 33288;
  (*(void (**)(void *, char *))(v7[0] + 24))(v7, (char *)this + 33288);
LABEL_13:
  MEMORY[0x230FC6810](0, "max >= INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 138);
  if (!AriOsa::OsMutexCreate((AriOsa *)(v2 + 208), v6)) {
    v2[216] = 1;
  }
  std::__function::__value_func<void ()(int,unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](v7);
  *(_OWORD *)((char *)this + 33320) = 0u;
  *(_OWORD *)((char *)this + 33336) = 0u;
  *((_DWORD *)v2 + 72) = 1065353216;
  *((_OWORD *)this + 20MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 85) = 0u;
  *((_OWORD *)this + 2086) = 0u;
  *((_DWORD *)v2 + 82) = 1065353216;
  *(_OWORD *)((char *)this + 33400) = 0u;
  *(_OWORD *)((char *)this + 33416) = 0u;
  *(_OWORD *)((char *)this + 33432) = 0u;
  *(_OWORD *)((char *)this + 33448) = 0u;
  *(_OWORD *)((char *)this + 33464) = 0u;
  *((unsigned char *)this + 33480) = 0;
  *((void *)this + 4190) = 0;
  *((void *)this + 4191) = 0;
  *((void *)this + 4189) = 0;
}

void sub_230AC333C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  IDMgr::~IDMgr(v17);
  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::~__hash_table(v16);
  std::__function::__value_func<void ()(int,unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](&a10);
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::~ResMgr(v15, v19);
  std::string::size_type v20 = *(NSObject **)(v14 + 144);
  if (v20) {
    dispatch_release(v20);
  }
  std::string::size_type v21 = *(std::__shared_weak_count **)(v14 + 48);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  _Unwind_Resume(a1);
}

void AriHostRt::~AriHostRt(AriHostRt *this)
{
  uint64_t v2 = (char *)this + 33176;
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100]((void *)this + 4186);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)v2 + 35);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)v2 + 33);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)v2 + 31);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  int v6 = (std::__shared_weak_count *)*((void *)v2 + 29);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::~__hash_table((uint64_t)this + 33360);
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::~__hash_table((uint64_t)this + 33320);
  if (*((void *)v2 + 3))
  {
    std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__deallocate_node(*((void **)v2 + 2));
    *((void *)v2 + 2) = 0;
    uint64_t v8 = *((void *)v2 + 1);
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
        *(void *)(*(void *)v2 + 8 * i) = 0;
    }
    *((void *)v2 + 3) = 0;
  }
  uint64_t v10 = (AriOsa *)*((void *)v2 + 12);
  if (v10) {
    AriOsa::OsMutexFree(v10, v7);
  }
  std::__function::__value_func<void ()(int,unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100]((void *)this + 4161);
  std::__tree<IDMgr::Range>::destroy(*((void **)v2 + 10));
  std::__tree<IDMgr::Range>::destroy(*((void **)v2 + 7));
  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::~__hash_table((uint64_t)v2);
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::~ResMgr((uint64_t)this + 33032, v11);
  dispatch_queue_t v12 = *((void *)this + 18);
  if (v12) {
    dispatch_release(v12);
  }
  char v13 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

uint64_t Ari::LogConfigRt()
{
  return MEMORY[0x270F8CD18]();
}

uint64_t AriHostRt::Init(AriHostRt *this)
{
  if (AriHostRt::Init(void)::pred != -1) {
    dispatch_once(&AriHostRt::Init(void)::pred, &__block_literal_global_0);
  }
  AriHostRt::GetInstance(this);
  unsigned int v1 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v1 == -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void ___ZN9AriHostRt4InitEv_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  unsigned int v1 = (AriHostRt *)dispatch_queue_create("AriHostRt", v0);
  AriHostRt::GetInstance(v1);
  qword_26AB7A300 = (uint64_t)v1;
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  uint64_t v3 = (AriHostRt *)dispatch_queue_create("AriHostRt", v2);
  Instance = (AriHostRt *)AriHostRt::GetInstance(v3);
  qword_26AB7A308 = (uint64_t)v3;
  AriHostRt::GetInstance(Instance);
  uint64_t v5 = (AriHostRt *)MEMORY[0x230FC6810](qword_26AB7A300 == 0, "GetInstance().hostRtQueue == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 302);
  AriHostRt::GetInstance(v5);
  MEMORY[0x230FC6810](qword_26AB7A308 == 0, "GetInstance().lpmQueue == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 303);
  Ari::AriXpcServer::create(__p);
  AriHostRt::GetInstance(v6);
  int v7 = (std::__shared_weak_count *)qword_26AB7A318;
  unk_26AB7A310 = *(_OWORD *)__p;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  AriHostRt::GetInstance((AriHostRt *)v7);
  atomic_store(1u, &AriHostRt::GetInstance(void)::instance);
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v8);
  if (v12 >= 0) {
    uint64_t v10 = __p;
  }
  else {
    uint64_t v10 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Host RT state init success", v9, v10, 313);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_230AC36B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::Init(AriHostRt *this, const char *a2, const char *a3)
{
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2000000000;
  int v21 = -1;
  if (a2)
  {
    int v3 = (int)a2;
    uint64_t v5 = (AriHostRt *)AriHostRt::Init(this);
    if (v5)
    {
      uint64_t v6 = 0xFFFFFFFFLL;
      goto LABEL_15;
    }
    AriHostRt::GetInstance(v5);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt4InitEPKcj_block_invoke;
    block[3] = &unk_264BA1A70;
    int v15 = v3;
    block[4] = &v18;
    void block[5] = this;
    dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
    AriHostRt::SendSensitiveLoggingInfo(v9);
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init", v10);
    if (v17 >= 0) {
      char v12 = __p;
    }
    else {
      char v12 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Init complete", v11, v12, 359);
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init", a3);
    if (v17 >= 0) {
      uint64_t v8 = __p;
    }
    else {
      uint64_t v8 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Host RT invalid msgTimeoutMultiplier param: must be > 0", v7, v8, 326);
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = *((unsigned int *)v19 + 6);
LABEL_15:
  _Block_object_dispose(&v18, 8);
  return v6;
}

void sub_230AC3858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose((const void *)(v23 - 48), 8);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt4InitEPKcj_block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 48);
  AriHostRt::GetInstance((AriHostRt *)a1);
  dword_26AB7A2F0 = v2;
  uint64_t v4 = (AriHostRt *)AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v3);
  int v5 = v21;
  uint64_t v6 = (void **)__p[0];
  AriHostRt::GetInstance(v4);
  if (v5 >= 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = v6;
  }
  uint64_t v9 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Host RT msgTimeoutMultiplier: (%d)", v7, v8, 335, dword_26AB7A2F0);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  Instance = (AriHostRt *)AriHostRt::GetInstance(v9);
  unsigned int v11 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v11 == 2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  }
  else
  {
    AriHostRt::GetInstance(Instance);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = AriFramer::init((uint64_t)qword_26AB7A320, *(const char **)(a1 + 40), (uint64_t)AriHostRt::InboundMsgCB, 0, 0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v12);
      if (v21 >= 0) {
        uint64_t v14 = __p;
      }
      else {
        uint64_t v14 = (void **)__p[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ** FAILED TO INIT ARI FRAMER / TRANSPORT **", v13, v14, 352);
      if (v21 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Init_block_invoke", v12);
      if (v21 >= 0) {
        uint64_t v16 = __p;
      }
      else {
        uint64_t v16 = (void **)__p[0];
      }
      char v17 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Host RT framer success", v15, v16, 346);
      if (v21 < 0) {
        operator delete(__p[0]);
      }
      uint64_t v18 = (AriHostRt *)AriHostRt::GetInstance(v17);
      atomic_store(2u, &AriHostRt::GetInstance(void)::instance);
      long long v19 = (AriHostRt *)AriHostRt::GetInstance(v18);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = AriHostRt::sendBootStateRequest_nl(v19);
    }
  }
}

void sub_230AC3A7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::sendBootStateRequest_nl(AriHostRt *this)
{
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v17[2] = v1;
  v17[3] = v1;
  v17[0] = v1;
  v17[1] = v1;
  MEMORY[0x230FC6900](v17, 75923456);
  unsigned int v16 = 0;
  uint64_t EncodedBuf = AriMsg::getEncodedBuf((AriMsg *)v17, &v16);
  uint64_t v4 = (AriMsg *)EncodedBuf;
  if (EncodedBuf)
  {
    *(_DWORD *)(EncodedBuf + 8) = *(_DWORD *)(EncodedBuf + 8) & 0x1FFFF | 0xFE020000;
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendBootStateRequest_nl", v3);
    if (v15 >= 0) {
      uint64_t v6 = __p;
    }
    else {
      uint64_t v6 = (void **)__p[0];
    }
    int v7 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) sending RT boot state request...", v5, v6, 457);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v10 = AriHostRt::sendRawInternal_nl(v7, v4, (unsigned __int8 *)v16);
    if (v10)
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "sendBootStateRequest_nl", v9);
      if (v15 >= 0) {
        char v12 = __p;
      }
      else {
        char v12 = (void **)__p[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Could not send boot state request", v11, v12, 460);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
    AriMsg::ReleaseEncodedMessage(v4, v8);
  }
  else
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  AriMsg::~AriMsg((AriMsg *)v17);
  return v10;
}

void sub_230AC3BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  AriMsg::~AriMsg((AriMsg *)&a18);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::SendSensitiveLoggingInfo(AriHostRt *this)
{
  long long v1 = (AriHostRt *)capabilities::radio::vendor(this);
  if (v1 != 3) {
    return 0;
  }
  Instance = (AriHostRt *)AriHostRt::GetInstance(v1);
  uint64_t v3 = 0xFFFFFFFFLL;
  if (!AriHostRt::Init(Instance))
  {
    uint64_t v6 = 0;
    int v7 = &v6;
    uint64_t v8 = 0x2000000000;
    int v9 = -1;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___ZN9AriHostRt24SendSensitiveLoggingInfoEv_block_invoke;
    v5[3] = &unk_264BA1CD0;
    v5[4] = &v6;
    v5[5] = &AriHostRt::GetInstance(void)::instance;
    dispatch_sync((dispatch_queue_t)qword_26AB7A300, v5);
    uint64_t v3 = *((unsigned int *)v7 + 6);
    _Block_object_dispose(&v6, 8);
  }
  return v3;
}

uint64_t AriHostRt::Init(AriHostRt *a1, const void *a2, NSObject *a3, const char *a4)
{
  AriHostRt::GetInstance(a1);
  if (a2) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = v8;
  MEMORY[0x230FC6810](v9, "startedCallback == nullptr || startedCallbackQueue == nullptr", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 367);
  if (qword_26AB825D8) {
    _Block_release((const void *)qword_26AB825D8);
  }
  if (qword_26AB825E0) {
    dispatch_release((dispatch_object_t)qword_26AB825E0);
  }
  uint64_t v10 = _Block_copy(a2);
  dispatch_retain(a3);
  *(void *)(&byte_26AB7A2ED + 33515) = v10;
  *(void *)(&byte_26AB7A2ED + 33523) = a3;
  byte_26AB7A2ED = 0;

  return AriHostRt::Init(a1, a4, v11);
}

uint64_t AriHostRt::Shutdown(AriHostRt *this)
{
  AriHostRt::GetInstance(this);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt8ShutdownEv_block_invoke;
  block[3] = &__block_descriptor_tmp_24;
  block[4] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "Shutdown", v1);
  if (v6 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Done", v2, v3, 402);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return 0;
}

void sub_230AC3EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double ___ZN9AriHostRt8ShutdownEv_block_invoke(uint64_t a1)
{
  TelephonyUtilTransportFree();
  atomic_store(4u, *(unsigned int **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  *(unsigned char *)(v2 + 4) = 0;
  *(_DWORD *)(v2 + 12) = 2048;
  uint64_t v3 = *(const void **)(v2 + 33520);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = *(NSObject **)(v2 + 33528);
  if (v4)
  {
    dispatch_release(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  double result = 0.0;
  *(_OWORD *)(v2 + 33520) = 0u;
  return result;
}

uint64_t AriHostRt::ProcessClientNotifyAck(AriHostRt *a1, int a2, uint64_t a3)
{
  AriHostRt::GetInstance(a1);
  switch(a2)
  {
    case 2:
    case 8:
      int v7 = qword_26AB7A300;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke;
      block[3] = &__block_descriptor_tmp_26;
      int v22 = (int)a1;
      block[4] = &AriHostRt::GetInstance(void)::instance;
      void block[5] = a3;
      BOOL v8 = block;
      goto LABEL_4;
    case 3:
    case 4:
    case 5:
      int v7 = qword_26AB7A300;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 0x40000000;
      v19[2] = ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_2;
      v19[3] = &__block_descriptor_tmp_27;
      int v20 = (int)a1;
      v19[4] = &AriHostRt::GetInstance(void)::instance;
      v19[5] = a3;
      BOOL v8 = v19;
LABEL_4:
      dispatch_async(v7, v8);
      break;
    case 7:
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 0x40000000;
      std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v17[2] = ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_3;
      v17[3] = &__block_descriptor_tmp_28;
      int v18 = (int)a1;
      _OWORD v17[4] = &AriHostRt::GetInstance(void)::instance;
      v17[5] = a3;
      dispatch_sync((dispatch_queue_t)qword_26AB7A300, v17);
      break;
    default:
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "ProcessClientNotifyAck", v6);
      int v10 = v16;
      unsigned int v11 = (void **)__p[0];
      uint64_t v12 = asString();
      if (v10 >= 0) {
        uint64_t v14 = __p;
      }
      else {
        uint64_t v14 = v11;
      }
      Ari::Log((Ari *)4, (uint64_t)"(%s:%d) received notify ack from cid 0x%x for event %s", v13, v14, 442, a1, v12);
      if (v16 < 0) {
        operator delete(__p[0]);
      }
      break;
  }
  return 0;
}

void sub_230AC4130(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (int8x8_t **)(v2 + 33416);
  uint64_t v4 = *(std::__shared_weak_count **)(v2 + 33424);
  if (v4)
  {
    int v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      char v6 = v5;
      if (*v3) {
        AriHostRt::ClientTransitionTracker::removeClient(*v3, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_230AC41E8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (int8x8_t **)(v2 + 33432);
  uint64_t v4 = *(std::__shared_weak_count **)(v2 + 33440);
  if (v4)
  {
    int v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      char v6 = v5;
      if (*v3) {
        AriHostRt::ClientTransitionTracker::removeClient(*v3, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_230AC427C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt22ProcessClientNotifyAckEi18ARI_XPC_NOTIFY_IDSy_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (int8x8_t **)(v2 + 33448);
  uint64_t v4 = *(std::__shared_weak_count **)(v2 + 33456);
  if (v4)
  {
    int v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      char v6 = v5;
      if (*v3) {
        AriHostRt::ClientTransitionTracker::removeClient(*v3, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void sub_230AC4310(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::setMsgAttrib_nl(unsigned int *a1, _DWORD *a2)
{
  MEMORY[0x230FC6810](a2 == 0, "param == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 468);
  unsigned int v4 = atomic_load(a1);
  if (v4 != 2) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31[2] = v5;
  v31[3] = v5;
  v31[0] = v5;
  v31[1] = v5;
  MEMORY[0x230FC6900](v31, 67665920);
  uint64_t v6 = AriMsg::pack((AriMsg *)v31, 1, a2);
  if (!v6)
  {
    unsigned int v30 = 0;
    uint64_t EncodedBuf = AriMsg::getEncodedBuf((AriMsg *)v31, &v30);
    uint64_t v9 = (AriMsg *)EncodedBuf;
    if (EncodedBuf)
    {
      *(_DWORD *)(EncodedBuf + 8) = *(_DWORD *)(EncodedBuf + 8) & 0x1FFFF | 0xFE020000;
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setMsgAttrib_nl", v8);
      if (v29 >= 0) {
        int v10 = __p;
      }
      else {
        int v10 = (void **)__p[0];
      }
      uint64_t v11 = asString();
      uint64_t v12 = asString();
      unsigned int v14 = a2[2];
      uint64_t v13 = a2[3];
      uint64_t v15 = asString();
      char v17 = (AriHostRt *)Ari::Log((Ari *)4, (uint64_t)"(%s:%d) sending RT AriMsgAttribReq %s %s on msg(%d-0x%03x) val(0x%x-%s)...", v16, v10, 488, v11, v12, v14 >> 26, (v14 >> 15) & 0x3FF, v13, v15);
      if (v29 < 0) {
        operator delete(__p[0]);
      }
      uint64_t v6 = AriHostRt::sendRawInternal_nl(v17, v9, (unsigned __int8 *)v30);
      if (v6)
      {
        AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setMsgAttrib_nl", v19);
        if (v29 >= 0) {
          int v20 = __p;
        }
        else {
          int v20 = (void **)__p[0];
        }
        uint64_t v21 = asString();
        uint64_t v22 = asString();
        unsigned int v24 = a2[2];
        uint64_t v23 = a2[3];
        uint64_t v25 = asString();
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Could not send AriMsgAttribReq %s %s on msg(%d-0x%03x) val(0x%x-%s)...", v26, v20, 494, v21, v22, v24 >> 26, (v24 >> 15) & 0x3FF, v23, v25);
        if (v29 < 0) {
          operator delete(__p[0]);
        }
      }
      AriMsg::ReleaseEncodedMessage(v9, v18);
    }
    else
    {
      uint64_t v6 = 0xFFFFFFFFLL;
    }
  }
  AriMsg::~AriMsg((AriMsg *)v31);
  return v6;
}

void sub_230AC454C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,char a24)
{
}

uint64_t AriHostRt::RegisterClient(AriHostRt *this, char *a2, unsigned int *a3, dispatch_queue_s *a4)
{
  if (a2) {
    BOOL v7 = a3 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = v7;
  uint64_t v9 = (AriHostRt *)MEMORY[0x230FC6810](v8, "(cid == NULL) || (dq == NULL)", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 502);
  int v10 = (AriHostRt *)AriHostRt::Init(v9);
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x2000000000;
  int v16 = 0;
  AriHostRt::GetInstance(v10);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt14RegisterClientEPKcPjP16dispatch_queue_s_block_invoke;
  block[3] = &unk_264BA1B18;
  void block[5] = this;
  void block[6] = a3;
  block[4] = &v13;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  *(_DWORD *)a2 = *((_DWORD *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return 0;
}

void sub_230AC468C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt14RegisterClientEPKcPjP16dispatch_queue_s_block_invoke(void *a1)
{
  uint64_t v2 = (char *)a1[5];
  uint64_t v3 = a1[6];
  unsigned int v4 = (char *)operator new(0x80uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)unsigned int v4 = &unk_26E554A80;
  long long v5 = v4 + 24;
  Ari::AriClientGcdProxy::AriClientGcdProxy((Ari::AriClientGcdProxy *)(v4 + 24), v2, v3);
  uint64_t v6 = (std::__shared_weak_count *)*((void *)v4 + 9);
  if (v6)
  {
    if (v6->__shared_owners_ != -1) {
      goto LABEL_6;
    }
    atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 1, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 2, 1uLL, memory_order_relaxed);
    *((void *)v4 + 8) = v5;
    *((void *)v4 + 9) = v4;
    std::__shared_weak_count::__release_weak(v6);
  }
  else
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 1, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 2, 1uLL, memory_order_relaxed);
    *((void *)v4 + 8) = v5;
    *((void *)v4 + 9) = v4;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
LABEL_6:
  v10[0] = (uint64_t)(v4 + 24);
  v10[1] = (uint64_t)v4;
  AriHostRt::GetInstance((AriHostRt *)v6);
  BOOL v7 = (AriHostRt *)ResMgr<std::shared_ptr<Ari::AriClientProxy>>::alloc(v10);
  int v8 = (int)v7;
  AriHostRt::GetInstance(v7);
  uint64_t v9 = (AriHostRt *)MEMORY[0x230FC6810](v8 == 0x7FFFFFFF, "allocated_id == GetInstance().clientMgr.INVALID_RES_ID", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 510);
  *(_DWORD *)(*(void *)(a1[4] + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = v8;
  *((_DWORD *)v4 + 8) = *(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  AriHostRt::GetInstance(v9);
  if (byte_26AB7A2EC) {
    (*(void (**)(char *, uint64_t, void))(*(void *)v5 + 48))(v5, 1, 0);
  }

  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
}

void sub_230AC4820(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::alloc(uint64_t *a1)
{
  MEMORY[0x230FC6810](byte_26AB82458 == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 204);
  BOOL v2 = AriOsa::OsMutexTake((AriOsa *)qword_26AB82450, (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x230FC6810](v2, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 205);
  int v21 = -1431655766;
  uint64_t v3 = IDMgr::allocate((IDMgr *)&unk_26AB82418, &v21);
  if (v3)
  {
    int v5 = AriOsa::OsTimeStamp((AriOsa *)v3);
    uint64_t v7 = *a1;
    uint64_t v6 = a1[1];
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    int v8 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t *)&unk_26AB823F0, v21, &v21);
    *((_DWORD *)v8 + 6) = v5;
    int v10 = (std::__shared_weak_count *)v8[5];
    void v8[4] = v7;
    v8[5] = v6;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    }
  }
  else
  {
    int v21 = 0x7FFFFFFF;
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "alloc", v4);
    if (v20 >= 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) ResMgr(%p) dump total entries: %zu", v11, v12, 210, &unk_26AB823F0, qword_26AB82408);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    for (uint64_t i = qword_26AB82400; i; uint64_t i = *(void *)i)
    {
      if (qword_26AB82478)
      {
        std::function<void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::operator()(qword_26AB82478, *(_DWORD *)(i + 16), *(_DWORD *)(i + 24));
      }
      else
      {
        AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", "alloc", v13);
        if (v20 >= 0) {
          int v16 = __p;
        }
        else {
          int v16 = (void **)__p[0];
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) id(%08d-0x%08x) ts:%d", v15, v16, 220, *(unsigned int *)(i + 16), *(unsigned int *)(i + 16), *(unsigned int *)(i + 24));
        if (v20 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }
  BOOL v17 = AriOsa::OsMutexGive((AriOsa *)qword_26AB82450, v9) == -1;
  MEMORY[0x230FC6810](v17, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 227);
  return v21;
}

void sub_230AC4A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_40c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c56_ZTSNSt3__110shared_ptrIN3Ari22AriXpcServerConnectionEEE(uint64_t a1)
{
  long long v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void *AriHostRt::RegisterEntitlementChecker(void *a1)
{
  void v7[3] = *MEMORY[0x263EF8340];
  long long v1 = (void *)a1[3];
  if (!v1)
  {
    uint64_t v6 = 0;
    uint64_t v3 = qword_26AB82600;
    if ((uint64_t *)qword_26AB82600 != &checkerFunction)
    {
      uint64_t v2 = 0;
LABEL_9:
      uint64_t v6 = (void *)v3;
      qword_26AB82600 = (uint64_t)v2;
      return std::__function::__value_func<BOOL ()(void *)>::~__value_func[abi:ne180100](v5);
    }
LABEL_10:
    (*(void (**)(void))(checkerFunction + 24))();
    (*(void (**)(uint64_t))(*(void *)qword_26AB82600 + 32))(qword_26AB82600);
    qword_26AB82600 = (uint64_t)v6;
    uint64_t v6 = v5;
    return std::__function::__value_func<BOOL ()(void *)>::~__value_func[abi:ne180100](v5);
  }
  if (v1 == a1)
  {
    uint64_t v6 = v5;
    (*(void (**)(void *, void *))(*a1 + 24))(a1, v5);
    uint64_t v2 = v6;
  }
  else
  {
    uint64_t v2 = (void *)(*(uint64_t (**)(void))(*v1 + 16))(a1[3]);
    uint64_t v6 = v2;
  }
  uint64_t v3 = qword_26AB82600;
  if (v2 != v5)
  {
    if ((uint64_t *)qword_26AB82600 != &checkerFunction) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if ((uint64_t *)qword_26AB82600 == &checkerFunction)
  {
    memset(v7, 170, 24);
    (*(void (**)(void *, void *))(v5[0] + 24))(v5, v7);
    (*(void (**)(void *))(*v6 + 32))(v6);
    uint64_t v6 = 0;
    (*(void (**)(uint64_t, void *))(*(void *)qword_26AB82600 + 24))(qword_26AB82600, v5);
    (*(void (**)(uint64_t))(*(void *)qword_26AB82600 + 32))(qword_26AB82600);
    qword_26AB82600 = 0;
    uint64_t v6 = v5;
    (*(void (**)(void *, uint64_t *))(v7[0] + 24))(v7, &checkerFunction);
    (*(void (**)(void *))(v7[0] + 32))(v7);
  }
  else
  {
    (*(void (**)(void *, uint64_t *))(v5[0] + 24))(v5, &checkerFunction);
    (*(void (**)(void *))(*v6 + 32))(v6);
    uint64_t v6 = (void *)qword_26AB82600;
  }
  qword_26AB82600 = (uint64_t)&checkerFunction;
  return std::__function::__value_func<BOOL ()(void *)>::~__value_func[abi:ne180100](v5);
}

void sub_230AC4E10(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t AriHostRt::HasEntitlement(AriHostRt *this, void *a2)
{
  if (qword_26AB82600) {
    return std::function<BOOL ()(void *)>::operator()((uint64_t)&checkerFunction, (uint64_t)this);
  }
  else {
    return 1;
  }
}

uint64_t std::function<BOOL ()(void *)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void AriHostRt::checkShouldDeregIndication_nl(unsigned int *a1, int **a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 != v3)
  {
    uint64_t v4 = (uint64_t)(a1 + 8294);
    int v5 = (IDMgr *)(a1 + 8304);
    uint64_t v6 = (uint64_t)(a1 + 8298);
    do
    {
      memset(v39, 170, sizeof(v39));
      uint64_t v7 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[](v4, *v2);
      std::list<std::shared_ptr<Ari::AriClientProxy>>::list(v39, v7);
      if (v39[2])
      {
        LODWORD(v36) = *v2;
        int v8 = v36;
        MEMORY[0x230FC6810](*(unsigned char *)(v4 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 192);
        BOOL v9 = AriOsa::OsMutexTake(*(AriOsa **)(v4 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
        MEMORY[0x230FC6810](v9, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 193);
        int isAlloc = IDMgr::isAlloc(v5);
        uint64_t v11 = (AriOsa *)ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(v4, isAlloc ^ 1u);
        LODWORD(v40) = AriOsa::OsTimeStamp(v11);
        std::list<std::shared_ptr<Ari::AriClientProxy>>::list(&v41, v39);
        uint64_t v12 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v4, v8, &v36);
        *((_DWORD *)v12 + 6) = v40;
        std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v12 + 4);
        uint64_t v13 = v43;
        if (v43)
        {
          uint64_t v15 = v41;
          unsigned int v14 = v42;
          uint64_t v16 = *v42;
          *(void *)(v16 + 8) = *(void *)(v41 + 8);
          **(void **)(v15 + 8) = v16;
          uint64_t v17 = v12[4];
          *(void *)(v17 + 8) = v14;
          *unsigned int v14 = v17;
          v12[4] = v15;
          *(void *)(v15 + 8) = v12 + 4;
          v12[6] += v13;
          uint64_t v43 = 0;
        }
        std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(&v41);
        BOOL v19 = AriOsa::OsMutexGive(*(AriOsa **)(v4 + 96), v18) == -1;
        MEMORY[0x230FC6810](v19, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 198);
      }
      else
      {
        uint64_t v36 = 0x200000001;
        int v37 = (*v2 & 0x3FF | (HIBYTE(*(_WORD *)v2) >> 2 << 11)) << 15;
        int v38 = 0;
        AriHostRt::setMsgAttrib_nl(a1, &v36);
        int v20 = *v2;
        MEMORY[0x230FC6810](*(unsigned char *)(v4 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 235);
        BOOL v21 = AriOsa::OsMutexTake(*(AriOsa **)(v4 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
        MEMORY[0x230FC6810](v21, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 236);
        int v22 = IDMgr::free(v5);
        ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap(v4, v22 ^ 1);
        uint64_t v23 = std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::find<int>((void *)v4, v20);
        int8x8_t v24 = *(int8x8_t *)(v4 + 8);
        unint64_t v25 = v23[1];
        uint8x8_t v26 = (uint8x8_t)vcnt_s8(v24);
        v26.i16[0] = vaddlv_u8(v26);
        if (v26.u32[0] > 1uLL)
        {
          if (v25 >= *(void *)&v24) {
            v25 %= *(void *)&v24;
          }
        }
        else
        {
          v25 &= *(void *)&v24 - 1;
        }
        unint64_t v27 = *(uint64_t **)(*(void *)v4 + 8 * v25);
        do
        {
          uint64_t v28 = v27;
          unint64_t v27 = (uint64_t *)*v27;
        }
        while (v27 != v23);
        if (v28 == (uint64_t *)v6) {
          goto LABEL_24;
        }
        unint64_t v29 = v28[1];
        if (v26.u32[0] > 1uLL)
        {
          if (v29 >= *(void *)&v24) {
            v29 %= *(void *)&v24;
          }
        }
        else
        {
          v29 &= *(void *)&v24 - 1;
        }
        if (v29 != v25)
        {
LABEL_24:
          if (!*v23) {
            goto LABEL_25;
          }
          unint64_t v30 = *(void *)(*v23 + 8);
          if (v26.u32[0] > 1uLL)
          {
            if (v30 >= *(void *)&v24) {
              v30 %= *(void *)&v24;
            }
          }
          else
          {
            v30 &= *(void *)&v24 - 1;
          }
          if (v30 != v25) {
LABEL_25:
          }
            *(void *)(*(void *)v4 + 8 * v25) = 0;
        }
        uint64_t v31 = *v23;
        if (*v23)
        {
          unint64_t v32 = *(void *)(v31 + 8);
          if (v26.u32[0] > 1uLL)
          {
            if (v32 >= *(void *)&v24) {
              v32 %= *(void *)&v24;
            }
          }
          else
          {
            v32 &= *(void *)&v24 - 1;
          }
          if (v32 != v25)
          {
            *(void *)(*(void *)v4 + 8 * v32) = v28;
            uint64_t v31 = *v23;
          }
        }
        *uint64_t v28 = v31;
        uint64_t *v23 = 0;
        --*(void *)(v4 + 24);
        uint64_t v40 = v23;
        uint64_t v41 = v6;
        LOBYTE(v42) = 1;
        std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v40);
        BOOL v34 = AriOsa::OsMutexGive(*(AriOsa **)(v4 + 96), v33) == -1;
        MEMORY[0x230FC6810](v34, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 241);
      }
      std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v39);
      ++v2;
    }
    while (v2 != v3);
  }
}

void sub_230AC5270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v4);
  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::SetMsgTimeoutMultiplier(AriHostRt *this)
{
  int v1 = (int)this;
  Instance = (AriHostRt *)AriHostRt::GetInstance(this);
  if (v1)
  {
    AriHostRt::GetInstance(Instance);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt23SetMsgTimeoutMultiplierEj_block_invoke;
    block[3] = &__block_descriptor_tmp_44;
    block[4] = &AriHostRt::GetInstance(void)::instance;
    int v8 = v1;
    dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)v9, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetMsgTimeoutMultiplier", v3);
    if (v10 >= 0) {
      int v5 = v9;
    }
    else {
      int v5 = (void **)v9[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Invalid msgTimeoutMultiplier param: must be > 0", v4, v5, 627);
    if (v10 < 0) {
      operator delete(v9[0]);
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_230AC5388(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 17) < 0) {
    operator delete(*(void **)(v1 - 40));
  }
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt23SetMsgTimeoutMultiplierEj_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetMsgTimeoutMultiplier_block_invoke", a3);
  if (v7 >= 0) {
    int v5 = __p;
  }
  else {
    int v5 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) AriHostRt msgTimeoutMultiplier: prev(%d) new(%d)", v4, v5, 632, *(unsigned int *)(*(void *)(a1 + 32) + 8), *(unsigned int *)(a1 + 40));
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = *(_DWORD *)(a1 + 40);
}

void sub_230AC543C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::RegisterSniffer(AriHostRt *this, dispatch_queue_s *a2, int (*a3)(unsigned __int8 *, unint64_t))
{
  char v3 = (char)a3;
  uint64_t v6 = (AriHostRt *)MEMORY[0x230FC6810](this == 0, "dq == NULL", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", 641);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  int v14 = -1;
  AriHostRt::GetInstance(v6);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___ZN9AriHostRt15RegisterSnifferEP16dispatch_queue_sPFiPhmEb_block_invoke;
  void v9[3] = &unk_264BA1B88;
  void v9[5] = this;
  v9[6] = a2;
  char v10 = v3;
  v9[4] = &v11;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, v9);
  uint64_t v7 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void sub_230AC5548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN9AriHostRt15RegisterSnifferEP16dispatch_queue_sPFiPhmEb_block_invoke(uint64_t a1)
{
  Instance = (AriHostRt *)AriHostRt::GetInstance((AriHostRt *)a1);
  unsigned int v4 = atomic_load(&AriHostRt::GetInstance(void)::instance);
  if (v4 == 2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = (AriHostRt *)AriHostRt::GetInstance(Instance);
    qword_26AB825A8 = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    int v8 = (AriHostRt *)AriHostRt::GetInstance(v6);
    qword_26AB825A0 = v7;
    LOBYTE(v7) = *(unsigned char *)(a1 + 56);
    AriHostRt::GetInstance(v8);
    byte_26AB825B0 = v7;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegisterSniffer_block_invoke", v3);
    int v9 = v15;
    char v10 = (void **)__p[0];
    uint64_t v11 = asString();
    if (v9 >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = v10;
    }
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) AriHostRt in state(%s) unsuitable for RegisterSniffer", v12, v13, 648, v11);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_230AC5644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt18sendRawInternal_nlEPhj_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 40);

  free(v2);
}

uint64_t AriHostRt::RegIndication(AriHostRt *this, uint64_t a2)
{
  if (AriHostRt::Init(this)) {
    return 0xFFFFFFFFLL;
  }
  AriOsa::LogSrcInfo((uint64_t *)&v13, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegIndication", v4);
  if (v15 >= 0) {
    uint64_t v7 = (void **)&v13;
  }
  else {
    uint64_t v7 = v13;
  }
  int v8 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Registering indication gmid 0x%x triggered by cid 0x%x", v6, v7, 778, this, a2);
  if (SHIBYTE(v15) < 0) {
    operator delete(v13);
  }
  AriHostRt::GetInstance(v8);
  uint64_t v13 = 0;
  int v14 = (void **)&v13;
  uint64_t v15 = 0x2000000000;
  int v16 = -1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt13RegIndicationEjj_block_invoke;
  block[3] = &unk_264BA1BF8;
  block[4] = &v13;
  void block[5] = &AriHostRt::GetInstance(void)::instance;
  int v11 = (int)this;
  int v12 = a2;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  uint64_t v5 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v5;
}

void sub_230AC57D4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 41) < 0) {
    operator delete(*(void **)(v1 - 64));
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9AriHostRt13RegIndicationEjj_block_invoke(uint64_t a1)
{
  uint64_t result = AriHostRt::regIndication_nl(*(AriHostRt **)(a1 + 40), *(_DWORD *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v3 + 4) && (unsigned int v4 = atomic_load((unsigned int *)v3), v4 == 2))
  {
    int v5 = (*(_DWORD *)(a1 + 48) & 0x3FF | ((unsigned __int16)*(_DWORD *)(a1 + 48) >> 10 << 11)) << 15;
    uint64_t v6 = 0x200000001;
    int v7 = v5;
    int v8 = 0x7FFFFFFF;
    uint64_t result = AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 40), &v6);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = result;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  }
  return result;
}

uint64_t AriHostRt::regIndication_nl(AriHostRt *this, int a2, uint64_t a3)
{
  uint64_t v6 = (char *)this + 33272;
  int v7 = (char *)this + 33032;
  if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)this + 33032) & 1) == 0)
  {
    uint64_t v23 = (unsigned __int16)a2 >> 10;
    uint64_t v24 = a2 & 0x3FF;
    if (a3 == -1)
    {
      AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v8);
      if (SHIBYTE(v62) >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) RegIndication: ARI_INVALID_CID for indication(%d-0x%x)", v46, p_p, 916, v23, v24);
      if (SHIBYTE(v62) < 0) {
        operator delete(__p);
      }
      std::string::basic_string[abi:ne180100]<0>(v58, "invalid cid with indication reg");
      std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*((void *)v6 + 30), 3, (uint64_t)v58, 0, 0);
      if ((v59 & 0x80000000) == 0) {
        return 0;
      }
      unint64_t v27 = v58[0];
    }
    else
    {
      AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v8);
      if (SHIBYTE(v62) >= 0) {
        uint8x8_t v26 = &__p;
      }
      else {
        uint8x8_t v26 = __p;
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) RegIndication: No registered cid 0x%04X for indication(%d-0x%x)", v25, v26, 921, a3, v23, v24);
      if ((SHIBYTE(v62) & 0x80000000) == 0) {
        return 0;
      }
      unint64_t v27 = __p;
    }
    operator delete(v27);
    return 0;
  }
  int v9 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[]((uint64_t)v7, a3);
  uint64_t v11 = *v9;
  char v10 = (std::__shared_weak_count *)v9[1];
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc((uint64_t)this + 33176))
  {
    uint64_t v13 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[]((uint64_t)this + 33176, a2);
    uint64_t v15 = v13;
    int v16 = v13;
    while (1)
    {
      int v16 = (uint64_t *)v16[1];
      if (v16 == v13) {
        break;
      }
      if (*(_DWORD *)(v16[2] + 8) == a3)
      {
        AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v14);
        int v17 = SHIBYTE(v62);
        int v18 = (void **)__p;
        uint64_t v19 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
        BOOL v21 = &__p;
        if (v17 < 0) {
          BOOL v21 = v18;
        }
        if (*(char *)(v19 + 23) >= 0) {
          uint64_t v22 = v19;
        }
        else {
          uint64_t v22 = *(void *)v19;
        }
        Ari::Log((Ari *)4, (uint64_t)"(%s:%d) RegIndication: Duplicated handler from client(%s) for indication(%d-0x%x), no-op", v20, v21, 938, v22, (unsigned __int16)a2 >> 10, a2 & 0x3FF);
        if (SHIBYTE(v62) < 0) {
          operator delete(__p);
        }
        goto LABEL_49;
      }
    }
    AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v14);
    int v48 = SHIBYTE(v62);
    uint8x8_t v49 = (void **)__p;
    uint64_t v50 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
    unint64_t v52 = &__p;
    if (v48 < 0) {
      unint64_t v52 = v49;
    }
    if (*(char *)(v50 + 23) >= 0) {
      uint64_t v53 = v50;
    }
    else {
      uint64_t v53 = *(void *)v50;
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) RegIndication: Add client(%s:0x%x) as listening for indication(%d-0x%x)", v51, v52, 943, v53, a3, (unsigned __int16)a2 >> 10, a2 & 0x3FF);
    if (SHIBYTE(v62) < 0) {
      operator delete(__p);
    }
    std::list<std::shared_ptr<Ari::AriClientProxy>>::push_back(v15, v11, (uint64_t)v10);
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "regIndication_nl", v12);
    int v28 = SHIBYTE(v62);
    unint64_t v29 = (void **)__p;
    uint64_t v30 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 16))(v11);
    unint64_t v32 = &__p;
    if (v28 < 0) {
      unint64_t v32 = v29;
    }
    if (*(char *)(v30 + 23) >= 0) {
      uint64_t v33 = v30;
    }
    else {
      uint64_t v33 = *(void *)v30;
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) RegIndication: client(%s:0x%x) first to register indication(%d-0x%x)", v31, v32, 950, v33, a3, (unsigned __int16)a2 >> 10, a2 & 0x3FF);
    if (SHIBYTE(v62) < 0) {
      operator delete(__p);
    }
    char v55 = (uint64_t *)&v55;
    unint64_t v56 = (uint64_t *)&v55;
    uint64_t v57 = 0;
    BOOL v34 = (uint64_t *)operator new(0x20uLL);
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v34[2] = v11;
    v34[3] = (uint64_t)v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t *v34 = (uint64_t)&v55;
    v34[1] = (uint64_t)&v55;
    char v55 = v34;
    unint64_t v56 = v34;
    uint64_t v57 = 1;
    int v64 = a2;
    MEMORY[0x230FC6810](v6[8] == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 180);
    BOOL v35 = AriOsa::OsMutexTake(*(AriOsa **)v6, (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
    MEMORY[0x230FC6810](v35, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 181);
    int v36 = IDMgr::allocate((AriHostRt *)((char *)this + 33216));
    int v37 = (AriOsa *)ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::sw_dbug_trap((uint64_t)this + 33176, v36 ^ 1u);
    LODWORD(__p) = AriOsa::OsTimeStamp(v37);
    std::list<std::shared_ptr<Ari::AriClientProxy>>::list(&v61, &v55);
    int v38 = std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 33176, a2, &v64);
    *((_DWORD *)v38 + 6) = __p;
    std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v38 + 4);
    uint64_t v39 = v63;
    if (v63)
    {
      uint64_t v41 = v61;
      uint64_t v40 = v62;
      uint64_t v42 = *v62;
      *(void *)(v42 + 8) = *(void *)(v61 + 8);
      **(void **)(v41 + 8) = v42;
      uint64_t v43 = v38[4];
      *(void *)(v43 + 8) = v40;
      *uint64_t v40 = v43;
      v38[4] = v41;
      *(void *)(v41 + 8) = v38 + 4;
      v38[6] += v39;
      uint64_t v63 = 0;
    }
    std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(&v61);
    BOOL v45 = AriOsa::OsMutexGive(*(AriOsa **)v6, v44) == -1;
    MEMORY[0x230FC6810](v45, "AriOsa::OsMutexGive(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 186);
    std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear((uint64_t *)&v55);
  }
LABEL_49:
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  return 0;
}

void sub_230AC5DC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::RegAllIndications(AriHostRt *this)
{
  if (AriHostRt::Init(this)) {
    return 0xFFFFFFFFLL;
  }
  AriOsa::LogSrcInfo((uint64_t *)&v10, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications", v2);
  if (v12 >= 0) {
    int v5 = (void **)&v10;
  }
  else {
    int v5 = v10;
  }
  uint64_t v6 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Registering all indications triggered by cid 0x%x", v4, v5, 811, this);
  if (SHIBYTE(v12) < 0) {
    operator delete(v10);
  }
  AriHostRt::GetInstance(v6);
  char v10 = 0;
  uint64_t v11 = (void **)&v10;
  uint64_t v12 = 0x2000000000;
  int v13 = -1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt17RegAllIndicationsEj_block_invoke;
  block[3] = &unk_264BA1C20;
  int v9 = (int)this;
  block[4] = &v10;
  void block[5] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  uint64_t v3 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v3;
}

void sub_230AC5F80(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 25) < 0) {
    operator delete(*(void **)(v1 - 48));
  }
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt17RegAllIndicationsEj_block_invoke(uint64_t a1)
{
  _OWORD v31[4] = *MEMORY[0x263EF8340];
  if ((ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(void *)(a1 + 40) + 33032) & 1) == 0)
  {
    AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v2);
    if (v26 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to re-register indications using invalid cid 0x%x", v12, p_p, 820, *(unsigned int *)(a1 + 48));
    if (v26 < 0) {
      operator delete(__p);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    std::string::basic_string[abi:ne180100]<0>(v29, "invalid cid with bulk indication reg");
    std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*(void *)(v14 + 33512), 3, (uint64_t)v29, 0, 0);
    if ((v30 & 0x80000000) == 0) {
      return;
    }
    uint64_t v15 = (void *)v29[0];
LABEL_29:
    operator delete(v15);
    return;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(v3 + 4) || (unsigned int v4 = atomic_load((unsigned int *)v3), v4 != 2))
  {
    AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v2);
    if (v26 >= 0) {
      int v17 = &__p;
    }
    else {
      int v17 = __p;
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to re-register indications using invalid cid 0x%x", v16, v17, 826, *(unsigned int *)(a1 + 48));
    if ((v26 & 0x80000000) == 0) {
      return;
    }
    uint64_t v15 = __p;
    goto LABEL_29;
  }
  bzero(&v25, 0x7D4uLL);
  std::string __p = (void *)0x200000001;
  int v28 = 0x7FFFFFFF;
  char v23 = 0;
  unsigned __int16 v22 = 0;
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = *(_DWORD *)(a1 + 48);
  int v7 = operator new(0x30uLL);
  *(void *)int v7 = &unk_26E554BB0;
  v7[2] = v6;
  *((void *)v7 + 2) = v5;
  *((void *)v7 + 3) = &__p;
  *((void *)v7 + 4) = &v22;
  *((void *)v7 + 5) = &v23;
  v31[3] = v7;
  ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::doForEach(v5 + 33176, (uint64_t)v31);
  int v8 = std::__function::__value_func<void ()(int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](v31);
  if (v22)
  {
    unsigned __int16 v27 = v22;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = AriHostRt::setGroupMsgAttrib_nl((uint64_t)v8, (unsigned __int16 *)&__p, v9);
  }
  if (v23)
  {
    AriOsa::LogSrcInfo((uint64_t *)v20, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v9);
    if (v21 >= 0) {
      uint64_t v11 = v20;
    }
    else {
      uint64_t v11 = (void **)v20[0];
    }
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) cid 0x%x requested group registration, registered %u indications", v10, v11, 878, *(unsigned int *)(a1 + 48), v22);
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)v20, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "RegAllIndications_block_invoke", v9);
    if (v21 >= 0) {
      uint64_t v19 = v20;
    }
    else {
      uint64_t v19 = (void **)v20[0];
    }
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) cid 0x%x requested group registration, but no indications are registered", v18, v19, 874, *(unsigned int *)(a1 + 48));
  }
  if (v21 < 0)
  {
    uint64_t v15 = v20[0];
    goto LABEL_29;
  }
}

void sub_230AC628C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::doForEach(uint64_t a1, uint64_t a2)
{
  MEMORY[0x230FC6810](*(unsigned char *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 322);
  BOOL v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x230FC6810](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 324);
  for (uint64_t i = *(uint64_t **)(a1 + 16); i; uint64_t i = (uint64_t *)*i)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    int v8 = *((_DWORD *)i + 4);
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, int *, uint64_t *))(*(void *)v7 + 48))(v7, &v8, i + 4);
  }
  AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v5);

  JUMPOUT(0x230FC6810);
}

uint64_t AriHostRt::setGroupMsgAttrib_nl(uint64_t a1, unsigned __int16 *a2, const char *a3)
{
  if (a2[1004])
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", a3);
    if ((SBYTE7(v27) & 0x80u) == 0) {
      uint64_t v5 = __p;
    }
    else {
      uint64_t v5 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Sending AriGrpMsgsAttribReq with %u gmids", v4, v5, 968, a2[1004]);
    if (SBYTE7(v27) < 0) {
      operator delete(__p[0]);
    }
    unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v28 = v6;
    long long v29 = v6;
    *(_OWORD *)std::string __p = v6;
    long long v27 = v6;
    MEMORY[0x230FC6900](__p, 67698688);
    uint64_t v8 = AriMsg::pack((AriMsg *)__p, 1, a2);
    if (v8)
    {
      AriOsa::LogSrcInfo((uint64_t *)v24, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", v7);
      if (v25 >= 0) {
        char v10 = v24;
      }
      else {
        char v10 = (void **)v24[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to pack AriGrpMsgsAttribReq", v9, v10, 975);
      if (v25 < 0) {
        operator delete(v24[0]);
      }
    }
    else
    {
      unsigned int v23 = 0;
      uint64_t EncodedBuf = (AriMsg *)AriMsg::getEncodedBuf((AriMsg *)__p, &v23);
      uint64_t v15 = EncodedBuf;
      if (EncodedBuf)
      {
        *((_DWORD *)EncodedBuf + 2) = *((_DWORD *)EncodedBuf + 2) & 0x1FFFF | 0xFE020000;
        uint64_t v8 = AriHostRt::sendRawInternal_nl(EncodedBuf, EncodedBuf, (unsigned __int8 *)v23);
        if (v8)
        {
          AriOsa::LogSrcInfo((uint64_t *)v24, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", v17);
          uint64_t v19 = v25 >= 0 ? v24 : (void **)v24[0];
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to send AriGrpMsgsAttribReq", v18, v19, 988);
          if (v25 < 0) {
            operator delete(v24[0]);
          }
        }
        AriMsg::ReleaseEncodedMessage(v15, v16);
      }
      else
      {
        AriOsa::LogSrcInfo((uint64_t *)v24, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", v14);
        if (v25 >= 0) {
          char v21 = v24;
        }
        else {
          char v21 = (void **)v24[0];
        }
        Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Unable to create payload.  Out of memory?", v20, v21, 994);
        if (v25 < 0) {
          operator delete(v24[0]);
        }
        uint64_t v8 = 4294967214;
      }
    }
    AriMsg::~AriMsg((AriMsg *)__p);
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "setGroupMsgAttrib_nl", a3);
    if ((SBYTE7(v27) & 0x80u) == 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Zero gmids provided", v11, v12, 964);
    if (SBYTE7(v27) < 0) {
      operator delete(__p[0]);
    }
    return 0xFFFFFFFFLL;
  }
  return v8;
}

void sub_230AC667C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  AriMsg::~AriMsg((AriMsg *)&a20);
  _Unwind_Resume(a1);
}

uint64_t AriHostRt::PushAllIndications(AriHostRt *a1, uint64_t a2)
{
  if (AriHostRt::Init(a1)) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(a2 + 16))
  {
    memset(v18, 170, sizeof(v18));
    std::list<unsigned int>::list(v18, a2);
    AriOsa::LogSrcInfo((uint64_t *)v16, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "PushAllIndications", v6);
    if (v17 >= 0) {
      uint64_t v8 = v16;
    }
    else {
      uint64_t v8 = (void **)v16[0];
    }
    int v9 = (AriHostRt *)Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Updating RT with all indications pushed by cid 0x%x", v7, v8, 896, a1);
    if (v17 < 0) {
      operator delete(v16[0]);
    }
    AriHostRt::GetInstance(v9);
    char v10 = qword_26AB7A300;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN9AriHostRt18PushAllIndicationsEjRKNSt3__14listIjNS0_9allocatorIjEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_67;
    std::list<unsigned int>::list(v14, (uint64_t)v18);
    v14[3] = &AriHostRt::GetInstance(void)::instance;
    int v15 = (int)a1;
    dispatch_sync(v10, block);
    std::__list_imp<unsigned int>::clear(v14);
    std::__list_imp<unsigned int>::clear(v18);
  }
  else
  {
    AriOsa::LogSrcInfo(v18, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "PushAllIndications", v4);
    if (v18[2] >= 0) {
      uint64_t v12 = v18;
    }
    else {
      uint64_t v12 = (uint64_t *)v18[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) No indications were pushed by cid 0x%x", v11, v12, 891, a1);
    if (SHIBYTE(v18[2]) < 0) {
      operator delete((void *)v18[0]);
    }
  }
  return 0;
}

void sub_230AC6888(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 33) < 0) {
    operator delete(*(void **)(v1 - 56));
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9AriHostRt18PushAllIndicationsEjRKNSt3__14listIjNS0_9allocatorIjEEEE_block_invoke(uint64_t result)
{
  uint64_t v1 = result + 32;
  uint64_t v2 = *(void *)(result + 40);
  if (v2 != result + 32)
  {
    uint64_t v3 = *(AriHostRt **)(result + 56);
    uint64_t v4 = *(unsigned int *)(result + 64);
    do
    {
      uint64_t result = AriHostRt::regIndication_nl(v3, *(_DWORD *)(v2 + 16), v4);
      uint64_t v2 = *(void *)(v2 + 8);
    }
    while (v2 != v1);
  }
  return result;
}

void *__copy_helper_block_e8_32c37_ZTSNSt3__14listIjNS_9allocatorIjEEEE(uint64_t a1, uint64_t a2)
{
  return std::list<unsigned int>::list((void *)(a1 + 32), a2 + 32);
}

void *__destroy_helper_block_e8_32c37_ZTSNSt3__14listIjNS_9allocatorIjEEEE(uint64_t a1)
{
  return std::__list_imp<unsigned int>::clear((void *)(a1 + 32));
}

void *std::list<std::shared_ptr<Ari::AriClientProxy>>::push_back(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = operator new(0x20uLL);
  result[2] = a2;
  result[3] = a3;
  if (a3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(a3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *a1;
  void *result = *a1;
  result[1] = a1;
  *(void *)(v7 + 8) = result;
  *a1 = (uint64_t)result;
  ++a1[2];
  return result;
}

void *AriHostRt::processStartEvent_nl(void *this)
{
  v9[4] = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)this + 4))
  {
    uint64_t v1 = this;
    *((unsigned char *)this + 4) = 1;
    uint64_t v2 = (void *)this[4190];
    if (v2)
    {
      uint64_t v3 = this[4191];
      if (v3)
      {
        dispatch_async(v3, v2);
        AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "processStartEvent_nl", v4);
        if (v8 >= 0) {
          long long v6 = __p;
        }
        else {
          long long v6 = (void **)__p[0];
        }
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Dispatched supervisory Started callback", v5, v6, 1037);
        if (v8 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    v9[0] = &unk_26E554C40;
    void v9[3] = v9;
    ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach((uint64_t)(v1 + 4129), (uint64_t)v9);
    return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v9);
  }
  return this;
}

void sub_230AC6AB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(uint64_t a1, uint64_t a2)
{
  MEMORY[0x230FC6810](*(unsigned char *)(a1 + 104) == 0, "valid == false", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 311);
  BOOL v4 = AriOsa::OsMutexTake(*(AriOsa **)(a1 + 96), (dispatch_semaphore_s *)0xFFFFFFFFLL) == -1;
  MEMORY[0x230FC6810](v4, "AriOsa::OsMutexTake(mtx) == ARI_RESULT_ERR", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/common/inc/ari_utils.h", 313);
  for (uint64_t i = *(void **)(a1 + 16); i; uint64_t i = (void *)*i)
  {
    uint64_t v7 = *(void *)(a2 + 24);
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void *))(*(void *)v7 + 48))(v7, i + 4);
  }
  AriOsa::OsMutexGive(*(AriOsa **)(a1 + 96), v5);

  JUMPOUT(0x230FC6810);
}

uint64_t AriHostRt::DeregIndication(AriHostRt *this, int a2)
{
  int v3 = (int)this;
  AriHostRt::GetInstance(this);
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = -1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt15DeregIndicationEjj_block_invoke;
  block[3] = &unk_264BA1C48;
  int v7 = a2;
  int v8 = v3;
  void block[4] = &v9;
  void block[5] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  uint64_t v4 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void ___ZN9AriHostRt15DeregIndicationEjj_block_invoke(uint64_t a1)
{
  if (ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(void *)(a1 + 40) + 33032))
  {
    int v3 = ResMgr<std::shared_ptr<Ari::AriClientProxy>>::operator[](*(void *)(a1 + 40) + 33032, *(_DWORD *)(a1 + 48));
    uint64_t v5 = *v3;
    uint64_t v4 = (std::__shared_weak_count *)v3[1];
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (ResMgr<std::shared_ptr<Ari::AriClientProxy>>::isAlloc(*(void *)(a1 + 40) + 33176))
    {
      int v7 = ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::operator[](*(void *)(a1 + 40) + 33176, *(_DWORD *)(a1 + 52));
      int v8 = (uint64_t *)v7[1];
      if (v8 != v7)
      {
        do
        {
          uint64_t v9 = (uint64_t *)v8[1];
          if (*(_DWORD *)(v8[2] + 8) == *(_DWORD *)(a1 + 48))
          {
            uint64_t v10 = *v8;
            *(void *)(v10 + 8) = v9;
            *(void *)v8[1] = v10;
            --v7[2];
            uint64_t v11 = (std::__shared_weak_count *)v8[3];
            if (v11) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v11);
            }
            operator delete(v8);
          }
          int v8 = v9;
        }
        while (v9 != v7);
      }
      int v12 = *(unsigned int **)(a1 + 40);
      int v13 = *(_DWORD *)(a1 + 52);
      uint64_t v14 = (int *)operator new(4uLL);
      *uint64_t v14 = v13;
      v25[1] = v14 + 1;
      v25[2] = v14 + 1;
      v25[0] = v14;
      AriHostRt::checkShouldDeregIndication_nl(v12, v25);
      operator delete(v14);
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregIndication_block_invoke", v15);
      LODWORD(v12) = v27;
      int v16 = (void **)__p[0];
      uint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 16))(v5);
      uint64_t v19 = __p;
      if ((int)v12 < 0) {
        uint64_t v19 = v16;
      }
      if (*(char *)(v17 + 23) >= 0) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = *(void *)v17;
      }
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) client(%s:0x%x) no longer listening for msgid(%d-0x%x)", v18, v19, 1079, v20, *(unsigned int *)(a1 + 48), (unsigned __int16)*(_DWORD *)(a1 + 52) >> 10, *(_DWORD *)(a1 + 52) & 0x3FF);
      if (v27 < 0) {
        operator delete(__p[0]);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
    }
    else
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregIndication_block_invoke", v6);
      if (v27 >= 0) {
        uint64_t v24 = __p;
      }
      else {
        uint64_t v24 = (void **)__p[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) indication msgid(%d-0x%x) is not registered with any cid (cid 0x%x attempted deregister)", v23, v24, 1060, (unsigned __int16)*(_DWORD *)(a1 + 52) >> 10, *(_DWORD *)(a1 + 52) & 0x3FF, *(unsigned int *)(a1 + 48));
      if (v27 < 0) {
        operator delete(__p[0]);
      }
    }
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  else
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DeregIndication_block_invoke", v2);
    if (v27 >= 0) {
      unsigned __int16 v22 = __p;
    }
    else {
      unsigned __int16 v22 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) No registered cid 0x%04X", v21, v22, 1053, *(unsigned int *)(a1 + 48));
    if (v27 < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_230AC6F60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9AriHostRt12InboundMsgCBEPhm_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(**(void **)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 8) - **(void **)(a1 + 40));
}

uint64_t __copy_helper_block_e8_40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t AriHostRt::CancelAllTransactions(AriHostRt *this)
{
  v37[4] = *MEMORY[0x263EF8340];
  AriHostRt::GetInstance(this);
  unint64_t v34 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v35 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  std::string::basic_string[abi:ne180100]<0>(&v32, "cancel");
  AriDispatch::Semaphore::Create();
  if (v33 < 0) {
    operator delete(v32);
  }
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = v34;
  uint64_t v1 = v35;
  if (v35) {
    atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v37[0] = &unk_26E554CD0;
  v37[1] = v2;
  v37[2] = v1;
  v37[3] = v37;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v30, (uint64_t)v37);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v37);
  uint64_t v4 = (AriHostRt::ClientTransitionTracker *)v30;
  int v3 = (std::__shared_weak_count *)v31;
  if (v31) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v31 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = (std::__shared_weak_count *)qword_26AB82578;
  qword_26AB82570 = (uint64_t)v4;
  qword_26AB82578 = (uint64_t)v3;
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  long long v6 = qword_26AB7A300;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke;
  block[3] = &__block_descriptor_tmp_106;
  void block[4] = &AriHostRt::GetInstance(void)::instance;
  void block[5] = v4;
  long long v29 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v6, block);
  int v7 = (AriDispatch::Semaphore *)v34;
  dispatch_walltime(0, 5000000000);
  if ((AriDispatch::Semaphore::wait(v7) & 1) == 0)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions", v8);
    if (v27 >= 0) {
      uint64_t v10 = __p;
    }
    else {
      uint64_t v10 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for clients to stall", v9, v10, 1346);
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    AriHostRt::ClientTransitionTracker::logRemainingClients(v4, &v25);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
  }
  unint64_t v12 = v34;
  uint64_t v11 = v35;
  if (v35) {
    atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v36[0] = &unk_26E554DE0;
  v36[1] = v12;
  v36[2] = v11;
  v36[3] = v36;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(__p, (uint64_t)v36);
  uint64_t v14 = (AriHostRt::ClientTransitionTracker *)__p[0];
  int v13 = (std::__shared_weak_count *)__p[1];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v36);
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v15 = (std::__shared_weak_count *)qword_26AB82578;
  qword_26AB82570 = (uint64_t)v14;
  qword_26AB82578 = (uint64_t)v13;
  if (v15) {
    std::__shared_weak_count::__release_weak(v15);
  }
  int v16 = qword_26AB7A300;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 1174405120;
  v23[2] = ___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke_108;
  v23[3] = &__block_descriptor_tmp_113;
  v23[4] = &AriHostRt::GetInstance(void)::instance;
  v23[5] = v14;
  uint64_t v24 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v16, v23);
  uint64_t v17 = (AriDispatch::Semaphore *)v34;
  dispatch_walltime(0, 5000000000);
  if ((AriDispatch::Semaphore::wait(v17) & 1) == 0)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions", v18);
    if (v27 >= 0) {
      uint64_t v20 = __p;
    }
    else {
      uint64_t v20 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for clients to ack end of cancellation", v19, v20, 1373);
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    AriHostRt::ClientTransitionTracker::logRemainingClients(v14, &v22);
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v22.__r_.__value_.__l.__data_);
    }
  }
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
  return 0;
}

void sub_230AC73D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,std::__shared_weak_count *a37)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  if (a37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a37);
  }
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
  uint64_t v40 = *(std::__shared_weak_count **)(v38 - 144);
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  _Unwind_Resume(exception_object);
}

void *___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  v10[4] = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 4) = 0;
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions_block_invoke", a3);
  if (v9 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to stall (crash)", v4, v5, 1338);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = *(void *)(a1 + 32) + 33032;
  v10[0] = &unk_26E554D60;
  v10[1] = a1 + 40;
  v10[3] = v10;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v6, (uint64_t)v10);
  return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v10);
}

void sub_230AC7588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17)
{
}

uint64_t __copy_helper_block_e8_40c63_ZTSNSt3__110shared_ptrIN9AriHostRt23ClientTransitionTrackerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c63_ZTSNSt3__110shared_ptrIN9AriHostRt23ClientTransitionTrackerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void *___ZN9AriHostRt21CancelAllTransactionsEv_block_invoke_108(uint64_t a1, uint64_t a2, const char *a3)
{
  _OWORD v17[4] = *MEMORY[0x263EF8340];
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions_block_invoke", a3);
  if (v16 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) canceling %u outstanding requests", v4, v5, 1357, *(void *)(*(void *)(a1 + 32) + 33344));
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 33336);
  if (v7)
  {
    do
    {
      int v8 = (AriHostRt::RtTransaction *)v7[3];
      char v9 = (std::__shared_weak_count *)v7[4];
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      AriHostRt::RtTransaction::cancel(v8, 4294967211);
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      int v7 = (void *)*v7;
    }
    while (v7);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(v6 + 33320);
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "CancelAllTransactions_block_invoke", v10);
  if (v16 >= 0) {
    unint64_t v12 = __p;
  }
  else {
    unint64_t v12 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients of end of cancellation", v11, v12, 1365);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = *(void *)(a1 + 32) + 33032;
  v17[0] = &unk_26E554E60;
  v17[1] = a1 + 40;
  v17[3] = v17;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v13, (uint64_t)v17);
  return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v17);
}

void sub_230AC7790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
}

uint64_t AriHostRt::commitLPM(AriHostRt *this, uint64_t a2)
{
  AriHostRt::GetInstance(this);
  if (a2 < 0x1F5)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM", v3);
    if (v16 >= 0) {
      uint64_t v10 = __p;
    }
    else {
      uint64_t v10 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) Skipping request-draining due to imminent LPM timeout in %dms", v9, v10, 1436, a2);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
    unsigned int v23 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    std::string::basic_string[abi:ne180100]<0>(&v20, "lpmDrainSignal");
    AriDispatch::Semaphore::Create();
    if (v21 < 0) {
      operator delete(v20);
    }
    uint64_t v4 = qword_26AB7A300;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN9AriHostRt9commitLPMEj_block_invoke;
    block[3] = &__block_descriptor_tmp_120;
    int v19 = a2;
    void block[4] = &AriHostRt::GetInstance(void)::instance;
    void block[5] = v22;
    int v18 = v23;
    if (v23) {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_async(v4, block);
    uint64_t v5 = (AriDispatch::Semaphore *)v22;
    dispatch_walltime(0, 1000000 * a2);
    if (AriDispatch::Semaphore::wait(v5))
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM", v6);
      if (v16 >= 0) {
        int v8 = __p;
      }
      else {
        int v8 = (void **)__p[0];
      }
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) lpm-critical transaction draining complete", v7, v8, 1431);
    }
    else
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM", v6);
      if (v16 >= 0) {
        unint64_t v12 = __p;
      }
      else {
        unint64_t v12 = (void **)__p[0];
      }
      Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) timeout waiting %dms to drain lpm-critical transactions", v11, v12, 1427, a2);
    }
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 0x40000000;
  v14[2] = ___ZN9AriHostRt9commitLPMEj_block_invoke_124;
  v14[3] = &__block_descriptor_tmp_127;
  void v14[4] = &AriHostRt::GetInstance(void)::instance;
  dispatch_async((dispatch_queue_t)qword_26AB7A300, v14);
  return 0;
}

void sub_230AC7A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,std::__shared_weak_count *a29)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a29);
  }
  unint64_t v31 = *(std::__shared_weak_count **)(v29 - 40);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt9commitLPMEj_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", a3);
  if (v56 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  uint64_t v52 = a1;
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) attempt to drain lpm-critical request based on %u outstanding requests with %dms timeout", v4, v5, 1391, *(void *)(*(void *)(a1 + 32) + 33344), *(unsigned int *)(a1 + 56));
  if (v56 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = (void *)(*(void *)(a1 + 32) + 33400);
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  char v9 = (std::__shared_weak_count *)v7[1];
  *int v7 = v6;
  v7[1] = v8;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(*(void *)(a1 + 32) + 33360);
  uint64_t v11 = *(void *)(a1 + 32);
  unint64_t v12 = *(void **)(v11 + 33336);
  if (v12)
  {
    uint64_t v13 = (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp";
    while (1)
    {
      uint64_t v15 = v12[3];
      uint64_t v14 = (std::__shared_weak_count *)v12[4];
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (*(void *)(v15 + 48) > 0x4A8270A3FuLL)
      {
        AriOsa::LogSrcInfo((uint64_t *)__p, v13, "commitLPM_block_invoke", v10);
        int v30 = v56;
        unint64_t v31 = (void **)__p[0];
        AriHostRt::RtTransaction::asString((uint64_t *)v53, (AriHostRt::RtTransaction *)v15);
        char v33 = __p;
        if (v30 < 0) {
          char v33 = v31;
        }
        unint64_t v34 = v53;
        if (v54 < 0) {
          unint64_t v34 = (void **)v53[0];
        }
        Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) NOT waiting for trx(%s) due to long timeout of %llums", v32, v33, 1408, v34, *(void *)(v15 + 48) / 0xF4240uLL);
        if (v54 < 0) {
          operator delete(v53[0]);
        }
        if (v56 < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_74;
      }
      AriOsa::LogSrcInfo((uint64_t *)__p, v13, "commitLPM_block_invoke", v10);
      int v16 = v56;
      uint64_t v17 = (void **)__p[0];
      AriHostRt::RtTransaction::asString((uint64_t *)v53, (AriHostRt::RtTransaction *)v15);
      int v19 = __p;
      if (v16 < 0) {
        int v19 = v17;
      }
      if (v54 >= 0) {
        uint64_t v20 = v53;
      }
      else {
        uint64_t v20 = (void **)v53[0];
      }
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) trx(%s) is lpm-critical", v18, v19, 1402, v20);
      if (v54 < 0) {
        operator delete(v53[0]);
      }
      char v21 = v13;
      if (v56 < 0) {
        operator delete(__p[0]);
      }
      uint64_t v22 = *(void *)(v52 + 32);
      int BufCtx = AriMsg::GetBufCtx(**(AriMsg ***)(v15 + 16), (const unsigned __int8 *)(*(void *)(*(void *)(v15 + 16) + 8) - **(void **)(v15 + 16)));
      int v24 = BufCtx;
      uint64_t v25 = v22 + 33360;
      unint64_t v26 = BufCtx;
      unint64_t v27 = *(void *)(v22 + 33368);
      if (!v27)
      {
        unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
LABEL_49:
        int v36 = operator new(0x28uLL);
        *(void *)int v36 = 0;
        *((void *)v36 + 1) = v26;
        *((_DWORD *)v36 + 4) = v24;
        *((void *)v36 + 3) = 0;
        *((void *)v36 + 4) = 0;
        float v38 = (float)(unint64_t)(*(void *)(v25 + 24) + 1);
        float v39 = *(float *)(v25 + 32);
        uint64_t v13 = v21;
        if (!v27 || (float)(v39 * (float)v27) < v38)
        {
          BOOL v40 = (v27 & (v27 - 1)) != 0;
          if (v27 < 3) {
            BOOL v40 = 1;
          }
          unint64_t v41 = v40 | (2 * v27);
          unint64_t v42 = vcvtps_u32_f32(v38 / v39);
          if (v41 <= v42) {
            size_t v43 = v42;
          }
          else {
            size_t v43 = v41;
          }
          std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__rehash<true>(v25, v43);
          unint64_t v27 = *(void *)(v25 + 8);
          if ((v27 & (v27 - 1)) != 0)
          {
            if (v27 <= v26) {
              unint64_t v29 = v26 % v27;
            }
            else {
              unint64_t v29 = v26;
            }
          }
          else
          {
            unint64_t v29 = (v27 - 1) & v26;
          }
        }
        uint64_t v44 = *(void *)v25;
        BOOL v45 = *(void **)(*(void *)v25 + 8 * v29);
        if (v45)
        {
          *(void *)int v36 = *v45;
          goto LABEL_69;
        }
        *(void *)int v36 = *(void *)(v25 + 16);
        *(void *)(v25 + 16) = v36;
        *(void *)(v44 + 8 * v29) = v25 + 16;
        if (*(void *)v36)
        {
          unint64_t v46 = *(void *)(*(void *)v36 + 8);
          if ((v27 & (v27 - 1)) != 0)
          {
            if (v46 >= v27) {
              v46 %= v27;
            }
          }
          else
          {
            v46 &= v27 - 1;
          }
          BOOL v45 = (void *)(*(void *)v25 + 8 * v46);
LABEL_69:
          void *v45 = v36;
        }
        ++*(void *)(v25 + 24);
        if (v14) {
          goto LABEL_71;
        }
        goto LABEL_72;
      }
      uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v27);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] > 1uLL)
      {
        unint64_t v29 = BufCtx;
        if (v27 <= BufCtx) {
          unint64_t v29 = BufCtx % v27;
        }
      }
      else
      {
        unint64_t v29 = (v27 - 1) & BufCtx;
      }
      BOOL v35 = *(void ***)(*(void *)v25 + 8 * v29);
      if (!v35) {
        goto LABEL_49;
      }
      int v36 = *v35;
      if (!*v35) {
        goto LABEL_49;
      }
      while (1)
      {
        unint64_t v37 = *((void *)v36 + 1);
        if (v37 == BufCtx) {
          break;
        }
        if (v28.u32[0] > 1uLL)
        {
          if (v37 >= v27) {
            v37 %= v27;
          }
        }
        else
        {
          v37 &= v27 - 1;
        }
        if (v37 != v29) {
          goto LABEL_49;
        }
LABEL_48:
        int v36 = *(void **)v36;
        if (!v36) {
          goto LABEL_49;
        }
      }
      if (*((_DWORD *)v36 + 4) != BufCtx) {
        goto LABEL_48;
      }
      uint64_t v13 = v21;
      if (!v14) {
        goto LABEL_72;
      }
LABEL_71:
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_72:
      uint8x8_t v47 = (std::__shared_weak_count *)*((void *)v36 + 4);
      *((void *)v36 + 3) = v15;
      *((void *)v36 + 4) = v14;
      if (v47) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v47);
      }
LABEL_74:
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      unint64_t v12 = (void *)*v12;
      if (!v12)
      {
        uint64_t v11 = *(void *)(v52 + 32);
        break;
      }
    }
  }
  int v48 = (uint64_t *)(v11 + 33384);
  uint64_t v49 = *v48;
  if (*v48)
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", v10);
    if (v56 >= 0) {
      unint64_t v51 = __p;
    }
    else {
      unint64_t v51 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) lpmDrainSet.size(): %zu", v50, v51, 1420, v49);
    if (v56 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    AriDispatch::Semaphore::signal((AriDispatch::Semaphore *)v48[2]);
  }
}

void sub_230AC7FF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_40c51_ZTSNSt3__110shared_ptrIN11AriDispatch9SemaphoreEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c51_ZTSNSt3__110shared_ptrIN11AriDispatch9SemaphoreEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t ___ZN9AriHostRt9commitLPMEj_block_invoke_124(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(uint64_t ***)(v4 + 33376);
  if (v5)
  {
    do
    {
      AriOsa::LogSrcInfo((uint64_t *)v22, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", a3);
      int v6 = v23;
      int v7 = (void **)v22[0];
      AriHostRt::RtTransaction::asString((uint64_t *)&__p, (AriHostRt::RtTransaction *)v5[3]);
      if (v6 >= 0) {
        char v9 = v22;
      }
      else {
        char v9 = v7;
      }
      if (v21 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      Ari::Log((Ari *)0x10, (uint64_t)"(%s:%d) trx(%s) not drained before lpm", v8, v9, 1445, p_p);
      if (v21 < 0) {
        operator delete(__p);
      }
      if (v23 < 0) {
        operator delete(v22[0]);
      }
      uint64_t v5 = (uint64_t **)*v5;
    }
    while (v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v11 = v4 + 33400;
  unint64_t v12 = *(std::__shared_weak_count **)(v11 + 8);
  *(_OWORD *)uint64_t v11 = 0u;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(*(void *)(a1 + 32) + 33360);
  std::string __p = (void *)0x600000001;
  int v13 = *(_DWORD *)(*(void *)(a1 + 32) + 12);
  int v19 = 0xFFFF;
  int v20 = v13;
  AriOsa::LogSrcInfo((uint64_t *)v22, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "commitLPM_block_invoke", v14);
  if (v23 >= 0) {
    int v16 = v22;
  }
  else {
    int v16 = (void **)v22[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Committing LPM to BB before AP sleep", v15, v16, 1462);
  if (v23 < 0) {
    operator delete(v22[0]);
  }
  return AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 32), &__p);
}

void sub_230AC824C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t AriHostRt::SetOPMode(int a1, NSObject *a2, unsigned int a3)
{
  memset(&v31, 170, sizeof(v31));
  std::string::basic_string[abi:ne180100]<0>(&v31, "");
  v6.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  AriHostRt::GetInstance((AriHostRt *)v6.__d_.__rep_);
  if (a1 == 1)
  {
    AriOsa::LogSrcInfo((uint64_t *)v29, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode", v7);
    if (v30 >= 0) {
      unint64_t v12 = v29;
    }
    else {
      unint64_t v12 = (void **)v29[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to enter LPM", v11, v12, 1498);
    if (v30 < 0) {
      operator delete(v29[0]);
    }
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    {
      v31.__r_.__value_.__l.__size_ = 14;
      int v13 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    else
    {
      *((unsigned char *)&v31.__r_.__value_.__s + 23) = 14;
      int v13 = &v31;
    }
    strcpy((char *)v13, "lpmEnterSignal");
    a3 >>= 1;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 0x40000000;
    v28[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke;
    v28[3] = &__block_descriptor_tmp_131;
    v28[4] = &AriHostRt::GetInstance(void)::instance;
    dispatch_async((dispatch_queue_t)qword_26AB7A300, v28);
    int v17 = 3;
    goto LABEL_27;
  }
  if (a1 == 2)
  {
    AriOsa::LogSrcInfo((uint64_t *)v29, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode", v7);
    if (v30 >= 0) {
      char v9 = v29;
    }
    else {
      char v9 = (void **)v29[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to exit LPM", v8, v9, 1517);
    if (v30 < 0) {
      operator delete(v29[0]);
    }
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    {
      v31.__r_.__value_.__l.__size_ = 13;
      uint64_t v10 = (std::string *)v31.__r_.__value_.__r.__words[0];
    }
    else
    {
      *((unsigned char *)&v31.__r_.__value_.__s + 23) = 13;
      uint64_t v10 = &v31;
    }
    strcpy((char *)v10, "lpmExitSignal");
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2;
    block[3] = &__block_descriptor_tmp_134;
    void block[4] = &AriHostRt::GetInstance(void)::instance;
    dispatch_async((dispatch_queue_t)qword_26AB7A300, block);
    int v17 = 4;
LABEL_27:
    int v18 = qword_26AB7A308;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 1174405120;
    v20[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_3;
    v20[3] = &__block_descriptor_tmp_152;
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v31;
    }
    int v24 = v17;
    unsigned int v25 = a3;
    int v26 = a1;
    uint64_t v22 = &AriHostRt::GetInstance(void)::instance;
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep rep = v6.__d_.__rep_;
    dispatch_group_async(a2, v18, v20);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    uint64_t v16 = 0;
    goto LABEL_33;
  }
  AriOsa::LogSrcInfo((uint64_t *)v29, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode", v7);
  if (v30 >= 0) {
    uint64_t v15 = v29;
  }
  else {
    uint64_t v15 = (void **)v29[0];
  }
  Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Setting unknown mode", v14, v15, 1535);
  if (v30 < 0) {
    operator delete(v29[0]);
  }
  uint64_t v16 = 0xFFFFFFFFLL;
LABEL_33:
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  return v16;
}

void sub_230AC8610(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 - 89) < 0) {
    operator delete(*(void **)(v1 - 112));
  }
  if (*(char *)(v1 - 65) < 0) {
    operator delete(*(void **)(v1 - 88));
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke(uint64_t a1)
{
  long long v2 = xmmword_230AD2580;
  return AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 32), &v2);
}

uint64_t ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2(uint64_t a1)
{
  long long v2 = xmmword_230AD2590;
  return AriHostRt::setMsgAttrib_nl(*(unsigned int **)(a1 + 32), &v2);
}

void ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_3(uint64_t a1)
{
  v61[4] = *MEMORY[0x263EF8340];
  unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
  char v59 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a1 + 55) < 0) {
    std::string::__init_copy_ctor_external(&v57, *(const std::string::value_type **)(a1 + 32), *(void *)(a1 + 40));
  }
  else {
    std::string v57 = *(std::string *)(a1 + 32);
  }
  AriDispatch::Semaphore::Create();
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
  unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v56 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v3 = v58;
  long long v2 = v59;
  if (v59) {
    atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v61[0] = &unk_26E554EE0;
  v61[1] = v3;
  v61[2] = v2;
  v61[3] = v61;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v55, (uint64_t)v61);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v61);
  uint64_t v4 = (AriHostRt::ClientTransitionTracker **)(*(void *)(a1 + 56) + 33432);
  std::chrono::system_clock::time_point v6 = (AriHostRt::ClientTransitionTracker *)v55;
  uint64_t v5 = (std::__shared_weak_count *)v56;
  if (v56) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v56 + 16), 1uLL, memory_order_relaxed);
  }
  int v7 = (std::__shared_weak_count *)v4[1];
  *uint64_t v4 = v6;
  v4[1] = (AriHostRt::ClientTransitionTracker *)v5;
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  char v9 = *(NSObject **)(v8 + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_4;
  block[3] = &__block_descriptor_tmp_138;
  void block[4] = v8;
  void block[5] = v6;
  uint64_t v53 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v54 = *(_DWORD *)(a1 + 72);
  dispatch_async(v9, block);
  uint64_t v10 = (AriDispatch::Semaphore *)v58;
  dispatch_walltime(0, 1000000 * *(unsigned int *)(a1 + 76));
  if ((AriDispatch::Semaphore::wait(v10) & 1) == 0)
  {
    AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v11);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if (*(_DWORD *)(a1 + 80) == 1) {
      uint64_t v14 = "enter";
    }
    else {
      uint64_t v14 = "exit";
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for client to %s LPM", v12, p_p, 1560, v14);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    memset(&__p, 170, sizeof(__p));
    AriHostRt::ClientTransitionTracker::logRemainingClients(v6, &__p);
    if (*(_DWORD *)(a1 + 80) == 1)
    {
      uint64_t v15 = (uint64_t *)(*(void *)(a1 + 56) + 33512);
      if (*v15)
      {
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          size_t size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          size_t size = __p.__r_.__value_.__l.__size_;
        }
        memset(v50, 170, sizeof(v50));
        int v17 = v50;
        std::string::basic_string[abi:ne180100]((uint64_t)v50, size + 25);
        if (SHIBYTE(v50[2]) < 0) {
          int v17 = (void **)v50[0];
        }
        if (size)
        {
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v18 = &__p;
          }
          else {
            int v18 = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          memmove(v17, v18, size);
        }
        strcpy((char *)v17 + size, " failed to ACK LPM enter.");
        std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*v15, 2, (uint64_t)v50, 0, 0);
        if (SHIBYTE(v50[2]) < 0) {
          operator delete(v50[0]);
        }
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (*(_DWORD *)(a1 + 80) == 1)
  {
    unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v49 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
    std::string::basic_string[abi:ne180100]<0>(&v46, "stallSignal");
    AriDispatch::Semaphore::Create();
    if (v47 < 0) {
      operator delete(v46);
    }
    unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v20 = v48;
    int v19 = v49;
    if (v49) {
      atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v60[0] = &unk_26E554FE0;
    v60[1] = v20;
    v60[2] = v19;
    v60[3] = v60;
    std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v44, (uint64_t)v60);
    std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v60);
    char v21 = (AriHostRt::ClientTransitionTracker **)(*(void *)(a1 + 56) + 33432);
    char v23 = (AriHostRt::ClientTransitionTracker *)v44;
    uint64_t v22 = (std::__shared_weak_count *)v45;
    if (v45) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v45 + 16), 1uLL, memory_order_relaxed);
    }
    int v24 = (std::__shared_weak_count *)v21[1];
    AriOsa *v21 = v23;
    v21[1] = (AriHostRt::ClientTransitionTracker *)v22;
    if (v24) {
      std::__shared_weak_count::__release_weak(v24);
    }
    uint64_t v25 = *(void *)(a1 + 56);
    int v26 = *(NSObject **)(v25 + 24);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 1174405120;
    void v42[2] = ___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2_144;
    v42[3] = &__block_descriptor_tmp_148;
    v42[4] = v25;
    v42[5] = v23;
    size_t v43 = v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_async(v26, v42);
    unint64_t v27 = (AriDispatch::Semaphore *)v48;
    dispatch_walltime(0, 1000000 * *(unsigned int *)(a1 + 76));
    if (AriDispatch::Semaphore::wait(v27))
    {
      AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v28);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v30 = &__p;
      }
      else {
        char v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) stall complete", v29, v30, 1595);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_64;
      }
      std::string v31 = (void *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v28);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v33 = &__p;
      }
      else {
        char v33 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      Ari::Log((Ari *)8, (uint64_t)"(%s:%d) timeout waiting for client to stall", v32, v33, 1590);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      AriHostRt::ClientTransitionTracker::logRemainingClients(v23, &v41);
      if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_64;
      }
      std::string v31 = (void *)v41.__r_.__value_.__r.__words[0];
    }
    operator delete(v31);
LABEL_64:
    v34.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v35 = (v34.__d_.__rep_ - *(void *)(a1 + 64)) / 1000;
    std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v36 = *(unsigned int *)(a1 + 76);
    if (v35 >= v36) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = (v36 - v35);
    }
    AriHostRt::commitLPM((AriHostRt *)v34.__d_.__rep_, v37);
    if (v43) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v43);
    }
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    if (v49) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v49);
    }
  }
  AriOsa::LogSrcInfo((uint64_t *)&__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke", v11);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    float v39 = &__p;
  }
  else {
    float v39 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (*(_DWORD *)(a1 + 80) == 1) {
    BOOL v40 = "enter";
  }
  else {
    BOOL v40 = "exit";
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Completed %s LPM", v38, v39, 1604, v40);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v53) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v53);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  if (v59) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v59);
  }
}

void sub_230AC8D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,std::__shared_weak_count *a50)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (a50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a50);
  }
  if (v50) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v50);
  }
  uint64_t v53 = *(std::__shared_weak_count **)(v51 - 176);
  if (v53) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v53);
  }
  _Unwind_Resume(exception_object);
}

void sub_230AC8E14()
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(v0 - 136));
  JUMPOUT(0x230AC8E00);
}

void sub_230AC8E24()
{
  if (*(char *)(v0 - 185) < 0) {
    operator delete(*(void **)(v0 - 208));
  }
  JUMPOUT(0x230AC8E0CLL);
}

void *___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_4(uint64_t a1)
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32) + 33032;
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  v4[0] = &unk_26E554F60;
  v4[1] = a1 + 40;
  v4[2] = v2;
  v4[3] = v4;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v1, (uint64_t)v4);
  return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v4);
}

void sub_230AC8ED8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *___ZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sj_block_invoke_2_144(uint64_t a1, uint64_t a2, const char *a3)
{
  v10[4] = *MEMORY[0x263EF8340];
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SetOPMode_block_invoke_2", a3);
  if (v9 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to stall (LPM enter)", v4, v5, 1582);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = *(void *)(a1 + 32) + 33032;
  v10[0] = &unk_26E555060;
  v10[1] = a1 + 40;
  v10[3] = v10;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v6, (uint64_t)v10);
  return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v10);
}

void sub_230AC8FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17)
{
}

void __copy_helper_block_e8_32c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 32), *(void *)(a2 + 40));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 32);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 48);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_e8_32c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
}

uint64_t AriHostRt::RegisterBasebandResetDelegate(AriHostRt *a1)
{
  v6[4] = *MEMORY[0x263EF8340];
  Instance = (AriHostRt *)AriHostRt::GetInstance(a1);
  if (AriHostRt::Init(Instance)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = qword_26AB7A300;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1174405120;
  v5[2] = ___ZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEE_block_invoke;
  void v5[3] = &__block_descriptor_tmp_153;
  v5[4] = &AriHostRt::GetInstance(void)::instance;
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100]((uint64_t)v6, (uint64_t)a1);
  dispatch_sync(v4, v5);
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](v6);
  return 0;
}

void *___ZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEE_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100]((uint64_t)v6, a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100]((uint64_t)v7, (uint64_t)v6);
  long long v3 = operator new(0x28uLL);
  *long long v3 = &unk_26E5550E0;
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100]((uint64_t)(v3 + 1), (uint64_t)v7);
  uint64_t v4 = (void *)(v2 + 33488);
  char v9 = v3;
  if (v4 != v8)
  {
    if ((void *)v4[3] == v4)
    {
      (*(void (**)(void *, void *))(*v4 + 24))(v4, v8);
      (*(void (**)(void))(*(void *)v4[3] + 32))(v4[3]);
      v4[3] = v9;
      char v9 = v8;
    }
    else
    {
      char v9 = (void *)v4[3];
      v4[3] = v3;
    }
  }
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](v8);
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](v7);
  return std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](v6);
}

void sub_230AC9288(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_e8_40c120_ZTSNSt3__18functionIFvN9AriHostRt20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100](a1 + 40, a2 + 40);
}

void *__destroy_helper_block_e8_40c120_ZTSNSt3__18functionIFvN9AriHostRt20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEE(uint64_t a1)
{
  return std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100]((void *)(a1 + 40));
}

uint64_t AriHostRt::ProcessClientError(AriHostRt *a1, uint64_t a2, uint64_t a3)
{
  Instance = (AriHostRt *)AriHostRt::GetInstance(a1);
  if (AriHostRt::Init(Instance)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = qword_26AB7A300;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1174405120;
  v7[2] = ___ZN9AriHostRt18ProcessClientErrorEi21ARI_CLIENT_ERROR_TYPENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE_block_invoke;
  void v7[3] = &__block_descriptor_tmp_154;
  void v7[4] = &AriHostRt::GetInstance(void)::instance;
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  dispatch_async(v6, v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return 0;
}

void ___ZN9AriHostRt18ProcessClientErrorEi21ARI_CLIENT_ERROR_TYPENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(*(void *)(a1 + 32) + 33512);
  uint64_t v3 = *v2;
  if (*v2)
  {
    if (*(char *)(a1 + 63) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 40), *(void *)(a1 + 48));
      uint64_t v3 = *v2;
    }
    else
    {
      std::string __p = *(std::string *)(a1 + 40);
    }
    std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(v3, 3, (uint64_t)&__p, 0, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_230AC944C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_e8_40c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

uint64_t ___ZN9AriHostRt24SendSensitiveLoggingInfoEv_block_invoke(uint64_t a1)
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v19 = v2;
  long long v20 = v2;
  unint64_t v21 = 0xAAAAAAAAFFFFFFFFLL;
  SdkGmidListSensitiveLogging();
  if (*((void *)&v20 + 1) >= 0x1F5uLL) {
    __assert_rtn("SendSensitiveLoggingInfo_block_invoke", "ari_host_rt.cpp", 1670, "gmidList.size() <= ARI_MSG_SET_MAX");
  }
  bzero(v17, 0x7D4uLL);
  uint64_t v16 = 0x900000001;
  int v18 = 0x7FFFFFFF;
  uint64_t v5 = (uint64_t *)v20;
  if ((void)v20)
  {
    int v6 = 0;
    do
    {
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SendSensitiveLoggingInfo_block_invoke", v4);
      if (v15 >= 0) {
        uint64_t v8 = __p;
      }
      else {
        uint64_t v8 = (void **)__p[0];
      }
      uint64_t v3 = Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Updating sensitive logging gmid: 0x%x", v7, v8, 1680, *((unsigned int *)v5 + 4));
      if (v15 < 0) {
        operator delete(__p[0]);
      }
      __int16 v9 = v6 + 1;
      *(_DWORD *)&v17[2 * (unsigned __int16)v6] = *((_DWORD *)v5 + 4);
      uint64_t v5 = (uint64_t *)*v5;
      ++v6;
    }
    while (v5);
  }
  else
  {
    __int16 v9 = 0;
  }
  v17[1000] = v9;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = AriHostRt::setGroupMsgAttrib_nl(v3, (unsigned __int16 *)&v16, v4);
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "SendSensitiveLoggingInfo_block_invoke", v10);
    if (v15 >= 0) {
      unint64_t v12 = __p;
    }
    else {
      unint64_t v12 = (void **)__p[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to send the sensitive logging info", v11, v12, 1688);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }
  return std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v19);
}

void sub_230AC9684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table(v17 - 128);
  _Unwind_Resume(a1);
}

void AriHostRt::DumpState(AriHostRt *this)
{
  v23[4] = *MEMORY[0x263EF8340];
  AriHostRt::GetInstance(this);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN9AriHostRt9DumpStateEv_block_invoke;
  block[3] = &__block_descriptor_tmp_165;
  void block[4] = &AriHostRt::GetInstance(void)::instance;
  dispatch_sync((dispatch_queue_t)qword_26AB7A300, block);
  unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v21 = (std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL;
  std::string::basic_string[abi:ne180100]<0>(&__p, "dumptracker");
  AriDispatch::Semaphore::Create();
  if (v19 < 0) {
    operator delete(__p);
  }
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = v20;
  uint64_t v1 = v21;
  if (v21) {
    atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v23[0] = &unk_26E555270;
  v23[1] = v2;
  v23[2] = v1;
  v23[3] = v23;
  std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(&v16, (uint64_t)v23);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v23);
  uint64_t v4 = (AriHostRt::ClientTransitionTracker *)v16;
  uint64_t v3 = (std::__shared_weak_count *)v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = (std::__shared_weak_count *)qword_26AB82598;
  qword_26AB82590 = (uint64_t)v4;
  qword_26AB82598 = (uint64_t)v3;
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  int v6 = qword_26AB7A300;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1174405120;
  v14[2] = ___ZN9AriHostRt9DumpStateEv_block_invoke_2;
  v14[3] = &__block_descriptor_tmp_170;
  void v14[4] = &AriHostRt::GetInstance(void)::instance;
  void v14[5] = v4;
  char v15 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(v6, v14);
  int v7 = (AriDispatch::Semaphore *)v20;
  dispatch_walltime(0, 250000000);
  if ((AriDispatch::Semaphore::wait(v7) & 1) == 0)
  {
    AriOsa::LogSrcInfo((uint64_t *)v12, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState", v8);
    if (v13 >= 0) {
      uint64_t v10 = v12;
    }
    else {
      uint64_t v10 = (void **)v12[0];
    }
    Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Some clients did not dump state", v9, v10, 1750);
    if (v13 < 0) {
      operator delete(v12[0]);
    }
    AriHostRt::ClientTransitionTracker::logRemainingClients(v4, &v11);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
}

void sub_230AC9950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a26);
  }
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  uint64_t v37 = *(std::__shared_weak_count **)(v35 - 120);
  if (v37) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v37);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN9AriHostRt9DumpStateEv_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  v41[4] = *MEMORY[0x263EF8340];
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke", a3);
  if (v39 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Client Resources:", v3, v4, 1700);
  uint64_t v5 = a1;
  if (v39 < 0)
  {
    operator delete(__p[0]);
    uint64_t v5 = a1;
  }
  uint64_t v6 = *(void *)(v5 + 32) + 33032;
  v41[0] = &unk_26E555170;
  v41[3] = v41;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v6, (uint64_t)v41);
  std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v41);
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke", v7);
  if (v39 >= 0) {
    __int16 v9 = __p;
  }
  else {
    __int16 v9 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Indication Resources:", v8, v9, 1705);
  uint64_t v10 = a1;
  if (v39 < 0)
  {
    operator delete(__p[0]);
    uint64_t v10 = a1;
  }
  uint64_t v11 = *(void *)(v10 + 32) + 33176;
  v40[0] = &unk_26E5551F0;
  v40[3] = v40;
  ResMgr<std::list<std::shared_ptr<Ari::AriClientProxy>>>::doForEach(v11, (uint64_t)v40);
  std::__function::__value_func<void ()(int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](v40);
  if (*(void *)(*(void *)(v10 + 32) + 33344))
  {
    AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke", v12);
    if (v39 >= 0) {
      uint64_t v14 = __p;
    }
    else {
      uint64_t v14 = (void **)__p[0];
    }
    Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Transaction In-Flight:", v13, v14, 1716);
    uint64_t v15 = a1;
    if (v39 < 0)
    {
      operator delete(__p[0]);
      uint64_t v15 = a1;
    }
    for (uint64_t i = *(uint64_t **)(*(void *)(v15 + 32) + 33336); i; uint64_t i = (uint64_t *)*i)
    {
      unint64_t v17 = i + 3;
      unsigned int BufGmid = AriMsg::GetBufGmid(**(AriMsg ***)(i[3] + 16), (const unsigned __int8 *)(*(void *)(*(void *)(i[3] + 16) + 8) - **(void **)(i[3] + 16)));
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke", v19);
      if (v39 >= 0) {
        unint64_t v20 = __p;
      }
      else {
        unint64_t v20 = (void **)__p[0];
      }
      uint64_t v21 = *((unsigned int *)i + 4);
      uint64_t v22 = *(unsigned int **)(*v17 + 32);
      char v23 = *(std::__shared_weak_count **)(*v17 + 40);
      if (v23)
      {
        char v24 = 1;
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v25 = i[3];
        int v26 = *(unsigned int **)(v25 + 32);
        unint64_t v27 = *(std::__shared_weak_count **)(v25 + 40);
        uint64_t v28 = v22[2];
        if (v27)
        {
          char v24 = 0;
          atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v22 = v26;
      }
      else
      {
        unint64_t v27 = 0;
        uint64_t v28 = v22[2];
        char v24 = 1;
      }
      uint64_t v29 = (*(uint64_t (**)(unsigned int *))(*(void *)v22 + 16))(v22);
      if (*(char *)(v29 + 23) >= 0) {
        uint64_t v31 = v29;
      }
      else {
        uint64_t v31 = *(void *)v29;
      }
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Transaction ID: 0x%x, GMID: (%d-0x%x), Client ID: 0x%x(%s)", v30, v20, 1720, v21, BufGmid >> 26, (BufGmid >> 15) & 0x3FF, v28, v31);
      if ((v24 & 1) == 0) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }
      if (v23) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v23);
      }
      if (v39 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke", v12);
  if (v39 >= 0) {
    char v33 = __p;
  }
  else {
    char v33 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) XPC resources:", v32, v33, 1727);
  uint64_t v36 = a1;
  if (v39 < 0)
  {
    operator delete(__p[0]);
    uint64_t v36 = a1;
  }
  Ari::AriXpcServer::dumpState(*(Ari::AriXpcServer **)(*(void *)(v36 + 32) + 40), v34, v35);
}

void sub_230AC9D8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *___ZN9AriHostRt9DumpStateEv_block_invoke_2(uint64_t a1, uint64_t a2, const char *a3)
{
  v10[4] = *MEMORY[0x263EF8340];
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "DumpState_block_invoke_2", a3);
  if (v9 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) notifying for all clients to DumpState", v4, v5, 1742);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = *(void *)(a1 + 32) + 33032;
  v10[0] = &unk_26E5552F0;
  v10[1] = a1 + 40;
  v10[3] = v10;
  ResMgr<std::shared_ptr<Ari::AriClientProxy>>::doForEach(v6, (uint64_t)v10);
  return std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](v10);
}

void sub_230AC9EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17)
{
}

const char *asString(int a1)
{
  if ((a1 - 1) > 2) {
    return "unknown";
  }
  else {
    return (&off_264BA1D10)[a1 - 1];
  }
}

uint64_t AriRuntimeNotifyAck(AriHostRt *a1, uint64_t a2, int a3)
{
  return 0;
}

uint64_t AriRuntimeReportError(AriHostRt *a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  uint64_t v3 = AriHostRt::ProcessClientError(a1, a2, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v3;
}

void sub_230AC9FF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void *std::__function::__value_func<BOOL ()(void *)>::~__value_func[abi:ne180100](void *a1)
{
  unint64_t v2 = (void *)a1[3];
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

void std::__shared_ptr_emplace<AriHostRt::RtTransaction>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554930;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AriHostRt::RtTransaction>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554930;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x230FC6BB0);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>::operator()[abi:ne180100](char a1, void *__p)
{
  if (a1)
  {
    uint64_t v3 = (std::__shared_weak_count *)__p[4];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = (std::__shared_weak_count *)v2[4];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  unint64_t v2 = (void *)a1[3];
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

void *std::allocate_shared[abi:ne180100]<AriHostRt::ClientTransitionTracker,std::allocator<AriHostRt::ClientTransitionTracker>,std::function<void ()(void)> &,void>(void *a1, uint64_t a2)
{
  void v6[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = operator new(0xA0uLL);
  v4[1] = 0;
  v4[2] = 0;
  *uint64_t v4 = &unk_26E554980;
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v6, a2);
  AriHostRt::ClientTransitionTracker::ClientTransitionTracker((uint64_t)(v4 + 3), (uint64_t)v6);
  uint64_t result = std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v6);
  *a1 = v4 + 3;
  a1[1] = v4;
  return result;
}

void sub_230ACA3E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v4);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<AriHostRt::ClientTransitionTracker>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554980;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<AriHostRt::ClientTransitionTracker>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554980;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x230FC6BB0);
}

uint64_t std::__shared_ptr_emplace<AriHostRt::ClientTransitionTracker>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = a1 + 24;
  std::mutex::~mutex((std::mutex *)(a1 + 96));
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(a1 + 64));

  return std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::~__hash_table(v2);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<Ari::AriClientProxy>>>>::erase(void *a1, uint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  uint64_t v4 = *a2;
  unint64_t v3 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  uint64_t v6 = *(uint64_t **)(*a1 + 8 * v3);
  do
  {
    int v7 = v6;
    uint64_t v6 = (uint64_t *)*v6;
  }
  while (v6 != a2);
  if (v7 != a1 + 2)
  {
    unint64_t v8 = v7[1];
    if (v5.u32[0] > 1uLL)
    {
      if (v8 >= *(void *)&v2) {
        v8 %= *(void *)&v2;
      }
    }
    else
    {
      v8 &= *(void *)&v2 - 1;
    }
    uint64_t v9 = *a2;
    if (v8 == v3)
    {
LABEL_20:
      if (!v9) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
  }
  if (!v4) {
    goto LABEL_19;
  }
  unint64_t v10 = *(void *)(v4 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(void *)&v2) {
      v10 %= *(void *)&v2;
    }
  }
  else
  {
    v10 &= *(void *)&v2 - 1;
  }
  uint64_t v9 = *a2;
  if (v10 != v3)
  {
LABEL_19:
    *(void *)(*a1 + 8 * v3) = 0;
    uint64_t v9 = *a2;
    goto LABEL_20;
  }
LABEL_21:
  unint64_t v11 = *(void *)(v9 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v11 >= *(void *)&v2) {
      v11 %= *(void *)&v2;
    }
  }
  else
  {
    v11 &= *(void *)&v2 - 1;
  }
  if (v11 != v3)
  {
    *(void *)(*a1 + 8 * v11) = v7;
    uint64_t v9 = *a2;
  }
LABEL_27:
  *int v7 = v9;
  *a2 = 0;
  --a1[3];
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,void *>>>::operator()[abi:ne180100](1, a2);
  return v4;
}

void std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::~__func()
{
}

void *std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E5549D0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E5549D0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::operator()(uint64_t a1, unsigned int *a2, unsigned int *a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t))(a1 + 8))(*a2, *a3, a4);
}

uint64_t std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &),std::allocator<void (*)(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>,void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::target_type()
{
}

void *std::__function::__value_func<void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](void *a1)
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

void IDMgr::~IDMgr(IDMgr *this)
{
}

void std::__tree<IDMgr::Range>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<IDMgr::Range>::destroy(*a1);
    std::__tree<IDMgr::Range>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__deallocate_node(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__deallocate_node(void *__p)
{
  if (__p)
  {
    uint64_t v1 = __p;
    do
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (std::__shared_weak_count *)v1[5];
      if (v3) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      }
      operator delete(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

void *std::__function::__value_func<void ()(int,unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__deallocate_node(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>>>::__deallocate_node(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    do
    {
      uint64_t v2 = (void *)*v1;
      std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v1 + 4);
      operator delete(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

uint64_t ResMgr<std::shared_ptr<Ari::AriClientProxy>>::~ResMgr(uint64_t a1, dispatch_semaphore_s *a2)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__deallocate_node(*(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v3 = *(void *)(a1 + 8);
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  }
  uint8x8_t v5 = *(AriOsa **)(a1 + 96);
  if (v5) {
    AriOsa::OsMutexFree(v5, a2);
  }
  std::__function::__value_func<void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100]((void *)(a1 + 112));
  std::__tree<IDMgr::Range>::destroy(*(void **)(a1 + 80));
  std::__tree<IDMgr::Range>::destroy(*(void **)(a1 + 56));

  return std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::~__hash_table(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__deallocate_node(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__deallocate_node(void *__p)
{
  if (__p)
  {
    uint64_t v1 = __p;
    do
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (std::__shared_weak_count *)v1[4];
      if (v3) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v3);
      }
      operator delete(v1);
      uint64_t v1 = v2;
    }
    while (v2);
  }
}

void *std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](void *a1)
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

void std::__shared_ptr_emplace<Ari::AriClientGcdProxy>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554A80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriClientGcdProxy>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554A80;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x230FC6BB0);
}

uint64_t std::__shared_ptr_emplace<Ari::AriClientGcdProxy>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t std::function<void ()(int,unsigned int,std::shared_ptr<Ari::AriClientProxy> &)>::operator()(uint64_t a1, int a2, int a3)
{
  int v5 = a2;
  int v4 = a3;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *, int *))(*(void *)a1 + 48))(a1, &v5, &v4);
}

void *std::__hash_table<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t *a1, int a2, _DWORD *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a1[1];
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = a2;
      if (v6 <= a2) {
        unint64_t v8 = a2 % v6;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & a2;
    }
    uint64_t v9 = *(void ***)(*a1 + 8 * v8);
    if (v9)
    {
      unint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2) {
              return v10;
            }
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v11 >= v6) {
                v11 %= v6;
              }
            }
            else
            {
              v11 &= v6 - 1;
            }
            if (v11 != v8) {
              break;
            }
          }
          unint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  }
  unint64_t v12 = a1 + 2;
  unint64_t v10 = operator new(0x30uLL);
  *unint64_t v10 = 0;
  v10[1] = v5;
  *((_DWORD *)v10 + 4) = *a3;
  *((_DWORD *)v10 + 6) = 0;
  v10[4] = 0;
  void v10[5] = 0;
  float v13 = (float)(unint64_t)(a1[3] + 1);
  float v14 = *((float *)a1 + 8);
  if (!v6 || (float)(v14 * (float)v6) < v13)
  {
    BOOL v15 = 1;
    if (v6 >= 3) {
      BOOL v15 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v6);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      int8x8_t prime = (int8x8_t)v17;
    }
    else {
      int8x8_t prime = (int8x8_t)v16;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = a1[1];
    }
    if (*(void *)&prime > v6) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v6)
    {
      unint64_t v25 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v6 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
      {
        unint64_t v25 = std::__next_prime(v25);
      }
      else
      {
        uint64_t v27 = 1 << -(char)__clz(v25 - 1);
        if (v25 >= 2) {
          unint64_t v25 = v27;
        }
      }
      if (*(void *)&prime <= v25) {
        int8x8_t prime = (int8x8_t)v25;
      }
      if (*(void *)&prime >= v6)
      {
        unint64_t v6 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          char v19 = operator new(8 * *(void *)&prime);
          unint64_t v20 = (void *)*a1;
          *a1 = (uint64_t)v19;
          if (v20) {
            operator delete(v20);
          }
          uint64_t v21 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v21++) = 0;
          while (*(void *)&prime != v21);
          uint64_t v22 = (void *)*v12;
          if (*v12)
          {
            unint64_t v23 = v22[1];
            uint8x8_t v24 = (uint8x8_t)vcnt_s8(prime);
            v24.i16[0] = vaddlv_u8(v24);
            if (v24.u32[0] > 1uLL)
            {
              if (v23 >= *(void *)&prime) {
                v23 %= *(void *)&prime;
              }
            }
            else
            {
              v23 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v23) = v12;
            uint64_t v28 = (void *)*v22;
            if (*v22)
            {
              do
              {
                unint64_t v29 = v28[1];
                if (v24.u32[0] > 1uLL)
                {
                  if (v29 >= *(void *)&prime) {
                    v29 %= *(void *)&prime;
                  }
                }
                else
                {
                  v29 &= *(void *)&prime - 1;
                }
                if (v29 != v23)
                {
                  if (!*(void *)(*a1 + 8 * v29))
                  {
                    *(void *)(*a1 + 8 * v29) = v22;
                    goto LABEL_55;
                  }
                  *uint64_t v22 = *v28;
                  *uint64_t v28 = **(void **)(*a1 + 8 * v29);
                  **(void **)(*a1 + 8 * v29) = v28;
                  uint64_t v28 = v22;
                }
                unint64_t v29 = v23;
LABEL_55:
                uint64_t v22 = v28;
                uint64_t v28 = (void *)*v28;
                unint64_t v23 = v29;
              }
              while (v28);
            }
          }
          unint64_t v6 = (unint64_t)prime;
          goto LABEL_59;
        }
        uint64_t v34 = (void *)*a1;
        *a1 = 0;
        if (v34) {
          operator delete(v34);
        }
        unint64_t v6 = 0;
        a1[1] = 0;
      }
    }
LABEL_59:
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v6 <= v5) {
        unint64_t v8 = v5 % v6;
      }
      else {
        unint64_t v8 = v5;
      }
    }
    else
    {
      unint64_t v8 = (v6 - 1) & v5;
    }
  }
  uint64_t v30 = *a1;
  uint64_t v31 = *(void **)(*a1 + 8 * v8);
  if (v31)
  {
    *unint64_t v10 = *v31;
LABEL_72:
    void *v31 = v10;
    goto LABEL_73;
  }
  *unint64_t v10 = *v12;
  void *v12 = v10;
  *(void *)(v30 + 8 * v8) = v12;
  if (*v10)
  {
    unint64_t v32 = *(void *)(*v10 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v32 >= v6) {
        v32 %= v6;
      }
    }
    else
    {
      v32 &= v6 - 1;
    }
    uint64_t v31 = (void *)(*a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return v10;
}

void sub_230ACB00C(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::shared_ptr<Ari::AriClientProxy>>>,void *>>>::operator()[abi:ne180100](char a1, void *__p)
{
  if (a1)
  {
    uint64_t v3 = (std::__shared_weak_count *)__p[5];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void std::__shared_ptr_emplace<Ari::AriClientXpcProxy>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554AD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Ari::AriClientXpcProxy>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E554AD0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x230FC6BB0);
}

uint64_t std::__shared_ptr_emplace<Ari::AriClientXpcProxy>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEED0Ev()
{
}

_DWORD *_ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEv(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  *(void *)uint64_t result = &unk_26E554B20;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26E554B20;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEEclEOiSD_(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  int v3 = *(_DWORD *)(a1 + 8);
  v16[0] = (uint64_t)v16;
  v16[1] = (uint64_t)v16;
  uint64_t v17 = 0;
  int v4 = (uint64_t *)a3[1];
  if (v4 == a3)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 0;
    uint64_t v7 = a3[2];
    do
    {
      unint64_t v8 = (uint64_t *)v4[1];
      v6 |= *(_DWORD *)(v4[2] + 8) == v3;
      if (*(_DWORD *)(v4[2] + 8) == v3)
      {
        if (v8 == a3)
        {
          LOBYTE(v9) = 1;
LABEL_9:
          unint64_t v8 = a3;
        }
        else
        {
          while (1)
          {
            BOOL v9 = *(_DWORD *)(v8[2] + 8) == v3;
            v6 |= v9;
            if (*(_DWORD *)(v8[2] + 8) != v3) {
              break;
            }
            unint64_t v8 = (uint64_t *)v8[1];
            if (v8 == a3) {
              goto LABEL_9;
            }
          }
        }
        if (v4 != v8)
        {
          uint64_t v10 = *v8;
          if (v16 != a3)
          {
            uint64_t v11 = 1;
            if ((uint64_t *)v10 != v4)
            {
              unint64_t v12 = v4;
              do
              {
                unint64_t v12 = (uint64_t *)v12[1];
                ++v11;
              }
              while (v12 != (uint64_t *)v10);
            }
            v7 -= v11;
            a3[2] = v7;
            v5 += v11;
            uint64_t v17 = v5;
          }
          uint64_t v13 = *v4;
          *(void *)(v13 + 8) = *(void *)(v10 + 8);
          **(void **)(v10 + 8) = v13;
          uint64_t v14 = v16[0];
          *(void *)(v16[0] + 8) = v4;
          *int v4 = v14;
          v16[0] = v10;
          *(void *)(v10 + 8) = v16;
        }
        if (!v9) {
          unint64_t v8 = (uint64_t *)v8[1];
        }
      }
      int v4 = v8;
    }
    while (v8 != a3);
  }
  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v16);
  return (char)-(char)v6;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt16DeregisterClientEjEUb_E3__0)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt16DeregisterClientEjEUb_E3__0NS_9allocatorIS3_EEFiiRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt16DeregisterClientEjEUb_E3__0;
}

void *std::__function::__value_func<int ()(int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](void *a1)
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

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      unint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v5 = operator new(8 * prime);
  int v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  unint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    uint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *unint64_t v8 = *v14;
          *uint64_t v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          uint64_t v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        unint64_t v8 = v14;
        uint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEED0Ev()
{
}

__n128 _ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEv(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v2 = &unk_26E554BB0;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = result;
  *((void *)v2 + 5) = *(void *)(a1 + 40);
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E554BB0;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  *(_OWORD *)(a2 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEEclEOiSD_(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 8);
  if (v3 != a3)
  {
    int v5 = *a2;
    do
    {
      uint64_t v6 = v3;
      uint64_t v3 = *(void *)(v3 + 8);
    }
    while (v3 != a3);
    if (*(_DWORD *)(*(void *)(v6 + 16) + 8) == *(_DWORD *)(a1 + 8))
    {
      uint64_t v7 = *(unsigned __int16 **)(a1 + 24);
      unint64_t v8 = *(_WORD **)(a1 + 32);
      uint64_t v9 = (unsigned __int16)*v8;
      *unint64_t v8 = v9 + 1;
      *(_DWORD *)&v7[2 * v9 + 4] = (v5 & 0x3FF | ((unsigned __int16)v5 >> 10 << 11)) << 15;
      if ((unsigned __int16)(v9 + 1) == 500)
      {
        v7[1004] = 500;
        if (AriHostRt::setGroupMsgAttrib_nl(a1, v7, (const char *)a3))
        {
          AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "operator()", v10);
          if (v15 >= 0) {
            uint8x8_t v12 = __p;
          }
          else {
            uint8x8_t v12 = (void **)__p[0];
          }
          Ari::Log((Ari *)8, (uint64_t)"(%s:%d) Failed to register indications", v11, v12, 857);
          if (v15 < 0) {
            operator delete(__p[0]);
          }
          uint64_t v13 = *(void *)(a1 + 16);
          std::string::basic_string[abi:ne180100]<0>(__p, "Failed to send indication registration");
          std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(*(void *)(v13 + 33512), 3, (uint64_t)__p, 0, 0);
          if (v15 < 0) {
            operator delete(__p[0]);
          }
        }
        bzero((void *)(*(void *)(a1 + 24) + 8), 0x7D0uLL);
        **(_WORD **)(a1 + 32) = 0;
      }
      **(unsigned char **)(a1 + 40) = 1;
    }
  }
}

void sub_230ACB7B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt17RegAllIndicationsEjEUb0_E3__1;
}

void *std::__function::__value_func<void ()(int,std::list<std::shared_ptr<Ari::AriClientProxy>> &)>::~__value_func[abi:ne180100](void *a1)
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

void *std::list<unsigned int>::list(void *a1, uint64_t a2)
{
  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 != a2)
  {
    uint64_t v5 = 1;
    uint64_t v6 = a1;
    do
    {
      uint64_t v7 = operator new(0x18uLL);
      void v7[4] = *(_DWORD *)(v3 + 16);
      *(void *)uint64_t v7 = v6;
      *((void *)v7 + 1) = a1;
      *((void *)v6 + 1) = v7;
      *a1 = v7;
      a1[2] = v5;
      uint64_t v3 = *(void *)(v3 + 8);
      ++v5;
      uint64_t v6 = v7;
    }
    while (v3 != a2);
  }
  return a1;
}

void sub_230ACB930(_Unwind_Exception *a1)
{
  std::__list_imp<unsigned int>::clear(v1);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::pair<unsigned int,std::list<std::shared_ptr<Ari::AriClientProxy>>>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v1 + 4);
    }
    operator delete(v1);
  }
}

uint64_t *std::list<std::shared_ptr<Ari::AriClientProxy>>::list(uint64_t *a1, void *a2)
{
  *a1 = (uint64_t)a1;
  a1[1] = (uint64_t)a1;
  a1[2] = 0;
  for (uint64_t i = a2; ; std::list<std::shared_ptr<Ari::AriClientProxy>>::push_back(a1, i[2], i[3]))
  {
    uint64_t i = (void *)i[1];
    if (i == a2) {
      break;
    }
  }
  return a1;
}

void sub_230ACB9F4(_Unwind_Exception *a1)
{
  std::__list_imp<std::shared_ptr<Ari::AriClientProxy>>::clear(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__func()
{
}

void *std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26E554C40;
  return result;
}

void std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26E554C40;
}

void std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t, void))(*(void *)v2 + 48))(v2, 1, 0);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_230ACBB00(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<AriHostRt::processStartEvent_nl(void)::$_0,std::allocator<AriHostRt::processStartEvent_nl(void)::$_0>,void ()(std::shared_ptr<Ari::AriClientProxy> &)>::target_type()
{
}

void *std::__function::__value_func<void ()(std::shared_ptr<Ari::AriClientProxy> &)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26E554CD0;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26E554CD0;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x230FC6BB0);
}

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26E554CD0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26E554CD0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_0,std::allocator<AriHostRt::CancelAllTransactions(void)::$_0>,void ()(void)>::target_type()
{
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E554D60;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E554D60;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
  }
  v5[0] = v2;
  v5[1] = v3;
  AriHostRt::ClientTransitionTracker::trackClient(v4, v5, (const char *)2);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_230ACBEF4(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb2_E3__5;
}

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26E554DE0;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26E554DE0;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x230FC6BB0);
}

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26E554DE0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26E554DE0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::operator()(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<AriHostRt::CancelAllTransactions(void)::$_1,std::allocator<AriHostRt::CancelAllTransactions(void)::$_1>,void ()(void)>::target_type()
{
}

void std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::shared_ptr<AriHostRt::RtTransaction>>>>::__deallocate_node(*(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  }
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E554E60;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E554E60;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
  }
  v5[0] = v2;
  v5[1] = v3;
  AriHostRt::ClientTransitionTracker::trackClient(v4, v5, (const char *)8);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_230ACC2C4(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt21CancelAllTransactionsEvEUb3_E3__7;
}

void *_ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEED1Ev(void *a1)
{
  *a1 = &unk_26E554EE0;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEED0Ev(void *a1)
{
  *a1 = &unk_26E554EE0;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x230FC6BB0);
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE7__cloneEv(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26E554EE0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE7__cloneEPNS0_6__baseIS9_EE(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26E554EE0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE7destroyEv(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE18destroy_deallocateEv(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEEclEv(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8NS_9allocatorIS6_EEFvvEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E3__8;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
}

__n128 _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26E554F60;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E554F60;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESD_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
  }
  v5[0] = v2;
  v5[1] = v3;
  AriHostRt::ClientTransitionTracker::trackClient(v4, v5, (const char *)*(unsigned int *)(a1 + 16));
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_230ACC648(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb5_E3__9;
}

void *_ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEED1Ev(void *a1)
{
  *a1 = &unk_26E554FE0;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEED0Ev(void *a1)
{
  *a1 = &unk_26E554FE0;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x230FC6BB0);
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE7__cloneEv(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26E554FE0;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE7__cloneEPNS0_6__baseIS9_EE(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26E554FE0;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE7destroyEv(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE18destroy_deallocateEv(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

uint64_t _ZNSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEEclEv(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10NS_9allocatorIS6_EEFvvEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_E4__10;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
}

void *_ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E555060;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E555060;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESD_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
  }
  v5[0] = v2;
  v5[1] = v3;
  AriHostRt::ClientTransitionTracker::trackClient(v4, v5, (const char *)5);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_230ACC9C0(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZZN9AriHostRt9SetOPModeENS2_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11NS_9allocatorIS6_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZZN9AriHostRt9SetOPModeENS_11ARI_OP_MODEEP16dispatch_group_sjEUb4_EUb6_E4__11;
}

uint64_t std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + MEMORY[0x230FC6810](1, "1", "/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_sdk_msg_null.cpp", 24) = 0;
  }
  return a1;
}

void *_ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_ED1Ev(void *a1)
{
  *a1 = &unk_26E5550E0;
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](a1 + 1);
  return a1;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_ED0Ev(void *a1)
{
  *a1 = &unk_26E5550E0;
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](a1 + 1);

  JUMPOUT(0x230FC6BB0);
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E7__cloneEv(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x28uLL);
  void *v2 = &unk_26E5550E0;
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100]((uint64_t)(v2 + 1), v1);
  return v2;
}

void sub_230ACCBC0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E7__cloneEPNS0_6__baseISB_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E5550E0;
  return std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::__value_func[abi:ne180100]((uint64_t)(a2 + 1), a1 + 8);
}

void *_ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E7destroyEv(uint64_t a1)
{
  return std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100]((void *)(a1 + 8));
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E18destroy_deallocateEv(void *a1)
{
  std::__function::__value_func<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::~__value_func[abi:ne180100](a1 + 1);

  operator delete(a1);
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_EclEOS4_OSA_OiOj(uint64_t *a1, int *a2, uint64_t a3, int *a4, int *a5)
{
  int v6 = *a2;
  uint64_t v7 = *(std::string::value_type **)a3;
  std::string::size_type v8 = *(void *)(a3 + 8);
  *(_DWORD *)uint8x8_t v12 = *(_DWORD *)(a3 + 16);
  *(_DWORD *)&v12[3] = *(_DWORD *)(a3 + 19);
  int v9 = *(char *)(a3 + 23);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  int v10 = *a4;
  int v11 = *a5;
  AriHostRt::GetInstance((AriHostRt *)a1);
  if (!byte_26AB7A2ED)
  {
    if (v9 < 0)
    {
      std::string::__init_copy_ctor_external(&v13, v7, v8);
    }
    else
    {
      v13.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
      v13.__r_.__value_.__l.__size_ = v8;
      LODWORD(v13.__r_.__value_.__r.__words[2]) = *(_DWORD *)v12;
      *(_DWORD *)((char *)&v13.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)&v12[3];
      *((unsigned char *)&v13.__r_.__value_.__s + 23) = v9;
    }
    std::function<void ()(AriHostRt::ARI_CLIENT_ERROR_EVT,std::string,int,unsigned int)>::operator()(a1[4], v6, (uint64_t)&v13, v10, v11);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
  }
  byte_26AB7A2ED = 1;
  if (v9 < 0) {
    operator delete(v7);
  }
}

void sub_230ACCD2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEEEUb7_E4__12))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt29RegisterBasebandResetDelegateENS_8functionIFvNS2_20ARI_CLIENT_ERROR_EVTENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEijEEEEUb7_E4__12NS8_ISD_EESB_E11target_typeEv()
{
  return &_ZTIZZN9AriHostRt29RegisterBasebandResetDelegateENSt3__18functionIFvNS_20ARI_CLIENT_ERROR_EVTENS0_12basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEEijEEEEUb7_E4__12;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26E555170;
  return result;
}

void _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E555170;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4 = *(unsigned int **)a2;
  uint64_t v3 = *(std::__shared_weak_count **)(a2 + 8);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "operator()", a3);
  int v5 = v13;
  int v6 = (void **)__p[0];
  uint64_t v7 = v4[2];
  uint64_t v8 = (*(uint64_t (**)(unsigned int *))(*(void *)v4 + 16))(v4);
  int v10 = __p;
  if (v5 < 0) {
    int v10 = v6;
  }
  if (*(char *)(v8 + 23) >= 0) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = *(void *)v8;
  }
  Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Client ID: 0x%x(%s)", v9, v10, 1702, v7, v11);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_230ACCF08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__13)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__13NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__13;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEED0Ev()
{
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEv()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26E5551F0;
  return result;
}

void _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE7__cloneEPNS0_6__baseISE_EE(uint64_t a1, void *a2)
{
  *a2 = &unk_26E5551F0;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEEclEOiSD_(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a3 + 8);
  if (v3 != (void *)a3)
  {
    uint64_t v5 = *a2 & 0x3FF;
    uint64_t v6 = (unsigned __int16)*a2 >> 10;
    while (1)
    {
      uint64_t v8 = (unsigned int *)v3[2];
      uint64_t v7 = (std::__shared_weak_count *)v3[3];
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      AriOsa::LogSrcInfo((uint64_t *)__p, (AriOsa *)"/Library/Caches/com.apple.xbs/Sources/AppleRemoteInvocation/ari_host/src/ari_host_rt.cpp", "operator()", (const char *)a3);
      int v9 = v17;
      int v10 = (void **)__p[0];
      uint64_t v11 = v8[2];
      uint64_t v12 = (*(uint64_t (**)(unsigned int *))(*(void *)v8 + 16))(v8);
      uint64_t v14 = __p;
      if (v9 < 0) {
        uint64_t v14 = v10;
      }
      uint64_t v15 = *(char *)(v12 + 23) >= 0 ? v12 : *(void *)v12;
      Ari::Log((Ari *)0x20, (uint64_t)"(%s:%d) Indication ID: (%d-0x%x), Client ID or Actor ID: 0x%x(%s)", v13, v14, 1710, v6, v5, v11, v15);
      if (v17 < 0) {
        break;
      }
      if (v7) {
        goto LABEL_12;
      }
LABEL_13:
      uint64_t v3 = (void *)v3[1];
      if (v3 == (void *)a3) {
        return;
      }
    }
    operator delete(__p[0]);
    if (!v7) {
      goto LABEL_13;
    }
LABEL_12:
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    goto LABEL_13;
  }
}

void sub_230ACD130(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__14)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb8_E4__14NS_9allocatorIS3_EEFviRNS_4listINS_10shared_ptrIN3Ari14AriClientProxyEEENS4_ISA_EEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9DumpStateEvEUb8_E4__14;
}

void *std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26E555270;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::~__func(void *a1)
{
  *a1 = &unk_26E555270;
  uint64_t v1 = (std::__shared_weak_count *)a1[2];
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }

  JUMPOUT(0x230FC6BB0);
}

void *std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_26E555270;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v3 = *(void *)(result + 8);
  uint64_t v2 = *(void *)(result + 16);
  *a2 = &unk_26E555270;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 16);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  operator delete(__p);
}

uint64_t std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::operator()(uint64_t a1)
{
  return AriDispatch::Semaphore::signal(*(AriDispatch::Semaphore **)(a1 + 8));
}

uint64_t std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<AriHostRt::DumpState(void)::$_0,std::allocator<AriHostRt::DumpState(void)::$_0>,void ()(void)>::target_type()
{
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEED0Ev()
{
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEv(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E5552F0;
  result[1] = v3;
  return result;
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE7__cloneEPNS0_6__baseISB_EE(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E5552F0;
  a2[1] = v2;
  return result;
}

void _ZNSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEEclESA_(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = **(uint64_t ***)(a1 + 8);
  }
  v5[0] = v2;
  v5[1] = v3;
  AriHostRt::ClientTransitionTracker::trackClient(v4, v5, (const char *)7);
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void sub_230ACD4B8(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZN9AriHostRt9DumpStateEvEUb9_E4__16)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZN9AriHostRt9DumpStateEvEUb9_E4__16NS_9allocatorIS3_EEFvRNS_10shared_ptrIN3Ari14AriClientProxyEEEEE11target_typeEv()
{
  return &_ZTIZZN9AriHostRt9DumpStateEvEUb9_E4__16;
}

uint64_t _GLOBAL__sub_I_ari_host_rt_cpp()
{
  qword_26AB82600 = 0;
  return __cxa_atexit((void (*)(void *))std::function<BOOL ()(void *)>::~function, &checkerFunction, &dword_230AB7000);
}

uint64_t ARI_AriACK_Extract()
{
  return MEMORY[0x270F8C710]();
}

uint64_t ARI_AriMsgAttribResp_Extract()
{
  return MEMORY[0x270F8C718]();
}

uint64_t ARI_AriNACK_Extract()
{
  return MEMORY[0x270F8C720]();
}

uint64_t ARI_CsiGetCurrentBootStateRspCb_Extract()
{
  return MEMORY[0x270F8C8C8]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B80]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t TelephonyBasebandPCITransportCreate()
{
  return MEMORY[0x270F964F0]();
}

uint64_t TelephonyBasebandPCITransportInitParameters()
{
  return MEMORY[0x270F964F8]();
}

uint64_t TelephonyUtilTransportFree()
{
  return MEMORY[0x270F97228]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

uint64_t GetBufDigest(const unsigned __int8 *a1, uint64_t a2, const char *a3)
{
  return MEMORY[0x270F8CAF0](a1, a2, a3);
}

uint64_t make_shared_buffer(const unsigned __int8 *a1)
{
  return MEMORY[0x270F8CAF8](a1);
}

uint64_t AriFramer_HeaderMagicScan(const unsigned __int8 *a1, uint64_t a2, int *a3, unint64_t *a4)
{
  return MEMORY[0x270F8CB00](a1, a2, a3, a4);
}

uint64_t SdkGmidListSensitiveLogging(void)
{
  return MEMORY[0x270F8CB08]();
}

uint64_t asString()
{
  return MEMORY[0x270F8CB20]();
}

{
  return MEMORY[0x270F8CB40]();
}

{
  return MEMORY[0x270F8CB48]();
}

{
  return MEMORY[0x270F8CBB0]();
}

{
  return MEMORY[0x270F8CBC8]();
}

{
  return MEMORY[0x270F8CCA0]();
}

uint64_t asString(void *a1)
{
  return MEMORY[0x270F8CCA8](a1);
}

uint64_t AriDispatch::Timer::set()
{
  return MEMORY[0x270F8CCB0]();
}

uint64_t AriDispatch::Timer::Create(AriDispatch::Timer *this, dispatch_queue_s *a2)
{
  return MEMORY[0x270F8CCB8](this, a2);
}

uint64_t AriDispatch::Timer::cancel(AriDispatch::Timer *this)
{
  return MEMORY[0x270F8CCC0](this);
}

uint64_t AriDispatch::Semaphore::wait(AriDispatch::Semaphore *this)
{
  return MEMORY[0x270F8CCC8](this);
}

uint64_t AriDispatch::Semaphore::Create()
{
  return MEMORY[0x270F8CCD0]();
}

uint64_t AriDispatch::Semaphore::signal(AriDispatch::Semaphore *this)
{
  return MEMORY[0x270F8CCD8](this);
}

uint64_t capabilities::radio::ARITransportTimeout(capabilities::radio *this)
{
  return MEMORY[0x270F96CE8](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x270F96D28](this);
}

uint64_t Ari::GetLogLevels(Ari *this)
{
  return MEMORY[0x270F8CCF0](this);
}

uint64_t Ari::LogTransportBuf()
{
  return MEMORY[0x270F8CCF8]();
}

uint64_t Ari::Log(Ari *this, uint64_t a2, const char *a3, ...)
{
  return MEMORY[0x270F8CD00](this, a2, a3);
}

uint64_t Ari::LogBuf(Ari *this, const char *a2, const char *a3, uint64_t a4, const void *a5)
{
  return MEMORY[0x270F8CD08](this, a2, a3, a4, a5);
}

uint64_t Ari::SWTrap(Ari *this, uint64_t a2, const char *a3, const char *a4)
{
  return MEMORY[0x270F8CD10](this, a2, a3, a4);
}

uint64_t Ari::LogHeader(Ari *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD20](this, a2);
}

uint64_t IDMgr::dump(IDMgr *this)
{
  return MEMORY[0x270F8CD28](this);
}

uint64_t IDMgr::free(IDMgr *this)
{
  return MEMORY[0x270F8CD30](this);
}

uint64_t IDMgr::isAlloc(IDMgr *this)
{
  return MEMORY[0x270F8CD38](this);
}

uint64_t IDMgr::allocate(IDMgr *this, int *a2)
{
  return MEMORY[0x270F8CD40](this, a2);
}

uint64_t IDMgr::allocate(IDMgr *this)
{
  return MEMORY[0x270F8CD48](this);
}

void IDMgr::IDMgr(IDMgr *this)
{
}

uint64_t AriMsg::GetBufGmid(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD58](this, a2);
}

uint64_t AriMsg::ReleaseEncodedMessage(AriMsg *this, unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD68](this, a2);
}

uint64_t AriMsg::pack(AriMsg *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x270F8CD70](this, a2, a3);
}

uint64_t AriMsg::GetBufCtx(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD80](this, a2);
}

uint64_t AriMsg::GetBufSeq(AriMsg *this, const unsigned __int8 *a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x270F8CD88](this, a2, a3, a4);
}

uint64_t AriMsg::SetBufSeq(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F8CD90](this, a2);
}

void AriMsg::AriMsg(AriMsg *this)
{
}

void AriMsg::~AriMsg(AriMsg *this)
{
}

uint64_t AriOsa::LogSrcInfo(AriOsa *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F8CDB8](this, a2, a3);
}

uint64_t AriOsa::OsMutexFree(AriOsa *this, dispatch_semaphore_s *a2)
{
  return MEMORY[0x270F8CDC0](this, a2);
}

uint64_t AriOsa::OsMutexGive(AriOsa *this, dispatch_semaphore_s *a2)
{
  return MEMORY[0x270F8CDC8](this, a2);
}

uint64_t AriOsa::OsMutexTake(AriOsa *this, dispatch_semaphore_s *a2)
{
  return MEMORY[0x270F8CDD0](this, a2);
}

uint64_t AriOsa::OsTimeStamp(AriOsa *this)
{
  return MEMORY[0x270F8CDD8](this);
}

uint64_t AriOsa::OsMutexCreate(AriOsa *this, dispatch_semaphore_s **a2)
{
  return MEMORY[0x270F8CDE0](this, a2);
}

uint64_t AriOsa::OsSleep(AriOsa *this)
{
  return MEMORY[0x270F8CDE8](this);
}

uint64_t AriMsg::getEncodedBuf(AriMsg *this, unsigned int *a2)
{
  return MEMORY[0x270F902D0](this, a2);
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
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

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987C0]();
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}